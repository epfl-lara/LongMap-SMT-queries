; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74052 () Bool)

(assert start!74052)

(declare-fun b_free!14967 () Bool)

(declare-fun b_next!14967 () Bool)

(assert (=> start!74052 (= b_free!14967 (not b_next!14967))))

(declare-fun tp!52404 () Bool)

(declare-fun b_and!24719 () Bool)

(assert (=> start!74052 (= tp!52404 b_and!24719)))

(declare-fun b!871059 () Bool)

(declare-fun e!485003 () Bool)

(declare-fun e!485001 () Bool)

(declare-fun mapRes!27254 () Bool)

(assert (=> b!871059 (= e!485003 (and e!485001 mapRes!27254))))

(declare-fun condMapEmpty!27254 () Bool)

(declare-datatypes ((V!27851 0))(
  ( (V!27852 (val!8599 Int)) )
))
(declare-datatypes ((ValueCell!8112 0))(
  ( (ValueCellFull!8112 (v!11024 V!27851)) (EmptyCell!8112) )
))
(declare-datatypes ((array!50348 0))(
  ( (array!50349 (arr!24205 (Array (_ BitVec 32) ValueCell!8112)) (size!24645 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50348)

(declare-fun mapDefault!27254 () ValueCell!8112)

(assert (=> b!871059 (= condMapEmpty!27254 (= (arr!24205 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8112)) mapDefault!27254)))))

(declare-fun b!871060 () Bool)

(declare-fun e!485004 () Bool)

(assert (=> b!871060 (= e!485004 (not true))))

(declare-fun v!557 () V!27851)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50350 0))(
  ( (array!50351 (arr!24206 (Array (_ BitVec 32) (_ BitVec 64))) (size!24646 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50350)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!395342 () array!50348)

(declare-fun minValue!654 () V!27851)

(declare-fun zeroValue!654 () V!27851)

(declare-datatypes ((tuple2!11426 0))(
  ( (tuple2!11427 (_1!5724 (_ BitVec 64)) (_2!5724 V!27851)) )
))
(declare-datatypes ((List!17213 0))(
  ( (Nil!17210) (Cons!17209 (h!18340 tuple2!11426) (t!24250 List!17213)) )
))
(declare-datatypes ((ListLongMap!10195 0))(
  ( (ListLongMap!10196 (toList!5113 List!17213)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3082 (array!50350 array!50348 (_ BitVec 32) (_ BitVec 32) V!27851 V!27851 (_ BitVec 32) Int) ListLongMap!10195)

(declare-fun +!2449 (ListLongMap!10195 tuple2!11426) ListLongMap!10195)

(assert (=> b!871060 (= (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!395342 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2449 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11427 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29896 0))(
  ( (Unit!29897) )
))
(declare-fun lt!395341 () Unit!29896)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 (array!50350 array!50348 (_ BitVec 32) (_ BitVec 32) V!27851 V!27851 (_ BitVec 32) (_ BitVec 64) V!27851 (_ BitVec 32) Int) Unit!29896)

(assert (=> b!871060 (= lt!395341 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27254 () Bool)

(assert (=> mapIsEmpty!27254 mapRes!27254))

(declare-fun b!871062 () Bool)

(declare-fun res!592074 () Bool)

(declare-fun e!485002 () Bool)

(assert (=> b!871062 (=> (not res!592074) (not e!485002))))

(declare-datatypes ((List!17214 0))(
  ( (Nil!17211) (Cons!17210 (h!18341 (_ BitVec 64)) (t!24251 List!17214)) )
))
(declare-fun arrayNoDuplicates!0 (array!50350 (_ BitVec 32) List!17214) Bool)

(assert (=> b!871062 (= res!592074 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17211))))

(declare-fun b!871063 () Bool)

(declare-fun tp_is_empty!17103 () Bool)

(assert (=> b!871063 (= e!485001 tp_is_empty!17103)))

(declare-fun b!871064 () Bool)

(assert (=> b!871064 (= e!485002 e!485004)))

(declare-fun res!592070 () Bool)

(assert (=> b!871064 (=> (not res!592070) (not e!485004))))

(assert (=> b!871064 (= res!592070 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395343 () ListLongMap!10195)

(assert (=> b!871064 (= lt!395343 (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!395342 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871064 (= lt!395342 (array!50349 (store (arr!24205 _values!688) i!612 (ValueCellFull!8112 v!557)) (size!24645 _values!688)))))

(declare-fun lt!395344 () ListLongMap!10195)

(assert (=> b!871064 (= lt!395344 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871065 () Bool)

(declare-fun res!592072 () Bool)

(assert (=> b!871065 (=> (not res!592072) (not e!485002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871065 (= res!592072 (validKeyInArray!0 k0!854))))

(declare-fun res!592075 () Bool)

(assert (=> start!74052 (=> (not res!592075) (not e!485002))))

(assert (=> start!74052 (= res!592075 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24646 _keys!868))))))

(assert (=> start!74052 e!485002))

(assert (=> start!74052 tp_is_empty!17103))

(assert (=> start!74052 true))

(assert (=> start!74052 tp!52404))

(declare-fun array_inv!19114 (array!50350) Bool)

(assert (=> start!74052 (array_inv!19114 _keys!868)))

(declare-fun array_inv!19115 (array!50348) Bool)

(assert (=> start!74052 (and (array_inv!19115 _values!688) e!485003)))

(declare-fun b!871061 () Bool)

(declare-fun res!592073 () Bool)

(assert (=> b!871061 (=> (not res!592073) (not e!485002))))

(assert (=> b!871061 (= res!592073 (and (= (select (arr!24206 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871066 () Bool)

(declare-fun res!592076 () Bool)

(assert (=> b!871066 (=> (not res!592076) (not e!485002))))

(assert (=> b!871066 (= res!592076 (and (= (size!24645 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24646 _keys!868) (size!24645 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871067 () Bool)

(declare-fun e!485000 () Bool)

(assert (=> b!871067 (= e!485000 tp_is_empty!17103)))

(declare-fun b!871068 () Bool)

(declare-fun res!592071 () Bool)

(assert (=> b!871068 (=> (not res!592071) (not e!485002))))

(assert (=> b!871068 (= res!592071 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24646 _keys!868))))))

(declare-fun b!871069 () Bool)

(declare-fun res!592069 () Bool)

(assert (=> b!871069 (=> (not res!592069) (not e!485002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871069 (= res!592069 (validMask!0 mask!1196))))

(declare-fun b!871070 () Bool)

(declare-fun res!592068 () Bool)

(assert (=> b!871070 (=> (not res!592068) (not e!485002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50350 (_ BitVec 32)) Bool)

(assert (=> b!871070 (= res!592068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27254 () Bool)

(declare-fun tp!52405 () Bool)

(assert (=> mapNonEmpty!27254 (= mapRes!27254 (and tp!52405 e!485000))))

(declare-fun mapKey!27254 () (_ BitVec 32))

(declare-fun mapRest!27254 () (Array (_ BitVec 32) ValueCell!8112))

(declare-fun mapValue!27254 () ValueCell!8112)

(assert (=> mapNonEmpty!27254 (= (arr!24205 _values!688) (store mapRest!27254 mapKey!27254 mapValue!27254))))

(assert (= (and start!74052 res!592075) b!871069))

(assert (= (and b!871069 res!592069) b!871066))

(assert (= (and b!871066 res!592076) b!871070))

(assert (= (and b!871070 res!592068) b!871062))

(assert (= (and b!871062 res!592074) b!871068))

(assert (= (and b!871068 res!592071) b!871065))

(assert (= (and b!871065 res!592072) b!871061))

(assert (= (and b!871061 res!592073) b!871064))

(assert (= (and b!871064 res!592070) b!871060))

(assert (= (and b!871059 condMapEmpty!27254) mapIsEmpty!27254))

(assert (= (and b!871059 (not condMapEmpty!27254)) mapNonEmpty!27254))

(get-info :version)

(assert (= (and mapNonEmpty!27254 ((_ is ValueCellFull!8112) mapValue!27254)) b!871067))

(assert (= (and b!871059 ((_ is ValueCellFull!8112) mapDefault!27254)) b!871063))

(assert (= start!74052 b!871059))

(declare-fun m!812327 () Bool)

(assert (=> b!871065 m!812327))

(declare-fun m!812329 () Bool)

(assert (=> b!871061 m!812329))

(declare-fun m!812331 () Bool)

(assert (=> b!871062 m!812331))

(declare-fun m!812333 () Bool)

(assert (=> b!871070 m!812333))

(declare-fun m!812335 () Bool)

(assert (=> b!871069 m!812335))

(declare-fun m!812337 () Bool)

(assert (=> b!871060 m!812337))

(declare-fun m!812339 () Bool)

(assert (=> b!871060 m!812339))

(assert (=> b!871060 m!812339))

(declare-fun m!812341 () Bool)

(assert (=> b!871060 m!812341))

(declare-fun m!812343 () Bool)

(assert (=> b!871060 m!812343))

(declare-fun m!812345 () Bool)

(assert (=> start!74052 m!812345))

(declare-fun m!812347 () Bool)

(assert (=> start!74052 m!812347))

(declare-fun m!812349 () Bool)

(assert (=> mapNonEmpty!27254 m!812349))

(declare-fun m!812351 () Bool)

(assert (=> b!871064 m!812351))

(declare-fun m!812353 () Bool)

(assert (=> b!871064 m!812353))

(declare-fun m!812355 () Bool)

(assert (=> b!871064 m!812355))

(check-sat (not b!871064) (not b!871069) (not b_next!14967) (not b!871060) (not b!871065) (not start!74052) (not b!871070) b_and!24719 (not b!871062) (not mapNonEmpty!27254) tp_is_empty!17103)
(check-sat b_and!24719 (not b_next!14967))
