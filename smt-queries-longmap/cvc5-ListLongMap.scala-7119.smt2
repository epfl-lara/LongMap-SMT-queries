; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90248 () Bool)

(assert start!90248)

(declare-fun b!1033160 () Bool)

(declare-fun b_free!20767 () Bool)

(declare-fun b_next!20767 () Bool)

(assert (=> b!1033160 (= b_free!20767 (not b_next!20767))))

(declare-fun tp!73394 () Bool)

(declare-fun b_and!33235 () Bool)

(assert (=> b!1033160 (= tp!73394 b_and!33235)))

(declare-fun res!690376 () Bool)

(declare-fun e!583899 () Bool)

(assert (=> start!90248 (=> (not res!690376) (not e!583899))))

(declare-datatypes ((V!37523 0))(
  ( (V!37524 (val!12294 Int)) )
))
(declare-datatypes ((ValueCell!11540 0))(
  ( (ValueCellFull!11540 (v!14871 V!37523)) (EmptyCell!11540) )
))
(declare-datatypes ((array!65050 0))(
  ( (array!65051 (arr!31321 (Array (_ BitVec 32) (_ BitVec 64))) (size!31843 (_ BitVec 32))) )
))
(declare-datatypes ((array!65052 0))(
  ( (array!65053 (arr!31322 (Array (_ BitVec 32) ValueCell!11540)) (size!31844 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5674 0))(
  ( (LongMapFixedSize!5675 (defaultEntry!6211 Int) (mask!30054 (_ BitVec 32)) (extraKeys!5943 (_ BitVec 32)) (zeroValue!6047 V!37523) (minValue!6047 V!37523) (_size!2892 (_ BitVec 32)) (_keys!11389 array!65050) (_values!6234 array!65052) (_vacant!2892 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5674)

(declare-fun valid!2144 (LongMapFixedSize!5674) Bool)

(assert (=> start!90248 (= res!690376 (valid!2144 thiss!1427))))

(assert (=> start!90248 e!583899))

(declare-fun e!583900 () Bool)

(assert (=> start!90248 e!583900))

(assert (=> start!90248 true))

(declare-fun b!1033155 () Bool)

(declare-fun res!690375 () Bool)

(assert (=> b!1033155 (=> (not res!690375) (not e!583899))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033155 (= res!690375 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033156 () Bool)

(declare-fun e!583901 () Bool)

(declare-fun tp_is_empty!24487 () Bool)

(assert (=> b!1033156 (= e!583901 tp_is_empty!24487)))

(declare-fun b!1033157 () Bool)

(declare-fun e!583902 () Bool)

(declare-fun mapRes!38207 () Bool)

(assert (=> b!1033157 (= e!583902 (and e!583901 mapRes!38207))))

(declare-fun condMapEmpty!38207 () Bool)

(declare-fun mapDefault!38207 () ValueCell!11540)

