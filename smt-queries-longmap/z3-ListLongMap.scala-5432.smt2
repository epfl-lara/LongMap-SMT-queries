; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72358 () Bool)

(assert start!72358)

(declare-fun b_free!13561 () Bool)

(declare-fun b_next!13561 () Bool)

(assert (=> start!72358 (= b_free!13561 (not b_next!13561))))

(declare-fun tp!47782 () Bool)

(declare-fun b_and!22621 () Bool)

(assert (=> start!72358 (= tp!47782 b_and!22621)))

(declare-fun b!838513 () Bool)

(declare-fun res!570218 () Bool)

(declare-fun e!468016 () Bool)

(assert (=> b!838513 (=> (not res!570218) (not e!468016))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47115 0))(
  ( (array!47116 (arr!22589 (Array (_ BitVec 32) (_ BitVec 64))) (size!23031 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47115)

(assert (=> b!838513 (= res!570218 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23031 _keys!868))))))

(declare-fun b!838514 () Bool)

(declare-fun res!570214 () Bool)

(assert (=> b!838514 (=> (not res!570214) (not e!468016))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838514 (= res!570214 (validKeyInArray!0 k0!854))))

(declare-fun b!838515 () Bool)

(declare-fun e!468015 () Bool)

(declare-fun tp_is_empty!15427 () Bool)

(assert (=> b!838515 (= e!468015 tp_is_empty!15427)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!25617 0))(
  ( (V!25618 (val!7761 Int)) )
))
(declare-datatypes ((tuple2!10280 0))(
  ( (tuple2!10281 (_1!5151 (_ BitVec 64)) (_2!5151 V!25617)) )
))
(declare-datatypes ((List!16073 0))(
  ( (Nil!16070) (Cons!16069 (h!17200 tuple2!10280) (t!22435 List!16073)) )
))
(declare-datatypes ((ListLongMap!9039 0))(
  ( (ListLongMap!9040 (toList!4535 List!16073)) )
))
(declare-fun call!36891 () ListLongMap!9039)

