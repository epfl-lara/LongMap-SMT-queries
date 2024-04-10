; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73356 () Bool)

(assert start!73356)

(declare-fun b_free!14271 () Bool)

(declare-fun b_next!14271 () Bool)

(assert (=> start!73356 (= b_free!14271 (not b_next!14271))))

(declare-fun tp!50316 () Bool)

(declare-fun b_and!23627 () Bool)

(assert (=> start!73356 (= tp!50316 b_and!23627)))

(declare-fun b!856002 () Bool)

(declare-fun res!581375 () Bool)

(declare-fun e!477184 () Bool)

(assert (=> b!856002 (=> (not res!581375) (not e!477184))))

(declare-datatypes ((array!49008 0))(
  ( (array!49009 (arr!23535 (Array (_ BitVec 32) (_ BitVec 64))) (size!23975 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49008)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49008 (_ BitVec 32)) Bool)

(assert (=> b!856002 (= res!581375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856003 () Bool)

(declare-fun e!477183 () Bool)

(declare-fun e!477180 () Bool)

(declare-fun mapRes!26210 () Bool)

(assert (=> b!856003 (= e!477183 (and e!477180 mapRes!26210))))

(declare-fun condMapEmpty!26210 () Bool)

(declare-datatypes ((V!26923 0))(
  ( (V!26924 (val!8251 Int)) )
))
(declare-datatypes ((ValueCell!7764 0))(
  ( (ValueCellFull!7764 (v!10676 V!26923)) (EmptyCell!7764) )
))
(declare-datatypes ((array!49010 0))(
  ( (array!49011 (arr!23536 (Array (_ BitVec 32) ValueCell!7764)) (size!23976 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49010)

(declare-fun mapDefault!26210 () ValueCell!7764)

(assert (=> b!856003 (= condMapEmpty!26210 (= (arr!23536 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7764)) mapDefault!26210)))))

(declare-fun b!856004 () Bool)

(declare-fun res!581369 () Bool)

(assert (=> b!856004 (=> (not res!581369) (not e!477184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856004 (= res!581369 (validMask!0 mask!1196))))

(declare-fun b!856005 () Bool)

(declare-fun e!477182 () Bool)

(assert (=> b!856005 (= e!477182 (not true))))

(declare-fun v!557 () V!26923)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26923)

(declare-fun zeroValue!654 () V!26923)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!385813 () array!49010)

(declare-datatypes ((tuple2!10874 0))(
  ( (tuple2!10875 (_1!5448 (_ BitVec 64)) (_2!5448 V!26923)) )
))
(declare-datatypes ((List!16686 0))(
  ( (Nil!16683) (Cons!16682 (h!17813 tuple2!10874) (t!23327 List!16686)) )
))
(declare-datatypes ((ListLongMap!9643 0))(
  ( (ListLongMap!9644 (toList!4837 List!16686)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2818 (array!49008 array!49010 (_ BitVec 32) (_ BitVec 32) V!26923 V!26923 (_ BitVec 32) Int) ListLongMap!9643)

(declare-fun +!2196 (ListLongMap!9643 tuple2!10874) ListLongMap!9643)

(assert (=> b!856005 (= (getCurrentListMapNoExtraKeys!2818 _keys!868 lt!385813 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2196 (getCurrentListMapNoExtraKeys!2818 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10875 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29179 0))(
  ( (Unit!29180) )
))
(declare-fun lt!385812 () Unit!29179)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!417 (array!49008 array!49010 (_ BitVec 32) (_ BitVec 32) V!26923 V!26923 (_ BitVec 32) (_ BitVec 64) V!26923 (_ BitVec 32) Int) Unit!29179)

(assert (=> b!856005 (= lt!385812 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!417 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856006 () Bool)

(declare-fun res!581374 () Bool)

(assert (=> b!856006 (=> (not res!581374) (not e!477184))))

(assert (=> b!856006 (= res!581374 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23975 _keys!868))))))

(declare-fun b!856007 () Bool)

(declare-fun e!477181 () Bool)

(declare-fun tp_is_empty!16407 () Bool)

(assert (=> b!856007 (= e!477181 tp_is_empty!16407)))

(declare-fun mapIsEmpty!26210 () Bool)

(assert (=> mapIsEmpty!26210 mapRes!26210))

(declare-fun b!856008 () Bool)

(declare-fun res!581368 () Bool)

(assert (=> b!856008 (=> (not res!581368) (not e!477184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856008 (= res!581368 (validKeyInArray!0 k0!854))))

(declare-fun b!856009 () Bool)

(assert (=> b!856009 (= e!477180 tp_is_empty!16407)))

(declare-fun mapNonEmpty!26210 () Bool)

(declare-fun tp!50317 () Bool)

(assert (=> mapNonEmpty!26210 (= mapRes!26210 (and tp!50317 e!477181))))

(declare-fun mapRest!26210 () (Array (_ BitVec 32) ValueCell!7764))

(declare-fun mapValue!26210 () ValueCell!7764)

(declare-fun mapKey!26210 () (_ BitVec 32))

(assert (=> mapNonEmpty!26210 (= (arr!23536 _values!688) (store mapRest!26210 mapKey!26210 mapValue!26210))))

(declare-fun b!856010 () Bool)

(declare-fun res!581370 () Bool)

(assert (=> b!856010 (=> (not res!581370) (not e!477184))))

(assert (=> b!856010 (= res!581370 (and (= (select (arr!23535 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!581371 () Bool)

(assert (=> start!73356 (=> (not res!581371) (not e!477184))))

(assert (=> start!73356 (= res!581371 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23975 _keys!868))))))

(assert (=> start!73356 e!477184))

(assert (=> start!73356 tp_is_empty!16407))

(assert (=> start!73356 true))

(assert (=> start!73356 tp!50316))

(declare-fun array_inv!18648 (array!49008) Bool)

(assert (=> start!73356 (array_inv!18648 _keys!868)))

(declare-fun array_inv!18649 (array!49010) Bool)

(assert (=> start!73356 (and (array_inv!18649 _values!688) e!477183)))

(declare-fun b!856011 () Bool)

(declare-fun res!581367 () Bool)

(assert (=> b!856011 (=> (not res!581367) (not e!477184))))

(assert (=> b!856011 (= res!581367 (and (= (size!23976 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23975 _keys!868) (size!23976 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856012 () Bool)

(declare-fun res!581372 () Bool)

(assert (=> b!856012 (=> (not res!581372) (not e!477184))))

(declare-datatypes ((List!16687 0))(
  ( (Nil!16684) (Cons!16683 (h!17814 (_ BitVec 64)) (t!23328 List!16687)) )
))
(declare-fun arrayNoDuplicates!0 (array!49008 (_ BitVec 32) List!16687) Bool)

(assert (=> b!856012 (= res!581372 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16684))))

(declare-fun b!856013 () Bool)

(assert (=> b!856013 (= e!477184 e!477182)))

(declare-fun res!581373 () Bool)

(assert (=> b!856013 (=> (not res!581373) (not e!477182))))

(assert (=> b!856013 (= res!581373 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385810 () ListLongMap!9643)

(assert (=> b!856013 (= lt!385810 (getCurrentListMapNoExtraKeys!2818 _keys!868 lt!385813 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856013 (= lt!385813 (array!49011 (store (arr!23536 _values!688) i!612 (ValueCellFull!7764 v!557)) (size!23976 _values!688)))))

(declare-fun lt!385811 () ListLongMap!9643)

(assert (=> b!856013 (= lt!385811 (getCurrentListMapNoExtraKeys!2818 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73356 res!581371) b!856004))

(assert (= (and b!856004 res!581369) b!856011))

(assert (= (and b!856011 res!581367) b!856002))

(assert (= (and b!856002 res!581375) b!856012))

(assert (= (and b!856012 res!581372) b!856006))

(assert (= (and b!856006 res!581374) b!856008))

(assert (= (and b!856008 res!581368) b!856010))

(assert (= (and b!856010 res!581370) b!856013))

(assert (= (and b!856013 res!581373) b!856005))

(assert (= (and b!856003 condMapEmpty!26210) mapIsEmpty!26210))

(assert (= (and b!856003 (not condMapEmpty!26210)) mapNonEmpty!26210))

(get-info :version)

(assert (= (and mapNonEmpty!26210 ((_ is ValueCellFull!7764) mapValue!26210)) b!856007))

(assert (= (and b!856003 ((_ is ValueCellFull!7764) mapDefault!26210)) b!856009))

(assert (= start!73356 b!856003))

(declare-fun m!797021 () Bool)

(assert (=> start!73356 m!797021))

(declare-fun m!797023 () Bool)

(assert (=> start!73356 m!797023))

(declare-fun m!797025 () Bool)

(assert (=> b!856010 m!797025))

(declare-fun m!797027 () Bool)

(assert (=> b!856004 m!797027))

(declare-fun m!797029 () Bool)

(assert (=> b!856005 m!797029))

(declare-fun m!797031 () Bool)

(assert (=> b!856005 m!797031))

(assert (=> b!856005 m!797031))

(declare-fun m!797033 () Bool)

(assert (=> b!856005 m!797033))

(declare-fun m!797035 () Bool)

(assert (=> b!856005 m!797035))

(declare-fun m!797037 () Bool)

(assert (=> mapNonEmpty!26210 m!797037))

(declare-fun m!797039 () Bool)

(assert (=> b!856002 m!797039))

(declare-fun m!797041 () Bool)

(assert (=> b!856012 m!797041))

(declare-fun m!797043 () Bool)

(assert (=> b!856013 m!797043))

(declare-fun m!797045 () Bool)

(assert (=> b!856013 m!797045))

(declare-fun m!797047 () Bool)

(assert (=> b!856013 m!797047))

(declare-fun m!797049 () Bool)

(assert (=> b!856008 m!797049))

(check-sat (not b!856008) (not b!856002) (not b!856004) tp_is_empty!16407 (not b!856005) (not b!856013) (not mapNonEmpty!26210) (not b_next!14271) (not start!73356) b_and!23627 (not b!856012))
(check-sat b_and!23627 (not b_next!14271))
