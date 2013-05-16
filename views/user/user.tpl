<form action="{$ADMIN_URI}user/submit" method="POST" class="form-horizontal">
    <fieldset>
        {if $update && isset($user)}
            <legend>Editing user {$user.firstname} {$user.lastname}</legend>
        {else}
            <legend>New user</legend>
        {/if}

        <div class="control-group">
            <input type="hidden" name="type" value="user" />
            {if isset($user)}
                <input type="hidden" name="id" value="{$user.id}" />
            {/if}

            <label class="control-label" for="firstname">First name</label>

            <div class="controls">
                <input id="firstname" name="firstname" type="text" placeholder="First name" class="input-large" {if isset($user)}value="{$user.firstname}"{/if} />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="lastname">Last name</label>

            <div class="controls">
                <input id="lastname" name="lastname" type="text" placeholder="Last name" class="input-large" {if isset($user)}value="{$user.lastname}"{/if} />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="email">Email</label>

            <div class="controls">
                <input id="email" name="email" type="text" placeholder="example@email.com" class="input-large" {if isset($user)}value="{$user.email}"{/if} />
            </div>
        </div>

        <div class="control-group">
            <input type="hidden" name="department[type]" value="department" />
            <label class="control-label">Department</label>

            <div class="controls">
                <select name="department[id]">
                    <option value="0">Select department</option>
                    {foreach $departments as $id => $department}
                        {if isset($user) && $id == $user.department.id}
                            <option value="{$id}" selected="selected">{$department.name}</option>
                        {else}
                            <option value="{$id}">{$department.name}</option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="control-group">
            <input type="hidden" name="role[type]" value="role" />
            <label class="control-label">Role</label>

            <div class="controls">
                <select name="role[id]" {if isset($user)}selected="{$user.role.id}"{/if}>
                    <option value="0" data-department="0">Select role</option>
                    {foreach $roles as $id => $role}
                        <option value="{$id}" data-department="{$role.department.id}">{$role.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="control-group">
            <input type="hidden" name="userlevel[type]" value="userlevel" />
            <label class="control-label">User level</label>

            <div class="controls">
                {if isset($user)}
                    {html_options name="userlevel[id]" options=$userlevel_options|capitalize selected={$user.userlevel.id}}
                {else}
                    {html_options name="userlevel[id]" options=$userlevel_options|capitalize selected=3}
                {/if}
            </div>
        </div>

        <div class="form-actions">
            <button type="button" class="btn" onclick="history.go(-1);return true;">Cancel</button>
            <button type="submit" class="btn btn-primary">
                {if $update}
                    Update user
                {else}
                    Create user
                {/if}
            </button>
        </div>
    </fieldset>
</form>

<script type="text/javascript">
    $(document).ready(function()
    {
        $('[name="department[id]"]').change(function()
        {
            $('[name="role[id]"] option').hide();

            var role_options = $('[name="role[id]"] option[data-department="' + $(this).val() + '"]');
            role_options.show();

            var selected_option = role_options.first().val();

            $('[name="role[id]"]').val(selected_option);
        });

        $('[name="department[id]"]').change();
    });
</script>