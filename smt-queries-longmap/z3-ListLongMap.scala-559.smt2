; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15200 () Bool)

(assert start!15200)

(declare-fun b!145995 () Bool)

(declare-fun b_free!3097 () Bool)

(declare-fun b_next!3097 () Bool)

(assert (=> b!145995 (= b_free!3097 (not b_next!3097))))

(declare-fun tp!11796 () Bool)

(declare-fun b_and!9113 () Bool)

(assert (=> b!145995 (= tp!11796 b_and!9113)))

(declare-fun b!146001 () Bool)

(declare-fun b_free!3099 () Bool)

(declare-fun b_next!3099 () Bool)

(assert (=> b!146001 (= b_free!3099 (not b_next!3099))))

(declare-fun tp!11794 () Bool)

(declare-fun b_and!9115 () Bool)

(assert (=> b!146001 (= tp!11794 b_and!9115)))

(declare-fun b!145988 () Bool)

(declare-fun e!95178 () Bool)

(declare-fun tp_is_empty!2965 () Bool)

(assert (=> b!145988 (= e!95178 tp_is_empty!2965)))

(declare-fun mapNonEmpty!4967 () Bool)

(declare-fun mapRes!4967 () Bool)

(declare-fun tp!11793 () Bool)

(assert (=> mapNonEmpty!4967 (= mapRes!4967 (and tp!11793 e!95178))))

(declare-datatypes ((V!3601 0))(
  ( (V!3602 (val!1527 Int)) )
))
(declare-datatypes ((ValueCell!1139 0))(
  ( (ValueCellFull!1139 (v!3346 V!3601)) (EmptyCell!1139) )
))
(declare-fun mapRest!4968 () (Array (_ BitVec 32) ValueCell!1139))

