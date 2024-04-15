; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89044 () Bool)

(assert start!89044)

(declare-fun b!1020838 () Bool)

(declare-fun b_free!20107 () Bool)

(declare-fun b_next!20107 () Bool)

(assert (=> b!1020838 (= b_free!20107 (not b_next!20107))))

(declare-fun tp!71349 () Bool)

(declare-fun b_and!32269 () Bool)

(assert (=> b!1020838 (= tp!71349 b_and!32269)))

(declare-fun b!1020837 () Bool)

(declare-fun e!574748 () Bool)

(declare-fun tp_is_empty!23827 () Bool)

(assert (=> b!1020837 (= e!574748 tp_is_empty!23827)))

(declare-fun e!574751 () Bool)

(declare-fun e!574745 () Bool)

(declare-datatypes ((V!36643 0))(
  ( (V!36644 (val!11964 Int)) )
))
(declare-datatypes ((array!63633 0))(
  ( (array!63634 (arr!30630 (Array (_ BitVec 32) (_ BitVec 64))) (size!31143 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11210 0))(
  ( (ValueCellFull!11210 (v!14514 V!36643)) (EmptyCell!11210) )
))
(declare-datatypes ((array!63635 0))(
  ( (array!63636 (arr!30631 (Array (_ BitVec 32) ValueCell!11210)) (size!31144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5014 0))(
  ( (LongMapFixedSize!5015 (defaultEntry!5859 Int) (mask!29413 (_ BitVec 32)) (extraKeys!5591 (_ BitVec 32)) (zeroValue!5695 V!36643) (minValue!5695 V!36643) (_size!2562 (_ BitVec 32)) (_keys!11000 array!63633) (_values!5882 array!63635) (_vacant!2562 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1080 0))(
  ( (Cell!1081 (v!14515 LongMapFixedSize!5014)) )
))
(declare-datatypes ((LongMap!1080 0))(
  ( (LongMap!1081 (underlying!551 Cell!1080)) )
))
(declare-fun thiss!908 () LongMap!1080)

(declare-fun array_inv!23771 (array!63633) Bool)

(declare-fun array_inv!23772 (array!63635) Bool)

(assert (=> b!1020838 (= e!574751 (and tp!71349 tp_is_empty!23827 (array_inv!23771 (_keys!11000 (v!14515 (underlying!551 thiss!908)))) (array_inv!23772 (_values!5882 (v!14515 (underlying!551 thiss!908)))) e!574745))))

(declare-fun b!1020839 () Bool)

(declare-fun e!574744 () Bool)

(assert (=> b!1020839 (= e!574744 false)))

(declare-fun lt!449764 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1915 (LongMap!1080) Bool)

(declare-datatypes ((tuple2!15548 0))(
  ( (tuple2!15549 (_1!7785 Bool) (_2!7785 LongMapFixedSize!5014)) )
))
(declare-fun remove!2 (LongMapFixedSize!5014 (_ BitVec 64)) tuple2!15548)

(assert (=> b!1020839 (= lt!449764 (valid!1915 (LongMap!1081 (Cell!1081 (_2!7785 (remove!2 (v!14515 (underlying!551 thiss!908)) key!697))))))))

(declare-fun mapIsEmpty!37152 () Bool)

(declare-fun mapRes!37152 () Bool)

(assert (=> mapIsEmpty!37152 mapRes!37152))

(declare-fun b!1020840 () Bool)

(declare-fun e!574750 () Bool)

(assert (=> b!1020840 (= e!574745 (and e!574750 mapRes!37152))))

(declare-fun condMapEmpty!37152 () Bool)

(declare-fun mapDefault!37152 () ValueCell!11210)

(assert (=> b!1020840 (= condMapEmpty!37152 (= (arr!30631 (_values!5882 (v!14515 (underlying!551 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11210)) mapDefault!37152)))))

(declare-fun b!1020841 () Bool)

(assert (=> b!1020841 (= e!574750 tp_is_empty!23827)))

(declare-fun mapNonEmpty!37152 () Bool)

(declare-fun tp!71350 () Bool)

(assert (=> mapNonEmpty!37152 (= mapRes!37152 (and tp!71350 e!574748))))

(declare-fun mapKey!37152 () (_ BitVec 32))

(declare-fun mapRest!37152 () (Array (_ BitVec 32) ValueCell!11210))

(declare-fun mapValue!37152 () ValueCell!11210)

(assert (=> mapNonEmpty!37152 (= (arr!30631 (_values!5882 (v!14515 (underlying!551 thiss!908)))) (store mapRest!37152 mapKey!37152 mapValue!37152))))

(declare-fun b!1020843 () Bool)

(declare-fun e!574746 () Bool)

(assert (=> b!1020843 (= e!574746 e!574751)))

(declare-fun res!684247 () Bool)

(assert (=> start!89044 (=> (not res!684247) (not e!574744))))

(assert (=> start!89044 (= res!684247 (valid!1915 thiss!908))))

(assert (=> start!89044 e!574744))

(declare-fun e!574749 () Bool)

(assert (=> start!89044 e!574749))

(assert (=> start!89044 true))

(declare-fun b!1020842 () Bool)

(assert (=> b!1020842 (= e!574749 e!574746)))

(assert (= (and start!89044 res!684247) b!1020839))

(assert (= (and b!1020840 condMapEmpty!37152) mapIsEmpty!37152))

(assert (= (and b!1020840 (not condMapEmpty!37152)) mapNonEmpty!37152))

(get-info :version)

(assert (= (and mapNonEmpty!37152 ((_ is ValueCellFull!11210) mapValue!37152)) b!1020837))

(assert (= (and b!1020840 ((_ is ValueCellFull!11210) mapDefault!37152)) b!1020841))

(assert (= b!1020838 b!1020840))

(assert (= b!1020843 b!1020838))

(assert (= b!1020842 b!1020843))

(assert (= start!89044 b!1020842))

(declare-fun m!940053 () Bool)

(assert (=> b!1020838 m!940053))

(declare-fun m!940055 () Bool)

(assert (=> b!1020838 m!940055))

(declare-fun m!940057 () Bool)

(assert (=> b!1020839 m!940057))

(declare-fun m!940059 () Bool)

(assert (=> b!1020839 m!940059))

(declare-fun m!940061 () Bool)

(assert (=> mapNonEmpty!37152 m!940061))

(declare-fun m!940063 () Bool)

(assert (=> start!89044 m!940063))

(check-sat (not mapNonEmpty!37152) tp_is_empty!23827 b_and!32269 (not b!1020838) (not b!1020839) (not b_next!20107) (not start!89044))
(check-sat b_and!32269 (not b_next!20107))
