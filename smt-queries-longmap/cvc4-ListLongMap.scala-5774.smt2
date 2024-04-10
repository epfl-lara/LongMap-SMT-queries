; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74550 () Bool)

(assert start!74550)

(declare-fun b_free!15239 () Bool)

(declare-fun b_next!15239 () Bool)

(assert (=> start!74550 (= b_free!15239 (not b_next!15239))))

(declare-fun tp!53399 () Bool)

(declare-fun b_and!25115 () Bool)

(assert (=> start!74550 (= tp!53399 b_and!25115)))

(declare-fun mapIsEmpty!27840 () Bool)

(declare-fun mapRes!27840 () Bool)

(assert (=> mapIsEmpty!27840 mapRes!27840))

(declare-fun b!878279 () Bool)

(declare-fun res!596666 () Bool)

(declare-fun e!488828 () Bool)

(assert (=> b!878279 (=> (not res!596666) (not e!488828))))

(declare-datatypes ((array!51092 0))(
  ( (array!51093 (arr!24572 (Array (_ BitVec 32) (_ BitVec 64))) (size!25012 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51092)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51092 (_ BitVec 32)) Bool)

(assert (=> b!878279 (= res!596666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27840 () Bool)

(declare-fun tp!53398 () Bool)

(declare-fun e!488826 () Bool)

(assert (=> mapNonEmpty!27840 (= mapRes!27840 (and tp!53398 e!488826))))

(declare-datatypes ((V!28357 0))(
  ( (V!28358 (val!8789 Int)) )
))
(declare-datatypes ((ValueCell!8302 0))(
  ( (ValueCellFull!8302 (v!11229 V!28357)) (EmptyCell!8302) )
))
(declare-fun mapValue!27840 () ValueCell!8302)

(declare-fun mapKey!27840 () (_ BitVec 32))

(declare-fun mapRest!27840 () (Array (_ BitVec 32) ValueCell!8302))

(declare-datatypes ((array!51094 0))(
  ( (array!51095 (arr!24573 (Array (_ BitVec 32) ValueCell!8302)) (size!25013 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51094)

(assert (=> mapNonEmpty!27840 (= (arr!24573 _values!688) (store mapRest!27840 mapKey!27840 mapValue!27840))))

(declare-fun b!878281 () Bool)

(declare-fun res!596667 () Bool)

(assert (=> b!878281 (=> (not res!596667) (not e!488828))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878281 (= res!596667 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25012 _keys!868))))))

(declare-fun b!878282 () Bool)

(declare-fun res!596670 () Bool)

(assert (=> b!878282 (=> (not res!596670) (not e!488828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878282 (= res!596670 (validMask!0 mask!1196))))

(declare-fun b!878283 () Bool)

(assert (=> b!878283 (= e!488828 false)))

(declare-fun v!557 () V!28357)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11622 0))(
  ( (tuple2!11623 (_1!5822 (_ BitVec 64)) (_2!5822 V!28357)) )
))
(declare-datatypes ((List!17437 0))(
  ( (Nil!17434) (Cons!17433 (h!18564 tuple2!11622) (t!24526 List!17437)) )
))
(declare-datatypes ((ListLongMap!10391 0))(
  ( (ListLongMap!10392 (toList!5211 List!17437)) )
))
(declare-fun lt!397227 () ListLongMap!10391)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28357)

(declare-fun zeroValue!654 () V!28357)

(declare-fun getCurrentListMapNoExtraKeys!3178 (array!51092 array!51094 (_ BitVec 32) (_ BitVec 32) V!28357 V!28357 (_ BitVec 32) Int) ListLongMap!10391)

(assert (=> b!878283 (= lt!397227 (getCurrentListMapNoExtraKeys!3178 _keys!868 (array!51095 (store (arr!24573 _values!688) i!612 (ValueCellFull!8302 v!557)) (size!25013 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397226 () ListLongMap!10391)

(assert (=> b!878283 (= lt!397226 (getCurrentListMapNoExtraKeys!3178 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878284 () Bool)

(declare-fun res!596669 () Bool)

(assert (=> b!878284 (=> (not res!596669) (not e!488828))))

(assert (=> b!878284 (= res!596669 (and (= (size!25013 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25012 _keys!868) (size!25013 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878285 () Bool)

(declare-fun res!596668 () Bool)

(assert (=> b!878285 (=> (not res!596668) (not e!488828))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878285 (= res!596668 (validKeyInArray!0 k!854))))

(declare-fun b!878286 () Bool)

(declare-fun res!596672 () Bool)

(assert (=> b!878286 (=> (not res!596672) (not e!488828))))

(assert (=> b!878286 (= res!596672 (and (= (select (arr!24572 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878287 () Bool)

(declare-fun res!596665 () Bool)

(assert (=> b!878287 (=> (not res!596665) (not e!488828))))

(declare-datatypes ((List!17438 0))(
  ( (Nil!17435) (Cons!17434 (h!18565 (_ BitVec 64)) (t!24527 List!17438)) )
))
(declare-fun arrayNoDuplicates!0 (array!51092 (_ BitVec 32) List!17438) Bool)

(assert (=> b!878287 (= res!596665 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17435))))

(declare-fun res!596671 () Bool)

(assert (=> start!74550 (=> (not res!596671) (not e!488828))))

(assert (=> start!74550 (= res!596671 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25012 _keys!868))))))

(assert (=> start!74550 e!488828))

(declare-fun tp_is_empty!17483 () Bool)

(assert (=> start!74550 tp_is_empty!17483))

(assert (=> start!74550 true))

(assert (=> start!74550 tp!53399))

(declare-fun array_inv!19368 (array!51092) Bool)

(assert (=> start!74550 (array_inv!19368 _keys!868)))

(declare-fun e!488830 () Bool)

(declare-fun array_inv!19369 (array!51094) Bool)

(assert (=> start!74550 (and (array_inv!19369 _values!688) e!488830)))

(declare-fun b!878280 () Bool)

(declare-fun e!488829 () Bool)

(assert (=> b!878280 (= e!488829 tp_is_empty!17483)))

(declare-fun b!878288 () Bool)

(assert (=> b!878288 (= e!488826 tp_is_empty!17483)))

(declare-fun b!878289 () Bool)

(assert (=> b!878289 (= e!488830 (and e!488829 mapRes!27840))))

(declare-fun condMapEmpty!27840 () Bool)

(declare-fun mapDefault!27840 () ValueCell!8302)

