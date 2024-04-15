; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16222 () Bool)

(assert start!16222)

(declare-fun b!161623 () Bool)

(declare-fun b_free!3679 () Bool)

(declare-fun b_next!3679 () Bool)

(assert (=> b!161623 (= b_free!3679 (not b_next!3679))))

(declare-fun tp!13607 () Bool)

(declare-fun b_and!10067 () Bool)

(assert (=> b!161623 (= tp!13607 b_and!10067)))

(declare-fun mapIsEmpty!5909 () Bool)

(declare-fun mapRes!5909 () Bool)

(assert (=> mapIsEmpty!5909 mapRes!5909))

(declare-fun b!161621 () Bool)

(declare-fun e!105706 () Bool)

(declare-datatypes ((SeekEntryResult!369 0))(
  ( (MissingZero!369 (index!3644 (_ BitVec 32))) (Found!369 (index!3645 (_ BitVec 32))) (Intermediate!369 (undefined!1181 Bool) (index!3646 (_ BitVec 32)) (x!17872 (_ BitVec 32))) (Undefined!369) (MissingVacant!369 (index!3647 (_ BitVec 32))) )
))
(declare-fun lt!82095 () SeekEntryResult!369)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!161621 (= e!105706 (and (not ((_ is Undefined!369) lt!82095)) ((_ is MissingVacant!369) lt!82095) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82095 (MissingZero!369 (index!3647 lt!82095)))) (not (= lt!82095 (MissingVacant!369 (index!3647 lt!82095))))))))

(declare-datatypes ((V!4289 0))(
  ( (V!4290 (val!1785 Int)) )
))
(declare-datatypes ((ValueCell!1397 0))(
  ( (ValueCellFull!1397 (v!3644 V!4289)) (EmptyCell!1397) )
))
(declare-datatypes ((array!6021 0))(
  ( (array!6022 (arr!2854 (Array (_ BitVec 32) (_ BitVec 64))) (size!3139 (_ BitVec 32))) )
))
(declare-datatypes ((array!6023 0))(
  ( (array!6024 (arr!2855 (Array (_ BitVec 32) ValueCell!1397)) (size!3140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1702 0))(
  ( (LongMapFixedSize!1703 (defaultEntry!3293 Int) (mask!7894 (_ BitVec 32)) (extraKeys!3034 (_ BitVec 32)) (zeroValue!3136 V!4289) (minValue!3136 V!4289) (_size!900 (_ BitVec 32)) (_keys!5093 array!6021) (_values!3276 array!6023) (_vacant!900 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1702)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6021 (_ BitVec 32)) SeekEntryResult!369)

(assert (=> b!161621 (= lt!82095 (seekEntryOrOpen!0 key!828 (_keys!5093 thiss!1248) (mask!7894 thiss!1248)))))

(declare-fun b!161622 () Bool)

(declare-fun e!105702 () Bool)

(declare-fun tp_is_empty!3481 () Bool)

(assert (=> b!161622 (= e!105702 tp_is_empty!3481)))

(declare-fun e!105704 () Bool)

(declare-fun e!105703 () Bool)

(declare-fun array_inv!1845 (array!6021) Bool)

(declare-fun array_inv!1846 (array!6023) Bool)

(assert (=> b!161623 (= e!105703 (and tp!13607 tp_is_empty!3481 (array_inv!1845 (_keys!5093 thiss!1248)) (array_inv!1846 (_values!3276 thiss!1248)) e!105704))))

(declare-fun b!161624 () Bool)

(declare-fun e!105705 () Bool)

(assert (=> b!161624 (= e!105705 tp_is_empty!3481)))

(declare-fun mapNonEmpty!5909 () Bool)

(declare-fun tp!13606 () Bool)

(assert (=> mapNonEmpty!5909 (= mapRes!5909 (and tp!13606 e!105702))))

(declare-fun mapRest!5909 () (Array (_ BitVec 32) ValueCell!1397))

(declare-fun mapValue!5909 () ValueCell!1397)

(declare-fun mapKey!5909 () (_ BitVec 32))

(assert (=> mapNonEmpty!5909 (= (arr!2855 (_values!3276 thiss!1248)) (store mapRest!5909 mapKey!5909 mapValue!5909))))

(declare-fun res!76541 () Bool)

(assert (=> start!16222 (=> (not res!76541) (not e!105706))))

(declare-fun valid!776 (LongMapFixedSize!1702) Bool)

(assert (=> start!16222 (= res!76541 (valid!776 thiss!1248))))

(assert (=> start!16222 e!105706))

(assert (=> start!16222 e!105703))

(assert (=> start!16222 true))

(declare-fun b!161625 () Bool)

(declare-fun res!76542 () Bool)

(assert (=> b!161625 (=> (not res!76542) (not e!105706))))

(assert (=> b!161625 (= res!76542 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161626 () Bool)

(assert (=> b!161626 (= e!105704 (and e!105705 mapRes!5909))))

(declare-fun condMapEmpty!5909 () Bool)

(declare-fun mapDefault!5909 () ValueCell!1397)

(assert (=> b!161626 (= condMapEmpty!5909 (= (arr!2855 (_values!3276 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1397)) mapDefault!5909)))))

(assert (= (and start!16222 res!76541) b!161625))

(assert (= (and b!161625 res!76542) b!161621))

(assert (= (and b!161626 condMapEmpty!5909) mapIsEmpty!5909))

(assert (= (and b!161626 (not condMapEmpty!5909)) mapNonEmpty!5909))

(assert (= (and mapNonEmpty!5909 ((_ is ValueCellFull!1397) mapValue!5909)) b!161622))

(assert (= (and b!161626 ((_ is ValueCellFull!1397) mapDefault!5909)) b!161624))

(assert (= b!161623 b!161626))

(assert (= start!16222 b!161623))

(declare-fun m!192517 () Bool)

(assert (=> b!161621 m!192517))

(declare-fun m!192519 () Bool)

(assert (=> b!161623 m!192519))

(declare-fun m!192521 () Bool)

(assert (=> b!161623 m!192521))

(declare-fun m!192523 () Bool)

(assert (=> mapNonEmpty!5909 m!192523))

(declare-fun m!192525 () Bool)

(assert (=> start!16222 m!192525))

(check-sat (not b!161623) (not b!161621) (not start!16222) (not b_next!3679) b_and!10067 tp_is_empty!3481 (not mapNonEmpty!5909))
(check-sat b_and!10067 (not b_next!3679))
