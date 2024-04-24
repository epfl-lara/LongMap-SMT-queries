; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74164 () Bool)

(assert start!74164)

(declare-fun b_free!14911 () Bool)

(declare-fun b_next!14911 () Bool)

(assert (=> start!74164 (= b_free!14911 (not b_next!14911))))

(declare-fun tp!52238 () Bool)

(declare-fun b_and!24673 () Bool)

(assert (=> start!74164 (= tp!52238 b_and!24673)))

(declare-fun b!870954 () Bool)

(declare-fun res!591661 () Bool)

(declare-fun e!485079 () Bool)

(assert (=> b!870954 (=> (not res!591661) (not e!485079))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50297 0))(
  ( (array!50298 (arr!24175 (Array (_ BitVec 32) (_ BitVec 64))) (size!24616 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50297)

(assert (=> b!870954 (= res!591661 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24616 _keys!868))))))

(declare-fun mapIsEmpty!27170 () Bool)

(declare-fun mapRes!27170 () Bool)

(assert (=> mapIsEmpty!27170 mapRes!27170))

(declare-fun b!870955 () Bool)

(declare-fun e!485081 () Bool)

(declare-fun tp_is_empty!17047 () Bool)

(assert (=> b!870955 (= e!485081 tp_is_empty!17047)))

(declare-fun b!870956 () Bool)

(declare-fun e!485083 () Bool)

(assert (=> b!870956 (= e!485079 e!485083)))

(declare-fun res!591662 () Bool)

(assert (=> b!870956 (=> (not res!591662) (not e!485083))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870956 (= res!591662 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27777 0))(
  ( (V!27778 (val!8571 Int)) )
))
(declare-datatypes ((tuple2!11314 0))(
  ( (tuple2!11315 (_1!5668 (_ BitVec 64)) (_2!5668 V!27777)) )
))
(declare-datatypes ((List!17133 0))(
  ( (Nil!17130) (Cons!17129 (h!18266 tuple2!11314) (t!24162 List!17133)) )
))
(declare-datatypes ((ListLongMap!10085 0))(
  ( (ListLongMap!10086 (toList!5058 List!17133)) )
))
(declare-fun lt!395366 () ListLongMap!10085)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8084 0))(
  ( (ValueCellFull!8084 (v!10996 V!27777)) (EmptyCell!8084) )
))
(declare-datatypes ((array!50299 0))(
  ( (array!50300 (arr!24176 (Array (_ BitVec 32) ValueCell!8084)) (size!24617 (_ BitVec 32))) )
))
(declare-fun lt!395367 () array!50299)

(declare-fun minValue!654 () V!27777)

(declare-fun zeroValue!654 () V!27777)

(declare-fun getCurrentListMapNoExtraKeys!3102 (array!50297 array!50299 (_ BitVec 32) (_ BitVec 32) V!27777 V!27777 (_ BitVec 32) Int) ListLongMap!10085)

