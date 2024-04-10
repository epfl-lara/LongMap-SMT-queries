; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74102 () Bool)

(assert start!74102)

(declare-fun mapIsEmpty!27329 () Bool)

(declare-fun mapRes!27329 () Bool)

(assert (=> mapIsEmpty!27329 mapRes!27329))

(declare-fun res!592604 () Bool)

(declare-fun e!485426 () Bool)

(assert (=> start!74102 (=> (not res!592604) (not e!485426))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50442 0))(
  ( (array!50443 (arr!24252 (Array (_ BitVec 32) (_ BitVec 64))) (size!24692 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50442)

(assert (=> start!74102 (= res!592604 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24692 _keys!868))))))

(assert (=> start!74102 e!485426))

(assert (=> start!74102 true))

(declare-fun array_inv!19148 (array!50442) Bool)

(assert (=> start!74102 (array_inv!19148 _keys!868)))

(declare-datatypes ((V!27917 0))(
  ( (V!27918 (val!8624 Int)) )
))
(declare-datatypes ((ValueCell!8137 0))(
  ( (ValueCellFull!8137 (v!11049 V!27917)) (EmptyCell!8137) )
))
(declare-datatypes ((array!50444 0))(
  ( (array!50445 (arr!24253 (Array (_ BitVec 32) ValueCell!8137)) (size!24693 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50444)

(declare-fun e!485425 () Bool)

(declare-fun array_inv!19149 (array!50444) Bool)

(assert (=> start!74102 (and (array_inv!19149 _values!688) e!485425)))

(declare-fun mapNonEmpty!27329 () Bool)

(declare-fun tp!52528 () Bool)

(declare-fun e!485427 () Bool)

(assert (=> mapNonEmpty!27329 (= mapRes!27329 (and tp!52528 e!485427))))

(declare-fun mapRest!27329 () (Array (_ BitVec 32) ValueCell!8137))

(declare-fun mapValue!27329 () ValueCell!8137)

(declare-fun mapKey!27329 () (_ BitVec 32))

(assert (=> mapNonEmpty!27329 (= (arr!24253 _values!688) (store mapRest!27329 mapKey!27329 mapValue!27329))))

(declare-fun b!871838 () Bool)

(declare-fun res!592606 () Bool)

(assert (=> b!871838 (=> (not res!592606) (not e!485426))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871838 (= res!592606 (validMask!0 mask!1196))))

(declare-fun b!871839 () Bool)

(declare-fun e!485424 () Bool)

(declare-fun tp_is_empty!17153 () Bool)

(assert (=> b!871839 (= e!485424 tp_is_empty!17153)))

(declare-fun b!871840 () Bool)

(declare-fun res!592605 () Bool)

(assert (=> b!871840 (=> (not res!592605) (not e!485426))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871840 (= res!592605 (and (= (size!24693 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24692 _keys!868) (size!24693 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871841 () Bool)

(assert (=> b!871841 (= e!485425 (and e!485424 mapRes!27329))))

(declare-fun condMapEmpty!27329 () Bool)

(declare-fun mapDefault!27329 () ValueCell!8137)

