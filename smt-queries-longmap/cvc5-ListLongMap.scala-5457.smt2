; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72526 () Bool)

(assert start!72526)

(declare-fun b_free!13711 () Bool)

(declare-fun b_next!13711 () Bool)

(assert (=> start!72526 (= b_free!13711 (not b_next!13711))))

(declare-fun tp!48232 () Bool)

(declare-fun b_and!22797 () Bool)

(assert (=> start!72526 (= tp!48232 b_and!22797)))

(declare-fun b!841676 () Bool)

(declare-fun res!572122 () Bool)

(declare-fun e!469511 () Bool)

(assert (=> b!841676 (=> (not res!572122) (not e!469511))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47430 0))(
  ( (array!47431 (arr!22746 (Array (_ BitVec 32) (_ BitVec 64))) (size!23186 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47430)

(assert (=> b!841676 (= res!572122 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23186 _keys!868))))))

(declare-fun b!841677 () Bool)

(declare-fun res!572128 () Bool)

(assert (=> b!841677 (=> (not res!572128) (not e!469511))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841677 (= res!572128 (validMask!0 mask!1196))))

(declare-fun b!841678 () Bool)

(declare-fun res!572129 () Bool)

(assert (=> b!841678 (=> (not res!572129) (not e!469511))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25817 0))(
  ( (V!25818 (val!7836 Int)) )
))
(declare-datatypes ((ValueCell!7349 0))(
  ( (ValueCellFull!7349 (v!10261 V!25817)) (EmptyCell!7349) )
))
(declare-datatypes ((array!47432 0))(
  ( (array!47433 (arr!22747 (Array (_ BitVec 32) ValueCell!7349)) (size!23187 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47432)

(assert (=> b!841678 (= res!572129 (and (= (size!23187 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23186 _keys!868) (size!23187 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24965 () Bool)

(declare-fun mapRes!24965 () Bool)

(assert (=> mapIsEmpty!24965 mapRes!24965))

(declare-fun res!572123 () Bool)

(assert (=> start!72526 (=> (not res!572123) (not e!469511))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72526 (= res!572123 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23186 _keys!868))))))

(assert (=> start!72526 e!469511))

(declare-fun tp_is_empty!15577 () Bool)

(assert (=> start!72526 tp_is_empty!15577))

(assert (=> start!72526 true))

(assert (=> start!72526 tp!48232))

(declare-fun array_inv!18098 (array!47430) Bool)

(assert (=> start!72526 (array_inv!18098 _keys!868)))

(declare-fun e!469512 () Bool)

(declare-fun array_inv!18099 (array!47432) Bool)

(assert (=> start!72526 (and (array_inv!18099 _values!688) e!469512)))

(declare-fun b!841679 () Bool)

(declare-fun res!572127 () Bool)

(assert (=> b!841679 (=> (not res!572127) (not e!469511))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841679 (= res!572127 (validKeyInArray!0 k!854))))

(declare-fun b!841680 () Bool)

(declare-fun e!469515 () Bool)

(assert (=> b!841680 (= e!469512 (and e!469515 mapRes!24965))))

(declare-fun condMapEmpty!24965 () Bool)

(declare-fun mapDefault!24965 () ValueCell!7349)