(assert (=> b!870956 (= lt!395366 (getCurrentListMapNoExtraKeys!3102 _keys!868 lt!395367 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27777)

(declare-fun _values!688 () array!50299)

(assert (=> b!870956 (= lt!395367 (array!50300 (store (arr!24176 _values!688) i!612 (ValueCellFull!8084 v!557)) (size!24617 _values!688)))))

(declare-fun lt!395369 () ListLongMap!10085)

(assert (=> b!870956 (= lt!395369 (getCurrentListMapNoExtraKeys!3102 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870957 () Bool)

(declare-fun e!485080 () Bool)

(assert (=> b!870957 (= e!485080 (and e!485081 mapRes!27170))))

(declare-fun condMapEmpty!27170 () Bool)

(declare-fun mapDefault!27170 () ValueCell!8084)

(assert (=> b!870957 (= condMapEmpty!27170 (= (arr!24176 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8084)) mapDefault!27170)))))

(declare-fun b!870959 () Bool)

(declare-fun res!591664 () Bool)

(assert (=> b!870959 (=> (not res!591664) (not e!485079))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870959 (= res!591664 (validKeyInArray!0 k0!854))))

(declare-fun b!870960 () Bool)

(declare-fun res!591656 () Bool)

(assert (=> b!870960 (=> (not res!591656) (not e!485079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870960 (= res!591656 (validMask!0 mask!1196))))

(declare-fun b!870961 () Bool)

(assert (=> b!870961 (= e!485083 (not true))))

(declare-fun +!2451 (ListLongMap!10085 tuple2!11314) ListLongMap!10085)

(assert (=> b!870961 (= (getCurrentListMapNoExtraKeys!3102 _keys!868 lt!395367 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2451 (getCurrentListMapNoExtraKeys!3102 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11315 k0!854 v!557)))))

(declare-datatypes ((Unit!29852 0))(
  ( (Unit!29853) )
))
(declare-fun lt!395368 () Unit!29852)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 (array!50297 array!50299 (_ BitVec 32) (_ BitVec 32) V!27777 V!27777 (_ BitVec 32) (_ BitVec 64) V!27777 (_ BitVec 32) Int) Unit!29852)

(assert (=> b!870961 (= lt!395368 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27170 () Bool)

(declare-fun tp!52237 () Bool)

(declare-fun e!485078 () Bool)

(assert (=> mapNonEmpty!27170 (= mapRes!27170 (and tp!52237 e!485078))))

(declare-fun mapKey!27170 () (_ BitVec 32))

(declare-fun mapValue!27170 () ValueCell!8084)

(declare-fun mapRest!27170 () (Array (_ BitVec 32) ValueCell!8084))

(assert (=> mapNonEmpty!27170 (= (arr!24176 _values!688) (store mapRest!27170 mapKey!27170 mapValue!27170))))

(declare-fun b!870962 () Bool)

(declare-fun res!591663 () Bool)

(assert (=> b!870962 (=> (not res!591663) (not e!485079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50297 (_ BitVec 32)) Bool)

(assert (=> b!870962 (= res!591663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870963 () Bool)

(assert (=> b!870963 (= e!485078 tp_is_empty!17047)))

(declare-fun b!870964 () Bool)

(declare-fun res!591657 () Bool)

(assert (=> b!870964 (=> (not res!591657) (not e!485079))))

(assert (=> b!870964 (= res!591657 (and (= (size!24617 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24616 _keys!868) (size!24617 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870965 () Bool)

(declare-fun res!591660 () Bool)

(assert (=> b!870965 (=> (not res!591660) (not e!485079))))

(declare-datatypes ((List!17134 0))(
  ( (Nil!17131) (Cons!17130 (h!18267 (_ BitVec 64)) (t!24163 List!17134)) )
))
(declare-fun arrayNoDuplicates!0 (array!50297 (_ BitVec 32) List!17134) Bool)

(assert (=> b!870965 (= res!591660 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17131))))

(declare-fun b!870958 () Bool)

(declare-fun res!591658 () Bool)

(assert (=> b!870958 (=> (not res!591658) (not e!485079))))

(assert (=> b!870958 (= res!591658 (and (= (select (arr!24175 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!591659 () Bool)

(assert (=> start!74164 (=> (not res!591659) (not e!485079))))

(assert (=> start!74164 (= res!591659 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24616 _keys!868))))))

(assert (=> start!74164 e!485079))

(assert (=> start!74164 tp_is_empty!17047))

(assert (=> start!74164 true))

(assert (=> start!74164 tp!52238))

(declare-fun array_inv!19148 (array!50297) Bool)

(assert (=> start!74164 (array_inv!19148 _keys!868)))

(declare-fun array_inv!19149 (array!50299) Bool)

(assert (=> start!74164 (and (array_inv!19149 _values!688) e!485080)))

(assert (= (and start!74164 res!591659) b!870960))

(assert (= (and b!870960 res!591656) b!870964))

(assert (= (and b!870964 res!591657) b!870962))

(assert (= (and b!870962 res!591663) b!870965))

(assert (= (and b!870965 res!591660) b!870954))

(assert (= (and b!870954 res!591661) b!870959))

(assert (= (and b!870959 res!591664) b!870958))

(assert (= (and b!870958 res!591658) b!870956))

(assert (= (and b!870956 res!591662) b!870961))

(assert (= (and b!870957 condMapEmpty!27170) mapIsEmpty!27170))

(assert (= (and b!870957 (not condMapEmpty!27170)) mapNonEmpty!27170))

(get-info :version)

(assert (= (and mapNonEmpty!27170 ((_ is ValueCellFull!8084) mapValue!27170)) b!870963))

(assert (= (and b!870957 ((_ is ValueCellFull!8084) mapDefault!27170)) b!870955))

(assert (= start!74164 b!870957))

(declare-fun m!812777 () Bool)

(assert (=> start!74164 m!812777))

(declare-fun m!812779 () Bool)

(assert (=> start!74164 m!812779))

(declare-fun m!812781 () Bool)

(assert (=> mapNonEmpty!27170 m!812781))

(declare-fun m!812783 () Bool)

(assert (=> b!870965 m!812783))

(declare-fun m!812785 () Bool)

(assert (=> b!870958 m!812785))

(declare-fun m!812787 () Bool)

(assert (=> b!870959 m!812787))

(declare-fun m!812789 () Bool)

(assert (=> b!870956 m!812789))

(declare-fun m!812791 () Bool)

(assert (=> b!870956 m!812791))

(declare-fun m!812793 () Bool)

(assert (=> b!870956 m!812793))

(declare-fun m!812795 () Bool)

(assert (=> b!870961 m!812795))

(declare-fun m!812797 () Bool)

(assert (=> b!870961 m!812797))

(assert (=> b!870961 m!812797))

(declare-fun m!812799 () Bool)

(assert (=> b!870961 m!812799))

(declare-fun m!812801 () Bool)

(assert (=> b!870961 m!812801))

(declare-fun m!812803 () Bool)

(assert (=> b!870960 m!812803))

(declare-fun m!812805 () Bool)

(assert (=> b!870962 m!812805))

(check-sat (not b!870962) (not mapNonEmpty!27170) (not b!870956) (not b!870965) tp_is_empty!17047 (not b!870960) (not b_next!14911) (not b!870959) (not start!74164) b_and!24673 (not b!870961))
(check-sat b_and!24673 (not b_next!14911))
