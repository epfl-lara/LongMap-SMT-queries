; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74266 () Bool)

(assert start!74266)

(declare-fun b_free!15029 () Bool)

(declare-fun b_next!15029 () Bool)

(assert (=> start!74266 (= b_free!15029 (not b_next!15029))))

(declare-fun tp!52761 () Bool)

(declare-fun b_and!24805 () Bool)

(assert (=> start!74266 (= tp!52761 b_and!24805)))

(declare-fun b!873653 () Bool)

(declare-fun e!486515 () Bool)

(declare-fun tp_is_empty!17273 () Bool)

(assert (=> b!873653 (= e!486515 tp_is_empty!17273)))

(declare-fun b!873654 () Bool)

(declare-fun res!593679 () Bool)

(declare-fun e!486511 () Bool)

(assert (=> b!873654 (=> (not res!593679) (not e!486511))))

(declare-datatypes ((array!50674 0))(
  ( (array!50675 (arr!24365 (Array (_ BitVec 32) (_ BitVec 64))) (size!24805 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50674)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50674 (_ BitVec 32)) Bool)

(assert (=> b!873654 (= res!593679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873655 () Bool)

(declare-fun res!593682 () Bool)

(assert (=> b!873655 (=> (not res!593682) (not e!486511))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873655 (= res!593682 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24805 _keys!868))))))

(declare-fun b!873656 () Bool)

(declare-fun res!593680 () Bool)

(assert (=> b!873656 (=> (not res!593680) (not e!486511))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873656 (= res!593680 (validKeyInArray!0 k!854))))

(declare-fun b!873657 () Bool)

(declare-fun res!593675 () Bool)

(assert (=> b!873657 (=> (not res!593675) (not e!486511))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28077 0))(
  ( (V!28078 (val!8684 Int)) )
))
(declare-datatypes ((ValueCell!8197 0))(
  ( (ValueCellFull!8197 (v!11113 V!28077)) (EmptyCell!8197) )
))
(declare-datatypes ((array!50676 0))(
  ( (array!50677 (arr!24366 (Array (_ BitVec 32) ValueCell!8197)) (size!24806 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50676)

(assert (=> b!873657 (= res!593675 (and (= (size!24806 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24805 _keys!868) (size!24806 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873658 () Bool)

(declare-fun res!593676 () Bool)

(assert (=> b!873658 (=> (not res!593676) (not e!486511))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873658 (= res!593676 (and (= (select (arr!24365 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!593678 () Bool)

(assert (=> start!74266 (=> (not res!593678) (not e!486511))))

(assert (=> start!74266 (= res!593678 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24805 _keys!868))))))

(assert (=> start!74266 e!486511))

(assert (=> start!74266 true))

(assert (=> start!74266 tp!52761))

(declare-fun array_inv!19222 (array!50674) Bool)

(assert (=> start!74266 (array_inv!19222 _keys!868)))

(declare-fun e!486513 () Bool)

(declare-fun array_inv!19223 (array!50676) Bool)

(assert (=> start!74266 (and (array_inv!19223 _values!688) e!486513)))

(assert (=> start!74266 tp_is_empty!17273))

(declare-fun b!873659 () Bool)

(declare-fun e!486514 () Bool)

(declare-fun mapRes!27518 () Bool)

(assert (=> b!873659 (= e!486513 (and e!486514 mapRes!27518))))

(declare-fun condMapEmpty!27518 () Bool)

(declare-fun mapDefault!27518 () ValueCell!8197)

