; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90258 () Bool)

(assert start!90258)

(declare-fun b!1033266 () Bool)

(declare-fun b_free!20777 () Bool)

(declare-fun b_next!20777 () Bool)

(assert (=> b!1033266 (= b_free!20777 (not b_next!20777))))

(declare-fun tp!73424 () Bool)

(declare-fun b_and!33245 () Bool)

(assert (=> b!1033266 (= tp!73424 b_and!33245)))

(declare-fun b!1033260 () Bool)

(declare-fun res!690420 () Bool)

(declare-fun e!583989 () Bool)

(assert (=> b!1033260 (=> (not res!690420) (not e!583989))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033260 (= res!690420 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38222 () Bool)

(declare-fun mapRes!38222 () Bool)

(assert (=> mapIsEmpty!38222 mapRes!38222))

(declare-fun b!1033261 () Bool)

(declare-fun e!583993 () Bool)

(declare-fun tp_is_empty!24497 () Bool)

(assert (=> b!1033261 (= e!583993 tp_is_empty!24497)))

(declare-fun res!690421 () Bool)

(assert (=> start!90258 (=> (not res!690421) (not e!583989))))

(declare-datatypes ((V!37535 0))(
  ( (V!37536 (val!12299 Int)) )
))
(declare-datatypes ((ValueCell!11545 0))(
  ( (ValueCellFull!11545 (v!14876 V!37535)) (EmptyCell!11545) )
))
(declare-datatypes ((array!65070 0))(
  ( (array!65071 (arr!31331 (Array (_ BitVec 32) (_ BitVec 64))) (size!31853 (_ BitVec 32))) )
))
(declare-datatypes ((array!65072 0))(
  ( (array!65073 (arr!31332 (Array (_ BitVec 32) ValueCell!11545)) (size!31854 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5684 0))(
  ( (LongMapFixedSize!5685 (defaultEntry!6216 Int) (mask!30061 (_ BitVec 32)) (extraKeys!5948 (_ BitVec 32)) (zeroValue!6052 V!37535) (minValue!6052 V!37535) (_size!2897 (_ BitVec 32)) (_keys!11394 array!65070) (_values!6239 array!65072) (_vacant!2897 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5684)

(declare-fun valid!2148 (LongMapFixedSize!5684) Bool)

(assert (=> start!90258 (= res!690421 (valid!2148 thiss!1427))))

(assert (=> start!90258 e!583989))

(declare-fun e!583991 () Bool)

(assert (=> start!90258 e!583991))

(assert (=> start!90258 true))

(declare-fun b!1033262 () Bool)

(declare-fun e!583990 () Bool)

(assert (=> b!1033262 (= e!583990 (and e!583993 mapRes!38222))))

(declare-fun condMapEmpty!38222 () Bool)

(declare-fun mapDefault!38222 () ValueCell!11545)

