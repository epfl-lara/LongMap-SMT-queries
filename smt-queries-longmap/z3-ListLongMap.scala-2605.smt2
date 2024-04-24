; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39434 () Bool)

(assert start!39434)

(declare-fun b_free!9715 () Bool)

(declare-fun b_next!9715 () Bool)

(assert (=> start!39434 (= b_free!9715 (not b_next!9715))))

(declare-fun tp!34674 () Bool)

(declare-fun b_and!17319 () Bool)

(assert (=> start!39434 (= tp!34674 b_and!17319)))

(declare-fun b!420331 () Bool)

(declare-fun e!250370 () Bool)

(declare-fun e!250373 () Bool)

(assert (=> b!420331 (= e!250370 e!250373)))

(declare-fun res!245207 () Bool)

(assert (=> b!420331 (=> (not res!245207) (not e!250373))))

(declare-datatypes ((array!25590 0))(
  ( (array!25591 (arr!12244 (Array (_ BitVec 32) (_ BitVec 64))) (size!12596 (_ BitVec 32))) )
))
(declare-fun lt!192897 () array!25590)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25590 (_ BitVec 32)) Bool)

(assert (=> b!420331 (= res!245207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192897 mask!1025))))

(declare-fun _keys!709 () array!25590)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420331 (= lt!192897 (array!25591 (store (arr!12244 _keys!709) i!563 k0!794) (size!12596 _keys!709)))))

(declare-fun b!420332 () Bool)

(declare-fun res!245197 () Bool)

(assert (=> b!420332 (=> (not res!245197) (not e!250370))))

(declare-datatypes ((List!7066 0))(
  ( (Nil!7063) (Cons!7062 (h!7918 (_ BitVec 64)) (t!12438 List!7066)) )
))
(declare-fun arrayNoDuplicates!0 (array!25590 (_ BitVec 32) List!7066) Bool)

(assert (=> b!420332 (= res!245197 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7063))))

(declare-fun b!420333 () Bool)

(declare-fun res!245196 () Bool)

(assert (=> b!420333 (=> (not res!245196) (not e!250370))))

(assert (=> b!420333 (= res!245196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17922 () Bool)

(declare-fun mapRes!17922 () Bool)

(assert (=> mapIsEmpty!17922 mapRes!17922))

(declare-fun b!420334 () Bool)

(declare-fun e!250377 () Bool)

(declare-fun e!250376 () Bool)

(assert (=> b!420334 (= e!250377 (and e!250376 mapRes!17922))))

(declare-fun condMapEmpty!17922 () Bool)

(declare-datatypes ((V!15595 0))(
  ( (V!15596 (val!5478 Int)) )
))
(declare-datatypes ((ValueCell!5090 0))(
  ( (ValueCellFull!5090 (v!7726 V!15595)) (EmptyCell!5090) )
))
(declare-datatypes ((array!25592 0))(
  ( (array!25593 (arr!12245 (Array (_ BitVec 32) ValueCell!5090)) (size!12597 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25592)

(declare-fun mapDefault!17922 () ValueCell!5090)

(assert (=> b!420334 (= condMapEmpty!17922 (= (arr!12245 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5090)) mapDefault!17922)))))

(declare-fun b!420335 () Bool)

(declare-fun tp_is_empty!10867 () Bool)

(assert (=> b!420335 (= e!250376 tp_is_empty!10867)))

(declare-fun mapNonEmpty!17922 () Bool)

(declare-fun tp!34673 () Bool)

(declare-fun e!250378 () Bool)

(assert (=> mapNonEmpty!17922 (= mapRes!17922 (and tp!34673 e!250378))))

(declare-fun mapRest!17922 () (Array (_ BitVec 32) ValueCell!5090))

(declare-fun mapKey!17922 () (_ BitVec 32))

(declare-fun mapValue!17922 () ValueCell!5090)

(assert (=> mapNonEmpty!17922 (= (arr!12245 _values!549) (store mapRest!17922 mapKey!17922 mapValue!17922))))

(declare-fun b!420336 () Bool)

(declare-fun res!245202 () Bool)

(assert (=> b!420336 (=> (not res!245202) (not e!250370))))

(declare-fun arrayContainsKey!0 (array!25590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420336 (= res!245202 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420338 () Bool)

(declare-fun res!245195 () Bool)

(assert (=> b!420338 (=> (not res!245195) (not e!250370))))

(assert (=> b!420338 (= res!245195 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12596 _keys!709))))))

(declare-fun b!420339 () Bool)

(declare-fun e!250375 () Bool)

(assert (=> b!420339 (= e!250373 e!250375)))

(declare-fun res!245203 () Bool)

(assert (=> b!420339 (=> (not res!245203) (not e!250375))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!420339 (= res!245203 (= from!863 i!563))))

(declare-fun minValue!515 () V!15595)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7058 0))(
  ( (tuple2!7059 (_1!3540 (_ BitVec 64)) (_2!3540 V!15595)) )
))
(declare-datatypes ((List!7067 0))(
  ( (Nil!7064) (Cons!7063 (h!7919 tuple2!7058) (t!12439 List!7067)) )
))
(declare-datatypes ((ListLongMap!5973 0))(
  ( (ListLongMap!5974 (toList!3002 List!7067)) )
))
(declare-fun lt!192899 () ListLongMap!5973)

