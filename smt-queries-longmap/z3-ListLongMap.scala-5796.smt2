; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74932 () Bool)

(assert start!74932)

(declare-fun b_free!15367 () Bool)

(declare-fun b_next!15367 () Bool)

(assert (=> start!74932 (= b_free!15367 (not b_next!15367))))

(declare-fun tp!53795 () Bool)

(declare-fun b_and!25395 () Bool)

(assert (=> start!74932 (= tp!53795 b_and!25395)))

(declare-fun b!882274 () Bool)

(declare-fun res!599123 () Bool)

(declare-fun e!491079 () Bool)

(assert (=> b!882274 (=> (not res!599123) (not e!491079))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882274 (= res!599123 (validMask!0 mask!1196))))

(declare-fun b!882275 () Bool)

(declare-fun res!599133 () Bool)

(assert (=> b!882275 (=> (not res!599133) (not e!491079))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51387 0))(
  ( (array!51388 (arr!24711 (Array (_ BitVec 32) (_ BitVec 64))) (size!25152 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51387)

(assert (=> b!882275 (= res!599133 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25152 _keys!868))))))

(declare-fun b!882276 () Bool)

(declare-fun res!599128 () Bool)

(assert (=> b!882276 (=> (not res!599128) (not e!491079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51387 (_ BitVec 32)) Bool)

(assert (=> b!882276 (= res!599128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882277 () Bool)

(declare-fun e!491076 () Bool)

(declare-fun e!491083 () Bool)

(assert (=> b!882277 (= e!491076 e!491083)))

(declare-fun res!599126 () Bool)

(assert (=> b!882277 (=> res!599126 e!491083)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882277 (= res!599126 (not (= (select (arr!24711 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!28529 0))(
  ( (V!28530 (val!8853 Int)) )
))
(declare-datatypes ((tuple2!11658 0))(
  ( (tuple2!11659 (_1!5840 (_ BitVec 64)) (_2!5840 V!28529)) )
))
(declare-datatypes ((List!17488 0))(
  ( (Nil!17485) (Cons!17484 (h!18621 tuple2!11658) (t!24649 List!17488)) )
))
(declare-datatypes ((ListLongMap!10429 0))(
  ( (ListLongMap!10430 (toList!5230 List!17488)) )
))
(declare-fun lt!398984 () ListLongMap!10429)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398988 () ListLongMap!10429)

(declare-datatypes ((ValueCell!8366 0))(
  ( (ValueCellFull!8366 (v!11309 V!28529)) (EmptyCell!8366) )
))
(declare-datatypes ((array!51389 0))(
  ( (array!51390 (arr!24712 (Array (_ BitVec 32) ValueCell!8366)) (size!25153 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51389)

(declare-fun +!2545 (ListLongMap!10429 tuple2!11658) ListLongMap!10429)

(declare-fun get!13022 (ValueCell!8366 V!28529) V!28529)

(declare-fun dynLambda!1267 (Int (_ BitVec 64)) V!28529)

(assert (=> b!882277 (= lt!398984 (+!2545 lt!398988 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882278 () Bool)

(declare-fun res!599127 () Bool)

(assert (=> b!882278 (=> (not res!599127) (not e!491079))))

(assert (=> b!882278 (= res!599127 (and (= (select (arr!24711 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882279 () Bool)

(declare-fun res!599132 () Bool)

(assert (=> b!882279 (=> (not res!599132) (not e!491079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882279 (= res!599132 (validKeyInArray!0 k0!854))))

(declare-fun b!882280 () Bool)

(declare-fun e!491080 () Bool)

(declare-fun e!491077 () Bool)

(declare-fun mapRes!28044 () Bool)

(assert (=> b!882280 (= e!491080 (and e!491077 mapRes!28044))))

(declare-fun condMapEmpty!28044 () Bool)

(declare-fun mapDefault!28044 () ValueCell!8366)

(assert (=> b!882280 (= condMapEmpty!28044 (= (arr!24712 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8366)) mapDefault!28044)))))

(declare-fun b!882281 () Bool)

(declare-fun e!491082 () Bool)

(assert (=> b!882281 (= e!491082 (not e!491076))))

(declare-fun res!599130 () Bool)

(assert (=> b!882281 (=> res!599130 e!491076)))

(assert (=> b!882281 (= res!599130 (not (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053))))))

(declare-fun lt!398986 () ListLongMap!10429)

(assert (=> b!882281 (= lt!398986 lt!398988)))

(declare-fun lt!398990 () ListLongMap!10429)

(declare-fun v!557 () V!28529)

(assert (=> b!882281 (= lt!398988 (+!2545 lt!398990 (tuple2!11659 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!398983 () array!51389)

(declare-fun minValue!654 () V!28529)

(declare-fun zeroValue!654 () V!28529)

(declare-fun getCurrentListMapNoExtraKeys!3270 (array!51387 array!51389 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) Int) ListLongMap!10429)

(assert (=> b!882281 (= lt!398986 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882281 (= lt!398990 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30058 0))(
  ( (Unit!30059) )
))
(declare-fun lt!398985 () Unit!30058)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 (array!51387 array!51389 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) (_ BitVec 64) V!28529 (_ BitVec 32) Int) Unit!30058)

(assert (=> b!882281 (= lt!398985 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!28044 () Bool)

(assert (=> mapIsEmpty!28044 mapRes!28044))

(declare-fun b!882282 () Bool)

(declare-fun e!491081 () Bool)

(declare-fun tp_is_empty!17611 () Bool)

(assert (=> b!882282 (= e!491081 tp_is_empty!17611)))

(declare-fun b!882283 () Bool)

(declare-fun res!599131 () Bool)

(assert (=> b!882283 (=> (not res!599131) (not e!491079))))

(assert (=> b!882283 (= res!599131 (and (= (size!25153 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25152 _keys!868) (size!25153 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882284 () Bool)

(assert (=> b!882284 (= e!491083 (bvslt (size!25152 _keys!868) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!51387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882284 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398989 () Unit!30058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30058)

(assert (=> b!882284 (= lt!398989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17489 0))(
  ( (Nil!17486) (Cons!17485 (h!18622 (_ BitVec 64)) (t!24650 List!17489)) )
))
(declare-fun arrayNoDuplicates!0 (array!51387 (_ BitVec 32) List!17489) Bool)

(assert (=> b!882284 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17486)))

(declare-fun lt!398987 () Unit!30058)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51387 (_ BitVec 32) (_ BitVec 32)) Unit!30058)

(assert (=> b!882284 (= lt!398987 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882285 () Bool)

(assert (=> b!882285 (= e!491077 tp_is_empty!17611)))

(declare-fun b!882286 () Bool)

(declare-fun res!599129 () Bool)

(assert (=> b!882286 (=> (not res!599129) (not e!491079))))

(assert (=> b!882286 (= res!599129 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17486))))

(declare-fun res!599125 () Bool)

(assert (=> start!74932 (=> (not res!599125) (not e!491079))))

(assert (=> start!74932 (= res!599125 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25152 _keys!868))))))

(assert (=> start!74932 e!491079))

(assert (=> start!74932 tp_is_empty!17611))

(assert (=> start!74932 true))

(assert (=> start!74932 tp!53795))

(declare-fun array_inv!19502 (array!51387) Bool)

(assert (=> start!74932 (array_inv!19502 _keys!868)))

(declare-fun array_inv!19503 (array!51389) Bool)

(assert (=> start!74932 (and (array_inv!19503 _values!688) e!491080)))

(declare-fun mapNonEmpty!28044 () Bool)

(declare-fun tp!53796 () Bool)

(assert (=> mapNonEmpty!28044 (= mapRes!28044 (and tp!53796 e!491081))))

(declare-fun mapValue!28044 () ValueCell!8366)

(declare-fun mapKey!28044 () (_ BitVec 32))

(declare-fun mapRest!28044 () (Array (_ BitVec 32) ValueCell!8366))

(assert (=> mapNonEmpty!28044 (= (arr!24712 _values!688) (store mapRest!28044 mapKey!28044 mapValue!28044))))

(declare-fun b!882287 () Bool)

(assert (=> b!882287 (= e!491079 e!491082)))

(declare-fun res!599124 () Bool)

(assert (=> b!882287 (=> (not res!599124) (not e!491082))))

(assert (=> b!882287 (= res!599124 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!882287 (= lt!398984 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882287 (= lt!398983 (array!51390 (store (arr!24712 _values!688) i!612 (ValueCellFull!8366 v!557)) (size!25153 _values!688)))))

(declare-fun lt!398982 () ListLongMap!10429)

(assert (=> b!882287 (= lt!398982 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74932 res!599125) b!882274))

(assert (= (and b!882274 res!599123) b!882283))

(assert (= (and b!882283 res!599131) b!882276))

(assert (= (and b!882276 res!599128) b!882286))

(assert (= (and b!882286 res!599129) b!882275))

(assert (= (and b!882275 res!599133) b!882279))

(assert (= (and b!882279 res!599132) b!882278))

(assert (= (and b!882278 res!599127) b!882287))

(assert (= (and b!882287 res!599124) b!882281))

(assert (= (and b!882281 (not res!599130)) b!882277))

(assert (= (and b!882277 (not res!599126)) b!882284))

(assert (= (and b!882280 condMapEmpty!28044) mapIsEmpty!28044))

(assert (= (and b!882280 (not condMapEmpty!28044)) mapNonEmpty!28044))

(get-info :version)

(assert (= (and mapNonEmpty!28044 ((_ is ValueCellFull!8366) mapValue!28044)) b!882282))

(assert (= (and b!882280 ((_ is ValueCellFull!8366) mapDefault!28044)) b!882285))

(assert (= start!74932 b!882280))

(declare-fun b_lambda!12557 () Bool)

(assert (=> (not b_lambda!12557) (not b!882277)))

(declare-fun t!24648 () Bool)

(declare-fun tb!5017 () Bool)

(assert (=> (and start!74932 (= defaultEntry!696 defaultEntry!696) t!24648) tb!5017))

(declare-fun result!9671 () Bool)

(assert (=> tb!5017 (= result!9671 tp_is_empty!17611)))

(assert (=> b!882277 t!24648))

(declare-fun b_and!25397 () Bool)

(assert (= b_and!25395 (and (=> t!24648 result!9671) b_and!25397)))

(declare-fun m!822501 () Bool)

(assert (=> b!882279 m!822501))

(declare-fun m!822503 () Bool)

(assert (=> start!74932 m!822503))

(declare-fun m!822505 () Bool)

(assert (=> start!74932 m!822505))

(declare-fun m!822507 () Bool)

(assert (=> b!882286 m!822507))

(declare-fun m!822509 () Bool)

(assert (=> b!882278 m!822509))

(declare-fun m!822511 () Bool)

(assert (=> b!882276 m!822511))

(declare-fun m!822513 () Bool)

(assert (=> b!882284 m!822513))

(declare-fun m!822515 () Bool)

(assert (=> b!882284 m!822515))

(declare-fun m!822517 () Bool)

(assert (=> b!882284 m!822517))

(declare-fun m!822519 () Bool)

(assert (=> b!882284 m!822519))

(declare-fun m!822521 () Bool)

(assert (=> b!882274 m!822521))

(declare-fun m!822523 () Bool)

(assert (=> b!882281 m!822523))

(declare-fun m!822525 () Bool)

(assert (=> b!882281 m!822525))

(declare-fun m!822527 () Bool)

(assert (=> b!882281 m!822527))

(declare-fun m!822529 () Bool)

(assert (=> b!882281 m!822529))

(assert (=> b!882281 m!822527))

(declare-fun m!822531 () Bool)

(assert (=> b!882281 m!822531))

(declare-fun m!822533 () Bool)

(assert (=> b!882281 m!822533))

(declare-fun m!822535 () Bool)

(assert (=> b!882287 m!822535))

(declare-fun m!822537 () Bool)

(assert (=> b!882287 m!822537))

(declare-fun m!822539 () Bool)

(assert (=> b!882287 m!822539))

(declare-fun m!822541 () Bool)

(assert (=> b!882277 m!822541))

(declare-fun m!822543 () Bool)

(assert (=> b!882277 m!822543))

(declare-fun m!822545 () Bool)

(assert (=> b!882277 m!822545))

(assert (=> b!882277 m!822541))

(declare-fun m!822547 () Bool)

(assert (=> b!882277 m!822547))

(assert (=> b!882277 m!822527))

(assert (=> b!882277 m!822543))

(declare-fun m!822549 () Bool)

(assert (=> mapNonEmpty!28044 m!822549))

(check-sat (not b!882277) (not b_next!15367) (not b_lambda!12557) (not b!882286) (not mapNonEmpty!28044) (not b!882274) tp_is_empty!17611 (not b!882284) (not b!882287) (not b!882276) (not start!74932) b_and!25397 (not b!882279) (not b!882281))
(check-sat b_and!25397 (not b_next!15367))
(get-model)

(declare-fun b_lambda!12563 () Bool)

(assert (= b_lambda!12557 (or (and start!74932 b_free!15367) b_lambda!12563)))

(check-sat (not b!882277) (not b_next!15367) (not b!882286) (not b_lambda!12563) (not mapNonEmpty!28044) (not b!882274) tp_is_empty!17611 (not b!882284) (not b!882287) (not b!882276) (not start!74932) b_and!25397 (not b!882279) (not b!882281))
(check-sat b_and!25397 (not b_next!15367))
(get-model)

(declare-fun b!882388 () Bool)

(declare-fun e!491143 () Bool)

(declare-fun e!491142 () Bool)

(assert (=> b!882388 (= e!491143 e!491142)))

(declare-fun c!93217 () Bool)

(assert (=> b!882388 (= c!93217 (validKeyInArray!0 (select (arr!24711 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882389 () Bool)

(declare-fun call!38976 () Bool)

(assert (=> b!882389 (= e!491142 call!38976)))

(declare-fun d!109373 () Bool)

(declare-fun res!599207 () Bool)

(declare-fun e!491141 () Bool)

(assert (=> d!109373 (=> res!599207 e!491141)))

(assert (=> d!109373 (= res!599207 (bvsge #b00000000000000000000000000000000 (size!25152 _keys!868)))))

(assert (=> d!109373 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17486) e!491141)))

(declare-fun b!882390 () Bool)

(assert (=> b!882390 (= e!491141 e!491143)))

(declare-fun res!599208 () Bool)

(assert (=> b!882390 (=> (not res!599208) (not e!491143))))

(declare-fun e!491140 () Bool)

(assert (=> b!882390 (= res!599208 (not e!491140))))

(declare-fun res!599206 () Bool)

(assert (=> b!882390 (=> (not res!599206) (not e!491140))))

(assert (=> b!882390 (= res!599206 (validKeyInArray!0 (select (arr!24711 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882391 () Bool)

(declare-fun contains!4241 (List!17489 (_ BitVec 64)) Bool)

(assert (=> b!882391 (= e!491140 (contains!4241 Nil!17486 (select (arr!24711 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882392 () Bool)

(assert (=> b!882392 (= e!491142 call!38976)))

(declare-fun bm!38973 () Bool)

(assert (=> bm!38973 (= call!38976 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93217 (Cons!17485 (select (arr!24711 _keys!868) #b00000000000000000000000000000000) Nil!17486) Nil!17486)))))

(assert (= (and d!109373 (not res!599207)) b!882390))

(assert (= (and b!882390 res!599206) b!882391))

(assert (= (and b!882390 res!599208) b!882388))

(assert (= (and b!882388 c!93217) b!882392))

(assert (= (and b!882388 (not c!93217)) b!882389))

(assert (= (or b!882392 b!882389) bm!38973))

(declare-fun m!822651 () Bool)

(assert (=> b!882388 m!822651))

(assert (=> b!882388 m!822651))

(declare-fun m!822653 () Bool)

(assert (=> b!882388 m!822653))

(assert (=> b!882390 m!822651))

(assert (=> b!882390 m!822651))

(assert (=> b!882390 m!822653))

(assert (=> b!882391 m!822651))

(assert (=> b!882391 m!822651))

(declare-fun m!822655 () Bool)

(assert (=> b!882391 m!822655))

(assert (=> bm!38973 m!822651))

(declare-fun m!822657 () Bool)

(assert (=> bm!38973 m!822657))

(assert (=> b!882286 d!109373))

(declare-fun b!882401 () Bool)

(declare-fun e!491150 () Bool)

(declare-fun e!491151 () Bool)

(assert (=> b!882401 (= e!491150 e!491151)))

(declare-fun lt!399053 () (_ BitVec 64))

(assert (=> b!882401 (= lt!399053 (select (arr!24711 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399051 () Unit!30058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51387 (_ BitVec 64) (_ BitVec 32)) Unit!30058)

(assert (=> b!882401 (= lt!399051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399053 #b00000000000000000000000000000000))))

(assert (=> b!882401 (arrayContainsKey!0 _keys!868 lt!399053 #b00000000000000000000000000000000)))

(declare-fun lt!399052 () Unit!30058)

(assert (=> b!882401 (= lt!399052 lt!399051)))

(declare-fun res!599213 () Bool)

(declare-datatypes ((SeekEntryResult!8709 0))(
  ( (MissingZero!8709 (index!37207 (_ BitVec 32))) (Found!8709 (index!37208 (_ BitVec 32))) (Intermediate!8709 (undefined!9521 Bool) (index!37209 (_ BitVec 32)) (x!74667 (_ BitVec 32))) (Undefined!8709) (MissingVacant!8709 (index!37210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51387 (_ BitVec 32)) SeekEntryResult!8709)

(assert (=> b!882401 (= res!599213 (= (seekEntryOrOpen!0 (select (arr!24711 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8709 #b00000000000000000000000000000000)))))

(assert (=> b!882401 (=> (not res!599213) (not e!491151))))

(declare-fun b!882402 () Bool)

(declare-fun call!38979 () Bool)

(assert (=> b!882402 (= e!491150 call!38979)))

(declare-fun b!882403 () Bool)

(declare-fun e!491152 () Bool)

(assert (=> b!882403 (= e!491152 e!491150)))

(declare-fun c!93220 () Bool)

(assert (=> b!882403 (= c!93220 (validKeyInArray!0 (select (arr!24711 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38976 () Bool)

(assert (=> bm!38976 (= call!38979 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!109375 () Bool)

(declare-fun res!599214 () Bool)

(assert (=> d!109375 (=> res!599214 e!491152)))

(assert (=> d!109375 (= res!599214 (bvsge #b00000000000000000000000000000000 (size!25152 _keys!868)))))

(assert (=> d!109375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491152)))

(declare-fun b!882404 () Bool)

(assert (=> b!882404 (= e!491151 call!38979)))

(assert (= (and d!109375 (not res!599214)) b!882403))

(assert (= (and b!882403 c!93220) b!882401))

(assert (= (and b!882403 (not c!93220)) b!882402))

(assert (= (and b!882401 res!599213) b!882404))

(assert (= (or b!882404 b!882402) bm!38976))

(assert (=> b!882401 m!822651))

(declare-fun m!822659 () Bool)

(assert (=> b!882401 m!822659))

(declare-fun m!822661 () Bool)

(assert (=> b!882401 m!822661))

(assert (=> b!882401 m!822651))

(declare-fun m!822663 () Bool)

(assert (=> b!882401 m!822663))

(assert (=> b!882403 m!822651))

(assert (=> b!882403 m!822651))

(assert (=> b!882403 m!822653))

(declare-fun m!822665 () Bool)

(assert (=> bm!38976 m!822665))

(assert (=> b!882276 d!109375))

(declare-fun b!882429 () Bool)

(declare-fun e!491170 () Bool)

(declare-fun lt!399069 () ListLongMap!10429)

(declare-fun isEmpty!675 (ListLongMap!10429) Bool)

(assert (=> b!882429 (= e!491170 (isEmpty!675 lt!399069))))

(declare-fun b!882430 () Bool)

(declare-fun lt!399073 () Unit!30058)

(declare-fun lt!399072 () Unit!30058)

(assert (=> b!882430 (= lt!399073 lt!399072)))

(declare-fun lt!399074 () (_ BitVec 64))

(declare-fun lt!399070 () V!28529)

(declare-fun lt!399068 () (_ BitVec 64))

(declare-fun lt!399071 () ListLongMap!10429)

(declare-fun contains!4242 (ListLongMap!10429 (_ BitVec 64)) Bool)

(assert (=> b!882430 (not (contains!4242 (+!2545 lt!399071 (tuple2!11659 lt!399074 lt!399070)) lt!399068))))

(declare-fun addStillNotContains!209 (ListLongMap!10429 (_ BitVec 64) V!28529 (_ BitVec 64)) Unit!30058)

(assert (=> b!882430 (= lt!399072 (addStillNotContains!209 lt!399071 lt!399074 lt!399070 lt!399068))))

(assert (=> b!882430 (= lt!399068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882430 (= lt!399070 (get!13022 (select (arr!24712 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882430 (= lt!399074 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38982 () ListLongMap!10429)

(assert (=> b!882430 (= lt!399071 call!38982)))

(declare-fun e!491171 () ListLongMap!10429)

(assert (=> b!882430 (= e!491171 (+!2545 call!38982 (tuple2!11659 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13022 (select (arr!24712 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882431 () Bool)

(declare-fun e!491172 () Bool)

(declare-fun e!491167 () Bool)

(assert (=> b!882431 (= e!491172 e!491167)))

(declare-fun c!93232 () Bool)

(declare-fun e!491173 () Bool)

(assert (=> b!882431 (= c!93232 e!491173)))

(declare-fun res!599226 () Bool)

(assert (=> b!882431 (=> (not res!599226) (not e!491173))))

(assert (=> b!882431 (= res!599226 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun b!882432 () Bool)

(declare-fun e!491169 () Bool)

(assert (=> b!882432 (= e!491167 e!491169)))

(assert (=> b!882432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun res!599225 () Bool)

(assert (=> b!882432 (= res!599225 (contains!4242 lt!399069 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882432 (=> (not res!599225) (not e!491169))))

(declare-fun b!882433 () Bool)

(assert (=> b!882433 (= e!491171 call!38982)))

(declare-fun bm!38979 () Bool)

(assert (=> bm!38979 (= call!38982 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882434 () Bool)

(assert (=> b!882434 (= e!491173 (validKeyInArray!0 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882434 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882435 () Bool)

(declare-fun res!599224 () Bool)

(assert (=> b!882435 (=> (not res!599224) (not e!491172))))

(assert (=> b!882435 (= res!599224 (not (contains!4242 lt!399069 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882436 () Bool)

(assert (=> b!882436 (= e!491170 (= lt!399069 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882437 () Bool)

(assert (=> b!882437 (= e!491167 e!491170)))

(declare-fun c!93231 () Bool)

(assert (=> b!882437 (= c!93231 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun d!109377 () Bool)

(assert (=> d!109377 e!491172))

(declare-fun res!599223 () Bool)

(assert (=> d!109377 (=> (not res!599223) (not e!491172))))

(assert (=> d!109377 (= res!599223 (not (contains!4242 lt!399069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491168 () ListLongMap!10429)

(assert (=> d!109377 (= lt!399069 e!491168)))

(declare-fun c!93229 () Bool)

(assert (=> d!109377 (= c!93229 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(assert (=> d!109377 (validMask!0 mask!1196)))

(assert (=> d!109377 (= (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399069)))

(declare-fun b!882438 () Bool)

(assert (=> b!882438 (= e!491168 (ListLongMap!10430 Nil!17485))))

(declare-fun b!882439 () Bool)

(assert (=> b!882439 (= e!491168 e!491171)))

(declare-fun c!93230 () Bool)

(assert (=> b!882439 (= c!93230 (validKeyInArray!0 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882440 () Bool)

(assert (=> b!882440 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(assert (=> b!882440 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25153 _values!688)))))

(declare-fun apply!382 (ListLongMap!10429 (_ BitVec 64)) V!28529)

(assert (=> b!882440 (= e!491169 (= (apply!382 lt!399069 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13022 (select (arr!24712 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!109377 c!93229) b!882438))

(assert (= (and d!109377 (not c!93229)) b!882439))

(assert (= (and b!882439 c!93230) b!882430))

(assert (= (and b!882439 (not c!93230)) b!882433))

(assert (= (or b!882430 b!882433) bm!38979))

(assert (= (and d!109377 res!599223) b!882435))

(assert (= (and b!882435 res!599224) b!882431))

(assert (= (and b!882431 res!599226) b!882434))

(assert (= (and b!882431 c!93232) b!882432))

(assert (= (and b!882431 (not c!93232)) b!882437))

(assert (= (and b!882432 res!599225) b!882440))

(assert (= (and b!882437 c!93231) b!882436))

(assert (= (and b!882437 (not c!93231)) b!882429))

(declare-fun b_lambda!12565 () Bool)

(assert (=> (not b_lambda!12565) (not b!882430)))

(assert (=> b!882430 t!24648))

(declare-fun b_and!25407 () Bool)

(assert (= b_and!25397 (and (=> t!24648 result!9671) b_and!25407)))

(declare-fun b_lambda!12567 () Bool)

(assert (=> (not b_lambda!12567) (not b!882440)))

(assert (=> b!882440 t!24648))

(declare-fun b_and!25409 () Bool)

(assert (= b_and!25407 (and (=> t!24648 result!9671) b_and!25409)))

(declare-fun m!822667 () Bool)

(assert (=> b!882439 m!822667))

(assert (=> b!882439 m!822667))

(declare-fun m!822669 () Bool)

(assert (=> b!882439 m!822669))

(assert (=> b!882434 m!822667))

(assert (=> b!882434 m!822667))

(assert (=> b!882434 m!822669))

(declare-fun m!822671 () Bool)

(assert (=> b!882440 m!822671))

(assert (=> b!882440 m!822543))

(declare-fun m!822673 () Bool)

(assert (=> b!882440 m!822673))

(assert (=> b!882440 m!822667))

(assert (=> b!882440 m!822671))

(assert (=> b!882440 m!822543))

(assert (=> b!882440 m!822667))

(declare-fun m!822675 () Bool)

(assert (=> b!882440 m!822675))

(declare-fun m!822677 () Bool)

(assert (=> b!882429 m!822677))

(declare-fun m!822679 () Bool)

(assert (=> bm!38979 m!822679))

(assert (=> b!882436 m!822679))

(assert (=> b!882430 m!822671))

(assert (=> b!882430 m!822543))

(assert (=> b!882430 m!822673))

(assert (=> b!882430 m!822667))

(declare-fun m!822681 () Bool)

(assert (=> b!882430 m!822681))

(assert (=> b!882430 m!822681))

(declare-fun m!822683 () Bool)

(assert (=> b!882430 m!822683))

(declare-fun m!822685 () Bool)

(assert (=> b!882430 m!822685))

(assert (=> b!882430 m!822671))

(assert (=> b!882430 m!822543))

(declare-fun m!822687 () Bool)

(assert (=> b!882430 m!822687))

(assert (=> b!882432 m!822667))

(assert (=> b!882432 m!822667))

(declare-fun m!822689 () Bool)

(assert (=> b!882432 m!822689))

(declare-fun m!822691 () Bool)

(assert (=> d!109377 m!822691))

(assert (=> d!109377 m!822521))

(declare-fun m!822693 () Bool)

(assert (=> b!882435 m!822693))

(assert (=> b!882281 d!109377))

(declare-fun d!109379 () Bool)

(declare-fun e!491176 () Bool)

(assert (=> d!109379 e!491176))

(declare-fun res!599232 () Bool)

(assert (=> d!109379 (=> (not res!599232) (not e!491176))))

(declare-fun lt!399085 () ListLongMap!10429)

(assert (=> d!109379 (= res!599232 (contains!4242 lt!399085 (_1!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun lt!399086 () List!17488)

(assert (=> d!109379 (= lt!399085 (ListLongMap!10430 lt!399086))))

(declare-fun lt!399083 () Unit!30058)

(declare-fun lt!399084 () Unit!30058)

(assert (=> d!109379 (= lt!399083 lt!399084)))

(declare-datatypes ((Option!431 0))(
  ( (Some!430 (v!11315 V!28529)) (None!429) )
))
(declare-fun getValueByKey!425 (List!17488 (_ BitVec 64)) Option!431)

(assert (=> d!109379 (= (getValueByKey!425 lt!399086 (_1!5840 (tuple2!11659 k0!854 v!557))) (Some!430 (_2!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!239 (List!17488 (_ BitVec 64) V!28529) Unit!30058)

(assert (=> d!109379 (= lt!399084 (lemmaContainsTupThenGetReturnValue!239 lt!399086 (_1!5840 (tuple2!11659 k0!854 v!557)) (_2!5840 (tuple2!11659 k0!854 v!557))))))

(declare-fun insertStrictlySorted!278 (List!17488 (_ BitVec 64) V!28529) List!17488)

(assert (=> d!109379 (= lt!399086 (insertStrictlySorted!278 (toList!5230 lt!398990) (_1!5840 (tuple2!11659 k0!854 v!557)) (_2!5840 (tuple2!11659 k0!854 v!557))))))

(assert (=> d!109379 (= (+!2545 lt!398990 (tuple2!11659 k0!854 v!557)) lt!399085)))

(declare-fun b!882445 () Bool)

(declare-fun res!599231 () Bool)

(assert (=> b!882445 (=> (not res!599231) (not e!491176))))

(assert (=> b!882445 (= res!599231 (= (getValueByKey!425 (toList!5230 lt!399085) (_1!5840 (tuple2!11659 k0!854 v!557))) (Some!430 (_2!5840 (tuple2!11659 k0!854 v!557)))))))

(declare-fun b!882446 () Bool)

(declare-fun contains!4243 (List!17488 tuple2!11658) Bool)

(assert (=> b!882446 (= e!491176 (contains!4243 (toList!5230 lt!399085) (tuple2!11659 k0!854 v!557)))))

(assert (= (and d!109379 res!599232) b!882445))

(assert (= (and b!882445 res!599231) b!882446))

(declare-fun m!822695 () Bool)

(assert (=> d!109379 m!822695))

(declare-fun m!822697 () Bool)

(assert (=> d!109379 m!822697))

(declare-fun m!822699 () Bool)

(assert (=> d!109379 m!822699))

(declare-fun m!822701 () Bool)

(assert (=> d!109379 m!822701))

(declare-fun m!822703 () Bool)

(assert (=> b!882445 m!822703))

(declare-fun m!822705 () Bool)

(assert (=> b!882446 m!822705))

(assert (=> b!882281 d!109379))

(declare-fun d!109381 () Bool)

(assert (=> d!109381 (= (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)) (and (not (= (select (arr!24711 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24711 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882281 d!109381))

(declare-fun call!38987 () ListLongMap!10429)

(declare-fun bm!38984 () Bool)

(assert (=> bm!38984 (= call!38987 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109383 () Bool)

(declare-fun e!491181 () Bool)

(assert (=> d!109383 e!491181))

(declare-fun res!599235 () Bool)

(assert (=> d!109383 (=> (not res!599235) (not e!491181))))

(assert (=> d!109383 (= res!599235 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25153 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25153 _values!688))))))))

(declare-fun lt!399089 () Unit!30058)

(declare-fun choose!1444 (array!51387 array!51389 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) (_ BitVec 64) V!28529 (_ BitVec 32) Int) Unit!30058)

(assert (=> d!109383 (= lt!399089 (choose!1444 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109383 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(assert (=> d!109383 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399089)))

(declare-fun call!38988 () ListLongMap!10429)

(declare-fun e!491182 () Bool)

(declare-fun b!882453 () Bool)

(assert (=> b!882453 (= e!491182 (= call!38988 (+!2545 call!38987 (tuple2!11659 k0!854 v!557))))))

(declare-fun b!882454 () Bool)

(assert (=> b!882454 (= e!491181 e!491182)))

(declare-fun c!93235 () Bool)

(assert (=> b!882454 (= c!93235 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!882455 () Bool)

(assert (=> b!882455 (= e!491182 (= call!38988 call!38987))))

(declare-fun bm!38985 () Bool)

(assert (=> bm!38985 (= call!38988 (getCurrentListMapNoExtraKeys!3270 _keys!868 (array!51390 (store (arr!24712 _values!688) i!612 (ValueCellFull!8366 v!557)) (size!25153 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109383 res!599235) b!882454))

(assert (= (and b!882454 c!93235) b!882453))

(assert (= (and b!882454 (not c!93235)) b!882455))

(assert (= (or b!882453 b!882455) bm!38984))

(assert (= (or b!882453 b!882455) bm!38985))

(assert (=> bm!38984 m!822523))

(declare-fun m!822707 () Bool)

(assert (=> d!109383 m!822707))

(declare-fun m!822709 () Bool)

(assert (=> b!882453 m!822709))

(assert (=> bm!38985 m!822537))

(declare-fun m!822711 () Bool)

(assert (=> bm!38985 m!822711))

(assert (=> b!882281 d!109383))

(declare-fun b!882456 () Bool)

(declare-fun e!491186 () Bool)

(declare-fun lt!399091 () ListLongMap!10429)

(assert (=> b!882456 (= e!491186 (isEmpty!675 lt!399091))))

(declare-fun b!882457 () Bool)

(declare-fun lt!399095 () Unit!30058)

(declare-fun lt!399094 () Unit!30058)

(assert (=> b!882457 (= lt!399095 lt!399094)))

(declare-fun lt!399093 () ListLongMap!10429)

(declare-fun lt!399096 () (_ BitVec 64))

(declare-fun lt!399092 () V!28529)

(declare-fun lt!399090 () (_ BitVec 64))

(assert (=> b!882457 (not (contains!4242 (+!2545 lt!399093 (tuple2!11659 lt!399096 lt!399092)) lt!399090))))

(assert (=> b!882457 (= lt!399094 (addStillNotContains!209 lt!399093 lt!399096 lt!399092 lt!399090))))

(assert (=> b!882457 (= lt!399090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882457 (= lt!399092 (get!13022 (select (arr!24712 lt!398983) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882457 (= lt!399096 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38989 () ListLongMap!10429)

(assert (=> b!882457 (= lt!399093 call!38989)))

(declare-fun e!491187 () ListLongMap!10429)

(assert (=> b!882457 (= e!491187 (+!2545 call!38989 (tuple2!11659 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13022 (select (arr!24712 lt!398983) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882458 () Bool)

(declare-fun e!491188 () Bool)

(declare-fun e!491183 () Bool)

(assert (=> b!882458 (= e!491188 e!491183)))

(declare-fun c!93239 () Bool)

(declare-fun e!491189 () Bool)

(assert (=> b!882458 (= c!93239 e!491189)))

(declare-fun res!599239 () Bool)

(assert (=> b!882458 (=> (not res!599239) (not e!491189))))

(assert (=> b!882458 (= res!599239 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun b!882459 () Bool)

(declare-fun e!491185 () Bool)

(assert (=> b!882459 (= e!491183 e!491185)))

(assert (=> b!882459 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun res!599238 () Bool)

(assert (=> b!882459 (= res!599238 (contains!4242 lt!399091 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882459 (=> (not res!599238) (not e!491185))))

(declare-fun b!882460 () Bool)

(assert (=> b!882460 (= e!491187 call!38989)))

(declare-fun bm!38986 () Bool)

(assert (=> bm!38986 (= call!38989 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882461 () Bool)

(assert (=> b!882461 (= e!491189 (validKeyInArray!0 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882461 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882462 () Bool)

(declare-fun res!599237 () Bool)

(assert (=> b!882462 (=> (not res!599237) (not e!491188))))

(assert (=> b!882462 (= res!599237 (not (contains!4242 lt!399091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882463 () Bool)

(assert (=> b!882463 (= e!491186 (= lt!399091 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882464 () Bool)

(assert (=> b!882464 (= e!491183 e!491186)))

(declare-fun c!93238 () Bool)

(assert (=> b!882464 (= c!93238 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(declare-fun d!109385 () Bool)

(assert (=> d!109385 e!491188))

(declare-fun res!599236 () Bool)

(assert (=> d!109385 (=> (not res!599236) (not e!491188))))

(assert (=> d!109385 (= res!599236 (not (contains!4242 lt!399091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491184 () ListLongMap!10429)

(assert (=> d!109385 (= lt!399091 e!491184)))

(declare-fun c!93236 () Bool)

(assert (=> d!109385 (= c!93236 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(assert (=> d!109385 (validMask!0 mask!1196)))

(assert (=> d!109385 (= (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399091)))

(declare-fun b!882465 () Bool)

(assert (=> b!882465 (= e!491184 (ListLongMap!10430 Nil!17485))))

(declare-fun b!882466 () Bool)

(assert (=> b!882466 (= e!491184 e!491187)))

(declare-fun c!93237 () Bool)

(assert (=> b!882466 (= c!93237 (validKeyInArray!0 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882467 () Bool)

(assert (=> b!882467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25152 _keys!868)))))

(assert (=> b!882467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25153 lt!398983)))))

(assert (=> b!882467 (= e!491185 (= (apply!382 lt!399091 (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13022 (select (arr!24712 lt!398983) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!109385 c!93236) b!882465))

(assert (= (and d!109385 (not c!93236)) b!882466))

(assert (= (and b!882466 c!93237) b!882457))

(assert (= (and b!882466 (not c!93237)) b!882460))

(assert (= (or b!882457 b!882460) bm!38986))

(assert (= (and d!109385 res!599236) b!882462))

(assert (= (and b!882462 res!599237) b!882458))

(assert (= (and b!882458 res!599239) b!882461))

(assert (= (and b!882458 c!93239) b!882459))

(assert (= (and b!882458 (not c!93239)) b!882464))

(assert (= (and b!882459 res!599238) b!882467))

(assert (= (and b!882464 c!93238) b!882463))

(assert (= (and b!882464 (not c!93238)) b!882456))

(declare-fun b_lambda!12569 () Bool)

(assert (=> (not b_lambda!12569) (not b!882457)))

(assert (=> b!882457 t!24648))

(declare-fun b_and!25411 () Bool)

(assert (= b_and!25409 (and (=> t!24648 result!9671) b_and!25411)))

(declare-fun b_lambda!12571 () Bool)

(assert (=> (not b_lambda!12571) (not b!882467)))

(assert (=> b!882467 t!24648))

(declare-fun b_and!25413 () Bool)

(assert (= b_and!25411 (and (=> t!24648 result!9671) b_and!25413)))

(assert (=> b!882466 m!822667))

(assert (=> b!882466 m!822667))

(assert (=> b!882466 m!822669))

(assert (=> b!882461 m!822667))

(assert (=> b!882461 m!822667))

(assert (=> b!882461 m!822669))

(declare-fun m!822713 () Bool)

(assert (=> b!882467 m!822713))

(assert (=> b!882467 m!822543))

(declare-fun m!822715 () Bool)

(assert (=> b!882467 m!822715))

(assert (=> b!882467 m!822667))

(assert (=> b!882467 m!822713))

(assert (=> b!882467 m!822543))

(assert (=> b!882467 m!822667))

(declare-fun m!822717 () Bool)

(assert (=> b!882467 m!822717))

(declare-fun m!822719 () Bool)

(assert (=> b!882456 m!822719))

(declare-fun m!822721 () Bool)

(assert (=> bm!38986 m!822721))

(assert (=> b!882463 m!822721))

(assert (=> b!882457 m!822713))

(assert (=> b!882457 m!822543))

(assert (=> b!882457 m!822715))

(assert (=> b!882457 m!822667))

(declare-fun m!822723 () Bool)

(assert (=> b!882457 m!822723))

(assert (=> b!882457 m!822723))

(declare-fun m!822725 () Bool)

(assert (=> b!882457 m!822725))

(declare-fun m!822727 () Bool)

(assert (=> b!882457 m!822727))

(assert (=> b!882457 m!822713))

(assert (=> b!882457 m!822543))

(declare-fun m!822729 () Bool)

(assert (=> b!882457 m!822729))

(assert (=> b!882459 m!822667))

(assert (=> b!882459 m!822667))

(declare-fun m!822731 () Bool)

(assert (=> b!882459 m!822731))

(declare-fun m!822733 () Bool)

(assert (=> d!109385 m!822733))

(assert (=> d!109385 m!822521))

(declare-fun m!822735 () Bool)

(assert (=> b!882462 m!822735))

(assert (=> b!882281 d!109385))

(declare-fun d!109387 () Bool)

(declare-fun e!491190 () Bool)

(assert (=> d!109387 e!491190))

(declare-fun res!599241 () Bool)

(assert (=> d!109387 (=> (not res!599241) (not e!491190))))

(declare-fun lt!399099 () ListLongMap!10429)

(assert (=> d!109387 (= res!599241 (contains!4242 lt!399099 (_1!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399100 () List!17488)

(assert (=> d!109387 (= lt!399099 (ListLongMap!10430 lt!399100))))

(declare-fun lt!399097 () Unit!30058)

(declare-fun lt!399098 () Unit!30058)

(assert (=> d!109387 (= lt!399097 lt!399098)))

(assert (=> d!109387 (= (getValueByKey!425 lt!399100 (_1!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!430 (_2!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109387 (= lt!399098 (lemmaContainsTupThenGetReturnValue!239 lt!399100 (_1!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109387 (= lt!399100 (insertStrictlySorted!278 (toList!5230 lt!398988) (_1!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109387 (= (+!2545 lt!398988 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399099)))

(declare-fun b!882468 () Bool)

(declare-fun res!599240 () Bool)

(assert (=> b!882468 (=> (not res!599240) (not e!491190))))

(assert (=> b!882468 (= res!599240 (= (getValueByKey!425 (toList!5230 lt!399099) (_1!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!430 (_2!5840 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882469 () Bool)

(assert (=> b!882469 (= e!491190 (contains!4243 (toList!5230 lt!399099) (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109387 res!599241) b!882468))

(assert (= (and b!882468 res!599240) b!882469))

(declare-fun m!822737 () Bool)

(assert (=> d!109387 m!822737))

(declare-fun m!822739 () Bool)

(assert (=> d!109387 m!822739))

(declare-fun m!822741 () Bool)

(assert (=> d!109387 m!822741))

(declare-fun m!822743 () Bool)

(assert (=> d!109387 m!822743))

(declare-fun m!822745 () Bool)

(assert (=> b!882468 m!822745))

(declare-fun m!822747 () Bool)

(assert (=> b!882469 m!822747))

(assert (=> b!882277 d!109387))

(declare-fun d!109389 () Bool)

(declare-fun c!93242 () Bool)

(assert (=> d!109389 (= c!93242 ((_ is ValueCellFull!8366) (select (arr!24712 _values!688) from!1053)))))

(declare-fun e!491193 () V!28529)

(assert (=> d!109389 (= (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491193)))

(declare-fun b!882474 () Bool)

(declare-fun get!13024 (ValueCell!8366 V!28529) V!28529)

(assert (=> b!882474 (= e!491193 (get!13024 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882475 () Bool)

(declare-fun get!13025 (ValueCell!8366 V!28529) V!28529)

(assert (=> b!882475 (= e!491193 (get!13025 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109389 c!93242) b!882474))

(assert (= (and d!109389 (not c!93242)) b!882475))

(assert (=> b!882474 m!822541))

(assert (=> b!882474 m!822543))

(declare-fun m!822749 () Bool)

(assert (=> b!882474 m!822749))

(assert (=> b!882475 m!822541))

(assert (=> b!882475 m!822543))

(declare-fun m!822751 () Bool)

(assert (=> b!882475 m!822751))

(assert (=> b!882277 d!109389))

(declare-fun d!109391 () Bool)

(assert (=> d!109391 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!882274 d!109391))

(declare-fun d!109393 () Bool)

(assert (=> d!109393 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882279 d!109393))

(declare-fun b!882476 () Bool)

(declare-fun e!491197 () Bool)

(declare-fun lt!399102 () ListLongMap!10429)

(assert (=> b!882476 (= e!491197 (isEmpty!675 lt!399102))))

(declare-fun b!882477 () Bool)

(declare-fun lt!399106 () Unit!30058)

(declare-fun lt!399105 () Unit!30058)

(assert (=> b!882477 (= lt!399106 lt!399105)))

(declare-fun lt!399101 () (_ BitVec 64))

(declare-fun lt!399104 () ListLongMap!10429)

(declare-fun lt!399107 () (_ BitVec 64))

(declare-fun lt!399103 () V!28529)

(assert (=> b!882477 (not (contains!4242 (+!2545 lt!399104 (tuple2!11659 lt!399107 lt!399103)) lt!399101))))

(assert (=> b!882477 (= lt!399105 (addStillNotContains!209 lt!399104 lt!399107 lt!399103 lt!399101))))

(assert (=> b!882477 (= lt!399101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882477 (= lt!399103 (get!13022 (select (arr!24712 lt!398983) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882477 (= lt!399107 (select (arr!24711 _keys!868) from!1053))))

(declare-fun call!38990 () ListLongMap!10429)

(assert (=> b!882477 (= lt!399104 call!38990)))

(declare-fun e!491198 () ListLongMap!10429)

(assert (=> b!882477 (= e!491198 (+!2545 call!38990 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 lt!398983) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882478 () Bool)

(declare-fun e!491199 () Bool)

(declare-fun e!491194 () Bool)

(assert (=> b!882478 (= e!491199 e!491194)))

(declare-fun c!93246 () Bool)

(declare-fun e!491200 () Bool)

(assert (=> b!882478 (= c!93246 e!491200)))

(declare-fun res!599245 () Bool)

(assert (=> b!882478 (=> (not res!599245) (not e!491200))))

(assert (=> b!882478 (= res!599245 (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun b!882479 () Bool)

(declare-fun e!491196 () Bool)

(assert (=> b!882479 (= e!491194 e!491196)))

(assert (=> b!882479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun res!599244 () Bool)

(assert (=> b!882479 (= res!599244 (contains!4242 lt!399102 (select (arr!24711 _keys!868) from!1053)))))

(assert (=> b!882479 (=> (not res!599244) (not e!491196))))

(declare-fun b!882480 () Bool)

(assert (=> b!882480 (= e!491198 call!38990)))

(declare-fun bm!38987 () Bool)

(assert (=> bm!38987 (= call!38990 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882481 () Bool)

(assert (=> b!882481 (= e!491200 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(assert (=> b!882481 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882482 () Bool)

(declare-fun res!599243 () Bool)

(assert (=> b!882482 (=> (not res!599243) (not e!491199))))

(assert (=> b!882482 (= res!599243 (not (contains!4242 lt!399102 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882483 () Bool)

(assert (=> b!882483 (= e!491197 (= lt!399102 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882484 () Bool)

(assert (=> b!882484 (= e!491194 e!491197)))

(declare-fun c!93245 () Bool)

(assert (=> b!882484 (= c!93245 (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun d!109395 () Bool)

(assert (=> d!109395 e!491199))

(declare-fun res!599242 () Bool)

(assert (=> d!109395 (=> (not res!599242) (not e!491199))))

(assert (=> d!109395 (= res!599242 (not (contains!4242 lt!399102 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491195 () ListLongMap!10429)

(assert (=> d!109395 (= lt!399102 e!491195)))

(declare-fun c!93243 () Bool)

(assert (=> d!109395 (= c!93243 (bvsge from!1053 (size!25152 _keys!868)))))

(assert (=> d!109395 (validMask!0 mask!1196)))

(assert (=> d!109395 (= (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!398983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399102)))

(declare-fun b!882485 () Bool)

(assert (=> b!882485 (= e!491195 (ListLongMap!10430 Nil!17485))))

(declare-fun b!882486 () Bool)

(assert (=> b!882486 (= e!491195 e!491198)))

(declare-fun c!93244 () Bool)

(assert (=> b!882486 (= c!93244 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(declare-fun b!882487 () Bool)

(assert (=> b!882487 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25152 _keys!868)))))

(assert (=> b!882487 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25153 lt!398983)))))

(assert (=> b!882487 (= e!491196 (= (apply!382 lt!399102 (select (arr!24711 _keys!868) from!1053)) (get!13022 (select (arr!24712 lt!398983) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!109395 c!93243) b!882485))

(assert (= (and d!109395 (not c!93243)) b!882486))

(assert (= (and b!882486 c!93244) b!882477))

(assert (= (and b!882486 (not c!93244)) b!882480))

(assert (= (or b!882477 b!882480) bm!38987))

(assert (= (and d!109395 res!599242) b!882482))

(assert (= (and b!882482 res!599243) b!882478))

(assert (= (and b!882478 res!599245) b!882481))

(assert (= (and b!882478 c!93246) b!882479))

(assert (= (and b!882478 (not c!93246)) b!882484))

(assert (= (and b!882479 res!599244) b!882487))

(assert (= (and b!882484 c!93245) b!882483))

(assert (= (and b!882484 (not c!93245)) b!882476))

(declare-fun b_lambda!12573 () Bool)

(assert (=> (not b_lambda!12573) (not b!882477)))

(assert (=> b!882477 t!24648))

(declare-fun b_and!25415 () Bool)

(assert (= b_and!25413 (and (=> t!24648 result!9671) b_and!25415)))

(declare-fun b_lambda!12575 () Bool)

(assert (=> (not b_lambda!12575) (not b!882487)))

(assert (=> b!882487 t!24648))

(declare-fun b_and!25417 () Bool)

(assert (= b_and!25415 (and (=> t!24648 result!9671) b_and!25417)))

(assert (=> b!882486 m!822527))

(assert (=> b!882486 m!822527))

(assert (=> b!882486 m!822529))

(assert (=> b!882481 m!822527))

(assert (=> b!882481 m!822527))

(assert (=> b!882481 m!822529))

(declare-fun m!822753 () Bool)

(assert (=> b!882487 m!822753))

(assert (=> b!882487 m!822543))

(declare-fun m!822755 () Bool)

(assert (=> b!882487 m!822755))

(assert (=> b!882487 m!822527))

(assert (=> b!882487 m!822753))

(assert (=> b!882487 m!822543))

(assert (=> b!882487 m!822527))

(declare-fun m!822757 () Bool)

(assert (=> b!882487 m!822757))

(declare-fun m!822759 () Bool)

(assert (=> b!882476 m!822759))

(declare-fun m!822761 () Bool)

(assert (=> bm!38987 m!822761))

(assert (=> b!882483 m!822761))

(assert (=> b!882477 m!822753))

(assert (=> b!882477 m!822543))

(assert (=> b!882477 m!822755))

(assert (=> b!882477 m!822527))

(declare-fun m!822763 () Bool)

(assert (=> b!882477 m!822763))

(assert (=> b!882477 m!822763))

(declare-fun m!822765 () Bool)

(assert (=> b!882477 m!822765))

(declare-fun m!822767 () Bool)

(assert (=> b!882477 m!822767))

(assert (=> b!882477 m!822753))

(assert (=> b!882477 m!822543))

(declare-fun m!822769 () Bool)

(assert (=> b!882477 m!822769))

(assert (=> b!882479 m!822527))

(assert (=> b!882479 m!822527))

(declare-fun m!822771 () Bool)

(assert (=> b!882479 m!822771))

(declare-fun m!822773 () Bool)

(assert (=> d!109395 m!822773))

(assert (=> d!109395 m!822521))

(declare-fun m!822775 () Bool)

(assert (=> b!882482 m!822775))

(assert (=> b!882287 d!109395))

(declare-fun b!882488 () Bool)

(declare-fun e!491204 () Bool)

(declare-fun lt!399109 () ListLongMap!10429)

(assert (=> b!882488 (= e!491204 (isEmpty!675 lt!399109))))

(declare-fun b!882489 () Bool)

(declare-fun lt!399113 () Unit!30058)

(declare-fun lt!399112 () Unit!30058)

(assert (=> b!882489 (= lt!399113 lt!399112)))

(declare-fun lt!399111 () ListLongMap!10429)

(declare-fun lt!399114 () (_ BitVec 64))

(declare-fun lt!399108 () (_ BitVec 64))

(declare-fun lt!399110 () V!28529)

(assert (=> b!882489 (not (contains!4242 (+!2545 lt!399111 (tuple2!11659 lt!399114 lt!399110)) lt!399108))))

(assert (=> b!882489 (= lt!399112 (addStillNotContains!209 lt!399111 lt!399114 lt!399110 lt!399108))))

(assert (=> b!882489 (= lt!399108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882489 (= lt!399110 (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882489 (= lt!399114 (select (arr!24711 _keys!868) from!1053))))

(declare-fun call!38991 () ListLongMap!10429)

(assert (=> b!882489 (= lt!399111 call!38991)))

(declare-fun e!491205 () ListLongMap!10429)

(assert (=> b!882489 (= e!491205 (+!2545 call!38991 (tuple2!11659 (select (arr!24711 _keys!868) from!1053) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882490 () Bool)

(declare-fun e!491206 () Bool)

(declare-fun e!491201 () Bool)

(assert (=> b!882490 (= e!491206 e!491201)))

(declare-fun c!93250 () Bool)

(declare-fun e!491207 () Bool)

(assert (=> b!882490 (= c!93250 e!491207)))

(declare-fun res!599249 () Bool)

(assert (=> b!882490 (=> (not res!599249) (not e!491207))))

(assert (=> b!882490 (= res!599249 (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun b!882491 () Bool)

(declare-fun e!491203 () Bool)

(assert (=> b!882491 (= e!491201 e!491203)))

(assert (=> b!882491 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun res!599248 () Bool)

(assert (=> b!882491 (= res!599248 (contains!4242 lt!399109 (select (arr!24711 _keys!868) from!1053)))))

(assert (=> b!882491 (=> (not res!599248) (not e!491203))))

(declare-fun b!882492 () Bool)

(assert (=> b!882492 (= e!491205 call!38991)))

(declare-fun bm!38988 () Bool)

(assert (=> bm!38988 (= call!38991 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882493 () Bool)

(assert (=> b!882493 (= e!491207 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(assert (=> b!882493 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882494 () Bool)

(declare-fun res!599247 () Bool)

(assert (=> b!882494 (=> (not res!599247) (not e!491206))))

(assert (=> b!882494 (= res!599247 (not (contains!4242 lt!399109 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882495 () Bool)

(assert (=> b!882495 (= e!491204 (= lt!399109 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882496 () Bool)

(assert (=> b!882496 (= e!491201 e!491204)))

(declare-fun c!93249 () Bool)

(assert (=> b!882496 (= c!93249 (bvslt from!1053 (size!25152 _keys!868)))))

(declare-fun d!109397 () Bool)

(assert (=> d!109397 e!491206))

(declare-fun res!599246 () Bool)

(assert (=> d!109397 (=> (not res!599246) (not e!491206))))

(assert (=> d!109397 (= res!599246 (not (contains!4242 lt!399109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491202 () ListLongMap!10429)

(assert (=> d!109397 (= lt!399109 e!491202)))

(declare-fun c!93247 () Bool)

(assert (=> d!109397 (= c!93247 (bvsge from!1053 (size!25152 _keys!868)))))

(assert (=> d!109397 (validMask!0 mask!1196)))

(assert (=> d!109397 (= (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399109)))

(declare-fun b!882497 () Bool)

(assert (=> b!882497 (= e!491202 (ListLongMap!10430 Nil!17485))))

(declare-fun b!882498 () Bool)

(assert (=> b!882498 (= e!491202 e!491205)))

(declare-fun c!93248 () Bool)

(assert (=> b!882498 (= c!93248 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(declare-fun b!882499 () Bool)

(assert (=> b!882499 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25152 _keys!868)))))

(assert (=> b!882499 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25153 _values!688)))))

(assert (=> b!882499 (= e!491203 (= (apply!382 lt!399109 (select (arr!24711 _keys!868) from!1053)) (get!13022 (select (arr!24712 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!109397 c!93247) b!882497))

(assert (= (and d!109397 (not c!93247)) b!882498))

(assert (= (and b!882498 c!93248) b!882489))

(assert (= (and b!882498 (not c!93248)) b!882492))

(assert (= (or b!882489 b!882492) bm!38988))

(assert (= (and d!109397 res!599246) b!882494))

(assert (= (and b!882494 res!599247) b!882490))

(assert (= (and b!882490 res!599249) b!882493))

(assert (= (and b!882490 c!93250) b!882491))

(assert (= (and b!882490 (not c!93250)) b!882496))

(assert (= (and b!882491 res!599248) b!882499))

(assert (= (and b!882496 c!93249) b!882495))

(assert (= (and b!882496 (not c!93249)) b!882488))

(declare-fun b_lambda!12577 () Bool)

(assert (=> (not b_lambda!12577) (not b!882489)))

(assert (=> b!882489 t!24648))

(declare-fun b_and!25419 () Bool)

(assert (= b_and!25417 (and (=> t!24648 result!9671) b_and!25419)))

(declare-fun b_lambda!12579 () Bool)

(assert (=> (not b_lambda!12579) (not b!882499)))

(assert (=> b!882499 t!24648))

(declare-fun b_and!25421 () Bool)

(assert (= b_and!25419 (and (=> t!24648 result!9671) b_and!25421)))

(assert (=> b!882498 m!822527))

(assert (=> b!882498 m!822527))

(assert (=> b!882498 m!822529))

(assert (=> b!882493 m!822527))

(assert (=> b!882493 m!822527))

(assert (=> b!882493 m!822529))

(assert (=> b!882499 m!822541))

(assert (=> b!882499 m!822543))

(assert (=> b!882499 m!822545))

(assert (=> b!882499 m!822527))

(assert (=> b!882499 m!822541))

(assert (=> b!882499 m!822543))

(assert (=> b!882499 m!822527))

(declare-fun m!822777 () Bool)

(assert (=> b!882499 m!822777))

(declare-fun m!822779 () Bool)

(assert (=> b!882488 m!822779))

(declare-fun m!822781 () Bool)

(assert (=> bm!38988 m!822781))

(assert (=> b!882495 m!822781))

(assert (=> b!882489 m!822541))

(assert (=> b!882489 m!822543))

(assert (=> b!882489 m!822545))

(assert (=> b!882489 m!822527))

(declare-fun m!822783 () Bool)

(assert (=> b!882489 m!822783))

(assert (=> b!882489 m!822783))

(declare-fun m!822785 () Bool)

(assert (=> b!882489 m!822785))

(declare-fun m!822787 () Bool)

(assert (=> b!882489 m!822787))

(assert (=> b!882489 m!822541))

(assert (=> b!882489 m!822543))

(declare-fun m!822789 () Bool)

(assert (=> b!882489 m!822789))

(assert (=> b!882491 m!822527))

(assert (=> b!882491 m!822527))

(declare-fun m!822791 () Bool)

(assert (=> b!882491 m!822791))

(declare-fun m!822793 () Bool)

(assert (=> d!109397 m!822793))

(assert (=> d!109397 m!822521))

(declare-fun m!822795 () Bool)

(assert (=> b!882494 m!822795))

(assert (=> b!882287 d!109397))

(declare-fun d!109399 () Bool)

(assert (=> d!109399 (= (array_inv!19502 _keys!868) (bvsge (size!25152 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74932 d!109399))

(declare-fun d!109401 () Bool)

(assert (=> d!109401 (= (array_inv!19503 _values!688) (bvsge (size!25153 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74932 d!109401))

(declare-fun d!109403 () Bool)

(declare-fun res!599254 () Bool)

(declare-fun e!491212 () Bool)

(assert (=> d!109403 (=> res!599254 e!491212)))

(assert (=> d!109403 (= res!599254 (= (select (arr!24711 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109403 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491212)))

(declare-fun b!882504 () Bool)

(declare-fun e!491213 () Bool)

(assert (=> b!882504 (= e!491212 e!491213)))

(declare-fun res!599255 () Bool)

(assert (=> b!882504 (=> (not res!599255) (not e!491213))))

(assert (=> b!882504 (= res!599255 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25152 _keys!868)))))

(declare-fun b!882505 () Bool)

(assert (=> b!882505 (= e!491213 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109403 (not res!599254)) b!882504))

(assert (= (and b!882504 res!599255) b!882505))

(assert (=> d!109403 m!822667))

(declare-fun m!822797 () Bool)

(assert (=> b!882505 m!822797))

(assert (=> b!882284 d!109403))

(declare-fun d!109405 () Bool)

(assert (=> d!109405 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399117 () Unit!30058)

(declare-fun choose!114 (array!51387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30058)

(assert (=> d!109405 (= lt!399117 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109405 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109405 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399117)))

(declare-fun bs!24738 () Bool)

(assert (= bs!24738 d!109405))

(assert (=> bs!24738 m!822513))

(declare-fun m!822799 () Bool)

(assert (=> bs!24738 m!822799))

(assert (=> b!882284 d!109405))

(declare-fun b!882506 () Bool)

(declare-fun e!491217 () Bool)

(declare-fun e!491216 () Bool)

(assert (=> b!882506 (= e!491217 e!491216)))

(declare-fun c!93251 () Bool)

(assert (=> b!882506 (= c!93251 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(declare-fun b!882507 () Bool)

(declare-fun call!38992 () Bool)

(assert (=> b!882507 (= e!491216 call!38992)))

(declare-fun d!109407 () Bool)

(declare-fun res!599257 () Bool)

(declare-fun e!491215 () Bool)

(assert (=> d!109407 (=> res!599257 e!491215)))

(assert (=> d!109407 (= res!599257 (bvsge from!1053 (size!25152 _keys!868)))))

(assert (=> d!109407 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17486) e!491215)))

(declare-fun b!882508 () Bool)

(assert (=> b!882508 (= e!491215 e!491217)))

(declare-fun res!599258 () Bool)

(assert (=> b!882508 (=> (not res!599258) (not e!491217))))

(declare-fun e!491214 () Bool)

(assert (=> b!882508 (= res!599258 (not e!491214))))

(declare-fun res!599256 () Bool)

(assert (=> b!882508 (=> (not res!599256) (not e!491214))))

(assert (=> b!882508 (= res!599256 (validKeyInArray!0 (select (arr!24711 _keys!868) from!1053)))))

(declare-fun b!882509 () Bool)

(assert (=> b!882509 (= e!491214 (contains!4241 Nil!17486 (select (arr!24711 _keys!868) from!1053)))))

(declare-fun b!882510 () Bool)

(assert (=> b!882510 (= e!491216 call!38992)))

(declare-fun bm!38989 () Bool)

(assert (=> bm!38989 (= call!38992 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93251 (Cons!17485 (select (arr!24711 _keys!868) from!1053) Nil!17486) Nil!17486)))))

(assert (= (and d!109407 (not res!599257)) b!882508))

(assert (= (and b!882508 res!599256) b!882509))

(assert (= (and b!882508 res!599258) b!882506))

(assert (= (and b!882506 c!93251) b!882510))

(assert (= (and b!882506 (not c!93251)) b!882507))

(assert (= (or b!882510 b!882507) bm!38989))

(assert (=> b!882506 m!822527))

(assert (=> b!882506 m!822527))

(assert (=> b!882506 m!822529))

(assert (=> b!882508 m!822527))

(assert (=> b!882508 m!822527))

(assert (=> b!882508 m!822529))

(assert (=> b!882509 m!822527))

(assert (=> b!882509 m!822527))

(declare-fun m!822801 () Bool)

(assert (=> b!882509 m!822801))

(assert (=> bm!38989 m!822527))

(declare-fun m!822803 () Bool)

(assert (=> bm!38989 m!822803))

(assert (=> b!882284 d!109407))

(declare-fun d!109409 () Bool)

(assert (=> d!109409 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17486)))

(declare-fun lt!399120 () Unit!30058)

(declare-fun choose!39 (array!51387 (_ BitVec 32) (_ BitVec 32)) Unit!30058)

(assert (=> d!109409 (= lt!399120 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109409 (bvslt (size!25152 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109409 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399120)))

(declare-fun bs!24739 () Bool)

(assert (= bs!24739 d!109409))

(assert (=> bs!24739 m!822517))

(declare-fun m!822805 () Bool)

(assert (=> bs!24739 m!822805))

(assert (=> b!882284 d!109409))

(declare-fun b!882517 () Bool)

(declare-fun e!491222 () Bool)

(assert (=> b!882517 (= e!491222 tp_is_empty!17611)))

(declare-fun b!882518 () Bool)

(declare-fun e!491223 () Bool)

(assert (=> b!882518 (= e!491223 tp_is_empty!17611)))

(declare-fun mapNonEmpty!28053 () Bool)

(declare-fun mapRes!28053 () Bool)

(declare-fun tp!53811 () Bool)

(assert (=> mapNonEmpty!28053 (= mapRes!28053 (and tp!53811 e!491222))))

(declare-fun mapKey!28053 () (_ BitVec 32))

(declare-fun mapRest!28053 () (Array (_ BitVec 32) ValueCell!8366))

(declare-fun mapValue!28053 () ValueCell!8366)

(assert (=> mapNonEmpty!28053 (= mapRest!28044 (store mapRest!28053 mapKey!28053 mapValue!28053))))

(declare-fun mapIsEmpty!28053 () Bool)

(assert (=> mapIsEmpty!28053 mapRes!28053))

(declare-fun condMapEmpty!28053 () Bool)

(declare-fun mapDefault!28053 () ValueCell!8366)

(assert (=> mapNonEmpty!28044 (= condMapEmpty!28053 (= mapRest!28044 ((as const (Array (_ BitVec 32) ValueCell!8366)) mapDefault!28053)))))

(assert (=> mapNonEmpty!28044 (= tp!53796 (and e!491223 mapRes!28053))))

(assert (= (and mapNonEmpty!28044 condMapEmpty!28053) mapIsEmpty!28053))

(assert (= (and mapNonEmpty!28044 (not condMapEmpty!28053)) mapNonEmpty!28053))

(assert (= (and mapNonEmpty!28053 ((_ is ValueCellFull!8366) mapValue!28053)) b!882517))

(assert (= (and mapNonEmpty!28044 ((_ is ValueCellFull!8366) mapDefault!28053)) b!882518))

(declare-fun m!822807 () Bool)

(assert (=> mapNonEmpty!28053 m!822807))

(declare-fun b_lambda!12581 () Bool)

(assert (= b_lambda!12577 (or (and start!74932 b_free!15367) b_lambda!12581)))

(declare-fun b_lambda!12583 () Bool)

(assert (= b_lambda!12567 (or (and start!74932 b_free!15367) b_lambda!12583)))

(declare-fun b_lambda!12585 () Bool)

(assert (= b_lambda!12565 (or (and start!74932 b_free!15367) b_lambda!12585)))

(declare-fun b_lambda!12587 () Bool)

(assert (= b_lambda!12575 (or (and start!74932 b_free!15367) b_lambda!12587)))

(declare-fun b_lambda!12589 () Bool)

(assert (= b_lambda!12569 (or (and start!74932 b_free!15367) b_lambda!12589)))

(declare-fun b_lambda!12591 () Bool)

(assert (= b_lambda!12573 (or (and start!74932 b_free!15367) b_lambda!12591)))

(declare-fun b_lambda!12593 () Bool)

(assert (= b_lambda!12571 (or (and start!74932 b_free!15367) b_lambda!12593)))

(declare-fun b_lambda!12595 () Bool)

(assert (= b_lambda!12579 (or (and start!74932 b_free!15367) b_lambda!12595)))

(check-sat (not b!882481) (not b!882483) (not bm!38984) (not b!882457) (not b!882506) (not b!882475) (not b!882446) (not d!109409) (not b!882434) (not bm!38976) (not b!882463) (not b!882508) (not b!882403) (not b_lambda!12589) (not b!882388) (not d!109395) (not b!882401) (not b!882489) (not bm!38979) (not b_lambda!12587) (not b!882476) (not b!882468) (not d!109405) (not b_next!15367) (not d!109383) (not bm!38987) (not b!882456) (not d!109377) (not b!882477) (not mapNonEmpty!28053) (not b!882461) (not b!882432) (not b!882436) (not b!882474) (not d!109379) (not b_lambda!12593) (not b_lambda!12563) (not b!882494) (not b!882505) (not bm!38988) (not b!882391) (not b!882439) (not b!882488) (not b_lambda!12595) (not bm!38986) (not b_lambda!12585) (not b!882467) (not b!882495) (not b!882498) (not d!109387) (not b!882487) (not b!882435) (not d!109397) (not bm!38989) tp_is_empty!17611 (not b!882479) b_and!25421 (not b!882429) (not b!882469) (not b_lambda!12581) (not b!882491) (not b!882466) (not b!882499) (not b!882459) (not b!882440) (not b_lambda!12583) (not b!882430) (not b!882493) (not bm!38985) (not b!882453) (not b!882509) (not b_lambda!12591) (not b!882482) (not bm!38973) (not b!882390) (not b!882462) (not d!109385) (not b!882445) (not b!882486))
(check-sat b_and!25421 (not b_next!15367))
