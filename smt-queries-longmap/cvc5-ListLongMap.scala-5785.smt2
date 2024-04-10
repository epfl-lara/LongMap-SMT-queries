; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74632 () Bool)

(assert start!74632)

(declare-fun b_free!15301 () Bool)

(declare-fun b_next!15301 () Bool)

(assert (=> start!74632 (= b_free!15301 (not b_next!15301))))

(declare-fun tp!53588 () Bool)

(declare-fun b_and!25205 () Bool)

(assert (=> start!74632 (= tp!53588 b_and!25205)))

(declare-fun mapIsEmpty!27936 () Bool)

(declare-fun mapRes!27936 () Bool)

(assert (=> mapIsEmpty!27936 mapRes!27936))

(declare-fun e!489478 () Bool)

(declare-fun b!879547 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51218 0))(
  ( (array!51219 (arr!24634 (Array (_ BitVec 32) (_ BitVec 64))) (size!25074 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51218)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879547 (= e!489478 (or (not (= (select (arr!24634 _keys!868) from!1053) k!854)) (bvslt (size!25074 _keys!868) #b01111111111111111111111111111111)))))

(declare-datatypes ((V!28441 0))(
  ( (V!28442 (val!8820 Int)) )
))
(declare-datatypes ((tuple2!11668 0))(
  ( (tuple2!11669 (_1!5845 (_ BitVec 64)) (_2!5845 V!28441)) )
))
(declare-datatypes ((List!17484 0))(
  ( (Nil!17481) (Cons!17480 (h!18611 tuple2!11668) (t!24587 List!17484)) )
))
(declare-datatypes ((ListLongMap!10437 0))(
  ( (ListLongMap!10438 (toList!5234 List!17484)) )
))
(declare-fun lt!397656 () ListLongMap!10437)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8333 0))(
  ( (ValueCellFull!8333 (v!11264 V!28441)) (EmptyCell!8333) )
))
(declare-datatypes ((array!51220 0))(
  ( (array!51221 (arr!24635 (Array (_ BitVec 32) ValueCell!8333)) (size!25075 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51220)

(declare-fun lt!397657 () ListLongMap!10437)

(declare-fun +!2507 (ListLongMap!10437 tuple2!11668) ListLongMap!10437)

(declare-fun get!12946 (ValueCell!8333 V!28441) V!28441)

(declare-fun dynLambda!1225 (Int (_ BitVec 64)) V!28441)

(assert (=> b!879547 (= lt!397657 (+!2507 lt!397656 (tuple2!11669 (select (arr!24634 _keys!868) from!1053) (get!12946 (select (arr!24635 _values!688) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879548 () Bool)

(declare-fun res!597571 () Bool)

(declare-fun e!489476 () Bool)

(assert (=> b!879548 (=> (not res!597571) (not e!489476))))

(declare-datatypes ((List!17485 0))(
  ( (Nil!17482) (Cons!17481 (h!18612 (_ BitVec 64)) (t!24588 List!17485)) )
))
(declare-fun arrayNoDuplicates!0 (array!51218 (_ BitVec 32) List!17485) Bool)

(assert (=> b!879548 (= res!597571 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17482))))

(declare-fun res!597570 () Bool)

(assert (=> start!74632 (=> (not res!597570) (not e!489476))))

(assert (=> start!74632 (= res!597570 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25074 _keys!868))))))

(assert (=> start!74632 e!489476))

(declare-fun tp_is_empty!17545 () Bool)

(assert (=> start!74632 tp_is_empty!17545))

(assert (=> start!74632 true))

(assert (=> start!74632 tp!53588))

(declare-fun array_inv!19412 (array!51218) Bool)

(assert (=> start!74632 (array_inv!19412 _keys!868)))

(declare-fun e!489480 () Bool)

(declare-fun array_inv!19413 (array!51220) Bool)

(assert (=> start!74632 (and (array_inv!19413 _values!688) e!489480)))

(declare-fun b!879549 () Bool)

(declare-fun res!597567 () Bool)

(assert (=> b!879549 (=> (not res!597567) (not e!489476))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879549 (= res!597567 (validMask!0 mask!1196))))

(declare-fun b!879550 () Bool)

(declare-fun res!597563 () Bool)

(assert (=> b!879550 (=> (not res!597563) (not e!489476))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879550 (= res!597563 (and (= (select (arr!24634 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!879551 () Bool)

(declare-fun res!597564 () Bool)

(assert (=> b!879551 (=> (not res!597564) (not e!489476))))

(assert (=> b!879551 (= res!597564 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25074 _keys!868))))))

(declare-fun b!879552 () Bool)

(declare-fun e!489477 () Bool)

(assert (=> b!879552 (= e!489477 tp_is_empty!17545)))

(declare-fun b!879553 () Bool)

(declare-fun res!597562 () Bool)

(assert (=> b!879553 (=> (not res!597562) (not e!489476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51218 (_ BitVec 32)) Bool)

(assert (=> b!879553 (= res!597562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879554 () Bool)

(declare-fun e!489479 () Bool)

(assert (=> b!879554 (= e!489476 e!489479)))

(declare-fun res!597565 () Bool)

(assert (=> b!879554 (=> (not res!597565) (not e!489479))))

(assert (=> b!879554 (= res!597565 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!397658 () array!51220)

(declare-fun minValue!654 () V!28441)

(declare-fun zeroValue!654 () V!28441)

(declare-fun getCurrentListMapNoExtraKeys!3200 (array!51218 array!51220 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) Int) ListLongMap!10437)

(assert (=> b!879554 (= lt!397657 (getCurrentListMapNoExtraKeys!3200 _keys!868 lt!397658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28441)

(assert (=> b!879554 (= lt!397658 (array!51221 (store (arr!24635 _values!688) i!612 (ValueCellFull!8333 v!557)) (size!25075 _values!688)))))

(declare-fun lt!397654 () ListLongMap!10437)

(assert (=> b!879554 (= lt!397654 (getCurrentListMapNoExtraKeys!3200 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27936 () Bool)

(declare-fun tp!53587 () Bool)

(declare-fun e!489481 () Bool)

(assert (=> mapNonEmpty!27936 (= mapRes!27936 (and tp!53587 e!489481))))

(declare-fun mapValue!27936 () ValueCell!8333)

(declare-fun mapRest!27936 () (Array (_ BitVec 32) ValueCell!8333))

(declare-fun mapKey!27936 () (_ BitVec 32))

(assert (=> mapNonEmpty!27936 (= (arr!24635 _values!688) (store mapRest!27936 mapKey!27936 mapValue!27936))))

(declare-fun b!879555 () Bool)

(assert (=> b!879555 (= e!489479 (not e!489478))))

(declare-fun res!597569 () Bool)

(assert (=> b!879555 (=> res!597569 e!489478)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879555 (= res!597569 (not (validKeyInArray!0 (select (arr!24634 _keys!868) from!1053))))))

(declare-fun lt!397655 () ListLongMap!10437)

(assert (=> b!879555 (= lt!397655 lt!397656)))

(declare-fun lt!397660 () ListLongMap!10437)

(assert (=> b!879555 (= lt!397656 (+!2507 lt!397660 (tuple2!11669 k!854 v!557)))))

(assert (=> b!879555 (= lt!397655 (getCurrentListMapNoExtraKeys!3200 _keys!868 lt!397658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879555 (= lt!397660 (getCurrentListMapNoExtraKeys!3200 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30036 0))(
  ( (Unit!30037) )
))
(declare-fun lt!397659 () Unit!30036)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!700 (array!51218 array!51220 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) (_ BitVec 64) V!28441 (_ BitVec 32) Int) Unit!30036)

(assert (=> b!879555 (= lt!397659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!700 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879556 () Bool)

(assert (=> b!879556 (= e!489481 tp_is_empty!17545)))

(declare-fun b!879557 () Bool)

(declare-fun res!597566 () Bool)

(assert (=> b!879557 (=> (not res!597566) (not e!489476))))

(assert (=> b!879557 (= res!597566 (and (= (size!25075 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25074 _keys!868) (size!25075 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879558 () Bool)

(declare-fun res!597568 () Bool)

(assert (=> b!879558 (=> (not res!597568) (not e!489476))))

(assert (=> b!879558 (= res!597568 (validKeyInArray!0 k!854))))

(declare-fun b!879559 () Bool)

(assert (=> b!879559 (= e!489480 (and e!489477 mapRes!27936))))

(declare-fun condMapEmpty!27936 () Bool)

(declare-fun mapDefault!27936 () ValueCell!8333)

