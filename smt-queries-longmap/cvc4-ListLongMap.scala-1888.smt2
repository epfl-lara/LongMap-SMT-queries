; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33784 () Bool)

(assert start!33784)

(declare-fun b_free!7001 () Bool)

(declare-fun b_next!7001 () Bool)

(assert (=> start!33784 (= b_free!7001 (not b_next!7001))))

(declare-fun tp!24509 () Bool)

(declare-fun b_and!14183 () Bool)

(assert (=> start!33784 (= tp!24509 b_and!14183)))

(declare-fun b!336096 () Bool)

(declare-fun res!185519 () Bool)

(declare-fun e!206304 () Bool)

(assert (=> b!336096 (=> (not res!185519) (not e!206304))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336096 (= res!185519 (validKeyInArray!0 k!1348))))

(declare-fun b!336097 () Bool)

(declare-fun e!206306 () Bool)

(declare-fun tp_is_empty!6953 () Bool)

(assert (=> b!336097 (= e!206306 tp_is_empty!6953)))

(declare-fun b!336098 () Bool)

(declare-fun res!185521 () Bool)

(assert (=> b!336098 (=> (not res!185521) (not e!206304))))

(declare-datatypes ((array!17501 0))(
  ( (array!17502 (arr!8280 (Array (_ BitVec 32) (_ BitVec 64))) (size!8632 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17501)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17501 (_ BitVec 32)) Bool)

(assert (=> b!336098 (= res!185521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336099 () Bool)

(declare-fun e!206305 () Bool)

(declare-fun mapRes!11829 () Bool)

(assert (=> b!336099 (= e!206305 (and e!206306 mapRes!11829))))

(declare-fun condMapEmpty!11829 () Bool)

(declare-datatypes ((V!10247 0))(
  ( (V!10248 (val!3521 Int)) )
))
(declare-datatypes ((ValueCell!3133 0))(
  ( (ValueCellFull!3133 (v!5684 V!10247)) (EmptyCell!3133) )
))
(declare-datatypes ((array!17503 0))(
  ( (array!17504 (arr!8281 (Array (_ BitVec 32) ValueCell!3133)) (size!8633 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17503)

(declare-fun mapDefault!11829 () ValueCell!3133)

