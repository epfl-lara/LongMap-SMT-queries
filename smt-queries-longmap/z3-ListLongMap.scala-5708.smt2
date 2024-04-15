; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74014 () Bool)

(assert start!74014)

(declare-fun b_free!14947 () Bool)

(declare-fun b_next!14947 () Bool)

(assert (=> start!74014 (= b_free!14947 (not b_next!14947))))

(declare-fun tp!52345 () Bool)

(declare-fun b_and!24673 () Bool)

(assert (=> start!74014 (= tp!52345 b_and!24673)))

(declare-fun b!870460 () Bool)

(declare-fun res!591694 () Bool)

(declare-fun e!484674 () Bool)

(assert (=> b!870460 (=> (not res!591694) (not e!484674))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50295 0))(
  ( (array!50296 (arr!24179 (Array (_ BitVec 32) (_ BitVec 64))) (size!24621 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50295)

(assert (=> b!870460 (= res!591694 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24621 _keys!868))))))

(declare-fun b!870461 () Bool)

(declare-fun res!591693 () Bool)

(assert (=> b!870461 (=> (not res!591693) (not e!484674))))

(declare-datatypes ((List!17205 0))(
  ( (Nil!17202) (Cons!17201 (h!18332 (_ BitVec 64)) (t!24233 List!17205)) )
))
(declare-fun arrayNoDuplicates!0 (array!50295 (_ BitVec 32) List!17205) Bool)

(assert (=> b!870461 (= res!591693 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17202))))

(declare-fun b!870462 () Bool)

(declare-fun e!484675 () Bool)

(declare-fun tp_is_empty!17083 () Bool)

(assert (=> b!870462 (= e!484675 tp_is_empty!17083)))

(declare-fun b!870463 () Bool)

(declare-fun res!591691 () Bool)

(assert (=> b!870463 (=> (not res!591691) (not e!484674))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50295 (_ BitVec 32)) Bool)

(assert (=> b!870463 (= res!591691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591695 () Bool)

(assert (=> start!74014 (=> (not res!591695) (not e!484674))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74014 (= res!591695 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24621 _keys!868))))))

(assert (=> start!74014 e!484674))

(assert (=> start!74014 tp_is_empty!17083))

(assert (=> start!74014 true))

(assert (=> start!74014 tp!52345))

(declare-fun array_inv!19152 (array!50295) Bool)

(assert (=> start!74014 (array_inv!19152 _keys!868)))

