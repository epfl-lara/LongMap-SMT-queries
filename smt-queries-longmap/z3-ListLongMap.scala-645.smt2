; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16222 () Bool)

(assert start!16222)

(declare-fun b!161818 () Bool)

(declare-fun b_free!3679 () Bool)

(declare-fun b_next!3679 () Bool)

(assert (=> b!161818 (= b_free!3679 (not b_next!3679))))

(declare-fun tp!13606 () Bool)

(declare-fun b_and!10107 () Bool)

(assert (=> b!161818 (= tp!13606 b_and!10107)))

(declare-fun mapIsEmpty!5909 () Bool)

(declare-fun mapRes!5909 () Bool)

(assert (=> mapIsEmpty!5909 mapRes!5909))

(declare-fun b!161815 () Bool)

(declare-fun res!76658 () Bool)

(declare-fun e!105830 () Bool)

(assert (=> b!161815 (=> (not res!76658) (not e!105830))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161815 (= res!76658 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161816 () Bool)

(declare-datatypes ((SeekEntryResult!359 0))(
  ( (MissingZero!359 (index!3604 (_ BitVec 32))) (Found!359 (index!3605 (_ BitVec 32))) (Intermediate!359 (undefined!1171 Bool) (index!3606 (_ BitVec 32)) (x!17863 (_ BitVec 32))) (Undefined!359) (MissingVacant!359 (index!3607 (_ BitVec 32))) )
))
(declare-fun lt!82335 () SeekEntryResult!359)

(get-info :version)

(assert (=> b!161816 (= e!105830 (and (not ((_ is Undefined!359) lt!82335)) ((_ is MissingVacant!359) lt!82335) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82335 (MissingZero!359 (index!3607 lt!82335)))) (not (= lt!82335 (MissingVacant!359 (index!3607 lt!82335))))))))

(declare-datatypes ((V!4289 0))(
  ( (V!4290 (val!1785 Int)) )
))
(declare-datatypes ((ValueCell!1397 0))(
  ( (ValueCellFull!1397 (v!3651 V!4289)) (EmptyCell!1397) )
))
(declare-datatypes ((array!6027 0))(
  ( (array!6028 (arr!2858 (Array (_ BitVec 32) (_ BitVec 64))) (size!3142 (_ BitVec 32))) )
))
(declare-datatypes ((array!6029 0))(
  ( (array!6030 (arr!2859 (Array (_ BitVec 32) ValueCell!1397)) (size!3143 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1702 0))(
  ( (LongMapFixedSize!1703 (defaultEntry!3293 Int) (mask!7895 (_ BitVec 32)) (extraKeys!3034 (_ BitVec 32)) (zeroValue!3136 V!4289) (minValue!3136 V!4289) (_size!900 (_ BitVec 32)) (_keys!5094 array!6027) (_values!3276 array!6029) (_vacant!900 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1702)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6027 (_ BitVec 32)) SeekEntryResult!359)

(assert (=> b!161816 (= lt!82335 (seekEntryOrOpen!0 key!828 (_keys!5094 thiss!1248) (mask!7895 thiss!1248)))))

(declare-fun b!161817 () Bool)

(declare-fun e!105829 () Bool)

(declare-fun tp_is_empty!3481 () Bool)

(assert (=> b!161817 (= e!105829 tp_is_empty!3481)))

(declare-fun res!76657 () Bool)

(assert (=> start!16222 (=> (not res!76657) (not e!105830))))

(declare-fun valid!796 (LongMapFixedSize!1702) Bool)

(assert (=> start!16222 (= res!76657 (valid!796 thiss!1248))))

(assert (=> start!16222 e!105830))

(declare-fun e!105827 () Bool)

(assert (=> start!16222 e!105827))

(assert (=> start!16222 true))

(declare-fun e!105828 () Bool)

(declare-fun array_inv!1835 (array!6027) Bool)

(declare-fun array_inv!1836 (array!6029) Bool)

(assert (=> b!161818 (= e!105827 (and tp!13606 tp_is_empty!3481 (array_inv!1835 (_keys!5094 thiss!1248)) (array_inv!1836 (_values!3276 thiss!1248)) e!105828))))

(declare-fun b!161819 () Bool)

(declare-fun e!105831 () Bool)

(assert (=> b!161819 (= e!105831 tp_is_empty!3481)))

(declare-fun mapNonEmpty!5909 () Bool)

(declare-fun tp!13607 () Bool)

(assert (=> mapNonEmpty!5909 (= mapRes!5909 (and tp!13607 e!105829))))

(declare-fun mapValue!5909 () ValueCell!1397)

(declare-fun mapRest!5909 () (Array (_ BitVec 32) ValueCell!1397))

(declare-fun mapKey!5909 () (_ BitVec 32))

(assert (=> mapNonEmpty!5909 (= (arr!2859 (_values!3276 thiss!1248)) (store mapRest!5909 mapKey!5909 mapValue!5909))))

(declare-fun b!161820 () Bool)

(assert (=> b!161820 (= e!105828 (and e!105831 mapRes!5909))))

(declare-fun condMapEmpty!5909 () Bool)

(declare-fun mapDefault!5909 () ValueCell!1397)

(assert (=> b!161820 (= condMapEmpty!5909 (= (arr!2859 (_values!3276 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1397)) mapDefault!5909)))))

(assert (= (and start!16222 res!76657) b!161815))

(assert (= (and b!161815 res!76658) b!161816))

(assert (= (and b!161820 condMapEmpty!5909) mapIsEmpty!5909))

(assert (= (and b!161820 (not condMapEmpty!5909)) mapNonEmpty!5909))

(assert (= (and mapNonEmpty!5909 ((_ is ValueCellFull!1397) mapValue!5909)) b!161817))

(assert (= (and b!161820 ((_ is ValueCellFull!1397) mapDefault!5909)) b!161819))

(assert (= b!161818 b!161820))

(assert (= start!16222 b!161818))

(declare-fun m!193319 () Bool)

(assert (=> b!161816 m!193319))

(declare-fun m!193321 () Bool)

(assert (=> start!16222 m!193321))

(declare-fun m!193323 () Bool)

(assert (=> b!161818 m!193323))

(declare-fun m!193325 () Bool)

(assert (=> b!161818 m!193325))

(declare-fun m!193327 () Bool)

(assert (=> mapNonEmpty!5909 m!193327))

(check-sat (not mapNonEmpty!5909) (not b!161816) b_and!10107 (not start!16222) (not b!161818) (not b_next!3679) tp_is_empty!3481)
(check-sat b_and!10107 (not b_next!3679))
