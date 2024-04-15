; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74298 () Bool)

(assert start!74298)

(declare-fun b_free!15079 () Bool)

(declare-fun b_next!15079 () Bool)

(assert (=> start!74298 (= b_free!15079 (not b_next!15079))))

(declare-fun tp!52912 () Bool)

(declare-fun b_and!24829 () Bool)

(assert (=> start!74298 (= tp!52912 b_and!24829)))

(declare-fun b!874239 () Bool)

(declare-fun e!486741 () Bool)

(assert (=> b!874239 (= e!486741 false)))

(declare-datatypes ((V!28145 0))(
  ( (V!28146 (val!8709 Int)) )
))
(declare-datatypes ((tuple2!11514 0))(
  ( (tuple2!11515 (_1!5768 (_ BitVec 64)) (_2!5768 V!28145)) )
))
(declare-datatypes ((List!17327 0))(
  ( (Nil!17324) (Cons!17323 (h!18454 tuple2!11514) (t!24359 List!17327)) )
))
(declare-datatypes ((ListLongMap!10273 0))(
  ( (ListLongMap!10274 (toList!5152 List!17327)) )
))
(declare-fun lt!395715 () ListLongMap!10273)

(declare-fun v!557 () V!28145)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50755 0))(
  ( (array!50756 (arr!24406 (Array (_ BitVec 32) (_ BitVec 64))) (size!24848 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50755)

(declare-datatypes ((ValueCell!8222 0))(
  ( (ValueCellFull!8222 (v!11132 V!28145)) (EmptyCell!8222) )
))
(declare-datatypes ((array!50757 0))(
  ( (array!50758 (arr!24407 (Array (_ BitVec 32) ValueCell!8222)) (size!24849 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50757)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28145)

(declare-fun zeroValue!654 () V!28145)

(declare-fun getCurrentListMapNoExtraKeys!3145 (array!50755 array!50757 (_ BitVec 32) (_ BitVec 32) V!28145 V!28145 (_ BitVec 32) Int) ListLongMap!10273)

(assert (=> b!874239 (= lt!395715 (getCurrentListMapNoExtraKeys!3145 _keys!868 (array!50758 (store (arr!24407 _values!688) i!612 (ValueCellFull!8222 v!557)) (size!24849 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395714 () ListLongMap!10273)

(assert (=> b!874239 (= lt!395714 (getCurrentListMapNoExtraKeys!3145 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874240 () Bool)

(declare-fun res!594165 () Bool)

(assert (=> b!874240 (=> (not res!594165) (not e!486741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874240 (= res!594165 (validMask!0 mask!1196))))

(declare-fun b!874241 () Bool)

(declare-fun res!594170 () Bool)

(assert (=> b!874241 (=> (not res!594170) (not e!486741))))

(declare-datatypes ((List!17328 0))(
  ( (Nil!17325) (Cons!17324 (h!18455 (_ BitVec 64)) (t!24360 List!17328)) )
))
(declare-fun arrayNoDuplicates!0 (array!50755 (_ BitVec 32) List!17328) Bool)

(assert (=> b!874241 (= res!594170 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17325))))

(declare-fun b!874242 () Bool)

(declare-fun e!486742 () Bool)

(declare-fun tp_is_empty!17323 () Bool)

(assert (=> b!874242 (= e!486742 tp_is_empty!17323)))

(declare-fun b!874243 () Bool)

(declare-fun res!594168 () Bool)

(assert (=> b!874243 (=> (not res!594168) (not e!486741))))

(assert (=> b!874243 (= res!594168 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24848 _keys!868))))))

(declare-fun res!594172 () Bool)

(assert (=> start!74298 (=> (not res!594172) (not e!486741))))

(assert (=> start!74298 (= res!594172 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24848 _keys!868))))))

(assert (=> start!74298 e!486741))

(assert (=> start!74298 tp_is_empty!17323))

(assert (=> start!74298 true))

(assert (=> start!74298 tp!52912))

(declare-fun array_inv!19304 (array!50755) Bool)

(assert (=> start!74298 (array_inv!19304 _keys!868)))

(declare-fun e!486739 () Bool)

(declare-fun array_inv!19305 (array!50757) Bool)

(assert (=> start!74298 (and (array_inv!19305 _values!688) e!486739)))

(declare-fun b!874244 () Bool)

(declare-fun res!594169 () Bool)

(assert (=> b!874244 (=> (not res!594169) (not e!486741))))

(assert (=> b!874244 (= res!594169 (and (= (size!24849 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24848 _keys!868) (size!24849 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874245 () Bool)

(declare-fun res!594171 () Bool)

(assert (=> b!874245 (=> (not res!594171) (not e!486741))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874245 (= res!594171 (and (= (select (arr!24406 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27593 () Bool)

(declare-fun mapRes!27593 () Bool)

(assert (=> mapIsEmpty!27593 mapRes!27593))

(declare-fun b!874246 () Bool)

(declare-fun e!486740 () Bool)

(assert (=> b!874246 (= e!486739 (and e!486740 mapRes!27593))))

(declare-fun condMapEmpty!27593 () Bool)

(declare-fun mapDefault!27593 () ValueCell!8222)

(assert (=> b!874246 (= condMapEmpty!27593 (= (arr!24407 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8222)) mapDefault!27593)))))

(declare-fun b!874247 () Bool)

(declare-fun res!594167 () Bool)

(assert (=> b!874247 (=> (not res!594167) (not e!486741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50755 (_ BitVec 32)) Bool)

(assert (=> b!874247 (= res!594167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874248 () Bool)

(declare-fun res!594166 () Bool)

(assert (=> b!874248 (=> (not res!594166) (not e!486741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874248 (= res!594166 (validKeyInArray!0 k0!854))))

(declare-fun b!874249 () Bool)

(assert (=> b!874249 (= e!486740 tp_is_empty!17323)))

(declare-fun mapNonEmpty!27593 () Bool)

(declare-fun tp!52913 () Bool)

(assert (=> mapNonEmpty!27593 (= mapRes!27593 (and tp!52913 e!486742))))

(declare-fun mapKey!27593 () (_ BitVec 32))

(declare-fun mapRest!27593 () (Array (_ BitVec 32) ValueCell!8222))

(declare-fun mapValue!27593 () ValueCell!8222)

(assert (=> mapNonEmpty!27593 (= (arr!24407 _values!688) (store mapRest!27593 mapKey!27593 mapValue!27593))))

(assert (= (and start!74298 res!594172) b!874240))

(assert (= (and b!874240 res!594165) b!874244))

(assert (= (and b!874244 res!594169) b!874247))

(assert (= (and b!874247 res!594167) b!874241))

(assert (= (and b!874241 res!594170) b!874243))

(assert (= (and b!874243 res!594168) b!874248))

(assert (= (and b!874248 res!594166) b!874245))

(assert (= (and b!874245 res!594171) b!874239))

(assert (= (and b!874246 condMapEmpty!27593) mapIsEmpty!27593))

(assert (= (and b!874246 (not condMapEmpty!27593)) mapNonEmpty!27593))

(get-info :version)

(assert (= (and mapNonEmpty!27593 ((_ is ValueCellFull!8222) mapValue!27593)) b!874242))

(assert (= (and b!874246 ((_ is ValueCellFull!8222) mapDefault!27593)) b!874249))

(assert (= start!74298 b!874246))

(declare-fun m!813875 () Bool)

(assert (=> b!874239 m!813875))

(declare-fun m!813877 () Bool)

(assert (=> b!874239 m!813877))

(declare-fun m!813879 () Bool)

(assert (=> b!874239 m!813879))

(declare-fun m!813881 () Bool)

(assert (=> b!874245 m!813881))

(declare-fun m!813883 () Bool)

(assert (=> b!874241 m!813883))

(declare-fun m!813885 () Bool)

(assert (=> b!874248 m!813885))

(declare-fun m!813887 () Bool)

(assert (=> b!874240 m!813887))

(declare-fun m!813889 () Bool)

(assert (=> start!74298 m!813889))

(declare-fun m!813891 () Bool)

(assert (=> start!74298 m!813891))

(declare-fun m!813893 () Bool)

(assert (=> mapNonEmpty!27593 m!813893))

(declare-fun m!813895 () Bool)

(assert (=> b!874247 m!813895))

(check-sat (not b_next!15079) (not b!874239) (not b!874248) (not b!874240) (not b!874247) (not b!874241) (not start!74298) (not mapNonEmpty!27593) b_and!24829 tp_is_empty!17323)
(check-sat b_and!24829 (not b_next!15079))
