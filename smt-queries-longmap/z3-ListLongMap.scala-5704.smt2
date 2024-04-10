; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74010 () Bool)

(assert start!74010)

(declare-fun b_free!14925 () Bool)

(declare-fun b_next!14925 () Bool)

(assert (=> start!74010 (= b_free!14925 (not b_next!14925))))

(declare-fun tp!52279 () Bool)

(declare-fun b_and!24677 () Bool)

(assert (=> start!74010 (= tp!52279 b_and!24677)))

(declare-fun b!870303 () Bool)

(declare-fun e!484625 () Bool)

(declare-fun e!484626 () Bool)

(assert (=> b!870303 (= e!484625 e!484626)))

(declare-fun res!591502 () Bool)

(assert (=> b!870303 (=> (not res!591502) (not e!484626))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870303 (= res!591502 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27795 0))(
  ( (V!27796 (val!8578 Int)) )
))
(declare-datatypes ((tuple2!11396 0))(
  ( (tuple2!11397 (_1!5709 (_ BitVec 64)) (_2!5709 V!27795)) )
))
(declare-datatypes ((List!17188 0))(
  ( (Nil!17185) (Cons!17184 (h!18315 tuple2!11396) (t!24225 List!17188)) )
))
(declare-datatypes ((ListLongMap!10165 0))(
  ( (ListLongMap!10166 (toList!5098 List!17188)) )
))
(declare-fun lt!395090 () ListLongMap!10165)

