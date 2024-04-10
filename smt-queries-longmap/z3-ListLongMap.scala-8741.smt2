; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106030 () Bool)

(assert start!106030)

(declare-fun b_free!27483 () Bool)

(declare-fun b_next!27483 () Bool)

(assert (=> start!106030 (= b_free!27483 (not b_next!27483))))

(declare-fun tp!95996 () Bool)

(declare-fun b_and!45445 () Bool)

(assert (=> start!106030 (= tp!95996 b_and!45445)))

(declare-fun b!1262662 () Bool)

(declare-fun e!718783 () Bool)

(declare-fun e!718781 () Bool)

(declare-fun mapRes!50395 () Bool)

(assert (=> b!1262662 (= e!718783 (and e!718781 mapRes!50395))))

(declare-fun condMapEmpty!50395 () Bool)

(declare-datatypes ((V!48545 0))(
  ( (V!48546 (val!16255 Int)) )
))
(declare-datatypes ((ValueCell!15429 0))(
  ( (ValueCellFull!15429 (v!18963 V!48545)) (EmptyCell!15429) )
))
(declare-datatypes ((array!82388 0))(
  ( (array!82389 (arr!39742 (Array (_ BitVec 32) ValueCell!15429)) (size!40278 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82388)

(declare-fun mapDefault!50395 () ValueCell!15429)

(assert (=> b!1262662 (= condMapEmpty!50395 (= (arr!39742 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15429)) mapDefault!50395)))))

(declare-fun mapIsEmpty!50395 () Bool)

(assert (=> mapIsEmpty!50395 mapRes!50395))

(declare-fun b!1262663 () Bool)

(declare-fun e!718782 () Bool)

(declare-datatypes ((tuple2!21038 0))(
  ( (tuple2!21039 (_1!10530 (_ BitVec 64)) (_2!10530 V!48545)) )
))
(declare-datatypes ((List!28232 0))(
  ( (Nil!28229) (Cons!28228 (h!29437 tuple2!21038) (t!41741 List!28232)) )
))
(declare-datatypes ((ListLongMap!18911 0))(
  ( (ListLongMap!18912 (toList!9471 List!28232)) )
))
(declare-fun lt!572408 () ListLongMap!18911)

(declare-fun lt!572405 () ListLongMap!18911)

(assert (=> b!1262663 (= e!718782 (= lt!572408 lt!572405))))

(declare-fun b!1262664 () Bool)

(declare-fun e!718779 () Bool)

(declare-fun lt!572404 () ListLongMap!18911)

(declare-fun contains!7595 (ListLongMap!18911 (_ BitVec 64)) Bool)

(assert (=> b!1262664 (= e!718779 (not (contains!7595 lt!572404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262664 e!718782))

(declare-fun res!841174 () Bool)

(assert (=> b!1262664 (=> (not res!841174) (not e!718782))))

(declare-fun lt!572406 () ListLongMap!18911)

(declare-fun minValueBefore!43 () V!48545)

(declare-fun +!4247 (ListLongMap!18911 tuple2!21038) ListLongMap!18911)

(assert (=> b!1262664 (= res!841174 (= lt!572406 (+!4247 lt!572404 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48545)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48545)

(declare-datatypes ((array!82390 0))(
  ( (array!82391 (arr!39743 (Array (_ BitVec 32) (_ BitVec 64))) (size!40279 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82390)

(declare-fun getCurrentListMap!4640 (array!82390 array!82388 (_ BitVec 32) (_ BitVec 32) V!48545 V!48545 (_ BitVec 32) Int) ListLongMap!18911)

(assert (=> b!1262664 (= lt!572408 (getCurrentListMap!4640 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262664 (= lt!572406 (getCurrentListMap!4640 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262665 () Bool)

(declare-fun res!841175 () Bool)

(declare-fun e!718778 () Bool)

(assert (=> b!1262665 (=> (not res!841175) (not e!718778))))

(assert (=> b!1262665 (= res!841175 (and (= (size!40278 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40279 _keys!1118) (size!40278 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262666 () Bool)

(assert (=> b!1262666 (= e!718778 (not e!718779))))

(declare-fun res!841172 () Bool)

(assert (=> b!1262666 (=> res!841172 e!718779)))

(assert (=> b!1262666 (= res!841172 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1262666 (= lt!572404 lt!572405)))

(declare-datatypes ((Unit!42088 0))(
  ( (Unit!42089) )
))
(declare-fun lt!572407 () Unit!42088)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1179 (array!82390 array!82388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48545 V!48545 V!48545 V!48545 (_ BitVec 32) Int) Unit!42088)

(assert (=> b!1262666 (= lt!572407 (lemmaNoChangeToArrayThenSameMapNoExtras!1179 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5837 (array!82390 array!82388 (_ BitVec 32) (_ BitVec 32) V!48545 V!48545 (_ BitVec 32) Int) ListLongMap!18911)

(assert (=> b!1262666 (= lt!572405 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262666 (= lt!572404 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262667 () Bool)

(declare-fun e!718777 () Bool)

(declare-fun tp_is_empty!32385 () Bool)

(assert (=> b!1262667 (= e!718777 tp_is_empty!32385)))

(declare-fun b!1262668 () Bool)

(declare-fun res!841173 () Bool)

(assert (=> b!1262668 (=> (not res!841173) (not e!718778))))

(declare-datatypes ((List!28233 0))(
  ( (Nil!28230) (Cons!28229 (h!29438 (_ BitVec 64)) (t!41742 List!28233)) )
))
(declare-fun arrayNoDuplicates!0 (array!82390 (_ BitVec 32) List!28233) Bool)

(assert (=> b!1262668 (= res!841173 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28230))))

(declare-fun b!1262669 () Bool)

(assert (=> b!1262669 (= e!718781 tp_is_empty!32385)))

(declare-fun b!1262670 () Bool)

(declare-fun res!841176 () Bool)

(assert (=> b!1262670 (=> (not res!841176) (not e!718778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82390 (_ BitVec 32)) Bool)

(assert (=> b!1262670 (= res!841176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!841171 () Bool)

(assert (=> start!106030 (=> (not res!841171) (not e!718778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106030 (= res!841171 (validMask!0 mask!1466))))

(assert (=> start!106030 e!718778))

(assert (=> start!106030 true))

(assert (=> start!106030 tp!95996))

(assert (=> start!106030 tp_is_empty!32385))

(declare-fun array_inv!30249 (array!82390) Bool)

(assert (=> start!106030 (array_inv!30249 _keys!1118)))

(declare-fun array_inv!30250 (array!82388) Bool)

(assert (=> start!106030 (and (array_inv!30250 _values!914) e!718783)))

(declare-fun mapNonEmpty!50395 () Bool)

(declare-fun tp!95995 () Bool)

(assert (=> mapNonEmpty!50395 (= mapRes!50395 (and tp!95995 e!718777))))

(declare-fun mapKey!50395 () (_ BitVec 32))

(declare-fun mapValue!50395 () ValueCell!15429)

(declare-fun mapRest!50395 () (Array (_ BitVec 32) ValueCell!15429))

(assert (=> mapNonEmpty!50395 (= (arr!39742 _values!914) (store mapRest!50395 mapKey!50395 mapValue!50395))))

(assert (= (and start!106030 res!841171) b!1262665))

(assert (= (and b!1262665 res!841175) b!1262670))

(assert (= (and b!1262670 res!841176) b!1262668))

(assert (= (and b!1262668 res!841173) b!1262666))

(assert (= (and b!1262666 (not res!841172)) b!1262664))

(assert (= (and b!1262664 res!841174) b!1262663))

(assert (= (and b!1262662 condMapEmpty!50395) mapIsEmpty!50395))

(assert (= (and b!1262662 (not condMapEmpty!50395)) mapNonEmpty!50395))

(get-info :version)

(assert (= (and mapNonEmpty!50395 ((_ is ValueCellFull!15429) mapValue!50395)) b!1262667))

(assert (= (and b!1262662 ((_ is ValueCellFull!15429) mapDefault!50395)) b!1262669))

(assert (= start!106030 b!1262662))

(declare-fun m!1163161 () Bool)

(assert (=> b!1262670 m!1163161))

(declare-fun m!1163163 () Bool)

(assert (=> b!1262668 m!1163163))

(declare-fun m!1163165 () Bool)

(assert (=> mapNonEmpty!50395 m!1163165))

(declare-fun m!1163167 () Bool)

(assert (=> start!106030 m!1163167))

(declare-fun m!1163169 () Bool)

(assert (=> start!106030 m!1163169))

(declare-fun m!1163171 () Bool)

(assert (=> start!106030 m!1163171))

(declare-fun m!1163173 () Bool)

(assert (=> b!1262664 m!1163173))

(declare-fun m!1163175 () Bool)

(assert (=> b!1262664 m!1163175))

(declare-fun m!1163177 () Bool)

(assert (=> b!1262664 m!1163177))

(declare-fun m!1163179 () Bool)

(assert (=> b!1262664 m!1163179))

(declare-fun m!1163181 () Bool)

(assert (=> b!1262666 m!1163181))

(declare-fun m!1163183 () Bool)

(assert (=> b!1262666 m!1163183))

(declare-fun m!1163185 () Bool)

(assert (=> b!1262666 m!1163185))

(check-sat (not mapNonEmpty!50395) (not b!1262664) b_and!45445 (not b!1262666) (not b!1262668) tp_is_empty!32385 (not b!1262670) (not start!106030) (not b_next!27483))
(check-sat b_and!45445 (not b_next!27483))
(get-model)

(declare-fun d!138561 () Bool)

(declare-fun res!841203 () Bool)

(declare-fun e!718816 () Bool)

(assert (=> d!138561 (=> res!841203 e!718816)))

(assert (=> d!138561 (= res!841203 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138561 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28230) e!718816)))

(declare-fun b!1262708 () Bool)

(declare-fun e!718814 () Bool)

(assert (=> b!1262708 (= e!718816 e!718814)))

(declare-fun res!841201 () Bool)

(assert (=> b!1262708 (=> (not res!841201) (not e!718814))))

(declare-fun e!718815 () Bool)

(assert (=> b!1262708 (= res!841201 (not e!718815))))

(declare-fun res!841202 () Bool)

(assert (=> b!1262708 (=> (not res!841202) (not e!718815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262708 (= res!841202 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262709 () Bool)

(declare-fun e!718813 () Bool)

(assert (=> b!1262709 (= e!718814 e!718813)))

(declare-fun c!122857 () Bool)

(assert (=> b!1262709 (= c!122857 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262710 () Bool)

(declare-fun contains!7596 (List!28233 (_ BitVec 64)) Bool)

(assert (=> b!1262710 (= e!718815 (contains!7596 Nil!28230 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262711 () Bool)

(declare-fun call!62114 () Bool)

(assert (=> b!1262711 (= e!718813 call!62114)))

(declare-fun b!1262712 () Bool)

(assert (=> b!1262712 (= e!718813 call!62114)))

(declare-fun bm!62111 () Bool)

(assert (=> bm!62111 (= call!62114 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122857 (Cons!28229 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000) Nil!28230) Nil!28230)))))

(assert (= (and d!138561 (not res!841203)) b!1262708))

(assert (= (and b!1262708 res!841202) b!1262710))

(assert (= (and b!1262708 res!841201) b!1262709))

(assert (= (and b!1262709 c!122857) b!1262711))

(assert (= (and b!1262709 (not c!122857)) b!1262712))

(assert (= (or b!1262711 b!1262712) bm!62111))

(declare-fun m!1163213 () Bool)

(assert (=> b!1262708 m!1163213))

(assert (=> b!1262708 m!1163213))

(declare-fun m!1163215 () Bool)

(assert (=> b!1262708 m!1163215))

(assert (=> b!1262709 m!1163213))

(assert (=> b!1262709 m!1163213))

(assert (=> b!1262709 m!1163215))

(assert (=> b!1262710 m!1163213))

(assert (=> b!1262710 m!1163213))

(declare-fun m!1163217 () Bool)

(assert (=> b!1262710 m!1163217))

(assert (=> bm!62111 m!1163213))

(declare-fun m!1163219 () Bool)

(assert (=> bm!62111 m!1163219))

(assert (=> b!1262668 d!138561))

(declare-fun d!138563 () Bool)

(assert (=> d!138563 (= (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572426 () Unit!42088)

(declare-fun choose!1873 (array!82390 array!82388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48545 V!48545 V!48545 V!48545 (_ BitVec 32) Int) Unit!42088)

(assert (=> d!138563 (= lt!572426 (choose!1873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138563 (validMask!0 mask!1466)))

(assert (=> d!138563 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1179 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572426)))

(declare-fun bs!35730 () Bool)

(assert (= bs!35730 d!138563))

(assert (=> bs!35730 m!1163185))

(assert (=> bs!35730 m!1163183))

(declare-fun m!1163221 () Bool)

(assert (=> bs!35730 m!1163221))

(assert (=> bs!35730 m!1163167))

(assert (=> b!1262666 d!138563))

(declare-fun b!1262737 () Bool)

(declare-fun e!718834 () Bool)

(assert (=> b!1262737 (= e!718834 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262737 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138565 () Bool)

(declare-fun e!718833 () Bool)

(assert (=> d!138565 e!718833))

(declare-fun res!841212 () Bool)

(assert (=> d!138565 (=> (not res!841212) (not e!718833))))

(declare-fun lt!572443 () ListLongMap!18911)

(assert (=> d!138565 (= res!841212 (not (contains!7595 lt!572443 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718835 () ListLongMap!18911)

(assert (=> d!138565 (= lt!572443 e!718835)))

(declare-fun c!122869 () Bool)

(assert (=> d!138565 (= c!122869 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138565 (validMask!0 mask!1466)))

(assert (=> d!138565 (= (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572443)))

(declare-fun b!1262738 () Bool)

(declare-fun e!718836 () Bool)

(declare-fun e!718831 () Bool)

(assert (=> b!1262738 (= e!718836 e!718831)))

(declare-fun c!122867 () Bool)

(assert (=> b!1262738 (= c!122867 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262739 () Bool)

(assert (=> b!1262739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> b!1262739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40278 _values!914)))))

(declare-fun e!718832 () Bool)

(declare-fun apply!999 (ListLongMap!18911 (_ BitVec 64)) V!48545)

(declare-fun get!20278 (ValueCell!15429 V!48545) V!48545)

(declare-fun dynLambda!3397 (Int (_ BitVec 64)) V!48545)

(assert (=> b!1262739 (= e!718832 (= (apply!999 lt!572443 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262740 () Bool)

(assert (=> b!1262740 (= e!718831 (= lt!572443 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262741 () Bool)

(assert (=> b!1262741 (= e!718833 e!718836)))

(declare-fun c!122866 () Bool)

(assert (=> b!1262741 (= c!122866 e!718834)))

(declare-fun res!841214 () Bool)

(assert (=> b!1262741 (=> (not res!841214) (not e!718834))))

(assert (=> b!1262741 (= res!841214 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262742 () Bool)

(declare-fun res!841213 () Bool)

(assert (=> b!1262742 (=> (not res!841213) (not e!718833))))

(assert (=> b!1262742 (= res!841213 (not (contains!7595 lt!572443 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262743 () Bool)

(declare-fun lt!572442 () Unit!42088)

(declare-fun lt!572441 () Unit!42088)

(assert (=> b!1262743 (= lt!572442 lt!572441)))

(declare-fun lt!572446 () (_ BitVec 64))

(declare-fun lt!572447 () ListLongMap!18911)

(declare-fun lt!572445 () V!48545)

(declare-fun lt!572444 () (_ BitVec 64))

(assert (=> b!1262743 (not (contains!7595 (+!4247 lt!572447 (tuple2!21039 lt!572446 lt!572445)) lt!572444))))

(declare-fun addStillNotContains!327 (ListLongMap!18911 (_ BitVec 64) V!48545 (_ BitVec 64)) Unit!42088)

(assert (=> b!1262743 (= lt!572441 (addStillNotContains!327 lt!572447 lt!572446 lt!572445 lt!572444))))

(assert (=> b!1262743 (= lt!572444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262743 (= lt!572445 (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262743 (= lt!572446 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62117 () ListLongMap!18911)

(assert (=> b!1262743 (= lt!572447 call!62117)))

(declare-fun e!718837 () ListLongMap!18911)

(assert (=> b!1262743 (= e!718837 (+!4247 call!62117 (tuple2!21039 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262744 () Bool)

(assert (=> b!1262744 (= e!718835 e!718837)))

(declare-fun c!122868 () Bool)

(assert (=> b!1262744 (= c!122868 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262745 () Bool)

(assert (=> b!1262745 (= e!718835 (ListLongMap!18912 Nil!28229))))

(declare-fun b!1262746 () Bool)

(assert (=> b!1262746 (= e!718836 e!718832)))

(assert (=> b!1262746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun res!841215 () Bool)

(assert (=> b!1262746 (= res!841215 (contains!7595 lt!572443 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262746 (=> (not res!841215) (not e!718832))))

(declare-fun b!1262747 () Bool)

(assert (=> b!1262747 (= e!718837 call!62117)))

(declare-fun bm!62114 () Bool)

(assert (=> bm!62114 (= call!62117 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262748 () Bool)

(declare-fun isEmpty!1041 (ListLongMap!18911) Bool)

(assert (=> b!1262748 (= e!718831 (isEmpty!1041 lt!572443))))

(assert (= (and d!138565 c!122869) b!1262745))

(assert (= (and d!138565 (not c!122869)) b!1262744))

(assert (= (and b!1262744 c!122868) b!1262743))

(assert (= (and b!1262744 (not c!122868)) b!1262747))

(assert (= (or b!1262743 b!1262747) bm!62114))

(assert (= (and d!138565 res!841212) b!1262742))

(assert (= (and b!1262742 res!841213) b!1262741))

(assert (= (and b!1262741 res!841214) b!1262737))

(assert (= (and b!1262741 c!122866) b!1262746))

(assert (= (and b!1262741 (not c!122866)) b!1262738))

(assert (= (and b!1262746 res!841215) b!1262739))

(assert (= (and b!1262738 c!122867) b!1262740))

(assert (= (and b!1262738 (not c!122867)) b!1262748))

(declare-fun b_lambda!22899 () Bool)

(assert (=> (not b_lambda!22899) (not b!1262739)))

(declare-fun t!41745 () Bool)

(declare-fun tb!11325 () Bool)

(assert (=> (and start!106030 (= defaultEntry!922 defaultEntry!922) t!41745) tb!11325))

(declare-fun result!23383 () Bool)

(assert (=> tb!11325 (= result!23383 tp_is_empty!32385)))

(assert (=> b!1262739 t!41745))

(declare-fun b_and!45449 () Bool)

(assert (= b_and!45445 (and (=> t!41745 result!23383) b_and!45449)))

(declare-fun b_lambda!22901 () Bool)

(assert (=> (not b_lambda!22901) (not b!1262743)))

(assert (=> b!1262743 t!41745))

(declare-fun b_and!45451 () Bool)

(assert (= b_and!45449 (and (=> t!41745 result!23383) b_and!45451)))

(declare-fun m!1163223 () Bool)

(assert (=> b!1262743 m!1163223))

(declare-fun m!1163225 () Bool)

(assert (=> b!1262743 m!1163225))

(declare-fun m!1163227 () Bool)

(assert (=> b!1262743 m!1163227))

(assert (=> b!1262743 m!1163227))

(declare-fun m!1163229 () Bool)

(assert (=> b!1262743 m!1163229))

(declare-fun m!1163231 () Bool)

(assert (=> b!1262743 m!1163231))

(assert (=> b!1262743 m!1163213))

(assert (=> b!1262743 m!1163231))

(declare-fun m!1163233 () Bool)

(assert (=> b!1262743 m!1163233))

(declare-fun m!1163235 () Bool)

(assert (=> b!1262743 m!1163235))

(assert (=> b!1262743 m!1163233))

(assert (=> b!1262746 m!1163213))

(assert (=> b!1262746 m!1163213))

(declare-fun m!1163237 () Bool)

(assert (=> b!1262746 m!1163237))

(declare-fun m!1163239 () Bool)

(assert (=> bm!62114 m!1163239))

(declare-fun m!1163241 () Bool)

(assert (=> d!138565 m!1163241))

(assert (=> d!138565 m!1163167))

(declare-fun m!1163243 () Bool)

(assert (=> b!1262742 m!1163243))

(assert (=> b!1262744 m!1163213))

(assert (=> b!1262744 m!1163213))

(assert (=> b!1262744 m!1163215))

(assert (=> b!1262737 m!1163213))

(assert (=> b!1262737 m!1163213))

(assert (=> b!1262737 m!1163215))

(assert (=> b!1262740 m!1163239))

(assert (=> b!1262739 m!1163213))

(declare-fun m!1163245 () Bool)

(assert (=> b!1262739 m!1163245))

(assert (=> b!1262739 m!1163231))

(assert (=> b!1262739 m!1163213))

(assert (=> b!1262739 m!1163231))

(assert (=> b!1262739 m!1163233))

(assert (=> b!1262739 m!1163235))

(assert (=> b!1262739 m!1163233))

(declare-fun m!1163247 () Bool)

(assert (=> b!1262748 m!1163247))

(assert (=> b!1262666 d!138565))

(declare-fun b!1262751 () Bool)

(declare-fun e!718841 () Bool)

(assert (=> b!1262751 (= e!718841 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262751 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138567 () Bool)

(declare-fun e!718840 () Bool)

(assert (=> d!138567 e!718840))

(declare-fun res!841216 () Bool)

(assert (=> d!138567 (=> (not res!841216) (not e!718840))))

(declare-fun lt!572450 () ListLongMap!18911)

(assert (=> d!138567 (= res!841216 (not (contains!7595 lt!572450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718842 () ListLongMap!18911)

(assert (=> d!138567 (= lt!572450 e!718842)))

(declare-fun c!122873 () Bool)

(assert (=> d!138567 (= c!122873 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138567 (validMask!0 mask!1466)))

(assert (=> d!138567 (= (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572450)))

(declare-fun b!1262752 () Bool)

(declare-fun e!718843 () Bool)

(declare-fun e!718838 () Bool)

(assert (=> b!1262752 (= e!718843 e!718838)))

(declare-fun c!122871 () Bool)

(assert (=> b!1262752 (= c!122871 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262753 () Bool)

(assert (=> b!1262753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> b!1262753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40278 _values!914)))))

(declare-fun e!718839 () Bool)

(assert (=> b!1262753 (= e!718839 (= (apply!999 lt!572450 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262754 () Bool)

(assert (=> b!1262754 (= e!718838 (= lt!572450 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262755 () Bool)

(assert (=> b!1262755 (= e!718840 e!718843)))

(declare-fun c!122870 () Bool)

(assert (=> b!1262755 (= c!122870 e!718841)))

(declare-fun res!841218 () Bool)

(assert (=> b!1262755 (=> (not res!841218) (not e!718841))))

(assert (=> b!1262755 (= res!841218 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262756 () Bool)

(declare-fun res!841217 () Bool)

(assert (=> b!1262756 (=> (not res!841217) (not e!718840))))

(assert (=> b!1262756 (= res!841217 (not (contains!7595 lt!572450 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262757 () Bool)

(declare-fun lt!572449 () Unit!42088)

(declare-fun lt!572448 () Unit!42088)

(assert (=> b!1262757 (= lt!572449 lt!572448)))

(declare-fun lt!572451 () (_ BitVec 64))

(declare-fun lt!572452 () V!48545)

(declare-fun lt!572453 () (_ BitVec 64))

(declare-fun lt!572454 () ListLongMap!18911)

(assert (=> b!1262757 (not (contains!7595 (+!4247 lt!572454 (tuple2!21039 lt!572453 lt!572452)) lt!572451))))

(assert (=> b!1262757 (= lt!572448 (addStillNotContains!327 lt!572454 lt!572453 lt!572452 lt!572451))))

(assert (=> b!1262757 (= lt!572451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262757 (= lt!572452 (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262757 (= lt!572453 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62118 () ListLongMap!18911)

(assert (=> b!1262757 (= lt!572454 call!62118)))

(declare-fun e!718844 () ListLongMap!18911)

(assert (=> b!1262757 (= e!718844 (+!4247 call!62118 (tuple2!21039 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262758 () Bool)

(assert (=> b!1262758 (= e!718842 e!718844)))

(declare-fun c!122872 () Bool)

(assert (=> b!1262758 (= c!122872 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262759 () Bool)

(assert (=> b!1262759 (= e!718842 (ListLongMap!18912 Nil!28229))))

(declare-fun b!1262760 () Bool)

(assert (=> b!1262760 (= e!718843 e!718839)))

(assert (=> b!1262760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun res!841219 () Bool)

(assert (=> b!1262760 (= res!841219 (contains!7595 lt!572450 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262760 (=> (not res!841219) (not e!718839))))

(declare-fun b!1262761 () Bool)

(assert (=> b!1262761 (= e!718844 call!62118)))

(declare-fun bm!62115 () Bool)

(assert (=> bm!62115 (= call!62118 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262762 () Bool)

(assert (=> b!1262762 (= e!718838 (isEmpty!1041 lt!572450))))

(assert (= (and d!138567 c!122873) b!1262759))

(assert (= (and d!138567 (not c!122873)) b!1262758))

(assert (= (and b!1262758 c!122872) b!1262757))

(assert (= (and b!1262758 (not c!122872)) b!1262761))

(assert (= (or b!1262757 b!1262761) bm!62115))

(assert (= (and d!138567 res!841216) b!1262756))

(assert (= (and b!1262756 res!841217) b!1262755))

(assert (= (and b!1262755 res!841218) b!1262751))

(assert (= (and b!1262755 c!122870) b!1262760))

(assert (= (and b!1262755 (not c!122870)) b!1262752))

(assert (= (and b!1262760 res!841219) b!1262753))

(assert (= (and b!1262752 c!122871) b!1262754))

(assert (= (and b!1262752 (not c!122871)) b!1262762))

(declare-fun b_lambda!22903 () Bool)

(assert (=> (not b_lambda!22903) (not b!1262753)))

(assert (=> b!1262753 t!41745))

(declare-fun b_and!45453 () Bool)

(assert (= b_and!45451 (and (=> t!41745 result!23383) b_and!45453)))

(declare-fun b_lambda!22905 () Bool)

(assert (=> (not b_lambda!22905) (not b!1262757)))

(assert (=> b!1262757 t!41745))

(declare-fun b_and!45455 () Bool)

(assert (= b_and!45453 (and (=> t!41745 result!23383) b_and!45455)))

(declare-fun m!1163249 () Bool)

(assert (=> b!1262757 m!1163249))

(declare-fun m!1163251 () Bool)

(assert (=> b!1262757 m!1163251))

(declare-fun m!1163253 () Bool)

(assert (=> b!1262757 m!1163253))

(assert (=> b!1262757 m!1163253))

(declare-fun m!1163255 () Bool)

(assert (=> b!1262757 m!1163255))

(assert (=> b!1262757 m!1163231))

(assert (=> b!1262757 m!1163213))

(assert (=> b!1262757 m!1163231))

(assert (=> b!1262757 m!1163233))

(assert (=> b!1262757 m!1163235))

(assert (=> b!1262757 m!1163233))

(assert (=> b!1262760 m!1163213))

(assert (=> b!1262760 m!1163213))

(declare-fun m!1163257 () Bool)

(assert (=> b!1262760 m!1163257))

(declare-fun m!1163259 () Bool)

(assert (=> bm!62115 m!1163259))

(declare-fun m!1163261 () Bool)

(assert (=> d!138567 m!1163261))

(assert (=> d!138567 m!1163167))

(declare-fun m!1163263 () Bool)

(assert (=> b!1262756 m!1163263))

(assert (=> b!1262758 m!1163213))

(assert (=> b!1262758 m!1163213))

(assert (=> b!1262758 m!1163215))

(assert (=> b!1262751 m!1163213))

(assert (=> b!1262751 m!1163213))

(assert (=> b!1262751 m!1163215))

(assert (=> b!1262754 m!1163259))

(assert (=> b!1262753 m!1163213))

(declare-fun m!1163265 () Bool)

(assert (=> b!1262753 m!1163265))

(assert (=> b!1262753 m!1163231))

(assert (=> b!1262753 m!1163213))

(assert (=> b!1262753 m!1163231))

(assert (=> b!1262753 m!1163233))

(assert (=> b!1262753 m!1163235))

(assert (=> b!1262753 m!1163233))

(declare-fun m!1163267 () Bool)

(assert (=> b!1262762 m!1163267))

(assert (=> b!1262666 d!138567))

(declare-fun d!138569 () Bool)

(assert (=> d!138569 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106030 d!138569))

(declare-fun d!138571 () Bool)

(assert (=> d!138571 (= (array_inv!30249 _keys!1118) (bvsge (size!40279 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106030 d!138571))

(declare-fun d!138573 () Bool)

(assert (=> d!138573 (= (array_inv!30250 _values!914) (bvsge (size!40278 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106030 d!138573))

(declare-fun d!138575 () Bool)

(declare-fun e!718849 () Bool)

(assert (=> d!138575 e!718849))

(declare-fun res!841222 () Bool)

(assert (=> d!138575 (=> res!841222 e!718849)))

(declare-fun lt!572465 () Bool)

(assert (=> d!138575 (= res!841222 (not lt!572465))))

(declare-fun lt!572463 () Bool)

(assert (=> d!138575 (= lt!572465 lt!572463)))

(declare-fun lt!572466 () Unit!42088)

(declare-fun e!718850 () Unit!42088)

(assert (=> d!138575 (= lt!572466 e!718850)))

(declare-fun c!122876 () Bool)

(assert (=> d!138575 (= c!122876 lt!572463)))

(declare-fun containsKey!624 (List!28232 (_ BitVec 64)) Bool)

(assert (=> d!138575 (= lt!572463 (containsKey!624 (toList!9471 lt!572404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138575 (= (contains!7595 lt!572404 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572465)))

(declare-fun b!1262769 () Bool)

(declare-fun lt!572464 () Unit!42088)

(assert (=> b!1262769 (= e!718850 lt!572464)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!433 (List!28232 (_ BitVec 64)) Unit!42088)

(assert (=> b!1262769 (= lt!572464 (lemmaContainsKeyImpliesGetValueByKeyDefined!433 (toList!9471 lt!572404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!715 0))(
  ( (Some!714 (v!18965 V!48545)) (None!713) )
))
(declare-fun isDefined!472 (Option!715) Bool)

(declare-fun getValueByKey!664 (List!28232 (_ BitVec 64)) Option!715)

(assert (=> b!1262769 (isDefined!472 (getValueByKey!664 (toList!9471 lt!572404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262770 () Bool)

(declare-fun Unit!42092 () Unit!42088)

(assert (=> b!1262770 (= e!718850 Unit!42092)))

(declare-fun b!1262771 () Bool)

(assert (=> b!1262771 (= e!718849 (isDefined!472 (getValueByKey!664 (toList!9471 lt!572404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138575 c!122876) b!1262769))

(assert (= (and d!138575 (not c!122876)) b!1262770))

(assert (= (and d!138575 (not res!841222)) b!1262771))

(declare-fun m!1163269 () Bool)

(assert (=> d!138575 m!1163269))

(declare-fun m!1163271 () Bool)

(assert (=> b!1262769 m!1163271))

(declare-fun m!1163273 () Bool)

(assert (=> b!1262769 m!1163273))

(assert (=> b!1262769 m!1163273))

(declare-fun m!1163275 () Bool)

(assert (=> b!1262769 m!1163275))

(assert (=> b!1262771 m!1163273))

(assert (=> b!1262771 m!1163273))

(assert (=> b!1262771 m!1163275))

(assert (=> b!1262664 d!138575))

(declare-fun d!138577 () Bool)

(declare-fun e!718853 () Bool)

(assert (=> d!138577 e!718853))

(declare-fun res!841227 () Bool)

(assert (=> d!138577 (=> (not res!841227) (not e!718853))))

(declare-fun lt!572476 () ListLongMap!18911)

(assert (=> d!138577 (= res!841227 (contains!7595 lt!572476 (_1!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572478 () List!28232)

(assert (=> d!138577 (= lt!572476 (ListLongMap!18912 lt!572478))))

(declare-fun lt!572475 () Unit!42088)

(declare-fun lt!572477 () Unit!42088)

(assert (=> d!138577 (= lt!572475 lt!572477)))

(assert (=> d!138577 (= (getValueByKey!664 lt!572478 (_1!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!335 (List!28232 (_ BitVec 64) V!48545) Unit!42088)

(assert (=> d!138577 (= lt!572477 (lemmaContainsTupThenGetReturnValue!335 lt!572478 (_1!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!449 (List!28232 (_ BitVec 64) V!48545) List!28232)

(assert (=> d!138577 (= lt!572478 (insertStrictlySorted!449 (toList!9471 lt!572404) (_1!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138577 (= (+!4247 lt!572404 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572476)))

(declare-fun b!1262776 () Bool)

(declare-fun res!841228 () Bool)

(assert (=> b!1262776 (=> (not res!841228) (not e!718853))))

(assert (=> b!1262776 (= res!841228 (= (getValueByKey!664 (toList!9471 lt!572476) (_1!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10530 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262777 () Bool)

(declare-fun contains!7597 (List!28232 tuple2!21038) Bool)

(assert (=> b!1262777 (= e!718853 (contains!7597 (toList!9471 lt!572476) (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138577 res!841227) b!1262776))

(assert (= (and b!1262776 res!841228) b!1262777))

(declare-fun m!1163277 () Bool)

(assert (=> d!138577 m!1163277))

(declare-fun m!1163279 () Bool)

(assert (=> d!138577 m!1163279))

(declare-fun m!1163281 () Bool)

(assert (=> d!138577 m!1163281))

(declare-fun m!1163283 () Bool)

(assert (=> d!138577 m!1163283))

(declare-fun m!1163285 () Bool)

(assert (=> b!1262776 m!1163285))

(declare-fun m!1163287 () Bool)

(assert (=> b!1262777 m!1163287))

(assert (=> b!1262664 d!138577))

(declare-fun b!1262820 () Bool)

(declare-fun e!718891 () Bool)

(declare-fun call!62135 () Bool)

(assert (=> b!1262820 (= e!718891 (not call!62135))))

(declare-fun b!1262821 () Bool)

(declare-fun e!718888 () ListLongMap!18911)

(declare-fun call!62136 () ListLongMap!18911)

(assert (=> b!1262821 (= e!718888 call!62136)))

(declare-fun bm!62130 () Bool)

(declare-fun call!62134 () ListLongMap!18911)

(assert (=> bm!62130 (= call!62136 call!62134)))

(declare-fun b!1262822 () Bool)

(declare-fun e!718881 () Bool)

(declare-fun lt!572542 () ListLongMap!18911)

(assert (=> b!1262822 (= e!718881 (= (apply!999 lt!572542 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62131 () Bool)

(declare-fun call!62133 () Bool)

(assert (=> bm!62131 (= call!62133 (contains!7595 lt!572542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262823 () Bool)

(declare-fun e!718892 () Bool)

(assert (=> b!1262823 (= e!718892 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62132 () Bool)

(declare-fun call!62137 () ListLongMap!18911)

(declare-fun call!62139 () ListLongMap!18911)

(assert (=> bm!62132 (= call!62137 call!62139)))

(declare-fun bm!62133 () Bool)

(assert (=> bm!62133 (= call!62135 (contains!7595 lt!572542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262824 () Bool)

(declare-fun e!718887 () Bool)

(assert (=> b!1262824 (= e!718887 e!718891)))

(declare-fun c!122891 () Bool)

(assert (=> b!1262824 (= c!122891 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262825 () Bool)

(declare-fun e!718889 () Bool)

(assert (=> b!1262825 (= e!718889 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62134 () Bool)

(declare-fun call!62138 () ListLongMap!18911)

(assert (=> bm!62134 (= call!62138 call!62137)))

(declare-fun b!1262826 () Bool)

(declare-fun e!718883 () Bool)

(assert (=> b!1262826 (= e!718883 (= (apply!999 lt!572542 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62135 () Bool)

(assert (=> bm!62135 (= call!62139 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262827 () Bool)

(declare-fun e!718880 () ListLongMap!18911)

(declare-fun e!718886 () ListLongMap!18911)

(assert (=> b!1262827 (= e!718880 e!718886)))

(declare-fun c!122889 () Bool)

(assert (=> b!1262827 (= c!122889 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262828 () Bool)

(declare-fun e!718884 () Bool)

(declare-fun e!718890 () Bool)

(assert (=> b!1262828 (= e!718884 e!718890)))

(declare-fun res!841253 () Bool)

(assert (=> b!1262828 (=> (not res!841253) (not e!718890))))

(assert (=> b!1262828 (= res!841253 (contains!7595 lt!572542 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262830 () Bool)

(declare-fun c!122894 () Bool)

(assert (=> b!1262830 (= c!122894 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262830 (= e!718886 e!718888)))

(declare-fun b!1262831 () Bool)

(declare-fun e!718882 () Bool)

(assert (=> b!1262831 (= e!718882 e!718881)))

(declare-fun res!841255 () Bool)

(assert (=> b!1262831 (= res!841255 call!62133)))

(assert (=> b!1262831 (=> (not res!841255) (not e!718881))))

(declare-fun b!1262832 () Bool)

(assert (=> b!1262832 (= e!718880 (+!4247 call!62134 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1262833 () Bool)

(assert (=> b!1262833 (= e!718888 call!62138)))

(declare-fun b!1262834 () Bool)

(assert (=> b!1262834 (= e!718886 call!62136)))

(declare-fun c!122890 () Bool)

(declare-fun bm!62136 () Bool)

(assert (=> bm!62136 (= call!62134 (+!4247 (ite c!122890 call!62139 (ite c!122889 call!62137 call!62138)) (ite (or c!122890 c!122889) (tuple2!21039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1262835 () Bool)

(declare-fun res!841248 () Bool)

(assert (=> b!1262835 (=> (not res!841248) (not e!718887))))

(assert (=> b!1262835 (= res!841248 e!718884)))

(declare-fun res!841254 () Bool)

(assert (=> b!1262835 (=> res!841254 e!718884)))

(assert (=> b!1262835 (= res!841254 (not e!718892))))

(declare-fun res!841249 () Bool)

(assert (=> b!1262835 (=> (not res!841249) (not e!718892))))

(assert (=> b!1262835 (= res!841249 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262836 () Bool)

(declare-fun e!718885 () Unit!42088)

(declare-fun lt!572534 () Unit!42088)

(assert (=> b!1262836 (= e!718885 lt!572534)))

(declare-fun lt!572524 () ListLongMap!18911)

(assert (=> b!1262836 (= lt!572524 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572525 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572528 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572528 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572541 () Unit!42088)

(declare-fun addStillContains!1089 (ListLongMap!18911 (_ BitVec 64) V!48545 (_ BitVec 64)) Unit!42088)

(assert (=> b!1262836 (= lt!572541 (addStillContains!1089 lt!572524 lt!572525 zeroValue!871 lt!572528))))

(assert (=> b!1262836 (contains!7595 (+!4247 lt!572524 (tuple2!21039 lt!572525 zeroValue!871)) lt!572528)))

(declare-fun lt!572540 () Unit!42088)

(assert (=> b!1262836 (= lt!572540 lt!572541)))

(declare-fun lt!572536 () ListLongMap!18911)

(assert (=> b!1262836 (= lt!572536 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572538 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572538 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572531 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572531 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572529 () Unit!42088)

(declare-fun addApplyDifferent!543 (ListLongMap!18911 (_ BitVec 64) V!48545 (_ BitVec 64)) Unit!42088)

(assert (=> b!1262836 (= lt!572529 (addApplyDifferent!543 lt!572536 lt!572538 minValueAfter!43 lt!572531))))

(assert (=> b!1262836 (= (apply!999 (+!4247 lt!572536 (tuple2!21039 lt!572538 minValueAfter!43)) lt!572531) (apply!999 lt!572536 lt!572531))))

(declare-fun lt!572537 () Unit!42088)

(assert (=> b!1262836 (= lt!572537 lt!572529)))

(declare-fun lt!572526 () ListLongMap!18911)

(assert (=> b!1262836 (= lt!572526 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572543 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572523 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572523 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572535 () Unit!42088)

(assert (=> b!1262836 (= lt!572535 (addApplyDifferent!543 lt!572526 lt!572543 zeroValue!871 lt!572523))))

(assert (=> b!1262836 (= (apply!999 (+!4247 lt!572526 (tuple2!21039 lt!572543 zeroValue!871)) lt!572523) (apply!999 lt!572526 lt!572523))))

(declare-fun lt!572544 () Unit!42088)

(assert (=> b!1262836 (= lt!572544 lt!572535)))

(declare-fun lt!572533 () ListLongMap!18911)

(assert (=> b!1262836 (= lt!572533 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572532 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572539 () (_ BitVec 64))

(assert (=> b!1262836 (= lt!572539 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262836 (= lt!572534 (addApplyDifferent!543 lt!572533 lt!572532 minValueAfter!43 lt!572539))))

(assert (=> b!1262836 (= (apply!999 (+!4247 lt!572533 (tuple2!21039 lt!572532 minValueAfter!43)) lt!572539) (apply!999 lt!572533 lt!572539))))

(declare-fun b!1262837 () Bool)

(assert (=> b!1262837 (= e!718890 (= (apply!999 lt!572542 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40278 _values!914)))))

(assert (=> b!1262837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262838 () Bool)

(assert (=> b!1262838 (= e!718882 (not call!62133))))

(declare-fun b!1262829 () Bool)

(declare-fun Unit!42093 () Unit!42088)

(assert (=> b!1262829 (= e!718885 Unit!42093)))

(declare-fun d!138579 () Bool)

(assert (=> d!138579 e!718887))

(declare-fun res!841252 () Bool)

(assert (=> d!138579 (=> (not res!841252) (not e!718887))))

(assert (=> d!138579 (= res!841252 (or (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))))

(declare-fun lt!572530 () ListLongMap!18911)

(assert (=> d!138579 (= lt!572542 lt!572530)))

(declare-fun lt!572527 () Unit!42088)

(assert (=> d!138579 (= lt!572527 e!718885)))

(declare-fun c!122893 () Bool)

(assert (=> d!138579 (= c!122893 e!718889)))

(declare-fun res!841250 () Bool)

(assert (=> d!138579 (=> (not res!841250) (not e!718889))))

(assert (=> d!138579 (= res!841250 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138579 (= lt!572530 e!718880)))

(assert (=> d!138579 (= c!122890 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138579 (validMask!0 mask!1466)))

(assert (=> d!138579 (= (getCurrentListMap!4640 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572542)))

(declare-fun b!1262839 () Bool)

(assert (=> b!1262839 (= e!718891 e!718883)))

(declare-fun res!841247 () Bool)

(assert (=> b!1262839 (= res!841247 call!62135)))

(assert (=> b!1262839 (=> (not res!841247) (not e!718883))))

(declare-fun b!1262840 () Bool)

(declare-fun res!841251 () Bool)

(assert (=> b!1262840 (=> (not res!841251) (not e!718887))))

(assert (=> b!1262840 (= res!841251 e!718882)))

(declare-fun c!122892 () Bool)

(assert (=> b!1262840 (= c!122892 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!138579 c!122890) b!1262832))

(assert (= (and d!138579 (not c!122890)) b!1262827))

(assert (= (and b!1262827 c!122889) b!1262834))

(assert (= (and b!1262827 (not c!122889)) b!1262830))

(assert (= (and b!1262830 c!122894) b!1262821))

(assert (= (and b!1262830 (not c!122894)) b!1262833))

(assert (= (or b!1262821 b!1262833) bm!62134))

(assert (= (or b!1262834 bm!62134) bm!62132))

(assert (= (or b!1262834 b!1262821) bm!62130))

(assert (= (or b!1262832 bm!62132) bm!62135))

(assert (= (or b!1262832 bm!62130) bm!62136))

(assert (= (and d!138579 res!841250) b!1262825))

(assert (= (and d!138579 c!122893) b!1262836))

(assert (= (and d!138579 (not c!122893)) b!1262829))

(assert (= (and d!138579 res!841252) b!1262835))

(assert (= (and b!1262835 res!841249) b!1262823))

(assert (= (and b!1262835 (not res!841254)) b!1262828))

(assert (= (and b!1262828 res!841253) b!1262837))

(assert (= (and b!1262835 res!841248) b!1262840))

(assert (= (and b!1262840 c!122892) b!1262831))

(assert (= (and b!1262840 (not c!122892)) b!1262838))

(assert (= (and b!1262831 res!841255) b!1262822))

(assert (= (or b!1262831 b!1262838) bm!62131))

(assert (= (and b!1262840 res!841251) b!1262824))

(assert (= (and b!1262824 c!122891) b!1262839))

(assert (= (and b!1262824 (not c!122891)) b!1262820))

(assert (= (and b!1262839 res!841247) b!1262826))

(assert (= (or b!1262839 b!1262820) bm!62133))

(declare-fun b_lambda!22907 () Bool)

(assert (=> (not b_lambda!22907) (not b!1262837)))

(assert (=> b!1262837 t!41745))

(declare-fun b_and!45457 () Bool)

(assert (= b_and!45455 (and (=> t!41745 result!23383) b_and!45457)))

(assert (=> b!1262837 m!1163233))

(assert (=> b!1262837 m!1163213))

(declare-fun m!1163289 () Bool)

(assert (=> b!1262837 m!1163289))

(assert (=> b!1262837 m!1163231))

(assert (=> b!1262837 m!1163233))

(assert (=> b!1262837 m!1163235))

(assert (=> b!1262837 m!1163213))

(assert (=> b!1262837 m!1163231))

(assert (=> b!1262825 m!1163213))

(assert (=> b!1262825 m!1163213))

(assert (=> b!1262825 m!1163215))

(assert (=> d!138579 m!1163167))

(declare-fun m!1163291 () Bool)

(assert (=> bm!62133 m!1163291))

(declare-fun m!1163293 () Bool)

(assert (=> b!1262832 m!1163293))

(assert (=> b!1262823 m!1163213))

(assert (=> b!1262823 m!1163213))

(assert (=> b!1262823 m!1163215))

(declare-fun m!1163295 () Bool)

(assert (=> bm!62136 m!1163295))

(assert (=> bm!62135 m!1163183))

(assert (=> b!1262836 m!1163183))

(declare-fun m!1163297 () Bool)

(assert (=> b!1262836 m!1163297))

(declare-fun m!1163299 () Bool)

(assert (=> b!1262836 m!1163299))

(declare-fun m!1163301 () Bool)

(assert (=> b!1262836 m!1163301))

(declare-fun m!1163303 () Bool)

(assert (=> b!1262836 m!1163303))

(declare-fun m!1163305 () Bool)

(assert (=> b!1262836 m!1163305))

(declare-fun m!1163307 () Bool)

(assert (=> b!1262836 m!1163307))

(declare-fun m!1163309 () Bool)

(assert (=> b!1262836 m!1163309))

(declare-fun m!1163311 () Bool)

(assert (=> b!1262836 m!1163311))

(declare-fun m!1163313 () Bool)

(assert (=> b!1262836 m!1163313))

(assert (=> b!1262836 m!1163213))

(assert (=> b!1262836 m!1163305))

(assert (=> b!1262836 m!1163309))

(declare-fun m!1163315 () Bool)

(assert (=> b!1262836 m!1163315))

(declare-fun m!1163317 () Bool)

(assert (=> b!1262836 m!1163317))

(declare-fun m!1163319 () Bool)

(assert (=> b!1262836 m!1163319))

(declare-fun m!1163321 () Bool)

(assert (=> b!1262836 m!1163321))

(assert (=> b!1262836 m!1163317))

(declare-fun m!1163323 () Bool)

(assert (=> b!1262836 m!1163323))

(assert (=> b!1262836 m!1163297))

(declare-fun m!1163325 () Bool)

(assert (=> b!1262836 m!1163325))

(declare-fun m!1163327 () Bool)

(assert (=> b!1262826 m!1163327))

(declare-fun m!1163329 () Bool)

(assert (=> bm!62131 m!1163329))

(declare-fun m!1163331 () Bool)

(assert (=> b!1262822 m!1163331))

(assert (=> b!1262828 m!1163213))

(assert (=> b!1262828 m!1163213))

(declare-fun m!1163333 () Bool)

(assert (=> b!1262828 m!1163333))

(assert (=> b!1262664 d!138579))

(declare-fun b!1262841 () Bool)

(declare-fun e!718904 () Bool)

(declare-fun call!62142 () Bool)

(assert (=> b!1262841 (= e!718904 (not call!62142))))

(declare-fun b!1262842 () Bool)

(declare-fun e!718901 () ListLongMap!18911)

(declare-fun call!62143 () ListLongMap!18911)

(assert (=> b!1262842 (= e!718901 call!62143)))

(declare-fun bm!62137 () Bool)

(declare-fun call!62141 () ListLongMap!18911)

(assert (=> bm!62137 (= call!62143 call!62141)))

(declare-fun b!1262843 () Bool)

(declare-fun e!718894 () Bool)

(declare-fun lt!572564 () ListLongMap!18911)

(assert (=> b!1262843 (= e!718894 (= (apply!999 lt!572564 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62138 () Bool)

(declare-fun call!62140 () Bool)

(assert (=> bm!62138 (= call!62140 (contains!7595 lt!572564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262844 () Bool)

(declare-fun e!718905 () Bool)

(assert (=> b!1262844 (= e!718905 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62139 () Bool)

(declare-fun call!62144 () ListLongMap!18911)

(declare-fun call!62146 () ListLongMap!18911)

(assert (=> bm!62139 (= call!62144 call!62146)))

(declare-fun bm!62140 () Bool)

(assert (=> bm!62140 (= call!62142 (contains!7595 lt!572564 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262845 () Bool)

(declare-fun e!718900 () Bool)

(assert (=> b!1262845 (= e!718900 e!718904)))

(declare-fun c!122897 () Bool)

(assert (=> b!1262845 (= c!122897 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262846 () Bool)

(declare-fun e!718902 () Bool)

(assert (=> b!1262846 (= e!718902 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62141 () Bool)

(declare-fun call!62145 () ListLongMap!18911)

(assert (=> bm!62141 (= call!62145 call!62144)))

(declare-fun b!1262847 () Bool)

(declare-fun e!718896 () Bool)

(assert (=> b!1262847 (= e!718896 (= (apply!999 lt!572564 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62142 () Bool)

(assert (=> bm!62142 (= call!62146 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262848 () Bool)

(declare-fun e!718893 () ListLongMap!18911)

(declare-fun e!718899 () ListLongMap!18911)

(assert (=> b!1262848 (= e!718893 e!718899)))

(declare-fun c!122895 () Bool)

(assert (=> b!1262848 (= c!122895 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262849 () Bool)

(declare-fun e!718897 () Bool)

(declare-fun e!718903 () Bool)

(assert (=> b!1262849 (= e!718897 e!718903)))

(declare-fun res!841262 () Bool)

(assert (=> b!1262849 (=> (not res!841262) (not e!718903))))

(assert (=> b!1262849 (= res!841262 (contains!7595 lt!572564 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262851 () Bool)

(declare-fun c!122900 () Bool)

(assert (=> b!1262851 (= c!122900 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262851 (= e!718899 e!718901)))

(declare-fun b!1262852 () Bool)

(declare-fun e!718895 () Bool)

(assert (=> b!1262852 (= e!718895 e!718894)))

(declare-fun res!841264 () Bool)

(assert (=> b!1262852 (= res!841264 call!62140)))

(assert (=> b!1262852 (=> (not res!841264) (not e!718894))))

(declare-fun b!1262853 () Bool)

(assert (=> b!1262853 (= e!718893 (+!4247 call!62141 (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1262854 () Bool)

(assert (=> b!1262854 (= e!718901 call!62145)))

(declare-fun b!1262855 () Bool)

(assert (=> b!1262855 (= e!718899 call!62143)))

(declare-fun bm!62143 () Bool)

(declare-fun c!122896 () Bool)

(assert (=> bm!62143 (= call!62141 (+!4247 (ite c!122896 call!62146 (ite c!122895 call!62144 call!62145)) (ite (or c!122896 c!122895) (tuple2!21039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21039 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262856 () Bool)

(declare-fun res!841257 () Bool)

(assert (=> b!1262856 (=> (not res!841257) (not e!718900))))

(assert (=> b!1262856 (= res!841257 e!718897)))

(declare-fun res!841263 () Bool)

(assert (=> b!1262856 (=> res!841263 e!718897)))

(assert (=> b!1262856 (= res!841263 (not e!718905))))

(declare-fun res!841258 () Bool)

(assert (=> b!1262856 (=> (not res!841258) (not e!718905))))

(assert (=> b!1262856 (= res!841258 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262857 () Bool)

(declare-fun e!718898 () Unit!42088)

(declare-fun lt!572556 () Unit!42088)

(assert (=> b!1262857 (= e!718898 lt!572556)))

(declare-fun lt!572546 () ListLongMap!18911)

(assert (=> b!1262857 (= lt!572546 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572547 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572550 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572550 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572563 () Unit!42088)

(assert (=> b!1262857 (= lt!572563 (addStillContains!1089 lt!572546 lt!572547 zeroValue!871 lt!572550))))

(assert (=> b!1262857 (contains!7595 (+!4247 lt!572546 (tuple2!21039 lt!572547 zeroValue!871)) lt!572550)))

(declare-fun lt!572562 () Unit!42088)

(assert (=> b!1262857 (= lt!572562 lt!572563)))

(declare-fun lt!572558 () ListLongMap!18911)

(assert (=> b!1262857 (= lt!572558 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572560 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572553 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572553 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572551 () Unit!42088)

(assert (=> b!1262857 (= lt!572551 (addApplyDifferent!543 lt!572558 lt!572560 minValueBefore!43 lt!572553))))

(assert (=> b!1262857 (= (apply!999 (+!4247 lt!572558 (tuple2!21039 lt!572560 minValueBefore!43)) lt!572553) (apply!999 lt!572558 lt!572553))))

(declare-fun lt!572559 () Unit!42088)

(assert (=> b!1262857 (= lt!572559 lt!572551)))

(declare-fun lt!572548 () ListLongMap!18911)

(assert (=> b!1262857 (= lt!572548 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572565 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572545 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572545 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572557 () Unit!42088)

(assert (=> b!1262857 (= lt!572557 (addApplyDifferent!543 lt!572548 lt!572565 zeroValue!871 lt!572545))))

(assert (=> b!1262857 (= (apply!999 (+!4247 lt!572548 (tuple2!21039 lt!572565 zeroValue!871)) lt!572545) (apply!999 lt!572548 lt!572545))))

(declare-fun lt!572566 () Unit!42088)

(assert (=> b!1262857 (= lt!572566 lt!572557)))

(declare-fun lt!572555 () ListLongMap!18911)

(assert (=> b!1262857 (= lt!572555 (getCurrentListMapNoExtraKeys!5837 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572554 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572554 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572561 () (_ BitVec 64))

(assert (=> b!1262857 (= lt!572561 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262857 (= lt!572556 (addApplyDifferent!543 lt!572555 lt!572554 minValueBefore!43 lt!572561))))

(assert (=> b!1262857 (= (apply!999 (+!4247 lt!572555 (tuple2!21039 lt!572554 minValueBefore!43)) lt!572561) (apply!999 lt!572555 lt!572561))))

(declare-fun b!1262858 () Bool)

(assert (=> b!1262858 (= e!718903 (= (apply!999 lt!572564 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)) (get!20278 (select (arr!39742 _values!914) #b00000000000000000000000000000000) (dynLambda!3397 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40278 _values!914)))))

(assert (=> b!1262858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(declare-fun b!1262859 () Bool)

(assert (=> b!1262859 (= e!718895 (not call!62140))))

(declare-fun b!1262850 () Bool)

(declare-fun Unit!42094 () Unit!42088)

(assert (=> b!1262850 (= e!718898 Unit!42094)))

(declare-fun d!138581 () Bool)

(assert (=> d!138581 e!718900))

(declare-fun res!841261 () Bool)

(assert (=> d!138581 (=> (not res!841261) (not e!718900))))

(assert (=> d!138581 (= res!841261 (or (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))))

(declare-fun lt!572552 () ListLongMap!18911)

(assert (=> d!138581 (= lt!572564 lt!572552)))

(declare-fun lt!572549 () Unit!42088)

(assert (=> d!138581 (= lt!572549 e!718898)))

(declare-fun c!122899 () Bool)

(assert (=> d!138581 (= c!122899 e!718902)))

(declare-fun res!841259 () Bool)

(assert (=> d!138581 (=> (not res!841259) (not e!718902))))

(assert (=> d!138581 (= res!841259 (bvslt #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138581 (= lt!572552 e!718893)))

(assert (=> d!138581 (= c!122896 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138581 (validMask!0 mask!1466)))

(assert (=> d!138581 (= (getCurrentListMap!4640 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572564)))

(declare-fun b!1262860 () Bool)

(assert (=> b!1262860 (= e!718904 e!718896)))

(declare-fun res!841256 () Bool)

(assert (=> b!1262860 (= res!841256 call!62142)))

(assert (=> b!1262860 (=> (not res!841256) (not e!718896))))

(declare-fun b!1262861 () Bool)

(declare-fun res!841260 () Bool)

(assert (=> b!1262861 (=> (not res!841260) (not e!718900))))

(assert (=> b!1262861 (= res!841260 e!718895)))

(declare-fun c!122898 () Bool)

(assert (=> b!1262861 (= c!122898 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!138581 c!122896) b!1262853))

(assert (= (and d!138581 (not c!122896)) b!1262848))

(assert (= (and b!1262848 c!122895) b!1262855))

(assert (= (and b!1262848 (not c!122895)) b!1262851))

(assert (= (and b!1262851 c!122900) b!1262842))

(assert (= (and b!1262851 (not c!122900)) b!1262854))

(assert (= (or b!1262842 b!1262854) bm!62141))

(assert (= (or b!1262855 bm!62141) bm!62139))

(assert (= (or b!1262855 b!1262842) bm!62137))

(assert (= (or b!1262853 bm!62139) bm!62142))

(assert (= (or b!1262853 bm!62137) bm!62143))

(assert (= (and d!138581 res!841259) b!1262846))

(assert (= (and d!138581 c!122899) b!1262857))

(assert (= (and d!138581 (not c!122899)) b!1262850))

(assert (= (and d!138581 res!841261) b!1262856))

(assert (= (and b!1262856 res!841258) b!1262844))

(assert (= (and b!1262856 (not res!841263)) b!1262849))

(assert (= (and b!1262849 res!841262) b!1262858))

(assert (= (and b!1262856 res!841257) b!1262861))

(assert (= (and b!1262861 c!122898) b!1262852))

(assert (= (and b!1262861 (not c!122898)) b!1262859))

(assert (= (and b!1262852 res!841264) b!1262843))

(assert (= (or b!1262852 b!1262859) bm!62138))

(assert (= (and b!1262861 res!841260) b!1262845))

(assert (= (and b!1262845 c!122897) b!1262860))

(assert (= (and b!1262845 (not c!122897)) b!1262841))

(assert (= (and b!1262860 res!841256) b!1262847))

(assert (= (or b!1262860 b!1262841) bm!62140))

(declare-fun b_lambda!22909 () Bool)

(assert (=> (not b_lambda!22909) (not b!1262858)))

(assert (=> b!1262858 t!41745))

(declare-fun b_and!45459 () Bool)

(assert (= b_and!45457 (and (=> t!41745 result!23383) b_and!45459)))

(assert (=> b!1262858 m!1163233))

(assert (=> b!1262858 m!1163213))

(declare-fun m!1163335 () Bool)

(assert (=> b!1262858 m!1163335))

(assert (=> b!1262858 m!1163231))

(assert (=> b!1262858 m!1163233))

(assert (=> b!1262858 m!1163235))

(assert (=> b!1262858 m!1163213))

(assert (=> b!1262858 m!1163231))

(assert (=> b!1262846 m!1163213))

(assert (=> b!1262846 m!1163213))

(assert (=> b!1262846 m!1163215))

(assert (=> d!138581 m!1163167))

(declare-fun m!1163337 () Bool)

(assert (=> bm!62140 m!1163337))

(declare-fun m!1163339 () Bool)

(assert (=> b!1262853 m!1163339))

(assert (=> b!1262844 m!1163213))

(assert (=> b!1262844 m!1163213))

(assert (=> b!1262844 m!1163215))

(declare-fun m!1163341 () Bool)

(assert (=> bm!62143 m!1163341))

(assert (=> bm!62142 m!1163185))

(assert (=> b!1262857 m!1163185))

(declare-fun m!1163343 () Bool)

(assert (=> b!1262857 m!1163343))

(declare-fun m!1163345 () Bool)

(assert (=> b!1262857 m!1163345))

(declare-fun m!1163347 () Bool)

(assert (=> b!1262857 m!1163347))

(declare-fun m!1163349 () Bool)

(assert (=> b!1262857 m!1163349))

(declare-fun m!1163351 () Bool)

(assert (=> b!1262857 m!1163351))

(declare-fun m!1163353 () Bool)

(assert (=> b!1262857 m!1163353))

(declare-fun m!1163355 () Bool)

(assert (=> b!1262857 m!1163355))

(declare-fun m!1163357 () Bool)

(assert (=> b!1262857 m!1163357))

(declare-fun m!1163359 () Bool)

(assert (=> b!1262857 m!1163359))

(assert (=> b!1262857 m!1163213))

(assert (=> b!1262857 m!1163351))

(assert (=> b!1262857 m!1163355))

(declare-fun m!1163361 () Bool)

(assert (=> b!1262857 m!1163361))

(declare-fun m!1163363 () Bool)

(assert (=> b!1262857 m!1163363))

(declare-fun m!1163365 () Bool)

(assert (=> b!1262857 m!1163365))

(declare-fun m!1163367 () Bool)

(assert (=> b!1262857 m!1163367))

(assert (=> b!1262857 m!1163363))

(declare-fun m!1163369 () Bool)

(assert (=> b!1262857 m!1163369))

(assert (=> b!1262857 m!1163343))

(declare-fun m!1163371 () Bool)

(assert (=> b!1262857 m!1163371))

(declare-fun m!1163373 () Bool)

(assert (=> b!1262847 m!1163373))

(declare-fun m!1163375 () Bool)

(assert (=> bm!62138 m!1163375))

(declare-fun m!1163377 () Bool)

(assert (=> b!1262843 m!1163377))

(assert (=> b!1262849 m!1163213))

(assert (=> b!1262849 m!1163213))

(declare-fun m!1163379 () Bool)

(assert (=> b!1262849 m!1163379))

(assert (=> b!1262664 d!138581))

(declare-fun b!1262870 () Bool)

(declare-fun e!718914 () Bool)

(declare-fun e!718912 () Bool)

(assert (=> b!1262870 (= e!718914 e!718912)))

(declare-fun c!122903 () Bool)

(assert (=> b!1262870 (= c!122903 (validKeyInArray!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62146 () Bool)

(declare-fun call!62149 () Bool)

(assert (=> bm!62146 (= call!62149 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262871 () Bool)

(declare-fun e!718913 () Bool)

(assert (=> b!1262871 (= e!718912 e!718913)))

(declare-fun lt!572574 () (_ BitVec 64))

(assert (=> b!1262871 (= lt!572574 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572575 () Unit!42088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82390 (_ BitVec 64) (_ BitVec 32)) Unit!42088)

(assert (=> b!1262871 (= lt!572575 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572574 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262871 (arrayContainsKey!0 _keys!1118 lt!572574 #b00000000000000000000000000000000)))

(declare-fun lt!572573 () Unit!42088)

(assert (=> b!1262871 (= lt!572573 lt!572575)))

(declare-fun res!841270 () Bool)

(declare-datatypes ((SeekEntryResult!9977 0))(
  ( (MissingZero!9977 (index!42279 (_ BitVec 32))) (Found!9977 (index!42280 (_ BitVec 32))) (Intermediate!9977 (undefined!10789 Bool) (index!42281 (_ BitVec 32)) (x!111269 (_ BitVec 32))) (Undefined!9977) (MissingVacant!9977 (index!42282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82390 (_ BitVec 32)) SeekEntryResult!9977)

(assert (=> b!1262871 (= res!841270 (= (seekEntryOrOpen!0 (select (arr!39743 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9977 #b00000000000000000000000000000000)))))

(assert (=> b!1262871 (=> (not res!841270) (not e!718913))))

(declare-fun b!1262873 () Bool)

(assert (=> b!1262873 (= e!718913 call!62149)))

(declare-fun b!1262872 () Bool)

(assert (=> b!1262872 (= e!718912 call!62149)))

(declare-fun d!138583 () Bool)

(declare-fun res!841269 () Bool)

(assert (=> d!138583 (=> res!841269 e!718914)))

(assert (=> d!138583 (= res!841269 (bvsge #b00000000000000000000000000000000 (size!40279 _keys!1118)))))

(assert (=> d!138583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718914)))

(assert (= (and d!138583 (not res!841269)) b!1262870))

(assert (= (and b!1262870 c!122903) b!1262871))

(assert (= (and b!1262870 (not c!122903)) b!1262872))

(assert (= (and b!1262871 res!841270) b!1262873))

(assert (= (or b!1262873 b!1262872) bm!62146))

(assert (=> b!1262870 m!1163213))

(assert (=> b!1262870 m!1163213))

(assert (=> b!1262870 m!1163215))

(declare-fun m!1163381 () Bool)

(assert (=> bm!62146 m!1163381))

(assert (=> b!1262871 m!1163213))

(declare-fun m!1163383 () Bool)

(assert (=> b!1262871 m!1163383))

(declare-fun m!1163385 () Bool)

(assert (=> b!1262871 m!1163385))

(assert (=> b!1262871 m!1163213))

(declare-fun m!1163387 () Bool)

(assert (=> b!1262871 m!1163387))

(assert (=> b!1262670 d!138583))

(declare-fun mapIsEmpty!50401 () Bool)

(declare-fun mapRes!50401 () Bool)

(assert (=> mapIsEmpty!50401 mapRes!50401))

(declare-fun condMapEmpty!50401 () Bool)

(declare-fun mapDefault!50401 () ValueCell!15429)

(assert (=> mapNonEmpty!50395 (= condMapEmpty!50401 (= mapRest!50395 ((as const (Array (_ BitVec 32) ValueCell!15429)) mapDefault!50401)))))

(declare-fun e!718920 () Bool)

(assert (=> mapNonEmpty!50395 (= tp!95995 (and e!718920 mapRes!50401))))

(declare-fun mapNonEmpty!50401 () Bool)

(declare-fun tp!96005 () Bool)

(declare-fun e!718919 () Bool)

(assert (=> mapNonEmpty!50401 (= mapRes!50401 (and tp!96005 e!718919))))

(declare-fun mapKey!50401 () (_ BitVec 32))

(declare-fun mapRest!50401 () (Array (_ BitVec 32) ValueCell!15429))

(declare-fun mapValue!50401 () ValueCell!15429)

(assert (=> mapNonEmpty!50401 (= mapRest!50395 (store mapRest!50401 mapKey!50401 mapValue!50401))))

(declare-fun b!1262881 () Bool)

(assert (=> b!1262881 (= e!718920 tp_is_empty!32385)))

(declare-fun b!1262880 () Bool)

(assert (=> b!1262880 (= e!718919 tp_is_empty!32385)))

(assert (= (and mapNonEmpty!50395 condMapEmpty!50401) mapIsEmpty!50401))

(assert (= (and mapNonEmpty!50395 (not condMapEmpty!50401)) mapNonEmpty!50401))

(assert (= (and mapNonEmpty!50401 ((_ is ValueCellFull!15429) mapValue!50401)) b!1262880))

(assert (= (and mapNonEmpty!50395 ((_ is ValueCellFull!15429) mapDefault!50401)) b!1262881))

(declare-fun m!1163389 () Bool)

(assert (=> mapNonEmpty!50401 m!1163389))

(declare-fun b_lambda!22911 () Bool)

(assert (= b_lambda!22903 (or (and start!106030 b_free!27483) b_lambda!22911)))

(declare-fun b_lambda!22913 () Bool)

(assert (= b_lambda!22899 (or (and start!106030 b_free!27483) b_lambda!22913)))

(declare-fun b_lambda!22915 () Bool)

(assert (= b_lambda!22907 (or (and start!106030 b_free!27483) b_lambda!22915)))

(declare-fun b_lambda!22917 () Bool)

(assert (= b_lambda!22901 (or (and start!106030 b_free!27483) b_lambda!22917)))

(declare-fun b_lambda!22919 () Bool)

(assert (= b_lambda!22909 (or (and start!106030 b_free!27483) b_lambda!22919)))

(declare-fun b_lambda!22921 () Bool)

(assert (= b_lambda!22905 (or (and start!106030 b_free!27483) b_lambda!22921)))

(check-sat (not b!1262746) (not b!1262760) (not d!138565) (not mapNonEmpty!50401) (not b!1262742) (not b!1262823) (not b!1262853) (not b!1262757) (not b!1262751) b_and!45459 (not b_lambda!22921) (not b!1262828) (not b!1262871) (not bm!62115) (not b!1262832) (not b!1262847) (not b!1262825) (not b!1262858) (not b_lambda!22917) (not b!1262709) (not bm!62143) (not b!1262754) (not b_lambda!22919) (not bm!62138) (not b!1262836) (not b!1262769) (not b!1262708) (not bm!62131) (not b_lambda!22911) (not b!1262739) (not b!1262826) tp_is_empty!32385 (not d!138577) (not b!1262758) (not b!1262753) (not d!138575) (not bm!62142) (not b!1262837) (not bm!62114) (not bm!62133) (not b!1262710) (not b!1262762) (not b!1262844) (not b!1262849) (not d!138579) (not d!138563) (not b!1262846) (not b!1262843) (not b!1262756) (not b!1262744) (not b!1262748) (not bm!62140) (not b_lambda!22913) (not bm!62135) (not d!138567) (not b!1262777) (not bm!62136) (not d!138581) (not b!1262743) (not b!1262776) (not bm!62146) (not b!1262740) (not b_lambda!22915) (not b!1262870) (not b!1262857) (not b!1262771) (not b_next!27483) (not b!1262737) (not bm!62111) (not b!1262822))
(check-sat b_and!45459 (not b_next!27483))
