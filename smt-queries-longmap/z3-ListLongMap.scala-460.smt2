; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8376 () Bool)

(assert start!8376)

(declare-fun b!56223 () Bool)

(declare-fun b_free!1909 () Bool)

(declare-fun b_next!1909 () Bool)

(assert (=> b!56223 (= b_free!1909 (not b_next!1909))))

(declare-fun tp!7827 () Bool)

(declare-fun b_and!3357 () Bool)

(assert (=> b!56223 (= tp!7827 b_and!3357)))

(declare-fun b!56226 () Bool)

(declare-fun b_free!1911 () Bool)

(declare-fun b_next!1911 () Bool)

(assert (=> b!56226 (= b_free!1911 (not b_next!1911))))

(declare-fun tp!7828 () Bool)

(declare-fun b_and!3359 () Bool)

(assert (=> b!56226 (= tp!7828 b_and!3359)))

(declare-fun e!37015 () Bool)

(declare-fun tp_is_empty!2371 () Bool)

(declare-fun e!37004 () Bool)

(declare-datatypes ((V!2809 0))(
  ( (V!2810 (val!1230 Int)) )
))
(declare-datatypes ((array!3651 0))(
  ( (array!3652 (arr!1748 (Array (_ BitVec 32) (_ BitVec 64))) (size!1977 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!842 0))(
  ( (ValueCellFull!842 (v!2347 V!2809)) (EmptyCell!842) )
))
(declare-datatypes ((array!3653 0))(
  ( (array!3654 (arr!1749 (Array (_ BitVec 32) ValueCell!842)) (size!1978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!592 0))(
  ( (LongMapFixedSize!593 (defaultEntry!2010 Int) (mask!5877 (_ BitVec 32)) (extraKeys!1901 (_ BitVec 32)) (zeroValue!1928 V!2809) (minValue!1928 V!2809) (_size!345 (_ BitVec 32)) (_keys!3630 array!3651) (_values!1993 array!3653) (_vacant!345 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!408 0))(
  ( (Cell!409 (v!2348 LongMapFixedSize!592)) )
))
(declare-datatypes ((LongMap!408 0))(
  ( (LongMap!409 (underlying!215 Cell!408)) )
))
(declare-fun thiss!992 () LongMap!408)

(declare-fun array_inv!1075 (array!3651) Bool)

(declare-fun array_inv!1076 (array!3653) Bool)

(assert (=> b!56223 (= e!37004 (and tp!7827 tp_is_empty!2371 (array_inv!1075 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) (array_inv!1076 (_values!1993 (v!2348 (underlying!215 thiss!992)))) e!37015))))

(declare-fun b!56224 () Bool)

(declare-fun e!37018 () Bool)

(assert (=> b!56224 (= e!37018 tp_is_empty!2371)))

(declare-fun b!56225 () Bool)

(declare-fun e!37016 () Bool)

(declare-fun e!37003 () Bool)

(declare-fun mapRes!2784 () Bool)

(assert (=> b!56225 (= e!37016 (and e!37003 mapRes!2784))))

(declare-fun condMapEmpty!2784 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!592)

(declare-fun mapDefault!2784 () ValueCell!842)

(assert (=> b!56225 (= condMapEmpty!2784 (= (arr!1749 (_values!1993 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!842)) mapDefault!2784)))))

(declare-fun e!37010 () Bool)

(assert (=> b!56226 (= e!37010 (and tp!7828 tp_is_empty!2371 (array_inv!1075 (_keys!3630 newMap!16)) (array_inv!1076 (_values!1993 newMap!16)) e!37016))))

(declare-fun mapNonEmpty!2783 () Bool)

(declare-fun mapRes!2783 () Bool)

(declare-fun tp!7830 () Bool)

(assert (=> mapNonEmpty!2783 (= mapRes!2783 (and tp!7830 e!37018))))

(declare-fun mapKey!2783 () (_ BitVec 32))

(declare-fun mapValue!2783 () ValueCell!842)

(declare-fun mapRest!2784 () (Array (_ BitVec 32) ValueCell!842))

(assert (=> mapNonEmpty!2783 (= (arr!1749 (_values!1993 (v!2348 (underlying!215 thiss!992)))) (store mapRest!2784 mapKey!2783 mapValue!2783))))

(declare-fun b!56227 () Bool)

(declare-fun res!31632 () Bool)

(declare-fun e!37007 () Bool)

(assert (=> b!56227 (=> res!31632 e!37007)))

(declare-datatypes ((List!1409 0))(
  ( (Nil!1406) (Cons!1405 (h!1985 (_ BitVec 64)) (t!4687 List!1409)) )
))
(declare-fun lt!22172 () List!1409)

(declare-fun contains!666 (List!1409 (_ BitVec 64)) Bool)

(assert (=> b!56227 (= res!31632 (contains!666 lt!22172 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56228 () Bool)

(declare-fun e!37014 () Bool)

(declare-fun e!37006 () Bool)

(assert (=> b!56228 (= e!37014 e!37006)))

(declare-fun mapIsEmpty!2783 () Bool)

(assert (=> mapIsEmpty!2783 mapRes!2783))

(declare-fun b!56229 () Bool)

(declare-fun res!31629 () Bool)

(declare-fun e!37005 () Bool)

(assert (=> b!56229 (=> (not res!31629) (not e!37005))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56229 (= res!31629 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1977 (_keys!3630 (v!2348 (underlying!215 thiss!992)))))))))

(declare-fun mapIsEmpty!2784 () Bool)

(assert (=> mapIsEmpty!2784 mapRes!2784))

(declare-fun b!56230 () Bool)

(declare-fun res!31631 () Bool)

(assert (=> b!56230 (=> res!31631 e!37007)))

(declare-fun noDuplicate!45 (List!1409) Bool)

(assert (=> b!56230 (= res!31631 (not (noDuplicate!45 lt!22172)))))

(declare-fun res!31636 () Bool)

(assert (=> start!8376 (=> (not res!31636) (not e!37005))))

(declare-fun valid!253 (LongMap!408) Bool)

(assert (=> start!8376 (= res!31636 (valid!253 thiss!992))))

(assert (=> start!8376 e!37005))

(assert (=> start!8376 e!37014))

(assert (=> start!8376 true))

(assert (=> start!8376 e!37010))

(declare-fun b!56231 () Bool)

(declare-fun res!31633 () Bool)

(assert (=> b!56231 (=> res!31633 e!37007)))

(declare-fun arrayNoDuplicates!0 (array!3651 (_ BitVec 32) List!1409) Bool)

(assert (=> b!56231 (= res!31633 (not (arrayNoDuplicates!0 (_keys!3630 (v!2348 (underlying!215 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22172)))))

(declare-fun b!56232 () Bool)

(declare-fun res!31634 () Bool)

(assert (=> b!56232 (=> (not res!31634) (not e!37005))))

(assert (=> b!56232 (= res!31634 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5877 newMap!16)) (_size!345 (v!2348 (underlying!215 thiss!992)))))))

(declare-fun b!56233 () Bool)

(declare-fun e!37012 () Bool)

(assert (=> b!56233 (= e!37015 (and e!37012 mapRes!2783))))

(declare-fun condMapEmpty!2783 () Bool)

(declare-fun mapDefault!2783 () ValueCell!842)

(assert (=> b!56233 (= condMapEmpty!2783 (= (arr!1749 (_values!1993 (v!2348 (underlying!215 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!842)) mapDefault!2783)))))

(declare-fun b!56234 () Bool)

(assert (=> b!56234 (= e!37012 tp_is_empty!2371)))

(declare-fun mapNonEmpty!2784 () Bool)

(declare-fun tp!7829 () Bool)

(declare-fun e!37013 () Bool)

(assert (=> mapNonEmpty!2784 (= mapRes!2784 (and tp!7829 e!37013))))

(declare-fun mapKey!2784 () (_ BitVec 32))

(declare-fun mapRest!2783 () (Array (_ BitVec 32) ValueCell!842))

(declare-fun mapValue!2784 () ValueCell!842)

(assert (=> mapNonEmpty!2784 (= (arr!1749 (_values!1993 newMap!16)) (store mapRest!2783 mapKey!2784 mapValue!2784))))

(declare-fun b!56235 () Bool)

(assert (=> b!56235 (= e!37003 tp_is_empty!2371)))

(declare-fun b!56236 () Bool)

(declare-fun res!31630 () Bool)

(assert (=> b!56236 (=> (not res!31630) (not e!37005))))

(declare-fun valid!254 (LongMapFixedSize!592) Bool)

(assert (=> b!56236 (= res!31630 (valid!254 newMap!16))))

(declare-fun b!56237 () Bool)

(assert (=> b!56237 (= e!37006 e!37004)))

(declare-fun b!56238 () Bool)

(assert (=> b!56238 (= e!37013 tp_is_empty!2371)))

(declare-fun b!56239 () Bool)

(declare-fun e!37017 () Bool)

(assert (=> b!56239 (= e!37005 e!37017)))

(declare-fun res!31628 () Bool)

(assert (=> b!56239 (=> (not res!31628) (not e!37017))))

(declare-datatypes ((tuple2!1990 0))(
  ( (tuple2!1991 (_1!1006 (_ BitVec 64)) (_2!1006 V!2809)) )
))
(declare-datatypes ((List!1410 0))(
  ( (Nil!1407) (Cons!1406 (h!1986 tuple2!1990) (t!4688 List!1410)) )
))
(declare-datatypes ((ListLongMap!1329 0))(
  ( (ListLongMap!1330 (toList!680 List!1410)) )
))
(declare-fun lt!22171 () ListLongMap!1329)

(declare-fun lt!22169 () ListLongMap!1329)

(assert (=> b!56239 (= res!31628 (and (= lt!22171 lt!22169) (not (= (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1094 (LongMapFixedSize!592) ListLongMap!1329)

(assert (=> b!56239 (= lt!22169 (map!1094 newMap!16))))

(declare-fun getCurrentListMap!382 (array!3651 array!3653 (_ BitVec 32) (_ BitVec 32) V!2809 V!2809 (_ BitVec 32) Int) ListLongMap!1329)

(assert (=> b!56239 (= lt!22171 (getCurrentListMap!382 (_keys!3630 (v!2348 (underlying!215 thiss!992))) (_values!1993 (v!2348 (underlying!215 thiss!992))) (mask!5877 (v!2348 (underlying!215 thiss!992))) (extraKeys!1901 (v!2348 (underlying!215 thiss!992))) (zeroValue!1928 (v!2348 (underlying!215 thiss!992))) (minValue!1928 (v!2348 (underlying!215 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2010 (v!2348 (underlying!215 thiss!992)))))))

(declare-fun b!56240 () Bool)

(assert (=> b!56240 (= e!37007 true)))

(declare-fun lt!22167 () Bool)

(assert (=> b!56240 (= lt!22167 (contains!666 lt!22172 (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355)))))

(declare-fun b!56241 () Bool)

(declare-fun res!31626 () Bool)

(assert (=> b!56241 (=> res!31626 e!37007)))

(assert (=> b!56241 (= res!31626 (contains!666 lt!22172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56242 () Bool)

(declare-fun e!37009 () Bool)

(assert (=> b!56242 (= e!37009 (not e!37007))))

(declare-fun res!31627 () Bool)

(assert (=> b!56242 (=> res!31627 e!37007)))

(assert (=> b!56242 (= res!31627 (or (bvsge (size!1977 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1977 (_keys!3630 (v!2348 (underlying!215 thiss!992)))))))))

(assert (=> b!56242 (= lt!22172 (Cons!1405 (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) Nil!1406))))

(assert (=> b!56242 (arrayNoDuplicates!0 (_keys!3630 (v!2348 (underlying!215 thiss!992))) from!355 Nil!1406)))

(declare-datatypes ((Unit!1472 0))(
  ( (Unit!1473) )
))
(declare-fun lt!22168 () Unit!1472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3651 (_ BitVec 32) (_ BitVec 32)) Unit!1472)

(assert (=> b!56242 (= lt!22168 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3630 (v!2348 (underlying!215 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56242 (arrayContainsKey!0 (_keys!3630 (v!2348 (underlying!215 thiss!992))) (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22166 () Unit!1472)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!20 (array!3651 array!3653 (_ BitVec 32) (_ BitVec 32) V!2809 V!2809 (_ BitVec 64) (_ BitVec 32) Int) Unit!1472)

(assert (=> b!56242 (= lt!22166 (lemmaListMapContainsThenArrayContainsFrom!20 (_keys!3630 (v!2348 (underlying!215 thiss!992))) (_values!1993 (v!2348 (underlying!215 thiss!992))) (mask!5877 (v!2348 (underlying!215 thiss!992))) (extraKeys!1901 (v!2348 (underlying!215 thiss!992))) (zeroValue!1928 (v!2348 (underlying!215 thiss!992))) (minValue!1928 (v!2348 (underlying!215 thiss!992))) (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2010 (v!2348 (underlying!215 thiss!992)))))))

(declare-fun b!56243 () Bool)

(assert (=> b!56243 (= e!37017 e!37009)))

(declare-fun res!31635 () Bool)

(assert (=> b!56243 (=> (not res!31635) (not e!37009))))

(declare-fun contains!667 (ListLongMap!1329 (_ BitVec 64)) Bool)

(assert (=> b!56243 (= res!31635 (contains!667 lt!22169 (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1992 0))(
  ( (tuple2!1993 (_1!1007 Bool) (_2!1007 LongMapFixedSize!592)) )
))
(declare-fun lt!22170 () tuple2!1992)

(declare-fun update!81 (LongMapFixedSize!592 (_ BitVec 64) V!2809) tuple2!1992)

(declare-fun get!1054 (ValueCell!842 V!2809) V!2809)

(declare-fun dynLambda!299 (Int (_ BitVec 64)) V!2809)

(assert (=> b!56243 (= lt!22170 (update!81 newMap!16 (select (arr!1748 (_keys!3630 (v!2348 (underlying!215 thiss!992)))) from!355) (get!1054 (select (arr!1749 (_values!1993 (v!2348 (underlying!215 thiss!992)))) from!355) (dynLambda!299 (defaultEntry!2010 (v!2348 (underlying!215 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8376 res!31636) b!56229))

(assert (= (and b!56229 res!31629) b!56236))

(assert (= (and b!56236 res!31630) b!56232))

(assert (= (and b!56232 res!31634) b!56239))

(assert (= (and b!56239 res!31628) b!56243))

(assert (= (and b!56243 res!31635) b!56242))

(assert (= (and b!56242 (not res!31627)) b!56230))

(assert (= (and b!56230 (not res!31631)) b!56241))

(assert (= (and b!56241 (not res!31626)) b!56227))

(assert (= (and b!56227 (not res!31632)) b!56231))

(assert (= (and b!56231 (not res!31633)) b!56240))

(assert (= (and b!56233 condMapEmpty!2783) mapIsEmpty!2783))

(assert (= (and b!56233 (not condMapEmpty!2783)) mapNonEmpty!2783))

(get-info :version)

(assert (= (and mapNonEmpty!2783 ((_ is ValueCellFull!842) mapValue!2783)) b!56224))

(assert (= (and b!56233 ((_ is ValueCellFull!842) mapDefault!2783)) b!56234))

(assert (= b!56223 b!56233))

(assert (= b!56237 b!56223))

(assert (= b!56228 b!56237))

(assert (= start!8376 b!56228))

(assert (= (and b!56225 condMapEmpty!2784) mapIsEmpty!2784))

(assert (= (and b!56225 (not condMapEmpty!2784)) mapNonEmpty!2784))

(assert (= (and mapNonEmpty!2784 ((_ is ValueCellFull!842) mapValue!2784)) b!56238))

(assert (= (and b!56225 ((_ is ValueCellFull!842) mapDefault!2784)) b!56235))

(assert (= b!56226 b!56225))

(assert (= start!8376 b!56226))

(declare-fun b_lambda!2465 () Bool)

(assert (=> (not b_lambda!2465) (not b!56243)))

(declare-fun t!4684 () Bool)

(declare-fun tb!1253 () Bool)

(assert (=> (and b!56223 (= (defaultEntry!2010 (v!2348 (underlying!215 thiss!992))) (defaultEntry!2010 (v!2348 (underlying!215 thiss!992)))) t!4684) tb!1253))

(declare-fun result!2277 () Bool)

(assert (=> tb!1253 (= result!2277 tp_is_empty!2371)))

(assert (=> b!56243 t!4684))

(declare-fun b_and!3361 () Bool)

(assert (= b_and!3357 (and (=> t!4684 result!2277) b_and!3361)))

(declare-fun t!4686 () Bool)

(declare-fun tb!1255 () Bool)

(assert (=> (and b!56226 (= (defaultEntry!2010 newMap!16) (defaultEntry!2010 (v!2348 (underlying!215 thiss!992)))) t!4686) tb!1255))

(declare-fun result!2281 () Bool)

(assert (= result!2281 result!2277))

(assert (=> b!56243 t!4686))

(declare-fun b_and!3363 () Bool)

(assert (= b_and!3359 (and (=> t!4686 result!2281) b_and!3363)))

(declare-fun m!47281 () Bool)

(assert (=> b!56239 m!47281))

(declare-fun m!47283 () Bool)

(assert (=> b!56239 m!47283))

(declare-fun m!47285 () Bool)

(assert (=> b!56239 m!47285))

(declare-fun m!47287 () Bool)

(assert (=> b!56241 m!47287))

(declare-fun m!47289 () Bool)

(assert (=> b!56243 m!47289))

(declare-fun m!47291 () Bool)

(assert (=> b!56243 m!47291))

(declare-fun m!47293 () Bool)

(assert (=> b!56243 m!47293))

(assert (=> b!56243 m!47281))

(assert (=> b!56243 m!47291))

(assert (=> b!56243 m!47281))

(declare-fun m!47295 () Bool)

(assert (=> b!56243 m!47295))

(assert (=> b!56243 m!47281))

(assert (=> b!56243 m!47293))

(declare-fun m!47297 () Bool)

(assert (=> b!56243 m!47297))

(assert (=> b!56243 m!47289))

(declare-fun m!47299 () Bool)

(assert (=> b!56223 m!47299))

(declare-fun m!47301 () Bool)

(assert (=> b!56223 m!47301))

(assert (=> b!56240 m!47281))

(assert (=> b!56240 m!47281))

(declare-fun m!47303 () Bool)

(assert (=> b!56240 m!47303))

(declare-fun m!47305 () Bool)

(assert (=> b!56230 m!47305))

(declare-fun m!47307 () Bool)

(assert (=> b!56236 m!47307))

(declare-fun m!47309 () Bool)

(assert (=> b!56242 m!47309))

(declare-fun m!47311 () Bool)

(assert (=> b!56242 m!47311))

(assert (=> b!56242 m!47281))

(declare-fun m!47313 () Bool)

(assert (=> b!56242 m!47313))

(assert (=> b!56242 m!47281))

(assert (=> b!56242 m!47281))

(declare-fun m!47315 () Bool)

(assert (=> b!56242 m!47315))

(declare-fun m!47317 () Bool)

(assert (=> start!8376 m!47317))

(declare-fun m!47319 () Bool)

(assert (=> b!56231 m!47319))

(declare-fun m!47321 () Bool)

(assert (=> mapNonEmpty!2784 m!47321))

(declare-fun m!47323 () Bool)

(assert (=> b!56226 m!47323))

(declare-fun m!47325 () Bool)

(assert (=> b!56226 m!47325))

(declare-fun m!47327 () Bool)

(assert (=> mapNonEmpty!2783 m!47327))

(declare-fun m!47329 () Bool)

(assert (=> b!56227 m!47329))

(check-sat (not mapNonEmpty!2783) (not b!56223) (not b!56241) (not b_next!1909) (not b!56242) (not b!56230) (not b!56226) tp_is_empty!2371 (not b!56239) b_and!3361 (not b!56231) (not b!56227) (not mapNonEmpty!2784) (not b!56243) (not b_next!1911) b_and!3363 (not b!56240) (not b_lambda!2465) (not start!8376) (not b!56236))
(check-sat b_and!3361 b_and!3363 (not b_next!1909) (not b_next!1911))
