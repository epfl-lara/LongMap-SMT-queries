; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42636 () Bool)

(assert start!42636)

(declare-fun b_free!12055 () Bool)

(declare-fun b_next!12055 () Bool)

(assert (=> start!42636 (= b_free!12055 (not b_next!12055))))

(declare-fun tp!42210 () Bool)

(declare-fun b_and!20529 () Bool)

(assert (=> start!42636 (= tp!42210 b_and!20529)))

(declare-fun b!475475 () Bool)

(declare-fun e!279209 () Bool)

(declare-fun tp_is_empty!13483 () Bool)

(assert (=> b!475475 (= e!279209 tp_is_empty!13483)))

(declare-fun b!475476 () Bool)

(declare-fun res!283944 () Bool)

(declare-fun e!279208 () Bool)

(assert (=> b!475476 (=> (not res!283944) (not e!279208))))

(declare-datatypes ((array!30695 0))(
  ( (array!30696 (arr!14763 (Array (_ BitVec 32) (_ BitVec 64))) (size!15116 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30695)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30695 (_ BitVec 32)) Bool)

(assert (=> b!475476 (= res!283944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21949 () Bool)

(declare-fun mapRes!21949 () Bool)

(declare-fun tp!42211 () Bool)

(assert (=> mapNonEmpty!21949 (= mapRes!21949 (and tp!42211 e!279209))))

(declare-datatypes ((V!19083 0))(
  ( (V!19084 (val!6786 Int)) )
))
(declare-datatypes ((ValueCell!6398 0))(
  ( (ValueCellFull!6398 (v!9074 V!19083)) (EmptyCell!6398) )
))
(declare-datatypes ((array!30697 0))(
  ( (array!30698 (arr!14764 (Array (_ BitVec 32) ValueCell!6398)) (size!15117 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30697)

(declare-fun mapKey!21949 () (_ BitVec 32))

(declare-fun mapRest!21949 () (Array (_ BitVec 32) ValueCell!6398))

(declare-fun mapValue!21949 () ValueCell!6398)

(assert (=> mapNonEmpty!21949 (= (arr!14764 _values!833) (store mapRest!21949 mapKey!21949 mapValue!21949))))

(declare-fun mapIsEmpty!21949 () Bool)

(assert (=> mapIsEmpty!21949 mapRes!21949))

(declare-fun b!475477 () Bool)

(declare-fun e!279206 () Bool)

(assert (=> b!475477 (= e!279206 tp_is_empty!13483)))

(declare-fun b!475478 () Bool)

(declare-fun res!283942 () Bool)

(assert (=> b!475478 (=> (not res!283942) (not e!279208))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475478 (= res!283942 (and (= (size!15117 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15116 _keys!1025) (size!15117 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun zeroValue!794 () V!19083)

(declare-fun defaultEntry!841 () Int)

(declare-fun b!475479 () Bool)

(declare-fun e!279210 () Bool)

(declare-datatypes ((tuple2!9008 0))(
  ( (tuple2!9009 (_1!4515 (_ BitVec 64)) (_2!4515 V!19083)) )
))
(declare-fun lt!216472 () tuple2!9008)

(declare-fun minValueAfter!38 () V!19083)

(declare-datatypes ((List!9069 0))(
  ( (Nil!9066) (Cons!9065 (h!9921 tuple2!9008) (t!15038 List!9069)) )
))
(declare-datatypes ((ListLongMap!7911 0))(
  ( (ListLongMap!7912 (toList!3971 List!9069)) )
))
(declare-fun lt!216475 () ListLongMap!7911)

(declare-fun +!1794 (ListLongMap!7911 tuple2!9008) ListLongMap!7911)

(declare-fun getCurrentListMap!2245 (array!30695 array!30697 (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 (_ BitVec 32) Int) ListLongMap!7911)

(assert (=> b!475479 (= e!279210 (= (+!1794 lt!216475 lt!216472) (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun lt!216471 () ListLongMap!7911)

(declare-fun minValueBefore!38 () V!19083)

(assert (=> b!475479 (= (+!1794 lt!216471 lt!216472) (+!1794 (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216472))))

(assert (=> b!475479 (= lt!216472 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13996 0))(
  ( (Unit!13997) )
))
(declare-fun lt!216476 () Unit!13996)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!167 (ListLongMap!7911 (_ BitVec 64) V!19083 V!19083) Unit!13996)

(assert (=> b!475479 (= lt!216476 (addSameAsAddTwiceSameKeyDiffValues!167 lt!216471 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!475479 (= lt!216475 (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475480 () Bool)

(declare-fun res!283945 () Bool)

(assert (=> b!475480 (=> (not res!283945) (not e!279208))))

(declare-datatypes ((List!9070 0))(
  ( (Nil!9067) (Cons!9066 (h!9922 (_ BitVec 64)) (t!15039 List!9070)) )
))
(declare-fun arrayNoDuplicates!0 (array!30695 (_ BitVec 32) List!9070) Bool)

(assert (=> b!475480 (= res!283945 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9067))))

(declare-fun res!283946 () Bool)

(assert (=> start!42636 (=> (not res!283946) (not e!279208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42636 (= res!283946 (validMask!0 mask!1365))))

(assert (=> start!42636 e!279208))

(assert (=> start!42636 tp_is_empty!13483))

(assert (=> start!42636 tp!42210))

(assert (=> start!42636 true))

(declare-fun array_inv!10734 (array!30695) Bool)

(assert (=> start!42636 (array_inv!10734 _keys!1025)))

(declare-fun e!279207 () Bool)

(declare-fun array_inv!10735 (array!30697) Bool)

(assert (=> start!42636 (and (array_inv!10735 _values!833) e!279207)))

(declare-fun b!475481 () Bool)

(assert (=> b!475481 (= e!279208 (not e!279210))))

(declare-fun res!283943 () Bool)

(assert (=> b!475481 (=> res!283943 e!279210)))

(assert (=> b!475481 (= res!283943 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!216474 () ListLongMap!7911)

(assert (=> b!475481 (= lt!216471 lt!216474)))

(declare-fun lt!216473 () Unit!13996)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!271 (array!30695 array!30697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 V!19083 V!19083 (_ BitVec 32) Int) Unit!13996)

(assert (=> b!475481 (= lt!216473 (lemmaNoChangeToArrayThenSameMapNoExtras!271 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2137 (array!30695 array!30697 (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 (_ BitVec 32) Int) ListLongMap!7911)

(assert (=> b!475481 (= lt!216474 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475481 (= lt!216471 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475482 () Bool)

(assert (=> b!475482 (= e!279207 (and e!279206 mapRes!21949))))

(declare-fun condMapEmpty!21949 () Bool)

(declare-fun mapDefault!21949 () ValueCell!6398)

(assert (=> b!475482 (= condMapEmpty!21949 (= (arr!14764 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6398)) mapDefault!21949)))))

(assert (= (and start!42636 res!283946) b!475478))

(assert (= (and b!475478 res!283942) b!475476))

(assert (= (and b!475476 res!283944) b!475480))

(assert (= (and b!475480 res!283945) b!475481))

(assert (= (and b!475481 (not res!283943)) b!475479))

(assert (= (and b!475482 condMapEmpty!21949) mapIsEmpty!21949))

(assert (= (and b!475482 (not condMapEmpty!21949)) mapNonEmpty!21949))

(get-info :version)

(assert (= (and mapNonEmpty!21949 ((_ is ValueCellFull!6398) mapValue!21949)) b!475475))

(assert (= (and b!475482 ((_ is ValueCellFull!6398) mapDefault!21949)) b!475477))

(assert (= start!42636 b!475482))

(declare-fun m!457187 () Bool)

(assert (=> b!475479 m!457187))

(declare-fun m!457189 () Bool)

(assert (=> b!475479 m!457189))

(declare-fun m!457191 () Bool)

(assert (=> b!475479 m!457191))

(assert (=> b!475479 m!457191))

(declare-fun m!457193 () Bool)

(assert (=> b!475479 m!457193))

(declare-fun m!457195 () Bool)

(assert (=> b!475479 m!457195))

(declare-fun m!457197 () Bool)

(assert (=> b!475479 m!457197))

(declare-fun m!457199 () Bool)

(assert (=> b!475479 m!457199))

(declare-fun m!457201 () Bool)

(assert (=> mapNonEmpty!21949 m!457201))

(declare-fun m!457203 () Bool)

(assert (=> start!42636 m!457203))

(declare-fun m!457205 () Bool)

(assert (=> start!42636 m!457205))

(declare-fun m!457207 () Bool)

(assert (=> start!42636 m!457207))

(declare-fun m!457209 () Bool)

(assert (=> b!475481 m!457209))

(declare-fun m!457211 () Bool)

(assert (=> b!475481 m!457211))

(declare-fun m!457213 () Bool)

(assert (=> b!475481 m!457213))

(declare-fun m!457215 () Bool)

(assert (=> b!475480 m!457215))

(declare-fun m!457217 () Bool)

(assert (=> b!475476 m!457217))

(check-sat (not b!475476) b_and!20529 tp_is_empty!13483 (not b_next!12055) (not b!475479) (not b!475481) (not mapNonEmpty!21949) (not start!42636) (not b!475480))
(check-sat b_and!20529 (not b_next!12055))
(get-model)

(declare-fun d!75443 () Bool)

(assert (=> d!75443 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42636 d!75443))

(declare-fun d!75445 () Bool)

(assert (=> d!75445 (= (array_inv!10734 _keys!1025) (bvsge (size!15116 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42636 d!75445))

(declare-fun d!75447 () Bool)

(assert (=> d!75447 (= (array_inv!10735 _values!833) (bvsge (size!15117 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42636 d!75447))

(declare-fun d!75449 () Bool)

(assert (=> d!75449 (= (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216515 () Unit!13996)

(declare-fun choose!1363 (array!30695 array!30697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 V!19083 V!19083 (_ BitVec 32) Int) Unit!13996)

(assert (=> d!75449 (= lt!216515 (choose!1363 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75449 (validMask!0 mask!1365)))

(assert (=> d!75449 (= (lemmaNoChangeToArrayThenSameMapNoExtras!271 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216515)))

(declare-fun bs!15079 () Bool)

(assert (= bs!15079 d!75449))

(assert (=> bs!15079 m!457213))

(assert (=> bs!15079 m!457211))

(declare-fun m!457283 () Bool)

(assert (=> bs!15079 m!457283))

(assert (=> bs!15079 m!457203))

(assert (=> b!475481 d!75449))

(declare-fun b!475555 () Bool)

(declare-fun e!279261 () Bool)

(declare-fun e!279263 () Bool)

(assert (=> b!475555 (= e!279261 e!279263)))

(declare-fun c!57148 () Bool)

(assert (=> b!475555 (= c!57148 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475556 () Bool)

(declare-fun e!279265 () ListLongMap!7911)

(declare-fun e!279262 () ListLongMap!7911)

(assert (=> b!475556 (= e!279265 e!279262)))

(declare-fun c!57146 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475556 (= c!57146 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475557 () Bool)

(declare-fun e!279266 () Bool)

(assert (=> b!475557 (= e!279266 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475557 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475558 () Bool)

(assert (=> b!475558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> b!475558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15117 _values!833)))))

(declare-fun lt!216533 () ListLongMap!7911)

(declare-fun e!279264 () Bool)

(declare-fun apply!336 (ListLongMap!7911 (_ BitVec 64)) V!19083)

(declare-fun get!7173 (ValueCell!6398 V!19083) V!19083)

(declare-fun dynLambda!932 (Int (_ BitVec 64)) V!19083)

(assert (=> b!475558 (= e!279264 (= (apply!336 lt!216533 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475560 () Bool)

(declare-fun res!283986 () Bool)

(declare-fun e!279267 () Bool)

(assert (=> b!475560 (=> (not res!283986) (not e!279267))))

(declare-fun contains!2550 (ListLongMap!7911 (_ BitVec 64)) Bool)

(assert (=> b!475560 (= res!283986 (not (contains!2550 lt!216533 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30591 () Bool)

(declare-fun call!30594 () ListLongMap!7911)

(assert (=> bm!30591 (= call!30594 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475561 () Bool)

(declare-fun lt!216536 () Unit!13996)

(declare-fun lt!216534 () Unit!13996)

(assert (=> b!475561 (= lt!216536 lt!216534)))

(declare-fun lt!216532 () (_ BitVec 64))

(declare-fun lt!216535 () V!19083)

(declare-fun lt!216530 () ListLongMap!7911)

(declare-fun lt!216531 () (_ BitVec 64))

(assert (=> b!475561 (not (contains!2550 (+!1794 lt!216530 (tuple2!9009 lt!216532 lt!216535)) lt!216531))))

(declare-fun addStillNotContains!170 (ListLongMap!7911 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13996)

(assert (=> b!475561 (= lt!216534 (addStillNotContains!170 lt!216530 lt!216532 lt!216535 lt!216531))))

(assert (=> b!475561 (= lt!216531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475561 (= lt!216535 (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475561 (= lt!216532 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475561 (= lt!216530 call!30594)))

(assert (=> b!475561 (= e!279262 (+!1794 call!30594 (tuple2!9009 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475562 () Bool)

(assert (=> b!475562 (= e!279265 (ListLongMap!7912 Nil!9066))))

(declare-fun b!475563 () Bool)

(assert (=> b!475563 (= e!279261 e!279264)))

(assert (=> b!475563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun res!283987 () Bool)

(assert (=> b!475563 (= res!283987 (contains!2550 lt!216533 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475563 (=> (not res!283987) (not e!279264))))

(declare-fun b!475564 () Bool)

(assert (=> b!475564 (= e!279263 (= lt!216533 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475565 () Bool)

(declare-fun isEmpty!587 (ListLongMap!7911) Bool)

(assert (=> b!475565 (= e!279263 (isEmpty!587 lt!216533))))

(declare-fun b!475566 () Bool)

(assert (=> b!475566 (= e!279267 e!279261)))

(declare-fun c!57147 () Bool)

(assert (=> b!475566 (= c!57147 e!279266)))

(declare-fun res!283985 () Bool)

(assert (=> b!475566 (=> (not res!283985) (not e!279266))))

(assert (=> b!475566 (= res!283985 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun d!75451 () Bool)

(assert (=> d!75451 e!279267))

(declare-fun res!283988 () Bool)

(assert (=> d!75451 (=> (not res!283988) (not e!279267))))

(assert (=> d!75451 (= res!283988 (not (contains!2550 lt!216533 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75451 (= lt!216533 e!279265)))

(declare-fun c!57149 () Bool)

(assert (=> d!75451 (= c!57149 (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75451 (validMask!0 mask!1365)))

(assert (=> d!75451 (= (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216533)))

(declare-fun b!475559 () Bool)

(assert (=> b!475559 (= e!279262 call!30594)))

(assert (= (and d!75451 c!57149) b!475562))

(assert (= (and d!75451 (not c!57149)) b!475556))

(assert (= (and b!475556 c!57146) b!475561))

(assert (= (and b!475556 (not c!57146)) b!475559))

(assert (= (or b!475561 b!475559) bm!30591))

(assert (= (and d!75451 res!283988) b!475560))

(assert (= (and b!475560 res!283986) b!475566))

(assert (= (and b!475566 res!283985) b!475557))

(assert (= (and b!475566 c!57147) b!475563))

(assert (= (and b!475566 (not c!57147)) b!475555))

(assert (= (and b!475563 res!283987) b!475558))

(assert (= (and b!475555 c!57148) b!475564))

(assert (= (and b!475555 (not c!57148)) b!475565))

(declare-fun b_lambda!10275 () Bool)

(assert (=> (not b_lambda!10275) (not b!475558)))

(declare-fun t!15043 () Bool)

(declare-fun tb!3929 () Bool)

(assert (=> (and start!42636 (= defaultEntry!841 defaultEntry!841) t!15043) tb!3929))

(declare-fun result!7461 () Bool)

(assert (=> tb!3929 (= result!7461 tp_is_empty!13483)))

(assert (=> b!475558 t!15043))

(declare-fun b_and!20535 () Bool)

(assert (= b_and!20529 (and (=> t!15043 result!7461) b_and!20535)))

(declare-fun b_lambda!10277 () Bool)

(assert (=> (not b_lambda!10277) (not b!475561)))

(assert (=> b!475561 t!15043))

(declare-fun b_and!20537 () Bool)

(assert (= b_and!20535 (and (=> t!15043 result!7461) b_and!20537)))

(declare-fun m!457285 () Bool)

(assert (=> bm!30591 m!457285))

(declare-fun m!457287 () Bool)

(assert (=> d!75451 m!457287))

(assert (=> d!75451 m!457203))

(declare-fun m!457289 () Bool)

(assert (=> b!475560 m!457289))

(declare-fun m!457291 () Bool)

(assert (=> b!475563 m!457291))

(assert (=> b!475563 m!457291))

(declare-fun m!457293 () Bool)

(assert (=> b!475563 m!457293))

(declare-fun m!457295 () Bool)

(assert (=> b!475558 m!457295))

(declare-fun m!457297 () Bool)

(assert (=> b!475558 m!457297))

(assert (=> b!475558 m!457297))

(assert (=> b!475558 m!457295))

(declare-fun m!457299 () Bool)

(assert (=> b!475558 m!457299))

(assert (=> b!475558 m!457291))

(assert (=> b!475558 m!457291))

(declare-fun m!457301 () Bool)

(assert (=> b!475558 m!457301))

(assert (=> b!475561 m!457295))

(declare-fun m!457303 () Bool)

(assert (=> b!475561 m!457303))

(declare-fun m!457305 () Bool)

(assert (=> b!475561 m!457305))

(assert (=> b!475561 m!457291))

(declare-fun m!457307 () Bool)

(assert (=> b!475561 m!457307))

(assert (=> b!475561 m!457297))

(assert (=> b!475561 m!457303))

(assert (=> b!475561 m!457297))

(assert (=> b!475561 m!457295))

(assert (=> b!475561 m!457299))

(declare-fun m!457309 () Bool)

(assert (=> b!475561 m!457309))

(assert (=> b!475564 m!457285))

(assert (=> b!475556 m!457291))

(assert (=> b!475556 m!457291))

(declare-fun m!457311 () Bool)

(assert (=> b!475556 m!457311))

(declare-fun m!457313 () Bool)

(assert (=> b!475565 m!457313))

(assert (=> b!475557 m!457291))

(assert (=> b!475557 m!457291))

(assert (=> b!475557 m!457311))

(assert (=> b!475481 d!75451))

(declare-fun b!475569 () Bool)

(declare-fun e!279268 () Bool)

(declare-fun e!279270 () Bool)

(assert (=> b!475569 (= e!279268 e!279270)))

(declare-fun c!57152 () Bool)

(assert (=> b!475569 (= c!57152 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475570 () Bool)

(declare-fun e!279272 () ListLongMap!7911)

(declare-fun e!279269 () ListLongMap!7911)

(assert (=> b!475570 (= e!279272 e!279269)))

(declare-fun c!57150 () Bool)

(assert (=> b!475570 (= c!57150 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475571 () Bool)

(declare-fun e!279273 () Bool)

(assert (=> b!475571 (= e!279273 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475571 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475572 () Bool)

(assert (=> b!475572 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> b!475572 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15117 _values!833)))))

(declare-fun e!279271 () Bool)

(declare-fun lt!216540 () ListLongMap!7911)

(assert (=> b!475572 (= e!279271 (= (apply!336 lt!216540 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475574 () Bool)

(declare-fun res!283990 () Bool)

(declare-fun e!279274 () Bool)

(assert (=> b!475574 (=> (not res!283990) (not e!279274))))

(assert (=> b!475574 (= res!283990 (not (contains!2550 lt!216540 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!30595 () ListLongMap!7911)

(declare-fun bm!30592 () Bool)

(assert (=> bm!30592 (= call!30595 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475575 () Bool)

(declare-fun lt!216543 () Unit!13996)

(declare-fun lt!216541 () Unit!13996)

(assert (=> b!475575 (= lt!216543 lt!216541)))

(declare-fun lt!216537 () ListLongMap!7911)

(declare-fun lt!216538 () (_ BitVec 64))

(declare-fun lt!216539 () (_ BitVec 64))

(declare-fun lt!216542 () V!19083)

(assert (=> b!475575 (not (contains!2550 (+!1794 lt!216537 (tuple2!9009 lt!216539 lt!216542)) lt!216538))))

(assert (=> b!475575 (= lt!216541 (addStillNotContains!170 lt!216537 lt!216539 lt!216542 lt!216538))))

(assert (=> b!475575 (= lt!216538 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475575 (= lt!216542 (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475575 (= lt!216539 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475575 (= lt!216537 call!30595)))

(assert (=> b!475575 (= e!279269 (+!1794 call!30595 (tuple2!9009 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475576 () Bool)

(assert (=> b!475576 (= e!279272 (ListLongMap!7912 Nil!9066))))

(declare-fun b!475577 () Bool)

(assert (=> b!475577 (= e!279268 e!279271)))

(assert (=> b!475577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun res!283991 () Bool)

(assert (=> b!475577 (= res!283991 (contains!2550 lt!216540 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475577 (=> (not res!283991) (not e!279271))))

(declare-fun b!475578 () Bool)

(assert (=> b!475578 (= e!279270 (= lt!216540 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475579 () Bool)

(assert (=> b!475579 (= e!279270 (isEmpty!587 lt!216540))))

(declare-fun b!475580 () Bool)

(assert (=> b!475580 (= e!279274 e!279268)))

(declare-fun c!57151 () Bool)

(assert (=> b!475580 (= c!57151 e!279273)))

(declare-fun res!283989 () Bool)

(assert (=> b!475580 (=> (not res!283989) (not e!279273))))

(assert (=> b!475580 (= res!283989 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun d!75453 () Bool)

(assert (=> d!75453 e!279274))

(declare-fun res!283992 () Bool)

(assert (=> d!75453 (=> (not res!283992) (not e!279274))))

(assert (=> d!75453 (= res!283992 (not (contains!2550 lt!216540 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75453 (= lt!216540 e!279272)))

(declare-fun c!57153 () Bool)

(assert (=> d!75453 (= c!57153 (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75453 (validMask!0 mask!1365)))

(assert (=> d!75453 (= (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216540)))

(declare-fun b!475573 () Bool)

(assert (=> b!475573 (= e!279269 call!30595)))

(assert (= (and d!75453 c!57153) b!475576))

(assert (= (and d!75453 (not c!57153)) b!475570))

(assert (= (and b!475570 c!57150) b!475575))

(assert (= (and b!475570 (not c!57150)) b!475573))

(assert (= (or b!475575 b!475573) bm!30592))

(assert (= (and d!75453 res!283992) b!475574))

(assert (= (and b!475574 res!283990) b!475580))

(assert (= (and b!475580 res!283989) b!475571))

(assert (= (and b!475580 c!57151) b!475577))

(assert (= (and b!475580 (not c!57151)) b!475569))

(assert (= (and b!475577 res!283991) b!475572))

(assert (= (and b!475569 c!57152) b!475578))

(assert (= (and b!475569 (not c!57152)) b!475579))

(declare-fun b_lambda!10279 () Bool)

(assert (=> (not b_lambda!10279) (not b!475572)))

(assert (=> b!475572 t!15043))

(declare-fun b_and!20539 () Bool)

(assert (= b_and!20537 (and (=> t!15043 result!7461) b_and!20539)))

(declare-fun b_lambda!10281 () Bool)

(assert (=> (not b_lambda!10281) (not b!475575)))

(assert (=> b!475575 t!15043))

(declare-fun b_and!20541 () Bool)

(assert (= b_and!20539 (and (=> t!15043 result!7461) b_and!20541)))

(declare-fun m!457315 () Bool)

(assert (=> bm!30592 m!457315))

(declare-fun m!457317 () Bool)

(assert (=> d!75453 m!457317))

(assert (=> d!75453 m!457203))

(declare-fun m!457319 () Bool)

(assert (=> b!475574 m!457319))

(assert (=> b!475577 m!457291))

(assert (=> b!475577 m!457291))

(declare-fun m!457321 () Bool)

(assert (=> b!475577 m!457321))

(assert (=> b!475572 m!457295))

(assert (=> b!475572 m!457297))

(assert (=> b!475572 m!457297))

(assert (=> b!475572 m!457295))

(assert (=> b!475572 m!457299))

(assert (=> b!475572 m!457291))

(assert (=> b!475572 m!457291))

(declare-fun m!457323 () Bool)

(assert (=> b!475572 m!457323))

(assert (=> b!475575 m!457295))

(declare-fun m!457325 () Bool)

(assert (=> b!475575 m!457325))

(declare-fun m!457327 () Bool)

(assert (=> b!475575 m!457327))

(assert (=> b!475575 m!457291))

(declare-fun m!457329 () Bool)

(assert (=> b!475575 m!457329))

(assert (=> b!475575 m!457297))

(assert (=> b!475575 m!457325))

(assert (=> b!475575 m!457297))

(assert (=> b!475575 m!457295))

(assert (=> b!475575 m!457299))

(declare-fun m!457331 () Bool)

(assert (=> b!475575 m!457331))

(assert (=> b!475578 m!457315))

(assert (=> b!475570 m!457291))

(assert (=> b!475570 m!457291))

(assert (=> b!475570 m!457311))

(declare-fun m!457333 () Bool)

(assert (=> b!475579 m!457333))

(assert (=> b!475571 m!457291))

(assert (=> b!475571 m!457291))

(assert (=> b!475571 m!457311))

(assert (=> b!475481 d!75453))

(declare-fun b!475591 () Bool)

(declare-fun e!279283 () Bool)

(declare-fun e!279284 () Bool)

(assert (=> b!475591 (= e!279283 e!279284)))

(declare-fun c!57156 () Bool)

(assert (=> b!475591 (= c!57156 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475592 () Bool)

(declare-fun call!30598 () Bool)

(assert (=> b!475592 (= e!279284 call!30598)))

(declare-fun b!475593 () Bool)

(declare-fun e!279286 () Bool)

(declare-fun contains!2551 (List!9070 (_ BitVec 64)) Bool)

(assert (=> b!475593 (= e!279286 (contains!2551 Nil!9067 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475594 () Bool)

(declare-fun e!279285 () Bool)

(assert (=> b!475594 (= e!279285 e!279283)))

(declare-fun res!284000 () Bool)

(assert (=> b!475594 (=> (not res!284000) (not e!279283))))

(assert (=> b!475594 (= res!284000 (not e!279286))))

(declare-fun res!283999 () Bool)

(assert (=> b!475594 (=> (not res!283999) (not e!279286))))

(assert (=> b!475594 (= res!283999 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475595 () Bool)

(assert (=> b!475595 (= e!279284 call!30598)))

(declare-fun d!75455 () Bool)

(declare-fun res!284001 () Bool)

(assert (=> d!75455 (=> res!284001 e!279285)))

(assert (=> d!75455 (= res!284001 (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75455 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9067) e!279285)))

(declare-fun bm!30595 () Bool)

(assert (=> bm!30595 (= call!30598 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57156 (Cons!9066 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) Nil!9067) Nil!9067)))))

(assert (= (and d!75455 (not res!284001)) b!475594))

(assert (= (and b!475594 res!283999) b!475593))

(assert (= (and b!475594 res!284000) b!475591))

(assert (= (and b!475591 c!57156) b!475595))

(assert (= (and b!475591 (not c!57156)) b!475592))

(assert (= (or b!475595 b!475592) bm!30595))

(assert (=> b!475591 m!457291))

(assert (=> b!475591 m!457291))

(assert (=> b!475591 m!457311))

(assert (=> b!475593 m!457291))

(assert (=> b!475593 m!457291))

(declare-fun m!457335 () Bool)

(assert (=> b!475593 m!457335))

(assert (=> b!475594 m!457291))

(assert (=> b!475594 m!457291))

(assert (=> b!475594 m!457311))

(assert (=> bm!30595 m!457291))

(declare-fun m!457337 () Bool)

(assert (=> bm!30595 m!457337))

(assert (=> b!475480 d!75455))

(declare-fun d!75457 () Bool)

(declare-fun res!284006 () Bool)

(declare-fun e!279293 () Bool)

(assert (=> d!75457 (=> res!284006 e!279293)))

(assert (=> d!75457 (= res!284006 (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279293)))

(declare-fun b!475604 () Bool)

(declare-fun e!279294 () Bool)

(assert (=> b!475604 (= e!279293 e!279294)))

(declare-fun c!57159 () Bool)

(assert (=> b!475604 (= c!57159 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475605 () Bool)

(declare-fun call!30601 () Bool)

(assert (=> b!475605 (= e!279294 call!30601)))

(declare-fun b!475606 () Bool)

(declare-fun e!279295 () Bool)

(assert (=> b!475606 (= e!279294 e!279295)))

(declare-fun lt!216550 () (_ BitVec 64))

(assert (=> b!475606 (= lt!216550 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216552 () Unit!13996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30695 (_ BitVec 64) (_ BitVec 32)) Unit!13996)

(assert (=> b!475606 (= lt!216552 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216550 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475606 (arrayContainsKey!0 _keys!1025 lt!216550 #b00000000000000000000000000000000)))

(declare-fun lt!216551 () Unit!13996)

(assert (=> b!475606 (= lt!216551 lt!216552)))

(declare-fun res!284007 () Bool)

(declare-datatypes ((SeekEntryResult!3555 0))(
  ( (MissingZero!3555 (index!16399 (_ BitVec 32))) (Found!3555 (index!16400 (_ BitVec 32))) (Intermediate!3555 (undefined!4367 Bool) (index!16401 (_ BitVec 32)) (x!44654 (_ BitVec 32))) (Undefined!3555) (MissingVacant!3555 (index!16402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30695 (_ BitVec 32)) SeekEntryResult!3555)

(assert (=> b!475606 (= res!284007 (= (seekEntryOrOpen!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3555 #b00000000000000000000000000000000)))))

(assert (=> b!475606 (=> (not res!284007) (not e!279295))))

(declare-fun bm!30598 () Bool)

(assert (=> bm!30598 (= call!30601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475607 () Bool)

(assert (=> b!475607 (= e!279295 call!30601)))

(assert (= (and d!75457 (not res!284006)) b!475604))

(assert (= (and b!475604 c!57159) b!475606))

(assert (= (and b!475604 (not c!57159)) b!475605))

(assert (= (and b!475606 res!284007) b!475607))

(assert (= (or b!475607 b!475605) bm!30598))

(assert (=> b!475604 m!457291))

(assert (=> b!475604 m!457291))

(assert (=> b!475604 m!457311))

(assert (=> b!475606 m!457291))

(declare-fun m!457339 () Bool)

(assert (=> b!475606 m!457339))

(declare-fun m!457341 () Bool)

(assert (=> b!475606 m!457341))

(assert (=> b!475606 m!457291))

(declare-fun m!457343 () Bool)

(assert (=> b!475606 m!457343))

(declare-fun m!457345 () Bool)

(assert (=> bm!30598 m!457345))

(assert (=> b!475476 d!75457))

(declare-fun bm!30613 () Bool)

(declare-fun call!30616 () ListLongMap!7911)

(assert (=> bm!30613 (= call!30616 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475650 () Bool)

(declare-fun e!279322 () Bool)

(assert (=> b!475650 (= e!279322 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475651 () Bool)

(declare-fun res!284031 () Bool)

(declare-fun e!279328 () Bool)

(assert (=> b!475651 (=> (not res!284031) (not e!279328))))

(declare-fun e!279333 () Bool)

(assert (=> b!475651 (= res!284031 e!279333)))

(declare-fun c!57172 () Bool)

(assert (=> b!475651 (= c!57172 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475652 () Bool)

(declare-fun e!279334 () Bool)

(declare-fun e!279327 () Bool)

(assert (=> b!475652 (= e!279334 e!279327)))

(declare-fun res!284026 () Bool)

(assert (=> b!475652 (=> (not res!284026) (not e!279327))))

(declare-fun lt!216613 () ListLongMap!7911)

(assert (=> b!475652 (= res!284026 (contains!2550 lt!216613 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475653 () Bool)

(declare-fun e!279329 () Unit!13996)

(declare-fun Unit!14000 () Unit!13996)

(assert (=> b!475653 (= e!279329 Unit!14000)))

(declare-fun b!475654 () Bool)

(declare-fun e!279324 () ListLongMap!7911)

(declare-fun call!30622 () ListLongMap!7911)

(assert (=> b!475654 (= e!279324 call!30622)))

(declare-fun b!475655 () Bool)

(declare-fun e!279331 () ListLongMap!7911)

(declare-fun call!30618 () ListLongMap!7911)

(assert (=> b!475655 (= e!279331 (+!1794 call!30618 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun call!30621 () ListLongMap!7911)

(declare-fun bm!30614 () Bool)

(declare-fun c!57176 () Bool)

(declare-fun c!57175 () Bool)

(assert (=> bm!30614 (= call!30618 (+!1794 (ite c!57175 call!30616 (ite c!57176 call!30621 call!30622)) (ite (or c!57175 c!57176) (tuple2!9009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475656 () Bool)

(declare-fun e!279326 () Bool)

(assert (=> b!475656 (= e!279333 e!279326)))

(declare-fun res!284033 () Bool)

(declare-fun call!30620 () Bool)

(assert (=> b!475656 (= res!284033 call!30620)))

(assert (=> b!475656 (=> (not res!284033) (not e!279326))))

(declare-fun b!475657 () Bool)

(assert (=> b!475657 (= e!279327 (= (apply!336 lt!216613 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475657 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15117 _values!833)))))

(assert (=> b!475657 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475658 () Bool)

(declare-fun e!279325 () Bool)

(assert (=> b!475658 (= e!279325 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475659 () Bool)

(assert (=> b!475659 (= e!279326 (= (apply!336 lt!216613 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475660 () Bool)

(declare-fun c!57174 () Bool)

(assert (=> b!475660 (= c!57174 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279323 () ListLongMap!7911)

(assert (=> b!475660 (= e!279323 e!279324)))

(declare-fun b!475661 () Bool)

(declare-fun e!279332 () Bool)

(assert (=> b!475661 (= e!279328 e!279332)))

(declare-fun c!57177 () Bool)

(assert (=> b!475661 (= c!57177 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475662 () Bool)

(declare-fun e!279330 () Bool)

(assert (=> b!475662 (= e!279332 e!279330)))

(declare-fun res!284028 () Bool)

(declare-fun call!30617 () Bool)

(assert (=> b!475662 (= res!284028 call!30617)))

(assert (=> b!475662 (=> (not res!284028) (not e!279330))))

(declare-fun bm!30615 () Bool)

(assert (=> bm!30615 (= call!30620 (contains!2550 lt!216613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30616 () Bool)

(assert (=> bm!30616 (= call!30621 call!30616)))

(declare-fun bm!30617 () Bool)

(assert (=> bm!30617 (= call!30622 call!30621)))

(declare-fun b!475663 () Bool)

(declare-fun call!30619 () ListLongMap!7911)

(assert (=> b!475663 (= e!279323 call!30619)))

(declare-fun b!475664 () Bool)

(declare-fun res!284029 () Bool)

(assert (=> b!475664 (=> (not res!284029) (not e!279328))))

(assert (=> b!475664 (= res!284029 e!279334)))

(declare-fun res!284034 () Bool)

(assert (=> b!475664 (=> res!284034 e!279334)))

(assert (=> b!475664 (= res!284034 (not e!279322))))

(declare-fun res!284030 () Bool)

(assert (=> b!475664 (=> (not res!284030) (not e!279322))))

(assert (=> b!475664 (= res!284030 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475665 () Bool)

(assert (=> b!475665 (= e!279324 call!30619)))

(declare-fun b!475666 () Bool)

(assert (=> b!475666 (= e!279331 e!279323)))

(assert (=> b!475666 (= c!57176 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!75459 () Bool)

(assert (=> d!75459 e!279328))

(declare-fun res!284027 () Bool)

(assert (=> d!75459 (=> (not res!284027) (not e!279328))))

(assert (=> d!75459 (= res!284027 (or (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))))

(declare-fun lt!216597 () ListLongMap!7911)

(assert (=> d!75459 (= lt!216613 lt!216597)))

(declare-fun lt!216617 () Unit!13996)

(assert (=> d!75459 (= lt!216617 e!279329)))

(declare-fun c!57173 () Bool)

(assert (=> d!75459 (= c!57173 e!279325)))

(declare-fun res!284032 () Bool)

(assert (=> d!75459 (=> (not res!284032) (not e!279325))))

(assert (=> d!75459 (= res!284032 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75459 (= lt!216597 e!279331)))

(assert (=> d!75459 (= c!57175 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75459 (validMask!0 mask!1365)))

(assert (=> d!75459 (= (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216613)))

(declare-fun b!475667 () Bool)

(assert (=> b!475667 (= e!279332 (not call!30617))))

(declare-fun bm!30618 () Bool)

(assert (=> bm!30618 (= call!30617 (contains!2550 lt!216613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475668 () Bool)

(declare-fun lt!216618 () Unit!13996)

(assert (=> b!475668 (= e!279329 lt!216618)))

(declare-fun lt!216616 () ListLongMap!7911)

(assert (=> b!475668 (= lt!216616 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216610 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216611 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216611 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216608 () Unit!13996)

(declare-fun addStillContains!294 (ListLongMap!7911 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13996)

(assert (=> b!475668 (= lt!216608 (addStillContains!294 lt!216616 lt!216610 zeroValue!794 lt!216611))))

(assert (=> b!475668 (contains!2550 (+!1794 lt!216616 (tuple2!9009 lt!216610 zeroValue!794)) lt!216611)))

(declare-fun lt!216603 () Unit!13996)

(assert (=> b!475668 (= lt!216603 lt!216608)))

(declare-fun lt!216602 () ListLongMap!7911)

(assert (=> b!475668 (= lt!216602 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216600 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216609 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216609 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216606 () Unit!13996)

(declare-fun addApplyDifferent!294 (ListLongMap!7911 (_ BitVec 64) V!19083 (_ BitVec 64)) Unit!13996)

(assert (=> b!475668 (= lt!216606 (addApplyDifferent!294 lt!216602 lt!216600 minValueAfter!38 lt!216609))))

(assert (=> b!475668 (= (apply!336 (+!1794 lt!216602 (tuple2!9009 lt!216600 minValueAfter!38)) lt!216609) (apply!336 lt!216602 lt!216609))))

(declare-fun lt!216614 () Unit!13996)

(assert (=> b!475668 (= lt!216614 lt!216606)))

(declare-fun lt!216604 () ListLongMap!7911)

(assert (=> b!475668 (= lt!216604 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216607 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216599 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216599 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216601 () Unit!13996)

(assert (=> b!475668 (= lt!216601 (addApplyDifferent!294 lt!216604 lt!216607 zeroValue!794 lt!216599))))

(assert (=> b!475668 (= (apply!336 (+!1794 lt!216604 (tuple2!9009 lt!216607 zeroValue!794)) lt!216599) (apply!336 lt!216604 lt!216599))))

(declare-fun lt!216605 () Unit!13996)

(assert (=> b!475668 (= lt!216605 lt!216601)))

(declare-fun lt!216598 () ListLongMap!7911)

(assert (=> b!475668 (= lt!216598 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216615 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216612 () (_ BitVec 64))

(assert (=> b!475668 (= lt!216612 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475668 (= lt!216618 (addApplyDifferent!294 lt!216598 lt!216615 minValueAfter!38 lt!216612))))

(assert (=> b!475668 (= (apply!336 (+!1794 lt!216598 (tuple2!9009 lt!216615 minValueAfter!38)) lt!216612) (apply!336 lt!216598 lt!216612))))

(declare-fun bm!30619 () Bool)

(assert (=> bm!30619 (= call!30619 call!30618)))

(declare-fun b!475669 () Bool)

(assert (=> b!475669 (= e!279330 (= (apply!336 lt!216613 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!475670 () Bool)

(assert (=> b!475670 (= e!279333 (not call!30620))))

(assert (= (and d!75459 c!57175) b!475655))

(assert (= (and d!75459 (not c!57175)) b!475666))

(assert (= (and b!475666 c!57176) b!475663))

(assert (= (and b!475666 (not c!57176)) b!475660))

(assert (= (and b!475660 c!57174) b!475665))

(assert (= (and b!475660 (not c!57174)) b!475654))

(assert (= (or b!475665 b!475654) bm!30617))

(assert (= (or b!475663 bm!30617) bm!30616))

(assert (= (or b!475663 b!475665) bm!30619))

(assert (= (or b!475655 bm!30616) bm!30613))

(assert (= (or b!475655 bm!30619) bm!30614))

(assert (= (and d!75459 res!284032) b!475658))

(assert (= (and d!75459 c!57173) b!475668))

(assert (= (and d!75459 (not c!57173)) b!475653))

(assert (= (and d!75459 res!284027) b!475664))

(assert (= (and b!475664 res!284030) b!475650))

(assert (= (and b!475664 (not res!284034)) b!475652))

(assert (= (and b!475652 res!284026) b!475657))

(assert (= (and b!475664 res!284029) b!475651))

(assert (= (and b!475651 c!57172) b!475656))

(assert (= (and b!475651 (not c!57172)) b!475670))

(assert (= (and b!475656 res!284033) b!475659))

(assert (= (or b!475656 b!475670) bm!30615))

(assert (= (and b!475651 res!284031) b!475661))

(assert (= (and b!475661 c!57177) b!475662))

(assert (= (and b!475661 (not c!57177)) b!475667))

(assert (= (and b!475662 res!284028) b!475669))

(assert (= (or b!475662 b!475667) bm!30618))

(declare-fun b_lambda!10283 () Bool)

(assert (=> (not b_lambda!10283) (not b!475657)))

(assert (=> b!475657 t!15043))

(declare-fun b_and!20543 () Bool)

(assert (= b_and!20541 (and (=> t!15043 result!7461) b_and!20543)))

(declare-fun m!457347 () Bool)

(assert (=> bm!30615 m!457347))

(assert (=> d!75459 m!457203))

(assert (=> b!475657 m!457297))

(assert (=> b!475657 m!457295))

(assert (=> b!475657 m!457299))

(assert (=> b!475657 m!457295))

(assert (=> b!475657 m!457291))

(assert (=> b!475657 m!457291))

(declare-fun m!457349 () Bool)

(assert (=> b!475657 m!457349))

(assert (=> b!475657 m!457297))

(assert (=> b!475658 m!457291))

(assert (=> b!475658 m!457291))

(assert (=> b!475658 m!457311))

(declare-fun m!457351 () Bool)

(assert (=> b!475655 m!457351))

(declare-fun m!457353 () Bool)

(assert (=> b!475659 m!457353))

(assert (=> bm!30613 m!457211))

(assert (=> b!475668 m!457211))

(declare-fun m!457355 () Bool)

(assert (=> b!475668 m!457355))

(declare-fun m!457357 () Bool)

(assert (=> b!475668 m!457357))

(declare-fun m!457359 () Bool)

(assert (=> b!475668 m!457359))

(declare-fun m!457361 () Bool)

(assert (=> b!475668 m!457361))

(declare-fun m!457363 () Bool)

(assert (=> b!475668 m!457363))

(declare-fun m!457365 () Bool)

(assert (=> b!475668 m!457365))

(declare-fun m!457367 () Bool)

(assert (=> b!475668 m!457367))

(declare-fun m!457369 () Bool)

(assert (=> b!475668 m!457369))

(assert (=> b!475668 m!457291))

(declare-fun m!457371 () Bool)

(assert (=> b!475668 m!457371))

(declare-fun m!457373 () Bool)

(assert (=> b!475668 m!457373))

(assert (=> b!475668 m!457363))

(declare-fun m!457375 () Bool)

(assert (=> b!475668 m!457375))

(declare-fun m!457377 () Bool)

(assert (=> b!475668 m!457377))

(assert (=> b!475668 m!457375))

(declare-fun m!457379 () Bool)

(assert (=> b!475668 m!457379))

(assert (=> b!475668 m!457355))

(assert (=> b!475668 m!457371))

(declare-fun m!457381 () Bool)

(assert (=> b!475668 m!457381))

(declare-fun m!457383 () Bool)

(assert (=> b!475668 m!457383))

(declare-fun m!457385 () Bool)

(assert (=> bm!30614 m!457385))

(declare-fun m!457387 () Bool)

(assert (=> b!475669 m!457387))

(assert (=> b!475650 m!457291))

(assert (=> b!475650 m!457291))

(assert (=> b!475650 m!457311))

(declare-fun m!457389 () Bool)

(assert (=> bm!30618 m!457389))

(assert (=> b!475652 m!457291))

(assert (=> b!475652 m!457291))

(declare-fun m!457391 () Bool)

(assert (=> b!475652 m!457391))

(assert (=> b!475479 d!75459))

(declare-fun d!75461 () Bool)

(assert (=> d!75461 (= (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1794 (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216621 () Unit!13996)

(declare-fun choose!1364 (ListLongMap!7911 (_ BitVec 64) V!19083 V!19083) Unit!13996)

(assert (=> d!75461 (= lt!216621 (choose!1364 lt!216471 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75461 (= (addSameAsAddTwiceSameKeyDiffValues!167 lt!216471 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216621)))

(declare-fun bs!15080 () Bool)

(assert (= bs!15080 d!75461))

(declare-fun m!457393 () Bool)

(assert (=> bs!15080 m!457393))

(assert (=> bs!15080 m!457191))

(assert (=> bs!15080 m!457191))

(declare-fun m!457395 () Bool)

(assert (=> bs!15080 m!457395))

(declare-fun m!457397 () Bool)

(assert (=> bs!15080 m!457397))

(assert (=> b!475479 d!75461))

(declare-fun d!75463 () Bool)

(declare-fun e!279337 () Bool)

(assert (=> d!75463 e!279337))

(declare-fun res!284040 () Bool)

(assert (=> d!75463 (=> (not res!284040) (not e!279337))))

(declare-fun lt!216632 () ListLongMap!7911)

(assert (=> d!75463 (= res!284040 (contains!2550 lt!216632 (_1!4515 lt!216472)))))

(declare-fun lt!216633 () List!9069)

(assert (=> d!75463 (= lt!216632 (ListLongMap!7912 lt!216633))))

(declare-fun lt!216630 () Unit!13996)

(declare-fun lt!216631 () Unit!13996)

(assert (=> d!75463 (= lt!216630 lt!216631)))

(declare-datatypes ((Option!387 0))(
  ( (Some!386 (v!9077 V!19083)) (None!385) )
))
(declare-fun getValueByKey!381 (List!9069 (_ BitVec 64)) Option!387)

(assert (=> d!75463 (= (getValueByKey!381 lt!216633 (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472)))))

(declare-fun lemmaContainsTupThenGetReturnValue!206 (List!9069 (_ BitVec 64) V!19083) Unit!13996)

(assert (=> d!75463 (= lt!216631 (lemmaContainsTupThenGetReturnValue!206 lt!216633 (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(declare-fun insertStrictlySorted!209 (List!9069 (_ BitVec 64) V!19083) List!9069)

(assert (=> d!75463 (= lt!216633 (insertStrictlySorted!209 (toList!3971 lt!216471) (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(assert (=> d!75463 (= (+!1794 lt!216471 lt!216472) lt!216632)))

(declare-fun b!475675 () Bool)

(declare-fun res!284039 () Bool)

(assert (=> b!475675 (=> (not res!284039) (not e!279337))))

(assert (=> b!475675 (= res!284039 (= (getValueByKey!381 (toList!3971 lt!216632) (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472))))))

(declare-fun b!475676 () Bool)

(declare-fun contains!2552 (List!9069 tuple2!9008) Bool)

(assert (=> b!475676 (= e!279337 (contains!2552 (toList!3971 lt!216632) lt!216472))))

(assert (= (and d!75463 res!284040) b!475675))

(assert (= (and b!475675 res!284039) b!475676))

(declare-fun m!457399 () Bool)

(assert (=> d!75463 m!457399))

(declare-fun m!457401 () Bool)

(assert (=> d!75463 m!457401))

(declare-fun m!457403 () Bool)

(assert (=> d!75463 m!457403))

(declare-fun m!457405 () Bool)

(assert (=> d!75463 m!457405))

(declare-fun m!457407 () Bool)

(assert (=> b!475675 m!457407))

(declare-fun m!457409 () Bool)

(assert (=> b!475676 m!457409))

(assert (=> b!475479 d!75463))

(declare-fun d!75465 () Bool)

(declare-fun e!279338 () Bool)

(assert (=> d!75465 e!279338))

(declare-fun res!284042 () Bool)

(assert (=> d!75465 (=> (not res!284042) (not e!279338))))

(declare-fun lt!216636 () ListLongMap!7911)

(assert (=> d!75465 (= res!284042 (contains!2550 lt!216636 (_1!4515 lt!216472)))))

(declare-fun lt!216637 () List!9069)

(assert (=> d!75465 (= lt!216636 (ListLongMap!7912 lt!216637))))

(declare-fun lt!216634 () Unit!13996)

(declare-fun lt!216635 () Unit!13996)

(assert (=> d!75465 (= lt!216634 lt!216635)))

(assert (=> d!75465 (= (getValueByKey!381 lt!216637 (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472)))))

(assert (=> d!75465 (= lt!216635 (lemmaContainsTupThenGetReturnValue!206 lt!216637 (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(assert (=> d!75465 (= lt!216637 (insertStrictlySorted!209 (toList!3971 (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(assert (=> d!75465 (= (+!1794 (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216472) lt!216636)))

(declare-fun b!475677 () Bool)

(declare-fun res!284041 () Bool)

(assert (=> b!475677 (=> (not res!284041) (not e!279338))))

(assert (=> b!475677 (= res!284041 (= (getValueByKey!381 (toList!3971 lt!216636) (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472))))))

(declare-fun b!475678 () Bool)

(assert (=> b!475678 (= e!279338 (contains!2552 (toList!3971 lt!216636) lt!216472))))

(assert (= (and d!75465 res!284042) b!475677))

(assert (= (and b!475677 res!284041) b!475678))

(declare-fun m!457411 () Bool)

(assert (=> d!75465 m!457411))

(declare-fun m!457413 () Bool)

(assert (=> d!75465 m!457413))

(declare-fun m!457415 () Bool)

(assert (=> d!75465 m!457415))

(declare-fun m!457417 () Bool)

(assert (=> d!75465 m!457417))

(declare-fun m!457419 () Bool)

(assert (=> b!475677 m!457419))

(declare-fun m!457421 () Bool)

(assert (=> b!475678 m!457421))

(assert (=> b!475479 d!75465))

(declare-fun bm!30620 () Bool)

(declare-fun call!30623 () ListLongMap!7911)

(assert (=> bm!30620 (= call!30623 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475679 () Bool)

(declare-fun e!279339 () Bool)

(assert (=> b!475679 (= e!279339 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475680 () Bool)

(declare-fun res!284048 () Bool)

(declare-fun e!279345 () Bool)

(assert (=> b!475680 (=> (not res!284048) (not e!279345))))

(declare-fun e!279350 () Bool)

(assert (=> b!475680 (= res!284048 e!279350)))

(declare-fun c!57178 () Bool)

(assert (=> b!475680 (= c!57178 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475681 () Bool)

(declare-fun e!279351 () Bool)

(declare-fun e!279344 () Bool)

(assert (=> b!475681 (= e!279351 e!279344)))

(declare-fun res!284043 () Bool)

(assert (=> b!475681 (=> (not res!284043) (not e!279344))))

(declare-fun lt!216654 () ListLongMap!7911)

(assert (=> b!475681 (= res!284043 (contains!2550 lt!216654 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475682 () Bool)

(declare-fun e!279346 () Unit!13996)

(declare-fun Unit!14001 () Unit!13996)

(assert (=> b!475682 (= e!279346 Unit!14001)))

(declare-fun b!475683 () Bool)

(declare-fun e!279341 () ListLongMap!7911)

(declare-fun call!30629 () ListLongMap!7911)

(assert (=> b!475683 (= e!279341 call!30629)))

(declare-fun b!475684 () Bool)

(declare-fun e!279348 () ListLongMap!7911)

(declare-fun call!30625 () ListLongMap!7911)

(assert (=> b!475684 (= e!279348 (+!1794 call!30625 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30621 () Bool)

(declare-fun call!30628 () ListLongMap!7911)

(declare-fun c!57181 () Bool)

(declare-fun c!57182 () Bool)

(assert (=> bm!30621 (= call!30625 (+!1794 (ite c!57181 call!30623 (ite c!57182 call!30628 call!30629)) (ite (or c!57181 c!57182) (tuple2!9009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475685 () Bool)

(declare-fun e!279343 () Bool)

(assert (=> b!475685 (= e!279350 e!279343)))

(declare-fun res!284050 () Bool)

(declare-fun call!30627 () Bool)

(assert (=> b!475685 (= res!284050 call!30627)))

(assert (=> b!475685 (=> (not res!284050) (not e!279343))))

(declare-fun b!475686 () Bool)

(assert (=> b!475686 (= e!279344 (= (apply!336 lt!216654 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14764 _values!833) #b00000000000000000000000000000000) (dynLambda!932 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475686 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15117 _values!833)))))

(assert (=> b!475686 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475687 () Bool)

(declare-fun e!279342 () Bool)

(assert (=> b!475687 (= e!279342 (validKeyInArray!0 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475688 () Bool)

(assert (=> b!475688 (= e!279343 (= (apply!336 lt!216654 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475689 () Bool)

(declare-fun c!57180 () Bool)

(assert (=> b!475689 (= c!57180 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279340 () ListLongMap!7911)

(assert (=> b!475689 (= e!279340 e!279341)))

(declare-fun b!475690 () Bool)

(declare-fun e!279349 () Bool)

(assert (=> b!475690 (= e!279345 e!279349)))

(declare-fun c!57183 () Bool)

(assert (=> b!475690 (= c!57183 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475691 () Bool)

(declare-fun e!279347 () Bool)

(assert (=> b!475691 (= e!279349 e!279347)))

(declare-fun res!284045 () Bool)

(declare-fun call!30624 () Bool)

(assert (=> b!475691 (= res!284045 call!30624)))

(assert (=> b!475691 (=> (not res!284045) (not e!279347))))

(declare-fun bm!30622 () Bool)

(assert (=> bm!30622 (= call!30627 (contains!2550 lt!216654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30623 () Bool)

(assert (=> bm!30623 (= call!30628 call!30623)))

(declare-fun bm!30624 () Bool)

(assert (=> bm!30624 (= call!30629 call!30628)))

(declare-fun b!475692 () Bool)

(declare-fun call!30626 () ListLongMap!7911)

(assert (=> b!475692 (= e!279340 call!30626)))

(declare-fun b!475693 () Bool)

(declare-fun res!284046 () Bool)

(assert (=> b!475693 (=> (not res!284046) (not e!279345))))

(assert (=> b!475693 (= res!284046 e!279351)))

(declare-fun res!284051 () Bool)

(assert (=> b!475693 (=> res!284051 e!279351)))

(assert (=> b!475693 (= res!284051 (not e!279339))))

(declare-fun res!284047 () Bool)

(assert (=> b!475693 (=> (not res!284047) (not e!279339))))

(assert (=> b!475693 (= res!284047 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(declare-fun b!475694 () Bool)

(assert (=> b!475694 (= e!279341 call!30626)))

(declare-fun b!475695 () Bool)

(assert (=> b!475695 (= e!279348 e!279340)))

(assert (=> b!475695 (= c!57182 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!75467 () Bool)

(assert (=> d!75467 e!279345))

(declare-fun res!284044 () Bool)

(assert (=> d!75467 (=> (not res!284044) (not e!279345))))

(assert (=> d!75467 (= res!284044 (or (bvsge #b00000000000000000000000000000000 (size!15116 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))))

(declare-fun lt!216638 () ListLongMap!7911)

(assert (=> d!75467 (= lt!216654 lt!216638)))

(declare-fun lt!216658 () Unit!13996)

(assert (=> d!75467 (= lt!216658 e!279346)))

(declare-fun c!57179 () Bool)

(assert (=> d!75467 (= c!57179 e!279342)))

(declare-fun res!284049 () Bool)

(assert (=> d!75467 (=> (not res!284049) (not e!279342))))

(assert (=> d!75467 (= res!284049 (bvslt #b00000000000000000000000000000000 (size!15116 _keys!1025)))))

(assert (=> d!75467 (= lt!216638 e!279348)))

(assert (=> d!75467 (= c!57181 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75467 (validMask!0 mask!1365)))

(assert (=> d!75467 (= (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216654)))

(declare-fun b!475696 () Bool)

(assert (=> b!475696 (= e!279349 (not call!30624))))

(declare-fun bm!30625 () Bool)

(assert (=> bm!30625 (= call!30624 (contains!2550 lt!216654 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475697 () Bool)

(declare-fun lt!216659 () Unit!13996)

(assert (=> b!475697 (= e!279346 lt!216659)))

(declare-fun lt!216657 () ListLongMap!7911)

(assert (=> b!475697 (= lt!216657 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216651 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216652 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216652 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216649 () Unit!13996)

(assert (=> b!475697 (= lt!216649 (addStillContains!294 lt!216657 lt!216651 zeroValue!794 lt!216652))))

(assert (=> b!475697 (contains!2550 (+!1794 lt!216657 (tuple2!9009 lt!216651 zeroValue!794)) lt!216652)))

(declare-fun lt!216644 () Unit!13996)

(assert (=> b!475697 (= lt!216644 lt!216649)))

(declare-fun lt!216643 () ListLongMap!7911)

(assert (=> b!475697 (= lt!216643 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216641 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216650 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216650 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216647 () Unit!13996)

(assert (=> b!475697 (= lt!216647 (addApplyDifferent!294 lt!216643 lt!216641 minValueBefore!38 lt!216650))))

(assert (=> b!475697 (= (apply!336 (+!1794 lt!216643 (tuple2!9009 lt!216641 minValueBefore!38)) lt!216650) (apply!336 lt!216643 lt!216650))))

(declare-fun lt!216655 () Unit!13996)

(assert (=> b!475697 (= lt!216655 lt!216647)))

(declare-fun lt!216645 () ListLongMap!7911)

(assert (=> b!475697 (= lt!216645 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216648 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216640 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216640 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216642 () Unit!13996)

(assert (=> b!475697 (= lt!216642 (addApplyDifferent!294 lt!216645 lt!216648 zeroValue!794 lt!216640))))

(assert (=> b!475697 (= (apply!336 (+!1794 lt!216645 (tuple2!9009 lt!216648 zeroValue!794)) lt!216640) (apply!336 lt!216645 lt!216640))))

(declare-fun lt!216646 () Unit!13996)

(assert (=> b!475697 (= lt!216646 lt!216642)))

(declare-fun lt!216639 () ListLongMap!7911)

(assert (=> b!475697 (= lt!216639 (getCurrentListMapNoExtraKeys!2137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216656 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216653 () (_ BitVec 64))

(assert (=> b!475697 (= lt!216653 (select (arr!14763 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475697 (= lt!216659 (addApplyDifferent!294 lt!216639 lt!216656 minValueBefore!38 lt!216653))))

(assert (=> b!475697 (= (apply!336 (+!1794 lt!216639 (tuple2!9009 lt!216656 minValueBefore!38)) lt!216653) (apply!336 lt!216639 lt!216653))))

(declare-fun bm!30626 () Bool)

(assert (=> bm!30626 (= call!30626 call!30625)))

(declare-fun b!475698 () Bool)

(assert (=> b!475698 (= e!279347 (= (apply!336 lt!216654 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!475699 () Bool)

(assert (=> b!475699 (= e!279350 (not call!30627))))

(assert (= (and d!75467 c!57181) b!475684))

(assert (= (and d!75467 (not c!57181)) b!475695))

(assert (= (and b!475695 c!57182) b!475692))

(assert (= (and b!475695 (not c!57182)) b!475689))

(assert (= (and b!475689 c!57180) b!475694))

(assert (= (and b!475689 (not c!57180)) b!475683))

(assert (= (or b!475694 b!475683) bm!30624))

(assert (= (or b!475692 bm!30624) bm!30623))

(assert (= (or b!475692 b!475694) bm!30626))

(assert (= (or b!475684 bm!30623) bm!30620))

(assert (= (or b!475684 bm!30626) bm!30621))

(assert (= (and d!75467 res!284049) b!475687))

(assert (= (and d!75467 c!57179) b!475697))

(assert (= (and d!75467 (not c!57179)) b!475682))

(assert (= (and d!75467 res!284044) b!475693))

(assert (= (and b!475693 res!284047) b!475679))

(assert (= (and b!475693 (not res!284051)) b!475681))

(assert (= (and b!475681 res!284043) b!475686))

(assert (= (and b!475693 res!284046) b!475680))

(assert (= (and b!475680 c!57178) b!475685))

(assert (= (and b!475680 (not c!57178)) b!475699))

(assert (= (and b!475685 res!284050) b!475688))

(assert (= (or b!475685 b!475699) bm!30622))

(assert (= (and b!475680 res!284048) b!475690))

(assert (= (and b!475690 c!57183) b!475691))

(assert (= (and b!475690 (not c!57183)) b!475696))

(assert (= (and b!475691 res!284045) b!475698))

(assert (= (or b!475691 b!475696) bm!30625))

(declare-fun b_lambda!10285 () Bool)

(assert (=> (not b_lambda!10285) (not b!475686)))

(assert (=> b!475686 t!15043))

(declare-fun b_and!20545 () Bool)

(assert (= b_and!20543 (and (=> t!15043 result!7461) b_and!20545)))

(declare-fun m!457423 () Bool)

(assert (=> bm!30622 m!457423))

(assert (=> d!75467 m!457203))

(assert (=> b!475686 m!457297))

(assert (=> b!475686 m!457295))

(assert (=> b!475686 m!457299))

(assert (=> b!475686 m!457295))

(assert (=> b!475686 m!457291))

(assert (=> b!475686 m!457291))

(declare-fun m!457425 () Bool)

(assert (=> b!475686 m!457425))

(assert (=> b!475686 m!457297))

(assert (=> b!475687 m!457291))

(assert (=> b!475687 m!457291))

(assert (=> b!475687 m!457311))

(declare-fun m!457427 () Bool)

(assert (=> b!475684 m!457427))

(declare-fun m!457429 () Bool)

(assert (=> b!475688 m!457429))

(assert (=> bm!30620 m!457213))

(assert (=> b!475697 m!457213))

(declare-fun m!457431 () Bool)

(assert (=> b!475697 m!457431))

(declare-fun m!457433 () Bool)

(assert (=> b!475697 m!457433))

(declare-fun m!457435 () Bool)

(assert (=> b!475697 m!457435))

(declare-fun m!457437 () Bool)

(assert (=> b!475697 m!457437))

(declare-fun m!457439 () Bool)

(assert (=> b!475697 m!457439))

(declare-fun m!457441 () Bool)

(assert (=> b!475697 m!457441))

(declare-fun m!457443 () Bool)

(assert (=> b!475697 m!457443))

(declare-fun m!457445 () Bool)

(assert (=> b!475697 m!457445))

(assert (=> b!475697 m!457291))

(declare-fun m!457447 () Bool)

(assert (=> b!475697 m!457447))

(declare-fun m!457449 () Bool)

(assert (=> b!475697 m!457449))

(assert (=> b!475697 m!457439))

(declare-fun m!457451 () Bool)

(assert (=> b!475697 m!457451))

(declare-fun m!457453 () Bool)

(assert (=> b!475697 m!457453))

(assert (=> b!475697 m!457451))

(declare-fun m!457455 () Bool)

(assert (=> b!475697 m!457455))

(assert (=> b!475697 m!457431))

(assert (=> b!475697 m!457447))

(declare-fun m!457457 () Bool)

(assert (=> b!475697 m!457457))

(declare-fun m!457459 () Bool)

(assert (=> b!475697 m!457459))

(declare-fun m!457461 () Bool)

(assert (=> bm!30621 m!457461))

(declare-fun m!457463 () Bool)

(assert (=> b!475698 m!457463))

(assert (=> b!475679 m!457291))

(assert (=> b!475679 m!457291))

(assert (=> b!475679 m!457311))

(declare-fun m!457465 () Bool)

(assert (=> bm!30625 m!457465))

(assert (=> b!475681 m!457291))

(assert (=> b!475681 m!457291))

(declare-fun m!457467 () Bool)

(assert (=> b!475681 m!457467))

(assert (=> b!475479 d!75467))

(declare-fun d!75469 () Bool)

(declare-fun e!279352 () Bool)

(assert (=> d!75469 e!279352))

(declare-fun res!284053 () Bool)

(assert (=> d!75469 (=> (not res!284053) (not e!279352))))

(declare-fun lt!216662 () ListLongMap!7911)

(assert (=> d!75469 (= res!284053 (contains!2550 lt!216662 (_1!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!216663 () List!9069)

(assert (=> d!75469 (= lt!216662 (ListLongMap!7912 lt!216663))))

(declare-fun lt!216660 () Unit!13996)

(declare-fun lt!216661 () Unit!13996)

(assert (=> d!75469 (= lt!216660 lt!216661)))

(assert (=> d!75469 (= (getValueByKey!381 lt!216663 (_1!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75469 (= lt!216661 (lemmaContainsTupThenGetReturnValue!206 lt!216663 (_1!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75469 (= lt!216663 (insertStrictlySorted!209 (toList!3971 lt!216471) (_1!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75469 (= (+!1794 lt!216471 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216662)))

(declare-fun b!475700 () Bool)

(declare-fun res!284052 () Bool)

(assert (=> b!475700 (=> (not res!284052) (not e!279352))))

(assert (=> b!475700 (= res!284052 (= (getValueByKey!381 (toList!3971 lt!216662) (_1!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4515 (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!475701 () Bool)

(assert (=> b!475701 (= e!279352 (contains!2552 (toList!3971 lt!216662) (tuple2!9009 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75469 res!284053) b!475700))

(assert (= (and b!475700 res!284052) b!475701))

(declare-fun m!457469 () Bool)

(assert (=> d!75469 m!457469))

(declare-fun m!457471 () Bool)

(assert (=> d!75469 m!457471))

(declare-fun m!457473 () Bool)

(assert (=> d!75469 m!457473))

(declare-fun m!457475 () Bool)

(assert (=> d!75469 m!457475))

(declare-fun m!457477 () Bool)

(assert (=> b!475700 m!457477))

(declare-fun m!457479 () Bool)

(assert (=> b!475701 m!457479))

(assert (=> b!475479 d!75469))

(declare-fun d!75471 () Bool)

(declare-fun e!279353 () Bool)

(assert (=> d!75471 e!279353))

(declare-fun res!284055 () Bool)

(assert (=> d!75471 (=> (not res!284055) (not e!279353))))

(declare-fun lt!216666 () ListLongMap!7911)

(assert (=> d!75471 (= res!284055 (contains!2550 lt!216666 (_1!4515 lt!216472)))))

(declare-fun lt!216667 () List!9069)

(assert (=> d!75471 (= lt!216666 (ListLongMap!7912 lt!216667))))

(declare-fun lt!216664 () Unit!13996)

(declare-fun lt!216665 () Unit!13996)

(assert (=> d!75471 (= lt!216664 lt!216665)))

(assert (=> d!75471 (= (getValueByKey!381 lt!216667 (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472)))))

(assert (=> d!75471 (= lt!216665 (lemmaContainsTupThenGetReturnValue!206 lt!216667 (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(assert (=> d!75471 (= lt!216667 (insertStrictlySorted!209 (toList!3971 lt!216475) (_1!4515 lt!216472) (_2!4515 lt!216472)))))

(assert (=> d!75471 (= (+!1794 lt!216475 lt!216472) lt!216666)))

(declare-fun b!475702 () Bool)

(declare-fun res!284054 () Bool)

(assert (=> b!475702 (=> (not res!284054) (not e!279353))))

(assert (=> b!475702 (= res!284054 (= (getValueByKey!381 (toList!3971 lt!216666) (_1!4515 lt!216472)) (Some!386 (_2!4515 lt!216472))))))

(declare-fun b!475703 () Bool)

(assert (=> b!475703 (= e!279353 (contains!2552 (toList!3971 lt!216666) lt!216472))))

(assert (= (and d!75471 res!284055) b!475702))

(assert (= (and b!475702 res!284054) b!475703))

(declare-fun m!457481 () Bool)

(assert (=> d!75471 m!457481))

(declare-fun m!457483 () Bool)

(assert (=> d!75471 m!457483))

(declare-fun m!457485 () Bool)

(assert (=> d!75471 m!457485))

(declare-fun m!457487 () Bool)

(assert (=> d!75471 m!457487))

(declare-fun m!457489 () Bool)

(assert (=> b!475702 m!457489))

(declare-fun m!457491 () Bool)

(assert (=> b!475703 m!457491))

(assert (=> b!475479 d!75471))

(declare-fun b!475711 () Bool)

(declare-fun e!279358 () Bool)

(assert (=> b!475711 (= e!279358 tp_is_empty!13483)))

(declare-fun mapNonEmpty!21958 () Bool)

(declare-fun mapRes!21958 () Bool)

(declare-fun tp!42226 () Bool)

(declare-fun e!279359 () Bool)

(assert (=> mapNonEmpty!21958 (= mapRes!21958 (and tp!42226 e!279359))))

(declare-fun mapValue!21958 () ValueCell!6398)

(declare-fun mapRest!21958 () (Array (_ BitVec 32) ValueCell!6398))

(declare-fun mapKey!21958 () (_ BitVec 32))

(assert (=> mapNonEmpty!21958 (= mapRest!21949 (store mapRest!21958 mapKey!21958 mapValue!21958))))

(declare-fun b!475710 () Bool)

(assert (=> b!475710 (= e!279359 tp_is_empty!13483)))

(declare-fun mapIsEmpty!21958 () Bool)

(assert (=> mapIsEmpty!21958 mapRes!21958))

(declare-fun condMapEmpty!21958 () Bool)

(declare-fun mapDefault!21958 () ValueCell!6398)

(assert (=> mapNonEmpty!21949 (= condMapEmpty!21958 (= mapRest!21949 ((as const (Array (_ BitVec 32) ValueCell!6398)) mapDefault!21958)))))

(assert (=> mapNonEmpty!21949 (= tp!42211 (and e!279358 mapRes!21958))))

(assert (= (and mapNonEmpty!21949 condMapEmpty!21958) mapIsEmpty!21958))

(assert (= (and mapNonEmpty!21949 (not condMapEmpty!21958)) mapNonEmpty!21958))

(assert (= (and mapNonEmpty!21958 ((_ is ValueCellFull!6398) mapValue!21958)) b!475710))

(assert (= (and mapNonEmpty!21949 ((_ is ValueCellFull!6398) mapDefault!21958)) b!475711))

(declare-fun m!457493 () Bool)

(assert (=> mapNonEmpty!21958 m!457493))

(declare-fun b_lambda!10287 () Bool)

(assert (= b_lambda!10275 (or (and start!42636 b_free!12055) b_lambda!10287)))

(declare-fun b_lambda!10289 () Bool)

(assert (= b_lambda!10283 (or (and start!42636 b_free!12055) b_lambda!10289)))

(declare-fun b_lambda!10291 () Bool)

(assert (= b_lambda!10277 (or (and start!42636 b_free!12055) b_lambda!10291)))

(declare-fun b_lambda!10293 () Bool)

(assert (= b_lambda!10285 (or (and start!42636 b_free!12055) b_lambda!10293)))

(declare-fun b_lambda!10295 () Bool)

(assert (= b_lambda!10281 (or (and start!42636 b_free!12055) b_lambda!10295)))

(declare-fun b_lambda!10297 () Bool)

(assert (= b_lambda!10279 (or (and start!42636 b_free!12055) b_lambda!10297)))

(check-sat (not b!475676) (not b!475571) (not b_lambda!10291) (not b!475561) (not b!475679) (not b!475594) (not b!475678) (not b_lambda!10295) (not d!75451) (not b!475556) (not b!475668) (not b!475688) (not mapNonEmpty!21958) (not b!475701) (not b!475669) (not bm!30622) (not bm!30613) (not b!475687) (not b!475697) (not b!475681) (not b!475591) (not b!475577) (not d!75453) (not b!475574) (not d!75469) (not b!475652) (not b!475677) (not d!75461) (not b!475564) (not b!475658) (not b!475572) (not bm!30621) (not bm!30618) (not b!475702) (not bm!30614) (not b_lambda!10297) (not b_lambda!10293) (not b!475686) (not b!475675) (not b!475560) (not b!475659) (not b!475570) (not b!475650) tp_is_empty!13483 (not d!75449) (not bm!30591) (not bm!30598) (not d!75459) (not b!475703) (not b!475578) (not bm!30592) (not b_lambda!10287) (not b!475606) (not b_next!12055) (not b!475579) (not b!475593) (not bm!30615) (not d!75471) (not b!475563) (not b!475700) (not b!475684) (not b!475698) (not b!475655) (not d!75467) (not bm!30625) (not bm!30620) (not d!75463) (not b_lambda!10289) (not d!75465) (not b!475558) b_and!20545 (not b!475604) (not b!475557) (not b!475657) (not b!475575) (not bm!30595) (not b!475565))
(check-sat b_and!20545 (not b_next!12055))
