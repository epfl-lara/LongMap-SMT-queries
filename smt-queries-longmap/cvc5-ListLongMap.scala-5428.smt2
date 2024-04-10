; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72352 () Bool)

(assert start!72352)

(declare-fun b_free!13537 () Bool)

(declare-fun b_next!13537 () Bool)

(assert (=> start!72352 (= b_free!13537 (not b_next!13537))))

(declare-fun tp!47709 () Bool)

(declare-fun b_and!22623 () Bool)

(assert (=> start!72352 (= tp!47709 b_and!22623)))

(declare-fun b!838283 () Bool)

(declare-fun res!570040 () Bool)

(declare-fun e!467948 () Bool)

(assert (=> b!838283 (=> (not res!570040) (not e!467948))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838283 (= res!570040 (validMask!0 mask!1196))))

(declare-fun b!838284 () Bool)

(declare-fun res!570037 () Bool)

(assert (=> b!838284 (=> (not res!570037) (not e!467948))))

(declare-datatypes ((array!47096 0))(
  ( (array!47097 (arr!22579 (Array (_ BitVec 32) (_ BitVec 64))) (size!23019 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47096)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47096 (_ BitVec 32)) Bool)

(assert (=> b!838284 (= res!570037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838285 () Bool)

(declare-fun e!467949 () Bool)

(declare-fun e!467946 () Bool)

(declare-fun mapRes!24704 () Bool)

(assert (=> b!838285 (= e!467949 (and e!467946 mapRes!24704))))

(declare-fun condMapEmpty!24704 () Bool)

(declare-datatypes ((V!25585 0))(
  ( (V!25586 (val!7749 Int)) )
))
(declare-datatypes ((ValueCell!7262 0))(
  ( (ValueCellFull!7262 (v!10174 V!25585)) (EmptyCell!7262) )
))
(declare-datatypes ((array!47098 0))(
  ( (array!47099 (arr!22580 (Array (_ BitVec 32) ValueCell!7262)) (size!23020 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47098)

(declare-fun mapDefault!24704 () ValueCell!7262)