(declare-datatypes ((array!50268 0))(
  ( (array!50269 (arr!24165 (Array (_ BitVec 32) (_ BitVec 64))) (size!24605 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50268)

(declare-datatypes ((ValueCell!8091 0))(
  ( (ValueCellFull!8091 (v!11003 V!27795)) (EmptyCell!8091) )
))
(declare-datatypes ((array!50270 0))(
  ( (array!50271 (arr!24166 (Array (_ BitVec 32) ValueCell!8091)) (size!24606 (_ BitVec 32))) )
))
(declare-fun lt!395091 () array!50270)

(declare-fun minValue!654 () V!27795)

(declare-fun zeroValue!654 () V!27795)

(declare-fun getCurrentListMapNoExtraKeys!3067 (array!50268 array!50270 (_ BitVec 32) (_ BitVec 32) V!27795 V!27795 (_ BitVec 32) Int) ListLongMap!10165)

(assert (=> b!870303 (= lt!395090 (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!395091 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27795)

(declare-fun _values!688 () array!50270)

(assert (=> b!870303 (= lt!395091 (array!50271 (store (arr!24166 _values!688) i!612 (ValueCellFull!8091 v!557)) (size!24606 _values!688)))))

(declare-fun lt!395092 () ListLongMap!10165)

(assert (=> b!870303 (= lt!395092 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870304 () Bool)

(declare-fun e!484624 () Bool)

(declare-fun tp_is_empty!17061 () Bool)

(assert (=> b!870304 (= e!484624 tp_is_empty!17061)))

(declare-fun b!870305 () Bool)

(declare-fun res!591505 () Bool)

(assert (=> b!870305 (=> (not res!591505) (not e!484625))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!870305 (= res!591505 (and (= (select (arr!24165 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870306 () Bool)

(declare-fun res!591508 () Bool)

(assert (=> b!870306 (=> (not res!591508) (not e!484625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870306 (= res!591508 (validMask!0 mask!1196))))

(declare-fun b!870307 () Bool)

(declare-fun res!591509 () Bool)

(assert (=> b!870307 (=> (not res!591509) (not e!484625))))

(declare-datatypes ((List!17189 0))(
  ( (Nil!17186) (Cons!17185 (h!18316 (_ BitVec 64)) (t!24226 List!17189)) )
))
(declare-fun arrayNoDuplicates!0 (array!50268 (_ BitVec 32) List!17189) Bool)

(assert (=> b!870307 (= res!591509 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17186))))

(declare-fun b!870308 () Bool)

(assert (=> b!870308 (= e!484626 (not true))))

(declare-fun +!2437 (ListLongMap!10165 tuple2!11396) ListLongMap!10165)

(assert (=> b!870308 (= (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!395091 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2437 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11397 k0!854 v!557)))))

(declare-datatypes ((Unit!29872 0))(
  ( (Unit!29873) )
))
(declare-fun lt!395089 () Unit!29872)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!631 (array!50268 array!50270 (_ BitVec 32) (_ BitVec 32) V!27795 V!27795 (_ BitVec 32) (_ BitVec 64) V!27795 (_ BitVec 32) Int) Unit!29872)

(assert (=> b!870308 (= lt!395089 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!631 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870309 () Bool)

(declare-fun res!591501 () Bool)

(assert (=> b!870309 (=> (not res!591501) (not e!484625))))

(assert (=> b!870309 (= res!591501 (and (= (size!24606 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24605 _keys!868) (size!24606 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870310 () Bool)

(declare-fun res!591503 () Bool)

(assert (=> b!870310 (=> (not res!591503) (not e!484625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50268 (_ BitVec 32)) Bool)

(assert (=> b!870310 (= res!591503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870311 () Bool)

(declare-fun res!591506 () Bool)

(assert (=> b!870311 (=> (not res!591506) (not e!484625))))

(assert (=> b!870311 (= res!591506 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24605 _keys!868))))))

(declare-fun res!591504 () Bool)

(assert (=> start!74010 (=> (not res!591504) (not e!484625))))

(assert (=> start!74010 (= res!591504 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24605 _keys!868))))))

(assert (=> start!74010 e!484625))

(assert (=> start!74010 tp_is_empty!17061))

(assert (=> start!74010 true))

(assert (=> start!74010 tp!52279))

(declare-fun array_inv!19084 (array!50268) Bool)

(assert (=> start!74010 (array_inv!19084 _keys!868)))

(declare-fun e!484627 () Bool)

(declare-fun array_inv!19085 (array!50270) Bool)

(assert (=> start!74010 (and (array_inv!19085 _values!688) e!484627)))

(declare-fun b!870312 () Bool)

(declare-fun res!591507 () Bool)

(assert (=> b!870312 (=> (not res!591507) (not e!484625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870312 (= res!591507 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27191 () Bool)

(declare-fun mapRes!27191 () Bool)

(assert (=> mapIsEmpty!27191 mapRes!27191))

(declare-fun b!870313 () Bool)

(assert (=> b!870313 (= e!484627 (and e!484624 mapRes!27191))))

(declare-fun condMapEmpty!27191 () Bool)

(declare-fun mapDefault!27191 () ValueCell!8091)

(assert (=> b!870313 (= condMapEmpty!27191 (= (arr!24166 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8091)) mapDefault!27191)))))

(declare-fun b!870314 () Bool)

(declare-fun e!484622 () Bool)

(assert (=> b!870314 (= e!484622 tp_is_empty!17061)))

(declare-fun mapNonEmpty!27191 () Bool)

(declare-fun tp!52278 () Bool)

(assert (=> mapNonEmpty!27191 (= mapRes!27191 (and tp!52278 e!484622))))

(declare-fun mapRest!27191 () (Array (_ BitVec 32) ValueCell!8091))

(declare-fun mapKey!27191 () (_ BitVec 32))

(declare-fun mapValue!27191 () ValueCell!8091)

(assert (=> mapNonEmpty!27191 (= (arr!24166 _values!688) (store mapRest!27191 mapKey!27191 mapValue!27191))))

(assert (= (and start!74010 res!591504) b!870306))

(assert (= (and b!870306 res!591508) b!870309))

(assert (= (and b!870309 res!591501) b!870310))

(assert (= (and b!870310 res!591503) b!870307))

(assert (= (and b!870307 res!591509) b!870311))

(assert (= (and b!870311 res!591506) b!870312))

(assert (= (and b!870312 res!591507) b!870305))

(assert (= (and b!870305 res!591505) b!870303))

(assert (= (and b!870303 res!591502) b!870308))

(assert (= (and b!870313 condMapEmpty!27191) mapIsEmpty!27191))

(assert (= (and b!870313 (not condMapEmpty!27191)) mapNonEmpty!27191))

(get-info :version)

(assert (= (and mapNonEmpty!27191 ((_ is ValueCellFull!8091) mapValue!27191)) b!870314))

(assert (= (and b!870313 ((_ is ValueCellFull!8091) mapDefault!27191)) b!870304))

(assert (= start!74010 b!870313))

(declare-fun m!811697 () Bool)

(assert (=> b!870303 m!811697))

(declare-fun m!811699 () Bool)

(assert (=> b!870303 m!811699))

(declare-fun m!811701 () Bool)

(assert (=> b!870303 m!811701))

(declare-fun m!811703 () Bool)

(assert (=> b!870305 m!811703))

(declare-fun m!811705 () Bool)

(assert (=> b!870307 m!811705))

(declare-fun m!811707 () Bool)

(assert (=> b!870308 m!811707))

(declare-fun m!811709 () Bool)

(assert (=> b!870308 m!811709))

(assert (=> b!870308 m!811709))

(declare-fun m!811711 () Bool)

(assert (=> b!870308 m!811711))

(declare-fun m!811713 () Bool)

(assert (=> b!870308 m!811713))

(declare-fun m!811715 () Bool)

(assert (=> b!870312 m!811715))

(declare-fun m!811717 () Bool)

(assert (=> mapNonEmpty!27191 m!811717))

(declare-fun m!811719 () Bool)

(assert (=> start!74010 m!811719))

(declare-fun m!811721 () Bool)

(assert (=> start!74010 m!811721))

(declare-fun m!811723 () Bool)

(assert (=> b!870310 m!811723))

(declare-fun m!811725 () Bool)

(assert (=> b!870306 m!811725))

(check-sat (not start!74010) b_and!24677 (not b!870308) (not b_next!14925) (not b!870303) (not b!870312) (not b!870310) (not b!870307) (not b!870306) (not mapNonEmpty!27191) tp_is_empty!17061)
(check-sat b_and!24677 (not b_next!14925))
