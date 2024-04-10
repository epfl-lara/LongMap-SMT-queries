; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10146 () Bool)

(assert start!10146)

(declare-fun b!77441 () Bool)

(declare-fun b_free!2181 () Bool)

(declare-fun b_next!2181 () Bool)

(assert (=> b!77441 (= b_free!2181 (not b_next!2181))))

(declare-fun tp!8742 () Bool)

(declare-fun b_and!4763 () Bool)

(assert (=> b!77441 (= tp!8742 b_and!4763)))

(declare-fun b!77437 () Bool)

(declare-fun b_free!2183 () Bool)

(declare-fun b_next!2183 () Bool)

(assert (=> b!77437 (= b_free!2183 (not b_next!2183))))

(declare-fun tp!8741 () Bool)

(declare-fun b_and!4765 () Bool)

(assert (=> b!77437 (= tp!8741 b_and!4765)))

(declare-fun b!77429 () Bool)

(declare-fun e!50639 () Bool)

(declare-fun e!50648 () Bool)

(assert (=> b!77429 (= e!50639 e!50648)))

(declare-fun b!77430 () Bool)

(declare-fun res!40649 () Bool)

(declare-fun e!50646 () Bool)

(assert (=> b!77430 (=> (not res!40649) (not e!50646))))

(declare-datatypes ((V!2989 0))(
  ( (V!2990 (val!1298 Int)) )
))
(declare-datatypes ((array!3965 0))(
  ( (array!3966 (arr!1891 (Array (_ BitVec 32) (_ BitVec 64))) (size!2132 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!910 0))(
  ( (ValueCellFull!910 (v!2585 V!2989)) (EmptyCell!910) )
))
(declare-datatypes ((array!3967 0))(
  ( (array!3968 (arr!1892 (Array (_ BitVec 32) ValueCell!910)) (size!2133 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!728 0))(
  ( (LongMapFixedSize!729 (defaultEntry!2267 Int) (mask!6260 (_ BitVec 32)) (extraKeys!2118 (_ BitVec 32)) (zeroValue!2165 V!2989) (minValue!2165 V!2989) (_size!413 (_ BitVec 32)) (_keys!3927 array!3965) (_values!2250 array!3967) (_vacant!413 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!728)

(declare-datatypes ((Cell!530 0))(
  ( (Cell!531 (v!2586 LongMapFixedSize!728)) )
))
(declare-datatypes ((LongMap!530 0))(
  ( (LongMap!531 (underlying!276 Cell!530)) )
))
(declare-fun thiss!992 () LongMap!530)

(assert (=> b!77430 (= res!40649 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6260 newMap!16)) (_size!413 (v!2586 (underlying!276 thiss!992)))))))

(declare-fun b!77432 () Bool)

(declare-fun e!50641 () Bool)

(declare-fun tp_is_empty!2507 () Bool)

(assert (=> b!77432 (= e!50641 tp_is_empty!2507)))

(declare-fun b!77433 () Bool)

(declare-fun e!50633 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77433 (= e!50633 (not (validMask!0 (mask!6260 (v!2586 (underlying!276 thiss!992))))))))

(declare-datatypes ((tuple2!2164 0))(
  ( (tuple2!2165 (_1!1093 (_ BitVec 64)) (_2!1093 V!2989)) )
))
(declare-fun lt!35530 () tuple2!2164)

(declare-fun lt!35516 () tuple2!2164)

(declare-datatypes ((List!1503 0))(
  ( (Nil!1500) (Cons!1499 (h!2087 tuple2!2164) (t!5141 List!1503)) )
))
(declare-datatypes ((ListLongMap!1443 0))(
  ( (ListLongMap!1444 (toList!737 List!1503)) )
))
(declare-fun lt!35522 () ListLongMap!1443)

(declare-fun lt!35521 () ListLongMap!1443)

(declare-fun +!103 (ListLongMap!1443 tuple2!2164) ListLongMap!1443)

(assert (=> b!77433 (= (+!103 lt!35522 lt!35530) (+!103 (+!103 lt!35521 lt!35530) lt!35516))))

(assert (=> b!77433 (= lt!35530 (tuple2!2165 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2165 (v!2586 (underlying!276 thiss!992)))))))

(declare-datatypes ((Unit!2245 0))(
  ( (Unit!2246) )
))
(declare-fun lt!35524 () Unit!2245)

(declare-fun lt!35518 () V!2989)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!22 (ListLongMap!1443 (_ BitVec 64) V!2989 (_ BitVec 64) V!2989) Unit!2245)

(assert (=> b!77433 (= lt!35524 (addCommutativeForDiffKeys!22 lt!35521 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) lt!35518 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2165 (v!2586 (underlying!276 thiss!992)))))))

