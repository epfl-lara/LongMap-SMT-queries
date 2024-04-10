; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15714 () Bool)

(assert start!15714)

(declare-fun b!156750 () Bool)

(declare-fun b_free!3381 () Bool)

(declare-fun b_next!3381 () Bool)

(assert (=> b!156750 (= b_free!3381 (not b_next!3381))))

(declare-fun tp!12667 () Bool)

(declare-fun b_and!9795 () Bool)

(assert (=> b!156750 (= tp!12667 b_and!9795)))

(declare-fun tp_is_empty!3183 () Bool)

(declare-fun e!102523 () Bool)

(declare-fun e!102524 () Bool)

(declare-datatypes ((V!3891 0))(
  ( (V!3892 (val!1636 Int)) )
))
(declare-datatypes ((ValueCell!1248 0))(
  ( (ValueCellFull!1248 (v!3501 V!3891)) (EmptyCell!1248) )
))
(declare-datatypes ((array!5419 0))(
  ( (array!5420 (arr!2567 (Array (_ BitVec 32) (_ BitVec 64))) (size!2845 (_ BitVec 32))) )
))
(declare-datatypes ((array!5421 0))(
  ( (array!5422 (arr!2568 (Array (_ BitVec 32) ValueCell!1248)) (size!2846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1404 0))(
  ( (LongMapFixedSize!1405 (defaultEntry!3144 Int) (mask!7603 (_ BitVec 32)) (extraKeys!2885 (_ BitVec 32)) (zeroValue!2987 V!3891) (minValue!2987 V!3891) (_size!751 (_ BitVec 32)) (_keys!4919 array!5419) (_values!3127 array!5421) (_vacant!751 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1404)

(declare-fun array_inv!1621 (array!5419) Bool)

(declare-fun array_inv!1622 (array!5421) Bool)

(assert (=> b!156750 (= e!102523 (and tp!12667 tp_is_empty!3183 (array_inv!1621 (_keys!4919 thiss!1248)) (array_inv!1622 (_values!3127 thiss!1248)) e!102524))))

(declare-fun b!156751 () Bool)

(declare-fun res!74089 () Bool)

(declare-fun e!102525 () Bool)

(assert (=> b!156751 (=> (not res!74089) (not e!102525))))

(assert (=> b!156751 (= res!74089 (and (= (size!2846 (_values!3127 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7603 thiss!1248))) (= (size!2845 (_keys!4919 thiss!1248)) (size!2846 (_values!3127 thiss!1248))) (bvsge (mask!7603 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2885 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2885 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2885 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2885 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2885 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2885 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2885 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5417 () Bool)

(declare-fun mapRes!5417 () Bool)

(assert (=> mapIsEmpty!5417 mapRes!5417))

(declare-fun b!156752 () Bool)

(assert (=> b!156752 (= e!102525 false)))

(declare-fun lt!81586 () Bool)

(declare-datatypes ((List!1862 0))(
  ( (Nil!1859) (Cons!1858 (h!2467 (_ BitVec 64)) (t!6664 List!1862)) )
))
(declare-fun arrayNoDuplicates!0 (array!5419 (_ BitVec 32) List!1862) Bool)

(assert (=> b!156752 (= lt!81586 (arrayNoDuplicates!0 (_keys!4919 thiss!1248) #b00000000000000000000000000000000 Nil!1859))))

(declare-fun b!156753 () Bool)

(declare-fun e!102520 () Bool)

(assert (=> b!156753 (= e!102524 (and e!102520 mapRes!5417))))

(declare-fun condMapEmpty!5417 () Bool)

(declare-fun mapDefault!5417 () ValueCell!1248)

(assert (=> b!156753 (= condMapEmpty!5417 (= (arr!2568 (_values!3127 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1248)) mapDefault!5417)))))

(declare-fun b!156754 () Bool)

(assert (=> b!156754 (= e!102520 tp_is_empty!3183)))

(declare-fun b!156755 () Bool)

(declare-fun res!74090 () Bool)

(assert (=> b!156755 (=> (not res!74090) (not e!102525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5419 (_ BitVec 32)) Bool)

(assert (=> b!156755 (= res!74090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4919 thiss!1248) (mask!7603 thiss!1248)))))

(declare-fun res!74092 () Bool)

(assert (=> start!15714 (=> (not res!74092) (not e!102525))))

(declare-fun valid!673 (LongMapFixedSize!1404) Bool)

(assert (=> start!15714 (= res!74092 (valid!673 thiss!1248))))

(assert (=> start!15714 e!102525))

(assert (=> start!15714 e!102523))

(assert (=> start!15714 true))

(declare-fun b!156756 () Bool)

(declare-fun res!74091 () Bool)

(assert (=> b!156756 (=> (not res!74091) (not e!102525))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156756 (= res!74091 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156757 () Bool)

(declare-fun e!102521 () Bool)

(assert (=> b!156757 (= e!102521 tp_is_empty!3183)))

(declare-fun b!156758 () Bool)

(declare-fun res!74088 () Bool)

(assert (=> b!156758 (=> (not res!74088) (not e!102525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156758 (= res!74088 (validMask!0 (mask!7603 thiss!1248)))))

(declare-fun mapNonEmpty!5417 () Bool)

(declare-fun tp!12668 () Bool)

(assert (=> mapNonEmpty!5417 (= mapRes!5417 (and tp!12668 e!102521))))

(declare-fun mapKey!5417 () (_ BitVec 32))

(declare-fun mapRest!5417 () (Array (_ BitVec 32) ValueCell!1248))

(declare-fun mapValue!5417 () ValueCell!1248)

(assert (=> mapNonEmpty!5417 (= (arr!2568 (_values!3127 thiss!1248)) (store mapRest!5417 mapKey!5417 mapValue!5417))))

(assert (= (and start!15714 res!74092) b!156756))

(assert (= (and b!156756 res!74091) b!156758))

(assert (= (and b!156758 res!74088) b!156751))

(assert (= (and b!156751 res!74089) b!156755))

(assert (= (and b!156755 res!74090) b!156752))

(assert (= (and b!156753 condMapEmpty!5417) mapIsEmpty!5417))

(assert (= (and b!156753 (not condMapEmpty!5417)) mapNonEmpty!5417))

(get-info :version)

(assert (= (and mapNonEmpty!5417 ((_ is ValueCellFull!1248) mapValue!5417)) b!156757))

(assert (= (and b!156753 ((_ is ValueCellFull!1248) mapDefault!5417)) b!156754))

(assert (= b!156750 b!156753))

(assert (= start!15714 b!156750))

(declare-fun m!190163 () Bool)

(assert (=> b!156755 m!190163))

(declare-fun m!190165 () Bool)

(assert (=> start!15714 m!190165))

(declare-fun m!190167 () Bool)

(assert (=> b!156758 m!190167))

(declare-fun m!190169 () Bool)

(assert (=> b!156752 m!190169))

(declare-fun m!190171 () Bool)

(assert (=> mapNonEmpty!5417 m!190171))

(declare-fun m!190173 () Bool)

(assert (=> b!156750 m!190173))

(declare-fun m!190175 () Bool)

(assert (=> b!156750 m!190175))

(check-sat (not mapNonEmpty!5417) b_and!9795 tp_is_empty!3183 (not b!156750) (not b!156755) (not b!156758) (not b!156752) (not start!15714) (not b_next!3381))
(check-sat b_and!9795 (not b_next!3381))
