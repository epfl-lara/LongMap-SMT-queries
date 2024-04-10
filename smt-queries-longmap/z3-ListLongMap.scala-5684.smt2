; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73890 () Bool)

(assert start!73890)

(declare-fun b_free!14805 () Bool)

(declare-fun b_next!14805 () Bool)

(assert (=> start!73890 (= b_free!14805 (not b_next!14805))))

(declare-fun tp!51918 () Bool)

(declare-fun b_and!24557 () Bool)

(assert (=> start!73890 (= tp!51918 b_and!24557)))

(declare-fun b!868143 () Bool)

(declare-fun e!483545 () Bool)

(assert (=> b!868143 (= e!483545 (not true))))

(declare-datatypes ((V!27635 0))(
  ( (V!27636 (val!8518 Int)) )
))
(declare-datatypes ((ValueCell!8031 0))(
  ( (ValueCellFull!8031 (v!10943 V!27635)) (EmptyCell!8031) )
))
(declare-datatypes ((array!50038 0))(
  ( (array!50039 (arr!24050 (Array (_ BitVec 32) ValueCell!8031)) (size!24490 (_ BitVec 32))) )
))
(declare-fun lt!394372 () array!50038)

(declare-fun v!557 () V!27635)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun _values!688 () array!50038)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27635)

(declare-fun zeroValue!654 () V!27635)

