; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106390 () Bool)

(assert start!106390)

(declare-fun b_free!27523 () Bool)

(declare-fun b_next!27523 () Bool)

(assert (=> start!106390 (= b_free!27523 (not b_next!27523))))

(declare-fun tp!96131 () Bool)

(declare-fun b_and!45545 () Bool)

(assert (=> start!106390 (= tp!96131 b_and!45545)))

(declare-fun mapNonEmpty!50470 () Bool)

(declare-fun mapRes!50470 () Bool)

(declare-fun tp!96130 () Bool)

(declare-fun e!720575 () Bool)

(assert (=> mapNonEmpty!50470 (= mapRes!50470 (and tp!96130 e!720575))))

(declare-fun mapKey!50470 () (_ BitVec 32))

(declare-datatypes ((V!48599 0))(
  ( (V!48600 (val!16275 Int)) )
))
(declare-datatypes ((ValueCell!15449 0))(
  ( (ValueCellFull!15449 (v!18984 V!48599)) (EmptyCell!15449) )
))
(declare-datatypes ((array!82521 0))(
  ( (array!82522 (arr!39799 (Array (_ BitVec 32) ValueCell!15449)) (size!40336 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82521)

(declare-fun mapRest!50470 () (Array (_ BitVec 32) ValueCell!15449))

(declare-fun mapValue!50470 () ValueCell!15449)

(assert (=> mapNonEmpty!50470 (= (arr!39799 _values!914) (store mapRest!50470 mapKey!50470 mapValue!50470))))

(declare-datatypes ((tuple2!21080 0))(
  ( (tuple2!21081 (_1!10551 (_ BitVec 64)) (_2!10551 V!48599)) )
))
(declare-datatypes ((List!28300 0))(
  ( (Nil!28297) (Cons!28296 (h!29514 tuple2!21080) (t!41811 List!28300)) )
))
(declare-datatypes ((ListLongMap!18961 0))(
  ( (ListLongMap!18962 (toList!9496 List!28300)) )
))
(declare-fun lt!573913 () ListLongMap!18961)

(declare-fun e!720574 () Bool)

(declare-fun lt!573910 () ListLongMap!18961)

(declare-fun b!1265355 () Bool)

(declare-fun lt!573915 () tuple2!21080)

(declare-fun +!4303 (ListLongMap!18961 tuple2!21080) ListLongMap!18961)

(assert (=> b!1265355 (= e!720574 (= lt!573910 (+!4303 lt!573913 lt!573915)))))

(declare-fun b!1265356 () Bool)

(declare-fun e!720572 () Bool)

(declare-fun tp_is_empty!32425 () Bool)

(assert (=> b!1265356 (= e!720572 tp_is_empty!32425)))

(declare-fun b!1265357 () Bool)

(declare-fun res!842385 () Bool)

(declare-fun e!720573 () Bool)

(assert (=> b!1265357 (=> (not res!842385) (not e!720573))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82523 0))(
  ( (array!82524 (arr!39800 (Array (_ BitVec 32) (_ BitVec 64))) (size!40337 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82523)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1265357 (= res!842385 (and (= (size!40336 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40337 _keys!1118) (size!40336 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265358 () Bool)

(declare-fun res!842383 () Bool)

(assert (=> b!1265358 (=> (not res!842383) (not e!720573))))

(declare-datatypes ((List!28301 0))(
  ( (Nil!28298) (Cons!28297 (h!29515 (_ BitVec 64)) (t!41812 List!28301)) )
))
(declare-fun arrayNoDuplicates!0 (array!82523 (_ BitVec 32) List!28301) Bool)

(assert (=> b!1265358 (= res!842383 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28298))))

(declare-fun res!842388 () Bool)

(assert (=> start!106390 (=> (not res!842388) (not e!720573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106390 (= res!842388 (validMask!0 mask!1466))))

(assert (=> start!106390 e!720573))

(assert (=> start!106390 true))

(assert (=> start!106390 tp!96131))

(assert (=> start!106390 tp_is_empty!32425))

(declare-fun array_inv!30453 (array!82523) Bool)

(assert (=> start!106390 (array_inv!30453 _keys!1118)))

(declare-fun e!720570 () Bool)

(declare-fun array_inv!30454 (array!82521) Bool)

(assert (=> start!106390 (and (array_inv!30454 _values!914) e!720570)))

(declare-fun b!1265359 () Bool)

(assert (=> b!1265359 (= e!720570 (and e!720572 mapRes!50470))))

(declare-fun condMapEmpty!50470 () Bool)

(declare-fun mapDefault!50470 () ValueCell!15449)

(assert (=> b!1265359 (= condMapEmpty!50470 (= (arr!39799 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15449)) mapDefault!50470)))))

(declare-fun b!1265360 () Bool)

(declare-fun res!842387 () Bool)

(assert (=> b!1265360 (=> (not res!842387) (not e!720573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82523 (_ BitVec 32)) Bool)

(assert (=> b!1265360 (= res!842387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50470 () Bool)

(assert (=> mapIsEmpty!50470 mapRes!50470))

(declare-fun b!1265361 () Bool)

(declare-fun e!720571 () Bool)

(declare-fun lt!573909 () ListLongMap!18961)

(declare-fun contains!7637 (ListLongMap!18961 (_ BitVec 64)) Bool)

(assert (=> b!1265361 (= e!720571 (not (contains!7637 lt!573909 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265361 e!720574))

(declare-fun res!842386 () Bool)

(assert (=> b!1265361 (=> (not res!842386) (not e!720574))))

(declare-fun minValueBefore!43 () V!48599)

(declare-fun lt!573912 () ListLongMap!18961)

(assert (=> b!1265361 (= res!842386 (= lt!573912 (+!4303 lt!573909 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573911 () ListLongMap!18961)

(assert (=> b!1265361 (= lt!573909 (+!4303 lt!573911 lt!573915))))

(declare-fun zeroValue!871 () V!48599)

(assert (=> b!1265361 (= lt!573915 (tuple2!21081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48599)

(declare-fun getCurrentListMap!4647 (array!82523 array!82521 (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 (_ BitVec 32) Int) ListLongMap!18961)

(assert (=> b!1265361 (= lt!573910 (getCurrentListMap!4647 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265361 (= lt!573912 (getCurrentListMap!4647 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265362 () Bool)

(assert (=> b!1265362 (= e!720575 tp_is_empty!32425)))

(declare-fun b!1265363 () Bool)

(assert (=> b!1265363 (= e!720573 (not e!720571))))

(declare-fun res!842384 () Bool)

(assert (=> b!1265363 (=> res!842384 e!720571)))

(assert (=> b!1265363 (= res!842384 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1265363 (= lt!573911 lt!573913)))

(declare-datatypes ((Unit!42101 0))(
  ( (Unit!42102) )
))
(declare-fun lt!573914 () Unit!42101)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1189 (array!82523 array!82521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 V!48599 V!48599 (_ BitVec 32) Int) Unit!42101)

(assert (=> b!1265363 (= lt!573914 (lemmaNoChangeToArrayThenSameMapNoExtras!1189 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5899 (array!82523 array!82521 (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 (_ BitVec 32) Int) ListLongMap!18961)

(assert (=> b!1265363 (= lt!573913 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265363 (= lt!573911 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106390 res!842388) b!1265357))

(assert (= (and b!1265357 res!842385) b!1265360))

(assert (= (and b!1265360 res!842387) b!1265358))

(assert (= (and b!1265358 res!842383) b!1265363))

(assert (= (and b!1265363 (not res!842384)) b!1265361))

(assert (= (and b!1265361 res!842386) b!1265355))

(assert (= (and b!1265359 condMapEmpty!50470) mapIsEmpty!50470))

(assert (= (and b!1265359 (not condMapEmpty!50470)) mapNonEmpty!50470))

(get-info :version)

(assert (= (and mapNonEmpty!50470 ((_ is ValueCellFull!15449) mapValue!50470)) b!1265362))

(assert (= (and b!1265359 ((_ is ValueCellFull!15449) mapDefault!50470)) b!1265356))

(assert (= start!106390 b!1265359))

(declare-fun m!1166163 () Bool)

(assert (=> start!106390 m!1166163))

(declare-fun m!1166165 () Bool)

(assert (=> start!106390 m!1166165))

(declare-fun m!1166167 () Bool)

(assert (=> start!106390 m!1166167))

(declare-fun m!1166169 () Bool)

(assert (=> b!1265355 m!1166169))

(declare-fun m!1166171 () Bool)

(assert (=> b!1265361 m!1166171))

(declare-fun m!1166173 () Bool)

(assert (=> b!1265361 m!1166173))

(declare-fun m!1166175 () Bool)

(assert (=> b!1265361 m!1166175))

(declare-fun m!1166177 () Bool)

(assert (=> b!1265361 m!1166177))

(declare-fun m!1166179 () Bool)

(assert (=> b!1265361 m!1166179))

(declare-fun m!1166181 () Bool)

(assert (=> mapNonEmpty!50470 m!1166181))

(declare-fun m!1166183 () Bool)

(assert (=> b!1265363 m!1166183))

(declare-fun m!1166185 () Bool)

(assert (=> b!1265363 m!1166185))

(declare-fun m!1166187 () Bool)

(assert (=> b!1265363 m!1166187))

(declare-fun m!1166189 () Bool)

(assert (=> b!1265360 m!1166189))

(declare-fun m!1166191 () Bool)

(assert (=> b!1265358 m!1166191))

(check-sat (not b_next!27523) (not b!1265355) (not mapNonEmpty!50470) (not b!1265363) (not start!106390) tp_is_empty!32425 (not b!1265360) (not b!1265358) (not b!1265361) b_and!45545)
(check-sat b_and!45545 (not b_next!27523))
(get-model)

(declare-fun b!1265428 () Bool)

(declare-fun e!720629 () Bool)

(declare-fun e!720627 () Bool)

(assert (=> b!1265428 (= e!720629 e!720627)))

(declare-fun c!123490 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1265428 (= c!123490 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265429 () Bool)

(declare-fun e!720626 () Bool)

(assert (=> b!1265429 (= e!720626 e!720629)))

(declare-fun res!842432 () Bool)

(assert (=> b!1265429 (=> (not res!842432) (not e!720629))))

(declare-fun e!720628 () Bool)

(assert (=> b!1265429 (= res!842432 (not e!720628))))

(declare-fun res!842431 () Bool)

(assert (=> b!1265429 (=> (not res!842431) (not e!720628))))

(assert (=> b!1265429 (= res!842431 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265430 () Bool)

(declare-fun call!62362 () Bool)

(assert (=> b!1265430 (= e!720627 call!62362)))

(declare-fun b!1265431 () Bool)

(declare-fun contains!7639 (List!28301 (_ BitVec 64)) Bool)

(assert (=> b!1265431 (= e!720628 (contains!7639 Nil!28298 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265432 () Bool)

(assert (=> b!1265432 (= e!720627 call!62362)))

(declare-fun bm!62359 () Bool)

(assert (=> bm!62359 (= call!62362 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123490 (Cons!28297 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000) Nil!28298) Nil!28298)))))

(declare-fun d!139143 () Bool)

(declare-fun res!842433 () Bool)

(assert (=> d!139143 (=> res!842433 e!720626)))

(assert (=> d!139143 (= res!842433 (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139143 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28298) e!720626)))

(assert (= (and d!139143 (not res!842433)) b!1265429))

(assert (= (and b!1265429 res!842431) b!1265431))

(assert (= (and b!1265429 res!842432) b!1265428))

(assert (= (and b!1265428 c!123490) b!1265430))

(assert (= (and b!1265428 (not c!123490)) b!1265432))

(assert (= (or b!1265430 b!1265432) bm!62359))

(declare-fun m!1166253 () Bool)

(assert (=> b!1265428 m!1166253))

(assert (=> b!1265428 m!1166253))

(declare-fun m!1166255 () Bool)

(assert (=> b!1265428 m!1166255))

(assert (=> b!1265429 m!1166253))

(assert (=> b!1265429 m!1166253))

(assert (=> b!1265429 m!1166255))

(assert (=> b!1265431 m!1166253))

(assert (=> b!1265431 m!1166253))

(declare-fun m!1166257 () Bool)

(assert (=> b!1265431 m!1166257))

(assert (=> bm!62359 m!1166253))

(declare-fun m!1166259 () Bool)

(assert (=> bm!62359 m!1166259))

(assert (=> b!1265358 d!139143))

(declare-fun d!139145 () Bool)

(assert (=> d!139145 (= (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573960 () Unit!42101)

(declare-fun choose!1883 (array!82523 array!82521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 V!48599 V!48599 (_ BitVec 32) Int) Unit!42101)

(assert (=> d!139145 (= lt!573960 (choose!1883 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139145 (validMask!0 mask!1466)))

(assert (=> d!139145 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1189 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573960)))

(declare-fun bs!35774 () Bool)

(assert (= bs!35774 d!139145))

(assert (=> bs!35774 m!1166187))

(assert (=> bs!35774 m!1166185))

(declare-fun m!1166261 () Bool)

(assert (=> bs!35774 m!1166261))

(assert (=> bs!35774 m!1166163))

(assert (=> b!1265363 d!139145))

(declare-fun b!1265457 () Bool)

(assert (=> b!1265457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> b!1265457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40336 _values!914)))))

(declare-fun lt!573978 () ListLongMap!18961)

(declare-fun e!720644 () Bool)

(declare-fun apply!1013 (ListLongMap!18961 (_ BitVec 64)) V!48599)

(declare-fun get!20348 (ValueCell!15449 V!48599) V!48599)

(declare-fun dynLambda!3465 (Int (_ BitVec 64)) V!48599)

(assert (=> b!1265457 (= e!720644 (= (apply!1013 lt!573978 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265458 () Bool)

(declare-fun e!720650 () ListLongMap!18961)

(declare-fun call!62365 () ListLongMap!18961)

(assert (=> b!1265458 (= e!720650 call!62365)))

(declare-fun bm!62362 () Bool)

(assert (=> bm!62362 (= call!62365 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1265459 () Bool)

(declare-fun e!720647 () Bool)

(assert (=> b!1265459 (= e!720647 (= lt!573978 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1265460 () Bool)

(declare-fun e!720649 () Bool)

(assert (=> b!1265460 (= e!720649 e!720644)))

(assert (=> b!1265460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun res!842443 () Bool)

(assert (=> b!1265460 (= res!842443 (contains!7637 lt!573978 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265460 (=> (not res!842443) (not e!720644))))

(declare-fun d!139147 () Bool)

(declare-fun e!720648 () Bool)

(assert (=> d!139147 e!720648))

(declare-fun res!842442 () Bool)

(assert (=> d!139147 (=> (not res!842442) (not e!720648))))

(assert (=> d!139147 (= res!842442 (not (contains!7637 lt!573978 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!720646 () ListLongMap!18961)

(assert (=> d!139147 (= lt!573978 e!720646)))

(declare-fun c!123502 () Bool)

(assert (=> d!139147 (= c!123502 (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139147 (validMask!0 mask!1466)))

(assert (=> d!139147 (= (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573978)))

(declare-fun b!1265461 () Bool)

(declare-fun res!842444 () Bool)

(assert (=> b!1265461 (=> (not res!842444) (not e!720648))))

(assert (=> b!1265461 (= res!842444 (not (contains!7637 lt!573978 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265462 () Bool)

(declare-fun lt!573976 () Unit!42101)

(declare-fun lt!573979 () Unit!42101)

(assert (=> b!1265462 (= lt!573976 lt!573979)))

(declare-fun lt!573980 () (_ BitVec 64))

(declare-fun lt!573977 () (_ BitVec 64))

(declare-fun lt!573981 () V!48599)

(declare-fun lt!573975 () ListLongMap!18961)

(assert (=> b!1265462 (not (contains!7637 (+!4303 lt!573975 (tuple2!21081 lt!573977 lt!573981)) lt!573980))))

(declare-fun addStillNotContains!334 (ListLongMap!18961 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!42101)

(assert (=> b!1265462 (= lt!573979 (addStillNotContains!334 lt!573975 lt!573977 lt!573981 lt!573980))))

(assert (=> b!1265462 (= lt!573980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265462 (= lt!573981 (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265462 (= lt!573977 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265462 (= lt!573975 call!62365)))

(assert (=> b!1265462 (= e!720650 (+!4303 call!62365 (tuple2!21081 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1265463 () Bool)

(declare-fun e!720645 () Bool)

(assert (=> b!1265463 (= e!720645 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265463 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265464 () Bool)

(assert (=> b!1265464 (= e!720649 e!720647)))

(declare-fun c!123500 () Bool)

(assert (=> b!1265464 (= c!123500 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265465 () Bool)

(declare-fun isEmpty!1050 (ListLongMap!18961) Bool)

(assert (=> b!1265465 (= e!720647 (isEmpty!1050 lt!573978))))

(declare-fun b!1265466 () Bool)

(assert (=> b!1265466 (= e!720646 (ListLongMap!18962 Nil!28297))))

(declare-fun b!1265467 () Bool)

(assert (=> b!1265467 (= e!720646 e!720650)))

(declare-fun c!123501 () Bool)

(assert (=> b!1265467 (= c!123501 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265468 () Bool)

(assert (=> b!1265468 (= e!720648 e!720649)))

(declare-fun c!123499 () Bool)

(assert (=> b!1265468 (= c!123499 e!720645)))

(declare-fun res!842445 () Bool)

(assert (=> b!1265468 (=> (not res!842445) (not e!720645))))

(assert (=> b!1265468 (= res!842445 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (= (and d!139147 c!123502) b!1265466))

(assert (= (and d!139147 (not c!123502)) b!1265467))

(assert (= (and b!1265467 c!123501) b!1265462))

(assert (= (and b!1265467 (not c!123501)) b!1265458))

(assert (= (or b!1265462 b!1265458) bm!62362))

(assert (= (and d!139147 res!842442) b!1265461))

(assert (= (and b!1265461 res!842444) b!1265468))

(assert (= (and b!1265468 res!842445) b!1265463))

(assert (= (and b!1265468 c!123499) b!1265460))

(assert (= (and b!1265468 (not c!123499)) b!1265464))

(assert (= (and b!1265460 res!842443) b!1265457))

(assert (= (and b!1265464 c!123500) b!1265459))

(assert (= (and b!1265464 (not c!123500)) b!1265465))

(declare-fun b_lambda!23009 () Bool)

(assert (=> (not b_lambda!23009) (not b!1265457)))

(declare-fun t!41817 () Bool)

(declare-fun tb!11327 () Bool)

(assert (=> (and start!106390 (= defaultEntry!922 defaultEntry!922) t!41817) tb!11327))

(declare-fun result!23405 () Bool)

(assert (=> tb!11327 (= result!23405 tp_is_empty!32425)))

(assert (=> b!1265457 t!41817))

(declare-fun b_and!45551 () Bool)

(assert (= b_and!45545 (and (=> t!41817 result!23405) b_and!45551)))

(declare-fun b_lambda!23011 () Bool)

(assert (=> (not b_lambda!23011) (not b!1265462)))

(assert (=> b!1265462 t!41817))

(declare-fun b_and!45553 () Bool)

(assert (= b_and!45551 (and (=> t!41817 result!23405) b_and!45553)))

(declare-fun m!1166263 () Bool)

(assert (=> d!139147 m!1166263))

(assert (=> d!139147 m!1166163))

(declare-fun m!1166265 () Bool)

(assert (=> b!1265461 m!1166265))

(declare-fun m!1166267 () Bool)

(assert (=> bm!62362 m!1166267))

(assert (=> b!1265459 m!1166267))

(declare-fun m!1166269 () Bool)

(assert (=> b!1265457 m!1166269))

(declare-fun m!1166271 () Bool)

(assert (=> b!1265457 m!1166271))

(declare-fun m!1166273 () Bool)

(assert (=> b!1265457 m!1166273))

(assert (=> b!1265457 m!1166271))

(assert (=> b!1265457 m!1166253))

(assert (=> b!1265457 m!1166253))

(declare-fun m!1166275 () Bool)

(assert (=> b!1265457 m!1166275))

(assert (=> b!1265457 m!1166269))

(declare-fun m!1166277 () Bool)

(assert (=> b!1265465 m!1166277))

(assert (=> b!1265463 m!1166253))

(assert (=> b!1265463 m!1166253))

(assert (=> b!1265463 m!1166255))

(assert (=> b!1265467 m!1166253))

(assert (=> b!1265467 m!1166253))

(assert (=> b!1265467 m!1166255))

(assert (=> b!1265460 m!1166253))

(assert (=> b!1265460 m!1166253))

(declare-fun m!1166279 () Bool)

(assert (=> b!1265460 m!1166279))

(assert (=> b!1265462 m!1166269))

(assert (=> b!1265462 m!1166271))

(assert (=> b!1265462 m!1166273))

(declare-fun m!1166281 () Bool)

(assert (=> b!1265462 m!1166281))

(assert (=> b!1265462 m!1166271))

(assert (=> b!1265462 m!1166253))

(declare-fun m!1166283 () Bool)

(assert (=> b!1265462 m!1166283))

(declare-fun m!1166285 () Bool)

(assert (=> b!1265462 m!1166285))

(declare-fun m!1166287 () Bool)

(assert (=> b!1265462 m!1166287))

(assert (=> b!1265462 m!1166269))

(assert (=> b!1265462 m!1166283))

(assert (=> b!1265363 d!139147))

(declare-fun b!1265471 () Bool)

(assert (=> b!1265471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> b!1265471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40336 _values!914)))))

(declare-fun e!720651 () Bool)

(declare-fun lt!573985 () ListLongMap!18961)

(assert (=> b!1265471 (= e!720651 (= (apply!1013 lt!573985 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265472 () Bool)

(declare-fun e!720657 () ListLongMap!18961)

(declare-fun call!62366 () ListLongMap!18961)

(assert (=> b!1265472 (= e!720657 call!62366)))

(declare-fun bm!62363 () Bool)

(assert (=> bm!62363 (= call!62366 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun e!720654 () Bool)

(declare-fun b!1265473 () Bool)

(assert (=> b!1265473 (= e!720654 (= lt!573985 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1265474 () Bool)

(declare-fun e!720656 () Bool)

(assert (=> b!1265474 (= e!720656 e!720651)))

(assert (=> b!1265474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun res!842447 () Bool)

(assert (=> b!1265474 (= res!842447 (contains!7637 lt!573985 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265474 (=> (not res!842447) (not e!720651))))

(declare-fun d!139149 () Bool)

(declare-fun e!720655 () Bool)

(assert (=> d!139149 e!720655))

(declare-fun res!842446 () Bool)

(assert (=> d!139149 (=> (not res!842446) (not e!720655))))

(assert (=> d!139149 (= res!842446 (not (contains!7637 lt!573985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!720653 () ListLongMap!18961)

(assert (=> d!139149 (= lt!573985 e!720653)))

(declare-fun c!123506 () Bool)

(assert (=> d!139149 (= c!123506 (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139149 (validMask!0 mask!1466)))

(assert (=> d!139149 (= (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573985)))

(declare-fun b!1265475 () Bool)

(declare-fun res!842448 () Bool)

(assert (=> b!1265475 (=> (not res!842448) (not e!720655))))

(assert (=> b!1265475 (= res!842448 (not (contains!7637 lt!573985 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265476 () Bool)

(declare-fun lt!573983 () Unit!42101)

(declare-fun lt!573986 () Unit!42101)

(assert (=> b!1265476 (= lt!573983 lt!573986)))

(declare-fun lt!573987 () (_ BitVec 64))

(declare-fun lt!573984 () (_ BitVec 64))

(declare-fun lt!573988 () V!48599)

(declare-fun lt!573982 () ListLongMap!18961)

(assert (=> b!1265476 (not (contains!7637 (+!4303 lt!573982 (tuple2!21081 lt!573984 lt!573988)) lt!573987))))

(assert (=> b!1265476 (= lt!573986 (addStillNotContains!334 lt!573982 lt!573984 lt!573988 lt!573987))))

(assert (=> b!1265476 (= lt!573987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265476 (= lt!573988 (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265476 (= lt!573984 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265476 (= lt!573982 call!62366)))

(assert (=> b!1265476 (= e!720657 (+!4303 call!62366 (tuple2!21081 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1265477 () Bool)

(declare-fun e!720652 () Bool)

(assert (=> b!1265477 (= e!720652 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265477 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265478 () Bool)

(assert (=> b!1265478 (= e!720656 e!720654)))

(declare-fun c!123504 () Bool)

(assert (=> b!1265478 (= c!123504 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265479 () Bool)

(assert (=> b!1265479 (= e!720654 (isEmpty!1050 lt!573985))))

(declare-fun b!1265480 () Bool)

(assert (=> b!1265480 (= e!720653 (ListLongMap!18962 Nil!28297))))

(declare-fun b!1265481 () Bool)

(assert (=> b!1265481 (= e!720653 e!720657)))

(declare-fun c!123505 () Bool)

(assert (=> b!1265481 (= c!123505 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265482 () Bool)

(assert (=> b!1265482 (= e!720655 e!720656)))

(declare-fun c!123503 () Bool)

(assert (=> b!1265482 (= c!123503 e!720652)))

(declare-fun res!842449 () Bool)

(assert (=> b!1265482 (=> (not res!842449) (not e!720652))))

(assert (=> b!1265482 (= res!842449 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (= (and d!139149 c!123506) b!1265480))

(assert (= (and d!139149 (not c!123506)) b!1265481))

(assert (= (and b!1265481 c!123505) b!1265476))

(assert (= (and b!1265481 (not c!123505)) b!1265472))

(assert (= (or b!1265476 b!1265472) bm!62363))

(assert (= (and d!139149 res!842446) b!1265475))

(assert (= (and b!1265475 res!842448) b!1265482))

(assert (= (and b!1265482 res!842449) b!1265477))

(assert (= (and b!1265482 c!123503) b!1265474))

(assert (= (and b!1265482 (not c!123503)) b!1265478))

(assert (= (and b!1265474 res!842447) b!1265471))

(assert (= (and b!1265478 c!123504) b!1265473))

(assert (= (and b!1265478 (not c!123504)) b!1265479))

(declare-fun b_lambda!23013 () Bool)

(assert (=> (not b_lambda!23013) (not b!1265471)))

(assert (=> b!1265471 t!41817))

(declare-fun b_and!45555 () Bool)

(assert (= b_and!45553 (and (=> t!41817 result!23405) b_and!45555)))

(declare-fun b_lambda!23015 () Bool)

(assert (=> (not b_lambda!23015) (not b!1265476)))

(assert (=> b!1265476 t!41817))

(declare-fun b_and!45557 () Bool)

(assert (= b_and!45555 (and (=> t!41817 result!23405) b_and!45557)))

(declare-fun m!1166289 () Bool)

(assert (=> d!139149 m!1166289))

(assert (=> d!139149 m!1166163))

(declare-fun m!1166291 () Bool)

(assert (=> b!1265475 m!1166291))

(declare-fun m!1166293 () Bool)

(assert (=> bm!62363 m!1166293))

(assert (=> b!1265473 m!1166293))

(assert (=> b!1265471 m!1166269))

(assert (=> b!1265471 m!1166271))

(assert (=> b!1265471 m!1166273))

(assert (=> b!1265471 m!1166271))

(assert (=> b!1265471 m!1166253))

(assert (=> b!1265471 m!1166253))

(declare-fun m!1166295 () Bool)

(assert (=> b!1265471 m!1166295))

(assert (=> b!1265471 m!1166269))

(declare-fun m!1166297 () Bool)

(assert (=> b!1265479 m!1166297))

(assert (=> b!1265477 m!1166253))

(assert (=> b!1265477 m!1166253))

(assert (=> b!1265477 m!1166255))

(assert (=> b!1265481 m!1166253))

(assert (=> b!1265481 m!1166253))

(assert (=> b!1265481 m!1166255))

(assert (=> b!1265474 m!1166253))

(assert (=> b!1265474 m!1166253))

(declare-fun m!1166299 () Bool)

(assert (=> b!1265474 m!1166299))

(assert (=> b!1265476 m!1166269))

(assert (=> b!1265476 m!1166271))

(assert (=> b!1265476 m!1166273))

(declare-fun m!1166301 () Bool)

(assert (=> b!1265476 m!1166301))

(assert (=> b!1265476 m!1166271))

(assert (=> b!1265476 m!1166253))

(declare-fun m!1166303 () Bool)

(assert (=> b!1265476 m!1166303))

(declare-fun m!1166305 () Bool)

(assert (=> b!1265476 m!1166305))

(declare-fun m!1166307 () Bool)

(assert (=> b!1265476 m!1166307))

(assert (=> b!1265476 m!1166269))

(assert (=> b!1265476 m!1166303))

(assert (=> b!1265363 d!139149))

(declare-fun d!139151 () Bool)

(declare-fun e!720660 () Bool)

(assert (=> d!139151 e!720660))

(declare-fun res!842454 () Bool)

(assert (=> d!139151 (=> (not res!842454) (not e!720660))))

(declare-fun lt!573999 () ListLongMap!18961)

(assert (=> d!139151 (= res!842454 (contains!7637 lt!573999 (_1!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573998 () List!28300)

(assert (=> d!139151 (= lt!573999 (ListLongMap!18962 lt!573998))))

(declare-fun lt!573997 () Unit!42101)

(declare-fun lt!574000 () Unit!42101)

(assert (=> d!139151 (= lt!573997 lt!574000)))

(declare-datatypes ((Option!716 0))(
  ( (Some!715 (v!18987 V!48599)) (None!714) )
))
(declare-fun getValueByKey!665 (List!28300 (_ BitVec 64)) Option!716)

(assert (=> d!139151 (= (getValueByKey!665 lt!573998 (_1!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!715 (_2!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!339 (List!28300 (_ BitVec 64) V!48599) Unit!42101)

(assert (=> d!139151 (= lt!574000 (lemmaContainsTupThenGetReturnValue!339 lt!573998 (_1!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!453 (List!28300 (_ BitVec 64) V!48599) List!28300)

(assert (=> d!139151 (= lt!573998 (insertStrictlySorted!453 (toList!9496 lt!573909) (_1!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!139151 (= (+!4303 lt!573909 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573999)))

(declare-fun b!1265487 () Bool)

(declare-fun res!842455 () Bool)

(assert (=> b!1265487 (=> (not res!842455) (not e!720660))))

(assert (=> b!1265487 (= res!842455 (= (getValueByKey!665 (toList!9496 lt!573999) (_1!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!715 (_2!10551 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1265488 () Bool)

(declare-fun contains!7640 (List!28300 tuple2!21080) Bool)

(assert (=> b!1265488 (= e!720660 (contains!7640 (toList!9496 lt!573999) (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!139151 res!842454) b!1265487))

(assert (= (and b!1265487 res!842455) b!1265488))

(declare-fun m!1166309 () Bool)

(assert (=> d!139151 m!1166309))

(declare-fun m!1166311 () Bool)

(assert (=> d!139151 m!1166311))

(declare-fun m!1166313 () Bool)

(assert (=> d!139151 m!1166313))

(declare-fun m!1166315 () Bool)

(assert (=> d!139151 m!1166315))

(declare-fun m!1166317 () Bool)

(assert (=> b!1265487 m!1166317))

(declare-fun m!1166319 () Bool)

(assert (=> b!1265488 m!1166319))

(assert (=> b!1265361 d!139151))

(declare-fun d!139153 () Bool)

(declare-fun e!720661 () Bool)

(assert (=> d!139153 e!720661))

(declare-fun res!842456 () Bool)

(assert (=> d!139153 (=> (not res!842456) (not e!720661))))

(declare-fun lt!574003 () ListLongMap!18961)

(assert (=> d!139153 (= res!842456 (contains!7637 lt!574003 (_1!10551 lt!573915)))))

(declare-fun lt!574002 () List!28300)

(assert (=> d!139153 (= lt!574003 (ListLongMap!18962 lt!574002))))

(declare-fun lt!574001 () Unit!42101)

(declare-fun lt!574004 () Unit!42101)

(assert (=> d!139153 (= lt!574001 lt!574004)))

(assert (=> d!139153 (= (getValueByKey!665 lt!574002 (_1!10551 lt!573915)) (Some!715 (_2!10551 lt!573915)))))

(assert (=> d!139153 (= lt!574004 (lemmaContainsTupThenGetReturnValue!339 lt!574002 (_1!10551 lt!573915) (_2!10551 lt!573915)))))

(assert (=> d!139153 (= lt!574002 (insertStrictlySorted!453 (toList!9496 lt!573911) (_1!10551 lt!573915) (_2!10551 lt!573915)))))

(assert (=> d!139153 (= (+!4303 lt!573911 lt!573915) lt!574003)))

(declare-fun b!1265489 () Bool)

(declare-fun res!842457 () Bool)

(assert (=> b!1265489 (=> (not res!842457) (not e!720661))))

(assert (=> b!1265489 (= res!842457 (= (getValueByKey!665 (toList!9496 lt!574003) (_1!10551 lt!573915)) (Some!715 (_2!10551 lt!573915))))))

(declare-fun b!1265490 () Bool)

(assert (=> b!1265490 (= e!720661 (contains!7640 (toList!9496 lt!574003) lt!573915))))

(assert (= (and d!139153 res!842456) b!1265489))

(assert (= (and b!1265489 res!842457) b!1265490))

(declare-fun m!1166321 () Bool)

(assert (=> d!139153 m!1166321))

(declare-fun m!1166323 () Bool)

(assert (=> d!139153 m!1166323))

(declare-fun m!1166325 () Bool)

(assert (=> d!139153 m!1166325))

(declare-fun m!1166327 () Bool)

(assert (=> d!139153 m!1166327))

(declare-fun m!1166329 () Bool)

(assert (=> b!1265489 m!1166329))

(declare-fun m!1166331 () Bool)

(assert (=> b!1265490 m!1166331))

(assert (=> b!1265361 d!139153))

(declare-fun b!1265533 () Bool)

(declare-fun res!842483 () Bool)

(declare-fun e!720695 () Bool)

(assert (=> b!1265533 (=> (not res!842483) (not e!720695))))

(declare-fun e!720691 () Bool)

(assert (=> b!1265533 (= res!842483 e!720691)))

(declare-fun res!842484 () Bool)

(assert (=> b!1265533 (=> res!842484 e!720691)))

(declare-fun e!720692 () Bool)

(assert (=> b!1265533 (= res!842484 (not e!720692))))

(declare-fun res!842480 () Bool)

(assert (=> b!1265533 (=> (not res!842480) (not e!720692))))

(assert (=> b!1265533 (= res!842480 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun bm!62378 () Bool)

(declare-fun call!62381 () Bool)

(declare-fun lt!574056 () ListLongMap!18961)

(assert (=> bm!62378 (= call!62381 (contains!7637 lt!574056 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265534 () Bool)

(declare-fun e!720697 () ListLongMap!18961)

(declare-fun call!62386 () ListLongMap!18961)

(assert (=> b!1265534 (= e!720697 (+!4303 call!62386 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun d!139155 () Bool)

(assert (=> d!139155 e!720695))

(declare-fun res!842478 () Bool)

(assert (=> d!139155 (=> (not res!842478) (not e!720695))))

(assert (=> d!139155 (= res!842478 (or (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))))

(declare-fun lt!574054 () ListLongMap!18961)

(assert (=> d!139155 (= lt!574056 lt!574054)))

(declare-fun lt!574067 () Unit!42101)

(declare-fun e!720696 () Unit!42101)

(assert (=> d!139155 (= lt!574067 e!720696)))

(declare-fun c!123521 () Bool)

(declare-fun e!720689 () Bool)

(assert (=> d!139155 (= c!123521 e!720689)))

(declare-fun res!842481 () Bool)

(assert (=> d!139155 (=> (not res!842481) (not e!720689))))

(assert (=> d!139155 (= res!842481 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139155 (= lt!574054 e!720697)))

(declare-fun c!123522 () Bool)

(assert (=> d!139155 (= c!123522 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139155 (validMask!0 mask!1466)))

(assert (=> d!139155 (= (getCurrentListMap!4647 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!574056)))

(declare-fun b!1265535 () Bool)

(declare-fun res!842482 () Bool)

(assert (=> b!1265535 (=> (not res!842482) (not e!720695))))

(declare-fun e!720693 () Bool)

(assert (=> b!1265535 (= res!842482 e!720693)))

(declare-fun c!123519 () Bool)

(assert (=> b!1265535 (= c!123519 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62379 () Bool)

(declare-fun call!62383 () ListLongMap!18961)

(assert (=> bm!62379 (= call!62383 call!62386)))

(declare-fun b!1265536 () Bool)

(declare-fun e!720694 () ListLongMap!18961)

(assert (=> b!1265536 (= e!720697 e!720694)))

(declare-fun c!123520 () Bool)

(assert (=> b!1265536 (= c!123520 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62380 () Bool)

(declare-fun call!62385 () ListLongMap!18961)

(declare-fun call!62387 () ListLongMap!18961)

(assert (=> bm!62380 (= call!62385 call!62387)))

(declare-fun b!1265537 () Bool)

(declare-fun e!720690 () Bool)

(assert (=> b!1265537 (= e!720695 e!720690)))

(declare-fun c!123523 () Bool)

(assert (=> b!1265537 (= c!123523 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265538 () Bool)

(assert (=> b!1265538 (= e!720694 call!62383)))

(declare-fun b!1265539 () Bool)

(declare-fun call!62384 () Bool)

(assert (=> b!1265539 (= e!720693 (not call!62384))))

(declare-fun b!1265540 () Bool)

(declare-fun e!720688 () ListLongMap!18961)

(assert (=> b!1265540 (= e!720688 call!62383)))

(declare-fun call!62382 () ListLongMap!18961)

(declare-fun bm!62381 () Bool)

(assert (=> bm!62381 (= call!62386 (+!4303 (ite c!123522 call!62387 (ite c!123520 call!62385 call!62382)) (ite (or c!123522 c!123520) (tuple2!21081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun e!720700 () Bool)

(declare-fun b!1265541 () Bool)

(assert (=> b!1265541 (= e!720700 (= (apply!1013 lt!574056 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1265541 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40336 _values!914)))))

(assert (=> b!1265541 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265542 () Bool)

(declare-fun c!123524 () Bool)

(assert (=> b!1265542 (= c!123524 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1265542 (= e!720694 e!720688)))

(declare-fun b!1265543 () Bool)

(declare-fun e!720698 () Bool)

(assert (=> b!1265543 (= e!720693 e!720698)))

(declare-fun res!842477 () Bool)

(assert (=> b!1265543 (= res!842477 call!62384)))

(assert (=> b!1265543 (=> (not res!842477) (not e!720698))))

(declare-fun bm!62382 () Bool)

(assert (=> bm!62382 (= call!62384 (contains!7637 lt!574056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265544 () Bool)

(assert (=> b!1265544 (= e!720689 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265545 () Bool)

(declare-fun Unit!42105 () Unit!42101)

(assert (=> b!1265545 (= e!720696 Unit!42105)))

(declare-fun b!1265546 () Bool)

(assert (=> b!1265546 (= e!720691 e!720700)))

(declare-fun res!842479 () Bool)

(assert (=> b!1265546 (=> (not res!842479) (not e!720700))))

(assert (=> b!1265546 (= res!842479 (contains!7637 lt!574056 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265547 () Bool)

(assert (=> b!1265547 (= e!720688 call!62382)))

(declare-fun b!1265548 () Bool)

(declare-fun e!720699 () Bool)

(assert (=> b!1265548 (= e!720699 (= (apply!1013 lt!574056 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1265549 () Bool)

(assert (=> b!1265549 (= e!720690 (not call!62381))))

(declare-fun b!1265550 () Bool)

(assert (=> b!1265550 (= e!720698 (= (apply!1013 lt!574056 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1265551 () Bool)

(assert (=> b!1265551 (= e!720690 e!720699)))

(declare-fun res!842476 () Bool)

(assert (=> b!1265551 (= res!842476 call!62381)))

(assert (=> b!1265551 (=> (not res!842476) (not e!720699))))

(declare-fun bm!62383 () Bool)

(assert (=> bm!62383 (= call!62382 call!62385)))

(declare-fun bm!62384 () Bool)

(assert (=> bm!62384 (= call!62387 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265552 () Bool)

(assert (=> b!1265552 (= e!720692 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265553 () Bool)

(declare-fun lt!574057 () Unit!42101)

(assert (=> b!1265553 (= e!720696 lt!574057)))

(declare-fun lt!574063 () ListLongMap!18961)

(assert (=> b!1265553 (= lt!574063 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574065 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574066 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574066 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574049 () Unit!42101)

(declare-fun addStillContains!1102 (ListLongMap!18961 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!42101)

(assert (=> b!1265553 (= lt!574049 (addStillContains!1102 lt!574063 lt!574065 zeroValue!871 lt!574066))))

(assert (=> b!1265553 (contains!7637 (+!4303 lt!574063 (tuple2!21081 lt!574065 zeroValue!871)) lt!574066)))

(declare-fun lt!574070 () Unit!42101)

(assert (=> b!1265553 (= lt!574070 lt!574049)))

(declare-fun lt!574061 () ListLongMap!18961)

(assert (=> b!1265553 (= lt!574061 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574059 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574069 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574069 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574058 () Unit!42101)

(declare-fun addApplyDifferent!544 (ListLongMap!18961 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!42101)

(assert (=> b!1265553 (= lt!574058 (addApplyDifferent!544 lt!574061 lt!574059 minValueAfter!43 lt!574069))))

(assert (=> b!1265553 (= (apply!1013 (+!4303 lt!574061 (tuple2!21081 lt!574059 minValueAfter!43)) lt!574069) (apply!1013 lt!574061 lt!574069))))

(declare-fun lt!574055 () Unit!42101)

(assert (=> b!1265553 (= lt!574055 lt!574058)))

(declare-fun lt!574062 () ListLongMap!18961)

(assert (=> b!1265553 (= lt!574062 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574068 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574053 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574053 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574050 () Unit!42101)

(assert (=> b!1265553 (= lt!574050 (addApplyDifferent!544 lt!574062 lt!574068 zeroValue!871 lt!574053))))

(assert (=> b!1265553 (= (apply!1013 (+!4303 lt!574062 (tuple2!21081 lt!574068 zeroValue!871)) lt!574053) (apply!1013 lt!574062 lt!574053))))

(declare-fun lt!574052 () Unit!42101)

(assert (=> b!1265553 (= lt!574052 lt!574050)))

(declare-fun lt!574064 () ListLongMap!18961)

(assert (=> b!1265553 (= lt!574064 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574051 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574060 () (_ BitVec 64))

(assert (=> b!1265553 (= lt!574060 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265553 (= lt!574057 (addApplyDifferent!544 lt!574064 lt!574051 minValueAfter!43 lt!574060))))

(assert (=> b!1265553 (= (apply!1013 (+!4303 lt!574064 (tuple2!21081 lt!574051 minValueAfter!43)) lt!574060) (apply!1013 lt!574064 lt!574060))))

(assert (= (and d!139155 c!123522) b!1265534))

(assert (= (and d!139155 (not c!123522)) b!1265536))

(assert (= (and b!1265536 c!123520) b!1265538))

(assert (= (and b!1265536 (not c!123520)) b!1265542))

(assert (= (and b!1265542 c!123524) b!1265540))

(assert (= (and b!1265542 (not c!123524)) b!1265547))

(assert (= (or b!1265540 b!1265547) bm!62383))

(assert (= (or b!1265538 bm!62383) bm!62380))

(assert (= (or b!1265538 b!1265540) bm!62379))

(assert (= (or b!1265534 bm!62380) bm!62384))

(assert (= (or b!1265534 bm!62379) bm!62381))

(assert (= (and d!139155 res!842481) b!1265544))

(assert (= (and d!139155 c!123521) b!1265553))

(assert (= (and d!139155 (not c!123521)) b!1265545))

(assert (= (and d!139155 res!842478) b!1265533))

(assert (= (and b!1265533 res!842480) b!1265552))

(assert (= (and b!1265533 (not res!842484)) b!1265546))

(assert (= (and b!1265546 res!842479) b!1265541))

(assert (= (and b!1265533 res!842483) b!1265535))

(assert (= (and b!1265535 c!123519) b!1265543))

(assert (= (and b!1265535 (not c!123519)) b!1265539))

(assert (= (and b!1265543 res!842477) b!1265550))

(assert (= (or b!1265543 b!1265539) bm!62382))

(assert (= (and b!1265535 res!842482) b!1265537))

(assert (= (and b!1265537 c!123523) b!1265551))

(assert (= (and b!1265537 (not c!123523)) b!1265549))

(assert (= (and b!1265551 res!842476) b!1265548))

(assert (= (or b!1265551 b!1265549) bm!62378))

(declare-fun b_lambda!23017 () Bool)

(assert (=> (not b_lambda!23017) (not b!1265541)))

(assert (=> b!1265541 t!41817))

(declare-fun b_and!45559 () Bool)

(assert (= b_and!45557 (and (=> t!41817 result!23405) b_and!45559)))

(assert (=> b!1265552 m!1166253))

(assert (=> b!1265552 m!1166253))

(assert (=> b!1265552 m!1166255))

(assert (=> b!1265544 m!1166253))

(assert (=> b!1265544 m!1166253))

(assert (=> b!1265544 m!1166255))

(declare-fun m!1166333 () Bool)

(assert (=> bm!62382 m!1166333))

(assert (=> d!139155 m!1166163))

(declare-fun m!1166335 () Bool)

(assert (=> b!1265550 m!1166335))

(declare-fun m!1166337 () Bool)

(assert (=> bm!62378 m!1166337))

(assert (=> b!1265541 m!1166253))

(declare-fun m!1166339 () Bool)

(assert (=> b!1265541 m!1166339))

(assert (=> b!1265541 m!1166253))

(assert (=> b!1265541 m!1166271))

(assert (=> b!1265541 m!1166269))

(assert (=> b!1265541 m!1166271))

(assert (=> b!1265541 m!1166273))

(assert (=> b!1265541 m!1166269))

(declare-fun m!1166341 () Bool)

(assert (=> b!1265548 m!1166341))

(declare-fun m!1166343 () Bool)

(assert (=> b!1265534 m!1166343))

(assert (=> b!1265546 m!1166253))

(assert (=> b!1265546 m!1166253))

(declare-fun m!1166345 () Bool)

(assert (=> b!1265546 m!1166345))

(assert (=> bm!62384 m!1166185))

(assert (=> b!1265553 m!1166185))

(declare-fun m!1166347 () Bool)

(assert (=> b!1265553 m!1166347))

(declare-fun m!1166349 () Bool)

(assert (=> b!1265553 m!1166349))

(assert (=> b!1265553 m!1166253))

(declare-fun m!1166351 () Bool)

(assert (=> b!1265553 m!1166351))

(declare-fun m!1166353 () Bool)

(assert (=> b!1265553 m!1166353))

(declare-fun m!1166355 () Bool)

(assert (=> b!1265553 m!1166355))

(declare-fun m!1166357 () Bool)

(assert (=> b!1265553 m!1166357))

(declare-fun m!1166359 () Bool)

(assert (=> b!1265553 m!1166359))

(declare-fun m!1166361 () Bool)

(assert (=> b!1265553 m!1166361))

(declare-fun m!1166363 () Bool)

(assert (=> b!1265553 m!1166363))

(assert (=> b!1265553 m!1166359))

(declare-fun m!1166365 () Bool)

(assert (=> b!1265553 m!1166365))

(assert (=> b!1265553 m!1166347))

(declare-fun m!1166367 () Bool)

(assert (=> b!1265553 m!1166367))

(declare-fun m!1166369 () Bool)

(assert (=> b!1265553 m!1166369))

(declare-fun m!1166371 () Bool)

(assert (=> b!1265553 m!1166371))

(assert (=> b!1265553 m!1166369))

(declare-fun m!1166373 () Bool)

(assert (=> b!1265553 m!1166373))

(declare-fun m!1166375 () Bool)

(assert (=> b!1265553 m!1166375))

(assert (=> b!1265553 m!1166353))

(declare-fun m!1166377 () Bool)

(assert (=> bm!62381 m!1166377))

(assert (=> b!1265361 d!139155))

(declare-fun d!139157 () Bool)

(declare-fun e!720706 () Bool)

(assert (=> d!139157 e!720706))

(declare-fun res!842487 () Bool)

(assert (=> d!139157 (=> res!842487 e!720706)))

(declare-fun lt!574082 () Bool)

(assert (=> d!139157 (= res!842487 (not lt!574082))))

(declare-fun lt!574079 () Bool)

(assert (=> d!139157 (= lt!574082 lt!574079)))

(declare-fun lt!574080 () Unit!42101)

(declare-fun e!720705 () Unit!42101)

(assert (=> d!139157 (= lt!574080 e!720705)))

(declare-fun c!123527 () Bool)

(assert (=> d!139157 (= c!123527 lt!574079)))

(declare-fun containsKey!627 (List!28300 (_ BitVec 64)) Bool)

(assert (=> d!139157 (= lt!574079 (containsKey!627 (toList!9496 lt!573909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139157 (= (contains!7637 lt!573909 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574082)))

(declare-fun b!1265560 () Bool)

(declare-fun lt!574081 () Unit!42101)

(assert (=> b!1265560 (= e!720705 lt!574081)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!436 (List!28300 (_ BitVec 64)) Unit!42101)

(assert (=> b!1265560 (= lt!574081 (lemmaContainsKeyImpliesGetValueByKeyDefined!436 (toList!9496 lt!573909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!474 (Option!716) Bool)

(assert (=> b!1265560 (isDefined!474 (getValueByKey!665 (toList!9496 lt!573909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265561 () Bool)

(declare-fun Unit!42106 () Unit!42101)

(assert (=> b!1265561 (= e!720705 Unit!42106)))

(declare-fun b!1265562 () Bool)

(assert (=> b!1265562 (= e!720706 (isDefined!474 (getValueByKey!665 (toList!9496 lt!573909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139157 c!123527) b!1265560))

(assert (= (and d!139157 (not c!123527)) b!1265561))

(assert (= (and d!139157 (not res!842487)) b!1265562))

(declare-fun m!1166379 () Bool)

(assert (=> d!139157 m!1166379))

(declare-fun m!1166381 () Bool)

(assert (=> b!1265560 m!1166381))

(declare-fun m!1166383 () Bool)

(assert (=> b!1265560 m!1166383))

(assert (=> b!1265560 m!1166383))

(declare-fun m!1166385 () Bool)

(assert (=> b!1265560 m!1166385))

(assert (=> b!1265562 m!1166383))

(assert (=> b!1265562 m!1166383))

(assert (=> b!1265562 m!1166385))

(assert (=> b!1265361 d!139157))

(declare-fun b!1265563 () Bool)

(declare-fun res!842495 () Bool)

(declare-fun e!720714 () Bool)

(assert (=> b!1265563 (=> (not res!842495) (not e!720714))))

(declare-fun e!720710 () Bool)

(assert (=> b!1265563 (= res!842495 e!720710)))

(declare-fun res!842496 () Bool)

(assert (=> b!1265563 (=> res!842496 e!720710)))

(declare-fun e!720711 () Bool)

(assert (=> b!1265563 (= res!842496 (not e!720711))))

(declare-fun res!842492 () Bool)

(assert (=> b!1265563 (=> (not res!842492) (not e!720711))))

(assert (=> b!1265563 (= res!842492 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun bm!62385 () Bool)

(declare-fun call!62388 () Bool)

(declare-fun lt!574090 () ListLongMap!18961)

(assert (=> bm!62385 (= call!62388 (contains!7637 lt!574090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265564 () Bool)

(declare-fun e!720716 () ListLongMap!18961)

(declare-fun call!62393 () ListLongMap!18961)

(assert (=> b!1265564 (= e!720716 (+!4303 call!62393 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun d!139159 () Bool)

(assert (=> d!139159 e!720714))

(declare-fun res!842490 () Bool)

(assert (=> d!139159 (=> (not res!842490) (not e!720714))))

(assert (=> d!139159 (= res!842490 (or (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))))

(declare-fun lt!574088 () ListLongMap!18961)

(assert (=> d!139159 (= lt!574090 lt!574088)))

(declare-fun lt!574101 () Unit!42101)

(declare-fun e!720715 () Unit!42101)

(assert (=> d!139159 (= lt!574101 e!720715)))

(declare-fun c!123530 () Bool)

(declare-fun e!720708 () Bool)

(assert (=> d!139159 (= c!123530 e!720708)))

(declare-fun res!842493 () Bool)

(assert (=> d!139159 (=> (not res!842493) (not e!720708))))

(assert (=> d!139159 (= res!842493 (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139159 (= lt!574088 e!720716)))

(declare-fun c!123531 () Bool)

(assert (=> d!139159 (= c!123531 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139159 (validMask!0 mask!1466)))

(assert (=> d!139159 (= (getCurrentListMap!4647 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!574090)))

(declare-fun b!1265565 () Bool)

(declare-fun res!842494 () Bool)

(assert (=> b!1265565 (=> (not res!842494) (not e!720714))))

(declare-fun e!720712 () Bool)

(assert (=> b!1265565 (= res!842494 e!720712)))

(declare-fun c!123528 () Bool)

(assert (=> b!1265565 (= c!123528 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62386 () Bool)

(declare-fun call!62390 () ListLongMap!18961)

(assert (=> bm!62386 (= call!62390 call!62393)))

(declare-fun b!1265566 () Bool)

(declare-fun e!720713 () ListLongMap!18961)

(assert (=> b!1265566 (= e!720716 e!720713)))

(declare-fun c!123529 () Bool)

(assert (=> b!1265566 (= c!123529 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62387 () Bool)

(declare-fun call!62392 () ListLongMap!18961)

(declare-fun call!62394 () ListLongMap!18961)

(assert (=> bm!62387 (= call!62392 call!62394)))

(declare-fun b!1265567 () Bool)

(declare-fun e!720709 () Bool)

(assert (=> b!1265567 (= e!720714 e!720709)))

(declare-fun c!123532 () Bool)

(assert (=> b!1265567 (= c!123532 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265568 () Bool)

(assert (=> b!1265568 (= e!720713 call!62390)))

(declare-fun b!1265569 () Bool)

(declare-fun call!62391 () Bool)

(assert (=> b!1265569 (= e!720712 (not call!62391))))

(declare-fun b!1265570 () Bool)

(declare-fun e!720707 () ListLongMap!18961)

(assert (=> b!1265570 (= e!720707 call!62390)))

(declare-fun bm!62388 () Bool)

(declare-fun call!62389 () ListLongMap!18961)

(assert (=> bm!62388 (= call!62393 (+!4303 (ite c!123531 call!62394 (ite c!123529 call!62392 call!62389)) (ite (or c!123531 c!123529) (tuple2!21081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1265571 () Bool)

(declare-fun e!720719 () Bool)

(assert (=> b!1265571 (= e!720719 (= (apply!1013 lt!574090 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)) (get!20348 (select (arr!39799 _values!914) #b00000000000000000000000000000000) (dynLambda!3465 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1265571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40336 _values!914)))))

(assert (=> b!1265571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265572 () Bool)

(declare-fun c!123533 () Bool)

(assert (=> b!1265572 (= c!123533 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1265572 (= e!720713 e!720707)))

(declare-fun b!1265573 () Bool)

(declare-fun e!720717 () Bool)

(assert (=> b!1265573 (= e!720712 e!720717)))

(declare-fun res!842489 () Bool)

(assert (=> b!1265573 (= res!842489 call!62391)))

(assert (=> b!1265573 (=> (not res!842489) (not e!720717))))

(declare-fun bm!62389 () Bool)

(assert (=> bm!62389 (= call!62391 (contains!7637 lt!574090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265574 () Bool)

(assert (=> b!1265574 (= e!720708 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265575 () Bool)

(declare-fun Unit!42107 () Unit!42101)

(assert (=> b!1265575 (= e!720715 Unit!42107)))

(declare-fun b!1265576 () Bool)

(assert (=> b!1265576 (= e!720710 e!720719)))

(declare-fun res!842491 () Bool)

(assert (=> b!1265576 (=> (not res!842491) (not e!720719))))

(assert (=> b!1265576 (= res!842491 (contains!7637 lt!574090 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(declare-fun b!1265577 () Bool)

(assert (=> b!1265577 (= e!720707 call!62389)))

(declare-fun b!1265578 () Bool)

(declare-fun e!720718 () Bool)

(assert (=> b!1265578 (= e!720718 (= (apply!1013 lt!574090 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1265579 () Bool)

(assert (=> b!1265579 (= e!720709 (not call!62388))))

(declare-fun b!1265580 () Bool)

(assert (=> b!1265580 (= e!720717 (= (apply!1013 lt!574090 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1265581 () Bool)

(assert (=> b!1265581 (= e!720709 e!720718)))

(declare-fun res!842488 () Bool)

(assert (=> b!1265581 (= res!842488 call!62388)))

(assert (=> b!1265581 (=> (not res!842488) (not e!720718))))

(declare-fun bm!62390 () Bool)

(assert (=> bm!62390 (= call!62389 call!62392)))

(declare-fun bm!62391 () Bool)

(assert (=> bm!62391 (= call!62394 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265582 () Bool)

(assert (=> b!1265582 (= e!720711 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265583 () Bool)

(declare-fun lt!574091 () Unit!42101)

(assert (=> b!1265583 (= e!720715 lt!574091)))

(declare-fun lt!574097 () ListLongMap!18961)

(assert (=> b!1265583 (= lt!574097 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574099 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574100 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574100 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574083 () Unit!42101)

(assert (=> b!1265583 (= lt!574083 (addStillContains!1102 lt!574097 lt!574099 zeroValue!871 lt!574100))))

(assert (=> b!1265583 (contains!7637 (+!4303 lt!574097 (tuple2!21081 lt!574099 zeroValue!871)) lt!574100)))

(declare-fun lt!574104 () Unit!42101)

(assert (=> b!1265583 (= lt!574104 lt!574083)))

(declare-fun lt!574095 () ListLongMap!18961)

(assert (=> b!1265583 (= lt!574095 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574093 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574103 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574103 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574092 () Unit!42101)

(assert (=> b!1265583 (= lt!574092 (addApplyDifferent!544 lt!574095 lt!574093 minValueBefore!43 lt!574103))))

(assert (=> b!1265583 (= (apply!1013 (+!4303 lt!574095 (tuple2!21081 lt!574093 minValueBefore!43)) lt!574103) (apply!1013 lt!574095 lt!574103))))

(declare-fun lt!574089 () Unit!42101)

(assert (=> b!1265583 (= lt!574089 lt!574092)))

(declare-fun lt!574096 () ListLongMap!18961)

(assert (=> b!1265583 (= lt!574096 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574102 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574087 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574087 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574084 () Unit!42101)

(assert (=> b!1265583 (= lt!574084 (addApplyDifferent!544 lt!574096 lt!574102 zeroValue!871 lt!574087))))

(assert (=> b!1265583 (= (apply!1013 (+!4303 lt!574096 (tuple2!21081 lt!574102 zeroValue!871)) lt!574087) (apply!1013 lt!574096 lt!574087))))

(declare-fun lt!574086 () Unit!42101)

(assert (=> b!1265583 (= lt!574086 lt!574084)))

(declare-fun lt!574098 () ListLongMap!18961)

(assert (=> b!1265583 (= lt!574098 (getCurrentListMapNoExtraKeys!5899 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!574085 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!574094 () (_ BitVec 64))

(assert (=> b!1265583 (= lt!574094 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265583 (= lt!574091 (addApplyDifferent!544 lt!574098 lt!574085 minValueBefore!43 lt!574094))))

(assert (=> b!1265583 (= (apply!1013 (+!4303 lt!574098 (tuple2!21081 lt!574085 minValueBefore!43)) lt!574094) (apply!1013 lt!574098 lt!574094))))

(assert (= (and d!139159 c!123531) b!1265564))

(assert (= (and d!139159 (not c!123531)) b!1265566))

(assert (= (and b!1265566 c!123529) b!1265568))

(assert (= (and b!1265566 (not c!123529)) b!1265572))

(assert (= (and b!1265572 c!123533) b!1265570))

(assert (= (and b!1265572 (not c!123533)) b!1265577))

(assert (= (or b!1265570 b!1265577) bm!62390))

(assert (= (or b!1265568 bm!62390) bm!62387))

(assert (= (or b!1265568 b!1265570) bm!62386))

(assert (= (or b!1265564 bm!62387) bm!62391))

(assert (= (or b!1265564 bm!62386) bm!62388))

(assert (= (and d!139159 res!842493) b!1265574))

(assert (= (and d!139159 c!123530) b!1265583))

(assert (= (and d!139159 (not c!123530)) b!1265575))

(assert (= (and d!139159 res!842490) b!1265563))

(assert (= (and b!1265563 res!842492) b!1265582))

(assert (= (and b!1265563 (not res!842496)) b!1265576))

(assert (= (and b!1265576 res!842491) b!1265571))

(assert (= (and b!1265563 res!842495) b!1265565))

(assert (= (and b!1265565 c!123528) b!1265573))

(assert (= (and b!1265565 (not c!123528)) b!1265569))

(assert (= (and b!1265573 res!842489) b!1265580))

(assert (= (or b!1265573 b!1265569) bm!62389))

(assert (= (and b!1265565 res!842494) b!1265567))

(assert (= (and b!1265567 c!123532) b!1265581))

(assert (= (and b!1265567 (not c!123532)) b!1265579))

(assert (= (and b!1265581 res!842488) b!1265578))

(assert (= (or b!1265581 b!1265579) bm!62385))

(declare-fun b_lambda!23019 () Bool)

(assert (=> (not b_lambda!23019) (not b!1265571)))

(assert (=> b!1265571 t!41817))

(declare-fun b_and!45561 () Bool)

(assert (= b_and!45559 (and (=> t!41817 result!23405) b_and!45561)))

(assert (=> b!1265582 m!1166253))

(assert (=> b!1265582 m!1166253))

(assert (=> b!1265582 m!1166255))

(assert (=> b!1265574 m!1166253))

(assert (=> b!1265574 m!1166253))

(assert (=> b!1265574 m!1166255))

(declare-fun m!1166387 () Bool)

(assert (=> bm!62389 m!1166387))

(assert (=> d!139159 m!1166163))

(declare-fun m!1166389 () Bool)

(assert (=> b!1265580 m!1166389))

(declare-fun m!1166391 () Bool)

(assert (=> bm!62385 m!1166391))

(assert (=> b!1265571 m!1166253))

(declare-fun m!1166393 () Bool)

(assert (=> b!1265571 m!1166393))

(assert (=> b!1265571 m!1166253))

(assert (=> b!1265571 m!1166271))

(assert (=> b!1265571 m!1166269))

(assert (=> b!1265571 m!1166271))

(assert (=> b!1265571 m!1166273))

(assert (=> b!1265571 m!1166269))

(declare-fun m!1166395 () Bool)

(assert (=> b!1265578 m!1166395))

(declare-fun m!1166397 () Bool)

(assert (=> b!1265564 m!1166397))

(assert (=> b!1265576 m!1166253))

(assert (=> b!1265576 m!1166253))

(declare-fun m!1166399 () Bool)

(assert (=> b!1265576 m!1166399))

(assert (=> bm!62391 m!1166187))

(assert (=> b!1265583 m!1166187))

(declare-fun m!1166401 () Bool)

(assert (=> b!1265583 m!1166401))

(declare-fun m!1166403 () Bool)

(assert (=> b!1265583 m!1166403))

(assert (=> b!1265583 m!1166253))

(declare-fun m!1166405 () Bool)

(assert (=> b!1265583 m!1166405))

(declare-fun m!1166407 () Bool)

(assert (=> b!1265583 m!1166407))

(declare-fun m!1166409 () Bool)

(assert (=> b!1265583 m!1166409))

(declare-fun m!1166411 () Bool)

(assert (=> b!1265583 m!1166411))

(declare-fun m!1166413 () Bool)

(assert (=> b!1265583 m!1166413))

(declare-fun m!1166415 () Bool)

(assert (=> b!1265583 m!1166415))

(declare-fun m!1166417 () Bool)

(assert (=> b!1265583 m!1166417))

(assert (=> b!1265583 m!1166413))

(declare-fun m!1166419 () Bool)

(assert (=> b!1265583 m!1166419))

(assert (=> b!1265583 m!1166401))

(declare-fun m!1166421 () Bool)

(assert (=> b!1265583 m!1166421))

(declare-fun m!1166423 () Bool)

(assert (=> b!1265583 m!1166423))

(declare-fun m!1166425 () Bool)

(assert (=> b!1265583 m!1166425))

(assert (=> b!1265583 m!1166423))

(declare-fun m!1166427 () Bool)

(assert (=> b!1265583 m!1166427))

(declare-fun m!1166429 () Bool)

(assert (=> b!1265583 m!1166429))

(assert (=> b!1265583 m!1166407))

(declare-fun m!1166431 () Bool)

(assert (=> bm!62388 m!1166431))

(assert (=> b!1265361 d!139159))

(declare-fun d!139161 () Bool)

(assert (=> d!139161 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106390 d!139161))

(declare-fun d!139163 () Bool)

(assert (=> d!139163 (= (array_inv!30453 _keys!1118) (bvsge (size!40337 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106390 d!139163))

(declare-fun d!139165 () Bool)

(assert (=> d!139165 (= (array_inv!30454 _values!914) (bvsge (size!40336 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106390 d!139165))

(declare-fun d!139167 () Bool)

(declare-fun e!720720 () Bool)

(assert (=> d!139167 e!720720))

(declare-fun res!842497 () Bool)

(assert (=> d!139167 (=> (not res!842497) (not e!720720))))

(declare-fun lt!574107 () ListLongMap!18961)

(assert (=> d!139167 (= res!842497 (contains!7637 lt!574107 (_1!10551 lt!573915)))))

(declare-fun lt!574106 () List!28300)

(assert (=> d!139167 (= lt!574107 (ListLongMap!18962 lt!574106))))

(declare-fun lt!574105 () Unit!42101)

(declare-fun lt!574108 () Unit!42101)

(assert (=> d!139167 (= lt!574105 lt!574108)))

(assert (=> d!139167 (= (getValueByKey!665 lt!574106 (_1!10551 lt!573915)) (Some!715 (_2!10551 lt!573915)))))

(assert (=> d!139167 (= lt!574108 (lemmaContainsTupThenGetReturnValue!339 lt!574106 (_1!10551 lt!573915) (_2!10551 lt!573915)))))

(assert (=> d!139167 (= lt!574106 (insertStrictlySorted!453 (toList!9496 lt!573913) (_1!10551 lt!573915) (_2!10551 lt!573915)))))

(assert (=> d!139167 (= (+!4303 lt!573913 lt!573915) lt!574107)))

(declare-fun b!1265584 () Bool)

(declare-fun res!842498 () Bool)

(assert (=> b!1265584 (=> (not res!842498) (not e!720720))))

(assert (=> b!1265584 (= res!842498 (= (getValueByKey!665 (toList!9496 lt!574107) (_1!10551 lt!573915)) (Some!715 (_2!10551 lt!573915))))))

(declare-fun b!1265585 () Bool)

(assert (=> b!1265585 (= e!720720 (contains!7640 (toList!9496 lt!574107) lt!573915))))

(assert (= (and d!139167 res!842497) b!1265584))

(assert (= (and b!1265584 res!842498) b!1265585))

(declare-fun m!1166433 () Bool)

(assert (=> d!139167 m!1166433))

(declare-fun m!1166435 () Bool)

(assert (=> d!139167 m!1166435))

(declare-fun m!1166437 () Bool)

(assert (=> d!139167 m!1166437))

(declare-fun m!1166439 () Bool)

(assert (=> d!139167 m!1166439))

(declare-fun m!1166441 () Bool)

(assert (=> b!1265584 m!1166441))

(declare-fun m!1166443 () Bool)

(assert (=> b!1265585 m!1166443))

(assert (=> b!1265355 d!139167))

(declare-fun b!1265594 () Bool)

(declare-fun e!720728 () Bool)

(declare-fun call!62397 () Bool)

(assert (=> b!1265594 (= e!720728 call!62397)))

(declare-fun d!139169 () Bool)

(declare-fun res!842504 () Bool)

(declare-fun e!720729 () Bool)

(assert (=> d!139169 (=> res!842504 e!720729)))

(assert (=> d!139169 (= res!842504 (bvsge #b00000000000000000000000000000000 (size!40337 _keys!1118)))))

(assert (=> d!139169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!720729)))

(declare-fun b!1265595 () Bool)

(assert (=> b!1265595 (= e!720729 e!720728)))

(declare-fun c!123536 () Bool)

(assert (=> b!1265595 (= c!123536 (validKeyInArray!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265596 () Bool)

(declare-fun e!720727 () Bool)

(assert (=> b!1265596 (= e!720727 call!62397)))

(declare-fun b!1265597 () Bool)

(assert (=> b!1265597 (= e!720728 e!720727)))

(declare-fun lt!574116 () (_ BitVec 64))

(assert (=> b!1265597 (= lt!574116 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!574115 () Unit!42101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82523 (_ BitVec 64) (_ BitVec 32)) Unit!42101)

(assert (=> b!1265597 (= lt!574115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!574116 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1265597 (arrayContainsKey!0 _keys!1118 lt!574116 #b00000000000000000000000000000000)))

(declare-fun lt!574117 () Unit!42101)

(assert (=> b!1265597 (= lt!574117 lt!574115)))

(declare-fun res!842503 () Bool)

(declare-datatypes ((SeekEntryResult!9938 0))(
  ( (MissingZero!9938 (index!42123 (_ BitVec 32))) (Found!9938 (index!42124 (_ BitVec 32))) (Intermediate!9938 (undefined!10750 Bool) (index!42125 (_ BitVec 32)) (x!111363 (_ BitVec 32))) (Undefined!9938) (MissingVacant!9938 (index!42126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82523 (_ BitVec 32)) SeekEntryResult!9938)

(assert (=> b!1265597 (= res!842503 (= (seekEntryOrOpen!0 (select (arr!39800 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9938 #b00000000000000000000000000000000)))))

(assert (=> b!1265597 (=> (not res!842503) (not e!720727))))

(declare-fun bm!62394 () Bool)

(assert (=> bm!62394 (= call!62397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!139169 (not res!842504)) b!1265595))

(assert (= (and b!1265595 c!123536) b!1265597))

(assert (= (and b!1265595 (not c!123536)) b!1265594))

(assert (= (and b!1265597 res!842503) b!1265596))

(assert (= (or b!1265596 b!1265594) bm!62394))

(assert (=> b!1265595 m!1166253))

(assert (=> b!1265595 m!1166253))

(assert (=> b!1265595 m!1166255))

(assert (=> b!1265597 m!1166253))

(declare-fun m!1166445 () Bool)

(assert (=> b!1265597 m!1166445))

(declare-fun m!1166447 () Bool)

(assert (=> b!1265597 m!1166447))

(assert (=> b!1265597 m!1166253))

(declare-fun m!1166449 () Bool)

(assert (=> b!1265597 m!1166449))

(declare-fun m!1166451 () Bool)

(assert (=> bm!62394 m!1166451))

(assert (=> b!1265360 d!139169))

(declare-fun mapIsEmpty!50479 () Bool)

(declare-fun mapRes!50479 () Bool)

(assert (=> mapIsEmpty!50479 mapRes!50479))

(declare-fun condMapEmpty!50479 () Bool)

(declare-fun mapDefault!50479 () ValueCell!15449)

(assert (=> mapNonEmpty!50470 (= condMapEmpty!50479 (= mapRest!50470 ((as const (Array (_ BitVec 32) ValueCell!15449)) mapDefault!50479)))))

(declare-fun e!720734 () Bool)

(assert (=> mapNonEmpty!50470 (= tp!96130 (and e!720734 mapRes!50479))))

(declare-fun b!1265605 () Bool)

(assert (=> b!1265605 (= e!720734 tp_is_empty!32425)))

(declare-fun b!1265604 () Bool)

(declare-fun e!720735 () Bool)

(assert (=> b!1265604 (= e!720735 tp_is_empty!32425)))

(declare-fun mapNonEmpty!50479 () Bool)

(declare-fun tp!96146 () Bool)

(assert (=> mapNonEmpty!50479 (= mapRes!50479 (and tp!96146 e!720735))))

(declare-fun mapKey!50479 () (_ BitVec 32))

(declare-fun mapValue!50479 () ValueCell!15449)

(declare-fun mapRest!50479 () (Array (_ BitVec 32) ValueCell!15449))

(assert (=> mapNonEmpty!50479 (= mapRest!50470 (store mapRest!50479 mapKey!50479 mapValue!50479))))

(assert (= (and mapNonEmpty!50470 condMapEmpty!50479) mapIsEmpty!50479))

(assert (= (and mapNonEmpty!50470 (not condMapEmpty!50479)) mapNonEmpty!50479))

(assert (= (and mapNonEmpty!50479 ((_ is ValueCellFull!15449) mapValue!50479)) b!1265604))

(assert (= (and mapNonEmpty!50470 ((_ is ValueCellFull!15449) mapDefault!50479)) b!1265605))

(declare-fun m!1166453 () Bool)

(assert (=> mapNonEmpty!50479 m!1166453))

(declare-fun b_lambda!23021 () Bool)

(assert (= b_lambda!23015 (or (and start!106390 b_free!27523) b_lambda!23021)))

(declare-fun b_lambda!23023 () Bool)

(assert (= b_lambda!23019 (or (and start!106390 b_free!27523) b_lambda!23023)))

(declare-fun b_lambda!23025 () Bool)

(assert (= b_lambda!23009 (or (and start!106390 b_free!27523) b_lambda!23025)))

(declare-fun b_lambda!23027 () Bool)

(assert (= b_lambda!23013 (or (and start!106390 b_free!27523) b_lambda!23027)))

(declare-fun b_lambda!23029 () Bool)

(assert (= b_lambda!23017 (or (and start!106390 b_free!27523) b_lambda!23029)))

(declare-fun b_lambda!23031 () Bool)

(assert (= b_lambda!23011 (or (and start!106390 b_free!27523) b_lambda!23031)))

(check-sat (not b!1265431) (not b!1265475) (not d!139159) (not b!1265582) (not d!139149) (not b!1265580) (not b!1265534) (not bm!62384) (not b!1265585) (not bm!62388) (not b!1265477) (not b_next!27523) (not d!139157) (not d!139153) (not b_lambda!23025) (not bm!62391) (not b!1265578) (not bm!62394) (not bm!62381) (not b!1265488) (not d!139147) (not b!1265544) (not b!1265489) (not b!1265460) (not bm!62389) (not b_lambda!23029) (not bm!62378) (not b!1265481) (not b!1265461) (not b!1265463) (not b!1265457) (not b_lambda!23023) (not b!1265574) (not bm!62382) (not d!139145) (not d!139167) (not b!1265465) (not b_lambda!23021) (not b!1265553) (not b!1265462) (not b!1265471) (not b!1265459) (not mapNonEmpty!50479) (not b!1265597) (not b!1265595) (not b!1265473) (not b!1265548) (not bm!62385) (not b!1265541) (not b!1265571) b_and!45561 (not b!1265546) (not b!1265479) (not b!1265429) (not b!1265562) (not d!139151) (not b!1265550) tp_is_empty!32425 (not d!139155) (not b!1265467) (not b!1265428) (not b_lambda!23031) (not b!1265564) (not b!1265583) (not bm!62359) (not bm!62362) (not b!1265560) (not b!1265487) (not b!1265476) (not bm!62363) (not b!1265584) (not b!1265576) (not b!1265474) (not b!1265552) (not b!1265490) (not b_lambda!23027))
(check-sat b_and!45561 (not b_next!27523))
