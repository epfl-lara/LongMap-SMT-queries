; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13058 () Bool)

(assert start!13058)

(declare-fun b!113758 () Bool)

(declare-fun b_free!2593 () Bool)

(declare-fun b_next!2593 () Bool)

(assert (=> b!113758 (= b_free!2593 (not b_next!2593))))

(declare-fun tp!10139 () Bool)

(declare-fun b_and!6979 () Bool)

(assert (=> b!113758 (= tp!10139 b_and!6979)))

(declare-fun b!113751 () Bool)

(declare-fun b_free!2595 () Bool)

(declare-fun b_next!2595 () Bool)

(assert (=> b!113751 (= b_free!2595 (not b_next!2595))))

(declare-fun tp!10140 () Bool)

(declare-fun b_and!6981 () Bool)

(assert (=> b!113751 (= tp!10140 b_and!6981)))

(declare-fun b!113742 () Bool)

(declare-fun e!73917 () Bool)

(declare-fun e!73914 () Bool)

(assert (=> b!113742 (= e!73917 e!73914)))

(declare-fun res!56043 () Bool)

(assert (=> b!113742 (=> (not res!56043) (not e!73914))))

(declare-datatypes ((V!3265 0))(
  ( (V!3266 (val!1401 Int)) )
))
(declare-datatypes ((tuple2!2458 0))(
  ( (tuple2!2459 (_1!1240 (_ BitVec 64)) (_2!1240 V!3265)) )
))
(declare-datatypes ((List!1641 0))(
  ( (Nil!1638) (Cons!1637 (h!2237 tuple2!2458) (t!5827 List!1641)) )
))
(declare-datatypes ((ListLongMap!1601 0))(
  ( (ListLongMap!1602 (toList!816 List!1641)) )
))
(declare-fun lt!59085 () ListLongMap!1601)

(declare-fun lt!59090 () ListLongMap!1601)

(assert (=> b!113742 (= res!56043 (= lt!59085 lt!59090))))

