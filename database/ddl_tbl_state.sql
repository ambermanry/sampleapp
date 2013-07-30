/* create tbl_state table */

CREATE TABLE `tbl_state` (
  `state_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'State name with first letter capital',
  `state_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'state abbreviation (US is 2 capital letters)',
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;

