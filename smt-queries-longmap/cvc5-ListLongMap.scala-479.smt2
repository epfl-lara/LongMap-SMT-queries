; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10022 () Bool)

(assert start!10022)

(declare-fun b!75919 () Bool)

(declare-fun b_free!2137 () Bool)

(declare-fun b_next!2137 () Bool)

(assert (=> b!75919 (= b_free!2137 (not b_next!2137))))

(declare-fun tp!8601 () Bool)

(declare-fun b_and!4639 () Bool)

(assert (=> b!75919 (= tp!8601 b_and!4639)))

(declare-fun b!75918 () Bool)

(declare-fun b_free!2139 () Bool)

(declare-fun b_next!2139 () Bool)

(assert (=> b!75918 (= b_free!2139 (not b_next!2139))))

(declare-fun tp!8604 () Bool)

(declare-fun b_and!4641 () Bool)

(assert (=> b!75918 (= tp!8604 b_and!4641)))

(declare-fun b!75907 () Bool)

(declare-fun e!49587 () Bool)

(declare-fun e!49583 () Bool)

(assert (=> b!75907 (= e!49587 e!49583)))

(declare-fun b!75908 () Bool)

(declare-fun e!49584 () Bool)

(assert (=> b!75908 (= e!49583 e!49584)))

(declare-fun b!75909 () Bool)

(declare-datatypes ((Unit!2190 0))(
  ( (Unit!2191) )
))
(declare-fun e!49576 () Unit!2190)

(declare-fun Unit!2192 () Unit!2190)

(assert (=> b!75909 (= e!49576 Unit!2192)))

(declare-fun lt!34463 () Unit!2190)

