; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105924 () Bool)

(assert start!105924)

(declare-fun b_free!27457 () Bool)

(declare-fun b_next!27457 () Bool)

(assert (=> start!105924 (= b_free!27457 (not b_next!27457))))

(declare-fun tp!95905 () Bool)

(declare-fun b_and!45355 () Bool)

(assert (=> start!105924 (= tp!95905 b_and!45355)))

(declare-fun b!1261551 () Bool)

(declare-fun e!718038 () Bool)

(declare-fun tp_is_empty!32359 () Bool)

(assert (=> b!1261551 (= e!718038 tp_is_empty!32359)))

(declare-fun b!1261552 () Bool)

(declare-fun e!718036 () Bool)

(assert (=> b!1261552 (= e!718036 tp_is_empty!32359)))

(declare-fun b!1261553 () Bool)

(declare-fun e!718034 () Bool)

(declare-fun e!718033 () Bool)

(assert (=> b!1261553 (= e!718034 (not e!718033))))

(declare-fun res!840631 () Bool)

(assert (=> b!1261553 (=> res!840631 e!718033)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261553 (= res!840631 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48511 0))(
  ( (V!48512 (val!16242 Int)) )
))
(declare-datatypes ((tuple2!21094 0))(
  ( (tuple2!21095 (_1!10558 (_ BitVec 64)) (_2!10558 V!48511)) )
))
(declare-datatypes ((List!28296 0))(
  ( (Nil!28293) (Cons!28292 (h!29501 tuple2!21094) (t!41788 List!28296)) )
))
(declare-datatypes ((ListLongMap!18967 0))(
  ( (ListLongMap!18968 (toList!9499 List!28296)) )
))
(declare-fun lt!571520 () ListLongMap!18967)

(declare-fun lt!571519 () ListLongMap!18967)

(assert (=> b!1261553 (= lt!571520 lt!571519)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48511)

(declare-datatypes ((Unit!41902 0))(
  ( (Unit!41903) )
))
(declare-fun lt!571518 () Unit!41902)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48511)

