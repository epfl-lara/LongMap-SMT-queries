; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89048 () Bool)

(assert start!89048)

(declare-fun b!1021004 () Bool)

(declare-fun b_free!20109 () Bool)

(declare-fun b_next!20109 () Bool)

(assert (=> b!1021004 (= b_free!20109 (not b_next!20109))))

(declare-fun tp!71356 () Bool)

(declare-fun b_and!32297 () Bool)

(assert (=> b!1021004 (= tp!71356 b_and!32297)))

(declare-fun b!1021003 () Bool)

(declare-fun e!574862 () Bool)

(declare-fun e!574861 () Bool)

(assert (=> b!1021003 (= e!574862 e!574861)))

(declare-fun mapNonEmpty!37155 () Bool)

(declare-fun mapRes!37155 () Bool)

(declare-fun tp!71355 () Bool)

(declare-fun e!574860 () Bool)

(assert (=> mapNonEmpty!37155 (= mapRes!37155 (and tp!71355 e!574860))))

(declare-datatypes ((V!36645 0))(
  ( (V!36646 (val!11965 Int)) )
))
(declare-datatypes ((ValueCell!11211 0))(
  ( (ValueCellFull!11211 (v!14517 V!36645)) (EmptyCell!11211) )
))
(declare-fun mapRest!37155 () (Array (_ BitVec 32) ValueCell!11211))

(declare-fun mapValue!37155 () ValueCell!11211)

(declare-datatypes ((array!63698 0))(
  ( (array!63699 (arr!30663 (Array (_ BitVec 32) (_ BitVec 64))) (size!31174 (_ BitVec 32))) )
))
(declare-datatypes ((array!63700 0))(
  ( (array!63701 (arr!30664 (Array (_ BitVec 32) ValueCell!11211)) (size!31175 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5016 0))(
  ( (LongMapFixedSize!5017 (defaultEntry!5860 Int) (mask!29419 (_ BitVec 32)) (extraKeys!5592 (_ BitVec 32)) (zeroValue!5696 V!36645) (minValue!5696 V!36645) (_size!2563 (_ BitVec 32)) (_keys!11005 array!63698) (_values!5883 array!63700) (_vacant!2563 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1090 0))(
  ( (Cell!1091 (v!14518 LongMapFixedSize!5016)) )
))
(declare-datatypes ((LongMap!1090 0))(
  ( (LongMap!1091 (underlying!556 Cell!1090)) )
))
(declare-fun thiss!908 () LongMap!1090)

(declare-fun mapKey!37155 () (_ BitVec 32))

(assert (=> mapNonEmpty!37155 (= (arr!30664 (_values!5883 (v!14518 (underlying!556 thiss!908)))) (store mapRest!37155 mapKey!37155 mapValue!37155))))

(declare-fun tp_is_empty!23829 () Bool)

(declare-fun e!574858 () Bool)

(declare-fun e!574856 () Bool)

(declare-fun array_inv!23785 (array!63698) Bool)

(declare-fun array_inv!23786 (array!63700) Bool)

(assert (=> b!1021004 (= e!574856 (and tp!71356 tp_is_empty!23829 (array_inv!23785 (_keys!11005 (v!14518 (underlying!556 thiss!908)))) (array_inv!23786 (_values!5883 (v!14518 (underlying!556 thiss!908)))) e!574858))))

(declare-fun res!684317 () Bool)

(declare-fun e!574859 () Bool)

(assert (=> start!89048 (=> (not res!684317) (not e!574859))))

(declare-fun valid!1910 (LongMap!1090) Bool)

(assert (=> start!89048 (= res!684317 (valid!1910 thiss!908))))

(assert (=> start!89048 e!574859))

(assert (=> start!89048 e!574862))

(assert (=> start!89048 true))

(declare-fun b!1021005 () Bool)

(declare-fun e!574857 () Bool)

(assert (=> b!1021005 (= e!574858 (and e!574857 mapRes!37155))))

(declare-fun condMapEmpty!37155 () Bool)

(declare-fun mapDefault!37155 () ValueCell!11211)

(assert (=> b!1021005 (= condMapEmpty!37155 (= (arr!30664 (_values!5883 (v!14518 (underlying!556 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11211)) mapDefault!37155)))))

(declare-fun mapIsEmpty!37155 () Bool)

(assert (=> mapIsEmpty!37155 mapRes!37155))

(declare-fun b!1021006 () Bool)

(assert (=> b!1021006 (= e!574857 tp_is_empty!23829)))

(declare-fun b!1021007 () Bool)

(assert (=> b!1021007 (= e!574859 false)))

(declare-fun lt!449967 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15468 0))(
  ( (tuple2!15469 (_1!7745 Bool) (_2!7745 LongMapFixedSize!5016)) )
))
(declare-fun remove!2 (LongMapFixedSize!5016 (_ BitVec 64)) tuple2!15468)

(assert (=> b!1021007 (= lt!449967 (valid!1910 (LongMap!1091 (Cell!1091 (_2!7745 (remove!2 (v!14518 (underlying!556 thiss!908)) key!697))))))))

(declare-fun b!1021008 () Bool)

(assert (=> b!1021008 (= e!574861 e!574856)))

(declare-fun b!1021009 () Bool)

(assert (=> b!1021009 (= e!574860 tp_is_empty!23829)))

(assert (= (and start!89048 res!684317) b!1021007))

(assert (= (and b!1021005 condMapEmpty!37155) mapIsEmpty!37155))

(assert (= (and b!1021005 (not condMapEmpty!37155)) mapNonEmpty!37155))

(get-info :version)

(assert (= (and mapNonEmpty!37155 ((_ is ValueCellFull!11211) mapValue!37155)) b!1021009))

(assert (= (and b!1021005 ((_ is ValueCellFull!11211) mapDefault!37155)) b!1021006))

(assert (= b!1021004 b!1021005))

(assert (= b!1021008 b!1021004))

(assert (= b!1021003 b!1021008))

(assert (= start!89048 b!1021003))

(declare-fun m!940685 () Bool)

(assert (=> mapNonEmpty!37155 m!940685))

(declare-fun m!940687 () Bool)

(assert (=> b!1021004 m!940687))

(declare-fun m!940689 () Bool)

(assert (=> b!1021004 m!940689))

(declare-fun m!940691 () Bool)

(assert (=> start!89048 m!940691))

(declare-fun m!940693 () Bool)

(assert (=> b!1021007 m!940693))

(declare-fun m!940695 () Bool)

(assert (=> b!1021007 m!940695))

(check-sat (not mapNonEmpty!37155) (not start!89048) (not b!1021004) tp_is_empty!23829 b_and!32297 (not b_next!20109) (not b!1021007))
(check-sat b_and!32297 (not b_next!20109))
