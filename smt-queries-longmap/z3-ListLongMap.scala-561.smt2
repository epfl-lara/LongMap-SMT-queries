; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15212 () Bool)

(assert start!15212)

(declare-fun b!146462 () Bool)

(declare-fun b_free!3121 () Bool)

(declare-fun b_next!3121 () Bool)

(assert (=> b!146462 (= b_free!3121 (not b_next!3121))))

(declare-fun tp!11866 () Bool)

(declare-fun b_and!9141 () Bool)

(assert (=> b!146462 (= tp!11866 b_and!9141)))

(declare-fun b!146450 () Bool)

(declare-fun b_free!3123 () Bool)

(declare-fun b_next!3123 () Bool)

(assert (=> b!146450 (= b_free!3123 (not b_next!3123))))

(declare-fun tp!11868 () Bool)

(declare-fun b_and!9143 () Bool)

(assert (=> b!146450 (= tp!11868 b_and!9143)))

(declare-fun b!146444 () Bool)

(declare-fun e!95531 () Bool)

(declare-fun e!95540 () Bool)

(declare-fun mapRes!5004 () Bool)

(assert (=> b!146444 (= e!95531 (and e!95540 mapRes!5004))))

(declare-fun condMapEmpty!5003 () Bool)

(declare-datatypes ((V!3617 0))(
  ( (V!3618 (val!1533 Int)) )
))
(declare-datatypes ((array!4979 0))(
  ( (array!4980 (arr!2350 (Array (_ BitVec 32) (_ BitVec 64))) (size!2627 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1145 0))(
  ( (ValueCellFull!1145 (v!3349 V!3617)) (EmptyCell!1145) )
))
(declare-datatypes ((array!4981 0))(
  ( (array!4982 (arr!2351 (Array (_ BitVec 32) ValueCell!1145)) (size!2628 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1198 0))(
  ( (LongMapFixedSize!1199 (defaultEntry!3015 Int) (mask!7392 (_ BitVec 32)) (extraKeys!2760 (_ BitVec 32)) (zeroValue!2860 V!3617) (minValue!2860 V!3617) (_size!648 (_ BitVec 32)) (_keys!4783 array!4979) (_values!2998 array!4981) (_vacant!648 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!972 0))(
  ( (Cell!973 (v!3350 LongMapFixedSize!1198)) )
))
(declare-datatypes ((LongMap!972 0))(
  ( (LongMap!973 (underlying!497 Cell!972)) )
))
(declare-fun thiss!992 () LongMap!972)

(declare-fun mapDefault!5004 () ValueCell!1145)

(assert (=> b!146444 (= condMapEmpty!5003 (= (arr!2351 (_values!2998 (v!3350 (underlying!497 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1145)) mapDefault!5004)))))

(declare-fun b!146445 () Bool)

(declare-fun e!95526 () Bool)

(declare-fun e!95539 () Bool)

(assert (=> b!146445 (= e!95526 e!95539)))

(declare-fun res!69612 () Bool)

(assert (=> b!146445 (=> (not res!69612) (not e!95539))))

(declare-datatypes ((tuple2!2728 0))(
  ( (tuple2!2729 (_1!1375 (_ BitVec 64)) (_2!1375 V!3617)) )
))
(declare-datatypes ((List!1775 0))(
  ( (Nil!1772) (Cons!1771 (h!2379 tuple2!2728) (t!6471 List!1775)) )
))
(declare-datatypes ((ListLongMap!1749 0))(
  ( (ListLongMap!1750 (toList!890 List!1775)) )
))
(declare-fun lt!76889 () ListLongMap!1749)

(declare-fun lt!76887 () ListLongMap!1749)

(assert (=> b!146445 (= res!69612 (= lt!76889 lt!76887))))

(declare-fun newMap!16 () LongMapFixedSize!1198)

(declare-fun map!1454 (LongMapFixedSize!1198) ListLongMap!1749)

(assert (=> b!146445 (= lt!76887 (map!1454 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!548 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 32) Int) ListLongMap!1749)

(assert (=> b!146445 (= lt!76889 (getCurrentListMap!548 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (_values!2998 (v!3350 (underlying!497 thiss!992))) (mask!7392 (v!3350 (underlying!497 thiss!992))) (extraKeys!2760 (v!3350 (underlying!497 thiss!992))) (zeroValue!2860 (v!3350 (underlying!497 thiss!992))) (minValue!2860 (v!3350 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun mapNonEmpty!5003 () Bool)

(declare-fun tp!11865 () Bool)

(declare-fun e!95536 () Bool)

(assert (=> mapNonEmpty!5003 (= mapRes!5004 (and tp!11865 e!95536))))

(declare-fun mapKey!5003 () (_ BitVec 32))

(declare-fun mapRest!5004 () (Array (_ BitVec 32) ValueCell!1145))

(declare-fun mapValue!5003 () ValueCell!1145)

(assert (=> mapNonEmpty!5003 (= (arr!2351 (_values!2998 (v!3350 (underlying!497 thiss!992)))) (store mapRest!5004 mapKey!5003 mapValue!5003))))

(declare-fun b!146446 () Bool)

(declare-fun tp_is_empty!2977 () Bool)

(assert (=> b!146446 (= e!95540 tp_is_empty!2977)))

(declare-fun b!146447 () Bool)

(declare-fun res!69617 () Bool)

(assert (=> b!146447 (=> (not res!69617) (not e!95526))))

(assert (=> b!146447 (= res!69617 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2627 (_keys!4783 (v!3350 (underlying!497 thiss!992)))))))))

(declare-fun mapNonEmpty!5004 () Bool)

(declare-fun mapRes!5003 () Bool)

(declare-fun tp!11867 () Bool)

(declare-fun e!95541 () Bool)

(assert (=> mapNonEmpty!5004 (= mapRes!5003 (and tp!11867 e!95541))))

(declare-fun mapRest!5003 () (Array (_ BitVec 32) ValueCell!1145))

(declare-fun mapKey!5004 () (_ BitVec 32))

(declare-fun mapValue!5004 () ValueCell!1145)

(assert (=> mapNonEmpty!5004 (= (arr!2351 (_values!2998 newMap!16)) (store mapRest!5003 mapKey!5004 mapValue!5004))))

(declare-fun b!146448 () Bool)

(declare-fun e!95530 () Bool)

(declare-fun e!95529 () Bool)

(assert (=> b!146448 (= e!95530 e!95529)))

(declare-fun b!146449 () Bool)

(declare-datatypes ((Unit!4626 0))(
  ( (Unit!4627) )
))
(declare-fun e!95534 () Unit!4626)

(declare-fun Unit!4628 () Unit!4626)

(assert (=> b!146449 (= e!95534 Unit!4628)))

(declare-fun e!95533 () Bool)

(declare-fun e!95538 () Bool)

(declare-fun array_inv!1505 (array!4979) Bool)

(declare-fun array_inv!1506 (array!4981) Bool)

(assert (=> b!146450 (= e!95533 (and tp!11868 tp_is_empty!2977 (array_inv!1505 (_keys!4783 newMap!16)) (array_inv!1506 (_values!2998 newMap!16)) e!95538))))

(declare-fun b!146451 () Bool)

(assert (=> b!146451 (= e!95536 tp_is_empty!2977)))

(declare-fun b!146452 () Bool)

(declare-fun e!95524 () Bool)

(assert (=> b!146452 (= e!95538 (and e!95524 mapRes!5003))))

(declare-fun condMapEmpty!5004 () Bool)

(declare-fun mapDefault!5003 () ValueCell!1145)

(assert (=> b!146452 (= condMapEmpty!5004 (= (arr!2351 (_values!2998 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1145)) mapDefault!5003)))))

(declare-fun b!146453 () Bool)

(assert (=> b!146453 (= e!95541 tp_is_empty!2977)))

(declare-fun b!146455 () Bool)

(declare-fun Unit!4629 () Unit!4626)

(assert (=> b!146455 (= e!95534 Unit!4629)))

(declare-fun lt!76897 () Unit!4626)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!159 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 64) (_ BitVec 32) Int) Unit!4626)

(assert (=> b!146455 (= lt!76897 (lemmaListMapContainsThenArrayContainsFrom!159 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (_values!2998 (v!3350 (underlying!497 thiss!992))) (mask!7392 (v!3350 (underlying!497 thiss!992))) (extraKeys!2760 (v!3350 (underlying!497 thiss!992))) (zeroValue!2860 (v!3350 (underlying!497 thiss!992))) (minValue!2860 (v!3350 (underlying!497 thiss!992))) (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146455 (arrayContainsKey!0 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76899 () Unit!4626)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4979 (_ BitVec 32) (_ BitVec 32)) Unit!4626)

(assert (=> b!146455 (= lt!76899 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4783 (v!3350 (underlying!497 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1776 0))(
  ( (Nil!1773) (Cons!1772 (h!2380 (_ BitVec 64)) (t!6472 List!1776)) )
))
(declare-fun arrayNoDuplicates!0 (array!4979 (_ BitVec 32) List!1776) Bool)

(assert (=> b!146455 (arrayNoDuplicates!0 (_keys!4783 (v!3350 (underlying!497 thiss!992))) from!355 Nil!1773)))

(declare-fun lt!76901 () Unit!4626)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4979 (_ BitVec 32) (_ BitVec 64) List!1776) Unit!4626)

(assert (=> b!146455 (= lt!76901 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) (Cons!1772 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) Nil!1773)))))

(assert (=> b!146455 false))

(declare-fun res!69616 () Bool)

(assert (=> start!15212 (=> (not res!69616) (not e!95526))))

(declare-fun valid!589 (LongMap!972) Bool)

(assert (=> start!15212 (= res!69616 (valid!589 thiss!992))))

(assert (=> start!15212 e!95526))

(assert (=> start!15212 e!95530))

(assert (=> start!15212 true))

(assert (=> start!15212 e!95533))

(declare-fun b!146454 () Bool)

(assert (=> b!146454 (= e!95524 tp_is_empty!2977)))

(declare-fun b!146456 () Bool)

(declare-fun e!95527 () Bool)

(assert (=> b!146456 (= e!95539 e!95527)))

(declare-fun res!69619 () Bool)

(assert (=> b!146456 (=> (not res!69619) (not e!95527))))

(assert (=> b!146456 (= res!69619 (and (not (= (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76893 () V!3617)

(declare-fun get!1570 (ValueCell!1145 V!3617) V!3617)

(declare-fun dynLambda!451 (Int (_ BitVec 64)) V!3617)

(assert (=> b!146456 (= lt!76893 (get!1570 (select (arr!2351 (_values!2998 (v!3350 (underlying!497 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3015 (v!3350 (underlying!497 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5003 () Bool)

(assert (=> mapIsEmpty!5003 mapRes!5003))

(declare-fun b!146457 () Bool)

(declare-fun res!69615 () Bool)

(assert (=> b!146457 (=> (not res!69615) (not e!95526))))

(declare-fun valid!590 (LongMapFixedSize!1198) Bool)

(assert (=> b!146457 (= res!69615 (valid!590 newMap!16))))

(declare-fun b!146458 () Bool)

(declare-fun e!95537 () Bool)

(assert (=> b!146458 (= e!95527 e!95537)))

(declare-fun res!69618 () Bool)

(assert (=> b!146458 (=> (not res!69618) (not e!95537))))

(declare-datatypes ((tuple2!2730 0))(
  ( (tuple2!2731 (_1!1376 Bool) (_2!1376 LongMapFixedSize!1198)) )
))
(declare-fun lt!76902 () tuple2!2730)

(assert (=> b!146458 (= res!69618 (and (_1!1376 lt!76902) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76896 () Unit!4626)

(assert (=> b!146458 (= lt!76896 e!95534)))

(declare-fun c!27688 () Bool)

(declare-fun contains!938 (ListLongMap!1749 (_ BitVec 64)) Bool)

(assert (=> b!146458 (= c!27688 (contains!938 lt!76887 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355)))))

(declare-fun update!225 (LongMapFixedSize!1198 (_ BitVec 64) V!3617) tuple2!2730)

(assert (=> b!146458 (= lt!76902 (update!225 newMap!16 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) lt!76893))))

(declare-fun b!146459 () Bool)

(declare-fun e!95528 () Bool)

(assert (=> b!146459 (= e!95537 (not e!95528))))

(declare-fun res!69613 () Bool)

(assert (=> b!146459 (=> res!69613 e!95528)))

(assert (=> b!146459 (= res!69613 (not (= (getCurrentListMap!548 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (_values!2998 (v!3350 (underlying!497 thiss!992))) (mask!7392 (v!3350 (underlying!497 thiss!992))) (extraKeys!2760 (v!3350 (underlying!497 thiss!992))) (zeroValue!2860 (v!3350 (underlying!497 thiss!992))) (minValue!2860 (v!3350 (underlying!497 thiss!992))) from!355 (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))) (map!1454 (_2!1376 lt!76902)))))))

(declare-fun lt!76888 () tuple2!2728)

(declare-fun lt!76903 () ListLongMap!1749)

(declare-fun lt!76894 () tuple2!2728)

(declare-fun lt!76898 () ListLongMap!1749)

(declare-fun +!174 (ListLongMap!1749 tuple2!2728) ListLongMap!1749)

(assert (=> b!146459 (= (+!174 lt!76898 lt!76888) (+!174 (+!174 lt!76903 lt!76888) lt!76894))))

(assert (=> b!146459 (= lt!76888 (tuple2!2729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2860 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun lt!76891 () Unit!4626)

(declare-fun addCommutativeForDiffKeys!67 (ListLongMap!1749 (_ BitVec 64) V!3617 (_ BitVec 64) V!3617) Unit!4626)

(assert (=> b!146459 (= lt!76891 (addCommutativeForDiffKeys!67 lt!76903 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) lt!76893 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2860 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun lt!76886 () ListLongMap!1749)

(assert (=> b!146459 (= lt!76886 lt!76898)))

(assert (=> b!146459 (= lt!76898 (+!174 lt!76903 lt!76894))))

(declare-fun lt!76895 () ListLongMap!1749)

(declare-fun lt!76892 () tuple2!2728)

(assert (=> b!146459 (= lt!76886 (+!174 lt!76895 lt!76892))))

(declare-fun lt!76900 () ListLongMap!1749)

(assert (=> b!146459 (= lt!76903 (+!174 lt!76900 lt!76892))))

(assert (=> b!146459 (= lt!76892 (tuple2!2729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2860 (v!3350 (underlying!497 thiss!992)))))))

(assert (=> b!146459 (= lt!76895 (+!174 lt!76900 lt!76894))))

(assert (=> b!146459 (= lt!76894 (tuple2!2729 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) lt!76893))))

(declare-fun lt!76890 () Unit!4626)

(assert (=> b!146459 (= lt!76890 (addCommutativeForDiffKeys!67 lt!76900 (select (arr!2350 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) from!355) lt!76893 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2860 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!140 (array!4979 array!4981 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 32) Int) ListLongMap!1749)

(assert (=> b!146459 (= lt!76900 (getCurrentListMapNoExtraKeys!140 (_keys!4783 (v!3350 (underlying!497 thiss!992))) (_values!2998 (v!3350 (underlying!497 thiss!992))) (mask!7392 (v!3350 (underlying!497 thiss!992))) (extraKeys!2760 (v!3350 (underlying!497 thiss!992))) (zeroValue!2860 (v!3350 (underlying!497 thiss!992))) (minValue!2860 (v!3350 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun b!146460 () Bool)

(assert (=> b!146460 (= e!95528 (bvslt (bvsub from!355 #b00000000000000000000000000000001) from!355))))

(declare-fun b!146461 () Bool)

(declare-fun res!69614 () Bool)

(assert (=> b!146461 (=> (not res!69614) (not e!95526))))

(assert (=> b!146461 (= res!69614 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7392 newMap!16)) (_size!648 (v!3350 (underlying!497 thiss!992)))))))

(declare-fun mapIsEmpty!5004 () Bool)

(assert (=> mapIsEmpty!5004 mapRes!5004))

(declare-fun e!95535 () Bool)

(assert (=> b!146462 (= e!95535 (and tp!11866 tp_is_empty!2977 (array_inv!1505 (_keys!4783 (v!3350 (underlying!497 thiss!992)))) (array_inv!1506 (_values!2998 (v!3350 (underlying!497 thiss!992)))) e!95531))))

(declare-fun b!146463 () Bool)

(assert (=> b!146463 (= e!95529 e!95535)))

(assert (= (and start!15212 res!69616) b!146447))

(assert (= (and b!146447 res!69617) b!146457))

(assert (= (and b!146457 res!69615) b!146461))

(assert (= (and b!146461 res!69614) b!146445))

(assert (= (and b!146445 res!69612) b!146456))

(assert (= (and b!146456 res!69619) b!146458))

(assert (= (and b!146458 c!27688) b!146455))

(assert (= (and b!146458 (not c!27688)) b!146449))

(assert (= (and b!146458 res!69618) b!146459))

(assert (= (and b!146459 (not res!69613)) b!146460))

(assert (= (and b!146444 condMapEmpty!5003) mapIsEmpty!5004))

(assert (= (and b!146444 (not condMapEmpty!5003)) mapNonEmpty!5003))

(get-info :version)

(assert (= (and mapNonEmpty!5003 ((_ is ValueCellFull!1145) mapValue!5003)) b!146451))

(assert (= (and b!146444 ((_ is ValueCellFull!1145) mapDefault!5004)) b!146446))

(assert (= b!146462 b!146444))

(assert (= b!146463 b!146462))

(assert (= b!146448 b!146463))

(assert (= start!15212 b!146448))

(assert (= (and b!146452 condMapEmpty!5004) mapIsEmpty!5003))

(assert (= (and b!146452 (not condMapEmpty!5004)) mapNonEmpty!5004))

(assert (= (and mapNonEmpty!5004 ((_ is ValueCellFull!1145) mapValue!5004)) b!146453))

(assert (= (and b!146452 ((_ is ValueCellFull!1145) mapDefault!5003)) b!146454))

(assert (= b!146450 b!146452))

(assert (= start!15212 b!146450))

(declare-fun b_lambda!6543 () Bool)

(assert (=> (not b_lambda!6543) (not b!146456)))

(declare-fun t!6468 () Bool)

(declare-fun tb!2657 () Bool)

(assert (=> (and b!146462 (= (defaultEntry!3015 (v!3350 (underlying!497 thiss!992))) (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))) t!6468) tb!2657))

(declare-fun result!4345 () Bool)

(assert (=> tb!2657 (= result!4345 tp_is_empty!2977)))

(assert (=> b!146456 t!6468))

(declare-fun b_and!9145 () Bool)

(assert (= b_and!9141 (and (=> t!6468 result!4345) b_and!9145)))

(declare-fun t!6470 () Bool)

(declare-fun tb!2659 () Bool)

(assert (=> (and b!146450 (= (defaultEntry!3015 newMap!16) (defaultEntry!3015 (v!3350 (underlying!497 thiss!992)))) t!6470) tb!2659))

(declare-fun result!4349 () Bool)

(assert (= result!4349 result!4345))

(assert (=> b!146456 t!6470))

(declare-fun b_and!9147 () Bool)

(assert (= b_and!9143 (and (=> t!6470 result!4349) b_and!9147)))

(declare-fun m!175885 () Bool)

(assert (=> start!15212 m!175885))

(declare-fun m!175887 () Bool)

(assert (=> b!146455 m!175887))

(declare-fun m!175889 () Bool)

(assert (=> b!146455 m!175889))

(declare-fun m!175891 () Bool)

(assert (=> b!146455 m!175891))

(declare-fun m!175893 () Bool)

(assert (=> b!146455 m!175893))

(assert (=> b!146455 m!175891))

(assert (=> b!146455 m!175891))

(declare-fun m!175895 () Bool)

(assert (=> b!146455 m!175895))

(assert (=> b!146455 m!175891))

(declare-fun m!175897 () Bool)

(assert (=> b!146455 m!175897))

(declare-fun m!175899 () Bool)

(assert (=> mapNonEmpty!5004 m!175899))

(assert (=> b!146458 m!175891))

(assert (=> b!146458 m!175891))

(declare-fun m!175901 () Bool)

(assert (=> b!146458 m!175901))

(assert (=> b!146458 m!175891))

(declare-fun m!175903 () Bool)

(assert (=> b!146458 m!175903))

(assert (=> b!146459 m!175891))

(declare-fun m!175905 () Bool)

(assert (=> b!146459 m!175905))

(declare-fun m!175907 () Bool)

(assert (=> b!146459 m!175907))

(declare-fun m!175909 () Bool)

(assert (=> b!146459 m!175909))

(declare-fun m!175911 () Bool)

(assert (=> b!146459 m!175911))

(declare-fun m!175913 () Bool)

(assert (=> b!146459 m!175913))

(assert (=> b!146459 m!175891))

(assert (=> b!146459 m!175907))

(declare-fun m!175915 () Bool)

(assert (=> b!146459 m!175915))

(assert (=> b!146459 m!175891))

(declare-fun m!175917 () Bool)

(assert (=> b!146459 m!175917))

(declare-fun m!175919 () Bool)

(assert (=> b!146459 m!175919))

(declare-fun m!175921 () Bool)

(assert (=> b!146459 m!175921))

(declare-fun m!175923 () Bool)

(assert (=> b!146459 m!175923))

(declare-fun m!175925 () Bool)

(assert (=> b!146459 m!175925))

(declare-fun m!175927 () Bool)

(assert (=> b!146459 m!175927))

(declare-fun m!175929 () Bool)

(assert (=> b!146445 m!175929))

(declare-fun m!175931 () Bool)

(assert (=> b!146445 m!175931))

(declare-fun m!175933 () Bool)

(assert (=> b!146457 m!175933))

(declare-fun m!175935 () Bool)

(assert (=> b!146462 m!175935))

(declare-fun m!175937 () Bool)

(assert (=> b!146462 m!175937))

(assert (=> b!146456 m!175891))

(declare-fun m!175939 () Bool)

(assert (=> b!146456 m!175939))

(declare-fun m!175941 () Bool)

(assert (=> b!146456 m!175941))

(assert (=> b!146456 m!175939))

(assert (=> b!146456 m!175941))

(declare-fun m!175943 () Bool)

(assert (=> b!146456 m!175943))

(declare-fun m!175945 () Bool)

(assert (=> mapNonEmpty!5003 m!175945))

(declare-fun m!175947 () Bool)

(assert (=> b!146450 m!175947))

(declare-fun m!175949 () Bool)

(assert (=> b!146450 m!175949))

(check-sat b_and!9147 (not b!146456) (not b!146457) (not b_next!3123) b_and!9145 (not b!146450) tp_is_empty!2977 (not b!146445) (not b!146458) (not b!146455) (not b!146459) (not mapNonEmpty!5003) (not b_next!3121) (not b!146462) (not b_lambda!6543) (not mapNonEmpty!5004) (not start!15212))
(check-sat b_and!9145 b_and!9147 (not b_next!3121) (not b_next!3123))
