; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73884 () Bool)

(assert start!73884)

(declare-fun b_free!14799 () Bool)

(declare-fun b_next!14799 () Bool)

(assert (=> start!73884 (= b_free!14799 (not b_next!14799))))

(declare-fun tp!51901 () Bool)

(declare-fun b_and!24551 () Bool)

(assert (=> start!73884 (= tp!51901 b_and!24551)))

(declare-fun mapNonEmpty!27002 () Bool)

(declare-fun mapRes!27002 () Bool)

(declare-fun tp!51900 () Bool)

(declare-fun e!483489 () Bool)

(assert (=> mapNonEmpty!27002 (= mapRes!27002 (and tp!51900 e!483489))))

(declare-datatypes ((V!27627 0))(
  ( (V!27628 (val!8515 Int)) )
))
(declare-datatypes ((ValueCell!8028 0))(
  ( (ValueCellFull!8028 (v!10940 V!27627)) (EmptyCell!8028) )
))
(declare-fun mapValue!27002 () ValueCell!8028)

(declare-fun mapKey!27002 () (_ BitVec 32))

(declare-fun mapRest!27002 () (Array (_ BitVec 32) ValueCell!8028))

(declare-datatypes ((array!50028 0))(
  ( (array!50029 (arr!24045 (Array (_ BitVec 32) ValueCell!8028)) (size!24485 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50028)

(assert (=> mapNonEmpty!27002 (= (arr!24045 _values!688) (store mapRest!27002 mapKey!27002 mapValue!27002))))

(declare-fun b!868035 () Bool)

(declare-fun res!589806 () Bool)

(declare-fun e!483493 () Bool)

(assert (=> b!868035 (=> (not res!589806) (not e!483493))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50030 0))(
  ( (array!50031 (arr!24046 (Array (_ BitVec 32) (_ BitVec 64))) (size!24486 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50030)

(assert (=> b!868035 (= res!589806 (and (= (size!24485 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24486 _keys!868) (size!24485 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868036 () Bool)

(declare-fun res!589808 () Bool)

(assert (=> b!868036 (=> (not res!589808) (not e!483493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868036 (= res!589808 (validMask!0 mask!1196))))

(declare-fun b!868038 () Bool)

(declare-fun res!589805 () Bool)

(assert (=> b!868038 (=> (not res!589805) (not e!483493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50030 (_ BitVec 32)) Bool)

(assert (=> b!868038 (= res!589805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868039 () Bool)

(declare-fun e!483490 () Bool)

(declare-fun tp_is_empty!16935 () Bool)

(assert (=> b!868039 (= e!483490 tp_is_empty!16935)))

(declare-fun mapIsEmpty!27002 () Bool)

(assert (=> mapIsEmpty!27002 mapRes!27002))

(declare-fun res!589800 () Bool)

(assert (=> start!73884 (=> (not res!589800) (not e!483493))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73884 (= res!589800 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24486 _keys!868))))))

(assert (=> start!73884 e!483493))

(assert (=> start!73884 tp_is_empty!16935))

(assert (=> start!73884 true))

(assert (=> start!73884 tp!51901))

(declare-fun array_inv!19000 (array!50030) Bool)

(assert (=> start!73884 (array_inv!19000 _keys!868)))

(declare-fun e!483492 () Bool)

(declare-fun array_inv!19001 (array!50028) Bool)

(assert (=> start!73884 (and (array_inv!19001 _values!688) e!483492)))

(declare-fun b!868037 () Bool)

(declare-fun res!589803 () Bool)

(assert (=> b!868037 (=> (not res!589803) (not e!483493))))

(declare-datatypes ((List!17098 0))(
  ( (Nil!17095) (Cons!17094 (h!18225 (_ BitVec 64)) (t!24135 List!17098)) )
))
(declare-fun arrayNoDuplicates!0 (array!50030 (_ BitVec 32) List!17098) Bool)

(assert (=> b!868037 (= res!589803 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17095))))

(declare-fun b!868040 () Bool)

(declare-fun res!589807 () Bool)

(assert (=> b!868040 (=> (not res!589807) (not e!483493))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868040 (= res!589807 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24486 _keys!868))))))

(declare-fun b!868041 () Bool)

(assert (=> b!868041 (= e!483489 tp_is_empty!16935)))

(declare-fun b!868042 () Bool)

(assert (=> b!868042 (= e!483492 (and e!483490 mapRes!27002))))

(declare-fun condMapEmpty!27002 () Bool)

(declare-fun mapDefault!27002 () ValueCell!8028)

(assert (=> b!868042 (= condMapEmpty!27002 (= (arr!24045 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8028)) mapDefault!27002)))))

(declare-fun b!868043 () Bool)

(declare-fun res!589802 () Bool)

(assert (=> b!868043 (=> (not res!589802) (not e!483493))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868043 (= res!589802 (validKeyInArray!0 k0!854))))

(declare-fun b!868044 () Bool)

(declare-fun res!589801 () Bool)

(assert (=> b!868044 (=> (not res!589801) (not e!483493))))

(assert (=> b!868044 (= res!589801 (and (= (select (arr!24046 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868045 () Bool)

(declare-fun e!483491 () Bool)

(assert (=> b!868045 (= e!483491 (not true))))

(declare-fun lt!394334 () array!50028)

(declare-fun v!557 () V!27627)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27627)

(declare-fun zeroValue!654 () V!27627)

(declare-datatypes ((tuple2!11300 0))(
  ( (tuple2!11301 (_1!5661 (_ BitVec 64)) (_2!5661 V!27627)) )
))
(declare-datatypes ((List!17099 0))(
  ( (Nil!17096) (Cons!17095 (h!18226 tuple2!11300) (t!24136 List!17099)) )
))
(declare-datatypes ((ListLongMap!10069 0))(
  ( (ListLongMap!10070 (toList!5050 List!17099)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3019 (array!50030 array!50028 (_ BitVec 32) (_ BitVec 32) V!27627 V!27627 (_ BitVec 32) Int) ListLongMap!10069)

(declare-fun +!2394 (ListLongMap!10069 tuple2!11300) ListLongMap!10069)

(assert (=> b!868045 (= (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!394334 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2394 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11301 k0!854 v!557)))))

(declare-datatypes ((Unit!29786 0))(
  ( (Unit!29787) )
))
(declare-fun lt!394336 () Unit!29786)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!588 (array!50030 array!50028 (_ BitVec 32) (_ BitVec 32) V!27627 V!27627 (_ BitVec 32) (_ BitVec 64) V!27627 (_ BitVec 32) Int) Unit!29786)

(assert (=> b!868045 (= lt!394336 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!588 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868046 () Bool)

(assert (=> b!868046 (= e!483493 e!483491)))

(declare-fun res!589804 () Bool)

(assert (=> b!868046 (=> (not res!589804) (not e!483491))))

(assert (=> b!868046 (= res!589804 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394333 () ListLongMap!10069)

(assert (=> b!868046 (= lt!394333 (getCurrentListMapNoExtraKeys!3019 _keys!868 lt!394334 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868046 (= lt!394334 (array!50029 (store (arr!24045 _values!688) i!612 (ValueCellFull!8028 v!557)) (size!24485 _values!688)))))

(declare-fun lt!394335 () ListLongMap!10069)

(assert (=> b!868046 (= lt!394335 (getCurrentListMapNoExtraKeys!3019 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73884 res!589800) b!868036))

(assert (= (and b!868036 res!589808) b!868035))

(assert (= (and b!868035 res!589806) b!868038))

(assert (= (and b!868038 res!589805) b!868037))

(assert (= (and b!868037 res!589803) b!868040))

(assert (= (and b!868040 res!589807) b!868043))

(assert (= (and b!868043 res!589802) b!868044))

(assert (= (and b!868044 res!589801) b!868046))

(assert (= (and b!868046 res!589804) b!868045))

(assert (= (and b!868042 condMapEmpty!27002) mapIsEmpty!27002))

(assert (= (and b!868042 (not condMapEmpty!27002)) mapNonEmpty!27002))

(get-info :version)

(assert (= (and mapNonEmpty!27002 ((_ is ValueCellFull!8028) mapValue!27002)) b!868041))

(assert (= (and b!868042 ((_ is ValueCellFull!8028) mapDefault!27002)) b!868039))

(assert (= start!73884 b!868042))

(declare-fun m!809807 () Bool)

(assert (=> mapNonEmpty!27002 m!809807))

(declare-fun m!809809 () Bool)

(assert (=> start!73884 m!809809))

(declare-fun m!809811 () Bool)

(assert (=> start!73884 m!809811))

(declare-fun m!809813 () Bool)

(assert (=> b!868045 m!809813))

(declare-fun m!809815 () Bool)

(assert (=> b!868045 m!809815))

(assert (=> b!868045 m!809815))

(declare-fun m!809817 () Bool)

(assert (=> b!868045 m!809817))

(declare-fun m!809819 () Bool)

(assert (=> b!868045 m!809819))

(declare-fun m!809821 () Bool)

(assert (=> b!868044 m!809821))

(declare-fun m!809823 () Bool)

(assert (=> b!868046 m!809823))

(declare-fun m!809825 () Bool)

(assert (=> b!868046 m!809825))

(declare-fun m!809827 () Bool)

(assert (=> b!868046 m!809827))

(declare-fun m!809829 () Bool)

(assert (=> b!868036 m!809829))

(declare-fun m!809831 () Bool)

(assert (=> b!868038 m!809831))

(declare-fun m!809833 () Bool)

(assert (=> b!868037 m!809833))

(declare-fun m!809835 () Bool)

(assert (=> b!868043 m!809835))

(check-sat b_and!24551 (not start!73884) (not b!868043) (not b!868046) (not b!868038) (not b_next!14799) (not b!868037) (not mapNonEmpty!27002) tp_is_empty!16935 (not b!868036) (not b!868045))
(check-sat b_and!24551 (not b_next!14799))
