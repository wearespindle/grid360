{function print_review}
    {foreach $review_array[$selection] as $competency_id => $reviews}
        <div class="review-div" data-competency-id="{$competency_id}">
            {if $selection == 1}
                <span class="smile-active"></span>
            {elseif $selection == 2}
                <span class="meh-active"></span>
            {/if}
            <div class="review-comments">
                <strong>{$competencies[$competency_id].name}</strong><br />
                {foreach $reviews as $review}
                    <span class="review-info">
                        <strong>{if $review.reviewer.id == $smarty.session.current_user.id}[{t}Own{/t}]{else}[{$review.reviewer.firstname} {$review.reviewer.lastname}]{/if}</strong> {$review.comment}
                    </span>
                    <br />
                {/foreach}
            </div>
        </div>
    {/foreach}
{/function}

{include file="layout/page_header.tpl"}

##pager##

{if !$insufficient_data}
    <fieldset>
        <div class="row-fluid">
        <span class="span12">
            <label id="options-label">
                <p class="lead">{t}Options{/t}<i class="icon-plus-sign"></i>
                    <small class="muted">({t}show{/t})</small>
                </p>
            </label>
            <div id="options">
                <strong>{t}Competencies{/t}</strong>

                <div id="competency-boxes" class="well">
                    {foreach $competencies as $competency}
                        <div class="controls">
                            <label class="checkbox">
                                <input type="checkbox" value="{$competency.id}"/>{$competency.name}
                            </label>
                        </div>
                    {/foreach}
                    <div>
                        <button id="select-all" class="btn btn-link">{t}Select all{/t}</button>
                        /
                        <button id="deselect-all" class="btn btn-link">{t}Deselect all{/t}</button>
                    </div>
                </div>
            </div>
        </span>
        </div>
    </fieldset>

    {if $review_count > 0}
        <h3>{t}Me about me{/t}</h3>
        <div class="row-fluid">
            <span class="span6" id="own-general-competencies">
                <legend>{t}General competencies{/t}</legend>
                {if count($own_general_reviews) > 0}
                    {print_review review_array=$own_general_reviews selection=1}
                    {print_review review_array=$own_general_reviews selection=2}
                {else}
                    {t}No reviews found{/t}
                {/if}
            </span>

            <span class="span6" id="own-role-competencies">
                <legend>{t}Role competencies{/t}</legend>
                {if count($own_role_reviews) > 0}
                    {print_review review_array=$own_role_reviews selection=1}
                    {print_review review_array=$own_role_reviews selection=2}
                {else}
                    {t}No reviews found{/t}
                {/if}
            </span>
        </div>

        <h3>{t}Others about me{/t}</h3>
        <div class="row-fluid">
            <span class="span6" id="other-general-competencies">
                <legend>{t}General competencies{/t}</legend>
                {if count($other_general_reviews) > 0}
                    {print_review review_array=$other_general_reviews selection=1}
                    {print_review review_array=$other_general_reviews selection=2}
                {else}
                    {t}No reviews found{/t}
                {/if}
            </span>

            <span class="span6" id="other-role-competencies">
                <legend>{t}Role competencies{/t}</legend>
                {if count($other_role_reviews) > 0}
                    {print_review review_array=$other_role_reviews selection=1}
                    {print_review review_array=$other_role_reviews selection=2}
                {else}
                    {t}No reviews found{/t}
                {/if}
            </span>
        </div>

        <h3>{t}Other comments{/t}</h3>
        <div class="row-fluid">
            <span class="span6" id="other-general-competencies">
                <legend>{t}Role competencies{/t}</legend>
                {if count($other_role_reviews[3]) > 0}
                    {print_review review_array=$other_role_reviews selection=3}
                {else}
                    {t}No reviews found{/t}
                {/if}
            </span>
            </span>
        </div>
    {else}
        {t}No reviews found for the current round{/t}
    {/if}
{else}
    {$insufficient_reviewed_by nofilter}
    <br />
    <br />
    {$insufficient_reviewed nofilter}
{/if}

<script type="text/javascript">
    var show_text = '{t}show{/t}';
    var hide_text = '{t}hide{/t}';
</script>
<script type="text/javascript" src="{$smarty.const.ASSETS_URI}js/report.js"></script>
