; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89050 () Bool)

(assert start!89050)

(declare-fun b!1020901 () Bool)

(declare-fun b_free!20113 () Bool)

(declare-fun b_next!20113 () Bool)

(assert (=> b!1020901 (= b_free!20113 (not b_next!20113))))

(declare-fun tp!71367 () Bool)

(declare-fun b_and!32275 () Bool)

(assert (=> b!1020901 (= tp!71367 b_and!32275)))

(declare-fun mapNonEmpty!37161 () Bool)

(declare-fun mapRes!37161 () Bool)

(declare-fun tp!71368 () Bool)

(declare-fun e!574818 () Bool)

(assert (=> mapNonEmpty!37161 (= mapRes!37161 (and tp!71368 e!574818))))

(declare-datatypes ((V!36651 0))(
  ( (V!36652 (val!11967 Int)) )
))
(declare-datatypes ((ValueCell!11213 0))(
  ( (ValueCellFull!11213 (v!14520 V!36651)) (EmptyCell!11213) )
))
(declare-fun mapRest!37161 () (Array (_ BitVec 32) ValueCell!11213))

(declare-fun mapKey!37161 () (_ BitVec 32))

(declare-fun mapValue!37161 () ValueCell!11213)

(declare-datatypes ((array!63645 0))(
  ( (array!63646 (arr!30636 (Array (_ BitVec 32) (_ BitVec 64))) (size!31149 (_ BitVec 32))) )
))
(declare-datatypes ((array!63647 0))(
  ( (array!63648 (arr!30637 (Array (_ BitVec 32) ValueCell!11213)) (size!31150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5020 0))(
  ( (LongMapFixedSize!5021 (defaultEntry!5862 Int) (mask!29418 (_ BitVec 32)) (extraKeys!5594 (_ BitVec 32)) (zeroValue!5698 V!36651) (minValue!5698 V!36651) (_size!2565 (_ BitVec 32)) (_keys!11003 array!63645) (_values!5885 array!63647) (_vacant!2565 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1086 0))(
  ( (Cell!1087 (v!14521 LongMapFixedSize!5020)) )
))
(declare-datatypes ((LongMap!1086 0))(
  ( (LongMap!1087 (underlying!554 Cell!1086)) )
))
(declare-fun thiss!908 () LongMap!1086)

(assert (=> mapNonEmpty!37161 (= (arr!30637 (_values!5885 (v!14521 (underlying!554 thiss!908)))) (store mapRest!37161 mapKey!37161 mapValue!37161))))

(declare-fun b!1020900 () Bool)

(declare-fun e!574821 () Bool)

(declare-fun e!574817 () Bool)

(assert (=> b!1020900 (= e!574821 (and e!574817 mapRes!37161))))

(declare-fun condMapEmpty!37161 () Bool)

(declare-fun mapDefault!37161 () ValueCell!11213)

(assert (=> b!1020900 (= condMapEmpty!37161 (= (arr!30637 (_values!5885 (v!14521 (underlying!554 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11213)) mapDefault!37161)))))

(declare-fun e!574816 () Bool)

(declare-fun tp_is_empty!23833 () Bool)

(declare-fun array_inv!23775 (array!63645) Bool)

(declare-fun array_inv!23776 (array!63647) Bool)

(assert (=> b!1020901 (= e!574816 (and tp!71367 tp_is_empty!23833 (array_inv!23775 (_keys!11003 (v!14521 (underlying!554 thiss!908)))) (array_inv!23776 (_values!5885 (v!14521 (underlying!554 thiss!908)))) e!574821))))

(declare-fun mapIsEmpty!37161 () Bool)

(assert (=> mapIsEmpty!37161 mapRes!37161))

(declare-fun b!1020902 () Bool)

(declare-fun e!574823 () Bool)

(assert (=> b!1020902 (= e!574823 false)))

(declare-fun lt!449773 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1917 (LongMap!1086) Bool)

(declare-datatypes ((tuple2!15552 0))(
  ( (tuple2!15553 (_1!7787 Bool) (_2!7787 LongMapFixedSize!5020)) )
))
(declare-fun remove!4 (LongMapFixedSize!5020 (_ BitVec 64)) tuple2!15552)

(assert (=> b!1020902 (= lt!449773 (valid!1917 (LongMap!1087 (Cell!1087 (_2!7787 (remove!4 (v!14521 (underlying!554 thiss!908)) key!697))))))))

(declare-fun b!1020903 () Bool)

(declare-fun e!574820 () Bool)

(declare-fun e!574822 () Bool)

(assert (=> b!1020903 (= e!574820 e!574822)))

(declare-fun b!1020904 () Bool)

(assert (=> b!1020904 (= e!574818 tp_is_empty!23833)))

(declare-fun b!1020905 () Bool)

(assert (=> b!1020905 (= e!574822 e!574816)))

(declare-fun b!1020906 () Bool)

(assert (=> b!1020906 (= e!574817 tp_is_empty!23833)))

(declare-fun res!684256 () Bool)

(assert (=> start!89050 (=> (not res!684256) (not e!574823))))

(assert (=> start!89050 (= res!684256 (valid!1917 thiss!908))))

(assert (=> start!89050 e!574823))

(assert (=> start!89050 e!574820))

(assert (=> start!89050 true))

(assert (= (and start!89050 res!684256) b!1020902))

(assert (= (and b!1020900 condMapEmpty!37161) mapIsEmpty!37161))

(assert (= (and b!1020900 (not condMapEmpty!37161)) mapNonEmpty!37161))

(get-info :version)

(assert (= (and mapNonEmpty!37161 ((_ is ValueCellFull!11213) mapValue!37161)) b!1020904))

(assert (= (and b!1020900 ((_ is ValueCellFull!11213) mapDefault!37161)) b!1020906))

(assert (= b!1020901 b!1020900))

(assert (= b!1020905 b!1020901))

(assert (= b!1020903 b!1020905))

(assert (= start!89050 b!1020903))

(declare-fun m!940089 () Bool)

(assert (=> mapNonEmpty!37161 m!940089))

(declare-fun m!940091 () Bool)

(assert (=> b!1020901 m!940091))

(declare-fun m!940093 () Bool)

(assert (=> b!1020901 m!940093))

(declare-fun m!940095 () Bool)

(assert (=> b!1020902 m!940095))

(declare-fun m!940097 () Bool)

(assert (=> b!1020902 m!940097))

(declare-fun m!940099 () Bool)

(assert (=> start!89050 m!940099))

(check-sat (not b_next!20113) (not b!1020902) (not start!89050) (not mapNonEmpty!37161) b_and!32275 (not b!1020901) tp_is_empty!23833)
(check-sat b_and!32275 (not b_next!20113))
