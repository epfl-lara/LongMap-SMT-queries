; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15722 () Bool)

(assert start!15722)

(declare-fun b!156659 () Bool)

(declare-fun b_free!3385 () Bool)

(declare-fun b_next!3385 () Bool)

(assert (=> b!156659 (= b_free!3385 (not b_next!3385))))

(declare-fun tp!12680 () Bool)

(declare-fun b_and!9773 () Bool)

(assert (=> b!156659 (= tp!12680 b_and!9773)))

(declare-fun b!156657 () Bool)

(declare-fun res!74024 () Bool)

(declare-fun e!102455 () Bool)

(assert (=> b!156657 (=> (not res!74024) (not e!102455))))

(declare-datatypes ((V!3897 0))(
  ( (V!3898 (val!1638 Int)) )
))
(declare-datatypes ((ValueCell!1250 0))(
  ( (ValueCellFull!1250 (v!3497 V!3897)) (EmptyCell!1250) )
))
(declare-datatypes ((array!5407 0))(
  ( (array!5408 (arr!2560 (Array (_ BitVec 32) (_ BitVec 64))) (size!2839 (_ BitVec 32))) )
))
(declare-datatypes ((array!5409 0))(
  ( (array!5410 (arr!2561 (Array (_ BitVec 32) ValueCell!1250)) (size!2840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1408 0))(
  ( (LongMapFixedSize!1409 (defaultEntry!3146 Int) (mask!7606 (_ BitVec 32)) (extraKeys!2887 (_ BitVec 32)) (zeroValue!2989 V!3897) (minValue!2989 V!3897) (_size!753 (_ BitVec 32)) (_keys!4920 array!5407) (_values!3129 array!5409) (_vacant!753 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1408)

(assert (=> b!156657 (= res!74024 (and (= (size!2840 (_values!3129 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7606 thiss!1248))) (= (size!2839 (_keys!4920 thiss!1248)) (size!2840 (_values!3129 thiss!1248))) (bvsge (mask!7606 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2887 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2887 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2887 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2887 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156658 () Bool)

(declare-fun res!74026 () Bool)

(assert (=> b!156658 (=> (not res!74026) (not e!102455))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156658 (= res!74026 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!3187 () Bool)

(declare-fun e!102456 () Bool)

(declare-fun e!102460 () Bool)

(declare-fun array_inv!1651 (array!5407) Bool)

(declare-fun array_inv!1652 (array!5409) Bool)

(assert (=> b!156659 (= e!102456 (and tp!12680 tp_is_empty!3187 (array_inv!1651 (_keys!4920 thiss!1248)) (array_inv!1652 (_values!3129 thiss!1248)) e!102460))))

(declare-fun b!156660 () Bool)

(declare-fun e!102459 () Bool)

(assert (=> b!156660 (= e!102459 tp_is_empty!3187)))

(declare-fun res!74027 () Bool)

(assert (=> start!15722 (=> (not res!74027) (not e!102455))))

(declare-fun valid!680 (LongMapFixedSize!1408) Bool)

(assert (=> start!15722 (= res!74027 (valid!680 thiss!1248))))

(assert (=> start!15722 e!102455))

(assert (=> start!15722 e!102456))

(assert (=> start!15722 true))

(declare-fun b!156661 () Bool)

(declare-fun mapRes!5423 () Bool)

(assert (=> b!156661 (= e!102460 (and e!102459 mapRes!5423))))

(declare-fun condMapEmpty!5423 () Bool)

(declare-fun mapDefault!5423 () ValueCell!1250)

(assert (=> b!156661 (= condMapEmpty!5423 (= (arr!2561 (_values!3129 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1250)) mapDefault!5423)))))

(declare-fun b!156662 () Bool)

(declare-fun res!74025 () Bool)

(assert (=> b!156662 (=> (not res!74025) (not e!102455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5407 (_ BitVec 32)) Bool)

(assert (=> b!156662 (= res!74025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4920 thiss!1248) (mask!7606 thiss!1248)))))

(declare-fun b!156663 () Bool)

(assert (=> b!156663 (= e!102455 false)))

(declare-fun lt!81411 () Bool)

(declare-datatypes ((List!1862 0))(
  ( (Nil!1859) (Cons!1858 (h!2467 (_ BitVec 64)) (t!6655 List!1862)) )
))
(declare-fun arrayNoDuplicates!0 (array!5407 (_ BitVec 32) List!1862) Bool)

(assert (=> b!156663 (= lt!81411 (arrayNoDuplicates!0 (_keys!4920 thiss!1248) #b00000000000000000000000000000000 Nil!1859))))

(declare-fun b!156664 () Bool)

(declare-fun res!74023 () Bool)

(assert (=> b!156664 (=> (not res!74023) (not e!102455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156664 (= res!74023 (validMask!0 (mask!7606 thiss!1248)))))

(declare-fun b!156665 () Bool)

(declare-fun e!102457 () Bool)

(assert (=> b!156665 (= e!102457 tp_is_empty!3187)))

(declare-fun mapIsEmpty!5423 () Bool)

(assert (=> mapIsEmpty!5423 mapRes!5423))

(declare-fun mapNonEmpty!5423 () Bool)

(declare-fun tp!12679 () Bool)

(assert (=> mapNonEmpty!5423 (= mapRes!5423 (and tp!12679 e!102457))))

(declare-fun mapKey!5423 () (_ BitVec 32))

(declare-fun mapRest!5423 () (Array (_ BitVec 32) ValueCell!1250))

(declare-fun mapValue!5423 () ValueCell!1250)

(assert (=> mapNonEmpty!5423 (= (arr!2561 (_values!3129 thiss!1248)) (store mapRest!5423 mapKey!5423 mapValue!5423))))

(assert (= (and start!15722 res!74027) b!156658))

(assert (= (and b!156658 res!74026) b!156664))

(assert (= (and b!156664 res!74023) b!156657))

(assert (= (and b!156657 res!74024) b!156662))

(assert (= (and b!156662 res!74025) b!156663))

(assert (= (and b!156661 condMapEmpty!5423) mapIsEmpty!5423))

(assert (= (and b!156661 (not condMapEmpty!5423)) mapNonEmpty!5423))

(get-info :version)

(assert (= (and mapNonEmpty!5423 ((_ is ValueCellFull!1250) mapValue!5423)) b!156665))

(assert (= (and b!156661 ((_ is ValueCellFull!1250) mapDefault!5423)) b!156660))

(assert (= b!156659 b!156661))

(assert (= start!15722 b!156659))

(declare-fun m!189571 () Bool)

(assert (=> mapNonEmpty!5423 m!189571))

(declare-fun m!189573 () Bool)

(assert (=> b!156662 m!189573))

(declare-fun m!189575 () Bool)

(assert (=> start!15722 m!189575))

(declare-fun m!189577 () Bool)

(assert (=> b!156664 m!189577))

(declare-fun m!189579 () Bool)

(assert (=> b!156659 m!189579))

(declare-fun m!189581 () Bool)

(assert (=> b!156659 m!189581))

(declare-fun m!189583 () Bool)

(assert (=> b!156663 m!189583))

(check-sat tp_is_empty!3187 (not b!156663) b_and!9773 (not start!15722) (not b!156659) (not b!156662) (not b_next!3385) (not mapNonEmpty!5423) (not b!156664))
(check-sat b_and!9773 (not b_next!3385))
