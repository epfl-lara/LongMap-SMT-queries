; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80050 () Bool)

(assert start!80050)

(declare-fun b!940433 () Bool)

(declare-fun b_free!17779 () Bool)

(declare-fun b_next!17779 () Bool)

(assert (=> b!940433 (= b_free!17779 (not b_next!17779))))

(declare-fun tp!61801 () Bool)

(declare-fun b_and!29201 () Bool)

(assert (=> b!940433 (= tp!61801 b_and!29201)))

(declare-fun e!528304 () Bool)

(declare-datatypes ((V!32015 0))(
  ( (V!32016 (val!10194 Int)) )
))
(declare-datatypes ((ValueCell!9662 0))(
  ( (ValueCellFull!9662 (v!12722 V!32015)) (EmptyCell!9662) )
))
(declare-datatypes ((array!56567 0))(
  ( (array!56568 (arr!27217 (Array (_ BitVec 32) ValueCell!9662)) (size!27677 (_ BitVec 32))) )
))
(declare-datatypes ((array!56569 0))(
  ( (array!56570 (arr!27218 (Array (_ BitVec 32) (_ BitVec 64))) (size!27678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4474 0))(
  ( (LongMapFixedSize!4475 (defaultEntry!5528 Int) (mask!27083 (_ BitVec 32)) (extraKeys!5260 (_ BitVec 32)) (zeroValue!5364 V!32015) (minValue!5364 V!32015) (_size!2292 (_ BitVec 32)) (_keys!10404 array!56569) (_values!5551 array!56567) (_vacant!2292 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4474)

(declare-fun tp_is_empty!20287 () Bool)

(declare-fun e!528305 () Bool)

(declare-fun array_inv!21252 (array!56569) Bool)

(declare-fun array_inv!21253 (array!56567) Bool)

(assert (=> b!940433 (= e!528304 (and tp!61801 tp_is_empty!20287 (array_inv!21252 (_keys!10404 thiss!1141)) (array_inv!21253 (_values!5551 thiss!1141)) e!528305))))

(declare-fun mapNonEmpty!32210 () Bool)

(declare-fun mapRes!32210 () Bool)

(declare-fun tp!61802 () Bool)

(declare-fun e!528303 () Bool)

(assert (=> mapNonEmpty!32210 (= mapRes!32210 (and tp!61802 e!528303))))

(declare-fun mapRest!32210 () (Array (_ BitVec 32) ValueCell!9662))

(declare-fun mapValue!32210 () ValueCell!9662)

(declare-fun mapKey!32210 () (_ BitVec 32))

(assert (=> mapNonEmpty!32210 (= (arr!27217 (_values!5551 thiss!1141)) (store mapRest!32210 mapKey!32210 mapValue!32210))))

(declare-fun b!940434 () Bool)

(declare-fun e!528302 () Bool)

(assert (=> b!940434 (= e!528302 tp_is_empty!20287)))

(declare-fun lt!424910 () Bool)

(declare-fun valid!1729 (LongMapFixedSize!4474) Bool)

(assert (=> start!80050 (= lt!424910 (valid!1729 thiss!1141))))

(assert (=> start!80050 false))

(assert (=> start!80050 e!528304))

(declare-fun mapIsEmpty!32210 () Bool)

(assert (=> mapIsEmpty!32210 mapRes!32210))

(declare-fun b!940435 () Bool)

(assert (=> b!940435 (= e!528303 tp_is_empty!20287)))

(declare-fun b!940436 () Bool)

(assert (=> b!940436 (= e!528305 (and e!528302 mapRes!32210))))

(declare-fun condMapEmpty!32210 () Bool)

(declare-fun mapDefault!32210 () ValueCell!9662)

(assert (=> b!940436 (= condMapEmpty!32210 (= (arr!27217 (_values!5551 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9662)) mapDefault!32210)))))

(assert (= (and b!940436 condMapEmpty!32210) mapIsEmpty!32210))

(assert (= (and b!940436 (not condMapEmpty!32210)) mapNonEmpty!32210))

(get-info :version)

(assert (= (and mapNonEmpty!32210 ((_ is ValueCellFull!9662) mapValue!32210)) b!940435))

(assert (= (and b!940436 ((_ is ValueCellFull!9662) mapDefault!32210)) b!940434))

(assert (= b!940433 b!940436))

(assert (= start!80050 b!940433))

(declare-fun m!876669 () Bool)

(assert (=> b!940433 m!876669))

(declare-fun m!876671 () Bool)

(assert (=> b!940433 m!876671))

(declare-fun m!876673 () Bool)

(assert (=> mapNonEmpty!32210 m!876673))

(declare-fun m!876675 () Bool)

(assert (=> start!80050 m!876675))

(check-sat (not mapNonEmpty!32210) tp_is_empty!20287 (not b_next!17779) (not start!80050) b_and!29201 (not b!940433))
(check-sat b_and!29201 (not b_next!17779))
