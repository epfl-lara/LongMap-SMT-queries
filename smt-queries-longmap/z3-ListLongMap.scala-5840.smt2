; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75594 () Bool)

(assert start!75594)

(declare-fun b!888841 () Bool)

(declare-fun b_free!15541 () Bool)

(declare-fun b_next!15541 () Bool)

(assert (=> b!888841 (= b_free!15541 (not b_next!15541))))

(declare-fun tp!54570 () Bool)

(declare-fun b_and!25787 () Bool)

(assert (=> b!888841 (= tp!54570 b_and!25787)))

(declare-fun b!888839 () Bool)

(declare-fun e!495227 () Bool)

(declare-fun e!495225 () Bool)

(declare-fun mapRes!28336 () Bool)

(assert (=> b!888839 (= e!495227 (and e!495225 mapRes!28336))))

(declare-fun condMapEmpty!28336 () Bool)

(declare-datatypes ((array!51745 0))(
  ( (array!51746 (arr!24880 (Array (_ BitVec 32) (_ BitVec 64))) (size!25321 (_ BitVec 32))) )
))
(declare-datatypes ((V!28791 0))(
  ( (V!28792 (val!8985 Int)) )
))
(declare-datatypes ((ValueCell!8453 0))(
  ( (ValueCellFull!8453 (v!11454 V!28791)) (EmptyCell!8453) )
))
(declare-datatypes ((array!51747 0))(
  ( (array!51748 (arr!24881 (Array (_ BitVec 32) ValueCell!8453)) (size!25322 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3922 0))(
  ( (LongMapFixedSize!3923 (defaultEntry!5152 Int) (mask!25603 (_ BitVec 32)) (extraKeys!4846 (_ BitVec 32)) (zeroValue!4950 V!28791) (minValue!4950 V!28791) (_size!2016 (_ BitVec 32)) (_keys!9857 array!51745) (_values!5137 array!51747) (_vacant!2016 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3922)

(declare-fun mapDefault!28336 () ValueCell!8453)

(assert (=> b!888839 (= condMapEmpty!28336 (= (arr!24881 (_values!5137 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8453)) mapDefault!28336)))))

(declare-fun lt!401883 () Bool)

(declare-fun valid!1539 (LongMapFixedSize!3922) Bool)

(assert (=> start!75594 (= lt!401883 (valid!1539 thiss!1181))))

(assert (=> start!75594 false))

(declare-fun e!495226 () Bool)

(assert (=> start!75594 e!495226))

(declare-fun mapNonEmpty!28336 () Bool)

(declare-fun tp!54571 () Bool)

(declare-fun e!495224 () Bool)

(assert (=> mapNonEmpty!28336 (= mapRes!28336 (and tp!54571 e!495224))))

(declare-fun mapKey!28336 () (_ BitVec 32))

(declare-fun mapValue!28336 () ValueCell!8453)

(declare-fun mapRest!28336 () (Array (_ BitVec 32) ValueCell!8453))

(assert (=> mapNonEmpty!28336 (= (arr!24881 (_values!5137 thiss!1181)) (store mapRest!28336 mapKey!28336 mapValue!28336))))

(declare-fun b!888840 () Bool)

(declare-fun tp_is_empty!17869 () Bool)

(assert (=> b!888840 (= e!495225 tp_is_empty!17869)))

(declare-fun array_inv!19618 (array!51745) Bool)

(declare-fun array_inv!19619 (array!51747) Bool)

(assert (=> b!888841 (= e!495226 (and tp!54570 tp_is_empty!17869 (array_inv!19618 (_keys!9857 thiss!1181)) (array_inv!19619 (_values!5137 thiss!1181)) e!495227))))

(declare-fun b!888842 () Bool)

(assert (=> b!888842 (= e!495224 tp_is_empty!17869)))

(declare-fun mapIsEmpty!28336 () Bool)

(assert (=> mapIsEmpty!28336 mapRes!28336))

(assert (= (and b!888839 condMapEmpty!28336) mapIsEmpty!28336))

(assert (= (and b!888839 (not condMapEmpty!28336)) mapNonEmpty!28336))

(get-info :version)

(assert (= (and mapNonEmpty!28336 ((_ is ValueCellFull!8453) mapValue!28336)) b!888842))

(assert (= (and b!888839 ((_ is ValueCellFull!8453) mapDefault!28336)) b!888840))

(assert (= b!888841 b!888839))

(assert (= start!75594 b!888841))

(declare-fun m!828695 () Bool)

(assert (=> start!75594 m!828695))

(declare-fun m!828697 () Bool)

(assert (=> mapNonEmpty!28336 m!828697))

(declare-fun m!828699 () Bool)

(assert (=> b!888841 m!828699))

(declare-fun m!828701 () Bool)

(assert (=> b!888841 m!828701))

(check-sat b_and!25787 (not start!75594) (not mapNonEmpty!28336) (not b_next!15541) tp_is_empty!17869 (not b!888841))
(check-sat b_and!25787 (not b_next!15541))
