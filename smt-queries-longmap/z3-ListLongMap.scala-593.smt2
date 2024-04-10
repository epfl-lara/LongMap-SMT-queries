; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15702 () Bool)

(assert start!15702)

(declare-fun b!156592 () Bool)

(declare-fun b_free!3369 () Bool)

(declare-fun b_next!3369 () Bool)

(assert (=> b!156592 (= b_free!3369 (not b_next!3369))))

(declare-fun tp!12631 () Bool)

(declare-fun b_and!9783 () Bool)

(assert (=> b!156592 (= tp!12631 b_and!9783)))

(declare-fun b!156588 () Bool)

(declare-fun e!102413 () Bool)

(declare-fun e!102417 () Bool)

(declare-fun mapRes!5399 () Bool)

(assert (=> b!156588 (= e!102413 (and e!102417 mapRes!5399))))

(declare-fun condMapEmpty!5399 () Bool)

(declare-datatypes ((V!3875 0))(
  ( (V!3876 (val!1630 Int)) )
))
(declare-datatypes ((ValueCell!1242 0))(
  ( (ValueCellFull!1242 (v!3495 V!3875)) (EmptyCell!1242) )
))
(declare-datatypes ((array!5395 0))(
  ( (array!5396 (arr!2555 (Array (_ BitVec 32) (_ BitVec 64))) (size!2833 (_ BitVec 32))) )
))
(declare-datatypes ((array!5397 0))(
  ( (array!5398 (arr!2556 (Array (_ BitVec 32) ValueCell!1242)) (size!2834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1392 0))(
  ( (LongMapFixedSize!1393 (defaultEntry!3138 Int) (mask!7593 (_ BitVec 32)) (extraKeys!2879 (_ BitVec 32)) (zeroValue!2981 V!3875) (minValue!2981 V!3875) (_size!745 (_ BitVec 32)) (_keys!4913 array!5395) (_values!3121 array!5397) (_vacant!745 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1392)

(declare-fun mapDefault!5399 () ValueCell!1242)

(assert (=> b!156588 (= condMapEmpty!5399 (= (arr!2556 (_values!3121 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1242)) mapDefault!5399)))))

(declare-fun b!156589 () Bool)

(declare-fun res!74002 () Bool)

(declare-fun e!102416 () Bool)

(assert (=> b!156589 (=> (not res!74002) (not e!102416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156589 (= res!74002 (validMask!0 (mask!7593 thiss!1248)))))

(declare-fun b!156590 () Bool)

(assert (=> b!156590 (= e!102416 false)))

(declare-fun lt!81568 () Bool)

(declare-datatypes ((List!1859 0))(
  ( (Nil!1856) (Cons!1855 (h!2464 (_ BitVec 64)) (t!6661 List!1859)) )
))
(declare-fun arrayNoDuplicates!0 (array!5395 (_ BitVec 32) List!1859) Bool)

(assert (=> b!156590 (= lt!81568 (arrayNoDuplicates!0 (_keys!4913 thiss!1248) #b00000000000000000000000000000000 Nil!1856))))

(declare-fun b!156591 () Bool)

(declare-fun e!102412 () Bool)

(declare-fun tp_is_empty!3171 () Bool)

(assert (=> b!156591 (= e!102412 tp_is_empty!3171)))

(declare-fun e!102414 () Bool)

(declare-fun array_inv!1613 (array!5395) Bool)

(declare-fun array_inv!1614 (array!5397) Bool)

(assert (=> b!156592 (= e!102414 (and tp!12631 tp_is_empty!3171 (array_inv!1613 (_keys!4913 thiss!1248)) (array_inv!1614 (_values!3121 thiss!1248)) e!102413))))

(declare-fun b!156593 () Bool)

(assert (=> b!156593 (= e!102417 tp_is_empty!3171)))

(declare-fun mapNonEmpty!5399 () Bool)

(declare-fun tp!12632 () Bool)

(assert (=> mapNonEmpty!5399 (= mapRes!5399 (and tp!12632 e!102412))))

(declare-fun mapRest!5399 () (Array (_ BitVec 32) ValueCell!1242))

(declare-fun mapKey!5399 () (_ BitVec 32))

(declare-fun mapValue!5399 () ValueCell!1242)

(assert (=> mapNonEmpty!5399 (= (arr!2556 (_values!3121 thiss!1248)) (store mapRest!5399 mapKey!5399 mapValue!5399))))

(declare-fun b!156594 () Bool)

(declare-fun res!74000 () Bool)

(assert (=> b!156594 (=> (not res!74000) (not e!102416))))

(assert (=> b!156594 (= res!74000 (and (= (size!2834 (_values!3121 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7593 thiss!1248))) (= (size!2833 (_keys!4913 thiss!1248)) (size!2834 (_values!3121 thiss!1248))) (bvsge (mask!7593 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2879 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2879 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2879 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2879 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2879 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2879 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2879 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5399 () Bool)

(assert (=> mapIsEmpty!5399 mapRes!5399))

(declare-fun res!74001 () Bool)

(assert (=> start!15702 (=> (not res!74001) (not e!102416))))

(declare-fun valid!671 (LongMapFixedSize!1392) Bool)

(assert (=> start!15702 (= res!74001 (valid!671 thiss!1248))))

(assert (=> start!15702 e!102416))

(assert (=> start!15702 e!102414))

(assert (=> start!15702 true))

(declare-fun b!156595 () Bool)

(declare-fun res!73999 () Bool)

(assert (=> b!156595 (=> (not res!73999) (not e!102416))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156595 (= res!73999 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156596 () Bool)

(declare-fun res!73998 () Bool)

(assert (=> b!156596 (=> (not res!73998) (not e!102416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5395 (_ BitVec 32)) Bool)

(assert (=> b!156596 (= res!73998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4913 thiss!1248) (mask!7593 thiss!1248)))))

(assert (= (and start!15702 res!74001) b!156595))

(assert (= (and b!156595 res!73999) b!156589))

(assert (= (and b!156589 res!74002) b!156594))

(assert (= (and b!156594 res!74000) b!156596))

(assert (= (and b!156596 res!73998) b!156590))

(assert (= (and b!156588 condMapEmpty!5399) mapIsEmpty!5399))

(assert (= (and b!156588 (not condMapEmpty!5399)) mapNonEmpty!5399))

(get-info :version)

(assert (= (and mapNonEmpty!5399 ((_ is ValueCellFull!1242) mapValue!5399)) b!156591))

(assert (= (and b!156588 ((_ is ValueCellFull!1242) mapDefault!5399)) b!156593))

(assert (= b!156592 b!156588))

(assert (= start!15702 b!156592))

(declare-fun m!190079 () Bool)

(assert (=> start!15702 m!190079))

(declare-fun m!190081 () Bool)

(assert (=> b!156596 m!190081))

(declare-fun m!190083 () Bool)

(assert (=> mapNonEmpty!5399 m!190083))

(declare-fun m!190085 () Bool)

(assert (=> b!156592 m!190085))

(declare-fun m!190087 () Bool)

(assert (=> b!156592 m!190087))

(declare-fun m!190089 () Bool)

(assert (=> b!156590 m!190089))

(declare-fun m!190091 () Bool)

(assert (=> b!156589 m!190091))

(check-sat (not mapNonEmpty!5399) (not b!156589) tp_is_empty!3171 (not b!156590) (not b!156592) (not start!15702) b_and!9783 (not b!156596) (not b_next!3369))
(check-sat b_and!9783 (not b_next!3369))