(declare-datatypes ((array!4427 0))(
  ( (array!4428 (arr!2097 (Array (_ BitVec 32) (_ BitVec 64))) (size!2357 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1013 0))(
  ( (ValueCellFull!1013 (v!2969 V!3265)) (EmptyCell!1013) )
))
(declare-datatypes ((array!4429 0))(
  ( (array!4430 (arr!2098 (Array (_ BitVec 32) ValueCell!1013)) (size!2358 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!934 0))(
  ( (LongMapFixedSize!935 (defaultEntry!2673 Int) (mask!6863 (_ BitVec 32)) (extraKeys!2462 (_ BitVec 32)) (zeroValue!2540 V!3265) (minValue!2540 V!3265) (_size!516 (_ BitVec 32)) (_keys!4395 array!4427) (_values!2656 array!4429) (_vacant!516 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!934)

(declare-fun map!1309 (LongMapFixedSize!934) ListLongMap!1601)

(assert (=> b!113742 (= lt!59090 (map!1309 newMap!16))))

(declare-datatypes ((Cell!734 0))(
  ( (Cell!735 (v!2970 LongMapFixedSize!934)) )
))
(declare-datatypes ((LongMap!734 0))(
  ( (LongMap!735 (underlying!378 Cell!734)) )
))
(declare-fun thiss!992 () LongMap!734)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!500 (array!4427 array!4429 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 32) Int) ListLongMap!1601)

(assert (=> b!113742 (= lt!59085 (getCurrentListMap!500 (_keys!4395 (v!2970 (underlying!378 thiss!992))) (_values!2656 (v!2970 (underlying!378 thiss!992))) (mask!6863 (v!2970 (underlying!378 thiss!992))) (extraKeys!2462 (v!2970 (underlying!378 thiss!992))) (zeroValue!2540 (v!2970 (underlying!378 thiss!992))) (minValue!2540 (v!2970 (underlying!378 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2970 (underlying!378 thiss!992)))))))

(declare-fun b!113743 () Bool)

(declare-fun res!56046 () Bool)

(declare-fun e!73913 () Bool)

(assert (=> b!113743 (=> res!56046 e!73913)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4427 (_ BitVec 32)) Bool)

(assert (=> b!113743 (= res!56046 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4395 (v!2970 (underlying!378 thiss!992))) (mask!6863 (v!2970 (underlying!378 thiss!992))))))))

(declare-fun b!113744 () Bool)

(declare-fun res!56041 () Bool)

(assert (=> b!113744 (=> (not res!56041) (not e!73917))))

(declare-fun valid!438 (LongMapFixedSize!934) Bool)

(assert (=> b!113744 (= res!56041 (valid!438 newMap!16))))

(declare-fun b!113745 () Bool)

(assert (=> b!113745 (= e!73913 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun res!56040 () Bool)

(assert (=> start!13058 (=> (not res!56040) (not e!73917))))

(declare-fun valid!439 (LongMap!734) Bool)

(assert (=> start!13058 (= res!56040 (valid!439 thiss!992))))

(assert (=> start!13058 e!73917))

(declare-fun e!73918 () Bool)

(assert (=> start!13058 e!73918))

(assert (=> start!13058 true))

(declare-fun e!73908 () Bool)

(assert (=> start!13058 e!73908))

(declare-fun b!113746 () Bool)

(declare-datatypes ((Unit!3550 0))(
  ( (Unit!3551) )
))
(declare-fun e!73916 () Unit!3550)

(declare-fun Unit!3552 () Unit!3550)

(assert (=> b!113746 (= e!73916 Unit!3552)))

(declare-fun lt!59088 () Unit!3550)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!116 (array!4427 array!4429 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 64) (_ BitVec 32) Int) Unit!3550)

(assert (=> b!113746 (= lt!59088 (lemmaListMapContainsThenArrayContainsFrom!116 (_keys!4395 (v!2970 (underlying!378 thiss!992))) (_values!2656 (v!2970 (underlying!378 thiss!992))) (mask!6863 (v!2970 (underlying!378 thiss!992))) (extraKeys!2462 (v!2970 (underlying!378 thiss!992))) (zeroValue!2540 (v!2970 (underlying!378 thiss!992))) (minValue!2540 (v!2970 (underlying!378 thiss!992))) (select (arr!2097 (_keys!4395 (v!2970 (underlying!378 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2970 (underlying!378 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113746 (arrayContainsKey!0 (_keys!4395 (v!2970 (underlying!378 thiss!992))) (select (arr!2097 (_keys!4395 (v!2970 (underlying!378 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59087 () Unit!3550)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4427 (_ BitVec 32) (_ BitVec 32)) Unit!3550)

(assert (=> b!113746 (= lt!59087 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4395 (v!2970 (underlying!378 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1642 0))(
  ( (Nil!1639) (Cons!1638 (h!2238 (_ BitVec 64)) (t!5828 List!1642)) )
))
(declare-fun arrayNoDuplicates!0 (array!4427 (_ BitVec 32) List!1642) Bool)

(assert (=> b!113746 (arrayNoDuplicates!0 (_keys!4395 (v!2970 (underlying!378 thiss!992))) from!355 Nil!1639)))

(declare-fun lt!59080 () Unit!3550)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4427 (_ BitVec 32) (_ BitVec 64) List!1642) Unit!3550)

(assert (=> b!113746 (= lt!59080 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4395 (v!2970 (underlying!378 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2097 (_keys!4395 (v!2970 (underlying!378 thiss!992)))) from!355) (Cons!1638 (select (arr!2097 (_keys!4395 (v!2970 (underlying!378 thiss!992)))) from!355) Nil!1639)))))

(assert (=> b!113746 false))

(declare-fun mapNonEmpty!4067 () Bool)

(declare-fun mapRes!4067 () Bool)

(declare-fun tp!10137 () Bool)

(declare-fun e!73907 () Bool)

(assert (=> mapNonEmpty!4067 (= mapRes!4067 (and tp!10137 e!73907))))

(declare-fun mapValue!4068 () ValueCell!1013)

(declare-fun mapRest!4068 () (Array (_ BitVec 32) ValueCell!1013))

(declare-fun mapKey!4068 () (_ BitVec 32))

(assert (=> mapNonEmpty!4067 (= (arr!2098 (_values!2656 newMap!16)) (store mapRest!4068 mapKey!4068 mapValue!4068))))

(declare-fun mapIsEmpty!4067 () Bool)

(declare-fun mapRes!4068 () Bool)

(assert (=> mapIsEmpty!4067 mapRes!4068))

(declare-fun b!113747 () Bool)

(declare-fun e!73902 () Bool)

(declare-fun e!73904 () Bool)

(assert (=> b!113747 (= e!73902 (and e!73904 mapRes!4068))))

(declare-fun condMapEmpty!4068 () Bool)

(declare-fun mapDefault!4068 () ValueCell!1013)

