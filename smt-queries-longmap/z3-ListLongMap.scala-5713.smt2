; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74044 () Bool)

(assert start!74044)

(declare-fun b_free!14977 () Bool)

(declare-fun b_next!14977 () Bool)

(assert (=> start!74044 (= b_free!14977 (not b_next!14977))))

(declare-fun tp!52436 () Bool)

(declare-fun b_and!24703 () Bool)

(assert (=> start!74044 (= tp!52436 b_and!24703)))

(declare-fun b!871000 () Bool)

(declare-fun e!484946 () Bool)

(declare-fun tp_is_empty!17113 () Bool)

(assert (=> b!871000 (= e!484946 tp_is_empty!17113)))

(declare-fun b!871001 () Bool)

(declare-fun res!592101 () Bool)

(declare-fun e!484943 () Bool)

(assert (=> b!871001 (=> (not res!592101) (not e!484943))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871001 (= res!592101 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27269 () Bool)

(declare-fun mapRes!27269 () Bool)

(assert (=> mapIsEmpty!27269 mapRes!27269))

(declare-fun b!871002 () Bool)

(declare-fun res!592094 () Bool)

(assert (=> b!871002 (=> (not res!592094) (not e!484943))))

(declare-datatypes ((array!50353 0))(
  ( (array!50354 (arr!24208 (Array (_ BitVec 32) (_ BitVec 64))) (size!24650 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50353)

(declare-datatypes ((List!17227 0))(
  ( (Nil!17224) (Cons!17223 (h!18354 (_ BitVec 64)) (t!24255 List!17227)) )
))
(declare-fun arrayNoDuplicates!0 (array!50353 (_ BitVec 32) List!17227) Bool)

(assert (=> b!871002 (= res!592094 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17224))))

(declare-fun b!871003 () Bool)

(declare-fun e!484947 () Bool)

(assert (=> b!871003 (= e!484947 (not true))))

(declare-datatypes ((V!27865 0))(
  ( (V!27866 (val!8604 Int)) )
))
(declare-datatypes ((ValueCell!8117 0))(
  ( (ValueCellFull!8117 (v!11023 V!27865)) (EmptyCell!8117) )
))
(declare-datatypes ((array!50355 0))(
  ( (array!50356 (arr!24209 (Array (_ BitVec 32) ValueCell!8117)) (size!24651 (_ BitVec 32))) )
))
(declare-fun lt!395168 () array!50355)

(declare-fun v!557 () V!27865)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun _values!688 () array!50355)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27865)

(declare-fun zeroValue!654 () V!27865)

(declare-datatypes ((tuple2!11452 0))(
  ( (tuple2!11453 (_1!5737 (_ BitVec 64)) (_2!5737 V!27865)) )
))
(declare-datatypes ((List!17228 0))(
  ( (Nil!17225) (Cons!17224 (h!18355 tuple2!11452) (t!24256 List!17228)) )
))
(declare-datatypes ((ListLongMap!10211 0))(
  ( (ListLongMap!10212 (toList!5121 List!17228)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3114 (array!50353 array!50355 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) Int) ListLongMap!10211)

(declare-fun +!2480 (ListLongMap!10211 tuple2!11452) ListLongMap!10211)

(assert (=> b!871003 (= (getCurrentListMapNoExtraKeys!3114 _keys!868 lt!395168 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2480 (getCurrentListMapNoExtraKeys!3114 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11453 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29847 0))(
  ( (Unit!29848) )
))
(declare-fun lt!395165 () Unit!29847)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 (array!50353 array!50355 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) (_ BitVec 64) V!27865 (_ BitVec 32) Int) Unit!29847)

(assert (=> b!871003 (= lt!395165 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27269 () Bool)

(declare-fun tp!52435 () Bool)

(declare-fun e!484945 () Bool)

(assert (=> mapNonEmpty!27269 (= mapRes!27269 (and tp!52435 e!484945))))

(declare-fun mapRest!27269 () (Array (_ BitVec 32) ValueCell!8117))

(declare-fun mapValue!27269 () ValueCell!8117)

(declare-fun mapKey!27269 () (_ BitVec 32))

(assert (=> mapNonEmpty!27269 (= (arr!24209 _values!688) (store mapRest!27269 mapKey!27269 mapValue!27269))))

(declare-fun b!871004 () Bool)

(declare-fun res!592099 () Bool)

(assert (=> b!871004 (=> (not res!592099) (not e!484943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50353 (_ BitVec 32)) Bool)

(assert (=> b!871004 (= res!592099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871005 () Bool)

(assert (=> b!871005 (= e!484943 e!484947)))

(declare-fun res!592100 () Bool)

(assert (=> b!871005 (=> (not res!592100) (not e!484947))))

(assert (=> b!871005 (= res!592100 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395167 () ListLongMap!10211)

(assert (=> b!871005 (= lt!395167 (getCurrentListMapNoExtraKeys!3114 _keys!868 lt!395168 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871005 (= lt!395168 (array!50356 (store (arr!24209 _values!688) i!612 (ValueCellFull!8117 v!557)) (size!24651 _values!688)))))

(declare-fun lt!395166 () ListLongMap!10211)

(assert (=> b!871005 (= lt!395166 (getCurrentListMapNoExtraKeys!3114 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871006 () Bool)

(declare-fun res!592098 () Bool)

(assert (=> b!871006 (=> (not res!592098) (not e!484943))))

(assert (=> b!871006 (= res!592098 (and (= (select (arr!24208 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871008 () Bool)

(declare-fun res!592097 () Bool)

(assert (=> b!871008 (=> (not res!592097) (not e!484943))))

(assert (=> b!871008 (= res!592097 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24650 _keys!868))))))

(declare-fun b!871009 () Bool)

(declare-fun res!592095 () Bool)

(assert (=> b!871009 (=> (not res!592095) (not e!484943))))

(assert (=> b!871009 (= res!592095 (and (= (size!24651 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24650 _keys!868) (size!24651 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871010 () Bool)

(declare-fun e!484944 () Bool)

(assert (=> b!871010 (= e!484944 (and e!484946 mapRes!27269))))

(declare-fun condMapEmpty!27269 () Bool)

(declare-fun mapDefault!27269 () ValueCell!8117)

(assert (=> b!871010 (= condMapEmpty!27269 (= (arr!24209 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8117)) mapDefault!27269)))))

(declare-fun b!871011 () Bool)

(assert (=> b!871011 (= e!484945 tp_is_empty!17113)))

(declare-fun b!871007 () Bool)

(declare-fun res!592096 () Bool)

(assert (=> b!871007 (=> (not res!592096) (not e!484943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871007 (= res!592096 (validMask!0 mask!1196))))

(declare-fun res!592093 () Bool)

(assert (=> start!74044 (=> (not res!592093) (not e!484943))))

(assert (=> start!74044 (= res!592093 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24650 _keys!868))))))

(assert (=> start!74044 e!484943))

(assert (=> start!74044 tp_is_empty!17113))

(assert (=> start!74044 true))

(assert (=> start!74044 tp!52436))

(declare-fun array_inv!19176 (array!50353) Bool)

(assert (=> start!74044 (array_inv!19176 _keys!868)))

(declare-fun array_inv!19177 (array!50355) Bool)

(assert (=> start!74044 (and (array_inv!19177 _values!688) e!484944)))

(assert (= (and start!74044 res!592093) b!871007))

(assert (= (and b!871007 res!592096) b!871009))

(assert (= (and b!871009 res!592095) b!871004))

(assert (= (and b!871004 res!592099) b!871002))

(assert (= (and b!871002 res!592094) b!871008))

(assert (= (and b!871008 res!592097) b!871001))

(assert (= (and b!871001 res!592101) b!871006))

(assert (= (and b!871006 res!592098) b!871005))

(assert (= (and b!871005 res!592100) b!871003))

(assert (= (and b!871010 condMapEmpty!27269) mapIsEmpty!27269))

(assert (= (and b!871010 (not condMapEmpty!27269)) mapNonEmpty!27269))

(get-info :version)

(assert (= (and mapNonEmpty!27269 ((_ is ValueCellFull!8117) mapValue!27269)) b!871011))

(assert (= (and b!871010 ((_ is ValueCellFull!8117) mapDefault!27269)) b!871000))

(assert (= start!74044 b!871010))

(declare-fun m!811719 () Bool)

(assert (=> b!871005 m!811719))

(declare-fun m!811721 () Bool)

(assert (=> b!871005 m!811721))

(declare-fun m!811723 () Bool)

(assert (=> b!871005 m!811723))

(declare-fun m!811725 () Bool)

(assert (=> b!871003 m!811725))

(declare-fun m!811727 () Bool)

(assert (=> b!871003 m!811727))

(assert (=> b!871003 m!811727))

(declare-fun m!811729 () Bool)

(assert (=> b!871003 m!811729))

(declare-fun m!811731 () Bool)

(assert (=> b!871003 m!811731))

(declare-fun m!811733 () Bool)

(assert (=> b!871007 m!811733))

(declare-fun m!811735 () Bool)

(assert (=> start!74044 m!811735))

(declare-fun m!811737 () Bool)

(assert (=> start!74044 m!811737))

(declare-fun m!811739 () Bool)

(assert (=> mapNonEmpty!27269 m!811739))

(declare-fun m!811741 () Bool)

(assert (=> b!871004 m!811741))

(declare-fun m!811743 () Bool)

(assert (=> b!871002 m!811743))

(declare-fun m!811745 () Bool)

(assert (=> b!871001 m!811745))

(declare-fun m!811747 () Bool)

(assert (=> b!871006 m!811747))

(check-sat (not b!871007) (not b_next!14977) (not b!871001) (not b!871002) b_and!24703 (not mapNonEmpty!27269) tp_is_empty!17113 (not b!871003) (not b!871005) (not b!871004) (not start!74044))
(check-sat b_and!24703 (not b_next!14977))
