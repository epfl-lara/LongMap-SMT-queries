; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89062 () Bool)

(assert start!89062)

(declare-fun b!1021026 () Bool)

(declare-fun b_free!20125 () Bool)

(declare-fun b_next!20125 () Bool)

(assert (=> b!1021026 (= b_free!20125 (not b_next!20125))))

(declare-fun tp!71403 () Bool)

(declare-fun b_and!32287 () Bool)

(assert (=> b!1021026 (= tp!71403 b_and!32287)))

(declare-fun mapNonEmpty!37179 () Bool)

(declare-fun mapRes!37179 () Bool)

(declare-fun tp!71404 () Bool)

(declare-fun e!574961 () Bool)

(assert (=> mapNonEmpty!37179 (= mapRes!37179 (and tp!71404 e!574961))))

(declare-datatypes ((V!36667 0))(
  ( (V!36668 (val!11973 Int)) )
))
(declare-datatypes ((ValueCell!11219 0))(
  ( (ValueCellFull!11219 (v!14532 V!36667)) (EmptyCell!11219) )
))
(declare-fun mapRest!37179 () (Array (_ BitVec 32) ValueCell!11219))

(declare-fun mapValue!37179 () ValueCell!11219)

(declare-fun mapKey!37179 () (_ BitVec 32))

(declare-datatypes ((array!63669 0))(
  ( (array!63670 (arr!30648 (Array (_ BitVec 32) (_ BitVec 64))) (size!31161 (_ BitVec 32))) )
))
(declare-datatypes ((array!63671 0))(
  ( (array!63672 (arr!30649 (Array (_ BitVec 32) ValueCell!11219)) (size!31162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5032 0))(
  ( (LongMapFixedSize!5033 (defaultEntry!5868 Int) (mask!29428 (_ BitVec 32)) (extraKeys!5600 (_ BitVec 32)) (zeroValue!5704 V!36667) (minValue!5704 V!36667) (_size!2571 (_ BitVec 32)) (_keys!11009 array!63669) (_values!5891 array!63671) (_vacant!2571 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1098 0))(
  ( (Cell!1099 (v!14533 LongMapFixedSize!5032)) )
))
(declare-datatypes ((LongMap!1098 0))(
  ( (LongMap!1099 (underlying!560 Cell!1098)) )
))
(declare-fun thiss!908 () LongMap!1098)

(assert (=> mapNonEmpty!37179 (= (arr!30649 (_values!5891 (v!14533 (underlying!560 thiss!908)))) (store mapRest!37179 mapKey!37179 mapValue!37179))))

(declare-fun e!574965 () Bool)

(declare-fun tp_is_empty!23845 () Bool)

(declare-fun e!574960 () Bool)

(declare-fun array_inv!23783 (array!63669) Bool)

(declare-fun array_inv!23784 (array!63671) Bool)

(assert (=> b!1021026 (= e!574965 (and tp!71403 tp_is_empty!23845 (array_inv!23783 (_keys!11009 (v!14533 (underlying!560 thiss!908)))) (array_inv!23784 (_values!5891 (v!14533 (underlying!560 thiss!908)))) e!574960))))

(declare-fun mapIsEmpty!37179 () Bool)

(assert (=> mapIsEmpty!37179 mapRes!37179))

(declare-fun b!1021027 () Bool)

(declare-fun e!574967 () Bool)

(assert (=> b!1021027 (= e!574967 false)))

(declare-fun lt!449791 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1921 (LongMap!1098) Bool)

(declare-datatypes ((tuple2!15560 0))(
  ( (tuple2!15561 (_1!7791 Bool) (_2!7791 LongMapFixedSize!5032)) )
))
(declare-fun remove!8 (LongMapFixedSize!5032 (_ BitVec 64)) tuple2!15560)

(assert (=> b!1021027 (= lt!449791 (valid!1921 (LongMap!1099 (Cell!1099 (_2!7791 (remove!8 (v!14533 (underlying!560 thiss!908)) key!697))))))))

(declare-fun b!1021028 () Bool)

(declare-fun e!574963 () Bool)

(assert (=> b!1021028 (= e!574963 tp_is_empty!23845)))

(declare-fun b!1021029 () Bool)

(assert (=> b!1021029 (= e!574960 (and e!574963 mapRes!37179))))

(declare-fun condMapEmpty!37179 () Bool)

(declare-fun mapDefault!37179 () ValueCell!11219)

(assert (=> b!1021029 (= condMapEmpty!37179 (= (arr!30649 (_values!5891 (v!14533 (underlying!560 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11219)) mapDefault!37179)))))

(declare-fun b!1021030 () Bool)

(declare-fun e!574966 () Bool)

(assert (=> b!1021030 (= e!574966 e!574965)))

(declare-fun res!684274 () Bool)

(assert (=> start!89062 (=> (not res!684274) (not e!574967))))

(assert (=> start!89062 (= res!684274 (valid!1921 thiss!908))))

(assert (=> start!89062 e!574967))

(declare-fun e!574964 () Bool)

(assert (=> start!89062 e!574964))

(assert (=> start!89062 true))

(declare-fun b!1021031 () Bool)

(assert (=> b!1021031 (= e!574961 tp_is_empty!23845)))

(declare-fun b!1021032 () Bool)

(assert (=> b!1021032 (= e!574964 e!574966)))

(assert (= (and start!89062 res!684274) b!1021027))

(assert (= (and b!1021029 condMapEmpty!37179) mapIsEmpty!37179))

(assert (= (and b!1021029 (not condMapEmpty!37179)) mapNonEmpty!37179))

(get-info :version)

(assert (= (and mapNonEmpty!37179 ((_ is ValueCellFull!11219) mapValue!37179)) b!1021031))

(assert (= (and b!1021029 ((_ is ValueCellFull!11219) mapDefault!37179)) b!1021028))

(assert (= b!1021026 b!1021029))

(assert (= b!1021030 b!1021026))

(assert (= b!1021032 b!1021030))

(assert (= start!89062 b!1021032))

(declare-fun m!940161 () Bool)

(assert (=> mapNonEmpty!37179 m!940161))

(declare-fun m!940163 () Bool)

(assert (=> b!1021026 m!940163))

(declare-fun m!940165 () Bool)

(assert (=> b!1021026 m!940165))

(declare-fun m!940167 () Bool)

(assert (=> b!1021027 m!940167))

(declare-fun m!940169 () Bool)

(assert (=> b!1021027 m!940169))

(declare-fun m!940171 () Bool)

(assert (=> start!89062 m!940171))

(check-sat tp_is_empty!23845 (not b_next!20125) b_and!32287 (not b!1021026) (not mapNonEmpty!37179) (not b!1021027) (not start!89062))
(check-sat b_and!32287 (not b_next!20125))
