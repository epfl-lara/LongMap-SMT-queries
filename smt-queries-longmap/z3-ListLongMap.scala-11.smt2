; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!446 () Bool)

(assert start!446)

(declare-fun b!2639 () Bool)

(declare-fun b_free!63 () Bool)

(declare-fun b_next!63 () Bool)

(assert (=> b!2639 (= b_free!63 (not b_next!63))))

(declare-fun tp!253 () Bool)

(declare-fun b_and!201 () Bool)

(assert (=> b!2639 (= tp!253 b_and!201)))

(declare-fun mapIsEmpty!17 () Bool)

(declare-fun mapRes!17 () Bool)

(assert (=> mapIsEmpty!17 mapRes!17))

(declare-fun b!2633 () Bool)

(declare-fun e!964 () Bool)

(assert (=> b!2633 (= e!964 false)))

(declare-fun lt!374 () Bool)

(declare-datatypes ((V!245 0))(
  ( (V!246 (val!31 Int)) )
))
(declare-datatypes ((ValueCell!9 0))(
  ( (ValueCellFull!9 (v!1115 V!245)) (EmptyCell!9) )
))
(declare-datatypes ((array!33 0))(
  ( (array!34 (arr!15 (Array (_ BitVec 32) ValueCell!9)) (size!77 (_ BitVec 32))) )
))
(declare-datatypes ((array!35 0))(
  ( (array!36 (arr!16 (Array (_ BitVec 32) (_ BitVec 64))) (size!78 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!18 0))(
  ( (LongMapFixedSize!19 (defaultEntry!1593 Int) (mask!4171 (_ BitVec 32)) (extraKeys!1510 (_ BitVec 32)) (zeroValue!1533 V!245) (minValue!1533 V!245) (_size!40 (_ BitVec 32)) (_keys!2995 array!35) (_values!1594 array!33) (_vacant!40 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!18 0))(
  ( (Cell!19 (v!1116 LongMapFixedSize!18)) )
))
(declare-datatypes ((LongMap!18 0))(
  ( (LongMap!19 (underlying!20 Cell!18)) )
))
(declare-fun thiss!814 () LongMap!18)

(declare-fun isEmpty!44 (LongMapFixedSize!18) Bool)

(assert (=> b!2633 (= lt!374 (isEmpty!44 (v!1116 (underlying!20 thiss!814))))))

(declare-fun b!2634 () Bool)

(declare-fun e!962 () Bool)

(declare-fun e!968 () Bool)

(assert (=> b!2634 (= e!962 (and e!968 mapRes!17))))

(declare-fun condMapEmpty!17 () Bool)

(declare-fun mapDefault!17 () ValueCell!9)

(assert (=> b!2634 (= condMapEmpty!17 (= (arr!15 (_values!1594 (v!1116 (underlying!20 thiss!814)))) ((as const (Array (_ BitVec 32) ValueCell!9)) mapDefault!17)))))

(declare-fun mapNonEmpty!17 () Bool)

(declare-fun tp!254 () Bool)

(declare-fun e!965 () Bool)

(assert (=> mapNonEmpty!17 (= mapRes!17 (and tp!254 e!965))))

(declare-fun mapKey!17 () (_ BitVec 32))

(declare-fun mapValue!17 () ValueCell!9)

(declare-fun mapRest!17 () (Array (_ BitVec 32) ValueCell!9))

(assert (=> mapNonEmpty!17 (= (arr!15 (_values!1594 (v!1116 (underlying!20 thiss!814)))) (store mapRest!17 mapKey!17 mapValue!17))))

(declare-fun b!2635 () Bool)

(declare-fun e!966 () Bool)

(declare-fun e!967 () Bool)

(assert (=> b!2635 (= e!966 e!967)))

(declare-fun res!4796 () Bool)

(assert (=> start!446 (=> (not res!4796) (not e!964))))

(declare-fun valid!11 (LongMap!18) Bool)

(assert (=> start!446 (= res!4796 (valid!11 thiss!814))))

(assert (=> start!446 e!964))

(declare-fun e!969 () Bool)

(assert (=> start!446 e!969))

(declare-fun b!2636 () Bool)

(declare-fun tp_is_empty!51 () Bool)

(assert (=> b!2636 (= e!965 tp_is_empty!51)))

(declare-fun b!2637 () Bool)

(assert (=> b!2637 (= e!968 tp_is_empty!51)))

(declare-fun b!2638 () Bool)

(assert (=> b!2638 (= e!969 e!966)))

(declare-fun array_inv!3 (array!35) Bool)

(declare-fun array_inv!4 (array!33) Bool)

(assert (=> b!2639 (= e!967 (and tp!253 tp_is_empty!51 (array_inv!3 (_keys!2995 (v!1116 (underlying!20 thiss!814)))) (array_inv!4 (_values!1594 (v!1116 (underlying!20 thiss!814)))) e!962))))

(assert (= (and start!446 res!4796) b!2633))

(assert (= (and b!2634 condMapEmpty!17) mapIsEmpty!17))

(assert (= (and b!2634 (not condMapEmpty!17)) mapNonEmpty!17))

(get-info :version)

(assert (= (and mapNonEmpty!17 ((_ is ValueCellFull!9) mapValue!17)) b!2636))

(assert (= (and b!2634 ((_ is ValueCellFull!9) mapDefault!17)) b!2637))

(assert (= b!2639 b!2634))

(assert (= b!2635 b!2639))

(assert (= b!2638 b!2635))

(assert (= start!446 b!2638))

(declare-fun m!1145 () Bool)

(assert (=> b!2633 m!1145))

(declare-fun m!1147 () Bool)

(assert (=> mapNonEmpty!17 m!1147))

(declare-fun m!1149 () Bool)

(assert (=> start!446 m!1149))

(declare-fun m!1151 () Bool)

(assert (=> b!2639 m!1151))

(declare-fun m!1153 () Bool)

(assert (=> b!2639 m!1153))

(check-sat (not mapNonEmpty!17) (not b!2639) (not b!2633) tp_is_empty!51 (not b_next!63) (not start!446) b_and!201)
(check-sat b_and!201 (not b_next!63))