(declare-datatypes ((V!27825 0))(
  ( (V!27826 (val!8589 Int)) )
))
(declare-datatypes ((ValueCell!8102 0))(
  ( (ValueCellFull!8102 (v!11008 V!27825)) (EmptyCell!8102) )
))
(declare-datatypes ((array!50297 0))(
  ( (array!50298 (arr!24180 (Array (_ BitVec 32) ValueCell!8102)) (size!24622 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50297)

(declare-fun e!484676 () Bool)

(declare-fun array_inv!19153 (array!50297) Bool)

(assert (=> start!74014 (and (array_inv!19153 _values!688) e!484676)))

(declare-fun b!870464 () Bool)

(declare-fun res!591696 () Bool)

(assert (=> b!870464 (=> (not res!591696) (not e!484674))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!870464 (= res!591696 (and (= (select (arr!24179 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27224 () Bool)

(declare-fun mapRes!27224 () Bool)

(assert (=> mapIsEmpty!27224 mapRes!27224))

(declare-fun b!870465 () Bool)

(declare-fun res!591690 () Bool)

(assert (=> b!870465 (=> (not res!591690) (not e!484674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870465 (= res!591690 (validMask!0 mask!1196))))

(declare-fun b!870466 () Bool)

(declare-fun res!591692 () Bool)

(assert (=> b!870466 (=> (not res!591692) (not e!484674))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!870466 (= res!591692 (and (= (size!24622 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24621 _keys!868) (size!24622 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27224 () Bool)

(declare-fun tp!52346 () Bool)

(declare-fun e!484672 () Bool)

(assert (=> mapNonEmpty!27224 (= mapRes!27224 (and tp!52346 e!484672))))

(declare-fun mapKey!27224 () (_ BitVec 32))

(declare-fun mapValue!27224 () ValueCell!8102)

(declare-fun mapRest!27224 () (Array (_ BitVec 32) ValueCell!8102))

(assert (=> mapNonEmpty!27224 (= (arr!24180 _values!688) (store mapRest!27224 mapKey!27224 mapValue!27224))))

(declare-fun b!870467 () Bool)

(assert (=> b!870467 (= e!484672 tp_is_empty!17083)))

(declare-fun b!870468 () Bool)

(declare-fun e!484677 () Bool)

(assert (=> b!870468 (= e!484677 (not true))))

(declare-fun v!557 () V!27825)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394986 () array!50297)

(declare-fun minValue!654 () V!27825)

(declare-fun zeroValue!654 () V!27825)

(declare-datatypes ((tuple2!11428 0))(
  ( (tuple2!11429 (_1!5725 (_ BitVec 64)) (_2!5725 V!27825)) )
))
(declare-datatypes ((List!17206 0))(
  ( (Nil!17203) (Cons!17202 (h!18333 tuple2!11428) (t!24234 List!17206)) )
))
(declare-datatypes ((ListLongMap!10187 0))(
  ( (ListLongMap!10188 (toList!5109 List!17206)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3102 (array!50295 array!50297 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) Int) ListLongMap!10187)

(declare-fun +!2468 (ListLongMap!10187 tuple2!11428) ListLongMap!10187)

(assert (=> b!870468 (= (getCurrentListMapNoExtraKeys!3102 _keys!868 lt!394986 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2468 (getCurrentListMapNoExtraKeys!3102 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11429 k0!854 v!557)))))

(declare-datatypes ((Unit!29823 0))(
  ( (Unit!29824) )
))
(declare-fun lt!394988 () Unit!29823)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 (array!50295 array!50297 (_ BitVec 32) (_ BitVec 32) V!27825 V!27825 (_ BitVec 32) (_ BitVec 64) V!27825 (_ BitVec 32) Int) Unit!29823)

(assert (=> b!870468 (= lt!394988 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870469 () Bool)

(declare-fun res!591689 () Bool)

(assert (=> b!870469 (=> (not res!591689) (not e!484674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870469 (= res!591689 (validKeyInArray!0 k0!854))))

(declare-fun b!870470 () Bool)

(assert (=> b!870470 (= e!484674 e!484677)))

(declare-fun res!591688 () Bool)

(assert (=> b!870470 (=> (not res!591688) (not e!484677))))

(assert (=> b!870470 (= res!591688 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394987 () ListLongMap!10187)

(assert (=> b!870470 (= lt!394987 (getCurrentListMapNoExtraKeys!3102 _keys!868 lt!394986 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870470 (= lt!394986 (array!50298 (store (arr!24180 _values!688) i!612 (ValueCellFull!8102 v!557)) (size!24622 _values!688)))))

(declare-fun lt!394985 () ListLongMap!10187)

(assert (=> b!870470 (= lt!394985 (getCurrentListMapNoExtraKeys!3102 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870471 () Bool)

(assert (=> b!870471 (= e!484676 (and e!484675 mapRes!27224))))

(declare-fun condMapEmpty!27224 () Bool)

(declare-fun mapDefault!27224 () ValueCell!8102)

(assert (=> b!870471 (= condMapEmpty!27224 (= (arr!24180 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8102)) mapDefault!27224)))))

(assert (= (and start!74014 res!591695) b!870465))

(assert (= (and b!870465 res!591690) b!870466))

(assert (= (and b!870466 res!591692) b!870463))

(assert (= (and b!870463 res!591691) b!870461))

(assert (= (and b!870461 res!591693) b!870460))

(assert (= (and b!870460 res!591694) b!870469))

(assert (= (and b!870469 res!591689) b!870464))

(assert (= (and b!870464 res!591696) b!870470))

(assert (= (and b!870470 res!591688) b!870468))

(assert (= (and b!870471 condMapEmpty!27224) mapIsEmpty!27224))

(assert (= (and b!870471 (not condMapEmpty!27224)) mapNonEmpty!27224))

(get-info :version)

(assert (= (and mapNonEmpty!27224 ((_ is ValueCellFull!8102) mapValue!27224)) b!870467))

(assert (= (and b!870471 ((_ is ValueCellFull!8102) mapDefault!27224)) b!870462))

(assert (= start!74014 b!870471))

(declare-fun m!811269 () Bool)

(assert (=> b!870461 m!811269))

(declare-fun m!811271 () Bool)

(assert (=> b!870469 m!811271))

(declare-fun m!811273 () Bool)

(assert (=> b!870463 m!811273))

(declare-fun m!811275 () Bool)

(assert (=> b!870470 m!811275))

(declare-fun m!811277 () Bool)

(assert (=> b!870470 m!811277))

(declare-fun m!811279 () Bool)

(assert (=> b!870470 m!811279))

(declare-fun m!811281 () Bool)

(assert (=> b!870464 m!811281))

(declare-fun m!811283 () Bool)

(assert (=> b!870465 m!811283))

(declare-fun m!811285 () Bool)

(assert (=> mapNonEmpty!27224 m!811285))

(declare-fun m!811287 () Bool)

(assert (=> b!870468 m!811287))

(declare-fun m!811289 () Bool)

(assert (=> b!870468 m!811289))

(assert (=> b!870468 m!811289))

(declare-fun m!811291 () Bool)

(assert (=> b!870468 m!811291))

(declare-fun m!811293 () Bool)

(assert (=> b!870468 m!811293))

(declare-fun m!811295 () Bool)

(assert (=> start!74014 m!811295))

(declare-fun m!811297 () Bool)

(assert (=> start!74014 m!811297))

(check-sat (not start!74014) (not b!870469) (not b!870468) (not mapNonEmpty!27224) tp_is_empty!17083 (not b_next!14947) (not b!870461) (not b!870465) b_and!24673 (not b!870463) (not b!870470))
(check-sat b_and!24673 (not b_next!14947))
