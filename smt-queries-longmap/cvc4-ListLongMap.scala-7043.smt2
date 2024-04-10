; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89274 () Bool)

(assert start!89274)

(declare-fun b!1023689 () Bool)

(declare-fun b_free!20315 () Bool)

(declare-fun b_next!20315 () Bool)

(assert (=> b!1023689 (= b_free!20315 (not b_next!20315))))

(declare-fun tp!71979 () Bool)

(declare-fun b_and!32541 () Bool)

(assert (=> b!1023689 (= tp!71979 b_and!32541)))

(declare-fun b!1023687 () Bool)

(declare-fun e!576872 () Bool)

(declare-fun tp_is_empty!24035 () Bool)

(assert (=> b!1023687 (= e!576872 tp_is_empty!24035)))

(declare-fun b!1023688 () Bool)

(declare-fun e!576869 () Bool)

(assert (=> b!1023688 (= e!576869 tp_is_empty!24035)))

(declare-datatypes ((V!36919 0))(
  ( (V!36920 (val!12068 Int)) )
))
(declare-datatypes ((ValueCell!11314 0))(
  ( (ValueCellFull!11314 (v!14637 V!36919)) (EmptyCell!11314) )
))
(declare-datatypes ((array!64114 0))(
  ( (array!64115 (arr!30869 (Array (_ BitVec 32) (_ BitVec 64))) (size!31380 (_ BitVec 32))) )
))
(declare-datatypes ((array!64116 0))(
  ( (array!64117 (arr!30870 (Array (_ BitVec 32) ValueCell!11314)) (size!31381 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5222 0))(
  ( (LongMapFixedSize!5223 (defaultEntry!5963 Int) (mask!29590 (_ BitVec 32)) (extraKeys!5695 (_ BitVec 32)) (zeroValue!5799 V!36919) (minValue!5799 V!36919) (_size!2666 (_ BitVec 32)) (_keys!11108 array!64114) (_values!5986 array!64116) (_vacant!2666 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5222)

(declare-fun e!576873 () Bool)

(declare-fun e!576871 () Bool)

(declare-fun array_inv!23919 (array!64114) Bool)

(declare-fun array_inv!23920 (array!64116) Bool)

(assert (=> b!1023689 (= e!576873 (and tp!71979 tp_is_empty!24035 (array_inv!23919 (_keys!11108 thiss!1427)) (array_inv!23920 (_values!5986 thiss!1427)) e!576871))))

(declare-fun b!1023690 () Bool)

(declare-fun res!685555 () Bool)

(declare-fun e!576870 () Bool)

(assert (=> b!1023690 (=> (not res!685555) (not e!576870))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023690 (= res!685555 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!37470 () Bool)

(declare-fun mapRes!37470 () Bool)

(assert (=> mapIsEmpty!37470 mapRes!37470))

(declare-fun b!1023691 () Bool)

(assert (=> b!1023691 (= e!576871 (and e!576872 mapRes!37470))))

(declare-fun condMapEmpty!37470 () Bool)

(declare-fun mapDefault!37470 () ValueCell!11314)

