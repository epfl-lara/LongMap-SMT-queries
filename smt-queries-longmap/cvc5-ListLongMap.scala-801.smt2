; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19254 () Bool)

(assert start!19254)

(declare-fun b!189403 () Bool)

(declare-fun b_free!4645 () Bool)

(declare-fun b_next!4645 () Bool)

(assert (=> b!189403 (= b_free!4645 (not b_next!4645))))

(declare-fun tp!16768 () Bool)

(declare-fun b_and!11283 () Bool)

(assert (=> b!189403 (= tp!16768 b_and!11283)))

(declare-fun mapNonEmpty!7621 () Bool)

(declare-fun mapRes!7621 () Bool)

(declare-fun tp!16767 () Bool)

(declare-fun e!124638 () Bool)

(assert (=> mapNonEmpty!7621 (= mapRes!7621 (and tp!16767 e!124638))))

(declare-fun mapKey!7621 () (_ BitVec 32))

(declare-datatypes ((V!5537 0))(
  ( (V!5538 (val!2253 Int)) )
))
(declare-datatypes ((ValueCell!1865 0))(
  ( (ValueCellFull!1865 (v!4174 V!5537)) (EmptyCell!1865) )
))
(declare-datatypes ((array!8063 0))(
  ( (array!8064 (arr!3801 (Array (_ BitVec 32) (_ BitVec 64))) (size!4121 (_ BitVec 32))) )
))
(declare-datatypes ((array!8065 0))(
  ( (array!8066 (arr!3802 (Array (_ BitVec 32) ValueCell!1865)) (size!4122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2638 0))(
  ( (LongMapFixedSize!2639 (defaultEntry!3863 Int) (mask!9050 (_ BitVec 32)) (extraKeys!3600 (_ BitVec 32)) (zeroValue!3704 V!5537) (minValue!3704 V!5537) (_size!1368 (_ BitVec 32)) (_keys!5830 array!8063) (_values!3846 array!8065) (_vacant!1368 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2638)

(declare-fun mapValue!7621 () ValueCell!1865)

(declare-fun mapRest!7621 () (Array (_ BitVec 32) ValueCell!1865))

(assert (=> mapNonEmpty!7621 (= (arr!3802 (_values!3846 thiss!1248)) (store mapRest!7621 mapKey!7621 mapValue!7621))))

(declare-fun b!189401 () Bool)

(declare-fun res!89552 () Bool)

(declare-fun e!124634 () Bool)

(assert (=> b!189401 (=> (not res!89552) (not e!124634))))

(assert (=> b!189401 (= res!89552 (and (= (size!4122 (_values!3846 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9050 thiss!1248))) (= (size!4121 (_keys!5830 thiss!1248)) (size!4122 (_values!3846 thiss!1248))) (bvsge (mask!9050 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3600 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3600 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!189402 () Bool)

(declare-datatypes ((Unit!5711 0))(
  ( (Unit!5712) )
))
(declare-fun e!124641 () Unit!5711)

(declare-fun lt!93746 () Unit!5711)

(assert (=> b!189402 (= e!124641 lt!93746)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!162 (array!8063 array!8065 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5711)

(assert (=> b!189402 (= lt!93746 (lemmaInListMapThenSeekEntryOrOpenFindsIt!162 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(declare-fun res!89554 () Bool)

(declare-datatypes ((SeekEntryResult!662 0))(
  ( (MissingZero!662 (index!4818 (_ BitVec 32))) (Found!662 (index!4819 (_ BitVec 32))) (Intermediate!662 (undefined!1474 Bool) (index!4820 (_ BitVec 32)) (x!20420 (_ BitVec 32))) (Undefined!662) (MissingVacant!662 (index!4821 (_ BitVec 32))) )
))
(declare-fun lt!93749 () SeekEntryResult!662)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189402 (= res!89554 (inRange!0 (index!4819 lt!93749) (mask!9050 thiss!1248)))))

(declare-fun e!124633 () Bool)

(assert (=> b!189402 (=> (not res!89554) (not e!124633))))

(assert (=> b!189402 e!124633))

(declare-fun e!124632 () Bool)

(declare-fun tp_is_empty!4417 () Bool)

(declare-fun e!124639 () Bool)

(declare-fun array_inv!2463 (array!8063) Bool)

(declare-fun array_inv!2464 (array!8065) Bool)

(assert (=> b!189403 (= e!124632 (and tp!16768 tp_is_empty!4417 (array_inv!2463 (_keys!5830 thiss!1248)) (array_inv!2464 (_values!3846 thiss!1248)) e!124639))))

(declare-fun b!189404 () Bool)

(declare-fun e!124636 () Bool)

(declare-fun e!124635 () Bool)

(assert (=> b!189404 (= e!124636 e!124635)))

(declare-fun res!89551 () Bool)

(assert (=> b!189404 (=> (not res!89551) (not e!124635))))

(assert (=> b!189404 (= res!89551 (and (not (is-Undefined!662 lt!93749)) (not (is-MissingVacant!662 lt!93749)) (not (is-MissingZero!662 lt!93749)) (is-Found!662 lt!93749)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8063 (_ BitVec 32)) SeekEntryResult!662)

(assert (=> b!189404 (= lt!93749 (seekEntryOrOpen!0 key!828 (_keys!5830 thiss!1248) (mask!9050 thiss!1248)))))

(declare-fun b!189405 () Bool)

(declare-fun res!89558 () Bool)

(assert (=> b!189405 (=> (not res!89558) (not e!124634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8063 (_ BitVec 32)) Bool)

(assert (=> b!189405 (= res!89558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5830 thiss!1248) (mask!9050 thiss!1248)))))

(declare-fun b!189406 () Bool)

(declare-fun Unit!5713 () Unit!5711)

(assert (=> b!189406 (= e!124641 Unit!5713)))

(declare-fun lt!93748 () Unit!5711)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (array!8063 array!8065 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5711)

(assert (=> b!189406 (= lt!93748 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(assert (=> b!189406 false))

(declare-fun b!189407 () Bool)

(assert (=> b!189407 (= e!124638 tp_is_empty!4417)))

(declare-fun b!189409 () Bool)

(assert (=> b!189409 (= e!124633 (= (select (arr!3801 (_keys!5830 thiss!1248)) (index!4819 lt!93749)) key!828))))

(declare-fun b!189410 () Bool)

(assert (=> b!189410 (= e!124635 e!124634)))

(declare-fun res!89560 () Bool)

(assert (=> b!189410 (=> (not res!89560) (not e!124634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189410 (= res!89560 (validMask!0 (mask!9050 thiss!1248)))))

(declare-fun lt!93747 () Unit!5711)

(assert (=> b!189410 (= lt!93747 e!124641)))

(declare-fun c!34040 () Bool)

(declare-datatypes ((tuple2!3506 0))(
  ( (tuple2!3507 (_1!1764 (_ BitVec 64)) (_2!1764 V!5537)) )
))
(declare-datatypes ((List!2406 0))(
  ( (Nil!2403) (Cons!2402 (h!3039 tuple2!3506) (t!7310 List!2406)) )
))
(declare-datatypes ((ListLongMap!2423 0))(
  ( (ListLongMap!2424 (toList!1227 List!2406)) )
))
(declare-fun contains!1334 (ListLongMap!2423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!875 (array!8063 array!8065 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 32) Int) ListLongMap!2423)

(assert (=> b!189410 (= c!34040 (contains!1334 (getCurrentListMap!875 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3863 thiss!1248)) key!828))))

(declare-fun b!189411 () Bool)

(declare-fun e!124640 () Bool)

(assert (=> b!189411 (= e!124639 (and e!124640 mapRes!7621))))

(declare-fun condMapEmpty!7621 () Bool)

(declare-fun mapDefault!7621 () ValueCell!1865)