(declare-fun bm!36887 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7274 0))(
  ( (ValueCellFull!7274 (v!10180 V!25617)) (EmptyCell!7274) )
))
(declare-datatypes ((array!47117 0))(
  ( (array!47118 (arr!22590 (Array (_ BitVec 32) ValueCell!7274)) (size!23032 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47117)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25617)

(declare-fun zeroValue!654 () V!25617)

(declare-fun getCurrentListMapNoExtraKeys!2555 (array!47115 array!47117 (_ BitVec 32) (_ BitVec 32) V!25617 V!25617 (_ BitVec 32) Int) ListLongMap!9039)

(assert (=> bm!36887 (= call!36891 (getCurrentListMapNoExtraKeys!2555 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838516 () Bool)

(declare-fun res!570216 () Bool)

(assert (=> b!838516 (=> (not res!570216) (not e!468016))))

(declare-datatypes ((List!16074 0))(
  ( (Nil!16071) (Cons!16070 (h!17201 (_ BitVec 64)) (t!22436 List!16074)) )
))
(declare-fun arrayNoDuplicates!0 (array!47115 (_ BitVec 32) List!16074) Bool)

(assert (=> b!838516 (= res!570216 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16071))))

(declare-fun b!838517 () Bool)

(declare-fun res!570215 () Bool)

(assert (=> b!838517 (=> (not res!570215) (not e!468016))))

(assert (=> b!838517 (= res!570215 (and (= (size!23032 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23031 _keys!868) (size!23032 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838518 () Bool)

(declare-fun e!468017 () Bool)

(declare-fun call!36890 () ListLongMap!9039)

(assert (=> b!838518 (= e!468017 (= call!36890 call!36891))))

(declare-fun b!838519 () Bool)

(declare-fun e!468018 () Bool)

(assert (=> b!838519 (= e!468018 tp_is_empty!15427)))

(declare-fun v!557 () V!25617)

(declare-fun bm!36888 () Bool)

(assert (=> bm!36888 (= call!36890 (getCurrentListMapNoExtraKeys!2555 _keys!868 (array!47118 (store (arr!22590 _values!688) i!612 (ValueCellFull!7274 v!557)) (size!23032 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838512 () Bool)

(declare-fun res!570217 () Bool)

(assert (=> b!838512 (=> (not res!570217) (not e!468016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47115 (_ BitVec 32)) Bool)

(assert (=> b!838512 (= res!570217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!570219 () Bool)

(assert (=> start!72358 (=> (not res!570219) (not e!468016))))

(assert (=> start!72358 (= res!570219 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23031 _keys!868))))))

(assert (=> start!72358 e!468016))

(assert (=> start!72358 tp_is_empty!15427))

(assert (=> start!72358 true))

(assert (=> start!72358 tp!47782))

(declare-fun array_inv!18062 (array!47115) Bool)

(assert (=> start!72358 (array_inv!18062 _keys!868)))

(declare-fun e!468014 () Bool)

(declare-fun array_inv!18063 (array!47117) Bool)

(assert (=> start!72358 (and (array_inv!18063 _values!688) e!468014)))

(declare-fun b!838520 () Bool)

(declare-fun +!2034 (ListLongMap!9039 tuple2!10280) ListLongMap!9039)

(assert (=> b!838520 (= e!468017 (= call!36890 (+!2034 call!36891 (tuple2!10281 k0!854 v!557))))))

(declare-fun b!838521 () Bool)

(assert (=> b!838521 (= e!468016 (not true))))

(assert (=> b!838521 e!468017))

(declare-fun c!91136 () Bool)

(assert (=> b!838521 (= c!91136 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28747 0))(
  ( (Unit!28748) )
))
(declare-fun lt!380471 () Unit!28747)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 (array!47115 array!47117 (_ BitVec 32) (_ BitVec 32) V!25617 V!25617 (_ BitVec 32) (_ BitVec 64) V!25617 (_ BitVec 32) Int) Unit!28747)

(assert (=> b!838521 (= lt!380471 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24740 () Bool)

(declare-fun mapRes!24740 () Bool)

(declare-fun tp!47783 () Bool)

(assert (=> mapNonEmpty!24740 (= mapRes!24740 (and tp!47783 e!468015))))

(declare-fun mapKey!24740 () (_ BitVec 32))

(declare-fun mapValue!24740 () ValueCell!7274)

(declare-fun mapRest!24740 () (Array (_ BitVec 32) ValueCell!7274))

(assert (=> mapNonEmpty!24740 (= (arr!22590 _values!688) (store mapRest!24740 mapKey!24740 mapValue!24740))))

(declare-fun mapIsEmpty!24740 () Bool)

(assert (=> mapIsEmpty!24740 mapRes!24740))

(declare-fun b!838522 () Bool)

(declare-fun res!570212 () Bool)

(assert (=> b!838522 (=> (not res!570212) (not e!468016))))

(assert (=> b!838522 (= res!570212 (and (= (select (arr!22589 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23031 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838523 () Bool)

(assert (=> b!838523 (= e!468014 (and e!468018 mapRes!24740))))

(declare-fun condMapEmpty!24740 () Bool)

(declare-fun mapDefault!24740 () ValueCell!7274)

(assert (=> b!838523 (= condMapEmpty!24740 (= (arr!22590 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7274)) mapDefault!24740)))))

(declare-fun b!838524 () Bool)

(declare-fun res!570213 () Bool)

(assert (=> b!838524 (=> (not res!570213) (not e!468016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838524 (= res!570213 (validMask!0 mask!1196))))

(assert (= (and start!72358 res!570219) b!838524))

(assert (= (and b!838524 res!570213) b!838517))

(assert (= (and b!838517 res!570215) b!838512))

(assert (= (and b!838512 res!570217) b!838516))

(assert (= (and b!838516 res!570216) b!838513))

(assert (= (and b!838513 res!570218) b!838514))

(assert (= (and b!838514 res!570214) b!838522))

(assert (= (and b!838522 res!570212) b!838521))

(assert (= (and b!838521 c!91136) b!838520))

(assert (= (and b!838521 (not c!91136)) b!838518))

(assert (= (or b!838520 b!838518) bm!36888))

(assert (= (or b!838520 b!838518) bm!36887))

(assert (= (and b!838523 condMapEmpty!24740) mapIsEmpty!24740))

(assert (= (and b!838523 (not condMapEmpty!24740)) mapNonEmpty!24740))

(get-info :version)

(assert (= (and mapNonEmpty!24740 ((_ is ValueCellFull!7274) mapValue!24740)) b!838515))

(assert (= (and b!838523 ((_ is ValueCellFull!7274) mapDefault!24740)) b!838519))

(assert (= start!72358 b!838523))

(declare-fun m!782333 () Bool)

(assert (=> b!838514 m!782333))

(declare-fun m!782335 () Bool)

(assert (=> b!838520 m!782335))

(declare-fun m!782337 () Bool)

(assert (=> b!838522 m!782337))

(declare-fun m!782339 () Bool)

(assert (=> mapNonEmpty!24740 m!782339))

(declare-fun m!782341 () Bool)

(assert (=> b!838521 m!782341))

(declare-fun m!782343 () Bool)

(assert (=> bm!36888 m!782343))

(declare-fun m!782345 () Bool)

(assert (=> bm!36888 m!782345))

(declare-fun m!782347 () Bool)

(assert (=> b!838516 m!782347))

(declare-fun m!782349 () Bool)

(assert (=> bm!36887 m!782349))

(declare-fun m!782351 () Bool)

(assert (=> b!838524 m!782351))

(declare-fun m!782353 () Bool)

(assert (=> start!72358 m!782353))

(declare-fun m!782355 () Bool)

(assert (=> start!72358 m!782355))

(declare-fun m!782357 () Bool)

(assert (=> b!838512 m!782357))

(check-sat (not start!72358) (not bm!36888) (not b!838516) (not b!838512) (not bm!36887) b_and!22621 (not b!838524) (not mapNonEmpty!24740) (not b!838514) (not b!838520) (not b_next!13561) (not b!838521) tp_is_empty!15427)
(check-sat b_and!22621 (not b_next!13561))
