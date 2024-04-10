; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106168 () Bool)

(assert start!106168)

(declare-fun b_free!27525 () Bool)

(declare-fun b_next!27525 () Bool)

(assert (=> start!106168 (= b_free!27525 (not b_next!27525))))

(declare-fun tp!96137 () Bool)

(declare-fun b_and!45545 () Bool)

(assert (=> start!106168 (= tp!96137 b_and!45545)))

(declare-fun mapIsEmpty!50473 () Bool)

(declare-fun mapRes!50473 () Bool)

(assert (=> mapIsEmpty!50473 mapRes!50473))

(declare-fun b!1264077 () Bool)

(declare-fun res!841881 () Bool)

(declare-fun e!719748 () Bool)

(assert (=> b!1264077 (=> (not res!841881) (not e!719748))))

(declare-datatypes ((array!82480 0))(
  ( (array!82481 (arr!39783 (Array (_ BitVec 32) (_ BitVec 64))) (size!40319 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82480)

(declare-datatypes ((List!28264 0))(
  ( (Nil!28261) (Cons!28260 (h!29469 (_ BitVec 64)) (t!41783 List!28264)) )
))
(declare-fun arrayNoDuplicates!0 (array!82480 (_ BitVec 32) List!28264) Bool)

(assert (=> b!1264077 (= res!841881 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28261))))

(declare-fun b!1264078 () Bool)

(declare-fun e!719743 () Bool)

(declare-fun tp_is_empty!32427 () Bool)

(assert (=> b!1264078 (= e!719743 tp_is_empty!32427)))

(declare-fun b!1264079 () Bool)

(declare-fun e!719744 () Bool)

(declare-datatypes ((V!48601 0))(
  ( (V!48602 (val!16276 Int)) )
))
(declare-datatypes ((tuple2!21074 0))(
  ( (tuple2!21075 (_1!10548 (_ BitVec 64)) (_2!10548 V!48601)) )
))
(declare-datatypes ((List!28265 0))(
  ( (Nil!28262) (Cons!28261 (h!29470 tuple2!21074) (t!41784 List!28265)) )
))
(declare-datatypes ((ListLongMap!18947 0))(
  ( (ListLongMap!18948 (toList!9489 List!28265)) )
))
(declare-fun lt!573451 () ListLongMap!18947)

(declare-fun contains!7612 (ListLongMap!18947 (_ BitVec 64)) Bool)

(assert (=> b!1264079 (= e!719744 (not (contains!7612 lt!573451 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719747 () Bool)

(assert (=> b!1264079 e!719747))

(declare-fun res!841886 () Bool)

(assert (=> b!1264079 (=> (not res!841886) (not e!719747))))

(declare-fun lt!573446 () ListLongMap!18947)

(declare-fun minValueBefore!43 () V!48601)

(declare-fun +!4259 (ListLongMap!18947 tuple2!21074) ListLongMap!18947)

(assert (=> b!1264079 (= res!841886 (= lt!573446 (+!4259 lt!573451 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573449 () ListLongMap!18947)

(declare-fun lt!573450 () tuple2!21074)

(assert (=> b!1264079 (= lt!573451 (+!4259 lt!573449 lt!573450))))

(declare-fun zeroValue!871 () V!48601)

(assert (=> b!1264079 (= lt!573450 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!573452 () ListLongMap!18947)

(declare-fun minValueAfter!43 () V!48601)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15450 0))(
  ( (ValueCellFull!15450 (v!18989 V!48601)) (EmptyCell!15450) )
))
(declare-datatypes ((array!82482 0))(
  ( (array!82483 (arr!39784 (Array (_ BitVec 32) ValueCell!15450)) (size!40320 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82482)

(declare-fun getCurrentListMap!4656 (array!82480 array!82482 (_ BitVec 32) (_ BitVec 32) V!48601 V!48601 (_ BitVec 32) Int) ListLongMap!18947)

(assert (=> b!1264079 (= lt!573452 (getCurrentListMap!4656 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264079 (= lt!573446 (getCurrentListMap!4656 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264080 () Bool)

(declare-fun res!841884 () Bool)

(assert (=> b!1264080 (=> (not res!841884) (not e!719748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82480 (_ BitVec 32)) Bool)

(assert (=> b!1264080 (= res!841884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264081 () Bool)

(assert (=> b!1264081 (= e!719748 (not e!719744))))

(declare-fun res!841885 () Bool)

(assert (=> b!1264081 (=> res!841885 e!719744)))

(assert (=> b!1264081 (= res!841885 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!573448 () ListLongMap!18947)

(assert (=> b!1264081 (= lt!573449 lt!573448)))

(declare-datatypes ((Unit!42130 0))(
  ( (Unit!42131) )
))
(declare-fun lt!573447 () Unit!42130)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1193 (array!82480 array!82482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48601 V!48601 V!48601 V!48601 (_ BitVec 32) Int) Unit!42130)

(assert (=> b!1264081 (= lt!573447 (lemmaNoChangeToArrayThenSameMapNoExtras!1193 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5851 (array!82480 array!82482 (_ BitVec 32) (_ BitVec 32) V!48601 V!48601 (_ BitVec 32) Int) ListLongMap!18947)

(assert (=> b!1264081 (= lt!573448 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264081 (= lt!573449 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50473 () Bool)

(declare-fun tp!96136 () Bool)

(declare-fun e!719745 () Bool)

(assert (=> mapNonEmpty!50473 (= mapRes!50473 (and tp!96136 e!719745))))

(declare-fun mapRest!50473 () (Array (_ BitVec 32) ValueCell!15450))

(declare-fun mapValue!50473 () ValueCell!15450)

(declare-fun mapKey!50473 () (_ BitVec 32))

(assert (=> mapNonEmpty!50473 (= (arr!39784 _values!914) (store mapRest!50473 mapKey!50473 mapValue!50473))))

(declare-fun b!1264082 () Bool)

(assert (=> b!1264082 (= e!719747 (= lt!573452 (+!4259 lt!573448 lt!573450)))))

(declare-fun b!1264083 () Bool)

(declare-fun e!719749 () Bool)

(assert (=> b!1264083 (= e!719749 (and e!719743 mapRes!50473))))

(declare-fun condMapEmpty!50473 () Bool)

(declare-fun mapDefault!50473 () ValueCell!15450)

(assert (=> b!1264083 (= condMapEmpty!50473 (= (arr!39784 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15450)) mapDefault!50473)))))

(declare-fun res!841883 () Bool)

(assert (=> start!106168 (=> (not res!841883) (not e!719748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106168 (= res!841883 (validMask!0 mask!1466))))

(assert (=> start!106168 e!719748))

(assert (=> start!106168 true))

(assert (=> start!106168 tp!96137))

(assert (=> start!106168 tp_is_empty!32427))

(declare-fun array_inv!30277 (array!82480) Bool)

(assert (=> start!106168 (array_inv!30277 _keys!1118)))

(declare-fun array_inv!30278 (array!82482) Bool)

(assert (=> start!106168 (and (array_inv!30278 _values!914) e!719749)))

(declare-fun b!1264084 () Bool)

(assert (=> b!1264084 (= e!719745 tp_is_empty!32427)))

(declare-fun b!1264085 () Bool)

(declare-fun res!841882 () Bool)

(assert (=> b!1264085 (=> (not res!841882) (not e!719748))))

(assert (=> b!1264085 (= res!841882 (and (= (size!40320 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40319 _keys!1118) (size!40320 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106168 res!841883) b!1264085))

(assert (= (and b!1264085 res!841882) b!1264080))

(assert (= (and b!1264080 res!841884) b!1264077))

(assert (= (and b!1264077 res!841881) b!1264081))

(assert (= (and b!1264081 (not res!841885)) b!1264079))

(assert (= (and b!1264079 res!841886) b!1264082))

(assert (= (and b!1264083 condMapEmpty!50473) mapIsEmpty!50473))

(assert (= (and b!1264083 (not condMapEmpty!50473)) mapNonEmpty!50473))

(get-info :version)

(assert (= (and mapNonEmpty!50473 ((_ is ValueCellFull!15450) mapValue!50473)) b!1264084))

(assert (= (and b!1264083 ((_ is ValueCellFull!15450) mapDefault!50473)) b!1264078))

(assert (= start!106168 b!1264083))

(declare-fun m!1164581 () Bool)

(assert (=> b!1264079 m!1164581))

(declare-fun m!1164583 () Bool)

(assert (=> b!1264079 m!1164583))

(declare-fun m!1164585 () Bool)

(assert (=> b!1264079 m!1164585))

(declare-fun m!1164587 () Bool)

(assert (=> b!1264079 m!1164587))

(declare-fun m!1164589 () Bool)

(assert (=> b!1264079 m!1164589))

(declare-fun m!1164591 () Bool)

(assert (=> b!1264082 m!1164591))

(declare-fun m!1164593 () Bool)

(assert (=> b!1264080 m!1164593))

(declare-fun m!1164595 () Bool)

(assert (=> b!1264077 m!1164595))

(declare-fun m!1164597 () Bool)

(assert (=> start!106168 m!1164597))

(declare-fun m!1164599 () Bool)

(assert (=> start!106168 m!1164599))

(declare-fun m!1164601 () Bool)

(assert (=> start!106168 m!1164601))

(declare-fun m!1164603 () Bool)

(assert (=> mapNonEmpty!50473 m!1164603))

(declare-fun m!1164605 () Bool)

(assert (=> b!1264081 m!1164605))

(declare-fun m!1164607 () Bool)

(assert (=> b!1264081 m!1164607))

(declare-fun m!1164609 () Bool)

(assert (=> b!1264081 m!1164609))

(check-sat (not b!1264077) b_and!45545 (not start!106168) (not mapNonEmpty!50473) (not b!1264080) (not b_next!27525) (not b!1264081) tp_is_empty!32427 (not b!1264082) (not b!1264079))
(check-sat b_and!45545 (not b_next!27525))
(get-model)

(declare-fun d!138695 () Bool)

(declare-fun e!719773 () Bool)

(assert (=> d!138695 e!719773))

(declare-fun res!841910 () Bool)

(assert (=> d!138695 (=> (not res!841910) (not e!719773))))

(declare-fun lt!573483 () ListLongMap!18947)

(assert (=> d!138695 (= res!841910 (contains!7612 lt!573483 (_1!10548 lt!573450)))))

(declare-fun lt!573484 () List!28265)

(assert (=> d!138695 (= lt!573483 (ListLongMap!18948 lt!573484))))

(declare-fun lt!573485 () Unit!42130)

(declare-fun lt!573482 () Unit!42130)

(assert (=> d!138695 (= lt!573485 lt!573482)))

(declare-datatypes ((Option!720 0))(
  ( (Some!719 (v!18991 V!48601)) (None!718) )
))
(declare-fun getValueByKey!669 (List!28265 (_ BitVec 64)) Option!720)

(assert (=> d!138695 (= (getValueByKey!669 lt!573484 (_1!10548 lt!573450)) (Some!719 (_2!10548 lt!573450)))))

(declare-fun lemmaContainsTupThenGetReturnValue!338 (List!28265 (_ BitVec 64) V!48601) Unit!42130)

(assert (=> d!138695 (= lt!573482 (lemmaContainsTupThenGetReturnValue!338 lt!573484 (_1!10548 lt!573450) (_2!10548 lt!573450)))))

(declare-fun insertStrictlySorted!452 (List!28265 (_ BitVec 64) V!48601) List!28265)

(assert (=> d!138695 (= lt!573484 (insertStrictlySorted!452 (toList!9489 lt!573448) (_1!10548 lt!573450) (_2!10548 lt!573450)))))

(assert (=> d!138695 (= (+!4259 lt!573448 lt!573450) lt!573483)))

(declare-fun b!1264117 () Bool)

(declare-fun res!841909 () Bool)

(assert (=> b!1264117 (=> (not res!841909) (not e!719773))))

(assert (=> b!1264117 (= res!841909 (= (getValueByKey!669 (toList!9489 lt!573483) (_1!10548 lt!573450)) (Some!719 (_2!10548 lt!573450))))))

(declare-fun b!1264118 () Bool)

(declare-fun contains!7614 (List!28265 tuple2!21074) Bool)

(assert (=> b!1264118 (= e!719773 (contains!7614 (toList!9489 lt!573483) lt!573450))))

(assert (= (and d!138695 res!841910) b!1264117))

(assert (= (and b!1264117 res!841909) b!1264118))

(declare-fun m!1164641 () Bool)

(assert (=> d!138695 m!1164641))

(declare-fun m!1164643 () Bool)

(assert (=> d!138695 m!1164643))

(declare-fun m!1164645 () Bool)

(assert (=> d!138695 m!1164645))

(declare-fun m!1164647 () Bool)

(assert (=> d!138695 m!1164647))

(declare-fun m!1164649 () Bool)

(assert (=> b!1264117 m!1164649))

(declare-fun m!1164651 () Bool)

(assert (=> b!1264118 m!1164651))

(assert (=> b!1264082 d!138695))

(declare-fun d!138697 () Bool)

(assert (=> d!138697 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106168 d!138697))

(declare-fun d!138699 () Bool)

(assert (=> d!138699 (= (array_inv!30277 _keys!1118) (bvsge (size!40319 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106168 d!138699))

(declare-fun d!138701 () Bool)

(assert (=> d!138701 (= (array_inv!30278 _values!914) (bvsge (size!40320 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106168 d!138701))

(declare-fun d!138703 () Bool)

(declare-fun e!719774 () Bool)

(assert (=> d!138703 e!719774))

(declare-fun res!841912 () Bool)

(assert (=> d!138703 (=> (not res!841912) (not e!719774))))

(declare-fun lt!573487 () ListLongMap!18947)

(assert (=> d!138703 (= res!841912 (contains!7612 lt!573487 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573488 () List!28265)

(assert (=> d!138703 (= lt!573487 (ListLongMap!18948 lt!573488))))

(declare-fun lt!573489 () Unit!42130)

(declare-fun lt!573486 () Unit!42130)

(assert (=> d!138703 (= lt!573489 lt!573486)))

(assert (=> d!138703 (= (getValueByKey!669 lt!573488 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!719 (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138703 (= lt!573486 (lemmaContainsTupThenGetReturnValue!338 lt!573488 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138703 (= lt!573488 (insertStrictlySorted!452 (toList!9489 lt!573451) (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138703 (= (+!4259 lt!573451 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573487)))

(declare-fun b!1264119 () Bool)

(declare-fun res!841911 () Bool)

(assert (=> b!1264119 (=> (not res!841911) (not e!719774))))

(assert (=> b!1264119 (= res!841911 (= (getValueByKey!669 (toList!9489 lt!573487) (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!719 (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1264120 () Bool)

(assert (=> b!1264120 (= e!719774 (contains!7614 (toList!9489 lt!573487) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138703 res!841912) b!1264119))

(assert (= (and b!1264119 res!841911) b!1264120))

(declare-fun m!1164653 () Bool)

(assert (=> d!138703 m!1164653))

(declare-fun m!1164655 () Bool)

(assert (=> d!138703 m!1164655))

(declare-fun m!1164657 () Bool)

(assert (=> d!138703 m!1164657))

(declare-fun m!1164659 () Bool)

(assert (=> d!138703 m!1164659))

(declare-fun m!1164661 () Bool)

(assert (=> b!1264119 m!1164661))

(declare-fun m!1164663 () Bool)

(assert (=> b!1264120 m!1164663))

(assert (=> b!1264079 d!138703))

(declare-fun d!138705 () Bool)

(declare-fun e!719775 () Bool)

(assert (=> d!138705 e!719775))

(declare-fun res!841914 () Bool)

(assert (=> d!138705 (=> (not res!841914) (not e!719775))))

(declare-fun lt!573491 () ListLongMap!18947)

(assert (=> d!138705 (= res!841914 (contains!7612 lt!573491 (_1!10548 lt!573450)))))

(declare-fun lt!573492 () List!28265)

(assert (=> d!138705 (= lt!573491 (ListLongMap!18948 lt!573492))))

(declare-fun lt!573493 () Unit!42130)

(declare-fun lt!573490 () Unit!42130)

(assert (=> d!138705 (= lt!573493 lt!573490)))

(assert (=> d!138705 (= (getValueByKey!669 lt!573492 (_1!10548 lt!573450)) (Some!719 (_2!10548 lt!573450)))))

(assert (=> d!138705 (= lt!573490 (lemmaContainsTupThenGetReturnValue!338 lt!573492 (_1!10548 lt!573450) (_2!10548 lt!573450)))))

(assert (=> d!138705 (= lt!573492 (insertStrictlySorted!452 (toList!9489 lt!573449) (_1!10548 lt!573450) (_2!10548 lt!573450)))))

(assert (=> d!138705 (= (+!4259 lt!573449 lt!573450) lt!573491)))

(declare-fun b!1264121 () Bool)

(declare-fun res!841913 () Bool)

(assert (=> b!1264121 (=> (not res!841913) (not e!719775))))

(assert (=> b!1264121 (= res!841913 (= (getValueByKey!669 (toList!9489 lt!573491) (_1!10548 lt!573450)) (Some!719 (_2!10548 lt!573450))))))

(declare-fun b!1264122 () Bool)

(assert (=> b!1264122 (= e!719775 (contains!7614 (toList!9489 lt!573491) lt!573450))))

(assert (= (and d!138705 res!841914) b!1264121))

(assert (= (and b!1264121 res!841913) b!1264122))

(declare-fun m!1164665 () Bool)

(assert (=> d!138705 m!1164665))

(declare-fun m!1164667 () Bool)

(assert (=> d!138705 m!1164667))

(declare-fun m!1164669 () Bool)

(assert (=> d!138705 m!1164669))

(declare-fun m!1164671 () Bool)

(assert (=> d!138705 m!1164671))

(declare-fun m!1164673 () Bool)

(assert (=> b!1264121 m!1164673))

(declare-fun m!1164675 () Bool)

(assert (=> b!1264122 m!1164675))

(assert (=> b!1264079 d!138705))

(declare-fun b!1264166 () Bool)

(declare-fun e!719808 () Bool)

(declare-fun call!62312 () Bool)

(assert (=> b!1264166 (= e!719808 (not call!62312))))

(declare-fun b!1264167 () Bool)

(declare-fun res!841940 () Bool)

(declare-fun e!719809 () Bool)

(assert (=> b!1264167 (=> (not res!841940) (not e!719809))))

(declare-fun e!719812 () Bool)

(assert (=> b!1264167 (= res!841940 e!719812)))

(declare-fun res!841934 () Bool)

(assert (=> b!1264167 (=> res!841934 e!719812)))

(declare-fun e!719810 () Bool)

(assert (=> b!1264167 (= res!841934 (not e!719810))))

(declare-fun res!841941 () Bool)

(assert (=> b!1264167 (=> (not res!841941) (not e!719810))))

(assert (=> b!1264167 (= res!841941 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264168 () Bool)

(declare-fun e!719802 () Bool)

(declare-fun e!719814 () Bool)

(assert (=> b!1264168 (= e!719802 e!719814)))

(declare-fun res!841933 () Bool)

(declare-fun call!62309 () Bool)

(assert (=> b!1264168 (= res!841933 call!62309)))

(assert (=> b!1264168 (=> (not res!841933) (not e!719814))))

(declare-fun b!1264169 () Bool)

(declare-fun e!719806 () Bool)

(assert (=> b!1264169 (= e!719812 e!719806)))

(declare-fun res!841936 () Bool)

(assert (=> b!1264169 (=> (not res!841936) (not e!719806))))

(declare-fun lt!573539 () ListLongMap!18947)

(assert (=> b!1264169 (= res!841936 (contains!7612 lt!573539 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264170 () Bool)

(declare-fun e!719811 () ListLongMap!18947)

(declare-fun call!62314 () ListLongMap!18947)

(assert (=> b!1264170 (= e!719811 call!62314)))

(declare-fun b!1264171 () Bool)

(declare-fun e!719804 () ListLongMap!18947)

(declare-fun call!62313 () ListLongMap!18947)

(assert (=> b!1264171 (= e!719804 (+!4259 call!62313 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1264172 () Bool)

(assert (=> b!1264172 (= e!719809 e!719802)))

(declare-fun c!123102 () Bool)

(assert (=> b!1264172 (= c!123102 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264173 () Bool)

(declare-fun e!719803 () Bool)

(assert (=> b!1264173 (= e!719808 e!719803)))

(declare-fun res!841939 () Bool)

(assert (=> b!1264173 (= res!841939 call!62312)))

(assert (=> b!1264173 (=> (not res!841939) (not e!719803))))

(declare-fun b!1264174 () Bool)

(declare-fun apply!1004 (ListLongMap!18947 (_ BitVec 64)) V!48601)

(assert (=> b!1264174 (= e!719803 (= (apply!1004 lt!573539 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264175 () Bool)

(declare-fun c!123104 () Bool)

(assert (=> b!1264175 (= c!123104 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719805 () ListLongMap!18947)

(assert (=> b!1264175 (= e!719805 e!719811)))

(declare-fun b!1264176 () Bool)

(declare-fun e!719807 () Unit!42130)

(declare-fun Unit!42134 () Unit!42130)

(assert (=> b!1264176 (= e!719807 Unit!42134)))

(declare-fun b!1264177 () Bool)

(assert (=> b!1264177 (= e!719804 e!719805)))

(declare-fun c!123103 () Bool)

(assert (=> b!1264177 (= c!123103 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264178 () Bool)

(declare-fun get!20297 (ValueCell!15450 V!48601) V!48601)

(declare-fun dynLambda!3402 (Int (_ BitVec 64)) V!48601)

(assert (=> b!1264178 (= e!719806 (= (apply!1004 lt!573539 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _values!914)))))

(assert (=> b!1264178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun call!62310 () ListLongMap!18947)

(declare-fun bm!62306 () Bool)

(assert (=> bm!62306 (= call!62310 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264165 () Bool)

(declare-fun lt!573545 () Unit!42130)

(assert (=> b!1264165 (= e!719807 lt!573545)))

(declare-fun lt!573557 () ListLongMap!18947)

(assert (=> b!1264165 (= lt!573557 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573543 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573546 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573546 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573555 () Unit!42130)

(declare-fun addStillContains!1094 (ListLongMap!18947 (_ BitVec 64) V!48601 (_ BitVec 64)) Unit!42130)

(assert (=> b!1264165 (= lt!573555 (addStillContains!1094 lt!573557 lt!573543 zeroValue!871 lt!573546))))

(assert (=> b!1264165 (contains!7612 (+!4259 lt!573557 (tuple2!21075 lt!573543 zeroValue!871)) lt!573546)))

(declare-fun lt!573538 () Unit!42130)

(assert (=> b!1264165 (= lt!573538 lt!573555)))

(declare-fun lt!573554 () ListLongMap!18947)

(assert (=> b!1264165 (= lt!573554 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573551 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573551 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573548 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573548 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573549 () Unit!42130)

(declare-fun addApplyDifferent!548 (ListLongMap!18947 (_ BitVec 64) V!48601 (_ BitVec 64)) Unit!42130)

(assert (=> b!1264165 (= lt!573549 (addApplyDifferent!548 lt!573554 lt!573551 minValueBefore!43 lt!573548))))

(assert (=> b!1264165 (= (apply!1004 (+!4259 lt!573554 (tuple2!21075 lt!573551 minValueBefore!43)) lt!573548) (apply!1004 lt!573554 lt!573548))))

(declare-fun lt!573542 () Unit!42130)

(assert (=> b!1264165 (= lt!573542 lt!573549)))

(declare-fun lt!573541 () ListLongMap!18947)

(assert (=> b!1264165 (= lt!573541 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573544 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573552 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573552 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573558 () Unit!42130)

(assert (=> b!1264165 (= lt!573558 (addApplyDifferent!548 lt!573541 lt!573544 zeroValue!871 lt!573552))))

(assert (=> b!1264165 (= (apply!1004 (+!4259 lt!573541 (tuple2!21075 lt!573544 zeroValue!871)) lt!573552) (apply!1004 lt!573541 lt!573552))))

(declare-fun lt!573556 () Unit!42130)

(assert (=> b!1264165 (= lt!573556 lt!573558)))

(declare-fun lt!573550 () ListLongMap!18947)

(assert (=> b!1264165 (= lt!573550 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573553 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573553 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573540 () (_ BitVec 64))

(assert (=> b!1264165 (= lt!573540 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264165 (= lt!573545 (addApplyDifferent!548 lt!573550 lt!573553 minValueBefore!43 lt!573540))))

(assert (=> b!1264165 (= (apply!1004 (+!4259 lt!573550 (tuple2!21075 lt!573553 minValueBefore!43)) lt!573540) (apply!1004 lt!573550 lt!573540))))

(declare-fun d!138707 () Bool)

(assert (=> d!138707 e!719809))

(declare-fun res!841938 () Bool)

(assert (=> d!138707 (=> (not res!841938) (not e!719809))))

(assert (=> d!138707 (= res!841938 (or (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))))

(declare-fun lt!573547 () ListLongMap!18947)

(assert (=> d!138707 (= lt!573539 lt!573547)))

(declare-fun lt!573559 () Unit!42130)

(assert (=> d!138707 (= lt!573559 e!719807)))

(declare-fun c!123100 () Bool)

(declare-fun e!719813 () Bool)

(assert (=> d!138707 (= c!123100 e!719813)))

(declare-fun res!841935 () Bool)

(assert (=> d!138707 (=> (not res!841935) (not e!719813))))

(assert (=> d!138707 (= res!841935 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138707 (= lt!573547 e!719804)))

(declare-fun c!123105 () Bool)

(assert (=> d!138707 (= c!123105 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138707 (validMask!0 mask!1466)))

(assert (=> d!138707 (= (getCurrentListMap!4656 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573539)))

(declare-fun bm!62307 () Bool)

(declare-fun call!62311 () ListLongMap!18947)

(declare-fun call!62315 () ListLongMap!18947)

(assert (=> bm!62307 (= call!62313 (+!4259 (ite c!123105 call!62310 (ite c!123103 call!62311 call!62315)) (ite (or c!123105 c!123103) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1264179 () Bool)

(assert (=> b!1264179 (= e!719802 (not call!62309))))

(declare-fun b!1264180 () Bool)

(declare-fun res!841937 () Bool)

(assert (=> b!1264180 (=> (not res!841937) (not e!719809))))

(assert (=> b!1264180 (= res!841937 e!719808)))

(declare-fun c!123101 () Bool)

(assert (=> b!1264180 (= c!123101 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62308 () Bool)

(assert (=> bm!62308 (= call!62311 call!62310)))

(declare-fun b!1264181 () Bool)

(assert (=> b!1264181 (= e!719805 call!62314)))

(declare-fun bm!62309 () Bool)

(assert (=> bm!62309 (= call!62315 call!62311)))

(declare-fun bm!62310 () Bool)

(assert (=> bm!62310 (= call!62309 (contains!7612 lt!573539 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62311 () Bool)

(assert (=> bm!62311 (= call!62312 (contains!7612 lt!573539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264182 () Bool)

(assert (=> b!1264182 (= e!719814 (= (apply!1004 lt!573539 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1264183 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264183 (= e!719810 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62312 () Bool)

(assert (=> bm!62312 (= call!62314 call!62313)))

(declare-fun b!1264184 () Bool)

(assert (=> b!1264184 (= e!719811 call!62315)))

(declare-fun b!1264185 () Bool)

(assert (=> b!1264185 (= e!719813 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138707 c!123105) b!1264171))

(assert (= (and d!138707 (not c!123105)) b!1264177))

(assert (= (and b!1264177 c!123103) b!1264181))

(assert (= (and b!1264177 (not c!123103)) b!1264175))

(assert (= (and b!1264175 c!123104) b!1264170))

(assert (= (and b!1264175 (not c!123104)) b!1264184))

(assert (= (or b!1264170 b!1264184) bm!62309))

(assert (= (or b!1264181 bm!62309) bm!62308))

(assert (= (or b!1264181 b!1264170) bm!62312))

(assert (= (or b!1264171 bm!62308) bm!62306))

(assert (= (or b!1264171 bm!62312) bm!62307))

(assert (= (and d!138707 res!841935) b!1264185))

(assert (= (and d!138707 c!123100) b!1264165))

(assert (= (and d!138707 (not c!123100)) b!1264176))

(assert (= (and d!138707 res!841938) b!1264167))

(assert (= (and b!1264167 res!841941) b!1264183))

(assert (= (and b!1264167 (not res!841934)) b!1264169))

(assert (= (and b!1264169 res!841936) b!1264178))

(assert (= (and b!1264167 res!841940) b!1264180))

(assert (= (and b!1264180 c!123101) b!1264173))

(assert (= (and b!1264180 (not c!123101)) b!1264166))

(assert (= (and b!1264173 res!841939) b!1264174))

(assert (= (or b!1264173 b!1264166) bm!62311))

(assert (= (and b!1264180 res!841937) b!1264172))

(assert (= (and b!1264172 c!123102) b!1264168))

(assert (= (and b!1264172 (not c!123102)) b!1264179))

(assert (= (and b!1264168 res!841933) b!1264182))

(assert (= (or b!1264168 b!1264179) bm!62310))

(declare-fun b_lambda!23015 () Bool)

(assert (=> (not b_lambda!23015) (not b!1264178)))

(declare-fun t!41787 () Bool)

(declare-fun tb!11335 () Bool)

(assert (=> (and start!106168 (= defaultEntry!922 defaultEntry!922) t!41787) tb!11335))

(declare-fun result!23413 () Bool)

(assert (=> tb!11335 (= result!23413 tp_is_empty!32427)))

(assert (=> b!1264178 t!41787))

(declare-fun b_and!45549 () Bool)

(assert (= b_and!45545 (and (=> t!41787 result!23413) b_and!45549)))

(declare-fun m!1164677 () Bool)

(assert (=> bm!62311 m!1164677))

(declare-fun m!1164679 () Bool)

(assert (=> b!1264185 m!1164679))

(assert (=> b!1264185 m!1164679))

(declare-fun m!1164681 () Bool)

(assert (=> b!1264185 m!1164681))

(assert (=> bm!62306 m!1164609))

(declare-fun m!1164683 () Bool)

(assert (=> bm!62307 m!1164683))

(declare-fun m!1164685 () Bool)

(assert (=> b!1264171 m!1164685))

(declare-fun m!1164687 () Bool)

(assert (=> bm!62310 m!1164687))

(declare-fun m!1164689 () Bool)

(assert (=> b!1264165 m!1164689))

(declare-fun m!1164691 () Bool)

(assert (=> b!1264165 m!1164691))

(declare-fun m!1164693 () Bool)

(assert (=> b!1264165 m!1164693))

(declare-fun m!1164695 () Bool)

(assert (=> b!1264165 m!1164695))

(assert (=> b!1264165 m!1164689))

(declare-fun m!1164697 () Bool)

(assert (=> b!1264165 m!1164697))

(declare-fun m!1164699 () Bool)

(assert (=> b!1264165 m!1164699))

(declare-fun m!1164701 () Bool)

(assert (=> b!1264165 m!1164701))

(declare-fun m!1164703 () Bool)

(assert (=> b!1264165 m!1164703))

(assert (=> b!1264165 m!1164609))

(declare-fun m!1164705 () Bool)

(assert (=> b!1264165 m!1164705))

(declare-fun m!1164707 () Bool)

(assert (=> b!1264165 m!1164707))

(assert (=> b!1264165 m!1164693))

(declare-fun m!1164709 () Bool)

(assert (=> b!1264165 m!1164709))

(declare-fun m!1164711 () Bool)

(assert (=> b!1264165 m!1164711))

(declare-fun m!1164713 () Bool)

(assert (=> b!1264165 m!1164713))

(assert (=> b!1264165 m!1164711))

(declare-fun m!1164715 () Bool)

(assert (=> b!1264165 m!1164715))

(declare-fun m!1164717 () Bool)

(assert (=> b!1264165 m!1164717))

(assert (=> b!1264165 m!1164697))

(assert (=> b!1264165 m!1164679))

(assert (=> b!1264183 m!1164679))

(assert (=> b!1264183 m!1164679))

(assert (=> b!1264183 m!1164681))

(assert (=> b!1264178 m!1164679))

(declare-fun m!1164719 () Bool)

(assert (=> b!1264178 m!1164719))

(declare-fun m!1164721 () Bool)

(assert (=> b!1264178 m!1164721))

(declare-fun m!1164723 () Bool)

(assert (=> b!1264178 m!1164723))

(assert (=> b!1264178 m!1164723))

(assert (=> b!1264178 m!1164721))

(declare-fun m!1164725 () Bool)

(assert (=> b!1264178 m!1164725))

(assert (=> b!1264178 m!1164679))

(assert (=> b!1264169 m!1164679))

(assert (=> b!1264169 m!1164679))

(declare-fun m!1164727 () Bool)

(assert (=> b!1264169 m!1164727))

(assert (=> d!138707 m!1164597))

(declare-fun m!1164729 () Bool)

(assert (=> b!1264174 m!1164729))

(declare-fun m!1164731 () Bool)

(assert (=> b!1264182 m!1164731))

(assert (=> b!1264079 d!138707))

(declare-fun d!138709 () Bool)

(declare-fun e!719819 () Bool)

(assert (=> d!138709 e!719819))

(declare-fun res!841944 () Bool)

(assert (=> d!138709 (=> res!841944 e!719819)))

(declare-fun lt!573571 () Bool)

(assert (=> d!138709 (= res!841944 (not lt!573571))))

(declare-fun lt!573568 () Bool)

(assert (=> d!138709 (= lt!573571 lt!573568)))

(declare-fun lt!573569 () Unit!42130)

(declare-fun e!719820 () Unit!42130)

(assert (=> d!138709 (= lt!573569 e!719820)))

(declare-fun c!123108 () Bool)

(assert (=> d!138709 (= c!123108 lt!573568)))

(declare-fun containsKey!627 (List!28265 (_ BitVec 64)) Bool)

(assert (=> d!138709 (= lt!573568 (containsKey!627 (toList!9489 lt!573451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138709 (= (contains!7612 lt!573451 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573571)))

(declare-fun b!1264194 () Bool)

(declare-fun lt!573570 () Unit!42130)

(assert (=> b!1264194 (= e!719820 lt!573570)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!436 (List!28265 (_ BitVec 64)) Unit!42130)

(assert (=> b!1264194 (= lt!573570 (lemmaContainsKeyImpliesGetValueByKeyDefined!436 (toList!9489 lt!573451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!475 (Option!720) Bool)

(assert (=> b!1264194 (isDefined!475 (getValueByKey!669 (toList!9489 lt!573451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264195 () Bool)

(declare-fun Unit!42135 () Unit!42130)

(assert (=> b!1264195 (= e!719820 Unit!42135)))

(declare-fun b!1264196 () Bool)

(assert (=> b!1264196 (= e!719819 (isDefined!475 (getValueByKey!669 (toList!9489 lt!573451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138709 c!123108) b!1264194))

(assert (= (and d!138709 (not c!123108)) b!1264195))

(assert (= (and d!138709 (not res!841944)) b!1264196))

(declare-fun m!1164733 () Bool)

(assert (=> d!138709 m!1164733))

(declare-fun m!1164735 () Bool)

(assert (=> b!1264194 m!1164735))

(declare-fun m!1164737 () Bool)

(assert (=> b!1264194 m!1164737))

(assert (=> b!1264194 m!1164737))

(declare-fun m!1164739 () Bool)

(assert (=> b!1264194 m!1164739))

(assert (=> b!1264196 m!1164737))

(assert (=> b!1264196 m!1164737))

(assert (=> b!1264196 m!1164739))

(assert (=> b!1264079 d!138709))

(declare-fun b!1264198 () Bool)

(declare-fun e!719827 () Bool)

(declare-fun call!62319 () Bool)

(assert (=> b!1264198 (= e!719827 (not call!62319))))

(declare-fun b!1264199 () Bool)

(declare-fun res!841952 () Bool)

(declare-fun e!719828 () Bool)

(assert (=> b!1264199 (=> (not res!841952) (not e!719828))))

(declare-fun e!719831 () Bool)

(assert (=> b!1264199 (= res!841952 e!719831)))

(declare-fun res!841946 () Bool)

(assert (=> b!1264199 (=> res!841946 e!719831)))

(declare-fun e!719829 () Bool)

(assert (=> b!1264199 (= res!841946 (not e!719829))))

(declare-fun res!841953 () Bool)

(assert (=> b!1264199 (=> (not res!841953) (not e!719829))))

(assert (=> b!1264199 (= res!841953 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264200 () Bool)

(declare-fun e!719821 () Bool)

(declare-fun e!719833 () Bool)

(assert (=> b!1264200 (= e!719821 e!719833)))

(declare-fun res!841945 () Bool)

(declare-fun call!62316 () Bool)

(assert (=> b!1264200 (= res!841945 call!62316)))

(assert (=> b!1264200 (=> (not res!841945) (not e!719833))))

(declare-fun b!1264201 () Bool)

(declare-fun e!719825 () Bool)

(assert (=> b!1264201 (= e!719831 e!719825)))

(declare-fun res!841948 () Bool)

(assert (=> b!1264201 (=> (not res!841948) (not e!719825))))

(declare-fun lt!573573 () ListLongMap!18947)

(assert (=> b!1264201 (= res!841948 (contains!7612 lt!573573 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264202 () Bool)

(declare-fun e!719830 () ListLongMap!18947)

(declare-fun call!62321 () ListLongMap!18947)

(assert (=> b!1264202 (= e!719830 call!62321)))

(declare-fun b!1264203 () Bool)

(declare-fun e!719823 () ListLongMap!18947)

(declare-fun call!62320 () ListLongMap!18947)

(assert (=> b!1264203 (= e!719823 (+!4259 call!62320 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1264204 () Bool)

(assert (=> b!1264204 (= e!719828 e!719821)))

(declare-fun c!123111 () Bool)

(assert (=> b!1264204 (= c!123111 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264205 () Bool)

(declare-fun e!719822 () Bool)

(assert (=> b!1264205 (= e!719827 e!719822)))

(declare-fun res!841951 () Bool)

(assert (=> b!1264205 (= res!841951 call!62319)))

(assert (=> b!1264205 (=> (not res!841951) (not e!719822))))

(declare-fun b!1264206 () Bool)

(assert (=> b!1264206 (= e!719822 (= (apply!1004 lt!573573 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264207 () Bool)

(declare-fun c!123113 () Bool)

(assert (=> b!1264207 (= c!123113 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719824 () ListLongMap!18947)

(assert (=> b!1264207 (= e!719824 e!719830)))

(declare-fun b!1264208 () Bool)

(declare-fun e!719826 () Unit!42130)

(declare-fun Unit!42136 () Unit!42130)

(assert (=> b!1264208 (= e!719826 Unit!42136)))

(declare-fun b!1264209 () Bool)

(assert (=> b!1264209 (= e!719823 e!719824)))

(declare-fun c!123112 () Bool)

(assert (=> b!1264209 (= c!123112 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264210 () Bool)

(assert (=> b!1264210 (= e!719825 (= (apply!1004 lt!573573 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264210 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _values!914)))))

(assert (=> b!1264210 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun bm!62313 () Bool)

(declare-fun call!62317 () ListLongMap!18947)

(assert (=> bm!62313 (= call!62317 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264197 () Bool)

(declare-fun lt!573579 () Unit!42130)

(assert (=> b!1264197 (= e!719826 lt!573579)))

(declare-fun lt!573591 () ListLongMap!18947)

(assert (=> b!1264197 (= lt!573591 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573577 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573580 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573580 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573589 () Unit!42130)

(assert (=> b!1264197 (= lt!573589 (addStillContains!1094 lt!573591 lt!573577 zeroValue!871 lt!573580))))

(assert (=> b!1264197 (contains!7612 (+!4259 lt!573591 (tuple2!21075 lt!573577 zeroValue!871)) lt!573580)))

(declare-fun lt!573572 () Unit!42130)

(assert (=> b!1264197 (= lt!573572 lt!573589)))

(declare-fun lt!573588 () ListLongMap!18947)

(assert (=> b!1264197 (= lt!573588 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573585 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573582 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573582 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573583 () Unit!42130)

(assert (=> b!1264197 (= lt!573583 (addApplyDifferent!548 lt!573588 lt!573585 minValueAfter!43 lt!573582))))

(assert (=> b!1264197 (= (apply!1004 (+!4259 lt!573588 (tuple2!21075 lt!573585 minValueAfter!43)) lt!573582) (apply!1004 lt!573588 lt!573582))))

(declare-fun lt!573576 () Unit!42130)

(assert (=> b!1264197 (= lt!573576 lt!573583)))

(declare-fun lt!573575 () ListLongMap!18947)

(assert (=> b!1264197 (= lt!573575 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573578 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573586 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573586 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573592 () Unit!42130)

(assert (=> b!1264197 (= lt!573592 (addApplyDifferent!548 lt!573575 lt!573578 zeroValue!871 lt!573586))))

(assert (=> b!1264197 (= (apply!1004 (+!4259 lt!573575 (tuple2!21075 lt!573578 zeroValue!871)) lt!573586) (apply!1004 lt!573575 lt!573586))))

(declare-fun lt!573590 () Unit!42130)

(assert (=> b!1264197 (= lt!573590 lt!573592)))

(declare-fun lt!573584 () ListLongMap!18947)

(assert (=> b!1264197 (= lt!573584 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573587 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573574 () (_ BitVec 64))

(assert (=> b!1264197 (= lt!573574 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264197 (= lt!573579 (addApplyDifferent!548 lt!573584 lt!573587 minValueAfter!43 lt!573574))))

(assert (=> b!1264197 (= (apply!1004 (+!4259 lt!573584 (tuple2!21075 lt!573587 minValueAfter!43)) lt!573574) (apply!1004 lt!573584 lt!573574))))

(declare-fun d!138711 () Bool)

(assert (=> d!138711 e!719828))

(declare-fun res!841950 () Bool)

(assert (=> d!138711 (=> (not res!841950) (not e!719828))))

(assert (=> d!138711 (= res!841950 (or (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))))

(declare-fun lt!573581 () ListLongMap!18947)

(assert (=> d!138711 (= lt!573573 lt!573581)))

(declare-fun lt!573593 () Unit!42130)

(assert (=> d!138711 (= lt!573593 e!719826)))

(declare-fun c!123109 () Bool)

(declare-fun e!719832 () Bool)

(assert (=> d!138711 (= c!123109 e!719832)))

(declare-fun res!841947 () Bool)

(assert (=> d!138711 (=> (not res!841947) (not e!719832))))

(assert (=> d!138711 (= res!841947 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138711 (= lt!573581 e!719823)))

(declare-fun c!123114 () Bool)

(assert (=> d!138711 (= c!123114 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138711 (validMask!0 mask!1466)))

(assert (=> d!138711 (= (getCurrentListMap!4656 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573573)))

(declare-fun call!62322 () ListLongMap!18947)

(declare-fun call!62318 () ListLongMap!18947)

(declare-fun bm!62314 () Bool)

(assert (=> bm!62314 (= call!62320 (+!4259 (ite c!123114 call!62317 (ite c!123112 call!62318 call!62322)) (ite (or c!123114 c!123112) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1264211 () Bool)

(assert (=> b!1264211 (= e!719821 (not call!62316))))

(declare-fun b!1264212 () Bool)

(declare-fun res!841949 () Bool)

(assert (=> b!1264212 (=> (not res!841949) (not e!719828))))

(assert (=> b!1264212 (= res!841949 e!719827)))

(declare-fun c!123110 () Bool)

(assert (=> b!1264212 (= c!123110 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62315 () Bool)

(assert (=> bm!62315 (= call!62318 call!62317)))

(declare-fun b!1264213 () Bool)

(assert (=> b!1264213 (= e!719824 call!62321)))

(declare-fun bm!62316 () Bool)

(assert (=> bm!62316 (= call!62322 call!62318)))

(declare-fun bm!62317 () Bool)

(assert (=> bm!62317 (= call!62316 (contains!7612 lt!573573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62318 () Bool)

(assert (=> bm!62318 (= call!62319 (contains!7612 lt!573573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264214 () Bool)

(assert (=> b!1264214 (= e!719833 (= (apply!1004 lt!573573 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1264215 () Bool)

(assert (=> b!1264215 (= e!719829 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62319 () Bool)

(assert (=> bm!62319 (= call!62321 call!62320)))

(declare-fun b!1264216 () Bool)

(assert (=> b!1264216 (= e!719830 call!62322)))

(declare-fun b!1264217 () Bool)

(assert (=> b!1264217 (= e!719832 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138711 c!123114) b!1264203))

(assert (= (and d!138711 (not c!123114)) b!1264209))

(assert (= (and b!1264209 c!123112) b!1264213))

(assert (= (and b!1264209 (not c!123112)) b!1264207))

(assert (= (and b!1264207 c!123113) b!1264202))

(assert (= (and b!1264207 (not c!123113)) b!1264216))

(assert (= (or b!1264202 b!1264216) bm!62316))

(assert (= (or b!1264213 bm!62316) bm!62315))

(assert (= (or b!1264213 b!1264202) bm!62319))

(assert (= (or b!1264203 bm!62315) bm!62313))

(assert (= (or b!1264203 bm!62319) bm!62314))

(assert (= (and d!138711 res!841947) b!1264217))

(assert (= (and d!138711 c!123109) b!1264197))

(assert (= (and d!138711 (not c!123109)) b!1264208))

(assert (= (and d!138711 res!841950) b!1264199))

(assert (= (and b!1264199 res!841953) b!1264215))

(assert (= (and b!1264199 (not res!841946)) b!1264201))

(assert (= (and b!1264201 res!841948) b!1264210))

(assert (= (and b!1264199 res!841952) b!1264212))

(assert (= (and b!1264212 c!123110) b!1264205))

(assert (= (and b!1264212 (not c!123110)) b!1264198))

(assert (= (and b!1264205 res!841951) b!1264206))

(assert (= (or b!1264205 b!1264198) bm!62318))

(assert (= (and b!1264212 res!841949) b!1264204))

(assert (= (and b!1264204 c!123111) b!1264200))

(assert (= (and b!1264204 (not c!123111)) b!1264211))

(assert (= (and b!1264200 res!841945) b!1264214))

(assert (= (or b!1264200 b!1264211) bm!62317))

(declare-fun b_lambda!23017 () Bool)

(assert (=> (not b_lambda!23017) (not b!1264210)))

(assert (=> b!1264210 t!41787))

(declare-fun b_and!45551 () Bool)

(assert (= b_and!45549 (and (=> t!41787 result!23413) b_and!45551)))

(declare-fun m!1164741 () Bool)

(assert (=> bm!62318 m!1164741))

(assert (=> b!1264217 m!1164679))

(assert (=> b!1264217 m!1164679))

(assert (=> b!1264217 m!1164681))

(assert (=> bm!62313 m!1164607))

(declare-fun m!1164743 () Bool)

(assert (=> bm!62314 m!1164743))

(declare-fun m!1164745 () Bool)

(assert (=> b!1264203 m!1164745))

(declare-fun m!1164747 () Bool)

(assert (=> bm!62317 m!1164747))

(declare-fun m!1164749 () Bool)

(assert (=> b!1264197 m!1164749))

(declare-fun m!1164751 () Bool)

(assert (=> b!1264197 m!1164751))

(declare-fun m!1164753 () Bool)

(assert (=> b!1264197 m!1164753))

(declare-fun m!1164755 () Bool)

(assert (=> b!1264197 m!1164755))

(assert (=> b!1264197 m!1164749))

(declare-fun m!1164757 () Bool)

(assert (=> b!1264197 m!1164757))

(declare-fun m!1164759 () Bool)

(assert (=> b!1264197 m!1164759))

(declare-fun m!1164761 () Bool)

(assert (=> b!1264197 m!1164761))

(declare-fun m!1164763 () Bool)

(assert (=> b!1264197 m!1164763))

(assert (=> b!1264197 m!1164607))

(declare-fun m!1164765 () Bool)

(assert (=> b!1264197 m!1164765))

(declare-fun m!1164767 () Bool)

(assert (=> b!1264197 m!1164767))

(assert (=> b!1264197 m!1164753))

(declare-fun m!1164769 () Bool)

(assert (=> b!1264197 m!1164769))

(declare-fun m!1164771 () Bool)

(assert (=> b!1264197 m!1164771))

(declare-fun m!1164773 () Bool)

(assert (=> b!1264197 m!1164773))

(assert (=> b!1264197 m!1164771))

(declare-fun m!1164775 () Bool)

(assert (=> b!1264197 m!1164775))

(declare-fun m!1164777 () Bool)

(assert (=> b!1264197 m!1164777))

(assert (=> b!1264197 m!1164757))

(assert (=> b!1264197 m!1164679))

(assert (=> b!1264215 m!1164679))

(assert (=> b!1264215 m!1164679))

(assert (=> b!1264215 m!1164681))

(assert (=> b!1264210 m!1164679))

(declare-fun m!1164779 () Bool)

(assert (=> b!1264210 m!1164779))

(assert (=> b!1264210 m!1164721))

(assert (=> b!1264210 m!1164723))

(assert (=> b!1264210 m!1164723))

(assert (=> b!1264210 m!1164721))

(assert (=> b!1264210 m!1164725))

(assert (=> b!1264210 m!1164679))

(assert (=> b!1264201 m!1164679))

(assert (=> b!1264201 m!1164679))

(declare-fun m!1164781 () Bool)

(assert (=> b!1264201 m!1164781))

(assert (=> d!138711 m!1164597))

(declare-fun m!1164783 () Bool)

(assert (=> b!1264206 m!1164783))

(declare-fun m!1164785 () Bool)

(assert (=> b!1264214 m!1164785))

(assert (=> b!1264079 d!138711))

(declare-fun d!138713 () Bool)

(assert (=> d!138713 (= (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573596 () Unit!42130)

(declare-fun choose!1879 (array!82480 array!82482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48601 V!48601 V!48601 V!48601 (_ BitVec 32) Int) Unit!42130)

(assert (=> d!138713 (= lt!573596 (choose!1879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138713 (validMask!0 mask!1466)))

(assert (=> d!138713 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1193 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573596)))

(declare-fun bs!35758 () Bool)

(assert (= bs!35758 d!138713))

(assert (=> bs!35758 m!1164609))

(assert (=> bs!35758 m!1164607))

(declare-fun m!1164787 () Bool)

(assert (=> bs!35758 m!1164787))

(assert (=> bs!35758 m!1164597))

(assert (=> b!1264081 d!138713))

(declare-fun b!1264242 () Bool)

(declare-fun e!719849 () ListLongMap!18947)

(declare-fun call!62325 () ListLongMap!18947)

(assert (=> b!1264242 (= e!719849 call!62325)))

(declare-fun b!1264243 () Bool)

(declare-fun e!719850 () Bool)

(declare-fun e!719852 () Bool)

(assert (=> b!1264243 (= e!719850 e!719852)))

(declare-fun c!123125 () Bool)

(assert (=> b!1264243 (= c!123125 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264244 () Bool)

(declare-fun e!719848 () Bool)

(assert (=> b!1264244 (= e!719848 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264244 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1264245 () Bool)

(declare-fun res!841962 () Bool)

(declare-fun e!719853 () Bool)

(assert (=> b!1264245 (=> (not res!841962) (not e!719853))))

(declare-fun lt!573614 () ListLongMap!18947)

(assert (=> b!1264245 (= res!841962 (not (contains!7612 lt!573614 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264246 () Bool)

(declare-fun e!719854 () Bool)

(assert (=> b!1264246 (= e!719850 e!719854)))

(assert (=> b!1264246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun res!841965 () Bool)

(assert (=> b!1264246 (= res!841965 (contains!7612 lt!573614 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264246 (=> (not res!841965) (not e!719854))))

(declare-fun d!138715 () Bool)

(assert (=> d!138715 e!719853))

(declare-fun res!841963 () Bool)

(assert (=> d!138715 (=> (not res!841963) (not e!719853))))

(assert (=> d!138715 (= res!841963 (not (contains!7612 lt!573614 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719851 () ListLongMap!18947)

(assert (=> d!138715 (= lt!573614 e!719851)))

(declare-fun c!123123 () Bool)

(assert (=> d!138715 (= c!123123 (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138715 (validMask!0 mask!1466)))

(assert (=> d!138715 (= (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573614)))

(declare-fun b!1264247 () Bool)

(assert (=> b!1264247 (= e!719851 (ListLongMap!18948 Nil!28262))))

(declare-fun b!1264248 () Bool)

(assert (=> b!1264248 (= e!719852 (= lt!573614 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264249 () Bool)

(declare-fun isEmpty!1046 (ListLongMap!18947) Bool)

(assert (=> b!1264249 (= e!719852 (isEmpty!1046 lt!573614))))

(declare-fun b!1264250 () Bool)

(declare-fun lt!573612 () Unit!42130)

(declare-fun lt!573613 () Unit!42130)

(assert (=> b!1264250 (= lt!573612 lt!573613)))

(declare-fun lt!573616 () (_ BitVec 64))

(declare-fun lt!573611 () (_ BitVec 64))

(declare-fun lt!573615 () V!48601)

(declare-fun lt!573617 () ListLongMap!18947)

(assert (=> b!1264250 (not (contains!7612 (+!4259 lt!573617 (tuple2!21075 lt!573616 lt!573615)) lt!573611))))

(declare-fun addStillNotContains!332 (ListLongMap!18947 (_ BitVec 64) V!48601 (_ BitVec 64)) Unit!42130)

(assert (=> b!1264250 (= lt!573613 (addStillNotContains!332 lt!573617 lt!573616 lt!573615 lt!573611))))

(assert (=> b!1264250 (= lt!573611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264250 (= lt!573615 (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264250 (= lt!573616 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264250 (= lt!573617 call!62325)))

(assert (=> b!1264250 (= e!719849 (+!4259 call!62325 (tuple2!21075 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264251 () Bool)

(assert (=> b!1264251 (= e!719851 e!719849)))

(declare-fun c!123126 () Bool)

(assert (=> b!1264251 (= c!123126 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264252 () Bool)

(assert (=> b!1264252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> b!1264252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _values!914)))))

(assert (=> b!1264252 (= e!719854 (= (apply!1004 lt!573614 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62322 () Bool)

(assert (=> bm!62322 (= call!62325 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264253 () Bool)

(assert (=> b!1264253 (= e!719853 e!719850)))

(declare-fun c!123124 () Bool)

(assert (=> b!1264253 (= c!123124 e!719848)))

(declare-fun res!841964 () Bool)

(assert (=> b!1264253 (=> (not res!841964) (not e!719848))))

(assert (=> b!1264253 (= res!841964 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (= (and d!138715 c!123123) b!1264247))

(assert (= (and d!138715 (not c!123123)) b!1264251))

(assert (= (and b!1264251 c!123126) b!1264250))

(assert (= (and b!1264251 (not c!123126)) b!1264242))

(assert (= (or b!1264250 b!1264242) bm!62322))

(assert (= (and d!138715 res!841963) b!1264245))

(assert (= (and b!1264245 res!841962) b!1264253))

(assert (= (and b!1264253 res!841964) b!1264244))

(assert (= (and b!1264253 c!123124) b!1264246))

(assert (= (and b!1264253 (not c!123124)) b!1264243))

(assert (= (and b!1264246 res!841965) b!1264252))

(assert (= (and b!1264243 c!123125) b!1264248))

(assert (= (and b!1264243 (not c!123125)) b!1264249))

(declare-fun b_lambda!23019 () Bool)

(assert (=> (not b_lambda!23019) (not b!1264250)))

(assert (=> b!1264250 t!41787))

(declare-fun b_and!45553 () Bool)

(assert (= b_and!45551 (and (=> t!41787 result!23413) b_and!45553)))

(declare-fun b_lambda!23021 () Bool)

(assert (=> (not b_lambda!23021) (not b!1264252)))

(assert (=> b!1264252 t!41787))

(declare-fun b_and!45555 () Bool)

(assert (= b_and!45553 (and (=> t!41787 result!23413) b_and!45555)))

(assert (=> b!1264250 m!1164723))

(declare-fun m!1164789 () Bool)

(assert (=> b!1264250 m!1164789))

(declare-fun m!1164791 () Bool)

(assert (=> b!1264250 m!1164791))

(declare-fun m!1164793 () Bool)

(assert (=> b!1264250 m!1164793))

(assert (=> b!1264250 m!1164721))

(declare-fun m!1164795 () Bool)

(assert (=> b!1264250 m!1164795))

(assert (=> b!1264250 m!1164679))

(assert (=> b!1264250 m!1164723))

(assert (=> b!1264250 m!1164721))

(assert (=> b!1264250 m!1164725))

(assert (=> b!1264250 m!1164791))

(declare-fun m!1164797 () Bool)

(assert (=> bm!62322 m!1164797))

(assert (=> b!1264252 m!1164723))

(assert (=> b!1264252 m!1164679))

(declare-fun m!1164799 () Bool)

(assert (=> b!1264252 m!1164799))

(assert (=> b!1264252 m!1164721))

(assert (=> b!1264252 m!1164679))

(assert (=> b!1264252 m!1164723))

(assert (=> b!1264252 m!1164721))

(assert (=> b!1264252 m!1164725))

(declare-fun m!1164801 () Bool)

(assert (=> b!1264245 m!1164801))

(declare-fun m!1164803 () Bool)

(assert (=> b!1264249 m!1164803))

(assert (=> b!1264246 m!1164679))

(assert (=> b!1264246 m!1164679))

(declare-fun m!1164805 () Bool)

(assert (=> b!1264246 m!1164805))

(declare-fun m!1164807 () Bool)

(assert (=> d!138715 m!1164807))

(assert (=> d!138715 m!1164597))

(assert (=> b!1264248 m!1164797))

(assert (=> b!1264251 m!1164679))

(assert (=> b!1264251 m!1164679))

(assert (=> b!1264251 m!1164681))

(assert (=> b!1264244 m!1164679))

(assert (=> b!1264244 m!1164679))

(assert (=> b!1264244 m!1164681))

(assert (=> b!1264081 d!138715))

(declare-fun b!1264254 () Bool)

(declare-fun e!719856 () ListLongMap!18947)

(declare-fun call!62326 () ListLongMap!18947)

(assert (=> b!1264254 (= e!719856 call!62326)))

(declare-fun b!1264255 () Bool)

(declare-fun e!719857 () Bool)

(declare-fun e!719859 () Bool)

(assert (=> b!1264255 (= e!719857 e!719859)))

(declare-fun c!123129 () Bool)

(assert (=> b!1264255 (= c!123129 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun b!1264256 () Bool)

(declare-fun e!719855 () Bool)

(assert (=> b!1264256 (= e!719855 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264256 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1264257 () Bool)

(declare-fun res!841966 () Bool)

(declare-fun e!719860 () Bool)

(assert (=> b!1264257 (=> (not res!841966) (not e!719860))))

(declare-fun lt!573621 () ListLongMap!18947)

(assert (=> b!1264257 (= res!841966 (not (contains!7612 lt!573621 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264258 () Bool)

(declare-fun e!719861 () Bool)

(assert (=> b!1264258 (= e!719857 e!719861)))

(assert (=> b!1264258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(declare-fun res!841969 () Bool)

(assert (=> b!1264258 (= res!841969 (contains!7612 lt!573621 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264258 (=> (not res!841969) (not e!719861))))

(declare-fun d!138717 () Bool)

(assert (=> d!138717 e!719860))

(declare-fun res!841967 () Bool)

(assert (=> d!138717 (=> (not res!841967) (not e!719860))))

(assert (=> d!138717 (= res!841967 (not (contains!7612 lt!573621 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719858 () ListLongMap!18947)

(assert (=> d!138717 (= lt!573621 e!719858)))

(declare-fun c!123127 () Bool)

(assert (=> d!138717 (= c!123127 (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138717 (validMask!0 mask!1466)))

(assert (=> d!138717 (= (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573621)))

(declare-fun b!1264259 () Bool)

(assert (=> b!1264259 (= e!719858 (ListLongMap!18948 Nil!28262))))

(declare-fun b!1264260 () Bool)

(assert (=> b!1264260 (= e!719859 (= lt!573621 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264261 () Bool)

(assert (=> b!1264261 (= e!719859 (isEmpty!1046 lt!573621))))

(declare-fun b!1264262 () Bool)

(declare-fun lt!573619 () Unit!42130)

(declare-fun lt!573620 () Unit!42130)

(assert (=> b!1264262 (= lt!573619 lt!573620)))

(declare-fun lt!573623 () (_ BitVec 64))

(declare-fun lt!573618 () (_ BitVec 64))

(declare-fun lt!573622 () V!48601)

(declare-fun lt!573624 () ListLongMap!18947)

(assert (=> b!1264262 (not (contains!7612 (+!4259 lt!573624 (tuple2!21075 lt!573623 lt!573622)) lt!573618))))

(assert (=> b!1264262 (= lt!573620 (addStillNotContains!332 lt!573624 lt!573623 lt!573622 lt!573618))))

(assert (=> b!1264262 (= lt!573618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264262 (= lt!573622 (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264262 (= lt!573623 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264262 (= lt!573624 call!62326)))

(assert (=> b!1264262 (= e!719856 (+!4259 call!62326 (tuple2!21075 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264263 () Bool)

(assert (=> b!1264263 (= e!719858 e!719856)))

(declare-fun c!123130 () Bool)

(assert (=> b!1264263 (= c!123130 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264264 () Bool)

(assert (=> b!1264264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> b!1264264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40320 _values!914)))))

(assert (=> b!1264264 (= e!719861 (= (apply!1004 lt!573621 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)) (get!20297 (select (arr!39784 _values!914) #b00000000000000000000000000000000) (dynLambda!3402 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62323 () Bool)

(assert (=> bm!62323 (= call!62326 (getCurrentListMapNoExtraKeys!5851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264265 () Bool)

(assert (=> b!1264265 (= e!719860 e!719857)))

(declare-fun c!123128 () Bool)

(assert (=> b!1264265 (= c!123128 e!719855)))

(declare-fun res!841968 () Bool)

(assert (=> b!1264265 (=> (not res!841968) (not e!719855))))

(assert (=> b!1264265 (= res!841968 (bvslt #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (= (and d!138717 c!123127) b!1264259))

(assert (= (and d!138717 (not c!123127)) b!1264263))

(assert (= (and b!1264263 c!123130) b!1264262))

(assert (= (and b!1264263 (not c!123130)) b!1264254))

(assert (= (or b!1264262 b!1264254) bm!62323))

(assert (= (and d!138717 res!841967) b!1264257))

(assert (= (and b!1264257 res!841966) b!1264265))

(assert (= (and b!1264265 res!841968) b!1264256))

(assert (= (and b!1264265 c!123128) b!1264258))

(assert (= (and b!1264265 (not c!123128)) b!1264255))

(assert (= (and b!1264258 res!841969) b!1264264))

(assert (= (and b!1264255 c!123129) b!1264260))

(assert (= (and b!1264255 (not c!123129)) b!1264261))

(declare-fun b_lambda!23023 () Bool)

(assert (=> (not b_lambda!23023) (not b!1264262)))

(assert (=> b!1264262 t!41787))

(declare-fun b_and!45557 () Bool)

(assert (= b_and!45555 (and (=> t!41787 result!23413) b_and!45557)))

(declare-fun b_lambda!23025 () Bool)

(assert (=> (not b_lambda!23025) (not b!1264264)))

(assert (=> b!1264264 t!41787))

(declare-fun b_and!45559 () Bool)

(assert (= b_and!45557 (and (=> t!41787 result!23413) b_and!45559)))

(assert (=> b!1264262 m!1164723))

(declare-fun m!1164809 () Bool)

(assert (=> b!1264262 m!1164809))

(declare-fun m!1164811 () Bool)

(assert (=> b!1264262 m!1164811))

(declare-fun m!1164813 () Bool)

(assert (=> b!1264262 m!1164813))

(assert (=> b!1264262 m!1164721))

(declare-fun m!1164815 () Bool)

(assert (=> b!1264262 m!1164815))

(assert (=> b!1264262 m!1164679))

(assert (=> b!1264262 m!1164723))

(assert (=> b!1264262 m!1164721))

(assert (=> b!1264262 m!1164725))

(assert (=> b!1264262 m!1164811))

(declare-fun m!1164817 () Bool)

(assert (=> bm!62323 m!1164817))

(assert (=> b!1264264 m!1164723))

(assert (=> b!1264264 m!1164679))

(declare-fun m!1164819 () Bool)

(assert (=> b!1264264 m!1164819))

(assert (=> b!1264264 m!1164721))

(assert (=> b!1264264 m!1164679))

(assert (=> b!1264264 m!1164723))

(assert (=> b!1264264 m!1164721))

(assert (=> b!1264264 m!1164725))

(declare-fun m!1164821 () Bool)

(assert (=> b!1264257 m!1164821))

(declare-fun m!1164823 () Bool)

(assert (=> b!1264261 m!1164823))

(assert (=> b!1264258 m!1164679))

(assert (=> b!1264258 m!1164679))

(declare-fun m!1164825 () Bool)

(assert (=> b!1264258 m!1164825))

(declare-fun m!1164827 () Bool)

(assert (=> d!138717 m!1164827))

(assert (=> d!138717 m!1164597))

(assert (=> b!1264260 m!1164817))

(assert (=> b!1264263 m!1164679))

(assert (=> b!1264263 m!1164679))

(assert (=> b!1264263 m!1164681))

(assert (=> b!1264256 m!1164679))

(assert (=> b!1264256 m!1164679))

(assert (=> b!1264256 m!1164681))

(assert (=> b!1264081 d!138717))

(declare-fun b!1264274 () Bool)

(declare-fun e!719868 () Bool)

(declare-fun call!62329 () Bool)

(assert (=> b!1264274 (= e!719868 call!62329)))

(declare-fun b!1264275 () Bool)

(declare-fun e!719870 () Bool)

(assert (=> b!1264275 (= e!719870 call!62329)))

(declare-fun b!1264276 () Bool)

(declare-fun e!719869 () Bool)

(assert (=> b!1264276 (= e!719869 e!719868)))

(declare-fun c!123133 () Bool)

(assert (=> b!1264276 (= c!123133 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264277 () Bool)

(assert (=> b!1264277 (= e!719868 e!719870)))

(declare-fun lt!573632 () (_ BitVec 64))

(assert (=> b!1264277 (= lt!573632 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573631 () Unit!42130)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82480 (_ BitVec 64) (_ BitVec 32)) Unit!42130)

(assert (=> b!1264277 (= lt!573631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573632 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264277 (arrayContainsKey!0 _keys!1118 lt!573632 #b00000000000000000000000000000000)))

(declare-fun lt!573633 () Unit!42130)

(assert (=> b!1264277 (= lt!573633 lt!573631)))

(declare-fun res!841975 () Bool)

(declare-datatypes ((SeekEntryResult!9982 0))(
  ( (MissingZero!9982 (index!42299 (_ BitVec 32))) (Found!9982 (index!42300 (_ BitVec 32))) (Intermediate!9982 (undefined!10794 Bool) (index!42301 (_ BitVec 32)) (x!111385 (_ BitVec 32))) (Undefined!9982) (MissingVacant!9982 (index!42302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82480 (_ BitVec 32)) SeekEntryResult!9982)

(assert (=> b!1264277 (= res!841975 (= (seekEntryOrOpen!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9982 #b00000000000000000000000000000000)))))

(assert (=> b!1264277 (=> (not res!841975) (not e!719870))))

(declare-fun bm!62326 () Bool)

(assert (=> bm!62326 (= call!62329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138719 () Bool)

(declare-fun res!841974 () Bool)

(assert (=> d!138719 (=> res!841974 e!719869)))

(assert (=> d!138719 (= res!841974 (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719869)))

(assert (= (and d!138719 (not res!841974)) b!1264276))

(assert (= (and b!1264276 c!123133) b!1264277))

(assert (= (and b!1264276 (not c!123133)) b!1264274))

(assert (= (and b!1264277 res!841975) b!1264275))

(assert (= (or b!1264275 b!1264274) bm!62326))

(assert (=> b!1264276 m!1164679))

(assert (=> b!1264276 m!1164679))

(assert (=> b!1264276 m!1164681))

(assert (=> b!1264277 m!1164679))

(declare-fun m!1164829 () Bool)

(assert (=> b!1264277 m!1164829))

(declare-fun m!1164831 () Bool)

(assert (=> b!1264277 m!1164831))

(assert (=> b!1264277 m!1164679))

(declare-fun m!1164833 () Bool)

(assert (=> b!1264277 m!1164833))

(declare-fun m!1164835 () Bool)

(assert (=> bm!62326 m!1164835))

(assert (=> b!1264080 d!138719))

(declare-fun b!1264288 () Bool)

(declare-fun e!719879 () Bool)

(declare-fun e!719881 () Bool)

(assert (=> b!1264288 (= e!719879 e!719881)))

(declare-fun c!123136 () Bool)

(assert (=> b!1264288 (= c!123136 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264290 () Bool)

(declare-fun call!62332 () Bool)

(assert (=> b!1264290 (= e!719881 call!62332)))

(declare-fun bm!62329 () Bool)

(assert (=> bm!62329 (= call!62332 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123136 (Cons!28260 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000) Nil!28261) Nil!28261)))))

(declare-fun b!1264291 () Bool)

(declare-fun e!719882 () Bool)

(declare-fun contains!7615 (List!28264 (_ BitVec 64)) Bool)

(assert (=> b!1264291 (= e!719882 (contains!7615 Nil!28261 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264292 () Bool)

(declare-fun e!719880 () Bool)

(assert (=> b!1264292 (= e!719880 e!719879)))

(declare-fun res!841982 () Bool)

(assert (=> b!1264292 (=> (not res!841982) (not e!719879))))

(assert (=> b!1264292 (= res!841982 (not e!719882))))

(declare-fun res!841983 () Bool)

(assert (=> b!1264292 (=> (not res!841983) (not e!719882))))

(assert (=> b!1264292 (= res!841983 (validKeyInArray!0 (select (arr!39783 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264289 () Bool)

(assert (=> b!1264289 (= e!719881 call!62332)))

(declare-fun d!138721 () Bool)

(declare-fun res!841984 () Bool)

(assert (=> d!138721 (=> res!841984 e!719880)))

(assert (=> d!138721 (= res!841984 (bvsge #b00000000000000000000000000000000 (size!40319 _keys!1118)))))

(assert (=> d!138721 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28261) e!719880)))

(assert (= (and d!138721 (not res!841984)) b!1264292))

(assert (= (and b!1264292 res!841983) b!1264291))

(assert (= (and b!1264292 res!841982) b!1264288))

(assert (= (and b!1264288 c!123136) b!1264289))

(assert (= (and b!1264288 (not c!123136)) b!1264290))

(assert (= (or b!1264289 b!1264290) bm!62329))

(assert (=> b!1264288 m!1164679))

(assert (=> b!1264288 m!1164679))

(assert (=> b!1264288 m!1164681))

(assert (=> bm!62329 m!1164679))

(declare-fun m!1164837 () Bool)

(assert (=> bm!62329 m!1164837))

(assert (=> b!1264291 m!1164679))

(assert (=> b!1264291 m!1164679))

(declare-fun m!1164839 () Bool)

(assert (=> b!1264291 m!1164839))

(assert (=> b!1264292 m!1164679))

(assert (=> b!1264292 m!1164679))

(assert (=> b!1264292 m!1164681))

(assert (=> b!1264077 d!138721))

(declare-fun mapNonEmpty!50479 () Bool)

(declare-fun mapRes!50479 () Bool)

(declare-fun tp!96146 () Bool)

(declare-fun e!719888 () Bool)

(assert (=> mapNonEmpty!50479 (= mapRes!50479 (and tp!96146 e!719888))))

(declare-fun mapRest!50479 () (Array (_ BitVec 32) ValueCell!15450))

(declare-fun mapKey!50479 () (_ BitVec 32))

(declare-fun mapValue!50479 () ValueCell!15450)

(assert (=> mapNonEmpty!50479 (= mapRest!50473 (store mapRest!50479 mapKey!50479 mapValue!50479))))

(declare-fun b!1264300 () Bool)

(declare-fun e!719887 () Bool)

(assert (=> b!1264300 (= e!719887 tp_is_empty!32427)))

(declare-fun mapIsEmpty!50479 () Bool)

(assert (=> mapIsEmpty!50479 mapRes!50479))

(declare-fun b!1264299 () Bool)

(assert (=> b!1264299 (= e!719888 tp_is_empty!32427)))

(declare-fun condMapEmpty!50479 () Bool)

(declare-fun mapDefault!50479 () ValueCell!15450)

(assert (=> mapNonEmpty!50473 (= condMapEmpty!50479 (= mapRest!50473 ((as const (Array (_ BitVec 32) ValueCell!15450)) mapDefault!50479)))))

(assert (=> mapNonEmpty!50473 (= tp!96136 (and e!719887 mapRes!50479))))

(assert (= (and mapNonEmpty!50473 condMapEmpty!50479) mapIsEmpty!50479))

(assert (= (and mapNonEmpty!50473 (not condMapEmpty!50479)) mapNonEmpty!50479))

(assert (= (and mapNonEmpty!50479 ((_ is ValueCellFull!15450) mapValue!50479)) b!1264299))

(assert (= (and mapNonEmpty!50473 ((_ is ValueCellFull!15450) mapDefault!50479)) b!1264300))

(declare-fun m!1164841 () Bool)

(assert (=> mapNonEmpty!50479 m!1164841))

(declare-fun b_lambda!23027 () Bool)

(assert (= b_lambda!23015 (or (and start!106168 b_free!27525) b_lambda!23027)))

(declare-fun b_lambda!23029 () Bool)

(assert (= b_lambda!23019 (or (and start!106168 b_free!27525) b_lambda!23029)))

(declare-fun b_lambda!23031 () Bool)

(assert (= b_lambda!23021 (or (and start!106168 b_free!27525) b_lambda!23031)))

(declare-fun b_lambda!23033 () Bool)

(assert (= b_lambda!23025 (or (and start!106168 b_free!27525) b_lambda!23033)))

(declare-fun b_lambda!23035 () Bool)

(assert (= b_lambda!23023 (or (and start!106168 b_free!27525) b_lambda!23035)))

(declare-fun b_lambda!23037 () Bool)

(assert (= b_lambda!23017 (or (and start!106168 b_free!27525) b_lambda!23037)))

(check-sat (not d!138713) (not d!138709) (not bm!62318) (not b!1264262) (not b!1264248) (not b!1264201) (not b!1264215) (not b!1264249) (not d!138703) b_and!45559 (not b_lambda!23027) (not b!1264291) (not b!1264251) (not b!1264210) (not bm!62329) (not b!1264171) (not bm!62314) (not b!1264194) (not b_lambda!23029) (not b_lambda!23031) (not bm!62326) (not b!1264174) (not b_lambda!23037) (not b!1264119) (not b!1264206) (not b!1264250) (not b!1264214) (not d!138717) (not b!1264260) (not b!1264182) (not bm!62311) (not b!1264277) (not d!138705) (not b!1264245) (not bm!62307) (not b!1264263) (not d!138707) (not d!138715) (not b!1264165) (not d!138695) (not bm!62306) (not b!1264185) (not b!1264118) (not b!1264261) (not b_lambda!23035) (not b!1264252) (not bm!62323) (not b!1264183) (not d!138711) (not b!1264117) (not b!1264244) (not b!1264120) (not b!1264178) (not b!1264196) (not b!1264257) (not b!1264217) (not b!1264197) (not bm!62313) (not b!1264276) (not mapNonEmpty!50479) (not b!1264122) tp_is_empty!32427 (not b!1264288) (not bm!62310) (not bm!62322) (not b!1264169) (not b!1264292) (not b!1264264) (not b_lambda!23033) (not b!1264258) (not b!1264256) (not b_next!27525) (not b!1264203) (not b!1264246) (not b!1264121) (not bm!62317))
(check-sat b_and!45559 (not b_next!27525))
