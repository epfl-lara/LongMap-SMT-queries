; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72928 () Bool)

(assert start!72928)

(declare-fun b_free!13843 () Bool)

(declare-fun b_next!13843 () Bool)

(assert (=> start!72928 (= b_free!13843 (not b_next!13843))))

(declare-fun tp!49032 () Bool)

(declare-fun b_and!22929 () Bool)

(assert (=> start!72928 (= tp!49032 b_and!22929)))

(declare-fun res!575333 () Bool)

(declare-fun e!472578 () Bool)

(assert (=> start!72928 (=> (not res!575333) (not e!472578))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48170 0))(
  ( (array!48171 (arr!23116 (Array (_ BitVec 32) (_ BitVec 64))) (size!23556 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48170)

(assert (=> start!72928 (= res!575333 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23556 _keys!868))))))

(assert (=> start!72928 e!472578))

(declare-fun tp_is_empty!15979 () Bool)

(assert (=> start!72928 tp_is_empty!15979))

(assert (=> start!72928 true))

(assert (=> start!72928 tp!49032))

(declare-fun array_inv!18360 (array!48170) Bool)

(assert (=> start!72928 (array_inv!18360 _keys!868)))

(declare-datatypes ((V!26353 0))(
  ( (V!26354 (val!8037 Int)) )
))
(declare-datatypes ((ValueCell!7550 0))(
  ( (ValueCellFull!7550 (v!10462 V!26353)) (EmptyCell!7550) )
))
(declare-datatypes ((array!48172 0))(
  ( (array!48173 (arr!23117 (Array (_ BitVec 32) ValueCell!7550)) (size!23557 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48172)

(declare-fun e!472580 () Bool)

(declare-fun array_inv!18361 (array!48172) Bool)

(assert (=> start!72928 (and (array_inv!18361 _values!688) e!472580)))

(declare-fun b!846793 () Bool)

(declare-fun res!575329 () Bool)

(assert (=> b!846793 (=> (not res!575329) (not e!472578))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846793 (= res!575329 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25568 () Bool)

(declare-fun mapRes!25568 () Bool)

(assert (=> mapIsEmpty!25568 mapRes!25568))

(declare-fun b!846794 () Bool)

(declare-fun e!472582 () Bool)

(assert (=> b!846794 (= e!472580 (and e!472582 mapRes!25568))))

(declare-fun condMapEmpty!25568 () Bool)

(declare-fun mapDefault!25568 () ValueCell!7550)

