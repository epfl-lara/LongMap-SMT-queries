; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75408 () Bool)

(assert start!75408)

(declare-fun b!887700 () Bool)

(declare-fun b_free!15541 () Bool)

(declare-fun b_next!15541 () Bool)

(assert (=> b!887700 (= b_free!15541 (not b_next!15541))))

(declare-fun tp!54571 () Bool)

(declare-fun b_and!25751 () Bool)

(assert (=> b!887700 (= tp!54571 b_and!25751)))

(declare-fun b!887698 () Bool)

(declare-fun e!494495 () Bool)

(declare-fun tp_is_empty!17869 () Bool)

(assert (=> b!887698 (= e!494495 tp_is_empty!17869)))

(declare-fun mapIsEmpty!28336 () Bool)

(declare-fun mapRes!28336 () Bool)

(assert (=> mapIsEmpty!28336 mapRes!28336))

(declare-fun mapNonEmpty!28336 () Bool)

(declare-fun tp!54570 () Bool)

(declare-fun e!494493 () Bool)

(assert (=> mapNonEmpty!28336 (= mapRes!28336 (and tp!54570 e!494493))))

(declare-datatypes ((V!28791 0))(
  ( (V!28792 (val!8985 Int)) )
))
(declare-datatypes ((ValueCell!8453 0))(
  ( (ValueCellFull!8453 (v!11449 V!28791)) (EmptyCell!8453) )
))
(declare-fun mapValue!28336 () ValueCell!8453)

(declare-fun mapKey!28336 () (_ BitVec 32))

(declare-datatypes ((array!51689 0))(
  ( (array!51690 (arr!24857 (Array (_ BitVec 32) (_ BitVec 64))) (size!25299 (_ BitVec 32))) )
))
(declare-datatypes ((array!51691 0))(
  ( (array!51692 (arr!24858 (Array (_ BitVec 32) ValueCell!8453)) (size!25300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3922 0))(
  ( (LongMapFixedSize!3923 (defaultEntry!5152 Int) (mask!25553 (_ BitVec 32)) (extraKeys!4846 (_ BitVec 32)) (zeroValue!4950 V!28791) (minValue!4950 V!28791) (_size!2016 (_ BitVec 32)) (_keys!9824 array!51689) (_values!5137 array!51691) (_vacant!2016 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3922)

(declare-fun mapRest!28336 () (Array (_ BitVec 32) ValueCell!8453))

(assert (=> mapNonEmpty!28336 (= (arr!24858 (_values!5137 thiss!1181)) (store mapRest!28336 mapKey!28336 mapValue!28336))))

(declare-fun b!887699 () Bool)

(assert (=> b!887699 (= e!494493 tp_is_empty!17869)))

(declare-fun e!494497 () Bool)

(declare-fun e!494496 () Bool)

(declare-fun array_inv!19610 (array!51689) Bool)

(declare-fun array_inv!19611 (array!51691) Bool)

(assert (=> b!887700 (= e!494497 (and tp!54571 tp_is_empty!17869 (array_inv!19610 (_keys!9824 thiss!1181)) (array_inv!19611 (_values!5137 thiss!1181)) e!494496))))

(declare-fun lt!401286 () Bool)

(declare-fun valid!1538 (LongMapFixedSize!3922) Bool)

(assert (=> start!75408 (= lt!401286 (valid!1538 thiss!1181))))

(assert (=> start!75408 false))

(assert (=> start!75408 e!494497))

(declare-fun b!887697 () Bool)

(assert (=> b!887697 (= e!494496 (and e!494495 mapRes!28336))))

(declare-fun condMapEmpty!28336 () Bool)

(declare-fun mapDefault!28336 () ValueCell!8453)

(assert (=> b!887697 (= condMapEmpty!28336 (= (arr!24858 (_values!5137 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8453)) mapDefault!28336)))))

(assert (= (and b!887697 condMapEmpty!28336) mapIsEmpty!28336))

(assert (= (and b!887697 (not condMapEmpty!28336)) mapNonEmpty!28336))

(get-info :version)

(assert (= (and mapNonEmpty!28336 ((_ is ValueCellFull!8453) mapValue!28336)) b!887699))

(assert (= (and b!887697 ((_ is ValueCellFull!8453) mapDefault!28336)) b!887698))

(assert (= b!887700 b!887697))

(assert (= start!75408 b!887700))

(declare-fun m!826643 () Bool)

(assert (=> mapNonEmpty!28336 m!826643))

(declare-fun m!826645 () Bool)

(assert (=> b!887700 m!826645))

(declare-fun m!826647 () Bool)

(assert (=> b!887700 m!826647))

(declare-fun m!826649 () Bool)

(assert (=> start!75408 m!826649))

(check-sat (not start!75408) (not mapNonEmpty!28336) b_and!25751 (not b!887700) (not b_next!15541) tp_is_empty!17869)
(check-sat b_and!25751 (not b_next!15541))
