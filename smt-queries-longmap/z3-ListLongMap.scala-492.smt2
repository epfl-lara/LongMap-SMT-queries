; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11104 () Bool)

(assert start!11104)

(declare-fun b!90403 () Bool)

(declare-fun b_free!2293 () Bool)

(declare-fun b_next!2293 () Bool)

(assert (=> b!90403 (= b_free!2293 (not b_next!2293))))

(declare-fun tp!9127 () Bool)

(declare-fun b_and!5437 () Bool)

(assert (=> b!90403 (= tp!9127 b_and!5437)))

(declare-fun b!90394 () Bool)

(declare-fun b_free!2295 () Bool)

(declare-fun b_next!2295 () Bool)

(assert (=> b!90394 (= b_free!2295 (not b_next!2295))))

(declare-fun tp!9129 () Bool)

(declare-fun b_and!5439 () Bool)

(assert (=> b!90394 (= tp!9129 b_and!5439)))

(declare-fun b!90391 () Bool)

(declare-fun res!46133 () Bool)

(declare-fun e!58879 () Bool)

(assert (=> b!90391 (=> (not res!46133) (not e!58879))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3065 0))(
  ( (V!3066 (val!1326 Int)) )
))
(declare-datatypes ((array!4073 0))(
  ( (array!4074 (arr!1936 (Array (_ BitVec 32) (_ BitVec 64))) (size!2184 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!938 0))(
  ( (ValueCellFull!938 (v!2692 V!3065)) (EmptyCell!938) )
))
(declare-datatypes ((array!4075 0))(
  ( (array!4076 (arr!1937 (Array (_ BitVec 32) ValueCell!938)) (size!2185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!784 0))(
  ( (LongMapFixedSize!785 (defaultEntry!2393 Int) (mask!6446 (_ BitVec 32)) (extraKeys!2224 (_ BitVec 32)) (zeroValue!2281 V!3065) (minValue!2281 V!3065) (_size!441 (_ BitVec 32)) (_keys!4072 array!4073) (_values!2376 array!4075) (_vacant!441 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!576 0))(
  ( (Cell!577 (v!2693 LongMapFixedSize!784)) )
))
(declare-datatypes ((LongMap!576 0))(
  ( (LongMap!577 (underlying!299 Cell!576)) )
))
(declare-fun thiss!992 () LongMap!576)

(assert (=> b!90391 (= res!46133 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2184 (_keys!4072 (v!2693 (underlying!299 thiss!992)))))))))

(declare-fun b!90392 () Bool)

(declare-fun e!58877 () Bool)

(declare-fun tp_is_empty!2563 () Bool)

(assert (=> b!90392 (= e!58877 tp_is_empty!2563)))

(declare-fun b!90393 () Bool)

(declare-datatypes ((Unit!2691 0))(
  ( (Unit!2692) )
))
(declare-fun e!58875 () Unit!2691)

(declare-fun Unit!2693 () Unit!2691)

(assert (=> b!90393 (= e!58875 Unit!2693)))

(declare-fun lt!43741 () Unit!2691)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!76 (array!4073 array!4075 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 64) (_ BitVec 32) Int) Unit!2691)

(assert (=> b!90393 (= lt!43741 (lemmaListMapContainsThenArrayContainsFrom!76 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (_values!2376 (v!2693 (underlying!299 thiss!992))) (mask!6446 (v!2693 (underlying!299 thiss!992))) (extraKeys!2224 (v!2693 (underlying!299 thiss!992))) (zeroValue!2281 (v!2693 (underlying!299 thiss!992))) (minValue!2281 (v!2693 (underlying!299 thiss!992))) (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90393 (arrayContainsKey!0 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43751 () Unit!2691)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4073 (_ BitVec 32) (_ BitVec 32)) Unit!2691)

(assert (=> b!90393 (= lt!43751 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4072 (v!2693 (underlying!299 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1546 0))(
  ( (Nil!1543) (Cons!1542 (h!2134 (_ BitVec 64)) (t!5335 List!1546)) )
))
(declare-fun arrayNoDuplicates!0 (array!4073 (_ BitVec 32) List!1546) Bool)

(assert (=> b!90393 (arrayNoDuplicates!0 (_keys!4072 (v!2693 (underlying!299 thiss!992))) from!355 Nil!1543)))

(declare-fun lt!43734 () Unit!2691)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4073 (_ BitVec 32) (_ BitVec 64) List!1546) Unit!2691)

(assert (=> b!90393 (= lt!43734 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) (Cons!1542 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) Nil!1543)))))

(assert (=> b!90393 false))

(declare-fun mapIsEmpty!3507 () Bool)

(declare-fun mapRes!3507 () Bool)

(assert (=> mapIsEmpty!3507 mapRes!3507))

(declare-fun e!58869 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!784)

(declare-fun e!58881 () Bool)

(declare-fun array_inv!1213 (array!4073) Bool)

(declare-fun array_inv!1214 (array!4075) Bool)

(assert (=> b!90394 (= e!58869 (and tp!9129 tp_is_empty!2563 (array_inv!1213 (_keys!4072 newMap!16)) (array_inv!1214 (_values!2376 newMap!16)) e!58881))))

(declare-fun b!90395 () Bool)

(declare-fun res!46136 () Bool)

(assert (=> b!90395 (=> (not res!46136) (not e!58879))))

(assert (=> b!90395 (= res!46136 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6446 newMap!16)) (_size!441 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun b!90396 () Bool)

(declare-fun e!58882 () Bool)

(declare-fun e!58868 () Bool)

(assert (=> b!90396 (= e!58882 e!58868)))

(declare-fun b!90397 () Bool)

(declare-fun res!46137 () Bool)

(assert (=> b!90397 (=> (not res!46137) (not e!58879))))

(declare-fun valid!353 (LongMapFixedSize!784) Bool)

(assert (=> b!90397 (= res!46137 (valid!353 newMap!16))))

(declare-fun b!90398 () Bool)

(declare-fun e!58870 () Bool)

(assert (=> b!90398 (= e!58870 (not true))))

(declare-datatypes ((tuple2!2240 0))(
  ( (tuple2!2241 (_1!1131 (_ BitVec 64)) (_2!1131 V!3065)) )
))
(declare-datatypes ((List!1547 0))(
  ( (Nil!1544) (Cons!1543 (h!2135 tuple2!2240) (t!5336 List!1547)) )
))
(declare-datatypes ((ListLongMap!1471 0))(
  ( (ListLongMap!1472 (toList!751 List!1547)) )
))
(declare-fun lt!43739 () ListLongMap!1471)

(declare-datatypes ((tuple2!2242 0))(
  ( (tuple2!2243 (_1!1132 Bool) (_2!1132 LongMapFixedSize!784)) )
))
(declare-fun lt!43748 () tuple2!2242)

(declare-fun map!1204 (LongMapFixedSize!784) ListLongMap!1471)

(assert (=> b!90398 (= lt!43739 (map!1204 (_2!1132 lt!43748)))))

(declare-fun lt!43737 () ListLongMap!1471)

(declare-fun getCurrentListMap!434 (array!4073 array!4075 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 32) Int) ListLongMap!1471)

(assert (=> b!90398 (= lt!43737 (getCurrentListMap!434 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (_values!2376 (v!2693 (underlying!299 thiss!992))) (mask!6446 (v!2693 (underlying!299 thiss!992))) (extraKeys!2224 (v!2693 (underlying!299 thiss!992))) (zeroValue!2281 (v!2693 (underlying!299 thiss!992))) (minValue!2281 (v!2693 (underlying!299 thiss!992))) from!355 (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun lt!43736 () ListLongMap!1471)

(declare-fun lt!43740 () tuple2!2240)

(declare-fun lt!43752 () ListLongMap!1471)

(declare-fun lt!43749 () tuple2!2240)

(declare-fun +!116 (ListLongMap!1471 tuple2!2240) ListLongMap!1471)

(assert (=> b!90398 (= (+!116 lt!43752 lt!43749) (+!116 (+!116 lt!43736 lt!43749) lt!43740))))

(assert (=> b!90398 (= lt!43749 (tuple2!2241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2281 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun lt!43746 () Unit!2691)

(declare-fun lt!43735 () V!3065)

(declare-fun addCommutativeForDiffKeys!35 (ListLongMap!1471 (_ BitVec 64) V!3065 (_ BitVec 64) V!3065) Unit!2691)

(assert (=> b!90398 (= lt!43746 (addCommutativeForDiffKeys!35 lt!43736 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) lt!43735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2281 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun lt!43750 () ListLongMap!1471)

(assert (=> b!90398 (= lt!43750 lt!43752)))

(assert (=> b!90398 (= lt!43752 (+!116 lt!43736 lt!43740))))

(declare-fun lt!43745 () ListLongMap!1471)

(declare-fun lt!43744 () tuple2!2240)

(assert (=> b!90398 (= lt!43750 (+!116 lt!43745 lt!43744))))

(declare-fun lt!43742 () ListLongMap!1471)

(assert (=> b!90398 (= lt!43736 (+!116 lt!43742 lt!43744))))

(assert (=> b!90398 (= lt!43744 (tuple2!2241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2281 (v!2693 (underlying!299 thiss!992)))))))

(assert (=> b!90398 (= lt!43745 (+!116 lt!43742 lt!43740))))

(assert (=> b!90398 (= lt!43740 (tuple2!2241 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) lt!43735))))

(declare-fun lt!43747 () Unit!2691)

(assert (=> b!90398 (= lt!43747 (addCommutativeForDiffKeys!35 lt!43742 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) lt!43735 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2281 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!80 (array!4073 array!4075 (_ BitVec 32) (_ BitVec 32) V!3065 V!3065 (_ BitVec 32) Int) ListLongMap!1471)

(assert (=> b!90398 (= lt!43742 (getCurrentListMapNoExtraKeys!80 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (_values!2376 (v!2693 (underlying!299 thiss!992))) (mask!6446 (v!2693 (underlying!299 thiss!992))) (extraKeys!2224 (v!2693 (underlying!299 thiss!992))) (zeroValue!2281 (v!2693 (underlying!299 thiss!992))) (minValue!2281 (v!2693 (underlying!299 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun b!90399 () Bool)

(declare-fun Unit!2694 () Unit!2691)

(assert (=> b!90399 (= e!58875 Unit!2694)))

(declare-fun b!90400 () Bool)

(declare-fun e!58874 () Bool)

(assert (=> b!90400 (= e!58879 e!58874)))

(declare-fun res!46139 () Bool)

(assert (=> b!90400 (=> (not res!46139) (not e!58874))))

(declare-fun lt!43733 () ListLongMap!1471)

(declare-fun lt!43743 () ListLongMap!1471)

(assert (=> b!90400 (= res!46139 (= lt!43733 lt!43743))))

(assert (=> b!90400 (= lt!43743 (map!1204 newMap!16))))

(assert (=> b!90400 (= lt!43733 (getCurrentListMap!434 (_keys!4072 (v!2693 (underlying!299 thiss!992))) (_values!2376 (v!2693 (underlying!299 thiss!992))) (mask!6446 (v!2693 (underlying!299 thiss!992))) (extraKeys!2224 (v!2693 (underlying!299 thiss!992))) (zeroValue!2281 (v!2693 (underlying!299 thiss!992))) (minValue!2281 (v!2693 (underlying!299 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))))))

(declare-fun b!90401 () Bool)

(declare-fun e!58876 () Bool)

(assert (=> b!90401 (= e!58876 e!58870)))

(declare-fun res!46135 () Bool)

(assert (=> b!90401 (=> (not res!46135) (not e!58870))))

(assert (=> b!90401 (= res!46135 (and (_1!1132 lt!43748) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43738 () Unit!2691)

(assert (=> b!90401 (= lt!43738 e!58875)))

(declare-fun c!15025 () Bool)

(declare-fun contains!767 (ListLongMap!1471 (_ BitVec 64)) Bool)

(assert (=> b!90401 (= c!15025 (contains!767 lt!43743 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355)))))

(declare-fun update!129 (LongMapFixedSize!784 (_ BitVec 64) V!3065) tuple2!2242)

(assert (=> b!90401 (= lt!43748 (update!129 newMap!16 (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) lt!43735))))

(declare-fun b!90402 () Bool)

(declare-fun e!58871 () Bool)

(assert (=> b!90402 (= e!58871 tp_is_empty!2563)))

(declare-fun mapNonEmpty!3507 () Bool)

(declare-fun mapRes!3508 () Bool)

(declare-fun tp!9128 () Bool)

(declare-fun e!58883 () Bool)

(assert (=> mapNonEmpty!3507 (= mapRes!3508 (and tp!9128 e!58883))))

(declare-fun mapKey!3507 () (_ BitVec 32))

(declare-fun mapValue!3508 () ValueCell!938)

(declare-fun mapRest!3507 () (Array (_ BitVec 32) ValueCell!938))

(assert (=> mapNonEmpty!3507 (= (arr!1937 (_values!2376 newMap!16)) (store mapRest!3507 mapKey!3507 mapValue!3508))))

(declare-fun b!90390 () Bool)

(assert (=> b!90390 (= e!58883 tp_is_empty!2563)))

(declare-fun res!46134 () Bool)

(assert (=> start!11104 (=> (not res!46134) (not e!58879))))

(declare-fun valid!354 (LongMap!576) Bool)

(assert (=> start!11104 (= res!46134 (valid!354 thiss!992))))

(assert (=> start!11104 e!58879))

(assert (=> start!11104 e!58882))

(assert (=> start!11104 true))

(assert (=> start!11104 e!58869))

(declare-fun mapNonEmpty!3508 () Bool)

(declare-fun tp!9130 () Bool)

(assert (=> mapNonEmpty!3508 (= mapRes!3507 (and tp!9130 e!58871))))

(declare-fun mapRest!3508 () (Array (_ BitVec 32) ValueCell!938))

(declare-fun mapKey!3508 () (_ BitVec 32))

(declare-fun mapValue!3507 () ValueCell!938)

(assert (=> mapNonEmpty!3508 (= (arr!1937 (_values!2376 (v!2693 (underlying!299 thiss!992)))) (store mapRest!3508 mapKey!3508 mapValue!3507))))

(declare-fun e!58873 () Bool)

(declare-fun e!58878 () Bool)

(assert (=> b!90403 (= e!58873 (and tp!9127 tp_is_empty!2563 (array_inv!1213 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) (array_inv!1214 (_values!2376 (v!2693 (underlying!299 thiss!992)))) e!58878))))

(declare-fun b!90404 () Bool)

(assert (=> b!90404 (= e!58878 (and e!58877 mapRes!3507))))

(declare-fun condMapEmpty!3508 () Bool)

(declare-fun mapDefault!3507 () ValueCell!938)

(assert (=> b!90404 (= condMapEmpty!3508 (= (arr!1937 (_values!2376 (v!2693 (underlying!299 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!938)) mapDefault!3507)))))

(declare-fun b!90405 () Bool)

(declare-fun e!58867 () Bool)

(assert (=> b!90405 (= e!58867 tp_is_empty!2563)))

(declare-fun b!90406 () Bool)

(assert (=> b!90406 (= e!58874 e!58876)))

(declare-fun res!46138 () Bool)

(assert (=> b!90406 (=> (not res!46138) (not e!58876))))

(assert (=> b!90406 (= res!46138 (and (not (= (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1936 (_keys!4072 (v!2693 (underlying!299 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1230 (ValueCell!938 V!3065) V!3065)

(declare-fun dynLambda!352 (Int (_ BitVec 64)) V!3065)

(assert (=> b!90406 (= lt!43735 (get!1230 (select (arr!1937 (_values!2376 (v!2693 (underlying!299 thiss!992)))) from!355) (dynLambda!352 (defaultEntry!2393 (v!2693 (underlying!299 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90407 () Bool)

(assert (=> b!90407 (= e!58881 (and e!58867 mapRes!3508))))

(declare-fun condMapEmpty!3507 () Bool)

(declare-fun mapDefault!3508 () ValueCell!938)

(assert (=> b!90407 (= condMapEmpty!3507 (= (arr!1937 (_values!2376 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!938)) mapDefault!3508)))))

(declare-fun b!90408 () Bool)

(assert (=> b!90408 (= e!58868 e!58873)))

(declare-fun mapIsEmpty!3508 () Bool)

(assert (=> mapIsEmpty!3508 mapRes!3508))

(assert (= (and start!11104 res!46134) b!90391))

(assert (= (and b!90391 res!46133) b!90397))

(assert (= (and b!90397 res!46137) b!90395))

(assert (= (and b!90395 res!46136) b!90400))

(assert (= (and b!90400 res!46139) b!90406))

(assert (= (and b!90406 res!46138) b!90401))

(assert (= (and b!90401 c!15025) b!90393))

(assert (= (and b!90401 (not c!15025)) b!90399))

(assert (= (and b!90401 res!46135) b!90398))

(assert (= (and b!90404 condMapEmpty!3508) mapIsEmpty!3507))

(assert (= (and b!90404 (not condMapEmpty!3508)) mapNonEmpty!3508))

(get-info :version)

(assert (= (and mapNonEmpty!3508 ((_ is ValueCellFull!938) mapValue!3507)) b!90402))

(assert (= (and b!90404 ((_ is ValueCellFull!938) mapDefault!3507)) b!90392))

(assert (= b!90403 b!90404))

(assert (= b!90408 b!90403))

(assert (= b!90396 b!90408))

(assert (= start!11104 b!90396))

(assert (= (and b!90407 condMapEmpty!3507) mapIsEmpty!3508))

(assert (= (and b!90407 (not condMapEmpty!3507)) mapNonEmpty!3507))

(assert (= (and mapNonEmpty!3507 ((_ is ValueCellFull!938) mapValue!3508)) b!90390))

(assert (= (and b!90407 ((_ is ValueCellFull!938) mapDefault!3508)) b!90405))

(assert (= b!90394 b!90407))

(assert (= start!11104 b!90394))

(declare-fun b_lambda!3989 () Bool)

(assert (=> (not b_lambda!3989) (not b!90406)))

(declare-fun t!5332 () Bool)

(declare-fun tb!1757 () Bool)

(assert (=> (and b!90403 (= (defaultEntry!2393 (v!2693 (underlying!299 thiss!992))) (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))) t!5332) tb!1757))

(declare-fun result!3017 () Bool)

(assert (=> tb!1757 (= result!3017 tp_is_empty!2563)))

(assert (=> b!90406 t!5332))

(declare-fun b_and!5441 () Bool)

(assert (= b_and!5437 (and (=> t!5332 result!3017) b_and!5441)))

(declare-fun t!5334 () Bool)

(declare-fun tb!1759 () Bool)

(assert (=> (and b!90394 (= (defaultEntry!2393 newMap!16) (defaultEntry!2393 (v!2693 (underlying!299 thiss!992)))) t!5334) tb!1759))

(declare-fun result!3021 () Bool)

(assert (= result!3021 result!3017))

(assert (=> b!90406 t!5334))

(declare-fun b_and!5443 () Bool)

(assert (= b_and!5439 (and (=> t!5334 result!3021) b_and!5443)))

(declare-fun m!96961 () Bool)

(assert (=> b!90394 m!96961))

(declare-fun m!96963 () Bool)

(assert (=> b!90394 m!96963))

(declare-fun m!96965 () Bool)

(assert (=> start!11104 m!96965))

(declare-fun m!96967 () Bool)

(assert (=> mapNonEmpty!3507 m!96967))

(declare-fun m!96969 () Bool)

(assert (=> mapNonEmpty!3508 m!96969))

(declare-fun m!96971 () Bool)

(assert (=> b!90403 m!96971))

(declare-fun m!96973 () Bool)

(assert (=> b!90403 m!96973))

(declare-fun m!96975 () Bool)

(assert (=> b!90401 m!96975))

(assert (=> b!90401 m!96975))

(declare-fun m!96977 () Bool)

(assert (=> b!90401 m!96977))

(assert (=> b!90401 m!96975))

(declare-fun m!96979 () Bool)

(assert (=> b!90401 m!96979))

(declare-fun m!96981 () Bool)

(assert (=> b!90393 m!96981))

(declare-fun m!96983 () Bool)

(assert (=> b!90393 m!96983))

(assert (=> b!90393 m!96975))

(declare-fun m!96985 () Bool)

(assert (=> b!90393 m!96985))

(assert (=> b!90393 m!96975))

(assert (=> b!90393 m!96975))

(declare-fun m!96987 () Bool)

(assert (=> b!90393 m!96987))

(assert (=> b!90393 m!96975))

(declare-fun m!96989 () Bool)

(assert (=> b!90393 m!96989))

(declare-fun m!96991 () Bool)

(assert (=> b!90397 m!96991))

(declare-fun m!96993 () Bool)

(assert (=> b!90398 m!96993))

(declare-fun m!96995 () Bool)

(assert (=> b!90398 m!96995))

(assert (=> b!90398 m!96975))

(declare-fun m!96997 () Bool)

(assert (=> b!90398 m!96997))

(declare-fun m!96999 () Bool)

(assert (=> b!90398 m!96999))

(declare-fun m!97001 () Bool)

(assert (=> b!90398 m!97001))

(declare-fun m!97003 () Bool)

(assert (=> b!90398 m!97003))

(assert (=> b!90398 m!96975))

(declare-fun m!97005 () Bool)

(assert (=> b!90398 m!97005))

(declare-fun m!97007 () Bool)

(assert (=> b!90398 m!97007))

(declare-fun m!97009 () Bool)

(assert (=> b!90398 m!97009))

(declare-fun m!97011 () Bool)

(assert (=> b!90398 m!97011))

(assert (=> b!90398 m!96975))

(assert (=> b!90398 m!97001))

(declare-fun m!97013 () Bool)

(assert (=> b!90398 m!97013))

(declare-fun m!97015 () Bool)

(assert (=> b!90398 m!97015))

(assert (=> b!90406 m!96975))

(declare-fun m!97017 () Bool)

(assert (=> b!90406 m!97017))

(declare-fun m!97019 () Bool)

(assert (=> b!90406 m!97019))

(assert (=> b!90406 m!97017))

(assert (=> b!90406 m!97019))

(declare-fun m!97021 () Bool)

(assert (=> b!90406 m!97021))

(declare-fun m!97023 () Bool)

(assert (=> b!90400 m!97023))

(declare-fun m!97025 () Bool)

(assert (=> b!90400 m!97025))

(check-sat b_and!5441 (not b!90400) (not b_lambda!3989) b_and!5443 (not b!90397) (not start!11104) (not b!90401) (not b!90406) (not b!90394) tp_is_empty!2563 (not b_next!2295) (not mapNonEmpty!3508) (not b!90398) (not b_next!2293) (not b!90403) (not mapNonEmpty!3507) (not b!90393))
(check-sat b_and!5441 b_and!5443 (not b_next!2293) (not b_next!2295))
