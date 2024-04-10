; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9018 () Bool)

(assert start!9018)

(declare-fun b!63826 () Bool)

(declare-fun b_free!2005 () Bool)

(declare-fun b_next!2005 () Bool)

(assert (=> b!63826 (= b_free!2005 (not b_next!2005))))

(declare-fun tp!8151 () Bool)

(declare-fun b_and!3911 () Bool)

(assert (=> b!63826 (= tp!8151 b_and!3911)))

(declare-fun b!63831 () Bool)

(declare-fun b_free!2007 () Bool)

(declare-fun b_next!2007 () Bool)

(assert (=> b!63831 (= b_free!2007 (not b_next!2007))))

(declare-fun tp!8152 () Bool)

(declare-fun b_and!3913 () Bool)

(assert (=> b!63831 (= tp!8152 b_and!3913)))

(declare-fun b!63812 () Bool)

(declare-fun e!41842 () Bool)

(declare-fun tp_is_empty!2419 () Bool)

(assert (=> b!63812 (= e!41842 tp_is_empty!2419)))

(declare-fun b!63814 () Bool)

(declare-fun res!34884 () Bool)

(declare-fun e!41835 () Bool)

(assert (=> b!63814 (=> (not res!34884) (not e!41835))))

(declare-datatypes ((V!2873 0))(
  ( (V!2874 (val!1254 Int)) )
))
(declare-datatypes ((array!3771 0))(
  ( (array!3772 (arr!1803 (Array (_ BitVec 32) (_ BitVec 64))) (size!2036 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!866 0))(
  ( (ValueCellFull!866 (v!2432 V!2873)) (EmptyCell!866) )
))
(declare-datatypes ((array!3773 0))(
  ( (array!3774 (arr!1804 (Array (_ BitVec 32) ValueCell!866)) (size!2037 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!640 0))(
  ( (LongMapFixedSize!641 (defaultEntry!2108 Int) (mask!6024 (_ BitVec 32)) (extraKeys!1983 (_ BitVec 32)) (zeroValue!2018 V!2873) (minValue!2018 V!2873) (_size!369 (_ BitVec 32)) (_keys!3744 array!3771) (_values!2091 array!3773) (_vacant!369 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!640)

(declare-datatypes ((Cell!448 0))(
  ( (Cell!449 (v!2433 LongMapFixedSize!640)) )
))
(declare-datatypes ((LongMap!448 0))(
  ( (LongMap!449 (underlying!235 Cell!448)) )
))
(declare-fun thiss!992 () LongMap!448)

(assert (=> b!63814 (= res!34884 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6024 newMap!16)) (_size!369 (v!2433 (underlying!235 thiss!992)))))))

(declare-fun b!63815 () Bool)

(declare-fun e!41838 () Bool)

(assert (=> b!63815 (= e!41838 tp_is_empty!2419)))

(declare-fun b!63816 () Bool)

(declare-datatypes ((Unit!1754 0))(
  ( (Unit!1755) )
))
(declare-fun e!41848 () Unit!1754)

(declare-fun Unit!1756 () Unit!1754)

(assert (=> b!63816 (= e!41848 Unit!1756)))

(declare-fun lt!26998 () Unit!1754)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!35 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1754)

(assert (=> b!63816 (= lt!26998 (lemmaListMapContainsThenArrayContainsFrom!35 (_keys!3744 (v!2433 (underlying!235 thiss!992))) (_values!2091 (v!2433 (underlying!235 thiss!992))) (mask!6024 (v!2433 (underlying!235 thiss!992))) (extraKeys!1983 (v!2433 (underlying!235 thiss!992))) (zeroValue!2018 (v!2433 (underlying!235 thiss!992))) (minValue!2018 (v!2433 (underlying!235 thiss!992))) (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2433 (underlying!235 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!63816 (arrayContainsKey!0 (_keys!3744 (v!2433 (underlying!235 thiss!992))) (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!26997 () Unit!1754)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3771 (_ BitVec 32) (_ BitVec 32)) Unit!1754)

(assert (=> b!63816 (= lt!26997 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3744 (v!2433 (underlying!235 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1442 0))(
  ( (Nil!1439) (Cons!1438 (h!2022 (_ BitVec 64)) (t!4852 List!1442)) )
))
(declare-fun arrayNoDuplicates!0 (array!3771 (_ BitVec 32) List!1442) Bool)

(assert (=> b!63816 (arrayNoDuplicates!0 (_keys!3744 (v!2433 (underlying!235 thiss!992))) from!355 Nil!1439)))

(declare-fun lt!26993 () Unit!1754)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3771 (_ BitVec 32) (_ BitVec 64) List!1442) Unit!1754)

(assert (=> b!63816 (= lt!26993 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3744 (v!2433 (underlying!235 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355) (Cons!1438 (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355) Nil!1439)))))

(assert (=> b!63816 false))

(declare-fun b!63817 () Bool)

(declare-fun res!34881 () Bool)

(assert (=> b!63817 (=> (not res!34881) (not e!41835))))

(declare-fun valid!264 (LongMapFixedSize!640) Bool)

(assert (=> b!63817 (= res!34881 (valid!264 newMap!16))))

(declare-fun b!63818 () Bool)

(declare-fun e!41846 () Bool)

(declare-fun e!41839 () Bool)

(assert (=> b!63818 (= e!41846 e!41839)))

(declare-fun res!34880 () Bool)

(assert (=> b!63818 (=> (not res!34880) (not e!41839))))

(declare-datatypes ((tuple2!2046 0))(
  ( (tuple2!2047 (_1!1034 Bool) (_2!1034 LongMapFixedSize!640)) )
))
(declare-fun lt!26994 () tuple2!2046)

(assert (=> b!63818 (= res!34880 (and (_1!1034 lt!26994) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!26996 () Unit!1754)

(assert (=> b!63818 (= lt!26996 e!41848)))

(declare-datatypes ((tuple2!2048 0))(
  ( (tuple2!2049 (_1!1035 (_ BitVec 64)) (_2!1035 V!2873)) )
))
(declare-datatypes ((List!1443 0))(
  ( (Nil!1440) (Cons!1439 (h!2023 tuple2!2048) (t!4853 List!1443)) )
))
(declare-datatypes ((ListLongMap!1377 0))(
  ( (ListLongMap!1378 (toList!704 List!1443)) )
))
(declare-fun lt!26999 () ListLongMap!1377)

(declare-fun c!8673 () Bool)

(declare-fun contains!694 (ListLongMap!1377 (_ BitVec 64)) Bool)

(assert (=> b!63818 (= c!8673 (contains!694 lt!26999 (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355)))))

(declare-fun update!79 (LongMapFixedSize!640 (_ BitVec 64) V!2873) tuple2!2046)

(declare-fun get!1089 (ValueCell!866 V!2873) V!2873)

(declare-fun dynLambda!310 (Int (_ BitVec 64)) V!2873)

(assert (=> b!63818 (= lt!26994 (update!79 newMap!16 (select (arr!1803 (_keys!3744 (v!2433 (underlying!235 thiss!992)))) from!355) (get!1089 (select (arr!1804 (_values!2091 (v!2433 (underlying!235 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2433 (underlying!235 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!63819 () Bool)

(declare-fun res!34883 () Bool)

(assert (=> b!63819 (=> (not res!34883) (not e!41835))))

(assert (=> b!63819 (= res!34883 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2036 (_keys!3744 (v!2433 (underlying!235 thiss!992)))))))))

(declare-fun b!63820 () Bool)

(declare-fun e!41845 () Bool)

(assert (=> b!63820 (= e!41845 tp_is_empty!2419)))

(declare-fun mapIsEmpty!2963 () Bool)

(declare-fun mapRes!2964 () Bool)

(assert (=> mapIsEmpty!2963 mapRes!2964))

(declare-fun mapNonEmpty!2963 () Bool)

(declare-fun mapRes!2963 () Bool)

(declare-fun tp!8154 () Bool)

(declare-fun e!41849 () Bool)

(assert (=> mapNonEmpty!2963 (= mapRes!2963 (and tp!8154 e!41849))))

(declare-fun mapRest!2963 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2963 () ValueCell!866)

(declare-fun mapKey!2964 () (_ BitVec 32))

(assert (=> mapNonEmpty!2963 (= (arr!1804 (_values!2091 (v!2433 (underlying!235 thiss!992)))) (store mapRest!2963 mapKey!2964 mapValue!2963))))

(declare-fun b!63821 () Bool)

(declare-fun e!41843 () Bool)

(declare-fun e!41844 () Bool)

(assert (=> b!63821 (= e!41843 e!41844)))

(declare-fun b!63813 () Bool)

(declare-fun e!41837 () Bool)

(assert (=> b!63813 (= e!41837 (and e!41842 mapRes!2963))))

(declare-fun condMapEmpty!2963 () Bool)

(declare-fun mapDefault!2964 () ValueCell!866)

