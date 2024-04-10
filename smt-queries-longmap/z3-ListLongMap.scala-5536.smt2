; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73002 () Bool)

(assert start!73002)

(declare-fun b_free!13917 () Bool)

(declare-fun b_next!13917 () Bool)

(assert (=> start!73002 (= b_free!13917 (not b_next!13917))))

(declare-fun tp!49255 () Bool)

(declare-fun b_and!23003 () Bool)

(assert (=> start!73002 (= tp!49255 b_and!23003)))

(declare-datatypes ((V!26451 0))(
  ( (V!26452 (val!8074 Int)) )
))
(declare-datatypes ((ValueCell!7587 0))(
  ( (ValueCellFull!7587 (v!10499 V!26451)) (EmptyCell!7587) )
))
(declare-datatypes ((array!48316 0))(
  ( (array!48317 (arr!23189 (Array (_ BitVec 32) ValueCell!7587)) (size!23629 (_ BitVec 32))) )
))
(declare-fun lt!381961 () array!48316)

(declare-datatypes ((tuple2!10558 0))(
  ( (tuple2!10559 (_1!5290 (_ BitVec 64)) (_2!5290 V!26451)) )
))
(declare-datatypes ((List!16414 0))(
  ( (Nil!16411) (Cons!16410 (h!17541 tuple2!10558) (t!22785 List!16414)) )
))
(declare-datatypes ((ListLongMap!9327 0))(
  ( (ListLongMap!9328 (toList!4679 List!16414)) )
))
(declare-fun call!37607 () ListLongMap!9327)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37603 () Bool)

