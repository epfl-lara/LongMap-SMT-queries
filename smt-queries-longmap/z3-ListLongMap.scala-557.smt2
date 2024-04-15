; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15158 () Bool)

(assert start!15158)

(declare-fun b!145511 () Bool)

(declare-fun b_free!3073 () Bool)

(declare-fun b_next!3073 () Bool)

(assert (=> b!145511 (= b_free!3073 (not b_next!3073))))

(declare-fun tp!11720 () Bool)

(declare-fun b_and!9041 () Bool)

(assert (=> b!145511 (= tp!11720 b_and!9041)))

(declare-fun b!145516 () Bool)

(declare-fun b_free!3075 () Bool)

(declare-fun b_next!3075 () Bool)

(assert (=> b!145516 (= b_free!3075 (not b_next!3075))))

(declare-fun tp!11717 () Bool)

(declare-fun b_and!9043 () Bool)

(assert (=> b!145516 (= tp!11717 b_and!9043)))

(declare-fun b!145497 () Bool)

(declare-fun e!94787 () Bool)

(declare-fun tp_is_empty!2953 () Bool)

(assert (=> b!145497 (= e!94787 tp_is_empty!2953)))

(declare-fun mapNonEmpty!4927 () Bool)

(declare-fun mapRes!4928 () Bool)

(declare-fun tp!11718 () Bool)

(assert (=> mapNonEmpty!4927 (= mapRes!4928 (and tp!11718 e!94787))))

(declare-datatypes ((V!3585 0))(
  ( (V!3586 (val!1521 Int)) )
))
(declare-datatypes ((ValueCell!1133 0))(
  ( (ValueCellFull!1133 (v!3325 V!3585)) (EmptyCell!1133) )
))
(declare-fun mapValue!4928 () ValueCell!1133)

(declare-fun mapKey!4928 () (_ BitVec 32))

(declare-fun mapRest!4928 () (Array (_ BitVec 32) ValueCell!1133))

