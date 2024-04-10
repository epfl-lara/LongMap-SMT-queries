; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106006 () Bool)

(assert start!106006)

(declare-fun b_free!27477 () Bool)

(declare-fun b_next!27477 () Bool)

(assert (=> start!106006 (= b_free!27477 (not b_next!27477))))

(declare-fun tp!95975 () Bool)

(declare-fun b_and!45427 () Bool)

(assert (=> start!106006 (= tp!95975 b_and!45427)))

(declare-fun b!1262402 () Bool)

(declare-fun e!718604 () Bool)

(declare-fun e!718601 () Bool)

(assert (=> b!1262402 (= e!718604 e!718601)))

(declare-fun res!841046 () Bool)

(assert (=> b!1262402 (=> res!841046 e!718601)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262402 (= res!841046 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262404 () Bool)

(declare-fun e!718607 () Bool)

(declare-fun tp_is_empty!32379 () Bool)

(assert (=> b!1262404 (= e!718607 tp_is_empty!32379)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1262405 () Bool)

(declare-datatypes ((V!48537 0))(
  ( (V!48538 (val!16252 Int)) )
))
(declare-fun minValueAfter!43 () V!48537)

(declare-datatypes ((tuple2!21032 0))(
  ( (tuple2!21033 (_1!10527 (_ BitVec 64)) (_2!10527 V!48537)) )
))
(declare-datatypes ((List!28226 0))(
  ( (Nil!28223) (Cons!28222 (h!29431 tuple2!21032) (t!41733 List!28226)) )
))
(declare-datatypes ((ListLongMap!18905 0))(
  ( (ListLongMap!18906 (toList!9468 List!28226)) )
))
(declare-fun lt!572227 () ListLongMap!18905)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82374 0))(
  ( (array!82375 (arr!39736 (Array (_ BitVec 32) (_ BitVec 64))) (size!40272 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82374)

(declare-datatypes ((ValueCell!15426 0))(
  ( (ValueCellFull!15426 (v!18959 V!48537)) (EmptyCell!15426) )
))
(declare-datatypes ((array!82376 0))(
  ( (array!82377 (arr!39737 (Array (_ BitVec 32) ValueCell!15426)) (size!40273 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82376)

(declare-fun zeroValue!871 () V!48537)

(declare-fun e!718605 () Bool)

(declare-fun getCurrentListMap!4637 (array!82374 array!82376 (_ BitVec 32) (_ BitVec 32) V!48537 V!48537 (_ BitVec 32) Int) ListLongMap!18905)

(assert (=> b!1262405 (= e!718605 (= (getCurrentListMap!4637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572227))))

(declare-fun mapNonEmpty!50383 () Bool)

(declare-fun mapRes!50383 () Bool)

(declare-fun tp!95974 () Bool)

(declare-fun e!718602 () Bool)

(assert (=> mapNonEmpty!50383 (= mapRes!50383 (and tp!95974 e!718602))))

(declare-fun mapRest!50383 () (Array (_ BitVec 32) ValueCell!15426))

(declare-fun mapKey!50383 () (_ BitVec 32))

(declare-fun mapValue!50383 () ValueCell!15426)

(assert (=> mapNonEmpty!50383 (= (arr!39737 _values!914) (store mapRest!50383 mapKey!50383 mapValue!50383))))

(declare-fun b!1262406 () Bool)

(declare-fun res!841042 () Bool)

(declare-fun e!718603 () Bool)

(assert (=> b!1262406 (=> (not res!841042) (not e!718603))))

(declare-datatypes ((List!28227 0))(
  ( (Nil!28224) (Cons!28223 (h!29432 (_ BitVec 64)) (t!41734 List!28227)) )
))
(declare-fun arrayNoDuplicates!0 (array!82374 (_ BitVec 32) List!28227) Bool)

(assert (=> b!1262406 (= res!841042 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28224))))

(declare-fun b!1262407 () Bool)

(assert (=> b!1262407 (= e!718603 (not e!718605))))

(declare-fun res!841044 () Bool)

(assert (=> b!1262407 (=> res!841044 e!718605)))

(assert (=> b!1262407 (= res!841044 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1262407 e!718604))

(declare-fun res!841040 () Bool)

(assert (=> b!1262407 (=> (not res!841040) (not e!718604))))

(declare-fun lt!572228 () ListLongMap!18905)

(assert (=> b!1262407 (= res!841040 (= lt!572228 lt!572227))))

(declare-datatypes ((Unit!42080 0))(
  ( (Unit!42081) )
))
(declare-fun lt!572229 () Unit!42080)

(declare-fun minValueBefore!43 () V!48537)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1176 (array!82374 array!82376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48537 V!48537 V!48537 V!48537 (_ BitVec 32) Int) Unit!42080)

(assert (=> b!1262407 (= lt!572229 (lemmaNoChangeToArrayThenSameMapNoExtras!1176 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5834 (array!82374 array!82376 (_ BitVec 32) (_ BitVec 32) V!48537 V!48537 (_ BitVec 32) Int) ListLongMap!18905)

(assert (=> b!1262407 (= lt!572227 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262407 (= lt!572228 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262408 () Bool)

(assert (=> b!1262408 (= e!718602 tp_is_empty!32379)))

(declare-fun mapIsEmpty!50383 () Bool)

(assert (=> mapIsEmpty!50383 mapRes!50383))

(declare-fun b!1262409 () Bool)

(declare-fun res!841041 () Bool)

(assert (=> b!1262409 (=> (not res!841041) (not e!718603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82374 (_ BitVec 32)) Bool)

(assert (=> b!1262409 (= res!841041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262410 () Bool)

(declare-fun +!4244 (ListLongMap!18905 tuple2!21032) ListLongMap!18905)

(assert (=> b!1262410 (= e!718601 (= (getCurrentListMap!4637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4244 lt!572228 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262411 () Bool)

(declare-fun res!841045 () Bool)

(assert (=> b!1262411 (=> (not res!841045) (not e!718603))))

(assert (=> b!1262411 (= res!841045 (and (= (size!40273 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40272 _keys!1118) (size!40273 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262403 () Bool)

(declare-fun e!718606 () Bool)

(assert (=> b!1262403 (= e!718606 (and e!718607 mapRes!50383))))

(declare-fun condMapEmpty!50383 () Bool)

(declare-fun mapDefault!50383 () ValueCell!15426)

(assert (=> b!1262403 (= condMapEmpty!50383 (= (arr!39737 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15426)) mapDefault!50383)))))

(declare-fun res!841043 () Bool)

(assert (=> start!106006 (=> (not res!841043) (not e!718603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106006 (= res!841043 (validMask!0 mask!1466))))

(assert (=> start!106006 e!718603))

(assert (=> start!106006 true))

(assert (=> start!106006 tp!95975))

(assert (=> start!106006 tp_is_empty!32379))

(declare-fun array_inv!30247 (array!82374) Bool)

(assert (=> start!106006 (array_inv!30247 _keys!1118)))

(declare-fun array_inv!30248 (array!82376) Bool)

(assert (=> start!106006 (and (array_inv!30248 _values!914) e!718606)))

(assert (= (and start!106006 res!841043) b!1262411))

(assert (= (and b!1262411 res!841045) b!1262409))

(assert (= (and b!1262409 res!841041) b!1262406))

(assert (= (and b!1262406 res!841042) b!1262407))

(assert (= (and b!1262407 res!841040) b!1262402))

(assert (= (and b!1262402 (not res!841046)) b!1262410))

(assert (= (and b!1262407 (not res!841044)) b!1262405))

(assert (= (and b!1262403 condMapEmpty!50383) mapIsEmpty!50383))

(assert (= (and b!1262403 (not condMapEmpty!50383)) mapNonEmpty!50383))

(get-info :version)

(assert (= (and mapNonEmpty!50383 ((_ is ValueCellFull!15426) mapValue!50383)) b!1262408))

(assert (= (and b!1262403 ((_ is ValueCellFull!15426) mapDefault!50383)) b!1262404))

(assert (= start!106006 b!1262403))

(declare-fun m!1162917 () Bool)

(assert (=> mapNonEmpty!50383 m!1162917))

(declare-fun m!1162919 () Bool)

(assert (=> b!1262406 m!1162919))

(declare-fun m!1162921 () Bool)

(assert (=> start!106006 m!1162921))

(declare-fun m!1162923 () Bool)

(assert (=> start!106006 m!1162923))

(declare-fun m!1162925 () Bool)

(assert (=> start!106006 m!1162925))

(declare-fun m!1162927 () Bool)

(assert (=> b!1262410 m!1162927))

(declare-fun m!1162929 () Bool)

(assert (=> b!1262410 m!1162929))

(declare-fun m!1162931 () Bool)

(assert (=> b!1262407 m!1162931))

(declare-fun m!1162933 () Bool)

(assert (=> b!1262407 m!1162933))

(declare-fun m!1162935 () Bool)

(assert (=> b!1262407 m!1162935))

(declare-fun m!1162937 () Bool)

(assert (=> b!1262409 m!1162937))

(declare-fun m!1162939 () Bool)

(assert (=> b!1262405 m!1162939))

(check-sat (not b!1262405) (not b!1262410) (not b_next!27477) (not b!1262409) tp_is_empty!32379 b_and!45427 (not b!1262407) (not start!106006) (not b!1262406) (not mapNonEmpty!50383))
(check-sat b_and!45427 (not b_next!27477))
(get-model)

(declare-fun d!138537 () Bool)

(assert (=> d!138537 (= (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572241 () Unit!42080)

(declare-fun choose!1872 (array!82374 array!82376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48537 V!48537 V!48537 V!48537 (_ BitVec 32) Int) Unit!42080)

(assert (=> d!138537 (= lt!572241 (choose!1872 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138537 (validMask!0 mask!1466)))

(assert (=> d!138537 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1176 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572241)))

(declare-fun bs!35726 () Bool)

(assert (= bs!35726 d!138537))

(assert (=> bs!35726 m!1162935))

(assert (=> bs!35726 m!1162933))

(declare-fun m!1162965 () Bool)

(assert (=> bs!35726 m!1162965))

(assert (=> bs!35726 m!1162921))

(assert (=> b!1262407 d!138537))

(declare-fun b!1262466 () Bool)

(declare-fun e!718652 () Bool)

(declare-fun e!718646 () Bool)

(assert (=> b!1262466 (= e!718652 e!718646)))

(declare-fun c!122818 () Bool)

(declare-fun e!718650 () Bool)

(assert (=> b!1262466 (= c!122818 e!718650)))

(declare-fun res!841076 () Bool)

(assert (=> b!1262466 (=> (not res!841076) (not e!718650))))

(assert (=> b!1262466 (= res!841076 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262467 () Bool)

(declare-fun res!841078 () Bool)

(assert (=> b!1262467 (=> (not res!841078) (not e!718652))))

(declare-fun lt!572259 () ListLongMap!18905)

(declare-fun contains!7591 (ListLongMap!18905 (_ BitVec 64)) Bool)

(assert (=> b!1262467 (= res!841078 (not (contains!7591 lt!572259 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!62076 () ListLongMap!18905)

(declare-fun bm!62073 () Bool)

(assert (=> bm!62073 (= call!62076 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun e!718648 () Bool)

(declare-fun b!1262468 () Bool)

(assert (=> b!1262468 (= e!718648 (= lt!572259 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138539 () Bool)

(assert (=> d!138539 e!718652))

(declare-fun res!841079 () Bool)

(assert (=> d!138539 (=> (not res!841079) (not e!718652))))

(assert (=> d!138539 (= res!841079 (not (contains!7591 lt!572259 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718651 () ListLongMap!18905)

(assert (=> d!138539 (= lt!572259 e!718651)))

(declare-fun c!122817 () Bool)

(assert (=> d!138539 (= c!122817 (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138539 (validMask!0 mask!1466)))

(assert (=> d!138539 (= (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572259)))

(declare-fun b!1262469 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262469 (= e!718650 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262469 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262470 () Bool)

(declare-fun isEmpty!1040 (ListLongMap!18905) Bool)

(assert (=> b!1262470 (= e!718648 (isEmpty!1040 lt!572259))))

(declare-fun b!1262471 () Bool)

(declare-fun e!718649 () Bool)

(assert (=> b!1262471 (= e!718646 e!718649)))

(assert (=> b!1262471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun res!841077 () Bool)

(assert (=> b!1262471 (= res!841077 (contains!7591 lt!572259 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262471 (=> (not res!841077) (not e!718649))))

(declare-fun b!1262472 () Bool)

(assert (=> b!1262472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> b!1262472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40273 _values!914)))))

(declare-fun apply!998 (ListLongMap!18905 (_ BitVec 64)) V!48537)

(declare-fun get!20275 (ValueCell!15426 V!48537) V!48537)

(declare-fun dynLambda!3396 (Int (_ BitVec 64)) V!48537)

(assert (=> b!1262472 (= e!718649 (= (apply!998 lt!572259 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262473 () Bool)

(assert (=> b!1262473 (= e!718646 e!718648)))

(declare-fun c!122820 () Bool)

(assert (=> b!1262473 (= c!122820 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262474 () Bool)

(declare-fun e!718647 () ListLongMap!18905)

(assert (=> b!1262474 (= e!718647 call!62076)))

(declare-fun b!1262475 () Bool)

(declare-fun lt!572257 () Unit!42080)

(declare-fun lt!572261 () Unit!42080)

(assert (=> b!1262475 (= lt!572257 lt!572261)))

(declare-fun lt!572256 () (_ BitVec 64))

(declare-fun lt!572258 () V!48537)

(declare-fun lt!572262 () (_ BitVec 64))

(declare-fun lt!572260 () ListLongMap!18905)

(assert (=> b!1262475 (not (contains!7591 (+!4244 lt!572260 (tuple2!21033 lt!572256 lt!572258)) lt!572262))))

(declare-fun addStillNotContains!326 (ListLongMap!18905 (_ BitVec 64) V!48537 (_ BitVec 64)) Unit!42080)

(assert (=> b!1262475 (= lt!572261 (addStillNotContains!326 lt!572260 lt!572256 lt!572258 lt!572262))))

(assert (=> b!1262475 (= lt!572262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262475 (= lt!572258 (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262475 (= lt!572256 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262475 (= lt!572260 call!62076)))

(assert (=> b!1262475 (= e!718647 (+!4244 call!62076 (tuple2!21033 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262476 () Bool)

(assert (=> b!1262476 (= e!718651 e!718647)))

(declare-fun c!122819 () Bool)

(assert (=> b!1262476 (= c!122819 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262477 () Bool)

(assert (=> b!1262477 (= e!718651 (ListLongMap!18906 Nil!28223))))

(assert (= (and d!138539 c!122817) b!1262477))

(assert (= (and d!138539 (not c!122817)) b!1262476))

(assert (= (and b!1262476 c!122819) b!1262475))

(assert (= (and b!1262476 (not c!122819)) b!1262474))

(assert (= (or b!1262475 b!1262474) bm!62073))

(assert (= (and d!138539 res!841079) b!1262467))

(assert (= (and b!1262467 res!841078) b!1262466))

(assert (= (and b!1262466 res!841076) b!1262469))

(assert (= (and b!1262466 c!122818) b!1262471))

(assert (= (and b!1262466 (not c!122818)) b!1262473))

(assert (= (and b!1262471 res!841077) b!1262472))

(assert (= (and b!1262473 c!122820) b!1262468))

(assert (= (and b!1262473 (not c!122820)) b!1262470))

(declare-fun b_lambda!22875 () Bool)

(assert (=> (not b_lambda!22875) (not b!1262472)))

(declare-fun t!41738 () Bool)

(declare-fun tb!11323 () Bool)

(assert (=> (and start!106006 (= defaultEntry!922 defaultEntry!922) t!41738) tb!11323))

(declare-fun result!23377 () Bool)

(assert (=> tb!11323 (= result!23377 tp_is_empty!32379)))

(assert (=> b!1262472 t!41738))

(declare-fun b_and!45431 () Bool)

(assert (= b_and!45427 (and (=> t!41738 result!23377) b_and!45431)))

(declare-fun b_lambda!22877 () Bool)

(assert (=> (not b_lambda!22877) (not b!1262475)))

(assert (=> b!1262475 t!41738))

(declare-fun b_and!45433 () Bool)

(assert (= b_and!45431 (and (=> t!41738 result!23377) b_and!45433)))

(declare-fun m!1162967 () Bool)

(assert (=> b!1262475 m!1162967))

(declare-fun m!1162969 () Bool)

(assert (=> b!1262475 m!1162969))

(declare-fun m!1162971 () Bool)

(assert (=> b!1262475 m!1162971))

(declare-fun m!1162973 () Bool)

(assert (=> b!1262475 m!1162973))

(declare-fun m!1162975 () Bool)

(assert (=> b!1262475 m!1162975))

(declare-fun m!1162977 () Bool)

(assert (=> b!1262475 m!1162977))

(declare-fun m!1162979 () Bool)

(assert (=> b!1262475 m!1162979))

(assert (=> b!1262475 m!1162969))

(assert (=> b!1262475 m!1162967))

(declare-fun m!1162981 () Bool)

(assert (=> b!1262475 m!1162981))

(assert (=> b!1262475 m!1162977))

(declare-fun m!1162983 () Bool)

(assert (=> bm!62073 m!1162983))

(assert (=> b!1262469 m!1162973))

(assert (=> b!1262469 m!1162973))

(declare-fun m!1162985 () Bool)

(assert (=> b!1262469 m!1162985))

(declare-fun m!1162987 () Bool)

(assert (=> b!1262467 m!1162987))

(declare-fun m!1162989 () Bool)

(assert (=> b!1262470 m!1162989))

(declare-fun m!1162991 () Bool)

(assert (=> d!138539 m!1162991))

(assert (=> d!138539 m!1162921))

(assert (=> b!1262468 m!1162983))

(assert (=> b!1262471 m!1162973))

(assert (=> b!1262471 m!1162973))

(declare-fun m!1162993 () Bool)

(assert (=> b!1262471 m!1162993))

(assert (=> b!1262476 m!1162973))

(assert (=> b!1262476 m!1162973))

(assert (=> b!1262476 m!1162985))

(assert (=> b!1262472 m!1162967))

(assert (=> b!1262472 m!1162969))

(assert (=> b!1262472 m!1162971))

(assert (=> b!1262472 m!1162973))

(assert (=> b!1262472 m!1162967))

(assert (=> b!1262472 m!1162973))

(declare-fun m!1162995 () Bool)

(assert (=> b!1262472 m!1162995))

(assert (=> b!1262472 m!1162969))

(assert (=> b!1262407 d!138539))

(declare-fun b!1262480 () Bool)

(declare-fun e!718659 () Bool)

(declare-fun e!718653 () Bool)

(assert (=> b!1262480 (= e!718659 e!718653)))

(declare-fun c!122822 () Bool)

(declare-fun e!718657 () Bool)

(assert (=> b!1262480 (= c!122822 e!718657)))

(declare-fun res!841080 () Bool)

(assert (=> b!1262480 (=> (not res!841080) (not e!718657))))

(assert (=> b!1262480 (= res!841080 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262481 () Bool)

(declare-fun res!841082 () Bool)

(assert (=> b!1262481 (=> (not res!841082) (not e!718659))))

(declare-fun lt!572266 () ListLongMap!18905)

(assert (=> b!1262481 (= res!841082 (not (contains!7591 lt!572266 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!62077 () ListLongMap!18905)

(declare-fun bm!62074 () Bool)

(assert (=> bm!62074 (= call!62077 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun e!718655 () Bool)

(declare-fun b!1262482 () Bool)

(assert (=> b!1262482 (= e!718655 (= lt!572266 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138541 () Bool)

(assert (=> d!138541 e!718659))

(declare-fun res!841083 () Bool)

(assert (=> d!138541 (=> (not res!841083) (not e!718659))))

(assert (=> d!138541 (= res!841083 (not (contains!7591 lt!572266 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718658 () ListLongMap!18905)

(assert (=> d!138541 (= lt!572266 e!718658)))

(declare-fun c!122821 () Bool)

(assert (=> d!138541 (= c!122821 (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138541 (validMask!0 mask!1466)))

(assert (=> d!138541 (= (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572266)))

(declare-fun b!1262483 () Bool)

(assert (=> b!1262483 (= e!718657 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262483 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262484 () Bool)

(assert (=> b!1262484 (= e!718655 (isEmpty!1040 lt!572266))))

(declare-fun b!1262485 () Bool)

(declare-fun e!718656 () Bool)

(assert (=> b!1262485 (= e!718653 e!718656)))

(assert (=> b!1262485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun res!841081 () Bool)

(assert (=> b!1262485 (= res!841081 (contains!7591 lt!572266 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262485 (=> (not res!841081) (not e!718656))))

(declare-fun b!1262486 () Bool)

(assert (=> b!1262486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> b!1262486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40273 _values!914)))))

(assert (=> b!1262486 (= e!718656 (= (apply!998 lt!572266 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262487 () Bool)

(assert (=> b!1262487 (= e!718653 e!718655)))

(declare-fun c!122824 () Bool)

(assert (=> b!1262487 (= c!122824 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262488 () Bool)

(declare-fun e!718654 () ListLongMap!18905)

(assert (=> b!1262488 (= e!718654 call!62077)))

(declare-fun b!1262489 () Bool)

(declare-fun lt!572264 () Unit!42080)

(declare-fun lt!572268 () Unit!42080)

(assert (=> b!1262489 (= lt!572264 lt!572268)))

(declare-fun lt!572267 () ListLongMap!18905)

(declare-fun lt!572265 () V!48537)

(declare-fun lt!572269 () (_ BitVec 64))

(declare-fun lt!572263 () (_ BitVec 64))

(assert (=> b!1262489 (not (contains!7591 (+!4244 lt!572267 (tuple2!21033 lt!572263 lt!572265)) lt!572269))))

(assert (=> b!1262489 (= lt!572268 (addStillNotContains!326 lt!572267 lt!572263 lt!572265 lt!572269))))

(assert (=> b!1262489 (= lt!572269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262489 (= lt!572265 (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262489 (= lt!572263 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262489 (= lt!572267 call!62077)))

(assert (=> b!1262489 (= e!718654 (+!4244 call!62077 (tuple2!21033 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262490 () Bool)

(assert (=> b!1262490 (= e!718658 e!718654)))

(declare-fun c!122823 () Bool)

(assert (=> b!1262490 (= c!122823 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262491 () Bool)

(assert (=> b!1262491 (= e!718658 (ListLongMap!18906 Nil!28223))))

(assert (= (and d!138541 c!122821) b!1262491))

(assert (= (and d!138541 (not c!122821)) b!1262490))

(assert (= (and b!1262490 c!122823) b!1262489))

(assert (= (and b!1262490 (not c!122823)) b!1262488))

(assert (= (or b!1262489 b!1262488) bm!62074))

(assert (= (and d!138541 res!841083) b!1262481))

(assert (= (and b!1262481 res!841082) b!1262480))

(assert (= (and b!1262480 res!841080) b!1262483))

(assert (= (and b!1262480 c!122822) b!1262485))

(assert (= (and b!1262480 (not c!122822)) b!1262487))

(assert (= (and b!1262485 res!841081) b!1262486))

(assert (= (and b!1262487 c!122824) b!1262482))

(assert (= (and b!1262487 (not c!122824)) b!1262484))

(declare-fun b_lambda!22879 () Bool)

(assert (=> (not b_lambda!22879) (not b!1262486)))

(assert (=> b!1262486 t!41738))

(declare-fun b_and!45435 () Bool)

(assert (= b_and!45433 (and (=> t!41738 result!23377) b_and!45435)))

(declare-fun b_lambda!22881 () Bool)

(assert (=> (not b_lambda!22881) (not b!1262489)))

(assert (=> b!1262489 t!41738))

(declare-fun b_and!45437 () Bool)

(assert (= b_and!45435 (and (=> t!41738 result!23377) b_and!45437)))

(assert (=> b!1262489 m!1162967))

(assert (=> b!1262489 m!1162969))

(assert (=> b!1262489 m!1162971))

(assert (=> b!1262489 m!1162973))

(declare-fun m!1162997 () Bool)

(assert (=> b!1262489 m!1162997))

(declare-fun m!1162999 () Bool)

(assert (=> b!1262489 m!1162999))

(declare-fun m!1163001 () Bool)

(assert (=> b!1262489 m!1163001))

(assert (=> b!1262489 m!1162969))

(assert (=> b!1262489 m!1162967))

(declare-fun m!1163003 () Bool)

(assert (=> b!1262489 m!1163003))

(assert (=> b!1262489 m!1162999))

(declare-fun m!1163005 () Bool)

(assert (=> bm!62074 m!1163005))

(assert (=> b!1262483 m!1162973))

(assert (=> b!1262483 m!1162973))

(assert (=> b!1262483 m!1162985))

(declare-fun m!1163007 () Bool)

(assert (=> b!1262481 m!1163007))

(declare-fun m!1163009 () Bool)

(assert (=> b!1262484 m!1163009))

(declare-fun m!1163011 () Bool)

(assert (=> d!138541 m!1163011))

(assert (=> d!138541 m!1162921))

(assert (=> b!1262482 m!1163005))

(assert (=> b!1262485 m!1162973))

(assert (=> b!1262485 m!1162973))

(declare-fun m!1163013 () Bool)

(assert (=> b!1262485 m!1163013))

(assert (=> b!1262490 m!1162973))

(assert (=> b!1262490 m!1162973))

(assert (=> b!1262490 m!1162985))

(assert (=> b!1262486 m!1162967))

(assert (=> b!1262486 m!1162969))

(assert (=> b!1262486 m!1162971))

(assert (=> b!1262486 m!1162973))

(assert (=> b!1262486 m!1162967))

(assert (=> b!1262486 m!1162973))

(declare-fun m!1163015 () Bool)

(assert (=> b!1262486 m!1163015))

(assert (=> b!1262486 m!1162969))

(assert (=> b!1262407 d!138541))

(declare-fun b!1262502 () Bool)

(declare-fun e!718670 () Bool)

(declare-fun e!718671 () Bool)

(assert (=> b!1262502 (= e!718670 e!718671)))

(declare-fun res!841092 () Bool)

(assert (=> b!1262502 (=> (not res!841092) (not e!718671))))

(declare-fun e!718668 () Bool)

(assert (=> b!1262502 (= res!841092 (not e!718668))))

(declare-fun res!841090 () Bool)

(assert (=> b!1262502 (=> (not res!841090) (not e!718668))))

(assert (=> b!1262502 (= res!841090 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262503 () Bool)

(declare-fun contains!7592 (List!28227 (_ BitVec 64)) Bool)

(assert (=> b!1262503 (= e!718668 (contains!7592 Nil!28224 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138543 () Bool)

(declare-fun res!841091 () Bool)

(assert (=> d!138543 (=> res!841091 e!718670)))

(assert (=> d!138543 (= res!841091 (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138543 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28224) e!718670)))

(declare-fun bm!62077 () Bool)

(declare-fun call!62080 () Bool)

(declare-fun c!122827 () Bool)

(assert (=> bm!62077 (= call!62080 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122827 (Cons!28223 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000) Nil!28224) Nil!28224)))))

(declare-fun b!1262504 () Bool)

(declare-fun e!718669 () Bool)

(assert (=> b!1262504 (= e!718669 call!62080)))

(declare-fun b!1262505 () Bool)

(assert (=> b!1262505 (= e!718671 e!718669)))

(assert (=> b!1262505 (= c!122827 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262506 () Bool)

(assert (=> b!1262506 (= e!718669 call!62080)))

(assert (= (and d!138543 (not res!841091)) b!1262502))

(assert (= (and b!1262502 res!841090) b!1262503))

(assert (= (and b!1262502 res!841092) b!1262505))

(assert (= (and b!1262505 c!122827) b!1262506))

(assert (= (and b!1262505 (not c!122827)) b!1262504))

(assert (= (or b!1262506 b!1262504) bm!62077))

(assert (=> b!1262502 m!1162973))

(assert (=> b!1262502 m!1162973))

(assert (=> b!1262502 m!1162985))

(assert (=> b!1262503 m!1162973))

(assert (=> b!1262503 m!1162973))

(declare-fun m!1163017 () Bool)

(assert (=> b!1262503 m!1163017))

(assert (=> bm!62077 m!1162973))

(declare-fun m!1163019 () Bool)

(assert (=> bm!62077 m!1163019))

(assert (=> b!1262505 m!1162973))

(assert (=> b!1262505 m!1162973))

(assert (=> b!1262505 m!1162985))

(assert (=> b!1262406 d!138543))

(declare-fun b!1262549 () Bool)

(declare-fun e!718703 () Bool)

(declare-fun e!718699 () Bool)

(assert (=> b!1262549 (= e!718703 e!718699)))

(declare-fun res!841111 () Bool)

(declare-fun call!62097 () Bool)

(assert (=> b!1262549 (= res!841111 call!62097)))

(assert (=> b!1262549 (=> (not res!841111) (not e!718699))))

(declare-fun b!1262550 () Bool)

(declare-fun e!718710 () ListLongMap!18905)

(declare-fun call!62096 () ListLongMap!18905)

(assert (=> b!1262550 (= e!718710 call!62096)))

(declare-fun b!1262551 () Bool)

(declare-fun res!841117 () Bool)

(declare-fun e!718705 () Bool)

(assert (=> b!1262551 (=> (not res!841117) (not e!718705))))

(declare-fun e!718706 () Bool)

(assert (=> b!1262551 (= res!841117 e!718706)))

(declare-fun res!841116 () Bool)

(assert (=> b!1262551 (=> res!841116 e!718706)))

(declare-fun e!718698 () Bool)

(assert (=> b!1262551 (= res!841116 (not e!718698))))

(declare-fun res!841112 () Bool)

(assert (=> b!1262551 (=> (not res!841112) (not e!718698))))

(assert (=> b!1262551 (= res!841112 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262552 () Bool)

(declare-fun lt!572325 () ListLongMap!18905)

(declare-fun e!718708 () Bool)

(assert (=> b!1262552 (= e!718708 (= (apply!998 lt!572325 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40273 _values!914)))))

(assert (=> b!1262552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262553 () Bool)

(declare-fun e!718701 () ListLongMap!18905)

(declare-fun call!62099 () ListLongMap!18905)

(assert (=> b!1262553 (= e!718701 call!62099)))

(declare-fun call!62100 () ListLongMap!18905)

(declare-fun bm!62092 () Bool)

(assert (=> bm!62092 (= call!62100 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262554 () Bool)

(declare-fun e!718702 () Bool)

(assert (=> b!1262554 (= e!718702 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62093 () Bool)

(declare-fun call!62101 () ListLongMap!18905)

(assert (=> bm!62093 (= call!62096 call!62101)))

(declare-fun b!1262555 () Bool)

(declare-fun e!718704 () Bool)

(assert (=> b!1262555 (= e!718704 (= (apply!998 lt!572325 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262556 () Bool)

(assert (=> b!1262556 (= e!718699 (= (apply!998 lt!572325 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62094 () Bool)

(declare-fun call!62098 () Bool)

(assert (=> bm!62094 (= call!62098 (contains!7591 lt!572325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262557 () Bool)

(declare-fun e!718700 () ListLongMap!18905)

(assert (=> b!1262557 (= e!718700 e!718710)))

(declare-fun c!122840 () Bool)

(assert (=> b!1262557 (= c!122840 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262559 () Bool)

(declare-fun e!718707 () Bool)

(assert (=> b!1262559 (= e!718707 e!718704)))

(declare-fun res!841115 () Bool)

(assert (=> b!1262559 (= res!841115 call!62098)))

(assert (=> b!1262559 (=> (not res!841115) (not e!718704))))

(declare-fun b!1262560 () Bool)

(declare-fun e!718709 () Unit!42080)

(declare-fun Unit!42084 () Unit!42080)

(assert (=> b!1262560 (= e!718709 Unit!42084)))

(declare-fun b!1262561 () Bool)

(assert (=> b!1262561 (= e!718707 (not call!62098))))

(declare-fun b!1262562 () Bool)

(declare-fun lt!572328 () Unit!42080)

(assert (=> b!1262562 (= e!718709 lt!572328)))

(declare-fun lt!572316 () ListLongMap!18905)

(assert (=> b!1262562 (= lt!572316 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572317 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572318 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572318 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572315 () Unit!42080)

(declare-fun addStillContains!1088 (ListLongMap!18905 (_ BitVec 64) V!48537 (_ BitVec 64)) Unit!42080)

(assert (=> b!1262562 (= lt!572315 (addStillContains!1088 lt!572316 lt!572317 zeroValue!871 lt!572318))))

(assert (=> b!1262562 (contains!7591 (+!4244 lt!572316 (tuple2!21033 lt!572317 zeroValue!871)) lt!572318)))

(declare-fun lt!572314 () Unit!42080)

(assert (=> b!1262562 (= lt!572314 lt!572315)))

(declare-fun lt!572335 () ListLongMap!18905)

(assert (=> b!1262562 (= lt!572335 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572323 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572330 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572330 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572326 () Unit!42080)

(declare-fun addApplyDifferent!542 (ListLongMap!18905 (_ BitVec 64) V!48537 (_ BitVec 64)) Unit!42080)

(assert (=> b!1262562 (= lt!572326 (addApplyDifferent!542 lt!572335 lt!572323 minValueBefore!43 lt!572330))))

(assert (=> b!1262562 (= (apply!998 (+!4244 lt!572335 (tuple2!21033 lt!572323 minValueBefore!43)) lt!572330) (apply!998 lt!572335 lt!572330))))

(declare-fun lt!572327 () Unit!42080)

(assert (=> b!1262562 (= lt!572327 lt!572326)))

(declare-fun lt!572333 () ListLongMap!18905)

(assert (=> b!1262562 (= lt!572333 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572324 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572322 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572322 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572319 () Unit!42080)

(assert (=> b!1262562 (= lt!572319 (addApplyDifferent!542 lt!572333 lt!572324 zeroValue!871 lt!572322))))

(assert (=> b!1262562 (= (apply!998 (+!4244 lt!572333 (tuple2!21033 lt!572324 zeroValue!871)) lt!572322) (apply!998 lt!572333 lt!572322))))

(declare-fun lt!572332 () Unit!42080)

(assert (=> b!1262562 (= lt!572332 lt!572319)))

(declare-fun lt!572320 () ListLongMap!18905)

(assert (=> b!1262562 (= lt!572320 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572334 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572334 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572331 () (_ BitVec 64))

(assert (=> b!1262562 (= lt!572331 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262562 (= lt!572328 (addApplyDifferent!542 lt!572320 lt!572334 minValueBefore!43 lt!572331))))

(assert (=> b!1262562 (= (apply!998 (+!4244 lt!572320 (tuple2!21033 lt!572334 minValueBefore!43)) lt!572331) (apply!998 lt!572320 lt!572331))))

(declare-fun b!1262563 () Bool)

(assert (=> b!1262563 (= e!718706 e!718708)))

(declare-fun res!841114 () Bool)

(assert (=> b!1262563 (=> (not res!841114) (not e!718708))))

(assert (=> b!1262563 (= res!841114 (contains!7591 lt!572325 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun bm!62095 () Bool)

(declare-fun call!62095 () ListLongMap!18905)

(assert (=> bm!62095 (= call!62099 call!62095)))

(declare-fun b!1262564 () Bool)

(assert (=> b!1262564 (= e!718705 e!718703)))

(declare-fun c!122845 () Bool)

(assert (=> b!1262564 (= c!122845 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62096 () Bool)

(assert (=> bm!62096 (= call!62095 call!62100)))

(declare-fun b!1262565 () Bool)

(assert (=> b!1262565 (= e!718698 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262566 () Bool)

(assert (=> b!1262566 (= e!718700 (+!4244 call!62101 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62097 () Bool)

(declare-fun c!122843 () Bool)

(assert (=> bm!62097 (= call!62101 (+!4244 (ite c!122843 call!62100 (ite c!122840 call!62095 call!62099)) (ite (or c!122843 c!122840) (tuple2!21033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262567 () Bool)

(assert (=> b!1262567 (= e!718703 (not call!62097))))

(declare-fun bm!62098 () Bool)

(assert (=> bm!62098 (= call!62097 (contains!7591 lt!572325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262568 () Bool)

(assert (=> b!1262568 (= e!718701 call!62096)))

(declare-fun b!1262569 () Bool)

(declare-fun res!841118 () Bool)

(assert (=> b!1262569 (=> (not res!841118) (not e!718705))))

(assert (=> b!1262569 (= res!841118 e!718707)))

(declare-fun c!122842 () Bool)

(assert (=> b!1262569 (= c!122842 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!138545 () Bool)

(assert (=> d!138545 e!718705))

(declare-fun res!841119 () Bool)

(assert (=> d!138545 (=> (not res!841119) (not e!718705))))

(assert (=> d!138545 (= res!841119 (or (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))))

(declare-fun lt!572321 () ListLongMap!18905)

(assert (=> d!138545 (= lt!572325 lt!572321)))

(declare-fun lt!572329 () Unit!42080)

(assert (=> d!138545 (= lt!572329 e!718709)))

(declare-fun c!122841 () Bool)

(assert (=> d!138545 (= c!122841 e!718702)))

(declare-fun res!841113 () Bool)

(assert (=> d!138545 (=> (not res!841113) (not e!718702))))

(assert (=> d!138545 (= res!841113 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138545 (= lt!572321 e!718700)))

(assert (=> d!138545 (= c!122843 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138545 (validMask!0 mask!1466)))

(assert (=> d!138545 (= (getCurrentListMap!4637 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572325)))

(declare-fun b!1262558 () Bool)

(declare-fun c!122844 () Bool)

(assert (=> b!1262558 (= c!122844 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262558 (= e!718710 e!718701)))

(assert (= (and d!138545 c!122843) b!1262566))

(assert (= (and d!138545 (not c!122843)) b!1262557))

(assert (= (and b!1262557 c!122840) b!1262550))

(assert (= (and b!1262557 (not c!122840)) b!1262558))

(assert (= (and b!1262558 c!122844) b!1262568))

(assert (= (and b!1262558 (not c!122844)) b!1262553))

(assert (= (or b!1262568 b!1262553) bm!62095))

(assert (= (or b!1262550 bm!62095) bm!62096))

(assert (= (or b!1262550 b!1262568) bm!62093))

(assert (= (or b!1262566 bm!62096) bm!62092))

(assert (= (or b!1262566 bm!62093) bm!62097))

(assert (= (and d!138545 res!841113) b!1262554))

(assert (= (and d!138545 c!122841) b!1262562))

(assert (= (and d!138545 (not c!122841)) b!1262560))

(assert (= (and d!138545 res!841119) b!1262551))

(assert (= (and b!1262551 res!841112) b!1262565))

(assert (= (and b!1262551 (not res!841116)) b!1262563))

(assert (= (and b!1262563 res!841114) b!1262552))

(assert (= (and b!1262551 res!841117) b!1262569))

(assert (= (and b!1262569 c!122842) b!1262559))

(assert (= (and b!1262569 (not c!122842)) b!1262561))

(assert (= (and b!1262559 res!841115) b!1262555))

(assert (= (or b!1262559 b!1262561) bm!62094))

(assert (= (and b!1262569 res!841118) b!1262564))

(assert (= (and b!1262564 c!122845) b!1262549))

(assert (= (and b!1262564 (not c!122845)) b!1262567))

(assert (= (and b!1262549 res!841111) b!1262556))

(assert (= (or b!1262549 b!1262567) bm!62098))

(declare-fun b_lambda!22883 () Bool)

(assert (=> (not b_lambda!22883) (not b!1262552)))

(assert (=> b!1262552 t!41738))

(declare-fun b_and!45439 () Bool)

(assert (= b_and!45437 (and (=> t!41738 result!23377) b_and!45439)))

(declare-fun m!1163021 () Bool)

(assert (=> b!1262562 m!1163021))

(declare-fun m!1163023 () Bool)

(assert (=> b!1262562 m!1163023))

(declare-fun m!1163025 () Bool)

(assert (=> b!1262562 m!1163025))

(declare-fun m!1163027 () Bool)

(assert (=> b!1262562 m!1163027))

(declare-fun m!1163029 () Bool)

(assert (=> b!1262562 m!1163029))

(declare-fun m!1163031 () Bool)

(assert (=> b!1262562 m!1163031))

(assert (=> b!1262562 m!1162973))

(declare-fun m!1163033 () Bool)

(assert (=> b!1262562 m!1163033))

(declare-fun m!1163035 () Bool)

(assert (=> b!1262562 m!1163035))

(declare-fun m!1163037 () Bool)

(assert (=> b!1262562 m!1163037))

(declare-fun m!1163039 () Bool)

(assert (=> b!1262562 m!1163039))

(assert (=> b!1262562 m!1163029))

(assert (=> b!1262562 m!1162935))

(declare-fun m!1163041 () Bool)

(assert (=> b!1262562 m!1163041))

(assert (=> b!1262562 m!1163033))

(declare-fun m!1163043 () Bool)

(assert (=> b!1262562 m!1163043))

(declare-fun m!1163045 () Bool)

(assert (=> b!1262562 m!1163045))

(assert (=> b!1262562 m!1163023))

(declare-fun m!1163047 () Bool)

(assert (=> b!1262562 m!1163047))

(declare-fun m!1163049 () Bool)

(assert (=> b!1262562 m!1163049))

(assert (=> b!1262562 m!1163025))

(declare-fun m!1163051 () Bool)

(assert (=> bm!62097 m!1163051))

(assert (=> b!1262565 m!1162973))

(assert (=> b!1262565 m!1162973))

(assert (=> b!1262565 m!1162985))

(assert (=> bm!62092 m!1162935))

(declare-fun m!1163053 () Bool)

(assert (=> bm!62098 m!1163053))

(declare-fun m!1163055 () Bool)

(assert (=> b!1262556 m!1163055))

(assert (=> b!1262554 m!1162973))

(assert (=> b!1262554 m!1162973))

(assert (=> b!1262554 m!1162985))

(declare-fun m!1163057 () Bool)

(assert (=> b!1262555 m!1163057))

(assert (=> d!138545 m!1162921))

(assert (=> b!1262563 m!1162973))

(assert (=> b!1262563 m!1162973))

(declare-fun m!1163059 () Bool)

(assert (=> b!1262563 m!1163059))

(assert (=> b!1262552 m!1162967))

(assert (=> b!1262552 m!1162969))

(assert (=> b!1262552 m!1162971))

(assert (=> b!1262552 m!1162967))

(assert (=> b!1262552 m!1162973))

(declare-fun m!1163061 () Bool)

(assert (=> b!1262552 m!1163061))

(assert (=> b!1262552 m!1162973))

(assert (=> b!1262552 m!1162969))

(declare-fun m!1163063 () Bool)

(assert (=> b!1262566 m!1163063))

(declare-fun m!1163065 () Bool)

(assert (=> bm!62094 m!1163065))

(assert (=> b!1262410 d!138545))

(declare-fun d!138547 () Bool)

(declare-fun e!718713 () Bool)

(assert (=> d!138547 e!718713))

(declare-fun res!841124 () Bool)

(assert (=> d!138547 (=> (not res!841124) (not e!718713))))

(declare-fun lt!572347 () ListLongMap!18905)

(assert (=> d!138547 (= res!841124 (contains!7591 lt!572347 (_1!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572345 () List!28226)

(assert (=> d!138547 (= lt!572347 (ListLongMap!18906 lt!572345))))

(declare-fun lt!572346 () Unit!42080)

(declare-fun lt!572344 () Unit!42080)

(assert (=> d!138547 (= lt!572346 lt!572344)))

(declare-datatypes ((Option!714 0))(
  ( (Some!713 (v!18961 V!48537)) (None!712) )
))
(declare-fun getValueByKey!663 (List!28226 (_ BitVec 64)) Option!714)

(assert (=> d!138547 (= (getValueByKey!663 lt!572345 (_1!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!713 (_2!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!334 (List!28226 (_ BitVec 64) V!48537) Unit!42080)

(assert (=> d!138547 (= lt!572344 (lemmaContainsTupThenGetReturnValue!334 lt!572345 (_1!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!448 (List!28226 (_ BitVec 64) V!48537) List!28226)

(assert (=> d!138547 (= lt!572345 (insertStrictlySorted!448 (toList!9468 lt!572228) (_1!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138547 (= (+!4244 lt!572228 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572347)))

(declare-fun b!1262574 () Bool)

(declare-fun res!841125 () Bool)

(assert (=> b!1262574 (=> (not res!841125) (not e!718713))))

(assert (=> b!1262574 (= res!841125 (= (getValueByKey!663 (toList!9468 lt!572347) (_1!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!713 (_2!10527 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262575 () Bool)

(declare-fun contains!7593 (List!28226 tuple2!21032) Bool)

(assert (=> b!1262575 (= e!718713 (contains!7593 (toList!9468 lt!572347) (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138547 res!841124) b!1262574))

(assert (= (and b!1262574 res!841125) b!1262575))

(declare-fun m!1163067 () Bool)

(assert (=> d!138547 m!1163067))

(declare-fun m!1163069 () Bool)

(assert (=> d!138547 m!1163069))

(declare-fun m!1163071 () Bool)

(assert (=> d!138547 m!1163071))

(declare-fun m!1163073 () Bool)

(assert (=> d!138547 m!1163073))

(declare-fun m!1163075 () Bool)

(assert (=> b!1262574 m!1163075))

(declare-fun m!1163077 () Bool)

(assert (=> b!1262575 m!1163077))

(assert (=> b!1262410 d!138547))

(declare-fun b!1262584 () Bool)

(declare-fun e!718720 () Bool)

(declare-fun call!62104 () Bool)

(assert (=> b!1262584 (= e!718720 call!62104)))

(declare-fun b!1262585 () Bool)

(declare-fun e!718721 () Bool)

(assert (=> b!1262585 (= e!718721 call!62104)))

(declare-fun b!1262586 () Bool)

(assert (=> b!1262586 (= e!718721 e!718720)))

(declare-fun lt!572356 () (_ BitVec 64))

(assert (=> b!1262586 (= lt!572356 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572355 () Unit!42080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82374 (_ BitVec 64) (_ BitVec 32)) Unit!42080)

(assert (=> b!1262586 (= lt!572355 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262586 (arrayContainsKey!0 _keys!1118 lt!572356 #b00000000000000000000000000000000)))

(declare-fun lt!572354 () Unit!42080)

(assert (=> b!1262586 (= lt!572354 lt!572355)))

(declare-fun res!841131 () Bool)

(declare-datatypes ((SeekEntryResult!9976 0))(
  ( (MissingZero!9976 (index!42275 (_ BitVec 32))) (Found!9976 (index!42276 (_ BitVec 32))) (Intermediate!9976 (undefined!10788 Bool) (index!42277 (_ BitVec 32)) (x!111249 (_ BitVec 32))) (Undefined!9976) (MissingVacant!9976 (index!42278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82374 (_ BitVec 32)) SeekEntryResult!9976)

(assert (=> b!1262586 (= res!841131 (= (seekEntryOrOpen!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9976 #b00000000000000000000000000000000)))))

(assert (=> b!1262586 (=> (not res!841131) (not e!718720))))

(declare-fun b!1262587 () Bool)

(declare-fun e!718722 () Bool)

(assert (=> b!1262587 (= e!718722 e!718721)))

(declare-fun c!122848 () Bool)

(assert (=> b!1262587 (= c!122848 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62101 () Bool)

(assert (=> bm!62101 (= call!62104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138549 () Bool)

(declare-fun res!841130 () Bool)

(assert (=> d!138549 (=> res!841130 e!718722)))

(assert (=> d!138549 (= res!841130 (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718722)))

(assert (= (and d!138549 (not res!841130)) b!1262587))

(assert (= (and b!1262587 c!122848) b!1262586))

(assert (= (and b!1262587 (not c!122848)) b!1262585))

(assert (= (and b!1262586 res!841131) b!1262584))

(assert (= (or b!1262584 b!1262585) bm!62101))

(assert (=> b!1262586 m!1162973))

(declare-fun m!1163079 () Bool)

(assert (=> b!1262586 m!1163079))

(declare-fun m!1163081 () Bool)

(assert (=> b!1262586 m!1163081))

(assert (=> b!1262586 m!1162973))

(declare-fun m!1163083 () Bool)

(assert (=> b!1262586 m!1163083))

(assert (=> b!1262587 m!1162973))

(assert (=> b!1262587 m!1162973))

(assert (=> b!1262587 m!1162985))

(declare-fun m!1163085 () Bool)

(assert (=> bm!62101 m!1163085))

(assert (=> b!1262409 d!138549))

(declare-fun b!1262588 () Bool)

(declare-fun e!718728 () Bool)

(declare-fun e!718724 () Bool)

(assert (=> b!1262588 (= e!718728 e!718724)))

(declare-fun res!841132 () Bool)

(declare-fun call!62107 () Bool)

(assert (=> b!1262588 (= res!841132 call!62107)))

(assert (=> b!1262588 (=> (not res!841132) (not e!718724))))

(declare-fun b!1262589 () Bool)

(declare-fun e!718735 () ListLongMap!18905)

(declare-fun call!62106 () ListLongMap!18905)

(assert (=> b!1262589 (= e!718735 call!62106)))

(declare-fun b!1262590 () Bool)

(declare-fun res!841138 () Bool)

(declare-fun e!718730 () Bool)

(assert (=> b!1262590 (=> (not res!841138) (not e!718730))))

(declare-fun e!718731 () Bool)

(assert (=> b!1262590 (= res!841138 e!718731)))

(declare-fun res!841137 () Bool)

(assert (=> b!1262590 (=> res!841137 e!718731)))

(declare-fun e!718723 () Bool)

(assert (=> b!1262590 (= res!841137 (not e!718723))))

(declare-fun res!841133 () Bool)

(assert (=> b!1262590 (=> (not res!841133) (not e!718723))))

(assert (=> b!1262590 (= res!841133 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262591 () Bool)

(declare-fun e!718733 () Bool)

(declare-fun lt!572368 () ListLongMap!18905)

(assert (=> b!1262591 (= e!718733 (= (apply!998 lt!572368 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)) (get!20275 (select (arr!39737 _values!914) #b00000000000000000000000000000000) (dynLambda!3396 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40273 _values!914)))))

(assert (=> b!1262591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun b!1262592 () Bool)

(declare-fun e!718726 () ListLongMap!18905)

(declare-fun call!62109 () ListLongMap!18905)

(assert (=> b!1262592 (= e!718726 call!62109)))

(declare-fun call!62110 () ListLongMap!18905)

(declare-fun bm!62102 () Bool)

(assert (=> bm!62102 (= call!62110 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262593 () Bool)

(declare-fun e!718727 () Bool)

(assert (=> b!1262593 (= e!718727 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62103 () Bool)

(declare-fun call!62111 () ListLongMap!18905)

(assert (=> bm!62103 (= call!62106 call!62111)))

(declare-fun b!1262594 () Bool)

(declare-fun e!718729 () Bool)

(assert (=> b!1262594 (= e!718729 (= (apply!998 lt!572368 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262595 () Bool)

(assert (=> b!1262595 (= e!718724 (= (apply!998 lt!572368 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62104 () Bool)

(declare-fun call!62108 () Bool)

(assert (=> bm!62104 (= call!62108 (contains!7591 lt!572368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262596 () Bool)

(declare-fun e!718725 () ListLongMap!18905)

(assert (=> b!1262596 (= e!718725 e!718735)))

(declare-fun c!122849 () Bool)

(assert (=> b!1262596 (= c!122849 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262598 () Bool)

(declare-fun e!718732 () Bool)

(assert (=> b!1262598 (= e!718732 e!718729)))

(declare-fun res!841136 () Bool)

(assert (=> b!1262598 (= res!841136 call!62108)))

(assert (=> b!1262598 (=> (not res!841136) (not e!718729))))

(declare-fun b!1262599 () Bool)

(declare-fun e!718734 () Unit!42080)

(declare-fun Unit!42085 () Unit!42080)

(assert (=> b!1262599 (= e!718734 Unit!42085)))

(declare-fun b!1262600 () Bool)

(assert (=> b!1262600 (= e!718732 (not call!62108))))

(declare-fun b!1262601 () Bool)

(declare-fun lt!572371 () Unit!42080)

(assert (=> b!1262601 (= e!718734 lt!572371)))

(declare-fun lt!572359 () ListLongMap!18905)

(assert (=> b!1262601 (= lt!572359 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572360 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572361 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572361 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572358 () Unit!42080)

(assert (=> b!1262601 (= lt!572358 (addStillContains!1088 lt!572359 lt!572360 zeroValue!871 lt!572361))))

(assert (=> b!1262601 (contains!7591 (+!4244 lt!572359 (tuple2!21033 lt!572360 zeroValue!871)) lt!572361)))

(declare-fun lt!572357 () Unit!42080)

(assert (=> b!1262601 (= lt!572357 lt!572358)))

(declare-fun lt!572378 () ListLongMap!18905)

(assert (=> b!1262601 (= lt!572378 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572366 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572373 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572373 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572369 () Unit!42080)

(assert (=> b!1262601 (= lt!572369 (addApplyDifferent!542 lt!572378 lt!572366 minValueAfter!43 lt!572373))))

(assert (=> b!1262601 (= (apply!998 (+!4244 lt!572378 (tuple2!21033 lt!572366 minValueAfter!43)) lt!572373) (apply!998 lt!572378 lt!572373))))

(declare-fun lt!572370 () Unit!42080)

(assert (=> b!1262601 (= lt!572370 lt!572369)))

(declare-fun lt!572376 () ListLongMap!18905)

(assert (=> b!1262601 (= lt!572376 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572367 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572365 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572365 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572362 () Unit!42080)

(assert (=> b!1262601 (= lt!572362 (addApplyDifferent!542 lt!572376 lt!572367 zeroValue!871 lt!572365))))

(assert (=> b!1262601 (= (apply!998 (+!4244 lt!572376 (tuple2!21033 lt!572367 zeroValue!871)) lt!572365) (apply!998 lt!572376 lt!572365))))

(declare-fun lt!572375 () Unit!42080)

(assert (=> b!1262601 (= lt!572375 lt!572362)))

(declare-fun lt!572363 () ListLongMap!18905)

(assert (=> b!1262601 (= lt!572363 (getCurrentListMapNoExtraKeys!5834 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572377 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572374 () (_ BitVec 64))

(assert (=> b!1262601 (= lt!572374 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262601 (= lt!572371 (addApplyDifferent!542 lt!572363 lt!572377 minValueAfter!43 lt!572374))))

(assert (=> b!1262601 (= (apply!998 (+!4244 lt!572363 (tuple2!21033 lt!572377 minValueAfter!43)) lt!572374) (apply!998 lt!572363 lt!572374))))

(declare-fun b!1262602 () Bool)

(assert (=> b!1262602 (= e!718731 e!718733)))

(declare-fun res!841135 () Bool)

(assert (=> b!1262602 (=> (not res!841135) (not e!718733))))

(assert (=> b!1262602 (= res!841135 (contains!7591 lt!572368 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(declare-fun bm!62105 () Bool)

(declare-fun call!62105 () ListLongMap!18905)

(assert (=> bm!62105 (= call!62109 call!62105)))

(declare-fun b!1262603 () Bool)

(assert (=> b!1262603 (= e!718730 e!718728)))

(declare-fun c!122854 () Bool)

(assert (=> b!1262603 (= c!122854 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62106 () Bool)

(assert (=> bm!62106 (= call!62105 call!62110)))

(declare-fun b!1262604 () Bool)

(assert (=> b!1262604 (= e!718723 (validKeyInArray!0 (select (arr!39736 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262605 () Bool)

(assert (=> b!1262605 (= e!718725 (+!4244 call!62111 (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62107 () Bool)

(declare-fun c!122852 () Bool)

(assert (=> bm!62107 (= call!62111 (+!4244 (ite c!122852 call!62110 (ite c!122849 call!62105 call!62109)) (ite (or c!122852 c!122849) (tuple2!21033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21033 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1262606 () Bool)

(assert (=> b!1262606 (= e!718728 (not call!62107))))

(declare-fun bm!62108 () Bool)

(assert (=> bm!62108 (= call!62107 (contains!7591 lt!572368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262607 () Bool)

(assert (=> b!1262607 (= e!718726 call!62106)))

(declare-fun b!1262608 () Bool)

(declare-fun res!841139 () Bool)

(assert (=> b!1262608 (=> (not res!841139) (not e!718730))))

(assert (=> b!1262608 (= res!841139 e!718732)))

(declare-fun c!122851 () Bool)

(assert (=> b!1262608 (= c!122851 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!138551 () Bool)

(assert (=> d!138551 e!718730))

(declare-fun res!841140 () Bool)

(assert (=> d!138551 (=> (not res!841140) (not e!718730))))

(assert (=> d!138551 (= res!841140 (or (bvsge #b00000000000000000000000000000000 (size!40272 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))))

(declare-fun lt!572364 () ListLongMap!18905)

(assert (=> d!138551 (= lt!572368 lt!572364)))

(declare-fun lt!572372 () Unit!42080)

(assert (=> d!138551 (= lt!572372 e!718734)))

(declare-fun c!122850 () Bool)

(assert (=> d!138551 (= c!122850 e!718727)))

(declare-fun res!841134 () Bool)

(assert (=> d!138551 (=> (not res!841134) (not e!718727))))

(assert (=> d!138551 (= res!841134 (bvslt #b00000000000000000000000000000000 (size!40272 _keys!1118)))))

(assert (=> d!138551 (= lt!572364 e!718725)))

(assert (=> d!138551 (= c!122852 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138551 (validMask!0 mask!1466)))

(assert (=> d!138551 (= (getCurrentListMap!4637 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572368)))

(declare-fun b!1262597 () Bool)

(declare-fun c!122853 () Bool)

(assert (=> b!1262597 (= c!122853 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262597 (= e!718735 e!718726)))

(assert (= (and d!138551 c!122852) b!1262605))

(assert (= (and d!138551 (not c!122852)) b!1262596))

(assert (= (and b!1262596 c!122849) b!1262589))

(assert (= (and b!1262596 (not c!122849)) b!1262597))

(assert (= (and b!1262597 c!122853) b!1262607))

(assert (= (and b!1262597 (not c!122853)) b!1262592))

(assert (= (or b!1262607 b!1262592) bm!62105))

(assert (= (or b!1262589 bm!62105) bm!62106))

(assert (= (or b!1262589 b!1262607) bm!62103))

(assert (= (or b!1262605 bm!62106) bm!62102))

(assert (= (or b!1262605 bm!62103) bm!62107))

(assert (= (and d!138551 res!841134) b!1262593))

(assert (= (and d!138551 c!122850) b!1262601))

(assert (= (and d!138551 (not c!122850)) b!1262599))

(assert (= (and d!138551 res!841140) b!1262590))

(assert (= (and b!1262590 res!841133) b!1262604))

(assert (= (and b!1262590 (not res!841137)) b!1262602))

(assert (= (and b!1262602 res!841135) b!1262591))

(assert (= (and b!1262590 res!841138) b!1262608))

(assert (= (and b!1262608 c!122851) b!1262598))

(assert (= (and b!1262608 (not c!122851)) b!1262600))

(assert (= (and b!1262598 res!841136) b!1262594))

(assert (= (or b!1262598 b!1262600) bm!62104))

(assert (= (and b!1262608 res!841139) b!1262603))

(assert (= (and b!1262603 c!122854) b!1262588))

(assert (= (and b!1262603 (not c!122854)) b!1262606))

(assert (= (and b!1262588 res!841132) b!1262595))

(assert (= (or b!1262588 b!1262606) bm!62108))

(declare-fun b_lambda!22885 () Bool)

(assert (=> (not b_lambda!22885) (not b!1262591)))

(assert (=> b!1262591 t!41738))

(declare-fun b_and!45441 () Bool)

(assert (= b_and!45439 (and (=> t!41738 result!23377) b_and!45441)))

(declare-fun m!1163087 () Bool)

(assert (=> b!1262601 m!1163087))

(declare-fun m!1163089 () Bool)

(assert (=> b!1262601 m!1163089))

(declare-fun m!1163091 () Bool)

(assert (=> b!1262601 m!1163091))

(declare-fun m!1163093 () Bool)

(assert (=> b!1262601 m!1163093))

(declare-fun m!1163095 () Bool)

(assert (=> b!1262601 m!1163095))

(declare-fun m!1163097 () Bool)

(assert (=> b!1262601 m!1163097))

(assert (=> b!1262601 m!1162973))

(declare-fun m!1163099 () Bool)

(assert (=> b!1262601 m!1163099))

(declare-fun m!1163101 () Bool)

(assert (=> b!1262601 m!1163101))

(declare-fun m!1163103 () Bool)

(assert (=> b!1262601 m!1163103))

(declare-fun m!1163105 () Bool)

(assert (=> b!1262601 m!1163105))

(assert (=> b!1262601 m!1163095))

(assert (=> b!1262601 m!1162933))

(declare-fun m!1163107 () Bool)

(assert (=> b!1262601 m!1163107))

(assert (=> b!1262601 m!1163099))

(declare-fun m!1163109 () Bool)

(assert (=> b!1262601 m!1163109))

(declare-fun m!1163111 () Bool)

(assert (=> b!1262601 m!1163111))

(assert (=> b!1262601 m!1163089))

(declare-fun m!1163113 () Bool)

(assert (=> b!1262601 m!1163113))

(declare-fun m!1163115 () Bool)

(assert (=> b!1262601 m!1163115))

(assert (=> b!1262601 m!1163091))

(declare-fun m!1163117 () Bool)

(assert (=> bm!62107 m!1163117))

(assert (=> b!1262604 m!1162973))

(assert (=> b!1262604 m!1162973))

(assert (=> b!1262604 m!1162985))

(assert (=> bm!62102 m!1162933))

(declare-fun m!1163119 () Bool)

(assert (=> bm!62108 m!1163119))

(declare-fun m!1163121 () Bool)

(assert (=> b!1262595 m!1163121))

(assert (=> b!1262593 m!1162973))

(assert (=> b!1262593 m!1162973))

(assert (=> b!1262593 m!1162985))

(declare-fun m!1163123 () Bool)

(assert (=> b!1262594 m!1163123))

(assert (=> d!138551 m!1162921))

(assert (=> b!1262602 m!1162973))

(assert (=> b!1262602 m!1162973))

(declare-fun m!1163125 () Bool)

(assert (=> b!1262602 m!1163125))

(assert (=> b!1262591 m!1162967))

(assert (=> b!1262591 m!1162969))

(assert (=> b!1262591 m!1162971))

(assert (=> b!1262591 m!1162967))

(assert (=> b!1262591 m!1162973))

(declare-fun m!1163127 () Bool)

(assert (=> b!1262591 m!1163127))

(assert (=> b!1262591 m!1162973))

(assert (=> b!1262591 m!1162969))

(declare-fun m!1163129 () Bool)

(assert (=> b!1262605 m!1163129))

(declare-fun m!1163131 () Bool)

(assert (=> bm!62104 m!1163131))

(assert (=> b!1262405 d!138551))

(declare-fun d!138553 () Bool)

(assert (=> d!138553 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106006 d!138553))

(declare-fun d!138555 () Bool)

(assert (=> d!138555 (= (array_inv!30247 _keys!1118) (bvsge (size!40272 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106006 d!138555))

(declare-fun d!138557 () Bool)

(assert (=> d!138557 (= (array_inv!30248 _values!914) (bvsge (size!40273 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106006 d!138557))

(declare-fun b!1262616 () Bool)

(declare-fun e!718740 () Bool)

(assert (=> b!1262616 (= e!718740 tp_is_empty!32379)))

(declare-fun b!1262615 () Bool)

(declare-fun e!718741 () Bool)

(assert (=> b!1262615 (= e!718741 tp_is_empty!32379)))

(declare-fun mapIsEmpty!50389 () Bool)

(declare-fun mapRes!50389 () Bool)

(assert (=> mapIsEmpty!50389 mapRes!50389))

(declare-fun mapNonEmpty!50389 () Bool)

(declare-fun tp!95984 () Bool)

(assert (=> mapNonEmpty!50389 (= mapRes!50389 (and tp!95984 e!718741))))

(declare-fun mapValue!50389 () ValueCell!15426)

(declare-fun mapRest!50389 () (Array (_ BitVec 32) ValueCell!15426))

(declare-fun mapKey!50389 () (_ BitVec 32))

(assert (=> mapNonEmpty!50389 (= mapRest!50383 (store mapRest!50389 mapKey!50389 mapValue!50389))))

(declare-fun condMapEmpty!50389 () Bool)

(declare-fun mapDefault!50389 () ValueCell!15426)

(assert (=> mapNonEmpty!50383 (= condMapEmpty!50389 (= mapRest!50383 ((as const (Array (_ BitVec 32) ValueCell!15426)) mapDefault!50389)))))

(assert (=> mapNonEmpty!50383 (= tp!95974 (and e!718740 mapRes!50389))))

(assert (= (and mapNonEmpty!50383 condMapEmpty!50389) mapIsEmpty!50389))

(assert (= (and mapNonEmpty!50383 (not condMapEmpty!50389)) mapNonEmpty!50389))

(assert (= (and mapNonEmpty!50389 ((_ is ValueCellFull!15426) mapValue!50389)) b!1262615))

(assert (= (and mapNonEmpty!50383 ((_ is ValueCellFull!15426) mapDefault!50389)) b!1262616))

(declare-fun m!1163133 () Bool)

(assert (=> mapNonEmpty!50389 m!1163133))

(declare-fun b_lambda!22887 () Bool)

(assert (= b_lambda!22883 (or (and start!106006 b_free!27477) b_lambda!22887)))

(declare-fun b_lambda!22889 () Bool)

(assert (= b_lambda!22881 (or (and start!106006 b_free!27477) b_lambda!22889)))

(declare-fun b_lambda!22891 () Bool)

(assert (= b_lambda!22875 (or (and start!106006 b_free!27477) b_lambda!22891)))

(declare-fun b_lambda!22893 () Bool)

(assert (= b_lambda!22885 (or (and start!106006 b_free!27477) b_lambda!22893)))

(declare-fun b_lambda!22895 () Bool)

(assert (= b_lambda!22879 (or (and start!106006 b_free!27477) b_lambda!22895)))

(declare-fun b_lambda!22897 () Bool)

(assert (= b_lambda!22877 (or (and start!106006 b_free!27477) b_lambda!22897)))

(check-sat (not b!1262556) (not b!1262575) (not b!1262593) (not b!1262566) (not b!1262587) (not b_lambda!22895) (not b!1262563) (not b!1262605) (not b!1262471) (not d!138547) (not d!138551) (not bm!62098) (not bm!62108) (not bm!62092) (not b!1262482) (not b_lambda!22891) (not b_lambda!22893) (not bm!62102) (not b!1262574) (not b!1262483) (not b!1262484) b_and!45441 (not b!1262602) (not b!1262595) (not d!138537) (not bm!62073) (not b_next!27477) (not b!1262470) (not b!1262467) (not b!1262502) (not b!1262475) (not b!1262594) (not b!1262554) (not bm!62104) (not d!138539) (not b_lambda!22889) (not d!138541) (not b_lambda!22887) (not b!1262489) (not b!1262486) (not b!1262601) (not b!1262476) (not b!1262472) (not b!1262604) (not b!1262468) (not b!1262565) tp_is_empty!32379 (not bm!62101) (not bm!62077) (not b!1262469) (not b!1262555) (not bm!62097) (not bm!62074) (not b!1262552) (not d!138545) (not b!1262505) (not b!1262503) (not bm!62107) (not b!1262490) (not bm!62094) (not b!1262485) (not b!1262586) (not b_lambda!22897) (not mapNonEmpty!50389) (not b!1262562) (not b!1262591) (not b!1262481))
(check-sat b_and!45441 (not b_next!27477))
