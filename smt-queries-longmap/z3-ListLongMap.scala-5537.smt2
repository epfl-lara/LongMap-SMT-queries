; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73174 () Bool)

(assert start!73174)

(declare-fun b_free!13921 () Bool)

(declare-fun b_next!13921 () Bool)

(assert (=> start!73174 (= b_free!13921 (not b_next!13921))))

(declare-fun tp!49268 () Bool)

(declare-fun b_and!23017 () Bool)

(assert (=> start!73174 (= tp!49268 b_and!23017)))

(declare-fun b!849207 () Bool)

(declare-fun e!473900 () Bool)

(declare-fun e!473895 () Bool)

(declare-fun mapRes!25685 () Bool)

(assert (=> b!849207 (= e!473900 (and e!473895 mapRes!25685))))

(declare-fun condMapEmpty!25685 () Bool)

(declare-datatypes ((V!26457 0))(
  ( (V!26458 (val!8076 Int)) )
))
(declare-datatypes ((ValueCell!7589 0))(
  ( (ValueCellFull!7589 (v!10501 V!26457)) (EmptyCell!7589) )
))
(declare-datatypes ((array!48373 0))(
  ( (array!48374 (arr!23213 (Array (_ BitVec 32) ValueCell!7589)) (size!23654 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48373)

(declare-fun mapDefault!25685 () ValueCell!7589)

(assert (=> b!849207 (= condMapEmpty!25685 (= (arr!23213 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7589)) mapDefault!25685)))))

(declare-fun v!557 () V!26457)

(declare-datatypes ((tuple2!10486 0))(
  ( (tuple2!10487 (_1!5254 (_ BitVec 64)) (_2!5254 V!26457)) )
))
(declare-datatypes ((List!16356 0))(
  ( (Nil!16353) (Cons!16352 (h!17489 tuple2!10486) (t!22719 List!16356)) )
))
(declare-datatypes ((ListLongMap!9257 0))(
  ( (ListLongMap!9258 (toList!4644 List!16356)) )
))
(declare-fun call!37664 () ListLongMap!9257)

(declare-fun b!849208 () Bool)

(declare-fun call!37663 () ListLongMap!9257)

(declare-fun e!473901 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2100 (ListLongMap!9257 tuple2!10486) ListLongMap!9257)

(assert (=> b!849208 (= e!473901 (= call!37663 (+!2100 call!37664 (tuple2!10487 k0!854 v!557))))))

(declare-fun b!849209 () Bool)

(declare-fun res!576686 () Bool)

(declare-fun e!473902 () Bool)

(assert (=> b!849209 (=> (not res!576686) (not e!473902))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849209 (= res!576686 (validMask!0 mask!1196))))

(declare-fun b!849210 () Bool)

(declare-fun e!473897 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48375 0))(
  ( (array!48376 (arr!23214 (Array (_ BitVec 32) (_ BitVec 64))) (size!23655 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48375)

(assert (=> b!849210 (= e!473897 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23655 _keys!868))))))

(declare-fun mapNonEmpty!25685 () Bool)

(declare-fun tp!49267 () Bool)

(declare-fun e!473896 () Bool)

(assert (=> mapNonEmpty!25685 (= mapRes!25685 (and tp!49267 e!473896))))

(declare-fun mapValue!25685 () ValueCell!7589)

(declare-fun mapKey!25685 () (_ BitVec 32))

(declare-fun mapRest!25685 () (Array (_ BitVec 32) ValueCell!7589))

(assert (=> mapNonEmpty!25685 (= (arr!23213 _values!688) (store mapRest!25685 mapKey!25685 mapValue!25685))))

(declare-fun res!576688 () Bool)

(assert (=> start!73174 (=> (not res!576688) (not e!473902))))

(assert (=> start!73174 (= res!576688 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23655 _keys!868))))))

(assert (=> start!73174 e!473902))

(declare-fun tp_is_empty!16057 () Bool)

(assert (=> start!73174 tp_is_empty!16057))

