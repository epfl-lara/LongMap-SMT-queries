; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89068 () Bool)

(assert start!89068)

(declare-fun b!1021216 () Bool)

(declare-fun b_free!20129 () Bool)

(declare-fun b_next!20129 () Bool)

(assert (=> b!1021216 (= b_free!20129 (not b_next!20129))))

(declare-fun tp!71415 () Bool)

(declare-fun b_and!32317 () Bool)

(assert (=> b!1021216 (= tp!71415 b_and!32317)))

(declare-fun b!1021213 () Bool)

(declare-fun e!575099 () Bool)

(declare-fun tp_is_empty!23849 () Bool)

(assert (=> b!1021213 (= e!575099 tp_is_empty!23849)))

(declare-fun b!1021214 () Bool)

(declare-fun e!575102 () Bool)

(declare-fun e!575097 () Bool)

(assert (=> b!1021214 (= e!575102 e!575097)))

(declare-fun mapNonEmpty!37185 () Bool)

(declare-fun mapRes!37185 () Bool)

(declare-fun tp!71416 () Bool)

(assert (=> mapNonEmpty!37185 (= mapRes!37185 (and tp!71416 e!575099))))

(declare-datatypes ((V!36671 0))(
  ( (V!36672 (val!11975 Int)) )
))
(declare-datatypes ((array!63738 0))(
  ( (array!63739 (arr!30683 (Array (_ BitVec 32) (_ BitVec 64))) (size!31194 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11221 0))(
  ( (ValueCellFull!11221 (v!14537 V!36671)) (EmptyCell!11221) )
))
(declare-datatypes ((array!63740 0))(
  ( (array!63741 (arr!30684 (Array (_ BitVec 32) ValueCell!11221)) (size!31195 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5036 0))(
  ( (LongMapFixedSize!5037 (defaultEntry!5870 Int) (mask!29435 (_ BitVec 32)) (extraKeys!5602 (_ BitVec 32)) (zeroValue!5706 V!36671) (minValue!5706 V!36671) (_size!2573 (_ BitVec 32)) (_keys!11015 array!63738) (_values!5893 array!63740) (_vacant!2573 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1110 0))(
  ( (Cell!1111 (v!14538 LongMapFixedSize!5036)) )
))
(declare-datatypes ((LongMap!1110 0))(
  ( (LongMap!1111 (underlying!566 Cell!1110)) )
))
(declare-fun thiss!908 () LongMap!1110)

(declare-fun mapKey!37185 () (_ BitVec 32))

(declare-fun mapValue!37185 () ValueCell!11221)

(declare-fun mapRest!37185 () (Array (_ BitVec 32) ValueCell!11221))

(assert (=> mapNonEmpty!37185 (= (arr!30684 (_values!5893 (v!14538 (underlying!566 thiss!908)))) (store mapRest!37185 mapKey!37185 mapValue!37185))))

(declare-fun res!684347 () Bool)

(declare-fun e!575098 () Bool)

(assert (=> start!89068 (=> (not res!684347) (not e!575098))))

(declare-fun valid!1917 (LongMap!1110) Bool)

(assert (=> start!89068 (= res!684347 (valid!1917 thiss!908))))

(assert (=> start!89068 e!575098))

(declare-fun e!575096 () Bool)

(assert (=> start!89068 e!575096))

(assert (=> start!89068 true))

(declare-fun b!1021215 () Bool)

(declare-fun e!575101 () Bool)

(assert (=> b!1021215 (= e!575101 tp_is_empty!23849)))

(declare-fun mapIsEmpty!37185 () Bool)

(assert (=> mapIsEmpty!37185 mapRes!37185))

(declare-fun e!575100 () Bool)

(declare-fun array_inv!23797 (array!63738) Bool)

(declare-fun array_inv!23798 (array!63740) Bool)

(assert (=> b!1021216 (= e!575097 (and tp!71415 tp_is_empty!23849 (array_inv!23797 (_keys!11015 (v!14538 (underlying!566 thiss!908)))) (array_inv!23798 (_values!5893 (v!14538 (underlying!566 thiss!908)))) e!575100))))

(declare-fun b!1021217 () Bool)

(assert (=> b!1021217 (= e!575100 (and e!575101 mapRes!37185))))

(declare-fun condMapEmpty!37185 () Bool)

(declare-fun mapDefault!37185 () ValueCell!11221)

