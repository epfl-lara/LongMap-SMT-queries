; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9022 () Bool)

(assert start!9022)

(declare-fun b!63939 () Bool)

(declare-fun b_free!2013 () Bool)

(declare-fun b_next!2013 () Bool)

(assert (=> b!63939 (= b_free!2013 (not b_next!2013))))

(declare-fun tp!8176 () Bool)

(declare-fun b_and!3927 () Bool)

(assert (=> b!63939 (= tp!8176 b_and!3927)))

(declare-fun b!63955 () Bool)

(declare-fun b_free!2015 () Bool)

(declare-fun b_next!2015 () Bool)

(assert (=> b!63955 (= b_free!2015 (not b_next!2015))))

(declare-fun tp!8178 () Bool)

(declare-fun b_and!3929 () Bool)

(assert (=> b!63955 (= tp!8178 b_and!3929)))

(declare-fun b!63936 () Bool)

(declare-fun res!34932 () Bool)

(declare-fun e!41936 () Bool)

(assert (=> b!63936 (=> (not res!34932) (not e!41936))))

(declare-datatypes ((V!2877 0))(
  ( (V!2878 (val!1256 Int)) )
))
(declare-datatypes ((array!3779 0))(
  ( (array!3780 (arr!1807 (Array (_ BitVec 32) (_ BitVec 64))) (size!2040 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!868 0))(
  ( (ValueCellFull!868 (v!2436 V!2877)) (EmptyCell!868) )
))
(declare-datatypes ((array!3781 0))(
  ( (array!3782 (arr!1808 (Array (_ BitVec 32) ValueCell!868)) (size!2041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!644 0))(
  ( (LongMapFixedSize!645 (defaultEntry!2110 Int) (mask!6026 (_ BitVec 32)) (extraKeys!1985 (_ BitVec 32)) (zeroValue!2020 V!2877) (minValue!2020 V!2877) (_size!371 (_ BitVec 32)) (_keys!3746 array!3779) (_values!2093 array!3781) (_vacant!371 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!452 0))(
  ( (Cell!453 (v!2437 LongMapFixedSize!644)) )
))
(declare-datatypes ((LongMap!452 0))(
  ( (LongMap!453 (underlying!237 Cell!452)) )
))
(declare-fun thiss!992 () LongMap!452)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!63936 (= res!34932 (validMask!0 (mask!6026 (v!2437 (underlying!237 thiss!992)))))))

(declare-fun b!63937 () Bool)

(declare-fun e!41931 () Bool)

(declare-fun e!41946 () Bool)

(assert (=> b!63937 (= e!41931 e!41946)))

(declare-fun mapIsEmpty!2975 () Bool)

(declare-fun mapRes!2976 () Bool)

(assert (=> mapIsEmpty!2975 mapRes!2976))

(declare-fun b!63938 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3779 (_ BitVec 32)) Bool)

(assert (=> b!63938 (= e!41936 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3746 (v!2437 (underlying!237 thiss!992))) (mask!6026 (v!2437 (underlying!237 thiss!992))))))))

(declare-fun mapNonEmpty!2975 () Bool)

(declare-fun mapRes!2975 () Bool)

(declare-fun tp!8177 () Bool)

(declare-fun e!41941 () Bool)

(assert (=> mapNonEmpty!2975 (= mapRes!2975 (and tp!8177 e!41941))))

(declare-fun mapKey!2976 () (_ BitVec 32))

(declare-fun mapRest!2975 () (Array (_ BitVec 32) ValueCell!868))

(declare-fun mapValue!2975 () ValueCell!868)

(assert (=> mapNonEmpty!2975 (= (arr!1808 (_values!2093 (v!2437 (underlying!237 thiss!992)))) (store mapRest!2975 mapKey!2976 mapValue!2975))))

(declare-fun b!63940 () Bool)

(declare-datatypes ((Unit!1761 0))(
  ( (Unit!1762) )
))
(declare-fun e!41932 () Unit!1761)

(declare-fun Unit!1763 () Unit!1761)

(assert (=> b!63940 (= e!41932 Unit!1763)))

(declare-fun lt!27038 () Unit!1761)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!37 (array!3779 array!3781 (_ BitVec 32) (_ BitVec 32) V!2877 V!2877 (_ BitVec 64) (_ BitVec 32) Int) Unit!1761)

