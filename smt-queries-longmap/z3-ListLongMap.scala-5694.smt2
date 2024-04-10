; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73950 () Bool)

(assert start!73950)

(declare-fun b_free!14865 () Bool)

(declare-fun b_next!14865 () Bool)

(assert (=> start!73950 (= b_free!14865 (not b_next!14865))))

(declare-fun tp!52099 () Bool)

(declare-fun b_and!24617 () Bool)

(assert (=> start!73950 (= tp!52099 b_and!24617)))

(declare-fun b!869223 () Bool)

(declare-fun res!590697 () Bool)

(declare-fun e!484083 () Bool)

(assert (=> b!869223 (=> (not res!590697) (not e!484083))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869223 (= res!590697 (validMask!0 mask!1196))))

(declare-fun b!869224 () Bool)

(declare-fun e!484087 () Bool)

(declare-fun e!484084 () Bool)

(declare-fun mapRes!27101 () Bool)

(assert (=> b!869224 (= e!484087 (and e!484084 mapRes!27101))))

(declare-fun condMapEmpty!27101 () Bool)

(declare-datatypes ((V!27715 0))(
  ( (V!27716 (val!8548 Int)) )
))
(declare-datatypes ((ValueCell!8061 0))(
  ( (ValueCellFull!8061 (v!10973 V!27715)) (EmptyCell!8061) )
))
(declare-datatypes ((array!50150 0))(
  ( (array!50151 (arr!24106 (Array (_ BitVec 32) ValueCell!8061)) (size!24546 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50150)

(declare-fun mapDefault!27101 () ValueCell!8061)

(assert (=> b!869224 (= condMapEmpty!27101 (= (arr!24106 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8061)) mapDefault!27101)))))

(declare-fun b!869225 () Bool)

(declare-fun res!590698 () Bool)

(assert (=> b!869225 (=> (not res!590698) (not e!484083))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50152 0))(
  ( (array!50153 (arr!24107 (Array (_ BitVec 32) (_ BitVec 64))) (size!24547 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50152)

(assert (=> b!869225 (= res!590698 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24547 _keys!868))))))

(declare-fun b!869226 () Bool)

(declare-fun e!484082 () Bool)

(assert (=> b!869226 (= e!484083 e!484082)))

(declare-fun res!590692 () Bool)

(assert (=> b!869226 (=> (not res!590692) (not e!484082))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869226 (= res!590692 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!394730 () array!50150)

(declare-datatypes ((tuple2!11352 0))(
  ( (tuple2!11353 (_1!5687 (_ BitVec 64)) (_2!5687 V!27715)) )
))
(declare-datatypes ((List!17144 0))(
  ( (Nil!17141) (Cons!17140 (h!18271 tuple2!11352) (t!24181 List!17144)) )
))
(declare-datatypes ((ListLongMap!10121 0))(
  ( (ListLongMap!10122 (toList!5076 List!17144)) )
))
(declare-fun lt!394731 () ListLongMap!10121)

(declare-fun minValue!654 () V!27715)

(declare-fun zeroValue!654 () V!27715)

(declare-fun getCurrentListMapNoExtraKeys!3045 (array!50152 array!50150 (_ BitVec 32) (_ BitVec 32) V!27715 V!27715 (_ BitVec 32) Int) ListLongMap!10121)

(assert (=> b!869226 (= lt!394731 (getCurrentListMapNoExtraKeys!3045 _keys!868 lt!394730 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27715)

(assert (=> b!869226 (= lt!394730 (array!50151 (store (arr!24106 _values!688) i!612 (ValueCellFull!8061 v!557)) (size!24546 _values!688)))))

(declare-fun lt!394732 () ListLongMap!10121)

(assert (=> b!869226 (= lt!394732 (getCurrentListMapNoExtraKeys!3045 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27101 () Bool)

(assert (=> mapIsEmpty!27101 mapRes!27101))

(declare-fun b!869227 () Bool)

(declare-fun res!590699 () Bool)

(assert (=> b!869227 (=> (not res!590699) (not e!484083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50152 (_ BitVec 32)) Bool)

(assert (=> b!869227 (= res!590699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!590696 () Bool)

(assert (=> start!73950 (=> (not res!590696) (not e!484083))))

(assert (=> start!73950 (= res!590696 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24547 _keys!868))))))

(assert (=> start!73950 e!484083))

(declare-fun tp_is_empty!17001 () Bool)

(assert (=> start!73950 tp_is_empty!17001))

(assert (=> start!73950 true))

(assert (=> start!73950 tp!52099))

(declare-fun array_inv!19042 (array!50152) Bool)

(assert (=> start!73950 (array_inv!19042 _keys!868)))

(declare-fun array_inv!19043 (array!50150) Bool)

(assert (=> start!73950 (and (array_inv!19043 _values!688) e!484087)))

(declare-fun b!869228 () Bool)

(declare-fun res!590695 () Bool)

(assert (=> b!869228 (=> (not res!590695) (not e!484083))))

(declare-datatypes ((List!17145 0))(
  ( (Nil!17142) (Cons!17141 (h!18272 (_ BitVec 64)) (t!24182 List!17145)) )
))
(declare-fun arrayNoDuplicates!0 (array!50152 (_ BitVec 32) List!17145) Bool)

(assert (=> b!869228 (= res!590695 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17142))))

(declare-fun mapNonEmpty!27101 () Bool)

(declare-fun tp!52098 () Bool)

(declare-fun e!484086 () Bool)

(assert (=> mapNonEmpty!27101 (= mapRes!27101 (and tp!52098 e!484086))))

(declare-fun mapValue!27101 () ValueCell!8061)

(declare-fun mapRest!27101 () (Array (_ BitVec 32) ValueCell!8061))

(declare-fun mapKey!27101 () (_ BitVec 32))

(assert (=> mapNonEmpty!27101 (= (arr!24106 _values!688) (store mapRest!27101 mapKey!27101 mapValue!27101))))

(declare-fun b!869229 () Bool)

(assert (=> b!869229 (= e!484086 tp_is_empty!17001)))

(declare-fun b!869230 () Bool)

(assert (=> b!869230 (= e!484084 tp_is_empty!17001)))

(declare-fun b!869231 () Bool)

(assert (=> b!869231 (= e!484082 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2417 (ListLongMap!10121 tuple2!11352) ListLongMap!10121)

(assert (=> b!869231 (= (getCurrentListMapNoExtraKeys!3045 _keys!868 lt!394730 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2417 (getCurrentListMapNoExtraKeys!3045 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11353 k0!854 v!557)))))

(declare-datatypes ((Unit!29832 0))(
  ( (Unit!29833) )
))
(declare-fun lt!394729 () Unit!29832)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!611 (array!50152 array!50150 (_ BitVec 32) (_ BitVec 32) V!27715 V!27715 (_ BitVec 32) (_ BitVec 64) V!27715 (_ BitVec 32) Int) Unit!29832)

(assert (=> b!869231 (= lt!394729 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!611 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869232 () Bool)

(declare-fun res!590694 () Bool)

(assert (=> b!869232 (=> (not res!590694) (not e!484083))))

(assert (=> b!869232 (= res!590694 (and (= (select (arr!24107 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869233 () Bool)

(declare-fun res!590693 () Bool)

(assert (=> b!869233 (=> (not res!590693) (not e!484083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869233 (= res!590693 (validKeyInArray!0 k0!854))))

(declare-fun b!869234 () Bool)

(declare-fun res!590691 () Bool)

(assert (=> b!869234 (=> (not res!590691) (not e!484083))))

(assert (=> b!869234 (= res!590691 (and (= (size!24546 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24547 _keys!868) (size!24546 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73950 res!590696) b!869223))

(assert (= (and b!869223 res!590697) b!869234))

(assert (= (and b!869234 res!590691) b!869227))

(assert (= (and b!869227 res!590699) b!869228))

(assert (= (and b!869228 res!590695) b!869225))

(assert (= (and b!869225 res!590698) b!869233))

(assert (= (and b!869233 res!590693) b!869232))

(assert (= (and b!869232 res!590694) b!869226))

(assert (= (and b!869226 res!590692) b!869231))

(assert (= (and b!869224 condMapEmpty!27101) mapIsEmpty!27101))

(assert (= (and b!869224 (not condMapEmpty!27101)) mapNonEmpty!27101))

(get-info :version)

(assert (= (and mapNonEmpty!27101 ((_ is ValueCellFull!8061) mapValue!27101)) b!869229))

(assert (= (and b!869224 ((_ is ValueCellFull!8061) mapDefault!27101)) b!869230))

(assert (= start!73950 b!869224))

(declare-fun m!810797 () Bool)

(assert (=> b!869227 m!810797))

(declare-fun m!810799 () Bool)

(assert (=> b!869228 m!810799))

(declare-fun m!810801 () Bool)

(assert (=> b!869232 m!810801))

(declare-fun m!810803 () Bool)

(assert (=> b!869233 m!810803))

(declare-fun m!810805 () Bool)

(assert (=> b!869223 m!810805))

(declare-fun m!810807 () Bool)

(assert (=> b!869226 m!810807))

(declare-fun m!810809 () Bool)

(assert (=> b!869226 m!810809))

(declare-fun m!810811 () Bool)

(assert (=> b!869226 m!810811))

(declare-fun m!810813 () Bool)

(assert (=> mapNonEmpty!27101 m!810813))

(declare-fun m!810815 () Bool)

(assert (=> b!869231 m!810815))

(declare-fun m!810817 () Bool)

(assert (=> b!869231 m!810817))

(assert (=> b!869231 m!810817))

(declare-fun m!810819 () Bool)

(assert (=> b!869231 m!810819))

(declare-fun m!810821 () Bool)

(assert (=> b!869231 m!810821))

(declare-fun m!810823 () Bool)

(assert (=> start!73950 m!810823))

(declare-fun m!810825 () Bool)

(assert (=> start!73950 m!810825))

(check-sat (not b!869233) (not b!869227) b_and!24617 (not b!869231) tp_is_empty!17001 (not mapNonEmpty!27101) (not start!73950) (not b!869223) (not b!869228) (not b_next!14865) (not b!869226))
(check-sat b_and!24617 (not b_next!14865))
