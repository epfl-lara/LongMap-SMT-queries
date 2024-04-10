; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89394 () Bool)

(assert start!89394)

(declare-fun b!1024858 () Bool)

(declare-fun b_free!20393 () Bool)

(declare-fun b_next!20393 () Bool)

(assert (=> b!1024858 (= b_free!20393 (not b_next!20393))))

(declare-fun tp!72224 () Bool)

(declare-fun b_and!32639 () Bool)

(assert (=> b!1024858 (= tp!72224 b_and!32639)))

(declare-fun e!577769 () Bool)

(declare-fun tp_is_empty!24113 () Bool)

(declare-datatypes ((V!37023 0))(
  ( (V!37024 (val!12107 Int)) )
))
(declare-datatypes ((ValueCell!11353 0))(
  ( (ValueCellFull!11353 (v!14676 V!37023)) (EmptyCell!11353) )
))
(declare-datatypes ((array!64276 0))(
  ( (array!64277 (arr!30947 (Array (_ BitVec 32) (_ BitVec 64))) (size!31460 (_ BitVec 32))) )
))
(declare-datatypes ((array!64278 0))(
  ( (array!64279 (arr!30948 (Array (_ BitVec 32) ValueCell!11353)) (size!31461 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5300 0))(
  ( (LongMapFixedSize!5301 (defaultEntry!6002 Int) (mask!29660 (_ BitVec 32)) (extraKeys!5734 (_ BitVec 32)) (zeroValue!5838 V!37023) (minValue!5838 V!37023) (_size!2705 (_ BitVec 32)) (_keys!11149 array!64276) (_values!6025 array!64278) (_vacant!2705 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5300)

(declare-fun e!577768 () Bool)

(declare-fun array_inv!23969 (array!64276) Bool)

(declare-fun array_inv!23970 (array!64278) Bool)

(assert (=> b!1024858 (= e!577769 (and tp!72224 tp_is_empty!24113 (array_inv!23969 (_keys!11149 thiss!1427)) (array_inv!23970 (_values!6025 thiss!1427)) e!577768))))

(declare-fun b!1024859 () Bool)

(declare-fun res!686167 () Bool)

(declare-fun e!577773 () Bool)

(assert (=> b!1024859 (=> (not res!686167) (not e!577773))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024859 (= res!686167 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37598 () Bool)

(declare-fun mapRes!37598 () Bool)

(declare-fun tp!72225 () Bool)

(declare-fun e!577770 () Bool)

(assert (=> mapNonEmpty!37598 (= mapRes!37598 (and tp!72225 e!577770))))

(declare-fun mapValue!37598 () ValueCell!11353)

(declare-fun mapRest!37598 () (Array (_ BitVec 32) ValueCell!11353))

(declare-fun mapKey!37598 () (_ BitVec 32))

(assert (=> mapNonEmpty!37598 (= (arr!30948 (_values!6025 thiss!1427)) (store mapRest!37598 mapKey!37598 mapValue!37598))))

(declare-fun res!686162 () Bool)

(assert (=> start!89394 (=> (not res!686162) (not e!577773))))

(declare-fun valid!2016 (LongMapFixedSize!5300) Bool)

(assert (=> start!89394 (= res!686162 (valid!2016 thiss!1427))))

(assert (=> start!89394 e!577773))

(assert (=> start!89394 e!577769))

(assert (=> start!89394 true))

(declare-fun b!1024860 () Bool)

(declare-fun e!577774 () Bool)

(assert (=> b!1024860 (= e!577774 tp_is_empty!24113)))

(declare-fun b!1024861 () Bool)

(assert (=> b!1024861 (= e!577768 (and e!577774 mapRes!37598))))

(declare-fun condMapEmpty!37598 () Bool)

(declare-fun mapDefault!37598 () ValueCell!11353)

