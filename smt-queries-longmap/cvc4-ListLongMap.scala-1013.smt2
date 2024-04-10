; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21682 () Bool)

(assert start!21682)

(declare-fun b!217731 () Bool)

(declare-fun b_free!5831 () Bool)

(declare-fun b_next!5831 () Bool)

(assert (=> b!217731 (= b_free!5831 (not b_next!5831))))

(declare-fun tp!20628 () Bool)

(declare-fun b_and!12721 () Bool)

(assert (=> b!217731 (= tp!20628 b_and!12721)))

(declare-fun mapNonEmpty!9702 () Bool)

(declare-fun mapRes!9702 () Bool)

(declare-fun tp!20627 () Bool)

(declare-fun e!141634 () Bool)

(assert (=> mapNonEmpty!9702 (= mapRes!9702 (and tp!20627 e!141634))))

(declare-datatypes ((V!7237 0))(
  ( (V!7238 (val!2891 Int)) )
))
(declare-datatypes ((ValueCell!2503 0))(
  ( (ValueCellFull!2503 (v!4909 V!7237)) (EmptyCell!2503) )
))
(declare-datatypes ((array!10625 0))(
  ( (array!10626 (arr!5034 (Array (_ BitVec 32) ValueCell!2503)) (size!5366 (_ BitVec 32))) )
))
(declare-datatypes ((array!10627 0))(
  ( (array!10628 (arr!5035 (Array (_ BitVec 32) (_ BitVec 64))) (size!5367 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2906 0))(
  ( (LongMapFixedSize!2907 (defaultEntry!4103 Int) (mask!9864 (_ BitVec 32)) (extraKeys!3840 (_ BitVec 32)) (zeroValue!3944 V!7237) (minValue!3944 V!7237) (_size!1502 (_ BitVec 32)) (_keys!6152 array!10627) (_values!4086 array!10625) (_vacant!1502 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2906)

(declare-fun mapKey!9702 () (_ BitVec 32))

(declare-fun mapRest!9702 () (Array (_ BitVec 32) ValueCell!2503))

(declare-fun mapValue!9702 () ValueCell!2503)

(assert (=> mapNonEmpty!9702 (= (arr!5034 (_values!4086 thiss!1504)) (store mapRest!9702 mapKey!9702 mapValue!9702))))

(declare-fun b!217723 () Bool)

(declare-fun e!141636 () Bool)

(declare-fun e!141635 () Bool)

(assert (=> b!217723 (= e!141636 e!141635)))

(declare-fun res!106655 () Bool)

(assert (=> b!217723 (=> (not res!106655) (not e!141635))))

(declare-datatypes ((SeekEntryResult!771 0))(
  ( (MissingZero!771 (index!5254 (_ BitVec 32))) (Found!771 (index!5255 (_ BitVec 32))) (Intermediate!771 (undefined!1583 Bool) (index!5256 (_ BitVec 32)) (x!22763 (_ BitVec 32))) (Undefined!771) (MissingVacant!771 (index!5257 (_ BitVec 32))) )
))
(declare-fun lt!111398 () SeekEntryResult!771)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217723 (= res!106655 (or (= lt!111398 (MissingZero!771 index!297)) (= lt!111398 (MissingVacant!771 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10627 (_ BitVec 32)) SeekEntryResult!771)

(assert (=> b!217723 (= lt!111398 (seekEntryOrOpen!0 key!932 (_keys!6152 thiss!1504) (mask!9864 thiss!1504)))))

(declare-fun b!217724 () Bool)

(declare-fun res!106652 () Bool)

(assert (=> b!217724 (=> (not res!106652) (not e!141635))))

(assert (=> b!217724 (= res!106652 (and (= (size!5366 (_values!4086 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9864 thiss!1504))) (= (size!5367 (_keys!6152 thiss!1504)) (size!5366 (_values!4086 thiss!1504))) (bvsge (mask!9864 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3840 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3840 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217725 () Bool)

(declare-fun res!106656 () Bool)

(assert (=> b!217725 (=> (not res!106656) (not e!141635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217725 (= res!106656 (validMask!0 (mask!9864 thiss!1504)))))

(declare-fun b!217726 () Bool)

(declare-fun e!141640 () Bool)

(declare-fun tp_is_empty!5693 () Bool)

(assert (=> b!217726 (= e!141640 tp_is_empty!5693)))

(declare-fun mapIsEmpty!9702 () Bool)

(assert (=> mapIsEmpty!9702 mapRes!9702))

(declare-fun b!217727 () Bool)

(assert (=> b!217727 (= e!141635 false)))

(declare-fun lt!111399 () Bool)

(declare-datatypes ((List!3200 0))(
  ( (Nil!3197) (Cons!3196 (h!3843 (_ BitVec 64)) (t!8155 List!3200)) )
))
(declare-fun arrayNoDuplicates!0 (array!10627 (_ BitVec 32) List!3200) Bool)

(assert (=> b!217727 (= lt!111399 (arrayNoDuplicates!0 (_keys!6152 thiss!1504) #b00000000000000000000000000000000 Nil!3197))))

(declare-fun b!217728 () Bool)

(assert (=> b!217728 (= e!141634 tp_is_empty!5693)))

(declare-fun b!217729 () Bool)

(declare-fun e!141639 () Bool)

(assert (=> b!217729 (= e!141639 (and e!141640 mapRes!9702))))

(declare-fun condMapEmpty!9702 () Bool)

(declare-fun mapDefault!9702 () ValueCell!2503)

