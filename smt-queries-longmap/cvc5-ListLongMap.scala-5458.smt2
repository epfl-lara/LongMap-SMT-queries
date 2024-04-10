; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72532 () Bool)

(assert start!72532)

(declare-fun b_free!13717 () Bool)

(declare-fun b_next!13717 () Bool)

(assert (=> start!72532 (= b_free!13717 (not b_next!13717))))

(declare-fun tp!48250 () Bool)

(declare-fun b_and!22803 () Bool)

(assert (=> start!72532 (= tp!48250 b_and!22803)))

(declare-fun b!841793 () Bool)

(declare-fun res!572196 () Bool)

(declare-fun e!469566 () Bool)

(assert (=> b!841793 (=> (not res!572196) (not e!469566))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841793 (= res!572196 (validMask!0 mask!1196))))

(declare-fun b!841794 () Bool)

(declare-fun e!469568 () Bool)

(declare-fun e!469569 () Bool)

(declare-fun mapRes!24974 () Bool)

(assert (=> b!841794 (= e!469568 (and e!469569 mapRes!24974))))

(declare-fun condMapEmpty!24974 () Bool)

(declare-datatypes ((V!25825 0))(
  ( (V!25826 (val!7839 Int)) )
))
(declare-datatypes ((ValueCell!7352 0))(
  ( (ValueCellFull!7352 (v!10264 V!25825)) (EmptyCell!7352) )
))
(declare-datatypes ((array!47442 0))(
  ( (array!47443 (arr!22752 (Array (_ BitVec 32) ValueCell!7352)) (size!23192 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47442)

(declare-fun mapDefault!24974 () ValueCell!7352)

