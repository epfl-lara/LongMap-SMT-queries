; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75428 () Bool)

(assert start!75428)

(declare-fun b!887950 () Bool)

(declare-fun b_free!15543 () Bool)

(declare-fun b_next!15543 () Bool)

(assert (=> b!887950 (= b_free!15543 (not b_next!15543))))

(declare-fun tp!54575 () Bool)

(declare-fun b_and!25779 () Bool)

(assert (=> b!887950 (= tp!54575 b_and!25779)))

(declare-fun lt!401525 () Bool)

(declare-datatypes ((array!51710 0))(
  ( (array!51711 (arr!24867 (Array (_ BitVec 32) (_ BitVec 64))) (size!25307 (_ BitVec 32))) )
))
(declare-datatypes ((V!28793 0))(
  ( (V!28794 (val!8986 Int)) )
))
(declare-datatypes ((ValueCell!8454 0))(
  ( (ValueCellFull!8454 (v!11458 V!28793)) (EmptyCell!8454) )
))
(declare-datatypes ((array!51712 0))(
  ( (array!51713 (arr!24868 (Array (_ BitVec 32) ValueCell!8454)) (size!25308 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3924 0))(
  ( (LongMapFixedSize!3925 (defaultEntry!5153 Int) (mask!25561 (_ BitVec 32)) (extraKeys!4847 (_ BitVec 32)) (zeroValue!4951 V!28793) (minValue!4951 V!28793) (_size!2017 (_ BitVec 32)) (_keys!9830 array!51710) (_values!5138 array!51712) (_vacant!2017 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3924)

(declare-fun valid!1530 (LongMapFixedSize!3924) Bool)

(assert (=> start!75428 (= lt!401525 (valid!1530 thiss!1181))))

(assert (=> start!75428 false))

(declare-fun e!494658 () Bool)

(assert (=> start!75428 e!494658))

(declare-fun b!887948 () Bool)

(declare-fun e!494660 () Bool)

(declare-fun tp_is_empty!17871 () Bool)

(assert (=> b!887948 (= e!494660 tp_is_empty!17871)))

(declare-fun b!887949 () Bool)

(declare-fun e!494656 () Bool)

(declare-fun mapRes!28339 () Bool)

(assert (=> b!887949 (= e!494656 (and e!494660 mapRes!28339))))

(declare-fun condMapEmpty!28339 () Bool)

(declare-fun mapDefault!28339 () ValueCell!8454)

(assert (=> b!887949 (= condMapEmpty!28339 (= (arr!24868 (_values!5138 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8454)) mapDefault!28339)))))

(declare-fun array_inv!19572 (array!51710) Bool)

(declare-fun array_inv!19573 (array!51712) Bool)

(assert (=> b!887950 (= e!494658 (and tp!54575 tp_is_empty!17871 (array_inv!19572 (_keys!9830 thiss!1181)) (array_inv!19573 (_values!5138 thiss!1181)) e!494656))))

(declare-fun b!887951 () Bool)

(declare-fun e!494659 () Bool)

(assert (=> b!887951 (= e!494659 tp_is_empty!17871)))

(declare-fun mapNonEmpty!28339 () Bool)

(declare-fun tp!54576 () Bool)

(assert (=> mapNonEmpty!28339 (= mapRes!28339 (and tp!54576 e!494659))))

(declare-fun mapValue!28339 () ValueCell!8454)

(declare-fun mapKey!28339 () (_ BitVec 32))

(declare-fun mapRest!28339 () (Array (_ BitVec 32) ValueCell!8454))

(assert (=> mapNonEmpty!28339 (= (arr!24868 (_values!5138 thiss!1181)) (store mapRest!28339 mapKey!28339 mapValue!28339))))

(declare-fun mapIsEmpty!28339 () Bool)

(assert (=> mapIsEmpty!28339 mapRes!28339))

(assert (= (and b!887949 condMapEmpty!28339) mapIsEmpty!28339))

(assert (= (and b!887949 (not condMapEmpty!28339)) mapNonEmpty!28339))

(get-info :version)

(assert (= (and mapNonEmpty!28339 ((_ is ValueCellFull!8454) mapValue!28339)) b!887951))

(assert (= (and b!887949 ((_ is ValueCellFull!8454) mapDefault!28339)) b!887948))

(assert (= b!887950 b!887949))

(assert (= start!75428 b!887950))

(declare-fun m!827409 () Bool)

(assert (=> start!75428 m!827409))

(declare-fun m!827411 () Bool)

(assert (=> b!887950 m!827411))

(declare-fun m!827413 () Bool)

(assert (=> b!887950 m!827413))

(declare-fun m!827415 () Bool)

(assert (=> mapNonEmpty!28339 m!827415))

(check-sat (not start!75428) (not b!887950) (not mapNonEmpty!28339) (not b_next!15543) b_and!25779 tp_is_empty!17871)
(check-sat b_and!25779 (not b_next!15543))
