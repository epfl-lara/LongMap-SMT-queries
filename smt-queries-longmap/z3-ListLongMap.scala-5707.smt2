; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74028 () Bool)

(assert start!74028)

(declare-fun b_free!14943 () Bool)

(declare-fun b_next!14943 () Bool)

(assert (=> start!74028 (= b_free!14943 (not b_next!14943))))

(declare-fun tp!52332 () Bool)

(declare-fun b_and!24695 () Bool)

(assert (=> start!74028 (= tp!52332 b_and!24695)))

(declare-fun b!870627 () Bool)

(declare-fun res!591748 () Bool)

(declare-fun e!484784 () Bool)

(assert (=> b!870627 (=> (not res!591748) (not e!484784))))

(declare-datatypes ((array!50302 0))(
  ( (array!50303 (arr!24182 (Array (_ BitVec 32) (_ BitVec 64))) (size!24622 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50302)

(declare-datatypes ((List!17199 0))(
  ( (Nil!17196) (Cons!17195 (h!18326 (_ BitVec 64)) (t!24236 List!17199)) )
))
(declare-fun arrayNoDuplicates!0 (array!50302 (_ BitVec 32) List!17199) Bool)

(assert (=> b!870627 (= res!591748 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17196))))

(declare-fun mapIsEmpty!27218 () Bool)

(declare-fun mapRes!27218 () Bool)

(assert (=> mapIsEmpty!27218 mapRes!27218))

(declare-fun b!870629 () Bool)

(declare-fun res!591746 () Bool)

(assert (=> b!870629 (=> (not res!591746) (not e!484784))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27819 0))(
  ( (V!27820 (val!8587 Int)) )
))
(declare-datatypes ((ValueCell!8100 0))(
  ( (ValueCellFull!8100 (v!11012 V!27819)) (EmptyCell!8100) )
))
(declare-datatypes ((array!50304 0))(
  ( (array!50305 (arr!24183 (Array (_ BitVec 32) ValueCell!8100)) (size!24623 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50304)

(assert (=> b!870629 (= res!591746 (and (= (size!24623 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24622 _keys!868) (size!24623 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870630 () Bool)

(declare-fun res!591751 () Bool)

(assert (=> b!870630 (=> (not res!591751) (not e!484784))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870630 (= res!591751 (validKeyInArray!0 k0!854))))

(declare-fun b!870631 () Bool)

(declare-fun res!591750 () Bool)

(assert (=> b!870631 (=> (not res!591750) (not e!484784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50302 (_ BitVec 32)) Bool)

(assert (=> b!870631 (= res!591750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870632 () Bool)

(declare-fun res!591752 () Bool)

(assert (=> b!870632 (=> (not res!591752) (not e!484784))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870632 (= res!591752 (and (= (select (arr!24182 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870633 () Bool)

(declare-fun e!484788 () Bool)

(assert (=> b!870633 (= e!484784 e!484788)))

(declare-fun res!591747 () Bool)

(assert (=> b!870633 (=> (not res!591747) (not e!484788))))

(assert (=> b!870633 (= res!591747 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11408 0))(
  ( (tuple2!11409 (_1!5715 (_ BitVec 64)) (_2!5715 V!27819)) )
))
(declare-datatypes ((List!17200 0))(
  ( (Nil!17197) (Cons!17196 (h!18327 tuple2!11408) (t!24237 List!17200)) )
))
(declare-datatypes ((ListLongMap!10177 0))(
  ( (ListLongMap!10178 (toList!5104 List!17200)) )
))
(declare-fun lt!395197 () ListLongMap!10177)

(declare-fun lt!395199 () array!50304)

(declare-fun minValue!654 () V!27819)

(declare-fun zeroValue!654 () V!27819)

(declare-fun getCurrentListMapNoExtraKeys!3073 (array!50302 array!50304 (_ BitVec 32) (_ BitVec 32) V!27819 V!27819 (_ BitVec 32) Int) ListLongMap!10177)

(assert (=> b!870633 (= lt!395197 (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!395199 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27819)

(assert (=> b!870633 (= lt!395199 (array!50305 (store (arr!24183 _values!688) i!612 (ValueCellFull!8100 v!557)) (size!24623 _values!688)))))

(declare-fun lt!395198 () ListLongMap!10177)

(assert (=> b!870633 (= lt!395198 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27218 () Bool)

(declare-fun tp!52333 () Bool)

(declare-fun e!484789 () Bool)

(assert (=> mapNonEmpty!27218 (= mapRes!27218 (and tp!52333 e!484789))))

(declare-fun mapRest!27218 () (Array (_ BitVec 32) ValueCell!8100))

(declare-fun mapKey!27218 () (_ BitVec 32))

(declare-fun mapValue!27218 () ValueCell!8100)

(assert (=> mapNonEmpty!27218 (= (arr!24183 _values!688) (store mapRest!27218 mapKey!27218 mapValue!27218))))

(declare-fun b!870634 () Bool)

(declare-fun tp_is_empty!17079 () Bool)

(assert (=> b!870634 (= e!484789 tp_is_empty!17079)))

(declare-fun b!870635 () Bool)

(declare-fun res!591749 () Bool)

(assert (=> b!870635 (=> (not res!591749) (not e!484784))))

(assert (=> b!870635 (= res!591749 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24622 _keys!868))))))

(declare-fun b!870636 () Bool)

(declare-fun res!591745 () Bool)

(assert (=> b!870636 (=> (not res!591745) (not e!484784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870636 (= res!591745 (validMask!0 mask!1196))))

(declare-fun res!591744 () Bool)

(assert (=> start!74028 (=> (not res!591744) (not e!484784))))

(assert (=> start!74028 (= res!591744 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24622 _keys!868))))))

(assert (=> start!74028 e!484784))

(assert (=> start!74028 tp_is_empty!17079))

(assert (=> start!74028 true))

(assert (=> start!74028 tp!52332))

(declare-fun array_inv!19096 (array!50302) Bool)

(assert (=> start!74028 (array_inv!19096 _keys!868)))

(declare-fun e!484787 () Bool)

(declare-fun array_inv!19097 (array!50304) Bool)

(assert (=> start!74028 (and (array_inv!19097 _values!688) e!484787)))

(declare-fun b!870628 () Bool)

(assert (=> b!870628 (= e!484788 (not true))))

(declare-fun +!2441 (ListLongMap!10177 tuple2!11408) ListLongMap!10177)

(assert (=> b!870628 (= (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!395199 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2441 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11409 k0!854 v!557)))))

(declare-datatypes ((Unit!29880 0))(
  ( (Unit!29881) )
))
(declare-fun lt!395200 () Unit!29880)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!635 (array!50302 array!50304 (_ BitVec 32) (_ BitVec 32) V!27819 V!27819 (_ BitVec 32) (_ BitVec 64) V!27819 (_ BitVec 32) Int) Unit!29880)

(assert (=> b!870628 (= lt!395200 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!635 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870637 () Bool)

(declare-fun e!484785 () Bool)

(assert (=> b!870637 (= e!484787 (and e!484785 mapRes!27218))))

(declare-fun condMapEmpty!27218 () Bool)

(declare-fun mapDefault!27218 () ValueCell!8100)

(assert (=> b!870637 (= condMapEmpty!27218 (= (arr!24183 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8100)) mapDefault!27218)))))

(declare-fun b!870638 () Bool)

(assert (=> b!870638 (= e!484785 tp_is_empty!17079)))

(assert (= (and start!74028 res!591744) b!870636))

(assert (= (and b!870636 res!591745) b!870629))

(assert (= (and b!870629 res!591746) b!870631))

(assert (= (and b!870631 res!591750) b!870627))

(assert (= (and b!870627 res!591748) b!870635))

(assert (= (and b!870635 res!591749) b!870630))

(assert (= (and b!870630 res!591751) b!870632))

(assert (= (and b!870632 res!591752) b!870633))

(assert (= (and b!870633 res!591747) b!870628))

(assert (= (and b!870637 condMapEmpty!27218) mapIsEmpty!27218))

(assert (= (and b!870637 (not condMapEmpty!27218)) mapNonEmpty!27218))

(get-info :version)

(assert (= (and mapNonEmpty!27218 ((_ is ValueCellFull!8100) mapValue!27218)) b!870634))

(assert (= (and b!870637 ((_ is ValueCellFull!8100) mapDefault!27218)) b!870638))

(assert (= start!74028 b!870637))

(declare-fun m!811967 () Bool)

(assert (=> b!870631 m!811967))

(declare-fun m!811969 () Bool)

(assert (=> b!870632 m!811969))

(declare-fun m!811971 () Bool)

(assert (=> b!870633 m!811971))

(declare-fun m!811973 () Bool)

(assert (=> b!870633 m!811973))

(declare-fun m!811975 () Bool)

(assert (=> b!870633 m!811975))

(declare-fun m!811977 () Bool)

(assert (=> b!870630 m!811977))

(declare-fun m!811979 () Bool)

(assert (=> b!870628 m!811979))

(declare-fun m!811981 () Bool)

(assert (=> b!870628 m!811981))

(assert (=> b!870628 m!811981))

(declare-fun m!811983 () Bool)

(assert (=> b!870628 m!811983))

(declare-fun m!811985 () Bool)

(assert (=> b!870628 m!811985))

(declare-fun m!811987 () Bool)

(assert (=> b!870636 m!811987))

(declare-fun m!811989 () Bool)

(assert (=> start!74028 m!811989))

(declare-fun m!811991 () Bool)

(assert (=> start!74028 m!811991))

(declare-fun m!811993 () Bool)

(assert (=> b!870627 m!811993))

(declare-fun m!811995 () Bool)

(assert (=> mapNonEmpty!27218 m!811995))

(check-sat (not b!870628) (not mapNonEmpty!27218) tp_is_empty!17079 (not b!870633) (not b!870631) (not b!870627) b_and!24695 (not start!74028) (not b_next!14943) (not b!870630) (not b!870636))
(check-sat b_and!24695 (not b_next!14943))
