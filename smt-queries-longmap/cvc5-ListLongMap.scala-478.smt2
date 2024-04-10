; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9914 () Bool)

(assert start!9914)

(declare-fun b!74939 () Bool)

(declare-fun b_free!2125 () Bool)

(declare-fun b_next!2125 () Bool)

(assert (=> b!74939 (= b_free!2125 (not b_next!2125))))

(declare-fun tp!8559 () Bool)

(declare-fun b_and!4583 () Bool)

(assert (=> b!74939 (= tp!8559 b_and!4583)))

(declare-fun b!74933 () Bool)

(declare-fun b_free!2127 () Bool)

(declare-fun b_next!2127 () Bool)

(assert (=> b!74933 (= b_free!2127 (not b_next!2127))))

(declare-fun tp!8561 () Bool)

(declare-fun b_and!4585 () Bool)

(assert (=> b!74933 (= tp!8561 b_and!4585)))

(declare-fun b!74927 () Bool)

(declare-datatypes ((Unit!2153 0))(
  ( (Unit!2154) )
))
(declare-fun e!48958 () Unit!2153)

(declare-fun Unit!2155 () Unit!2153)

(assert (=> b!74927 (= e!48958 Unit!2155)))

(declare-fun lt!33771 () Unit!2153)

(declare-datatypes ((V!2953 0))(
  ( (V!2954 (val!1284 Int)) )
))
(declare-datatypes ((array!3905 0))(
  ( (array!3906 (arr!1863 (Array (_ BitVec 32) (_ BitVec 64))) (size!2102 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!896 0))(
  ( (ValueCellFull!896 (v!2543 V!2953)) (EmptyCell!896) )
))
(declare-datatypes ((array!3907 0))(
  ( (array!3908 (arr!1864 (Array (_ BitVec 32) ValueCell!896)) (size!2103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!700 0))(
  ( (LongMapFixedSize!701 (defaultEntry!2233 Int) (mask!6210 (_ BitVec 32)) (extraKeys!2088 (_ BitVec 32)) (zeroValue!2133 V!2953) (minValue!2133 V!2953) (_size!399 (_ BitVec 32)) (_keys!3889 array!3905) (_values!2216 array!3907) (_vacant!399 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!502 0))(
  ( (Cell!503 (v!2544 LongMapFixedSize!700)) )
))
(declare-datatypes ((LongMap!502 0))(
  ( (LongMap!503 (underlying!262 Cell!502)) )
))
(declare-fun thiss!992 () LongMap!502)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!50 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2153)

(assert (=> b!74927 (= lt!33771 (lemmaListMapContainsThenArrayContainsFrom!50 (_keys!3889 (v!2544 (underlying!262 thiss!992))) (_values!2216 (v!2544 (underlying!262 thiss!992))) (mask!6210 (v!2544 (underlying!262 thiss!992))) (extraKeys!2088 (v!2544 (underlying!262 thiss!992))) (zeroValue!2133 (v!2544 (underlying!262 thiss!992))) (minValue!2133 (v!2544 (underlying!262 thiss!992))) (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!74927 (arrayContainsKey!0 (_keys!3889 (v!2544 (underlying!262 thiss!992))) (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!33767 () Unit!2153)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3905 (_ BitVec 32) (_ BitVec 32)) Unit!2153)

(assert (=> b!74927 (= lt!33767 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3889 (v!2544 (underlying!262 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1480 0))(
  ( (Nil!1477) (Cons!1476 (h!2064 (_ BitVec 64)) (t!5054 List!1480)) )
))
(declare-fun arrayNoDuplicates!0 (array!3905 (_ BitVec 32) List!1480) Bool)

(assert (=> b!74927 (arrayNoDuplicates!0 (_keys!3889 (v!2544 (underlying!262 thiss!992))) from!355 Nil!1477)))

(declare-fun lt!33769 () Unit!2153)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3905 (_ BitVec 32) (_ BitVec 64) List!1480) Unit!2153)

(assert (=> b!74927 (= lt!33769 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3889 (v!2544 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) (Cons!1476 (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) Nil!1477)))))

(assert (=> b!74927 false))

(declare-fun b!74928 () Bool)

(declare-fun res!39578 () Bool)

(declare-fun e!48955 () Bool)

(assert (=> b!74928 (=> (not res!39578) (not e!48955))))

(declare-fun newMap!16 () LongMapFixedSize!700)

(declare-fun valid!292 (LongMapFixedSize!700) Bool)

(assert (=> b!74928 (= res!39578 (valid!292 newMap!16))))

(declare-fun b!74929 () Bool)

(declare-fun Unit!2156 () Unit!2153)

(assert (=> b!74929 (= e!48958 Unit!2156)))

(declare-fun b!74930 () Bool)

(declare-fun res!39576 () Bool)

(assert (=> b!74930 (=> (not res!39576) (not e!48955))))

(assert (=> b!74930 (= res!39576 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6210 newMap!16)) (_size!399 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun b!74931 () Bool)

(declare-fun e!48965 () Bool)

(declare-fun e!48961 () Bool)

(assert (=> b!74931 (= e!48965 (not e!48961))))

(declare-fun res!39572 () Bool)

(assert (=> b!74931 (=> res!39572 e!48961)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!74931 (= res!39572 (not (validMask!0 (mask!6210 (v!2544 (underlying!262 thiss!992))))))))

(declare-datatypes ((tuple2!2126 0))(
  ( (tuple2!2127 (_1!1074 (_ BitVec 64)) (_2!1074 V!2953)) )
))
(declare-datatypes ((List!1481 0))(
  ( (Nil!1478) (Cons!1477 (h!2065 tuple2!2126) (t!5055 List!1481)) )
))
(declare-datatypes ((ListLongMap!1421 0))(
  ( (ListLongMap!1422 (toList!726 List!1481)) )
))
(declare-fun lt!33772 () ListLongMap!1421)

(declare-fun lt!33770 () tuple2!2126)

(declare-fun lt!33774 () tuple2!2126)

(declare-fun +!95 (ListLongMap!1421 tuple2!2126) ListLongMap!1421)

(assert (=> b!74931 (= (+!95 (+!95 lt!33772 lt!33770) lt!33774) (+!95 (+!95 lt!33772 lt!33774) lt!33770))))

(assert (=> b!74931 (= lt!33774 (tuple2!2127 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun lt!33777 () V!2953)

(assert (=> b!74931 (= lt!33770 (tuple2!2127 (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) lt!33777))))

(declare-fun lt!33773 () Unit!2153)

(declare-fun addCommutativeForDiffKeys!14 (ListLongMap!1421 (_ BitVec 64) V!2953 (_ BitVec 64) V!2953) Unit!2153)

(assert (=> b!74931 (= lt!33773 (addCommutativeForDiffKeys!14 lt!33772 (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) lt!33777 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!60 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1421)

(assert (=> b!74931 (= lt!33772 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2544 (underlying!262 thiss!992))) (_values!2216 (v!2544 (underlying!262 thiss!992))) (mask!6210 (v!2544 (underlying!262 thiss!992))) (extraKeys!2088 (v!2544 (underlying!262 thiss!992))) (zeroValue!2133 (v!2544 (underlying!262 thiss!992))) (minValue!2133 (v!2544 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun b!74932 () Bool)

(declare-fun e!48968 () Bool)

(declare-fun e!48963 () Bool)

(assert (=> b!74932 (= e!48968 e!48963)))

(declare-fun res!39573 () Bool)

(assert (=> b!74932 (=> (not res!39573) (not e!48963))))

(assert (=> b!74932 (= res!39573 (and (not (= (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1145 (ValueCell!896 V!2953) V!2953)

(declare-fun dynLambda!326 (Int (_ BitVec 64)) V!2953)

(assert (=> b!74932 (= lt!33777 (get!1145 (select (arr!1864 (_values!2216 (v!2544 (underlying!262 thiss!992)))) from!355) (dynLambda!326 (defaultEntry!2233 (v!2544 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3191 () Bool)

(declare-fun mapRes!3191 () Bool)

(declare-fun tp!8562 () Bool)

(declare-fun e!48959 () Bool)

(assert (=> mapNonEmpty!3191 (= mapRes!3191 (and tp!8562 e!48959))))

(declare-fun mapValue!3191 () ValueCell!896)

(declare-fun mapRest!3192 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapKey!3191 () (_ BitVec 32))

(assert (=> mapNonEmpty!3191 (= (arr!1864 (_values!2216 newMap!16)) (store mapRest!3192 mapKey!3191 mapValue!3191))))

(declare-fun tp_is_empty!2479 () Bool)

(declare-fun e!48957 () Bool)

(declare-fun e!48956 () Bool)

(declare-fun array_inv!1149 (array!3905) Bool)

(declare-fun array_inv!1150 (array!3907) Bool)

(assert (=> b!74933 (= e!48956 (and tp!8561 tp_is_empty!2479 (array_inv!1149 (_keys!3889 newMap!16)) (array_inv!1150 (_values!2216 newMap!16)) e!48957))))

(declare-fun b!74934 () Bool)

(assert (=> b!74934 (= e!48963 e!48965)))

(declare-fun res!39575 () Bool)

(assert (=> b!74934 (=> (not res!39575) (not e!48965))))

(declare-datatypes ((tuple2!2128 0))(
  ( (tuple2!2129 (_1!1075 Bool) (_2!1075 LongMapFixedSize!700)) )
))
(declare-fun lt!33776 () tuple2!2128)

(assert (=> b!74934 (= res!39575 (and (_1!1075 lt!33776) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!33778 () Unit!2153)

(assert (=> b!74934 (= lt!33778 e!48958)))

(declare-fun c!11336 () Bool)

(declare-fun lt!33768 () ListLongMap!1421)

(declare-fun contains!726 (ListLongMap!1421 (_ BitVec 64)) Bool)

(assert (=> b!74934 (= c!11336 (contains!726 lt!33768 (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355)))))

(declare-fun update!97 (LongMapFixedSize!700 (_ BitVec 64) V!2953) tuple2!2128)

(assert (=> b!74934 (= lt!33776 (update!97 newMap!16 (select (arr!1863 (_keys!3889 (v!2544 (underlying!262 thiss!992)))) from!355) lt!33777))))

(declare-fun mapIsEmpty!3191 () Bool)

(assert (=> mapIsEmpty!3191 mapRes!3191))

(declare-fun b!74935 () Bool)

(declare-fun e!48970 () Bool)

(declare-fun e!48964 () Bool)

(assert (=> b!74935 (= e!48970 e!48964)))

(declare-fun mapIsEmpty!3192 () Bool)

(declare-fun mapRes!3192 () Bool)

(assert (=> mapIsEmpty!3192 mapRes!3192))

(declare-fun b!74936 () Bool)

(assert (=> b!74936 (= e!48955 e!48968)))

(declare-fun res!39577 () Bool)

(assert (=> b!74936 (=> (not res!39577) (not e!48968))))

(declare-fun lt!33775 () ListLongMap!1421)

(assert (=> b!74936 (= res!39577 (= lt!33775 lt!33768))))

(declare-fun map!1154 (LongMapFixedSize!700) ListLongMap!1421)

(assert (=> b!74936 (= lt!33768 (map!1154 newMap!16))))

(declare-fun getCurrentListMap!423 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1421)

(assert (=> b!74936 (= lt!33775 (getCurrentListMap!423 (_keys!3889 (v!2544 (underlying!262 thiss!992))) (_values!2216 (v!2544 (underlying!262 thiss!992))) (mask!6210 (v!2544 (underlying!262 thiss!992))) (extraKeys!2088 (v!2544 (underlying!262 thiss!992))) (zeroValue!2133 (v!2544 (underlying!262 thiss!992))) (minValue!2133 (v!2544 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2544 (underlying!262 thiss!992)))))))

(declare-fun b!74937 () Bool)

(declare-fun e!48966 () Bool)

(assert (=> b!74937 (= e!48966 e!48970)))

(declare-fun b!74938 () Bool)

(declare-fun e!48971 () Bool)

(assert (=> b!74938 (= e!48957 (and e!48971 mapRes!3191))))

(declare-fun condMapEmpty!3191 () Bool)

(declare-fun mapDefault!3191 () ValueCell!896)

