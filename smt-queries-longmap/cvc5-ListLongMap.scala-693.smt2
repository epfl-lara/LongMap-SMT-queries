; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16662 () Bool)

(assert start!16662)

(declare-fun b!166671 () Bool)

(declare-fun b_free!3967 () Bool)

(declare-fun b_next!3967 () Bool)

(assert (=> b!166671 (= b_free!3967 (not b_next!3967))))

(declare-fun tp!14501 () Bool)

(declare-fun b_and!10381 () Bool)

(assert (=> b!166671 (= tp!14501 b_and!10381)))

(declare-fun b!166668 () Bool)

(declare-datatypes ((Unit!5075 0))(
  ( (Unit!5076) )
))
(declare-fun e!109377 () Unit!5075)

(declare-fun Unit!5077 () Unit!5075)

(assert (=> b!166668 (= e!109377 Unit!5077)))

(declare-fun lt!83397 () Unit!5075)

(declare-datatypes ((V!4673 0))(
  ( (V!4674 (val!1929 Int)) )
))
(declare-datatypes ((ValueCell!1541 0))(
  ( (ValueCellFull!1541 (v!3794 V!4673)) (EmptyCell!1541) )
))
(declare-datatypes ((array!6635 0))(
  ( (array!6636 (arr!3153 (Array (_ BitVec 32) (_ BitVec 64))) (size!3441 (_ BitVec 32))) )
))
(declare-datatypes ((array!6637 0))(
  ( (array!6638 (arr!3154 (Array (_ BitVec 32) ValueCell!1541)) (size!3442 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1990 0))(
  ( (LongMapFixedSize!1991 (defaultEntry!3437 Int) (mask!8172 (_ BitVec 32)) (extraKeys!3178 (_ BitVec 32)) (zeroValue!3280 V!4673) (minValue!3280 V!4673) (_size!1044 (_ BitVec 32)) (_keys!5262 array!6635) (_values!3420 array!6637) (_vacant!1044 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1990)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!92 (array!6635 array!6637 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5075)

(assert (=> b!166668 (= lt!83397 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!92 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(assert (=> b!166668 false))

(declare-fun b!166669 () Bool)

(declare-fun e!109370 () Bool)

(declare-fun e!109379 () Bool)

(assert (=> b!166669 (= e!109370 e!109379)))

(declare-fun res!79224 () Bool)

(assert (=> b!166669 (=> (not res!79224) (not e!109379))))

(declare-datatypes ((SeekEntryResult!461 0))(
  ( (MissingZero!461 (index!4012 (_ BitVec 32))) (Found!461 (index!4013 (_ BitVec 32))) (Intermediate!461 (undefined!1273 Bool) (index!4014 (_ BitVec 32)) (x!18457 (_ BitVec 32))) (Undefined!461) (MissingVacant!461 (index!4015 (_ BitVec 32))) )
))
(declare-fun lt!83395 () SeekEntryResult!461)

(assert (=> b!166669 (= res!79224 (and (not (is-Undefined!461 lt!83395)) (not (is-MissingVacant!461 lt!83395)) (not (is-MissingZero!461 lt!83395)) (is-Found!461 lt!83395)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6635 (_ BitVec 32)) SeekEntryResult!461)

(assert (=> b!166669 (= lt!83395 (seekEntryOrOpen!0 key!828 (_keys!5262 thiss!1248) (mask!8172 thiss!1248)))))

(declare-fun b!166670 () Bool)

(declare-fun e!109374 () Bool)

(assert (=> b!166670 (= e!109374 false)))

(declare-fun lt!83398 () Bool)

(declare-datatypes ((List!2100 0))(
  ( (Nil!2097) (Cons!2096 (h!2713 (_ BitVec 64)) (t!6902 List!2100)) )
))
(declare-fun arrayNoDuplicates!0 (array!6635 (_ BitVec 32) List!2100) Bool)

(assert (=> b!166670 (= lt!83398 (arrayNoDuplicates!0 (_keys!5262 thiss!1248) #b00000000000000000000000000000000 Nil!2097))))

(declare-fun tp_is_empty!3769 () Bool)

(declare-fun e!109373 () Bool)

(declare-fun e!109376 () Bool)

(declare-fun array_inv!2025 (array!6635) Bool)

(declare-fun array_inv!2026 (array!6637) Bool)

(assert (=> b!166671 (= e!109373 (and tp!14501 tp_is_empty!3769 (array_inv!2025 (_keys!5262 thiss!1248)) (array_inv!2026 (_values!3420 thiss!1248)) e!109376))))

(declare-fun res!79225 () Bool)

(assert (=> start!16662 (=> (not res!79225) (not e!109370))))

(declare-fun valid!873 (LongMapFixedSize!1990) Bool)

(assert (=> start!16662 (= res!79225 (valid!873 thiss!1248))))

(assert (=> start!16662 e!109370))

(assert (=> start!16662 e!109373))

(assert (=> start!16662 true))

(declare-fun b!166672 () Bool)

(declare-fun lt!83394 () Unit!5075)

(assert (=> b!166672 (= e!109377 lt!83394)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (array!6635 array!6637 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5075)

(assert (=> b!166672 (= lt!83394 (lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(declare-fun res!79227 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166672 (= res!79227 (inRange!0 (index!4013 lt!83395) (mask!8172 thiss!1248)))))

(declare-fun e!109372 () Bool)

(assert (=> b!166672 (=> (not res!79227) (not e!109372))))

(assert (=> b!166672 e!109372))

(declare-fun b!166673 () Bool)

(declare-fun e!109378 () Bool)

(assert (=> b!166673 (= e!109378 tp_is_empty!3769)))

(declare-fun b!166674 () Bool)

(declare-fun res!79228 () Bool)

(assert (=> b!166674 (=> (not res!79228) (not e!109370))))

(assert (=> b!166674 (= res!79228 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166675 () Bool)

(assert (=> b!166675 (= e!109372 (= (select (arr!3153 (_keys!5262 thiss!1248)) (index!4013 lt!83395)) key!828))))

(declare-fun mapIsEmpty!6372 () Bool)

(declare-fun mapRes!6372 () Bool)

(assert (=> mapIsEmpty!6372 mapRes!6372))

(declare-fun b!166676 () Bool)

(declare-fun res!79226 () Bool)

(assert (=> b!166676 (=> (not res!79226) (not e!109374))))

(assert (=> b!166676 (= res!79226 (and (= (size!3442 (_values!3420 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8172 thiss!1248))) (= (size!3441 (_keys!5262 thiss!1248)) (size!3442 (_values!3420 thiss!1248))) (bvsge (mask!8172 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3178 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3178 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166677 () Bool)

(assert (=> b!166677 (= e!109379 e!109374)))

(declare-fun res!79230 () Bool)

(assert (=> b!166677 (=> (not res!79230) (not e!109374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166677 (= res!79230 (validMask!0 (mask!8172 thiss!1248)))))

(declare-fun lt!83396 () Unit!5075)

(assert (=> b!166677 (= lt!83396 e!109377)))

(declare-fun c!30232 () Bool)

(declare-datatypes ((tuple2!3112 0))(
  ( (tuple2!3113 (_1!1567 (_ BitVec 64)) (_2!1567 V!4673)) )
))
(declare-datatypes ((List!2101 0))(
  ( (Nil!2098) (Cons!2097 (h!2714 tuple2!3112) (t!6903 List!2101)) )
))
(declare-datatypes ((ListLongMap!2067 0))(
  ( (ListLongMap!2068 (toList!1049 List!2101)) )
))
(declare-fun contains!1091 (ListLongMap!2067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!707 (array!6635 array!6637 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 32) Int) ListLongMap!2067)

(assert (=> b!166677 (= c!30232 (contains!1091 (getCurrentListMap!707 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3437 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6372 () Bool)

(declare-fun tp!14502 () Bool)

(declare-fun e!109375 () Bool)

(assert (=> mapNonEmpty!6372 (= mapRes!6372 (and tp!14502 e!109375))))

(declare-fun mapRest!6372 () (Array (_ BitVec 32) ValueCell!1541))

(declare-fun mapValue!6372 () ValueCell!1541)

(declare-fun mapKey!6372 () (_ BitVec 32))

(assert (=> mapNonEmpty!6372 (= (arr!3154 (_values!3420 thiss!1248)) (store mapRest!6372 mapKey!6372 mapValue!6372))))

(declare-fun b!166678 () Bool)

(assert (=> b!166678 (= e!109375 tp_is_empty!3769)))

(declare-fun b!166679 () Bool)

(assert (=> b!166679 (= e!109376 (and e!109378 mapRes!6372))))

(declare-fun condMapEmpty!6372 () Bool)

(declare-fun mapDefault!6372 () ValueCell!1541)

