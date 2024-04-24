; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106314 () Bool)

(assert start!106314)

(declare-fun b_free!27505 () Bool)

(declare-fun b_next!27505 () Bool)

(assert (=> start!106314 (= b_free!27505 (not b_next!27505))))

(declare-fun tp!96067 () Bool)

(declare-fun b_and!45491 () Bool)

(assert (=> start!106314 (= tp!96067 b_and!45491)))

(declare-fun mapNonEmpty!50434 () Bool)

(declare-fun mapRes!50434 () Bool)

(declare-fun tp!96068 () Bool)

(declare-fun e!720049 () Bool)

(assert (=> mapNonEmpty!50434 (= mapRes!50434 (and tp!96068 e!720049))))

(declare-fun mapKey!50434 () (_ BitVec 32))

(declare-datatypes ((V!48575 0))(
  ( (V!48576 (val!16266 Int)) )
))
(declare-datatypes ((ValueCell!15440 0))(
  ( (ValueCellFull!15440 (v!18972 V!48575)) (EmptyCell!15440) )
))
(declare-datatypes ((array!82481 0))(
  ( (array!82482 (arr!39782 (Array (_ BitVec 32) ValueCell!15440)) (size!40319 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82481)

(declare-fun mapValue!50434 () ValueCell!15440)

(declare-fun mapRest!50434 () (Array (_ BitVec 32) ValueCell!15440))

(assert (=> mapNonEmpty!50434 (= (arr!39782 _values!914) (store mapRest!50434 mapKey!50434 mapValue!50434))))

(declare-fun b!1264578 () Bool)

(declare-fun res!842003 () Bool)

(declare-fun e!720047 () Bool)

(assert (=> b!1264578 (=> (not res!842003) (not e!720047))))

(declare-datatypes ((array!82483 0))(
  ( (array!82484 (arr!39783 (Array (_ BitVec 32) (_ BitVec 64))) (size!40320 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82483)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82483 (_ BitVec 32)) Bool)

(assert (=> b!1264578 (= res!842003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264579 () Bool)

(declare-fun e!720044 () Bool)

(assert (=> b!1264579 (= e!720047 (not e!720044))))

(declare-fun res!842004 () Bool)

(assert (=> b!1264579 (=> res!842004 e!720044)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264579 (= res!842004 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!21066 0))(
  ( (tuple2!21067 (_1!10544 (_ BitVec 64)) (_2!10544 V!48575)) )
))
(declare-datatypes ((List!28288 0))(
  ( (Nil!28285) (Cons!28284 (h!29502 tuple2!21066) (t!41793 List!28288)) )
))
(declare-datatypes ((ListLongMap!18947 0))(
  ( (ListLongMap!18948 (toList!9489 List!28288)) )
))
(declare-fun lt!573357 () ListLongMap!18947)

(declare-fun lt!573353 () ListLongMap!18947)

(assert (=> b!1264579 (= lt!573357 lt!573353)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48575)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48575)

(declare-datatypes ((Unit!42080 0))(
  ( (Unit!42081) )
))
(declare-fun lt!573354 () Unit!42080)

(declare-fun minValueBefore!43 () V!48575)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1182 (array!82483 array!82481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 V!48575 V!48575 (_ BitVec 32) Int) Unit!42080)

(assert (=> b!1264579 (= lt!573354 (lemmaNoChangeToArrayThenSameMapNoExtras!1182 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5892 (array!82483 array!82481 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!18947)

(assert (=> b!1264579 (= lt!573353 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264579 (= lt!573357 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264580 () Bool)

(declare-fun res!841999 () Bool)

(assert (=> b!1264580 (=> (not res!841999) (not e!720047))))

(declare-datatypes ((List!28289 0))(
  ( (Nil!28286) (Cons!28285 (h!29503 (_ BitVec 64)) (t!41794 List!28289)) )
))
(declare-fun arrayNoDuplicates!0 (array!82483 (_ BitVec 32) List!28289) Bool)

(assert (=> b!1264580 (= res!841999 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28286))))

(declare-fun res!842001 () Bool)

(assert (=> start!106314 (=> (not res!842001) (not e!720047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106314 (= res!842001 (validMask!0 mask!1466))))

(assert (=> start!106314 e!720047))

(assert (=> start!106314 true))

(assert (=> start!106314 tp!96067))

(declare-fun tp_is_empty!32407 () Bool)

(assert (=> start!106314 tp_is_empty!32407))

(declare-fun array_inv!30439 (array!82483) Bool)

(assert (=> start!106314 (array_inv!30439 _keys!1118)))

(declare-fun e!720046 () Bool)

(declare-fun array_inv!30440 (array!82481) Bool)

(assert (=> start!106314 (and (array_inv!30440 _values!914) e!720046)))

(declare-fun b!1264581 () Bool)

(assert (=> b!1264581 (= e!720049 tp_is_empty!32407)))

(declare-fun mapIsEmpty!50434 () Bool)

(assert (=> mapIsEmpty!50434 mapRes!50434))

(declare-fun b!1264582 () Bool)

(declare-fun lt!573352 () ListLongMap!18947)

(declare-fun e!720050 () Bool)

(declare-fun getCurrentListMap!4641 (array!82483 array!82481 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!18947)

(assert (=> b!1264582 (= e!720050 (= lt!573352 (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(declare-fun lt!573355 () ListLongMap!18947)

(assert (=> b!1264582 (= lt!573352 lt!573355)))

(declare-fun -!2120 (ListLongMap!18947 (_ BitVec 64)) ListLongMap!18947)

(assert (=> b!1264582 (= lt!573352 (-!2120 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!573356 () Unit!42080)

(declare-fun removeNotPresentStillSame!152 (ListLongMap!18947 (_ BitVec 64)) Unit!42080)

(assert (=> b!1264582 (= lt!573356 (removeNotPresentStillSame!152 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264583 () Bool)

(assert (=> b!1264583 (= e!720044 e!720050)))

(declare-fun res!842000 () Bool)

(assert (=> b!1264583 (=> res!842000 e!720050)))

(declare-fun contains!7628 (ListLongMap!18947 (_ BitVec 64)) Bool)

(assert (=> b!1264583 (= res!842000 (contains!7628 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1264583 (= lt!573355 (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264584 () Bool)

(declare-fun res!842002 () Bool)

(assert (=> b!1264584 (=> (not res!842002) (not e!720047))))

(assert (=> b!1264584 (= res!842002 (and (= (size!40319 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40320 _keys!1118) (size!40319 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264585 () Bool)

(declare-fun e!720045 () Bool)

(assert (=> b!1264585 (= e!720046 (and e!720045 mapRes!50434))))

(declare-fun condMapEmpty!50434 () Bool)

(declare-fun mapDefault!50434 () ValueCell!15440)

(assert (=> b!1264585 (= condMapEmpty!50434 (= (arr!39782 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15440)) mapDefault!50434)))))

(declare-fun b!1264586 () Bool)

(assert (=> b!1264586 (= e!720045 tp_is_empty!32407)))

(assert (= (and start!106314 res!842001) b!1264584))

(assert (= (and b!1264584 res!842002) b!1264578))

(assert (= (and b!1264578 res!842003) b!1264580))

(assert (= (and b!1264580 res!841999) b!1264579))

(assert (= (and b!1264579 (not res!842004)) b!1264583))

(assert (= (and b!1264583 (not res!842000)) b!1264582))

(assert (= (and b!1264585 condMapEmpty!50434) mapIsEmpty!50434))

(assert (= (and b!1264585 (not condMapEmpty!50434)) mapNonEmpty!50434))

(get-info :version)

(assert (= (and mapNonEmpty!50434 ((_ is ValueCellFull!15440) mapValue!50434)) b!1264581))

(assert (= (and b!1264585 ((_ is ValueCellFull!15440) mapDefault!50434)) b!1264586))

(assert (= start!106314 b!1264585))

(declare-fun m!1165369 () Bool)

(assert (=> b!1264580 m!1165369))

(declare-fun m!1165371 () Bool)

(assert (=> start!106314 m!1165371))

(declare-fun m!1165373 () Bool)

(assert (=> start!106314 m!1165373))

(declare-fun m!1165375 () Bool)

(assert (=> start!106314 m!1165375))

(declare-fun m!1165377 () Bool)

(assert (=> b!1264579 m!1165377))

(declare-fun m!1165379 () Bool)

(assert (=> b!1264579 m!1165379))

(declare-fun m!1165381 () Bool)

(assert (=> b!1264579 m!1165381))

(declare-fun m!1165383 () Bool)

(assert (=> b!1264582 m!1165383))

(declare-fun m!1165385 () Bool)

(assert (=> b!1264582 m!1165385))

(declare-fun m!1165387 () Bool)

(assert (=> b!1264582 m!1165387))

(declare-fun m!1165389 () Bool)

(assert (=> b!1264583 m!1165389))

(declare-fun m!1165391 () Bool)

(assert (=> b!1264583 m!1165391))

(declare-fun m!1165393 () Bool)

(assert (=> mapNonEmpty!50434 m!1165393))

(declare-fun m!1165395 () Bool)

(assert (=> b!1264578 m!1165395))

(check-sat (not b!1264582) (not b!1264579) tp_is_empty!32407 (not mapNonEmpty!50434) (not b!1264583) (not start!106314) (not b!1264578) (not b_next!27505) (not b!1264580) b_and!45491)
(check-sat b_and!45491 (not b_next!27505))
(get-model)

(declare-fun d!139061 () Bool)

(declare-fun e!720098 () Bool)

(assert (=> d!139061 e!720098))

(declare-fun res!842043 () Bool)

(assert (=> d!139061 (=> res!842043 e!720098)))

(declare-fun lt!573402 () Bool)

(assert (=> d!139061 (= res!842043 (not lt!573402))))

(declare-fun lt!573405 () Bool)

(assert (=> d!139061 (= lt!573402 lt!573405)))

(declare-fun lt!573403 () Unit!42080)

(declare-fun e!720097 () Unit!42080)

(assert (=> d!139061 (= lt!573403 e!720097)))

(declare-fun c!123349 () Bool)

(assert (=> d!139061 (= c!123349 lt!573405)))

(declare-fun containsKey!626 (List!28288 (_ BitVec 64)) Bool)

(assert (=> d!139061 (= lt!573405 (containsKey!626 (toList!9489 lt!573355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139061 (= (contains!7628 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573402)))

(declare-fun b!1264647 () Bool)

(declare-fun lt!573404 () Unit!42080)

(assert (=> b!1264647 (= e!720097 lt!573404)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!435 (List!28288 (_ BitVec 64)) Unit!42080)

(assert (=> b!1264647 (= lt!573404 (lemmaContainsKeyImpliesGetValueByKeyDefined!435 (toList!9489 lt!573355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!713 0))(
  ( (Some!712 (v!18975 V!48575)) (None!711) )
))
(declare-fun isDefined!473 (Option!713) Bool)

(declare-fun getValueByKey!662 (List!28288 (_ BitVec 64)) Option!713)

(assert (=> b!1264647 (isDefined!473 (getValueByKey!662 (toList!9489 lt!573355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264648 () Bool)

(declare-fun Unit!42086 () Unit!42080)

(assert (=> b!1264648 (= e!720097 Unit!42086)))

(declare-fun b!1264649 () Bool)

(assert (=> b!1264649 (= e!720098 (isDefined!473 (getValueByKey!662 (toList!9489 lt!573355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139061 c!123349) b!1264647))

(assert (= (and d!139061 (not c!123349)) b!1264648))

(assert (= (and d!139061 (not res!842043)) b!1264649))

(declare-fun m!1165453 () Bool)

(assert (=> d!139061 m!1165453))

(declare-fun m!1165455 () Bool)

(assert (=> b!1264647 m!1165455))

(declare-fun m!1165457 () Bool)

(assert (=> b!1264647 m!1165457))

(assert (=> b!1264647 m!1165457))

(declare-fun m!1165459 () Bool)

(assert (=> b!1264647 m!1165459))

(assert (=> b!1264649 m!1165457))

(assert (=> b!1264649 m!1165457))

(assert (=> b!1264649 m!1165459))

(assert (=> b!1264583 d!139061))

(declare-fun b!1264692 () Bool)

(declare-fun e!720126 () Unit!42080)

(declare-fun Unit!42087 () Unit!42080)

(assert (=> b!1264692 (= e!720126 Unit!42087)))

(declare-fun b!1264693 () Bool)

(declare-fun e!720129 () ListLongMap!18947)

(declare-fun call!62263 () ListLongMap!18947)

(declare-fun +!4299 (ListLongMap!18947 tuple2!21066) ListLongMap!18947)

(assert (=> b!1264693 (= e!720129 (+!4299 call!62263 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62257 () Bool)

(declare-fun call!62262 () Bool)

(declare-fun lt!573458 () ListLongMap!18947)

(assert (=> bm!62257 (= call!62262 (contains!7628 lt!573458 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62258 () Bool)

(declare-fun call!62260 () ListLongMap!18947)

(declare-fun call!62266 () ListLongMap!18947)

(assert (=> bm!62258 (= call!62260 call!62266)))

(declare-fun b!1264694 () Bool)

(declare-fun e!720128 () Bool)

(declare-fun e!720133 () Bool)

(assert (=> b!1264694 (= e!720128 e!720133)))

(declare-fun c!123364 () Bool)

(assert (=> b!1264694 (= c!123364 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264695 () Bool)

(declare-fun e!720132 () ListLongMap!18947)

(assert (=> b!1264695 (= e!720129 e!720132)))

(declare-fun c!123367 () Bool)

(assert (=> b!1264695 (= c!123367 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264696 () Bool)

(declare-fun e!720136 () Bool)

(declare-fun call!62261 () Bool)

(assert (=> b!1264696 (= e!720136 (not call!62261))))

(declare-fun bm!62259 () Bool)

(declare-fun call!62265 () ListLongMap!18947)

(assert (=> bm!62259 (= call!62265 call!62263)))

(declare-fun b!1264697 () Bool)

(declare-fun lt!573459 () Unit!42080)

(assert (=> b!1264697 (= e!720126 lt!573459)))

(declare-fun lt!573457 () ListLongMap!18947)

(assert (=> b!1264697 (= lt!573457 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573466 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573461 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573461 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573470 () Unit!42080)

(declare-fun addStillContains!1099 (ListLongMap!18947 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!42080)

(assert (=> b!1264697 (= lt!573470 (addStillContains!1099 lt!573457 lt!573466 zeroValue!871 lt!573461))))

(assert (=> b!1264697 (contains!7628 (+!4299 lt!573457 (tuple2!21067 lt!573466 zeroValue!871)) lt!573461)))

(declare-fun lt!573469 () Unit!42080)

(assert (=> b!1264697 (= lt!573469 lt!573470)))

(declare-fun lt!573454 () ListLongMap!18947)

(assert (=> b!1264697 (= lt!573454 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573450 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573450 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573460 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573460 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573462 () Unit!42080)

(declare-fun addApplyDifferent!541 (ListLongMap!18947 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!42080)

(assert (=> b!1264697 (= lt!573462 (addApplyDifferent!541 lt!573454 lt!573450 minValueBefore!43 lt!573460))))

(declare-fun apply!1010 (ListLongMap!18947 (_ BitVec 64)) V!48575)

(assert (=> b!1264697 (= (apply!1010 (+!4299 lt!573454 (tuple2!21067 lt!573450 minValueBefore!43)) lt!573460) (apply!1010 lt!573454 lt!573460))))

(declare-fun lt!573451 () Unit!42080)

(assert (=> b!1264697 (= lt!573451 lt!573462)))

(declare-fun lt!573463 () ListLongMap!18947)

(assert (=> b!1264697 (= lt!573463 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573471 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573468 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573468 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573452 () Unit!42080)

(assert (=> b!1264697 (= lt!573452 (addApplyDifferent!541 lt!573463 lt!573471 zeroValue!871 lt!573468))))

(assert (=> b!1264697 (= (apply!1010 (+!4299 lt!573463 (tuple2!21067 lt!573471 zeroValue!871)) lt!573468) (apply!1010 lt!573463 lt!573468))))

(declare-fun lt!573467 () Unit!42080)

(assert (=> b!1264697 (= lt!573467 lt!573452)))

(declare-fun lt!573465 () ListLongMap!18947)

(assert (=> b!1264697 (= lt!573465 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573453 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573453 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573464 () (_ BitVec 64))

(assert (=> b!1264697 (= lt!573464 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264697 (= lt!573459 (addApplyDifferent!541 lt!573465 lt!573453 minValueBefore!43 lt!573464))))

(assert (=> b!1264697 (= (apply!1010 (+!4299 lt!573465 (tuple2!21067 lt!573453 minValueBefore!43)) lt!573464) (apply!1010 lt!573465 lt!573464))))

(declare-fun b!1264698 () Bool)

(declare-fun e!720125 () ListLongMap!18947)

(assert (=> b!1264698 (= e!720125 call!62265)))

(declare-fun b!1264699 () Bool)

(declare-fun e!720131 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264699 (= e!720131 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264700 () Bool)

(declare-fun res!842068 () Bool)

(assert (=> b!1264700 (=> (not res!842068) (not e!720128))))

(declare-fun e!720135 () Bool)

(assert (=> b!1264700 (= res!842068 e!720135)))

(declare-fun res!842063 () Bool)

(assert (=> b!1264700 (=> res!842063 e!720135)))

(declare-fun e!720130 () Bool)

(assert (=> b!1264700 (= res!842063 (not e!720130))))

(declare-fun res!842070 () Bool)

(assert (=> b!1264700 (=> (not res!842070) (not e!720130))))

(assert (=> b!1264700 (= res!842070 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun d!139063 () Bool)

(assert (=> d!139063 e!720128))

(declare-fun res!842067 () Bool)

(assert (=> d!139063 (=> (not res!842067) (not e!720128))))

(assert (=> d!139063 (= res!842067 (or (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))))

(declare-fun lt!573456 () ListLongMap!18947)

(assert (=> d!139063 (= lt!573458 lt!573456)))

(declare-fun lt!573455 () Unit!42080)

(assert (=> d!139063 (= lt!573455 e!720126)))

(declare-fun c!123365 () Bool)

(assert (=> d!139063 (= c!123365 e!720131)))

(declare-fun res!842064 () Bool)

(assert (=> d!139063 (=> (not res!842064) (not e!720131))))

(assert (=> d!139063 (= res!842064 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139063 (= lt!573456 e!720129)))

(declare-fun c!123362 () Bool)

(assert (=> d!139063 (= c!123362 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139063 (validMask!0 mask!1466)))

(assert (=> d!139063 (= (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573458)))

(declare-fun bm!62260 () Bool)

(declare-fun call!62264 () ListLongMap!18947)

(assert (=> bm!62260 (= call!62266 call!62264)))

(declare-fun b!1264701 () Bool)

(assert (=> b!1264701 (= e!720125 call!62260)))

(declare-fun b!1264702 () Bool)

(declare-fun res!842065 () Bool)

(assert (=> b!1264702 (=> (not res!842065) (not e!720128))))

(assert (=> b!1264702 (= res!842065 e!720136)))

(declare-fun c!123363 () Bool)

(assert (=> b!1264702 (= c!123363 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264703 () Bool)

(declare-fun c!123366 () Bool)

(assert (=> b!1264703 (= c!123366 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1264703 (= e!720132 e!720125)))

(declare-fun b!1264704 () Bool)

(assert (=> b!1264704 (= e!720132 call!62265)))

(declare-fun b!1264705 () Bool)

(declare-fun e!720134 () Bool)

(assert (=> b!1264705 (= e!720134 (= (apply!1010 lt!573458 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264706 () Bool)

(declare-fun e!720137 () Bool)

(declare-fun get!20339 (ValueCell!15440 V!48575) V!48575)

(declare-fun dynLambda!3462 (Int (_ BitVec 64)) V!48575)

(assert (=> b!1264706 (= e!720137 (= (apply!1010 lt!573458 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _values!914)))))

(assert (=> b!1264706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264707 () Bool)

(declare-fun e!720127 () Bool)

(assert (=> b!1264707 (= e!720127 (= (apply!1010 lt!573458 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1264708 () Bool)

(assert (=> b!1264708 (= e!720130 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62261 () Bool)

(assert (=> bm!62261 (= call!62263 (+!4299 (ite c!123362 call!62264 (ite c!123367 call!62266 call!62260)) (ite (or c!123362 c!123367) (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62262 () Bool)

(assert (=> bm!62262 (= call!62264 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264709 () Bool)

(assert (=> b!1264709 (= e!720133 e!720127)))

(declare-fun res!842069 () Bool)

(assert (=> b!1264709 (= res!842069 call!62262)))

(assert (=> b!1264709 (=> (not res!842069) (not e!720127))))

(declare-fun b!1264710 () Bool)

(assert (=> b!1264710 (= e!720136 e!720134)))

(declare-fun res!842062 () Bool)

(assert (=> b!1264710 (= res!842062 call!62261)))

(assert (=> b!1264710 (=> (not res!842062) (not e!720134))))

(declare-fun bm!62263 () Bool)

(assert (=> bm!62263 (= call!62261 (contains!7628 lt!573458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264711 () Bool)

(assert (=> b!1264711 (= e!720133 (not call!62262))))

(declare-fun b!1264712 () Bool)

(assert (=> b!1264712 (= e!720135 e!720137)))

(declare-fun res!842066 () Bool)

(assert (=> b!1264712 (=> (not res!842066) (not e!720137))))

(assert (=> b!1264712 (= res!842066 (contains!7628 lt!573458 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (= (and d!139063 c!123362) b!1264693))

(assert (= (and d!139063 (not c!123362)) b!1264695))

(assert (= (and b!1264695 c!123367) b!1264704))

(assert (= (and b!1264695 (not c!123367)) b!1264703))

(assert (= (and b!1264703 c!123366) b!1264698))

(assert (= (and b!1264703 (not c!123366)) b!1264701))

(assert (= (or b!1264698 b!1264701) bm!62258))

(assert (= (or b!1264704 bm!62258) bm!62260))

(assert (= (or b!1264704 b!1264698) bm!62259))

(assert (= (or b!1264693 bm!62260) bm!62262))

(assert (= (or b!1264693 bm!62259) bm!62261))

(assert (= (and d!139063 res!842064) b!1264699))

(assert (= (and d!139063 c!123365) b!1264697))

(assert (= (and d!139063 (not c!123365)) b!1264692))

(assert (= (and d!139063 res!842067) b!1264700))

(assert (= (and b!1264700 res!842070) b!1264708))

(assert (= (and b!1264700 (not res!842063)) b!1264712))

(assert (= (and b!1264712 res!842066) b!1264706))

(assert (= (and b!1264700 res!842068) b!1264702))

(assert (= (and b!1264702 c!123363) b!1264710))

(assert (= (and b!1264702 (not c!123363)) b!1264696))

(assert (= (and b!1264710 res!842062) b!1264705))

(assert (= (or b!1264710 b!1264696) bm!62263))

(assert (= (and b!1264702 res!842065) b!1264694))

(assert (= (and b!1264694 c!123364) b!1264709))

(assert (= (and b!1264694 (not c!123364)) b!1264711))

(assert (= (and b!1264709 res!842069) b!1264707))

(assert (= (or b!1264709 b!1264711) bm!62257))

(declare-fun b_lambda!22937 () Bool)

(assert (=> (not b_lambda!22937) (not b!1264706)))

(declare-fun t!41799 () Bool)

(declare-fun tb!11321 () Bool)

(assert (=> (and start!106314 (= defaultEntry!922 defaultEntry!922) t!41799) tb!11321))

(declare-fun result!23387 () Bool)

(assert (=> tb!11321 (= result!23387 tp_is_empty!32407)))

(assert (=> b!1264706 t!41799))

(declare-fun b_and!45497 () Bool)

(assert (= b_and!45491 (and (=> t!41799 result!23387) b_and!45497)))

(declare-fun m!1165461 () Bool)

(assert (=> bm!62261 m!1165461))

(assert (=> bm!62262 m!1165381))

(declare-fun m!1165463 () Bool)

(assert (=> bm!62263 m!1165463))

(declare-fun m!1165465 () Bool)

(assert (=> b!1264708 m!1165465))

(assert (=> b!1264708 m!1165465))

(declare-fun m!1165467 () Bool)

(assert (=> b!1264708 m!1165467))

(declare-fun m!1165469 () Bool)

(assert (=> b!1264697 m!1165469))

(declare-fun m!1165471 () Bool)

(assert (=> b!1264697 m!1165471))

(declare-fun m!1165473 () Bool)

(assert (=> b!1264697 m!1165473))

(declare-fun m!1165475 () Bool)

(assert (=> b!1264697 m!1165475))

(declare-fun m!1165477 () Bool)

(assert (=> b!1264697 m!1165477))

(declare-fun m!1165479 () Bool)

(assert (=> b!1264697 m!1165479))

(assert (=> b!1264697 m!1165473))

(assert (=> b!1264697 m!1165469))

(assert (=> b!1264697 m!1165477))

(declare-fun m!1165481 () Bool)

(assert (=> b!1264697 m!1165481))

(declare-fun m!1165483 () Bool)

(assert (=> b!1264697 m!1165483))

(declare-fun m!1165485 () Bool)

(assert (=> b!1264697 m!1165485))

(declare-fun m!1165487 () Bool)

(assert (=> b!1264697 m!1165487))

(declare-fun m!1165489 () Bool)

(assert (=> b!1264697 m!1165489))

(declare-fun m!1165491 () Bool)

(assert (=> b!1264697 m!1165491))

(declare-fun m!1165493 () Bool)

(assert (=> b!1264697 m!1165493))

(assert (=> b!1264697 m!1165381))

(assert (=> b!1264697 m!1165465))

(assert (=> b!1264697 m!1165489))

(declare-fun m!1165495 () Bool)

(assert (=> b!1264697 m!1165495))

(declare-fun m!1165497 () Bool)

(assert (=> b!1264697 m!1165497))

(assert (=> b!1264699 m!1165465))

(assert (=> b!1264699 m!1165465))

(assert (=> b!1264699 m!1165467))

(declare-fun m!1165499 () Bool)

(assert (=> b!1264693 m!1165499))

(declare-fun m!1165501 () Bool)

(assert (=> b!1264705 m!1165501))

(assert (=> b!1264712 m!1165465))

(assert (=> b!1264712 m!1165465))

(declare-fun m!1165503 () Bool)

(assert (=> b!1264712 m!1165503))

(declare-fun m!1165505 () Bool)

(assert (=> b!1264706 m!1165505))

(declare-fun m!1165507 () Bool)

(assert (=> b!1264706 m!1165507))

(assert (=> b!1264706 m!1165505))

(assert (=> b!1264706 m!1165507))

(declare-fun m!1165509 () Bool)

(assert (=> b!1264706 m!1165509))

(assert (=> b!1264706 m!1165465))

(assert (=> b!1264706 m!1165465))

(declare-fun m!1165511 () Bool)

(assert (=> b!1264706 m!1165511))

(declare-fun m!1165513 () Bool)

(assert (=> b!1264707 m!1165513))

(assert (=> d!139063 m!1165371))

(declare-fun m!1165515 () Bool)

(assert (=> bm!62257 m!1165515))

(assert (=> b!1264583 d!139063))

(declare-fun d!139065 () Bool)

(assert (=> d!139065 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106314 d!139065))

(declare-fun d!139067 () Bool)

(assert (=> d!139067 (= (array_inv!30439 _keys!1118) (bvsge (size!40320 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106314 d!139067))

(declare-fun d!139069 () Bool)

(assert (=> d!139069 (= (array_inv!30440 _values!914) (bvsge (size!40319 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106314 d!139069))

(declare-fun b!1264715 () Bool)

(declare-fun e!720139 () Unit!42080)

(declare-fun Unit!42088 () Unit!42080)

(assert (=> b!1264715 (= e!720139 Unit!42088)))

(declare-fun b!1264716 () Bool)

(declare-fun e!720142 () ListLongMap!18947)

(declare-fun call!62270 () ListLongMap!18947)

(assert (=> b!1264716 (= e!720142 (+!4299 call!62270 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62264 () Bool)

(declare-fun call!62269 () Bool)

(declare-fun lt!573480 () ListLongMap!18947)

(assert (=> bm!62264 (= call!62269 (contains!7628 lt!573480 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62265 () Bool)

(declare-fun call!62267 () ListLongMap!18947)

(declare-fun call!62273 () ListLongMap!18947)

(assert (=> bm!62265 (= call!62267 call!62273)))

(declare-fun b!1264717 () Bool)

(declare-fun e!720141 () Bool)

(declare-fun e!720146 () Bool)

(assert (=> b!1264717 (= e!720141 e!720146)))

(declare-fun c!123370 () Bool)

(assert (=> b!1264717 (= c!123370 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264718 () Bool)

(declare-fun e!720145 () ListLongMap!18947)

(assert (=> b!1264718 (= e!720142 e!720145)))

(declare-fun c!123373 () Bool)

(assert (=> b!1264718 (= c!123373 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264719 () Bool)

(declare-fun e!720149 () Bool)

(declare-fun call!62268 () Bool)

(assert (=> b!1264719 (= e!720149 (not call!62268))))

(declare-fun bm!62266 () Bool)

(declare-fun call!62272 () ListLongMap!18947)

(assert (=> bm!62266 (= call!62272 call!62270)))

(declare-fun b!1264720 () Bool)

(declare-fun lt!573481 () Unit!42080)

(assert (=> b!1264720 (= e!720139 lt!573481)))

(declare-fun lt!573479 () ListLongMap!18947)

(assert (=> b!1264720 (= lt!573479 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573488 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573483 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573483 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573492 () Unit!42080)

(assert (=> b!1264720 (= lt!573492 (addStillContains!1099 lt!573479 lt!573488 zeroValue!871 lt!573483))))

(assert (=> b!1264720 (contains!7628 (+!4299 lt!573479 (tuple2!21067 lt!573488 zeroValue!871)) lt!573483)))

(declare-fun lt!573491 () Unit!42080)

(assert (=> b!1264720 (= lt!573491 lt!573492)))

(declare-fun lt!573476 () ListLongMap!18947)

(assert (=> b!1264720 (= lt!573476 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573472 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573472 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573482 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573482 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573484 () Unit!42080)

(assert (=> b!1264720 (= lt!573484 (addApplyDifferent!541 lt!573476 lt!573472 minValueAfter!43 lt!573482))))

(assert (=> b!1264720 (= (apply!1010 (+!4299 lt!573476 (tuple2!21067 lt!573472 minValueAfter!43)) lt!573482) (apply!1010 lt!573476 lt!573482))))

(declare-fun lt!573473 () Unit!42080)

(assert (=> b!1264720 (= lt!573473 lt!573484)))

(declare-fun lt!573485 () ListLongMap!18947)

(assert (=> b!1264720 (= lt!573485 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573493 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573490 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573490 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573474 () Unit!42080)

(assert (=> b!1264720 (= lt!573474 (addApplyDifferent!541 lt!573485 lt!573493 zeroValue!871 lt!573490))))

(assert (=> b!1264720 (= (apply!1010 (+!4299 lt!573485 (tuple2!21067 lt!573493 zeroValue!871)) lt!573490) (apply!1010 lt!573485 lt!573490))))

(declare-fun lt!573489 () Unit!42080)

(assert (=> b!1264720 (= lt!573489 lt!573474)))

(declare-fun lt!573487 () ListLongMap!18947)

(assert (=> b!1264720 (= lt!573487 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573475 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573475 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573486 () (_ BitVec 64))

(assert (=> b!1264720 (= lt!573486 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264720 (= lt!573481 (addApplyDifferent!541 lt!573487 lt!573475 minValueAfter!43 lt!573486))))

(assert (=> b!1264720 (= (apply!1010 (+!4299 lt!573487 (tuple2!21067 lt!573475 minValueAfter!43)) lt!573486) (apply!1010 lt!573487 lt!573486))))

(declare-fun b!1264721 () Bool)

(declare-fun e!720138 () ListLongMap!18947)

(assert (=> b!1264721 (= e!720138 call!62272)))

(declare-fun b!1264722 () Bool)

(declare-fun e!720144 () Bool)

(assert (=> b!1264722 (= e!720144 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264723 () Bool)

(declare-fun res!842077 () Bool)

(assert (=> b!1264723 (=> (not res!842077) (not e!720141))))

(declare-fun e!720148 () Bool)

(assert (=> b!1264723 (= res!842077 e!720148)))

(declare-fun res!842072 () Bool)

(assert (=> b!1264723 (=> res!842072 e!720148)))

(declare-fun e!720143 () Bool)

(assert (=> b!1264723 (= res!842072 (not e!720143))))

(declare-fun res!842079 () Bool)

(assert (=> b!1264723 (=> (not res!842079) (not e!720143))))

(assert (=> b!1264723 (= res!842079 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun d!139071 () Bool)

(assert (=> d!139071 e!720141))

(declare-fun res!842076 () Bool)

(assert (=> d!139071 (=> (not res!842076) (not e!720141))))

(assert (=> d!139071 (= res!842076 (or (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))))

(declare-fun lt!573478 () ListLongMap!18947)

(assert (=> d!139071 (= lt!573480 lt!573478)))

(declare-fun lt!573477 () Unit!42080)

(assert (=> d!139071 (= lt!573477 e!720139)))

(declare-fun c!123371 () Bool)

(assert (=> d!139071 (= c!123371 e!720144)))

(declare-fun res!842073 () Bool)

(assert (=> d!139071 (=> (not res!842073) (not e!720144))))

(assert (=> d!139071 (= res!842073 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139071 (= lt!573478 e!720142)))

(declare-fun c!123368 () Bool)

(assert (=> d!139071 (= c!123368 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139071 (validMask!0 mask!1466)))

(assert (=> d!139071 (= (getCurrentListMap!4641 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573480)))

(declare-fun bm!62267 () Bool)

(declare-fun call!62271 () ListLongMap!18947)

(assert (=> bm!62267 (= call!62273 call!62271)))

(declare-fun b!1264724 () Bool)

(assert (=> b!1264724 (= e!720138 call!62267)))

(declare-fun b!1264725 () Bool)

(declare-fun res!842074 () Bool)

(assert (=> b!1264725 (=> (not res!842074) (not e!720141))))

(assert (=> b!1264725 (= res!842074 e!720149)))

(declare-fun c!123369 () Bool)

(assert (=> b!1264725 (= c!123369 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264726 () Bool)

(declare-fun c!123372 () Bool)

(assert (=> b!1264726 (= c!123372 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1264726 (= e!720145 e!720138)))

(declare-fun b!1264727 () Bool)

(assert (=> b!1264727 (= e!720145 call!62272)))

(declare-fun b!1264728 () Bool)

(declare-fun e!720147 () Bool)

(assert (=> b!1264728 (= e!720147 (= (apply!1010 lt!573480 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun e!720150 () Bool)

(declare-fun b!1264729 () Bool)

(assert (=> b!1264729 (= e!720150 (= (apply!1010 lt!573480 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _values!914)))))

(assert (=> b!1264729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264730 () Bool)

(declare-fun e!720140 () Bool)

(assert (=> b!1264730 (= e!720140 (= (apply!1010 lt!573480 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1264731 () Bool)

(assert (=> b!1264731 (= e!720143 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62268 () Bool)

(assert (=> bm!62268 (= call!62270 (+!4299 (ite c!123368 call!62271 (ite c!123373 call!62273 call!62267)) (ite (or c!123368 c!123373) (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!62269 () Bool)

(assert (=> bm!62269 (= call!62271 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264732 () Bool)

(assert (=> b!1264732 (= e!720146 e!720140)))

(declare-fun res!842078 () Bool)

(assert (=> b!1264732 (= res!842078 call!62269)))

(assert (=> b!1264732 (=> (not res!842078) (not e!720140))))

(declare-fun b!1264733 () Bool)

(assert (=> b!1264733 (= e!720149 e!720147)))

(declare-fun res!842071 () Bool)

(assert (=> b!1264733 (= res!842071 call!62268)))

(assert (=> b!1264733 (=> (not res!842071) (not e!720147))))

(declare-fun bm!62270 () Bool)

(assert (=> bm!62270 (= call!62268 (contains!7628 lt!573480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264734 () Bool)

(assert (=> b!1264734 (= e!720146 (not call!62269))))

(declare-fun b!1264735 () Bool)

(assert (=> b!1264735 (= e!720148 e!720150)))

(declare-fun res!842075 () Bool)

(assert (=> b!1264735 (=> (not res!842075) (not e!720150))))

(assert (=> b!1264735 (= res!842075 (contains!7628 lt!573480 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (= (and d!139071 c!123368) b!1264716))

(assert (= (and d!139071 (not c!123368)) b!1264718))

(assert (= (and b!1264718 c!123373) b!1264727))

(assert (= (and b!1264718 (not c!123373)) b!1264726))

(assert (= (and b!1264726 c!123372) b!1264721))

(assert (= (and b!1264726 (not c!123372)) b!1264724))

(assert (= (or b!1264721 b!1264724) bm!62265))

(assert (= (or b!1264727 bm!62265) bm!62267))

(assert (= (or b!1264727 b!1264721) bm!62266))

(assert (= (or b!1264716 bm!62267) bm!62269))

(assert (= (or b!1264716 bm!62266) bm!62268))

(assert (= (and d!139071 res!842073) b!1264722))

(assert (= (and d!139071 c!123371) b!1264720))

(assert (= (and d!139071 (not c!123371)) b!1264715))

(assert (= (and d!139071 res!842076) b!1264723))

(assert (= (and b!1264723 res!842079) b!1264731))

(assert (= (and b!1264723 (not res!842072)) b!1264735))

(assert (= (and b!1264735 res!842075) b!1264729))

(assert (= (and b!1264723 res!842077) b!1264725))

(assert (= (and b!1264725 c!123369) b!1264733))

(assert (= (and b!1264725 (not c!123369)) b!1264719))

(assert (= (and b!1264733 res!842071) b!1264728))

(assert (= (or b!1264733 b!1264719) bm!62270))

(assert (= (and b!1264725 res!842074) b!1264717))

(assert (= (and b!1264717 c!123370) b!1264732))

(assert (= (and b!1264717 (not c!123370)) b!1264734))

(assert (= (and b!1264732 res!842078) b!1264730))

(assert (= (or b!1264732 b!1264734) bm!62264))

(declare-fun b_lambda!22939 () Bool)

(assert (=> (not b_lambda!22939) (not b!1264729)))

(assert (=> b!1264729 t!41799))

(declare-fun b_and!45499 () Bool)

(assert (= b_and!45497 (and (=> t!41799 result!23387) b_and!45499)))

(declare-fun m!1165517 () Bool)

(assert (=> bm!62268 m!1165517))

(assert (=> bm!62269 m!1165379))

(declare-fun m!1165519 () Bool)

(assert (=> bm!62270 m!1165519))

(assert (=> b!1264731 m!1165465))

(assert (=> b!1264731 m!1165465))

(assert (=> b!1264731 m!1165467))

(declare-fun m!1165521 () Bool)

(assert (=> b!1264720 m!1165521))

(declare-fun m!1165523 () Bool)

(assert (=> b!1264720 m!1165523))

(declare-fun m!1165525 () Bool)

(assert (=> b!1264720 m!1165525))

(declare-fun m!1165527 () Bool)

(assert (=> b!1264720 m!1165527))

(declare-fun m!1165529 () Bool)

(assert (=> b!1264720 m!1165529))

(declare-fun m!1165531 () Bool)

(assert (=> b!1264720 m!1165531))

(assert (=> b!1264720 m!1165525))

(assert (=> b!1264720 m!1165521))

(assert (=> b!1264720 m!1165529))

(declare-fun m!1165533 () Bool)

(assert (=> b!1264720 m!1165533))

(declare-fun m!1165535 () Bool)

(assert (=> b!1264720 m!1165535))

(declare-fun m!1165537 () Bool)

(assert (=> b!1264720 m!1165537))

(declare-fun m!1165539 () Bool)

(assert (=> b!1264720 m!1165539))

(declare-fun m!1165541 () Bool)

(assert (=> b!1264720 m!1165541))

(declare-fun m!1165543 () Bool)

(assert (=> b!1264720 m!1165543))

(declare-fun m!1165545 () Bool)

(assert (=> b!1264720 m!1165545))

(assert (=> b!1264720 m!1165379))

(assert (=> b!1264720 m!1165465))

(assert (=> b!1264720 m!1165541))

(declare-fun m!1165547 () Bool)

(assert (=> b!1264720 m!1165547))

(declare-fun m!1165549 () Bool)

(assert (=> b!1264720 m!1165549))

(assert (=> b!1264722 m!1165465))

(assert (=> b!1264722 m!1165465))

(assert (=> b!1264722 m!1165467))

(declare-fun m!1165551 () Bool)

(assert (=> b!1264716 m!1165551))

(declare-fun m!1165553 () Bool)

(assert (=> b!1264728 m!1165553))

(assert (=> b!1264735 m!1165465))

(assert (=> b!1264735 m!1165465))

(declare-fun m!1165555 () Bool)

(assert (=> b!1264735 m!1165555))

(assert (=> b!1264729 m!1165505))

(assert (=> b!1264729 m!1165507))

(assert (=> b!1264729 m!1165505))

(assert (=> b!1264729 m!1165507))

(assert (=> b!1264729 m!1165509))

(assert (=> b!1264729 m!1165465))

(assert (=> b!1264729 m!1165465))

(declare-fun m!1165557 () Bool)

(assert (=> b!1264729 m!1165557))

(declare-fun m!1165559 () Bool)

(assert (=> b!1264730 m!1165559))

(assert (=> d!139071 m!1165371))

(declare-fun m!1165561 () Bool)

(assert (=> bm!62264 m!1165561))

(assert (=> b!1264582 d!139071))

(declare-fun d!139073 () Bool)

(declare-fun lt!573496 () ListLongMap!18947)

(assert (=> d!139073 (not (contains!7628 lt!573496 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!144 (List!28288 (_ BitVec 64)) List!28288)

(assert (=> d!139073 (= lt!573496 (ListLongMap!18948 (removeStrictlySorted!144 (toList!9489 lt!573355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139073 (= (-!2120 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573496)))

(declare-fun bs!35760 () Bool)

(assert (= bs!35760 d!139073))

(declare-fun m!1165563 () Bool)

(assert (=> bs!35760 m!1165563))

(declare-fun m!1165565 () Bool)

(assert (=> bs!35760 m!1165565))

(assert (=> b!1264582 d!139073))

(declare-fun d!139075 () Bool)

(assert (=> d!139075 (= (-!2120 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573355)))

(declare-fun lt!573499 () Unit!42080)

(declare-fun choose!1879 (ListLongMap!18947 (_ BitVec 64)) Unit!42080)

(assert (=> d!139075 (= lt!573499 (choose!1879 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139075 (not (contains!7628 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139075 (= (removeNotPresentStillSame!152 lt!573355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573499)))

(declare-fun bs!35761 () Bool)

(assert (= bs!35761 d!139075))

(assert (=> bs!35761 m!1165385))

(declare-fun m!1165567 () Bool)

(assert (=> bs!35761 m!1165567))

(assert (=> bs!35761 m!1165389))

(assert (=> b!1264582 d!139075))

(declare-fun b!1264744 () Bool)

(declare-fun e!720157 () Bool)

(declare-fun e!720158 () Bool)

(assert (=> b!1264744 (= e!720157 e!720158)))

(declare-fun lt!573507 () (_ BitVec 64))

(assert (=> b!1264744 (= lt!573507 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573508 () Unit!42080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82483 (_ BitVec 64) (_ BitVec 32)) Unit!42080)

(assert (=> b!1264744 (= lt!573508 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573507 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264744 (arrayContainsKey!0 _keys!1118 lt!573507 #b00000000000000000000000000000000)))

(declare-fun lt!573506 () Unit!42080)

(assert (=> b!1264744 (= lt!573506 lt!573508)))

(declare-fun res!842085 () Bool)

(declare-datatypes ((SeekEntryResult!9935 0))(
  ( (MissingZero!9935 (index!42111 (_ BitVec 32))) (Found!9935 (index!42112 (_ BitVec 32))) (Intermediate!9935 (undefined!10747 Bool) (index!42113 (_ BitVec 32)) (x!111303 (_ BitVec 32))) (Undefined!9935) (MissingVacant!9935 (index!42114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82483 (_ BitVec 32)) SeekEntryResult!9935)

(assert (=> b!1264744 (= res!842085 (= (seekEntryOrOpen!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9935 #b00000000000000000000000000000000)))))

(assert (=> b!1264744 (=> (not res!842085) (not e!720158))))

(declare-fun b!1264745 () Bool)

(declare-fun call!62276 () Bool)

(assert (=> b!1264745 (= e!720158 call!62276)))

(declare-fun b!1264746 () Bool)

(declare-fun e!720159 () Bool)

(assert (=> b!1264746 (= e!720159 e!720157)))

(declare-fun c!123376 () Bool)

(assert (=> b!1264746 (= c!123376 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!139077 () Bool)

(declare-fun res!842084 () Bool)

(assert (=> d!139077 (=> res!842084 e!720159)))

(assert (=> d!139077 (= res!842084 (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!720159)))

(declare-fun bm!62273 () Bool)

(assert (=> bm!62273 (= call!62276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1264747 () Bool)

(assert (=> b!1264747 (= e!720157 call!62276)))

(assert (= (and d!139077 (not res!842084)) b!1264746))

(assert (= (and b!1264746 c!123376) b!1264744))

(assert (= (and b!1264746 (not c!123376)) b!1264747))

(assert (= (and b!1264744 res!842085) b!1264745))

(assert (= (or b!1264745 b!1264747) bm!62273))

(assert (=> b!1264744 m!1165465))

(declare-fun m!1165569 () Bool)

(assert (=> b!1264744 m!1165569))

(declare-fun m!1165571 () Bool)

(assert (=> b!1264744 m!1165571))

(assert (=> b!1264744 m!1165465))

(declare-fun m!1165573 () Bool)

(assert (=> b!1264744 m!1165573))

(assert (=> b!1264746 m!1165465))

(assert (=> b!1264746 m!1165465))

(assert (=> b!1264746 m!1165467))

(declare-fun m!1165575 () Bool)

(assert (=> bm!62273 m!1165575))

(assert (=> b!1264578 d!139077))

(declare-fun bm!62276 () Bool)

(declare-fun call!62279 () Bool)

(declare-fun c!123379 () Bool)

(assert (=> bm!62276 (= call!62279 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123379 (Cons!28285 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) Nil!28286) Nil!28286)))))

(declare-fun b!1264758 () Bool)

(declare-fun e!720170 () Bool)

(declare-fun e!720168 () Bool)

(assert (=> b!1264758 (= e!720170 e!720168)))

(assert (=> b!1264758 (= c!123379 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264759 () Bool)

(assert (=> b!1264759 (= e!720168 call!62279)))

(declare-fun b!1264760 () Bool)

(declare-fun e!720169 () Bool)

(assert (=> b!1264760 (= e!720169 e!720170)))

(declare-fun res!842092 () Bool)

(assert (=> b!1264760 (=> (not res!842092) (not e!720170))))

(declare-fun e!720171 () Bool)

(assert (=> b!1264760 (= res!842092 (not e!720171))))

(declare-fun res!842093 () Bool)

(assert (=> b!1264760 (=> (not res!842093) (not e!720171))))

(assert (=> b!1264760 (= res!842093 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264762 () Bool)

(declare-fun contains!7630 (List!28289 (_ BitVec 64)) Bool)

(assert (=> b!1264762 (= e!720171 (contains!7630 Nil!28286 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264761 () Bool)

(assert (=> b!1264761 (= e!720168 call!62279)))

(declare-fun d!139079 () Bool)

(declare-fun res!842094 () Bool)

(assert (=> d!139079 (=> res!842094 e!720169)))

(assert (=> d!139079 (= res!842094 (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139079 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28286) e!720169)))

(assert (= (and d!139079 (not res!842094)) b!1264760))

(assert (= (and b!1264760 res!842093) b!1264762))

(assert (= (and b!1264760 res!842092) b!1264758))

(assert (= (and b!1264758 c!123379) b!1264759))

(assert (= (and b!1264758 (not c!123379)) b!1264761))

(assert (= (or b!1264759 b!1264761) bm!62276))

(assert (=> bm!62276 m!1165465))

(declare-fun m!1165577 () Bool)

(assert (=> bm!62276 m!1165577))

(assert (=> b!1264758 m!1165465))

(assert (=> b!1264758 m!1165465))

(assert (=> b!1264758 m!1165467))

(assert (=> b!1264760 m!1165465))

(assert (=> b!1264760 m!1165465))

(assert (=> b!1264760 m!1165467))

(assert (=> b!1264762 m!1165465))

(assert (=> b!1264762 m!1165465))

(declare-fun m!1165579 () Bool)

(assert (=> b!1264762 m!1165579))

(assert (=> b!1264580 d!139079))

(declare-fun d!139081 () Bool)

(assert (=> d!139081 (= (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573511 () Unit!42080)

(declare-fun choose!1880 (array!82483 array!82481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 V!48575 V!48575 (_ BitVec 32) Int) Unit!42080)

(assert (=> d!139081 (= lt!573511 (choose!1880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139081 (validMask!0 mask!1466)))

(assert (=> d!139081 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1182 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573511)))

(declare-fun bs!35762 () Bool)

(assert (= bs!35762 d!139081))

(assert (=> bs!35762 m!1165381))

(assert (=> bs!35762 m!1165379))

(declare-fun m!1165581 () Bool)

(assert (=> bs!35762 m!1165581))

(assert (=> bs!35762 m!1165371))

(assert (=> b!1264579 d!139081))

(declare-fun e!720191 () Bool)

(declare-fun lt!573529 () ListLongMap!18947)

(declare-fun b!1264787 () Bool)

(assert (=> b!1264787 (= e!720191 (= lt!573529 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264788 () Bool)

(declare-fun e!720189 () Bool)

(assert (=> b!1264788 (= e!720189 e!720191)))

(declare-fun c!123390 () Bool)

(assert (=> b!1264788 (= c!123390 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264789 () Bool)

(declare-fun isEmpty!1047 (ListLongMap!18947) Bool)

(assert (=> b!1264789 (= e!720191 (isEmpty!1047 lt!573529))))

(declare-fun d!139083 () Bool)

(declare-fun e!720192 () Bool)

(assert (=> d!139083 e!720192))

(declare-fun res!842106 () Bool)

(assert (=> d!139083 (=> (not res!842106) (not e!720192))))

(assert (=> d!139083 (= res!842106 (not (contains!7628 lt!573529 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!720188 () ListLongMap!18947)

(assert (=> d!139083 (= lt!573529 e!720188)))

(declare-fun c!123389 () Bool)

(assert (=> d!139083 (= c!123389 (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139083 (validMask!0 mask!1466)))

(assert (=> d!139083 (= (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573529)))

(declare-fun b!1264790 () Bool)

(declare-fun e!720187 () Bool)

(assert (=> b!1264790 (= e!720187 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264790 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!62282 () ListLongMap!18947)

(declare-fun bm!62279 () Bool)

(assert (=> bm!62279 (= call!62282 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264791 () Bool)

(declare-fun lt!573527 () Unit!42080)

(declare-fun lt!573532 () Unit!42080)

(assert (=> b!1264791 (= lt!573527 lt!573532)))

(declare-fun lt!573530 () ListLongMap!18947)

(declare-fun lt!573528 () V!48575)

(declare-fun lt!573526 () (_ BitVec 64))

(declare-fun lt!573531 () (_ BitVec 64))

(assert (=> b!1264791 (not (contains!7628 (+!4299 lt!573530 (tuple2!21067 lt!573531 lt!573528)) lt!573526))))

(declare-fun addStillNotContains!331 (ListLongMap!18947 (_ BitVec 64) V!48575 (_ BitVec 64)) Unit!42080)

(assert (=> b!1264791 (= lt!573532 (addStillNotContains!331 lt!573530 lt!573531 lt!573528 lt!573526))))

(assert (=> b!1264791 (= lt!573526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264791 (= lt!573528 (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264791 (= lt!573531 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264791 (= lt!573530 call!62282)))

(declare-fun e!720190 () ListLongMap!18947)

(assert (=> b!1264791 (= e!720190 (+!4299 call!62282 (tuple2!21067 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264792 () Bool)

(assert (=> b!1264792 (= e!720192 e!720189)))

(declare-fun c!123388 () Bool)

(assert (=> b!1264792 (= c!123388 e!720187)))

(declare-fun res!842105 () Bool)

(assert (=> b!1264792 (=> (not res!842105) (not e!720187))))

(assert (=> b!1264792 (= res!842105 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264793 () Bool)

(assert (=> b!1264793 (= e!720190 call!62282)))

(declare-fun b!1264794 () Bool)

(assert (=> b!1264794 (= e!720188 (ListLongMap!18948 Nil!28285))))

(declare-fun b!1264795 () Bool)

(assert (=> b!1264795 (= e!720188 e!720190)))

(declare-fun c!123391 () Bool)

(assert (=> b!1264795 (= c!123391 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264796 () Bool)

(declare-fun e!720186 () Bool)

(assert (=> b!1264796 (= e!720189 e!720186)))

(assert (=> b!1264796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun res!842104 () Bool)

(assert (=> b!1264796 (= res!842104 (contains!7628 lt!573529 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264796 (=> (not res!842104) (not e!720186))))

(declare-fun b!1264797 () Bool)

(assert (=> b!1264797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> b!1264797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _values!914)))))

(assert (=> b!1264797 (= e!720186 (= (apply!1010 lt!573529 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264798 () Bool)

(declare-fun res!842103 () Bool)

(assert (=> b!1264798 (=> (not res!842103) (not e!720192))))

(assert (=> b!1264798 (= res!842103 (not (contains!7628 lt!573529 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139083 c!123389) b!1264794))

(assert (= (and d!139083 (not c!123389)) b!1264795))

(assert (= (and b!1264795 c!123391) b!1264791))

(assert (= (and b!1264795 (not c!123391)) b!1264793))

(assert (= (or b!1264791 b!1264793) bm!62279))

(assert (= (and d!139083 res!842106) b!1264798))

(assert (= (and b!1264798 res!842103) b!1264792))

(assert (= (and b!1264792 res!842105) b!1264790))

(assert (= (and b!1264792 c!123388) b!1264796))

(assert (= (and b!1264792 (not c!123388)) b!1264788))

(assert (= (and b!1264796 res!842104) b!1264797))

(assert (= (and b!1264788 c!123390) b!1264787))

(assert (= (and b!1264788 (not c!123390)) b!1264789))

(declare-fun b_lambda!22941 () Bool)

(assert (=> (not b_lambda!22941) (not b!1264791)))

(assert (=> b!1264791 t!41799))

(declare-fun b_and!45501 () Bool)

(assert (= b_and!45499 (and (=> t!41799 result!23387) b_and!45501)))

(declare-fun b_lambda!22943 () Bool)

(assert (=> (not b_lambda!22943) (not b!1264797)))

(assert (=> b!1264797 t!41799))

(declare-fun b_and!45503 () Bool)

(assert (= b_and!45501 (and (=> t!41799 result!23387) b_and!45503)))

(assert (=> b!1264796 m!1165465))

(assert (=> b!1264796 m!1165465))

(declare-fun m!1165583 () Bool)

(assert (=> b!1264796 m!1165583))

(declare-fun m!1165585 () Bool)

(assert (=> b!1264787 m!1165585))

(declare-fun m!1165587 () Bool)

(assert (=> b!1264789 m!1165587))

(assert (=> bm!62279 m!1165585))

(assert (=> b!1264791 m!1165507))

(declare-fun m!1165589 () Bool)

(assert (=> b!1264791 m!1165589))

(assert (=> b!1264791 m!1165505))

(assert (=> b!1264791 m!1165589))

(declare-fun m!1165591 () Bool)

(assert (=> b!1264791 m!1165591))

(declare-fun m!1165593 () Bool)

(assert (=> b!1264791 m!1165593))

(assert (=> b!1264791 m!1165465))

(declare-fun m!1165595 () Bool)

(assert (=> b!1264791 m!1165595))

(assert (=> b!1264791 m!1165505))

(assert (=> b!1264791 m!1165507))

(assert (=> b!1264791 m!1165509))

(assert (=> b!1264790 m!1165465))

(assert (=> b!1264790 m!1165465))

(assert (=> b!1264790 m!1165467))

(assert (=> b!1264795 m!1165465))

(assert (=> b!1264795 m!1165465))

(assert (=> b!1264795 m!1165467))

(assert (=> b!1264797 m!1165507))

(assert (=> b!1264797 m!1165505))

(assert (=> b!1264797 m!1165465))

(assert (=> b!1264797 m!1165465))

(declare-fun m!1165597 () Bool)

(assert (=> b!1264797 m!1165597))

(assert (=> b!1264797 m!1165505))

(assert (=> b!1264797 m!1165507))

(assert (=> b!1264797 m!1165509))

(declare-fun m!1165599 () Bool)

(assert (=> b!1264798 m!1165599))

(declare-fun m!1165601 () Bool)

(assert (=> d!139083 m!1165601))

(assert (=> d!139083 m!1165371))

(assert (=> b!1264579 d!139083))

(declare-fun e!720198 () Bool)

(declare-fun b!1264799 () Bool)

(declare-fun lt!573536 () ListLongMap!18947)

(assert (=> b!1264799 (= e!720198 (= lt!573536 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264800 () Bool)

(declare-fun e!720196 () Bool)

(assert (=> b!1264800 (= e!720196 e!720198)))

(declare-fun c!123394 () Bool)

(assert (=> b!1264800 (= c!123394 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264801 () Bool)

(assert (=> b!1264801 (= e!720198 (isEmpty!1047 lt!573536))))

(declare-fun d!139085 () Bool)

(declare-fun e!720199 () Bool)

(assert (=> d!139085 e!720199))

(declare-fun res!842110 () Bool)

(assert (=> d!139085 (=> (not res!842110) (not e!720199))))

(assert (=> d!139085 (= res!842110 (not (contains!7628 lt!573536 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!720195 () ListLongMap!18947)

(assert (=> d!139085 (= lt!573536 e!720195)))

(declare-fun c!123393 () Bool)

(assert (=> d!139085 (= c!123393 (bvsge #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> d!139085 (validMask!0 mask!1466)))

(assert (=> d!139085 (= (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573536)))

(declare-fun b!1264802 () Bool)

(declare-fun e!720194 () Bool)

(assert (=> b!1264802 (= e!720194 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!62280 () Bool)

(declare-fun call!62283 () ListLongMap!18947)

(assert (=> bm!62280 (= call!62283 (getCurrentListMapNoExtraKeys!5892 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264803 () Bool)

(declare-fun lt!573534 () Unit!42080)

(declare-fun lt!573539 () Unit!42080)

(assert (=> b!1264803 (= lt!573534 lt!573539)))

(declare-fun lt!573535 () V!48575)

(declare-fun lt!573537 () ListLongMap!18947)

(declare-fun lt!573533 () (_ BitVec 64))

(declare-fun lt!573538 () (_ BitVec 64))

(assert (=> b!1264803 (not (contains!7628 (+!4299 lt!573537 (tuple2!21067 lt!573538 lt!573535)) lt!573533))))

(assert (=> b!1264803 (= lt!573539 (addStillNotContains!331 lt!573537 lt!573538 lt!573535 lt!573533))))

(assert (=> b!1264803 (= lt!573533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264803 (= lt!573535 (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264803 (= lt!573538 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264803 (= lt!573537 call!62283)))

(declare-fun e!720197 () ListLongMap!18947)

(assert (=> b!1264803 (= e!720197 (+!4299 call!62283 (tuple2!21067 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264804 () Bool)

(assert (=> b!1264804 (= e!720199 e!720196)))

(declare-fun c!123392 () Bool)

(assert (=> b!1264804 (= c!123392 e!720194)))

(declare-fun res!842109 () Bool)

(assert (=> b!1264804 (=> (not res!842109) (not e!720194))))

(assert (=> b!1264804 (= res!842109 (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun b!1264805 () Bool)

(assert (=> b!1264805 (= e!720197 call!62283)))

(declare-fun b!1264806 () Bool)

(assert (=> b!1264806 (= e!720195 (ListLongMap!18948 Nil!28285))))

(declare-fun b!1264807 () Bool)

(assert (=> b!1264807 (= e!720195 e!720197)))

(declare-fun c!123395 () Bool)

(assert (=> b!1264807 (= c!123395 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264808 () Bool)

(declare-fun e!720193 () Bool)

(assert (=> b!1264808 (= e!720196 e!720193)))

(assert (=> b!1264808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(declare-fun res!842108 () Bool)

(assert (=> b!1264808 (= res!842108 (contains!7628 lt!573536 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264808 (=> (not res!842108) (not e!720193))))

(declare-fun b!1264809 () Bool)

(assert (=> b!1264809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _keys!1118)))))

(assert (=> b!1264809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _values!914)))))

(assert (=> b!1264809 (= e!720193 (= (apply!1010 lt!573536 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20339 (select (arr!39782 _values!914) #b00000000000000000000000000000000) (dynLambda!3462 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264810 () Bool)

(declare-fun res!842107 () Bool)

(assert (=> b!1264810 (=> (not res!842107) (not e!720199))))

(assert (=> b!1264810 (= res!842107 (not (contains!7628 lt!573536 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139085 c!123393) b!1264806))

(assert (= (and d!139085 (not c!123393)) b!1264807))

(assert (= (and b!1264807 c!123395) b!1264803))

(assert (= (and b!1264807 (not c!123395)) b!1264805))

(assert (= (or b!1264803 b!1264805) bm!62280))

(assert (= (and d!139085 res!842110) b!1264810))

(assert (= (and b!1264810 res!842107) b!1264804))

(assert (= (and b!1264804 res!842109) b!1264802))

(assert (= (and b!1264804 c!123392) b!1264808))

(assert (= (and b!1264804 (not c!123392)) b!1264800))

(assert (= (and b!1264808 res!842108) b!1264809))

(assert (= (and b!1264800 c!123394) b!1264799))

(assert (= (and b!1264800 (not c!123394)) b!1264801))

(declare-fun b_lambda!22945 () Bool)

(assert (=> (not b_lambda!22945) (not b!1264803)))

(assert (=> b!1264803 t!41799))

(declare-fun b_and!45505 () Bool)

(assert (= b_and!45503 (and (=> t!41799 result!23387) b_and!45505)))

(declare-fun b_lambda!22947 () Bool)

(assert (=> (not b_lambda!22947) (not b!1264809)))

(assert (=> b!1264809 t!41799))

(declare-fun b_and!45507 () Bool)

(assert (= b_and!45505 (and (=> t!41799 result!23387) b_and!45507)))

(assert (=> b!1264808 m!1165465))

(assert (=> b!1264808 m!1165465))

(declare-fun m!1165603 () Bool)

(assert (=> b!1264808 m!1165603))

(declare-fun m!1165605 () Bool)

(assert (=> b!1264799 m!1165605))

(declare-fun m!1165607 () Bool)

(assert (=> b!1264801 m!1165607))

(assert (=> bm!62280 m!1165605))

(assert (=> b!1264803 m!1165507))

(declare-fun m!1165609 () Bool)

(assert (=> b!1264803 m!1165609))

(assert (=> b!1264803 m!1165505))

(assert (=> b!1264803 m!1165609))

(declare-fun m!1165611 () Bool)

(assert (=> b!1264803 m!1165611))

(declare-fun m!1165613 () Bool)

(assert (=> b!1264803 m!1165613))

(assert (=> b!1264803 m!1165465))

(declare-fun m!1165615 () Bool)

(assert (=> b!1264803 m!1165615))

(assert (=> b!1264803 m!1165505))

(assert (=> b!1264803 m!1165507))

(assert (=> b!1264803 m!1165509))

(assert (=> b!1264802 m!1165465))

(assert (=> b!1264802 m!1165465))

(assert (=> b!1264802 m!1165467))

(assert (=> b!1264807 m!1165465))

(assert (=> b!1264807 m!1165465))

(assert (=> b!1264807 m!1165467))

(assert (=> b!1264809 m!1165507))

(assert (=> b!1264809 m!1165505))

(assert (=> b!1264809 m!1165465))

(assert (=> b!1264809 m!1165465))

(declare-fun m!1165617 () Bool)

(assert (=> b!1264809 m!1165617))

(assert (=> b!1264809 m!1165505))

(assert (=> b!1264809 m!1165507))

(assert (=> b!1264809 m!1165509))

(declare-fun m!1165619 () Bool)

(assert (=> b!1264810 m!1165619))

(declare-fun m!1165621 () Bool)

(assert (=> d!139085 m!1165621))

(assert (=> d!139085 m!1165371))

(assert (=> b!1264579 d!139085))

(declare-fun b!1264817 () Bool)

(declare-fun e!720204 () Bool)

(assert (=> b!1264817 (= e!720204 tp_is_empty!32407)))

(declare-fun mapIsEmpty!50443 () Bool)

(declare-fun mapRes!50443 () Bool)

(assert (=> mapIsEmpty!50443 mapRes!50443))

(declare-fun condMapEmpty!50443 () Bool)

(declare-fun mapDefault!50443 () ValueCell!15440)

(assert (=> mapNonEmpty!50434 (= condMapEmpty!50443 (= mapRest!50434 ((as const (Array (_ BitVec 32) ValueCell!15440)) mapDefault!50443)))))

(declare-fun e!720205 () Bool)

(assert (=> mapNonEmpty!50434 (= tp!96068 (and e!720205 mapRes!50443))))

(declare-fun b!1264818 () Bool)

(assert (=> b!1264818 (= e!720205 tp_is_empty!32407)))

(declare-fun mapNonEmpty!50443 () Bool)

(declare-fun tp!96083 () Bool)

(assert (=> mapNonEmpty!50443 (= mapRes!50443 (and tp!96083 e!720204))))

(declare-fun mapValue!50443 () ValueCell!15440)

(declare-fun mapRest!50443 () (Array (_ BitVec 32) ValueCell!15440))

(declare-fun mapKey!50443 () (_ BitVec 32))

(assert (=> mapNonEmpty!50443 (= mapRest!50434 (store mapRest!50443 mapKey!50443 mapValue!50443))))

(assert (= (and mapNonEmpty!50434 condMapEmpty!50443) mapIsEmpty!50443))

(assert (= (and mapNonEmpty!50434 (not condMapEmpty!50443)) mapNonEmpty!50443))

(assert (= (and mapNonEmpty!50443 ((_ is ValueCellFull!15440) mapValue!50443)) b!1264817))

(assert (= (and mapNonEmpty!50434 ((_ is ValueCellFull!15440) mapDefault!50443)) b!1264818))

(declare-fun m!1165623 () Bool)

(assert (=> mapNonEmpty!50443 m!1165623))

(declare-fun b_lambda!22949 () Bool)

(assert (= b_lambda!22945 (or (and start!106314 b_free!27505) b_lambda!22949)))

(declare-fun b_lambda!22951 () Bool)

(assert (= b_lambda!22941 (or (and start!106314 b_free!27505) b_lambda!22951)))

(declare-fun b_lambda!22953 () Bool)

(assert (= b_lambda!22939 (or (and start!106314 b_free!27505) b_lambda!22953)))

(declare-fun b_lambda!22955 () Bool)

(assert (= b_lambda!22943 (or (and start!106314 b_free!27505) b_lambda!22955)))

(declare-fun b_lambda!22957 () Bool)

(assert (= b_lambda!22947 (or (and start!106314 b_free!27505) b_lambda!22957)))

(declare-fun b_lambda!22959 () Bool)

(assert (= b_lambda!22937 (or (and start!106314 b_free!27505) b_lambda!22959)))

(check-sat (not bm!62279) (not b!1264693) (not b!1264801) (not bm!62270) (not d!139061) (not d!139063) (not b!1264798) (not bm!62263) (not b!1264708) (not d!139071) (not b!1264807) (not mapNonEmpty!50443) (not bm!62280) (not bm!62262) tp_is_empty!32407 (not bm!62257) (not b!1264809) (not bm!62261) (not b!1264730) (not b!1264762) (not b!1264789) (not b!1264706) (not b_next!27505) (not d!139083) (not b!1264746) (not b!1264728) (not d!139075) b_and!45507 (not b!1264791) (not b!1264731) (not b!1264790) (not b!1264712) (not b_lambda!22953) (not b_lambda!22955) (not b!1264760) (not b_lambda!22959) (not b!1264797) (not b!1264744) (not b_lambda!22949) (not b!1264722) (not b!1264699) (not b!1264802) (not b!1264799) (not b!1264720) (not d!139085) (not b!1264705) (not d!139073) (not b!1264787) (not b!1264803) (not bm!62276) (not b!1264707) (not b!1264810) (not bm!62264) (not b!1264808) (not b!1264716) (not b!1264795) (not bm!62269) (not b_lambda!22957) (not b!1264735) (not b!1264758) (not b!1264649) (not bm!62273) (not b_lambda!22951) (not b!1264697) (not b!1264729) (not b!1264647) (not d!139081) (not bm!62268) (not b!1264796))
(check-sat b_and!45507 (not b_next!27505))
