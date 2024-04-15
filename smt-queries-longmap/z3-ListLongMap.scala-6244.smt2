; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79870 () Bool)

(assert start!79870)

(declare-fun b!939328 () Bool)

(declare-fun b_free!17785 () Bool)

(declare-fun b_next!17785 () Bool)

(assert (=> b!939328 (= b_free!17785 (not b_next!17785))))

(declare-fun tp!61819 () Bool)

(declare-fun b_and!29171 () Bool)

(assert (=> b!939328 (= tp!61819 b_and!29171)))

(declare-fun b!939327 () Bool)

(declare-fun e!527617 () Bool)

(declare-fun tp_is_empty!20293 () Bool)

(assert (=> b!939327 (= e!527617 tp_is_empty!20293)))

(declare-datatypes ((V!32023 0))(
  ( (V!32024 (val!10197 Int)) )
))
(declare-datatypes ((ValueCell!9665 0))(
  ( (ValueCellFull!9665 (v!12727 V!32023)) (EmptyCell!9665) )
))
(declare-datatypes ((array!56493 0))(
  ( (array!56494 (arr!27185 (Array (_ BitVec 32) ValueCell!9665)) (size!27646 (_ BitVec 32))) )
))
(declare-datatypes ((array!56495 0))(
  ( (array!56496 (arr!27186 (Array (_ BitVec 32) (_ BitVec 64))) (size!27647 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4480 0))(
  ( (LongMapFixedSize!4481 (defaultEntry!5531 Int) (mask!27038 (_ BitVec 32)) (extraKeys!5263 (_ BitVec 32)) (zeroValue!5367 V!32023) (minValue!5367 V!32023) (_size!2295 (_ BitVec 32)) (_keys!10374 array!56495) (_values!5554 array!56493) (_vacant!2295 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4480)

(declare-fun e!527618 () Bool)

(declare-fun e!527620 () Bool)

(declare-fun array_inv!21210 (array!56495) Bool)

(declare-fun array_inv!21211 (array!56493) Bool)

(assert (=> b!939328 (= e!527618 (and tp!61819 tp_is_empty!20293 (array_inv!21210 (_keys!10374 thiss!1141)) (array_inv!21211 (_values!5554 thiss!1141)) e!527620))))

(declare-fun mapIsEmpty!32219 () Bool)

(declare-fun mapRes!32219 () Bool)

(assert (=> mapIsEmpty!32219 mapRes!32219))

(declare-fun mapNonEmpty!32219 () Bool)

(declare-fun tp!61820 () Bool)

(declare-fun e!527621 () Bool)

(assert (=> mapNonEmpty!32219 (= mapRes!32219 (and tp!61820 e!527621))))

(declare-fun mapValue!32219 () ValueCell!9665)

(declare-fun mapKey!32219 () (_ BitVec 32))

(declare-fun mapRest!32219 () (Array (_ BitVec 32) ValueCell!9665))

(assert (=> mapNonEmpty!32219 (= (arr!27185 (_values!5554 thiss!1141)) (store mapRest!32219 mapKey!32219 mapValue!32219))))

(declare-fun b!939329 () Bool)

(assert (=> b!939329 (= e!527620 (and e!527617 mapRes!32219))))

(declare-fun condMapEmpty!32219 () Bool)

(declare-fun mapDefault!32219 () ValueCell!9665)

(assert (=> b!939329 (= condMapEmpty!32219 (= (arr!27185 (_values!5554 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9665)) mapDefault!32219)))))

(declare-fun lt!424322 () Bool)

(declare-fun valid!1728 (LongMapFixedSize!4480) Bool)

(assert (=> start!79870 (= lt!424322 (valid!1728 thiss!1141))))

(assert (=> start!79870 false))

(assert (=> start!79870 e!527618))

(declare-fun b!939330 () Bool)

(assert (=> b!939330 (= e!527621 tp_is_empty!20293)))

(assert (= (and b!939329 condMapEmpty!32219) mapIsEmpty!32219))

(assert (= (and b!939329 (not condMapEmpty!32219)) mapNonEmpty!32219))

(get-info :version)

(assert (= (and mapNonEmpty!32219 ((_ is ValueCellFull!9665) mapValue!32219)) b!939330))

(assert (= (and b!939329 ((_ is ValueCellFull!9665) mapDefault!32219)) b!939327))

(assert (= b!939328 b!939329))

(assert (= start!79870 b!939328))

(declare-fun m!874641 () Bool)

(assert (=> b!939328 m!874641))

(declare-fun m!874643 () Bool)

(assert (=> b!939328 m!874643))

(declare-fun m!874645 () Bool)

(assert (=> mapNonEmpty!32219 m!874645))

(declare-fun m!874647 () Bool)

(assert (=> start!79870 m!874647))

(check-sat (not mapNonEmpty!32219) (not b_next!17785) (not start!79870) tp_is_empty!20293 b_and!29171 (not b!939328))
(check-sat b_and!29171 (not b_next!17785))