(declare-datatypes ((array!48318 0))(
  ( (array!48319 (arr!23190 (Array (_ BitVec 32) (_ BitVec 64))) (size!23630 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48318)

(declare-fun _values!688 () array!48316)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26451)

(declare-fun zeroValue!654 () V!26451)

(declare-fun c!91546 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2662 (array!48318 array!48316 (_ BitVec 32) (_ BitVec 32) V!26451 V!26451 (_ BitVec 32) Int) ListLongMap!9327)

(assert (=> bm!37603 (= call!37607 (getCurrentListMapNoExtraKeys!2662 _keys!868 (ite c!91546 _values!688 lt!381961) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848218 () Bool)

(declare-fun e!473274 () Bool)

(declare-fun tp_is_empty!16053 () Bool)

(assert (=> b!848218 (= e!473274 tp_is_empty!16053)))

(declare-fun b!848219 () Bool)

(declare-fun e!473272 () Bool)

(assert (=> b!848219 (= e!473272 (not true))))

(declare-fun e!473271 () Bool)

(assert (=> b!848219 e!473271))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848219 (= c!91546 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26451)

(declare-datatypes ((Unit!28971 0))(
  ( (Unit!28972) )
))
(declare-fun lt!381959 () Unit!28971)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 (array!48318 array!48316 (_ BitVec 32) (_ BitVec 32) V!26451 V!26451 (_ BitVec 32) (_ BitVec 64) V!26451 (_ BitVec 32) Int) Unit!28971)

(assert (=> b!848219 (= lt!381959 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848220 () Bool)

(declare-fun call!37606 () ListLongMap!9327)

(assert (=> b!848220 (= e!473271 (= call!37607 call!37606))))

(declare-fun b!848221 () Bool)

(declare-fun res!576287 () Bool)

(declare-fun e!473273 () Bool)

(assert (=> b!848221 (=> (not res!576287) (not e!473273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848221 (= res!576287 (validMask!0 mask!1196))))

(declare-fun b!848222 () Bool)

(declare-fun res!576286 () Bool)

(assert (=> b!848222 (=> (not res!576286) (not e!473273))))

(declare-datatypes ((List!16415 0))(
  ( (Nil!16412) (Cons!16411 (h!17542 (_ BitVec 64)) (t!22786 List!16415)) )
))
(declare-fun arrayNoDuplicates!0 (array!48318 (_ BitVec 32) List!16415) Bool)

(assert (=> b!848222 (= res!576286 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16412))))

(declare-fun bm!37604 () Bool)

(assert (=> bm!37604 (= call!37606 (getCurrentListMapNoExtraKeys!2662 _keys!868 (ite c!91546 lt!381961 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576288 () Bool)

(assert (=> start!73002 (=> (not res!576288) (not e!473273))))

(assert (=> start!73002 (= res!576288 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23630 _keys!868))))))

(assert (=> start!73002 e!473273))

(assert (=> start!73002 tp_is_empty!16053))

(assert (=> start!73002 true))

(assert (=> start!73002 tp!49255))

(declare-fun array_inv!18412 (array!48318) Bool)

(assert (=> start!73002 (array_inv!18412 _keys!868)))

(declare-fun e!473270 () Bool)

(declare-fun array_inv!18413 (array!48316) Bool)

(assert (=> start!73002 (and (array_inv!18413 _values!688) e!473270)))

(declare-fun b!848223 () Bool)

(declare-fun e!473275 () Bool)

(assert (=> b!848223 (= e!473275 tp_is_empty!16053)))

(declare-fun b!848224 () Bool)

(declare-fun res!576284 () Bool)

(assert (=> b!848224 (=> (not res!576284) (not e!473273))))

(assert (=> b!848224 (= res!576284 (and (= (size!23629 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23630 _keys!868) (size!23629 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848225 () Bool)

(declare-fun res!576289 () Bool)

(assert (=> b!848225 (=> (not res!576289) (not e!473273))))

(assert (=> b!848225 (= res!576289 (and (= (select (arr!23190 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848226 () Bool)

(declare-fun res!576282 () Bool)

(assert (=> b!848226 (=> (not res!576282) (not e!473273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848226 (= res!576282 (validKeyInArray!0 k0!854))))

(declare-fun b!848227 () Bool)

(assert (=> b!848227 (= e!473273 e!473272)))

(declare-fun res!576290 () Bool)

(assert (=> b!848227 (=> (not res!576290) (not e!473272))))

(assert (=> b!848227 (= res!576290 (= from!1053 i!612))))

(declare-fun lt!381958 () ListLongMap!9327)

(assert (=> b!848227 (= lt!381958 (getCurrentListMapNoExtraKeys!2662 _keys!868 lt!381961 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848227 (= lt!381961 (array!48317 (store (arr!23189 _values!688) i!612 (ValueCellFull!7587 v!557)) (size!23629 _values!688)))))

(declare-fun lt!381960 () ListLongMap!9327)

(assert (=> b!848227 (= lt!381960 (getCurrentListMapNoExtraKeys!2662 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848228 () Bool)

(declare-fun res!576285 () Bool)

(assert (=> b!848228 (=> (not res!576285) (not e!473273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48318 (_ BitVec 32)) Bool)

(assert (=> b!848228 (= res!576285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848229 () Bool)

(declare-fun res!576283 () Bool)

(assert (=> b!848229 (=> (not res!576283) (not e!473273))))

(assert (=> b!848229 (= res!576283 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23630 _keys!868))))))

(declare-fun mapNonEmpty!25679 () Bool)

(declare-fun mapRes!25679 () Bool)

(declare-fun tp!49254 () Bool)

(assert (=> mapNonEmpty!25679 (= mapRes!25679 (and tp!49254 e!473275))))

(declare-fun mapRest!25679 () (Array (_ BitVec 32) ValueCell!7587))

(declare-fun mapKey!25679 () (_ BitVec 32))

(declare-fun mapValue!25679 () ValueCell!7587)

(assert (=> mapNonEmpty!25679 (= (arr!23189 _values!688) (store mapRest!25679 mapKey!25679 mapValue!25679))))

(declare-fun b!848230 () Bool)

(declare-fun +!2091 (ListLongMap!9327 tuple2!10558) ListLongMap!9327)

(assert (=> b!848230 (= e!473271 (= call!37606 (+!2091 call!37607 (tuple2!10559 k0!854 v!557))))))

(declare-fun b!848231 () Bool)

(assert (=> b!848231 (= e!473270 (and e!473274 mapRes!25679))))

(declare-fun condMapEmpty!25679 () Bool)

(declare-fun mapDefault!25679 () ValueCell!7587)

(assert (=> b!848231 (= condMapEmpty!25679 (= (arr!23189 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7587)) mapDefault!25679)))))

(declare-fun mapIsEmpty!25679 () Bool)

(assert (=> mapIsEmpty!25679 mapRes!25679))

(assert (= (and start!73002 res!576288) b!848221))

(assert (= (and b!848221 res!576287) b!848224))

(assert (= (and b!848224 res!576284) b!848228))

(assert (= (and b!848228 res!576285) b!848222))

(assert (= (and b!848222 res!576286) b!848229))

(assert (= (and b!848229 res!576283) b!848226))

(assert (= (and b!848226 res!576282) b!848225))

(assert (= (and b!848225 res!576289) b!848227))

(assert (= (and b!848227 res!576290) b!848219))

(assert (= (and b!848219 c!91546) b!848230))

(assert (= (and b!848219 (not c!91546)) b!848220))

(assert (= (or b!848230 b!848220) bm!37603))

(assert (= (or b!848230 b!848220) bm!37604))

(assert (= (and b!848231 condMapEmpty!25679) mapIsEmpty!25679))

(assert (= (and b!848231 (not condMapEmpty!25679)) mapNonEmpty!25679))

(get-info :version)

(assert (= (and mapNonEmpty!25679 ((_ is ValueCellFull!7587) mapValue!25679)) b!848223))

(assert (= (and b!848231 ((_ is ValueCellFull!7587) mapDefault!25679)) b!848218))

(assert (= start!73002 b!848231))

(declare-fun m!789063 () Bool)

(assert (=> b!848219 m!789063))

(declare-fun m!789065 () Bool)

(assert (=> b!848221 m!789065))

(declare-fun m!789067 () Bool)

(assert (=> b!848230 m!789067))

(declare-fun m!789069 () Bool)

(assert (=> b!848225 m!789069))

(declare-fun m!789071 () Bool)

(assert (=> b!848227 m!789071))

(declare-fun m!789073 () Bool)

(assert (=> b!848227 m!789073))

(declare-fun m!789075 () Bool)

(assert (=> b!848227 m!789075))

(declare-fun m!789077 () Bool)

(assert (=> b!848222 m!789077))

(declare-fun m!789079 () Bool)

(assert (=> mapNonEmpty!25679 m!789079))

(declare-fun m!789081 () Bool)

(assert (=> b!848226 m!789081))

(declare-fun m!789083 () Bool)

(assert (=> bm!37604 m!789083))

(declare-fun m!789085 () Bool)

(assert (=> bm!37603 m!789085))

(declare-fun m!789087 () Bool)

(assert (=> b!848228 m!789087))

(declare-fun m!789089 () Bool)

(assert (=> start!73002 m!789089))

(declare-fun m!789091 () Bool)

(assert (=> start!73002 m!789091))

(check-sat (not start!73002) (not b!848228) (not bm!37604) (not b!848222) tp_is_empty!16053 (not b!848221) (not b!848230) (not b_next!13917) (not b!848226) (not b!848219) (not mapNonEmpty!25679) b_and!23003 (not bm!37603) (not b!848227))
(check-sat b_and!23003 (not b_next!13917))
