; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18814 () Bool)

(assert start!18814)

(declare-fun b!185970 () Bool)

(declare-fun b_free!4589 () Bool)

(declare-fun b_next!4589 () Bool)

(assert (=> b!185970 (= b_free!4589 (not b_next!4589))))

(declare-fun tp!16565 () Bool)

(declare-fun b_and!11191 () Bool)

(assert (=> b!185970 (= tp!16565 b_and!11191)))

(declare-fun res!87983 () Bool)

(declare-fun e!122399 () Bool)

(assert (=> start!18814 (=> (not res!87983) (not e!122399))))

(declare-datatypes ((V!5461 0))(
  ( (V!5462 (val!2225 Int)) )
))
(declare-datatypes ((ValueCell!1837 0))(
  ( (ValueCellFull!1837 (v!4136 V!5461)) (EmptyCell!1837) )
))
(declare-datatypes ((array!7931 0))(
  ( (array!7932 (arr!3745 (Array (_ BitVec 32) (_ BitVec 64))) (size!4061 (_ BitVec 32))) )
))
(declare-datatypes ((array!7933 0))(
  ( (array!7934 (arr!3746 (Array (_ BitVec 32) ValueCell!1837)) (size!4062 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2582 0))(
  ( (LongMapFixedSize!2583 (defaultEntry!3793 Int) (mask!8910 (_ BitVec 32)) (extraKeys!3530 (_ BitVec 32)) (zeroValue!3634 V!5461) (minValue!3634 V!5461) (_size!1340 (_ BitVec 32)) (_keys!5734 array!7931) (_values!3776 array!7933) (_vacant!1340 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2582)

(declare-fun valid!1064 (LongMapFixedSize!2582) Bool)

(assert (=> start!18814 (= res!87983 (valid!1064 thiss!1248))))

(assert (=> start!18814 e!122399))

(declare-fun e!122398 () Bool)

(assert (=> start!18814 e!122398))

(assert (=> start!18814 true))

(declare-fun b!185967 () Bool)

(declare-fun e!122401 () Bool)

(assert (=> b!185967 (= e!122399 e!122401)))

(declare-fun res!87984 () Bool)

(assert (=> b!185967 (=> (not res!87984) (not e!122401))))

(declare-datatypes ((SeekEntryResult!641 0))(
  ( (MissingZero!641 (index!4734 (_ BitVec 32))) (Found!641 (index!4735 (_ BitVec 32))) (Intermediate!641 (undefined!1453 Bool) (index!4736 (_ BitVec 32)) (x!20187 (_ BitVec 32))) (Undefined!641) (MissingVacant!641 (index!4737 (_ BitVec 32))) )
))
(declare-fun lt!91921 () SeekEntryResult!641)

(assert (=> b!185967 (= res!87984 (and (not (is-Undefined!641 lt!91921)) (not (is-MissingVacant!641 lt!91921)) (not (is-MissingZero!641 lt!91921)) (is-Found!641 lt!91921)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7931 (_ BitVec 32)) SeekEntryResult!641)

(assert (=> b!185967 (= lt!91921 (seekEntryOrOpen!0 key!828 (_keys!5734 thiss!1248) (mask!8910 thiss!1248)))))

(declare-fun mapIsEmpty!7503 () Bool)

(declare-fun mapRes!7503 () Bool)

(assert (=> mapIsEmpty!7503 mapRes!7503))

(declare-fun e!122393 () Bool)

(declare-fun b!185968 () Bool)

(assert (=> b!185968 (= e!122393 (= (select (arr!3745 (_keys!5734 thiss!1248)) (index!4735 lt!91921)) key!828))))

(declare-fun b!185969 () Bool)

(declare-datatypes ((Unit!5605 0))(
  ( (Unit!5606) )
))
(declare-fun e!122394 () Unit!5605)

(declare-fun Unit!5607 () Unit!5605)

(assert (=> b!185969 (= e!122394 Unit!5607)))

(declare-fun lt!91923 () Unit!5605)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!146 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5461 V!5461 (_ BitVec 64) Int) Unit!5605)

(assert (=> b!185969 (= lt!91923 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!146 (_keys!5734 thiss!1248) (_values!3776 thiss!1248) (mask!8910 thiss!1248) (extraKeys!3530 thiss!1248) (zeroValue!3634 thiss!1248) (minValue!3634 thiss!1248) key!828 (defaultEntry!3793 thiss!1248)))))

(assert (=> b!185969 false))

(declare-fun e!122397 () Bool)

(declare-fun tp_is_empty!4361 () Bool)

(declare-fun array_inv!2421 (array!7931) Bool)

(declare-fun array_inv!2422 (array!7933) Bool)

(assert (=> b!185970 (= e!122398 (and tp!16565 tp_is_empty!4361 (array_inv!2421 (_keys!5734 thiss!1248)) (array_inv!2422 (_values!3776 thiss!1248)) e!122397))))

(declare-fun b!185971 () Bool)

(declare-fun e!122395 () Bool)

(assert (=> b!185971 (= e!122395 tp_is_empty!4361)))

(declare-fun b!185972 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185972 (= e!122401 (not (validMask!0 (mask!8910 thiss!1248))))))

(declare-fun lt!91920 () Unit!5605)

(assert (=> b!185972 (= lt!91920 e!122394)))

(declare-fun c!33331 () Bool)

(declare-datatypes ((tuple2!3466 0))(
  ( (tuple2!3467 (_1!1744 (_ BitVec 64)) (_2!1744 V!5461)) )
))
(declare-datatypes ((List!2372 0))(
  ( (Nil!2369) (Cons!2368 (h!3001 tuple2!3466) (t!7256 List!2372)) )
))
(declare-datatypes ((ListLongMap!2383 0))(
  ( (ListLongMap!2384 (toList!1207 List!2372)) )
))
(declare-fun contains!1303 (ListLongMap!2383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!855 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5461 V!5461 (_ BitVec 32) Int) ListLongMap!2383)

(assert (=> b!185972 (= c!33331 (contains!1303 (getCurrentListMap!855 (_keys!5734 thiss!1248) (_values!3776 thiss!1248) (mask!8910 thiss!1248) (extraKeys!3530 thiss!1248) (zeroValue!3634 thiss!1248) (minValue!3634 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3793 thiss!1248)) key!828))))

(declare-fun b!185973 () Bool)

(declare-fun res!87986 () Bool)

(assert (=> b!185973 (=> (not res!87986) (not e!122399))))

(assert (=> b!185973 (= res!87986 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7503 () Bool)

(declare-fun tp!16566 () Bool)

(declare-fun e!122400 () Bool)

(assert (=> mapNonEmpty!7503 (= mapRes!7503 (and tp!16566 e!122400))))

(declare-fun mapKey!7503 () (_ BitVec 32))

(declare-fun mapValue!7503 () ValueCell!1837)

(declare-fun mapRest!7503 () (Array (_ BitVec 32) ValueCell!1837))

(assert (=> mapNonEmpty!7503 (= (arr!3746 (_values!3776 thiss!1248)) (store mapRest!7503 mapKey!7503 mapValue!7503))))

(declare-fun b!185974 () Bool)

(assert (=> b!185974 (= e!122397 (and e!122395 mapRes!7503))))

(declare-fun condMapEmpty!7503 () Bool)

(declare-fun mapDefault!7503 () ValueCell!1837)