(declare-fun zeroValue!515 () V!15595)

(declare-fun lt!192894 () array!25592)

(declare-fun getCurrentListMapNoExtraKeys!1248 (array!25590 array!25592 (_ BitVec 32) (_ BitVec 32) V!15595 V!15595 (_ BitVec 32) Int) ListLongMap!5973)

(assert (=> b!420339 (= lt!192899 (getCurrentListMapNoExtraKeys!1248 lt!192897 lt!192894 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15595)

(assert (=> b!420339 (= lt!192894 (array!25593 (store (arr!12245 _values!549) i!563 (ValueCellFull!5090 v!412)) (size!12597 _values!549)))))

(declare-fun lt!192893 () ListLongMap!5973)

(assert (=> b!420339 (= lt!192893 (getCurrentListMapNoExtraKeys!1248 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420340 () Bool)

(declare-fun res!245206 () Bool)

(assert (=> b!420340 (=> (not res!245206) (not e!250370))))

(assert (=> b!420340 (= res!245206 (or (= (select (arr!12244 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12244 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29307 () Bool)

(declare-fun c!55263 () Bool)

(declare-fun call!29310 () ListLongMap!5973)

(assert (=> bm!29307 (= call!29310 (getCurrentListMapNoExtraKeys!1248 (ite c!55263 _keys!709 lt!192897) (ite c!55263 _values!549 lt!192894) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420341 () Bool)

(declare-fun e!250371 () Bool)

(declare-fun call!29311 () ListLongMap!5973)

(assert (=> b!420341 (= e!250371 (= call!29310 call!29311))))

(declare-fun bm!29308 () Bool)

(assert (=> bm!29308 (= call!29311 (getCurrentListMapNoExtraKeys!1248 (ite c!55263 lt!192897 _keys!709) (ite c!55263 lt!192894 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420342 () Bool)

(declare-fun res!245201 () Bool)

(assert (=> b!420342 (=> (not res!245201) (not e!250370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420342 (= res!245201 (validMask!0 mask!1025))))

(declare-fun b!420343 () Bool)

(declare-fun res!245204 () Bool)

(assert (=> b!420343 (=> (not res!245204) (not e!250373))))

(assert (=> b!420343 (= res!245204 (arrayNoDuplicates!0 lt!192897 #b00000000000000000000000000000000 Nil!7063))))

(declare-fun b!420344 () Bool)

(assert (=> b!420344 (= e!250378 tp_is_empty!10867)))

(declare-fun b!420345 () Bool)

(declare-fun e!250374 () Bool)

(assert (=> b!420345 (= e!250375 (not e!250374))))

(declare-fun res!245200 () Bool)

(assert (=> b!420345 (=> res!245200 e!250374)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420345 (= res!245200 (validKeyInArray!0 (select (arr!12244 _keys!709) from!863)))))

(assert (=> b!420345 e!250371))

(assert (=> b!420345 (= c!55263 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12405 0))(
  ( (Unit!12406) )
))
(declare-fun lt!192896 () Unit!12405)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 (array!25590 array!25592 (_ BitVec 32) (_ BitVec 32) V!15595 V!15595 (_ BitVec 32) (_ BitVec 64) V!15595 (_ BitVec 32) Int) Unit!12405)

(assert (=> b!420345 (= lt!192896 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245205 () Bool)

(assert (=> start!39434 (=> (not res!245205) (not e!250370))))

(assert (=> start!39434 (= res!245205 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12596 _keys!709))))))

(assert (=> start!39434 e!250370))

(assert (=> start!39434 tp_is_empty!10867))

(assert (=> start!39434 tp!34674))

(assert (=> start!39434 true))

(declare-fun array_inv!9000 (array!25592) Bool)

(assert (=> start!39434 (and (array_inv!9000 _values!549) e!250377)))

(declare-fun array_inv!9001 (array!25590) Bool)

(assert (=> start!39434 (array_inv!9001 _keys!709)))

(declare-fun b!420337 () Bool)

(declare-fun res!245199 () Bool)

(assert (=> b!420337 (=> (not res!245199) (not e!250370))))

(assert (=> b!420337 (= res!245199 (and (= (size!12597 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12596 _keys!709) (size!12597 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420346 () Bool)

(declare-fun res!245208 () Bool)

(assert (=> b!420346 (=> (not res!245208) (not e!250373))))

(assert (=> b!420346 (= res!245208 (bvsle from!863 i!563))))

(declare-fun b!420347 () Bool)

(assert (=> b!420347 (= e!250374 true)))

(declare-fun lt!192891 () V!15595)

(declare-fun lt!192890 () tuple2!7058)

(declare-fun lt!192900 () ListLongMap!5973)

(declare-fun +!1266 (ListLongMap!5973 tuple2!7058) ListLongMap!5973)

(assert (=> b!420347 (= (+!1266 lt!192900 lt!192890) (+!1266 (+!1266 lt!192900 (tuple2!7059 k0!794 lt!192891)) lt!192890))))

(declare-fun lt!192892 () V!15595)

(assert (=> b!420347 (= lt!192890 (tuple2!7059 k0!794 lt!192892))))

(declare-fun lt!192895 () Unit!12405)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!56 (ListLongMap!5973 (_ BitVec 64) V!15595 V!15595) Unit!12405)

(assert (=> b!420347 (= lt!192895 (addSameAsAddTwiceSameKeyDiffValues!56 lt!192900 k0!794 lt!192891 lt!192892))))

(declare-fun lt!192898 () V!15595)

(declare-fun get!6082 (ValueCell!5090 V!15595) V!15595)

(assert (=> b!420347 (= lt!192891 (get!6082 (select (arr!12245 _values!549) from!863) lt!192898))))

(assert (=> b!420347 (= lt!192899 (+!1266 lt!192900 (tuple2!7059 (select (arr!12244 lt!192897) from!863) lt!192892)))))

(assert (=> b!420347 (= lt!192892 (get!6082 (select (store (arr!12245 _values!549) i!563 (ValueCellFull!5090 v!412)) from!863) lt!192898))))

(declare-fun dynLambda!723 (Int (_ BitVec 64)) V!15595)

(assert (=> b!420347 (= lt!192898 (dynLambda!723 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420347 (= lt!192900 (getCurrentListMapNoExtraKeys!1248 lt!192897 lt!192894 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420348 () Bool)

(declare-fun res!245198 () Bool)

(assert (=> b!420348 (=> (not res!245198) (not e!250370))))

(assert (=> b!420348 (= res!245198 (validKeyInArray!0 k0!794))))

(declare-fun b!420349 () Bool)

(assert (=> b!420349 (= e!250371 (= call!29311 (+!1266 call!29310 (tuple2!7059 k0!794 v!412))))))

(assert (= (and start!39434 res!245205) b!420342))

(assert (= (and b!420342 res!245201) b!420337))

(assert (= (and b!420337 res!245199) b!420333))

(assert (= (and b!420333 res!245196) b!420332))

(assert (= (and b!420332 res!245197) b!420338))

(assert (= (and b!420338 res!245195) b!420348))

(assert (= (and b!420348 res!245198) b!420340))

(assert (= (and b!420340 res!245206) b!420336))

(assert (= (and b!420336 res!245202) b!420331))

(assert (= (and b!420331 res!245207) b!420343))

(assert (= (and b!420343 res!245204) b!420346))

(assert (= (and b!420346 res!245208) b!420339))

(assert (= (and b!420339 res!245203) b!420345))

(assert (= (and b!420345 c!55263) b!420349))

(assert (= (and b!420345 (not c!55263)) b!420341))

(assert (= (or b!420349 b!420341) bm!29308))

(assert (= (or b!420349 b!420341) bm!29307))

(assert (= (and b!420345 (not res!245200)) b!420347))

(assert (= (and b!420334 condMapEmpty!17922) mapIsEmpty!17922))

(assert (= (and b!420334 (not condMapEmpty!17922)) mapNonEmpty!17922))

(get-info :version)

(assert (= (and mapNonEmpty!17922 ((_ is ValueCellFull!5090) mapValue!17922)) b!420344))

(assert (= (and b!420334 ((_ is ValueCellFull!5090) mapDefault!17922)) b!420335))

(assert (= start!39434 b!420334))

(declare-fun b_lambda!9041 () Bool)

(assert (=> (not b_lambda!9041) (not b!420347)))

(declare-fun t!12437 () Bool)

(declare-fun tb!3329 () Bool)

(assert (=> (and start!39434 (= defaultEntry!557 defaultEntry!557) t!12437) tb!3329))

(declare-fun result!6193 () Bool)

(assert (=> tb!3329 (= result!6193 tp_is_empty!10867)))

(assert (=> b!420347 t!12437))

(declare-fun b_and!17321 () Bool)

(assert (= b_and!17319 (and (=> t!12437 result!6193) b_and!17321)))

(declare-fun m!410215 () Bool)

(assert (=> b!420348 m!410215))

(declare-fun m!410217 () Bool)

(assert (=> b!420331 m!410217))

(declare-fun m!410219 () Bool)

(assert (=> b!420331 m!410219))

(declare-fun m!410221 () Bool)

(assert (=> bm!29307 m!410221))

(declare-fun m!410223 () Bool)

(assert (=> b!420339 m!410223))

(declare-fun m!410225 () Bool)

(assert (=> b!420339 m!410225))

(declare-fun m!410227 () Bool)

(assert (=> b!420339 m!410227))

(declare-fun m!410229 () Bool)

(assert (=> b!420340 m!410229))

(declare-fun m!410231 () Bool)

(assert (=> b!420343 m!410231))

(declare-fun m!410233 () Bool)

(assert (=> b!420345 m!410233))

(assert (=> b!420345 m!410233))

(declare-fun m!410235 () Bool)

(assert (=> b!420345 m!410235))

(declare-fun m!410237 () Bool)

(assert (=> b!420345 m!410237))

(declare-fun m!410239 () Bool)

(assert (=> b!420347 m!410239))

(declare-fun m!410241 () Bool)

(assert (=> b!420347 m!410241))

(declare-fun m!410243 () Bool)

(assert (=> b!420347 m!410243))

(assert (=> b!420347 m!410225))

(declare-fun m!410245 () Bool)

(assert (=> b!420347 m!410245))

(assert (=> b!420347 m!410245))

(declare-fun m!410247 () Bool)

(assert (=> b!420347 m!410247))

(declare-fun m!410249 () Bool)

(assert (=> b!420347 m!410249))

(declare-fun m!410251 () Bool)

(assert (=> b!420347 m!410251))

(declare-fun m!410253 () Bool)

(assert (=> b!420347 m!410253))

(declare-fun m!410255 () Bool)

(assert (=> b!420347 m!410255))

(declare-fun m!410257 () Bool)

(assert (=> b!420347 m!410257))

(assert (=> b!420347 m!410239))

(declare-fun m!410259 () Bool)

(assert (=> b!420347 m!410259))

(assert (=> b!420347 m!410251))

(declare-fun m!410261 () Bool)

(assert (=> b!420347 m!410261))

(declare-fun m!410263 () Bool)

(assert (=> start!39434 m!410263))

(declare-fun m!410265 () Bool)

(assert (=> start!39434 m!410265))

(declare-fun m!410267 () Bool)

(assert (=> bm!29308 m!410267))

(declare-fun m!410269 () Bool)

(assert (=> b!420336 m!410269))

(declare-fun m!410271 () Bool)

(assert (=> b!420349 m!410271))

(declare-fun m!410273 () Bool)

(assert (=> b!420332 m!410273))

(declare-fun m!410275 () Bool)

(assert (=> b!420333 m!410275))

(declare-fun m!410277 () Bool)

(assert (=> b!420342 m!410277))

(declare-fun m!410279 () Bool)

(assert (=> mapNonEmpty!17922 m!410279))

(check-sat tp_is_empty!10867 (not b!420348) (not b!420336) (not b!420347) b_and!17321 (not bm!29307) (not b_lambda!9041) (not b!420331) (not b_next!9715) (not b!420333) (not b!420349) (not b!420332) (not bm!29308) (not b!420345) (not start!39434) (not b!420342) (not mapNonEmpty!17922) (not b!420343) (not b!420339))
(check-sat b_and!17321 (not b_next!9715))
