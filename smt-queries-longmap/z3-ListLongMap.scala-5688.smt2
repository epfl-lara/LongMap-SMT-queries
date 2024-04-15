; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73894 () Bool)

(assert start!73894)

(declare-fun b_free!14827 () Bool)

(declare-fun b_next!14827 () Bool)

(assert (=> start!73894 (= b_free!14827 (not b_next!14827))))

(declare-fun tp!51985 () Bool)

(declare-fun b_and!24553 () Bool)

(assert (=> start!73894 (= tp!51985 b_and!24553)))

(declare-fun b!868300 () Bool)

(declare-fun res!590071 () Bool)

(declare-fun e!483594 () Bool)

(assert (=> b!868300 (=> (not res!590071) (not e!483594))))

(declare-datatypes ((array!50071 0))(
  ( (array!50072 (arr!24067 (Array (_ BitVec 32) (_ BitVec 64))) (size!24509 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50071)

(declare-datatypes ((List!17129 0))(
  ( (Nil!17126) (Cons!17125 (h!18256 (_ BitVec 64)) (t!24157 List!17129)) )
))
(declare-fun arrayNoDuplicates!0 (array!50071 (_ BitVec 32) List!17129) Bool)

(assert (=> b!868300 (= res!590071 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17126))))

(declare-fun b!868301 () Bool)

(declare-fun res!590070 () Bool)

(assert (=> b!868301 (=> (not res!590070) (not e!483594))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50071 (_ BitVec 32)) Bool)

(assert (=> b!868301 (= res!590070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868302 () Bool)

(declare-fun res!590075 () Bool)

(assert (=> b!868302 (=> (not res!590075) (not e!483594))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868302 (= res!590075 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24509 _keys!868))))))

(declare-fun b!868304 () Bool)

(declare-fun e!483595 () Bool)

(assert (=> b!868304 (= e!483594 e!483595)))

(declare-fun res!590072 () Bool)

(assert (=> b!868304 (=> (not res!590072) (not e!483595))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868304 (= res!590072 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27665 0))(
  ( (V!27666 (val!8529 Int)) )
))
(declare-datatypes ((ValueCell!8042 0))(
  ( (ValueCellFull!8042 (v!10948 V!27665)) (EmptyCell!8042) )
))
(declare-datatypes ((array!50073 0))(
  ( (array!50074 (arr!24068 (Array (_ BitVec 32) ValueCell!8042)) (size!24510 (_ BitVec 32))) )
))
(declare-fun lt!394265 () array!50073)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27665)

(declare-fun zeroValue!654 () V!27665)

(declare-datatypes ((tuple2!11344 0))(
  ( (tuple2!11345 (_1!5683 (_ BitVec 64)) (_2!5683 V!27665)) )
))
(declare-datatypes ((List!17130 0))(
  ( (Nil!17127) (Cons!17126 (h!18257 tuple2!11344) (t!24158 List!17130)) )
))
(declare-datatypes ((ListLongMap!10103 0))(
  ( (ListLongMap!10104 (toList!5067 List!17130)) )
))
(declare-fun lt!394267 () ListLongMap!10103)

(declare-fun getCurrentListMapNoExtraKeys!3060 (array!50071 array!50073 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) Int) ListLongMap!10103)