(declare-datatypes ((array!82255 0))(
  ( (array!82256 (arr!39680 (Array (_ BitVec 32) (_ BitVec 64))) (size!40218 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82255)

(declare-datatypes ((ValueCell!15416 0))(
  ( (ValueCellFull!15416 (v!18945 V!48511)) (EmptyCell!15416) )
))
(declare-datatypes ((array!82257 0))(
  ( (array!82258 (arr!39681 (Array (_ BitVec 32) ValueCell!15416)) (size!40219 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82257)

(declare-fun minValueBefore!43 () V!48511)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1168 (array!82255 array!82257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 V!48511 V!48511 (_ BitVec 32) Int) Unit!41902)

(assert (=> b!1261553 (= lt!571518 (lemmaNoChangeToArrayThenSameMapNoExtras!1168 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5868 (array!82255 array!82257 (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 (_ BitVec 32) Int) ListLongMap!18967)

(assert (=> b!1261553 (= lt!571519 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261553 (= lt!571520 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261554 () Bool)

(declare-fun e!718037 () Bool)

(declare-fun mapRes!50344 () Bool)

(assert (=> b!1261554 (= e!718037 (and e!718038 mapRes!50344))))

(declare-fun condMapEmpty!50344 () Bool)

(declare-fun mapDefault!50344 () ValueCell!15416)

(assert (=> b!1261554 (= condMapEmpty!50344 (= (arr!39681 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15416)) mapDefault!50344)))))

(declare-fun mapIsEmpty!50344 () Bool)

(assert (=> mapIsEmpty!50344 mapRes!50344))

(declare-fun b!1261555 () Bool)

(declare-fun contains!7554 (ListLongMap!18967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4558 (array!82255 array!82257 (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 (_ BitVec 32) Int) ListLongMap!18967)

(assert (=> b!1261555 (= e!718033 (not (contains!7554 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261556 () Bool)

(declare-fun res!840628 () Bool)

(assert (=> b!1261556 (=> (not res!840628) (not e!718034))))

(declare-datatypes ((List!28297 0))(
  ( (Nil!28294) (Cons!28293 (h!29502 (_ BitVec 64)) (t!41789 List!28297)) )
))
(declare-fun arrayNoDuplicates!0 (array!82255 (_ BitVec 32) List!28297) Bool)

(assert (=> b!1261556 (= res!840628 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28294))))

(declare-fun mapNonEmpty!50344 () Bool)

(declare-fun tp!95906 () Bool)

(assert (=> mapNonEmpty!50344 (= mapRes!50344 (and tp!95906 e!718036))))

(declare-fun mapRest!50344 () (Array (_ BitVec 32) ValueCell!15416))

(declare-fun mapKey!50344 () (_ BitVec 32))

(declare-fun mapValue!50344 () ValueCell!15416)

(assert (=> mapNonEmpty!50344 (= (arr!39681 _values!914) (store mapRest!50344 mapKey!50344 mapValue!50344))))

(declare-fun res!840627 () Bool)

(assert (=> start!105924 (=> (not res!840627) (not e!718034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105924 (= res!840627 (validMask!0 mask!1466))))

(assert (=> start!105924 e!718034))

(assert (=> start!105924 true))

(assert (=> start!105924 tp!95905))

(assert (=> start!105924 tp_is_empty!32359))

(declare-fun array_inv!30357 (array!82255) Bool)

(assert (=> start!105924 (array_inv!30357 _keys!1118)))

(declare-fun array_inv!30358 (array!82257) Bool)

(assert (=> start!105924 (and (array_inv!30358 _values!914) e!718037)))

(declare-fun b!1261557 () Bool)

(declare-fun res!840629 () Bool)

(assert (=> b!1261557 (=> (not res!840629) (not e!718034))))

(assert (=> b!1261557 (= res!840629 (and (= (size!40219 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40218 _keys!1118) (size!40219 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261558 () Bool)

(declare-fun res!840630 () Bool)

(assert (=> b!1261558 (=> (not res!840630) (not e!718034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82255 (_ BitVec 32)) Bool)

(assert (=> b!1261558 (= res!840630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105924 res!840627) b!1261557))

(assert (= (and b!1261557 res!840629) b!1261558))

(assert (= (and b!1261558 res!840630) b!1261556))

(assert (= (and b!1261556 res!840628) b!1261553))

(assert (= (and b!1261553 (not res!840631)) b!1261555))

(assert (= (and b!1261554 condMapEmpty!50344) mapIsEmpty!50344))

(assert (= (and b!1261554 (not condMapEmpty!50344)) mapNonEmpty!50344))

(get-info :version)

(assert (= (and mapNonEmpty!50344 ((_ is ValueCellFull!15416) mapValue!50344)) b!1261552))

(assert (= (and b!1261554 ((_ is ValueCellFull!15416) mapDefault!50344)) b!1261551))

(assert (= start!105924 b!1261554))

(declare-fun m!1161689 () Bool)

(assert (=> mapNonEmpty!50344 m!1161689))

(declare-fun m!1161691 () Bool)

(assert (=> b!1261555 m!1161691))

(assert (=> b!1261555 m!1161691))

(declare-fun m!1161693 () Bool)

(assert (=> b!1261555 m!1161693))

(declare-fun m!1161695 () Bool)

(assert (=> start!105924 m!1161695))

(declare-fun m!1161697 () Bool)

(assert (=> start!105924 m!1161697))

(declare-fun m!1161699 () Bool)

(assert (=> start!105924 m!1161699))

(declare-fun m!1161701 () Bool)

(assert (=> b!1261558 m!1161701))

(declare-fun m!1161703 () Bool)

(assert (=> b!1261553 m!1161703))

(declare-fun m!1161705 () Bool)

(assert (=> b!1261553 m!1161705))

(declare-fun m!1161707 () Bool)

(assert (=> b!1261553 m!1161707))

(declare-fun m!1161709 () Bool)

(assert (=> b!1261556 m!1161709))

(check-sat (not b!1261555) (not b!1261556) tp_is_empty!32359 (not b!1261553) (not mapNonEmpty!50344) b_and!45355 (not b!1261558) (not start!105924) (not b_next!27457))
(check-sat b_and!45355 (not b_next!27457))
(get-model)

(declare-fun b!1261615 () Bool)

(declare-fun e!718083 () Bool)

(declare-fun e!718082 () Bool)

(assert (=> b!1261615 (= e!718083 e!718082)))

(declare-fun c!122655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261615 (= c!122655 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61947 () Bool)

(declare-fun call!61950 () Bool)

(assert (=> bm!61947 (= call!61950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261616 () Bool)

(declare-fun e!718081 () Bool)

(assert (=> b!1261616 (= e!718082 e!718081)))

(declare-fun lt!571546 () (_ BitVec 64))

(assert (=> b!1261616 (= lt!571546 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571545 () Unit!41902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82255 (_ BitVec 64) (_ BitVec 32)) Unit!41902)

(assert (=> b!1261616 (= lt!571545 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571546 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261616 (arrayContainsKey!0 _keys!1118 lt!571546 #b00000000000000000000000000000000)))

(declare-fun lt!571547 () Unit!41902)

(assert (=> b!1261616 (= lt!571547 lt!571545)))

(declare-fun res!840666 () Bool)

(declare-datatypes ((SeekEntryResult!9972 0))(
  ( (MissingZero!9972 (index!42259 (_ BitVec 32))) (Found!9972 (index!42260 (_ BitVec 32))) (Intermediate!9972 (undefined!10784 Bool) (index!42261 (_ BitVec 32)) (x!111185 (_ BitVec 32))) (Undefined!9972) (MissingVacant!9972 (index!42262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82255 (_ BitVec 32)) SeekEntryResult!9972)

(assert (=> b!1261616 (= res!840666 (= (seekEntryOrOpen!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9972 #b00000000000000000000000000000000)))))

(assert (=> b!1261616 (=> (not res!840666) (not e!718081))))

(declare-fun d!138331 () Bool)

(declare-fun res!840667 () Bool)

(assert (=> d!138331 (=> res!840667 e!718083)))

(assert (=> d!138331 (= res!840667 (bvsge #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> d!138331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718083)))

(declare-fun b!1261617 () Bool)

(assert (=> b!1261617 (= e!718081 call!61950)))

(declare-fun b!1261618 () Bool)

(assert (=> b!1261618 (= e!718082 call!61950)))

(assert (= (and d!138331 (not res!840667)) b!1261615))

(assert (= (and b!1261615 c!122655) b!1261616))

(assert (= (and b!1261615 (not c!122655)) b!1261618))

(assert (= (and b!1261616 res!840666) b!1261617))

(assert (= (or b!1261617 b!1261618) bm!61947))

(declare-fun m!1161755 () Bool)

(assert (=> b!1261615 m!1161755))

(assert (=> b!1261615 m!1161755))

(declare-fun m!1161757 () Bool)

(assert (=> b!1261615 m!1161757))

(declare-fun m!1161759 () Bool)

(assert (=> bm!61947 m!1161759))

(assert (=> b!1261616 m!1161755))

(declare-fun m!1161761 () Bool)

(assert (=> b!1261616 m!1161761))

(declare-fun m!1161763 () Bool)

(assert (=> b!1261616 m!1161763))

(assert (=> b!1261616 m!1161755))

(declare-fun m!1161765 () Bool)

(assert (=> b!1261616 m!1161765))

(assert (=> b!1261558 d!138331))

(declare-fun d!138333 () Bool)

(declare-fun e!718088 () Bool)

(assert (=> d!138333 e!718088))

(declare-fun res!840670 () Bool)

(assert (=> d!138333 (=> res!840670 e!718088)))

(declare-fun lt!571556 () Bool)

(assert (=> d!138333 (= res!840670 (not lt!571556))))

(declare-fun lt!571557 () Bool)

(assert (=> d!138333 (= lt!571556 lt!571557)))

(declare-fun lt!571558 () Unit!41902)

(declare-fun e!718089 () Unit!41902)

(assert (=> d!138333 (= lt!571558 e!718089)))

(declare-fun c!122658 () Bool)

(assert (=> d!138333 (= c!122658 lt!571557)))

(declare-fun containsKey!620 (List!28296 (_ BitVec 64)) Bool)

(assert (=> d!138333 (= lt!571557 (containsKey!620 (toList!9499 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138333 (= (contains!7554 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!571556)))

(declare-fun b!1261625 () Bool)

(declare-fun lt!571559 () Unit!41902)

(assert (=> b!1261625 (= e!718089 lt!571559)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!430 (List!28296 (_ BitVec 64)) Unit!41902)

(assert (=> b!1261625 (= lt!571559 (lemmaContainsKeyImpliesGetValueByKeyDefined!430 (toList!9499 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!713 0))(
  ( (Some!712 (v!18948 V!48511)) (None!711) )
))
(declare-fun isDefined!473 (Option!713) Bool)

(declare-fun getValueByKey!662 (List!28296 (_ BitVec 64)) Option!713)

(assert (=> b!1261625 (isDefined!473 (getValueByKey!662 (toList!9499 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261626 () Bool)

(declare-fun Unit!41908 () Unit!41902)

(assert (=> b!1261626 (= e!718089 Unit!41908)))

(declare-fun b!1261627 () Bool)

(assert (=> b!1261627 (= e!718088 (isDefined!473 (getValueByKey!662 (toList!9499 (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138333 c!122658) b!1261625))

(assert (= (and d!138333 (not c!122658)) b!1261626))

(assert (= (and d!138333 (not res!840670)) b!1261627))

(declare-fun m!1161767 () Bool)

(assert (=> d!138333 m!1161767))

(declare-fun m!1161769 () Bool)

(assert (=> b!1261625 m!1161769))

(declare-fun m!1161771 () Bool)

(assert (=> b!1261625 m!1161771))

(assert (=> b!1261625 m!1161771))

(declare-fun m!1161773 () Bool)

(assert (=> b!1261625 m!1161773))

(assert (=> b!1261627 m!1161771))

(assert (=> b!1261627 m!1161771))

(assert (=> b!1261627 m!1161773))

(assert (=> b!1261555 d!138333))

(declare-fun b!1261670 () Bool)

(declare-fun e!718120 () Unit!41902)

(declare-fun lt!571607 () Unit!41902)

(assert (=> b!1261670 (= e!718120 lt!571607)))

(declare-fun lt!571617 () ListLongMap!18967)

(assert (=> b!1261670 (= lt!571617 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571604 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571610 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571610 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571620 () Unit!41902)

(declare-fun addStillContains!1085 (ListLongMap!18967 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!41902)

(assert (=> b!1261670 (= lt!571620 (addStillContains!1085 lt!571617 lt!571604 zeroValue!871 lt!571610))))

(declare-fun +!4277 (ListLongMap!18967 tuple2!21094) ListLongMap!18967)

(assert (=> b!1261670 (contains!7554 (+!4277 lt!571617 (tuple2!21095 lt!571604 zeroValue!871)) lt!571610)))

(declare-fun lt!571609 () Unit!41902)

(assert (=> b!1261670 (= lt!571609 lt!571620)))

(declare-fun lt!571608 () ListLongMap!18967)

(assert (=> b!1261670 (= lt!571608 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571625 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571625 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571618 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571618 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571621 () Unit!41902)

(declare-fun addApplyDifferent!528 (ListLongMap!18967 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!41902)

(assert (=> b!1261670 (= lt!571621 (addApplyDifferent!528 lt!571608 lt!571625 minValueBefore!43 lt!571618))))

(declare-fun apply!988 (ListLongMap!18967 (_ BitVec 64)) V!48511)

(assert (=> b!1261670 (= (apply!988 (+!4277 lt!571608 (tuple2!21095 lt!571625 minValueBefore!43)) lt!571618) (apply!988 lt!571608 lt!571618))))

(declare-fun lt!571605 () Unit!41902)

(assert (=> b!1261670 (= lt!571605 lt!571621)))

(declare-fun lt!571616 () ListLongMap!18967)

(assert (=> b!1261670 (= lt!571616 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571615 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571624 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571624 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571619 () Unit!41902)

(assert (=> b!1261670 (= lt!571619 (addApplyDifferent!528 lt!571616 lt!571615 zeroValue!871 lt!571624))))

(assert (=> b!1261670 (= (apply!988 (+!4277 lt!571616 (tuple2!21095 lt!571615 zeroValue!871)) lt!571624) (apply!988 lt!571616 lt!571624))))

(declare-fun lt!571612 () Unit!41902)

(assert (=> b!1261670 (= lt!571612 lt!571619)))

(declare-fun lt!571613 () ListLongMap!18967)

(assert (=> b!1261670 (= lt!571613 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571606 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571614 () (_ BitVec 64))

(assert (=> b!1261670 (= lt!571614 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261670 (= lt!571607 (addApplyDifferent!528 lt!571613 lt!571606 minValueBefore!43 lt!571614))))

(assert (=> b!1261670 (= (apply!988 (+!4277 lt!571613 (tuple2!21095 lt!571606 minValueBefore!43)) lt!571614) (apply!988 lt!571613 lt!571614))))

(declare-fun b!1261671 () Bool)

(declare-fun e!718125 () Bool)

(assert (=> b!1261671 (= e!718125 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261672 () Bool)

(declare-fun e!718116 () Bool)

(declare-fun call!61969 () Bool)

(assert (=> b!1261672 (= e!718116 (not call!61969))))

(declare-fun b!1261673 () Bool)

(declare-fun res!840689 () Bool)

(declare-fun e!718122 () Bool)

(assert (=> b!1261673 (=> (not res!840689) (not e!718122))))

(declare-fun e!718121 () Bool)

(assert (=> b!1261673 (= res!840689 e!718121)))

(declare-fun res!840693 () Bool)

(assert (=> b!1261673 (=> res!840693 e!718121)))

(assert (=> b!1261673 (= res!840693 (not e!718125))))

(declare-fun res!840696 () Bool)

(assert (=> b!1261673 (=> (not res!840696) (not e!718125))))

(assert (=> b!1261673 (= res!840696 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun bm!61962 () Bool)

(declare-fun call!61968 () ListLongMap!18967)

(declare-fun call!61966 () ListLongMap!18967)

(assert (=> bm!61962 (= call!61968 call!61966)))

(declare-fun b!1261674 () Bool)

(declare-fun c!122672 () Bool)

(assert (=> b!1261674 (= c!122672 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718128 () ListLongMap!18967)

(declare-fun e!718118 () ListLongMap!18967)

(assert (=> b!1261674 (= e!718128 e!718118)))

(declare-fun call!61971 () ListLongMap!18967)

(declare-fun c!122676 () Bool)

(declare-fun call!61970 () ListLongMap!18967)

(declare-fun c!122675 () Bool)

(declare-fun call!61965 () ListLongMap!18967)

(declare-fun bm!61963 () Bool)

(assert (=> bm!61963 (= call!61966 (+!4277 (ite c!122676 call!61971 (ite c!122675 call!61965 call!61970)) (ite (or c!122676 c!122675) (tuple2!21095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21095 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61964 () Bool)

(declare-fun lt!571622 () ListLongMap!18967)

(assert (=> bm!61964 (= call!61969 (contains!7554 lt!571622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261675 () Bool)

(declare-fun e!718124 () ListLongMap!18967)

(assert (=> b!1261675 (= e!718124 e!718128)))

(assert (=> b!1261675 (= c!122675 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261676 () Bool)

(declare-fun e!718119 () Bool)

(declare-fun e!718127 () Bool)

(assert (=> b!1261676 (= e!718119 e!718127)))

(declare-fun res!840694 () Bool)

(declare-fun call!61967 () Bool)

(assert (=> b!1261676 (= res!840694 call!61967)))

(assert (=> b!1261676 (=> (not res!840694) (not e!718127))))

(declare-fun b!1261677 () Bool)

(assert (=> b!1261677 (= e!718118 call!61970)))

(declare-fun b!1261678 () Bool)

(assert (=> b!1261678 (= e!718122 e!718119)))

(declare-fun c!122674 () Bool)

(assert (=> b!1261678 (= c!122674 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261679 () Bool)

(assert (=> b!1261679 (= e!718127 (= (apply!988 lt!571622 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1261680 () Bool)

(declare-fun e!718126 () Bool)

(assert (=> b!1261680 (= e!718126 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261681 () Bool)

(declare-fun e!718117 () Bool)

(assert (=> b!1261681 (= e!718121 e!718117)))

(declare-fun res!840692 () Bool)

(assert (=> b!1261681 (=> (not res!840692) (not e!718117))))

(assert (=> b!1261681 (= res!840692 (contains!7554 lt!571622 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun b!1261682 () Bool)

(declare-fun e!718123 () Bool)

(assert (=> b!1261682 (= e!718116 e!718123)))

(declare-fun res!840691 () Bool)

(assert (=> b!1261682 (= res!840691 call!61969)))

(assert (=> b!1261682 (=> (not res!840691) (not e!718123))))

(declare-fun bm!61965 () Bool)

(assert (=> bm!61965 (= call!61965 call!61971)))

(declare-fun b!1261683 () Bool)

(assert (=> b!1261683 (= e!718124 (+!4277 call!61966 (tuple2!21095 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61966 () Bool)

(assert (=> bm!61966 (= call!61970 call!61965)))

(declare-fun b!1261684 () Bool)

(assert (=> b!1261684 (= e!718118 call!61968)))

(declare-fun d!138335 () Bool)

(assert (=> d!138335 e!718122))

(declare-fun res!840697 () Bool)

(assert (=> d!138335 (=> (not res!840697) (not e!718122))))

(assert (=> d!138335 (= res!840697 (or (bvsge #b00000000000000000000000000000000 (size!40218 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))))

(declare-fun lt!571623 () ListLongMap!18967)

(assert (=> d!138335 (= lt!571622 lt!571623)))

(declare-fun lt!571611 () Unit!41902)

(assert (=> d!138335 (= lt!571611 e!718120)))

(declare-fun c!122671 () Bool)

(assert (=> d!138335 (= c!122671 e!718126)))

(declare-fun res!840690 () Bool)

(assert (=> d!138335 (=> (not res!840690) (not e!718126))))

(assert (=> d!138335 (= res!840690 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> d!138335 (= lt!571623 e!718124)))

(assert (=> d!138335 (= c!122676 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138335 (validMask!0 mask!1466)))

(assert (=> d!138335 (= (getCurrentListMap!4558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571622)))

(declare-fun b!1261685 () Bool)

(assert (=> b!1261685 (= e!718119 (not call!61967))))

(declare-fun b!1261686 () Bool)

(declare-fun res!840695 () Bool)

(assert (=> b!1261686 (=> (not res!840695) (not e!718122))))

(assert (=> b!1261686 (= res!840695 e!718116)))

(declare-fun c!122673 () Bool)

(assert (=> b!1261686 (= c!122673 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261687 () Bool)

(assert (=> b!1261687 (= e!718123 (= (apply!988 lt!571622 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261688 () Bool)

(assert (=> b!1261688 (= e!718128 call!61968)))

(declare-fun b!1261689 () Bool)

(declare-fun get!20267 (ValueCell!15416 V!48511) V!48511)

(declare-fun dynLambda!3418 (Int (_ BitVec 64)) V!48511)

(assert (=> b!1261689 (= e!718117 (= (apply!988 lt!571622 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)) (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40219 _values!914)))))

(assert (=> b!1261689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun bm!61967 () Bool)

(assert (=> bm!61967 (= call!61971 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61968 () Bool)

(assert (=> bm!61968 (= call!61967 (contains!7554 lt!571622 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261690 () Bool)

(declare-fun Unit!41909 () Unit!41902)

(assert (=> b!1261690 (= e!718120 Unit!41909)))

(assert (= (and d!138335 c!122676) b!1261683))

(assert (= (and d!138335 (not c!122676)) b!1261675))

(assert (= (and b!1261675 c!122675) b!1261688))

(assert (= (and b!1261675 (not c!122675)) b!1261674))

(assert (= (and b!1261674 c!122672) b!1261684))

(assert (= (and b!1261674 (not c!122672)) b!1261677))

(assert (= (or b!1261684 b!1261677) bm!61966))

(assert (= (or b!1261688 bm!61966) bm!61965))

(assert (= (or b!1261688 b!1261684) bm!61962))

(assert (= (or b!1261683 bm!61965) bm!61967))

(assert (= (or b!1261683 bm!61962) bm!61963))

(assert (= (and d!138335 res!840690) b!1261680))

(assert (= (and d!138335 c!122671) b!1261670))

(assert (= (and d!138335 (not c!122671)) b!1261690))

(assert (= (and d!138335 res!840697) b!1261673))

(assert (= (and b!1261673 res!840696) b!1261671))

(assert (= (and b!1261673 (not res!840693)) b!1261681))

(assert (= (and b!1261681 res!840692) b!1261689))

(assert (= (and b!1261673 res!840689) b!1261686))

(assert (= (and b!1261686 c!122673) b!1261682))

(assert (= (and b!1261686 (not c!122673)) b!1261672))

(assert (= (and b!1261682 res!840691) b!1261687))

(assert (= (or b!1261682 b!1261672) bm!61964))

(assert (= (and b!1261686 res!840695) b!1261678))

(assert (= (and b!1261678 c!122674) b!1261676))

(assert (= (and b!1261678 (not c!122674)) b!1261685))

(assert (= (and b!1261676 res!840694) b!1261679))

(assert (= (or b!1261676 b!1261685) bm!61968))

(declare-fun b_lambda!22797 () Bool)

(assert (=> (not b_lambda!22797) (not b!1261689)))

(declare-fun t!41795 () Bool)

(declare-fun tb!11309 () Bool)

(assert (=> (and start!105924 (= defaultEntry!922 defaultEntry!922) t!41795) tb!11309))

(declare-fun result!23351 () Bool)

(assert (=> tb!11309 (= result!23351 tp_is_empty!32359)))

(assert (=> b!1261689 t!41795))

(declare-fun b_and!45361 () Bool)

(assert (= b_and!45355 (and (=> t!41795 result!23351) b_and!45361)))

(declare-fun m!1161775 () Bool)

(assert (=> b!1261689 m!1161775))

(assert (=> b!1261689 m!1161755))

(assert (=> b!1261689 m!1161755))

(declare-fun m!1161777 () Bool)

(assert (=> b!1261689 m!1161777))

(declare-fun m!1161779 () Bool)

(assert (=> b!1261689 m!1161779))

(assert (=> b!1261689 m!1161775))

(declare-fun m!1161781 () Bool)

(assert (=> b!1261689 m!1161781))

(assert (=> b!1261689 m!1161779))

(assert (=> b!1261680 m!1161755))

(assert (=> b!1261680 m!1161755))

(assert (=> b!1261680 m!1161757))

(declare-fun m!1161783 () Bool)

(assert (=> bm!61963 m!1161783))

(assert (=> bm!61967 m!1161707))

(assert (=> b!1261681 m!1161755))

(assert (=> b!1261681 m!1161755))

(declare-fun m!1161785 () Bool)

(assert (=> b!1261681 m!1161785))

(declare-fun m!1161787 () Bool)

(assert (=> b!1261687 m!1161787))

(declare-fun m!1161789 () Bool)

(assert (=> b!1261679 m!1161789))

(declare-fun m!1161791 () Bool)

(assert (=> bm!61968 m!1161791))

(declare-fun m!1161793 () Bool)

(assert (=> b!1261670 m!1161793))

(declare-fun m!1161795 () Bool)

(assert (=> b!1261670 m!1161795))

(assert (=> b!1261670 m!1161755))

(declare-fun m!1161797 () Bool)

(assert (=> b!1261670 m!1161797))

(declare-fun m!1161799 () Bool)

(assert (=> b!1261670 m!1161799))

(declare-fun m!1161801 () Bool)

(assert (=> b!1261670 m!1161801))

(declare-fun m!1161803 () Bool)

(assert (=> b!1261670 m!1161803))

(declare-fun m!1161805 () Bool)

(assert (=> b!1261670 m!1161805))

(declare-fun m!1161807 () Bool)

(assert (=> b!1261670 m!1161807))

(assert (=> b!1261670 m!1161707))

(declare-fun m!1161809 () Bool)

(assert (=> b!1261670 m!1161809))

(assert (=> b!1261670 m!1161803))

(declare-fun m!1161811 () Bool)

(assert (=> b!1261670 m!1161811))

(declare-fun m!1161813 () Bool)

(assert (=> b!1261670 m!1161813))

(assert (=> b!1261670 m!1161799))

(assert (=> b!1261670 m!1161793))

(declare-fun m!1161815 () Bool)

(assert (=> b!1261670 m!1161815))

(assert (=> b!1261670 m!1161809))

(declare-fun m!1161817 () Bool)

(assert (=> b!1261670 m!1161817))

(declare-fun m!1161819 () Bool)

(assert (=> b!1261670 m!1161819))

(declare-fun m!1161821 () Bool)

(assert (=> b!1261670 m!1161821))

(assert (=> d!138335 m!1161695))

(declare-fun m!1161823 () Bool)

(assert (=> bm!61964 m!1161823))

(declare-fun m!1161825 () Bool)

(assert (=> b!1261683 m!1161825))

(assert (=> b!1261671 m!1161755))

(assert (=> b!1261671 m!1161755))

(assert (=> b!1261671 m!1161757))

(assert (=> b!1261555 d!138335))

(declare-fun d!138337 () Bool)

(assert (=> d!138337 (= (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571628 () Unit!41902)

(declare-fun choose!1877 (array!82255 array!82257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 V!48511 V!48511 (_ BitVec 32) Int) Unit!41902)

(assert (=> d!138337 (= lt!571628 (choose!1877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138337 (validMask!0 mask!1466)))

(assert (=> d!138337 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1168 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571628)))

(declare-fun bs!35684 () Bool)

(assert (= bs!35684 d!138337))

(assert (=> bs!35684 m!1161707))

(assert (=> bs!35684 m!1161705))

(declare-fun m!1161827 () Bool)

(assert (=> bs!35684 m!1161827))

(assert (=> bs!35684 m!1161695))

(assert (=> b!1261553 d!138337))

(declare-fun b!1261717 () Bool)

(declare-fun e!718143 () Bool)

(declare-fun e!718145 () Bool)

(assert (=> b!1261717 (= e!718143 e!718145)))

(assert (=> b!1261717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun res!840709 () Bool)

(declare-fun lt!571645 () ListLongMap!18967)

(assert (=> b!1261717 (= res!840709 (contains!7554 lt!571645 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261717 (=> (not res!840709) (not e!718145))))

(declare-fun b!1261718 () Bool)

(declare-fun e!718146 () Bool)

(declare-fun isEmpty!1043 (ListLongMap!18967) Bool)

(assert (=> b!1261718 (= e!718146 (isEmpty!1043 lt!571645))))

(declare-fun b!1261719 () Bool)

(declare-fun e!718147 () Bool)

(assert (=> b!1261719 (= e!718147 e!718143)))

(declare-fun c!122687 () Bool)

(declare-fun e!718144 () Bool)

(assert (=> b!1261719 (= c!122687 e!718144)))

(declare-fun res!840706 () Bool)

(assert (=> b!1261719 (=> (not res!840706) (not e!718144))))

(assert (=> b!1261719 (= res!840706 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun b!1261720 () Bool)

(assert (=> b!1261720 (= e!718144 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261720 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261721 () Bool)

(assert (=> b!1261721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> b!1261721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40219 _values!914)))))

(assert (=> b!1261721 (= e!718145 (= (apply!988 lt!571645 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)) (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261722 () Bool)

(assert (=> b!1261722 (= e!718146 (= lt!571645 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!61971 () Bool)

(declare-fun call!61974 () ListLongMap!18967)

(assert (=> bm!61971 (= call!61974 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261723 () Bool)

(assert (=> b!1261723 (= e!718143 e!718146)))

(declare-fun c!122686 () Bool)

(assert (=> b!1261723 (= c!122686 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun d!138339 () Bool)

(assert (=> d!138339 e!718147))

(declare-fun res!840708 () Bool)

(assert (=> d!138339 (=> (not res!840708) (not e!718147))))

(assert (=> d!138339 (= res!840708 (not (contains!7554 lt!571645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718149 () ListLongMap!18967)

(assert (=> d!138339 (= lt!571645 e!718149)))

(declare-fun c!122688 () Bool)

(assert (=> d!138339 (= c!122688 (bvsge #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> d!138339 (validMask!0 mask!1466)))

(assert (=> d!138339 (= (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571645)))

(declare-fun b!1261724 () Bool)

(declare-fun lt!571648 () Unit!41902)

(declare-fun lt!571649 () Unit!41902)

(assert (=> b!1261724 (= lt!571648 lt!571649)))

(declare-fun lt!571647 () V!48511)

(declare-fun lt!571644 () (_ BitVec 64))

(declare-fun lt!571643 () (_ BitVec 64))

(declare-fun lt!571646 () ListLongMap!18967)

(assert (=> b!1261724 (not (contains!7554 (+!4277 lt!571646 (tuple2!21095 lt!571644 lt!571647)) lt!571643))))

(declare-fun addStillNotContains!324 (ListLongMap!18967 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!41902)

(assert (=> b!1261724 (= lt!571649 (addStillNotContains!324 lt!571646 lt!571644 lt!571647 lt!571643))))

(assert (=> b!1261724 (= lt!571643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261724 (= lt!571647 (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261724 (= lt!571644 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261724 (= lt!571646 call!61974)))

(declare-fun e!718148 () ListLongMap!18967)

(assert (=> b!1261724 (= e!718148 (+!4277 call!61974 (tuple2!21095 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000) (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261725 () Bool)

(declare-fun res!840707 () Bool)

(assert (=> b!1261725 (=> (not res!840707) (not e!718147))))

(assert (=> b!1261725 (= res!840707 (not (contains!7554 lt!571645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261726 () Bool)

(assert (=> b!1261726 (= e!718149 (ListLongMap!18968 Nil!28293))))

(declare-fun b!1261727 () Bool)

(assert (=> b!1261727 (= e!718148 call!61974)))

(declare-fun b!1261728 () Bool)

(assert (=> b!1261728 (= e!718149 e!718148)))

(declare-fun c!122685 () Bool)

(assert (=> b!1261728 (= c!122685 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138339 c!122688) b!1261726))

(assert (= (and d!138339 (not c!122688)) b!1261728))

(assert (= (and b!1261728 c!122685) b!1261724))

(assert (= (and b!1261728 (not c!122685)) b!1261727))

(assert (= (or b!1261724 b!1261727) bm!61971))

(assert (= (and d!138339 res!840708) b!1261725))

(assert (= (and b!1261725 res!840707) b!1261719))

(assert (= (and b!1261719 res!840706) b!1261720))

(assert (= (and b!1261719 c!122687) b!1261717))

(assert (= (and b!1261719 (not c!122687)) b!1261723))

(assert (= (and b!1261717 res!840709) b!1261721))

(assert (= (and b!1261723 c!122686) b!1261722))

(assert (= (and b!1261723 (not c!122686)) b!1261718))

(declare-fun b_lambda!22799 () Bool)

(assert (=> (not b_lambda!22799) (not b!1261721)))

(assert (=> b!1261721 t!41795))

(declare-fun b_and!45363 () Bool)

(assert (= b_and!45361 (and (=> t!41795 result!23351) b_and!45363)))

(declare-fun b_lambda!22801 () Bool)

(assert (=> (not b_lambda!22801) (not b!1261724)))

(assert (=> b!1261724 t!41795))

(declare-fun b_and!45365 () Bool)

(assert (= b_and!45363 (and (=> t!41795 result!23351) b_and!45365)))

(assert (=> b!1261721 m!1161779))

(assert (=> b!1261721 m!1161755))

(declare-fun m!1161829 () Bool)

(assert (=> b!1261721 m!1161829))

(assert (=> b!1261721 m!1161779))

(assert (=> b!1261721 m!1161775))

(assert (=> b!1261721 m!1161781))

(assert (=> b!1261721 m!1161775))

(assert (=> b!1261721 m!1161755))

(assert (=> b!1261717 m!1161755))

(assert (=> b!1261717 m!1161755))

(declare-fun m!1161831 () Bool)

(assert (=> b!1261717 m!1161831))

(declare-fun m!1161833 () Bool)

(assert (=> b!1261718 m!1161833))

(declare-fun m!1161835 () Bool)

(assert (=> bm!61971 m!1161835))

(assert (=> b!1261722 m!1161835))

(assert (=> b!1261728 m!1161755))

(assert (=> b!1261728 m!1161755))

(assert (=> b!1261728 m!1161757))

(declare-fun m!1161837 () Bool)

(assert (=> d!138339 m!1161837))

(assert (=> d!138339 m!1161695))

(assert (=> b!1261724 m!1161779))

(declare-fun m!1161839 () Bool)

(assert (=> b!1261724 m!1161839))

(assert (=> b!1261724 m!1161779))

(assert (=> b!1261724 m!1161775))

(assert (=> b!1261724 m!1161781))

(assert (=> b!1261724 m!1161775))

(declare-fun m!1161841 () Bool)

(assert (=> b!1261724 m!1161841))

(declare-fun m!1161843 () Bool)

(assert (=> b!1261724 m!1161843))

(declare-fun m!1161845 () Bool)

(assert (=> b!1261724 m!1161845))

(assert (=> b!1261724 m!1161843))

(assert (=> b!1261724 m!1161755))

(assert (=> b!1261720 m!1161755))

(assert (=> b!1261720 m!1161755))

(assert (=> b!1261720 m!1161757))

(declare-fun m!1161847 () Bool)

(assert (=> b!1261725 m!1161847))

(assert (=> b!1261553 d!138339))

(declare-fun b!1261729 () Bool)

(declare-fun e!718150 () Bool)

(declare-fun e!718152 () Bool)

(assert (=> b!1261729 (= e!718150 e!718152)))

(assert (=> b!1261729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun res!840713 () Bool)

(declare-fun lt!571652 () ListLongMap!18967)

(assert (=> b!1261729 (= res!840713 (contains!7554 lt!571652 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261729 (=> (not res!840713) (not e!718152))))

(declare-fun b!1261730 () Bool)

(declare-fun e!718153 () Bool)

(assert (=> b!1261730 (= e!718153 (isEmpty!1043 lt!571652))))

(declare-fun b!1261731 () Bool)

(declare-fun e!718154 () Bool)

(assert (=> b!1261731 (= e!718154 e!718150)))

(declare-fun c!122691 () Bool)

(declare-fun e!718151 () Bool)

(assert (=> b!1261731 (= c!122691 e!718151)))

(declare-fun res!840710 () Bool)

(assert (=> b!1261731 (=> (not res!840710) (not e!718151))))

(assert (=> b!1261731 (= res!840710 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun b!1261732 () Bool)

(assert (=> b!1261732 (= e!718151 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261732 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261733 () Bool)

(assert (=> b!1261733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> b!1261733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40219 _values!914)))))

(assert (=> b!1261733 (= e!718152 (= (apply!988 lt!571652 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)) (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261734 () Bool)

(assert (=> b!1261734 (= e!718153 (= lt!571652 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun call!61975 () ListLongMap!18967)

(declare-fun bm!61972 () Bool)

(assert (=> bm!61972 (= call!61975 (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261735 () Bool)

(assert (=> b!1261735 (= e!718150 e!718153)))

(declare-fun c!122690 () Bool)

(assert (=> b!1261735 (= c!122690 (bvslt #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(declare-fun d!138341 () Bool)

(assert (=> d!138341 e!718154))

(declare-fun res!840712 () Bool)

(assert (=> d!138341 (=> (not res!840712) (not e!718154))))

(assert (=> d!138341 (= res!840712 (not (contains!7554 lt!571652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718156 () ListLongMap!18967)

(assert (=> d!138341 (= lt!571652 e!718156)))

(declare-fun c!122692 () Bool)

(assert (=> d!138341 (= c!122692 (bvsge #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> d!138341 (validMask!0 mask!1466)))

(assert (=> d!138341 (= (getCurrentListMapNoExtraKeys!5868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571652)))

(declare-fun b!1261736 () Bool)

(declare-fun lt!571655 () Unit!41902)

(declare-fun lt!571656 () Unit!41902)

(assert (=> b!1261736 (= lt!571655 lt!571656)))

(declare-fun lt!571653 () ListLongMap!18967)

(declare-fun lt!571654 () V!48511)

(declare-fun lt!571651 () (_ BitVec 64))

(declare-fun lt!571650 () (_ BitVec 64))

(assert (=> b!1261736 (not (contains!7554 (+!4277 lt!571653 (tuple2!21095 lt!571651 lt!571654)) lt!571650))))

(assert (=> b!1261736 (= lt!571656 (addStillNotContains!324 lt!571653 lt!571651 lt!571654 lt!571650))))

(assert (=> b!1261736 (= lt!571650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261736 (= lt!571654 (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261736 (= lt!571651 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261736 (= lt!571653 call!61975)))

(declare-fun e!718155 () ListLongMap!18967)

(assert (=> b!1261736 (= e!718155 (+!4277 call!61975 (tuple2!21095 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000) (get!20267 (select (arr!39681 _values!914) #b00000000000000000000000000000000) (dynLambda!3418 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261737 () Bool)

(declare-fun res!840711 () Bool)

(assert (=> b!1261737 (=> (not res!840711) (not e!718154))))

(assert (=> b!1261737 (= res!840711 (not (contains!7554 lt!571652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261738 () Bool)

(assert (=> b!1261738 (= e!718156 (ListLongMap!18968 Nil!28293))))

(declare-fun b!1261739 () Bool)

(assert (=> b!1261739 (= e!718155 call!61975)))

(declare-fun b!1261740 () Bool)

(assert (=> b!1261740 (= e!718156 e!718155)))

(declare-fun c!122689 () Bool)

(assert (=> b!1261740 (= c!122689 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138341 c!122692) b!1261738))

(assert (= (and d!138341 (not c!122692)) b!1261740))

(assert (= (and b!1261740 c!122689) b!1261736))

(assert (= (and b!1261740 (not c!122689)) b!1261739))

(assert (= (or b!1261736 b!1261739) bm!61972))

(assert (= (and d!138341 res!840712) b!1261737))

(assert (= (and b!1261737 res!840711) b!1261731))

(assert (= (and b!1261731 res!840710) b!1261732))

(assert (= (and b!1261731 c!122691) b!1261729))

(assert (= (and b!1261731 (not c!122691)) b!1261735))

(assert (= (and b!1261729 res!840713) b!1261733))

(assert (= (and b!1261735 c!122690) b!1261734))

(assert (= (and b!1261735 (not c!122690)) b!1261730))

(declare-fun b_lambda!22803 () Bool)

(assert (=> (not b_lambda!22803) (not b!1261733)))

(assert (=> b!1261733 t!41795))

(declare-fun b_and!45367 () Bool)

(assert (= b_and!45365 (and (=> t!41795 result!23351) b_and!45367)))

(declare-fun b_lambda!22805 () Bool)

(assert (=> (not b_lambda!22805) (not b!1261736)))

(assert (=> b!1261736 t!41795))

(declare-fun b_and!45369 () Bool)

(assert (= b_and!45367 (and (=> t!41795 result!23351) b_and!45369)))

(assert (=> b!1261733 m!1161779))

(assert (=> b!1261733 m!1161755))

(declare-fun m!1161849 () Bool)

(assert (=> b!1261733 m!1161849))

(assert (=> b!1261733 m!1161779))

(assert (=> b!1261733 m!1161775))

(assert (=> b!1261733 m!1161781))

(assert (=> b!1261733 m!1161775))

(assert (=> b!1261733 m!1161755))

(assert (=> b!1261729 m!1161755))

(assert (=> b!1261729 m!1161755))

(declare-fun m!1161851 () Bool)

(assert (=> b!1261729 m!1161851))

(declare-fun m!1161853 () Bool)

(assert (=> b!1261730 m!1161853))

(declare-fun m!1161855 () Bool)

(assert (=> bm!61972 m!1161855))

(assert (=> b!1261734 m!1161855))

(assert (=> b!1261740 m!1161755))

(assert (=> b!1261740 m!1161755))

(assert (=> b!1261740 m!1161757))

(declare-fun m!1161857 () Bool)

(assert (=> d!138341 m!1161857))

(assert (=> d!138341 m!1161695))

(assert (=> b!1261736 m!1161779))

(declare-fun m!1161859 () Bool)

(assert (=> b!1261736 m!1161859))

(assert (=> b!1261736 m!1161779))

(assert (=> b!1261736 m!1161775))

(assert (=> b!1261736 m!1161781))

(assert (=> b!1261736 m!1161775))

(declare-fun m!1161861 () Bool)

(assert (=> b!1261736 m!1161861))

(declare-fun m!1161863 () Bool)

(assert (=> b!1261736 m!1161863))

(declare-fun m!1161865 () Bool)

(assert (=> b!1261736 m!1161865))

(assert (=> b!1261736 m!1161863))

(assert (=> b!1261736 m!1161755))

(assert (=> b!1261732 m!1161755))

(assert (=> b!1261732 m!1161755))

(assert (=> b!1261732 m!1161757))

(declare-fun m!1161867 () Bool)

(assert (=> b!1261737 m!1161867))

(assert (=> b!1261553 d!138341))

(declare-fun d!138343 () Bool)

(assert (=> d!138343 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105924 d!138343))

(declare-fun d!138345 () Bool)

(assert (=> d!138345 (= (array_inv!30357 _keys!1118) (bvsge (size!40218 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105924 d!138345))

(declare-fun d!138347 () Bool)

(assert (=> d!138347 (= (array_inv!30358 _values!914) (bvsge (size!40219 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105924 d!138347))

(declare-fun d!138349 () Bool)

(declare-fun res!840722 () Bool)

(declare-fun e!718165 () Bool)

(assert (=> d!138349 (=> res!840722 e!718165)))

(assert (=> d!138349 (= res!840722 (bvsge #b00000000000000000000000000000000 (size!40218 _keys!1118)))))

(assert (=> d!138349 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28294) e!718165)))

(declare-fun b!1261751 () Bool)

(declare-fun e!718167 () Bool)

(declare-fun call!61978 () Bool)

(assert (=> b!1261751 (= e!718167 call!61978)))

(declare-fun b!1261752 () Bool)

(declare-fun e!718168 () Bool)

(assert (=> b!1261752 (= e!718168 e!718167)))

(declare-fun c!122695 () Bool)

(assert (=> b!1261752 (= c!122695 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61975 () Bool)

(assert (=> bm!61975 (= call!61978 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122695 (Cons!28293 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000) Nil!28294) Nil!28294)))))

(declare-fun b!1261753 () Bool)

(assert (=> b!1261753 (= e!718167 call!61978)))

(declare-fun b!1261754 () Bool)

(declare-fun e!718166 () Bool)

(declare-fun contains!7555 (List!28297 (_ BitVec 64)) Bool)

(assert (=> b!1261754 (= e!718166 (contains!7555 Nil!28294 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261755 () Bool)

(assert (=> b!1261755 (= e!718165 e!718168)))

(declare-fun res!840721 () Bool)

(assert (=> b!1261755 (=> (not res!840721) (not e!718168))))

(assert (=> b!1261755 (= res!840721 (not e!718166))))

(declare-fun res!840720 () Bool)

(assert (=> b!1261755 (=> (not res!840720) (not e!718166))))

(assert (=> b!1261755 (= res!840720 (validKeyInArray!0 (select (arr!39680 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138349 (not res!840722)) b!1261755))

(assert (= (and b!1261755 res!840720) b!1261754))

(assert (= (and b!1261755 res!840721) b!1261752))

(assert (= (and b!1261752 c!122695) b!1261751))

(assert (= (and b!1261752 (not c!122695)) b!1261753))

(assert (= (or b!1261751 b!1261753) bm!61975))

(assert (=> b!1261752 m!1161755))

(assert (=> b!1261752 m!1161755))

(assert (=> b!1261752 m!1161757))

(assert (=> bm!61975 m!1161755))

(declare-fun m!1161869 () Bool)

(assert (=> bm!61975 m!1161869))

(assert (=> b!1261754 m!1161755))

(assert (=> b!1261754 m!1161755))

(declare-fun m!1161871 () Bool)

(assert (=> b!1261754 m!1161871))

(assert (=> b!1261755 m!1161755))

(assert (=> b!1261755 m!1161755))

(assert (=> b!1261755 m!1161757))

(assert (=> b!1261556 d!138349))

(declare-fun mapIsEmpty!50353 () Bool)

(declare-fun mapRes!50353 () Bool)

(assert (=> mapIsEmpty!50353 mapRes!50353))

(declare-fun condMapEmpty!50353 () Bool)

(declare-fun mapDefault!50353 () ValueCell!15416)

(assert (=> mapNonEmpty!50344 (= condMapEmpty!50353 (= mapRest!50344 ((as const (Array (_ BitVec 32) ValueCell!15416)) mapDefault!50353)))))

(declare-fun e!718173 () Bool)

(assert (=> mapNonEmpty!50344 (= tp!95906 (and e!718173 mapRes!50353))))

(declare-fun b!1261762 () Bool)

(declare-fun e!718174 () Bool)

(assert (=> b!1261762 (= e!718174 tp_is_empty!32359)))

(declare-fun mapNonEmpty!50353 () Bool)

(declare-fun tp!95921 () Bool)

(assert (=> mapNonEmpty!50353 (= mapRes!50353 (and tp!95921 e!718174))))

(declare-fun mapRest!50353 () (Array (_ BitVec 32) ValueCell!15416))

(declare-fun mapValue!50353 () ValueCell!15416)

(declare-fun mapKey!50353 () (_ BitVec 32))

(assert (=> mapNonEmpty!50353 (= mapRest!50344 (store mapRest!50353 mapKey!50353 mapValue!50353))))

(declare-fun b!1261763 () Bool)

(assert (=> b!1261763 (= e!718173 tp_is_empty!32359)))

(assert (= (and mapNonEmpty!50344 condMapEmpty!50353) mapIsEmpty!50353))

(assert (= (and mapNonEmpty!50344 (not condMapEmpty!50353)) mapNonEmpty!50353))

(assert (= (and mapNonEmpty!50353 ((_ is ValueCellFull!15416) mapValue!50353)) b!1261762))

(assert (= (and mapNonEmpty!50344 ((_ is ValueCellFull!15416) mapDefault!50353)) b!1261763))

(declare-fun m!1161873 () Bool)

(assert (=> mapNonEmpty!50353 m!1161873))

(declare-fun b_lambda!22807 () Bool)

(assert (= b_lambda!22801 (or (and start!105924 b_free!27457) b_lambda!22807)))

(declare-fun b_lambda!22809 () Bool)

(assert (= b_lambda!22799 (or (and start!105924 b_free!27457) b_lambda!22809)))

(declare-fun b_lambda!22811 () Bool)

(assert (= b_lambda!22805 (or (and start!105924 b_free!27457) b_lambda!22811)))

(declare-fun b_lambda!22813 () Bool)

(assert (= b_lambda!22797 (or (and start!105924 b_free!27457) b_lambda!22813)))

(declare-fun b_lambda!22815 () Bool)

(assert (= b_lambda!22803 (or (and start!105924 b_free!27457) b_lambda!22815)))

(check-sat (not b_lambda!22815) (not b!1261683) (not bm!61975) (not b_next!27457) (not bm!61963) (not d!138341) (not b!1261730) (not b!1261615) (not bm!61971) (not b!1261736) (not bm!61972) (not b!1261680) (not b!1261722) (not b_lambda!22811) (not b!1261679) (not b!1261728) (not b!1261740) b_and!45369 (not b!1261755) (not b!1261718) (not b!1261616) (not b!1261717) (not b!1261734) (not b_lambda!22807) (not b!1261721) (not d!138337) (not b_lambda!22813) (not mapNonEmpty!50353) (not b!1261737) tp_is_empty!32359 (not b!1261754) (not b!1261681) (not b!1261720) (not b!1261670) (not bm!61968) (not bm!61964) (not b!1261729) (not d!138339) (not b!1261671) (not b!1261752) (not b!1261725) (not b!1261625) (not b!1261732) (not bm!61947) (not b!1261627) (not b!1261733) (not d!138333) (not b_lambda!22809) (not b!1261724) (not d!138335) (not b!1261687) (not bm!61967) (not b!1261689))
(check-sat b_and!45369 (not b_next!27457))
