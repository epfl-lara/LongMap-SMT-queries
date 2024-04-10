; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74138 () Bool)

(assert start!74138)

(declare-fun b!872152 () Bool)

(declare-fun e!485635 () Bool)

(declare-fun tp_is_empty!17177 () Bool)

(assert (=> b!872152 (= e!485635 tp_is_empty!17177)))

(declare-fun mapIsEmpty!27368 () Bool)

(declare-fun mapRes!27368 () Bool)

(assert (=> mapIsEmpty!27368 mapRes!27368))

(declare-fun b!872153 () Bool)

(declare-fun res!592792 () Bool)

(declare-fun e!485633 () Bool)

(assert (=> b!872153 (=> (not res!592792) (not e!485633))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872153 (= res!592792 (validMask!0 mask!1196))))

(declare-fun b!872154 () Bool)

(declare-fun e!485634 () Bool)

(assert (=> b!872154 (= e!485634 tp_is_empty!17177)))

(declare-fun b!872155 () Bool)

(declare-fun res!592790 () Bool)

(assert (=> b!872155 (=> (not res!592790) (not e!485633))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50488 0))(
  ( (array!50489 (arr!24274 (Array (_ BitVec 32) (_ BitVec 64))) (size!24714 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50488)

(declare-datatypes ((V!27949 0))(
  ( (V!27950 (val!8636 Int)) )
))
(declare-datatypes ((ValueCell!8149 0))(
  ( (ValueCellFull!8149 (v!11061 V!27949)) (EmptyCell!8149) )
))
(declare-datatypes ((array!50490 0))(
  ( (array!50491 (arr!24275 (Array (_ BitVec 32) ValueCell!8149)) (size!24715 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50490)

(assert (=> b!872155 (= res!592790 (and (= (size!24715 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24714 _keys!868) (size!24715 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592791 () Bool)

(assert (=> start!74138 (=> (not res!592791) (not e!485633))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74138 (= res!592791 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24714 _keys!868))))))

(assert (=> start!74138 e!485633))

(assert (=> start!74138 true))

(declare-fun array_inv!19166 (array!50488) Bool)

(assert (=> start!74138 (array_inv!19166 _keys!868)))

(declare-fun e!485632 () Bool)

(declare-fun array_inv!19167 (array!50490) Bool)

(assert (=> start!74138 (and (array_inv!19167 _values!688) e!485632)))

(declare-fun b!872156 () Bool)

(assert (=> b!872156 (= e!485632 (and e!485635 mapRes!27368))))

(declare-fun condMapEmpty!27368 () Bool)

(declare-fun mapDefault!27368 () ValueCell!8149)

