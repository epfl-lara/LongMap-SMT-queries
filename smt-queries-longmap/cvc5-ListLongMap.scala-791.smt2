; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18810 () Bool)

(assert start!18810)

(declare-fun b!185911 () Bool)

(declare-fun b_free!4585 () Bool)

(declare-fun b_next!4585 () Bool)

(assert (=> b!185911 (= b_free!4585 (not b_next!4585))))

(declare-fun tp!16553 () Bool)

(declare-fun b_and!11187 () Bool)

(assert (=> b!185911 (= tp!16553 b_and!11187)))

(declare-fun mapIsEmpty!7497 () Bool)

(declare-fun mapRes!7497 () Bool)

(assert (=> mapIsEmpty!7497 mapRes!7497))

(declare-fun b!185907 () Bool)

(declare-datatypes ((Unit!5600 0))(
  ( (Unit!5601) )
))
(declare-fun e!122347 () Unit!5600)

(declare-fun lt!91897 () Unit!5600)

(assert (=> b!185907 (= e!122347 lt!91897)))

(declare-datatypes ((V!5457 0))(
  ( (V!5458 (val!2223 Int)) )
))
(declare-datatypes ((ValueCell!1835 0))(
  ( (ValueCellFull!1835 (v!4134 V!5457)) (EmptyCell!1835) )
))
(declare-datatypes ((array!7923 0))(
  ( (array!7924 (arr!3741 (Array (_ BitVec 32) (_ BitVec 64))) (size!4057 (_ BitVec 32))) )
))
(declare-datatypes ((array!7925 0))(
  ( (array!7926 (arr!3742 (Array (_ BitVec 32) ValueCell!1835)) (size!4058 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2578 0))(
  ( (LongMapFixedSize!2579 (defaultEntry!3791 Int) (mask!8908 (_ BitVec 32)) (extraKeys!3528 (_ BitVec 32)) (zeroValue!3632 V!5457) (minValue!3632 V!5457) (_size!1338 (_ BitVec 32)) (_keys!5732 array!7923) (_values!3774 array!7925) (_vacant!1338 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2578)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!142 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5600)

(assert (=> b!185907 (= lt!91897 (lemmaInListMapThenSeekEntryOrOpenFindsIt!142 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(declare-fun res!87960 () Bool)

(declare-datatypes ((SeekEntryResult!639 0))(
  ( (MissingZero!639 (index!4726 (_ BitVec 32))) (Found!639 (index!4727 (_ BitVec 32))) (Intermediate!639 (undefined!1451 Bool) (index!4728 (_ BitVec 32)) (x!20185 (_ BitVec 32))) (Undefined!639) (MissingVacant!639 (index!4729 (_ BitVec 32))) )
))
(declare-fun lt!91899 () SeekEntryResult!639)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185907 (= res!87960 (inRange!0 (index!4727 lt!91899) (mask!8908 thiss!1248)))))

(declare-fun e!122340 () Bool)

(assert (=> b!185907 (=> (not res!87960) (not e!122340))))

(assert (=> b!185907 e!122340))

(declare-fun mapNonEmpty!7497 () Bool)

(declare-fun tp!16554 () Bool)

(declare-fun e!122346 () Bool)

(assert (=> mapNonEmpty!7497 (= mapRes!7497 (and tp!16554 e!122346))))

(declare-fun mapValue!7497 () ValueCell!1835)

(declare-fun mapKey!7497 () (_ BitVec 32))

(declare-fun mapRest!7497 () (Array (_ BitVec 32) ValueCell!1835))

(assert (=> mapNonEmpty!7497 (= (arr!3742 (_values!3774 thiss!1248)) (store mapRest!7497 mapKey!7497 mapValue!7497))))

(declare-fun b!185908 () Bool)

(declare-fun e!122344 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185908 (= e!122344 (not (validMask!0 (mask!8908 thiss!1248))))))

(declare-fun lt!91896 () Unit!5600)

(assert (=> b!185908 (= lt!91896 e!122347)))

(declare-fun c!33325 () Bool)

(declare-datatypes ((tuple2!3462 0))(
  ( (tuple2!3463 (_1!1742 (_ BitVec 64)) (_2!1742 V!5457)) )
))
(declare-datatypes ((List!2370 0))(
  ( (Nil!2367) (Cons!2366 (h!2999 tuple2!3462) (t!7254 List!2370)) )
))
(declare-datatypes ((ListLongMap!2379 0))(
  ( (ListLongMap!2380 (toList!1205 List!2370)) )
))
(declare-fun contains!1301 (ListLongMap!2379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!853 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 32) Int) ListLongMap!2379)

(assert (=> b!185908 (= c!33325 (contains!1301 (getCurrentListMap!853 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) key!828))))

(declare-fun b!185909 () Bool)

(declare-fun res!87962 () Bool)

(declare-fun e!122345 () Bool)

(assert (=> b!185909 (=> (not res!87962) (not e!122345))))

(assert (=> b!185909 (= res!87962 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185910 () Bool)

(declare-fun e!122343 () Bool)

(declare-fun e!122339 () Bool)

(assert (=> b!185910 (= e!122343 (and e!122339 mapRes!7497))))

(declare-fun condMapEmpty!7497 () Bool)

(declare-fun mapDefault!7497 () ValueCell!1835)

