; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72626 () Bool)

(assert start!72626)

(declare-fun b!843038 () Bool)

(declare-fun res!572932 () Bool)

(declare-fun e!470314 () Bool)

(assert (=> b!843038 (=> (not res!572932) (not e!470314))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47614 0))(
  ( (array!47615 (arr!22838 (Array (_ BitVec 32) (_ BitVec 64))) (size!23278 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47614)

(declare-datatypes ((V!25949 0))(
  ( (V!25950 (val!7886 Int)) )
))
(declare-datatypes ((ValueCell!7399 0))(
  ( (ValueCellFull!7399 (v!10311 V!25949)) (EmptyCell!7399) )
))
(declare-datatypes ((array!47616 0))(
  ( (array!47617 (arr!22839 (Array (_ BitVec 32) ValueCell!7399)) (size!23279 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47616)

(assert (=> b!843038 (= res!572932 (and (= (size!23279 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23278 _keys!868) (size!23279 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572931 () Bool)

(assert (=> start!72626 (=> (not res!572931) (not e!470314))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72626 (= res!572931 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23278 _keys!868))))))

(assert (=> start!72626 e!470314))

(assert (=> start!72626 true))

(declare-fun array_inv!18170 (array!47614) Bool)

(assert (=> start!72626 (array_inv!18170 _keys!868)))

(declare-fun e!470317 () Bool)

(declare-fun array_inv!18171 (array!47616) Bool)

(assert (=> start!72626 (and (array_inv!18171 _values!688) e!470317)))

(declare-fun b!843039 () Bool)

(declare-fun e!470316 () Bool)

(declare-fun mapRes!25115 () Bool)

(assert (=> b!843039 (= e!470317 (and e!470316 mapRes!25115))))

(declare-fun condMapEmpty!25115 () Bool)

(declare-fun mapDefault!25115 () ValueCell!7399)