(declare-datatypes ((array!4961 0))(
  ( (array!4962 (arr!2342 (Array (_ BitVec 32) (_ BitVec 64))) (size!2618 (_ BitVec 32))) )
))
(declare-datatypes ((array!4963 0))(
  ( (array!4964 (arr!2343 (Array (_ BitVec 32) ValueCell!1139)) (size!2619 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1186 0))(
  ( (LongMapFixedSize!1187 (defaultEntry!3009 Int) (mask!7383 (_ BitVec 32)) (extraKeys!2754 (_ BitVec 32)) (zeroValue!2854 V!3601) (minValue!2854 V!3601) (_size!642 (_ BitVec 32)) (_keys!4778 array!4961) (_values!2992 array!4963) (_vacant!642 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1186)

(declare-fun mapKey!4968 () (_ BitVec 32))

(declare-fun mapValue!4967 () ValueCell!1139)

(assert (=> mapNonEmpty!4967 (= (arr!2343 (_values!2992 newMap!16)) (store mapRest!4968 mapKey!4968 mapValue!4967))))

(declare-fun b!145989 () Bool)

(declare-datatypes ((Unit!4605 0))(
  ( (Unit!4606) )
))
(declare-fun e!95182 () Unit!4605)

(declare-fun Unit!4607 () Unit!4605)

(assert (=> b!145989 (= e!95182 Unit!4607)))

(declare-fun lt!76758 () Unit!4605)

(declare-datatypes ((Cell!972 0))(
  ( (Cell!973 (v!3347 LongMapFixedSize!1186)) )
))
(declare-datatypes ((LongMap!972 0))(
  ( (LongMap!973 (underlying!497 Cell!972)) )
))
(declare-fun thiss!992 () LongMap!972)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!151 (array!4961 array!4963 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 64) (_ BitVec 32) Int) Unit!4605)

(assert (=> b!145989 (= lt!76758 (lemmaListMapContainsThenArrayContainsFrom!151 (_keys!4778 (v!3347 (underlying!497 thiss!992))) (_values!2992 (v!3347 (underlying!497 thiss!992))) (mask!7383 (v!3347 (underlying!497 thiss!992))) (extraKeys!2754 (v!3347 (underlying!497 thiss!992))) (zeroValue!2854 (v!3347 (underlying!497 thiss!992))) (minValue!2854 (v!3347 (underlying!497 thiss!992))) (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145989 (arrayContainsKey!0 (_keys!4778 (v!3347 (underlying!497 thiss!992))) (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76761 () Unit!4605)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4961 (_ BitVec 32) (_ BitVec 32)) Unit!4605)

(assert (=> b!145989 (= lt!76761 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4778 (v!3347 (underlying!497 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1750 0))(
  ( (Nil!1747) (Cons!1746 (h!2354 (_ BitVec 64)) (t!6423 List!1750)) )
))
(declare-fun arrayNoDuplicates!0 (array!4961 (_ BitVec 32) List!1750) Bool)

(assert (=> b!145989 (arrayNoDuplicates!0 (_keys!4778 (v!3347 (underlying!497 thiss!992))) from!355 Nil!1747)))

(declare-fun lt!76756 () Unit!4605)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4961 (_ BitVec 32) (_ BitVec 64) List!1750) Unit!4605)

(assert (=> b!145989 (= lt!76756 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4778 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) (Cons!1746 (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) Nil!1747)))))

(assert (=> b!145989 false))

(declare-fun b!145990 () Bool)

(declare-fun e!95176 () Bool)

(assert (=> b!145990 (= e!95176 tp_is_empty!2965)))

(declare-fun b!145991 () Bool)

(declare-fun e!95174 () Bool)

(assert (=> b!145991 (= e!95174 tp_is_empty!2965)))

(declare-fun b!145992 () Bool)

(declare-fun e!95172 () Bool)

(declare-fun e!95180 () Bool)

(assert (=> b!145992 (= e!95172 e!95180)))

(declare-fun b!145993 () Bool)

(declare-fun e!95170 () Bool)

(assert (=> b!145993 (= e!95170 (and e!95174 mapRes!4967))))

(declare-fun condMapEmpty!4967 () Bool)

(declare-fun mapDefault!4968 () ValueCell!1139)

(assert (=> b!145993 (= condMapEmpty!4967 (= (arr!2343 (_values!2992 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1139)) mapDefault!4968)))))

(declare-fun b!145994 () Bool)

(declare-fun res!69500 () Bool)

(declare-fun e!95171 () Bool)

(assert (=> b!145994 (=> (not res!69500) (not e!95171))))

(assert (=> b!145994 (= res!69500 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2618 (_keys!4778 (v!3347 (underlying!497 thiss!992)))))))))

(declare-fun b!145996 () Bool)

(declare-fun e!95175 () Bool)

(assert (=> b!145996 (= e!95180 e!95175)))

(declare-fun mapNonEmpty!4968 () Bool)

(declare-fun mapRes!4968 () Bool)

(declare-fun tp!11795 () Bool)

(assert (=> mapNonEmpty!4968 (= mapRes!4968 (and tp!11795 e!95176))))

(declare-fun mapKey!4967 () (_ BitVec 32))

(declare-fun mapRest!4967 () (Array (_ BitVec 32) ValueCell!1139))

(declare-fun mapValue!4968 () ValueCell!1139)

(assert (=> mapNonEmpty!4968 (= (arr!2343 (_values!2992 (v!3347 (underlying!497 thiss!992)))) (store mapRest!4967 mapKey!4967 mapValue!4968))))

(declare-fun b!145997 () Bool)

(declare-fun e!95179 () Bool)

(assert (=> b!145997 (= e!95179 tp_is_empty!2965)))

(declare-fun mapIsEmpty!4967 () Bool)

(assert (=> mapIsEmpty!4967 mapRes!4968))

(declare-fun mapIsEmpty!4968 () Bool)

(assert (=> mapIsEmpty!4968 mapRes!4967))

(declare-fun b!145998 () Bool)

(declare-fun Unit!4608 () Unit!4605)

(assert (=> b!145998 (= e!95182 Unit!4608)))

(declare-fun b!145999 () Bool)

(declare-fun e!95169 () Bool)

(declare-fun e!95177 () Bool)

(assert (=> b!145999 (= e!95169 e!95177)))

(declare-fun res!69504 () Bool)

(assert (=> b!145999 (=> (not res!69504) (not e!95177))))

(declare-datatypes ((tuple2!2674 0))(
  ( (tuple2!2675 (_1!1348 Bool) (_2!1348 LongMapFixedSize!1186)) )
))
(declare-fun lt!76757 () tuple2!2674)

(assert (=> b!145999 (= res!69504 (and (_1!1348 lt!76757) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76754 () Unit!4605)

(assert (=> b!145999 (= lt!76754 e!95182)))

(declare-fun c!27612 () Bool)

(declare-datatypes ((tuple2!2676 0))(
  ( (tuple2!2677 (_1!1349 (_ BitVec 64)) (_2!1349 V!3601)) )
))
(declare-datatypes ((List!1751 0))(
  ( (Nil!1748) (Cons!1747 (h!2355 tuple2!2676) (t!6424 List!1751)) )
))
(declare-datatypes ((ListLongMap!1711 0))(
  ( (ListLongMap!1712 (toList!871 List!1751)) )
))
(declare-fun lt!76759 () ListLongMap!1711)

(declare-fun contains!929 (ListLongMap!1711 (_ BitVec 64)) Bool)

(assert (=> b!145999 (= c!27612 (contains!929 lt!76759 (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355)))))

(declare-fun update!222 (LongMapFixedSize!1186 (_ BitVec 64) V!3601) tuple2!2674)

(declare-fun get!1570 (ValueCell!1139 V!3601) V!3601)

(declare-fun dynLambda!452 (Int (_ BitVec 64)) V!3601)

(assert (=> b!145999 (= lt!76757 (update!222 newMap!16 (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) (get!1570 (select (arr!2343 (_values!2992 (v!3347 (underlying!497 thiss!992)))) from!355) (dynLambda!452 (defaultEntry!3009 (v!3347 (underlying!497 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!146000 () Bool)

(assert (=> b!146000 (= e!95177 false)))

(declare-fun lt!76760 () ListLongMap!1711)

(declare-fun getCurrentListMapNoExtraKeys!145 (array!4961 array!4963 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1711)

(assert (=> b!146000 (= lt!76760 (getCurrentListMapNoExtraKeys!145 (_keys!4778 (v!3347 (underlying!497 thiss!992))) (_values!2992 (v!3347 (underlying!497 thiss!992))) (mask!7383 (v!3347 (underlying!497 thiss!992))) (extraKeys!2754 (v!3347 (underlying!497 thiss!992))) (zeroValue!2854 (v!3347 (underlying!497 thiss!992))) (minValue!2854 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun e!95183 () Bool)

(declare-fun array_inv!1467 (array!4961) Bool)

(declare-fun array_inv!1468 (array!4963) Bool)

(assert (=> b!146001 (= e!95183 (and tp!11794 tp_is_empty!2965 (array_inv!1467 (_keys!4778 newMap!16)) (array_inv!1468 (_values!2992 newMap!16)) e!95170))))

(declare-fun e!95181 () Bool)

(assert (=> b!145995 (= e!95175 (and tp!11796 tp_is_empty!2965 (array_inv!1467 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) (array_inv!1468 (_values!2992 (v!3347 (underlying!497 thiss!992)))) e!95181))))

(declare-fun res!69505 () Bool)

(assert (=> start!15200 (=> (not res!69505) (not e!95171))))

(declare-fun valid!593 (LongMap!972) Bool)

(assert (=> start!15200 (= res!69505 (valid!593 thiss!992))))

(assert (=> start!15200 e!95171))

(assert (=> start!15200 e!95172))

(assert (=> start!15200 true))

(assert (=> start!15200 e!95183))

(declare-fun b!146002 () Bool)

(declare-fun res!69503 () Bool)

(assert (=> b!146002 (=> (not res!69503) (not e!95171))))

(assert (=> b!146002 (= res!69503 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7383 newMap!16)) (_size!642 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun b!146003 () Bool)

(assert (=> b!146003 (= e!95171 e!95169)))

(declare-fun res!69502 () Bool)

(assert (=> b!146003 (=> (not res!69502) (not e!95169))))

(declare-fun lt!76755 () ListLongMap!1711)

(assert (=> b!146003 (= res!69502 (and (= lt!76755 lt!76759) (not (= (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2342 (_keys!4778 (v!3347 (underlying!497 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1452 (LongMapFixedSize!1186) ListLongMap!1711)

(assert (=> b!146003 (= lt!76759 (map!1452 newMap!16))))

(declare-fun getCurrentListMap!542 (array!4961 array!4963 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1711)

(assert (=> b!146003 (= lt!76755 (getCurrentListMap!542 (_keys!4778 (v!3347 (underlying!497 thiss!992))) (_values!2992 (v!3347 (underlying!497 thiss!992))) (mask!7383 (v!3347 (underlying!497 thiss!992))) (extraKeys!2754 (v!3347 (underlying!497 thiss!992))) (zeroValue!2854 (v!3347 (underlying!497 thiss!992))) (minValue!2854 (v!3347 (underlying!497 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3347 (underlying!497 thiss!992)))))))

(declare-fun b!146004 () Bool)

(declare-fun res!69501 () Bool)

(assert (=> b!146004 (=> (not res!69501) (not e!95171))))

(declare-fun valid!594 (LongMapFixedSize!1186) Bool)

(assert (=> b!146004 (= res!69501 (valid!594 newMap!16))))

(declare-fun b!146005 () Bool)

(assert (=> b!146005 (= e!95181 (and e!95179 mapRes!4968))))

(declare-fun condMapEmpty!4968 () Bool)

(declare-fun mapDefault!4967 () ValueCell!1139)

(assert (=> b!146005 (= condMapEmpty!4968 (= (arr!2343 (_values!2992 (v!3347 (underlying!497 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1139)) mapDefault!4967)))))

(assert (= (and start!15200 res!69505) b!145994))

(assert (= (and b!145994 res!69500) b!146004))

(assert (= (and b!146004 res!69501) b!146002))

(assert (= (and b!146002 res!69503) b!146003))

(assert (= (and b!146003 res!69502) b!145999))

(assert (= (and b!145999 c!27612) b!145989))

(assert (= (and b!145999 (not c!27612)) b!145998))

(assert (= (and b!145999 res!69504) b!146000))

(assert (= (and b!146005 condMapEmpty!4968) mapIsEmpty!4967))

(assert (= (and b!146005 (not condMapEmpty!4968)) mapNonEmpty!4968))

(get-info :version)

(assert (= (and mapNonEmpty!4968 ((_ is ValueCellFull!1139) mapValue!4968)) b!145990))

(assert (= (and b!146005 ((_ is ValueCellFull!1139) mapDefault!4967)) b!145997))

(assert (= b!145995 b!146005))

(assert (= b!145996 b!145995))

(assert (= b!145992 b!145996))

(assert (= start!15200 b!145992))

(assert (= (and b!145993 condMapEmpty!4967) mapIsEmpty!4968))

(assert (= (and b!145993 (not condMapEmpty!4967)) mapNonEmpty!4967))

(assert (= (and mapNonEmpty!4967 ((_ is ValueCellFull!1139) mapValue!4967)) b!145988))

(assert (= (and b!145993 ((_ is ValueCellFull!1139) mapDefault!4968)) b!145991))

(assert (= b!146001 b!145993))

(assert (= start!15200 b!146001))

(declare-fun b_lambda!6551 () Bool)

(assert (=> (not b_lambda!6551) (not b!145999)))

(declare-fun t!6420 () Bool)

(declare-fun tb!2633 () Bool)

(assert (=> (and b!145995 (= (defaultEntry!3009 (v!3347 (underlying!497 thiss!992))) (defaultEntry!3009 (v!3347 (underlying!497 thiss!992)))) t!6420) tb!2633))

(declare-fun result!4309 () Bool)

(assert (=> tb!2633 (= result!4309 tp_is_empty!2965)))

(assert (=> b!145999 t!6420))

(declare-fun b_and!9117 () Bool)

(assert (= b_and!9113 (and (=> t!6420 result!4309) b_and!9117)))

(declare-fun tb!2635 () Bool)

(declare-fun t!6422 () Bool)

(assert (=> (and b!146001 (= (defaultEntry!3009 newMap!16) (defaultEntry!3009 (v!3347 (underlying!497 thiss!992)))) t!6422) tb!2635))

(declare-fun result!4313 () Bool)

(assert (= result!4313 result!4309))

(assert (=> b!145999 t!6422))

(declare-fun b_and!9119 () Bool)

(assert (= b_and!9115 (and (=> t!6422 result!4313) b_and!9119)))

(declare-fun m!175779 () Bool)

(assert (=> b!146000 m!175779))

(declare-fun m!175781 () Bool)

(assert (=> b!146001 m!175781))

(declare-fun m!175783 () Bool)

(assert (=> b!146001 m!175783))

(declare-fun m!175785 () Bool)

(assert (=> start!15200 m!175785))

(declare-fun m!175787 () Bool)

(assert (=> b!145995 m!175787))

(declare-fun m!175789 () Bool)

(assert (=> b!145995 m!175789))

(declare-fun m!175791 () Bool)

(assert (=> mapNonEmpty!4968 m!175791))

(declare-fun m!175793 () Bool)

(assert (=> b!146004 m!175793))

(declare-fun m!175795 () Bool)

(assert (=> b!146003 m!175795))

(declare-fun m!175797 () Bool)

(assert (=> b!146003 m!175797))

(declare-fun m!175799 () Bool)

(assert (=> b!146003 m!175799))

(declare-fun m!175801 () Bool)

(assert (=> b!145999 m!175801))

(declare-fun m!175803 () Bool)

(assert (=> b!145999 m!175803))

(declare-fun m!175805 () Bool)

(assert (=> b!145999 m!175805))

(assert (=> b!145999 m!175795))

(declare-fun m!175807 () Bool)

(assert (=> b!145999 m!175807))

(assert (=> b!145999 m!175795))

(assert (=> b!145999 m!175803))

(assert (=> b!145999 m!175795))

(assert (=> b!145999 m!175805))

(declare-fun m!175809 () Bool)

(assert (=> b!145999 m!175809))

(assert (=> b!145999 m!175801))

(declare-fun m!175811 () Bool)

(assert (=> b!145989 m!175811))

(declare-fun m!175813 () Bool)

(assert (=> b!145989 m!175813))

(assert (=> b!145989 m!175795))

(declare-fun m!175815 () Bool)

(assert (=> b!145989 m!175815))

(assert (=> b!145989 m!175795))

(assert (=> b!145989 m!175795))

(declare-fun m!175817 () Bool)

(assert (=> b!145989 m!175817))

(assert (=> b!145989 m!175795))

(declare-fun m!175819 () Bool)

(assert (=> b!145989 m!175819))

(declare-fun m!175821 () Bool)

(assert (=> mapNonEmpty!4967 m!175821))

(check-sat (not mapNonEmpty!4967) (not b_lambda!6551) (not b!145989) (not b!146000) (not b!145999) (not b_next!3099) (not b!145995) (not start!15200) (not b!146004) tp_is_empty!2965 b_and!9117 (not mapNonEmpty!4968) (not b!146003) (not b!146001) b_and!9119 (not b_next!3097))
(check-sat b_and!9117 b_and!9119 (not b_next!3097) (not b_next!3099))