(assert (=> b!868304 (= lt!394267 (getCurrentListMapNoExtraKeys!3060 _keys!868 lt!394265 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27665)

(declare-fun _values!688 () array!50073)

(assert (=> b!868304 (= lt!394265 (array!50074 (store (arr!24068 _values!688) i!612 (ValueCellFull!8042 v!557)) (size!24510 _values!688)))))

(declare-fun lt!394268 () ListLongMap!10103)

(assert (=> b!868304 (= lt!394268 (getCurrentListMapNoExtraKeys!3060 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868305 () Bool)

(declare-fun res!590068 () Bool)

(assert (=> b!868305 (=> (not res!590068) (not e!483594))))

(assert (=> b!868305 (= res!590068 (and (= (size!24510 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24509 _keys!868) (size!24510 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868306 () Bool)

(assert (=> b!868306 (= e!483595 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2430 (ListLongMap!10103 tuple2!11344) ListLongMap!10103)

(assert (=> b!868306 (= (getCurrentListMapNoExtraKeys!3060 _keys!868 lt!394265 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2430 (getCurrentListMapNoExtraKeys!3060 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11345 k0!854 v!557)))))

(declare-datatypes ((Unit!29747 0))(
  ( (Unit!29748) )
))
(declare-fun lt!394266 () Unit!29747)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 (array!50071 array!50073 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) (_ BitVec 64) V!27665 (_ BitVec 32) Int) Unit!29747)

(assert (=> b!868306 (= lt!394266 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868307 () Bool)

(declare-fun res!590076 () Bool)

(assert (=> b!868307 (=> (not res!590076) (not e!483594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868307 (= res!590076 (validKeyInArray!0 k0!854))))

(declare-fun b!868308 () Bool)

(declare-fun res!590074 () Bool)

(assert (=> b!868308 (=> (not res!590074) (not e!483594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868308 (= res!590074 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27044 () Bool)

(declare-fun mapRes!27044 () Bool)

(assert (=> mapIsEmpty!27044 mapRes!27044))

(declare-fun b!868309 () Bool)

(declare-fun e!483592 () Bool)

(declare-fun e!483596 () Bool)

(assert (=> b!868309 (= e!483592 (and e!483596 mapRes!27044))))

(declare-fun condMapEmpty!27044 () Bool)

(declare-fun mapDefault!27044 () ValueCell!8042)

(assert (=> b!868309 (= condMapEmpty!27044 (= (arr!24068 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8042)) mapDefault!27044)))))

(declare-fun mapNonEmpty!27044 () Bool)

(declare-fun tp!51986 () Bool)

(declare-fun e!483593 () Bool)

(assert (=> mapNonEmpty!27044 (= mapRes!27044 (and tp!51986 e!483593))))

(declare-fun mapKey!27044 () (_ BitVec 32))

(declare-fun mapRest!27044 () (Array (_ BitVec 32) ValueCell!8042))

(declare-fun mapValue!27044 () ValueCell!8042)

(assert (=> mapNonEmpty!27044 (= (arr!24068 _values!688) (store mapRest!27044 mapKey!27044 mapValue!27044))))

(declare-fun b!868303 () Bool)

(declare-fun tp_is_empty!16963 () Bool)

(assert (=> b!868303 (= e!483593 tp_is_empty!16963)))

(declare-fun res!590069 () Bool)

(assert (=> start!73894 (=> (not res!590069) (not e!483594))))

(assert (=> start!73894 (= res!590069 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24509 _keys!868))))))

(assert (=> start!73894 e!483594))

(assert (=> start!73894 tp_is_empty!16963))

(assert (=> start!73894 true))

(assert (=> start!73894 tp!51985))

(declare-fun array_inv!19084 (array!50071) Bool)

(assert (=> start!73894 (array_inv!19084 _keys!868)))

(declare-fun array_inv!19085 (array!50073) Bool)

(assert (=> start!73894 (and (array_inv!19085 _values!688) e!483592)))

(declare-fun b!868310 () Bool)

(assert (=> b!868310 (= e!483596 tp_is_empty!16963)))

(declare-fun b!868311 () Bool)

(declare-fun res!590073 () Bool)

(assert (=> b!868311 (=> (not res!590073) (not e!483594))))

(assert (=> b!868311 (= res!590073 (and (= (select (arr!24067 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73894 res!590069) b!868308))

(assert (= (and b!868308 res!590074) b!868305))

(assert (= (and b!868305 res!590068) b!868301))

(assert (= (and b!868301 res!590070) b!868300))

(assert (= (and b!868300 res!590071) b!868302))

(assert (= (and b!868302 res!590075) b!868307))

(assert (= (and b!868307 res!590076) b!868311))

(assert (= (and b!868311 res!590073) b!868304))

(assert (= (and b!868304 res!590072) b!868306))

(assert (= (and b!868309 condMapEmpty!27044) mapIsEmpty!27044))

(assert (= (and b!868309 (not condMapEmpty!27044)) mapNonEmpty!27044))

(get-info :version)

(assert (= (and mapNonEmpty!27044 ((_ is ValueCellFull!8042) mapValue!27044)) b!868303))

(assert (= (and b!868309 ((_ is ValueCellFull!8042) mapDefault!27044)) b!868310))

(assert (= start!73894 b!868309))

(declare-fun m!809469 () Bool)

(assert (=> b!868311 m!809469))

(declare-fun m!809471 () Bool)

(assert (=> b!868304 m!809471))

(declare-fun m!809473 () Bool)

(assert (=> b!868304 m!809473))

(declare-fun m!809475 () Bool)

(assert (=> b!868304 m!809475))

(declare-fun m!809477 () Bool)

(assert (=> b!868301 m!809477))

(declare-fun m!809479 () Bool)

(assert (=> b!868307 m!809479))

(declare-fun m!809481 () Bool)

(assert (=> b!868306 m!809481))

(declare-fun m!809483 () Bool)

(assert (=> b!868306 m!809483))

(assert (=> b!868306 m!809483))

(declare-fun m!809485 () Bool)

(assert (=> b!868306 m!809485))

(declare-fun m!809487 () Bool)

(assert (=> b!868306 m!809487))

(declare-fun m!809489 () Bool)

(assert (=> mapNonEmpty!27044 m!809489))

(declare-fun m!809491 () Bool)

(assert (=> b!868300 m!809491))

(declare-fun m!809493 () Bool)

(assert (=> b!868308 m!809493))

(declare-fun m!809495 () Bool)

(assert (=> start!73894 m!809495))

(declare-fun m!809497 () Bool)

(assert (=> start!73894 m!809497))

(check-sat (not b!868307) (not b_next!14827) (not b!868300) (not b!868301) (not b!868304) (not b!868306) tp_is_empty!16963 (not mapNonEmpty!27044) (not b!868308) b_and!24553 (not start!73894))
(check-sat b_and!24553 (not b_next!14827))
