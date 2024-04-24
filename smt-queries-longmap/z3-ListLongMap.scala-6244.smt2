; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80056 () Bool)

(assert start!80056)

(declare-fun b!940470 () Bool)

(declare-fun b_free!17785 () Bool)

(declare-fun b_next!17785 () Bool)

(assert (=> b!940470 (= b_free!17785 (not b_next!17785))))

(declare-fun tp!61819 () Bool)

(declare-fun b_and!29207 () Bool)

(assert (=> b!940470 (= tp!61819 b_and!29207)))

(declare-fun tp_is_empty!20293 () Bool)

(declare-datatypes ((V!32023 0))(
  ( (V!32024 (val!10197 Int)) )
))
(declare-datatypes ((ValueCell!9665 0))(
  ( (ValueCellFull!9665 (v!12725 V!32023)) (EmptyCell!9665) )
))
(declare-datatypes ((array!56579 0))(
  ( (array!56580 (arr!27223 (Array (_ BitVec 32) ValueCell!9665)) (size!27683 (_ BitVec 32))) )
))
(declare-datatypes ((array!56581 0))(
  ( (array!56582 (arr!27224 (Array (_ BitVec 32) (_ BitVec 64))) (size!27684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4480 0))(
  ( (LongMapFixedSize!4481 (defaultEntry!5531 Int) (mask!27088 (_ BitVec 32)) (extraKeys!5263 (_ BitVec 32)) (zeroValue!5367 V!32023) (minValue!5367 V!32023) (_size!2295 (_ BitVec 32)) (_keys!10407 array!56581) (_values!5554 array!56579) (_vacant!2295 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4480)

(declare-fun e!528351 () Bool)

(declare-fun e!528350 () Bool)

(declare-fun array_inv!21258 (array!56581) Bool)

(declare-fun array_inv!21259 (array!56579) Bool)

(assert (=> b!940470 (= e!528351 (and tp!61819 tp_is_empty!20293 (array_inv!21258 (_keys!10407 thiss!1141)) (array_inv!21259 (_values!5554 thiss!1141)) e!528350))))

(declare-fun mapIsEmpty!32219 () Bool)

(declare-fun mapRes!32219 () Bool)

(assert (=> mapIsEmpty!32219 mapRes!32219))

(declare-fun b!940471 () Bool)

(declare-fun e!528349 () Bool)

(assert (=> b!940471 (= e!528349 tp_is_empty!20293)))

(declare-fun b!940469 () Bool)

(declare-fun e!528348 () Bool)

(assert (=> b!940469 (= e!528348 tp_is_empty!20293)))

(declare-fun lt!424919 () Bool)

(declare-fun valid!1731 (LongMapFixedSize!4480) Bool)

(assert (=> start!80056 (= lt!424919 (valid!1731 thiss!1141))))

(assert (=> start!80056 false))

(assert (=> start!80056 e!528351))

(declare-fun mapNonEmpty!32219 () Bool)

(declare-fun tp!61820 () Bool)

(assert (=> mapNonEmpty!32219 (= mapRes!32219 (and tp!61820 e!528348))))

(declare-fun mapRest!32219 () (Array (_ BitVec 32) ValueCell!9665))

(declare-fun mapKey!32219 () (_ BitVec 32))

(declare-fun mapValue!32219 () ValueCell!9665)

(assert (=> mapNonEmpty!32219 (= (arr!27223 (_values!5554 thiss!1141)) (store mapRest!32219 mapKey!32219 mapValue!32219))))

(declare-fun b!940472 () Bool)

(assert (=> b!940472 (= e!528350 (and e!528349 mapRes!32219))))

(declare-fun condMapEmpty!32219 () Bool)

(declare-fun mapDefault!32219 () ValueCell!9665)

(assert (=> b!940472 (= condMapEmpty!32219 (= (arr!27223 (_values!5554 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9665)) mapDefault!32219)))))

(assert (= (and b!940472 condMapEmpty!32219) mapIsEmpty!32219))

(assert (= (and b!940472 (not condMapEmpty!32219)) mapNonEmpty!32219))

(get-info :version)

(assert (= (and mapNonEmpty!32219 ((_ is ValueCellFull!9665) mapValue!32219)) b!940469))

(assert (= (and b!940472 ((_ is ValueCellFull!9665) mapDefault!32219)) b!940471))

(assert (= b!940470 b!940472))

(assert (= start!80056 b!940470))

(declare-fun m!876693 () Bool)

(assert (=> b!940470 m!876693))

(declare-fun m!876695 () Bool)

(assert (=> b!940470 m!876695))

(declare-fun m!876697 () Bool)

(assert (=> start!80056 m!876697))

(declare-fun m!876699 () Bool)

(assert (=> mapNonEmpty!32219 m!876699))

(check-sat tp_is_empty!20293 (not b_next!17785) b_and!29207 (not start!80056) (not mapNonEmpty!32219) (not b!940470))
(check-sat b_and!29207 (not b_next!17785))
