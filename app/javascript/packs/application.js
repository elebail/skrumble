import "bootstrap";
import "../plugins/flatpickr";
import { initSortable } from '../plugins/init_sortable';
import initFlatpickr from "../plugins/flatpickr";
import initSelect2 from '../plugins/init_select2';
import initCollapsible from "../plugins/init_collapsible";
import swal from 'sweetalert';
import initSpin from "../plugins/spin";
import initSmoothScroll from '../plugins/init_smooth_scroll'
import updateNotif from '../plugins/notification_update'

initSortable();
initFlatpickr();
initSelect2();
initSpin();
initCollapsible();
initSmoothScroll();
updateNotif();
