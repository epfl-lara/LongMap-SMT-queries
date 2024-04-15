; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16204 () Bool)

(assert start!16204)

(declare-fun b!161459 () Bool)

(declare-fun b_free!3661 () Bool)

(declare-fun b_next!3661 () Bool)

(assert (=> b!161459 (= b_free!3661 (not b_next!3661))))

(declare-fun tp!13552 () Bool)

(declare-fun b_and!10049 () Bool)

(assert (=> b!161459 (= tp!13552 b_and!10049)))

(declare-fun mapNonEmpty!5882 () Bool)

(declare-fun mapRes!5882 () Bool)

(declare-fun tp!13553 () Bool)

(declare-fun e!105543 () Bool)

(assert (=> mapNonEmpty!5882 (= mapRes!5882 (and tp!13553 e!105543))))

(declare-fun mapKey!5882 () (_ BitVec 32))

(declare-datatypes ((V!4265 0))(
  ( (V!4266 (val!1776 Int)) )
))
(declare-datatypes ((ValueCell!1388 0))(
  ( (ValueCellFull!1388 (v!3635 V!4265)) (EmptyCell!1388) )
))
(declare-fun mapValue!5882 () ValueCell!1388)

(declare-fun mapRest!5882 () (Array (_ BitVec 32) ValueCell!1388))

(declare-datatypes ((array!5985 0))(
  ( (array!5986 (arr!2836 (Array (_ BitVec 32) (_ BitVec 64))) (size!3121 (_ BitVec 32))) )
))
(declare-datatypes ((array!5987 0))(
  ( (array!5988 (arr!2837 (Array (_ BitVec 32) ValueCell!1388)) (size!3122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1684 0))(
  ( (LongMapFixedSize!1685 (defaultEntry!3284 Int) (mask!7879 (_ BitVec 32)) (extraKeys!3025 (_ BitVec 32)) (zeroValue!3127 V!4265) (minValue!3127 V!4265) (_size!891 (_ BitVec 32)) (_keys!5084 array!5985) (_values!3267 array!5987) (_vacant!891 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1684)

(assert (=> mapNonEmpty!5882 (= (arr!2837 (_values!3267 thiss!1248)) (store mapRest!5882 mapKey!5882 mapValue!5882))))

(declare-fun e!105540 () Bool)

(declare-fun tp_is_empty!3463 () Bool)

(declare-fun e!105542 () Bool)

(declare-fun array_inv!1831 (array!5985) Bool)

(declare-fun array_inv!1832 (array!5987) Bool)

(assert (=> b!161459 (= e!105540 (and tp!13552 tp_is_empty!3463 (array_inv!1831 (_keys!5084 thiss!1248)) (array_inv!1832 (_values!3267 thiss!1248)) e!105542))))

(declare-fun b!161460 () Bool)

(declare-fun e!105544 () Bool)

(assert (=> b!161460 (= e!105544 tp_is_empty!3463)))

(declare-fun b!161461 () Bool)

(declare-fun res!76487 () Bool)

(declare-fun e!105541 () Bool)

(assert (=> b!161461 (=> (not res!76487) (not e!105541))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161461 (= res!76487 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76488 () Bool)

(assert (=> start!16204 (=> (not res!76488) (not e!105541))))

(declare-fun valid!771 (LongMapFixedSize!1684) Bool)

(assert (=> start!16204 (= res!76488 (valid!771 thiss!1248))))

(assert (=> start!16204 e!105541))

(assert (=> start!16204 e!105540))

(assert (=> start!16204 true))

(declare-fun b!161462 () Bool)

(assert (=> b!161462 (= e!105541 false)))

(declare-datatypes ((SeekEntryResult!362 0))(
  ( (MissingZero!362 (index!3616 (_ BitVec 32))) (Found!362 (index!3617 (_ BitVec 32))) (Intermediate!362 (undefined!1174 Bool) (index!3618 (_ BitVec 32)) (x!17841 (_ BitVec 32))) (Undefined!362) (MissingVacant!362 (index!3619 (_ BitVec 32))) )
))
(declare-fun lt!82068 () SeekEntryResult!362)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5985 (_ BitVec 32)) SeekEntryResult!362)

(assert (=> b!161462 (= lt!82068 (seekEntryOrOpen!0 key!828 (_keys!5084 thiss!1248) (mask!7879 thiss!1248)))))

(declare-fun b!161463 () Bool)

(assert (=> b!161463 (= e!105542 (and e!105544 mapRes!5882))))

(declare-fun condMapEmpty!5882 () Bool)

(declare-fun mapDefault!5882 () ValueCell!1388)

(assert (=> b!161463 (= condMapEmpty!5882 (= (arr!2837 (_values!3267 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1388)) mapDefault!5882)))))

(declare-fun b!161464 () Bool)

(assert (=> b!161464 (= e!105543 tp_is_empty!3463)))

(declare-fun mapIsEmpty!5882 () Bool)

(assert (=> mapIsEmpty!5882 mapRes!5882))

(assert (= (and start!16204 res!76488) b!161461))

(assert (= (and b!161461 res!76487) b!161462))

(assert (= (and b!161463 condMapEmpty!5882) mapIsEmpty!5882))

(assert (= (and b!161463 (not condMapEmpty!5882)) mapNonEmpty!5882))

(get-info :version)

(assert (= (and mapNonEmpty!5882 ((_ is ValueCellFull!1388) mapValue!5882)) b!161464))

(assert (= (and b!161463 ((_ is ValueCellFull!1388) mapDefault!5882)) b!161460))

(assert (= b!161459 b!161463))

(assert (= start!16204 b!161459))

(declare-fun m!192427 () Bool)

(assert (=> mapNonEmpty!5882 m!192427))

(declare-fun m!192429 () Bool)

(assert (=> b!161459 m!192429))

(declare-fun m!192431 () Bool)

(assert (=> b!161459 m!192431))

(declare-fun m!192433 () Bool)

(assert (=> start!16204 m!192433))

(declare-fun m!192435 () Bool)

(assert (=> b!161462 m!192435))

(check-sat b_and!10049 tp_is_empty!3463 (not b!161462) (not b!161459) (not start!16204) (not mapNonEmpty!5882) (not b_next!3661))
(check-sat b_and!10049 (not b_next!3661))