(declare-fun lt!35529 () ListLongMap!1443)

(assert (=> b!77433 (= lt!35529 lt!35522)))

(assert (=> b!77433 (= lt!35522 (+!103 lt!35521 lt!35516))))

(declare-fun lt!35525 () ListLongMap!1443)

(declare-fun lt!35528 () tuple2!2164)

(assert (=> b!77433 (= lt!35529 (+!103 lt!35525 lt!35528))))

(declare-fun lt!35523 () ListLongMap!1443)

(assert (=> b!77433 (= lt!35521 (+!103 lt!35523 lt!35528))))

(assert (=> b!77433 (= lt!35528 (tuple2!2165 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2165 (v!2586 (underlying!276 thiss!992)))))))

(assert (=> b!77433 (= lt!35525 (+!103 lt!35523 lt!35516))))

(assert (=> b!77433 (= lt!35516 (tuple2!2165 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) lt!35518))))

(declare-fun lt!35527 () Unit!2245)

(assert (=> b!77433 (= lt!35527 (addCommutativeForDiffKeys!22 lt!35523 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) lt!35518 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2165 (v!2586 (underlying!276 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!68 (array!3965 array!3967 (_ BitVec 32) (_ BitVec 32) V!2989 V!2989 (_ BitVec 32) Int) ListLongMap!1443)

(assert (=> b!77433 (= lt!35523 (getCurrentListMapNoExtraKeys!68 (_keys!3927 (v!2586 (underlying!276 thiss!992))) (_values!2250 (v!2586 (underlying!276 thiss!992))) (mask!6260 (v!2586 (underlying!276 thiss!992))) (extraKeys!2118 (v!2586 (underlying!276 thiss!992))) (zeroValue!2165 (v!2586 (underlying!276 thiss!992))) (minValue!2165 (v!2586 (underlying!276 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2267 (v!2586 (underlying!276 thiss!992)))))))

(declare-fun b!77434 () Bool)

(declare-fun e!50638 () Bool)

(assert (=> b!77434 (= e!50638 e!50633)))

(declare-fun res!40654 () Bool)

(assert (=> b!77434 (=> (not res!40654) (not e!50633))))

(declare-datatypes ((tuple2!2166 0))(
  ( (tuple2!2167 (_1!1094 Bool) (_2!1094 LongMapFixedSize!728)) )
))
(declare-fun lt!35533 () tuple2!2166)

(assert (=> b!77434 (= res!40654 (and (_1!1094 lt!35533) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35519 () Unit!2245)

(declare-fun e!50643 () Unit!2245)

(assert (=> b!77434 (= lt!35519 e!50643)))

(declare-fun lt!35526 () ListLongMap!1443)

(declare-fun c!11808 () Bool)

(declare-fun contains!738 (ListLongMap!1443 (_ BitVec 64)) Bool)

(assert (=> b!77434 (= c!11808 (contains!738 lt!35526 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355)))))

(declare-fun update!105 (LongMapFixedSize!728 (_ BitVec 64) V!2989) tuple2!2166)

(assert (=> b!77434 (= lt!35533 (update!105 newMap!16 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) lt!35518))))

(declare-fun b!77435 () Bool)

(declare-fun Unit!2247 () Unit!2245)

(assert (=> b!77435 (= e!50643 Unit!2247)))

(declare-fun lt!35517 () Unit!2245)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!60 (array!3965 array!3967 (_ BitVec 32) (_ BitVec 32) V!2989 V!2989 (_ BitVec 64) (_ BitVec 32) Int) Unit!2245)

(assert (=> b!77435 (= lt!35517 (lemmaListMapContainsThenArrayContainsFrom!60 (_keys!3927 (v!2586 (underlying!276 thiss!992))) (_values!2250 (v!2586 (underlying!276 thiss!992))) (mask!6260 (v!2586 (underlying!276 thiss!992))) (extraKeys!2118 (v!2586 (underlying!276 thiss!992))) (zeroValue!2165 (v!2586 (underlying!276 thiss!992))) (minValue!2165 (v!2586 (underlying!276 thiss!992))) (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2267 (v!2586 (underlying!276 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77435 (arrayContainsKey!0 (_keys!3927 (v!2586 (underlying!276 thiss!992))) (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35531 () Unit!2245)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3965 (_ BitVec 32) (_ BitVec 32)) Unit!2245)

(assert (=> b!77435 (= lt!35531 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3927 (v!2586 (underlying!276 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1504 0))(
  ( (Nil!1501) (Cons!1500 (h!2088 (_ BitVec 64)) (t!5142 List!1504)) )
))
(declare-fun arrayNoDuplicates!0 (array!3965 (_ BitVec 32) List!1504) Bool)

(assert (=> b!77435 (arrayNoDuplicates!0 (_keys!3927 (v!2586 (underlying!276 thiss!992))) from!355 Nil!1501)))

(declare-fun lt!35532 () Unit!2245)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3965 (_ BitVec 32) (_ BitVec 64) List!1504) Unit!2245)

(assert (=> b!77435 (= lt!35532 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3927 (v!2586 (underlying!276 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) (Cons!1500 (select (arr!1891 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) from!355) Nil!1501)))))

(assert (=> b!77435 false))

(declare-fun b!77436 () Bool)

(declare-fun res!40653 () Bool)

(assert (=> b!77436 (=> (not res!40653) (not e!50646))))

(assert (=> b!77436 (= res!40653 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2132 (_keys!3927 (v!2586 (underlying!276 thiss!992)))))))))

(declare-fun e!50647 () Bool)

(declare-fun e!50649 () Bool)

(declare-fun array_inv!1167 (array!3965) Bool)

(declare-fun array_inv!1168 (array!3967) Bool)

(assert (=> b!77437 (= e!50649 (and tp!8741 tp_is_empty!2507 (array_inv!1167 (_keys!3927 newMap!16)) (array_inv!1168 (_values!2250 newMap!16)) e!50647))))

(declare-fun b!77438 () Bool)

(declare-fun e!50634 () Bool)

(assert (=> b!77438 (= e!50648 e!50634)))

(declare-fun b!77439 () Bool)

(declare-fun e!50645 () Bool)

(assert (=> b!77439 (= e!50645 tp_is_empty!2507)))

(declare-fun mapNonEmpty!3287 () Bool)

(declare-fun mapRes!3287 () Bool)

(declare-fun tp!8739 () Bool)

(declare-fun e!50642 () Bool)

(assert (=> mapNonEmpty!3287 (= mapRes!3287 (and tp!8739 e!50642))))

(declare-fun mapRest!3288 () (Array (_ BitVec 32) ValueCell!910))

(declare-fun mapValue!3288 () ValueCell!910)

(declare-fun mapKey!3288 () (_ BitVec 32))

(assert (=> mapNonEmpty!3287 (= (arr!1892 (_values!2250 newMap!16)) (store mapRest!3288 mapKey!3288 mapValue!3288))))

(declare-fun mapIsEmpty!3287 () Bool)

(declare-fun mapRes!3288 () Bool)

(assert (=> mapIsEmpty!3287 mapRes!3288))

(declare-fun res!40652 () Bool)

(assert (=> start!10146 (=> (not res!40652) (not e!50646))))

(declare-fun valid!309 (LongMap!530) Bool)

(assert (=> start!10146 (= res!40652 (valid!309 thiss!992))))

(assert (=> start!10146 e!50646))

(assert (=> start!10146 e!50639))

(assert (=> start!10146 true))

(assert (=> start!10146 e!50649))

(declare-fun b!77431 () Bool)

(assert (=> b!77431 (= e!50642 tp_is_empty!2507)))

(declare-fun b!77440 () Bool)

(declare-fun Unit!2248 () Unit!2245)

(assert (=> b!77440 (= e!50643 Unit!2248)))

(declare-fun e!50644 () Bool)

(assert (=> b!77441 (= e!50634 (and tp!8742 tp_is_empty!2507 (array_inv!1167 (_keys!3927 (v!2586 (underlying!276 thiss!992)))) (array_inv!1168 (_values!2250 (v!2586 (underlying!276 thiss!992)))) e!50644))))

(declare-fun b!77442 () Bool)

(assert (=> b!77442 (= e!50647 (and e!50645 mapRes!3287))))

(declare-fun condMapEmpty!3287 () Bool)

(declare-fun mapDefault!3288 () ValueCell!910)

