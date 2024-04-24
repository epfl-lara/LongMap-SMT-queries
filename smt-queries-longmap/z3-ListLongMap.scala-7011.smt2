; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89292 () Bool)

(assert start!89292)

(declare-fun b!1022433 () Bool)

(declare-fun b_free!20119 () Bool)

(declare-fun b_next!20119 () Bool)

(assert (=> b!1022433 (= b_free!20119 (not b_next!20119))))

(declare-fun tp!71385 () Bool)

(declare-fun b_and!32317 () Bool)

(assert (=> b!1022433 (= tp!71385 b_and!32317)))

(declare-fun b!1022429 () Bool)

(declare-fun e!575824 () Bool)

(declare-fun e!575827 () Bool)

(declare-fun mapRes!37170 () Bool)

(assert (=> b!1022429 (= e!575824 (and e!575827 mapRes!37170))))

(declare-fun condMapEmpty!37170 () Bool)

(declare-datatypes ((V!36659 0))(
  ( (V!36660 (val!11970 Int)) )
))
(declare-datatypes ((array!63767 0))(
  ( (array!63768 (arr!30691 (Array (_ BitVec 32) (_ BitVec 64))) (size!31203 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11216 0))(
  ( (ValueCellFull!11216 (v!14523 V!36659)) (EmptyCell!11216) )
))
(declare-datatypes ((array!63769 0))(
  ( (array!63770 (arr!30692 (Array (_ BitVec 32) ValueCell!11216)) (size!31204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5026 0))(
  ( (LongMapFixedSize!5027 (defaultEntry!5865 Int) (mask!29488 (_ BitVec 32)) (extraKeys!5597 (_ BitVec 32)) (zeroValue!5701 V!36659) (minValue!5701 V!36659) (_size!2568 (_ BitVec 32)) (_keys!11048 array!63767) (_values!5888 array!63769) (_vacant!2568 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1100 0))(
  ( (Cell!1101 (v!14524 LongMapFixedSize!5026)) )
))
(declare-datatypes ((LongMap!1100 0))(
  ( (LongMap!1101 (underlying!561 Cell!1100)) )
))
(declare-fun thiss!908 () LongMap!1100)

(declare-fun mapDefault!37170 () ValueCell!11216)

(assert (=> b!1022429 (= condMapEmpty!37170 (= (arr!30692 (_values!5888 (v!14524 (underlying!561 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11216)) mapDefault!37170)))))

(declare-fun mapIsEmpty!37170 () Bool)

(assert (=> mapIsEmpty!37170 mapRes!37170))

(declare-fun b!1022430 () Bool)

(declare-fun e!575826 () Bool)

(declare-fun e!575829 () Bool)

(assert (=> b!1022430 (= e!575826 e!575829)))

(declare-fun b!1022431 () Bool)

(declare-fun e!575822 () Bool)

(assert (=> b!1022431 (= e!575829 e!575822)))

(declare-fun res!684842 () Bool)

(declare-fun e!575823 () Bool)

(assert (=> start!89292 (=> (not res!684842) (not e!575823))))

(declare-fun valid!1921 (LongMap!1100) Bool)

(assert (=> start!89292 (= res!684842 (valid!1921 thiss!908))))

(assert (=> start!89292 e!575823))

(assert (=> start!89292 e!575826))

(assert (=> start!89292 true))

(declare-fun b!1022432 () Bool)

(assert (=> b!1022432 (= e!575823 false)))

(declare-fun lt!450497 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15480 0))(
  ( (tuple2!15481 (_1!7751 Bool) (_2!7751 LongMapFixedSize!5026)) )
))
(declare-fun remove!6 (LongMapFixedSize!5026 (_ BitVec 64)) tuple2!15480)

(assert (=> b!1022432 (= lt!450497 (valid!1921 (LongMap!1101 (Cell!1101 (_2!7751 (remove!6 (v!14524 (underlying!561 thiss!908)) key!697))))))))

(declare-fun tp_is_empty!23839 () Bool)

(declare-fun array_inv!23823 (array!63767) Bool)

(declare-fun array_inv!23824 (array!63769) Bool)

(assert (=> b!1022433 (= e!575822 (and tp!71385 tp_is_empty!23839 (array_inv!23823 (_keys!11048 (v!14524 (underlying!561 thiss!908)))) (array_inv!23824 (_values!5888 (v!14524 (underlying!561 thiss!908)))) e!575824))))

(declare-fun b!1022434 () Bool)

(declare-fun e!575828 () Bool)

(assert (=> b!1022434 (= e!575828 tp_is_empty!23839)))

(declare-fun mapNonEmpty!37170 () Bool)

(declare-fun tp!71386 () Bool)

(assert (=> mapNonEmpty!37170 (= mapRes!37170 (and tp!71386 e!575828))))

(declare-fun mapValue!37170 () ValueCell!11216)

(declare-fun mapRest!37170 () (Array (_ BitVec 32) ValueCell!11216))

(declare-fun mapKey!37170 () (_ BitVec 32))

(assert (=> mapNonEmpty!37170 (= (arr!30692 (_values!5888 (v!14524 (underlying!561 thiss!908)))) (store mapRest!37170 mapKey!37170 mapValue!37170))))

(declare-fun b!1022435 () Bool)

(assert (=> b!1022435 (= e!575827 tp_is_empty!23839)))

(assert (= (and start!89292 res!684842) b!1022432))

(assert (= (and b!1022429 condMapEmpty!37170) mapIsEmpty!37170))

(assert (= (and b!1022429 (not condMapEmpty!37170)) mapNonEmpty!37170))

(get-info :version)

(assert (= (and mapNonEmpty!37170 ((_ is ValueCellFull!11216) mapValue!37170)) b!1022434))

(assert (= (and b!1022429 ((_ is ValueCellFull!11216) mapDefault!37170)) b!1022435))

(assert (= b!1022433 b!1022429))

(assert (= b!1022431 b!1022433))

(assert (= b!1022430 b!1022431))

(assert (= start!89292 b!1022430))

(declare-fun m!942409 () Bool)

(assert (=> start!89292 m!942409))

(declare-fun m!942411 () Bool)

(assert (=> b!1022432 m!942411))

(declare-fun m!942413 () Bool)

(assert (=> b!1022432 m!942413))

(declare-fun m!942415 () Bool)

(assert (=> b!1022433 m!942415))

(declare-fun m!942417 () Bool)

(assert (=> b!1022433 m!942417))

(declare-fun m!942419 () Bool)

(assert (=> mapNonEmpty!37170 m!942419))

(check-sat (not start!89292) b_and!32317 tp_is_empty!23839 (not b_next!20119) (not b!1022432) (not b!1022433) (not mapNonEmpty!37170))
(check-sat b_and!32317 (not b_next!20119))