(assert (=> start!73174 true))

(assert (=> start!73174 tp!49268))

(declare-fun array_inv!18482 (array!48375) Bool)

(assert (=> start!73174 (array_inv!18482 _keys!868)))

(declare-fun array_inv!18483 (array!48373) Bool)

(assert (=> start!73174 (and (array_inv!18483 _values!688) e!473900)))

(declare-fun b!849211 () Bool)

(declare-fun e!473898 () Bool)

(assert (=> b!849211 (= e!473902 e!473898)))

(declare-fun res!576685 () Bool)

(assert (=> b!849211 (=> (not res!576685) (not e!473898))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849211 (= res!576685 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!382344 () array!48373)

(declare-fun minValue!654 () V!26457)

(declare-fun zeroValue!654 () V!26457)

(declare-fun lt!382343 () ListLongMap!9257)

(declare-fun getCurrentListMapNoExtraKeys!2702 (array!48375 array!48373 (_ BitVec 32) (_ BitVec 32) V!26457 V!26457 (_ BitVec 32) Int) ListLongMap!9257)

(assert (=> b!849211 (= lt!382343 (getCurrentListMapNoExtraKeys!2702 _keys!868 lt!382344 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849211 (= lt!382344 (array!48374 (store (arr!23213 _values!688) i!612 (ValueCellFull!7589 v!557)) (size!23654 _values!688)))))

(declare-fun lt!382345 () ListLongMap!9257)

(assert (=> b!849211 (= lt!382345 (getCurrentListMapNoExtraKeys!2702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849212 () Bool)

(declare-fun res!576682 () Bool)

(assert (=> b!849212 (=> (not res!576682) (not e!473902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48375 (_ BitVec 32)) Bool)

(assert (=> b!849212 (= res!576682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37660 () Bool)

(assert (=> bm!37660 (= call!37663 (getCurrentListMapNoExtraKeys!2702 _keys!868 lt!382344 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849213 () Bool)

(declare-fun res!576683 () Bool)

(assert (=> b!849213 (=> (not res!576683) (not e!473902))))

(assert (=> b!849213 (= res!576683 (and (= (select (arr!23214 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849214 () Bool)

(assert (=> b!849214 (= e!473898 (not e!473897))))

(declare-fun res!576690 () Bool)

(assert (=> b!849214 (=> res!576690 e!473897)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849214 (= res!576690 (not (validKeyInArray!0 (select (arr!23214 _keys!868) from!1053))))))

(assert (=> b!849214 e!473901))

(declare-fun c!91834 () Bool)

(assert (=> b!849214 (= c!91834 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28976 0))(
  ( (Unit!28977) )
))
(declare-fun lt!382346 () Unit!28976)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 (array!48375 array!48373 (_ BitVec 32) (_ BitVec 32) V!26457 V!26457 (_ BitVec 32) (_ BitVec 64) V!26457 (_ BitVec 32) Int) Unit!28976)

(assert (=> b!849214 (= lt!382346 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849215 () Bool)

(assert (=> b!849215 (= e!473895 tp_is_empty!16057)))

(declare-fun bm!37661 () Bool)

(assert (=> bm!37661 (= call!37664 (getCurrentListMapNoExtraKeys!2702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849216 () Bool)

(assert (=> b!849216 (= e!473896 tp_is_empty!16057)))

(declare-fun b!849217 () Bool)

(declare-fun res!576691 () Bool)

(assert (=> b!849217 (=> (not res!576691) (not e!473902))))

(assert (=> b!849217 (= res!576691 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23655 _keys!868))))))

(declare-fun b!849218 () Bool)

(declare-fun res!576689 () Bool)

(assert (=> b!849218 (=> (not res!576689) (not e!473902))))

(assert (=> b!849218 (= res!576689 (validKeyInArray!0 k0!854))))

(declare-fun b!849219 () Bool)

(declare-fun res!576684 () Bool)

(assert (=> b!849219 (=> (not res!576684) (not e!473902))))

(assert (=> b!849219 (= res!576684 (and (= (size!23654 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23655 _keys!868) (size!23654 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25685 () Bool)

(assert (=> mapIsEmpty!25685 mapRes!25685))

(declare-fun b!849220 () Bool)

(assert (=> b!849220 (= e!473901 (= call!37663 call!37664))))

(declare-fun b!849221 () Bool)

(declare-fun res!576687 () Bool)

(assert (=> b!849221 (=> (not res!576687) (not e!473902))))

(declare-datatypes ((List!16357 0))(
  ( (Nil!16354) (Cons!16353 (h!17490 (_ BitVec 64)) (t!22720 List!16357)) )
))
(declare-fun arrayNoDuplicates!0 (array!48375 (_ BitVec 32) List!16357) Bool)

(assert (=> b!849221 (= res!576687 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16354))))

(assert (= (and start!73174 res!576688) b!849209))

(assert (= (and b!849209 res!576686) b!849219))

(assert (= (and b!849219 res!576684) b!849212))

(assert (= (and b!849212 res!576682) b!849221))

(assert (= (and b!849221 res!576687) b!849217))

(assert (= (and b!849217 res!576691) b!849218))

(assert (= (and b!849218 res!576689) b!849213))

(assert (= (and b!849213 res!576683) b!849211))

(assert (= (and b!849211 res!576685) b!849214))

(assert (= (and b!849214 c!91834) b!849208))

(assert (= (and b!849214 (not c!91834)) b!849220))

(assert (= (or b!849208 b!849220) bm!37660))

(assert (= (or b!849208 b!849220) bm!37661))

(assert (= (and b!849214 (not res!576690)) b!849210))

(assert (= (and b!849207 condMapEmpty!25685) mapIsEmpty!25685))

(assert (= (and b!849207 (not condMapEmpty!25685)) mapNonEmpty!25685))

(get-info :version)

(assert (= (and mapNonEmpty!25685 ((_ is ValueCellFull!7589) mapValue!25685)) b!849216))

(assert (= (and b!849207 ((_ is ValueCellFull!7589) mapDefault!25685)) b!849215))

(assert (= start!73174 b!849207))

(declare-fun m!790415 () Bool)

(assert (=> b!849221 m!790415))

(declare-fun m!790417 () Bool)

(assert (=> b!849212 m!790417))

(declare-fun m!790419 () Bool)

(assert (=> bm!37661 m!790419))

(declare-fun m!790421 () Bool)

(assert (=> b!849213 m!790421))

(declare-fun m!790423 () Bool)

(assert (=> b!849214 m!790423))

(assert (=> b!849214 m!790423))

(declare-fun m!790425 () Bool)

(assert (=> b!849214 m!790425))

(declare-fun m!790427 () Bool)

(assert (=> b!849214 m!790427))

(declare-fun m!790429 () Bool)

(assert (=> start!73174 m!790429))

(declare-fun m!790431 () Bool)

(assert (=> start!73174 m!790431))

(declare-fun m!790433 () Bool)

(assert (=> b!849211 m!790433))

(declare-fun m!790435 () Bool)

(assert (=> b!849211 m!790435))

(declare-fun m!790437 () Bool)

(assert (=> b!849211 m!790437))

(declare-fun m!790439 () Bool)

(assert (=> b!849208 m!790439))

(declare-fun m!790441 () Bool)

(assert (=> bm!37660 m!790441))

(declare-fun m!790443 () Bool)

(assert (=> b!849218 m!790443))

(declare-fun m!790445 () Bool)

(assert (=> mapNonEmpty!25685 m!790445))

(declare-fun m!790447 () Bool)

(assert (=> b!849209 m!790447))

(check-sat (not start!73174) b_and!23017 (not bm!37660) (not b!849218) (not mapNonEmpty!25685) (not b!849209) (not bm!37661) (not b!849208) (not b!849212) (not b_next!13921) tp_is_empty!16057 (not b!849211) (not b!849221) (not b!849214))
(check-sat b_and!23017 (not b_next!13921))
