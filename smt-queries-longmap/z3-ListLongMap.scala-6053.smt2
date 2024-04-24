; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78426 () Bool)

(assert start!78426)

(declare-fun b_free!16729 () Bool)

(declare-fun b_next!16729 () Bool)

(assert (=> start!78426 (= b_free!16729 (not b_next!16729))))

(declare-fun tp!58468 () Bool)

(declare-fun b_and!27317 () Bool)

(assert (=> start!78426 (= tp!58468 b_and!27317)))

(declare-fun res!616423 () Bool)

(declare-fun e!512871 () Bool)

(assert (=> start!78426 (=> (not res!616423) (not e!512871))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78426 (= res!616423 (validMask!0 mask!1756))))

(assert (=> start!78426 e!512871))

(declare-datatypes ((V!30495 0))(
  ( (V!30496 (val!9624 Int)) )
))
(declare-datatypes ((ValueCell!9092 0))(
  ( (ValueCellFull!9092 (v!12133 V!30495)) (EmptyCell!9092) )
))
(declare-datatypes ((array!54343 0))(
  ( (array!54344 (arr!26120 (Array (_ BitVec 32) ValueCell!9092)) (size!26580 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54343)

(declare-fun e!512874 () Bool)

(declare-fun array_inv!20488 (array!54343) Bool)

(assert (=> start!78426 (and (array_inv!20488 _values!1152) e!512874)))

(assert (=> start!78426 tp!58468))

(assert (=> start!78426 true))

(declare-fun tp_is_empty!19147 () Bool)

(assert (=> start!78426 tp_is_empty!19147))

(declare-datatypes ((array!54345 0))(
  ( (array!54346 (arr!26121 (Array (_ BitVec 32) (_ BitVec 64))) (size!26581 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54345)

(declare-fun array_inv!20489 (array!54345) Bool)

(assert (=> start!78426 (array_inv!20489 _keys!1386)))

(declare-fun b!914219 () Bool)

(declare-fun res!616430 () Bool)

(assert (=> b!914219 (=> (not res!616430) (not e!512871))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!914219 (= res!616430 (and (= (select (arr!26121 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914220 () Bool)

(declare-fun e!512870 () Bool)

(assert (=> b!914220 (= e!512871 (not e!512870))))

(declare-fun res!616426 () Bool)

(assert (=> b!914220 (=> res!616426 e!512870)))

(assert (=> b!914220 (= res!616426 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26581 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!54345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914220 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30896 0))(
  ( (Unit!30897) )
))
(declare-fun lt!411195 () Unit!30896)

(declare-fun zeroValue!1094 () V!30495)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30495)

(declare-fun lemmaKeyInListMapIsInArray!278 (array!54345 array!54343 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 64) Int) Unit!30896)

(assert (=> b!914220 (= lt!411195 (lemmaKeyInListMapIsInArray!278 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!914221 () Bool)

(declare-fun res!616425 () Bool)

(assert (=> b!914221 (=> (not res!616425) (not e!512871))))

(declare-datatypes ((tuple2!12498 0))(
  ( (tuple2!12499 (_1!6260 (_ BitVec 64)) (_2!6260 V!30495)) )
))
(declare-datatypes ((List!18315 0))(
  ( (Nil!18312) (Cons!18311 (h!19463 tuple2!12498) (t!25898 List!18315)) )
))
(declare-datatypes ((ListLongMap!11197 0))(
  ( (ListLongMap!11198 (toList!5614 List!18315)) )
))
(declare-fun contains!4670 (ListLongMap!11197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2875 (array!54345 array!54343 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 32) Int) ListLongMap!11197)

(assert (=> b!914221 (= res!616425 (contains!4670 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!914222 () Bool)

(declare-fun res!616429 () Bool)

(assert (=> b!914222 (=> (not res!616429) (not e!512871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54345 (_ BitVec 32)) Bool)

(assert (=> b!914222 (= res!616429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914223 () Bool)

(declare-fun res!616424 () Bool)

(assert (=> b!914223 (=> (not res!616424) (not e!512871))))

(declare-datatypes ((List!18316 0))(
  ( (Nil!18313) (Cons!18312 (h!19464 (_ BitVec 64)) (t!25899 List!18316)) )
))
(declare-fun arrayNoDuplicates!0 (array!54345 (_ BitVec 32) List!18316) Bool)

(assert (=> b!914223 (= res!616424 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18313))))

(declare-fun b!914224 () Bool)

(declare-fun e!512873 () Bool)

(assert (=> b!914224 (= e!512873 tp_is_empty!19147)))

(declare-fun b!914225 () Bool)

(declare-fun res!616427 () Bool)

(assert (=> b!914225 (=> (not res!616427) (not e!512871))))

(assert (=> b!914225 (= res!616427 (and (= (size!26580 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26581 _keys!1386) (size!26580 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914226 () Bool)

(assert (=> b!914226 (= e!512870 (contains!4670 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033))))

(declare-fun b!914227 () Bool)

(declare-fun e!512872 () Bool)

(assert (=> b!914227 (= e!512872 tp_is_empty!19147)))

(declare-fun mapIsEmpty!30451 () Bool)

(declare-fun mapRes!30451 () Bool)

(assert (=> mapIsEmpty!30451 mapRes!30451))

(declare-fun b!914228 () Bool)

(declare-fun res!616428 () Bool)

(assert (=> b!914228 (=> (not res!616428) (not e!512871))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914228 (= res!616428 (inRange!0 i!717 mask!1756))))

(declare-fun b!914229 () Bool)

(assert (=> b!914229 (= e!512874 (and e!512872 mapRes!30451))))

(declare-fun condMapEmpty!30451 () Bool)

(declare-fun mapDefault!30451 () ValueCell!9092)

(assert (=> b!914229 (= condMapEmpty!30451 (= (arr!26120 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30451)))))

(declare-fun mapNonEmpty!30451 () Bool)

(declare-fun tp!58467 () Bool)

(assert (=> mapNonEmpty!30451 (= mapRes!30451 (and tp!58467 e!512873))))

(declare-fun mapKey!30451 () (_ BitVec 32))

(declare-fun mapRest!30451 () (Array (_ BitVec 32) ValueCell!9092))

(declare-fun mapValue!30451 () ValueCell!9092)

(assert (=> mapNonEmpty!30451 (= (arr!26120 _values!1152) (store mapRest!30451 mapKey!30451 mapValue!30451))))

(assert (= (and start!78426 res!616423) b!914225))

(assert (= (and b!914225 res!616427) b!914222))

(assert (= (and b!914222 res!616429) b!914223))

(assert (= (and b!914223 res!616424) b!914221))

(assert (= (and b!914221 res!616425) b!914228))

(assert (= (and b!914228 res!616428) b!914219))

(assert (= (and b!914219 res!616430) b!914220))

(assert (= (and b!914220 (not res!616426)) b!914226))

(assert (= (and b!914229 condMapEmpty!30451) mapIsEmpty!30451))

(assert (= (and b!914229 (not condMapEmpty!30451)) mapNonEmpty!30451))

(get-info :version)

(assert (= (and mapNonEmpty!30451 ((_ is ValueCellFull!9092) mapValue!30451)) b!914224))

(assert (= (and b!914229 ((_ is ValueCellFull!9092) mapDefault!30451)) b!914227))

(assert (= start!78426 b!914229))

(declare-fun m!848925 () Bool)

(assert (=> b!914221 m!848925))

(assert (=> b!914221 m!848925))

(declare-fun m!848927 () Bool)

(assert (=> b!914221 m!848927))

(declare-fun m!848929 () Bool)

(assert (=> mapNonEmpty!30451 m!848929))

(declare-fun m!848931 () Bool)

(assert (=> b!914228 m!848931))

(declare-fun m!848933 () Bool)

(assert (=> b!914226 m!848933))

(assert (=> b!914226 m!848933))

(declare-fun m!848935 () Bool)

(assert (=> b!914226 m!848935))

(declare-fun m!848937 () Bool)

(assert (=> start!78426 m!848937))

(declare-fun m!848939 () Bool)

(assert (=> start!78426 m!848939))

(declare-fun m!848941 () Bool)

(assert (=> start!78426 m!848941))

(declare-fun m!848943 () Bool)

(assert (=> b!914220 m!848943))

(declare-fun m!848945 () Bool)

(assert (=> b!914220 m!848945))

(declare-fun m!848947 () Bool)

(assert (=> b!914223 m!848947))

(declare-fun m!848949 () Bool)

(assert (=> b!914222 m!848949))

(declare-fun m!848951 () Bool)

(assert (=> b!914219 m!848951))

(check-sat (not b!914222) b_and!27317 (not b!914220) tp_is_empty!19147 (not b!914223) (not b_next!16729) (not b!914226) (not b!914221) (not start!78426) (not mapNonEmpty!30451) (not b!914228))
(check-sat b_and!27317 (not b_next!16729))
(get-model)

(declare-fun d!112659 () Bool)

(declare-fun res!616483 () Bool)

(declare-fun e!512915 () Bool)

(assert (=> d!112659 (=> res!616483 e!512915)))

(assert (=> d!112659 (= res!616483 (= (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112659 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512915)))

(declare-fun b!914300 () Bool)

(declare-fun e!512916 () Bool)

(assert (=> b!914300 (= e!512915 e!512916)))

(declare-fun res!616484 () Bool)

(assert (=> b!914300 (=> (not res!616484) (not e!512916))))

(assert (=> b!914300 (= res!616484 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26581 _keys!1386)))))

(declare-fun b!914301 () Bool)

(assert (=> b!914301 (= e!512916 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112659 (not res!616483)) b!914300))

(assert (= (and b!914300 res!616484) b!914301))

(declare-fun m!849009 () Bool)

(assert (=> d!112659 m!849009))

(declare-fun m!849011 () Bool)

(assert (=> b!914301 m!849011))

(assert (=> b!914220 d!112659))

(declare-fun d!112661 () Bool)

(declare-fun e!512919 () Bool)

(assert (=> d!112661 e!512919))

(declare-fun c!96114 () Bool)

(assert (=> d!112661 (= c!96114 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!411204 () Unit!30896)

(declare-fun choose!1537 (array!54345 array!54343 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 64) Int) Unit!30896)

(assert (=> d!112661 (= lt!411204 (choose!1537 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112661 (validMask!0 mask!1756)))

(assert (=> d!112661 (= (lemmaKeyInListMapIsInArray!278 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!411204)))

(declare-fun b!914306 () Bool)

(assert (=> b!914306 (= e!512919 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914307 () Bool)

(assert (=> b!914307 (= e!512919 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112661 c!96114) b!914306))

(assert (= (and d!112661 (not c!96114)) b!914307))

(declare-fun m!849013 () Bool)

(assert (=> d!112661 m!849013))

(assert (=> d!112661 m!848937))

(assert (=> b!914306 m!848943))

(assert (=> b!914220 d!112661))

(declare-fun d!112663 () Bool)

(declare-fun e!512925 () Bool)

(assert (=> d!112663 e!512925))

(declare-fun res!616487 () Bool)

(assert (=> d!112663 (=> res!616487 e!512925)))

(declare-fun lt!411215 () Bool)

(assert (=> d!112663 (= res!616487 (not lt!411215))))

(declare-fun lt!411214 () Bool)

(assert (=> d!112663 (= lt!411215 lt!411214)))

(declare-fun lt!411216 () Unit!30896)

(declare-fun e!512924 () Unit!30896)

(assert (=> d!112663 (= lt!411216 e!512924)))

(declare-fun c!96117 () Bool)

(assert (=> d!112663 (= c!96117 lt!411214)))

(declare-fun containsKey!444 (List!18315 (_ BitVec 64)) Bool)

(assert (=> d!112663 (= lt!411214 (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112663 (= (contains!4670 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!411215)))

(declare-fun b!914314 () Bool)

(declare-fun lt!411213 () Unit!30896)

(assert (=> b!914314 (= e!512924 lt!411213)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!338 (List!18315 (_ BitVec 64)) Unit!30896)

(assert (=> b!914314 (= lt!411213 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!479 0))(
  ( (Some!478 (v!12136 V!30495)) (None!477) )
))
(declare-fun isDefined!346 (Option!479) Bool)

(declare-fun getValueByKey!473 (List!18315 (_ BitVec 64)) Option!479)

(assert (=> b!914314 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!914315 () Bool)

(declare-fun Unit!30902 () Unit!30896)

(assert (=> b!914315 (= e!512924 Unit!30902)))

(declare-fun b!914316 () Bool)

(assert (=> b!914316 (= e!512925 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112663 c!96117) b!914314))

(assert (= (and d!112663 (not c!96117)) b!914315))

(assert (= (and d!112663 (not res!616487)) b!914316))

(declare-fun m!849015 () Bool)

(assert (=> d!112663 m!849015))

(declare-fun m!849017 () Bool)

(assert (=> b!914314 m!849017))

(declare-fun m!849019 () Bool)

(assert (=> b!914314 m!849019))

(assert (=> b!914314 m!849019))

(declare-fun m!849021 () Bool)

(assert (=> b!914314 m!849021))

(assert (=> b!914316 m!849019))

(assert (=> b!914316 m!849019))

(assert (=> b!914316 m!849021))

(assert (=> b!914221 d!112663))

(declare-fun b!914359 () Bool)

(declare-fun e!512964 () Bool)

(declare-fun e!512962 () Bool)

(assert (=> b!914359 (= e!512964 e!512962)))

(declare-fun res!616506 () Bool)

(assert (=> b!914359 (=> (not res!616506) (not e!512962))))

(declare-fun lt!411281 () ListLongMap!11197)

(assert (=> b!914359 (= res!616506 (contains!4670 lt!411281 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun b!914360 () Bool)

(declare-fun e!512958 () ListLongMap!11197)

(declare-fun call!40483 () ListLongMap!11197)

(assert (=> b!914360 (= e!512958 call!40483)))

(declare-fun b!914361 () Bool)

(declare-fun e!512960 () ListLongMap!11197)

(declare-fun call!40486 () ListLongMap!11197)

(assert (=> b!914361 (= e!512960 call!40486)))

(declare-fun b!914362 () Bool)

(declare-fun e!512959 () Bool)

(declare-fun e!512956 () Bool)

(assert (=> b!914362 (= e!512959 e!512956)))

(declare-fun res!616512 () Bool)

(declare-fun call!40481 () Bool)

(assert (=> b!914362 (= res!616512 call!40481)))

(assert (=> b!914362 (=> (not res!616512) (not e!512956))))

(declare-fun b!914363 () Bool)

(declare-fun e!512957 () Unit!30896)

(declare-fun Unit!30903 () Unit!30896)

(assert (=> b!914363 (= e!512957 Unit!30903)))

(declare-fun b!914364 () Bool)

(declare-fun e!512953 () Bool)

(declare-fun call!40485 () Bool)

(assert (=> b!914364 (= e!512953 (not call!40485))))

(declare-fun b!914366 () Bool)

(assert (=> b!914366 (= e!512960 call!40483)))

(declare-fun b!914367 () Bool)

(declare-fun lt!411263 () Unit!30896)

(assert (=> b!914367 (= e!512957 lt!411263)))

(declare-fun lt!411269 () ListLongMap!11197)

(declare-fun getCurrentListMapNoExtraKeys!3339 (array!54345 array!54343 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 32) Int) ListLongMap!11197)

(assert (=> b!914367 (= lt!411269 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411276 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411276 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411267 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411267 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411264 () Unit!30896)

(declare-fun addStillContains!349 (ListLongMap!11197 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30896)

(assert (=> b!914367 (= lt!411264 (addStillContains!349 lt!411269 lt!411276 zeroValue!1094 lt!411267))))

(declare-fun +!2618 (ListLongMap!11197 tuple2!12498) ListLongMap!11197)

(assert (=> b!914367 (contains!4670 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094)) lt!411267)))

(declare-fun lt!411280 () Unit!30896)

(assert (=> b!914367 (= lt!411280 lt!411264)))

(declare-fun lt!411275 () ListLongMap!11197)

(assert (=> b!914367 (= lt!411275 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411261 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411261 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411274 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411274 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411271 () Unit!30896)

(declare-fun addApplyDifferent!349 (ListLongMap!11197 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30896)

(assert (=> b!914367 (= lt!411271 (addApplyDifferent!349 lt!411275 lt!411261 minValue!1094 lt!411274))))

(declare-fun apply!527 (ListLongMap!11197 (_ BitVec 64)) V!30495)

(assert (=> b!914367 (= (apply!527 (+!2618 lt!411275 (tuple2!12499 lt!411261 minValue!1094)) lt!411274) (apply!527 lt!411275 lt!411274))))

(declare-fun lt!411265 () Unit!30896)

(assert (=> b!914367 (= lt!411265 lt!411271)))

(declare-fun lt!411279 () ListLongMap!11197)

(assert (=> b!914367 (= lt!411279 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411282 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411270 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411270 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411272 () Unit!30896)

(assert (=> b!914367 (= lt!411272 (addApplyDifferent!349 lt!411279 lt!411282 zeroValue!1094 lt!411270))))

(assert (=> b!914367 (= (apply!527 (+!2618 lt!411279 (tuple2!12499 lt!411282 zeroValue!1094)) lt!411270) (apply!527 lt!411279 lt!411270))))

(declare-fun lt!411268 () Unit!30896)

(assert (=> b!914367 (= lt!411268 lt!411272)))

(declare-fun lt!411262 () ListLongMap!11197)

(assert (=> b!914367 (= lt!411262 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411273 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411266 () (_ BitVec 64))

(assert (=> b!914367 (= lt!411266 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914367 (= lt!411263 (addApplyDifferent!349 lt!411262 lt!411273 minValue!1094 lt!411266))))

(assert (=> b!914367 (= (apply!527 (+!2618 lt!411262 (tuple2!12499 lt!411273 minValue!1094)) lt!411266) (apply!527 lt!411262 lt!411266))))

(declare-fun b!914368 () Bool)

(declare-fun e!512952 () Bool)

(assert (=> b!914368 (= e!512953 e!512952)))

(declare-fun res!616509 () Bool)

(assert (=> b!914368 (= res!616509 call!40485)))

(assert (=> b!914368 (=> (not res!616509) (not e!512952))))

(declare-fun bm!40478 () Bool)

(declare-fun c!96132 () Bool)

(declare-fun call!40487 () ListLongMap!11197)

(declare-fun call!40482 () ListLongMap!11197)

(declare-fun c!96135 () Bool)

(declare-fun call!40484 () ListLongMap!11197)

(assert (=> bm!40478 (= call!40482 (+!2618 (ite c!96132 call!40484 (ite c!96135 call!40487 call!40486)) (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40479 () Bool)

(assert (=> bm!40479 (= call!40486 call!40487)))

(declare-fun bm!40480 () Bool)

(assert (=> bm!40480 (= call!40481 (contains!4670 lt!411281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914369 () Bool)

(declare-fun e!512961 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914369 (= e!512961 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40481 () Bool)

(assert (=> bm!40481 (= call!40485 (contains!4670 lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914370 () Bool)

(declare-fun get!13719 (ValueCell!9092 V!30495) V!30495)

(declare-fun dynLambda!1408 (Int (_ BitVec 64)) V!30495)

(assert (=> b!914370 (= e!512962 (= (apply!527 lt!411281 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) (get!13719 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914370 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26580 _values!1152)))))

(assert (=> b!914370 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun b!914371 () Bool)

(assert (=> b!914371 (= e!512952 (= (apply!527 lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914372 () Bool)

(declare-fun res!616513 () Bool)

(declare-fun e!512954 () Bool)

(assert (=> b!914372 (=> (not res!616513) (not e!512954))))

(assert (=> b!914372 (= res!616513 e!512964)))

(declare-fun res!616514 () Bool)

(assert (=> b!914372 (=> res!616514 e!512964)))

(declare-fun e!512955 () Bool)

(assert (=> b!914372 (= res!616514 (not e!512955))))

(declare-fun res!616507 () Bool)

(assert (=> b!914372 (=> (not res!616507) (not e!512955))))

(assert (=> b!914372 (= res!616507 (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun bm!40482 () Bool)

(assert (=> bm!40482 (= call!40487 call!40484)))

(declare-fun b!914373 () Bool)

(declare-fun e!512963 () ListLongMap!11197)

(assert (=> b!914373 (= e!512963 e!512958)))

(assert (=> b!914373 (= c!96135 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40483 () Bool)

(assert (=> bm!40483 (= call!40483 call!40482)))

(declare-fun b!914374 () Bool)

(declare-fun c!96134 () Bool)

(assert (=> b!914374 (= c!96134 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914374 (= e!512958 e!512960)))

(declare-fun bm!40484 () Bool)

(assert (=> bm!40484 (= call!40484 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914375 () Bool)

(declare-fun res!616508 () Bool)

(assert (=> b!914375 (=> (not res!616508) (not e!512954))))

(assert (=> b!914375 (= res!616508 e!512959)))

(declare-fun c!96133 () Bool)

(assert (=> b!914375 (= c!96133 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!914376 () Bool)

(assert (=> b!914376 (= e!512963 (+!2618 call!40482 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914377 () Bool)

(assert (=> b!914377 (= e!512956 (= (apply!527 lt!411281 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!914365 () Bool)

(assert (=> b!914365 (= e!512959 (not call!40481))))

(declare-fun d!112665 () Bool)

(assert (=> d!112665 e!512954))

(declare-fun res!616510 () Bool)

(assert (=> d!112665 (=> (not res!616510) (not e!512954))))

(assert (=> d!112665 (= res!616510 (or (bvsge #b00000000000000000000000000000000 (size!26581 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))))

(declare-fun lt!411278 () ListLongMap!11197)

(assert (=> d!112665 (= lt!411281 lt!411278)))

(declare-fun lt!411277 () Unit!30896)

(assert (=> d!112665 (= lt!411277 e!512957)))

(declare-fun c!96131 () Bool)

(assert (=> d!112665 (= c!96131 e!512961)))

(declare-fun res!616511 () Bool)

(assert (=> d!112665 (=> (not res!616511) (not e!512961))))

(assert (=> d!112665 (= res!616511 (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(assert (=> d!112665 (= lt!411278 e!512963)))

(assert (=> d!112665 (= c!96132 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112665 (validMask!0 mask!1756)))

(assert (=> d!112665 (= (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411281)))

(declare-fun b!914378 () Bool)

(assert (=> b!914378 (= e!512955 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914379 () Bool)

(assert (=> b!914379 (= e!512954 e!512953)))

(declare-fun c!96130 () Bool)

(assert (=> b!914379 (= c!96130 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112665 c!96132) b!914376))

(assert (= (and d!112665 (not c!96132)) b!914373))

(assert (= (and b!914373 c!96135) b!914360))

(assert (= (and b!914373 (not c!96135)) b!914374))

(assert (= (and b!914374 c!96134) b!914366))

(assert (= (and b!914374 (not c!96134)) b!914361))

(assert (= (or b!914366 b!914361) bm!40479))

(assert (= (or b!914360 bm!40479) bm!40482))

(assert (= (or b!914360 b!914366) bm!40483))

(assert (= (or b!914376 bm!40482) bm!40484))

(assert (= (or b!914376 bm!40483) bm!40478))

(assert (= (and d!112665 res!616511) b!914369))

(assert (= (and d!112665 c!96131) b!914367))

(assert (= (and d!112665 (not c!96131)) b!914363))

(assert (= (and d!112665 res!616510) b!914372))

(assert (= (and b!914372 res!616507) b!914378))

(assert (= (and b!914372 (not res!616514)) b!914359))

(assert (= (and b!914359 res!616506) b!914370))

(assert (= (and b!914372 res!616513) b!914375))

(assert (= (and b!914375 c!96133) b!914362))

(assert (= (and b!914375 (not c!96133)) b!914365))

(assert (= (and b!914362 res!616512) b!914377))

(assert (= (or b!914362 b!914365) bm!40480))

(assert (= (and b!914375 res!616508) b!914379))

(assert (= (and b!914379 c!96130) b!914368))

(assert (= (and b!914379 (not c!96130)) b!914364))

(assert (= (and b!914368 res!616509) b!914371))

(assert (= (or b!914368 b!914364) bm!40481))

(declare-fun b_lambda!13329 () Bool)

(assert (=> (not b_lambda!13329) (not b!914370)))

(declare-fun t!25904 () Bool)

(declare-fun tb!5435 () Bool)

(assert (=> (and start!78426 (= defaultEntry!1160 defaultEntry!1160) t!25904) tb!5435))

(declare-fun result!10685 () Bool)

(assert (=> tb!5435 (= result!10685 tp_is_empty!19147)))

(assert (=> b!914370 t!25904))

(declare-fun b_and!27323 () Bool)

(assert (= b_and!27317 (and (=> t!25904 result!10685) b_and!27323)))

(declare-fun m!849023 () Bool)

(assert (=> b!914371 m!849023))

(declare-fun m!849025 () Bool)

(assert (=> b!914376 m!849025))

(declare-fun m!849027 () Bool)

(assert (=> b!914367 m!849027))

(declare-fun m!849029 () Bool)

(assert (=> b!914367 m!849029))

(declare-fun m!849031 () Bool)

(assert (=> b!914367 m!849031))

(declare-fun m!849033 () Bool)

(assert (=> b!914367 m!849033))

(declare-fun m!849035 () Bool)

(assert (=> b!914367 m!849035))

(declare-fun m!849037 () Bool)

(assert (=> b!914367 m!849037))

(declare-fun m!849039 () Bool)

(assert (=> b!914367 m!849039))

(declare-fun m!849041 () Bool)

(assert (=> b!914367 m!849041))

(declare-fun m!849043 () Bool)

(assert (=> b!914367 m!849043))

(declare-fun m!849045 () Bool)

(assert (=> b!914367 m!849045))

(assert (=> b!914367 m!849037))

(declare-fun m!849047 () Bool)

(assert (=> b!914367 m!849047))

(declare-fun m!849049 () Bool)

(assert (=> b!914367 m!849049))

(declare-fun m!849051 () Bool)

(assert (=> b!914367 m!849051))

(assert (=> b!914367 m!849033))

(assert (=> b!914367 m!849029))

(declare-fun m!849053 () Bool)

(assert (=> b!914367 m!849053))

(assert (=> b!914367 m!849009))

(assert (=> b!914367 m!849049))

(declare-fun m!849055 () Bool)

(assert (=> b!914367 m!849055))

(declare-fun m!849057 () Bool)

(assert (=> b!914367 m!849057))

(assert (=> d!112665 m!848937))

(assert (=> b!914359 m!849009))

(assert (=> b!914359 m!849009))

(declare-fun m!849059 () Bool)

(assert (=> b!914359 m!849059))

(declare-fun m!849061 () Bool)

(assert (=> b!914370 m!849061))

(declare-fun m!849063 () Bool)

(assert (=> b!914370 m!849063))

(declare-fun m!849065 () Bool)

(assert (=> b!914370 m!849065))

(assert (=> b!914370 m!849063))

(assert (=> b!914370 m!849061))

(assert (=> b!914370 m!849009))

(declare-fun m!849067 () Bool)

(assert (=> b!914370 m!849067))

(assert (=> b!914370 m!849009))

(assert (=> b!914369 m!849009))

(assert (=> b!914369 m!849009))

(declare-fun m!849069 () Bool)

(assert (=> b!914369 m!849069))

(declare-fun m!849071 () Bool)

(assert (=> bm!40480 m!849071))

(declare-fun m!849073 () Bool)

(assert (=> bm!40481 m!849073))

(declare-fun m!849075 () Bool)

(assert (=> bm!40478 m!849075))

(assert (=> b!914378 m!849009))

(assert (=> b!914378 m!849009))

(assert (=> b!914378 m!849069))

(assert (=> bm!40484 m!849051))

(declare-fun m!849077 () Bool)

(assert (=> b!914377 m!849077))

(assert (=> b!914221 d!112665))

(declare-fun d!112667 () Bool)

(declare-fun e!512966 () Bool)

(assert (=> d!112667 e!512966))

(declare-fun res!616515 () Bool)

(assert (=> d!112667 (=> res!616515 e!512966)))

(declare-fun lt!411285 () Bool)

(assert (=> d!112667 (= res!616515 (not lt!411285))))

(declare-fun lt!411284 () Bool)

(assert (=> d!112667 (= lt!411285 lt!411284)))

(declare-fun lt!411286 () Unit!30896)

(declare-fun e!512965 () Unit!30896)

(assert (=> d!112667 (= lt!411286 e!512965)))

(declare-fun c!96136 () Bool)

(assert (=> d!112667 (= c!96136 lt!411284)))

(assert (=> d!112667 (= lt!411284 (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (=> d!112667 (= (contains!4670 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033) lt!411285)))

(declare-fun b!914382 () Bool)

(declare-fun lt!411283 () Unit!30896)

(assert (=> b!914382 (= e!512965 lt!411283)))

(assert (=> b!914382 (= lt!411283 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (=> b!914382 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun b!914383 () Bool)

(declare-fun Unit!30904 () Unit!30896)

(assert (=> b!914383 (= e!512965 Unit!30904)))

(declare-fun b!914384 () Bool)

(assert (=> b!914384 (= e!512966 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112667 c!96136) b!914382))

(assert (= (and d!112667 (not c!96136)) b!914383))

(assert (= (and d!112667 (not res!616515)) b!914384))

(declare-fun m!849079 () Bool)

(assert (=> d!112667 m!849079))

(declare-fun m!849081 () Bool)

(assert (=> b!914382 m!849081))

(declare-fun m!849083 () Bool)

(assert (=> b!914382 m!849083))

(assert (=> b!914382 m!849083))

(declare-fun m!849085 () Bool)

(assert (=> b!914382 m!849085))

(assert (=> b!914384 m!849083))

(assert (=> b!914384 m!849083))

(assert (=> b!914384 m!849085))

(assert (=> b!914226 d!112667))

(declare-fun b!914385 () Bool)

(declare-fun e!512979 () Bool)

(declare-fun e!512977 () Bool)

(assert (=> b!914385 (= e!512979 e!512977)))

(declare-fun res!616516 () Bool)

(assert (=> b!914385 (=> (not res!616516) (not e!512977))))

(declare-fun lt!411307 () ListLongMap!11197)

(assert (=> b!914385 (= res!616516 (contains!4670 lt!411307 (select (arr!26121 _keys!1386) i!717)))))

(assert (=> b!914385 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun b!914386 () Bool)

(declare-fun e!512973 () ListLongMap!11197)

(declare-fun call!40490 () ListLongMap!11197)

(assert (=> b!914386 (= e!512973 call!40490)))

(declare-fun b!914387 () Bool)

(declare-fun e!512975 () ListLongMap!11197)

(declare-fun call!40493 () ListLongMap!11197)

(assert (=> b!914387 (= e!512975 call!40493)))

(declare-fun b!914388 () Bool)

(declare-fun e!512974 () Bool)

(declare-fun e!512971 () Bool)

(assert (=> b!914388 (= e!512974 e!512971)))

(declare-fun res!616522 () Bool)

(declare-fun call!40488 () Bool)

(assert (=> b!914388 (= res!616522 call!40488)))

(assert (=> b!914388 (=> (not res!616522) (not e!512971))))

(declare-fun b!914389 () Bool)

(declare-fun e!512972 () Unit!30896)

(declare-fun Unit!30905 () Unit!30896)

(assert (=> b!914389 (= e!512972 Unit!30905)))

(declare-fun b!914390 () Bool)

(declare-fun e!512968 () Bool)

(declare-fun call!40492 () Bool)

(assert (=> b!914390 (= e!512968 (not call!40492))))

(declare-fun b!914392 () Bool)

(assert (=> b!914392 (= e!512975 call!40490)))

(declare-fun b!914393 () Bool)

(declare-fun lt!411289 () Unit!30896)

(assert (=> b!914393 (= e!512972 lt!411289)))

(declare-fun lt!411295 () ListLongMap!11197)

(assert (=> b!914393 (= lt!411295 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411302 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411293 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411293 (select (arr!26121 _keys!1386) i!717))))

(declare-fun lt!411290 () Unit!30896)

(assert (=> b!914393 (= lt!411290 (addStillContains!349 lt!411295 lt!411302 zeroValue!1094 lt!411293))))

(assert (=> b!914393 (contains!4670 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094)) lt!411293)))

(declare-fun lt!411306 () Unit!30896)

(assert (=> b!914393 (= lt!411306 lt!411290)))

(declare-fun lt!411301 () ListLongMap!11197)

(assert (=> b!914393 (= lt!411301 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411287 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411300 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411300 (select (arr!26121 _keys!1386) i!717))))

(declare-fun lt!411297 () Unit!30896)

(assert (=> b!914393 (= lt!411297 (addApplyDifferent!349 lt!411301 lt!411287 minValue!1094 lt!411300))))

(assert (=> b!914393 (= (apply!527 (+!2618 lt!411301 (tuple2!12499 lt!411287 minValue!1094)) lt!411300) (apply!527 lt!411301 lt!411300))))

(declare-fun lt!411291 () Unit!30896)

(assert (=> b!914393 (= lt!411291 lt!411297)))

(declare-fun lt!411305 () ListLongMap!11197)

(assert (=> b!914393 (= lt!411305 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411308 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411296 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411296 (select (arr!26121 _keys!1386) i!717))))

(declare-fun lt!411298 () Unit!30896)

(assert (=> b!914393 (= lt!411298 (addApplyDifferent!349 lt!411305 lt!411308 zeroValue!1094 lt!411296))))

(assert (=> b!914393 (= (apply!527 (+!2618 lt!411305 (tuple2!12499 lt!411308 zeroValue!1094)) lt!411296) (apply!527 lt!411305 lt!411296))))

(declare-fun lt!411294 () Unit!30896)

(assert (=> b!914393 (= lt!411294 lt!411298)))

(declare-fun lt!411288 () ListLongMap!11197)

(assert (=> b!914393 (= lt!411288 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411299 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411299 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411292 () (_ BitVec 64))

(assert (=> b!914393 (= lt!411292 (select (arr!26121 _keys!1386) i!717))))

(assert (=> b!914393 (= lt!411289 (addApplyDifferent!349 lt!411288 lt!411299 minValue!1094 lt!411292))))

(assert (=> b!914393 (= (apply!527 (+!2618 lt!411288 (tuple2!12499 lt!411299 minValue!1094)) lt!411292) (apply!527 lt!411288 lt!411292))))

(declare-fun b!914394 () Bool)

(declare-fun e!512967 () Bool)

(assert (=> b!914394 (= e!512968 e!512967)))

(declare-fun res!616519 () Bool)

(assert (=> b!914394 (= res!616519 call!40492)))

(assert (=> b!914394 (=> (not res!616519) (not e!512967))))

(declare-fun c!96139 () Bool)

(declare-fun call!40494 () ListLongMap!11197)

(declare-fun bm!40485 () Bool)

(declare-fun call!40489 () ListLongMap!11197)

(declare-fun call!40491 () ListLongMap!11197)

(declare-fun c!96142 () Bool)

(assert (=> bm!40485 (= call!40489 (+!2618 (ite c!96139 call!40491 (ite c!96142 call!40494 call!40493)) (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40486 () Bool)

(assert (=> bm!40486 (= call!40493 call!40494)))

(declare-fun bm!40487 () Bool)

(assert (=> bm!40487 (= call!40488 (contains!4670 lt!411307 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914395 () Bool)

(declare-fun e!512976 () Bool)

(assert (=> b!914395 (= e!512976 (validKeyInArray!0 (select (arr!26121 _keys!1386) i!717)))))

(declare-fun bm!40488 () Bool)

(assert (=> bm!40488 (= call!40492 (contains!4670 lt!411307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914396 () Bool)

(assert (=> b!914396 (= e!512977 (= (apply!527 lt!411307 (select (arr!26121 _keys!1386) i!717)) (get!13719 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914396 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26580 _values!1152)))))

(assert (=> b!914396 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun b!914397 () Bool)

(assert (=> b!914397 (= e!512967 (= (apply!527 lt!411307 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914398 () Bool)

(declare-fun res!616523 () Bool)

(declare-fun e!512969 () Bool)

(assert (=> b!914398 (=> (not res!616523) (not e!512969))))

(assert (=> b!914398 (= res!616523 e!512979)))

(declare-fun res!616524 () Bool)

(assert (=> b!914398 (=> res!616524 e!512979)))

(declare-fun e!512970 () Bool)

(assert (=> b!914398 (= res!616524 (not e!512970))))

(declare-fun res!616517 () Bool)

(assert (=> b!914398 (=> (not res!616517) (not e!512970))))

(assert (=> b!914398 (= res!616517 (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun bm!40489 () Bool)

(assert (=> bm!40489 (= call!40494 call!40491)))

(declare-fun b!914399 () Bool)

(declare-fun e!512978 () ListLongMap!11197)

(assert (=> b!914399 (= e!512978 e!512973)))

(assert (=> b!914399 (= c!96142 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40490 () Bool)

(assert (=> bm!40490 (= call!40490 call!40489)))

(declare-fun b!914400 () Bool)

(declare-fun c!96141 () Bool)

(assert (=> b!914400 (= c!96141 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914400 (= e!512973 e!512975)))

(declare-fun bm!40491 () Bool)

(assert (=> bm!40491 (= call!40491 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!914401 () Bool)

(declare-fun res!616518 () Bool)

(assert (=> b!914401 (=> (not res!616518) (not e!512969))))

(assert (=> b!914401 (= res!616518 e!512974)))

(declare-fun c!96140 () Bool)

(assert (=> b!914401 (= c!96140 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!914402 () Bool)

(assert (=> b!914402 (= e!512978 (+!2618 call!40489 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914403 () Bool)

(assert (=> b!914403 (= e!512971 (= (apply!527 lt!411307 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!914391 () Bool)

(assert (=> b!914391 (= e!512974 (not call!40488))))

(declare-fun d!112669 () Bool)

(assert (=> d!112669 e!512969))

(declare-fun res!616520 () Bool)

(assert (=> d!112669 (=> (not res!616520) (not e!512969))))

(assert (=> d!112669 (= res!616520 (or (bvsge i!717 (size!26581 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26581 _keys!1386)))))))

(declare-fun lt!411304 () ListLongMap!11197)

(assert (=> d!112669 (= lt!411307 lt!411304)))

(declare-fun lt!411303 () Unit!30896)

(assert (=> d!112669 (= lt!411303 e!512972)))

(declare-fun c!96138 () Bool)

(assert (=> d!112669 (= c!96138 e!512976)))

(declare-fun res!616521 () Bool)

(assert (=> d!112669 (=> (not res!616521) (not e!512976))))

(assert (=> d!112669 (= res!616521 (bvslt i!717 (size!26581 _keys!1386)))))

(assert (=> d!112669 (= lt!411304 e!512978)))

(assert (=> d!112669 (= c!96139 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112669 (validMask!0 mask!1756)))

(assert (=> d!112669 (= (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411307)))

(declare-fun b!914404 () Bool)

(assert (=> b!914404 (= e!512970 (validKeyInArray!0 (select (arr!26121 _keys!1386) i!717)))))

(declare-fun b!914405 () Bool)

(assert (=> b!914405 (= e!512969 e!512968)))

(declare-fun c!96137 () Bool)

(assert (=> b!914405 (= c!96137 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112669 c!96139) b!914402))

(assert (= (and d!112669 (not c!96139)) b!914399))

(assert (= (and b!914399 c!96142) b!914386))

(assert (= (and b!914399 (not c!96142)) b!914400))

(assert (= (and b!914400 c!96141) b!914392))

(assert (= (and b!914400 (not c!96141)) b!914387))

(assert (= (or b!914392 b!914387) bm!40486))

(assert (= (or b!914386 bm!40486) bm!40489))

(assert (= (or b!914386 b!914392) bm!40490))

(assert (= (or b!914402 bm!40489) bm!40491))

(assert (= (or b!914402 bm!40490) bm!40485))

(assert (= (and d!112669 res!616521) b!914395))

(assert (= (and d!112669 c!96138) b!914393))

(assert (= (and d!112669 (not c!96138)) b!914389))

(assert (= (and d!112669 res!616520) b!914398))

(assert (= (and b!914398 res!616517) b!914404))

(assert (= (and b!914398 (not res!616524)) b!914385))

(assert (= (and b!914385 res!616516) b!914396))

(assert (= (and b!914398 res!616523) b!914401))

(assert (= (and b!914401 c!96140) b!914388))

(assert (= (and b!914401 (not c!96140)) b!914391))

(assert (= (and b!914388 res!616522) b!914403))

(assert (= (or b!914388 b!914391) bm!40487))

(assert (= (and b!914401 res!616518) b!914405))

(assert (= (and b!914405 c!96137) b!914394))

(assert (= (and b!914405 (not c!96137)) b!914390))

(assert (= (and b!914394 res!616519) b!914397))

(assert (= (or b!914394 b!914390) bm!40488))

(declare-fun b_lambda!13331 () Bool)

(assert (=> (not b_lambda!13331) (not b!914396)))

(assert (=> b!914396 t!25904))

(declare-fun b_and!27325 () Bool)

(assert (= b_and!27323 (and (=> t!25904 result!10685) b_and!27325)))

(declare-fun m!849087 () Bool)

(assert (=> b!914397 m!849087))

(declare-fun m!849089 () Bool)

(assert (=> b!914402 m!849089))

(declare-fun m!849091 () Bool)

(assert (=> b!914393 m!849091))

(declare-fun m!849093 () Bool)

(assert (=> b!914393 m!849093))

(declare-fun m!849095 () Bool)

(assert (=> b!914393 m!849095))

(declare-fun m!849097 () Bool)

(assert (=> b!914393 m!849097))

(declare-fun m!849099 () Bool)

(assert (=> b!914393 m!849099))

(declare-fun m!849101 () Bool)

(assert (=> b!914393 m!849101))

(declare-fun m!849103 () Bool)

(assert (=> b!914393 m!849103))

(declare-fun m!849105 () Bool)

(assert (=> b!914393 m!849105))

(declare-fun m!849107 () Bool)

(assert (=> b!914393 m!849107))

(declare-fun m!849109 () Bool)

(assert (=> b!914393 m!849109))

(assert (=> b!914393 m!849101))

(declare-fun m!849111 () Bool)

(assert (=> b!914393 m!849111))

(declare-fun m!849113 () Bool)

(assert (=> b!914393 m!849113))

(declare-fun m!849115 () Bool)

(assert (=> b!914393 m!849115))

(assert (=> b!914393 m!849097))

(assert (=> b!914393 m!849093))

(declare-fun m!849117 () Bool)

(assert (=> b!914393 m!849117))

(assert (=> b!914393 m!848951))

(assert (=> b!914393 m!849113))

(declare-fun m!849119 () Bool)

(assert (=> b!914393 m!849119))

(declare-fun m!849121 () Bool)

(assert (=> b!914393 m!849121))

(assert (=> d!112669 m!848937))

(assert (=> b!914385 m!848951))

(assert (=> b!914385 m!848951))

(declare-fun m!849123 () Bool)

(assert (=> b!914385 m!849123))

(declare-fun m!849125 () Bool)

(assert (=> b!914396 m!849125))

(assert (=> b!914396 m!849063))

(declare-fun m!849127 () Bool)

(assert (=> b!914396 m!849127))

(assert (=> b!914396 m!849063))

(assert (=> b!914396 m!849125))

(assert (=> b!914396 m!848951))

(declare-fun m!849129 () Bool)

(assert (=> b!914396 m!849129))

(assert (=> b!914396 m!848951))

(assert (=> b!914395 m!848951))

(assert (=> b!914395 m!848951))

(declare-fun m!849131 () Bool)

(assert (=> b!914395 m!849131))

(declare-fun m!849133 () Bool)

(assert (=> bm!40487 m!849133))

(declare-fun m!849135 () Bool)

(assert (=> bm!40488 m!849135))

(declare-fun m!849137 () Bool)

(assert (=> bm!40485 m!849137))

(assert (=> b!914404 m!848951))

(assert (=> b!914404 m!848951))

(assert (=> b!914404 m!849131))

(assert (=> bm!40491 m!849115))

(declare-fun m!849139 () Bool)

(assert (=> b!914403 m!849139))

(assert (=> b!914226 d!112669))

(declare-fun d!112671 () Bool)

(assert (=> d!112671 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78426 d!112671))

(declare-fun d!112673 () Bool)

(assert (=> d!112673 (= (array_inv!20488 _values!1152) (bvsge (size!26580 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78426 d!112673))

(declare-fun d!112675 () Bool)

(assert (=> d!112675 (= (array_inv!20489 _keys!1386) (bvsge (size!26581 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78426 d!112675))

(declare-fun b!914414 () Bool)

(declare-fun e!512988 () Bool)

(declare-fun call!40497 () Bool)

(assert (=> b!914414 (= e!512988 call!40497)))

(declare-fun d!112677 () Bool)

(declare-fun res!616529 () Bool)

(declare-fun e!512987 () Bool)

(assert (=> d!112677 (=> res!616529 e!512987)))

(assert (=> d!112677 (= res!616529 (bvsge #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(assert (=> d!112677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512987)))

(declare-fun b!914415 () Bool)

(declare-fun e!512986 () Bool)

(assert (=> b!914415 (= e!512986 call!40497)))

(declare-fun bm!40494 () Bool)

(assert (=> bm!40494 (= call!40497 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914416 () Bool)

(assert (=> b!914416 (= e!512987 e!512986)))

(declare-fun c!96145 () Bool)

(assert (=> b!914416 (= c!96145 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914417 () Bool)

(assert (=> b!914417 (= e!512986 e!512988)))

(declare-fun lt!411316 () (_ BitVec 64))

(assert (=> b!914417 (= lt!411316 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411317 () Unit!30896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54345 (_ BitVec 64) (_ BitVec 32)) Unit!30896)

(assert (=> b!914417 (= lt!411317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411316 #b00000000000000000000000000000000))))

(assert (=> b!914417 (arrayContainsKey!0 _keys!1386 lt!411316 #b00000000000000000000000000000000)))

(declare-fun lt!411315 () Unit!30896)

(assert (=> b!914417 (= lt!411315 lt!411317)))

(declare-fun res!616530 () Bool)

(declare-datatypes ((SeekEntryResult!8923 0))(
  ( (MissingZero!8923 (index!38063 (_ BitVec 32))) (Found!8923 (index!38064 (_ BitVec 32))) (Intermediate!8923 (undefined!9735 Bool) (index!38065 (_ BitVec 32)) (x!78106 (_ BitVec 32))) (Undefined!8923) (MissingVacant!8923 (index!38066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54345 (_ BitVec 32)) SeekEntryResult!8923)

(assert (=> b!914417 (= res!616530 (= (seekEntryOrOpen!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8923 #b00000000000000000000000000000000)))))

(assert (=> b!914417 (=> (not res!616530) (not e!512988))))

(assert (= (and d!112677 (not res!616529)) b!914416))

(assert (= (and b!914416 c!96145) b!914417))

(assert (= (and b!914416 (not c!96145)) b!914415))

(assert (= (and b!914417 res!616530) b!914414))

(assert (= (or b!914414 b!914415) bm!40494))

(declare-fun m!849141 () Bool)

(assert (=> bm!40494 m!849141))

(assert (=> b!914416 m!849009))

(assert (=> b!914416 m!849009))

(assert (=> b!914416 m!849069))

(assert (=> b!914417 m!849009))

(declare-fun m!849143 () Bool)

(assert (=> b!914417 m!849143))

(declare-fun m!849145 () Bool)

(assert (=> b!914417 m!849145))

(assert (=> b!914417 m!849009))

(declare-fun m!849147 () Bool)

(assert (=> b!914417 m!849147))

(assert (=> b!914222 d!112677))

(declare-fun d!112679 () Bool)

(assert (=> d!112679 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!914228 d!112679))

(declare-fun d!112681 () Bool)

(declare-fun res!616539 () Bool)

(declare-fun e!512999 () Bool)

(assert (=> d!112681 (=> res!616539 e!512999)))

(assert (=> d!112681 (= res!616539 (bvsge #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(assert (=> d!112681 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18313) e!512999)))

(declare-fun b!914428 () Bool)

(declare-fun e!513000 () Bool)

(declare-fun e!512997 () Bool)

(assert (=> b!914428 (= e!513000 e!512997)))

(declare-fun c!96148 () Bool)

(assert (=> b!914428 (= c!96148 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40497 () Bool)

(declare-fun call!40500 () Bool)

(assert (=> bm!40497 (= call!40500 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96148 (Cons!18312 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) Nil!18313) Nil!18313)))))

(declare-fun b!914429 () Bool)

(declare-fun e!512998 () Bool)

(declare-fun contains!4673 (List!18316 (_ BitVec 64)) Bool)

(assert (=> b!914429 (= e!512998 (contains!4673 Nil!18313 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914430 () Bool)

(assert (=> b!914430 (= e!512997 call!40500)))

(declare-fun b!914431 () Bool)

(assert (=> b!914431 (= e!512999 e!513000)))

(declare-fun res!616538 () Bool)

(assert (=> b!914431 (=> (not res!616538) (not e!513000))))

(assert (=> b!914431 (= res!616538 (not e!512998))))

(declare-fun res!616537 () Bool)

(assert (=> b!914431 (=> (not res!616537) (not e!512998))))

(assert (=> b!914431 (= res!616537 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914432 () Bool)

(assert (=> b!914432 (= e!512997 call!40500)))

(assert (= (and d!112681 (not res!616539)) b!914431))

(assert (= (and b!914431 res!616537) b!914429))

(assert (= (and b!914431 res!616538) b!914428))

(assert (= (and b!914428 c!96148) b!914430))

(assert (= (and b!914428 (not c!96148)) b!914432))

(assert (= (or b!914430 b!914432) bm!40497))

(assert (=> b!914428 m!849009))

(assert (=> b!914428 m!849009))

(assert (=> b!914428 m!849069))

(assert (=> bm!40497 m!849009))

(declare-fun m!849149 () Bool)

(assert (=> bm!40497 m!849149))

(assert (=> b!914429 m!849009))

(assert (=> b!914429 m!849009))

(declare-fun m!849151 () Bool)

(assert (=> b!914429 m!849151))

(assert (=> b!914431 m!849009))

(assert (=> b!914431 m!849009))

(assert (=> b!914431 m!849069))

(assert (=> b!914223 d!112681))

(declare-fun condMapEmpty!30460 () Bool)

(declare-fun mapDefault!30460 () ValueCell!9092)

(assert (=> mapNonEmpty!30451 (= condMapEmpty!30460 (= mapRest!30451 ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30460)))))

(declare-fun e!513005 () Bool)

(declare-fun mapRes!30460 () Bool)

(assert (=> mapNonEmpty!30451 (= tp!58467 (and e!513005 mapRes!30460))))

(declare-fun b!914439 () Bool)

(declare-fun e!513006 () Bool)

(assert (=> b!914439 (= e!513006 tp_is_empty!19147)))

(declare-fun b!914440 () Bool)

(assert (=> b!914440 (= e!513005 tp_is_empty!19147)))

(declare-fun mapNonEmpty!30460 () Bool)

(declare-fun tp!58483 () Bool)

(assert (=> mapNonEmpty!30460 (= mapRes!30460 (and tp!58483 e!513006))))

(declare-fun mapValue!30460 () ValueCell!9092)

(declare-fun mapKey!30460 () (_ BitVec 32))

(declare-fun mapRest!30460 () (Array (_ BitVec 32) ValueCell!9092))

(assert (=> mapNonEmpty!30460 (= mapRest!30451 (store mapRest!30460 mapKey!30460 mapValue!30460))))

(declare-fun mapIsEmpty!30460 () Bool)

(assert (=> mapIsEmpty!30460 mapRes!30460))

(assert (= (and mapNonEmpty!30451 condMapEmpty!30460) mapIsEmpty!30460))

(assert (= (and mapNonEmpty!30451 (not condMapEmpty!30460)) mapNonEmpty!30460))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9092) mapValue!30460)) b!914439))

(assert (= (and mapNonEmpty!30451 ((_ is ValueCellFull!9092) mapDefault!30460)) b!914440))

(declare-fun m!849153 () Bool)

(assert (=> mapNonEmpty!30460 m!849153))

(declare-fun b_lambda!13333 () Bool)

(assert (= b_lambda!13331 (or (and start!78426 b_free!16729) b_lambda!13333)))

(declare-fun b_lambda!13335 () Bool)

(assert (= b_lambda!13329 (or (and start!78426 b_free!16729) b_lambda!13335)))

(check-sat (not mapNonEmpty!30460) (not b_lambda!13333) (not bm!40487) (not b!914404) (not b!914417) b_and!27325 (not b_next!16729) (not b!914378) (not b_lambda!13335) (not b!914385) (not d!112665) (not d!112667) (not b!914301) (not bm!40494) (not b!914402) (not b!914314) (not bm!40491) (not b!914395) (not bm!40497) tp_is_empty!19147 (not bm!40481) (not b!914359) (not d!112661) (not b!914429) (not b!914371) (not b!914393) (not b!914396) (not b!914382) (not b!914403) (not b!914384) (not b!914370) (not b!914397) (not b!914376) (not d!112663) (not bm!40484) (not b!914369) (not b!914416) (not bm!40480) (not b!914431) (not b!914367) (not bm!40488) (not d!112669) (not b!914377) (not b!914428) (not bm!40485) (not b!914306) (not b!914316) (not bm!40478))
(check-sat b_and!27325 (not b_next!16729))
(get-model)

(assert (=> b!914306 d!112659))

(declare-fun d!112683 () Bool)

(declare-fun e!513009 () Bool)

(assert (=> d!112683 e!513009))

(declare-fun res!616544 () Bool)

(assert (=> d!112683 (=> (not res!616544) (not e!513009))))

(declare-fun lt!411328 () ListLongMap!11197)

(assert (=> d!112683 (= res!616544 (contains!4670 lt!411328 (_1!6260 (tuple2!12499 lt!411276 zeroValue!1094))))))

(declare-fun lt!411329 () List!18315)

(assert (=> d!112683 (= lt!411328 (ListLongMap!11198 lt!411329))))

(declare-fun lt!411326 () Unit!30896)

(declare-fun lt!411327 () Unit!30896)

(assert (=> d!112683 (= lt!411326 lt!411327)))

(assert (=> d!112683 (= (getValueByKey!473 lt!411329 (_1!6260 (tuple2!12499 lt!411276 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411276 zeroValue!1094))))))

(declare-fun lemmaContainsTupThenGetReturnValue!253 (List!18315 (_ BitVec 64) V!30495) Unit!30896)

(assert (=> d!112683 (= lt!411327 (lemmaContainsTupThenGetReturnValue!253 lt!411329 (_1!6260 (tuple2!12499 lt!411276 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411276 zeroValue!1094))))))

(declare-fun insertStrictlySorted!310 (List!18315 (_ BitVec 64) V!30495) List!18315)

(assert (=> d!112683 (= lt!411329 (insertStrictlySorted!310 (toList!5614 lt!411269) (_1!6260 (tuple2!12499 lt!411276 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411276 zeroValue!1094))))))

(assert (=> d!112683 (= (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094)) lt!411328)))

(declare-fun b!914445 () Bool)

(declare-fun res!616545 () Bool)

(assert (=> b!914445 (=> (not res!616545) (not e!513009))))

(assert (=> b!914445 (= res!616545 (= (getValueByKey!473 (toList!5614 lt!411328) (_1!6260 (tuple2!12499 lt!411276 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411276 zeroValue!1094)))))))

(declare-fun b!914446 () Bool)

(declare-fun contains!4674 (List!18315 tuple2!12498) Bool)

(assert (=> b!914446 (= e!513009 (contains!4674 (toList!5614 lt!411328) (tuple2!12499 lt!411276 zeroValue!1094)))))

(assert (= (and d!112683 res!616544) b!914445))

(assert (= (and b!914445 res!616545) b!914446))

(declare-fun m!849155 () Bool)

(assert (=> d!112683 m!849155))

(declare-fun m!849157 () Bool)

(assert (=> d!112683 m!849157))

(declare-fun m!849159 () Bool)

(assert (=> d!112683 m!849159))

(declare-fun m!849161 () Bool)

(assert (=> d!112683 m!849161))

(declare-fun m!849163 () Bool)

(assert (=> b!914445 m!849163))

(declare-fun m!849165 () Bool)

(assert (=> b!914446 m!849165))

(assert (=> b!914367 d!112683))

(declare-fun d!112685 () Bool)

(declare-fun get!13720 (Option!479) V!30495)

(assert (=> d!112685 (= (apply!527 (+!2618 lt!411262 (tuple2!12499 lt!411273 minValue!1094)) lt!411266) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411262 (tuple2!12499 lt!411273 minValue!1094))) lt!411266)))))

(declare-fun bs!25698 () Bool)

(assert (= bs!25698 d!112685))

(declare-fun m!849167 () Bool)

(assert (=> bs!25698 m!849167))

(assert (=> bs!25698 m!849167))

(declare-fun m!849169 () Bool)

(assert (=> bs!25698 m!849169))

(assert (=> b!914367 d!112685))

(declare-fun d!112687 () Bool)

(declare-fun e!513011 () Bool)

(assert (=> d!112687 e!513011))

(declare-fun res!616546 () Bool)

(assert (=> d!112687 (=> res!616546 e!513011)))

(declare-fun lt!411332 () Bool)

(assert (=> d!112687 (= res!616546 (not lt!411332))))

(declare-fun lt!411331 () Bool)

(assert (=> d!112687 (= lt!411332 lt!411331)))

(declare-fun lt!411333 () Unit!30896)

(declare-fun e!513010 () Unit!30896)

(assert (=> d!112687 (= lt!411333 e!513010)))

(declare-fun c!96149 () Bool)

(assert (=> d!112687 (= c!96149 lt!411331)))

(assert (=> d!112687 (= lt!411331 (containsKey!444 (toList!5614 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094))) lt!411267))))

(assert (=> d!112687 (= (contains!4670 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094)) lt!411267) lt!411332)))

(declare-fun b!914447 () Bool)

(declare-fun lt!411330 () Unit!30896)

(assert (=> b!914447 (= e!513010 lt!411330)))

(assert (=> b!914447 (= lt!411330 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094))) lt!411267))))

(assert (=> b!914447 (isDefined!346 (getValueByKey!473 (toList!5614 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094))) lt!411267))))

(declare-fun b!914448 () Bool)

(declare-fun Unit!30906 () Unit!30896)

(assert (=> b!914448 (= e!513010 Unit!30906)))

(declare-fun b!914449 () Bool)

(assert (=> b!914449 (= e!513011 (isDefined!346 (getValueByKey!473 (toList!5614 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094))) lt!411267)))))

(assert (= (and d!112687 c!96149) b!914447))

(assert (= (and d!112687 (not c!96149)) b!914448))

(assert (= (and d!112687 (not res!616546)) b!914449))

(declare-fun m!849171 () Bool)

(assert (=> d!112687 m!849171))

(declare-fun m!849173 () Bool)

(assert (=> b!914447 m!849173))

(declare-fun m!849175 () Bool)

(assert (=> b!914447 m!849175))

(assert (=> b!914447 m!849175))

(declare-fun m!849177 () Bool)

(assert (=> b!914447 m!849177))

(assert (=> b!914449 m!849175))

(assert (=> b!914449 m!849175))

(assert (=> b!914449 m!849177))

(assert (=> b!914367 d!112687))

(declare-fun d!112689 () Bool)

(assert (=> d!112689 (contains!4670 (+!2618 lt!411269 (tuple2!12499 lt!411276 zeroValue!1094)) lt!411267)))

(declare-fun lt!411336 () Unit!30896)

(declare-fun choose!1538 (ListLongMap!11197 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30896)

(assert (=> d!112689 (= lt!411336 (choose!1538 lt!411269 lt!411276 zeroValue!1094 lt!411267))))

(assert (=> d!112689 (contains!4670 lt!411269 lt!411267)))

(assert (=> d!112689 (= (addStillContains!349 lt!411269 lt!411276 zeroValue!1094 lt!411267) lt!411336)))

(declare-fun bs!25699 () Bool)

(assert (= bs!25699 d!112689))

(assert (=> bs!25699 m!849037))

(assert (=> bs!25699 m!849037))

(assert (=> bs!25699 m!849047))

(declare-fun m!849179 () Bool)

(assert (=> bs!25699 m!849179))

(declare-fun m!849181 () Bool)

(assert (=> bs!25699 m!849181))

(assert (=> b!914367 d!112689))

(declare-fun d!112691 () Bool)

(assert (=> d!112691 (= (apply!527 lt!411262 lt!411266) (get!13720 (getValueByKey!473 (toList!5614 lt!411262) lt!411266)))))

(declare-fun bs!25700 () Bool)

(assert (= bs!25700 d!112691))

(declare-fun m!849183 () Bool)

(assert (=> bs!25700 m!849183))

(assert (=> bs!25700 m!849183))

(declare-fun m!849185 () Bool)

(assert (=> bs!25700 m!849185))

(assert (=> b!914367 d!112691))

(declare-fun d!112693 () Bool)

(assert (=> d!112693 (= (apply!527 (+!2618 lt!411279 (tuple2!12499 lt!411282 zeroValue!1094)) lt!411270) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411279 (tuple2!12499 lt!411282 zeroValue!1094))) lt!411270)))))

(declare-fun bs!25701 () Bool)

(assert (= bs!25701 d!112693))

(declare-fun m!849187 () Bool)

(assert (=> bs!25701 m!849187))

(assert (=> bs!25701 m!849187))

(declare-fun m!849189 () Bool)

(assert (=> bs!25701 m!849189))

(assert (=> b!914367 d!112693))

(declare-fun d!112695 () Bool)

(declare-fun e!513012 () Bool)

(assert (=> d!112695 e!513012))

(declare-fun res!616547 () Bool)

(assert (=> d!112695 (=> (not res!616547) (not e!513012))))

(declare-fun lt!411339 () ListLongMap!11197)

(assert (=> d!112695 (= res!616547 (contains!4670 lt!411339 (_1!6260 (tuple2!12499 lt!411282 zeroValue!1094))))))

(declare-fun lt!411340 () List!18315)

(assert (=> d!112695 (= lt!411339 (ListLongMap!11198 lt!411340))))

(declare-fun lt!411337 () Unit!30896)

(declare-fun lt!411338 () Unit!30896)

(assert (=> d!112695 (= lt!411337 lt!411338)))

(assert (=> d!112695 (= (getValueByKey!473 lt!411340 (_1!6260 (tuple2!12499 lt!411282 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411282 zeroValue!1094))))))

(assert (=> d!112695 (= lt!411338 (lemmaContainsTupThenGetReturnValue!253 lt!411340 (_1!6260 (tuple2!12499 lt!411282 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411282 zeroValue!1094))))))

(assert (=> d!112695 (= lt!411340 (insertStrictlySorted!310 (toList!5614 lt!411279) (_1!6260 (tuple2!12499 lt!411282 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411282 zeroValue!1094))))))

(assert (=> d!112695 (= (+!2618 lt!411279 (tuple2!12499 lt!411282 zeroValue!1094)) lt!411339)))

(declare-fun b!914451 () Bool)

(declare-fun res!616548 () Bool)

(assert (=> b!914451 (=> (not res!616548) (not e!513012))))

(assert (=> b!914451 (= res!616548 (= (getValueByKey!473 (toList!5614 lt!411339) (_1!6260 (tuple2!12499 lt!411282 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411282 zeroValue!1094)))))))

(declare-fun b!914452 () Bool)

(assert (=> b!914452 (= e!513012 (contains!4674 (toList!5614 lt!411339) (tuple2!12499 lt!411282 zeroValue!1094)))))

(assert (= (and d!112695 res!616547) b!914451))

(assert (= (and b!914451 res!616548) b!914452))

(declare-fun m!849191 () Bool)

(assert (=> d!112695 m!849191))

(declare-fun m!849193 () Bool)

(assert (=> d!112695 m!849193))

(declare-fun m!849195 () Bool)

(assert (=> d!112695 m!849195))

(declare-fun m!849197 () Bool)

(assert (=> d!112695 m!849197))

(declare-fun m!849199 () Bool)

(assert (=> b!914451 m!849199))

(declare-fun m!849201 () Bool)

(assert (=> b!914452 m!849201))

(assert (=> b!914367 d!112695))

(declare-fun d!112697 () Bool)

(assert (=> d!112697 (= (apply!527 (+!2618 lt!411262 (tuple2!12499 lt!411273 minValue!1094)) lt!411266) (apply!527 lt!411262 lt!411266))))

(declare-fun lt!411343 () Unit!30896)

(declare-fun choose!1539 (ListLongMap!11197 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30896)

(assert (=> d!112697 (= lt!411343 (choose!1539 lt!411262 lt!411273 minValue!1094 lt!411266))))

(declare-fun e!513015 () Bool)

(assert (=> d!112697 e!513015))

(declare-fun res!616551 () Bool)

(assert (=> d!112697 (=> (not res!616551) (not e!513015))))

(assert (=> d!112697 (= res!616551 (contains!4670 lt!411262 lt!411266))))

(assert (=> d!112697 (= (addApplyDifferent!349 lt!411262 lt!411273 minValue!1094 lt!411266) lt!411343)))

(declare-fun b!914456 () Bool)

(assert (=> b!914456 (= e!513015 (not (= lt!411266 lt!411273)))))

(assert (= (and d!112697 res!616551) b!914456))

(declare-fun m!849203 () Bool)

(assert (=> d!112697 m!849203))

(assert (=> d!112697 m!849029))

(assert (=> d!112697 m!849031))

(assert (=> d!112697 m!849041))

(declare-fun m!849205 () Bool)

(assert (=> d!112697 m!849205))

(assert (=> d!112697 m!849029))

(assert (=> b!914367 d!112697))

(declare-fun d!112699 () Bool)

(assert (=> d!112699 (= (apply!527 lt!411275 lt!411274) (get!13720 (getValueByKey!473 (toList!5614 lt!411275) lt!411274)))))

(declare-fun bs!25702 () Bool)

(assert (= bs!25702 d!112699))

(declare-fun m!849207 () Bool)

(assert (=> bs!25702 m!849207))

(assert (=> bs!25702 m!849207))

(declare-fun m!849209 () Bool)

(assert (=> bs!25702 m!849209))

(assert (=> b!914367 d!112699))

(declare-fun d!112701 () Bool)

(assert (=> d!112701 (= (apply!527 (+!2618 lt!411275 (tuple2!12499 lt!411261 minValue!1094)) lt!411274) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411275 (tuple2!12499 lt!411261 minValue!1094))) lt!411274)))))

(declare-fun bs!25703 () Bool)

(assert (= bs!25703 d!112701))

(declare-fun m!849211 () Bool)

(assert (=> bs!25703 m!849211))

(assert (=> bs!25703 m!849211))

(declare-fun m!849213 () Bool)

(assert (=> bs!25703 m!849213))

(assert (=> b!914367 d!112701))

(declare-fun d!112703 () Bool)

(declare-fun e!513016 () Bool)

(assert (=> d!112703 e!513016))

(declare-fun res!616552 () Bool)

(assert (=> d!112703 (=> (not res!616552) (not e!513016))))

(declare-fun lt!411346 () ListLongMap!11197)

(assert (=> d!112703 (= res!616552 (contains!4670 lt!411346 (_1!6260 (tuple2!12499 lt!411273 minValue!1094))))))

(declare-fun lt!411347 () List!18315)

(assert (=> d!112703 (= lt!411346 (ListLongMap!11198 lt!411347))))

(declare-fun lt!411344 () Unit!30896)

(declare-fun lt!411345 () Unit!30896)

(assert (=> d!112703 (= lt!411344 lt!411345)))

(assert (=> d!112703 (= (getValueByKey!473 lt!411347 (_1!6260 (tuple2!12499 lt!411273 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411273 minValue!1094))))))

(assert (=> d!112703 (= lt!411345 (lemmaContainsTupThenGetReturnValue!253 lt!411347 (_1!6260 (tuple2!12499 lt!411273 minValue!1094)) (_2!6260 (tuple2!12499 lt!411273 minValue!1094))))))

(assert (=> d!112703 (= lt!411347 (insertStrictlySorted!310 (toList!5614 lt!411262) (_1!6260 (tuple2!12499 lt!411273 minValue!1094)) (_2!6260 (tuple2!12499 lt!411273 minValue!1094))))))

(assert (=> d!112703 (= (+!2618 lt!411262 (tuple2!12499 lt!411273 minValue!1094)) lt!411346)))

(declare-fun b!914457 () Bool)

(declare-fun res!616553 () Bool)

(assert (=> b!914457 (=> (not res!616553) (not e!513016))))

(assert (=> b!914457 (= res!616553 (= (getValueByKey!473 (toList!5614 lt!411346) (_1!6260 (tuple2!12499 lt!411273 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411273 minValue!1094)))))))

(declare-fun b!914458 () Bool)

(assert (=> b!914458 (= e!513016 (contains!4674 (toList!5614 lt!411346) (tuple2!12499 lt!411273 minValue!1094)))))

(assert (= (and d!112703 res!616552) b!914457))

(assert (= (and b!914457 res!616553) b!914458))

(declare-fun m!849215 () Bool)

(assert (=> d!112703 m!849215))

(declare-fun m!849217 () Bool)

(assert (=> d!112703 m!849217))

(declare-fun m!849219 () Bool)

(assert (=> d!112703 m!849219))

(declare-fun m!849221 () Bool)

(assert (=> d!112703 m!849221))

(declare-fun m!849223 () Bool)

(assert (=> b!914457 m!849223))

(declare-fun m!849225 () Bool)

(assert (=> b!914458 m!849225))

(assert (=> b!914367 d!112703))

(declare-fun d!112705 () Bool)

(assert (=> d!112705 (= (apply!527 lt!411279 lt!411270) (get!13720 (getValueByKey!473 (toList!5614 lt!411279) lt!411270)))))

(declare-fun bs!25704 () Bool)

(assert (= bs!25704 d!112705))

(declare-fun m!849227 () Bool)

(assert (=> bs!25704 m!849227))

(assert (=> bs!25704 m!849227))

(declare-fun m!849229 () Bool)

(assert (=> bs!25704 m!849229))

(assert (=> b!914367 d!112705))

(declare-fun d!112707 () Bool)

(assert (=> d!112707 (= (apply!527 (+!2618 lt!411279 (tuple2!12499 lt!411282 zeroValue!1094)) lt!411270) (apply!527 lt!411279 lt!411270))))

(declare-fun lt!411348 () Unit!30896)

(assert (=> d!112707 (= lt!411348 (choose!1539 lt!411279 lt!411282 zeroValue!1094 lt!411270))))

(declare-fun e!513017 () Bool)

(assert (=> d!112707 e!513017))

(declare-fun res!616554 () Bool)

(assert (=> d!112707 (=> (not res!616554) (not e!513017))))

(assert (=> d!112707 (= res!616554 (contains!4670 lt!411279 lt!411270))))

(assert (=> d!112707 (= (addApplyDifferent!349 lt!411279 lt!411282 zeroValue!1094 lt!411270) lt!411348)))

(declare-fun b!914459 () Bool)

(assert (=> b!914459 (= e!513017 (not (= lt!411270 lt!411282)))))

(assert (= (and d!112707 res!616554) b!914459))

(declare-fun m!849231 () Bool)

(assert (=> d!112707 m!849231))

(assert (=> d!112707 m!849033))

(assert (=> d!112707 m!849035))

(assert (=> d!112707 m!849039))

(declare-fun m!849233 () Bool)

(assert (=> d!112707 m!849233))

(assert (=> d!112707 m!849033))

(assert (=> b!914367 d!112707))

(declare-fun d!112709 () Bool)

(declare-fun e!513018 () Bool)

(assert (=> d!112709 e!513018))

(declare-fun res!616555 () Bool)

(assert (=> d!112709 (=> (not res!616555) (not e!513018))))

(declare-fun lt!411351 () ListLongMap!11197)

(assert (=> d!112709 (= res!616555 (contains!4670 lt!411351 (_1!6260 (tuple2!12499 lt!411261 minValue!1094))))))

(declare-fun lt!411352 () List!18315)

(assert (=> d!112709 (= lt!411351 (ListLongMap!11198 lt!411352))))

(declare-fun lt!411349 () Unit!30896)

(declare-fun lt!411350 () Unit!30896)

(assert (=> d!112709 (= lt!411349 lt!411350)))

(assert (=> d!112709 (= (getValueByKey!473 lt!411352 (_1!6260 (tuple2!12499 lt!411261 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411261 minValue!1094))))))

(assert (=> d!112709 (= lt!411350 (lemmaContainsTupThenGetReturnValue!253 lt!411352 (_1!6260 (tuple2!12499 lt!411261 minValue!1094)) (_2!6260 (tuple2!12499 lt!411261 minValue!1094))))))

(assert (=> d!112709 (= lt!411352 (insertStrictlySorted!310 (toList!5614 lt!411275) (_1!6260 (tuple2!12499 lt!411261 minValue!1094)) (_2!6260 (tuple2!12499 lt!411261 minValue!1094))))))

(assert (=> d!112709 (= (+!2618 lt!411275 (tuple2!12499 lt!411261 minValue!1094)) lt!411351)))

(declare-fun b!914460 () Bool)

(declare-fun res!616556 () Bool)

(assert (=> b!914460 (=> (not res!616556) (not e!513018))))

(assert (=> b!914460 (= res!616556 (= (getValueByKey!473 (toList!5614 lt!411351) (_1!6260 (tuple2!12499 lt!411261 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411261 minValue!1094)))))))

(declare-fun b!914461 () Bool)

(assert (=> b!914461 (= e!513018 (contains!4674 (toList!5614 lt!411351) (tuple2!12499 lt!411261 minValue!1094)))))

(assert (= (and d!112709 res!616555) b!914460))

(assert (= (and b!914460 res!616556) b!914461))

(declare-fun m!849235 () Bool)

(assert (=> d!112709 m!849235))

(declare-fun m!849237 () Bool)

(assert (=> d!112709 m!849237))

(declare-fun m!849239 () Bool)

(assert (=> d!112709 m!849239))

(declare-fun m!849241 () Bool)

(assert (=> d!112709 m!849241))

(declare-fun m!849243 () Bool)

(assert (=> b!914460 m!849243))

(declare-fun m!849245 () Bool)

(assert (=> b!914461 m!849245))

(assert (=> b!914367 d!112709))

(declare-fun d!112711 () Bool)

(assert (=> d!112711 (= (apply!527 (+!2618 lt!411275 (tuple2!12499 lt!411261 minValue!1094)) lt!411274) (apply!527 lt!411275 lt!411274))))

(declare-fun lt!411353 () Unit!30896)

(assert (=> d!112711 (= lt!411353 (choose!1539 lt!411275 lt!411261 minValue!1094 lt!411274))))

(declare-fun e!513019 () Bool)

(assert (=> d!112711 e!513019))

(declare-fun res!616557 () Bool)

(assert (=> d!112711 (=> (not res!616557) (not e!513019))))

(assert (=> d!112711 (= res!616557 (contains!4670 lt!411275 lt!411274))))

(assert (=> d!112711 (= (addApplyDifferent!349 lt!411275 lt!411261 minValue!1094 lt!411274) lt!411353)))

(declare-fun b!914462 () Bool)

(assert (=> b!914462 (= e!513019 (not (= lt!411274 lt!411261)))))

(assert (= (and d!112711 res!616557) b!914462))

(declare-fun m!849247 () Bool)

(assert (=> d!112711 m!849247))

(assert (=> d!112711 m!849049))

(assert (=> d!112711 m!849055))

(assert (=> d!112711 m!849027))

(declare-fun m!849249 () Bool)

(assert (=> d!112711 m!849249))

(assert (=> d!112711 m!849049))

(assert (=> b!914367 d!112711))

(declare-fun bm!40500 () Bool)

(declare-fun call!40503 () ListLongMap!11197)

(assert (=> bm!40500 (= call!40503 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!914487 () Bool)

(declare-fun e!513040 () Bool)

(declare-fun e!513035 () Bool)

(assert (=> b!914487 (= e!513040 e!513035)))

(declare-fun c!96160 () Bool)

(assert (=> b!914487 (= c!96160 (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun b!914488 () Bool)

(declare-fun res!616567 () Bool)

(declare-fun e!513039 () Bool)

(assert (=> b!914488 (=> (not res!616567) (not e!513039))))

(declare-fun lt!411370 () ListLongMap!11197)

(assert (=> b!914488 (= res!616567 (not (contains!4670 lt!411370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!112713 () Bool)

(assert (=> d!112713 e!513039))

(declare-fun res!616568 () Bool)

(assert (=> d!112713 (=> (not res!616568) (not e!513039))))

(assert (=> d!112713 (= res!616568 (not (contains!4670 lt!411370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!513034 () ListLongMap!11197)

(assert (=> d!112713 (= lt!411370 e!513034)))

(declare-fun c!96159 () Bool)

(assert (=> d!112713 (= c!96159 (bvsge #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(assert (=> d!112713 (validMask!0 mask!1756)))

(assert (=> d!112713 (= (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411370)))

(declare-fun b!914489 () Bool)

(declare-fun e!513036 () ListLongMap!11197)

(assert (=> b!914489 (= e!513036 call!40503)))

(declare-fun b!914490 () Bool)

(assert (=> b!914490 (= e!513034 e!513036)))

(declare-fun c!96161 () Bool)

(assert (=> b!914490 (= c!96161 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914491 () Bool)

(assert (=> b!914491 (= e!513034 (ListLongMap!11198 Nil!18312))))

(declare-fun b!914492 () Bool)

(assert (=> b!914492 (= e!513039 e!513040)))

(declare-fun c!96158 () Bool)

(declare-fun e!513038 () Bool)

(assert (=> b!914492 (= c!96158 e!513038)))

(declare-fun res!616569 () Bool)

(assert (=> b!914492 (=> (not res!616569) (not e!513038))))

(assert (=> b!914492 (= res!616569 (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun b!914493 () Bool)

(declare-fun e!513037 () Bool)

(assert (=> b!914493 (= e!513040 e!513037)))

(assert (=> b!914493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(declare-fun res!616566 () Bool)

(assert (=> b!914493 (= res!616566 (contains!4670 lt!411370 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914493 (=> (not res!616566) (not e!513037))))

(declare-fun b!914494 () Bool)

(assert (=> b!914494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26581 _keys!1386)))))

(assert (=> b!914494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26580 _values!1152)))))

(assert (=> b!914494 (= e!513037 (= (apply!527 lt!411370 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) (get!13719 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914495 () Bool)

(declare-fun isEmpty!698 (ListLongMap!11197) Bool)

(assert (=> b!914495 (= e!513035 (isEmpty!698 lt!411370))))

(declare-fun b!914496 () Bool)

(assert (=> b!914496 (= e!513035 (= lt!411370 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!914497 () Bool)

(declare-fun lt!411369 () Unit!30896)

(declare-fun lt!411373 () Unit!30896)

(assert (=> b!914497 (= lt!411369 lt!411373)))

(declare-fun lt!411371 () ListLongMap!11197)

(declare-fun lt!411372 () (_ BitVec 64))

(declare-fun lt!411368 () V!30495)

(declare-fun lt!411374 () (_ BitVec 64))

(assert (=> b!914497 (not (contains!4670 (+!2618 lt!411371 (tuple2!12499 lt!411374 lt!411368)) lt!411372))))

(declare-fun addStillNotContains!220 (ListLongMap!11197 (_ BitVec 64) V!30495 (_ BitVec 64)) Unit!30896)

(assert (=> b!914497 (= lt!411373 (addStillNotContains!220 lt!411371 lt!411374 lt!411368 lt!411372))))

(assert (=> b!914497 (= lt!411372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!914497 (= lt!411368 (get!13719 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!914497 (= lt!411374 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914497 (= lt!411371 call!40503)))

(assert (=> b!914497 (= e!513036 (+!2618 call!40503 (tuple2!12499 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) (get!13719 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!914498 () Bool)

(assert (=> b!914498 (= e!513038 (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914498 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!112713 c!96159) b!914491))

(assert (= (and d!112713 (not c!96159)) b!914490))

(assert (= (and b!914490 c!96161) b!914497))

(assert (= (and b!914490 (not c!96161)) b!914489))

(assert (= (or b!914497 b!914489) bm!40500))

(assert (= (and d!112713 res!616568) b!914488))

(assert (= (and b!914488 res!616567) b!914492))

(assert (= (and b!914492 res!616569) b!914498))

(assert (= (and b!914492 c!96158) b!914493))

(assert (= (and b!914492 (not c!96158)) b!914487))

(assert (= (and b!914493 res!616566) b!914494))

(assert (= (and b!914487 c!96160) b!914496))

(assert (= (and b!914487 (not c!96160)) b!914495))

(declare-fun b_lambda!13337 () Bool)

(assert (=> (not b_lambda!13337) (not b!914494)))

(assert (=> b!914494 t!25904))

(declare-fun b_and!27327 () Bool)

(assert (= b_and!27325 (and (=> t!25904 result!10685) b_and!27327)))

(declare-fun b_lambda!13339 () Bool)

(assert (=> (not b_lambda!13339) (not b!914497)))

(assert (=> b!914497 t!25904))

(declare-fun b_and!27329 () Bool)

(assert (= b_and!27327 (and (=> t!25904 result!10685) b_and!27329)))

(declare-fun m!849251 () Bool)

(assert (=> b!914497 m!849251))

(assert (=> b!914497 m!849061))

(assert (=> b!914497 m!849251))

(declare-fun m!849253 () Bool)

(assert (=> b!914497 m!849253))

(assert (=> b!914497 m!849009))

(declare-fun m!849255 () Bool)

(assert (=> b!914497 m!849255))

(assert (=> b!914497 m!849061))

(assert (=> b!914497 m!849063))

(assert (=> b!914497 m!849065))

(declare-fun m!849257 () Bool)

(assert (=> b!914497 m!849257))

(assert (=> b!914497 m!849063))

(declare-fun m!849259 () Bool)

(assert (=> bm!40500 m!849259))

(assert (=> b!914494 m!849061))

(assert (=> b!914494 m!849009))

(declare-fun m!849261 () Bool)

(assert (=> b!914494 m!849261))

(assert (=> b!914494 m!849063))

(assert (=> b!914494 m!849009))

(assert (=> b!914494 m!849061))

(assert (=> b!914494 m!849063))

(assert (=> b!914494 m!849065))

(assert (=> b!914490 m!849009))

(assert (=> b!914490 m!849009))

(assert (=> b!914490 m!849069))

(assert (=> b!914493 m!849009))

(assert (=> b!914493 m!849009))

(declare-fun m!849263 () Bool)

(assert (=> b!914493 m!849263))

(declare-fun m!849265 () Bool)

(assert (=> d!112713 m!849265))

(assert (=> d!112713 m!848937))

(assert (=> b!914498 m!849009))

(assert (=> b!914498 m!849009))

(assert (=> b!914498 m!849069))

(declare-fun m!849267 () Bool)

(assert (=> b!914488 m!849267))

(assert (=> b!914496 m!849259))

(declare-fun m!849269 () Bool)

(assert (=> b!914495 m!849269))

(assert (=> b!914367 d!112713))

(declare-fun d!112715 () Bool)

(declare-fun isEmpty!699 (Option!479) Bool)

(assert (=> d!112715 (= (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!699 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25705 () Bool)

(assert (= bs!25705 d!112715))

(assert (=> bs!25705 m!849019))

(declare-fun m!849271 () Bool)

(assert (=> bs!25705 m!849271))

(assert (=> b!914316 d!112715))

(declare-fun b!914509 () Bool)

(declare-fun e!513046 () Option!479)

(assert (=> b!914509 (= e!513046 (getValueByKey!473 (t!25898 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(declare-fun b!914508 () Bool)

(declare-fun e!513045 () Option!479)

(assert (=> b!914508 (= e!513045 e!513046)))

(declare-fun c!96167 () Bool)

(assert (=> b!914508 (= c!96167 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun c!96166 () Bool)

(declare-fun d!112717 () Bool)

(assert (=> d!112717 (= c!96166 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112717 (= (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!513045)))

(declare-fun b!914507 () Bool)

(assert (=> b!914507 (= e!513045 (Some!478 (_2!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(declare-fun b!914510 () Bool)

(assert (=> b!914510 (= e!513046 None!477)))

(assert (= (and d!112717 c!96166) b!914507))

(assert (= (and d!112717 (not c!96166)) b!914508))

(assert (= (and b!914508 c!96167) b!914509))

(assert (= (and b!914508 (not c!96167)) b!914510))

(declare-fun m!849273 () Bool)

(assert (=> b!914509 m!849273))

(assert (=> b!914316 d!112717))

(declare-fun d!112719 () Bool)

(declare-fun e!513048 () Bool)

(assert (=> d!112719 e!513048))

(declare-fun res!616570 () Bool)

(assert (=> d!112719 (=> res!616570 e!513048)))

(declare-fun lt!411377 () Bool)

(assert (=> d!112719 (= res!616570 (not lt!411377))))

(declare-fun lt!411376 () Bool)

(assert (=> d!112719 (= lt!411377 lt!411376)))

(declare-fun lt!411378 () Unit!30896)

(declare-fun e!513047 () Unit!30896)

(assert (=> d!112719 (= lt!411378 e!513047)))

(declare-fun c!96168 () Bool)

(assert (=> d!112719 (= c!96168 lt!411376)))

(assert (=> d!112719 (= lt!411376 (containsKey!444 (toList!5614 lt!411307) (select (arr!26121 _keys!1386) i!717)))))

(assert (=> d!112719 (= (contains!4670 lt!411307 (select (arr!26121 _keys!1386) i!717)) lt!411377)))

(declare-fun b!914511 () Bool)

(declare-fun lt!411375 () Unit!30896)

(assert (=> b!914511 (= e!513047 lt!411375)))

(assert (=> b!914511 (= lt!411375 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411307) (select (arr!26121 _keys!1386) i!717)))))

(assert (=> b!914511 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) (select (arr!26121 _keys!1386) i!717)))))

(declare-fun b!914512 () Bool)

(declare-fun Unit!30907 () Unit!30896)

(assert (=> b!914512 (= e!513047 Unit!30907)))

(declare-fun b!914513 () Bool)

(assert (=> b!914513 (= e!513048 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) (select (arr!26121 _keys!1386) i!717))))))

(assert (= (and d!112719 c!96168) b!914511))

(assert (= (and d!112719 (not c!96168)) b!914512))

(assert (= (and d!112719 (not res!616570)) b!914513))

(assert (=> d!112719 m!848951))

(declare-fun m!849275 () Bool)

(assert (=> d!112719 m!849275))

(assert (=> b!914511 m!848951))

(declare-fun m!849277 () Bool)

(assert (=> b!914511 m!849277))

(assert (=> b!914511 m!848951))

(declare-fun m!849279 () Bool)

(assert (=> b!914511 m!849279))

(assert (=> b!914511 m!849279))

(declare-fun m!849281 () Bool)

(assert (=> b!914511 m!849281))

(assert (=> b!914513 m!848951))

(assert (=> b!914513 m!849279))

(assert (=> b!914513 m!849279))

(assert (=> b!914513 m!849281))

(assert (=> b!914385 d!112719))

(declare-fun d!112721 () Bool)

(declare-fun e!513049 () Bool)

(assert (=> d!112721 e!513049))

(declare-fun res!616571 () Bool)

(assert (=> d!112721 (=> (not res!616571) (not e!513049))))

(declare-fun lt!411381 () ListLongMap!11197)

(assert (=> d!112721 (= res!616571 (contains!4670 lt!411381 (_1!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411382 () List!18315)

(assert (=> d!112721 (= lt!411381 (ListLongMap!11198 lt!411382))))

(declare-fun lt!411379 () Unit!30896)

(declare-fun lt!411380 () Unit!30896)

(assert (=> d!112721 (= lt!411379 lt!411380)))

(assert (=> d!112721 (= (getValueByKey!473 lt!411382 (_1!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!478 (_2!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112721 (= lt!411380 (lemmaContainsTupThenGetReturnValue!253 lt!411382 (_1!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112721 (= lt!411382 (insertStrictlySorted!310 (toList!5614 (ite c!96132 call!40484 (ite c!96135 call!40487 call!40486))) (_1!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112721 (= (+!2618 (ite c!96132 call!40484 (ite c!96135 call!40487 call!40486)) (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411381)))

(declare-fun b!914514 () Bool)

(declare-fun res!616572 () Bool)

(assert (=> b!914514 (=> (not res!616572) (not e!513049))))

(assert (=> b!914514 (= res!616572 (= (getValueByKey!473 (toList!5614 lt!411381) (_1!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!478 (_2!6260 (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!914515 () Bool)

(assert (=> b!914515 (= e!513049 (contains!4674 (toList!5614 lt!411381) (ite (or c!96132 c!96135) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112721 res!616571) b!914514))

(assert (= (and b!914514 res!616572) b!914515))

(declare-fun m!849283 () Bool)

(assert (=> d!112721 m!849283))

(declare-fun m!849285 () Bool)

(assert (=> d!112721 m!849285))

(declare-fun m!849287 () Bool)

(assert (=> d!112721 m!849287))

(declare-fun m!849289 () Bool)

(assert (=> d!112721 m!849289))

(declare-fun m!849291 () Bool)

(assert (=> b!914514 m!849291))

(declare-fun m!849293 () Bool)

(assert (=> b!914515 m!849293))

(assert (=> bm!40478 d!112721))

(declare-fun d!112723 () Bool)

(assert (=> d!112723 (= (validKeyInArray!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914428 d!112723))

(declare-fun d!112725 () Bool)

(declare-fun res!616575 () Bool)

(declare-fun e!513052 () Bool)

(assert (=> d!112725 (=> res!616575 e!513052)))

(assert (=> d!112725 (= res!616575 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26581 _keys!1386)))))

(assert (=> d!112725 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96148 (Cons!18312 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) Nil!18313) Nil!18313)) e!513052)))

(declare-fun b!914516 () Bool)

(declare-fun e!513053 () Bool)

(declare-fun e!513050 () Bool)

(assert (=> b!914516 (= e!513053 e!513050)))

(declare-fun c!96169 () Bool)

(assert (=> b!914516 (= c!96169 (validKeyInArray!0 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!40504 () Bool)

(declare-fun bm!40501 () Bool)

(assert (=> bm!40501 (= call!40504 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!96169 (Cons!18312 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!96148 (Cons!18312 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) Nil!18313) Nil!18313)) (ite c!96148 (Cons!18312 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) Nil!18313) Nil!18313))))))

(declare-fun b!914517 () Bool)

(declare-fun e!513051 () Bool)

(assert (=> b!914517 (= e!513051 (contains!4673 (ite c!96148 (Cons!18312 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) Nil!18313) Nil!18313) (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914518 () Bool)

(assert (=> b!914518 (= e!513050 call!40504)))

(declare-fun b!914519 () Bool)

(assert (=> b!914519 (= e!513052 e!513053)))

(declare-fun res!616574 () Bool)

(assert (=> b!914519 (=> (not res!616574) (not e!513053))))

(assert (=> b!914519 (= res!616574 (not e!513051))))

(declare-fun res!616573 () Bool)

(assert (=> b!914519 (=> (not res!616573) (not e!513051))))

(assert (=> b!914519 (= res!616573 (validKeyInArray!0 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914520 () Bool)

(assert (=> b!914520 (= e!513050 call!40504)))

(assert (= (and d!112725 (not res!616575)) b!914519))

(assert (= (and b!914519 res!616573) b!914517))

(assert (= (and b!914519 res!616574) b!914516))

(assert (= (and b!914516 c!96169) b!914518))

(assert (= (and b!914516 (not c!96169)) b!914520))

(assert (= (or b!914518 b!914520) bm!40501))

(declare-fun m!849295 () Bool)

(assert (=> b!914516 m!849295))

(assert (=> b!914516 m!849295))

(declare-fun m!849297 () Bool)

(assert (=> b!914516 m!849297))

(assert (=> bm!40501 m!849295))

(declare-fun m!849299 () Bool)

(assert (=> bm!40501 m!849299))

(assert (=> b!914517 m!849295))

(assert (=> b!914517 m!849295))

(declare-fun m!849301 () Bool)

(assert (=> b!914517 m!849301))

(assert (=> b!914519 m!849295))

(assert (=> b!914519 m!849295))

(assert (=> b!914519 m!849297))

(assert (=> bm!40497 d!112725))

(declare-fun b!914521 () Bool)

(declare-fun e!513056 () Bool)

(declare-fun call!40505 () Bool)

(assert (=> b!914521 (= e!513056 call!40505)))

(declare-fun d!112727 () Bool)

(declare-fun res!616576 () Bool)

(declare-fun e!513055 () Bool)

(assert (=> d!112727 (=> res!616576 e!513055)))

(assert (=> d!112727 (= res!616576 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26581 _keys!1386)))))

(assert (=> d!112727 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!513055)))

(declare-fun b!914522 () Bool)

(declare-fun e!513054 () Bool)

(assert (=> b!914522 (= e!513054 call!40505)))

(declare-fun bm!40502 () Bool)

(assert (=> bm!40502 (= call!40505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914523 () Bool)

(assert (=> b!914523 (= e!513055 e!513054)))

(declare-fun c!96170 () Bool)

(assert (=> b!914523 (= c!96170 (validKeyInArray!0 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914524 () Bool)

(assert (=> b!914524 (= e!513054 e!513056)))

(declare-fun lt!411384 () (_ BitVec 64))

(assert (=> b!914524 (= lt!411384 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!411385 () Unit!30896)

(assert (=> b!914524 (= lt!411385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411384 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!914524 (arrayContainsKey!0 _keys!1386 lt!411384 #b00000000000000000000000000000000)))

(declare-fun lt!411383 () Unit!30896)

(assert (=> b!914524 (= lt!411383 lt!411385)))

(declare-fun res!616577 () Bool)

(assert (=> b!914524 (= res!616577 (= (seekEntryOrOpen!0 (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8923 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!914524 (=> (not res!616577) (not e!513056))))

(assert (= (and d!112727 (not res!616576)) b!914523))

(assert (= (and b!914523 c!96170) b!914524))

(assert (= (and b!914523 (not c!96170)) b!914522))

(assert (= (and b!914524 res!616577) b!914521))

(assert (= (or b!914521 b!914522) bm!40502))

(declare-fun m!849303 () Bool)

(assert (=> bm!40502 m!849303))

(assert (=> b!914523 m!849295))

(assert (=> b!914523 m!849295))

(assert (=> b!914523 m!849297))

(assert (=> b!914524 m!849295))

(declare-fun m!849305 () Bool)

(assert (=> b!914524 m!849305))

(declare-fun m!849307 () Bool)

(assert (=> b!914524 m!849307))

(assert (=> b!914524 m!849295))

(declare-fun m!849309 () Bool)

(assert (=> b!914524 m!849309))

(assert (=> bm!40494 d!112727))

(declare-fun call!40506 () ListLongMap!11197)

(declare-fun bm!40503 () Bool)

(assert (=> bm!40503 (= call!40506 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!914525 () Bool)

(declare-fun e!513063 () Bool)

(declare-fun e!513058 () Bool)

(assert (=> b!914525 (= e!513063 e!513058)))

(declare-fun c!96173 () Bool)

(assert (=> b!914525 (= c!96173 (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun b!914526 () Bool)

(declare-fun res!616579 () Bool)

(declare-fun e!513062 () Bool)

(assert (=> b!914526 (=> (not res!616579) (not e!513062))))

(declare-fun lt!411388 () ListLongMap!11197)

(assert (=> b!914526 (= res!616579 (not (contains!4670 lt!411388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!112729 () Bool)

(assert (=> d!112729 e!513062))

(declare-fun res!616580 () Bool)

(assert (=> d!112729 (=> (not res!616580) (not e!513062))))

(assert (=> d!112729 (= res!616580 (not (contains!4670 lt!411388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!513057 () ListLongMap!11197)

(assert (=> d!112729 (= lt!411388 e!513057)))

(declare-fun c!96172 () Bool)

(assert (=> d!112729 (= c!96172 (bvsge i!717 (size!26581 _keys!1386)))))

(assert (=> d!112729 (validMask!0 mask!1756)))

(assert (=> d!112729 (= (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411388)))

(declare-fun b!914527 () Bool)

(declare-fun e!513059 () ListLongMap!11197)

(assert (=> b!914527 (= e!513059 call!40506)))

(declare-fun b!914528 () Bool)

(assert (=> b!914528 (= e!513057 e!513059)))

(declare-fun c!96174 () Bool)

(assert (=> b!914528 (= c!96174 (validKeyInArray!0 (select (arr!26121 _keys!1386) i!717)))))

(declare-fun b!914529 () Bool)

(assert (=> b!914529 (= e!513057 (ListLongMap!11198 Nil!18312))))

(declare-fun b!914530 () Bool)

(assert (=> b!914530 (= e!513062 e!513063)))

(declare-fun c!96171 () Bool)

(declare-fun e!513061 () Bool)

(assert (=> b!914530 (= c!96171 e!513061)))

(declare-fun res!616581 () Bool)

(assert (=> b!914530 (=> (not res!616581) (not e!513061))))

(assert (=> b!914530 (= res!616581 (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun b!914531 () Bool)

(declare-fun e!513060 () Bool)

(assert (=> b!914531 (= e!513063 e!513060)))

(assert (=> b!914531 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26581 _keys!1386)))))

(declare-fun res!616578 () Bool)

(assert (=> b!914531 (= res!616578 (contains!4670 lt!411388 (select (arr!26121 _keys!1386) i!717)))))

(assert (=> b!914531 (=> (not res!616578) (not e!513060))))

(declare-fun b!914532 () Bool)

(assert (=> b!914532 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26581 _keys!1386)))))

(assert (=> b!914532 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26580 _values!1152)))))

(assert (=> b!914532 (= e!513060 (= (apply!527 lt!411388 (select (arr!26121 _keys!1386) i!717)) (get!13719 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914533 () Bool)

(assert (=> b!914533 (= e!513058 (isEmpty!698 lt!411388))))

(declare-fun b!914534 () Bool)

(assert (=> b!914534 (= e!513058 (= lt!411388 (getCurrentListMapNoExtraKeys!3339 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!914535 () Bool)

(declare-fun lt!411387 () Unit!30896)

(declare-fun lt!411391 () Unit!30896)

(assert (=> b!914535 (= lt!411387 lt!411391)))

(declare-fun lt!411390 () (_ BitVec 64))

(declare-fun lt!411386 () V!30495)

(declare-fun lt!411389 () ListLongMap!11197)

(declare-fun lt!411392 () (_ BitVec 64))

(assert (=> b!914535 (not (contains!4670 (+!2618 lt!411389 (tuple2!12499 lt!411392 lt!411386)) lt!411390))))

(assert (=> b!914535 (= lt!411391 (addStillNotContains!220 lt!411389 lt!411392 lt!411386 lt!411390))))

(assert (=> b!914535 (= lt!411390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!914535 (= lt!411386 (get!13719 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!914535 (= lt!411392 (select (arr!26121 _keys!1386) i!717))))

(assert (=> b!914535 (= lt!411389 call!40506)))

(assert (=> b!914535 (= e!513059 (+!2618 call!40506 (tuple2!12499 (select (arr!26121 _keys!1386) i!717) (get!13719 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!914536 () Bool)

(assert (=> b!914536 (= e!513061 (validKeyInArray!0 (select (arr!26121 _keys!1386) i!717)))))

(assert (=> b!914536 (bvsge i!717 #b00000000000000000000000000000000)))

(assert (= (and d!112729 c!96172) b!914529))

(assert (= (and d!112729 (not c!96172)) b!914528))

(assert (= (and b!914528 c!96174) b!914535))

(assert (= (and b!914528 (not c!96174)) b!914527))

(assert (= (or b!914535 b!914527) bm!40503))

(assert (= (and d!112729 res!616580) b!914526))

(assert (= (and b!914526 res!616579) b!914530))

(assert (= (and b!914530 res!616581) b!914536))

(assert (= (and b!914530 c!96171) b!914531))

(assert (= (and b!914530 (not c!96171)) b!914525))

(assert (= (and b!914531 res!616578) b!914532))

(assert (= (and b!914525 c!96173) b!914534))

(assert (= (and b!914525 (not c!96173)) b!914533))

(declare-fun b_lambda!13341 () Bool)

(assert (=> (not b_lambda!13341) (not b!914532)))

(assert (=> b!914532 t!25904))

(declare-fun b_and!27331 () Bool)

(assert (= b_and!27329 (and (=> t!25904 result!10685) b_and!27331)))

(declare-fun b_lambda!13343 () Bool)

(assert (=> (not b_lambda!13343) (not b!914535)))

(assert (=> b!914535 t!25904))

(declare-fun b_and!27333 () Bool)

(assert (= b_and!27331 (and (=> t!25904 result!10685) b_and!27333)))

(declare-fun m!849311 () Bool)

(assert (=> b!914535 m!849311))

(assert (=> b!914535 m!849125))

(assert (=> b!914535 m!849311))

(declare-fun m!849313 () Bool)

(assert (=> b!914535 m!849313))

(assert (=> b!914535 m!848951))

(declare-fun m!849315 () Bool)

(assert (=> b!914535 m!849315))

(assert (=> b!914535 m!849125))

(assert (=> b!914535 m!849063))

(assert (=> b!914535 m!849127))

(declare-fun m!849317 () Bool)

(assert (=> b!914535 m!849317))

(assert (=> b!914535 m!849063))

(declare-fun m!849319 () Bool)

(assert (=> bm!40503 m!849319))

(assert (=> b!914532 m!849125))

(assert (=> b!914532 m!848951))

(declare-fun m!849321 () Bool)

(assert (=> b!914532 m!849321))

(assert (=> b!914532 m!849063))

(assert (=> b!914532 m!848951))

(assert (=> b!914532 m!849125))

(assert (=> b!914532 m!849063))

(assert (=> b!914532 m!849127))

(assert (=> b!914528 m!848951))

(assert (=> b!914528 m!848951))

(assert (=> b!914528 m!849131))

(assert (=> b!914531 m!848951))

(assert (=> b!914531 m!848951))

(declare-fun m!849323 () Bool)

(assert (=> b!914531 m!849323))

(declare-fun m!849325 () Bool)

(assert (=> d!112729 m!849325))

(assert (=> d!112729 m!848937))

(assert (=> b!914536 m!848951))

(assert (=> b!914536 m!848951))

(assert (=> b!914536 m!849131))

(declare-fun m!849327 () Bool)

(assert (=> b!914526 m!849327))

(assert (=> b!914534 m!849319))

(declare-fun m!849329 () Bool)

(assert (=> b!914533 m!849329))

(assert (=> bm!40491 d!112729))

(declare-fun d!112731 () Bool)

(assert (=> d!112731 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411395 () Unit!30896)

(declare-fun choose!1540 (List!18315 (_ BitVec 64)) Unit!30896)

(assert (=> d!112731 (= lt!411395 (choose!1540 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!513066 () Bool)

(assert (=> d!112731 e!513066))

(declare-fun res!616584 () Bool)

(assert (=> d!112731 (=> (not res!616584) (not e!513066))))

(declare-fun isStrictlySorted!489 (List!18315) Bool)

(assert (=> d!112731 (= res!616584 (isStrictlySorted!489 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112731 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!411395)))

(declare-fun b!914539 () Bool)

(assert (=> b!914539 (= e!513066 (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112731 res!616584) b!914539))

(assert (=> d!112731 m!849019))

(assert (=> d!112731 m!849019))

(assert (=> d!112731 m!849021))

(declare-fun m!849331 () Bool)

(assert (=> d!112731 m!849331))

(declare-fun m!849333 () Bool)

(assert (=> d!112731 m!849333))

(assert (=> b!914539 m!849015))

(assert (=> b!914314 d!112731))

(assert (=> b!914314 d!112715))

(assert (=> b!914314 d!112717))

(declare-fun d!112733 () Bool)

(declare-fun e!513069 () Bool)

(assert (=> d!112733 e!513069))

(declare-fun c!96177 () Bool)

(assert (=> d!112733 (= c!96177 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112733 true))

(declare-fun _$15!95 () Unit!30896)

(assert (=> d!112733 (= (choose!1537 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!95)))

(declare-fun b!914544 () Bool)

(assert (=> b!914544 (= e!513069 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914545 () Bool)

(assert (=> b!914545 (= e!513069 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112733 c!96177) b!914544))

(assert (= (and d!112733 (not c!96177)) b!914545))

(assert (=> b!914544 m!848943))

(assert (=> d!112661 d!112733))

(assert (=> d!112661 d!112671))

(declare-fun d!112735 () Bool)

(assert (=> d!112735 (= (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)) (not (isEmpty!699 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25706 () Bool)

(assert (= bs!25706 d!112735))

(assert (=> bs!25706 m!849083))

(declare-fun m!849335 () Bool)

(assert (=> bs!25706 m!849335))

(assert (=> b!914384 d!112735))

(declare-fun e!513071 () Option!479)

(declare-fun b!914548 () Bool)

(assert (=> b!914548 (= e!513071 (getValueByKey!473 (t!25898 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(declare-fun b!914547 () Bool)

(declare-fun e!513070 () Option!479)

(assert (=> b!914547 (= e!513070 e!513071)))

(declare-fun c!96179 () Bool)

(assert (=> b!914547 (= c!96179 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (not (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033))))))

(declare-fun d!112737 () Bool)

(declare-fun c!96178 () Bool)

(assert (=> d!112737 (= c!96178 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112737 (= (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!513070)))

(declare-fun b!914546 () Bool)

(assert (=> b!914546 (= e!513070 (Some!478 (_2!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))))

(declare-fun b!914549 () Bool)

(assert (=> b!914549 (= e!513071 None!477)))

(assert (= (and d!112737 c!96178) b!914546))

(assert (= (and d!112737 (not c!96178)) b!914547))

(assert (= (and b!914547 c!96179) b!914548))

(assert (= (and b!914547 (not c!96179)) b!914549))

(declare-fun m!849337 () Bool)

(assert (=> b!914548 m!849337))

(assert (=> b!914384 d!112737))

(declare-fun d!112739 () Bool)

(assert (=> d!112739 (isDefined!346 (getValueByKey!473 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411396 () Unit!30896)

(assert (=> d!112739 (= lt!411396 (choose!1540 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun e!513072 () Bool)

(assert (=> d!112739 e!513072))

(declare-fun res!616585 () Bool)

(assert (=> d!112739 (=> (not res!616585) (not e!513072))))

(assert (=> d!112739 (= res!616585 (isStrictlySorted!489 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))

(assert (=> d!112739 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) lt!411396)))

(declare-fun b!914550 () Bool)

(assert (=> b!914550 (= e!513072 (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112739 res!616585) b!914550))

(assert (=> d!112739 m!849083))

(assert (=> d!112739 m!849083))

(assert (=> d!112739 m!849085))

(declare-fun m!849339 () Bool)

(assert (=> d!112739 m!849339))

(declare-fun m!849341 () Bool)

(assert (=> d!112739 m!849341))

(assert (=> b!914550 m!849079))

(assert (=> b!914382 d!112739))

(assert (=> b!914382 d!112735))

(assert (=> b!914382 d!112737))

(declare-fun d!112741 () Bool)

(declare-fun e!513073 () Bool)

(assert (=> d!112741 e!513073))

(declare-fun res!616586 () Bool)

(assert (=> d!112741 (=> (not res!616586) (not e!513073))))

(declare-fun lt!411399 () ListLongMap!11197)

(assert (=> d!112741 (= res!616586 (contains!4670 lt!411399 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411400 () List!18315)

(assert (=> d!112741 (= lt!411399 (ListLongMap!11198 lt!411400))))

(declare-fun lt!411397 () Unit!30896)

(declare-fun lt!411398 () Unit!30896)

(assert (=> d!112741 (= lt!411397 lt!411398)))

(assert (=> d!112741 (= (getValueByKey!473 lt!411400 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112741 (= lt!411398 (lemmaContainsTupThenGetReturnValue!253 lt!411400 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112741 (= lt!411400 (insertStrictlySorted!310 (toList!5614 call!40482) (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112741 (= (+!2618 call!40482 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411399)))

(declare-fun b!914551 () Bool)

(declare-fun res!616587 () Bool)

(assert (=> b!914551 (=> (not res!616587) (not e!513073))))

(assert (=> b!914551 (= res!616587 (= (getValueByKey!473 (toList!5614 lt!411399) (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914552 () Bool)

(assert (=> b!914552 (= e!513073 (contains!4674 (toList!5614 lt!411399) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112741 res!616586) b!914551))

(assert (= (and b!914551 res!616587) b!914552))

(declare-fun m!849343 () Bool)

(assert (=> d!112741 m!849343))

(declare-fun m!849345 () Bool)

(assert (=> d!112741 m!849345))

(declare-fun m!849347 () Bool)

(assert (=> d!112741 m!849347))

(declare-fun m!849349 () Bool)

(assert (=> d!112741 m!849349))

(declare-fun m!849351 () Bool)

(assert (=> b!914551 m!849351))

(declare-fun m!849353 () Bool)

(assert (=> b!914552 m!849353))

(assert (=> b!914376 d!112741))

(declare-fun d!112743 () Bool)

(assert (=> d!112743 (= (apply!527 lt!411307 (select (arr!26121 _keys!1386) i!717)) (get!13720 (getValueByKey!473 (toList!5614 lt!411307) (select (arr!26121 _keys!1386) i!717))))))

(declare-fun bs!25707 () Bool)

(assert (= bs!25707 d!112743))

(assert (=> bs!25707 m!848951))

(assert (=> bs!25707 m!849279))

(assert (=> bs!25707 m!849279))

(declare-fun m!849355 () Bool)

(assert (=> bs!25707 m!849355))

(assert (=> b!914396 d!112743))

(declare-fun d!112745 () Bool)

(declare-fun c!96182 () Bool)

(assert (=> d!112745 (= c!96182 ((_ is ValueCellFull!9092) (select (arr!26120 _values!1152) i!717)))))

(declare-fun e!513076 () V!30495)

(assert (=> d!112745 (= (get!13719 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!513076)))

(declare-fun b!914557 () Bool)

(declare-fun get!13721 (ValueCell!9092 V!30495) V!30495)

(assert (=> b!914557 (= e!513076 (get!13721 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914558 () Bool)

(declare-fun get!13722 (ValueCell!9092 V!30495) V!30495)

(assert (=> b!914558 (= e!513076 (get!13722 (select (arr!26120 _values!1152) i!717) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112745 c!96182) b!914557))

(assert (= (and d!112745 (not c!96182)) b!914558))

(assert (=> b!914557 m!849125))

(assert (=> b!914557 m!849063))

(declare-fun m!849357 () Bool)

(assert (=> b!914557 m!849357))

(assert (=> b!914558 m!849125))

(assert (=> b!914558 m!849063))

(declare-fun m!849359 () Bool)

(assert (=> b!914558 m!849359))

(assert (=> b!914396 d!112745))

(declare-fun d!112747 () Bool)

(assert (=> d!112747 (= (apply!527 lt!411307 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13720 (getValueByKey!473 (toList!5614 lt!411307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25708 () Bool)

(assert (= bs!25708 d!112747))

(declare-fun m!849361 () Bool)

(assert (=> bs!25708 m!849361))

(assert (=> bs!25708 m!849361))

(declare-fun m!849363 () Bool)

(assert (=> bs!25708 m!849363))

(assert (=> b!914397 d!112747))

(assert (=> b!914378 d!112723))

(declare-fun d!112749 () Bool)

(assert (=> d!112749 (= (apply!527 lt!411281 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13720 (getValueByKey!473 (toList!5614 lt!411281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25709 () Bool)

(assert (= bs!25709 d!112749))

(declare-fun m!849365 () Bool)

(assert (=> bs!25709 m!849365))

(assert (=> bs!25709 m!849365))

(declare-fun m!849367 () Bool)

(assert (=> bs!25709 m!849367))

(assert (=> b!914377 d!112749))

(declare-fun d!112751 () Bool)

(declare-fun e!513078 () Bool)

(assert (=> d!112751 e!513078))

(declare-fun res!616588 () Bool)

(assert (=> d!112751 (=> res!616588 e!513078)))

(declare-fun lt!411403 () Bool)

(assert (=> d!112751 (= res!616588 (not lt!411403))))

(declare-fun lt!411402 () Bool)

(assert (=> d!112751 (= lt!411403 lt!411402)))

(declare-fun lt!411404 () Unit!30896)

(declare-fun e!513077 () Unit!30896)

(assert (=> d!112751 (= lt!411404 e!513077)))

(declare-fun c!96183 () Bool)

(assert (=> d!112751 (= c!96183 lt!411402)))

(assert (=> d!112751 (= lt!411402 (containsKey!444 (toList!5614 lt!411307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112751 (= (contains!4670 lt!411307 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411403)))

(declare-fun b!914559 () Bool)

(declare-fun lt!411401 () Unit!30896)

(assert (=> b!914559 (= e!513077 lt!411401)))

(assert (=> b!914559 (= lt!411401 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914559 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914560 () Bool)

(declare-fun Unit!30908 () Unit!30896)

(assert (=> b!914560 (= e!513077 Unit!30908)))

(declare-fun b!914561 () Bool)

(assert (=> b!914561 (= e!513078 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112751 c!96183) b!914559))

(assert (= (and d!112751 (not c!96183)) b!914560))

(assert (= (and d!112751 (not res!616588)) b!914561))

(declare-fun m!849369 () Bool)

(assert (=> d!112751 m!849369))

(declare-fun m!849371 () Bool)

(assert (=> b!914559 m!849371))

(declare-fun m!849373 () Bool)

(assert (=> b!914559 m!849373))

(assert (=> b!914559 m!849373))

(declare-fun m!849375 () Bool)

(assert (=> b!914559 m!849375))

(assert (=> b!914561 m!849373))

(assert (=> b!914561 m!849373))

(assert (=> b!914561 m!849375))

(assert (=> bm!40487 d!112751))

(assert (=> bm!40484 d!112713))

(declare-fun d!112753 () Bool)

(declare-fun e!513080 () Bool)

(assert (=> d!112753 e!513080))

(declare-fun res!616589 () Bool)

(assert (=> d!112753 (=> res!616589 e!513080)))

(declare-fun lt!411407 () Bool)

(assert (=> d!112753 (= res!616589 (not lt!411407))))

(declare-fun lt!411406 () Bool)

(assert (=> d!112753 (= lt!411407 lt!411406)))

(declare-fun lt!411408 () Unit!30896)

(declare-fun e!513079 () Unit!30896)

(assert (=> d!112753 (= lt!411408 e!513079)))

(declare-fun c!96184 () Bool)

(assert (=> d!112753 (= c!96184 lt!411406)))

(assert (=> d!112753 (= lt!411406 (containsKey!444 (toList!5614 lt!411281) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112753 (= (contains!4670 lt!411281 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) lt!411407)))

(declare-fun b!914562 () Bool)

(declare-fun lt!411405 () Unit!30896)

(assert (=> b!914562 (= e!513079 lt!411405)))

(assert (=> b!914562 (= lt!411405 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411281) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914562 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914563 () Bool)

(declare-fun Unit!30909 () Unit!30896)

(assert (=> b!914563 (= e!513079 Unit!30909)))

(declare-fun b!914564 () Bool)

(assert (=> b!914564 (= e!513080 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112753 c!96184) b!914562))

(assert (= (and d!112753 (not c!96184)) b!914563))

(assert (= (and d!112753 (not res!616589)) b!914564))

(assert (=> d!112753 m!849009))

(declare-fun m!849377 () Bool)

(assert (=> d!112753 m!849377))

(assert (=> b!914562 m!849009))

(declare-fun m!849379 () Bool)

(assert (=> b!914562 m!849379))

(assert (=> b!914562 m!849009))

(declare-fun m!849381 () Bool)

(assert (=> b!914562 m!849381))

(assert (=> b!914562 m!849381))

(declare-fun m!849383 () Bool)

(assert (=> b!914562 m!849383))

(assert (=> b!914564 m!849009))

(assert (=> b!914564 m!849381))

(assert (=> b!914564 m!849381))

(assert (=> b!914564 m!849383))

(assert (=> b!914359 d!112753))

(declare-fun d!112755 () Bool)

(declare-fun res!616590 () Bool)

(declare-fun e!513081 () Bool)

(assert (=> d!112755 (=> res!616590 e!513081)))

(assert (=> d!112755 (= res!616590 (= (select (arr!26121 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112755 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!513081)))

(declare-fun b!914565 () Bool)

(declare-fun e!513082 () Bool)

(assert (=> b!914565 (= e!513081 e!513082)))

(declare-fun res!616591 () Bool)

(assert (=> b!914565 (=> (not res!616591) (not e!513082))))

(assert (=> b!914565 (= res!616591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26581 _keys!1386)))))

(declare-fun b!914566 () Bool)

(assert (=> b!914566 (= e!513082 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112755 (not res!616590)) b!914565))

(assert (= (and b!914565 res!616591) b!914566))

(assert (=> d!112755 m!849295))

(declare-fun m!849385 () Bool)

(assert (=> b!914566 m!849385))

(assert (=> b!914301 d!112755))

(declare-fun d!112757 () Bool)

(assert (=> d!112757 (= (validKeyInArray!0 (select (arr!26121 _keys!1386) i!717)) (and (not (= (select (arr!26121 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26121 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914395 d!112757))

(declare-fun d!112759 () Bool)

(declare-fun e!513084 () Bool)

(assert (=> d!112759 e!513084))

(declare-fun res!616592 () Bool)

(assert (=> d!112759 (=> res!616592 e!513084)))

(declare-fun lt!411411 () Bool)

(assert (=> d!112759 (= res!616592 (not lt!411411))))

(declare-fun lt!411410 () Bool)

(assert (=> d!112759 (= lt!411411 lt!411410)))

(declare-fun lt!411412 () Unit!30896)

(declare-fun e!513083 () Unit!30896)

(assert (=> d!112759 (= lt!411412 e!513083)))

(declare-fun c!96185 () Bool)

(assert (=> d!112759 (= c!96185 lt!411410)))

(assert (=> d!112759 (= lt!411410 (containsKey!444 (toList!5614 lt!411307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112759 (= (contains!4670 lt!411307 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411411)))

(declare-fun b!914567 () Bool)

(declare-fun lt!411409 () Unit!30896)

(assert (=> b!914567 (= e!513083 lt!411409)))

(assert (=> b!914567 (= lt!411409 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914567 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914568 () Bool)

(declare-fun Unit!30910 () Unit!30896)

(assert (=> b!914568 (= e!513083 Unit!30910)))

(declare-fun b!914569 () Bool)

(assert (=> b!914569 (= e!513084 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112759 c!96185) b!914567))

(assert (= (and d!112759 (not c!96185)) b!914568))

(assert (= (and d!112759 (not res!616592)) b!914569))

(declare-fun m!849387 () Bool)

(assert (=> d!112759 m!849387))

(declare-fun m!849389 () Bool)

(assert (=> b!914567 m!849389))

(assert (=> b!914567 m!849361))

(assert (=> b!914567 m!849361))

(declare-fun m!849391 () Bool)

(assert (=> b!914567 m!849391))

(assert (=> b!914569 m!849361))

(assert (=> b!914569 m!849361))

(assert (=> b!914569 m!849391))

(assert (=> bm!40488 d!112759))

(declare-fun d!112761 () Bool)

(declare-fun e!513085 () Bool)

(assert (=> d!112761 e!513085))

(declare-fun res!616593 () Bool)

(assert (=> d!112761 (=> (not res!616593) (not e!513085))))

(declare-fun lt!411415 () ListLongMap!11197)

(assert (=> d!112761 (= res!616593 (contains!4670 lt!411415 (_1!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411416 () List!18315)

(assert (=> d!112761 (= lt!411415 (ListLongMap!11198 lt!411416))))

(declare-fun lt!411413 () Unit!30896)

(declare-fun lt!411414 () Unit!30896)

(assert (=> d!112761 (= lt!411413 lt!411414)))

(assert (=> d!112761 (= (getValueByKey!473 lt!411416 (_1!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!478 (_2!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112761 (= lt!411414 (lemmaContainsTupThenGetReturnValue!253 lt!411416 (_1!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112761 (= lt!411416 (insertStrictlySorted!310 (toList!5614 (ite c!96139 call!40491 (ite c!96142 call!40494 call!40493))) (_1!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112761 (= (+!2618 (ite c!96139 call!40491 (ite c!96142 call!40494 call!40493)) (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411415)))

(declare-fun b!914570 () Bool)

(declare-fun res!616594 () Bool)

(assert (=> b!914570 (=> (not res!616594) (not e!513085))))

(assert (=> b!914570 (= res!616594 (= (getValueByKey!473 (toList!5614 lt!411415) (_1!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!478 (_2!6260 (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!914571 () Bool)

(assert (=> b!914571 (= e!513085 (contains!4674 (toList!5614 lt!411415) (ite (or c!96139 c!96142) (tuple2!12499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112761 res!616593) b!914570))

(assert (= (and b!914570 res!616594) b!914571))

(declare-fun m!849393 () Bool)

(assert (=> d!112761 m!849393))

(declare-fun m!849395 () Bool)

(assert (=> d!112761 m!849395))

(declare-fun m!849397 () Bool)

(assert (=> d!112761 m!849397))

(declare-fun m!849399 () Bool)

(assert (=> d!112761 m!849399))

(declare-fun m!849401 () Bool)

(assert (=> b!914570 m!849401))

(declare-fun m!849403 () Bool)

(assert (=> b!914571 m!849403))

(assert (=> bm!40485 d!112761))

(declare-fun d!112763 () Bool)

(declare-fun res!616599 () Bool)

(declare-fun e!513090 () Bool)

(assert (=> d!112763 (=> res!616599 e!513090)))

(assert (=> d!112763 (= res!616599 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112763 (= (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!513090)))

(declare-fun b!914576 () Bool)

(declare-fun e!513091 () Bool)

(assert (=> b!914576 (= e!513090 e!513091)))

(declare-fun res!616600 () Bool)

(assert (=> b!914576 (=> (not res!616600) (not e!513091))))

(assert (=> b!914576 (= res!616600 (and (or (not ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) (bvsle (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (bvslt (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!914577 () Bool)

(assert (=> b!914577 (= e!513091 (containsKey!444 (t!25898 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112763 (not res!616599)) b!914576))

(assert (= (and b!914576 res!616600) b!914577))

(declare-fun m!849405 () Bool)

(assert (=> b!914577 m!849405))

(assert (=> d!112667 d!112763))

(declare-fun d!112765 () Bool)

(assert (=> d!112765 (= (apply!527 lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13720 (getValueByKey!473 (toList!5614 lt!411281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25710 () Bool)

(assert (= bs!25710 d!112765))

(declare-fun m!849407 () Bool)

(assert (=> bs!25710 m!849407))

(assert (=> bs!25710 m!849407))

(declare-fun m!849409 () Bool)

(assert (=> bs!25710 m!849409))

(assert (=> b!914371 d!112765))

(declare-fun d!112767 () Bool)

(assert (=> d!112767 (= (apply!527 lt!411301 lt!411300) (get!13720 (getValueByKey!473 (toList!5614 lt!411301) lt!411300)))))

(declare-fun bs!25711 () Bool)

(assert (= bs!25711 d!112767))

(declare-fun m!849411 () Bool)

(assert (=> bs!25711 m!849411))

(assert (=> bs!25711 m!849411))

(declare-fun m!849413 () Bool)

(assert (=> bs!25711 m!849413))

(assert (=> b!914393 d!112767))

(assert (=> b!914393 d!112729))

(declare-fun d!112769 () Bool)

(assert (=> d!112769 (contains!4670 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094)) lt!411293)))

(declare-fun lt!411417 () Unit!30896)

(assert (=> d!112769 (= lt!411417 (choose!1538 lt!411295 lt!411302 zeroValue!1094 lt!411293))))

(assert (=> d!112769 (contains!4670 lt!411295 lt!411293)))

(assert (=> d!112769 (= (addStillContains!349 lt!411295 lt!411302 zeroValue!1094 lt!411293) lt!411417)))

(declare-fun bs!25712 () Bool)

(assert (= bs!25712 d!112769))

(assert (=> bs!25712 m!849101))

(assert (=> bs!25712 m!849101))

(assert (=> bs!25712 m!849111))

(declare-fun m!849415 () Bool)

(assert (=> bs!25712 m!849415))

(declare-fun m!849417 () Bool)

(assert (=> bs!25712 m!849417))

(assert (=> b!914393 d!112769))

(declare-fun d!112771 () Bool)

(declare-fun e!513092 () Bool)

(assert (=> d!112771 e!513092))

(declare-fun res!616601 () Bool)

(assert (=> d!112771 (=> (not res!616601) (not e!513092))))

(declare-fun lt!411420 () ListLongMap!11197)

(assert (=> d!112771 (= res!616601 (contains!4670 lt!411420 (_1!6260 (tuple2!12499 lt!411287 minValue!1094))))))

(declare-fun lt!411421 () List!18315)

(assert (=> d!112771 (= lt!411420 (ListLongMap!11198 lt!411421))))

(declare-fun lt!411418 () Unit!30896)

(declare-fun lt!411419 () Unit!30896)

(assert (=> d!112771 (= lt!411418 lt!411419)))

(assert (=> d!112771 (= (getValueByKey!473 lt!411421 (_1!6260 (tuple2!12499 lt!411287 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411287 minValue!1094))))))

(assert (=> d!112771 (= lt!411419 (lemmaContainsTupThenGetReturnValue!253 lt!411421 (_1!6260 (tuple2!12499 lt!411287 minValue!1094)) (_2!6260 (tuple2!12499 lt!411287 minValue!1094))))))

(assert (=> d!112771 (= lt!411421 (insertStrictlySorted!310 (toList!5614 lt!411301) (_1!6260 (tuple2!12499 lt!411287 minValue!1094)) (_2!6260 (tuple2!12499 lt!411287 minValue!1094))))))

(assert (=> d!112771 (= (+!2618 lt!411301 (tuple2!12499 lt!411287 minValue!1094)) lt!411420)))

(declare-fun b!914578 () Bool)

(declare-fun res!616602 () Bool)

(assert (=> b!914578 (=> (not res!616602) (not e!513092))))

(assert (=> b!914578 (= res!616602 (= (getValueByKey!473 (toList!5614 lt!411420) (_1!6260 (tuple2!12499 lt!411287 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411287 minValue!1094)))))))

(declare-fun b!914579 () Bool)

(assert (=> b!914579 (= e!513092 (contains!4674 (toList!5614 lt!411420) (tuple2!12499 lt!411287 minValue!1094)))))

(assert (= (and d!112771 res!616601) b!914578))

(assert (= (and b!914578 res!616602) b!914579))

(declare-fun m!849419 () Bool)

(assert (=> d!112771 m!849419))

(declare-fun m!849421 () Bool)

(assert (=> d!112771 m!849421))

(declare-fun m!849423 () Bool)

(assert (=> d!112771 m!849423))

(declare-fun m!849425 () Bool)

(assert (=> d!112771 m!849425))

(declare-fun m!849427 () Bool)

(assert (=> b!914578 m!849427))

(declare-fun m!849429 () Bool)

(assert (=> b!914579 m!849429))

(assert (=> b!914393 d!112771))

(declare-fun d!112773 () Bool)

(assert (=> d!112773 (= (apply!527 (+!2618 lt!411288 (tuple2!12499 lt!411299 minValue!1094)) lt!411292) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411288 (tuple2!12499 lt!411299 minValue!1094))) lt!411292)))))

(declare-fun bs!25713 () Bool)

(assert (= bs!25713 d!112773))

(declare-fun m!849431 () Bool)

(assert (=> bs!25713 m!849431))

(assert (=> bs!25713 m!849431))

(declare-fun m!849433 () Bool)

(assert (=> bs!25713 m!849433))

(assert (=> b!914393 d!112773))

(declare-fun d!112775 () Bool)

(assert (=> d!112775 (= (apply!527 (+!2618 lt!411301 (tuple2!12499 lt!411287 minValue!1094)) lt!411300) (apply!527 lt!411301 lt!411300))))

(declare-fun lt!411422 () Unit!30896)

(assert (=> d!112775 (= lt!411422 (choose!1539 lt!411301 lt!411287 minValue!1094 lt!411300))))

(declare-fun e!513093 () Bool)

(assert (=> d!112775 e!513093))

(declare-fun res!616603 () Bool)

(assert (=> d!112775 (=> (not res!616603) (not e!513093))))

(assert (=> d!112775 (= res!616603 (contains!4670 lt!411301 lt!411300))))

(assert (=> d!112775 (= (addApplyDifferent!349 lt!411301 lt!411287 minValue!1094 lt!411300) lt!411422)))

(declare-fun b!914580 () Bool)

(assert (=> b!914580 (= e!513093 (not (= lt!411300 lt!411287)))))

(assert (= (and d!112775 res!616603) b!914580))

(declare-fun m!849435 () Bool)

(assert (=> d!112775 m!849435))

(assert (=> d!112775 m!849113))

(assert (=> d!112775 m!849119))

(assert (=> d!112775 m!849091))

(declare-fun m!849437 () Bool)

(assert (=> d!112775 m!849437))

(assert (=> d!112775 m!849113))

(assert (=> b!914393 d!112775))

(declare-fun d!112777 () Bool)

(assert (=> d!112777 (= (apply!527 (+!2618 lt!411305 (tuple2!12499 lt!411308 zeroValue!1094)) lt!411296) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411305 (tuple2!12499 lt!411308 zeroValue!1094))) lt!411296)))))

(declare-fun bs!25714 () Bool)

(assert (= bs!25714 d!112777))

(declare-fun m!849439 () Bool)

(assert (=> bs!25714 m!849439))

(assert (=> bs!25714 m!849439))

(declare-fun m!849441 () Bool)

(assert (=> bs!25714 m!849441))

(assert (=> b!914393 d!112777))

(declare-fun d!112779 () Bool)

(assert (=> d!112779 (= (apply!527 (+!2618 lt!411305 (tuple2!12499 lt!411308 zeroValue!1094)) lt!411296) (apply!527 lt!411305 lt!411296))))

(declare-fun lt!411423 () Unit!30896)

(assert (=> d!112779 (= lt!411423 (choose!1539 lt!411305 lt!411308 zeroValue!1094 lt!411296))))

(declare-fun e!513094 () Bool)

(assert (=> d!112779 e!513094))

(declare-fun res!616604 () Bool)

(assert (=> d!112779 (=> (not res!616604) (not e!513094))))

(assert (=> d!112779 (= res!616604 (contains!4670 lt!411305 lt!411296))))

(assert (=> d!112779 (= (addApplyDifferent!349 lt!411305 lt!411308 zeroValue!1094 lt!411296) lt!411423)))

(declare-fun b!914581 () Bool)

(assert (=> b!914581 (= e!513094 (not (= lt!411296 lt!411308)))))

(assert (= (and d!112779 res!616604) b!914581))

(declare-fun m!849443 () Bool)

(assert (=> d!112779 m!849443))

(assert (=> d!112779 m!849097))

(assert (=> d!112779 m!849099))

(assert (=> d!112779 m!849103))

(declare-fun m!849445 () Bool)

(assert (=> d!112779 m!849445))

(assert (=> d!112779 m!849097))

(assert (=> b!914393 d!112779))

(declare-fun d!112781 () Bool)

(assert (=> d!112781 (= (apply!527 lt!411288 lt!411292) (get!13720 (getValueByKey!473 (toList!5614 lt!411288) lt!411292)))))

(declare-fun bs!25715 () Bool)

(assert (= bs!25715 d!112781))

(declare-fun m!849447 () Bool)

(assert (=> bs!25715 m!849447))

(assert (=> bs!25715 m!849447))

(declare-fun m!849449 () Bool)

(assert (=> bs!25715 m!849449))

(assert (=> b!914393 d!112781))

(declare-fun d!112783 () Bool)

(declare-fun e!513095 () Bool)

(assert (=> d!112783 e!513095))

(declare-fun res!616605 () Bool)

(assert (=> d!112783 (=> (not res!616605) (not e!513095))))

(declare-fun lt!411426 () ListLongMap!11197)

(assert (=> d!112783 (= res!616605 (contains!4670 lt!411426 (_1!6260 (tuple2!12499 lt!411299 minValue!1094))))))

(declare-fun lt!411427 () List!18315)

(assert (=> d!112783 (= lt!411426 (ListLongMap!11198 lt!411427))))

(declare-fun lt!411424 () Unit!30896)

(declare-fun lt!411425 () Unit!30896)

(assert (=> d!112783 (= lt!411424 lt!411425)))

(assert (=> d!112783 (= (getValueByKey!473 lt!411427 (_1!6260 (tuple2!12499 lt!411299 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411299 minValue!1094))))))

(assert (=> d!112783 (= lt!411425 (lemmaContainsTupThenGetReturnValue!253 lt!411427 (_1!6260 (tuple2!12499 lt!411299 minValue!1094)) (_2!6260 (tuple2!12499 lt!411299 minValue!1094))))))

(assert (=> d!112783 (= lt!411427 (insertStrictlySorted!310 (toList!5614 lt!411288) (_1!6260 (tuple2!12499 lt!411299 minValue!1094)) (_2!6260 (tuple2!12499 lt!411299 minValue!1094))))))

(assert (=> d!112783 (= (+!2618 lt!411288 (tuple2!12499 lt!411299 minValue!1094)) lt!411426)))

(declare-fun b!914582 () Bool)

(declare-fun res!616606 () Bool)

(assert (=> b!914582 (=> (not res!616606) (not e!513095))))

(assert (=> b!914582 (= res!616606 (= (getValueByKey!473 (toList!5614 lt!411426) (_1!6260 (tuple2!12499 lt!411299 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411299 minValue!1094)))))))

(declare-fun b!914583 () Bool)

(assert (=> b!914583 (= e!513095 (contains!4674 (toList!5614 lt!411426) (tuple2!12499 lt!411299 minValue!1094)))))

(assert (= (and d!112783 res!616605) b!914582))

(assert (= (and b!914582 res!616606) b!914583))

(declare-fun m!849451 () Bool)

(assert (=> d!112783 m!849451))

(declare-fun m!849453 () Bool)

(assert (=> d!112783 m!849453))

(declare-fun m!849455 () Bool)

(assert (=> d!112783 m!849455))

(declare-fun m!849457 () Bool)

(assert (=> d!112783 m!849457))

(declare-fun m!849459 () Bool)

(assert (=> b!914582 m!849459))

(declare-fun m!849461 () Bool)

(assert (=> b!914583 m!849461))

(assert (=> b!914393 d!112783))

(declare-fun d!112785 () Bool)

(assert (=> d!112785 (= (apply!527 lt!411305 lt!411296) (get!13720 (getValueByKey!473 (toList!5614 lt!411305) lt!411296)))))

(declare-fun bs!25716 () Bool)

(assert (= bs!25716 d!112785))

(declare-fun m!849463 () Bool)

(assert (=> bs!25716 m!849463))

(assert (=> bs!25716 m!849463))

(declare-fun m!849465 () Bool)

(assert (=> bs!25716 m!849465))

(assert (=> b!914393 d!112785))

(declare-fun d!112787 () Bool)

(declare-fun e!513097 () Bool)

(assert (=> d!112787 e!513097))

(declare-fun res!616607 () Bool)

(assert (=> d!112787 (=> res!616607 e!513097)))

(declare-fun lt!411430 () Bool)

(assert (=> d!112787 (= res!616607 (not lt!411430))))

(declare-fun lt!411429 () Bool)

(assert (=> d!112787 (= lt!411430 lt!411429)))

(declare-fun lt!411431 () Unit!30896)

(declare-fun e!513096 () Unit!30896)

(assert (=> d!112787 (= lt!411431 e!513096)))

(declare-fun c!96186 () Bool)

(assert (=> d!112787 (= c!96186 lt!411429)))

(assert (=> d!112787 (= lt!411429 (containsKey!444 (toList!5614 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094))) lt!411293))))

(assert (=> d!112787 (= (contains!4670 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094)) lt!411293) lt!411430)))

(declare-fun b!914584 () Bool)

(declare-fun lt!411428 () Unit!30896)

(assert (=> b!914584 (= e!513096 lt!411428)))

(assert (=> b!914584 (= lt!411428 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094))) lt!411293))))

(assert (=> b!914584 (isDefined!346 (getValueByKey!473 (toList!5614 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094))) lt!411293))))

(declare-fun b!914585 () Bool)

(declare-fun Unit!30911 () Unit!30896)

(assert (=> b!914585 (= e!513096 Unit!30911)))

(declare-fun b!914586 () Bool)

(assert (=> b!914586 (= e!513097 (isDefined!346 (getValueByKey!473 (toList!5614 (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094))) lt!411293)))))

(assert (= (and d!112787 c!96186) b!914584))

(assert (= (and d!112787 (not c!96186)) b!914585))

(assert (= (and d!112787 (not res!616607)) b!914586))

(declare-fun m!849467 () Bool)

(assert (=> d!112787 m!849467))

(declare-fun m!849469 () Bool)

(assert (=> b!914584 m!849469))

(declare-fun m!849471 () Bool)

(assert (=> b!914584 m!849471))

(assert (=> b!914584 m!849471))

(declare-fun m!849473 () Bool)

(assert (=> b!914584 m!849473))

(assert (=> b!914586 m!849471))

(assert (=> b!914586 m!849471))

(assert (=> b!914586 m!849473))

(assert (=> b!914393 d!112787))

(declare-fun d!112789 () Bool)

(declare-fun e!513098 () Bool)

(assert (=> d!112789 e!513098))

(declare-fun res!616608 () Bool)

(assert (=> d!112789 (=> (not res!616608) (not e!513098))))

(declare-fun lt!411434 () ListLongMap!11197)

(assert (=> d!112789 (= res!616608 (contains!4670 lt!411434 (_1!6260 (tuple2!12499 lt!411302 zeroValue!1094))))))

(declare-fun lt!411435 () List!18315)

(assert (=> d!112789 (= lt!411434 (ListLongMap!11198 lt!411435))))

(declare-fun lt!411432 () Unit!30896)

(declare-fun lt!411433 () Unit!30896)

(assert (=> d!112789 (= lt!411432 lt!411433)))

(assert (=> d!112789 (= (getValueByKey!473 lt!411435 (_1!6260 (tuple2!12499 lt!411302 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411302 zeroValue!1094))))))

(assert (=> d!112789 (= lt!411433 (lemmaContainsTupThenGetReturnValue!253 lt!411435 (_1!6260 (tuple2!12499 lt!411302 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411302 zeroValue!1094))))))

(assert (=> d!112789 (= lt!411435 (insertStrictlySorted!310 (toList!5614 lt!411295) (_1!6260 (tuple2!12499 lt!411302 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411302 zeroValue!1094))))))

(assert (=> d!112789 (= (+!2618 lt!411295 (tuple2!12499 lt!411302 zeroValue!1094)) lt!411434)))

(declare-fun b!914587 () Bool)

(declare-fun res!616609 () Bool)

(assert (=> b!914587 (=> (not res!616609) (not e!513098))))

(assert (=> b!914587 (= res!616609 (= (getValueByKey!473 (toList!5614 lt!411434) (_1!6260 (tuple2!12499 lt!411302 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411302 zeroValue!1094)))))))

(declare-fun b!914588 () Bool)

(assert (=> b!914588 (= e!513098 (contains!4674 (toList!5614 lt!411434) (tuple2!12499 lt!411302 zeroValue!1094)))))

(assert (= (and d!112789 res!616608) b!914587))

(assert (= (and b!914587 res!616609) b!914588))

(declare-fun m!849475 () Bool)

(assert (=> d!112789 m!849475))

(declare-fun m!849477 () Bool)

(assert (=> d!112789 m!849477))

(declare-fun m!849479 () Bool)

(assert (=> d!112789 m!849479))

(declare-fun m!849481 () Bool)

(assert (=> d!112789 m!849481))

(declare-fun m!849483 () Bool)

(assert (=> b!914587 m!849483))

(declare-fun m!849485 () Bool)

(assert (=> b!914588 m!849485))

(assert (=> b!914393 d!112789))

(declare-fun d!112791 () Bool)

(assert (=> d!112791 (= (apply!527 (+!2618 lt!411301 (tuple2!12499 lt!411287 minValue!1094)) lt!411300) (get!13720 (getValueByKey!473 (toList!5614 (+!2618 lt!411301 (tuple2!12499 lt!411287 minValue!1094))) lt!411300)))))

(declare-fun bs!25717 () Bool)

(assert (= bs!25717 d!112791))

(declare-fun m!849487 () Bool)

(assert (=> bs!25717 m!849487))

(assert (=> bs!25717 m!849487))

(declare-fun m!849489 () Bool)

(assert (=> bs!25717 m!849489))

(assert (=> b!914393 d!112791))

(declare-fun d!112793 () Bool)

(assert (=> d!112793 (= (apply!527 (+!2618 lt!411288 (tuple2!12499 lt!411299 minValue!1094)) lt!411292) (apply!527 lt!411288 lt!411292))))

(declare-fun lt!411436 () Unit!30896)

(assert (=> d!112793 (= lt!411436 (choose!1539 lt!411288 lt!411299 minValue!1094 lt!411292))))

(declare-fun e!513099 () Bool)

(assert (=> d!112793 e!513099))

(declare-fun res!616610 () Bool)

(assert (=> d!112793 (=> (not res!616610) (not e!513099))))

(assert (=> d!112793 (= res!616610 (contains!4670 lt!411288 lt!411292))))

(assert (=> d!112793 (= (addApplyDifferent!349 lt!411288 lt!411299 minValue!1094 lt!411292) lt!411436)))

(declare-fun b!914589 () Bool)

(assert (=> b!914589 (= e!513099 (not (= lt!411292 lt!411299)))))

(assert (= (and d!112793 res!616610) b!914589))

(declare-fun m!849491 () Bool)

(assert (=> d!112793 m!849491))

(assert (=> d!112793 m!849093))

(assert (=> d!112793 m!849095))

(assert (=> d!112793 m!849105))

(declare-fun m!849493 () Bool)

(assert (=> d!112793 m!849493))

(assert (=> d!112793 m!849093))

(assert (=> b!914393 d!112793))

(declare-fun d!112795 () Bool)

(declare-fun e!513100 () Bool)

(assert (=> d!112795 e!513100))

(declare-fun res!616611 () Bool)

(assert (=> d!112795 (=> (not res!616611) (not e!513100))))

(declare-fun lt!411439 () ListLongMap!11197)

(assert (=> d!112795 (= res!616611 (contains!4670 lt!411439 (_1!6260 (tuple2!12499 lt!411308 zeroValue!1094))))))

(declare-fun lt!411440 () List!18315)

(assert (=> d!112795 (= lt!411439 (ListLongMap!11198 lt!411440))))

(declare-fun lt!411437 () Unit!30896)

(declare-fun lt!411438 () Unit!30896)

(assert (=> d!112795 (= lt!411437 lt!411438)))

(assert (=> d!112795 (= (getValueByKey!473 lt!411440 (_1!6260 (tuple2!12499 lt!411308 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411308 zeroValue!1094))))))

(assert (=> d!112795 (= lt!411438 (lemmaContainsTupThenGetReturnValue!253 lt!411440 (_1!6260 (tuple2!12499 lt!411308 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411308 zeroValue!1094))))))

(assert (=> d!112795 (= lt!411440 (insertStrictlySorted!310 (toList!5614 lt!411305) (_1!6260 (tuple2!12499 lt!411308 zeroValue!1094)) (_2!6260 (tuple2!12499 lt!411308 zeroValue!1094))))))

(assert (=> d!112795 (= (+!2618 lt!411305 (tuple2!12499 lt!411308 zeroValue!1094)) lt!411439)))

(declare-fun b!914590 () Bool)

(declare-fun res!616612 () Bool)

(assert (=> b!914590 (=> (not res!616612) (not e!513100))))

(assert (=> b!914590 (= res!616612 (= (getValueByKey!473 (toList!5614 lt!411439) (_1!6260 (tuple2!12499 lt!411308 zeroValue!1094))) (Some!478 (_2!6260 (tuple2!12499 lt!411308 zeroValue!1094)))))))

(declare-fun b!914591 () Bool)

(assert (=> b!914591 (= e!513100 (contains!4674 (toList!5614 lt!411439) (tuple2!12499 lt!411308 zeroValue!1094)))))

(assert (= (and d!112795 res!616611) b!914590))

(assert (= (and b!914590 res!616612) b!914591))

(declare-fun m!849495 () Bool)

(assert (=> d!112795 m!849495))

(declare-fun m!849497 () Bool)

(assert (=> d!112795 m!849497))

(declare-fun m!849499 () Bool)

(assert (=> d!112795 m!849499))

(declare-fun m!849501 () Bool)

(assert (=> d!112795 m!849501))

(declare-fun m!849503 () Bool)

(assert (=> b!914590 m!849503))

(declare-fun m!849505 () Bool)

(assert (=> b!914591 m!849505))

(assert (=> b!914393 d!112795))

(assert (=> d!112665 d!112671))

(declare-fun d!112797 () Bool)

(declare-fun res!616613 () Bool)

(declare-fun e!513101 () Bool)

(assert (=> d!112797 (=> res!616613 e!513101)))

(assert (=> d!112797 (= res!616613 (and ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112797 (= (containsKey!444 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!513101)))

(declare-fun b!914592 () Bool)

(declare-fun e!513102 () Bool)

(assert (=> b!914592 (= e!513101 e!513102)))

(declare-fun res!616614 () Bool)

(assert (=> b!914592 (=> (not res!616614) (not e!513102))))

(assert (=> b!914592 (= res!616614 (and (or (not ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18311) (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6260 (h!19463 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!914593 () Bool)

(assert (=> b!914593 (= e!513102 (containsKey!444 (t!25898 (toList!5614 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112797 (not res!616613)) b!914592))

(assert (= (and b!914592 res!616614) b!914593))

(declare-fun m!849507 () Bool)

(assert (=> b!914593 m!849507))

(assert (=> d!112663 d!112797))

(declare-fun d!112799 () Bool)

(declare-fun e!513104 () Bool)

(assert (=> d!112799 e!513104))

(declare-fun res!616615 () Bool)

(assert (=> d!112799 (=> res!616615 e!513104)))

(declare-fun lt!411443 () Bool)

(assert (=> d!112799 (= res!616615 (not lt!411443))))

(declare-fun lt!411442 () Bool)

(assert (=> d!112799 (= lt!411443 lt!411442)))

(declare-fun lt!411444 () Unit!30896)

(declare-fun e!513103 () Unit!30896)

(assert (=> d!112799 (= lt!411444 e!513103)))

(declare-fun c!96187 () Bool)

(assert (=> d!112799 (= c!96187 lt!411442)))

(assert (=> d!112799 (= lt!411442 (containsKey!444 (toList!5614 lt!411281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112799 (= (contains!4670 lt!411281 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411443)))

(declare-fun b!914594 () Bool)

(declare-fun lt!411441 () Unit!30896)

(assert (=> b!914594 (= e!513103 lt!411441)))

(assert (=> b!914594 (= lt!411441 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914594 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914595 () Bool)

(declare-fun Unit!30912 () Unit!30896)

(assert (=> b!914595 (= e!513103 Unit!30912)))

(declare-fun b!914596 () Bool)

(assert (=> b!914596 (= e!513104 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112799 c!96187) b!914594))

(assert (= (and d!112799 (not c!96187)) b!914595))

(assert (= (and d!112799 (not res!616615)) b!914596))

(declare-fun m!849509 () Bool)

(assert (=> d!112799 m!849509))

(declare-fun m!849511 () Bool)

(assert (=> b!914594 m!849511))

(assert (=> b!914594 m!849407))

(assert (=> b!914594 m!849407))

(declare-fun m!849513 () Bool)

(assert (=> b!914594 m!849513))

(assert (=> b!914596 m!849407))

(assert (=> b!914596 m!849407))

(assert (=> b!914596 m!849513))

(assert (=> bm!40481 d!112799))

(assert (=> b!914431 d!112723))

(declare-fun d!112801 () Bool)

(assert (=> d!112801 (= (apply!527 lt!411307 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13720 (getValueByKey!473 (toList!5614 lt!411307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25718 () Bool)

(assert (= bs!25718 d!112801))

(assert (=> bs!25718 m!849373))

(assert (=> bs!25718 m!849373))

(declare-fun m!849515 () Bool)

(assert (=> bs!25718 m!849515))

(assert (=> b!914403 d!112801))

(assert (=> b!914369 d!112723))

(assert (=> b!914404 d!112757))

(declare-fun d!112803 () Bool)

(assert (=> d!112803 (= (apply!527 lt!411281 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) (get!13720 (getValueByKey!473 (toList!5614 lt!411281) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25719 () Bool)

(assert (= bs!25719 d!112803))

(assert (=> bs!25719 m!849009))

(assert (=> bs!25719 m!849381))

(assert (=> bs!25719 m!849381))

(declare-fun m!849517 () Bool)

(assert (=> bs!25719 m!849517))

(assert (=> b!914370 d!112803))

(declare-fun d!112805 () Bool)

(declare-fun c!96188 () Bool)

(assert (=> d!112805 (= c!96188 ((_ is ValueCellFull!9092) (select (arr!26120 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!513105 () V!30495)

(assert (=> d!112805 (= (get!13719 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!513105)))

(declare-fun b!914597 () Bool)

(assert (=> b!914597 (= e!513105 (get!13721 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914598 () Bool)

(assert (=> b!914598 (= e!513105 (get!13722 (select (arr!26120 _values!1152) #b00000000000000000000000000000000) (dynLambda!1408 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112805 c!96188) b!914597))

(assert (= (and d!112805 (not c!96188)) b!914598))

(assert (=> b!914597 m!849061))

(assert (=> b!914597 m!849063))

(declare-fun m!849519 () Bool)

(assert (=> b!914597 m!849519))

(assert (=> b!914598 m!849061))

(assert (=> b!914598 m!849063))

(declare-fun m!849521 () Bool)

(assert (=> b!914598 m!849521))

(assert (=> b!914370 d!112805))

(assert (=> d!112669 d!112671))

(declare-fun d!112807 () Bool)

(declare-fun lt!411447 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!403 (List!18316) (InoxSet (_ BitVec 64)))

(assert (=> d!112807 (= lt!411447 (select (content!403 Nil!18313) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!513111 () Bool)

(assert (=> d!112807 (= lt!411447 e!513111)))

(declare-fun res!616620 () Bool)

(assert (=> d!112807 (=> (not res!616620) (not e!513111))))

(assert (=> d!112807 (= res!616620 ((_ is Cons!18312) Nil!18313))))

(assert (=> d!112807 (= (contains!4673 Nil!18313 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) lt!411447)))

(declare-fun b!914603 () Bool)

(declare-fun e!513110 () Bool)

(assert (=> b!914603 (= e!513111 e!513110)))

(declare-fun res!616621 () Bool)

(assert (=> b!914603 (=> res!616621 e!513110)))

(assert (=> b!914603 (= res!616621 (= (h!19464 Nil!18313) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914604 () Bool)

(assert (=> b!914604 (= e!513110 (contains!4673 (t!25899 Nil!18313) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112807 res!616620) b!914603))

(assert (= (and b!914603 (not res!616621)) b!914604))

(declare-fun m!849523 () Bool)

(assert (=> d!112807 m!849523))

(assert (=> d!112807 m!849009))

(declare-fun m!849525 () Bool)

(assert (=> d!112807 m!849525))

(assert (=> b!914604 m!849009))

(declare-fun m!849527 () Bool)

(assert (=> b!914604 m!849527))

(assert (=> b!914429 d!112807))

(assert (=> b!914416 d!112723))

(declare-fun d!112809 () Bool)

(assert (=> d!112809 (arrayContainsKey!0 _keys!1386 lt!411316 #b00000000000000000000000000000000)))

(declare-fun lt!411450 () Unit!30896)

(declare-fun choose!13 (array!54345 (_ BitVec 64) (_ BitVec 32)) Unit!30896)

(assert (=> d!112809 (= lt!411450 (choose!13 _keys!1386 lt!411316 #b00000000000000000000000000000000))))

(assert (=> d!112809 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411316 #b00000000000000000000000000000000) lt!411450)))

(declare-fun bs!25720 () Bool)

(assert (= bs!25720 d!112809))

(assert (=> bs!25720 m!849145))

(declare-fun m!849529 () Bool)

(assert (=> bs!25720 m!849529))

(assert (=> b!914417 d!112809))

(declare-fun d!112811 () Bool)

(declare-fun res!616622 () Bool)

(declare-fun e!513112 () Bool)

(assert (=> d!112811 (=> res!616622 e!513112)))

(assert (=> d!112811 (= res!616622 (= (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) lt!411316))))

(assert (=> d!112811 (= (arrayContainsKey!0 _keys!1386 lt!411316 #b00000000000000000000000000000000) e!513112)))

(declare-fun b!914605 () Bool)

(declare-fun e!513113 () Bool)

(assert (=> b!914605 (= e!513112 e!513113)))

(declare-fun res!616623 () Bool)

(assert (=> b!914605 (=> (not res!616623) (not e!513113))))

(assert (=> b!914605 (= res!616623 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26581 _keys!1386)))))

(declare-fun b!914606 () Bool)

(assert (=> b!914606 (= e!513113 (arrayContainsKey!0 _keys!1386 lt!411316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112811 (not res!616622)) b!914605))

(assert (= (and b!914605 res!616623) b!914606))

(assert (=> d!112811 m!849009))

(declare-fun m!849531 () Bool)

(assert (=> b!914606 m!849531))

(assert (=> b!914417 d!112811))

(declare-fun b!914619 () Bool)

(declare-fun e!513122 () SeekEntryResult!8923)

(declare-fun lt!411459 () SeekEntryResult!8923)

(assert (=> b!914619 (= e!513122 (MissingZero!8923 (index!38065 lt!411459)))))

(declare-fun b!914621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54345 (_ BitVec 32)) SeekEntryResult!8923)

(assert (=> b!914621 (= e!513122 (seekKeyOrZeroReturnVacant!0 (x!78106 lt!411459) (index!38065 lt!411459) (index!38065 lt!411459) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun b!914622 () Bool)

(declare-fun e!513121 () SeekEntryResult!8923)

(assert (=> b!914622 (= e!513121 (Found!8923 (index!38065 lt!411459)))))

(declare-fun b!914623 () Bool)

(declare-fun e!513120 () SeekEntryResult!8923)

(assert (=> b!914623 (= e!513120 Undefined!8923)))

(declare-fun b!914624 () Bool)

(assert (=> b!914624 (= e!513120 e!513121)))

(declare-fun lt!411457 () (_ BitVec 64))

(assert (=> b!914624 (= lt!411457 (select (arr!26121 _keys!1386) (index!38065 lt!411459)))))

(declare-fun c!96197 () Bool)

(assert (=> b!914624 (= c!96197 (= lt!411457 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112813 () Bool)

(declare-fun lt!411458 () SeekEntryResult!8923)

(assert (=> d!112813 (and (or ((_ is Undefined!8923) lt!411458) (not ((_ is Found!8923) lt!411458)) (and (bvsge (index!38064 lt!411458) #b00000000000000000000000000000000) (bvslt (index!38064 lt!411458) (size!26581 _keys!1386)))) (or ((_ is Undefined!8923) lt!411458) ((_ is Found!8923) lt!411458) (not ((_ is MissingZero!8923) lt!411458)) (and (bvsge (index!38063 lt!411458) #b00000000000000000000000000000000) (bvslt (index!38063 lt!411458) (size!26581 _keys!1386)))) (or ((_ is Undefined!8923) lt!411458) ((_ is Found!8923) lt!411458) ((_ is MissingZero!8923) lt!411458) (not ((_ is MissingVacant!8923) lt!411458)) (and (bvsge (index!38066 lt!411458) #b00000000000000000000000000000000) (bvslt (index!38066 lt!411458) (size!26581 _keys!1386)))) (or ((_ is Undefined!8923) lt!411458) (ite ((_ is Found!8923) lt!411458) (= (select (arr!26121 _keys!1386) (index!38064 lt!411458)) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8923) lt!411458) (= (select (arr!26121 _keys!1386) (index!38063 lt!411458)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8923) lt!411458) (= (select (arr!26121 _keys!1386) (index!38066 lt!411458)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!112813 (= lt!411458 e!513120)))

(declare-fun c!96195 () Bool)

(assert (=> d!112813 (= c!96195 (and ((_ is Intermediate!8923) lt!411459) (undefined!9735 lt!411459)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54345 (_ BitVec 32)) SeekEntryResult!8923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112813 (= lt!411459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112813 (validMask!0 mask!1756)))

(assert (=> d!112813 (= (seekEntryOrOpen!0 (select (arr!26121 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!411458)))

(declare-fun b!914620 () Bool)

(declare-fun c!96196 () Bool)

(assert (=> b!914620 (= c!96196 (= lt!411457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914620 (= e!513121 e!513122)))

(assert (= (and d!112813 c!96195) b!914623))

(assert (= (and d!112813 (not c!96195)) b!914624))

(assert (= (and b!914624 c!96197) b!914622))

(assert (= (and b!914624 (not c!96197)) b!914620))

(assert (= (and b!914620 c!96196) b!914619))

(assert (= (and b!914620 (not c!96196)) b!914621))

(assert (=> b!914621 m!849009))

(declare-fun m!849533 () Bool)

(assert (=> b!914621 m!849533))

(declare-fun m!849535 () Bool)

(assert (=> b!914624 m!849535))

(declare-fun m!849537 () Bool)

(assert (=> d!112813 m!849537))

(assert (=> d!112813 m!849009))

(declare-fun m!849539 () Bool)

(assert (=> d!112813 m!849539))

(assert (=> d!112813 m!849539))

(assert (=> d!112813 m!849009))

(declare-fun m!849541 () Bool)

(assert (=> d!112813 m!849541))

(declare-fun m!849543 () Bool)

(assert (=> d!112813 m!849543))

(assert (=> d!112813 m!848937))

(declare-fun m!849545 () Bool)

(assert (=> d!112813 m!849545))

(assert (=> b!914417 d!112813))

(declare-fun d!112815 () Bool)

(declare-fun e!513123 () Bool)

(assert (=> d!112815 e!513123))

(declare-fun res!616624 () Bool)

(assert (=> d!112815 (=> (not res!616624) (not e!513123))))

(declare-fun lt!411462 () ListLongMap!11197)

(assert (=> d!112815 (= res!616624 (contains!4670 lt!411462 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411463 () List!18315)

(assert (=> d!112815 (= lt!411462 (ListLongMap!11198 lt!411463))))

(declare-fun lt!411460 () Unit!30896)

(declare-fun lt!411461 () Unit!30896)

(assert (=> d!112815 (= lt!411460 lt!411461)))

(assert (=> d!112815 (= (getValueByKey!473 lt!411463 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112815 (= lt!411461 (lemmaContainsTupThenGetReturnValue!253 lt!411463 (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112815 (= lt!411463 (insertStrictlySorted!310 (toList!5614 call!40489) (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112815 (= (+!2618 call!40489 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411462)))

(declare-fun b!914625 () Bool)

(declare-fun res!616625 () Bool)

(assert (=> b!914625 (=> (not res!616625) (not e!513123))))

(assert (=> b!914625 (= res!616625 (= (getValueByKey!473 (toList!5614 lt!411462) (_1!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!478 (_2!6260 (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914626 () Bool)

(assert (=> b!914626 (= e!513123 (contains!4674 (toList!5614 lt!411462) (tuple2!12499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112815 res!616624) b!914625))

(assert (= (and b!914625 res!616625) b!914626))

(declare-fun m!849547 () Bool)

(assert (=> d!112815 m!849547))

(declare-fun m!849549 () Bool)

(assert (=> d!112815 m!849549))

(declare-fun m!849551 () Bool)

(assert (=> d!112815 m!849551))

(declare-fun m!849553 () Bool)

(assert (=> d!112815 m!849553))

(declare-fun m!849555 () Bool)

(assert (=> b!914625 m!849555))

(declare-fun m!849557 () Bool)

(assert (=> b!914626 m!849557))

(assert (=> b!914402 d!112815))

(declare-fun d!112817 () Bool)

(declare-fun e!513125 () Bool)

(assert (=> d!112817 e!513125))

(declare-fun res!616626 () Bool)

(assert (=> d!112817 (=> res!616626 e!513125)))

(declare-fun lt!411466 () Bool)

(assert (=> d!112817 (= res!616626 (not lt!411466))))

(declare-fun lt!411465 () Bool)

(assert (=> d!112817 (= lt!411466 lt!411465)))

(declare-fun lt!411467 () Unit!30896)

(declare-fun e!513124 () Unit!30896)

(assert (=> d!112817 (= lt!411467 e!513124)))

(declare-fun c!96198 () Bool)

(assert (=> d!112817 (= c!96198 lt!411465)))

(assert (=> d!112817 (= lt!411465 (containsKey!444 (toList!5614 lt!411281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112817 (= (contains!4670 lt!411281 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411466)))

(declare-fun b!914627 () Bool)

(declare-fun lt!411464 () Unit!30896)

(assert (=> b!914627 (= e!513124 lt!411464)))

(assert (=> b!914627 (= lt!411464 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5614 lt!411281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914627 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914628 () Bool)

(declare-fun Unit!30913 () Unit!30896)

(assert (=> b!914628 (= e!513124 Unit!30913)))

(declare-fun b!914629 () Bool)

(assert (=> b!914629 (= e!513125 (isDefined!346 (getValueByKey!473 (toList!5614 lt!411281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112817 c!96198) b!914627))

(assert (= (and d!112817 (not c!96198)) b!914628))

(assert (= (and d!112817 (not res!616626)) b!914629))

(declare-fun m!849559 () Bool)

(assert (=> d!112817 m!849559))

(declare-fun m!849561 () Bool)

(assert (=> b!914627 m!849561))

(assert (=> b!914627 m!849365))

(assert (=> b!914627 m!849365))

(declare-fun m!849563 () Bool)

(assert (=> b!914627 m!849563))

(assert (=> b!914629 m!849365))

(assert (=> b!914629 m!849365))

(assert (=> b!914629 m!849563))

(assert (=> bm!40480 d!112817))

(declare-fun condMapEmpty!30461 () Bool)

(declare-fun mapDefault!30461 () ValueCell!9092)

(assert (=> mapNonEmpty!30460 (= condMapEmpty!30461 (= mapRest!30460 ((as const (Array (_ BitVec 32) ValueCell!9092)) mapDefault!30461)))))

(declare-fun e!513126 () Bool)

(declare-fun mapRes!30461 () Bool)

(assert (=> mapNonEmpty!30460 (= tp!58483 (and e!513126 mapRes!30461))))

(declare-fun b!914630 () Bool)

(declare-fun e!513127 () Bool)

(assert (=> b!914630 (= e!513127 tp_is_empty!19147)))

(declare-fun b!914631 () Bool)

(assert (=> b!914631 (= e!513126 tp_is_empty!19147)))

(declare-fun mapNonEmpty!30461 () Bool)

(declare-fun tp!58484 () Bool)

(assert (=> mapNonEmpty!30461 (= mapRes!30461 (and tp!58484 e!513127))))

(declare-fun mapRest!30461 () (Array (_ BitVec 32) ValueCell!9092))

(declare-fun mapValue!30461 () ValueCell!9092)

(declare-fun mapKey!30461 () (_ BitVec 32))

(assert (=> mapNonEmpty!30461 (= mapRest!30460 (store mapRest!30461 mapKey!30461 mapValue!30461))))

(declare-fun mapIsEmpty!30461 () Bool)

(assert (=> mapIsEmpty!30461 mapRes!30461))

(assert (= (and mapNonEmpty!30460 condMapEmpty!30461) mapIsEmpty!30461))

(assert (= (and mapNonEmpty!30460 (not condMapEmpty!30461)) mapNonEmpty!30461))

(assert (= (and mapNonEmpty!30461 ((_ is ValueCellFull!9092) mapValue!30461)) b!914630))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9092) mapDefault!30461)) b!914631))

(declare-fun m!849565 () Bool)

(assert (=> mapNonEmpty!30461 m!849565))

(declare-fun b_lambda!13345 () Bool)

(assert (= b_lambda!13339 (or (and start!78426 b_free!16729) b_lambda!13345)))

(declare-fun b_lambda!13347 () Bool)

(assert (= b_lambda!13343 (or (and start!78426 b_free!16729) b_lambda!13347)))

(declare-fun b_lambda!13349 () Bool)

(assert (= b_lambda!13337 (or (and start!78426 b_free!16729) b_lambda!13349)))

(declare-fun b_lambda!13351 () Bool)

(assert (= b_lambda!13341 (or (and start!78426 b_free!16729) b_lambda!13351)))

(check-sat (not d!112711) (not d!112729) (not b!914519) (not d!112753) (not d!112789) (not b!914578) (not bm!40503) (not d!112751) (not d!112701) (not d!112783) (not b_lambda!13333) (not d!112697) (not mapNonEmpty!30461) (not d!112773) (not d!112709) (not b!914447) (not bm!40500) (not d!112713) (not b!914586) (not b!914544) (not d!112699) (not b!914511) (not b!914626) (not b!914535) (not d!112683) (not b!914488) (not b!914567) (not b_lambda!13351) (not b!914514) (not b!914528) (not b!914629) (not d!112749) (not b!914497) (not b!914526) (not d!112799) (not d!112771) (not b!914566) (not b!914452) (not d!112803) (not d!112815) (not d!112735) (not b!914604) (not b!914531) (not b!914551) (not b!914495) (not b!914534) (not d!112813) (not b!914625) (not d!112759) (not b!914557) (not d!112785) (not b!914548) (not d!112807) (not b!914594) (not b!914559) (not b_lambda!13349) (not d!112801) (not d!112715) (not b!914550) (not b!914558) (not b!914579) (not b!914570) (not b!914598) (not b!914584) (not b!914494) (not b!914445) (not b!914533) (not b!914539) tp_is_empty!19147 (not b!914461) (not d!112685) (not d!112765) (not b!914516) (not d!112817) (not d!112693) (not b!914449) (not b!914458) (not d!112705) (not b!914569) (not b!914593) (not b!914627) (not b!914591) (not b!914621) (not d!112739) (not d!112809) (not d!112769) (not d!112743) (not d!112793) (not b!914532) (not b!914523) (not b!914561) (not d!112795) (not b!914564) (not b_next!16729) (not d!112687) (not b_lambda!13345) (not d!112689) (not b!914552) (not d!112787) (not b!914498) (not d!112767) (not b!914524) (not b!914490) b_and!27333 (not b!914493) (not b!914457) (not b!914577) (not b_lambda!13347) (not b!914587) (not b!914590) (not b!914513) (not b!914597) (not d!112781) (not b!914496) (not d!112721) (not b!914583) (not b!914562) (not d!112777) (not b!914588) (not d!112741) (not b!914446) (not b!914596) (not b!914460) (not d!112691) (not b!914451) (not bm!40502) (not b!914517) (not d!112791) (not d!112719) (not b!914536) (not b!914515) (not d!112747) (not d!112707) (not d!112775) (not d!112703) (not b!914509) (not d!112779) (not b!914571) (not b!914582) (not d!112695) (not b!914606) (not d!112731) (not d!112761) (not b_lambda!13335) (not bm!40501))
(check-sat b_and!27333 (not b_next!16729))
