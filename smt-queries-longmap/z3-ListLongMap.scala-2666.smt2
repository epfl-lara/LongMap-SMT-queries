; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39800 () Bool)

(assert start!39800)

(declare-fun b_free!10081 () Bool)

(declare-fun b_next!10081 () Bool)

(assert (=> start!39800 (= b_free!10081 (not b_next!10081))))

(declare-fun tp!35772 () Bool)

(declare-fun b_and!17795 () Bool)

(assert (=> start!39800 (= tp!35772 b_and!17795)))

(declare-fun b!429457 () Bool)

(declare-fun res!252282 () Bool)

(declare-fun e!254322 () Bool)

(assert (=> b!429457 (=> (not res!252282) (not e!254322))))

(declare-datatypes ((array!26295 0))(
  ( (array!26296 (arr!12597 (Array (_ BitVec 32) (_ BitVec 64))) (size!12950 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26295)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26295 (_ BitVec 32)) Bool)

(assert (=> b!429457 (= res!252282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429458 () Bool)

(declare-fun e!254315 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429458 (= e!254315 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12950 _keys!709))))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!429458 (not (= (select (arr!12597 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12619 0))(
  ( (Unit!12620) )
))
(declare-fun lt!196180 () Unit!12619)

(declare-fun e!254319 () Unit!12619)

(assert (=> b!429458 (= lt!196180 e!254319)))

(declare-fun c!55386 () Bool)

(assert (=> b!429458 (= c!55386 (= (select (arr!12597 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16083 0))(
  ( (V!16084 (val!5661 Int)) )
))
(declare-datatypes ((tuple2!7460 0))(
  ( (tuple2!7461 (_1!3741 (_ BitVec 64)) (_2!3741 V!16083)) )
))
(declare-datatypes ((List!7459 0))(
  ( (Nil!7456) (Cons!7455 (h!8311 tuple2!7460) (t!12980 List!7459)) )
))
(declare-datatypes ((ListLongMap!6363 0))(
  ( (ListLongMap!6364 (toList!3197 List!7459)) )
))
(declare-fun lt!196174 () ListLongMap!6363)

(declare-datatypes ((ValueCell!5273 0))(
  ( (ValueCellFull!5273 (v!7902 V!16083)) (EmptyCell!5273) )
))
(declare-datatypes ((array!26297 0))(
  ( (array!26298 (arr!12598 (Array (_ BitVec 32) ValueCell!5273)) (size!12951 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26297)

(declare-fun lt!196176 () ListLongMap!6363)

(declare-fun +!1375 (ListLongMap!6363 tuple2!7460) ListLongMap!6363)

(declare-fun get!6248 (ValueCell!5273 V!16083) V!16083)

(declare-fun dynLambda!770 (Int (_ BitVec 64)) V!16083)

(assert (=> b!429458 (= lt!196176 (+!1375 lt!196174 (tuple2!7461 (select (arr!12597 _keys!709) from!863) (get!6248 (select (arr!12598 _values!549) from!863) (dynLambda!770 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429459 () Bool)

(declare-fun res!252279 () Bool)

(declare-fun e!254321 () Bool)

(assert (=> b!429459 (=> (not res!252279) (not e!254321))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429459 (= res!252279 (bvsle from!863 i!563))))

(declare-fun res!252283 () Bool)

(assert (=> start!39800 (=> (not res!252283) (not e!254322))))

(assert (=> start!39800 (= res!252283 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12950 _keys!709))))))

(assert (=> start!39800 e!254322))

(declare-fun tp_is_empty!11233 () Bool)

(assert (=> start!39800 tp_is_empty!11233))

(assert (=> start!39800 tp!35772))

(assert (=> start!39800 true))

(declare-fun e!254320 () Bool)

(declare-fun array_inv!9206 (array!26297) Bool)

(assert (=> start!39800 (and (array_inv!9206 _values!549) e!254320)))

(declare-fun array_inv!9207 (array!26295) Bool)

(assert (=> start!39800 (array_inv!9207 _keys!709)))

(declare-fun b!429460 () Bool)

(declare-fun res!252280 () Bool)

(assert (=> b!429460 (=> (not res!252280) (not e!254322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429460 (= res!252280 (validKeyInArray!0 k0!794))))

(declare-fun b!429461 () Bool)

(declare-fun Unit!12621 () Unit!12619)

(assert (=> b!429461 (= e!254319 Unit!12621)))

(declare-fun b!429462 () Bool)

(declare-fun Unit!12622 () Unit!12619)

(assert (=> b!429462 (= e!254319 Unit!12622)))

(declare-fun lt!196181 () Unit!12619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12619)

(assert (=> b!429462 (= lt!196181 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429462 false))

(declare-fun b!429463 () Bool)

(declare-fun e!254317 () Bool)

(assert (=> b!429463 (= e!254317 (not e!254315))))

(declare-fun res!252291 () Bool)

(assert (=> b!429463 (=> res!252291 e!254315)))

(assert (=> b!429463 (= res!252291 (not (validKeyInArray!0 (select (arr!12597 _keys!709) from!863))))))

(declare-fun lt!196177 () ListLongMap!6363)

(assert (=> b!429463 (= lt!196177 lt!196174)))

(declare-fun lt!196179 () ListLongMap!6363)

(declare-fun v!412 () V!16083)

(assert (=> b!429463 (= lt!196174 (+!1375 lt!196179 (tuple2!7461 k0!794 v!412)))))

(declare-fun minValue!515 () V!16083)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16083)

(declare-fun lt!196172 () array!26297)

(declare-fun lt!196173 () array!26295)

(declare-fun getCurrentListMapNoExtraKeys!1404 (array!26295 array!26297 (_ BitVec 32) (_ BitVec 32) V!16083 V!16083 (_ BitVec 32) Int) ListLongMap!6363)

(assert (=> b!429463 (= lt!196177 (getCurrentListMapNoExtraKeys!1404 lt!196173 lt!196172 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429463 (= lt!196179 (getCurrentListMapNoExtraKeys!1404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196178 () Unit!12619)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 (array!26295 array!26297 (_ BitVec 32) (_ BitVec 32) V!16083 V!16083 (_ BitVec 32) (_ BitVec 64) V!16083 (_ BitVec 32) Int) Unit!12619)

(assert (=> b!429463 (= lt!196178 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18471 () Bool)

(declare-fun mapRes!18471 () Bool)

(declare-fun tp!35771 () Bool)

(declare-fun e!254318 () Bool)

(assert (=> mapNonEmpty!18471 (= mapRes!18471 (and tp!35771 e!254318))))

(declare-fun mapKey!18471 () (_ BitVec 32))

(declare-fun mapValue!18471 () ValueCell!5273)

(declare-fun mapRest!18471 () (Array (_ BitVec 32) ValueCell!5273))

(assert (=> mapNonEmpty!18471 (= (arr!12598 _values!549) (store mapRest!18471 mapKey!18471 mapValue!18471))))

(declare-fun b!429464 () Bool)

(assert (=> b!429464 (= e!254322 e!254321)))

(declare-fun res!252289 () Bool)

(assert (=> b!429464 (=> (not res!252289) (not e!254321))))

(assert (=> b!429464 (= res!252289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196173 mask!1025))))

(assert (=> b!429464 (= lt!196173 (array!26296 (store (arr!12597 _keys!709) i!563 k0!794) (size!12950 _keys!709)))))

(declare-fun b!429465 () Bool)

(declare-fun res!252286 () Bool)

(assert (=> b!429465 (=> (not res!252286) (not e!254321))))

(declare-datatypes ((List!7460 0))(
  ( (Nil!7457) (Cons!7456 (h!8312 (_ BitVec 64)) (t!12981 List!7460)) )
))
(declare-fun arrayNoDuplicates!0 (array!26295 (_ BitVec 32) List!7460) Bool)

(assert (=> b!429465 (= res!252286 (arrayNoDuplicates!0 lt!196173 #b00000000000000000000000000000000 Nil!7457))))

(declare-fun b!429466 () Bool)

(assert (=> b!429466 (= e!254321 e!254317)))

(declare-fun res!252281 () Bool)

(assert (=> b!429466 (=> (not res!252281) (not e!254317))))

(assert (=> b!429466 (= res!252281 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429466 (= lt!196176 (getCurrentListMapNoExtraKeys!1404 lt!196173 lt!196172 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429466 (= lt!196172 (array!26298 (store (arr!12598 _values!549) i!563 (ValueCellFull!5273 v!412)) (size!12951 _values!549)))))

(declare-fun lt!196175 () ListLongMap!6363)

(assert (=> b!429466 (= lt!196175 (getCurrentListMapNoExtraKeys!1404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429467 () Bool)

(declare-fun e!254316 () Bool)

(assert (=> b!429467 (= e!254320 (and e!254316 mapRes!18471))))

(declare-fun condMapEmpty!18471 () Bool)

(declare-fun mapDefault!18471 () ValueCell!5273)

(assert (=> b!429467 (= condMapEmpty!18471 (= (arr!12598 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5273)) mapDefault!18471)))))

(declare-fun mapIsEmpty!18471 () Bool)

(assert (=> mapIsEmpty!18471 mapRes!18471))

(declare-fun b!429468 () Bool)

(declare-fun res!252284 () Bool)

(assert (=> b!429468 (=> (not res!252284) (not e!254322))))

(assert (=> b!429468 (= res!252284 (or (= (select (arr!12597 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12597 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429469 () Bool)

(assert (=> b!429469 (= e!254316 tp_is_empty!11233)))

(declare-fun b!429470 () Bool)

(declare-fun res!252278 () Bool)

(assert (=> b!429470 (=> (not res!252278) (not e!254322))))

(assert (=> b!429470 (= res!252278 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7457))))

(declare-fun b!429471 () Bool)

(assert (=> b!429471 (= e!254318 tp_is_empty!11233)))

(declare-fun b!429472 () Bool)

(declare-fun res!252287 () Bool)

(assert (=> b!429472 (=> (not res!252287) (not e!254322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429472 (= res!252287 (validMask!0 mask!1025))))

(declare-fun b!429473 () Bool)

(declare-fun res!252285 () Bool)

(assert (=> b!429473 (=> (not res!252285) (not e!254322))))

(assert (=> b!429473 (= res!252285 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12950 _keys!709))))))

(declare-fun b!429474 () Bool)

(declare-fun res!252288 () Bool)

(assert (=> b!429474 (=> (not res!252288) (not e!254322))))

(assert (=> b!429474 (= res!252288 (and (= (size!12951 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12950 _keys!709) (size!12951 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429475 () Bool)

(declare-fun res!252290 () Bool)

(assert (=> b!429475 (=> (not res!252290) (not e!254322))))

(declare-fun arrayContainsKey!0 (array!26295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429475 (= res!252290 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39800 res!252283) b!429472))

(assert (= (and b!429472 res!252287) b!429474))

(assert (= (and b!429474 res!252288) b!429457))

(assert (= (and b!429457 res!252282) b!429470))

(assert (= (and b!429470 res!252278) b!429473))

(assert (= (and b!429473 res!252285) b!429460))

(assert (= (and b!429460 res!252280) b!429468))

(assert (= (and b!429468 res!252284) b!429475))

(assert (= (and b!429475 res!252290) b!429464))

(assert (= (and b!429464 res!252289) b!429465))

(assert (= (and b!429465 res!252286) b!429459))

(assert (= (and b!429459 res!252279) b!429466))

(assert (= (and b!429466 res!252281) b!429463))

(assert (= (and b!429463 (not res!252291)) b!429458))

(assert (= (and b!429458 c!55386) b!429462))

(assert (= (and b!429458 (not c!55386)) b!429461))

(assert (= (and b!429467 condMapEmpty!18471) mapIsEmpty!18471))

(assert (= (and b!429467 (not condMapEmpty!18471)) mapNonEmpty!18471))

(get-info :version)

(assert (= (and mapNonEmpty!18471 ((_ is ValueCellFull!5273) mapValue!18471)) b!429471))

(assert (= (and b!429467 ((_ is ValueCellFull!5273) mapDefault!18471)) b!429469))

(assert (= start!39800 b!429467))

(declare-fun b_lambda!9151 () Bool)

(assert (=> (not b_lambda!9151) (not b!429458)))

(declare-fun t!12979 () Bool)

(declare-fun tb!3479 () Bool)

(assert (=> (and start!39800 (= defaultEntry!557 defaultEntry!557) t!12979) tb!3479))

(declare-fun result!6493 () Bool)

(assert (=> tb!3479 (= result!6493 tp_is_empty!11233)))

(assert (=> b!429458 t!12979))

(declare-fun b_and!17797 () Bool)

(assert (= b_and!17795 (and (=> t!12979 result!6493) b_and!17797)))

(declare-fun m!417273 () Bool)

(assert (=> b!429457 m!417273))

(declare-fun m!417275 () Bool)

(assert (=> mapNonEmpty!18471 m!417275))

(declare-fun m!417277 () Bool)

(assert (=> b!429463 m!417277))

(declare-fun m!417279 () Bool)

(assert (=> b!429463 m!417279))

(declare-fun m!417281 () Bool)

(assert (=> b!429463 m!417281))

(assert (=> b!429463 m!417277))

(declare-fun m!417283 () Bool)

(assert (=> b!429463 m!417283))

(declare-fun m!417285 () Bool)

(assert (=> b!429463 m!417285))

(declare-fun m!417287 () Bool)

(assert (=> b!429463 m!417287))

(assert (=> b!429458 m!417277))

(declare-fun m!417289 () Bool)

(assert (=> b!429458 m!417289))

(declare-fun m!417291 () Bool)

(assert (=> b!429458 m!417291))

(declare-fun m!417293 () Bool)

(assert (=> b!429458 m!417293))

(assert (=> b!429458 m!417293))

(assert (=> b!429458 m!417289))

(declare-fun m!417295 () Bool)

(assert (=> b!429458 m!417295))

(declare-fun m!417297 () Bool)

(assert (=> b!429462 m!417297))

(declare-fun m!417299 () Bool)

(assert (=> b!429465 m!417299))

(declare-fun m!417301 () Bool)

(assert (=> b!429466 m!417301))

(declare-fun m!417303 () Bool)

(assert (=> b!429466 m!417303))

(declare-fun m!417305 () Bool)

(assert (=> b!429466 m!417305))

(declare-fun m!417307 () Bool)

(assert (=> b!429464 m!417307))

(declare-fun m!417309 () Bool)

(assert (=> b!429464 m!417309))

(declare-fun m!417311 () Bool)

(assert (=> b!429475 m!417311))

(declare-fun m!417313 () Bool)

(assert (=> start!39800 m!417313))

(declare-fun m!417315 () Bool)

(assert (=> start!39800 m!417315))

(declare-fun m!417317 () Bool)

(assert (=> b!429472 m!417317))

(declare-fun m!417319 () Bool)

(assert (=> b!429468 m!417319))

(declare-fun m!417321 () Bool)

(assert (=> b!429460 m!417321))

(declare-fun m!417323 () Bool)

(assert (=> b!429470 m!417323))

(check-sat (not mapNonEmpty!18471) (not b!429458) (not b!429465) (not start!39800) (not b!429475) tp_is_empty!11233 (not b!429463) (not b!429460) (not b_lambda!9151) (not b_next!10081) (not b!429457) (not b!429464) (not b!429462) (not b!429466) b_and!17797 (not b!429472) (not b!429470))
(check-sat b_and!17797 (not b_next!10081))
