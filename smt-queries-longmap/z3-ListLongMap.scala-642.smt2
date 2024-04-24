; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16204 () Bool)

(assert start!16204)

(declare-fun b!161657 () Bool)

(declare-fun b_free!3661 () Bool)

(declare-fun b_next!3661 () Bool)

(assert (=> b!161657 (= b_free!3661 (not b_next!3661))))

(declare-fun tp!13553 () Bool)

(declare-fun b_and!10089 () Bool)

(assert (=> b!161657 (= tp!13553 b_and!10089)))

(declare-fun mapNonEmpty!5882 () Bool)

(declare-fun mapRes!5882 () Bool)

(declare-fun tp!13552 () Bool)

(declare-fun e!105664 () Bool)

(assert (=> mapNonEmpty!5882 (= mapRes!5882 (and tp!13552 e!105664))))

(declare-datatypes ((V!4265 0))(
  ( (V!4266 (val!1776 Int)) )
))
(declare-datatypes ((ValueCell!1388 0))(
  ( (ValueCellFull!1388 (v!3642 V!4265)) (EmptyCell!1388) )
))
(declare-fun mapValue!5882 () ValueCell!1388)

(declare-fun mapRest!5882 () (Array (_ BitVec 32) ValueCell!1388))

(declare-datatypes ((array!5991 0))(
  ( (array!5992 (arr!2840 (Array (_ BitVec 32) (_ BitVec 64))) (size!3124 (_ BitVec 32))) )
))
(declare-datatypes ((array!5993 0))(
  ( (array!5994 (arr!2841 (Array (_ BitVec 32) ValueCell!1388)) (size!3125 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1684 0))(
  ( (LongMapFixedSize!1685 (defaultEntry!3284 Int) (mask!7880 (_ BitVec 32)) (extraKeys!3025 (_ BitVec 32)) (zeroValue!3127 V!4265) (minValue!3127 V!4265) (_size!891 (_ BitVec 32)) (_keys!5085 array!5991) (_values!3267 array!5993) (_vacant!891 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1684)

(declare-fun mapKey!5882 () (_ BitVec 32))

(assert (=> mapNonEmpty!5882 (= (arr!2841 (_values!3267 thiss!1248)) (store mapRest!5882 mapKey!5882 mapValue!5882))))

(declare-fun b!161653 () Bool)

(declare-fun e!105669 () Bool)

(assert (=> b!161653 (= e!105669 false)))

(declare-datatypes ((SeekEntryResult!353 0))(
  ( (MissingZero!353 (index!3580 (_ BitVec 32))) (Found!353 (index!3581 (_ BitVec 32))) (Intermediate!353 (undefined!1165 Bool) (index!3582 (_ BitVec 32)) (x!17833 (_ BitVec 32))) (Undefined!353) (MissingVacant!353 (index!3583 (_ BitVec 32))) )
))
(declare-fun lt!82308 () SeekEntryResult!353)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5991 (_ BitVec 32)) SeekEntryResult!353)

(assert (=> b!161653 (= lt!82308 (seekEntryOrOpen!0 key!828 (_keys!5085 thiss!1248) (mask!7880 thiss!1248)))))

(declare-fun mapIsEmpty!5882 () Bool)

(assert (=> mapIsEmpty!5882 mapRes!5882))

(declare-fun b!161654 () Bool)

(declare-fun res!76604 () Bool)

(assert (=> b!161654 (=> (not res!76604) (not e!105669))))

(assert (=> b!161654 (= res!76604 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161655 () Bool)

(declare-fun e!105666 () Bool)

(declare-fun tp_is_empty!3463 () Bool)

(assert (=> b!161655 (= e!105666 tp_is_empty!3463)))

(declare-fun res!76603 () Bool)

(assert (=> start!16204 (=> (not res!76603) (not e!105669))))

(declare-fun valid!790 (LongMapFixedSize!1684) Bool)

(assert (=> start!16204 (= res!76603 (valid!790 thiss!1248))))

(assert (=> start!16204 e!105669))

(declare-fun e!105665 () Bool)

(assert (=> start!16204 e!105665))

(assert (=> start!16204 true))

(declare-fun b!161656 () Bool)

(assert (=> b!161656 (= e!105664 tp_is_empty!3463)))

(declare-fun e!105668 () Bool)

(declare-fun array_inv!1821 (array!5991) Bool)

(declare-fun array_inv!1822 (array!5993) Bool)

(assert (=> b!161657 (= e!105665 (and tp!13553 tp_is_empty!3463 (array_inv!1821 (_keys!5085 thiss!1248)) (array_inv!1822 (_values!3267 thiss!1248)) e!105668))))

(declare-fun b!161658 () Bool)

(assert (=> b!161658 (= e!105668 (and e!105666 mapRes!5882))))

(declare-fun condMapEmpty!5882 () Bool)

(declare-fun mapDefault!5882 () ValueCell!1388)

(assert (=> b!161658 (= condMapEmpty!5882 (= (arr!2841 (_values!3267 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1388)) mapDefault!5882)))))

(assert (= (and start!16204 res!76603) b!161654))

(assert (= (and b!161654 res!76604) b!161653))

(assert (= (and b!161658 condMapEmpty!5882) mapIsEmpty!5882))

(assert (= (and b!161658 (not condMapEmpty!5882)) mapNonEmpty!5882))

(get-info :version)

(assert (= (and mapNonEmpty!5882 ((_ is ValueCellFull!1388) mapValue!5882)) b!161656))

(assert (= (and b!161658 ((_ is ValueCellFull!1388) mapDefault!5882)) b!161655))

(assert (= b!161657 b!161658))

(assert (= start!16204 b!161657))

(declare-fun m!193229 () Bool)

(assert (=> mapNonEmpty!5882 m!193229))

(declare-fun m!193231 () Bool)

(assert (=> b!161653 m!193231))

(declare-fun m!193233 () Bool)

(assert (=> start!16204 m!193233))

(declare-fun m!193235 () Bool)

(assert (=> b!161657 m!193235))

(declare-fun m!193237 () Bool)

(assert (=> b!161657 m!193237))

(check-sat (not start!16204) tp_is_empty!3463 (not b!161653) b_and!10089 (not b_next!3661) (not b!161657) (not mapNonEmpty!5882))
(check-sat b_and!10089 (not b_next!3661))
