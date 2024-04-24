; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78250 () Bool)

(assert start!78250)

(declare-fun b_free!16609 () Bool)

(declare-fun b_next!16609 () Bool)

(assert (=> start!78250 (= b_free!16609 (not b_next!16609))))

(declare-fun tp!58099 () Bool)

(declare-fun b_and!27191 () Bool)

(assert (=> start!78250 (= tp!58099 b_and!27191)))

(declare-fun res!615264 () Bool)

(declare-fun e!511736 () Bool)

(assert (=> start!78250 (=> (not res!615264) (not e!511736))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78250 (= res!615264 (validMask!0 mask!1756))))

(assert (=> start!78250 e!511736))

(declare-datatypes ((V!30335 0))(
  ( (V!30336 (val!9564 Int)) )
))
(declare-datatypes ((ValueCell!9032 0))(
  ( (ValueCellFull!9032 (v!12070 V!30335)) (EmptyCell!9032) )
))
(declare-datatypes ((array!54117 0))(
  ( (array!54118 (arr!26010 (Array (_ BitVec 32) ValueCell!9032)) (size!26470 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54117)

(declare-fun e!511733 () Bool)

(declare-fun array_inv!20408 (array!54117) Bool)

(assert (=> start!78250 (and (array_inv!20408 _values!1152) e!511733)))

(assert (=> start!78250 tp!58099))

(assert (=> start!78250 true))

(declare-fun tp_is_empty!19027 () Bool)

(assert (=> start!78250 tp_is_empty!19027))

(declare-datatypes ((array!54119 0))(
  ( (array!54120 (arr!26011 (Array (_ BitVec 32) (_ BitVec 64))) (size!26471 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54119)

(declare-fun array_inv!20409 (array!54119) Bool)

(assert (=> start!78250 (array_inv!20409 _keys!1386)))

(declare-fun b!912316 () Bool)

(declare-fun res!615268 () Bool)

(assert (=> b!912316 (=> (not res!615268) (not e!511736))))

(declare-datatypes ((List!18243 0))(
  ( (Nil!18240) (Cons!18239 (h!19391 (_ BitVec 64)) (t!25820 List!18243)) )
))
(declare-fun arrayNoDuplicates!0 (array!54119 (_ BitVec 32) List!18243) Bool)

(assert (=> b!912316 (= res!615268 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18240))))

(declare-fun b!912317 () Bool)

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912317 (= e!511736 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26471 _keys!1386))))))

(declare-fun b!912318 () Bool)

(declare-fun res!615265 () Bool)

(assert (=> b!912318 (=> (not res!615265) (not e!511736))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30335)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30335)

(declare-datatypes ((tuple2!12424 0))(
  ( (tuple2!12425 (_1!6223 (_ BitVec 64)) (_2!6223 V!30335)) )
))
(declare-datatypes ((List!18244 0))(
  ( (Nil!18241) (Cons!18240 (h!19392 tuple2!12424) (t!25821 List!18244)) )
))
(declare-datatypes ((ListLongMap!11123 0))(
  ( (ListLongMap!11124 (toList!5577 List!18244)) )
))
(declare-fun contains!4630 (ListLongMap!11123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2838 (array!54119 array!54117 (_ BitVec 32) (_ BitVec 32) V!30335 V!30335 (_ BitVec 32) Int) ListLongMap!11123)

(assert (=> b!912318 (= res!615265 (contains!4630 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912319 () Bool)

(declare-fun res!615269 () Bool)

(assert (=> b!912319 (=> (not res!615269) (not e!511736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54119 (_ BitVec 32)) Bool)

(assert (=> b!912319 (= res!615269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912320 () Bool)

(declare-fun res!615266 () Bool)

(assert (=> b!912320 (=> (not res!615266) (not e!511736))))

(assert (=> b!912320 (= res!615266 (and (= (size!26470 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26471 _keys!1386) (size!26470 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912321 () Bool)

(declare-fun e!511735 () Bool)

(declare-fun mapRes!30262 () Bool)

(assert (=> b!912321 (= e!511733 (and e!511735 mapRes!30262))))

(declare-fun condMapEmpty!30262 () Bool)

(declare-fun mapDefault!30262 () ValueCell!9032)

(assert (=> b!912321 (= condMapEmpty!30262 (= (arr!26010 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9032)) mapDefault!30262)))))

(declare-fun mapNonEmpty!30262 () Bool)

(declare-fun tp!58098 () Bool)

(declare-fun e!511737 () Bool)

(assert (=> mapNonEmpty!30262 (= mapRes!30262 (and tp!58098 e!511737))))

(declare-fun mapRest!30262 () (Array (_ BitVec 32) ValueCell!9032))

(declare-fun mapValue!30262 () ValueCell!9032)

(declare-fun mapKey!30262 () (_ BitVec 32))

(assert (=> mapNonEmpty!30262 (= (arr!26010 _values!1152) (store mapRest!30262 mapKey!30262 mapValue!30262))))

(declare-fun b!912322 () Bool)

(assert (=> b!912322 (= e!511737 tp_is_empty!19027)))

(declare-fun b!912323 () Bool)

(declare-fun res!615267 () Bool)

(assert (=> b!912323 (=> (not res!615267) (not e!511736))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912323 (= res!615267 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30262 () Bool)

(assert (=> mapIsEmpty!30262 mapRes!30262))

(declare-fun b!912324 () Bool)

(assert (=> b!912324 (= e!511735 tp_is_empty!19027)))

(assert (= (and start!78250 res!615264) b!912320))

(assert (= (and b!912320 res!615266) b!912319))

(assert (= (and b!912319 res!615269) b!912316))

(assert (= (and b!912316 res!615268) b!912318))

(assert (= (and b!912318 res!615265) b!912323))

(assert (= (and b!912323 res!615267) b!912317))

(assert (= (and b!912321 condMapEmpty!30262) mapIsEmpty!30262))

(assert (= (and b!912321 (not condMapEmpty!30262)) mapNonEmpty!30262))

(get-info :version)

(assert (= (and mapNonEmpty!30262 ((_ is ValueCellFull!9032) mapValue!30262)) b!912322))

(assert (= (and b!912321 ((_ is ValueCellFull!9032) mapDefault!30262)) b!912324))

(assert (= start!78250 b!912321))

(declare-fun m!847471 () Bool)

(assert (=> mapNonEmpty!30262 m!847471))

(declare-fun m!847473 () Bool)

(assert (=> start!78250 m!847473))

(declare-fun m!847475 () Bool)

(assert (=> start!78250 m!847475))

(declare-fun m!847477 () Bool)

(assert (=> start!78250 m!847477))

(declare-fun m!847479 () Bool)

(assert (=> b!912316 m!847479))

(declare-fun m!847481 () Bool)

(assert (=> b!912318 m!847481))

(assert (=> b!912318 m!847481))

(declare-fun m!847483 () Bool)

(assert (=> b!912318 m!847483))

(declare-fun m!847485 () Bool)

(assert (=> b!912323 m!847485))

(declare-fun m!847487 () Bool)

(assert (=> b!912319 m!847487))

(check-sat (not b!912323) (not mapNonEmpty!30262) (not b_next!16609) (not b!912318) b_and!27191 tp_is_empty!19027 (not b!912316) (not b!912319) (not start!78250))
(check-sat b_and!27191 (not b_next!16609))
(get-model)

(declare-fun d!112563 () Bool)

(declare-fun res!615310 () Bool)

(declare-fun e!511774 () Bool)

(assert (=> d!112563 (=> res!615310 e!511774)))

(assert (=> d!112563 (= res!615310 (bvsge #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(assert (=> d!112563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511774)))

(declare-fun bm!40385 () Bool)

(declare-fun call!40388 () Bool)

(assert (=> bm!40385 (= call!40388 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!912387 () Bool)

(declare-fun e!511775 () Bool)

(assert (=> b!912387 (= e!511775 call!40388)))

(declare-fun b!912388 () Bool)

(assert (=> b!912388 (= e!511774 e!511775)))

(declare-fun c!96027 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!912388 (= c!96027 (validKeyInArray!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912389 () Bool)

(declare-fun e!511776 () Bool)

(assert (=> b!912389 (= e!511776 call!40388)))

(declare-fun b!912390 () Bool)

(assert (=> b!912390 (= e!511775 e!511776)))

(declare-fun lt!410762 () (_ BitVec 64))

(assert (=> b!912390 (= lt!410762 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30856 0))(
  ( (Unit!30857) )
))
(declare-fun lt!410761 () Unit!30856)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54119 (_ BitVec 64) (_ BitVec 32)) Unit!30856)

(assert (=> b!912390 (= lt!410761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410762 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912390 (arrayContainsKey!0 _keys!1386 lt!410762 #b00000000000000000000000000000000)))

(declare-fun lt!410763 () Unit!30856)

(assert (=> b!912390 (= lt!410763 lt!410761)))

(declare-fun res!615311 () Bool)

(declare-datatypes ((SeekEntryResult!8920 0))(
  ( (MissingZero!8920 (index!38051 (_ BitVec 32))) (Found!8920 (index!38052 (_ BitVec 32))) (Intermediate!8920 (undefined!9732 Bool) (index!38053 (_ BitVec 32)) (x!77913 (_ BitVec 32))) (Undefined!8920) (MissingVacant!8920 (index!38054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54119 (_ BitVec 32)) SeekEntryResult!8920)

(assert (=> b!912390 (= res!615311 (= (seekEntryOrOpen!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8920 #b00000000000000000000000000000000)))))

(assert (=> b!912390 (=> (not res!615311) (not e!511776))))

(assert (= (and d!112563 (not res!615310)) b!912388))

(assert (= (and b!912388 c!96027) b!912390))

(assert (= (and b!912388 (not c!96027)) b!912387))

(assert (= (and b!912390 res!615311) b!912389))

(assert (= (or b!912389 b!912387) bm!40385))

(declare-fun m!847525 () Bool)

(assert (=> bm!40385 m!847525))

(declare-fun m!847527 () Bool)

(assert (=> b!912388 m!847527))

(assert (=> b!912388 m!847527))

(declare-fun m!847529 () Bool)

(assert (=> b!912388 m!847529))

(assert (=> b!912390 m!847527))

(declare-fun m!847531 () Bool)

(assert (=> b!912390 m!847531))

(declare-fun m!847533 () Bool)

(assert (=> b!912390 m!847533))

(assert (=> b!912390 m!847527))

(declare-fun m!847535 () Bool)

(assert (=> b!912390 m!847535))

(assert (=> b!912319 d!112563))

(declare-fun d!112565 () Bool)

(assert (=> d!112565 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!912323 d!112565))

(declare-fun d!112567 () Bool)

(declare-fun e!511781 () Bool)

(assert (=> d!112567 e!511781))

(declare-fun res!615314 () Bool)

(assert (=> d!112567 (=> res!615314 e!511781)))

(declare-fun lt!410772 () Bool)

(assert (=> d!112567 (= res!615314 (not lt!410772))))

(declare-fun lt!410774 () Bool)

(assert (=> d!112567 (= lt!410772 lt!410774)))

(declare-fun lt!410775 () Unit!30856)

(declare-fun e!511782 () Unit!30856)

(assert (=> d!112567 (= lt!410775 e!511782)))

(declare-fun c!96030 () Bool)

(assert (=> d!112567 (= c!96030 lt!410774)))

(declare-fun containsKey!441 (List!18244 (_ BitVec 64)) Bool)

(assert (=> d!112567 (= lt!410774 (containsKey!441 (toList!5577 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112567 (= (contains!4630 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410772)))

(declare-fun b!912397 () Bool)

(declare-fun lt!410773 () Unit!30856)

(assert (=> b!912397 (= e!511782 lt!410773)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!335 (List!18244 (_ BitVec 64)) Unit!30856)

(assert (=> b!912397 (= lt!410773 (lemmaContainsKeyImpliesGetValueByKeyDefined!335 (toList!5577 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!476 0))(
  ( (Some!475 (v!12073 V!30335)) (None!474) )
))
(declare-fun isDefined!343 (Option!476) Bool)

(declare-fun getValueByKey!470 (List!18244 (_ BitVec 64)) Option!476)

(assert (=> b!912397 (isDefined!343 (getValueByKey!470 (toList!5577 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!912398 () Bool)

(declare-fun Unit!30858 () Unit!30856)

(assert (=> b!912398 (= e!511782 Unit!30858)))

(declare-fun b!912399 () Bool)

(assert (=> b!912399 (= e!511781 (isDefined!343 (getValueByKey!470 (toList!5577 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112567 c!96030) b!912397))

(assert (= (and d!112567 (not c!96030)) b!912398))

(assert (= (and d!112567 (not res!615314)) b!912399))

(declare-fun m!847537 () Bool)

(assert (=> d!112567 m!847537))

(declare-fun m!847539 () Bool)

(assert (=> b!912397 m!847539))

(declare-fun m!847541 () Bool)

(assert (=> b!912397 m!847541))

(assert (=> b!912397 m!847541))

(declare-fun m!847543 () Bool)

(assert (=> b!912397 m!847543))

(assert (=> b!912399 m!847541))

(assert (=> b!912399 m!847541))

(assert (=> b!912399 m!847543))

(assert (=> b!912318 d!112567))

(declare-fun b!912442 () Bool)

(declare-fun res!615340 () Bool)

(declare-fun e!511810 () Bool)

(assert (=> b!912442 (=> (not res!615340) (not e!511810))))

(declare-fun e!511812 () Bool)

(assert (=> b!912442 (= res!615340 e!511812)))

(declare-fun c!96047 () Bool)

(assert (=> b!912442 (= c!96047 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!40405 () ListLongMap!11123)

(declare-fun bm!40400 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3336 (array!54119 array!54117 (_ BitVec 32) (_ BitVec 32) V!30335 V!30335 (_ BitVec 32) Int) ListLongMap!11123)

(assert (=> bm!40400 (= call!40405 (getCurrentListMapNoExtraKeys!3336 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!912443 () Bool)

(declare-fun e!511818 () Bool)

(assert (=> b!912443 (= e!511818 (validKeyInArray!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912444 () Bool)

(declare-fun e!511817 () Unit!30856)

(declare-fun Unit!30859 () Unit!30856)

(assert (=> b!912444 (= e!511817 Unit!30859)))

(declare-fun bm!40401 () Bool)

(declare-fun call!40406 () Bool)

(declare-fun lt!410821 () ListLongMap!11123)

(assert (=> bm!40401 (= call!40406 (contains!4630 lt!410821 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!912445 () Bool)

(declare-fun lt!410823 () Unit!30856)

(assert (=> b!912445 (= e!511817 lt!410823)))

(declare-fun lt!410824 () ListLongMap!11123)

(assert (=> b!912445 (= lt!410824 (getCurrentListMapNoExtraKeys!3336 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410839 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410837 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410837 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410832 () Unit!30856)

(declare-fun addStillContains!346 (ListLongMap!11123 (_ BitVec 64) V!30335 (_ BitVec 64)) Unit!30856)

(assert (=> b!912445 (= lt!410832 (addStillContains!346 lt!410824 lt!410839 zeroValue!1094 lt!410837))))

(declare-fun +!2615 (ListLongMap!11123 tuple2!12424) ListLongMap!11123)

(assert (=> b!912445 (contains!4630 (+!2615 lt!410824 (tuple2!12425 lt!410839 zeroValue!1094)) lt!410837)))

(declare-fun lt!410838 () Unit!30856)

(assert (=> b!912445 (= lt!410838 lt!410832)))

(declare-fun lt!410828 () ListLongMap!11123)

(assert (=> b!912445 (= lt!410828 (getCurrentListMapNoExtraKeys!3336 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410826 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410827 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410827 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410841 () Unit!30856)

(declare-fun addApplyDifferent!346 (ListLongMap!11123 (_ BitVec 64) V!30335 (_ BitVec 64)) Unit!30856)

(assert (=> b!912445 (= lt!410841 (addApplyDifferent!346 lt!410828 lt!410826 minValue!1094 lt!410827))))

(declare-fun apply!524 (ListLongMap!11123 (_ BitVec 64)) V!30335)

(assert (=> b!912445 (= (apply!524 (+!2615 lt!410828 (tuple2!12425 lt!410826 minValue!1094)) lt!410827) (apply!524 lt!410828 lt!410827))))

(declare-fun lt!410831 () Unit!30856)

(assert (=> b!912445 (= lt!410831 lt!410841)))

(declare-fun lt!410836 () ListLongMap!11123)

(assert (=> b!912445 (= lt!410836 (getCurrentListMapNoExtraKeys!3336 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410829 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410833 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410833 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410820 () Unit!30856)

(assert (=> b!912445 (= lt!410820 (addApplyDifferent!346 lt!410836 lt!410829 zeroValue!1094 lt!410833))))

(assert (=> b!912445 (= (apply!524 (+!2615 lt!410836 (tuple2!12425 lt!410829 zeroValue!1094)) lt!410833) (apply!524 lt!410836 lt!410833))))

(declare-fun lt!410825 () Unit!30856)

(assert (=> b!912445 (= lt!410825 lt!410820)))

(declare-fun lt!410822 () ListLongMap!11123)

(assert (=> b!912445 (= lt!410822 (getCurrentListMapNoExtraKeys!3336 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410835 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410840 () (_ BitVec 64))

(assert (=> b!912445 (= lt!410840 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!912445 (= lt!410823 (addApplyDifferent!346 lt!410822 lt!410835 minValue!1094 lt!410840))))

(assert (=> b!912445 (= (apply!524 (+!2615 lt!410822 (tuple2!12425 lt!410835 minValue!1094)) lt!410840) (apply!524 lt!410822 lt!410840))))

(declare-fun b!912446 () Bool)

(declare-fun e!511811 () Bool)

(assert (=> b!912446 (= e!511811 (validKeyInArray!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912447 () Bool)

(declare-fun e!511813 () ListLongMap!11123)

(declare-fun call!40404 () ListLongMap!11123)

(assert (=> b!912447 (= e!511813 call!40404)))

(declare-fun b!912448 () Bool)

(declare-fun e!511814 () Bool)

(declare-fun get!13676 (ValueCell!9032 V!30335) V!30335)

(declare-fun dynLambda!1405 (Int (_ BitVec 64)) V!30335)

(assert (=> b!912448 (= e!511814 (= (apply!524 lt!410821 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)) (get!13676 (select (arr!26010 _values!1152) #b00000000000000000000000000000000) (dynLambda!1405 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!912448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26470 _values!1152)))))

(assert (=> b!912448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(declare-fun b!912449 () Bool)

(declare-fun e!511815 () ListLongMap!11123)

(assert (=> b!912449 (= e!511815 call!40404)))

(declare-fun b!912450 () Bool)

(declare-fun c!96043 () Bool)

(assert (=> b!912450 (= c!96043 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!912450 (= e!511813 e!511815)))

(declare-fun bm!40402 () Bool)

(declare-fun call!40403 () ListLongMap!11123)

(assert (=> bm!40402 (= call!40404 call!40403)))

(declare-fun b!912451 () Bool)

(declare-fun e!511821 () Bool)

(assert (=> b!912451 (= e!511821 e!511814)))

(declare-fun res!615341 () Bool)

(assert (=> b!912451 (=> (not res!615341) (not e!511814))))

(assert (=> b!912451 (= res!615341 (contains!4630 lt!410821 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!912451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(declare-fun call!40408 () ListLongMap!11123)

(declare-fun c!96045 () Bool)

(declare-fun call!40407 () ListLongMap!11123)

(declare-fun bm!40403 () Bool)

(declare-fun c!96044 () Bool)

(assert (=> bm!40403 (= call!40403 (+!2615 (ite c!96044 call!40405 (ite c!96045 call!40407 call!40408)) (ite (or c!96044 c!96045) (tuple2!12425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!912452 () Bool)

(declare-fun e!511819 () Bool)

(declare-fun e!511809 () Bool)

(assert (=> b!912452 (= e!511819 e!511809)))

(declare-fun res!615333 () Bool)

(assert (=> b!912452 (= res!615333 call!40406)))

(assert (=> b!912452 (=> (not res!615333) (not e!511809))))

(declare-fun b!912453 () Bool)

(declare-fun e!511816 () Bool)

(assert (=> b!912453 (= e!511816 (= (apply!524 lt!410821 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun d!112569 () Bool)

(assert (=> d!112569 e!511810))

(declare-fun res!615337 () Bool)

(assert (=> d!112569 (=> (not res!615337) (not e!511810))))

(assert (=> d!112569 (= res!615337 (or (bvsge #b00000000000000000000000000000000 (size!26471 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26471 _keys!1386)))))))

(declare-fun lt!410834 () ListLongMap!11123)

(assert (=> d!112569 (= lt!410821 lt!410834)))

(declare-fun lt!410830 () Unit!30856)

(assert (=> d!112569 (= lt!410830 e!511817)))

(declare-fun c!96046 () Bool)

(assert (=> d!112569 (= c!96046 e!511818)))

(declare-fun res!615339 () Bool)

(assert (=> d!112569 (=> (not res!615339) (not e!511818))))

(assert (=> d!112569 (= res!615339 (bvslt #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(declare-fun e!511820 () ListLongMap!11123)

(assert (=> d!112569 (= lt!410834 e!511820)))

(assert (=> d!112569 (= c!96044 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112569 (validMask!0 mask!1756)))

(assert (=> d!112569 (= (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410821)))

(declare-fun b!912454 () Bool)

(assert (=> b!912454 (= e!511820 e!511813)))

(assert (=> b!912454 (= c!96045 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!912455 () Bool)

(declare-fun call!40409 () Bool)

(assert (=> b!912455 (= e!511812 (not call!40409))))

(declare-fun b!912456 () Bool)

(assert (=> b!912456 (= e!511810 e!511819)))

(declare-fun c!96048 () Bool)

(assert (=> b!912456 (= c!96048 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40404 () Bool)

(assert (=> bm!40404 (= call!40408 call!40407)))

(declare-fun bm!40405 () Bool)

(assert (=> bm!40405 (= call!40409 (contains!4630 lt!410821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!912457 () Bool)

(assert (=> b!912457 (= e!511815 call!40408)))

(declare-fun bm!40406 () Bool)

(assert (=> bm!40406 (= call!40407 call!40405)))

(declare-fun b!912458 () Bool)

(declare-fun res!615338 () Bool)

(assert (=> b!912458 (=> (not res!615338) (not e!511810))))

(assert (=> b!912458 (= res!615338 e!511821)))

(declare-fun res!615336 () Bool)

(assert (=> b!912458 (=> res!615336 e!511821)))

(assert (=> b!912458 (= res!615336 (not e!511811))))

(declare-fun res!615334 () Bool)

(assert (=> b!912458 (=> (not res!615334) (not e!511811))))

(assert (=> b!912458 (= res!615334 (bvslt #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(declare-fun b!912459 () Bool)

(assert (=> b!912459 (= e!511812 e!511816)))

(declare-fun res!615335 () Bool)

(assert (=> b!912459 (= res!615335 call!40409)))

(assert (=> b!912459 (=> (not res!615335) (not e!511816))))

(declare-fun b!912460 () Bool)

(assert (=> b!912460 (= e!511809 (= (apply!524 lt!410821 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!912461 () Bool)

(assert (=> b!912461 (= e!511819 (not call!40406))))

(declare-fun b!912462 () Bool)

(assert (=> b!912462 (= e!511820 (+!2615 call!40403 (tuple2!12425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112569 c!96044) b!912462))

(assert (= (and d!112569 (not c!96044)) b!912454))

(assert (= (and b!912454 c!96045) b!912447))

(assert (= (and b!912454 (not c!96045)) b!912450))

(assert (= (and b!912450 c!96043) b!912449))

(assert (= (and b!912450 (not c!96043)) b!912457))

(assert (= (or b!912449 b!912457) bm!40404))

(assert (= (or b!912447 bm!40404) bm!40406))

(assert (= (or b!912447 b!912449) bm!40402))

(assert (= (or b!912462 bm!40406) bm!40400))

(assert (= (or b!912462 bm!40402) bm!40403))

(assert (= (and d!112569 res!615339) b!912443))

(assert (= (and d!112569 c!96046) b!912445))

(assert (= (and d!112569 (not c!96046)) b!912444))

(assert (= (and d!112569 res!615337) b!912458))

(assert (= (and b!912458 res!615334) b!912446))

(assert (= (and b!912458 (not res!615336)) b!912451))

(assert (= (and b!912451 res!615341) b!912448))

(assert (= (and b!912458 res!615338) b!912442))

(assert (= (and b!912442 c!96047) b!912459))

(assert (= (and b!912442 (not c!96047)) b!912455))

(assert (= (and b!912459 res!615335) b!912453))

(assert (= (or b!912459 b!912455) bm!40405))

(assert (= (and b!912442 res!615340) b!912456))

(assert (= (and b!912456 c!96048) b!912452))

(assert (= (and b!912456 (not c!96048)) b!912461))

(assert (= (and b!912452 res!615333) b!912460))

(assert (= (or b!912452 b!912461) bm!40401))

(declare-fun b_lambda!13317 () Bool)

(assert (=> (not b_lambda!13317) (not b!912448)))

(declare-fun t!25826 () Bool)

(declare-fun tb!5429 () Bool)

(assert (=> (and start!78250 (= defaultEntry!1160 defaultEntry!1160) t!25826) tb!5429))

(declare-fun result!10667 () Bool)

(assert (=> tb!5429 (= result!10667 tp_is_empty!19027)))

(assert (=> b!912448 t!25826))

(declare-fun b_and!27197 () Bool)

(assert (= b_and!27191 (and (=> t!25826 result!10667) b_and!27197)))

(declare-fun m!847545 () Bool)

(assert (=> bm!40403 m!847545))

(assert (=> b!912446 m!847527))

(assert (=> b!912446 m!847527))

(assert (=> b!912446 m!847529))

(assert (=> b!912443 m!847527))

(assert (=> b!912443 m!847527))

(assert (=> b!912443 m!847529))

(declare-fun m!847547 () Bool)

(assert (=> b!912460 m!847547))

(assert (=> d!112569 m!847473))

(declare-fun m!847549 () Bool)

(assert (=> b!912453 m!847549))

(assert (=> b!912448 m!847527))

(declare-fun m!847551 () Bool)

(assert (=> b!912448 m!847551))

(assert (=> b!912448 m!847551))

(declare-fun m!847553 () Bool)

(assert (=> b!912448 m!847553))

(declare-fun m!847555 () Bool)

(assert (=> b!912448 m!847555))

(assert (=> b!912448 m!847553))

(assert (=> b!912448 m!847527))

(declare-fun m!847557 () Bool)

(assert (=> b!912448 m!847557))

(declare-fun m!847559 () Bool)

(assert (=> bm!40400 m!847559))

(declare-fun m!847561 () Bool)

(assert (=> bm!40405 m!847561))

(declare-fun m!847563 () Bool)

(assert (=> b!912445 m!847563))

(declare-fun m!847565 () Bool)

(assert (=> b!912445 m!847565))

(declare-fun m!847567 () Bool)

(assert (=> b!912445 m!847567))

(assert (=> b!912445 m!847559))

(declare-fun m!847569 () Bool)

(assert (=> b!912445 m!847569))

(declare-fun m!847571 () Bool)

(assert (=> b!912445 m!847571))

(assert (=> b!912445 m!847571))

(declare-fun m!847573 () Bool)

(assert (=> b!912445 m!847573))

(assert (=> b!912445 m!847569))

(declare-fun m!847575 () Bool)

(assert (=> b!912445 m!847575))

(declare-fun m!847577 () Bool)

(assert (=> b!912445 m!847577))

(declare-fun m!847579 () Bool)

(assert (=> b!912445 m!847579))

(declare-fun m!847581 () Bool)

(assert (=> b!912445 m!847581))

(declare-fun m!847583 () Bool)

(assert (=> b!912445 m!847583))

(assert (=> b!912445 m!847527))

(declare-fun m!847585 () Bool)

(assert (=> b!912445 m!847585))

(assert (=> b!912445 m!847581))

(declare-fun m!847587 () Bool)

(assert (=> b!912445 m!847587))

(assert (=> b!912445 m!847563))

(declare-fun m!847589 () Bool)

(assert (=> b!912445 m!847589))

(declare-fun m!847591 () Bool)

(assert (=> b!912445 m!847591))

(assert (=> b!912451 m!847527))

(assert (=> b!912451 m!847527))

(declare-fun m!847593 () Bool)

(assert (=> b!912451 m!847593))

(declare-fun m!847595 () Bool)

(assert (=> bm!40401 m!847595))

(declare-fun m!847597 () Bool)

(assert (=> b!912462 m!847597))

(assert (=> b!912318 d!112569))

(declare-fun d!112571 () Bool)

(declare-fun res!615348 () Bool)

(declare-fun e!511832 () Bool)

(assert (=> d!112571 (=> res!615348 e!511832)))

(assert (=> d!112571 (= res!615348 (bvsge #b00000000000000000000000000000000 (size!26471 _keys!1386)))))

(assert (=> d!112571 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18240) e!511832)))

(declare-fun b!912475 () Bool)

(declare-fun e!511833 () Bool)

(declare-fun contains!4632 (List!18243 (_ BitVec 64)) Bool)

(assert (=> b!912475 (= e!511833 (contains!4632 Nil!18240 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40409 () Bool)

(declare-fun call!40412 () Bool)

(declare-fun c!96051 () Bool)

(assert (=> bm!40409 (= call!40412 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96051 (Cons!18239 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000) Nil!18240) Nil!18240)))))

(declare-fun b!912476 () Bool)

(declare-fun e!511830 () Bool)

(assert (=> b!912476 (= e!511830 call!40412)))

(declare-fun b!912477 () Bool)

(declare-fun e!511831 () Bool)

(assert (=> b!912477 (= e!511831 e!511830)))

(assert (=> b!912477 (= c!96051 (validKeyInArray!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912478 () Bool)

(assert (=> b!912478 (= e!511830 call!40412)))

(declare-fun b!912479 () Bool)

(assert (=> b!912479 (= e!511832 e!511831)))

(declare-fun res!615350 () Bool)

(assert (=> b!912479 (=> (not res!615350) (not e!511831))))

(assert (=> b!912479 (= res!615350 (not e!511833))))

(declare-fun res!615349 () Bool)

(assert (=> b!912479 (=> (not res!615349) (not e!511833))))

(assert (=> b!912479 (= res!615349 (validKeyInArray!0 (select (arr!26011 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112571 (not res!615348)) b!912479))

(assert (= (and b!912479 res!615349) b!912475))

(assert (= (and b!912479 res!615350) b!912477))

(assert (= (and b!912477 c!96051) b!912476))

(assert (= (and b!912477 (not c!96051)) b!912478))

(assert (= (or b!912476 b!912478) bm!40409))

(assert (=> b!912475 m!847527))

(assert (=> b!912475 m!847527))

(declare-fun m!847599 () Bool)

(assert (=> b!912475 m!847599))

(assert (=> bm!40409 m!847527))

(declare-fun m!847601 () Bool)

(assert (=> bm!40409 m!847601))

(assert (=> b!912477 m!847527))

(assert (=> b!912477 m!847527))

(assert (=> b!912477 m!847529))

(assert (=> b!912479 m!847527))

(assert (=> b!912479 m!847527))

(assert (=> b!912479 m!847529))

(assert (=> b!912316 d!112571))

(declare-fun d!112573 () Bool)

(assert (=> d!112573 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78250 d!112573))

(declare-fun d!112575 () Bool)

(assert (=> d!112575 (= (array_inv!20408 _values!1152) (bvsge (size!26470 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78250 d!112575))

(declare-fun d!112577 () Bool)

(assert (=> d!112577 (= (array_inv!20409 _keys!1386) (bvsge (size!26471 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78250 d!112577))

(declare-fun condMapEmpty!30271 () Bool)

(declare-fun mapDefault!30271 () ValueCell!9032)

(assert (=> mapNonEmpty!30262 (= condMapEmpty!30271 (= mapRest!30262 ((as const (Array (_ BitVec 32) ValueCell!9032)) mapDefault!30271)))))

(declare-fun e!511839 () Bool)

(declare-fun mapRes!30271 () Bool)

(assert (=> mapNonEmpty!30262 (= tp!58098 (and e!511839 mapRes!30271))))

(declare-fun b!912486 () Bool)

(declare-fun e!511838 () Bool)

(assert (=> b!912486 (= e!511838 tp_is_empty!19027)))

(declare-fun mapIsEmpty!30271 () Bool)

(assert (=> mapIsEmpty!30271 mapRes!30271))

(declare-fun b!912487 () Bool)

(assert (=> b!912487 (= e!511839 tp_is_empty!19027)))

(declare-fun mapNonEmpty!30271 () Bool)

(declare-fun tp!58114 () Bool)

(assert (=> mapNonEmpty!30271 (= mapRes!30271 (and tp!58114 e!511838))))

(declare-fun mapValue!30271 () ValueCell!9032)

(declare-fun mapRest!30271 () (Array (_ BitVec 32) ValueCell!9032))

(declare-fun mapKey!30271 () (_ BitVec 32))

(assert (=> mapNonEmpty!30271 (= mapRest!30262 (store mapRest!30271 mapKey!30271 mapValue!30271))))

(assert (= (and mapNonEmpty!30262 condMapEmpty!30271) mapIsEmpty!30271))

(assert (= (and mapNonEmpty!30262 (not condMapEmpty!30271)) mapNonEmpty!30271))

(assert (= (and mapNonEmpty!30271 ((_ is ValueCellFull!9032) mapValue!30271)) b!912486))

(assert (= (and mapNonEmpty!30262 ((_ is ValueCellFull!9032) mapDefault!30271)) b!912487))

(declare-fun m!847603 () Bool)

(assert (=> mapNonEmpty!30271 m!847603))

(declare-fun b_lambda!13319 () Bool)

(assert (= b_lambda!13317 (or (and start!78250 b_free!16609) b_lambda!13319)))

(check-sat (not b!912446) (not b!912399) (not b!912448) (not d!112567) (not b!912390) (not b!912397) (not b_next!16609) b_and!27197 (not b!912388) tp_is_empty!19027 (not b!912475) (not b!912460) (not bm!40385) (not bm!40401) (not bm!40409) (not b_lambda!13319) (not b!912443) (not bm!40400) (not b!912451) (not b!912479) (not b!912462) (not bm!40403) (not b!912445) (not b!912453) (not mapNonEmpty!30271) (not d!112569) (not bm!40405) (not b!912477))
(check-sat b_and!27197 (not b_next!16609))
