; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89286 () Bool)

(assert start!89286)

(declare-fun b!1022368 () Bool)

(declare-fun b_free!20113 () Bool)

(declare-fun b_next!20113 () Bool)

(assert (=> b!1022368 (= b_free!20113 (not b_next!20113))))

(declare-fun tp!71367 () Bool)

(declare-fun b_and!32311 () Bool)

(assert (=> b!1022368 (= tp!71367 b_and!32311)))

(declare-fun b!1022366 () Bool)

(declare-fun e!575756 () Bool)

(declare-fun tp_is_empty!23833 () Bool)

(assert (=> b!1022366 (= e!575756 tp_is_empty!23833)))

(declare-fun b!1022367 () Bool)

(declare-fun e!575753 () Bool)

(declare-fun e!575757 () Bool)

(declare-fun mapRes!37161 () Bool)

(assert (=> b!1022367 (= e!575753 (and e!575757 mapRes!37161))))

(declare-fun condMapEmpty!37161 () Bool)

(declare-datatypes ((V!36651 0))(
  ( (V!36652 (val!11967 Int)) )
))
(declare-datatypes ((array!63755 0))(
  ( (array!63756 (arr!30685 (Array (_ BitVec 32) (_ BitVec 64))) (size!31197 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11213 0))(
  ( (ValueCellFull!11213 (v!14517 V!36651)) (EmptyCell!11213) )
))
(declare-datatypes ((array!63757 0))(
  ( (array!63758 (arr!30686 (Array (_ BitVec 32) ValueCell!11213)) (size!31198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5020 0))(
  ( (LongMapFixedSize!5021 (defaultEntry!5862 Int) (mask!29483 (_ BitVec 32)) (extraKeys!5594 (_ BitVec 32)) (zeroValue!5698 V!36651) (minValue!5698 V!36651) (_size!2565 (_ BitVec 32)) (_keys!11045 array!63755) (_values!5885 array!63757) (_vacant!2565 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1094 0))(
  ( (Cell!1095 (v!14518 LongMapFixedSize!5020)) )
))
(declare-datatypes ((LongMap!1094 0))(
  ( (LongMap!1095 (underlying!558 Cell!1094)) )
))
(declare-fun thiss!908 () LongMap!1094)

(declare-fun mapDefault!37161 () ValueCell!11213)

(assert (=> b!1022367 (= condMapEmpty!37161 (= (arr!30686 (_values!5885 (v!14518 (underlying!558 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11213)) mapDefault!37161)))))

(declare-fun e!575751 () Bool)

(declare-fun array_inv!23819 (array!63755) Bool)

(declare-fun array_inv!23820 (array!63757) Bool)

(assert (=> b!1022368 (= e!575751 (and tp!71367 tp_is_empty!23833 (array_inv!23819 (_keys!11045 (v!14518 (underlying!558 thiss!908)))) (array_inv!23820 (_values!5885 (v!14518 (underlying!558 thiss!908)))) e!575753))))

(declare-fun b!1022369 () Bool)

(declare-fun e!575752 () Bool)

(declare-fun e!575750 () Bool)

(assert (=> b!1022369 (= e!575752 e!575750)))

(declare-fun res!684833 () Bool)

(declare-fun e!575754 () Bool)

(assert (=> start!89286 (=> (not res!684833) (not e!575754))))

(declare-fun valid!1919 (LongMap!1094) Bool)

(assert (=> start!89286 (= res!684833 (valid!1919 thiss!908))))

(assert (=> start!89286 e!575754))

(assert (=> start!89286 e!575752))

(assert (=> start!89286 true))

(declare-fun mapIsEmpty!37161 () Bool)

(assert (=> mapIsEmpty!37161 mapRes!37161))

(declare-fun b!1022370 () Bool)

(assert (=> b!1022370 (= e!575750 e!575751)))

(declare-fun b!1022371 () Bool)

(assert (=> b!1022371 (= e!575757 tp_is_empty!23833)))

(declare-fun mapNonEmpty!37161 () Bool)

(declare-fun tp!71368 () Bool)

(assert (=> mapNonEmpty!37161 (= mapRes!37161 (and tp!71368 e!575756))))

(declare-fun mapValue!37161 () ValueCell!11213)

(declare-fun mapKey!37161 () (_ BitVec 32))

(declare-fun mapRest!37161 () (Array (_ BitVec 32) ValueCell!11213))

(assert (=> mapNonEmpty!37161 (= (arr!30686 (_values!5885 (v!14518 (underlying!558 thiss!908)))) (store mapRest!37161 mapKey!37161 mapValue!37161))))

(declare-fun b!1022372 () Bool)

(assert (=> b!1022372 (= e!575754 false)))

(declare-fun lt!450488 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15476 0))(
  ( (tuple2!15477 (_1!7749 Bool) (_2!7749 LongMapFixedSize!5020)) )
))
(declare-fun remove!4 (LongMapFixedSize!5020 (_ BitVec 64)) tuple2!15476)

(assert (=> b!1022372 (= lt!450488 (valid!1919 (LongMap!1095 (Cell!1095 (_2!7749 (remove!4 (v!14518 (underlying!558 thiss!908)) key!697))))))))

(assert (= (and start!89286 res!684833) b!1022372))

(assert (= (and b!1022367 condMapEmpty!37161) mapIsEmpty!37161))

(assert (= (and b!1022367 (not condMapEmpty!37161)) mapNonEmpty!37161))

(get-info :version)

(assert (= (and mapNonEmpty!37161 ((_ is ValueCellFull!11213) mapValue!37161)) b!1022366))

(assert (= (and b!1022367 ((_ is ValueCellFull!11213) mapDefault!37161)) b!1022371))

(assert (= b!1022368 b!1022367))

(assert (= b!1022370 b!1022368))

(assert (= b!1022369 b!1022370))

(assert (= start!89286 b!1022369))

(declare-fun m!942373 () Bool)

(assert (=> b!1022368 m!942373))

(declare-fun m!942375 () Bool)

(assert (=> b!1022368 m!942375))

(declare-fun m!942377 () Bool)

(assert (=> start!89286 m!942377))

(declare-fun m!942379 () Bool)

(assert (=> mapNonEmpty!37161 m!942379))

(declare-fun m!942381 () Bool)

(assert (=> b!1022372 m!942381))

(declare-fun m!942383 () Bool)

(assert (=> b!1022372 m!942383))

(check-sat (not b!1022368) (not b!1022372) (not mapNonEmpty!37161) (not start!89286) (not b_next!20113) b_and!32311 tp_is_empty!23833)
(check-sat b_and!32311 (not b_next!20113))
