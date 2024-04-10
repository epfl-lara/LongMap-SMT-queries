; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72394 () Bool)

(assert start!72394)

(declare-fun b_free!13579 () Bool)

(declare-fun b_next!13579 () Bool)

(assert (=> start!72394 (= b_free!13579 (not b_next!13579))))

(declare-fun tp!47836 () Bool)

(declare-fun b_and!22665 () Bool)

(assert (=> start!72394 (= tp!47836 b_and!22665)))

(declare-fun b!839102 () Bool)

(declare-fun res!570543 () Bool)

(declare-fun e!468326 () Bool)

(assert (=> b!839102 (=> (not res!570543) (not e!468326))))

(declare-datatypes ((array!47174 0))(
  ( (array!47175 (arr!22618 (Array (_ BitVec 32) (_ BitVec 64))) (size!23058 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47174)

(declare-datatypes ((List!16082 0))(
  ( (Nil!16079) (Cons!16078 (h!17209 (_ BitVec 64)) (t!22453 List!16082)) )
))
(declare-fun arrayNoDuplicates!0 (array!47174 (_ BitVec 32) List!16082) Bool)

(assert (=> b!839102 (= res!570543 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16079))))

(declare-fun b!839103 () Bool)

(declare-fun e!468324 () Bool)

(declare-fun e!468325 () Bool)

(declare-fun mapRes!24767 () Bool)

(assert (=> b!839103 (= e!468324 (and e!468325 mapRes!24767))))

(declare-fun condMapEmpty!24767 () Bool)

(declare-datatypes ((V!25641 0))(
  ( (V!25642 (val!7770 Int)) )
))
(declare-datatypes ((ValueCell!7283 0))(
  ( (ValueCellFull!7283 (v!10195 V!25641)) (EmptyCell!7283) )
))
(declare-datatypes ((array!47176 0))(
  ( (array!47177 (arr!22619 (Array (_ BitVec 32) ValueCell!7283)) (size!23059 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47176)

(declare-fun mapDefault!24767 () ValueCell!7283)

