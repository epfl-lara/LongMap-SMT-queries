; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16202 () Bool)

(assert start!16202)

(declare-fun b!161624 () Bool)

(declare-fun b_free!3663 () Bool)

(declare-fun b_next!3663 () Bool)

(assert (=> b!161624 (= b_free!3663 (not b_next!3663))))

(declare-fun tp!13559 () Bool)

(declare-fun b_and!10077 () Bool)

(assert (=> b!161624 (= tp!13559 b_and!10077)))

(declare-fun mapNonEmpty!5885 () Bool)

(declare-fun mapRes!5885 () Bool)

(declare-fun tp!13558 () Bool)

(declare-fun e!105660 () Bool)

(assert (=> mapNonEmpty!5885 (= mapRes!5885 (and tp!13558 e!105660))))

(declare-datatypes ((V!4267 0))(
  ( (V!4268 (val!1777 Int)) )
))
(declare-datatypes ((ValueCell!1389 0))(
  ( (ValueCellFull!1389 (v!3642 V!4267)) (EmptyCell!1389) )
))
(declare-fun mapRest!5885 () (Array (_ BitVec 32) ValueCell!1389))

(declare-fun mapKey!5885 () (_ BitVec 32))

(declare-datatypes ((array!6009 0))(
  ( (array!6010 (arr!2849 (Array (_ BitVec 32) (_ BitVec 64))) (size!3133 (_ BitVec 32))) )
))
(declare-datatypes ((array!6011 0))(
  ( (array!6012 (arr!2850 (Array (_ BitVec 32) ValueCell!1389)) (size!3134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1686 0))(
  ( (LongMapFixedSize!1687 (defaultEntry!3285 Int) (mask!7881 (_ BitVec 32)) (extraKeys!3026 (_ BitVec 32)) (zeroValue!3128 V!4267) (minValue!3128 V!4267) (_size!892 (_ BitVec 32)) (_keys!5086 array!6009) (_values!3268 array!6011) (_vacant!892 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1686)

(declare-fun mapValue!5885 () ValueCell!1389)

(assert (=> mapNonEmpty!5885 (= (arr!2850 (_values!3268 thiss!1248)) (store mapRest!5885 mapKey!5885 mapValue!5885))))

(declare-fun tp_is_empty!3465 () Bool)

(declare-fun e!105658 () Bool)

(declare-fun e!105662 () Bool)

(declare-fun array_inv!1819 (array!6009) Bool)

(declare-fun array_inv!1820 (array!6011) Bool)

(assert (=> b!161624 (= e!105662 (and tp!13559 tp_is_empty!3465 (array_inv!1819 (_keys!5086 thiss!1248)) (array_inv!1820 (_values!3268 thiss!1248)) e!105658))))

(declare-fun b!161625 () Bool)

(declare-fun e!105663 () Bool)

(assert (=> b!161625 (= e!105663 tp_is_empty!3465)))

(declare-fun res!76588 () Bool)

(declare-fun e!105661 () Bool)

(assert (=> start!16202 (=> (not res!76588) (not e!105661))))

(declare-fun valid!771 (LongMapFixedSize!1686) Bool)

(assert (=> start!16202 (= res!76588 (valid!771 thiss!1248))))

(assert (=> start!16202 e!105661))

(assert (=> start!16202 e!105662))

(assert (=> start!16202 true))

(declare-fun b!161626 () Bool)

(assert (=> b!161626 (= e!105660 tp_is_empty!3465)))

(declare-fun b!161627 () Bool)

(assert (=> b!161627 (= e!105658 (and e!105663 mapRes!5885))))

(declare-fun condMapEmpty!5885 () Bool)

(declare-fun mapDefault!5885 () ValueCell!1389)

(assert (=> b!161627 (= condMapEmpty!5885 (= (arr!2850 (_values!3268 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1389)) mapDefault!5885)))))

(declare-fun b!161628 () Bool)

(assert (=> b!161628 (= e!105661 false)))

(declare-datatypes ((SeekEntryResult!358 0))(
  ( (MissingZero!358 (index!3600 (_ BitVec 32))) (Found!358 (index!3601 (_ BitVec 32))) (Intermediate!358 (undefined!1170 Bool) (index!3602 (_ BitVec 32)) (x!17838 (_ BitVec 32))) (Undefined!358) (MissingVacant!358 (index!3603 (_ BitVec 32))) )
))
(declare-fun lt!82252 () SeekEntryResult!358)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6009 (_ BitVec 32)) SeekEntryResult!358)

(assert (=> b!161628 (= lt!82252 (seekEntryOrOpen!0 key!828 (_keys!5086 thiss!1248) (mask!7881 thiss!1248)))))

(declare-fun b!161629 () Bool)

(declare-fun res!76589 () Bool)

(assert (=> b!161629 (=> (not res!76589) (not e!105661))))

(assert (=> b!161629 (= res!76589 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5885 () Bool)

(assert (=> mapIsEmpty!5885 mapRes!5885))

(assert (= (and start!16202 res!76588) b!161629))

(assert (= (and b!161629 res!76589) b!161628))

(assert (= (and b!161627 condMapEmpty!5885) mapIsEmpty!5885))

(assert (= (and b!161627 (not condMapEmpty!5885)) mapNonEmpty!5885))

(get-info :version)

(assert (= (and mapNonEmpty!5885 ((_ is ValueCellFull!1389) mapValue!5885)) b!161626))

(assert (= (and b!161627 ((_ is ValueCellFull!1389) mapDefault!5885)) b!161625))

(assert (= b!161624 b!161627))

(assert (= start!16202 b!161624))

(declare-fun m!193057 () Bool)

(assert (=> mapNonEmpty!5885 m!193057))

(declare-fun m!193059 () Bool)

(assert (=> b!161624 m!193059))

(declare-fun m!193061 () Bool)

(assert (=> b!161624 m!193061))

(declare-fun m!193063 () Bool)

(assert (=> start!16202 m!193063))

(declare-fun m!193065 () Bool)

(assert (=> b!161628 m!193065))

(check-sat b_and!10077 (not b!161628) tp_is_empty!3465 (not b!161624) (not mapNonEmpty!5885) (not b_next!3663) (not start!16202))
(check-sat b_and!10077 (not b_next!3663))
