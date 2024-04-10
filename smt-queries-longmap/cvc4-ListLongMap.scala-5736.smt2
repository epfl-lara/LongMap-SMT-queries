; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74234 () Bool)

(assert start!74234)

(declare-fun b!873284 () Bool)

(declare-fun e!486322 () Bool)

(declare-fun tp_is_empty!17255 () Bool)

(assert (=> b!873284 (= e!486322 tp_is_empty!17255)))

(declare-fun b!873285 () Bool)

(declare-fun e!486323 () Bool)

(assert (=> b!873285 (= e!486323 tp_is_empty!17255)))

(declare-fun mapIsEmpty!27488 () Bool)

(declare-fun mapRes!27488 () Bool)

(assert (=> mapIsEmpty!27488 mapRes!27488))

(declare-fun b!873286 () Bool)

(declare-fun res!593444 () Bool)

(declare-fun e!486325 () Bool)

(assert (=> b!873286 (=> (not res!593444) (not e!486325))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50636 0))(
  ( (array!50637 (arr!24347 (Array (_ BitVec 32) (_ BitVec 64))) (size!24787 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50636)

(declare-datatypes ((V!28053 0))(
  ( (V!28054 (val!8675 Int)) )
))
(declare-datatypes ((ValueCell!8188 0))(
  ( (ValueCellFull!8188 (v!11104 V!28053)) (EmptyCell!8188) )
))
(declare-datatypes ((array!50638 0))(
  ( (array!50639 (arr!24348 (Array (_ BitVec 32) ValueCell!8188)) (size!24788 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50638)

(assert (=> b!873286 (= res!593444 (and (= (size!24788 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24787 _keys!868) (size!24788 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27488 () Bool)

(declare-fun tp!52714 () Bool)

(assert (=> mapNonEmpty!27488 (= mapRes!27488 (and tp!52714 e!486322))))

(declare-fun mapKey!27488 () (_ BitVec 32))

(declare-fun mapValue!27488 () ValueCell!8188)

(declare-fun mapRest!27488 () (Array (_ BitVec 32) ValueCell!8188))

(assert (=> mapNonEmpty!27488 (= (arr!24348 _values!688) (store mapRest!27488 mapKey!27488 mapValue!27488))))

(declare-fun res!593442 () Bool)

(assert (=> start!74234 (=> (not res!593442) (not e!486325))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74234 (= res!593442 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24787 _keys!868))))))

(assert (=> start!74234 e!486325))

(assert (=> start!74234 true))

(declare-fun array_inv!19210 (array!50636) Bool)

(assert (=> start!74234 (array_inv!19210 _keys!868)))

(declare-fun e!486321 () Bool)

(declare-fun array_inv!19211 (array!50638) Bool)

(assert (=> start!74234 (and (array_inv!19211 _values!688) e!486321)))

(declare-fun b!873287 () Bool)

(declare-fun res!593441 () Bool)

(assert (=> b!873287 (=> (not res!593441) (not e!486325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873287 (= res!593441 (validMask!0 mask!1196))))

(declare-fun b!873288 () Bool)

(assert (=> b!873288 (= e!486321 (and e!486323 mapRes!27488))))

(declare-fun condMapEmpty!27488 () Bool)

(declare-fun mapDefault!27488 () ValueCell!8188)

