; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16666 () Bool)

(assert start!16666)

(declare-fun b!166756 () Bool)

(declare-fun b_free!3971 () Bool)

(declare-fun b_next!3971 () Bool)

(assert (=> b!166756 (= b_free!3971 (not b_next!3971))))

(declare-fun tp!14513 () Bool)

(declare-fun b_and!10385 () Bool)

(assert (=> b!166756 (= tp!14513 b_and!10385)))

(declare-fun b!166746 () Bool)

(declare-fun res!79267 () Bool)

(declare-fun e!109435 () Bool)

(assert (=> b!166746 (=> (not res!79267) (not e!109435))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166746 (= res!79267 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166747 () Bool)

(declare-fun e!109439 () Bool)

(assert (=> b!166747 (= e!109439 false)))

(declare-fun lt!83426 () Bool)

(declare-datatypes ((V!4677 0))(
  ( (V!4678 (val!1931 Int)) )
))
(declare-datatypes ((ValueCell!1543 0))(
  ( (ValueCellFull!1543 (v!3796 V!4677)) (EmptyCell!1543) )
))
(declare-datatypes ((array!6643 0))(
  ( (array!6644 (arr!3157 (Array (_ BitVec 32) (_ BitVec 64))) (size!3445 (_ BitVec 32))) )
))
(declare-datatypes ((array!6645 0))(
  ( (array!6646 (arr!3158 (Array (_ BitVec 32) ValueCell!1543)) (size!3446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1994 0))(
  ( (LongMapFixedSize!1995 (defaultEntry!3439 Int) (mask!8174 (_ BitVec 32)) (extraKeys!3180 (_ BitVec 32)) (zeroValue!3282 V!4677) (minValue!3282 V!4677) (_size!1046 (_ BitVec 32)) (_keys!5264 array!6643) (_values!3422 array!6645) (_vacant!1046 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1994)

(declare-datatypes ((List!2104 0))(
  ( (Nil!2101) (Cons!2100 (h!2717 (_ BitVec 64)) (t!6906 List!2104)) )
))
(declare-fun arrayNoDuplicates!0 (array!6643 (_ BitVec 32) List!2104) Bool)

(assert (=> b!166747 (= lt!83426 (arrayNoDuplicates!0 (_keys!5264 thiss!1248) #b00000000000000000000000000000000 Nil!2101))))

(declare-fun b!166748 () Bool)

(declare-fun e!109436 () Bool)

(declare-fun tp_is_empty!3773 () Bool)

(assert (=> b!166748 (= e!109436 tp_is_empty!3773)))

(declare-fun b!166749 () Bool)

(declare-fun e!109437 () Bool)

(assert (=> b!166749 (= e!109437 tp_is_empty!3773)))

(declare-fun b!166750 () Bool)

(declare-datatypes ((Unit!5081 0))(
  ( (Unit!5082) )
))
(declare-fun e!109434 () Unit!5081)

(declare-fun Unit!5083 () Unit!5081)

(assert (=> b!166750 (= e!109434 Unit!5083)))

(declare-fun lt!83425 () Unit!5081)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!94 (array!6643 array!6645 (_ BitVec 32) (_ BitVec 32) V!4677 V!4677 (_ BitVec 64) Int) Unit!5081)

(assert (=> b!166750 (= lt!83425 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!94 (_keys!5264 thiss!1248) (_values!3422 thiss!1248) (mask!8174 thiss!1248) (extraKeys!3180 thiss!1248) (zeroValue!3282 thiss!1248) (minValue!3282 thiss!1248) key!828 (defaultEntry!3439 thiss!1248)))))

(assert (=> b!166750 false))

(declare-fun b!166752 () Bool)

(declare-fun e!109438 () Bool)

(assert (=> b!166752 (= e!109435 e!109438)))

(declare-fun res!79268 () Bool)

(assert (=> b!166752 (=> (not res!79268) (not e!109438))))

(declare-datatypes ((SeekEntryResult!463 0))(
  ( (MissingZero!463 (index!4020 (_ BitVec 32))) (Found!463 (index!4021 (_ BitVec 32))) (Intermediate!463 (undefined!1275 Bool) (index!4022 (_ BitVec 32)) (x!18459 (_ BitVec 32))) (Undefined!463) (MissingVacant!463 (index!4023 (_ BitVec 32))) )
))
(declare-fun lt!83428 () SeekEntryResult!463)

(assert (=> b!166752 (= res!79268 (and (not (is-Undefined!463 lt!83428)) (not (is-MissingVacant!463 lt!83428)) (not (is-MissingZero!463 lt!83428)) (is-Found!463 lt!83428)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6643 (_ BitVec 32)) SeekEntryResult!463)

(assert (=> b!166752 (= lt!83428 (seekEntryOrOpen!0 key!828 (_keys!5264 thiss!1248) (mask!8174 thiss!1248)))))

(declare-fun e!109433 () Bool)

(declare-fun b!166753 () Bool)

(assert (=> b!166753 (= e!109433 (= (select (arr!3157 (_keys!5264 thiss!1248)) (index!4021 lt!83428)) key!828))))

(declare-fun mapNonEmpty!6378 () Bool)

(declare-fun mapRes!6378 () Bool)

(declare-fun tp!14514 () Bool)

(assert (=> mapNonEmpty!6378 (= mapRes!6378 (and tp!14514 e!109437))))

(declare-fun mapRest!6378 () (Array (_ BitVec 32) ValueCell!1543))

(declare-fun mapValue!6378 () ValueCell!1543)

(declare-fun mapKey!6378 () (_ BitVec 32))

(assert (=> mapNonEmpty!6378 (= (arr!3158 (_values!3422 thiss!1248)) (store mapRest!6378 mapKey!6378 mapValue!6378))))

(declare-fun b!166754 () Bool)

(declare-fun e!109432 () Bool)

(assert (=> b!166754 (= e!109432 (and e!109436 mapRes!6378))))

(declare-fun condMapEmpty!6378 () Bool)

(declare-fun mapDefault!6378 () ValueCell!1543)

