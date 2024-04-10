; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10142 () Bool)

(assert start!10142)

(declare-fun b!77325 () Bool)

(declare-fun b_free!2173 () Bool)

(declare-fun b_next!2173 () Bool)

(assert (=> b!77325 (= b_free!2173 (not b_next!2173))))

(declare-fun tp!8716 () Bool)

(declare-fun b_and!4747 () Bool)

(assert (=> b!77325 (= tp!8716 b_and!4747)))

(declare-fun b!77322 () Bool)

(declare-fun b_free!2175 () Bool)

(declare-fun b_next!2175 () Bool)

(assert (=> b!77322 (= b_free!2175 (not b_next!2175))))

(declare-fun tp!8717 () Bool)

(declare-fun b_and!4749 () Bool)

(assert (=> b!77322 (= tp!8717 b_and!4749)))

(declare-fun mapNonEmpty!3275 () Bool)

(declare-fun mapRes!3275 () Bool)

(declare-fun tp!8718 () Bool)

(declare-fun e!50539 () Bool)

(assert (=> mapNonEmpty!3275 (= mapRes!3275 (and tp!8718 e!50539))))

(declare-datatypes ((V!2985 0))(
  ( (V!2986 (val!1296 Int)) )
))
(declare-datatypes ((ValueCell!908 0))(
  ( (ValueCellFull!908 (v!2581 V!2985)) (EmptyCell!908) )
))
(declare-fun mapValue!3276 () ValueCell!908)

(declare-fun mapRest!3275 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapKey!3276 () (_ BitVec 32))

(declare-datatypes ((array!3957 0))(
  ( (array!3958 (arr!1887 (Array (_ BitVec 32) (_ BitVec 64))) (size!2128 (_ BitVec 32))) )
))
(declare-datatypes ((array!3959 0))(
  ( (array!3960 (arr!1888 (Array (_ BitVec 32) ValueCell!908)) (size!2129 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!724 0))(
  ( (LongMapFixedSize!725 (defaultEntry!2265 Int) (mask!6258 (_ BitVec 32)) (extraKeys!2116 (_ BitVec 32)) (zeroValue!2163 V!2985) (minValue!2163 V!2985) (_size!411 (_ BitVec 32)) (_keys!3925 array!3957) (_values!2248 array!3959) (_vacant!411 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!724)

(assert (=> mapNonEmpty!3275 (= (arr!1888 (_values!2248 newMap!16)) (store mapRest!3275 mapKey!3276 mapValue!3276))))

(declare-fun b!77311 () Bool)

(declare-datatypes ((Unit!2237 0))(
  ( (Unit!2238) )
))
(declare-fun e!50544 () Unit!2237)

(declare-fun Unit!2239 () Unit!2237)

(assert (=> b!77311 (= e!50544 Unit!2239)))

(declare-fun lt!35417 () Unit!2237)

(declare-datatypes ((Cell!526 0))(
  ( (Cell!527 (v!2582 LongMapFixedSize!724)) )
))
(declare-datatypes ((LongMap!526 0))(
  ( (LongMap!527 (underlying!274 Cell!526)) )
))
(declare-fun thiss!992 () LongMap!526)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!58 (array!3957 array!3959 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) (_ BitVec 32) Int) Unit!2237)

(assert (=> b!77311 (= lt!35417 (lemmaListMapContainsThenArrayContainsFrom!58 (_keys!3925 (v!2582 (underlying!274 thiss!992))) (_values!2248 (v!2582 (underlying!274 thiss!992))) (mask!6258 (v!2582 (underlying!274 thiss!992))) (extraKeys!2116 (v!2582 (underlying!274 thiss!992))) (zeroValue!2163 (v!2582 (underlying!274 thiss!992))) (minValue!2163 (v!2582 (underlying!274 thiss!992))) (select (arr!1887 (_keys!3925 (v!2582 (underlying!274 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2582 (underlying!274 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77311 (arrayContainsKey!0 (_keys!3925 (v!2582 (underlying!274 thiss!992))) (select (arr!1887 (_keys!3925 (v!2582 (underlying!274 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35416 () Unit!2237)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3957 (_ BitVec 32) (_ BitVec 32)) Unit!2237)

(assert (=> b!77311 (= lt!35416 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3925 (v!2582 (underlying!274 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1500 0))(
  ( (Nil!1497) (Cons!1496 (h!2084 (_ BitVec 64)) (t!5130 List!1500)) )
))
(declare-fun arrayNoDuplicates!0 (array!3957 (_ BitVec 32) List!1500) Bool)

(assert (=> b!77311 (arrayNoDuplicates!0 (_keys!3925 (v!2582 (underlying!274 thiss!992))) from!355 Nil!1497)))

(declare-fun lt!35411 () Unit!2237)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3957 (_ BitVec 32) (_ BitVec 64) List!1500) Unit!2237)

(assert (=> b!77311 (= lt!35411 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3925 (v!2582 (underlying!274 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1887 (_keys!3925 (v!2582 (underlying!274 thiss!992)))) from!355) (Cons!1496 (select (arr!1887 (_keys!3925 (v!2582 (underlying!274 thiss!992)))) from!355) Nil!1497)))))

(assert (=> b!77311 false))

(declare-fun b!77312 () Bool)

(declare-fun res!40607 () Bool)

(declare-fun e!50545 () Bool)

(assert (=> b!77312 (=> (not res!40607) (not e!50545))))

(assert (=> b!77312 (= res!40607 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6258 newMap!16)) (_size!411 (v!2582 (underlying!274 thiss!992)))))))

(declare-fun b!77313 () Bool)

(declare-fun Unit!2240 () Unit!2237)

(assert (=> b!77313 (= e!50544 Unit!2240)))

(declare-fun b!77314 () Bool)

(declare-fun e!50531 () Bool)

(declare-fun e!50533 () Bool)

(assert (=> b!77314 (= e!50531 (and e!50533 mapRes!3275))))

(declare-fun condMapEmpty!3275 () Bool)

(declare-fun mapDefault!3276 () ValueCell!908)

