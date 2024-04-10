; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8368 () Bool)

(assert start!8368)

(declare-fun b!56160 () Bool)

(declare-fun b_free!1901 () Bool)

(declare-fun b_next!1901 () Bool)

(assert (=> b!56160 (= b_free!1901 (not b_next!1901))))

(declare-fun tp!7804 () Bool)

(declare-fun b_and!3343 () Bool)

(assert (=> b!56160 (= tp!7804 b_and!3343)))

(declare-fun b!56168 () Bool)

(declare-fun b_free!1903 () Bool)

(declare-fun b_next!1903 () Bool)

(assert (=> b!56168 (= b_free!1903 (not b_next!1903))))

(declare-fun tp!7806 () Bool)

(declare-fun b_and!3345 () Bool)

(assert (=> b!56168 (= tp!7806 b_and!3345)))

(declare-fun b!56150 () Bool)

(declare-fun e!36959 () Bool)

(declare-fun e!36955 () Bool)

(declare-fun mapRes!2771 () Bool)

(assert (=> b!56150 (= e!36959 (and e!36955 mapRes!2771))))

(declare-fun condMapEmpty!2772 () Bool)

(declare-datatypes ((V!2803 0))(
  ( (V!2804 (val!1228 Int)) )
))
(declare-datatypes ((array!3657 0))(
  ( (array!3658 (arr!1751 (Array (_ BitVec 32) (_ BitVec 64))) (size!1980 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!840 0))(
  ( (ValueCellFull!840 (v!2342 V!2803)) (EmptyCell!840) )
))
(declare-datatypes ((array!3659 0))(
  ( (array!3660 (arr!1752 (Array (_ BitVec 32) ValueCell!840)) (size!1981 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!588 0))(
  ( (LongMapFixedSize!589 (defaultEntry!2008 Int) (mask!5873 (_ BitVec 32)) (extraKeys!1899 (_ BitVec 32)) (zeroValue!1926 V!2803) (minValue!1926 V!2803) (_size!343 (_ BitVec 32)) (_keys!3628 array!3657) (_values!1991 array!3659) (_vacant!343 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!588)

(declare-fun mapDefault!2772 () ValueCell!840)

(assert (=> b!56150 (= condMapEmpty!2772 (= (arr!1752 (_values!1991 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!840)) mapDefault!2772)))))

(declare-fun mapIsEmpty!2771 () Bool)

(assert (=> mapIsEmpty!2771 mapRes!2771))

(declare-fun mapNonEmpty!2771 () Bool)

(declare-fun mapRes!2772 () Bool)

(declare-fun tp!7803 () Bool)

(declare-fun e!36956 () Bool)

(assert (=> mapNonEmpty!2771 (= mapRes!2772 (and tp!7803 e!36956))))

(declare-fun mapValue!2772 () ValueCell!840)

(declare-datatypes ((Cell!404 0))(
  ( (Cell!405 (v!2343 LongMapFixedSize!588)) )
))
(declare-datatypes ((LongMap!404 0))(
  ( (LongMap!405 (underlying!213 Cell!404)) )
))
(declare-fun thiss!992 () LongMap!404)

(declare-fun mapRest!2771 () (Array (_ BitVec 32) ValueCell!840))

(declare-fun mapKey!2771 () (_ BitVec 32))

(assert (=> mapNonEmpty!2771 (= (arr!1752 (_values!1991 (v!2343 (underlying!213 thiss!992)))) (store mapRest!2771 mapKey!2771 mapValue!2772))))

(declare-fun b!56151 () Bool)

(declare-fun e!36949 () Bool)

(declare-fun tp_is_empty!2367 () Bool)

(assert (=> b!56151 (= e!36949 tp_is_empty!2367)))

(declare-fun b!56152 () Bool)

(assert (=> b!56152 (= e!36956 tp_is_empty!2367)))

(declare-fun b!56153 () Bool)

(declare-fun e!36952 () Bool)

(declare-fun e!36950 () Bool)

(assert (=> b!56153 (= e!36952 e!36950)))

(declare-fun b!56154 () Bool)

(declare-fun res!31588 () Bool)

(declare-fun e!36953 () Bool)

(assert (=> b!56154 (=> (not res!31588) (not e!36953))))

(declare-fun valid!237 (LongMapFixedSize!588) Bool)

(assert (=> b!56154 (= res!31588 (valid!237 newMap!16))))

(declare-fun b!56155 () Bool)

(declare-fun res!31589 () Bool)

(assert (=> b!56155 (=> (not res!31589) (not e!36953))))

(assert (=> b!56155 (= res!31589 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5873 newMap!16)) (_size!343 (v!2343 (underlying!213 thiss!992)))))))

(declare-fun mapIsEmpty!2772 () Bool)

(assert (=> mapIsEmpty!2772 mapRes!2772))

(declare-fun res!31595 () Bool)

(assert (=> start!8368 (=> (not res!31595) (not e!36953))))

(declare-fun valid!238 (LongMap!404) Bool)

(assert (=> start!8368 (= res!31595 (valid!238 thiss!992))))

(assert (=> start!8368 e!36953))

(declare-fun e!36951 () Bool)

(assert (=> start!8368 e!36951))

(assert (=> start!8368 true))

(declare-fun e!36958 () Bool)

(assert (=> start!8368 e!36958))

(declare-fun b!56156 () Bool)

(assert (=> b!56156 (= e!36955 tp_is_empty!2367)))

(declare-fun b!56157 () Bool)

(declare-fun e!36945 () Bool)

(assert (=> b!56157 (= e!36945 (and e!36949 mapRes!2772))))

(declare-fun condMapEmpty!2771 () Bool)

(declare-fun mapDefault!2771 () ValueCell!840)

(assert (=> b!56157 (= condMapEmpty!2771 (= (arr!1752 (_values!1991 (v!2343 (underlying!213 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!840)) mapDefault!2771)))))

(declare-fun b!56158 () Bool)

(declare-fun res!31592 () Bool)

(declare-fun e!36944 () Bool)

(assert (=> b!56158 (=> res!31592 e!36944)))

(declare-datatypes ((List!1409 0))(
  ( (Nil!1406) (Cons!1405 (h!1985 (_ BitVec 64)) (t!4679 List!1409)) )
))
(declare-fun lt!22173 () List!1409)

(declare-fun noDuplicate!47 (List!1409) Bool)

(assert (=> b!56158 (= res!31592 (not (noDuplicate!47 lt!22173)))))

(declare-fun b!56159 () Bool)

(assert (=> b!56159 (= e!36944 true)))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!22172 () Bool)

(declare-fun contains!667 (List!1409 (_ BitVec 64)) Bool)

(assert (=> b!56159 (= lt!22172 (contains!667 lt!22173 (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355)))))

(declare-fun array_inv!1083 (array!3657) Bool)

(declare-fun array_inv!1084 (array!3659) Bool)

(assert (=> b!56160 (= e!36950 (and tp!7804 tp_is_empty!2367 (array_inv!1083 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) (array_inv!1084 (_values!1991 (v!2343 (underlying!213 thiss!992)))) e!36945))))

(declare-fun mapNonEmpty!2772 () Bool)

(declare-fun tp!7805 () Bool)

(declare-fun e!36948 () Bool)

(assert (=> mapNonEmpty!2772 (= mapRes!2771 (and tp!7805 e!36948))))

(declare-fun mapKey!2772 () (_ BitVec 32))

(declare-fun mapValue!2771 () ValueCell!840)

(declare-fun mapRest!2772 () (Array (_ BitVec 32) ValueCell!840))

(assert (=> mapNonEmpty!2772 (= (arr!1752 (_values!1991 newMap!16)) (store mapRest!2772 mapKey!2772 mapValue!2771))))

(declare-fun b!56161 () Bool)

(declare-fun res!31585 () Bool)

(assert (=> b!56161 (=> res!31585 e!36944)))

(assert (=> b!56161 (= res!31585 (contains!667 lt!22173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56162 () Bool)

(declare-fun res!31593 () Bool)

(assert (=> b!56162 (=> res!31593 e!36944)))

(assert (=> b!56162 (= res!31593 (contains!667 lt!22173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56163 () Bool)

(declare-fun e!36957 () Bool)

(declare-fun e!36946 () Bool)

(assert (=> b!56163 (= e!36957 e!36946)))

(declare-fun res!31586 () Bool)

(assert (=> b!56163 (=> (not res!31586) (not e!36946))))

(declare-datatypes ((tuple2!1988 0))(
  ( (tuple2!1989 (_1!1005 (_ BitVec 64)) (_2!1005 V!2803)) )
))
(declare-datatypes ((List!1410 0))(
  ( (Nil!1407) (Cons!1406 (h!1986 tuple2!1988) (t!4680 List!1410)) )
))
(declare-datatypes ((ListLongMap!1343 0))(
  ( (ListLongMap!1344 (toList!687 List!1410)) )
))
(declare-fun lt!22169 () ListLongMap!1343)

(declare-fun contains!668 (ListLongMap!1343 (_ BitVec 64)) Bool)

(assert (=> b!56163 (= res!31586 (contains!668 lt!22169 (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1990 0))(
  ( (tuple2!1991 (_1!1006 Bool) (_2!1006 LongMapFixedSize!588)) )
))
(declare-fun lt!22167 () tuple2!1990)

(declare-fun update!67 (LongMapFixedSize!588 (_ BitVec 64) V!2803) tuple2!1990)

(declare-fun get!1045 (ValueCell!840 V!2803) V!2803)

(declare-fun dynLambda!298 (Int (_ BitVec 64)) V!2803)

(assert (=> b!56163 (= lt!22167 (update!67 newMap!16 (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) (get!1045 (select (arr!1752 (_values!1991 (v!2343 (underlying!213 thiss!992)))) from!355) (dynLambda!298 (defaultEntry!2008 (v!2343 (underlying!213 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56164 () Bool)

(assert (=> b!56164 (= e!36948 tp_is_empty!2367)))

(declare-fun b!56165 () Bool)

(declare-fun res!31590 () Bool)

(assert (=> b!56165 (=> res!31590 e!36944)))

(declare-fun arrayNoDuplicates!0 (array!3657 (_ BitVec 32) List!1409) Bool)

(assert (=> b!56165 (= res!31590 (not (arrayNoDuplicates!0 (_keys!3628 (v!2343 (underlying!213 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22173)))))

(declare-fun b!56166 () Bool)

(assert (=> b!56166 (= e!36946 (not e!36944))))

(declare-fun res!31594 () Bool)

(assert (=> b!56166 (=> res!31594 e!36944)))

(assert (=> b!56166 (= res!31594 (or (bvsge (size!1980 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1980 (_keys!3628 (v!2343 (underlying!213 thiss!992)))))))))

(assert (=> b!56166 (= lt!22173 (Cons!1405 (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) Nil!1406))))

(assert (=> b!56166 (arrayNoDuplicates!0 (_keys!3628 (v!2343 (underlying!213 thiss!992))) from!355 Nil!1406)))

(declare-datatypes ((Unit!1463 0))(
  ( (Unit!1464) )
))
(declare-fun lt!22171 () Unit!1463)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3657 (_ BitVec 32) (_ BitVec 32)) Unit!1463)

(assert (=> b!56166 (= lt!22171 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3628 (v!2343 (underlying!213 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56166 (arrayContainsKey!0 (_keys!3628 (v!2343 (underlying!213 thiss!992))) (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22170 () Unit!1463)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!21 (array!3657 array!3659 (_ BitVec 32) (_ BitVec 32) V!2803 V!2803 (_ BitVec 64) (_ BitVec 32) Int) Unit!1463)

(assert (=> b!56166 (= lt!22170 (lemmaListMapContainsThenArrayContainsFrom!21 (_keys!3628 (v!2343 (underlying!213 thiss!992))) (_values!1991 (v!2343 (underlying!213 thiss!992))) (mask!5873 (v!2343 (underlying!213 thiss!992))) (extraKeys!1899 (v!2343 (underlying!213 thiss!992))) (zeroValue!1926 (v!2343 (underlying!213 thiss!992))) (minValue!1926 (v!2343 (underlying!213 thiss!992))) (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2008 (v!2343 (underlying!213 thiss!992)))))))

(declare-fun b!56167 () Bool)

(declare-fun res!31591 () Bool)

(assert (=> b!56167 (=> (not res!31591) (not e!36953))))

(assert (=> b!56167 (= res!31591 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1980 (_keys!3628 (v!2343 (underlying!213 thiss!992)))))))))

(assert (=> b!56168 (= e!36958 (and tp!7806 tp_is_empty!2367 (array_inv!1083 (_keys!3628 newMap!16)) (array_inv!1084 (_values!1991 newMap!16)) e!36959))))

(declare-fun b!56169 () Bool)

(assert (=> b!56169 (= e!36953 e!36957)))

(declare-fun res!31587 () Bool)

(assert (=> b!56169 (=> (not res!31587) (not e!36957))))

(declare-fun lt!22168 () ListLongMap!1343)

(assert (=> b!56169 (= res!31587 (and (= lt!22168 lt!22169) (not (= (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1751 (_keys!3628 (v!2343 (underlying!213 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1086 (LongMapFixedSize!588) ListLongMap!1343)

(assert (=> b!56169 (= lt!22169 (map!1086 newMap!16))))

(declare-fun getCurrentListMap!393 (array!3657 array!3659 (_ BitVec 32) (_ BitVec 32) V!2803 V!2803 (_ BitVec 32) Int) ListLongMap!1343)

(assert (=> b!56169 (= lt!22168 (getCurrentListMap!393 (_keys!3628 (v!2343 (underlying!213 thiss!992))) (_values!1991 (v!2343 (underlying!213 thiss!992))) (mask!5873 (v!2343 (underlying!213 thiss!992))) (extraKeys!1899 (v!2343 (underlying!213 thiss!992))) (zeroValue!1926 (v!2343 (underlying!213 thiss!992))) (minValue!1926 (v!2343 (underlying!213 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2008 (v!2343 (underlying!213 thiss!992)))))))

(declare-fun b!56170 () Bool)

(assert (=> b!56170 (= e!36951 e!36952)))

(assert (= (and start!8368 res!31595) b!56167))

(assert (= (and b!56167 res!31591) b!56154))

(assert (= (and b!56154 res!31588) b!56155))

(assert (= (and b!56155 res!31589) b!56169))

(assert (= (and b!56169 res!31587) b!56163))

(assert (= (and b!56163 res!31586) b!56166))

(assert (= (and b!56166 (not res!31594)) b!56158))

(assert (= (and b!56158 (not res!31592)) b!56162))

(assert (= (and b!56162 (not res!31593)) b!56161))

(assert (= (and b!56161 (not res!31585)) b!56165))

(assert (= (and b!56165 (not res!31590)) b!56159))

(assert (= (and b!56157 condMapEmpty!2771) mapIsEmpty!2772))

(assert (= (and b!56157 (not condMapEmpty!2771)) mapNonEmpty!2771))

(get-info :version)

(assert (= (and mapNonEmpty!2771 ((_ is ValueCellFull!840) mapValue!2772)) b!56152))

(assert (= (and b!56157 ((_ is ValueCellFull!840) mapDefault!2771)) b!56151))

(assert (= b!56160 b!56157))

(assert (= b!56153 b!56160))

(assert (= b!56170 b!56153))

(assert (= start!8368 b!56170))

(assert (= (and b!56150 condMapEmpty!2772) mapIsEmpty!2771))

(assert (= (and b!56150 (not condMapEmpty!2772)) mapNonEmpty!2772))

(assert (= (and mapNonEmpty!2772 ((_ is ValueCellFull!840) mapValue!2771)) b!56164))

(assert (= (and b!56150 ((_ is ValueCellFull!840) mapDefault!2772)) b!56156))

(assert (= b!56168 b!56150))

(assert (= start!8368 b!56168))

(declare-fun b_lambda!2461 () Bool)

(assert (=> (not b_lambda!2461) (not b!56163)))

(declare-fun t!4676 () Bool)

(declare-fun tb!1245 () Bool)

(assert (=> (and b!56160 (= (defaultEntry!2008 (v!2343 (underlying!213 thiss!992))) (defaultEntry!2008 (v!2343 (underlying!213 thiss!992)))) t!4676) tb!1245))

(declare-fun result!2265 () Bool)

(assert (=> tb!1245 (= result!2265 tp_is_empty!2367)))

(assert (=> b!56163 t!4676))

(declare-fun b_and!3347 () Bool)

(assert (= b_and!3343 (and (=> t!4676 result!2265) b_and!3347)))

(declare-fun t!4678 () Bool)

(declare-fun tb!1247 () Bool)

(assert (=> (and b!56168 (= (defaultEntry!2008 newMap!16) (defaultEntry!2008 (v!2343 (underlying!213 thiss!992)))) t!4678) tb!1247))

(declare-fun result!2269 () Bool)

(assert (= result!2269 result!2265))

(assert (=> b!56163 t!4678))

(declare-fun b_and!3349 () Bool)

(assert (= b_and!3345 (and (=> t!4678 result!2269) b_and!3349)))

(declare-fun m!47305 () Bool)

(assert (=> b!56158 m!47305))

(declare-fun m!47307 () Bool)

(assert (=> mapNonEmpty!2771 m!47307))

(declare-fun m!47309 () Bool)

(assert (=> b!56169 m!47309))

(declare-fun m!47311 () Bool)

(assert (=> b!56169 m!47311))

(declare-fun m!47313 () Bool)

(assert (=> b!56169 m!47313))

(declare-fun m!47315 () Bool)

(assert (=> b!56162 m!47315))

(declare-fun m!47317 () Bool)

(assert (=> b!56161 m!47317))

(assert (=> b!56159 m!47309))

(assert (=> b!56159 m!47309))

(declare-fun m!47319 () Bool)

(assert (=> b!56159 m!47319))

(declare-fun m!47321 () Bool)

(assert (=> b!56166 m!47321))

(declare-fun m!47323 () Bool)

(assert (=> b!56166 m!47323))

(assert (=> b!56166 m!47309))

(declare-fun m!47325 () Bool)

(assert (=> b!56166 m!47325))

(assert (=> b!56166 m!47309))

(assert (=> b!56166 m!47309))

(declare-fun m!47327 () Bool)

(assert (=> b!56166 m!47327))

(declare-fun m!47329 () Bool)

(assert (=> b!56165 m!47329))

(declare-fun m!47331 () Bool)

(assert (=> mapNonEmpty!2772 m!47331))

(declare-fun m!47333 () Bool)

(assert (=> b!56160 m!47333))

(declare-fun m!47335 () Bool)

(assert (=> b!56160 m!47335))

(declare-fun m!47337 () Bool)

(assert (=> start!8368 m!47337))

(declare-fun m!47339 () Bool)

(assert (=> b!56163 m!47339))

(declare-fun m!47341 () Bool)

(assert (=> b!56163 m!47341))

(declare-fun m!47343 () Bool)

(assert (=> b!56163 m!47343))

(assert (=> b!56163 m!47309))

(declare-fun m!47345 () Bool)

(assert (=> b!56163 m!47345))

(assert (=> b!56163 m!47309))

(assert (=> b!56163 m!47341))

(assert (=> b!56163 m!47309))

(assert (=> b!56163 m!47343))

(declare-fun m!47347 () Bool)

(assert (=> b!56163 m!47347))

(assert (=> b!56163 m!47339))

(declare-fun m!47349 () Bool)

(assert (=> b!56154 m!47349))

(declare-fun m!47351 () Bool)

(assert (=> b!56168 m!47351))

(declare-fun m!47353 () Bool)

(assert (=> b!56168 m!47353))

(check-sat (not b_next!1901) (not b!56165) (not b!56160) (not b!56166) (not b!56163) (not b!56161) (not b!56158) (not b!56159) (not mapNonEmpty!2771) (not mapNonEmpty!2772) (not b!56154) (not b_next!1903) tp_is_empty!2367 (not b!56162) (not b_lambda!2461) b_and!3347 (not b!56168) b_and!3349 (not start!8368) (not b!56169))
(check-sat b_and!3347 b_and!3349 (not b_next!1901) (not b_next!1903))
