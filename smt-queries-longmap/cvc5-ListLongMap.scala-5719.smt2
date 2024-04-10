; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74098 () Bool)

(assert start!74098)

(declare-fun b!871797 () Bool)

(declare-fun e!485394 () Bool)

(assert (=> b!871797 (= e!485394 false)))

(declare-fun lt!395539 () Bool)

(declare-datatypes ((array!50434 0))(
  ( (array!50435 (arr!24248 (Array (_ BitVec 32) (_ BitVec 64))) (size!24688 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50434)

(declare-datatypes ((List!17244 0))(
  ( (Nil!17241) (Cons!17240 (h!18371 (_ BitVec 64)) (t!24281 List!17244)) )
))
(declare-fun arrayNoDuplicates!0 (array!50434 (_ BitVec 32) List!17244) Bool)

(assert (=> b!871797 (= lt!395539 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17241))))

(declare-fun mapNonEmpty!27323 () Bool)

(declare-fun mapRes!27323 () Bool)

(declare-fun tp!52522 () Bool)

(declare-fun e!485395 () Bool)

(assert (=> mapNonEmpty!27323 (= mapRes!27323 (and tp!52522 e!485395))))

(declare-fun mapKey!27323 () (_ BitVec 32))

(declare-datatypes ((V!27913 0))(
  ( (V!27914 (val!8622 Int)) )
))
(declare-datatypes ((ValueCell!8135 0))(
  ( (ValueCellFull!8135 (v!11047 V!27913)) (EmptyCell!8135) )
))
(declare-fun mapRest!27323 () (Array (_ BitVec 32) ValueCell!8135))

(declare-fun mapValue!27323 () ValueCell!8135)

(declare-datatypes ((array!50436 0))(
  ( (array!50437 (arr!24249 (Array (_ BitVec 32) ValueCell!8135)) (size!24689 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50436)

(assert (=> mapNonEmpty!27323 (= (arr!24249 _values!688) (store mapRest!27323 mapKey!27323 mapValue!27323))))

(declare-fun b!871798 () Bool)

(declare-fun res!592582 () Bool)

(assert (=> b!871798 (=> (not res!592582) (not e!485394))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50434 (_ BitVec 32)) Bool)

(assert (=> b!871798 (= res!592582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27323 () Bool)

(assert (=> mapIsEmpty!27323 mapRes!27323))

(declare-fun b!871799 () Bool)

(declare-fun e!485397 () Bool)

(declare-fun tp_is_empty!17149 () Bool)

(assert (=> b!871799 (= e!485397 tp_is_empty!17149)))

(declare-fun b!871800 () Bool)

(declare-fun res!592580 () Bool)

(assert (=> b!871800 (=> (not res!592580) (not e!485394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871800 (= res!592580 (validMask!0 mask!1196))))

(declare-fun res!592583 () Bool)

(assert (=> start!74098 (=> (not res!592583) (not e!485394))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74098 (= res!592583 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24688 _keys!868))))))

(assert (=> start!74098 e!485394))

(assert (=> start!74098 true))

(declare-fun array_inv!19144 (array!50434) Bool)

(assert (=> start!74098 (array_inv!19144 _keys!868)))

(declare-fun e!485398 () Bool)

(declare-fun array_inv!19145 (array!50436) Bool)

(assert (=> start!74098 (and (array_inv!19145 _values!688) e!485398)))

(declare-fun b!871796 () Bool)

(assert (=> b!871796 (= e!485395 tp_is_empty!17149)))

(declare-fun b!871801 () Bool)

(assert (=> b!871801 (= e!485398 (and e!485397 mapRes!27323))))

(declare-fun condMapEmpty!27323 () Bool)

(declare-fun mapDefault!27323 () ValueCell!8135)

