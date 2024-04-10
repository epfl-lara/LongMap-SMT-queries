; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79884 () Bool)

(assert start!79884)

(declare-fun b!939543 () Bool)

(declare-fun b_free!17781 () Bool)

(declare-fun b_next!17781 () Bool)

(assert (=> b!939543 (= b_free!17781 (not b_next!17781))))

(declare-fun tp!61807 () Bool)

(declare-fun b_and!29193 () Bool)

(assert (=> b!939543 (= tp!61807 b_and!29193)))

(declare-fun mapNonEmpty!32213 () Bool)

(declare-fun mapRes!32213 () Bool)

(declare-fun tp!61806 () Bool)

(declare-fun e!527737 () Bool)

(assert (=> mapNonEmpty!32213 (= mapRes!32213 (and tp!61806 e!527737))))

(declare-datatypes ((V!32017 0))(
  ( (V!32018 (val!10195 Int)) )
))
(declare-datatypes ((ValueCell!9663 0))(
  ( (ValueCellFull!9663 (v!12726 V!32017)) (EmptyCell!9663) )
))
(declare-datatypes ((array!56520 0))(
  ( (array!56521 (arr!27198 (Array (_ BitVec 32) ValueCell!9663)) (size!27657 (_ BitVec 32))) )
))
(declare-datatypes ((array!56522 0))(
  ( (array!56523 (arr!27199 (Array (_ BitVec 32) (_ BitVec 64))) (size!27658 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4476 0))(
  ( (LongMapFixedSize!4477 (defaultEntry!5529 Int) (mask!27041 (_ BitVec 32)) (extraKeys!5261 (_ BitVec 32)) (zeroValue!5365 V!32017) (minValue!5365 V!32017) (_size!2293 (_ BitVec 32)) (_keys!10377 array!56522) (_values!5552 array!56520) (_vacant!2293 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4476)

(declare-fun mapValue!32213 () ValueCell!9663)

(declare-fun mapRest!32213 () (Array (_ BitVec 32) ValueCell!9663))

(declare-fun mapKey!32213 () (_ BitVec 32))

(assert (=> mapNonEmpty!32213 (= (arr!27198 (_values!5552 thiss!1141)) (store mapRest!32213 mapKey!32213 mapValue!32213))))

(declare-fun lt!424552 () Bool)

(declare-fun valid!1720 (LongMapFixedSize!4476) Bool)

(assert (=> start!79884 (= lt!424552 (valid!1720 thiss!1141))))

(assert (=> start!79884 false))

(declare-fun e!527738 () Bool)

(assert (=> start!79884 e!527738))

(declare-fun b!939542 () Bool)

(declare-fun tp_is_empty!20289 () Bool)

(assert (=> b!939542 (= e!527737 tp_is_empty!20289)))

(declare-fun mapIsEmpty!32213 () Bool)

(assert (=> mapIsEmpty!32213 mapRes!32213))

(declare-fun e!527735 () Bool)

(declare-fun array_inv!21154 (array!56522) Bool)

(declare-fun array_inv!21155 (array!56520) Bool)

(assert (=> b!939543 (= e!527738 (and tp!61807 tp_is_empty!20289 (array_inv!21154 (_keys!10377 thiss!1141)) (array_inv!21155 (_values!5552 thiss!1141)) e!527735))))

(declare-fun b!939544 () Bool)

(declare-fun e!527736 () Bool)

(assert (=> b!939544 (= e!527735 (and e!527736 mapRes!32213))))

(declare-fun condMapEmpty!32213 () Bool)

(declare-fun mapDefault!32213 () ValueCell!9663)

(assert (=> b!939544 (= condMapEmpty!32213 (= (arr!27198 (_values!5552 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9663)) mapDefault!32213)))))

(declare-fun b!939545 () Bool)

(assert (=> b!939545 (= e!527736 tp_is_empty!20289)))

(assert (= (and b!939544 condMapEmpty!32213) mapIsEmpty!32213))

(assert (= (and b!939544 (not condMapEmpty!32213)) mapNonEmpty!32213))

(get-info :version)

(assert (= (and mapNonEmpty!32213 ((_ is ValueCellFull!9663) mapValue!32213)) b!939542))

(assert (= (and b!939544 ((_ is ValueCellFull!9663) mapDefault!32213)) b!939545))

(assert (= b!939543 b!939544))

(assert (= start!79884 b!939543))

(declare-fun m!875383 () Bool)

(assert (=> mapNonEmpty!32213 m!875383))

(declare-fun m!875385 () Bool)

(assert (=> start!79884 m!875385))

(declare-fun m!875387 () Bool)

(assert (=> b!939543 m!875387))

(declare-fun m!875389 () Bool)

(assert (=> b!939543 m!875389))

(check-sat (not start!79884) (not mapNonEmpty!32213) tp_is_empty!20289 (not b_next!17781) b_and!29193 (not b!939543))
(check-sat b_and!29193 (not b_next!17781))
