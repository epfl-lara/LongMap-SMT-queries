; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106138 () Bool)

(assert start!106138)

(declare-fun b_free!27517 () Bool)

(declare-fun b_next!27517 () Bool)

(assert (=> start!106138 (= b_free!27517 (not b_next!27517))))

(declare-fun tp!96110 () Bool)

(declare-fun b_and!45507 () Bool)

(assert (=> start!106138 (= tp!96110 b_and!45507)))

(declare-fun b!1263701 () Bool)

(declare-fun e!719499 () Bool)

(declare-fun tp_is_empty!32419 () Bool)

(assert (=> b!1263701 (= e!719499 tp_is_empty!32419)))

(declare-fun b!1263702 () Bool)

(declare-fun e!719501 () Bool)

(declare-fun e!719498 () Bool)

(assert (=> b!1263702 (= e!719501 e!719498)))

(declare-fun res!841687 () Bool)

(assert (=> b!1263702 (=> res!841687 e!719498)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263702 (= res!841687 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263703 () Bool)

(declare-fun res!841690 () Bool)

(declare-fun e!719495 () Bool)

(assert (=> b!1263703 (=> (not res!841690) (not e!719495))))

(declare-datatypes ((array!82387 0))(
  ( (array!82388 (arr!39738 (Array (_ BitVec 32) (_ BitVec 64))) (size!40276 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82387)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82387 (_ BitVec 32)) Bool)

(assert (=> b!1263703 (= res!841690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!841691 () Bool)

(assert (=> start!106138 (=> (not res!841691) (not e!719495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106138 (= res!841691 (validMask!0 mask!1466))))

(assert (=> start!106138 e!719495))

(assert (=> start!106138 true))

(assert (=> start!106138 tp!96110))

(assert (=> start!106138 tp_is_empty!32419))

(declare-fun array_inv!30403 (array!82387) Bool)

(assert (=> start!106138 (array_inv!30403 _keys!1118)))

(declare-datatypes ((V!48591 0))(
  ( (V!48592 (val!16272 Int)) )
))
(declare-datatypes ((ValueCell!15446 0))(
  ( (ValueCellFull!15446 (v!18983 V!48591)) (EmptyCell!15446) )
))
(declare-datatypes ((array!82389 0))(
  ( (array!82390 (arr!39739 (Array (_ BitVec 32) ValueCell!15446)) (size!40277 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82389)

(declare-fun e!719502 () Bool)

(declare-fun array_inv!30404 (array!82389) Bool)

(assert (=> start!106138 (and (array_inv!30404 _values!914) e!719502)))

(declare-fun mapIsEmpty!50458 () Bool)

(declare-fun mapRes!50458 () Bool)

(assert (=> mapIsEmpty!50458 mapRes!50458))

(declare-fun mapNonEmpty!50458 () Bool)

(declare-fun tp!96109 () Bool)

(declare-fun e!719496 () Bool)

(assert (=> mapNonEmpty!50458 (= mapRes!50458 (and tp!96109 e!719496))))

(declare-fun mapValue!50458 () ValueCell!15446)

(declare-fun mapRest!50458 () (Array (_ BitVec 32) ValueCell!15446))

(declare-fun mapKey!50458 () (_ BitVec 32))

(assert (=> mapNonEmpty!50458 (= (arr!39739 _values!914) (store mapRest!50458 mapKey!50458 mapValue!50458))))

(declare-fun b!1263704 () Bool)

(declare-fun e!719497 () Bool)

(assert (=> b!1263704 (= e!719495 (not e!719497))))

(declare-fun res!841685 () Bool)

(assert (=> b!1263704 (=> res!841685 e!719497)))

(assert (=> b!1263704 (= res!841685 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1263704 e!719501))

(declare-fun res!841688 () Bool)

(assert (=> b!1263704 (=> (not res!841688) (not e!719501))))

(declare-datatypes ((tuple2!21148 0))(
  ( (tuple2!21149 (_1!10585 (_ BitVec 64)) (_2!10585 V!48591)) )
))
(declare-datatypes ((List!28343 0))(
  ( (Nil!28340) (Cons!28339 (h!29548 tuple2!21148) (t!41851 List!28343)) )
))
(declare-datatypes ((ListLongMap!19021 0))(
  ( (ListLongMap!19022 (toList!9526 List!28343)) )
))
(declare-fun lt!573064 () ListLongMap!19021)

(declare-fun lt!573065 () ListLongMap!19021)

(assert (=> b!1263704 (= res!841688 (= lt!573064 lt!573065))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48591)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48591)

(declare-fun minValueBefore!43 () V!48591)

(declare-datatypes ((Unit!41971 0))(
  ( (Unit!41972) )
))
(declare-fun lt!573063 () Unit!41971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1191 (array!82387 array!82389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 V!48591 V!48591 (_ BitVec 32) Int) Unit!41971)

(assert (=> b!1263704 (= lt!573063 (lemmaNoChangeToArrayThenSameMapNoExtras!1191 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5891 (array!82387 array!82389 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!19021)

(assert (=> b!1263704 (= lt!573065 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263704 (= lt!573064 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263705 () Bool)

(declare-fun res!841686 () Bool)

(assert (=> b!1263705 (=> (not res!841686) (not e!719495))))

(assert (=> b!1263705 (= res!841686 (and (= (size!40277 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40276 _keys!1118) (size!40277 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263706 () Bool)

(declare-fun getCurrentListMap!4579 (array!82387 array!82389 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!19021)

(declare-fun +!4293 (ListLongMap!19021 tuple2!21148) ListLongMap!19021)

(assert (=> b!1263706 (= e!719498 (= (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4293 (+!4293 lt!573064 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263707 () Bool)

(assert (=> b!1263707 (= e!719497 (= (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4293 lt!573065 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun b!1263708 () Bool)

(declare-fun res!841689 () Bool)

(assert (=> b!1263708 (=> (not res!841689) (not e!719495))))

(declare-datatypes ((List!28344 0))(
  ( (Nil!28341) (Cons!28340 (h!29549 (_ BitVec 64)) (t!41852 List!28344)) )
))
(declare-fun arrayNoDuplicates!0 (array!82387 (_ BitVec 32) List!28344) Bool)

(assert (=> b!1263708 (= res!841689 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28341))))

(declare-fun b!1263709 () Bool)

(assert (=> b!1263709 (= e!719496 tp_is_empty!32419)))

(declare-fun b!1263710 () Bool)

(assert (=> b!1263710 (= e!719502 (and e!719499 mapRes!50458))))

(declare-fun condMapEmpty!50458 () Bool)

(declare-fun mapDefault!50458 () ValueCell!15446)

(assert (=> b!1263710 (= condMapEmpty!50458 (= (arr!39739 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15446)) mapDefault!50458)))))

(assert (= (and start!106138 res!841691) b!1263705))

(assert (= (and b!1263705 res!841686) b!1263703))

(assert (= (and b!1263703 res!841690) b!1263708))

(assert (= (and b!1263708 res!841689) b!1263704))

(assert (= (and b!1263704 res!841688) b!1263702))

(assert (= (and b!1263702 (not res!841687)) b!1263706))

(assert (= (and b!1263704 (not res!841685)) b!1263707))

(assert (= (and b!1263710 condMapEmpty!50458) mapIsEmpty!50458))

(assert (= (and b!1263710 (not condMapEmpty!50458)) mapNonEmpty!50458))

(get-info :version)

(assert (= (and mapNonEmpty!50458 ((_ is ValueCellFull!15446) mapValue!50458)) b!1263709))

(assert (= (and b!1263710 ((_ is ValueCellFull!15446) mapDefault!50458)) b!1263701))

(assert (= start!106138 b!1263710))

(declare-fun m!1163753 () Bool)

(assert (=> b!1263707 m!1163753))

(declare-fun m!1163755 () Bool)

(assert (=> b!1263707 m!1163755))

(declare-fun m!1163757 () Bool)

(assert (=> mapNonEmpty!50458 m!1163757))

(declare-fun m!1163759 () Bool)

(assert (=> b!1263706 m!1163759))

(declare-fun m!1163761 () Bool)

(assert (=> b!1263706 m!1163761))

(assert (=> b!1263706 m!1163761))

(declare-fun m!1163763 () Bool)

(assert (=> b!1263706 m!1163763))

(declare-fun m!1163765 () Bool)

(assert (=> b!1263703 m!1163765))

(declare-fun m!1163767 () Bool)

(assert (=> b!1263708 m!1163767))

(declare-fun m!1163769 () Bool)

(assert (=> start!106138 m!1163769))

(declare-fun m!1163771 () Bool)

(assert (=> start!106138 m!1163771))

(declare-fun m!1163773 () Bool)

(assert (=> start!106138 m!1163773))

(declare-fun m!1163775 () Bool)

(assert (=> b!1263704 m!1163775))

(declare-fun m!1163777 () Bool)

(assert (=> b!1263704 m!1163777))

(declare-fun m!1163779 () Bool)

(assert (=> b!1263704 m!1163779))

(check-sat (not b_next!27517) (not start!106138) b_and!45507 (not mapNonEmpty!50458) (not b!1263706) (not b!1263703) (not b!1263704) (not b!1263707) tp_is_empty!32419 (not b!1263708))
(check-sat b_and!45507 (not b_next!27517))
(get-model)

(declare-fun d!138535 () Bool)

(assert (=> d!138535 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106138 d!138535))

(declare-fun d!138537 () Bool)

(assert (=> d!138537 (= (array_inv!30403 _keys!1118) (bvsge (size!40276 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106138 d!138537))

(declare-fun d!138539 () Bool)

(assert (=> d!138539 (= (array_inv!30404 _values!914) (bvsge (size!40277 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106138 d!138539))

(declare-fun d!138541 () Bool)

(assert (=> d!138541 (= (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573086 () Unit!41971)

(declare-fun choose!1887 (array!82387 array!82389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 V!48591 V!48591 (_ BitVec 32) Int) Unit!41971)

(assert (=> d!138541 (= lt!573086 (choose!1887 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138541 (validMask!0 mask!1466)))

(assert (=> d!138541 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1191 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573086)))

(declare-fun bs!35726 () Bool)

(assert (= bs!35726 d!138541))

(assert (=> bs!35726 m!1163779))

(assert (=> bs!35726 m!1163777))

(declare-fun m!1163837 () Bool)

(assert (=> bs!35726 m!1163837))

(assert (=> bs!35726 m!1163769))

(assert (=> b!1263704 d!138541))

(declare-fun bm!62237 () Bool)

(declare-fun call!62240 () ListLongMap!19021)

(assert (=> bm!62237 (= call!62240 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138543 () Bool)

(declare-fun e!719568 () Bool)

(assert (=> d!138543 e!719568))

(declare-fun res!841744 () Bool)

(assert (=> d!138543 (=> (not res!841744) (not e!719568))))

(declare-fun lt!573104 () ListLongMap!19021)

(declare-fun contains!7578 (ListLongMap!19021 (_ BitVec 64)) Bool)

(assert (=> d!138543 (= res!841744 (not (contains!7578 lt!573104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719565 () ListLongMap!19021)

(assert (=> d!138543 (= lt!573104 e!719565)))

(declare-fun c!123034 () Bool)

(assert (=> d!138543 (= c!123034 (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138543 (validMask!0 mask!1466)))

(assert (=> d!138543 (= (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573104)))

(declare-fun b!1263795 () Bool)

(assert (=> b!1263795 (= e!719565 (ListLongMap!19022 Nil!28340))))

(declare-fun b!1263796 () Bool)

(declare-fun e!719569 () Bool)

(declare-fun isEmpty!1051 (ListLongMap!19021) Bool)

(assert (=> b!1263796 (= e!719569 (isEmpty!1051 lt!573104))))

(declare-fun b!1263797 () Bool)

(declare-fun e!719566 () ListLongMap!19021)

(assert (=> b!1263797 (= e!719566 call!62240)))

(declare-fun b!1263798 () Bool)

(assert (=> b!1263798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> b!1263798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40277 _values!914)))))

(declare-fun e!719570 () Bool)

(declare-fun apply!996 (ListLongMap!19021 (_ BitVec 64)) V!48591)

(declare-fun get!20295 (ValueCell!15446 V!48591) V!48591)

(declare-fun dynLambda!3426 (Int (_ BitVec 64)) V!48591)

(assert (=> b!1263798 (= e!719570 (= (apply!996 lt!573104 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263799 () Bool)

(declare-fun res!841743 () Bool)

(assert (=> b!1263799 (=> (not res!841743) (not e!719568))))

(assert (=> b!1263799 (= res!841743 (not (contains!7578 lt!573104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263800 () Bool)

(assert (=> b!1263800 (= e!719569 (= lt!573104 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263801 () Bool)

(declare-fun e!719571 () Bool)

(assert (=> b!1263801 (= e!719571 e!719569)))

(declare-fun c!123033 () Bool)

(assert (=> b!1263801 (= c!123033 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263802 () Bool)

(assert (=> b!1263802 (= e!719568 e!719571)))

(declare-fun c!123035 () Bool)

(declare-fun e!719567 () Bool)

(assert (=> b!1263802 (= c!123035 e!719567)))

(declare-fun res!841742 () Bool)

(assert (=> b!1263802 (=> (not res!841742) (not e!719567))))

(assert (=> b!1263802 (= res!841742 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263803 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263803 (= e!719567 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263803 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263804 () Bool)

(declare-fun lt!573102 () Unit!41971)

(declare-fun lt!573106 () Unit!41971)

(assert (=> b!1263804 (= lt!573102 lt!573106)))

(declare-fun lt!573101 () ListLongMap!19021)

(declare-fun lt!573105 () (_ BitVec 64))

(declare-fun lt!573103 () (_ BitVec 64))

(declare-fun lt!573107 () V!48591)

(assert (=> b!1263804 (not (contains!7578 (+!4293 lt!573101 (tuple2!21149 lt!573105 lt!573107)) lt!573103))))

(declare-fun addStillNotContains!332 (ListLongMap!19021 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!41971)

(assert (=> b!1263804 (= lt!573106 (addStillNotContains!332 lt!573101 lt!573105 lt!573107 lt!573103))))

(assert (=> b!1263804 (= lt!573103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263804 (= lt!573107 (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263804 (= lt!573105 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263804 (= lt!573101 call!62240)))

(assert (=> b!1263804 (= e!719566 (+!4293 call!62240 (tuple2!21149 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263805 () Bool)

(assert (=> b!1263805 (= e!719571 e!719570)))

(assert (=> b!1263805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun res!841745 () Bool)

(assert (=> b!1263805 (= res!841745 (contains!7578 lt!573104 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263805 (=> (not res!841745) (not e!719570))))

(declare-fun b!1263806 () Bool)

(assert (=> b!1263806 (= e!719565 e!719566)))

(declare-fun c!123032 () Bool)

(assert (=> b!1263806 (= c!123032 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138543 c!123034) b!1263795))

(assert (= (and d!138543 (not c!123034)) b!1263806))

(assert (= (and b!1263806 c!123032) b!1263804))

(assert (= (and b!1263806 (not c!123032)) b!1263797))

(assert (= (or b!1263804 b!1263797) bm!62237))

(assert (= (and d!138543 res!841744) b!1263799))

(assert (= (and b!1263799 res!841743) b!1263802))

(assert (= (and b!1263802 res!841742) b!1263803))

(assert (= (and b!1263802 c!123035) b!1263805))

(assert (= (and b!1263802 (not c!123035)) b!1263801))

(assert (= (and b!1263805 res!841745) b!1263798))

(assert (= (and b!1263801 c!123033) b!1263800))

(assert (= (and b!1263801 (not c!123033)) b!1263796))

(declare-fun b_lambda!22981 () Bool)

(assert (=> (not b_lambda!22981) (not b!1263798)))

(declare-fun t!41856 () Bool)

(declare-fun tb!11325 () Bool)

(assert (=> (and start!106138 (= defaultEntry!922 defaultEntry!922) t!41856) tb!11325))

(declare-fun result!23399 () Bool)

(assert (=> tb!11325 (= result!23399 tp_is_empty!32419)))

(assert (=> b!1263798 t!41856))

(declare-fun b_and!45513 () Bool)

(assert (= b_and!45507 (and (=> t!41856 result!23399) b_and!45513)))

(declare-fun b_lambda!22983 () Bool)

(assert (=> (not b_lambda!22983) (not b!1263804)))

(assert (=> b!1263804 t!41856))

(declare-fun b_and!45515 () Bool)

(assert (= b_and!45513 (and (=> t!41856 result!23399) b_and!45515)))

(declare-fun m!1163839 () Bool)

(assert (=> bm!62237 m!1163839))

(declare-fun m!1163841 () Bool)

(assert (=> b!1263805 m!1163841))

(assert (=> b!1263805 m!1163841))

(declare-fun m!1163843 () Bool)

(assert (=> b!1263805 m!1163843))

(declare-fun m!1163845 () Bool)

(assert (=> b!1263796 m!1163845))

(declare-fun m!1163847 () Bool)

(assert (=> b!1263804 m!1163847))

(declare-fun m!1163849 () Bool)

(assert (=> b!1263804 m!1163849))

(declare-fun m!1163851 () Bool)

(assert (=> b!1263804 m!1163851))

(declare-fun m!1163853 () Bool)

(assert (=> b!1263804 m!1163853))

(declare-fun m!1163855 () Bool)

(assert (=> b!1263804 m!1163855))

(declare-fun m!1163857 () Bool)

(assert (=> b!1263804 m!1163857))

(assert (=> b!1263804 m!1163849))

(declare-fun m!1163859 () Bool)

(assert (=> b!1263804 m!1163859))

(assert (=> b!1263804 m!1163853))

(assert (=> b!1263804 m!1163841))

(assert (=> b!1263804 m!1163847))

(declare-fun m!1163861 () Bool)

(assert (=> d!138543 m!1163861))

(assert (=> d!138543 m!1163769))

(assert (=> b!1263806 m!1163841))

(assert (=> b!1263806 m!1163841))

(declare-fun m!1163863 () Bool)

(assert (=> b!1263806 m!1163863))

(assert (=> b!1263800 m!1163839))

(declare-fun m!1163865 () Bool)

(assert (=> b!1263799 m!1163865))

(assert (=> b!1263798 m!1163841))

(declare-fun m!1163867 () Bool)

(assert (=> b!1263798 m!1163867))

(assert (=> b!1263798 m!1163847))

(assert (=> b!1263798 m!1163849))

(assert (=> b!1263798 m!1163851))

(assert (=> b!1263798 m!1163849))

(assert (=> b!1263798 m!1163841))

(assert (=> b!1263798 m!1163847))

(assert (=> b!1263803 m!1163841))

(assert (=> b!1263803 m!1163841))

(assert (=> b!1263803 m!1163863))

(assert (=> b!1263704 d!138543))

(declare-fun call!62241 () ListLongMap!19021)

(declare-fun bm!62238 () Bool)

(assert (=> bm!62238 (= call!62241 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138545 () Bool)

(declare-fun e!719575 () Bool)

(assert (=> d!138545 e!719575))

(declare-fun res!841748 () Bool)

(assert (=> d!138545 (=> (not res!841748) (not e!719575))))

(declare-fun lt!573111 () ListLongMap!19021)

(assert (=> d!138545 (= res!841748 (not (contains!7578 lt!573111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719572 () ListLongMap!19021)

(assert (=> d!138545 (= lt!573111 e!719572)))

(declare-fun c!123038 () Bool)

(assert (=> d!138545 (= c!123038 (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138545 (validMask!0 mask!1466)))

(assert (=> d!138545 (= (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573111)))

(declare-fun b!1263809 () Bool)

(assert (=> b!1263809 (= e!719572 (ListLongMap!19022 Nil!28340))))

(declare-fun b!1263810 () Bool)

(declare-fun e!719576 () Bool)

(assert (=> b!1263810 (= e!719576 (isEmpty!1051 lt!573111))))

(declare-fun b!1263811 () Bool)

(declare-fun e!719573 () ListLongMap!19021)

(assert (=> b!1263811 (= e!719573 call!62241)))

(declare-fun b!1263812 () Bool)

(assert (=> b!1263812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> b!1263812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40277 _values!914)))))

(declare-fun e!719577 () Bool)

(assert (=> b!1263812 (= e!719577 (= (apply!996 lt!573111 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263813 () Bool)

(declare-fun res!841747 () Bool)

(assert (=> b!1263813 (=> (not res!841747) (not e!719575))))

(assert (=> b!1263813 (= res!841747 (not (contains!7578 lt!573111 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263814 () Bool)

(assert (=> b!1263814 (= e!719576 (= lt!573111 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263815 () Bool)

(declare-fun e!719578 () Bool)

(assert (=> b!1263815 (= e!719578 e!719576)))

(declare-fun c!123037 () Bool)

(assert (=> b!1263815 (= c!123037 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263816 () Bool)

(assert (=> b!1263816 (= e!719575 e!719578)))

(declare-fun c!123039 () Bool)

(declare-fun e!719574 () Bool)

(assert (=> b!1263816 (= c!123039 e!719574)))

(declare-fun res!841746 () Bool)

(assert (=> b!1263816 (=> (not res!841746) (not e!719574))))

(assert (=> b!1263816 (= res!841746 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263817 () Bool)

(assert (=> b!1263817 (= e!719574 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263817 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263818 () Bool)

(declare-fun lt!573109 () Unit!41971)

(declare-fun lt!573113 () Unit!41971)

(assert (=> b!1263818 (= lt!573109 lt!573113)))

(declare-fun lt!573110 () (_ BitVec 64))

(declare-fun lt!573114 () V!48591)

(declare-fun lt!573108 () ListLongMap!19021)

(declare-fun lt!573112 () (_ BitVec 64))

(assert (=> b!1263818 (not (contains!7578 (+!4293 lt!573108 (tuple2!21149 lt!573112 lt!573114)) lt!573110))))

(assert (=> b!1263818 (= lt!573113 (addStillNotContains!332 lt!573108 lt!573112 lt!573114 lt!573110))))

(assert (=> b!1263818 (= lt!573110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263818 (= lt!573114 (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263818 (= lt!573112 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263818 (= lt!573108 call!62241)))

(assert (=> b!1263818 (= e!719573 (+!4293 call!62241 (tuple2!21149 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263819 () Bool)

(assert (=> b!1263819 (= e!719578 e!719577)))

(assert (=> b!1263819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun res!841749 () Bool)

(assert (=> b!1263819 (= res!841749 (contains!7578 lt!573111 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263819 (=> (not res!841749) (not e!719577))))

(declare-fun b!1263820 () Bool)

(assert (=> b!1263820 (= e!719572 e!719573)))

(declare-fun c!123036 () Bool)

(assert (=> b!1263820 (= c!123036 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138545 c!123038) b!1263809))

(assert (= (and d!138545 (not c!123038)) b!1263820))

(assert (= (and b!1263820 c!123036) b!1263818))

(assert (= (and b!1263820 (not c!123036)) b!1263811))

(assert (= (or b!1263818 b!1263811) bm!62238))

(assert (= (and d!138545 res!841748) b!1263813))

(assert (= (and b!1263813 res!841747) b!1263816))

(assert (= (and b!1263816 res!841746) b!1263817))

(assert (= (and b!1263816 c!123039) b!1263819))

(assert (= (and b!1263816 (not c!123039)) b!1263815))

(assert (= (and b!1263819 res!841749) b!1263812))

(assert (= (and b!1263815 c!123037) b!1263814))

(assert (= (and b!1263815 (not c!123037)) b!1263810))

(declare-fun b_lambda!22985 () Bool)

(assert (=> (not b_lambda!22985) (not b!1263812)))

(assert (=> b!1263812 t!41856))

(declare-fun b_and!45517 () Bool)

(assert (= b_and!45515 (and (=> t!41856 result!23399) b_and!45517)))

(declare-fun b_lambda!22987 () Bool)

(assert (=> (not b_lambda!22987) (not b!1263818)))

(assert (=> b!1263818 t!41856))

(declare-fun b_and!45519 () Bool)

(assert (= b_and!45517 (and (=> t!41856 result!23399) b_and!45519)))

(declare-fun m!1163869 () Bool)

(assert (=> bm!62238 m!1163869))

(assert (=> b!1263819 m!1163841))

(assert (=> b!1263819 m!1163841))

(declare-fun m!1163871 () Bool)

(assert (=> b!1263819 m!1163871))

(declare-fun m!1163873 () Bool)

(assert (=> b!1263810 m!1163873))

(assert (=> b!1263818 m!1163847))

(assert (=> b!1263818 m!1163849))

(assert (=> b!1263818 m!1163851))

(declare-fun m!1163875 () Bool)

(assert (=> b!1263818 m!1163875))

(declare-fun m!1163877 () Bool)

(assert (=> b!1263818 m!1163877))

(declare-fun m!1163879 () Bool)

(assert (=> b!1263818 m!1163879))

(assert (=> b!1263818 m!1163849))

(declare-fun m!1163881 () Bool)

(assert (=> b!1263818 m!1163881))

(assert (=> b!1263818 m!1163875))

(assert (=> b!1263818 m!1163841))

(assert (=> b!1263818 m!1163847))

(declare-fun m!1163883 () Bool)

(assert (=> d!138545 m!1163883))

(assert (=> d!138545 m!1163769))

(assert (=> b!1263820 m!1163841))

(assert (=> b!1263820 m!1163841))

(assert (=> b!1263820 m!1163863))

(assert (=> b!1263814 m!1163869))

(declare-fun m!1163885 () Bool)

(assert (=> b!1263813 m!1163885))

(assert (=> b!1263812 m!1163841))

(declare-fun m!1163887 () Bool)

(assert (=> b!1263812 m!1163887))

(assert (=> b!1263812 m!1163847))

(assert (=> b!1263812 m!1163849))

(assert (=> b!1263812 m!1163851))

(assert (=> b!1263812 m!1163849))

(assert (=> b!1263812 m!1163841))

(assert (=> b!1263812 m!1163847))

(assert (=> b!1263817 m!1163841))

(assert (=> b!1263817 m!1163841))

(assert (=> b!1263817 m!1163863))

(assert (=> b!1263704 d!138545))

(declare-fun bm!62241 () Bool)

(declare-fun call!62244 () Bool)

(declare-fun c!123042 () Bool)

(assert (=> bm!62241 (= call!62244 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123042 (Cons!28340 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000) Nil!28341) Nil!28341)))))

(declare-fun b!1263831 () Bool)

(declare-fun e!719589 () Bool)

(declare-fun e!719587 () Bool)

(assert (=> b!1263831 (= e!719589 e!719587)))

(declare-fun res!841756 () Bool)

(assert (=> b!1263831 (=> (not res!841756) (not e!719587))))

(declare-fun e!719590 () Bool)

(assert (=> b!1263831 (= res!841756 (not e!719590))))

(declare-fun res!841758 () Bool)

(assert (=> b!1263831 (=> (not res!841758) (not e!719590))))

(assert (=> b!1263831 (= res!841758 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263832 () Bool)

(declare-fun e!719588 () Bool)

(assert (=> b!1263832 (= e!719588 call!62244)))

(declare-fun d!138547 () Bool)

(declare-fun res!841757 () Bool)

(assert (=> d!138547 (=> res!841757 e!719589)))

(assert (=> d!138547 (= res!841757 (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138547 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28341) e!719589)))

(declare-fun b!1263833 () Bool)

(declare-fun contains!7579 (List!28344 (_ BitVec 64)) Bool)

(assert (=> b!1263833 (= e!719590 (contains!7579 Nil!28341 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263834 () Bool)

(assert (=> b!1263834 (= e!719588 call!62244)))

(declare-fun b!1263835 () Bool)

(assert (=> b!1263835 (= e!719587 e!719588)))

(assert (=> b!1263835 (= c!123042 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138547 (not res!841757)) b!1263831))

(assert (= (and b!1263831 res!841758) b!1263833))

(assert (= (and b!1263831 res!841756) b!1263835))

(assert (= (and b!1263835 c!123042) b!1263834))

(assert (= (and b!1263835 (not c!123042)) b!1263832))

(assert (= (or b!1263834 b!1263832) bm!62241))

(assert (=> bm!62241 m!1163841))

(declare-fun m!1163889 () Bool)

(assert (=> bm!62241 m!1163889))

(assert (=> b!1263831 m!1163841))

(assert (=> b!1263831 m!1163841))

(assert (=> b!1263831 m!1163863))

(assert (=> b!1263833 m!1163841))

(assert (=> b!1263833 m!1163841))

(declare-fun m!1163891 () Bool)

(assert (=> b!1263833 m!1163891))

(assert (=> b!1263835 m!1163841))

(assert (=> b!1263835 m!1163841))

(assert (=> b!1263835 m!1163863))

(assert (=> b!1263708 d!138547))

(declare-fun b!1263878 () Bool)

(declare-fun e!719625 () Unit!41971)

(declare-fun Unit!41975 () Unit!41971)

(assert (=> b!1263878 (= e!719625 Unit!41975)))

(declare-fun bm!62256 () Bool)

(declare-fun call!62261 () ListLongMap!19021)

(assert (=> bm!62256 (= call!62261 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263879 () Bool)

(declare-fun res!841777 () Bool)

(declare-fun e!719628 () Bool)

(assert (=> b!1263879 (=> (not res!841777) (not e!719628))))

(declare-fun e!719624 () Bool)

(assert (=> b!1263879 (= res!841777 e!719624)))

(declare-fun c!123058 () Bool)

(assert (=> b!1263879 (= c!123058 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62257 () Bool)

(declare-fun call!62262 () ListLongMap!19021)

(declare-fun call!62259 () ListLongMap!19021)

(assert (=> bm!62257 (= call!62262 call!62259)))

(declare-fun b!1263880 () Bool)

(declare-fun e!719622 () Bool)

(declare-fun call!62263 () Bool)

(assert (=> b!1263880 (= e!719622 (not call!62263))))

(declare-fun b!1263881 () Bool)

(declare-fun e!719619 () ListLongMap!19021)

(declare-fun e!719629 () ListLongMap!19021)

(assert (=> b!1263881 (= e!719619 e!719629)))

(declare-fun c!123057 () Bool)

(assert (=> b!1263881 (= c!123057 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263882 () Bool)

(declare-fun call!62265 () ListLongMap!19021)

(assert (=> b!1263882 (= e!719629 call!62265)))

(declare-fun bm!62258 () Bool)

(declare-fun lt!573161 () ListLongMap!19021)

(assert (=> bm!62258 (= call!62263 (contains!7578 lt!573161 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263883 () Bool)

(declare-fun c!123055 () Bool)

(assert (=> b!1263883 (= c!123055 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719618 () ListLongMap!19021)

(assert (=> b!1263883 (= e!719629 e!719618)))

(declare-fun bm!62259 () Bool)

(assert (=> bm!62259 (= call!62259 call!62261)))

(declare-fun b!1263885 () Bool)

(declare-fun e!719627 () Bool)

(assert (=> b!1263885 (= e!719622 e!719627)))

(declare-fun res!841785 () Bool)

(assert (=> b!1263885 (= res!841785 call!62263)))

(assert (=> b!1263885 (=> (not res!841785) (not e!719627))))

(declare-fun b!1263886 () Bool)

(declare-fun e!719621 () Bool)

(assert (=> b!1263886 (= e!719621 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263887 () Bool)

(declare-fun e!719620 () Bool)

(assert (=> b!1263887 (= e!719624 e!719620)))

(declare-fun res!841783 () Bool)

(declare-fun call!62260 () Bool)

(assert (=> b!1263887 (= res!841783 call!62260)))

(assert (=> b!1263887 (=> (not res!841783) (not e!719620))))

(declare-fun b!1263888 () Bool)

(assert (=> b!1263888 (= e!719627 (= (apply!996 lt!573161 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263889 () Bool)

(declare-fun res!841782 () Bool)

(assert (=> b!1263889 (=> (not res!841782) (not e!719628))))

(declare-fun e!719626 () Bool)

(assert (=> b!1263889 (= res!841782 e!719626)))

(declare-fun res!841780 () Bool)

(assert (=> b!1263889 (=> res!841780 e!719626)))

(assert (=> b!1263889 (= res!841780 (not e!719621))))

(declare-fun res!841784 () Bool)

(assert (=> b!1263889 (=> (not res!841784) (not e!719621))))

(assert (=> b!1263889 (= res!841784 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263890 () Bool)

(assert (=> b!1263890 (= e!719624 (not call!62260))))

(declare-fun b!1263891 () Bool)

(declare-fun call!62264 () ListLongMap!19021)

(assert (=> b!1263891 (= e!719619 (+!4293 call!62264 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263892 () Bool)

(assert (=> b!1263892 (= e!719620 (= (apply!996 lt!573161 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun d!138549 () Bool)

(assert (=> d!138549 e!719628))

(declare-fun res!841778 () Bool)

(assert (=> d!138549 (=> (not res!841778) (not e!719628))))

(assert (=> d!138549 (= res!841778 (or (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))))

(declare-fun lt!573168 () ListLongMap!19021)

(assert (=> d!138549 (= lt!573161 lt!573168)))

(declare-fun lt!573178 () Unit!41971)

(assert (=> d!138549 (= lt!573178 e!719625)))

(declare-fun c!123059 () Bool)

(declare-fun e!719617 () Bool)

(assert (=> d!138549 (= c!123059 e!719617)))

(declare-fun res!841781 () Bool)

(assert (=> d!138549 (=> (not res!841781) (not e!719617))))

(assert (=> d!138549 (= res!841781 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138549 (= lt!573168 e!719619)))

(declare-fun c!123056 () Bool)

(assert (=> d!138549 (= c!123056 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138549 (validMask!0 mask!1466)))

(assert (=> d!138549 (= (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573161)))

(declare-fun b!1263884 () Bool)

(assert (=> b!1263884 (= e!719618 call!62265)))

(declare-fun bm!62260 () Bool)

(assert (=> bm!62260 (= call!62265 call!62264)))

(declare-fun b!1263893 () Bool)

(declare-fun lt!573163 () Unit!41971)

(assert (=> b!1263893 (= e!719625 lt!573163)))

(declare-fun lt!573180 () ListLongMap!19021)

(assert (=> b!1263893 (= lt!573180 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573177 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573162 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573162 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573167 () Unit!41971)

(declare-fun addStillContains!1093 (ListLongMap!19021 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!41971)

(assert (=> b!1263893 (= lt!573167 (addStillContains!1093 lt!573180 lt!573177 zeroValue!871 lt!573162))))

(assert (=> b!1263893 (contains!7578 (+!4293 lt!573180 (tuple2!21149 lt!573177 zeroValue!871)) lt!573162)))

(declare-fun lt!573170 () Unit!41971)

(assert (=> b!1263893 (= lt!573170 lt!573167)))

(declare-fun lt!573176 () ListLongMap!19021)

(assert (=> b!1263893 (= lt!573176 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573169 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573169 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573165 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573165 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573159 () Unit!41971)

(declare-fun addApplyDifferent!536 (ListLongMap!19021 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!41971)

(assert (=> b!1263893 (= lt!573159 (addApplyDifferent!536 lt!573176 lt!573169 minValueAfter!43 lt!573165))))

(assert (=> b!1263893 (= (apply!996 (+!4293 lt!573176 (tuple2!21149 lt!573169 minValueAfter!43)) lt!573165) (apply!996 lt!573176 lt!573165))))

(declare-fun lt!573166 () Unit!41971)

(assert (=> b!1263893 (= lt!573166 lt!573159)))

(declare-fun lt!573160 () ListLongMap!19021)

(assert (=> b!1263893 (= lt!573160 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573175 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573164 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573164 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573179 () Unit!41971)

(assert (=> b!1263893 (= lt!573179 (addApplyDifferent!536 lt!573160 lt!573175 zeroValue!871 lt!573164))))

(assert (=> b!1263893 (= (apply!996 (+!4293 lt!573160 (tuple2!21149 lt!573175 zeroValue!871)) lt!573164) (apply!996 lt!573160 lt!573164))))

(declare-fun lt!573171 () Unit!41971)

(assert (=> b!1263893 (= lt!573171 lt!573179)))

(declare-fun lt!573173 () ListLongMap!19021)

(assert (=> b!1263893 (= lt!573173 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573172 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573174 () (_ BitVec 64))

(assert (=> b!1263893 (= lt!573174 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263893 (= lt!573163 (addApplyDifferent!536 lt!573173 lt!573172 minValueAfter!43 lt!573174))))

(assert (=> b!1263893 (= (apply!996 (+!4293 lt!573173 (tuple2!21149 lt!573172 minValueAfter!43)) lt!573174) (apply!996 lt!573173 lt!573174))))

(declare-fun b!1263894 () Bool)

(assert (=> b!1263894 (= e!719618 call!62262)))

(declare-fun bm!62261 () Bool)

(assert (=> bm!62261 (= call!62264 (+!4293 (ite c!123056 call!62261 (ite c!123057 call!62259 call!62262)) (ite (or c!123056 c!123057) (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263895 () Bool)

(declare-fun e!719623 () Bool)

(assert (=> b!1263895 (= e!719623 (= (apply!996 lt!573161 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40277 _values!914)))))

(assert (=> b!1263895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263896 () Bool)

(assert (=> b!1263896 (= e!719626 e!719623)))

(declare-fun res!841779 () Bool)

(assert (=> b!1263896 (=> (not res!841779) (not e!719623))))

(assert (=> b!1263896 (= res!841779 (contains!7578 lt!573161 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun bm!62262 () Bool)

(assert (=> bm!62262 (= call!62260 (contains!7578 lt!573161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263897 () Bool)

(assert (=> b!1263897 (= e!719628 e!719622)))

(declare-fun c!123060 () Bool)

(assert (=> b!1263897 (= c!123060 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263898 () Bool)

(assert (=> b!1263898 (= e!719617 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138549 c!123056) b!1263891))

(assert (= (and d!138549 (not c!123056)) b!1263881))

(assert (= (and b!1263881 c!123057) b!1263882))

(assert (= (and b!1263881 (not c!123057)) b!1263883))

(assert (= (and b!1263883 c!123055) b!1263884))

(assert (= (and b!1263883 (not c!123055)) b!1263894))

(assert (= (or b!1263884 b!1263894) bm!62257))

(assert (= (or b!1263882 bm!62257) bm!62259))

(assert (= (or b!1263882 b!1263884) bm!62260))

(assert (= (or b!1263891 bm!62259) bm!62256))

(assert (= (or b!1263891 bm!62260) bm!62261))

(assert (= (and d!138549 res!841781) b!1263898))

(assert (= (and d!138549 c!123059) b!1263893))

(assert (= (and d!138549 (not c!123059)) b!1263878))

(assert (= (and d!138549 res!841778) b!1263889))

(assert (= (and b!1263889 res!841784) b!1263886))

(assert (= (and b!1263889 (not res!841780)) b!1263896))

(assert (= (and b!1263896 res!841779) b!1263895))

(assert (= (and b!1263889 res!841782) b!1263879))

(assert (= (and b!1263879 c!123058) b!1263887))

(assert (= (and b!1263879 (not c!123058)) b!1263890))

(assert (= (and b!1263887 res!841783) b!1263892))

(assert (= (or b!1263887 b!1263890) bm!62262))

(assert (= (and b!1263879 res!841777) b!1263897))

(assert (= (and b!1263897 c!123060) b!1263885))

(assert (= (and b!1263897 (not c!123060)) b!1263880))

(assert (= (and b!1263885 res!841785) b!1263888))

(assert (= (or b!1263885 b!1263880) bm!62258))

(declare-fun b_lambda!22989 () Bool)

(assert (=> (not b_lambda!22989) (not b!1263895)))

(assert (=> b!1263895 t!41856))

(declare-fun b_and!45521 () Bool)

(assert (= b_and!45519 (and (=> t!41856 result!23399) b_and!45521)))

(assert (=> b!1263895 m!1163847))

(assert (=> b!1263895 m!1163849))

(assert (=> b!1263895 m!1163851))

(assert (=> b!1263895 m!1163841))

(assert (=> b!1263895 m!1163841))

(declare-fun m!1163893 () Bool)

(assert (=> b!1263895 m!1163893))

(assert (=> b!1263895 m!1163849))

(assert (=> b!1263895 m!1163847))

(assert (=> b!1263886 m!1163841))

(assert (=> b!1263886 m!1163841))

(assert (=> b!1263886 m!1163863))

(assert (=> b!1263898 m!1163841))

(assert (=> b!1263898 m!1163841))

(assert (=> b!1263898 m!1163863))

(assert (=> bm!62256 m!1163777))

(assert (=> d!138549 m!1163769))

(declare-fun m!1163895 () Bool)

(assert (=> bm!62262 m!1163895))

(declare-fun m!1163897 () Bool)

(assert (=> bm!62261 m!1163897))

(declare-fun m!1163899 () Bool)

(assert (=> b!1263891 m!1163899))

(declare-fun m!1163901 () Bool)

(assert (=> b!1263893 m!1163901))

(declare-fun m!1163903 () Bool)

(assert (=> b!1263893 m!1163903))

(declare-fun m!1163905 () Bool)

(assert (=> b!1263893 m!1163905))

(assert (=> b!1263893 m!1163777))

(assert (=> b!1263893 m!1163901))

(declare-fun m!1163907 () Bool)

(assert (=> b!1263893 m!1163907))

(declare-fun m!1163909 () Bool)

(assert (=> b!1263893 m!1163909))

(declare-fun m!1163911 () Bool)

(assert (=> b!1263893 m!1163911))

(declare-fun m!1163913 () Bool)

(assert (=> b!1263893 m!1163913))

(assert (=> b!1263893 m!1163913))

(declare-fun m!1163915 () Bool)

(assert (=> b!1263893 m!1163915))

(assert (=> b!1263893 m!1163909))

(declare-fun m!1163917 () Bool)

(assert (=> b!1263893 m!1163917))

(declare-fun m!1163919 () Bool)

(assert (=> b!1263893 m!1163919))

(declare-fun m!1163921 () Bool)

(assert (=> b!1263893 m!1163921))

(declare-fun m!1163923 () Bool)

(assert (=> b!1263893 m!1163923))

(assert (=> b!1263893 m!1163841))

(declare-fun m!1163925 () Bool)

(assert (=> b!1263893 m!1163925))

(declare-fun m!1163927 () Bool)

(assert (=> b!1263893 m!1163927))

(assert (=> b!1263893 m!1163919))

(declare-fun m!1163929 () Bool)

(assert (=> b!1263893 m!1163929))

(assert (=> b!1263896 m!1163841))

(assert (=> b!1263896 m!1163841))

(declare-fun m!1163931 () Bool)

(assert (=> b!1263896 m!1163931))

(declare-fun m!1163933 () Bool)

(assert (=> b!1263892 m!1163933))

(declare-fun m!1163935 () Bool)

(assert (=> b!1263888 m!1163935))

(declare-fun m!1163937 () Bool)

(assert (=> bm!62258 m!1163937))

(assert (=> b!1263707 d!138549))

(declare-fun d!138551 () Bool)

(declare-fun e!719632 () Bool)

(assert (=> d!138551 e!719632))

(declare-fun res!841790 () Bool)

(assert (=> d!138551 (=> (not res!841790) (not e!719632))))

(declare-fun lt!573192 () ListLongMap!19021)

(assert (=> d!138551 (= res!841790 (contains!7578 lt!573192 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573189 () List!28343)

(assert (=> d!138551 (= lt!573192 (ListLongMap!19022 lt!573189))))

(declare-fun lt!573191 () Unit!41971)

(declare-fun lt!573190 () Unit!41971)

(assert (=> d!138551 (= lt!573191 lt!573190)))

(declare-datatypes ((Option!721 0))(
  ( (Some!720 (v!18986 V!48591)) (None!719) )
))
(declare-fun getValueByKey!670 (List!28343 (_ BitVec 64)) Option!721)

(assert (=> d!138551 (= (getValueByKey!670 lt!573189 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!720 (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lemmaContainsTupThenGetReturnValue!338 (List!28343 (_ BitVec 64) V!48591) Unit!41971)

(assert (=> d!138551 (= lt!573190 (lemmaContainsTupThenGetReturnValue!338 lt!573189 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun insertStrictlySorted!452 (List!28343 (_ BitVec 64) V!48591) List!28343)

(assert (=> d!138551 (= lt!573189 (insertStrictlySorted!452 (toList!9526 lt!573065) (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138551 (= (+!4293 lt!573065 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573192)))

(declare-fun b!1263903 () Bool)

(declare-fun res!841791 () Bool)

(assert (=> b!1263903 (=> (not res!841791) (not e!719632))))

(assert (=> b!1263903 (= res!841791 (= (getValueByKey!670 (toList!9526 lt!573192) (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!720 (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263904 () Bool)

(declare-fun contains!7580 (List!28343 tuple2!21148) Bool)

(assert (=> b!1263904 (= e!719632 (contains!7580 (toList!9526 lt!573192) (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138551 res!841790) b!1263903))

(assert (= (and b!1263903 res!841791) b!1263904))

(declare-fun m!1163939 () Bool)

(assert (=> d!138551 m!1163939))

(declare-fun m!1163941 () Bool)

(assert (=> d!138551 m!1163941))

(declare-fun m!1163943 () Bool)

(assert (=> d!138551 m!1163943))

(declare-fun m!1163945 () Bool)

(assert (=> d!138551 m!1163945))

(declare-fun m!1163947 () Bool)

(assert (=> b!1263903 m!1163947))

(declare-fun m!1163949 () Bool)

(assert (=> b!1263904 m!1163949))

(assert (=> b!1263707 d!138551))

(declare-fun b!1263905 () Bool)

(declare-fun e!719641 () Unit!41971)

(declare-fun Unit!41976 () Unit!41971)

(assert (=> b!1263905 (= e!719641 Unit!41976)))

(declare-fun bm!62263 () Bool)

(declare-fun call!62268 () ListLongMap!19021)

(assert (=> bm!62263 (= call!62268 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263906 () Bool)

(declare-fun res!841792 () Bool)

(declare-fun e!719644 () Bool)

(assert (=> b!1263906 (=> (not res!841792) (not e!719644))))

(declare-fun e!719640 () Bool)

(assert (=> b!1263906 (= res!841792 e!719640)))

(declare-fun c!123064 () Bool)

(assert (=> b!1263906 (= c!123064 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62264 () Bool)

(declare-fun call!62269 () ListLongMap!19021)

(declare-fun call!62266 () ListLongMap!19021)

(assert (=> bm!62264 (= call!62269 call!62266)))

(declare-fun b!1263907 () Bool)

(declare-fun e!719638 () Bool)

(declare-fun call!62270 () Bool)

(assert (=> b!1263907 (= e!719638 (not call!62270))))

(declare-fun b!1263908 () Bool)

(declare-fun e!719635 () ListLongMap!19021)

(declare-fun e!719645 () ListLongMap!19021)

(assert (=> b!1263908 (= e!719635 e!719645)))

(declare-fun c!123063 () Bool)

(assert (=> b!1263908 (= c!123063 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263909 () Bool)

(declare-fun call!62272 () ListLongMap!19021)

(assert (=> b!1263909 (= e!719645 call!62272)))

(declare-fun bm!62265 () Bool)

(declare-fun lt!573195 () ListLongMap!19021)

(assert (=> bm!62265 (= call!62270 (contains!7578 lt!573195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263910 () Bool)

(declare-fun c!123061 () Bool)

(assert (=> b!1263910 (= c!123061 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719634 () ListLongMap!19021)

(assert (=> b!1263910 (= e!719645 e!719634)))

(declare-fun bm!62266 () Bool)

(assert (=> bm!62266 (= call!62266 call!62268)))

(declare-fun b!1263912 () Bool)

(declare-fun e!719643 () Bool)

(assert (=> b!1263912 (= e!719638 e!719643)))

(declare-fun res!841800 () Bool)

(assert (=> b!1263912 (= res!841800 call!62270)))

(assert (=> b!1263912 (=> (not res!841800) (not e!719643))))

(declare-fun b!1263913 () Bool)

(declare-fun e!719637 () Bool)

(assert (=> b!1263913 (= e!719637 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263914 () Bool)

(declare-fun e!719636 () Bool)

(assert (=> b!1263914 (= e!719640 e!719636)))

(declare-fun res!841798 () Bool)

(declare-fun call!62267 () Bool)

(assert (=> b!1263914 (= res!841798 call!62267)))

(assert (=> b!1263914 (=> (not res!841798) (not e!719636))))

(declare-fun b!1263915 () Bool)

(assert (=> b!1263915 (= e!719643 (= (apply!996 lt!573195 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263916 () Bool)

(declare-fun res!841797 () Bool)

(assert (=> b!1263916 (=> (not res!841797) (not e!719644))))

(declare-fun e!719642 () Bool)

(assert (=> b!1263916 (= res!841797 e!719642)))

(declare-fun res!841795 () Bool)

(assert (=> b!1263916 (=> res!841795 e!719642)))

(assert (=> b!1263916 (= res!841795 (not e!719637))))

(declare-fun res!841799 () Bool)

(assert (=> b!1263916 (=> (not res!841799) (not e!719637))))

(assert (=> b!1263916 (= res!841799 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263917 () Bool)

(assert (=> b!1263917 (= e!719640 (not call!62267))))

(declare-fun b!1263918 () Bool)

(declare-fun call!62271 () ListLongMap!19021)

(assert (=> b!1263918 (= e!719635 (+!4293 call!62271 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263919 () Bool)

(assert (=> b!1263919 (= e!719636 (= (apply!996 lt!573195 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun d!138553 () Bool)

(assert (=> d!138553 e!719644))

(declare-fun res!841793 () Bool)

(assert (=> d!138553 (=> (not res!841793) (not e!719644))))

(assert (=> d!138553 (= res!841793 (or (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))))

(declare-fun lt!573202 () ListLongMap!19021)

(assert (=> d!138553 (= lt!573195 lt!573202)))

(declare-fun lt!573212 () Unit!41971)

(assert (=> d!138553 (= lt!573212 e!719641)))

(declare-fun c!123065 () Bool)

(declare-fun e!719633 () Bool)

(assert (=> d!138553 (= c!123065 e!719633)))

(declare-fun res!841796 () Bool)

(assert (=> d!138553 (=> (not res!841796) (not e!719633))))

(assert (=> d!138553 (= res!841796 (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138553 (= lt!573202 e!719635)))

(declare-fun c!123062 () Bool)

(assert (=> d!138553 (= c!123062 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138553 (validMask!0 mask!1466)))

(assert (=> d!138553 (= (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573195)))

(declare-fun b!1263911 () Bool)

(assert (=> b!1263911 (= e!719634 call!62272)))

(declare-fun bm!62267 () Bool)

(assert (=> bm!62267 (= call!62272 call!62271)))

(declare-fun b!1263920 () Bool)

(declare-fun lt!573197 () Unit!41971)

(assert (=> b!1263920 (= e!719641 lt!573197)))

(declare-fun lt!573214 () ListLongMap!19021)

(assert (=> b!1263920 (= lt!573214 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573211 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573196 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573196 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573201 () Unit!41971)

(assert (=> b!1263920 (= lt!573201 (addStillContains!1093 lt!573214 lt!573211 zeroValue!871 lt!573196))))

(assert (=> b!1263920 (contains!7578 (+!4293 lt!573214 (tuple2!21149 lt!573211 zeroValue!871)) lt!573196)))

(declare-fun lt!573204 () Unit!41971)

(assert (=> b!1263920 (= lt!573204 lt!573201)))

(declare-fun lt!573210 () ListLongMap!19021)

(assert (=> b!1263920 (= lt!573210 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573203 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573203 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573199 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573199 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573193 () Unit!41971)

(assert (=> b!1263920 (= lt!573193 (addApplyDifferent!536 lt!573210 lt!573203 minValueBefore!43 lt!573199))))

(assert (=> b!1263920 (= (apply!996 (+!4293 lt!573210 (tuple2!21149 lt!573203 minValueBefore!43)) lt!573199) (apply!996 lt!573210 lt!573199))))

(declare-fun lt!573200 () Unit!41971)

(assert (=> b!1263920 (= lt!573200 lt!573193)))

(declare-fun lt!573194 () ListLongMap!19021)

(assert (=> b!1263920 (= lt!573194 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573209 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573198 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573198 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573213 () Unit!41971)

(assert (=> b!1263920 (= lt!573213 (addApplyDifferent!536 lt!573194 lt!573209 zeroValue!871 lt!573198))))

(assert (=> b!1263920 (= (apply!996 (+!4293 lt!573194 (tuple2!21149 lt!573209 zeroValue!871)) lt!573198) (apply!996 lt!573194 lt!573198))))

(declare-fun lt!573205 () Unit!41971)

(assert (=> b!1263920 (= lt!573205 lt!573213)))

(declare-fun lt!573207 () ListLongMap!19021)

(assert (=> b!1263920 (= lt!573207 (getCurrentListMapNoExtraKeys!5891 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573206 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573208 () (_ BitVec 64))

(assert (=> b!1263920 (= lt!573208 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263920 (= lt!573197 (addApplyDifferent!536 lt!573207 lt!573206 minValueBefore!43 lt!573208))))

(assert (=> b!1263920 (= (apply!996 (+!4293 lt!573207 (tuple2!21149 lt!573206 minValueBefore!43)) lt!573208) (apply!996 lt!573207 lt!573208))))

(declare-fun b!1263921 () Bool)

(assert (=> b!1263921 (= e!719634 call!62269)))

(declare-fun bm!62268 () Bool)

(assert (=> bm!62268 (= call!62271 (+!4293 (ite c!123062 call!62268 (ite c!123063 call!62266 call!62269)) (ite (or c!123062 c!123063) (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263922 () Bool)

(declare-fun e!719639 () Bool)

(assert (=> b!1263922 (= e!719639 (= (apply!996 lt!573195 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)) (get!20295 (select (arr!39739 _values!914) #b00000000000000000000000000000000) (dynLambda!3426 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40277 _values!914)))))

(assert (=> b!1263922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun b!1263923 () Bool)

(assert (=> b!1263923 (= e!719642 e!719639)))

(declare-fun res!841794 () Bool)

(assert (=> b!1263923 (=> (not res!841794) (not e!719639))))

(assert (=> b!1263923 (= res!841794 (contains!7578 lt!573195 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(declare-fun bm!62269 () Bool)

(assert (=> bm!62269 (= call!62267 (contains!7578 lt!573195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263924 () Bool)

(assert (=> b!1263924 (= e!719644 e!719638)))

(declare-fun c!123066 () Bool)

(assert (=> b!1263924 (= c!123066 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263925 () Bool)

(assert (=> b!1263925 (= e!719633 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138553 c!123062) b!1263918))

(assert (= (and d!138553 (not c!123062)) b!1263908))

(assert (= (and b!1263908 c!123063) b!1263909))

(assert (= (and b!1263908 (not c!123063)) b!1263910))

(assert (= (and b!1263910 c!123061) b!1263911))

(assert (= (and b!1263910 (not c!123061)) b!1263921))

(assert (= (or b!1263911 b!1263921) bm!62264))

(assert (= (or b!1263909 bm!62264) bm!62266))

(assert (= (or b!1263909 b!1263911) bm!62267))

(assert (= (or b!1263918 bm!62266) bm!62263))

(assert (= (or b!1263918 bm!62267) bm!62268))

(assert (= (and d!138553 res!841796) b!1263925))

(assert (= (and d!138553 c!123065) b!1263920))

(assert (= (and d!138553 (not c!123065)) b!1263905))

(assert (= (and d!138553 res!841793) b!1263916))

(assert (= (and b!1263916 res!841799) b!1263913))

(assert (= (and b!1263916 (not res!841795)) b!1263923))

(assert (= (and b!1263923 res!841794) b!1263922))

(assert (= (and b!1263916 res!841797) b!1263906))

(assert (= (and b!1263906 c!123064) b!1263914))

(assert (= (and b!1263906 (not c!123064)) b!1263917))

(assert (= (and b!1263914 res!841798) b!1263919))

(assert (= (or b!1263914 b!1263917) bm!62269))

(assert (= (and b!1263906 res!841792) b!1263924))

(assert (= (and b!1263924 c!123066) b!1263912))

(assert (= (and b!1263924 (not c!123066)) b!1263907))

(assert (= (and b!1263912 res!841800) b!1263915))

(assert (= (or b!1263912 b!1263907) bm!62265))

(declare-fun b_lambda!22991 () Bool)

(assert (=> (not b_lambda!22991) (not b!1263922)))

(assert (=> b!1263922 t!41856))

(declare-fun b_and!45523 () Bool)

(assert (= b_and!45521 (and (=> t!41856 result!23399) b_and!45523)))

(assert (=> b!1263922 m!1163847))

(assert (=> b!1263922 m!1163849))

(assert (=> b!1263922 m!1163851))

(assert (=> b!1263922 m!1163841))

(assert (=> b!1263922 m!1163841))

(declare-fun m!1163951 () Bool)

(assert (=> b!1263922 m!1163951))

(assert (=> b!1263922 m!1163849))

(assert (=> b!1263922 m!1163847))

(assert (=> b!1263913 m!1163841))

(assert (=> b!1263913 m!1163841))

(assert (=> b!1263913 m!1163863))

(assert (=> b!1263925 m!1163841))

(assert (=> b!1263925 m!1163841))

(assert (=> b!1263925 m!1163863))

(assert (=> bm!62263 m!1163779))

(assert (=> d!138553 m!1163769))

(declare-fun m!1163953 () Bool)

(assert (=> bm!62269 m!1163953))

(declare-fun m!1163955 () Bool)

(assert (=> bm!62268 m!1163955))

(declare-fun m!1163957 () Bool)

(assert (=> b!1263918 m!1163957))

(declare-fun m!1163959 () Bool)

(assert (=> b!1263920 m!1163959))

(declare-fun m!1163961 () Bool)

(assert (=> b!1263920 m!1163961))

(declare-fun m!1163963 () Bool)

(assert (=> b!1263920 m!1163963))

(assert (=> b!1263920 m!1163779))

(assert (=> b!1263920 m!1163959))

(declare-fun m!1163965 () Bool)

(assert (=> b!1263920 m!1163965))

(declare-fun m!1163967 () Bool)

(assert (=> b!1263920 m!1163967))

(declare-fun m!1163969 () Bool)

(assert (=> b!1263920 m!1163969))

(declare-fun m!1163971 () Bool)

(assert (=> b!1263920 m!1163971))

(assert (=> b!1263920 m!1163971))

(declare-fun m!1163973 () Bool)

(assert (=> b!1263920 m!1163973))

(assert (=> b!1263920 m!1163967))

(declare-fun m!1163975 () Bool)

(assert (=> b!1263920 m!1163975))

(declare-fun m!1163977 () Bool)

(assert (=> b!1263920 m!1163977))

(declare-fun m!1163979 () Bool)

(assert (=> b!1263920 m!1163979))

(declare-fun m!1163981 () Bool)

(assert (=> b!1263920 m!1163981))

(assert (=> b!1263920 m!1163841))

(declare-fun m!1163983 () Bool)

(assert (=> b!1263920 m!1163983))

(declare-fun m!1163985 () Bool)

(assert (=> b!1263920 m!1163985))

(assert (=> b!1263920 m!1163977))

(declare-fun m!1163987 () Bool)

(assert (=> b!1263920 m!1163987))

(assert (=> b!1263923 m!1163841))

(assert (=> b!1263923 m!1163841))

(declare-fun m!1163989 () Bool)

(assert (=> b!1263923 m!1163989))

(declare-fun m!1163991 () Bool)

(assert (=> b!1263919 m!1163991))

(declare-fun m!1163993 () Bool)

(assert (=> b!1263915 m!1163993))

(declare-fun m!1163995 () Bool)

(assert (=> bm!62265 m!1163995))

(assert (=> b!1263706 d!138553))

(declare-fun d!138555 () Bool)

(declare-fun e!719646 () Bool)

(assert (=> d!138555 e!719646))

(declare-fun res!841801 () Bool)

(assert (=> d!138555 (=> (not res!841801) (not e!719646))))

(declare-fun lt!573218 () ListLongMap!19021)

(assert (=> d!138555 (= res!841801 (contains!7578 lt!573218 (_1!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573215 () List!28343)

(assert (=> d!138555 (= lt!573218 (ListLongMap!19022 lt!573215))))

(declare-fun lt!573217 () Unit!41971)

(declare-fun lt!573216 () Unit!41971)

(assert (=> d!138555 (= lt!573217 lt!573216)))

(assert (=> d!138555 (= (getValueByKey!670 lt!573215 (_1!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!720 (_2!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138555 (= lt!573216 (lemmaContainsTupThenGetReturnValue!338 lt!573215 (_1!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138555 (= lt!573215 (insertStrictlySorted!452 (toList!9526 (+!4293 lt!573064 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138555 (= (+!4293 (+!4293 lt!573064 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573218)))

(declare-fun b!1263926 () Bool)

(declare-fun res!841802 () Bool)

(assert (=> b!1263926 (=> (not res!841802) (not e!719646))))

(assert (=> b!1263926 (= res!841802 (= (getValueByKey!670 (toList!9526 lt!573218) (_1!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!720 (_2!10585 (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263927 () Bool)

(assert (=> b!1263927 (= e!719646 (contains!7580 (toList!9526 lt!573218) (tuple2!21149 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138555 res!841801) b!1263926))

(assert (= (and b!1263926 res!841802) b!1263927))

(declare-fun m!1163997 () Bool)

(assert (=> d!138555 m!1163997))

(declare-fun m!1163999 () Bool)

(assert (=> d!138555 m!1163999))

(declare-fun m!1164001 () Bool)

(assert (=> d!138555 m!1164001))

(declare-fun m!1164003 () Bool)

(assert (=> d!138555 m!1164003))

(declare-fun m!1164005 () Bool)

(assert (=> b!1263926 m!1164005))

(declare-fun m!1164007 () Bool)

(assert (=> b!1263927 m!1164007))

(assert (=> b!1263706 d!138555))

(declare-fun d!138557 () Bool)

(declare-fun e!719647 () Bool)

(assert (=> d!138557 e!719647))

(declare-fun res!841803 () Bool)

(assert (=> d!138557 (=> (not res!841803) (not e!719647))))

(declare-fun lt!573222 () ListLongMap!19021)

(assert (=> d!138557 (= res!841803 (contains!7578 lt!573222 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573219 () List!28343)

(assert (=> d!138557 (= lt!573222 (ListLongMap!19022 lt!573219))))

(declare-fun lt!573221 () Unit!41971)

(declare-fun lt!573220 () Unit!41971)

(assert (=> d!138557 (= lt!573221 lt!573220)))

(assert (=> d!138557 (= (getValueByKey!670 lt!573219 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!720 (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138557 (= lt!573220 (lemmaContainsTupThenGetReturnValue!338 lt!573219 (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138557 (= lt!573219 (insertStrictlySorted!452 (toList!9526 lt!573064) (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138557 (= (+!4293 lt!573064 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573222)))

(declare-fun b!1263928 () Bool)

(declare-fun res!841804 () Bool)

(assert (=> b!1263928 (=> (not res!841804) (not e!719647))))

(assert (=> b!1263928 (= res!841804 (= (getValueByKey!670 (toList!9526 lt!573222) (_1!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!720 (_2!10585 (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263929 () Bool)

(assert (=> b!1263929 (= e!719647 (contains!7580 (toList!9526 lt!573222) (tuple2!21149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138557 res!841803) b!1263928))

(assert (= (and b!1263928 res!841804) b!1263929))

(declare-fun m!1164009 () Bool)

(assert (=> d!138557 m!1164009))

(declare-fun m!1164011 () Bool)

(assert (=> d!138557 m!1164011))

(declare-fun m!1164013 () Bool)

(assert (=> d!138557 m!1164013))

(declare-fun m!1164015 () Bool)

(assert (=> d!138557 m!1164015))

(declare-fun m!1164017 () Bool)

(assert (=> b!1263928 m!1164017))

(declare-fun m!1164019 () Bool)

(assert (=> b!1263929 m!1164019))

(assert (=> b!1263706 d!138557))

(declare-fun d!138559 () Bool)

(declare-fun res!841809 () Bool)

(declare-fun e!719654 () Bool)

(assert (=> d!138559 (=> res!841809 e!719654)))

(assert (=> d!138559 (= res!841809 (bvsge #b00000000000000000000000000000000 (size!40276 _keys!1118)))))

(assert (=> d!138559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719654)))

(declare-fun b!1263938 () Bool)

(declare-fun e!719656 () Bool)

(assert (=> b!1263938 (= e!719654 e!719656)))

(declare-fun c!123069 () Bool)

(assert (=> b!1263938 (= c!123069 (validKeyInArray!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263939 () Bool)

(declare-fun e!719655 () Bool)

(declare-fun call!62275 () Bool)

(assert (=> b!1263939 (= e!719655 call!62275)))

(declare-fun b!1263940 () Bool)

(assert (=> b!1263940 (= e!719656 e!719655)))

(declare-fun lt!573230 () (_ BitVec 64))

(assert (=> b!1263940 (= lt!573230 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573231 () Unit!41971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82387 (_ BitVec 64) (_ BitVec 32)) Unit!41971)

(assert (=> b!1263940 (= lt!573231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573230 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263940 (arrayContainsKey!0 _keys!1118 lt!573230 #b00000000000000000000000000000000)))

(declare-fun lt!573229 () Unit!41971)

(assert (=> b!1263940 (= lt!573229 lt!573231)))

(declare-fun res!841810 () Bool)

(declare-datatypes ((SeekEntryResult!9980 0))(
  ( (MissingZero!9980 (index!42291 (_ BitVec 32))) (Found!9980 (index!42292 (_ BitVec 32))) (Intermediate!9980 (undefined!10792 Bool) (index!42293 (_ BitVec 32)) (x!111361 (_ BitVec 32))) (Undefined!9980) (MissingVacant!9980 (index!42294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82387 (_ BitVec 32)) SeekEntryResult!9980)

(assert (=> b!1263940 (= res!841810 (= (seekEntryOrOpen!0 (select (arr!39738 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9980 #b00000000000000000000000000000000)))))

(assert (=> b!1263940 (=> (not res!841810) (not e!719655))))

(declare-fun b!1263941 () Bool)

(assert (=> b!1263941 (= e!719656 call!62275)))

(declare-fun bm!62272 () Bool)

(assert (=> bm!62272 (= call!62275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138559 (not res!841809)) b!1263938))

(assert (= (and b!1263938 c!123069) b!1263940))

(assert (= (and b!1263938 (not c!123069)) b!1263941))

(assert (= (and b!1263940 res!841810) b!1263939))

(assert (= (or b!1263939 b!1263941) bm!62272))

(assert (=> b!1263938 m!1163841))

(assert (=> b!1263938 m!1163841))

(assert (=> b!1263938 m!1163863))

(assert (=> b!1263940 m!1163841))

(declare-fun m!1164021 () Bool)

(assert (=> b!1263940 m!1164021))

(declare-fun m!1164023 () Bool)

(assert (=> b!1263940 m!1164023))

(assert (=> b!1263940 m!1163841))

(declare-fun m!1164025 () Bool)

(assert (=> b!1263940 m!1164025))

(declare-fun m!1164027 () Bool)

(assert (=> bm!62272 m!1164027))

(assert (=> b!1263703 d!138559))

(declare-fun b!1263949 () Bool)

(declare-fun e!719662 () Bool)

(assert (=> b!1263949 (= e!719662 tp_is_empty!32419)))

(declare-fun condMapEmpty!50467 () Bool)

(declare-fun mapDefault!50467 () ValueCell!15446)

(assert (=> mapNonEmpty!50458 (= condMapEmpty!50467 (= mapRest!50458 ((as const (Array (_ BitVec 32) ValueCell!15446)) mapDefault!50467)))))

(declare-fun mapRes!50467 () Bool)

(assert (=> mapNonEmpty!50458 (= tp!96109 (and e!719662 mapRes!50467))))

(declare-fun mapIsEmpty!50467 () Bool)

(assert (=> mapIsEmpty!50467 mapRes!50467))

(declare-fun mapNonEmpty!50467 () Bool)

(declare-fun tp!96125 () Bool)

(declare-fun e!719661 () Bool)

(assert (=> mapNonEmpty!50467 (= mapRes!50467 (and tp!96125 e!719661))))

(declare-fun mapKey!50467 () (_ BitVec 32))

(declare-fun mapValue!50467 () ValueCell!15446)

(declare-fun mapRest!50467 () (Array (_ BitVec 32) ValueCell!15446))

(assert (=> mapNonEmpty!50467 (= mapRest!50458 (store mapRest!50467 mapKey!50467 mapValue!50467))))

(declare-fun b!1263948 () Bool)

(assert (=> b!1263948 (= e!719661 tp_is_empty!32419)))

(assert (= (and mapNonEmpty!50458 condMapEmpty!50467) mapIsEmpty!50467))

(assert (= (and mapNonEmpty!50458 (not condMapEmpty!50467)) mapNonEmpty!50467))

(assert (= (and mapNonEmpty!50467 ((_ is ValueCellFull!15446) mapValue!50467)) b!1263948))

(assert (= (and mapNonEmpty!50458 ((_ is ValueCellFull!15446) mapDefault!50467)) b!1263949))

(declare-fun m!1164029 () Bool)

(assert (=> mapNonEmpty!50467 m!1164029))

(declare-fun b_lambda!22993 () Bool)

(assert (= b_lambda!22985 (or (and start!106138 b_free!27517) b_lambda!22993)))

(declare-fun b_lambda!22995 () Bool)

(assert (= b_lambda!22991 (or (and start!106138 b_free!27517) b_lambda!22995)))

(declare-fun b_lambda!22997 () Bool)

(assert (= b_lambda!22983 (or (and start!106138 b_free!27517) b_lambda!22997)))

(declare-fun b_lambda!22999 () Bool)

(assert (= b_lambda!22981 (or (and start!106138 b_free!27517) b_lambda!22999)))

(declare-fun b_lambda!23001 () Bool)

(assert (= b_lambda!22989 (or (and start!106138 b_free!27517) b_lambda!23001)))

(declare-fun b_lambda!23003 () Bool)

(assert (= b_lambda!22987 (or (and start!106138 b_free!27517) b_lambda!23003)))

(check-sat (not d!138543) (not b_next!27517) (not bm!62269) (not b!1263796) (not b_lambda!23003) (not bm!62265) (not b!1263929) (not b!1263891) (not b_lambda!22999) (not b!1263904) (not mapNonEmpty!50467) (not d!138549) (not bm!62237) (not b!1263886) (not b_lambda!22995) (not b!1263835) (not b!1263895) (not b!1263806) (not b!1263925) (not bm!62263) (not b!1263923) (not b_lambda!22997) (not b!1263898) (not b!1263892) (not b!1263920) (not b!1263799) (not b!1263810) (not b!1263896) (not d!138553) (not b!1263817) (not b!1263918) (not b!1263833) (not d!138555) (not bm!62241) (not bm!62262) (not b!1263812) (not b!1263804) (not b!1263938) (not b!1263888) (not bm!62256) (not b!1263800) (not bm!62272) (not b_lambda!23001) (not bm!62261) b_and!45523 (not d!138557) (not b!1263927) (not b!1263819) (not b!1263940) (not d!138545) (not b!1263798) (not b!1263805) (not bm!62258) (not b!1263928) (not b_lambda!22993) (not b!1263926) (not bm!62268) (not b!1263922) (not bm!62238) (not b!1263903) (not b!1263919) (not b!1263813) (not b!1263893) (not d!138551) tp_is_empty!32419 (not b!1263915) (not b!1263913) (not b!1263803) (not b!1263820) (not b!1263831) (not d!138541) (not b!1263818) (not b!1263814))
(check-sat b_and!45523 (not b_next!27517))
