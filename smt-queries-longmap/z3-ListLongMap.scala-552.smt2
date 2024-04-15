; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14706 () Bool)

(assert start!14706)

(declare-fun b!139497 () Bool)

(declare-fun b_free!3013 () Bool)

(declare-fun b_next!3013 () Bool)

(assert (=> b!139497 (= b_free!3013 (not b_next!3013))))

(declare-fun tp!11509 () Bool)

(declare-fun b_and!8669 () Bool)

(assert (=> b!139497 (= tp!11509 b_and!8669)))

(declare-fun b!139504 () Bool)

(declare-fun b_free!3015 () Bool)

(declare-fun b_next!3015 () Bool)

(assert (=> b!139504 (= b_free!3015 (not b_next!3015))))

(declare-fun tp!11511 () Bool)

(declare-fun b_and!8671 () Bool)

(assert (=> b!139504 (= tp!11511 b_and!8671)))

(declare-fun b!139489 () Bool)

(declare-fun res!66655 () Bool)

(declare-fun e!90914 () Bool)

(assert (=> b!139489 (=> (not res!66655) (not e!90914))))

(declare-datatypes ((V!3545 0))(
  ( (V!3546 (val!1506 Int)) )
))
(declare-datatypes ((array!4861 0))(
  ( (array!4862 (arr!2296 (Array (_ BitVec 32) (_ BitVec 64))) (size!2569 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1118 0))(
  ( (ValueCellFull!1118 (v!3266 V!3545)) (EmptyCell!1118) )
))
(declare-datatypes ((array!4863 0))(
  ( (array!4864 (arr!2297 (Array (_ BitVec 32) ValueCell!1118)) (size!2570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1144 0))(
  ( (LongMapFixedSize!1145 (defaultEntry!2936 Int) (mask!7273 (_ BitVec 32)) (extraKeys!2691 (_ BitVec 32)) (zeroValue!2786 V!3545) (minValue!2786 V!3545) (_size!621 (_ BitVec 32)) (_keys!4694 array!4861) (_values!2919 array!4863) (_vacant!621 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1144)

(declare-fun valid!555 (LongMapFixedSize!1144) Bool)

(assert (=> b!139489 (= res!66655 (valid!555 newMap!16))))

(declare-fun b!139490 () Bool)

(declare-fun e!90915 () Bool)

(assert (=> b!139490 (= e!90914 e!90915)))

(declare-fun res!66651 () Bool)

(assert (=> b!139490 (=> (not res!66651) (not e!90915))))

(declare-datatypes ((Cell!924 0))(
  ( (Cell!925 (v!3267 LongMapFixedSize!1144)) )
))
(declare-datatypes ((LongMap!924 0))(
  ( (LongMap!925 (underlying!473 Cell!924)) )
))
(declare-fun thiss!992 () LongMap!924)

(declare-datatypes ((tuple2!2646 0))(
  ( (tuple2!2647 (_1!1334 (_ BitVec 64)) (_2!1334 V!3545)) )
))
(declare-datatypes ((List!1734 0))(
  ( (Nil!1731) (Cons!1730 (h!2337 tuple2!2646) (t!6297 List!1734)) )
))
(declare-datatypes ((ListLongMap!1705 0))(
  ( (ListLongMap!1706 (toList!868 List!1734)) )
))
(declare-fun lt!72871 () ListLongMap!1705)

(declare-fun lt!72873 () ListLongMap!1705)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!139490 (= res!66651 (and (= lt!72873 lt!72871) (not (= (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1420 (LongMapFixedSize!1144) ListLongMap!1705)

(assert (=> b!139490 (= lt!72871 (map!1420 newMap!16))))

(declare-fun getCurrentListMap!532 (array!4861 array!4863 (_ BitVec 32) (_ BitVec 32) V!3545 V!3545 (_ BitVec 32) Int) ListLongMap!1705)

(assert (=> b!139490 (= lt!72873 (getCurrentListMap!532 (_keys!4694 (v!3267 (underlying!473 thiss!992))) (_values!2919 (v!3267 (underlying!473 thiss!992))) (mask!7273 (v!3267 (underlying!473 thiss!992))) (extraKeys!2691 (v!3267 (underlying!473 thiss!992))) (zeroValue!2786 (v!3267 (underlying!473 thiss!992))) (minValue!2786 (v!3267 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2936 (v!3267 (underlying!473 thiss!992)))))))

(declare-fun b!139491 () Bool)

(declare-fun e!90919 () Bool)

(declare-fun e!90923 () Bool)

(declare-fun mapRes!4809 () Bool)

(assert (=> b!139491 (= e!90919 (and e!90923 mapRes!4809))))

(declare-fun condMapEmpty!4809 () Bool)

(declare-fun mapDefault!4809 () ValueCell!1118)

(assert (=> b!139491 (= condMapEmpty!4809 (= (arr!2297 (_values!2919 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1118)) mapDefault!4809)))))

(declare-fun mapNonEmpty!4809 () Bool)

(declare-fun tp!11512 () Bool)

(declare-fun e!90924 () Bool)

(assert (=> mapNonEmpty!4809 (= mapRes!4809 (and tp!11512 e!90924))))

(declare-fun mapValue!4810 () ValueCell!1118)

(declare-fun mapRest!4810 () (Array (_ BitVec 32) ValueCell!1118))

(declare-fun mapKey!4810 () (_ BitVec 32))

(assert (=> mapNonEmpty!4809 (= (arr!2297 (_values!2919 newMap!16)) (store mapRest!4810 mapKey!4810 mapValue!4810))))

(declare-fun b!139493 () Bool)

(declare-fun e!90912 () Bool)

(declare-fun tp_is_empty!2923 () Bool)

(assert (=> b!139493 (= e!90912 tp_is_empty!2923)))

(declare-fun b!139494 () Bool)

(declare-fun e!90925 () Bool)

(declare-fun e!90917 () Bool)

(assert (=> b!139494 (= e!90925 e!90917)))

(declare-fun b!139495 () Bool)

(declare-fun e!90913 () Bool)

(assert (=> b!139495 (= e!90913 tp_is_empty!2923)))

(declare-fun b!139496 () Bool)

(assert (=> b!139496 (= e!90924 tp_is_empty!2923)))

(declare-fun e!90921 () Bool)

(declare-fun array_inv!1467 (array!4861) Bool)

(declare-fun array_inv!1468 (array!4863) Bool)

(assert (=> b!139497 (= e!90917 (and tp!11509 tp_is_empty!2923 (array_inv!1467 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) (array_inv!1468 (_values!2919 (v!3267 (underlying!473 thiss!992)))) e!90921))))

(declare-fun mapNonEmpty!4810 () Bool)

(declare-fun mapRes!4810 () Bool)

(declare-fun tp!11510 () Bool)

(assert (=> mapNonEmpty!4810 (= mapRes!4810 (and tp!11510 e!90912))))

(declare-fun mapRest!4809 () (Array (_ BitVec 32) ValueCell!1118))

(declare-fun mapValue!4809 () ValueCell!1118)

(declare-fun mapKey!4809 () (_ BitVec 32))

(assert (=> mapNonEmpty!4810 (= (arr!2297 (_values!2919 (v!3267 (underlying!473 thiss!992)))) (store mapRest!4809 mapKey!4809 mapValue!4809))))

(declare-fun b!139498 () Bool)

(declare-fun e!90920 () Bool)

(assert (=> b!139498 (= e!90920 (not (or (bvsge (size!2569 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1735 0))(
  ( (Nil!1732) (Cons!1731 (h!2338 (_ BitVec 64)) (t!6298 List!1735)) )
))
(declare-fun arrayNoDuplicates!0 (array!4861 (_ BitVec 32) List!1735) Bool)

(assert (=> b!139498 (arrayNoDuplicates!0 (_keys!4694 (v!3267 (underlying!473 thiss!992))) from!355 Nil!1732)))

(declare-datatypes ((Unit!4389 0))(
  ( (Unit!4390) )
))
(declare-fun lt!72874 () Unit!4389)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4861 (_ BitVec 32) (_ BitVec 32)) Unit!4389)

(assert (=> b!139498 (= lt!72874 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4694 (v!3267 (underlying!473 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139498 (arrayContainsKey!0 (_keys!4694 (v!3267 (underlying!473 thiss!992))) (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72870 () Unit!4389)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!142 (array!4861 array!4863 (_ BitVec 32) (_ BitVec 32) V!3545 V!3545 (_ BitVec 64) (_ BitVec 32) Int) Unit!4389)

(assert (=> b!139498 (= lt!72870 (lemmaListMapContainsThenArrayContainsFrom!142 (_keys!4694 (v!3267 (underlying!473 thiss!992))) (_values!2919 (v!3267 (underlying!473 thiss!992))) (mask!7273 (v!3267 (underlying!473 thiss!992))) (extraKeys!2691 (v!3267 (underlying!473 thiss!992))) (zeroValue!2786 (v!3267 (underlying!473 thiss!992))) (minValue!2786 (v!3267 (underlying!473 thiss!992))) (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2936 (v!3267 (underlying!473 thiss!992)))))))

(declare-fun b!139492 () Bool)

(assert (=> b!139492 (= e!90923 tp_is_empty!2923)))

(declare-fun res!66652 () Bool)

(assert (=> start!14706 (=> (not res!66652) (not e!90914))))

(declare-fun valid!556 (LongMap!924) Bool)

(assert (=> start!14706 (= res!66652 (valid!556 thiss!992))))

(assert (=> start!14706 e!90914))

(declare-fun e!90918 () Bool)

(assert (=> start!14706 e!90918))

(assert (=> start!14706 true))

(declare-fun e!90916 () Bool)

(assert (=> start!14706 e!90916))

(declare-fun b!139499 () Bool)

(assert (=> b!139499 (= e!90921 (and e!90913 mapRes!4810))))

(declare-fun condMapEmpty!4810 () Bool)

(declare-fun mapDefault!4810 () ValueCell!1118)

(assert (=> b!139499 (= condMapEmpty!4810 (= (arr!2297 (_values!2919 (v!3267 (underlying!473 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1118)) mapDefault!4810)))))

(declare-fun b!139500 () Bool)

(declare-fun res!66653 () Bool)

(assert (=> b!139500 (=> (not res!66653) (not e!90914))))

(assert (=> b!139500 (= res!66653 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7273 newMap!16)) (_size!621 (v!3267 (underlying!473 thiss!992)))))))

(declare-fun mapIsEmpty!4809 () Bool)

(assert (=> mapIsEmpty!4809 mapRes!4810))

(declare-fun b!139501 () Bool)

(declare-fun res!66650 () Bool)

(assert (=> b!139501 (=> (not res!66650) (not e!90914))))

(assert (=> b!139501 (= res!66650 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2569 (_keys!4694 (v!3267 (underlying!473 thiss!992)))))))))

(declare-fun b!139502 () Bool)

(assert (=> b!139502 (= e!90915 e!90920)))

(declare-fun res!66654 () Bool)

(assert (=> b!139502 (=> (not res!66654) (not e!90920))))

(declare-fun contains!908 (ListLongMap!1705 (_ BitVec 64)) Bool)

(assert (=> b!139502 (= res!66654 (contains!908 lt!72871 (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2648 0))(
  ( (tuple2!2649 (_1!1335 Bool) (_2!1335 LongMapFixedSize!1144)) )
))
(declare-fun lt!72872 () tuple2!2648)

(declare-fun update!206 (LongMapFixedSize!1144 (_ BitVec 64) V!3545) tuple2!2648)

(declare-fun get!1519 (ValueCell!1118 V!3545) V!3545)

(declare-fun dynLambda!432 (Int (_ BitVec 64)) V!3545)

(assert (=> b!139502 (= lt!72872 (update!206 newMap!16 (select (arr!2296 (_keys!4694 (v!3267 (underlying!473 thiss!992)))) from!355) (get!1519 (select (arr!2297 (_values!2919 (v!3267 (underlying!473 thiss!992)))) from!355) (dynLambda!432 (defaultEntry!2936 (v!3267 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!139503 () Bool)

(assert (=> b!139503 (= e!90918 e!90925)))

(declare-fun mapIsEmpty!4810 () Bool)

(assert (=> mapIsEmpty!4810 mapRes!4809))

(assert (=> b!139504 (= e!90916 (and tp!11511 tp_is_empty!2923 (array_inv!1467 (_keys!4694 newMap!16)) (array_inv!1468 (_values!2919 newMap!16)) e!90919))))

(assert (= (and start!14706 res!66652) b!139501))

(assert (= (and b!139501 res!66650) b!139489))

(assert (= (and b!139489 res!66655) b!139500))

(assert (= (and b!139500 res!66653) b!139490))

(assert (= (and b!139490 res!66651) b!139502))

(assert (= (and b!139502 res!66654) b!139498))

(assert (= (and b!139499 condMapEmpty!4810) mapIsEmpty!4809))

(assert (= (and b!139499 (not condMapEmpty!4810)) mapNonEmpty!4810))

(get-info :version)

(assert (= (and mapNonEmpty!4810 ((_ is ValueCellFull!1118) mapValue!4809)) b!139493))

(assert (= (and b!139499 ((_ is ValueCellFull!1118) mapDefault!4810)) b!139495))

(assert (= b!139497 b!139499))

(assert (= b!139494 b!139497))

(assert (= b!139503 b!139494))

(assert (= start!14706 b!139503))

(assert (= (and b!139491 condMapEmpty!4809) mapIsEmpty!4810))

(assert (= (and b!139491 (not condMapEmpty!4809)) mapNonEmpty!4809))

(assert (= (and mapNonEmpty!4809 ((_ is ValueCellFull!1118) mapValue!4810)) b!139496))

(assert (= (and b!139491 ((_ is ValueCellFull!1118) mapDefault!4809)) b!139492))

(assert (= b!139504 b!139491))

(assert (= start!14706 b!139504))

(declare-fun b_lambda!6229 () Bool)

(assert (=> (not b_lambda!6229) (not b!139502)))

(declare-fun t!6294 () Bool)

(declare-fun tb!2525 () Bool)

(assert (=> (and b!139497 (= (defaultEntry!2936 (v!3267 (underlying!473 thiss!992))) (defaultEntry!2936 (v!3267 (underlying!473 thiss!992)))) t!6294) tb!2525))

(declare-fun result!4149 () Bool)

(assert (=> tb!2525 (= result!4149 tp_is_empty!2923)))

(assert (=> b!139502 t!6294))

(declare-fun b_and!8673 () Bool)

(assert (= b_and!8669 (and (=> t!6294 result!4149) b_and!8673)))

(declare-fun tb!2527 () Bool)

(declare-fun t!6296 () Bool)

(assert (=> (and b!139504 (= (defaultEntry!2936 newMap!16) (defaultEntry!2936 (v!3267 (underlying!473 thiss!992)))) t!6296) tb!2527))

(declare-fun result!4153 () Bool)

(assert (= result!4153 result!4149))

(assert (=> b!139502 t!6296))

(declare-fun b_and!8675 () Bool)

(assert (= b_and!8671 (and (=> t!6296 result!4153) b_and!8675)))

(declare-fun m!166283 () Bool)

(assert (=> b!139502 m!166283))

(declare-fun m!166285 () Bool)

(assert (=> b!139502 m!166285))

(declare-fun m!166287 () Bool)

(assert (=> b!139502 m!166287))

(declare-fun m!166289 () Bool)

(assert (=> b!139502 m!166289))

(assert (=> b!139502 m!166289))

(declare-fun m!166291 () Bool)

(assert (=> b!139502 m!166291))

(assert (=> b!139502 m!166285))

(assert (=> b!139502 m!166289))

(assert (=> b!139502 m!166287))

(declare-fun m!166293 () Bool)

(assert (=> b!139502 m!166293))

(assert (=> b!139502 m!166283))

(declare-fun m!166295 () Bool)

(assert (=> mapNonEmpty!4809 m!166295))

(declare-fun m!166297 () Bool)

(assert (=> b!139504 m!166297))

(declare-fun m!166299 () Bool)

(assert (=> b!139504 m!166299))

(declare-fun m!166301 () Bool)

(assert (=> start!14706 m!166301))

(declare-fun m!166303 () Bool)

(assert (=> mapNonEmpty!4810 m!166303))

(declare-fun m!166305 () Bool)

(assert (=> b!139489 m!166305))

(assert (=> b!139490 m!166289))

(declare-fun m!166307 () Bool)

(assert (=> b!139490 m!166307))

(declare-fun m!166309 () Bool)

(assert (=> b!139490 m!166309))

(declare-fun m!166311 () Bool)

(assert (=> b!139498 m!166311))

(declare-fun m!166313 () Bool)

(assert (=> b!139498 m!166313))

(assert (=> b!139498 m!166289))

(declare-fun m!166315 () Bool)

(assert (=> b!139498 m!166315))

(assert (=> b!139498 m!166289))

(assert (=> b!139498 m!166289))

(declare-fun m!166317 () Bool)

(assert (=> b!139498 m!166317))

(declare-fun m!166319 () Bool)

(assert (=> b!139497 m!166319))

(declare-fun m!166321 () Bool)

(assert (=> b!139497 m!166321))

(check-sat (not b!139497) (not b_lambda!6229) b_and!8675 (not b_next!3013) (not mapNonEmpty!4809) (not b!139504) (not b!139498) b_and!8673 (not b!139490) (not b_next!3015) (not mapNonEmpty!4810) (not b!139502) tp_is_empty!2923 (not start!14706) (not b!139489))
(check-sat b_and!8673 b_and!8675 (not b_next!3013) (not b_next!3015))