(assert (=> b!63940 (= lt!27038 (lemmaListMapContainsThenArrayContainsFrom!37 (_keys!3746 (v!2437 (underlying!237 thiss!992))) (_values!2093 (v!2437 (underlying!237 thiss!992))) (mask!6026 (v!2437 (underlying!237 thiss!992))) (extraKeys!1985 (v!2437 (underlying!237 thiss!992))) (zeroValue!2020 (v!2437 (underlying!237 thiss!992))) (minValue!2020 (v!2437 (underlying!237 thiss!992))) (select (arr!1807 (_keys!3746 (v!2437 (underlying!237 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2110 (v!2437 (underlying!237 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!63940 (arrayContainsKey!0 (_keys!3746 (v!2437 (underlying!237 thiss!992))) (select (arr!1807 (_keys!3746 (v!2437 (underlying!237 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27037 () Unit!1761)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3779 (_ BitVec 32) (_ BitVec 32)) Unit!1761)

(assert (=> b!63940 (= lt!27037 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3746 (v!2437 (underlying!237 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1446 0))(
  ( (Nil!1443) (Cons!1442 (h!2026 (_ BitVec 64)) (t!4864 List!1446)) )
))
(declare-fun arrayNoDuplicates!0 (array!3779 (_ BitVec 32) List!1446) Bool)

(assert (=> b!63940 (arrayNoDuplicates!0 (_keys!3746 (v!2437 (underlying!237 thiss!992))) from!355 Nil!1443)))

(declare-fun lt!27035 () Unit!1761)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3779 (_ BitVec 32) (_ BitVec 64) List!1446) Unit!1761)

(assert (=> b!63940 (= lt!27035 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3746 (v!2437 (underlying!237 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1807 (_keys!3746 (v!2437 (underlying!237 thiss!992)))) from!355) (Cons!1442 (select (arr!1807 (_keys!3746 (v!2437 (underlying!237 thiss!992)))) from!355) Nil!1443)))))

(assert (=> b!63940 false))

(declare-fun b!63941 () Bool)

(declare-fun res!34926 () Bool)

(assert (=> b!63941 (=> (not res!34926) (not e!41936))))

(assert (=> b!63941 (= res!34926 (and (= (size!2041 (_values!2093 (v!2437 (underlying!237 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6026 (v!2437 (underlying!237 thiss!992))))) (= (size!2040 (_keys!3746 (v!2437 (underlying!237 thiss!992)))) (size!2041 (_values!2093 (v!2437 (underlying!237 thiss!992))))) (bvsge (mask!6026 (v!2437 (underlying!237 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1985 (v!2437 (underlying!237 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1985 (v!2437 (underlying!237 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!63942 () Bool)

(declare-fun e!41943 () Bool)

(declare-fun tp_is_empty!2423 () Bool)

(assert (=> b!63942 (= e!41943 tp_is_empty!2423)))

(declare-fun b!63943 () Bool)

(declare-fun res!34930 () Bool)

(declare-fun e!41938 () Bool)

(assert (=> b!63943 (=> (not res!34930) (not e!41938))))

(declare-fun newMap!16 () LongMapFixedSize!644)

(assert (=> b!63943 (= res!34930 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6026 newMap!16)) (_size!371 (v!2437 (underlying!237 thiss!992)))))))

(declare-fun b!63944 () Bool)

(declare-fun Unit!1764 () Unit!1761)

(assert (=> b!63944 (= e!41932 Unit!1764)))

(declare-fun b!63945 () Bool)

(declare-fun res!34931 () Bool)

(assert (=> b!63945 (=> (not res!34931) (not e!41938))))

(assert (=> b!63945 (= res!34931 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2040 (_keys!3746 (v!2437 (underlying!237 thiss!992)))))))))

(declare-fun mapNonEmpty!2976 () Bool)

(declare-fun tp!8175 () Bool)

(declare-fun e!41939 () Bool)

(assert (=> mapNonEmpty!2976 (= mapRes!2976 (and tp!8175 e!41939))))

(declare-fun mapValue!2976 () ValueCell!868)

(declare-fun mapKey!2975 () (_ BitVec 32))

(declare-fun mapRest!2976 () (Array (_ BitVec 32) ValueCell!868))

(assert (=> mapNonEmpty!2976 (= (arr!1808 (_values!2093 newMap!16)) (store mapRest!2976 mapKey!2975 mapValue!2976))))

(declare-fun b!63946 () Bool)

(declare-fun e!41935 () Bool)

(declare-fun e!41942 () Bool)

(assert (=> b!63946 (= e!41935 (and e!41942 mapRes!2975))))

(declare-fun condMapEmpty!2975 () Bool)

(declare-fun mapDefault!2975 () ValueCell!868)