(declare-datatypes ((V!2961 0))(
  ( (V!2962 (val!1287 Int)) )
))
(declare-datatypes ((array!3919 0))(
  ( (array!3920 (arr!1869 (Array (_ BitVec 32) (_ BitVec 64))) (size!2109 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!899 0))(
  ( (ValueCellFull!899 (v!2556 V!2961)) (EmptyCell!899) )
))
(declare-datatypes ((array!3921 0))(
  ( (array!3922 (arr!1870 (Array (_ BitVec 32) ValueCell!899)) (size!2110 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!706 0))(
  ( (LongMapFixedSize!707 (defaultEntry!2246 Int) (mask!6229 (_ BitVec 32)) (extraKeys!2099 (_ BitVec 32)) (zeroValue!2145 V!2961) (minValue!2145 V!2961) (_size!402 (_ BitVec 32)) (_keys!3904 array!3919) (_values!2229 array!3921) (_vacant!402 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!508 0))(
  ( (Cell!509 (v!2557 LongMapFixedSize!706)) )
))
(declare-datatypes ((LongMap!508 0))(
  ( (LongMap!509 (underlying!265 Cell!508)) )
))
(declare-fun thiss!992 () LongMap!508)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!53 (array!3919 array!3921 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2190)

(assert (=> b!75909 (= lt!34463 (lemmaListMapContainsThenArrayContainsFrom!53 (_keys!3904 (v!2557 (underlying!265 thiss!992))) (_values!2229 (v!2557 (underlying!265 thiss!992))) (mask!6229 (v!2557 (underlying!265 thiss!992))) (extraKeys!2099 (v!2557 (underlying!265 thiss!992))) (zeroValue!2145 (v!2557 (underlying!265 thiss!992))) (minValue!2145 (v!2557 (underlying!265 thiss!992))) (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2557 (underlying!265 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75909 (arrayContainsKey!0 (_keys!3904 (v!2557 (underlying!265 thiss!992))) (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!34464 () Unit!2190)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3919 (_ BitVec 32) (_ BitVec 32)) Unit!2190)

(assert (=> b!75909 (= lt!34464 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3904 (v!2557 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1486 0))(
  ( (Nil!1483) (Cons!1482 (h!2070 (_ BitVec 64)) (t!5076 List!1486)) )
))
(declare-fun arrayNoDuplicates!0 (array!3919 (_ BitVec 32) List!1486) Bool)

(assert (=> b!75909 (arrayNoDuplicates!0 (_keys!3904 (v!2557 (underlying!265 thiss!992))) from!355 Nil!1483)))

(declare-fun lt!34470 () Unit!2190)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3919 (_ BitVec 32) (_ BitVec 64) List!1486) Unit!2190)

(assert (=> b!75909 (= lt!34470 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3904 (v!2557 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) (Cons!1482 (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) Nil!1483)))))

(assert (=> b!75909 false))

(declare-fun b!75910 () Bool)

(declare-fun e!49579 () Bool)

(declare-fun e!49582 () Bool)

(assert (=> b!75910 (= e!49579 (not e!49582))))

(declare-fun res!40002 () Bool)

(assert (=> b!75910 (=> res!40002 e!49582)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75910 (= res!40002 (not (validMask!0 (mask!6229 (v!2557 (underlying!265 thiss!992))))))))

(declare-datatypes ((tuple2!2138 0))(
  ( (tuple2!2139 (_1!1080 (_ BitVec 64)) (_2!1080 V!2961)) )
))
(declare-datatypes ((List!1487 0))(
  ( (Nil!1484) (Cons!1483 (h!2071 tuple2!2138) (t!5077 List!1487)) )
))
(declare-datatypes ((ListLongMap!1427 0))(
  ( (ListLongMap!1428 (toList!729 List!1487)) )
))
(declare-fun lt!34467 () ListLongMap!1427)

(declare-fun lt!34468 () tuple2!2138)

(declare-fun lt!34473 () tuple2!2138)

(declare-fun +!98 (ListLongMap!1427 tuple2!2138) ListLongMap!1427)

(assert (=> b!75910 (= (+!98 (+!98 lt!34467 lt!34468) lt!34473) (+!98 (+!98 lt!34467 lt!34473) lt!34468))))

(assert (=> b!75910 (= lt!34473 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2557 (underlying!265 thiss!992)))))))

(declare-fun lt!34472 () V!2961)

(assert (=> b!75910 (= lt!34468 (tuple2!2139 (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) lt!34472))))

(declare-fun lt!34466 () Unit!2190)

(declare-fun addCommutativeForDiffKeys!17 (ListLongMap!1427 (_ BitVec 64) V!2961 (_ BitVec 64) V!2961) Unit!2190)

(assert (=> b!75910 (= lt!34466 (addCommutativeForDiffKeys!17 lt!34467 (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) lt!34472 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2557 (underlying!265 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!63 (array!3919 array!3921 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) ListLongMap!1427)

(assert (=> b!75910 (= lt!34467 (getCurrentListMapNoExtraKeys!63 (_keys!3904 (v!2557 (underlying!265 thiss!992))) (_values!2229 (v!2557 (underlying!265 thiss!992))) (mask!6229 (v!2557 (underlying!265 thiss!992))) (extraKeys!2099 (v!2557 (underlying!265 thiss!992))) (zeroValue!2145 (v!2557 (underlying!265 thiss!992))) (minValue!2145 (v!2557 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2557 (underlying!265 thiss!992)))))))

(declare-fun res!40006 () Bool)

(declare-fun e!49588 () Bool)

(assert (=> start!10022 (=> (not res!40006) (not e!49588))))

(declare-fun valid!297 (LongMap!508) Bool)

(assert (=> start!10022 (= res!40006 (valid!297 thiss!992))))

(assert (=> start!10022 e!49588))

(assert (=> start!10022 e!49587))

(assert (=> start!10022 true))

(declare-fun e!49589 () Bool)

(assert (=> start!10022 e!49589))

(declare-fun b!75911 () Bool)

(declare-fun e!49575 () Bool)

(declare-fun e!49578 () Bool)

(assert (=> b!75911 (= e!49575 e!49578)))

(declare-fun res!40000 () Bool)

(assert (=> b!75911 (=> (not res!40000) (not e!49578))))

(assert (=> b!75911 (= res!40000 (and (not (= (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1869 (_keys!3904 (v!2557 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1153 (ValueCell!899 V!2961) V!2961)

(declare-fun dynLambda!329 (Int (_ BitVec 64)) V!2961)

(assert (=> b!75911 (= lt!34472 (get!1153 (select (arr!1870 (_values!2229 (v!2557 (underlying!265 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2557 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75912 () Bool)

(declare-fun e!49580 () Bool)

(declare-fun tp_is_empty!2485 () Bool)

(assert (=> b!75912 (= e!49580 tp_is_empty!2485)))

(declare-fun mapNonEmpty!3215 () Bool)

(declare-fun mapRes!3215 () Bool)

(declare-fun tp!8603 () Bool)

(declare-fun e!49577 () Bool)

(assert (=> mapNonEmpty!3215 (= mapRes!3215 (and tp!8603 e!49577))))

(declare-fun mapRest!3215 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun newMap!16 () LongMapFixedSize!706)

(declare-fun mapValue!3216 () ValueCell!899)

(declare-fun mapKey!3216 () (_ BitVec 32))

(assert (=> mapNonEmpty!3215 (= (arr!1870 (_values!2229 newMap!16)) (store mapRest!3215 mapKey!3216 mapValue!3216))))

(declare-fun b!75913 () Bool)

(declare-fun e!49585 () Bool)

(declare-fun e!49592 () Bool)

(declare-fun mapRes!3216 () Bool)

(assert (=> b!75913 (= e!49585 (and e!49592 mapRes!3216))))

(declare-fun condMapEmpty!3216 () Bool)

(declare-fun mapDefault!3216 () ValueCell!899)

