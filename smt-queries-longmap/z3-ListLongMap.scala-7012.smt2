; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89066 () Bool)

(assert start!89066)

(declare-fun b!1021195 () Bool)

(declare-fun b_free!20127 () Bool)

(declare-fun b_next!20127 () Bool)

(assert (=> b!1021195 (= b_free!20127 (not b_next!20127))))

(declare-fun tp!71409 () Bool)

(declare-fun b_and!32315 () Bool)

(assert (=> b!1021195 (= tp!71409 b_and!32315)))

(declare-fun b!1021192 () Bool)

(declare-fun e!575079 () Bool)

(declare-fun e!575074 () Bool)

(declare-fun mapRes!37182 () Bool)

(assert (=> b!1021192 (= e!575079 (and e!575074 mapRes!37182))))

(declare-fun condMapEmpty!37182 () Bool)

(declare-datatypes ((V!36669 0))(
  ( (V!36670 (val!11974 Int)) )
))
(declare-datatypes ((array!63734 0))(
  ( (array!63735 (arr!30681 (Array (_ BitVec 32) (_ BitVec 64))) (size!31192 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11220 0))(
  ( (ValueCellFull!11220 (v!14535 V!36669)) (EmptyCell!11220) )
))
(declare-datatypes ((array!63736 0))(
  ( (array!63737 (arr!30682 (Array (_ BitVec 32) ValueCell!11220)) (size!31193 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5034 0))(
  ( (LongMapFixedSize!5035 (defaultEntry!5869 Int) (mask!29434 (_ BitVec 32)) (extraKeys!5601 (_ BitVec 32)) (zeroValue!5705 V!36669) (minValue!5705 V!36669) (_size!2572 (_ BitVec 32)) (_keys!11014 array!63734) (_values!5892 array!63736) (_vacant!2572 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1108 0))(
  ( (Cell!1109 (v!14536 LongMapFixedSize!5034)) )
))
(declare-datatypes ((LongMap!1108 0))(
  ( (LongMap!1109 (underlying!565 Cell!1108)) )
))
(declare-fun thiss!908 () LongMap!1108)

(declare-fun mapDefault!37182 () ValueCell!11220)

(assert (=> b!1021192 (= condMapEmpty!37182 (= (arr!30682 (_values!5892 (v!14536 (underlying!565 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11220)) mapDefault!37182)))))

(declare-fun b!1021193 () Bool)

(declare-fun tp_is_empty!23847 () Bool)

(assert (=> b!1021193 (= e!575074 tp_is_empty!23847)))

(declare-fun mapIsEmpty!37182 () Bool)

(assert (=> mapIsEmpty!37182 mapRes!37182))

(declare-fun e!575073 () Bool)

(declare-fun array_inv!23795 (array!63734) Bool)

(declare-fun array_inv!23796 (array!63736) Bool)

(assert (=> b!1021195 (= e!575073 (and tp!71409 tp_is_empty!23847 (array_inv!23795 (_keys!11014 (v!14536 (underlying!565 thiss!908)))) (array_inv!23796 (_values!5892 (v!14536 (underlying!565 thiss!908)))) e!575079))))

(declare-fun b!1021196 () Bool)

(declare-fun e!575077 () Bool)

(assert (=> b!1021196 (= e!575077 e!575073)))

(declare-fun b!1021197 () Bool)

(declare-fun e!575076 () Bool)

(assert (=> b!1021197 (= e!575076 e!575077)))

(declare-fun res!684344 () Bool)

(declare-fun e!575075 () Bool)

(assert (=> start!89066 (=> (not res!684344) (not e!575075))))

(declare-fun valid!1916 (LongMap!1108) Bool)

(assert (=> start!89066 (= res!684344 (valid!1916 thiss!908))))

(assert (=> start!89066 e!575075))

(assert (=> start!89066 e!575076))

(assert (=> start!89066 true))

(declare-fun b!1021194 () Bool)

(declare-fun e!575072 () Bool)

(assert (=> b!1021194 (= e!575072 tp_is_empty!23847)))

(declare-fun b!1021198 () Bool)

(assert (=> b!1021198 (= e!575075 false)))

(declare-fun lt!449994 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15480 0))(
  ( (tuple2!15481 (_1!7751 Bool) (_2!7751 LongMapFixedSize!5034)) )
))
(declare-fun remove!8 (LongMapFixedSize!5034 (_ BitVec 64)) tuple2!15480)

(assert (=> b!1021198 (= lt!449994 (valid!1916 (LongMap!1109 (Cell!1109 (_2!7751 (remove!8 (v!14536 (underlying!565 thiss!908)) key!697))))))))

(declare-fun mapNonEmpty!37182 () Bool)

(declare-fun tp!71410 () Bool)

(assert (=> mapNonEmpty!37182 (= mapRes!37182 (and tp!71410 e!575072))))

(declare-fun mapRest!37182 () (Array (_ BitVec 32) ValueCell!11220))

(declare-fun mapKey!37182 () (_ BitVec 32))

(declare-fun mapValue!37182 () ValueCell!11220)

(assert (=> mapNonEmpty!37182 (= (arr!30682 (_values!5892 (v!14536 (underlying!565 thiss!908)))) (store mapRest!37182 mapKey!37182 mapValue!37182))))

(assert (= (and start!89066 res!684344) b!1021198))

(assert (= (and b!1021192 condMapEmpty!37182) mapIsEmpty!37182))

(assert (= (and b!1021192 (not condMapEmpty!37182)) mapNonEmpty!37182))

(get-info :version)

(assert (= (and mapNonEmpty!37182 ((_ is ValueCellFull!11220) mapValue!37182)) b!1021194))

(assert (= (and b!1021192 ((_ is ValueCellFull!11220) mapDefault!37182)) b!1021193))

(assert (= b!1021195 b!1021192))

(assert (= b!1021196 b!1021195))

(assert (= b!1021197 b!1021196))

(assert (= start!89066 b!1021197))

(declare-fun m!940793 () Bool)

(assert (=> b!1021195 m!940793))

(declare-fun m!940795 () Bool)

(assert (=> b!1021195 m!940795))

(declare-fun m!940797 () Bool)

(assert (=> start!89066 m!940797))

(declare-fun m!940799 () Bool)

(assert (=> b!1021198 m!940799))

(declare-fun m!940801 () Bool)

(assert (=> b!1021198 m!940801))

(declare-fun m!940803 () Bool)

(assert (=> mapNonEmpty!37182 m!940803))

(check-sat (not b!1021198) b_and!32315 (not b!1021195) tp_is_empty!23847 (not start!89066) (not b_next!20127) (not mapNonEmpty!37182))
(check-sat b_and!32315 (not b_next!20127))