(declare-datatypes ((array!4929 0))(
  ( (array!4930 (arr!2326 (Array (_ BitVec 32) (_ BitVec 64))) (size!2603 (_ BitVec 32))) )
))
(declare-datatypes ((array!4931 0))(
  ( (array!4932 (arr!2327 (Array (_ BitVec 32) ValueCell!1133)) (size!2604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1174 0))(
  ( (LongMapFixedSize!1175 (defaultEntry!3001 Int) (mask!7370 (_ BitVec 32)) (extraKeys!2746 (_ BitVec 32)) (zeroValue!2846 V!3585) (minValue!2846 V!3585) (_size!636 (_ BitVec 32)) (_keys!4769 array!4929) (_values!2984 array!4931) (_vacant!636 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!954 0))(
  ( (Cell!955 (v!3326 LongMapFixedSize!1174)) )
))
(declare-datatypes ((LongMap!954 0))(
  ( (LongMap!955 (underlying!488 Cell!954)) )
))
(declare-fun thiss!992 () LongMap!954)

(assert (=> mapNonEmpty!4927 (= (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) (store mapRest!4928 mapKey!4928 mapValue!4928))))

(declare-fun b!145498 () Bool)

(declare-fun e!94791 () Bool)

(declare-fun e!94784 () Bool)

(assert (=> b!145498 (= e!94791 e!94784)))

(declare-fun res!69235 () Bool)

(assert (=> b!145498 (=> (not res!69235) (not e!94784))))

(declare-datatypes ((tuple2!2694 0))(
  ( (tuple2!2695 (_1!1358 (_ BitVec 64)) (_2!1358 V!3585)) )
))
(declare-datatypes ((List!1759 0))(
  ( (Nil!1756) (Cons!1755 (h!2363 tuple2!2694) (t!6407 List!1759)) )
))
(declare-datatypes ((ListLongMap!1731 0))(
  ( (ListLongMap!1732 (toList!881 List!1759)) )
))
(declare-fun lt!76404 () ListLongMap!1731)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!928 (ListLongMap!1731 (_ BitVec 64)) Bool)

(assert (=> b!145498 (= res!69235 (contains!928 lt!76404 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2696 0))(
  ( (tuple2!2697 (_1!1359 Bool) (_2!1359 LongMapFixedSize!1174)) )
))
(declare-fun lt!76407 () tuple2!2696)

(declare-fun newMap!16 () LongMapFixedSize!1174)

(declare-fun update!217 (LongMapFixedSize!1174 (_ BitVec 64) V!3585) tuple2!2696)

(declare-fun get!1552 (ValueCell!1133 V!3585) V!3585)

(declare-fun dynLambda!443 (Int (_ BitVec 64)) V!3585)

(assert (=> b!145498 (= lt!76407 (update!217 newMap!16 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145500 () Bool)

(declare-fun e!94796 () Bool)

(assert (=> b!145500 (= e!94796 tp_is_empty!2953)))

(declare-fun b!145501 () Bool)

(declare-fun e!94799 () Bool)

(declare-fun e!94795 () Bool)

(assert (=> b!145501 (= e!94799 (and e!94795 mapRes!4928))))

(declare-fun condMapEmpty!4927 () Bool)

(declare-fun mapDefault!4928 () ValueCell!1133)

(assert (=> b!145501 (= condMapEmpty!4927 (= (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4928)))))

(declare-fun mapNonEmpty!4928 () Bool)

(declare-fun mapRes!4927 () Bool)

(declare-fun tp!11719 () Bool)

(declare-fun e!94789 () Bool)

(assert (=> mapNonEmpty!4928 (= mapRes!4927 (and tp!11719 e!94789))))

(declare-fun mapKey!4927 () (_ BitVec 32))

(declare-fun mapRest!4927 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapValue!4927 () ValueCell!1133)

(assert (=> mapNonEmpty!4928 (= (arr!2327 (_values!2984 newMap!16)) (store mapRest!4927 mapKey!4927 mapValue!4927))))

(declare-fun b!145502 () Bool)

(declare-fun e!94786 () Bool)

(declare-fun e!94793 () Bool)

(assert (=> b!145502 (= e!94786 e!94793)))

(declare-fun b!145503 () Bool)

(declare-fun res!69239 () Bool)

(declare-fun e!94792 () Bool)

(assert (=> b!145503 (=> res!69239 e!94792)))

(declare-datatypes ((List!1760 0))(
  ( (Nil!1757) (Cons!1756 (h!2364 (_ BitVec 64)) (t!6408 List!1760)) )
))
(declare-fun lt!76409 () List!1760)

(declare-fun contains!929 (List!1760 (_ BitVec 64)) Bool)

(assert (=> b!145503 (= res!69239 (contains!929 lt!76409 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145504 () Bool)

(declare-fun res!69243 () Bool)

(declare-fun e!94790 () Bool)

(assert (=> b!145504 (=> (not res!69243) (not e!94790))))

(assert (=> b!145504 (= res!69243 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992)))))))))

(declare-fun b!145505 () Bool)

(assert (=> b!145505 (= e!94795 tp_is_empty!2953)))

(declare-fun b!145506 () Bool)

(assert (=> b!145506 (= e!94789 tp_is_empty!2953)))

(declare-fun b!145507 () Bool)

(declare-fun res!69234 () Bool)

(assert (=> b!145507 (=> res!69234 e!94792)))

(declare-fun noDuplicate!57 (List!1760) Bool)

(assert (=> b!145507 (= res!69234 (not (noDuplicate!57 lt!76409)))))

(declare-fun b!145508 () Bool)

(declare-fun e!94797 () Bool)

(assert (=> b!145508 (= e!94797 e!94786)))

(declare-fun mapIsEmpty!4927 () Bool)

(assert (=> mapIsEmpty!4927 mapRes!4927))

(declare-fun b!145509 () Bool)

(declare-fun res!69236 () Bool)

(assert (=> b!145509 (=> (not res!69236) (not e!94790))))

(declare-fun valid!574 (LongMapFixedSize!1174) Bool)

(assert (=> b!145509 (= res!69236 (valid!574 newMap!16))))

(declare-fun b!145510 () Bool)

(declare-fun res!69241 () Bool)

(assert (=> b!145510 (=> res!69241 e!94792)))

(declare-fun arrayNoDuplicates!0 (array!4929 (_ BitVec 32) List!1760) Bool)

(assert (=> b!145510 (= res!69241 (not (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76409)))))

(declare-fun array_inv!1491 (array!4929) Bool)

(declare-fun array_inv!1492 (array!4931) Bool)

(assert (=> b!145511 (= e!94793 (and tp!11720 tp_is_empty!2953 (array_inv!1491 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (array_inv!1492 (_values!2984 (v!3326 (underlying!488 thiss!992)))) e!94799))))

(declare-fun res!69242 () Bool)

(assert (=> start!15158 (=> (not res!69242) (not e!94790))))

(declare-fun valid!575 (LongMap!954) Bool)

(assert (=> start!15158 (= res!69242 (valid!575 thiss!992))))

(assert (=> start!15158 e!94790))

(assert (=> start!15158 e!94797))

(assert (=> start!15158 true))

(declare-fun e!94788 () Bool)

(assert (=> start!15158 e!94788))

(declare-fun b!145499 () Bool)

(assert (=> b!145499 (= e!94792 (contains!929 lt!76409 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!4928 () Bool)

(assert (=> mapIsEmpty!4928 mapRes!4928))

(declare-fun b!145512 () Bool)

(declare-fun res!69237 () Bool)

(assert (=> b!145512 (=> res!69237 e!94792)))

(assert (=> b!145512 (= res!69237 (contains!929 lt!76409 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145513 () Bool)

(declare-fun res!69233 () Bool)

(assert (=> b!145513 (=> (not res!69233) (not e!94790))))

(assert (=> b!145513 (= res!69233 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7370 newMap!16)) (_size!636 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun b!145514 () Bool)

(declare-fun e!94794 () Bool)

(assert (=> b!145514 (= e!94794 (and e!94796 mapRes!4927))))

(declare-fun condMapEmpty!4928 () Bool)

(declare-fun mapDefault!4927 () ValueCell!1133)

(assert (=> b!145514 (= condMapEmpty!4928 (= (arr!2327 (_values!2984 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4927)))))

(declare-fun b!145515 () Bool)

(assert (=> b!145515 (= e!94784 (not e!94792))))

(declare-fun res!69240 () Bool)

(assert (=> b!145515 (=> res!69240 e!94792)))

(assert (=> b!145515 (= res!69240 (or (bvsge (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992)))))))))

(assert (=> b!145515 (= lt!76409 (Cons!1756 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) Nil!1757))))

(assert (=> b!145515 (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) from!355 Nil!1757)))

(declare-datatypes ((Unit!4602 0))(
  ( (Unit!4603) )
))
(declare-fun lt!76406 () Unit!4602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4929 (_ BitVec 32) (_ BitVec 32)) Unit!4602)

(assert (=> b!145515 (= lt!76406 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145515 (arrayContainsKey!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76408 () Unit!4602)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!153 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) (_ BitVec 32) Int) Unit!4602)

(assert (=> b!145515 (= lt!76408 (lemmaListMapContainsThenArrayContainsFrom!153 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(assert (=> b!145516 (= e!94788 (and tp!11717 tp_is_empty!2953 (array_inv!1491 (_keys!4769 newMap!16)) (array_inv!1492 (_values!2984 newMap!16)) e!94794))))

(declare-fun b!145517 () Bool)

(assert (=> b!145517 (= e!94790 e!94791)))

(declare-fun res!69238 () Bool)

(assert (=> b!145517 (=> (not res!69238) (not e!94791))))

(declare-fun lt!76405 () ListLongMap!1731)

(assert (=> b!145517 (= res!69238 (and (= lt!76405 lt!76404) (not (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1438 (LongMapFixedSize!1174) ListLongMap!1731)

(assert (=> b!145517 (= lt!76404 (map!1438 newMap!16))))

(declare-fun getCurrentListMap!540 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) ListLongMap!1731)

(assert (=> b!145517 (= lt!76405 (getCurrentListMap!540 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(assert (= (and start!15158 res!69242) b!145504))

(assert (= (and b!145504 res!69243) b!145509))

(assert (= (and b!145509 res!69236) b!145513))

(assert (= (and b!145513 res!69233) b!145517))

(assert (= (and b!145517 res!69238) b!145498))

(assert (= (and b!145498 res!69235) b!145515))

(assert (= (and b!145515 (not res!69240)) b!145507))

(assert (= (and b!145507 (not res!69234)) b!145512))

(assert (= (and b!145512 (not res!69237)) b!145503))

(assert (= (and b!145503 (not res!69239)) b!145510))

(assert (= (and b!145510 (not res!69241)) b!145499))

(assert (= (and b!145501 condMapEmpty!4927) mapIsEmpty!4928))

(assert (= (and b!145501 (not condMapEmpty!4927)) mapNonEmpty!4927))

(get-info :version)

(assert (= (and mapNonEmpty!4927 ((_ is ValueCellFull!1133) mapValue!4928)) b!145497))

(assert (= (and b!145501 ((_ is ValueCellFull!1133) mapDefault!4928)) b!145505))

(assert (= b!145511 b!145501))

(assert (= b!145502 b!145511))

(assert (= b!145508 b!145502))

(assert (= start!15158 b!145508))

(assert (= (and b!145514 condMapEmpty!4928) mapIsEmpty!4927))

(assert (= (and b!145514 (not condMapEmpty!4928)) mapNonEmpty!4928))

(assert (= (and mapNonEmpty!4928 ((_ is ValueCellFull!1133) mapValue!4927)) b!145506))

(assert (= (and b!145514 ((_ is ValueCellFull!1133) mapDefault!4927)) b!145500))

(assert (= b!145516 b!145514))

(assert (= start!15158 b!145516))

(declare-fun b_lambda!6513 () Bool)

(assert (=> (not b_lambda!6513) (not b!145498)))

(declare-fun t!6404 () Bool)

(declare-fun tb!2609 () Bool)

(assert (=> (and b!145511 (= (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))) t!6404) tb!2609))

(declare-fun result!4271 () Bool)

(assert (=> tb!2609 (= result!4271 tp_is_empty!2953)))

(assert (=> b!145498 t!6404))

(declare-fun b_and!9045 () Bool)

(assert (= b_and!9041 (and (=> t!6404 result!4271) b_and!9045)))

(declare-fun t!6406 () Bool)

(declare-fun tb!2611 () Bool)

(assert (=> (and b!145516 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))) t!6406) tb!2611))

(declare-fun result!4275 () Bool)

(assert (= result!4275 result!4271))

(assert (=> b!145498 t!6406))

(declare-fun b_and!9047 () Bool)

(assert (= b_and!9043 (and (=> t!6406 result!4275) b_and!9047)))

(declare-fun m!175141 () Bool)

(assert (=> mapNonEmpty!4927 m!175141))

(declare-fun m!175143 () Bool)

(assert (=> b!145511 m!175143))

(declare-fun m!175145 () Bool)

(assert (=> b!145511 m!175145))

(declare-fun m!175147 () Bool)

(assert (=> b!145512 m!175147))

(declare-fun m!175149 () Bool)

(assert (=> b!145509 m!175149))

(declare-fun m!175151 () Bool)

(assert (=> b!145507 m!175151))

(declare-fun m!175153 () Bool)

(assert (=> b!145515 m!175153))

(declare-fun m!175155 () Bool)

(assert (=> b!145515 m!175155))

(declare-fun m!175157 () Bool)

(assert (=> b!145515 m!175157))

(declare-fun m!175159 () Bool)

(assert (=> b!145515 m!175159))

(assert (=> b!145515 m!175157))

(assert (=> b!145515 m!175157))

(declare-fun m!175161 () Bool)

(assert (=> b!145515 m!175161))

(declare-fun m!175163 () Bool)

(assert (=> b!145516 m!175163))

(declare-fun m!175165 () Bool)

(assert (=> b!145516 m!175165))

(assert (=> b!145517 m!175157))

(declare-fun m!175167 () Bool)

(assert (=> b!145517 m!175167))

(declare-fun m!175169 () Bool)

(assert (=> b!145517 m!175169))

(declare-fun m!175171 () Bool)

(assert (=> b!145503 m!175171))

(declare-fun m!175173 () Bool)

(assert (=> mapNonEmpty!4928 m!175173))

(declare-fun m!175175 () Bool)

(assert (=> b!145498 m!175175))

(declare-fun m!175177 () Bool)

(assert (=> b!145498 m!175177))

(declare-fun m!175179 () Bool)

(assert (=> b!145498 m!175179))

(assert (=> b!145498 m!175157))

(assert (=> b!145498 m!175177))

(assert (=> b!145498 m!175157))

(declare-fun m!175181 () Bool)

(assert (=> b!145498 m!175181))

(assert (=> b!145498 m!175157))

(assert (=> b!145498 m!175179))

(declare-fun m!175183 () Bool)

(assert (=> b!145498 m!175183))

(assert (=> b!145498 m!175175))

(assert (=> b!145499 m!175157))

(assert (=> b!145499 m!175157))

(declare-fun m!175185 () Bool)

(assert (=> b!145499 m!175185))

(declare-fun m!175187 () Bool)

(assert (=> start!15158 m!175187))

(declare-fun m!175189 () Bool)

(assert (=> b!145510 m!175189))

(check-sat (not b_lambda!6513) (not b!145510) (not b!145509) (not b!145499) (not mapNonEmpty!4928) (not b!145515) b_and!9045 (not b!145517) (not b_next!3073) (not b_next!3075) (not b!145498) tp_is_empty!2953 (not b!145507) (not b!145503) (not b!145512) b_and!9047 (not b!145511) (not mapNonEmpty!4927) (not b!145516) (not start!15158))
(check-sat b_and!9045 b_and!9047 (not b_next!3073) (not b_next!3075))
(get-model)

(declare-fun b_lambda!6519 () Bool)

(assert (= b_lambda!6513 (or (and b!145511 b_free!3073) (and b!145516 b_free!3075 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))))) b_lambda!6519)))

(check-sat (not b_lambda!6519) (not b!145510) (not b!145509) (not b!145499) (not mapNonEmpty!4928) (not b!145515) b_and!9045 (not b!145517) (not b_next!3073) (not b_next!3075) (not b!145498) tp_is_empty!2953 (not b!145507) (not b!145503) (not b!145512) b_and!9047 (not b!145511) (not mapNonEmpty!4927) (not b!145516) (not start!15158))
(check-sat b_and!9045 b_and!9047 (not b_next!3073) (not b_next!3075))
(get-model)

(declare-fun d!46307 () Bool)

(declare-fun res!69314 () Bool)

(declare-fun e!94900 () Bool)

(assert (=> d!46307 (=> res!69314 e!94900)))

(assert (=> d!46307 (= res!69314 ((_ is Nil!1757) lt!76409))))

(assert (=> d!46307 (= (noDuplicate!57 lt!76409) e!94900)))

(declare-fun b!145654 () Bool)

(declare-fun e!94901 () Bool)

(assert (=> b!145654 (= e!94900 e!94901)))

(declare-fun res!69315 () Bool)

(assert (=> b!145654 (=> (not res!69315) (not e!94901))))

(assert (=> b!145654 (= res!69315 (not (contains!929 (t!6408 lt!76409) (h!2364 lt!76409))))))

(declare-fun b!145655 () Bool)

(assert (=> b!145655 (= e!94901 (noDuplicate!57 (t!6408 lt!76409)))))

(assert (= (and d!46307 (not res!69314)) b!145654))

(assert (= (and b!145654 res!69315) b!145655))

(declare-fun m!175291 () Bool)

(assert (=> b!145654 m!175291))

(declare-fun m!175293 () Bool)

(assert (=> b!145655 m!175293))

(assert (=> b!145507 d!46307))

(declare-fun b!145666 () Bool)

(declare-fun e!94912 () Bool)

(declare-fun e!94911 () Bool)

(assert (=> b!145666 (= e!94912 e!94911)))

(declare-fun res!69322 () Bool)

(assert (=> b!145666 (=> (not res!69322) (not e!94911))))

(declare-fun e!94913 () Bool)

(assert (=> b!145666 (= res!69322 (not e!94913))))

(declare-fun res!69324 () Bool)

(assert (=> b!145666 (=> (not res!69324) (not e!94913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!145666 (= res!69324 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun c!27603 () Bool)

(declare-fun call!16245 () Bool)

(declare-fun bm!16242 () Bool)

(assert (=> bm!16242 (= call!16245 (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27603 (Cons!1756 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) Nil!1757) Nil!1757)))))

(declare-fun d!46309 () Bool)

(declare-fun res!69323 () Bool)

(assert (=> d!46309 (=> res!69323 e!94912)))

(assert (=> d!46309 (= res!69323 (bvsge from!355 (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(assert (=> d!46309 (= (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) from!355 Nil!1757) e!94912)))

(declare-fun b!145667 () Bool)

(declare-fun e!94910 () Bool)

(assert (=> b!145667 (= e!94911 e!94910)))

(assert (=> b!145667 (= c!27603 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145668 () Bool)

(assert (=> b!145668 (= e!94910 call!16245)))

(declare-fun b!145669 () Bool)

(assert (=> b!145669 (= e!94910 call!16245)))

(declare-fun b!145670 () Bool)

(assert (=> b!145670 (= e!94913 (contains!929 Nil!1757 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46309 (not res!69323)) b!145666))

(assert (= (and b!145666 res!69324) b!145670))

(assert (= (and b!145666 res!69322) b!145667))

(assert (= (and b!145667 c!27603) b!145669))

(assert (= (and b!145667 (not c!27603)) b!145668))

(assert (= (or b!145669 b!145668) bm!16242))

(assert (=> b!145666 m!175157))

(assert (=> b!145666 m!175157))

(declare-fun m!175295 () Bool)

(assert (=> b!145666 m!175295))

(assert (=> bm!16242 m!175157))

(declare-fun m!175297 () Bool)

(assert (=> bm!16242 m!175297))

(assert (=> b!145667 m!175157))

(assert (=> b!145667 m!175157))

(assert (=> b!145667 m!175295))

(assert (=> b!145670 m!175157))

(assert (=> b!145670 m!175157))

(declare-fun m!175299 () Bool)

(assert (=> b!145670 m!175299))

(assert (=> b!145515 d!46309))

(declare-fun d!46311 () Bool)

(assert (=> d!46311 (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) from!355 Nil!1757)))

(declare-fun lt!76448 () Unit!4602)

(declare-fun choose!39 (array!4929 (_ BitVec 32) (_ BitVec 32)) Unit!4602)

(assert (=> d!46311 (= lt!76448 (choose!39 (_keys!4769 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46311 (bvslt (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46311 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355) lt!76448)))

(declare-fun bs!6111 () Bool)

(assert (= bs!6111 d!46311))

(assert (=> bs!6111 m!175155))

(declare-fun m!175301 () Bool)

(assert (=> bs!6111 m!175301))

(assert (=> b!145515 d!46311))

(declare-fun d!46313 () Bool)

(declare-fun res!69329 () Bool)

(declare-fun e!94918 () Bool)

(assert (=> d!46313 (=> res!69329 e!94918)))

(assert (=> d!46313 (= res!69329 (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46313 (= (arrayContainsKey!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94918)))

(declare-fun b!145675 () Bool)

(declare-fun e!94919 () Bool)

(assert (=> b!145675 (= e!94918 e!94919)))

(declare-fun res!69330 () Bool)

(assert (=> b!145675 (=> (not res!69330) (not e!94919))))

(assert (=> b!145675 (= res!69330 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun b!145676 () Bool)

(assert (=> b!145676 (= e!94919 (arrayContainsKey!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46313 (not res!69329)) b!145675))

(assert (= (and b!145675 res!69330) b!145676))

(declare-fun m!175303 () Bool)

(assert (=> d!46313 m!175303))

(assert (=> b!145676 m!175157))

(declare-fun m!175305 () Bool)

(assert (=> b!145676 m!175305))

(assert (=> b!145515 d!46313))

(declare-fun d!46315 () Bool)

(declare-fun e!94922 () Bool)

(assert (=> d!46315 e!94922))

(declare-fun c!27606 () Bool)

(assert (=> d!46315 (= c!27606 (and (not (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76451 () Unit!4602)

(declare-fun choose!906 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) (_ BitVec 32) Int) Unit!4602)

(assert (=> d!46315 (= lt!76451 (choose!906 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46315 (validMask!0 (mask!7370 (v!3326 (underlying!488 thiss!992))))))

(assert (=> d!46315 (= (lemmaListMapContainsThenArrayContainsFrom!153 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))) lt!76451)))

(declare-fun b!145681 () Bool)

(assert (=> b!145681 (= e!94922 (arrayContainsKey!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145682 () Bool)

(assert (=> b!145682 (= e!94922 (ite (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46315 c!27606) b!145681))

(assert (= (and d!46315 (not c!27606)) b!145682))

(assert (=> d!46315 m!175157))

(declare-fun m!175307 () Bool)

(assert (=> d!46315 m!175307))

(declare-fun m!175309 () Bool)

(assert (=> d!46315 m!175309))

(assert (=> b!145681 m!175157))

(assert (=> b!145681 m!175161))

(assert (=> b!145515 d!46315))

(declare-fun d!46317 () Bool)

(assert (=> d!46317 (= (map!1438 newMap!16) (getCurrentListMap!540 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun bs!6112 () Bool)

(assert (= bs!6112 d!46317))

(declare-fun m!175311 () Bool)

(assert (=> bs!6112 m!175311))

(assert (=> b!145517 d!46317))

(declare-fun b!145725 () Bool)

(declare-fun c!27619 () Bool)

(assert (=> b!145725 (= c!27619 (and (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94953 () ListLongMap!1731)

(declare-fun e!94951 () ListLongMap!1731)

(assert (=> b!145725 (= e!94953 e!94951)))

(declare-fun bm!16257 () Bool)

(declare-fun call!16262 () ListLongMap!1731)

(declare-fun call!16266 () ListLongMap!1731)

(assert (=> bm!16257 (= call!16262 call!16266)))

(declare-fun b!145726 () Bool)

(declare-fun e!94956 () Bool)

(declare-fun call!16265 () Bool)

(assert (=> b!145726 (= e!94956 (not call!16265))))

(declare-fun b!145727 () Bool)

(declare-fun call!16260 () ListLongMap!1731)

(assert (=> b!145727 (= e!94953 call!16260)))

(declare-fun b!145728 () Bool)

(declare-fun e!94959 () Bool)

(declare-fun lt!76516 () ListLongMap!1731)

(declare-fun apply!124 (ListLongMap!1731 (_ BitVec 64)) V!3585)

(assert (=> b!145728 (= e!94959 (= (apply!124 lt!76516 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2846 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun b!145729 () Bool)

(declare-fun e!94949 () Bool)

(assert (=> b!145729 (= e!94949 e!94959)))

(declare-fun res!69353 () Bool)

(declare-fun call!16261 () Bool)

(assert (=> b!145729 (= res!69353 call!16261)))

(assert (=> b!145729 (=> (not res!69353) (not e!94959))))

(declare-fun b!145730 () Bool)

(declare-fun res!69357 () Bool)

(declare-fun e!94961 () Bool)

(assert (=> b!145730 (=> (not res!69357) (not e!94961))))

(declare-fun e!94950 () Bool)

(assert (=> b!145730 (= res!69357 e!94950)))

(declare-fun res!69350 () Bool)

(assert (=> b!145730 (=> res!69350 e!94950)))

(declare-fun e!94957 () Bool)

(assert (=> b!145730 (= res!69350 (not e!94957))))

(declare-fun res!69349 () Bool)

(assert (=> b!145730 (=> (not res!69349) (not e!94957))))

(assert (=> b!145730 (= res!69349 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun b!145731 () Bool)

(declare-fun e!94954 () Bool)

(assert (=> b!145731 (= e!94950 e!94954)))

(declare-fun res!69351 () Bool)

(assert (=> b!145731 (=> (not res!69351) (not e!94954))))

(assert (=> b!145731 (= res!69351 (contains!928 lt!76516 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145731 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun b!145732 () Bool)

(assert (=> b!145732 (= e!94949 (not call!16261))))

(declare-fun bm!16259 () Bool)

(declare-fun call!16263 () ListLongMap!1731)

(assert (=> bm!16259 (= call!16260 call!16263)))

(declare-fun bm!16260 () Bool)

(assert (=> bm!16260 (= call!16265 (contains!928 lt!76516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16261 () Bool)

(assert (=> bm!16261 (= call!16261 (contains!928 lt!76516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145733 () Bool)

(assert (=> b!145733 (= e!94957 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!46319 () Bool)

(assert (=> d!46319 e!94961))

(declare-fun res!69355 () Bool)

(assert (=> d!46319 (=> (not res!69355) (not e!94961))))

(assert (=> d!46319 (= res!69355 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))))

(declare-fun lt!76509 () ListLongMap!1731)

(assert (=> d!46319 (= lt!76516 lt!76509)))

(declare-fun lt!76499 () Unit!4602)

(declare-fun e!94952 () Unit!4602)

(assert (=> d!46319 (= lt!76499 e!94952)))

(declare-fun c!27622 () Bool)

(declare-fun e!94960 () Bool)

(assert (=> d!46319 (= c!27622 e!94960)))

(declare-fun res!69352 () Bool)

(assert (=> d!46319 (=> (not res!69352) (not e!94960))))

(assert (=> d!46319 (= res!69352 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun e!94955 () ListLongMap!1731)

(assert (=> d!46319 (= lt!76509 e!94955)))

(declare-fun c!27624 () Bool)

(assert (=> d!46319 (= c!27624 (and (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46319 (validMask!0 (mask!7370 (v!3326 (underlying!488 thiss!992))))))

(assert (=> d!46319 (= (getCurrentListMap!540 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))) lt!76516)))

(declare-fun bm!16258 () Bool)

(declare-fun c!27620 () Bool)

(declare-fun call!16264 () ListLongMap!1731)

(declare-fun +!171 (ListLongMap!1731 tuple2!2694) ListLongMap!1731)

(assert (=> bm!16258 (= call!16263 (+!171 (ite c!27624 call!16264 (ite c!27620 call!16266 call!16262)) (ite (or c!27624 c!27620) (tuple2!2695 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2846 (v!3326 (underlying!488 thiss!992)))) (tuple2!2695 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2846 (v!3326 (underlying!488 thiss!992)))))))))

(declare-fun b!145734 () Bool)

(assert (=> b!145734 (= e!94955 (+!171 call!16263 (tuple2!2695 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2846 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun b!145735 () Bool)

(assert (=> b!145735 (= e!94960 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16262 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!136 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) ListLongMap!1731)

(assert (=> bm!16262 (= call!16264 (getCurrentListMapNoExtraKeys!136 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun b!145736 () Bool)

(assert (=> b!145736 (= e!94954 (= (apply!124 lt!76516 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145736 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2604 (_values!2984 (v!3326 (underlying!488 thiss!992))))))))

(assert (=> b!145736 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(declare-fun bm!16263 () Bool)

(assert (=> bm!16263 (= call!16266 call!16264)))

(declare-fun b!145737 () Bool)

(assert (=> b!145737 (= e!94955 e!94953)))

(assert (=> b!145737 (= c!27620 (and (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145738 () Bool)

(declare-fun e!94958 () Bool)

(assert (=> b!145738 (= e!94958 (= (apply!124 lt!76516 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2846 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun b!145739 () Bool)

(assert (=> b!145739 (= e!94951 call!16260)))

(declare-fun b!145740 () Bool)

(declare-fun lt!76512 () Unit!4602)

(assert (=> b!145740 (= e!94952 lt!76512)))

(declare-fun lt!76497 () ListLongMap!1731)

(assert (=> b!145740 (= lt!76497 (getCurrentListMapNoExtraKeys!136 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun lt!76500 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76501 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76501 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76515 () Unit!4602)

(declare-fun addStillContains!100 (ListLongMap!1731 (_ BitVec 64) V!3585 (_ BitVec 64)) Unit!4602)

(assert (=> b!145740 (= lt!76515 (addStillContains!100 lt!76497 lt!76500 (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) lt!76501))))

(assert (=> b!145740 (contains!928 (+!171 lt!76497 (tuple2!2695 lt!76500 (zeroValue!2846 (v!3326 (underlying!488 thiss!992))))) lt!76501)))

(declare-fun lt!76504 () Unit!4602)

(assert (=> b!145740 (= lt!76504 lt!76515)))

(declare-fun lt!76503 () ListLongMap!1731)

(assert (=> b!145740 (= lt!76503 (getCurrentListMapNoExtraKeys!136 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun lt!76498 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76502 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76502 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76517 () Unit!4602)

(declare-fun addApplyDifferent!100 (ListLongMap!1731 (_ BitVec 64) V!3585 (_ BitVec 64)) Unit!4602)

(assert (=> b!145740 (= lt!76517 (addApplyDifferent!100 lt!76503 lt!76498 (minValue!2846 (v!3326 (underlying!488 thiss!992))) lt!76502))))

(assert (=> b!145740 (= (apply!124 (+!171 lt!76503 (tuple2!2695 lt!76498 (minValue!2846 (v!3326 (underlying!488 thiss!992))))) lt!76502) (apply!124 lt!76503 lt!76502))))

(declare-fun lt!76513 () Unit!4602)

(assert (=> b!145740 (= lt!76513 lt!76517)))

(declare-fun lt!76496 () ListLongMap!1731)

(assert (=> b!145740 (= lt!76496 (getCurrentListMapNoExtraKeys!136 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun lt!76510 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76514 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76514 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76505 () Unit!4602)

(assert (=> b!145740 (= lt!76505 (addApplyDifferent!100 lt!76496 lt!76510 (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) lt!76514))))

(assert (=> b!145740 (= (apply!124 (+!171 lt!76496 (tuple2!2695 lt!76510 (zeroValue!2846 (v!3326 (underlying!488 thiss!992))))) lt!76514) (apply!124 lt!76496 lt!76514))))

(declare-fun lt!76507 () Unit!4602)

(assert (=> b!145740 (= lt!76507 lt!76505)))

(declare-fun lt!76511 () ListLongMap!1731)

(assert (=> b!145740 (= lt!76511 (getCurrentListMapNoExtraKeys!136 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (_values!2984 (v!3326 (underlying!488 thiss!992))) (mask!7370 (v!3326 (underlying!488 thiss!992))) (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) (zeroValue!2846 (v!3326 (underlying!488 thiss!992))) (minValue!2846 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992)))))))

(declare-fun lt!76506 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76508 () (_ BitVec 64))

(assert (=> b!145740 (= lt!76508 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!145740 (= lt!76512 (addApplyDifferent!100 lt!76511 lt!76506 (minValue!2846 (v!3326 (underlying!488 thiss!992))) lt!76508))))

(assert (=> b!145740 (= (apply!124 (+!171 lt!76511 (tuple2!2695 lt!76506 (minValue!2846 (v!3326 (underlying!488 thiss!992))))) lt!76508) (apply!124 lt!76511 lt!76508))))

(declare-fun b!145741 () Bool)

(declare-fun Unit!4604 () Unit!4602)

(assert (=> b!145741 (= e!94952 Unit!4604)))

(declare-fun b!145742 () Bool)

(assert (=> b!145742 (= e!94956 e!94958)))

(declare-fun res!69356 () Bool)

(assert (=> b!145742 (= res!69356 call!16265)))

(assert (=> b!145742 (=> (not res!69356) (not e!94958))))

(declare-fun b!145743 () Bool)

(assert (=> b!145743 (= e!94961 e!94956)))

(declare-fun c!27621 () Bool)

(assert (=> b!145743 (= c!27621 (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145744 () Bool)

(declare-fun res!69354 () Bool)

(assert (=> b!145744 (=> (not res!69354) (not e!94961))))

(assert (=> b!145744 (= res!69354 e!94949)))

(declare-fun c!27623 () Bool)

(assert (=> b!145744 (= c!27623 (not (= (bvand (extraKeys!2746 (v!3326 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145745 () Bool)

(assert (=> b!145745 (= e!94951 call!16262)))

(assert (= (and d!46319 c!27624) b!145734))

(assert (= (and d!46319 (not c!27624)) b!145737))

(assert (= (and b!145737 c!27620) b!145727))

(assert (= (and b!145737 (not c!27620)) b!145725))

(assert (= (and b!145725 c!27619) b!145739))

(assert (= (and b!145725 (not c!27619)) b!145745))

(assert (= (or b!145739 b!145745) bm!16257))

(assert (= (or b!145727 bm!16257) bm!16263))

(assert (= (or b!145727 b!145739) bm!16259))

(assert (= (or b!145734 bm!16263) bm!16262))

(assert (= (or b!145734 bm!16259) bm!16258))

(assert (= (and d!46319 res!69352) b!145735))

(assert (= (and d!46319 c!27622) b!145740))

(assert (= (and d!46319 (not c!27622)) b!145741))

(assert (= (and d!46319 res!69355) b!145730))

(assert (= (and b!145730 res!69349) b!145733))

(assert (= (and b!145730 (not res!69350)) b!145731))

(assert (= (and b!145731 res!69351) b!145736))

(assert (= (and b!145730 res!69357) b!145744))

(assert (= (and b!145744 c!27623) b!145729))

(assert (= (and b!145744 (not c!27623)) b!145732))

(assert (= (and b!145729 res!69353) b!145728))

(assert (= (or b!145729 b!145732) bm!16261))

(assert (= (and b!145744 res!69354) b!145743))

(assert (= (and b!145743 c!27621) b!145742))

(assert (= (and b!145743 (not c!27621)) b!145726))

(assert (= (and b!145742 res!69356) b!145738))

(assert (= (or b!145742 b!145726) bm!16260))

(declare-fun b_lambda!6521 () Bool)

(assert (=> (not b_lambda!6521) (not b!145736)))

(assert (=> b!145736 t!6404))

(declare-fun b_and!9065 () Bool)

(assert (= b_and!9045 (and (=> t!6404 result!4271) b_and!9065)))

(assert (=> b!145736 t!6406))

(declare-fun b_and!9067 () Bool)

(assert (= b_and!9047 (and (=> t!6406 result!4275) b_and!9067)))

(declare-fun m!175313 () Bool)

(assert (=> bm!16261 m!175313))

(declare-fun m!175315 () Bool)

(assert (=> b!145740 m!175315))

(declare-fun m!175317 () Bool)

(assert (=> b!145740 m!175317))

(declare-fun m!175319 () Bool)

(assert (=> b!145740 m!175319))

(assert (=> b!145740 m!175317))

(declare-fun m!175321 () Bool)

(assert (=> b!145740 m!175321))

(declare-fun m!175323 () Bool)

(assert (=> b!145740 m!175323))

(declare-fun m!175325 () Bool)

(assert (=> b!145740 m!175325))

(assert (=> b!145740 m!175303))

(declare-fun m!175327 () Bool)

(assert (=> b!145740 m!175327))

(declare-fun m!175329 () Bool)

(assert (=> b!145740 m!175329))

(declare-fun m!175331 () Bool)

(assert (=> b!145740 m!175331))

(declare-fun m!175333 () Bool)

(assert (=> b!145740 m!175333))

(declare-fun m!175335 () Bool)

(assert (=> b!145740 m!175335))

(declare-fun m!175337 () Bool)

(assert (=> b!145740 m!175337))

(declare-fun m!175339 () Bool)

(assert (=> b!145740 m!175339))

(assert (=> b!145740 m!175315))

(declare-fun m!175341 () Bool)

(assert (=> b!145740 m!175341))

(assert (=> b!145740 m!175327))

(declare-fun m!175343 () Bool)

(assert (=> b!145740 m!175343))

(assert (=> b!145740 m!175335))

(declare-fun m!175345 () Bool)

(assert (=> b!145740 m!175345))

(declare-fun m!175347 () Bool)

(assert (=> b!145736 m!175347))

(assert (=> b!145736 m!175177))

(declare-fun m!175349 () Bool)

(assert (=> b!145736 m!175349))

(assert (=> b!145736 m!175303))

(declare-fun m!175351 () Bool)

(assert (=> b!145736 m!175351))

(assert (=> b!145736 m!175303))

(assert (=> b!145736 m!175347))

(assert (=> b!145736 m!175177))

(assert (=> b!145731 m!175303))

(assert (=> b!145731 m!175303))

(declare-fun m!175353 () Bool)

(assert (=> b!145731 m!175353))

(assert (=> bm!16262 m!175345))

(declare-fun m!175355 () Bool)

(assert (=> b!145734 m!175355))

(assert (=> d!46319 m!175309))

(assert (=> b!145733 m!175303))

(assert (=> b!145733 m!175303))

(declare-fun m!175357 () Bool)

(assert (=> b!145733 m!175357))

(declare-fun m!175359 () Bool)

(assert (=> b!145738 m!175359))

(declare-fun m!175361 () Bool)

(assert (=> b!145728 m!175361))

(declare-fun m!175363 () Bool)

(assert (=> bm!16258 m!175363))

(declare-fun m!175365 () Bool)

(assert (=> bm!16260 m!175365))

(assert (=> b!145735 m!175303))

(assert (=> b!145735 m!175303))

(assert (=> b!145735 m!175357))

(assert (=> b!145517 d!46319))

(declare-fun d!46321 () Bool)

(assert (=> d!46321 (= (valid!575 thiss!992) (valid!574 (v!3326 (underlying!488 thiss!992))))))

(declare-fun bs!6113 () Bool)

(assert (= bs!6113 d!46321))

(declare-fun m!175367 () Bool)

(assert (=> bs!6113 m!175367))

(assert (=> start!15158 d!46321))

(declare-fun d!46323 () Bool)

(declare-fun e!94967 () Bool)

(assert (=> d!46323 e!94967))

(declare-fun res!69360 () Bool)

(assert (=> d!46323 (=> res!69360 e!94967)))

(declare-fun lt!76528 () Bool)

(assert (=> d!46323 (= res!69360 (not lt!76528))))

(declare-fun lt!76527 () Bool)

(assert (=> d!46323 (= lt!76528 lt!76527)))

(declare-fun lt!76529 () Unit!4602)

(declare-fun e!94966 () Unit!4602)

(assert (=> d!46323 (= lt!76529 e!94966)))

(declare-fun c!27627 () Bool)

(assert (=> d!46323 (= c!27627 lt!76527)))

(declare-fun containsKey!182 (List!1759 (_ BitVec 64)) Bool)

(assert (=> d!46323 (= lt!76527 (containsKey!182 (toList!881 lt!76404) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46323 (= (contains!928 lt!76404 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)) lt!76528)))

(declare-fun b!145752 () Bool)

(declare-fun lt!76526 () Unit!4602)

(assert (=> b!145752 (= e!94966 lt!76526)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!131 (List!1759 (_ BitVec 64)) Unit!4602)

(assert (=> b!145752 (= lt!76526 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!881 lt!76404) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((Option!184 0))(
  ( (Some!183 (v!3332 V!3585)) (None!182) )
))
(declare-fun isDefined!132 (Option!184) Bool)

(declare-fun getValueByKey!178 (List!1759 (_ BitVec 64)) Option!184)

(assert (=> b!145752 (isDefined!132 (getValueByKey!178 (toList!881 lt!76404) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145753 () Bool)

(declare-fun Unit!4605 () Unit!4602)

(assert (=> b!145753 (= e!94966 Unit!4605)))

(declare-fun b!145754 () Bool)

(assert (=> b!145754 (= e!94967 (isDefined!132 (getValueByKey!178 (toList!881 lt!76404) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46323 c!27627) b!145752))

(assert (= (and d!46323 (not c!27627)) b!145753))

(assert (= (and d!46323 (not res!69360)) b!145754))

(assert (=> d!46323 m!175157))

(declare-fun m!175369 () Bool)

(assert (=> d!46323 m!175369))

(assert (=> b!145752 m!175157))

(declare-fun m!175371 () Bool)

(assert (=> b!145752 m!175371))

(assert (=> b!145752 m!175157))

(declare-fun m!175373 () Bool)

(assert (=> b!145752 m!175373))

(assert (=> b!145752 m!175373))

(declare-fun m!175375 () Bool)

(assert (=> b!145752 m!175375))

(assert (=> b!145754 m!175157))

(assert (=> b!145754 m!175373))

(assert (=> b!145754 m!175373))

(assert (=> b!145754 m!175375))

(assert (=> b!145498 d!46323))

(declare-fun e!95012 () Bool)

(declare-datatypes ((SeekEntryResult!286 0))(
  ( (MissingZero!286 (index!3311 (_ BitVec 32))) (Found!286 (index!3312 (_ BitVec 32))) (Intermediate!286 (undefined!1098 Bool) (index!3313 (_ BitVec 32)) (x!16606 (_ BitVec 32))) (Undefined!286) (MissingVacant!286 (index!3314 (_ BitVec 32))) )
))
(declare-fun lt!76603 () SeekEntryResult!286)

(declare-fun b!145831 () Bool)

(assert (=> b!145831 (= e!95012 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3312 lt!76603)) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145832 () Bool)

(declare-fun e!95009 () tuple2!2696)

(declare-fun e!95014 () tuple2!2696)

(assert (=> b!145832 (= e!95009 e!95014)))

(declare-fun c!27656 () Bool)

(assert (=> b!145832 (= c!27656 (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145833 () Bool)

(declare-fun lt!76601 () tuple2!2696)

(declare-fun call!16337 () tuple2!2696)

(assert (=> b!145833 (= lt!76601 call!16337)))

(declare-fun e!95017 () tuple2!2696)

(assert (=> b!145833 (= e!95017 (tuple2!2697 (_1!1359 lt!76601) (_2!1359 lt!76601)))))

(declare-fun b!145834 () Bool)

(declare-fun call!16336 () ListLongMap!1731)

(declare-fun call!16325 () ListLongMap!1731)

(declare-fun e!95025 () Bool)

(assert (=> b!145834 (= e!95025 (= call!16325 (+!171 call!16336 (tuple2!2695 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!145835 () Bool)

(declare-fun e!95011 () Bool)

(declare-fun e!95019 () Bool)

(assert (=> b!145835 (= e!95011 e!95019)))

(declare-fun c!27657 () Bool)

(declare-fun lt!76585 () tuple2!2696)

(assert (=> b!145835 (= c!27657 (_1!1359 lt!76585))))

(declare-fun bm!16312 () Bool)

(declare-fun call!16335 () Bool)

(declare-fun call!16316 () Bool)

(assert (=> bm!16312 (= call!16335 call!16316)))

(declare-fun b!145836 () Bool)

(declare-fun c!27663 () Bool)

(declare-fun lt!76587 () SeekEntryResult!286)

(assert (=> b!145836 (= c!27663 ((_ is MissingVacant!286) lt!76587))))

(declare-fun e!95018 () Bool)

(declare-fun e!95015 () Bool)

(assert (=> b!145836 (= e!95018 e!95015)))

(declare-fun b!145837 () Bool)

(declare-fun lt!76602 () Unit!4602)

(declare-fun lt!76589 () Unit!4602)

(assert (=> b!145837 (= lt!76602 lt!76589)))

(declare-fun call!16326 () ListLongMap!1731)

(declare-fun call!16338 () ListLongMap!1731)

(assert (=> b!145837 (= call!16326 call!16338)))

(declare-fun lt!76600 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!69 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 V!3585 Int) Unit!4602)

(assert (=> b!145837 (= lt!76589 (lemmaChangeZeroKeyThenAddPairToListMap!69 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) lt!76600 (zeroValue!2846 newMap!16) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2846 newMap!16) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145837 (= lt!76600 (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!145837 (= e!95014 (tuple2!2697 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7370 newMap!16) (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000001) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2846 newMap!16) (_size!636 newMap!16) (_keys!4769 newMap!16) (_values!2984 newMap!16) (_vacant!636 newMap!16))))))

(declare-fun b!145838 () Bool)

(declare-fun res!69390 () Bool)

(declare-fun e!95010 () Bool)

(assert (=> b!145838 (=> (not res!69390) (not e!95010))))

(declare-fun call!16331 () Bool)

(assert (=> b!145838 (= res!69390 call!16331)))

(assert (=> b!145838 (= e!95018 e!95010)))

(declare-fun b!145839 () Bool)

(declare-fun e!95026 () tuple2!2696)

(assert (=> b!145839 (= e!95026 e!95017)))

(declare-fun c!27652 () Bool)

(declare-fun lt!76598 () SeekEntryResult!286)

(assert (=> b!145839 (= c!27652 ((_ is MissingZero!286) lt!76598))))

(declare-fun b!145840 () Bool)

(declare-fun e!95020 () tuple2!2696)

(assert (=> b!145840 (= e!95009 e!95020)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4929 (_ BitVec 32)) SeekEntryResult!286)

(assert (=> b!145840 (= lt!76598 (seekEntryOrOpen!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (_keys!4769 newMap!16) (mask!7370 newMap!16)))))

(declare-fun c!27655 () Bool)

(assert (=> b!145840 (= c!27655 ((_ is Undefined!286) lt!76598))))

(declare-fun call!16332 () Bool)

(declare-fun bm!16313 () Bool)

(declare-fun call!16317 () ListLongMap!1731)

(assert (=> bm!16313 (= call!16332 (contains!928 call!16317 (ite c!27655 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (select (arr!2326 (_keys!4769 newMap!16)) (index!3312 lt!76598)))))))

(declare-fun b!145841 () Bool)

(declare-fun lt!76594 () Unit!4602)

(declare-fun lt!76588 () Unit!4602)

(assert (=> b!145841 (= lt!76594 lt!76588)))

(assert (=> b!145841 (= call!16326 call!16338)))

(declare-fun lt!76605 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 V!3585 Int) Unit!4602)

(assert (=> b!145841 (= lt!76588 (lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) lt!76605 (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145841 (= lt!76605 (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!145841 (= e!95014 (tuple2!2697 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7370 newMap!16) (bvor (extraKeys!2746 newMap!16) #b00000000000000000000000000000010) (zeroValue!2846 newMap!16) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!636 newMap!16) (_keys!4769 newMap!16) (_values!2984 newMap!16) (_vacant!636 newMap!16))))))

(declare-fun bm!16314 () Bool)

(declare-fun call!16329 () SeekEntryResult!286)

(declare-fun call!16318 () SeekEntryResult!286)

(assert (=> bm!16314 (= call!16329 call!16318)))

(declare-fun b!145842 () Bool)

(declare-fun res!69397 () Bool)

(declare-fun e!95008 () Bool)

(assert (=> b!145842 (=> (not res!69397) (not e!95008))))

(declare-fun call!16327 () Bool)

(assert (=> b!145842 (= res!69397 call!16327)))

(declare-fun e!95021 () Bool)

(assert (=> b!145842 (= e!95021 e!95008)))

(declare-fun bm!16315 () Bool)

(declare-fun call!16328 () Bool)

(assert (=> bm!16315 (= call!16328 (arrayContainsKey!0 (_keys!4769 newMap!16) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145843 () Bool)

(declare-fun e!95013 () Unit!4602)

(declare-fun lt!76597 () Unit!4602)

(assert (=> b!145843 (= e!95013 lt!76597)))

(declare-fun call!16319 () Unit!4602)

(assert (=> b!145843 (= lt!76597 call!16319)))

(assert (=> b!145843 (= lt!76587 call!16329)))

(declare-fun c!27654 () Bool)

(assert (=> b!145843 (= c!27654 ((_ is MissingZero!286) lt!76587))))

(assert (=> b!145843 e!95018))

(declare-fun b!145844 () Bool)

(declare-fun c!27662 () Bool)

(assert (=> b!145844 (= c!27662 ((_ is MissingVacant!286) lt!76598))))

(assert (=> b!145844 (= e!95020 e!95026)))

(declare-fun b!145845 () Bool)

(declare-fun res!69395 () Bool)

(assert (=> b!145845 (=> (not res!69395) (not e!95008))))

(declare-fun lt!76610 () SeekEntryResult!286)

(assert (=> b!145845 (= res!69395 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3311 lt!76610)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16316 () Bool)

(declare-fun call!16323 () ListLongMap!1731)

(assert (=> bm!16316 (= call!16317 call!16323)))

(declare-fun b!145846 () Bool)

(declare-fun c!27661 () Bool)

(assert (=> b!145846 (= c!27661 ((_ is MissingVacant!286) lt!76610))))

(declare-fun e!95022 () Bool)

(assert (=> b!145846 (= e!95021 e!95022)))

(declare-fun b!145847 () Bool)

(declare-fun e!95027 () Bool)

(assert (=> b!145847 (= e!95022 e!95027)))

(declare-fun res!69393 () Bool)

(assert (=> b!145847 (= res!69393 call!16327)))

(assert (=> b!145847 (=> (not res!69393) (not e!95027))))

(declare-fun e!95016 () Bool)

(declare-fun b!145848 () Bool)

(declare-fun lt!76596 () SeekEntryResult!286)

(assert (=> b!145848 (= e!95016 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3312 lt!76596)) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun bm!16317 () Bool)

(declare-fun call!16322 () ListLongMap!1731)

(assert (=> bm!16317 (= call!16326 call!16322)))

(declare-fun b!145849 () Bool)

(declare-fun lt!76607 () tuple2!2696)

(assert (=> b!145849 (= e!95026 (tuple2!2697 (_1!1359 lt!76607) (_2!1359 lt!76607)))))

(assert (=> b!145849 (= lt!76607 call!16337)))

(declare-fun bm!16318 () Bool)

(assert (=> bm!16318 (= call!16325 (map!1438 (_2!1359 lt!76585)))))

(declare-fun bm!16319 () Bool)

(assert (=> bm!16319 (= call!16327 call!16335)))

(declare-fun b!145850 () Bool)

(declare-fun e!95023 () Unit!4602)

(declare-fun lt!76609 () Unit!4602)

(assert (=> b!145850 (= e!95023 lt!76609)))

(declare-fun call!16333 () Unit!4602)

(assert (=> b!145850 (= lt!76609 call!16333)))

(declare-fun call!16321 () SeekEntryResult!286)

(assert (=> b!145850 (= lt!76603 call!16321)))

(declare-fun res!69400 () Bool)

(assert (=> b!145850 (= res!69400 ((_ is Found!286) lt!76603))))

(assert (=> b!145850 (=> (not res!69400) (not e!95012))))

(assert (=> b!145850 e!95012))

(declare-fun bm!16320 () Bool)

(declare-fun call!16315 () ListLongMap!1731)

(assert (=> bm!16320 (= call!16315 (getCurrentListMap!540 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun b!145851 () Bool)

(declare-fun res!69391 () Bool)

(assert (=> b!145851 (=> (not res!69391) (not e!95010))))

(assert (=> b!145851 (= res!69391 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3311 lt!76587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145852 () Bool)

(declare-fun Unit!4606 () Unit!4602)

(assert (=> b!145852 (= e!95013 Unit!4606)))

(declare-fun lt!76592 () Unit!4602)

(assert (=> b!145852 (= lt!76592 call!16333)))

(assert (=> b!145852 (= lt!76596 call!16329)))

(declare-fun res!69396 () Bool)

(assert (=> b!145852 (= res!69396 ((_ is Found!286) lt!76596))))

(assert (=> b!145852 (=> (not res!69396) (not e!95016))))

(assert (=> b!145852 e!95016))

(declare-fun lt!76584 () Unit!4602)

(assert (=> b!145852 (= lt!76584 lt!76592)))

(assert (=> b!145852 false))

(declare-fun b!145853 () Bool)

(assert (=> b!145853 (= e!95022 ((_ is Undefined!286) lt!76610))))

(declare-fun c!27659 () Bool)

(declare-fun c!27658 () Bool)

(declare-fun bm!16321 () Bool)

(declare-fun c!27653 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16321 (= call!16316 (inRange!0 (ite c!27655 (ite c!27658 (index!3312 lt!76596) (ite c!27654 (index!3311 lt!76587) (index!3314 lt!76587))) (ite c!27659 (index!3312 lt!76603) (ite c!27653 (index!3311 lt!76610) (index!3314 lt!76610)))) (mask!7370 newMap!16)))))

(declare-fun bm!16322 () Bool)

(declare-fun call!16324 () Bool)

(assert (=> bm!16322 (= call!16324 call!16328)))

(declare-fun bm!16323 () Bool)

(declare-fun call!16320 () Bool)

(assert (=> bm!16323 (= call!16320 call!16328)))

(declare-fun b!145854 () Bool)

(declare-fun Unit!4607 () Unit!4602)

(assert (=> b!145854 (= e!95023 Unit!4607)))

(declare-fun lt!76595 () Unit!4602)

(assert (=> b!145854 (= lt!76595 call!16319)))

(assert (=> b!145854 (= lt!76610 call!16321)))

(assert (=> b!145854 (= c!27653 ((_ is MissingZero!286) lt!76610))))

(assert (=> b!145854 e!95021))

(declare-fun lt!76606 () Unit!4602)

(assert (=> b!145854 (= lt!76606 lt!76595)))

(assert (=> b!145854 false))

(declare-fun bm!16324 () Bool)

(declare-fun call!16334 () ListLongMap!1731)

(assert (=> bm!16324 (= call!16334 call!16315)))

(declare-fun b!145855 () Bool)

(declare-fun res!69389 () Bool)

(assert (=> b!145855 (= res!69389 call!16335)))

(assert (=> b!145855 (=> (not res!69389) (not e!95012))))

(declare-fun bm!16325 () Bool)

(declare-fun call!16330 () Bool)

(assert (=> bm!16325 (= call!16330 call!16316)))

(declare-fun b!145856 () Bool)

(declare-fun lt!76590 () Unit!4602)

(assert (=> b!145856 (= lt!76590 e!95013)))

(assert (=> b!145856 (= c!27658 call!16332)))

(assert (=> b!145856 (= e!95020 (tuple2!2697 false newMap!16))))

(declare-fun b!145857 () Bool)

(assert (=> b!145857 (= e!95027 (not call!16320))))

(declare-fun b!145858 () Bool)

(assert (=> b!145858 (= e!95019 (= call!16325 call!16336))))

(declare-fun bm!16326 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) Int) Unit!4602)

(assert (=> bm!16326 (= call!16319 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16327 () Bool)

(assert (=> bm!16327 (= call!16338 call!16323)))

(declare-fun b!145859 () Bool)

(declare-fun e!95024 () Bool)

(assert (=> b!145859 (= e!95024 (not call!16324))))

(declare-fun b!145860 () Bool)

(assert (=> b!145860 (= e!95010 (not call!16324))))

(declare-fun b!145861 () Bool)

(declare-fun res!69394 () Bool)

(assert (=> b!145861 (= res!69394 call!16330)))

(assert (=> b!145861 (=> (not res!69394) (not e!95016))))

(declare-fun bm!16328 () Bool)

(assert (=> bm!16328 (= call!16336 (map!1438 newMap!16))))

(declare-fun b!145862 () Bool)

(declare-fun res!69392 () Bool)

(assert (=> b!145862 (= res!69392 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3314 lt!76587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145862 (=> (not res!69392) (not e!95024))))

(declare-fun b!145863 () Bool)

(assert (=> b!145863 (= e!95008 (not call!16320))))

(declare-fun bm!16329 () Bool)

(assert (=> bm!16329 (= call!16321 call!16318)))

(declare-fun c!27660 () Bool)

(declare-fun bm!16330 () Bool)

(declare-fun lt!76604 () array!4931)

(assert (=> bm!16330 (= call!16323 (getCurrentListMap!540 (_keys!4769 newMap!16) (ite (or c!27660 c!27655) (_values!2984 newMap!16) lt!76604) (mask!7370 newMap!16) (ite c!27660 (ite c!27656 lt!76600 lt!76605) (extraKeys!2746 newMap!16)) (ite (and c!27660 c!27656) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2846 newMap!16)) (ite c!27660 (ite c!27656 (minValue!2846 newMap!16) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2846 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16331 () Bool)

(assert (=> bm!16331 (= call!16322 (+!171 (ite c!27660 call!16334 call!16315) (ite c!27660 (ite c!27656 (tuple2!2695 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2695 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2695 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!145864 () Bool)

(declare-fun res!69401 () Bool)

(assert (=> b!145864 (= res!69401 (= (select (arr!2326 (_keys!4769 newMap!16)) (index!3314 lt!76610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145864 (=> (not res!69401) (not e!95027))))

(declare-fun b!145865 () Bool)

(assert (=> b!145865 (= e!95015 ((_ is Undefined!286) lt!76587))))

(declare-fun bm!16332 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) Int) Unit!4602)

(assert (=> bm!16332 (= call!16333 (lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (defaultEntry!3001 newMap!16)))))

(declare-fun bm!16333 () Bool)

(declare-fun updateHelperNewKey!69 (LongMapFixedSize!1174 (_ BitVec 64) V!3585 (_ BitVec 32)) tuple2!2696)

(assert (=> bm!16333 (= call!16337 (updateHelperNewKey!69 newMap!16 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27662 (index!3314 lt!76598) (index!3311 lt!76598))))))

(declare-fun b!145866 () Bool)

(declare-fun lt!76591 () Unit!4602)

(declare-fun lt!76608 () Unit!4602)

(assert (=> b!145866 (= lt!76591 lt!76608)))

(assert (=> b!145866 call!16332))

(declare-fun lemmaValidKeyInArrayIsInListMap!128 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) Unit!4602)

(assert (=> b!145866 (= lt!76608 (lemmaValidKeyInArrayIsInListMap!128 (_keys!4769 newMap!16) lt!76604 (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (index!3312 lt!76598) (defaultEntry!3001 newMap!16)))))

(assert (=> b!145866 (= lt!76604 (array!4932 (store (arr!2327 (_values!2984 newMap!16)) (index!3312 lt!76598) (ValueCellFull!1133 (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2604 (_values!2984 newMap!16))))))

(declare-fun lt!76593 () Unit!4602)

(declare-fun lt!76586 () Unit!4602)

(assert (=> b!145866 (= lt!76593 lt!76586)))

(assert (=> b!145866 (= call!16322 (getCurrentListMap!540 (_keys!4769 newMap!16) (array!4932 (store (arr!2327 (_values!2984 newMap!16)) (index!3312 lt!76598) (ValueCellFull!1133 (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2604 (_values!2984 newMap!16))) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3001 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (array!4929 array!4931 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) (_ BitVec 64) V!3585 Int) Unit!4602)

(assert (=> b!145866 (= lt!76586 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (_keys!4769 newMap!16) (_values!2984 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (index!3312 lt!76598) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3001 newMap!16)))))

(declare-fun lt!76599 () Unit!4602)

(assert (=> b!145866 (= lt!76599 e!95023)))

(assert (=> b!145866 (= c!27659 (contains!928 call!16315 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145866 (= e!95017 (tuple2!2697 true (LongMapFixedSize!1175 (defaultEntry!3001 newMap!16) (mask!7370 newMap!16) (extraKeys!2746 newMap!16) (zeroValue!2846 newMap!16) (minValue!2846 newMap!16) (_size!636 newMap!16) (_keys!4769 newMap!16) (array!4932 (store (arr!2327 (_values!2984 newMap!16)) (index!3312 lt!76598) (ValueCellFull!1133 (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2604 (_values!2984 newMap!16))) (_vacant!636 newMap!16))))))

(declare-fun bm!16334 () Bool)

(assert (=> bm!16334 (= call!16318 (seekEntryOrOpen!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (_keys!4769 newMap!16) (mask!7370 newMap!16)))))

(declare-fun b!145867 () Bool)

(assert (=> b!145867 (= e!95019 e!95025)))

(declare-fun res!69398 () Bool)

(assert (=> b!145867 (= res!69398 (contains!928 call!16325 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145867 (=> (not res!69398) (not e!95025))))

(declare-fun b!145868 () Bool)

(assert (=> b!145868 (= e!95015 e!95024)))

(declare-fun res!69399 () Bool)

(assert (=> b!145868 (= res!69399 call!16331)))

(assert (=> b!145868 (=> (not res!69399) (not e!95024))))

(declare-fun bm!16335 () Bool)

(assert (=> bm!16335 (= call!16331 call!16330)))

(declare-fun d!46325 () Bool)

(assert (=> d!46325 e!95011))

(declare-fun res!69402 () Bool)

(assert (=> d!46325 (=> (not res!69402) (not e!95011))))

(assert (=> d!46325 (= res!69402 (valid!574 (_2!1359 lt!76585)))))

(assert (=> d!46325 (= lt!76585 e!95009)))

(assert (=> d!46325 (= c!27660 (= (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (bvneg (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46325 (valid!574 newMap!16)))

(assert (=> d!46325 (= (update!217 newMap!16 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355) (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76585)))

(assert (= (and d!46325 c!27660) b!145832))

(assert (= (and d!46325 (not c!27660)) b!145840))

(assert (= (and b!145832 c!27656) b!145837))

(assert (= (and b!145832 (not c!27656)) b!145841))

(assert (= (or b!145837 b!145841) bm!16327))

(assert (= (or b!145837 b!145841) bm!16324))

(assert (= (or b!145837 b!145841) bm!16317))

(assert (= (and b!145840 c!27655) b!145856))

(assert (= (and b!145840 (not c!27655)) b!145844))

(assert (= (and b!145856 c!27658) b!145852))

(assert (= (and b!145856 (not c!27658)) b!145843))

(assert (= (and b!145852 res!69396) b!145861))

(assert (= (and b!145861 res!69394) b!145848))

(assert (= (and b!145843 c!27654) b!145838))

(assert (= (and b!145843 (not c!27654)) b!145836))

(assert (= (and b!145838 res!69390) b!145851))

(assert (= (and b!145851 res!69391) b!145860))

(assert (= (and b!145836 c!27663) b!145868))

(assert (= (and b!145836 (not c!27663)) b!145865))

(assert (= (and b!145868 res!69399) b!145862))

(assert (= (and b!145862 res!69392) b!145859))

(assert (= (or b!145838 b!145868) bm!16335))

(assert (= (or b!145860 b!145859) bm!16322))

(assert (= (or b!145861 bm!16335) bm!16325))

(assert (= (or b!145852 b!145843) bm!16314))

(assert (= (and b!145844 c!27662) b!145849))

(assert (= (and b!145844 (not c!27662)) b!145839))

(assert (= (and b!145839 c!27652) b!145833))

(assert (= (and b!145839 (not c!27652)) b!145866))

(assert (= (and b!145866 c!27659) b!145850))

(assert (= (and b!145866 (not c!27659)) b!145854))

(assert (= (and b!145850 res!69400) b!145855))

(assert (= (and b!145855 res!69389) b!145831))

(assert (= (and b!145854 c!27653) b!145842))

(assert (= (and b!145854 (not c!27653)) b!145846))

(assert (= (and b!145842 res!69397) b!145845))

(assert (= (and b!145845 res!69395) b!145863))

(assert (= (and b!145846 c!27661) b!145847))

(assert (= (and b!145846 (not c!27661)) b!145853))

(assert (= (and b!145847 res!69393) b!145864))

(assert (= (and b!145864 res!69401) b!145857))

(assert (= (or b!145842 b!145847) bm!16319))

(assert (= (or b!145863 b!145857) bm!16323))

(assert (= (or b!145855 bm!16319) bm!16312))

(assert (= (or b!145850 b!145854) bm!16329))

(assert (= (or b!145849 b!145833) bm!16333))

(assert (= (or b!145856 b!145866) bm!16316))

(assert (= (or bm!16314 bm!16329) bm!16334))

(assert (= (or b!145852 b!145850) bm!16332))

(assert (= (or bm!16325 bm!16312) bm!16321))

(assert (= (or bm!16322 bm!16323) bm!16315))

(assert (= (or b!145843 b!145854) bm!16326))

(assert (= (or b!145856 b!145866) bm!16313))

(assert (= (or bm!16327 bm!16316) bm!16330))

(assert (= (or bm!16324 b!145866) bm!16320))

(assert (= (or bm!16317 b!145866) bm!16331))

(assert (= (and d!46325 res!69402) b!145835))

(assert (= (and b!145835 c!27657) b!145867))

(assert (= (and b!145835 (not c!27657)) b!145858))

(assert (= (and b!145867 res!69398) b!145834))

(assert (= (or b!145867 b!145834 b!145858) bm!16318))

(assert (= (or b!145834 b!145858) bm!16328))

(assert (=> b!145867 m!175157))

(declare-fun m!175377 () Bool)

(assert (=> b!145867 m!175377))

(declare-fun m!175379 () Bool)

(assert (=> b!145851 m!175379))

(declare-fun m!175381 () Bool)

(assert (=> bm!16318 m!175381))

(declare-fun m!175383 () Bool)

(assert (=> bm!16330 m!175383))

(declare-fun m!175385 () Bool)

(assert (=> b!145866 m!175385))

(declare-fun m!175387 () Bool)

(assert (=> b!145866 m!175387))

(assert (=> b!145866 m!175157))

(declare-fun m!175389 () Bool)

(assert (=> b!145866 m!175389))

(assert (=> b!145866 m!175157))

(assert (=> b!145866 m!175179))

(declare-fun m!175391 () Bool)

(assert (=> b!145866 m!175391))

(declare-fun m!175393 () Bool)

(assert (=> b!145866 m!175393))

(assert (=> b!145841 m!175179))

(declare-fun m!175395 () Bool)

(assert (=> b!145841 m!175395))

(assert (=> bm!16333 m!175157))

(assert (=> bm!16333 m!175179))

(declare-fun m!175397 () Bool)

(assert (=> bm!16333 m!175397))

(declare-fun m!175399 () Bool)

(assert (=> b!145848 m!175399))

(assert (=> bm!16328 m!175167))

(declare-fun m!175401 () Bool)

(assert (=> bm!16331 m!175401))

(declare-fun m!175403 () Bool)

(assert (=> b!145862 m!175403))

(assert (=> bm!16320 m!175311))

(declare-fun m!175405 () Bool)

(assert (=> b!145831 m!175405))

(assert (=> b!145837 m!175179))

(declare-fun m!175407 () Bool)

(assert (=> b!145837 m!175407))

(declare-fun m!175409 () Bool)

(assert (=> bm!16313 m!175409))

(declare-fun m!175411 () Bool)

(assert (=> bm!16313 m!175411))

(declare-fun m!175413 () Bool)

(assert (=> b!145834 m!175413))

(assert (=> bm!16332 m!175157))

(declare-fun m!175415 () Bool)

(assert (=> bm!16332 m!175415))

(assert (=> bm!16315 m!175157))

(declare-fun m!175417 () Bool)

(assert (=> bm!16315 m!175417))

(declare-fun m!175419 () Bool)

(assert (=> b!145845 m!175419))

(declare-fun m!175421 () Bool)

(assert (=> bm!16321 m!175421))

(declare-fun m!175423 () Bool)

(assert (=> d!46325 m!175423))

(assert (=> d!46325 m!175149))

(assert (=> bm!16334 m!175157))

(declare-fun m!175425 () Bool)

(assert (=> bm!16334 m!175425))

(assert (=> bm!16326 m!175157))

(declare-fun m!175427 () Bool)

(assert (=> bm!16326 m!175427))

(declare-fun m!175429 () Bool)

(assert (=> b!145864 m!175429))

(assert (=> b!145840 m!175157))

(assert (=> b!145840 m!175425))

(assert (=> b!145498 d!46325))

(declare-fun d!46327 () Bool)

(declare-fun c!27666 () Bool)

(assert (=> d!46327 (= c!27666 ((_ is ValueCellFull!1133) (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!95030 () V!3585)

(assert (=> d!46327 (= (get!1552 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!95030)))

(declare-fun b!145873 () Bool)

(declare-fun get!1554 (ValueCell!1133 V!3585) V!3585)

(assert (=> b!145873 (= e!95030 (get!1554 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145874 () Bool)

(declare-fun get!1555 (ValueCell!1133 V!3585) V!3585)

(assert (=> b!145874 (= e!95030 (get!1555 (select (arr!2327 (_values!2984 (v!3326 (underlying!488 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46327 c!27666) b!145873))

(assert (= (and d!46327 (not c!27666)) b!145874))

(assert (=> b!145873 m!175175))

(assert (=> b!145873 m!175177))

(declare-fun m!175431 () Bool)

(assert (=> b!145873 m!175431))

(assert (=> b!145874 m!175175))

(assert (=> b!145874 m!175177))

(declare-fun m!175433 () Bool)

(assert (=> b!145874 m!175433))

(assert (=> b!145498 d!46327))

(declare-fun d!46329 () Bool)

(assert (=> d!46329 (= (array_inv!1491 (_keys!4769 newMap!16)) (bvsge (size!2603 (_keys!4769 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145516 d!46329))

(declare-fun d!46331 () Bool)

(assert (=> d!46331 (= (array_inv!1492 (_values!2984 newMap!16)) (bvsge (size!2604 (_values!2984 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145516 d!46331))

(declare-fun d!46333 () Bool)

(declare-fun lt!76613 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!142 (List!1760) (InoxSet (_ BitVec 64)))

(assert (=> d!46333 (= lt!76613 (select (content!142 lt!76409) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!95035 () Bool)

(assert (=> d!46333 (= lt!76613 e!95035)))

(declare-fun res!69407 () Bool)

(assert (=> d!46333 (=> (not res!69407) (not e!95035))))

(assert (=> d!46333 (= res!69407 ((_ is Cons!1756) lt!76409))))

(assert (=> d!46333 (= (contains!929 lt!76409 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76613)))

(declare-fun b!145879 () Bool)

(declare-fun e!95036 () Bool)

(assert (=> b!145879 (= e!95035 e!95036)))

(declare-fun res!69408 () Bool)

(assert (=> b!145879 (=> res!69408 e!95036)))

(assert (=> b!145879 (= res!69408 (= (h!2364 lt!76409) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145880 () Bool)

(assert (=> b!145880 (= e!95036 (contains!929 (t!6408 lt!76409) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46333 res!69407) b!145879))

(assert (= (and b!145879 (not res!69408)) b!145880))

(declare-fun m!175435 () Bool)

(assert (=> d!46333 m!175435))

(declare-fun m!175437 () Bool)

(assert (=> d!46333 m!175437))

(declare-fun m!175439 () Bool)

(assert (=> b!145880 m!175439))

(assert (=> b!145512 d!46333))

(declare-fun d!46335 () Bool)

(assert (=> d!46335 (= (array_inv!1491 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvsge (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145511 d!46335))

(declare-fun d!46337 () Bool)

(assert (=> d!46337 (= (array_inv!1492 (_values!2984 (v!3326 (underlying!488 thiss!992)))) (bvsge (size!2604 (_values!2984 (v!3326 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145511 d!46337))

(declare-fun d!46339 () Bool)

(declare-fun lt!76614 () Bool)

(assert (=> d!46339 (= lt!76614 (select (content!142 lt!76409) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!95037 () Bool)

(assert (=> d!46339 (= lt!76614 e!95037)))

(declare-fun res!69409 () Bool)

(assert (=> d!46339 (=> (not res!69409) (not e!95037))))

(assert (=> d!46339 (= res!69409 ((_ is Cons!1756) lt!76409))))

(assert (=> d!46339 (= (contains!929 lt!76409 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76614)))

(declare-fun b!145881 () Bool)

(declare-fun e!95038 () Bool)

(assert (=> b!145881 (= e!95037 e!95038)))

(declare-fun res!69410 () Bool)

(assert (=> b!145881 (=> res!69410 e!95038)))

(assert (=> b!145881 (= res!69410 (= (h!2364 lt!76409) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145882 () Bool)

(assert (=> b!145882 (= e!95038 (contains!929 (t!6408 lt!76409) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46339 res!69409) b!145881))

(assert (= (and b!145881 (not res!69410)) b!145882))

(assert (=> d!46339 m!175435))

(declare-fun m!175441 () Bool)

(assert (=> d!46339 m!175441))

(declare-fun m!175443 () Bool)

(assert (=> b!145882 m!175443))

(assert (=> b!145503 d!46339))

(declare-fun lt!76615 () Bool)

(declare-fun d!46341 () Bool)

(assert (=> d!46341 (= lt!76615 (select (content!142 lt!76409) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!95039 () Bool)

(assert (=> d!46341 (= lt!76615 e!95039)))

(declare-fun res!69411 () Bool)

(assert (=> d!46341 (=> (not res!69411) (not e!95039))))

(assert (=> d!46341 (= res!69411 ((_ is Cons!1756) lt!76409))))

(assert (=> d!46341 (= (contains!929 lt!76409 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)) lt!76615)))

(declare-fun b!145883 () Bool)

(declare-fun e!95040 () Bool)

(assert (=> b!145883 (= e!95039 e!95040)))

(declare-fun res!69412 () Bool)

(assert (=> b!145883 (=> res!69412 e!95040)))

(assert (=> b!145883 (= res!69412 (= (h!2364 lt!76409) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145884 () Bool)

(assert (=> b!145884 (= e!95040 (contains!929 (t!6408 lt!76409) (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46341 res!69411) b!145883))

(assert (= (and b!145883 (not res!69412)) b!145884))

(assert (=> d!46341 m!175435))

(assert (=> d!46341 m!175157))

(declare-fun m!175445 () Bool)

(assert (=> d!46341 m!175445))

(assert (=> b!145884 m!175157))

(declare-fun m!175447 () Bool)

(assert (=> b!145884 m!175447))

(assert (=> b!145499 d!46341))

(declare-fun b!145885 () Bool)

(declare-fun e!95043 () Bool)

(declare-fun e!95042 () Bool)

(assert (=> b!145885 (= e!95043 e!95042)))

(declare-fun res!69413 () Bool)

(assert (=> b!145885 (=> (not res!69413) (not e!95042))))

(declare-fun e!95044 () Bool)

(assert (=> b!145885 (= res!69413 (not e!95044))))

(declare-fun res!69415 () Bool)

(assert (=> b!145885 (=> (not res!69415) (not e!95044))))

(assert (=> b!145885 (= res!69415 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16336 () Bool)

(declare-fun call!16339 () Bool)

(declare-fun c!27667 () Bool)

(assert (=> bm!16336 (= call!16339 (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27667 (Cons!1756 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!76409) lt!76409)))))

(declare-fun d!46343 () Bool)

(declare-fun res!69414 () Bool)

(assert (=> d!46343 (=> res!69414 e!95043)))

(assert (=> d!46343 (= res!69414 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2603 (_keys!4769 (v!3326 (underlying!488 thiss!992))))))))

(assert (=> d!46343 (= (arrayNoDuplicates!0 (_keys!4769 (v!3326 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76409) e!95043)))

(declare-fun b!145886 () Bool)

(declare-fun e!95041 () Bool)

(assert (=> b!145886 (= e!95042 e!95041)))

(assert (=> b!145886 (= c!27667 (validKeyInArray!0 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145887 () Bool)

(assert (=> b!145887 (= e!95041 call!16339)))

(declare-fun b!145888 () Bool)

(assert (=> b!145888 (= e!95041 call!16339)))

(declare-fun b!145889 () Bool)

(assert (=> b!145889 (= e!95044 (contains!929 lt!76409 (select (arr!2326 (_keys!4769 (v!3326 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46343 (not res!69414)) b!145885))

(assert (= (and b!145885 res!69415) b!145889))

(assert (= (and b!145885 res!69413) b!145886))

(assert (= (and b!145886 c!27667) b!145888))

(assert (= (and b!145886 (not c!27667)) b!145887))

(assert (= (or b!145888 b!145887) bm!16336))

(assert (=> b!145885 m!175303))

(assert (=> b!145885 m!175303))

(assert (=> b!145885 m!175357))

(assert (=> bm!16336 m!175303))

(declare-fun m!175449 () Bool)

(assert (=> bm!16336 m!175449))

(assert (=> b!145886 m!175303))

(assert (=> b!145886 m!175303))

(assert (=> b!145886 m!175357))

(assert (=> b!145889 m!175303))

(assert (=> b!145889 m!175303))

(declare-fun m!175451 () Bool)

(assert (=> b!145889 m!175451))

(assert (=> b!145510 d!46343))

(declare-fun d!46345 () Bool)

(declare-fun res!69422 () Bool)

(declare-fun e!95047 () Bool)

(assert (=> d!46345 (=> (not res!69422) (not e!95047))))

(declare-fun simpleValid!100 (LongMapFixedSize!1174) Bool)

(assert (=> d!46345 (= res!69422 (simpleValid!100 newMap!16))))

(assert (=> d!46345 (= (valid!574 newMap!16) e!95047)))

(declare-fun b!145896 () Bool)

(declare-fun res!69423 () Bool)

(assert (=> b!145896 (=> (not res!69423) (not e!95047))))

(declare-fun arrayCountValidKeys!0 (array!4929 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!145896 (= res!69423 (= (arrayCountValidKeys!0 (_keys!4769 newMap!16) #b00000000000000000000000000000000 (size!2603 (_keys!4769 newMap!16))) (_size!636 newMap!16)))))

(declare-fun b!145897 () Bool)

(declare-fun res!69424 () Bool)

(assert (=> b!145897 (=> (not res!69424) (not e!95047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4929 (_ BitVec 32)) Bool)

(assert (=> b!145897 (= res!69424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4769 newMap!16) (mask!7370 newMap!16)))))

(declare-fun b!145898 () Bool)

(assert (=> b!145898 (= e!95047 (arrayNoDuplicates!0 (_keys!4769 newMap!16) #b00000000000000000000000000000000 Nil!1757))))

(assert (= (and d!46345 res!69422) b!145896))

(assert (= (and b!145896 res!69423) b!145897))

(assert (= (and b!145897 res!69424) b!145898))

(declare-fun m!175453 () Bool)

(assert (=> d!46345 m!175453))

(declare-fun m!175455 () Bool)

(assert (=> b!145896 m!175455))

(declare-fun m!175457 () Bool)

(assert (=> b!145897 m!175457))

(declare-fun m!175459 () Bool)

(assert (=> b!145898 m!175459))

(assert (=> b!145509 d!46345))

(declare-fun b!145905 () Bool)

(declare-fun e!95053 () Bool)

(assert (=> b!145905 (= e!95053 tp_is_empty!2953)))

(declare-fun mapIsEmpty!4943 () Bool)

(declare-fun mapRes!4943 () Bool)

(assert (=> mapIsEmpty!4943 mapRes!4943))

(declare-fun mapNonEmpty!4943 () Bool)

(declare-fun tp!11747 () Bool)

(assert (=> mapNonEmpty!4943 (= mapRes!4943 (and tp!11747 e!95053))))

(declare-fun mapValue!4943 () ValueCell!1133)

(declare-fun mapKey!4943 () (_ BitVec 32))

(declare-fun mapRest!4943 () (Array (_ BitVec 32) ValueCell!1133))

(assert (=> mapNonEmpty!4943 (= mapRest!4928 (store mapRest!4943 mapKey!4943 mapValue!4943))))

(declare-fun b!145906 () Bool)

(declare-fun e!95052 () Bool)

(assert (=> b!145906 (= e!95052 tp_is_empty!2953)))

(declare-fun condMapEmpty!4943 () Bool)

(declare-fun mapDefault!4943 () ValueCell!1133)

(assert (=> mapNonEmpty!4927 (= condMapEmpty!4943 (= mapRest!4928 ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4943)))))

(assert (=> mapNonEmpty!4927 (= tp!11718 (and e!95052 mapRes!4943))))

(assert (= (and mapNonEmpty!4927 condMapEmpty!4943) mapIsEmpty!4943))

(assert (= (and mapNonEmpty!4927 (not condMapEmpty!4943)) mapNonEmpty!4943))

(assert (= (and mapNonEmpty!4943 ((_ is ValueCellFull!1133) mapValue!4943)) b!145905))

(assert (= (and mapNonEmpty!4927 ((_ is ValueCellFull!1133) mapDefault!4943)) b!145906))

(declare-fun m!175461 () Bool)

(assert (=> mapNonEmpty!4943 m!175461))

(declare-fun b!145907 () Bool)

(declare-fun e!95055 () Bool)

(assert (=> b!145907 (= e!95055 tp_is_empty!2953)))

(declare-fun mapIsEmpty!4944 () Bool)

(declare-fun mapRes!4944 () Bool)

(assert (=> mapIsEmpty!4944 mapRes!4944))

(declare-fun mapNonEmpty!4944 () Bool)

(declare-fun tp!11748 () Bool)

(assert (=> mapNonEmpty!4944 (= mapRes!4944 (and tp!11748 e!95055))))

(declare-fun mapRest!4944 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapKey!4944 () (_ BitVec 32))

(declare-fun mapValue!4944 () ValueCell!1133)

(assert (=> mapNonEmpty!4944 (= mapRest!4927 (store mapRest!4944 mapKey!4944 mapValue!4944))))

(declare-fun b!145908 () Bool)

(declare-fun e!95054 () Bool)

(assert (=> b!145908 (= e!95054 tp_is_empty!2953)))

(declare-fun condMapEmpty!4944 () Bool)

(declare-fun mapDefault!4944 () ValueCell!1133)

(assert (=> mapNonEmpty!4928 (= condMapEmpty!4944 (= mapRest!4927 ((as const (Array (_ BitVec 32) ValueCell!1133)) mapDefault!4944)))))

(assert (=> mapNonEmpty!4928 (= tp!11719 (and e!95054 mapRes!4944))))

(assert (= (and mapNonEmpty!4928 condMapEmpty!4944) mapIsEmpty!4944))

(assert (= (and mapNonEmpty!4928 (not condMapEmpty!4944)) mapNonEmpty!4944))

(assert (= (and mapNonEmpty!4944 ((_ is ValueCellFull!1133) mapValue!4944)) b!145907))

(assert (= (and mapNonEmpty!4928 ((_ is ValueCellFull!1133) mapDefault!4944)) b!145908))

(declare-fun m!175463 () Bool)

(assert (=> mapNonEmpty!4944 m!175463))

(declare-fun b_lambda!6523 () Bool)

(assert (= b_lambda!6521 (or (and b!145511 b_free!3073) (and b!145516 b_free!3075 (= (defaultEntry!3001 newMap!16) (defaultEntry!3001 (v!3326 (underlying!488 thiss!992))))) b_lambda!6523)))

(check-sat (not b!145676) (not b!145740) (not bm!16326) (not b_lambda!6523) (not mapNonEmpty!4944) (not b!145886) (not b!145670) (not bm!16328) (not b!145731) (not b!145736) (not b!145728) (not b!145898) (not bm!16336) (not bm!16332) (not b!145754) (not b_lambda!6519) (not b!145840) (not bm!16318) (not d!46333) (not b!145884) (not bm!16315) (not bm!16320) (not bm!16321) (not b!145667) (not b_next!3073) b_and!9067 (not b_next!3075) (not b!145837) (not bm!16333) (not d!46341) (not b!145882) (not b!145734) (not d!46317) tp_is_empty!2953 (not d!46321) (not b!145834) (not bm!16262) (not b!145733) (not bm!16313) (not b!145885) (not b!145666) (not b!145866) (not b!145735) (not b!145654) (not b!145897) (not b!145841) (not bm!16261) (not d!46325) (not b!145896) (not d!46339) (not bm!16334) (not mapNonEmpty!4943) (not b!145873) (not b!145655) (not bm!16242) (not d!46323) (not b!145874) (not b!145738) (not b!145681) (not bm!16258) (not d!46311) (not b!145867) (not b!145880) (not b!145752) (not bm!16260) (not d!46345) (not bm!16331) (not d!46319) (not bm!16330) (not d!46315) (not b!145889) b_and!9065)
(check-sat b_and!9065 b_and!9067 (not b_next!3073) (not b_next!3075))
