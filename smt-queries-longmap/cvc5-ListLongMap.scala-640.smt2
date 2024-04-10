; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16188 () Bool)

(assert start!16188)

(declare-fun b!161458 () Bool)

(declare-fun b_free!3649 () Bool)

(declare-fun b_next!3649 () Bool)

(assert (=> b!161458 (= b_free!3649 (not b_next!3649))))

(declare-fun tp!13516 () Bool)

(declare-fun b_and!10063 () Bool)

(assert (=> b!161458 (= tp!13516 b_and!10063)))

(declare-fun b!161450 () Bool)

(declare-datatypes ((Unit!5017 0))(
  ( (Unit!5018) )
))
(declare-fun e!105517 () Unit!5017)

(declare-fun Unit!5019 () Unit!5017)

(assert (=> b!161450 (= e!105517 Unit!5019)))

(declare-fun lt!82216 () Unit!5017)

(declare-datatypes ((V!4249 0))(
  ( (V!4250 (val!1770 Int)) )
))
(declare-datatypes ((ValueCell!1382 0))(
  ( (ValueCellFull!1382 (v!3635 V!4249)) (EmptyCell!1382) )
))
(declare-datatypes ((array!5981 0))(
  ( (array!5982 (arr!2835 (Array (_ BitVec 32) (_ BitVec 64))) (size!3119 (_ BitVec 32))) )
))
(declare-datatypes ((array!5983 0))(
  ( (array!5984 (arr!2836 (Array (_ BitVec 32) ValueCell!1382)) (size!3120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1672 0))(
  ( (LongMapFixedSize!1673 (defaultEntry!3278 Int) (mask!7870 (_ BitVec 32)) (extraKeys!3019 (_ BitVec 32)) (zeroValue!3121 V!4249) (minValue!3121 V!4249) (_size!885 (_ BitVec 32)) (_keys!5079 array!5981) (_values!3261 array!5983) (_vacant!885 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1672)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (array!5981 array!5983 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!5017)

(assert (=> b!161450 (= lt!82216 (lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (_keys!5079 thiss!1248) (_values!3261 thiss!1248) (mask!7870 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(assert (=> b!161450 false))

(declare-fun mapNonEmpty!5864 () Bool)

(declare-fun mapRes!5864 () Bool)

(declare-fun tp!13517 () Bool)

(declare-fun e!105521 () Bool)

(assert (=> mapNonEmpty!5864 (= mapRes!5864 (and tp!13517 e!105521))))

(declare-fun mapValue!5864 () ValueCell!1382)

(declare-fun mapKey!5864 () (_ BitVec 32))

(declare-fun mapRest!5864 () (Array (_ BitVec 32) ValueCell!1382))

(assert (=> mapNonEmpty!5864 (= (arr!2836 (_values!3261 thiss!1248)) (store mapRest!5864 mapKey!5864 mapValue!5864))))

(declare-fun b!161451 () Bool)

(declare-fun tp_is_empty!3451 () Bool)

(assert (=> b!161451 (= e!105521 tp_is_empty!3451)))

(declare-fun b!161453 () Bool)

(declare-fun e!105518 () Bool)

(assert (=> b!161453 (= e!105518 tp_is_empty!3451)))

(declare-fun b!161454 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!79 (array!5981 array!5983 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!5017)

(assert (=> b!161454 (= e!105517 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!79 (_keys!5079 thiss!1248) (_values!3261 thiss!1248) (mask!7870 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(declare-fun b!161455 () Bool)

(declare-fun e!105520 () Bool)

(assert (=> b!161455 (= e!105520 (and e!105518 mapRes!5864))))

(declare-fun condMapEmpty!5864 () Bool)

(declare-fun mapDefault!5864 () ValueCell!1382)

