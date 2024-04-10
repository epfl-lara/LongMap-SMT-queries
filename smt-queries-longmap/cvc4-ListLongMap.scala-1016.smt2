; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21700 () Bool)

(assert start!21700)

(declare-fun b!218022 () Bool)

(declare-fun b_free!5849 () Bool)

(declare-fun b_next!5849 () Bool)

(assert (=> b!218022 (= b_free!5849 (not b_next!5849))))

(declare-fun tp!20682 () Bool)

(declare-fun b_and!12739 () Bool)

(assert (=> b!218022 (= tp!20682 b_and!12739)))

(declare-fun b!218020 () Bool)

(declare-fun e!141827 () Bool)

(assert (=> b!218020 (= e!141827 false)))

(declare-fun lt!111453 () Bool)

(declare-datatypes ((V!7261 0))(
  ( (V!7262 (val!2900 Int)) )
))
(declare-datatypes ((ValueCell!2512 0))(
  ( (ValueCellFull!2512 (v!4918 V!7261)) (EmptyCell!2512) )
))
(declare-datatypes ((array!10661 0))(
  ( (array!10662 (arr!5052 (Array (_ BitVec 32) ValueCell!2512)) (size!5384 (_ BitVec 32))) )
))
(declare-datatypes ((array!10663 0))(
  ( (array!10664 (arr!5053 (Array (_ BitVec 32) (_ BitVec 64))) (size!5385 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2924 0))(
  ( (LongMapFixedSize!2925 (defaultEntry!4112 Int) (mask!9879 (_ BitVec 32)) (extraKeys!3849 (_ BitVec 32)) (zeroValue!3953 V!7261) (minValue!3953 V!7261) (_size!1511 (_ BitVec 32)) (_keys!6161 array!10663) (_values!4095 array!10661) (_vacant!1511 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2924)

(declare-datatypes ((List!3215 0))(
  ( (Nil!3212) (Cons!3211 (h!3858 (_ BitVec 64)) (t!8170 List!3215)) )
))
(declare-fun arrayNoDuplicates!0 (array!10663 (_ BitVec 32) List!3215) Bool)

(assert (=> b!218020 (= lt!111453 (arrayNoDuplicates!0 (_keys!6161 thiss!1504) #b00000000000000000000000000000000 Nil!3212))))

(declare-fun b!218021 () Bool)

(declare-fun res!106839 () Bool)

(assert (=> b!218021 (=> (not res!106839) (not e!141827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218021 (= res!106839 (validMask!0 (mask!9879 thiss!1504)))))

(declare-fun mapIsEmpty!9729 () Bool)

(declare-fun mapRes!9729 () Bool)

(assert (=> mapIsEmpty!9729 mapRes!9729))

(declare-fun e!141826 () Bool)

(declare-fun e!141825 () Bool)

(declare-fun tp_is_empty!5711 () Bool)

(declare-fun array_inv!3345 (array!10663) Bool)

(declare-fun array_inv!3346 (array!10661) Bool)

(assert (=> b!218022 (= e!141825 (and tp!20682 tp_is_empty!5711 (array_inv!3345 (_keys!6161 thiss!1504)) (array_inv!3346 (_values!4095 thiss!1504)) e!141826))))

(declare-fun b!218023 () Bool)

(declare-fun e!141824 () Bool)

(assert (=> b!218023 (= e!141824 tp_is_empty!5711)))

(declare-fun b!218024 () Bool)

(declare-fun e!141829 () Bool)

(assert (=> b!218024 (= e!141829 e!141827)))

(declare-fun res!106841 () Bool)

(assert (=> b!218024 (=> (not res!106841) (not e!141827))))

(declare-datatypes ((SeekEntryResult!778 0))(
  ( (MissingZero!778 (index!5282 (_ BitVec 32))) (Found!778 (index!5283 (_ BitVec 32))) (Intermediate!778 (undefined!1590 Bool) (index!5284 (_ BitVec 32)) (x!22794 (_ BitVec 32))) (Undefined!778) (MissingVacant!778 (index!5285 (_ BitVec 32))) )
))
(declare-fun lt!111452 () SeekEntryResult!778)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218024 (= res!106841 (or (= lt!111452 (MissingZero!778 index!297)) (= lt!111452 (MissingVacant!778 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10663 (_ BitVec 32)) SeekEntryResult!778)

(assert (=> b!218024 (= lt!111452 (seekEntryOrOpen!0 key!932 (_keys!6161 thiss!1504) (mask!9879 thiss!1504)))))

(declare-fun b!218025 () Bool)

(declare-fun res!106845 () Bool)

(assert (=> b!218025 (=> (not res!106845) (not e!141827))))

(assert (=> b!218025 (= res!106845 (and (= (size!5384 (_values!4095 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9879 thiss!1504))) (= (size!5385 (_keys!6161 thiss!1504)) (size!5384 (_values!4095 thiss!1504))) (bvsge (mask!9879 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3849 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3849 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106842 () Bool)

(assert (=> start!21700 (=> (not res!106842) (not e!141829))))

(declare-fun valid!1185 (LongMapFixedSize!2924) Bool)

(assert (=> start!21700 (= res!106842 (valid!1185 thiss!1504))))

(assert (=> start!21700 e!141829))

(assert (=> start!21700 e!141825))

(assert (=> start!21700 true))

(declare-fun b!218026 () Bool)

(declare-fun res!106844 () Bool)

(assert (=> b!218026 (=> (not res!106844) (not e!141827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10663 (_ BitVec 32)) Bool)

(assert (=> b!218026 (= res!106844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6161 thiss!1504) (mask!9879 thiss!1504)))))

(declare-fun b!218027 () Bool)

(declare-fun e!141828 () Bool)

(assert (=> b!218027 (= e!141826 (and e!141828 mapRes!9729))))

(declare-fun condMapEmpty!9729 () Bool)

(declare-fun mapDefault!9729 () ValueCell!2512)

