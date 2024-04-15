; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89056 () Bool)

(assert start!89056)

(declare-fun b!1020966 () Bool)

(declare-fun b_free!20119 () Bool)

(declare-fun b_next!20119 () Bool)

(assert (=> b!1020966 (= b_free!20119 (not b_next!20119))))

(declare-fun tp!71386 () Bool)

(declare-fun b_and!32281 () Bool)

(assert (=> b!1020966 (= tp!71386 b_and!32281)))

(declare-fun b!1020963 () Bool)

(declare-fun e!574894 () Bool)

(assert (=> b!1020963 (= e!574894 false)))

(declare-fun lt!449782 () Bool)

(declare-datatypes ((V!36659 0))(
  ( (V!36660 (val!11970 Int)) )
))
(declare-datatypes ((array!63657 0))(
  ( (array!63658 (arr!30642 (Array (_ BitVec 32) (_ BitVec 64))) (size!31155 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11216 0))(
  ( (ValueCellFull!11216 (v!14526 V!36659)) (EmptyCell!11216) )
))
(declare-datatypes ((array!63659 0))(
  ( (array!63660 (arr!30643 (Array (_ BitVec 32) ValueCell!11216)) (size!31156 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5026 0))(
  ( (LongMapFixedSize!5027 (defaultEntry!5865 Int) (mask!29423 (_ BitVec 32)) (extraKeys!5597 (_ BitVec 32)) (zeroValue!5701 V!36659) (minValue!5701 V!36659) (_size!2568 (_ BitVec 32)) (_keys!11006 array!63657) (_values!5888 array!63659) (_vacant!2568 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1092 0))(
  ( (Cell!1093 (v!14527 LongMapFixedSize!5026)) )
))
(declare-datatypes ((LongMap!1092 0))(
  ( (LongMap!1093 (underlying!557 Cell!1092)) )
))
(declare-fun thiss!908 () LongMap!1092)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1918 (LongMap!1092) Bool)

(declare-datatypes ((tuple2!15554 0))(
  ( (tuple2!15555 (_1!7788 Bool) (_2!7788 LongMapFixedSize!5026)) )
))
(declare-fun remove!5 (LongMapFixedSize!5026 (_ BitVec 64)) tuple2!15554)

(assert (=> b!1020963 (= lt!449782 (valid!1918 (LongMap!1093 (Cell!1093 (_2!7788 (remove!5 (v!14527 (underlying!557 thiss!908)) key!697))))))))

(declare-fun b!1020965 () Bool)

(declare-fun e!574893 () Bool)

(declare-fun e!574890 () Bool)

(declare-fun mapRes!37170 () Bool)

(assert (=> b!1020965 (= e!574893 (and e!574890 mapRes!37170))))

(declare-fun condMapEmpty!37170 () Bool)

(declare-fun mapDefault!37170 () ValueCell!11216)

(assert (=> b!1020965 (= condMapEmpty!37170 (= (arr!30643 (_values!5888 (v!14527 (underlying!557 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11216)) mapDefault!37170)))))

(declare-fun tp_is_empty!23839 () Bool)

(declare-fun e!574895 () Bool)

(declare-fun array_inv!23779 (array!63657) Bool)

(declare-fun array_inv!23780 (array!63659) Bool)

(assert (=> b!1020966 (= e!574895 (and tp!71386 tp_is_empty!23839 (array_inv!23779 (_keys!11006 (v!14527 (underlying!557 thiss!908)))) (array_inv!23780 (_values!5888 (v!14527 (underlying!557 thiss!908)))) e!574893))))

(declare-fun b!1020967 () Bool)

(declare-fun e!574888 () Bool)

(assert (=> b!1020967 (= e!574888 e!574895)))

(declare-fun b!1020964 () Bool)

(assert (=> b!1020964 (= e!574890 tp_is_empty!23839)))

(declare-fun res!684265 () Bool)

(assert (=> start!89056 (=> (not res!684265) (not e!574894))))

(assert (=> start!89056 (= res!684265 (valid!1918 thiss!908))))

(assert (=> start!89056 e!574894))

(declare-fun e!574891 () Bool)

(assert (=> start!89056 e!574891))

(assert (=> start!89056 true))

(declare-fun mapNonEmpty!37170 () Bool)

(declare-fun tp!71385 () Bool)

(declare-fun e!574892 () Bool)

(assert (=> mapNonEmpty!37170 (= mapRes!37170 (and tp!71385 e!574892))))

(declare-fun mapRest!37170 () (Array (_ BitVec 32) ValueCell!11216))

(declare-fun mapValue!37170 () ValueCell!11216)

(declare-fun mapKey!37170 () (_ BitVec 32))

(assert (=> mapNonEmpty!37170 (= (arr!30643 (_values!5888 (v!14527 (underlying!557 thiss!908)))) (store mapRest!37170 mapKey!37170 mapValue!37170))))

(declare-fun b!1020968 () Bool)

(assert (=> b!1020968 (= e!574891 e!574888)))

(declare-fun mapIsEmpty!37170 () Bool)

(assert (=> mapIsEmpty!37170 mapRes!37170))

(declare-fun b!1020969 () Bool)

(assert (=> b!1020969 (= e!574892 tp_is_empty!23839)))

(assert (= (and start!89056 res!684265) b!1020963))

(assert (= (and b!1020965 condMapEmpty!37170) mapIsEmpty!37170))

(assert (= (and b!1020965 (not condMapEmpty!37170)) mapNonEmpty!37170))

(get-info :version)

(assert (= (and mapNonEmpty!37170 ((_ is ValueCellFull!11216) mapValue!37170)) b!1020969))

(assert (= (and b!1020965 ((_ is ValueCellFull!11216) mapDefault!37170)) b!1020964))

(assert (= b!1020966 b!1020965))

(assert (= b!1020967 b!1020966))

(assert (= b!1020968 b!1020967))

(assert (= start!89056 b!1020968))

(declare-fun m!940125 () Bool)

(assert (=> b!1020963 m!940125))

(declare-fun m!940127 () Bool)

(assert (=> b!1020963 m!940127))

(declare-fun m!940129 () Bool)

(assert (=> b!1020966 m!940129))

(declare-fun m!940131 () Bool)

(assert (=> b!1020966 m!940131))

(declare-fun m!940133 () Bool)

(assert (=> start!89056 m!940133))

(declare-fun m!940135 () Bool)

(assert (=> mapNonEmpty!37170 m!940135))

(check-sat (not b!1020966) (not b!1020963) tp_is_empty!23839 b_and!32281 (not start!89056) (not mapNonEmpty!37170) (not b_next!20119))
(check-sat b_and!32281 (not b_next!20119))
