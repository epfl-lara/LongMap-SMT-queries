; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89060 () Bool)

(assert start!89060)

(declare-fun b!1021132 () Bool)

(declare-fun b_free!20121 () Bool)

(declare-fun b_next!20121 () Bool)

(assert (=> b!1021132 (= b_free!20121 (not b_next!20121))))

(declare-fun tp!71391 () Bool)

(declare-fun b_and!32309 () Bool)

(assert (=> b!1021132 (= tp!71391 b_and!32309)))

(declare-fun b!1021129 () Bool)

(declare-fun e!575004 () Bool)

(declare-fun tp_is_empty!23841 () Bool)

(assert (=> b!1021129 (= e!575004 tp_is_empty!23841)))

(declare-fun b!1021130 () Bool)

(declare-fun e!575005 () Bool)

(declare-fun mapRes!37173 () Bool)

(assert (=> b!1021130 (= e!575005 (and e!575004 mapRes!37173))))

(declare-fun condMapEmpty!37173 () Bool)

(declare-datatypes ((V!36661 0))(
  ( (V!36662 (val!11971 Int)) )
))
(declare-datatypes ((array!63722 0))(
  ( (array!63723 (arr!30675 (Array (_ BitVec 32) (_ BitVec 64))) (size!31186 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11217 0))(
  ( (ValueCellFull!11217 (v!14529 V!36661)) (EmptyCell!11217) )
))
(declare-datatypes ((array!63724 0))(
  ( (array!63725 (arr!30676 (Array (_ BitVec 32) ValueCell!11217)) (size!31187 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5028 0))(
  ( (LongMapFixedSize!5029 (defaultEntry!5866 Int) (mask!29429 (_ BitVec 32)) (extraKeys!5598 (_ BitVec 32)) (zeroValue!5702 V!36661) (minValue!5702 V!36661) (_size!2569 (_ BitVec 32)) (_keys!11011 array!63722) (_values!5889 array!63724) (_vacant!2569 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1102 0))(
  ( (Cell!1103 (v!14530 LongMapFixedSize!5028)) )
))
(declare-datatypes ((LongMap!1102 0))(
  ( (LongMap!1103 (underlying!562 Cell!1102)) )
))
(declare-fun thiss!908 () LongMap!1102)

(declare-fun mapDefault!37173 () ValueCell!11217)

(assert (=> b!1021130 (= condMapEmpty!37173 (= (arr!30676 (_values!5889 (v!14530 (underlying!562 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11217)) mapDefault!37173)))))

(declare-fun mapNonEmpty!37173 () Bool)

(declare-fun tp!71392 () Bool)

(declare-fun e!575001 () Bool)

(assert (=> mapNonEmpty!37173 (= mapRes!37173 (and tp!71392 e!575001))))

(declare-fun mapValue!37173 () ValueCell!11217)

(declare-fun mapKey!37173 () (_ BitVec 32))

(declare-fun mapRest!37173 () (Array (_ BitVec 32) ValueCell!11217))

(assert (=> mapNonEmpty!37173 (= (arr!30676 (_values!5889 (v!14530 (underlying!562 thiss!908)))) (store mapRest!37173 mapKey!37173 mapValue!37173))))

(declare-fun b!1021131 () Bool)

(assert (=> b!1021131 (= e!575001 tp_is_empty!23841)))

(declare-fun e!575000 () Bool)

(declare-fun array_inv!23793 (array!63722) Bool)

(declare-fun array_inv!23794 (array!63724) Bool)

(assert (=> b!1021132 (= e!575000 (and tp!71391 tp_is_empty!23841 (array_inv!23793 (_keys!11011 (v!14530 (underlying!562 thiss!908)))) (array_inv!23794 (_values!5889 (v!14530 (underlying!562 thiss!908)))) e!575005))))

(declare-fun mapIsEmpty!37173 () Bool)

(assert (=> mapIsEmpty!37173 mapRes!37173))

(declare-fun b!1021133 () Bool)

(declare-fun e!575003 () Bool)

(declare-fun e!575006 () Bool)

(assert (=> b!1021133 (= e!575003 e!575006)))

(declare-fun b!1021134 () Bool)

(declare-fun e!575007 () Bool)

(assert (=> b!1021134 (= e!575007 false)))

(declare-fun lt!449985 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1915 (LongMap!1102) Bool)

(declare-datatypes ((tuple2!15478 0))(
  ( (tuple2!15479 (_1!7750 Bool) (_2!7750 LongMapFixedSize!5028)) )
))
(declare-fun remove!7 (LongMapFixedSize!5028 (_ BitVec 64)) tuple2!15478)

(assert (=> b!1021134 (= lt!449985 (valid!1915 (LongMap!1103 (Cell!1103 (_2!7750 (remove!7 (v!14530 (underlying!562 thiss!908)) key!697))))))))

(declare-fun res!684335 () Bool)

(assert (=> start!89060 (=> (not res!684335) (not e!575007))))

(assert (=> start!89060 (= res!684335 (valid!1915 thiss!908))))

(assert (=> start!89060 e!575007))

(assert (=> start!89060 e!575003))

(assert (=> start!89060 true))

(declare-fun b!1021135 () Bool)

(assert (=> b!1021135 (= e!575006 e!575000)))

(assert (= (and start!89060 res!684335) b!1021134))

(assert (= (and b!1021130 condMapEmpty!37173) mapIsEmpty!37173))

(assert (= (and b!1021130 (not condMapEmpty!37173)) mapNonEmpty!37173))

(get-info :version)

(assert (= (and mapNonEmpty!37173 ((_ is ValueCellFull!11217) mapValue!37173)) b!1021131))

(assert (= (and b!1021130 ((_ is ValueCellFull!11217) mapDefault!37173)) b!1021129))

(assert (= b!1021132 b!1021130))

(assert (= b!1021135 b!1021132))

(assert (= b!1021133 b!1021135))

(assert (= start!89060 b!1021133))

(declare-fun m!940757 () Bool)

(assert (=> mapNonEmpty!37173 m!940757))

(declare-fun m!940759 () Bool)

(assert (=> b!1021132 m!940759))

(declare-fun m!940761 () Bool)

(assert (=> b!1021132 m!940761))

(declare-fun m!940763 () Bool)

(assert (=> b!1021134 m!940763))

(declare-fun m!940765 () Bool)

(assert (=> b!1021134 m!940765))

(declare-fun m!940767 () Bool)

(assert (=> start!89060 m!940767))

(check-sat b_and!32309 tp_is_empty!23841 (not b_next!20121) (not mapNonEmpty!37173) (not b!1021132) (not start!89060) (not b!1021134))
(check-sat b_and!32309 (not b_next!20121))
