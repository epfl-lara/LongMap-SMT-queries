; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7972 () Bool)

(assert start!7972)

(declare-fun b!49946 () Bool)

(declare-fun b_free!1521 () Bool)

(declare-fun b_next!1521 () Bool)

(assert (=> b!49946 (= b_free!1521 (not b_next!1521))))

(declare-fun tp!6607 () Bool)

(declare-fun b_and!2731 () Bool)

(assert (=> b!49946 (= tp!6607 b_and!2731)))

(declare-fun b!49943 () Bool)

(declare-fun e!32196 () Bool)

(declare-fun e!32199 () Bool)

(declare-fun mapRes!2147 () Bool)

(assert (=> b!49943 (= e!32196 (and e!32199 mapRes!2147))))

(declare-fun condMapEmpty!2147 () Bool)

(declare-datatypes ((array!3259 0))(
  ( (array!3260 (arr!1559 (Array (_ BitVec 32) (_ BitVec 64))) (size!1781 (_ BitVec 32))) )
))
(declare-datatypes ((V!2547 0))(
  ( (V!2548 (val!1132 Int)) )
))
(declare-datatypes ((ValueCell!744 0))(
  ( (ValueCellFull!744 (v!2151 V!2547)) (EmptyCell!744) )
))
(declare-datatypes ((array!3261 0))(
  ( (array!3262 (arr!1560 (Array (_ BitVec 32) ValueCell!744)) (size!1782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!396 0))(
  ( (LongMapFixedSize!397 (defaultEntry!1912 Int) (mask!5692 (_ BitVec 32)) (extraKeys!1803 (_ BitVec 32)) (zeroValue!1830 V!2547) (minValue!1830 V!2547) (_size!247 (_ BitVec 32)) (_keys!3518 array!3259) (_values!1895 array!3261) (_vacant!247 (_ BitVec 32))) )
))
(declare-fun thiss!1134 () LongMapFixedSize!396)

(declare-fun mapDefault!2147 () ValueCell!744)

(assert (=> b!49943 (= condMapEmpty!2147 (= (arr!1560 (_values!1895 thiss!1134)) ((as const (Array (_ BitVec 32) ValueCell!744)) mapDefault!2147)))))

(declare-fun b!49944 () Bool)

(declare-fun tp_is_empty!2175 () Bool)

(assert (=> b!49944 (= e!32199 tp_is_empty!2175)))

(declare-fun lt!21008 () Bool)

(declare-fun valid!128 (LongMapFixedSize!396) Bool)

(assert (=> start!7972 (= lt!21008 (valid!128 thiss!1134))))

(assert (=> start!7972 false))

(declare-fun e!32200 () Bool)

(assert (=> start!7972 e!32200))

(declare-fun mapNonEmpty!2147 () Bool)

(declare-fun tp!6608 () Bool)

(declare-fun e!32197 () Bool)

(assert (=> mapNonEmpty!2147 (= mapRes!2147 (and tp!6608 e!32197))))

(declare-fun mapValue!2147 () ValueCell!744)

(declare-fun mapKey!2147 () (_ BitVec 32))

(declare-fun mapRest!2147 () (Array (_ BitVec 32) ValueCell!744))

(assert (=> mapNonEmpty!2147 (= (arr!1560 (_values!1895 thiss!1134)) (store mapRest!2147 mapKey!2147 mapValue!2147))))

(declare-fun b!49945 () Bool)

(assert (=> b!49945 (= e!32197 tp_is_empty!2175)))

(declare-fun array_inv!953 (array!3259) Bool)

(declare-fun array_inv!954 (array!3261) Bool)

(assert (=> b!49946 (= e!32200 (and tp!6607 tp_is_empty!2175 (array_inv!953 (_keys!3518 thiss!1134)) (array_inv!954 (_values!1895 thiss!1134)) e!32196))))

(declare-fun mapIsEmpty!2147 () Bool)

(assert (=> mapIsEmpty!2147 mapRes!2147))

(assert (= (and b!49943 condMapEmpty!2147) mapIsEmpty!2147))

(assert (= (and b!49943 (not condMapEmpty!2147)) mapNonEmpty!2147))

(get-info :version)

(assert (= (and mapNonEmpty!2147 ((_ is ValueCellFull!744) mapValue!2147)) b!49945))

(assert (= (and b!49943 ((_ is ValueCellFull!744) mapDefault!2147)) b!49944))

(assert (= b!49946 b!49943))

(assert (= start!7972 b!49946))

(declare-fun m!43427 () Bool)

(assert (=> start!7972 m!43427))

(declare-fun m!43429 () Bool)

(assert (=> mapNonEmpty!2147 m!43429))

(declare-fun m!43431 () Bool)

(assert (=> b!49946 m!43431))

(declare-fun m!43433 () Bool)

(assert (=> b!49946 m!43433))

(check-sat (not start!7972) (not b!49946) (not b_next!1521) (not mapNonEmpty!2147) b_and!2731 tp_is_empty!2175)
(check-sat b_and!2731 (not b_next!1521))