(declare-datatypes ((array!50040 0))(
  ( (array!50041 (arr!24051 (Array (_ BitVec 32) (_ BitVec 64))) (size!24491 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50040)

(declare-datatypes ((tuple2!11304 0))(
  ( (tuple2!11305 (_1!5663 (_ BitVec 64)) (_2!5663 V!27635)) )
))
(declare-datatypes ((List!17101 0))(
  ( (Nil!17098) (Cons!17097 (h!18228 tuple2!11304) (t!24138 List!17101)) )
))
(declare-datatypes ((ListLongMap!10073 0))(
  ( (ListLongMap!10074 (toList!5052 List!17101)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3021 (array!50040 array!50038 (_ BitVec 32) (_ BitVec 32) V!27635 V!27635 (_ BitVec 32) Int) ListLongMap!10073)

(declare-fun +!2396 (ListLongMap!10073 tuple2!11304) ListLongMap!10073)

(assert (=> b!868143 (= (getCurrentListMapNoExtraKeys!3021 _keys!868 lt!394372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2396 (getCurrentListMapNoExtraKeys!3021 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11305 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29790 0))(
  ( (Unit!29791) )
))
(declare-fun lt!394369 () Unit!29790)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!590 (array!50040 array!50038 (_ BitVec 32) (_ BitVec 32) V!27635 V!27635 (_ BitVec 32) (_ BitVec 64) V!27635 (_ BitVec 32) Int) Unit!29790)

(assert (=> b!868143 (= lt!394369 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!590 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868144 () Bool)

(declare-fun res!589887 () Bool)

(declare-fun e!483547 () Bool)

(assert (=> b!868144 (=> (not res!589887) (not e!483547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868144 (= res!589887 (validMask!0 mask!1196))))

(declare-fun b!868145 () Bool)

(declare-fun res!589883 () Bool)

(assert (=> b!868145 (=> (not res!589883) (not e!483547))))

(assert (=> b!868145 (= res!589883 (and (= (select (arr!24051 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27011 () Bool)

(declare-fun mapRes!27011 () Bool)

(assert (=> mapIsEmpty!27011 mapRes!27011))

(declare-fun b!868146 () Bool)

(assert (=> b!868146 (= e!483547 e!483545)))

(declare-fun res!589881 () Bool)

(assert (=> b!868146 (=> (not res!589881) (not e!483545))))

(assert (=> b!868146 (= res!589881 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394370 () ListLongMap!10073)

(assert (=> b!868146 (= lt!394370 (getCurrentListMapNoExtraKeys!3021 _keys!868 lt!394372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868146 (= lt!394372 (array!50039 (store (arr!24050 _values!688) i!612 (ValueCellFull!8031 v!557)) (size!24490 _values!688)))))

(declare-fun lt!394371 () ListLongMap!10073)

(assert (=> b!868146 (= lt!394371 (getCurrentListMapNoExtraKeys!3021 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27011 () Bool)

(declare-fun tp!51919 () Bool)

(declare-fun e!483546 () Bool)

(assert (=> mapNonEmpty!27011 (= mapRes!27011 (and tp!51919 e!483546))))

(declare-fun mapRest!27011 () (Array (_ BitVec 32) ValueCell!8031))

(declare-fun mapKey!27011 () (_ BitVec 32))

(declare-fun mapValue!27011 () ValueCell!8031)

(assert (=> mapNonEmpty!27011 (= (arr!24050 _values!688) (store mapRest!27011 mapKey!27011 mapValue!27011))))

(declare-fun res!589882 () Bool)

(assert (=> start!73890 (=> (not res!589882) (not e!483547))))

(assert (=> start!73890 (= res!589882 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24491 _keys!868))))))

(assert (=> start!73890 e!483547))

(declare-fun tp_is_empty!16941 () Bool)

(assert (=> start!73890 tp_is_empty!16941))

(assert (=> start!73890 true))

(assert (=> start!73890 tp!51918))

(declare-fun array_inv!19004 (array!50040) Bool)

(assert (=> start!73890 (array_inv!19004 _keys!868)))

(declare-fun e!483544 () Bool)

(declare-fun array_inv!19005 (array!50038) Bool)

(assert (=> start!73890 (and (array_inv!19005 _values!688) e!483544)))

(declare-fun b!868147 () Bool)

(declare-fun res!589885 () Bool)

(assert (=> b!868147 (=> (not res!589885) (not e!483547))))

(assert (=> b!868147 (= res!589885 (and (= (size!24490 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24491 _keys!868) (size!24490 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868148 () Bool)

(declare-fun e!483543 () Bool)

(assert (=> b!868148 (= e!483543 tp_is_empty!16941)))

(declare-fun b!868149 () Bool)

(declare-fun res!589886 () Bool)

(assert (=> b!868149 (=> (not res!589886) (not e!483547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868149 (= res!589886 (validKeyInArray!0 k0!854))))

(declare-fun b!868150 () Bool)

(declare-fun res!589889 () Bool)

(assert (=> b!868150 (=> (not res!589889) (not e!483547))))

(declare-datatypes ((List!17102 0))(
  ( (Nil!17099) (Cons!17098 (h!18229 (_ BitVec 64)) (t!24139 List!17102)) )
))
(declare-fun arrayNoDuplicates!0 (array!50040 (_ BitVec 32) List!17102) Bool)

(assert (=> b!868150 (= res!589889 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17099))))

(declare-fun b!868151 () Bool)

(assert (=> b!868151 (= e!483544 (and e!483543 mapRes!27011))))

(declare-fun condMapEmpty!27011 () Bool)

(declare-fun mapDefault!27011 () ValueCell!8031)

(assert (=> b!868151 (= condMapEmpty!27011 (= (arr!24050 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8031)) mapDefault!27011)))))

(declare-fun b!868152 () Bool)

(declare-fun res!589888 () Bool)

(assert (=> b!868152 (=> (not res!589888) (not e!483547))))

(assert (=> b!868152 (= res!589888 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24491 _keys!868))))))

(declare-fun b!868153 () Bool)

(declare-fun res!589884 () Bool)

(assert (=> b!868153 (=> (not res!589884) (not e!483547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50040 (_ BitVec 32)) Bool)

(assert (=> b!868153 (= res!589884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868154 () Bool)

(assert (=> b!868154 (= e!483546 tp_is_empty!16941)))

(assert (= (and start!73890 res!589882) b!868144))

(assert (= (and b!868144 res!589887) b!868147))

(assert (= (and b!868147 res!589885) b!868153))

(assert (= (and b!868153 res!589884) b!868150))

(assert (= (and b!868150 res!589889) b!868152))

(assert (= (and b!868152 res!589888) b!868149))

(assert (= (and b!868149 res!589886) b!868145))

(assert (= (and b!868145 res!589883) b!868146))

(assert (= (and b!868146 res!589881) b!868143))

(assert (= (and b!868151 condMapEmpty!27011) mapIsEmpty!27011))

(assert (= (and b!868151 (not condMapEmpty!27011)) mapNonEmpty!27011))

(get-info :version)

(assert (= (and mapNonEmpty!27011 ((_ is ValueCellFull!8031) mapValue!27011)) b!868154))

(assert (= (and b!868151 ((_ is ValueCellFull!8031) mapDefault!27011)) b!868148))

(assert (= start!73890 b!868151))

(declare-fun m!809897 () Bool)

(assert (=> b!868146 m!809897))

(declare-fun m!809899 () Bool)

(assert (=> b!868146 m!809899))

(declare-fun m!809901 () Bool)

(assert (=> b!868146 m!809901))

(declare-fun m!809903 () Bool)

(assert (=> b!868149 m!809903))

(declare-fun m!809905 () Bool)

(assert (=> mapNonEmpty!27011 m!809905))

(declare-fun m!809907 () Bool)

(assert (=> b!868144 m!809907))

(declare-fun m!809909 () Bool)

(assert (=> b!868143 m!809909))

(declare-fun m!809911 () Bool)

(assert (=> b!868143 m!809911))

(assert (=> b!868143 m!809911))

(declare-fun m!809913 () Bool)

(assert (=> b!868143 m!809913))

(declare-fun m!809915 () Bool)

(assert (=> b!868143 m!809915))

(declare-fun m!809917 () Bool)

(assert (=> b!868145 m!809917))

(declare-fun m!809919 () Bool)

(assert (=> start!73890 m!809919))

(declare-fun m!809921 () Bool)

(assert (=> start!73890 m!809921))

(declare-fun m!809923 () Bool)

(assert (=> b!868150 m!809923))

(declare-fun m!809925 () Bool)

(assert (=> b!868153 m!809925))

(check-sat (not b_next!14805) (not b!868146) (not b!868149) (not b!868153) tp_is_empty!16941 (not start!73890) (not b!868144) b_and!24557 (not b!868143) (not mapNonEmpty!27011) (not b!868150))
(check-sat b_and!24557 (not b_next!14805))
