; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106342 () Bool)

(assert start!106342)

(declare-fun b_free!27511 () Bool)

(declare-fun b_next!27511 () Bool)

(assert (=> start!106342 (= b_free!27511 (not b_next!27511))))

(declare-fun tp!96089 () Bool)

(declare-fun b_and!45509 () Bool)

(assert (=> start!106342 (= tp!96089 b_and!45509)))

(declare-fun b!1264835 () Bool)

(declare-fun e!720221 () Bool)

(declare-fun e!720222 () Bool)

(declare-fun mapRes!50446 () Bool)

(assert (=> b!1264835 (= e!720221 (and e!720222 mapRes!50446))))

(declare-fun condMapEmpty!50446 () Bool)

(declare-datatypes ((V!48583 0))(
  ( (V!48584 (val!16269 Int)) )
))
(declare-datatypes ((ValueCell!15443 0))(
  ( (ValueCellFull!15443 (v!18976 V!48583)) (EmptyCell!15443) )
))
(declare-datatypes ((array!82495 0))(
  ( (array!82496 (arr!39788 (Array (_ BitVec 32) ValueCell!15443)) (size!40325 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82495)

(declare-fun mapDefault!50446 () ValueCell!15443)

(assert (=> b!1264835 (= condMapEmpty!50446 (= (arr!39788 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15443)) mapDefault!50446)))))

(declare-fun b!1264836 () Bool)

(declare-fun res!842121 () Bool)

(declare-fun e!720220 () Bool)

(assert (=> b!1264836 (=> (not res!842121) (not e!720220))))

(declare-datatypes ((array!82497 0))(
  ( (array!82498 (arr!39789 (Array (_ BitVec 32) (_ BitVec 64))) (size!40326 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82497)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82497 (_ BitVec 32)) Bool)

(assert (=> b!1264836 (= res!842121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!842124 () Bool)

(assert (=> start!106342 (=> (not res!842124) (not e!720220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106342 (= res!842124 (validMask!0 mask!1466))))

(assert (=> start!106342 e!720220))

(assert (=> start!106342 true))

(assert (=> start!106342 tp!96089))

(declare-fun tp_is_empty!32413 () Bool)

(assert (=> start!106342 tp_is_empty!32413))

(declare-fun array_inv!30445 (array!82497) Bool)

(assert (=> start!106342 (array_inv!30445 _keys!1118)))

(declare-fun array_inv!30446 (array!82495) Bool)

(assert (=> start!106342 (and (array_inv!30446 _values!914) e!720221)))

(declare-fun b!1264837 () Bool)

(declare-fun res!842122 () Bool)

(assert (=> b!1264837 (=> (not res!842122) (not e!720220))))

(declare-datatypes ((List!28293 0))(
  ( (Nil!28290) (Cons!28289 (h!29507 (_ BitVec 64)) (t!41800 List!28293)) )
))
(declare-fun arrayNoDuplicates!0 (array!82497 (_ BitVec 32) List!28293) Bool)

(assert (=> b!1264837 (= res!842122 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28290))))

(declare-fun b!1264838 () Bool)

(declare-fun res!842123 () Bool)

(assert (=> b!1264838 (=> (not res!842123) (not e!720220))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1264838 (= res!842123 (and (= (size!40325 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40326 _keys!1118) (size!40325 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1264839 () Bool)

(declare-fun e!720219 () Bool)

(declare-fun zeroValue!871 () V!48583)

(declare-datatypes ((tuple2!21072 0))(
  ( (tuple2!21073 (_1!10547 (_ BitVec 64)) (_2!10547 V!48583)) )
))
(declare-datatypes ((List!28294 0))(
  ( (Nil!28291) (Cons!28290 (h!29508 tuple2!21072) (t!41801 List!28294)) )
))
(declare-datatypes ((ListLongMap!18953 0))(
  ( (ListLongMap!18954 (toList!9492 List!28294)) )
))
(declare-fun lt!573549 () ListLongMap!18953)

(declare-fun minValueBefore!43 () V!48583)

(declare-fun getCurrentListMap!4644 (array!82497 array!82495 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!18953)

(declare-fun +!4300 (ListLongMap!18953 tuple2!21072) ListLongMap!18953)

(assert (=> b!1264839 (= e!720219 (= (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4300 (+!4300 lt!573549 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun minValueAfter!43 () V!48583)

(declare-fun lt!573548 () ListLongMap!18953)

(assert (=> b!1264839 (= lt!573548 (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50446 () Bool)

(assert (=> mapIsEmpty!50446 mapRes!50446))

(declare-fun b!1264840 () Bool)

(assert (=> b!1264840 (= e!720220 (not e!720219))))

(declare-fun res!842125 () Bool)

(assert (=> b!1264840 (=> res!842125 e!720219)))

(assert (=> b!1264840 (= res!842125 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!573551 () ListLongMap!18953)

(assert (=> b!1264840 (= lt!573549 lt!573551)))

(declare-datatypes ((Unit!42089 0))(
  ( (Unit!42090) )
))
(declare-fun lt!573550 () Unit!42089)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1185 (array!82497 array!82495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 V!48583 V!48583 (_ BitVec 32) Int) Unit!42089)

(assert (=> b!1264840 (= lt!573550 (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5895 (array!82497 array!82495 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!18953)

(assert (=> b!1264840 (= lt!573551 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264840 (= lt!573549 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264841 () Bool)

(declare-fun e!720218 () Bool)

(assert (=> b!1264841 (= e!720218 tp_is_empty!32413)))

(declare-fun mapNonEmpty!50446 () Bool)

(declare-fun tp!96088 () Bool)

(assert (=> mapNonEmpty!50446 (= mapRes!50446 (and tp!96088 e!720218))))

(declare-fun mapValue!50446 () ValueCell!15443)

(declare-fun mapRest!50446 () (Array (_ BitVec 32) ValueCell!15443))

(declare-fun mapKey!50446 () (_ BitVec 32))

(assert (=> mapNonEmpty!50446 (= (arr!39788 _values!914) (store mapRest!50446 mapKey!50446 mapValue!50446))))

(declare-fun b!1264842 () Bool)

(assert (=> b!1264842 (= e!720222 tp_is_empty!32413)))

(assert (= (and start!106342 res!842124) b!1264838))

(assert (= (and b!1264838 res!842123) b!1264836))

(assert (= (and b!1264836 res!842121) b!1264837))

(assert (= (and b!1264837 res!842122) b!1264840))

(assert (= (and b!1264840 (not res!842125)) b!1264839))

(assert (= (and b!1264835 condMapEmpty!50446) mapIsEmpty!50446))

(assert (= (and b!1264835 (not condMapEmpty!50446)) mapNonEmpty!50446))

(get-info :version)

(assert (= (and mapNonEmpty!50446 ((_ is ValueCellFull!15443) mapValue!50446)) b!1264841))

(assert (= (and b!1264835 ((_ is ValueCellFull!15443) mapDefault!50446)) b!1264842))

(assert (= start!106342 b!1264835))

(declare-fun m!1165625 () Bool)

(assert (=> b!1264840 m!1165625))

(declare-fun m!1165627 () Bool)

(assert (=> b!1264840 m!1165627))

(declare-fun m!1165629 () Bool)

(assert (=> b!1264840 m!1165629))

(declare-fun m!1165631 () Bool)

(assert (=> mapNonEmpty!50446 m!1165631))

(declare-fun m!1165633 () Bool)

(assert (=> b!1264839 m!1165633))

(declare-fun m!1165635 () Bool)

(assert (=> b!1264839 m!1165635))

(assert (=> b!1264839 m!1165635))

(declare-fun m!1165637 () Bool)

(assert (=> b!1264839 m!1165637))

(declare-fun m!1165639 () Bool)

(assert (=> b!1264839 m!1165639))

(declare-fun m!1165641 () Bool)

(assert (=> b!1264837 m!1165641))

(declare-fun m!1165643 () Bool)

(assert (=> start!106342 m!1165643))

(declare-fun m!1165645 () Bool)

(assert (=> start!106342 m!1165645))

(declare-fun m!1165647 () Bool)

(assert (=> start!106342 m!1165647))

(declare-fun m!1165649 () Bool)

(assert (=> b!1264836 m!1165649))

(check-sat b_and!45509 (not b!1264839) (not b!1264840) (not start!106342) (not b!1264837) tp_is_empty!32413 (not b!1264836) (not b_next!27511) (not mapNonEmpty!50446))
(check-sat b_and!45509 (not b_next!27511))
(get-model)

(declare-fun d!139089 () Bool)

(assert (=> d!139089 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106342 d!139089))

(declare-fun d!139091 () Bool)

(assert (=> d!139091 (= (array_inv!30445 _keys!1118) (bvsge (size!40326 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106342 d!139091))

(declare-fun d!139093 () Bool)

(assert (=> d!139093 (= (array_inv!30446 _values!914) (bvsge (size!40325 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106342 d!139093))

(declare-fun b!1264933 () Bool)

(declare-fun e!720294 () Unit!42089)

(declare-fun lt!573625 () Unit!42089)

(assert (=> b!1264933 (= e!720294 lt!573625)))

(declare-fun lt!573628 () ListLongMap!18953)

(assert (=> b!1264933 (= lt!573628 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573641 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573633 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573633 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573624 () Unit!42089)

(declare-fun addStillContains!1100 (ListLongMap!18953 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!42089)

(assert (=> b!1264933 (= lt!573624 (addStillContains!1100 lt!573628 lt!573641 zeroValue!871 lt!573633))))

(declare-fun contains!7631 (ListLongMap!18953 (_ BitVec 64)) Bool)

(assert (=> b!1264933 (contains!7631 (+!4300 lt!573628 (tuple2!21073 lt!573641 zeroValue!871)) lt!573633)))

(declare-fun lt!573626 () Unit!42089)

(assert (=> b!1264933 (= lt!573626 lt!573624)))

(declare-fun lt!573621 () ListLongMap!18953)

(assert (=> b!1264933 (= lt!573621 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573627 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573627 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573635 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573635 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573620 () Unit!42089)

(declare-fun addApplyDifferent!542 (ListLongMap!18953 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!42089)

(assert (=> b!1264933 (= lt!573620 (addApplyDifferent!542 lt!573621 lt!573627 minValueBefore!43 lt!573635))))

(declare-fun apply!1011 (ListLongMap!18953 (_ BitVec 64)) V!48583)

(assert (=> b!1264933 (= (apply!1011 (+!4300 lt!573621 (tuple2!21073 lt!573627 minValueBefore!43)) lt!573635) (apply!1011 lt!573621 lt!573635))))

(declare-fun lt!573640 () Unit!42089)

(assert (=> b!1264933 (= lt!573640 lt!573620)))

(declare-fun lt!573623 () ListLongMap!18953)

(assert (=> b!1264933 (= lt!573623 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573638 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573632 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573632 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573630 () Unit!42089)

(assert (=> b!1264933 (= lt!573630 (addApplyDifferent!542 lt!573623 lt!573638 zeroValue!871 lt!573632))))

(assert (=> b!1264933 (= (apply!1011 (+!4300 lt!573623 (tuple2!21073 lt!573638 zeroValue!871)) lt!573632) (apply!1011 lt!573623 lt!573632))))

(declare-fun lt!573637 () Unit!42089)

(assert (=> b!1264933 (= lt!573637 lt!573630)))

(declare-fun lt!573631 () ListLongMap!18953)

(assert (=> b!1264933 (= lt!573631 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573636 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573636 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573634 () (_ BitVec 64))

(assert (=> b!1264933 (= lt!573634 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264933 (= lt!573625 (addApplyDifferent!542 lt!573631 lt!573636 minValueBefore!43 lt!573634))))

(assert (=> b!1264933 (= (apply!1011 (+!4300 lt!573631 (tuple2!21073 lt!573636 minValueBefore!43)) lt!573634) (apply!1011 lt!573631 lt!573634))))

(declare-fun b!1264934 () Bool)

(declare-fun e!720298 () ListLongMap!18953)

(declare-fun call!62301 () ListLongMap!18953)

(assert (=> b!1264934 (= e!720298 (+!4300 call!62301 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1264935 () Bool)

(declare-fun lt!573639 () ListLongMap!18953)

(declare-fun e!720295 () Bool)

(declare-fun get!20342 (ValueCell!15443 V!48583) V!48583)

(declare-fun dynLambda!3463 (Int (_ BitVec 64)) V!48583)

(assert (=> b!1264935 (= e!720295 (= (apply!1011 lt!573639 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40325 _values!914)))))

(assert (=> b!1264935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun call!62299 () ListLongMap!18953)

(declare-fun bm!62295 () Bool)

(assert (=> bm!62295 (= call!62299 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264936 () Bool)

(declare-fun e!720296 () ListLongMap!18953)

(declare-fun call!62300 () ListLongMap!18953)

(assert (=> b!1264936 (= e!720296 call!62300)))

(declare-fun bm!62296 () Bool)

(declare-fun call!62302 () Bool)

(assert (=> bm!62296 (= call!62302 (contains!7631 lt!573639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264937 () Bool)

(declare-fun e!720288 () Bool)

(declare-fun e!720291 () Bool)

(assert (=> b!1264937 (= e!720288 e!720291)))

(declare-fun res!842176 () Bool)

(declare-fun call!62303 () Bool)

(assert (=> b!1264937 (= res!842176 call!62303)))

(assert (=> b!1264937 (=> (not res!842176) (not e!720291))))

(declare-fun d!139095 () Bool)

(declare-fun e!720293 () Bool)

(assert (=> d!139095 e!720293))

(declare-fun res!842180 () Bool)

(assert (=> d!139095 (=> (not res!842180) (not e!720293))))

(assert (=> d!139095 (= res!842180 (or (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))))

(declare-fun lt!573622 () ListLongMap!18953)

(assert (=> d!139095 (= lt!573639 lt!573622)))

(declare-fun lt!573629 () Unit!42089)

(assert (=> d!139095 (= lt!573629 e!720294)))

(declare-fun c!123409 () Bool)

(declare-fun e!720286 () Bool)

(assert (=> d!139095 (= c!123409 e!720286)))

(declare-fun res!842174 () Bool)

(assert (=> d!139095 (=> (not res!842174) (not e!720286))))

(assert (=> d!139095 (= res!842174 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139095 (= lt!573622 e!720298)))

(declare-fun c!123410 () Bool)

(assert (=> d!139095 (= c!123410 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139095 (validMask!0 mask!1466)))

(assert (=> d!139095 (= (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573639)))

(declare-fun bm!62297 () Bool)

(assert (=> bm!62297 (= call!62300 call!62301)))

(declare-fun b!1264938 () Bool)

(declare-fun c!123408 () Bool)

(assert (=> b!1264938 (= c!123408 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!720287 () ListLongMap!18953)

(assert (=> b!1264938 (= e!720287 e!720296)))

(declare-fun bm!62298 () Bool)

(declare-fun call!62304 () ListLongMap!18953)

(declare-fun call!62298 () ListLongMap!18953)

(assert (=> bm!62298 (= call!62304 call!62298)))

(declare-fun b!1264939 () Bool)

(declare-fun res!842181 () Bool)

(assert (=> b!1264939 (=> (not res!842181) (not e!720293))))

(declare-fun e!720289 () Bool)

(assert (=> b!1264939 (= res!842181 e!720289)))

(declare-fun res!842179 () Bool)

(assert (=> b!1264939 (=> res!842179 e!720289)))

(declare-fun e!720290 () Bool)

(assert (=> b!1264939 (= res!842179 (not e!720290))))

(declare-fun res!842177 () Bool)

(assert (=> b!1264939 (=> (not res!842177) (not e!720290))))

(assert (=> b!1264939 (= res!842177 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1264940 () Bool)

(assert (=> b!1264940 (= e!720291 (= (apply!1011 lt!573639 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62299 () Bool)

(assert (=> bm!62299 (= call!62298 call!62299)))

(declare-fun b!1264941 () Bool)

(declare-fun Unit!42091 () Unit!42089)

(assert (=> b!1264941 (= e!720294 Unit!42091)))

(declare-fun b!1264942 () Bool)

(assert (=> b!1264942 (= e!720288 (not call!62303))))

(declare-fun b!1264943 () Bool)

(declare-fun res!842175 () Bool)

(assert (=> b!1264943 (=> (not res!842175) (not e!720293))))

(declare-fun e!720297 () Bool)

(assert (=> b!1264943 (= res!842175 e!720297)))

(declare-fun c!123411 () Bool)

(assert (=> b!1264943 (= c!123411 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264944 () Bool)

(declare-fun e!720292 () Bool)

(assert (=> b!1264944 (= e!720292 (= (apply!1011 lt!573639 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264945 () Bool)

(assert (=> b!1264945 (= e!720298 e!720287)))

(declare-fun c!123413 () Bool)

(assert (=> b!1264945 (= c!123413 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62300 () Bool)

(assert (=> bm!62300 (= call!62301 (+!4300 (ite c!123410 call!62299 (ite c!123413 call!62298 call!62304)) (ite (or c!123410 c!123413) (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1264946 () Bool)

(assert (=> b!1264946 (= e!720287 call!62300)))

(declare-fun b!1264947 () Bool)

(assert (=> b!1264947 (= e!720296 call!62304)))

(declare-fun b!1264948 () Bool)

(assert (=> b!1264948 (= e!720293 e!720288)))

(declare-fun c!123412 () Bool)

(assert (=> b!1264948 (= c!123412 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264949 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264949 (= e!720290 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264950 () Bool)

(assert (=> b!1264950 (= e!720297 (not call!62302))))

(declare-fun b!1264951 () Bool)

(assert (=> b!1264951 (= e!720286 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264952 () Bool)

(assert (=> b!1264952 (= e!720289 e!720295)))

(declare-fun res!842178 () Bool)

(assert (=> b!1264952 (=> (not res!842178) (not e!720295))))

(assert (=> b!1264952 (= res!842178 (contains!7631 lt!573639 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun bm!62301 () Bool)

(assert (=> bm!62301 (= call!62303 (contains!7631 lt!573639 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264953 () Bool)

(assert (=> b!1264953 (= e!720297 e!720292)))

(declare-fun res!842182 () Bool)

(assert (=> b!1264953 (= res!842182 call!62302)))

(assert (=> b!1264953 (=> (not res!842182) (not e!720292))))

(assert (= (and d!139095 c!123410) b!1264934))

(assert (= (and d!139095 (not c!123410)) b!1264945))

(assert (= (and b!1264945 c!123413) b!1264946))

(assert (= (and b!1264945 (not c!123413)) b!1264938))

(assert (= (and b!1264938 c!123408) b!1264936))

(assert (= (and b!1264938 (not c!123408)) b!1264947))

(assert (= (or b!1264936 b!1264947) bm!62298))

(assert (= (or b!1264946 bm!62298) bm!62299))

(assert (= (or b!1264946 b!1264936) bm!62297))

(assert (= (or b!1264934 bm!62299) bm!62295))

(assert (= (or b!1264934 bm!62297) bm!62300))

(assert (= (and d!139095 res!842174) b!1264951))

(assert (= (and d!139095 c!123409) b!1264933))

(assert (= (and d!139095 (not c!123409)) b!1264941))

(assert (= (and d!139095 res!842180) b!1264939))

(assert (= (and b!1264939 res!842177) b!1264949))

(assert (= (and b!1264939 (not res!842179)) b!1264952))

(assert (= (and b!1264952 res!842178) b!1264935))

(assert (= (and b!1264939 res!842181) b!1264943))

(assert (= (and b!1264943 c!123411) b!1264953))

(assert (= (and b!1264943 (not c!123411)) b!1264950))

(assert (= (and b!1264953 res!842182) b!1264944))

(assert (= (or b!1264953 b!1264950) bm!62296))

(assert (= (and b!1264943 res!842175) b!1264948))

(assert (= (and b!1264948 c!123412) b!1264937))

(assert (= (and b!1264948 (not c!123412)) b!1264942))

(assert (= (and b!1264937 res!842176) b!1264940))

(assert (= (or b!1264937 b!1264942) bm!62301))

(declare-fun b_lambda!22961 () Bool)

(assert (=> (not b_lambda!22961) (not b!1264935)))

(declare-fun t!41803 () Bool)

(declare-fun tb!11323 () Bool)

(assert (=> (and start!106342 (= defaultEntry!922 defaultEntry!922) t!41803) tb!11323))

(declare-fun result!23393 () Bool)

(assert (=> tb!11323 (= result!23393 tp_is_empty!32413)))

(assert (=> b!1264935 t!41803))

(declare-fun b_and!45515 () Bool)

(assert (= b_and!45509 (and (=> t!41803 result!23393) b_and!45515)))

(assert (=> b!1264933 m!1165629))

(declare-fun m!1165703 () Bool)

(assert (=> b!1264933 m!1165703))

(declare-fun m!1165705 () Bool)

(assert (=> b!1264933 m!1165705))

(declare-fun m!1165707 () Bool)

(assert (=> b!1264933 m!1165707))

(declare-fun m!1165709 () Bool)

(assert (=> b!1264933 m!1165709))

(declare-fun m!1165711 () Bool)

(assert (=> b!1264933 m!1165711))

(declare-fun m!1165713 () Bool)

(assert (=> b!1264933 m!1165713))

(declare-fun m!1165715 () Bool)

(assert (=> b!1264933 m!1165715))

(declare-fun m!1165717 () Bool)

(assert (=> b!1264933 m!1165717))

(declare-fun m!1165719 () Bool)

(assert (=> b!1264933 m!1165719))

(declare-fun m!1165721 () Bool)

(assert (=> b!1264933 m!1165721))

(assert (=> b!1264933 m!1165713))

(assert (=> b!1264933 m!1165717))

(declare-fun m!1165723 () Bool)

(assert (=> b!1264933 m!1165723))

(declare-fun m!1165725 () Bool)

(assert (=> b!1264933 m!1165725))

(assert (=> b!1264933 m!1165709))

(declare-fun m!1165727 () Bool)

(assert (=> b!1264933 m!1165727))

(assert (=> b!1264933 m!1165703))

(declare-fun m!1165729 () Bool)

(assert (=> b!1264933 m!1165729))

(declare-fun m!1165731 () Bool)

(assert (=> b!1264933 m!1165731))

(declare-fun m!1165733 () Bool)

(assert (=> b!1264933 m!1165733))

(assert (=> d!139095 m!1165643))

(assert (=> bm!62295 m!1165629))

(declare-fun m!1165735 () Bool)

(assert (=> bm!62300 m!1165735))

(declare-fun m!1165737 () Bool)

(assert (=> b!1264944 m!1165737))

(assert (=> b!1264951 m!1165725))

(assert (=> b!1264951 m!1165725))

(declare-fun m!1165739 () Bool)

(assert (=> b!1264951 m!1165739))

(assert (=> b!1264935 m!1165725))

(declare-fun m!1165741 () Bool)

(assert (=> b!1264935 m!1165741))

(declare-fun m!1165743 () Bool)

(assert (=> b!1264935 m!1165743))

(declare-fun m!1165745 () Bool)

(assert (=> b!1264935 m!1165745))

(declare-fun m!1165747 () Bool)

(assert (=> b!1264935 m!1165747))

(assert (=> b!1264935 m!1165745))

(assert (=> b!1264935 m!1165743))

(assert (=> b!1264935 m!1165725))

(declare-fun m!1165749 () Bool)

(assert (=> bm!62296 m!1165749))

(declare-fun m!1165751 () Bool)

(assert (=> b!1264940 m!1165751))

(declare-fun m!1165753 () Bool)

(assert (=> bm!62301 m!1165753))

(assert (=> b!1264949 m!1165725))

(assert (=> b!1264949 m!1165725))

(assert (=> b!1264949 m!1165739))

(declare-fun m!1165755 () Bool)

(assert (=> b!1264934 m!1165755))

(assert (=> b!1264952 m!1165725))

(assert (=> b!1264952 m!1165725))

(declare-fun m!1165757 () Bool)

(assert (=> b!1264952 m!1165757))

(assert (=> b!1264839 d!139095))

(declare-fun d!139097 () Bool)

(declare-fun e!720301 () Bool)

(assert (=> d!139097 e!720301))

(declare-fun res!842188 () Bool)

(assert (=> d!139097 (=> (not res!842188) (not e!720301))))

(declare-fun lt!573653 () ListLongMap!18953)

(assert (=> d!139097 (= res!842188 (contains!7631 lt!573653 (_1!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573652 () List!28294)

(assert (=> d!139097 (= lt!573653 (ListLongMap!18954 lt!573652))))

(declare-fun lt!573651 () Unit!42089)

(declare-fun lt!573650 () Unit!42089)

(assert (=> d!139097 (= lt!573651 lt!573650)))

(declare-datatypes ((Option!714 0))(
  ( (Some!713 (v!18979 V!48583)) (None!712) )
))
(declare-fun getValueByKey!663 (List!28294 (_ BitVec 64)) Option!714)

(assert (=> d!139097 (= (getValueByKey!663 lt!573652 (_1!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!713 (_2!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!337 (List!28294 (_ BitVec 64) V!48583) Unit!42089)

(assert (=> d!139097 (= lt!573650 (lemmaContainsTupThenGetReturnValue!337 lt!573652 (_1!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!451 (List!28294 (_ BitVec 64) V!48583) List!28294)

(assert (=> d!139097 (= lt!573652 (insertStrictlySorted!451 (toList!9492 (+!4300 lt!573549 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!139097 (= (+!4300 (+!4300 lt!573549 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573653)))

(declare-fun b!1264960 () Bool)

(declare-fun res!842187 () Bool)

(assert (=> b!1264960 (=> (not res!842187) (not e!720301))))

(assert (=> b!1264960 (= res!842187 (= (getValueByKey!663 (toList!9492 lt!573653) (_1!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!713 (_2!10547 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1264961 () Bool)

(declare-fun contains!7632 (List!28294 tuple2!21072) Bool)

(assert (=> b!1264961 (= e!720301 (contains!7632 (toList!9492 lt!573653) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!139097 res!842188) b!1264960))

(assert (= (and b!1264960 res!842187) b!1264961))

(declare-fun m!1165759 () Bool)

(assert (=> d!139097 m!1165759))

(declare-fun m!1165761 () Bool)

(assert (=> d!139097 m!1165761))

(declare-fun m!1165763 () Bool)

(assert (=> d!139097 m!1165763))

(declare-fun m!1165765 () Bool)

(assert (=> d!139097 m!1165765))

(declare-fun m!1165767 () Bool)

(assert (=> b!1264960 m!1165767))

(declare-fun m!1165769 () Bool)

(assert (=> b!1264961 m!1165769))

(assert (=> b!1264839 d!139097))

(declare-fun d!139099 () Bool)

(declare-fun e!720302 () Bool)

(assert (=> d!139099 e!720302))

(declare-fun res!842190 () Bool)

(assert (=> d!139099 (=> (not res!842190) (not e!720302))))

(declare-fun lt!573657 () ListLongMap!18953)

(assert (=> d!139099 (= res!842190 (contains!7631 lt!573657 (_1!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573656 () List!28294)

(assert (=> d!139099 (= lt!573657 (ListLongMap!18954 lt!573656))))

(declare-fun lt!573655 () Unit!42089)

(declare-fun lt!573654 () Unit!42089)

(assert (=> d!139099 (= lt!573655 lt!573654)))

(assert (=> d!139099 (= (getValueByKey!663 lt!573656 (_1!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!713 (_2!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139099 (= lt!573654 (lemmaContainsTupThenGetReturnValue!337 lt!573656 (_1!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139099 (= lt!573656 (insertStrictlySorted!451 (toList!9492 lt!573549) (_1!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139099 (= (+!4300 lt!573549 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573657)))

(declare-fun b!1264962 () Bool)

(declare-fun res!842189 () Bool)

(assert (=> b!1264962 (=> (not res!842189) (not e!720302))))

(assert (=> b!1264962 (= res!842189 (= (getValueByKey!663 (toList!9492 lt!573657) (_1!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!713 (_2!10547 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1264963 () Bool)

(assert (=> b!1264963 (= e!720302 (contains!7632 (toList!9492 lt!573657) (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!139099 res!842190) b!1264962))

(assert (= (and b!1264962 res!842189) b!1264963))

(declare-fun m!1165771 () Bool)

(assert (=> d!139099 m!1165771))

(declare-fun m!1165773 () Bool)

(assert (=> d!139099 m!1165773))

(declare-fun m!1165775 () Bool)

(assert (=> d!139099 m!1165775))

(declare-fun m!1165777 () Bool)

(assert (=> d!139099 m!1165777))

(declare-fun m!1165779 () Bool)

(assert (=> b!1264962 m!1165779))

(declare-fun m!1165781 () Bool)

(assert (=> b!1264963 m!1165781))

(assert (=> b!1264839 d!139099))

(declare-fun b!1264964 () Bool)

(declare-fun e!720311 () Unit!42089)

(declare-fun lt!573663 () Unit!42089)

(assert (=> b!1264964 (= e!720311 lt!573663)))

(declare-fun lt!573666 () ListLongMap!18953)

(assert (=> b!1264964 (= lt!573666 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573679 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573671 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573671 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573662 () Unit!42089)

(assert (=> b!1264964 (= lt!573662 (addStillContains!1100 lt!573666 lt!573679 zeroValue!871 lt!573671))))

(assert (=> b!1264964 (contains!7631 (+!4300 lt!573666 (tuple2!21073 lt!573679 zeroValue!871)) lt!573671)))

(declare-fun lt!573664 () Unit!42089)

(assert (=> b!1264964 (= lt!573664 lt!573662)))

(declare-fun lt!573659 () ListLongMap!18953)

(assert (=> b!1264964 (= lt!573659 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573665 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573665 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573673 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573673 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573658 () Unit!42089)

(assert (=> b!1264964 (= lt!573658 (addApplyDifferent!542 lt!573659 lt!573665 minValueAfter!43 lt!573673))))

(assert (=> b!1264964 (= (apply!1011 (+!4300 lt!573659 (tuple2!21073 lt!573665 minValueAfter!43)) lt!573673) (apply!1011 lt!573659 lt!573673))))

(declare-fun lt!573678 () Unit!42089)

(assert (=> b!1264964 (= lt!573678 lt!573658)))

(declare-fun lt!573661 () ListLongMap!18953)

(assert (=> b!1264964 (= lt!573661 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573676 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573670 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573670 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573668 () Unit!42089)

(assert (=> b!1264964 (= lt!573668 (addApplyDifferent!542 lt!573661 lt!573676 zeroValue!871 lt!573670))))

(assert (=> b!1264964 (= (apply!1011 (+!4300 lt!573661 (tuple2!21073 lt!573676 zeroValue!871)) lt!573670) (apply!1011 lt!573661 lt!573670))))

(declare-fun lt!573675 () Unit!42089)

(assert (=> b!1264964 (= lt!573675 lt!573668)))

(declare-fun lt!573669 () ListLongMap!18953)

(assert (=> b!1264964 (= lt!573669 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573674 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573672 () (_ BitVec 64))

(assert (=> b!1264964 (= lt!573672 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264964 (= lt!573663 (addApplyDifferent!542 lt!573669 lt!573674 minValueAfter!43 lt!573672))))

(assert (=> b!1264964 (= (apply!1011 (+!4300 lt!573669 (tuple2!21073 lt!573674 minValueAfter!43)) lt!573672) (apply!1011 lt!573669 lt!573672))))

(declare-fun b!1264965 () Bool)

(declare-fun e!720315 () ListLongMap!18953)

(declare-fun call!62308 () ListLongMap!18953)

(assert (=> b!1264965 (= e!720315 (+!4300 call!62308 (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1264966 () Bool)

(declare-fun e!720312 () Bool)

(declare-fun lt!573677 () ListLongMap!18953)

(assert (=> b!1264966 (= e!720312 (= (apply!1011 lt!573677 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40325 _values!914)))))

(assert (=> b!1264966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun call!62306 () ListLongMap!18953)

(declare-fun bm!62302 () Bool)

(assert (=> bm!62302 (= call!62306 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264967 () Bool)

(declare-fun e!720313 () ListLongMap!18953)

(declare-fun call!62307 () ListLongMap!18953)

(assert (=> b!1264967 (= e!720313 call!62307)))

(declare-fun bm!62303 () Bool)

(declare-fun call!62309 () Bool)

(assert (=> bm!62303 (= call!62309 (contains!7631 lt!573677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264968 () Bool)

(declare-fun e!720305 () Bool)

(declare-fun e!720308 () Bool)

(assert (=> b!1264968 (= e!720305 e!720308)))

(declare-fun res!842193 () Bool)

(declare-fun call!62310 () Bool)

(assert (=> b!1264968 (= res!842193 call!62310)))

(assert (=> b!1264968 (=> (not res!842193) (not e!720308))))

(declare-fun d!139101 () Bool)

(declare-fun e!720310 () Bool)

(assert (=> d!139101 e!720310))

(declare-fun res!842197 () Bool)

(assert (=> d!139101 (=> (not res!842197) (not e!720310))))

(assert (=> d!139101 (= res!842197 (or (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))))

(declare-fun lt!573660 () ListLongMap!18953)

(assert (=> d!139101 (= lt!573677 lt!573660)))

(declare-fun lt!573667 () Unit!42089)

(assert (=> d!139101 (= lt!573667 e!720311)))

(declare-fun c!123415 () Bool)

(declare-fun e!720303 () Bool)

(assert (=> d!139101 (= c!123415 e!720303)))

(declare-fun res!842191 () Bool)

(assert (=> d!139101 (=> (not res!842191) (not e!720303))))

(assert (=> d!139101 (= res!842191 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139101 (= lt!573660 e!720315)))

(declare-fun c!123416 () Bool)

(assert (=> d!139101 (= c!123416 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139101 (validMask!0 mask!1466)))

(assert (=> d!139101 (= (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573677)))

(declare-fun bm!62304 () Bool)

(assert (=> bm!62304 (= call!62307 call!62308)))

(declare-fun b!1264969 () Bool)

(declare-fun c!123414 () Bool)

(assert (=> b!1264969 (= c!123414 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!720304 () ListLongMap!18953)

(assert (=> b!1264969 (= e!720304 e!720313)))

(declare-fun bm!62305 () Bool)

(declare-fun call!62311 () ListLongMap!18953)

(declare-fun call!62305 () ListLongMap!18953)

(assert (=> bm!62305 (= call!62311 call!62305)))

(declare-fun b!1264970 () Bool)

(declare-fun res!842198 () Bool)

(assert (=> b!1264970 (=> (not res!842198) (not e!720310))))

(declare-fun e!720306 () Bool)

(assert (=> b!1264970 (= res!842198 e!720306)))

(declare-fun res!842196 () Bool)

(assert (=> b!1264970 (=> res!842196 e!720306)))

(declare-fun e!720307 () Bool)

(assert (=> b!1264970 (= res!842196 (not e!720307))))

(declare-fun res!842194 () Bool)

(assert (=> b!1264970 (=> (not res!842194) (not e!720307))))

(assert (=> b!1264970 (= res!842194 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1264971 () Bool)

(assert (=> b!1264971 (= e!720308 (= (apply!1011 lt!573677 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62306 () Bool)

(assert (=> bm!62306 (= call!62305 call!62306)))

(declare-fun b!1264972 () Bool)

(declare-fun Unit!42092 () Unit!42089)

(assert (=> b!1264972 (= e!720311 Unit!42092)))

(declare-fun b!1264973 () Bool)

(assert (=> b!1264973 (= e!720305 (not call!62310))))

(declare-fun b!1264974 () Bool)

(declare-fun res!842192 () Bool)

(assert (=> b!1264974 (=> (not res!842192) (not e!720310))))

(declare-fun e!720314 () Bool)

(assert (=> b!1264974 (= res!842192 e!720314)))

(declare-fun c!123417 () Bool)

(assert (=> b!1264974 (= c!123417 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264975 () Bool)

(declare-fun e!720309 () Bool)

(assert (=> b!1264975 (= e!720309 (= (apply!1011 lt!573677 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264976 () Bool)

(assert (=> b!1264976 (= e!720315 e!720304)))

(declare-fun c!123419 () Bool)

(assert (=> b!1264976 (= c!123419 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62307 () Bool)

(assert (=> bm!62307 (= call!62308 (+!4300 (ite c!123416 call!62306 (ite c!123419 call!62305 call!62311)) (ite (or c!123416 c!123419) (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1264977 () Bool)

(assert (=> b!1264977 (= e!720304 call!62307)))

(declare-fun b!1264978 () Bool)

(assert (=> b!1264978 (= e!720313 call!62311)))

(declare-fun b!1264979 () Bool)

(assert (=> b!1264979 (= e!720310 e!720305)))

(declare-fun c!123418 () Bool)

(assert (=> b!1264979 (= c!123418 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264980 () Bool)

(assert (=> b!1264980 (= e!720307 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264981 () Bool)

(assert (=> b!1264981 (= e!720314 (not call!62309))))

(declare-fun b!1264982 () Bool)

(assert (=> b!1264982 (= e!720303 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264983 () Bool)

(assert (=> b!1264983 (= e!720306 e!720312)))

(declare-fun res!842195 () Bool)

(assert (=> b!1264983 (=> (not res!842195) (not e!720312))))

(assert (=> b!1264983 (= res!842195 (contains!7631 lt!573677 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264983 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun bm!62308 () Bool)

(assert (=> bm!62308 (= call!62310 (contains!7631 lt!573677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264984 () Bool)

(assert (=> b!1264984 (= e!720314 e!720309)))

(declare-fun res!842199 () Bool)

(assert (=> b!1264984 (= res!842199 call!62309)))

(assert (=> b!1264984 (=> (not res!842199) (not e!720309))))

(assert (= (and d!139101 c!123416) b!1264965))

(assert (= (and d!139101 (not c!123416)) b!1264976))

(assert (= (and b!1264976 c!123419) b!1264977))

(assert (= (and b!1264976 (not c!123419)) b!1264969))

(assert (= (and b!1264969 c!123414) b!1264967))

(assert (= (and b!1264969 (not c!123414)) b!1264978))

(assert (= (or b!1264967 b!1264978) bm!62305))

(assert (= (or b!1264977 bm!62305) bm!62306))

(assert (= (or b!1264977 b!1264967) bm!62304))

(assert (= (or b!1264965 bm!62306) bm!62302))

(assert (= (or b!1264965 bm!62304) bm!62307))

(assert (= (and d!139101 res!842191) b!1264982))

(assert (= (and d!139101 c!123415) b!1264964))

(assert (= (and d!139101 (not c!123415)) b!1264972))

(assert (= (and d!139101 res!842197) b!1264970))

(assert (= (and b!1264970 res!842194) b!1264980))

(assert (= (and b!1264970 (not res!842196)) b!1264983))

(assert (= (and b!1264983 res!842195) b!1264966))

(assert (= (and b!1264970 res!842198) b!1264974))

(assert (= (and b!1264974 c!123417) b!1264984))

(assert (= (and b!1264974 (not c!123417)) b!1264981))

(assert (= (and b!1264984 res!842199) b!1264975))

(assert (= (or b!1264984 b!1264981) bm!62303))

(assert (= (and b!1264974 res!842192) b!1264979))

(assert (= (and b!1264979 c!123418) b!1264968))

(assert (= (and b!1264979 (not c!123418)) b!1264973))

(assert (= (and b!1264968 res!842193) b!1264971))

(assert (= (or b!1264968 b!1264973) bm!62308))

(declare-fun b_lambda!22963 () Bool)

(assert (=> (not b_lambda!22963) (not b!1264966)))

(assert (=> b!1264966 t!41803))

(declare-fun b_and!45517 () Bool)

(assert (= b_and!45515 (and (=> t!41803 result!23393) b_and!45517)))

(assert (=> b!1264964 m!1165627))

(declare-fun m!1165783 () Bool)

(assert (=> b!1264964 m!1165783))

(declare-fun m!1165785 () Bool)

(assert (=> b!1264964 m!1165785))

(declare-fun m!1165787 () Bool)

(assert (=> b!1264964 m!1165787))

(declare-fun m!1165789 () Bool)

(assert (=> b!1264964 m!1165789))

(declare-fun m!1165791 () Bool)

(assert (=> b!1264964 m!1165791))

(declare-fun m!1165793 () Bool)

(assert (=> b!1264964 m!1165793))

(declare-fun m!1165795 () Bool)

(assert (=> b!1264964 m!1165795))

(declare-fun m!1165797 () Bool)

(assert (=> b!1264964 m!1165797))

(declare-fun m!1165799 () Bool)

(assert (=> b!1264964 m!1165799))

(declare-fun m!1165801 () Bool)

(assert (=> b!1264964 m!1165801))

(assert (=> b!1264964 m!1165793))

(assert (=> b!1264964 m!1165797))

(declare-fun m!1165803 () Bool)

(assert (=> b!1264964 m!1165803))

(assert (=> b!1264964 m!1165725))

(assert (=> b!1264964 m!1165789))

(declare-fun m!1165805 () Bool)

(assert (=> b!1264964 m!1165805))

(assert (=> b!1264964 m!1165783))

(declare-fun m!1165807 () Bool)

(assert (=> b!1264964 m!1165807))

(declare-fun m!1165809 () Bool)

(assert (=> b!1264964 m!1165809))

(declare-fun m!1165811 () Bool)

(assert (=> b!1264964 m!1165811))

(assert (=> d!139101 m!1165643))

(assert (=> bm!62302 m!1165627))

(declare-fun m!1165813 () Bool)

(assert (=> bm!62307 m!1165813))

(declare-fun m!1165815 () Bool)

(assert (=> b!1264975 m!1165815))

(assert (=> b!1264982 m!1165725))

(assert (=> b!1264982 m!1165725))

(assert (=> b!1264982 m!1165739))

(assert (=> b!1264966 m!1165725))

(declare-fun m!1165817 () Bool)

(assert (=> b!1264966 m!1165817))

(assert (=> b!1264966 m!1165743))

(assert (=> b!1264966 m!1165745))

(assert (=> b!1264966 m!1165747))

(assert (=> b!1264966 m!1165745))

(assert (=> b!1264966 m!1165743))

(assert (=> b!1264966 m!1165725))

(declare-fun m!1165819 () Bool)

(assert (=> bm!62303 m!1165819))

(declare-fun m!1165821 () Bool)

(assert (=> b!1264971 m!1165821))

(declare-fun m!1165823 () Bool)

(assert (=> bm!62308 m!1165823))

(assert (=> b!1264980 m!1165725))

(assert (=> b!1264980 m!1165725))

(assert (=> b!1264980 m!1165739))

(declare-fun m!1165825 () Bool)

(assert (=> b!1264965 m!1165825))

(assert (=> b!1264983 m!1165725))

(assert (=> b!1264983 m!1165725))

(declare-fun m!1165827 () Bool)

(assert (=> b!1264983 m!1165827))

(assert (=> b!1264839 d!139101))

(declare-fun b!1264993 () Bool)

(declare-fun e!720322 () Bool)

(declare-fun e!720323 () Bool)

(assert (=> b!1264993 (= e!720322 e!720323)))

(declare-fun c!123422 () Bool)

(assert (=> b!1264993 (= c!123422 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264994 () Bool)

(declare-fun e!720324 () Bool)

(assert (=> b!1264994 (= e!720323 e!720324)))

(declare-fun lt!573686 () (_ BitVec 64))

(assert (=> b!1264994 (= lt!573686 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573687 () Unit!42089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82497 (_ BitVec 64) (_ BitVec 32)) Unit!42089)

(assert (=> b!1264994 (= lt!573687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573686 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264994 (arrayContainsKey!0 _keys!1118 lt!573686 #b00000000000000000000000000000000)))

(declare-fun lt!573688 () Unit!42089)

(assert (=> b!1264994 (= lt!573688 lt!573687)))

(declare-fun res!842204 () Bool)

(declare-datatypes ((SeekEntryResult!9936 0))(
  ( (MissingZero!9936 (index!42115 (_ BitVec 32))) (Found!9936 (index!42116 (_ BitVec 32))) (Intermediate!9936 (undefined!10748 Bool) (index!42117 (_ BitVec 32)) (x!111323 (_ BitVec 32))) (Undefined!9936) (MissingVacant!9936 (index!42118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82497 (_ BitVec 32)) SeekEntryResult!9936)

(assert (=> b!1264994 (= res!842204 (= (seekEntryOrOpen!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9936 #b00000000000000000000000000000000)))))

(assert (=> b!1264994 (=> (not res!842204) (not e!720324))))

(declare-fun bm!62311 () Bool)

(declare-fun call!62314 () Bool)

(assert (=> bm!62311 (= call!62314 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1264995 () Bool)

(assert (=> b!1264995 (= e!720324 call!62314)))

(declare-fun b!1264996 () Bool)

(assert (=> b!1264996 (= e!720323 call!62314)))

(declare-fun d!139103 () Bool)

(declare-fun res!842205 () Bool)

(assert (=> d!139103 (=> res!842205 e!720322)))

(assert (=> d!139103 (= res!842205 (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!720322)))

(assert (= (and d!139103 (not res!842205)) b!1264993))

(assert (= (and b!1264993 c!123422) b!1264994))

(assert (= (and b!1264993 (not c!123422)) b!1264996))

(assert (= (and b!1264994 res!842204) b!1264995))

(assert (= (or b!1264995 b!1264996) bm!62311))

(assert (=> b!1264993 m!1165725))

(assert (=> b!1264993 m!1165725))

(assert (=> b!1264993 m!1165739))

(assert (=> b!1264994 m!1165725))

(declare-fun m!1165829 () Bool)

(assert (=> b!1264994 m!1165829))

(declare-fun m!1165831 () Bool)

(assert (=> b!1264994 m!1165831))

(assert (=> b!1264994 m!1165725))

(declare-fun m!1165833 () Bool)

(assert (=> b!1264994 m!1165833))

(declare-fun m!1165835 () Bool)

(assert (=> bm!62311 m!1165835))

(assert (=> b!1264836 d!139103))

(declare-fun d!139105 () Bool)

(assert (=> d!139105 (= (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573691 () Unit!42089)

(declare-fun choose!1881 (array!82497 array!82495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 V!48583 V!48583 (_ BitVec 32) Int) Unit!42089)

(assert (=> d!139105 (= lt!573691 (choose!1881 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139105 (validMask!0 mask!1466)))

(assert (=> d!139105 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1185 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573691)))

(declare-fun bs!35766 () Bool)

(assert (= bs!35766 d!139105))

(assert (=> bs!35766 m!1165629))

(assert (=> bs!35766 m!1165627))

(declare-fun m!1165837 () Bool)

(assert (=> bs!35766 m!1165837))

(assert (=> bs!35766 m!1165643))

(assert (=> b!1264840 d!139105))

(declare-fun b!1265021 () Bool)

(declare-fun e!720340 () Bool)

(assert (=> b!1265021 (= e!720340 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265021 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265022 () Bool)

(declare-fun e!720342 () ListLongMap!18953)

(assert (=> b!1265022 (= e!720342 (ListLongMap!18954 Nil!28291))))

(declare-fun d!139107 () Bool)

(declare-fun e!720339 () Bool)

(assert (=> d!139107 e!720339))

(declare-fun res!842215 () Bool)

(assert (=> d!139107 (=> (not res!842215) (not e!720339))))

(declare-fun lt!573711 () ListLongMap!18953)

(assert (=> d!139107 (= res!842215 (not (contains!7631 lt!573711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139107 (= lt!573711 e!720342)))

(declare-fun c!123431 () Bool)

(assert (=> d!139107 (= c!123431 (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139107 (validMask!0 mask!1466)))

(assert (=> d!139107 (= (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573711)))

(declare-fun b!1265023 () Bool)

(assert (=> b!1265023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> b!1265023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40325 _values!914)))))

(declare-fun e!720344 () Bool)

(assert (=> b!1265023 (= e!720344 (= (apply!1011 lt!573711 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265024 () Bool)

(declare-fun lt!573707 () Unit!42089)

(declare-fun lt!573708 () Unit!42089)

(assert (=> b!1265024 (= lt!573707 lt!573708)))

(declare-fun lt!573709 () (_ BitVec 64))

(declare-fun lt!573710 () (_ BitVec 64))

(declare-fun lt!573712 () V!48583)

(declare-fun lt!573706 () ListLongMap!18953)

(assert (=> b!1265024 (not (contains!7631 (+!4300 lt!573706 (tuple2!21073 lt!573709 lt!573712)) lt!573710))))

(declare-fun addStillNotContains!332 (ListLongMap!18953 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!42089)

(assert (=> b!1265024 (= lt!573708 (addStillNotContains!332 lt!573706 lt!573709 lt!573712 lt!573710))))

(assert (=> b!1265024 (= lt!573710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265024 (= lt!573712 (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265024 (= lt!573709 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62317 () ListLongMap!18953)

(assert (=> b!1265024 (= lt!573706 call!62317)))

(declare-fun e!720343 () ListLongMap!18953)

(assert (=> b!1265024 (= e!720343 (+!4300 call!62317 (tuple2!21073 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1265025 () Bool)

(declare-fun e!720341 () Bool)

(assert (=> b!1265025 (= e!720341 (= lt!573711 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1265026 () Bool)

(declare-fun e!720345 () Bool)

(assert (=> b!1265026 (= e!720345 e!720344)))

(assert (=> b!1265026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun res!842214 () Bool)

(assert (=> b!1265026 (= res!842214 (contains!7631 lt!573711 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265026 (=> (not res!842214) (not e!720344))))

(declare-fun b!1265027 () Bool)

(assert (=> b!1265027 (= e!720345 e!720341)))

(declare-fun c!123432 () Bool)

(assert (=> b!1265027 (= c!123432 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1265028 () Bool)

(declare-fun res!842216 () Bool)

(assert (=> b!1265028 (=> (not res!842216) (not e!720339))))

(assert (=> b!1265028 (= res!842216 (not (contains!7631 lt!573711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265029 () Bool)

(declare-fun isEmpty!1048 (ListLongMap!18953) Bool)

(assert (=> b!1265029 (= e!720341 (isEmpty!1048 lt!573711))))

(declare-fun b!1265030 () Bool)

(assert (=> b!1265030 (= e!720343 call!62317)))

(declare-fun b!1265031 () Bool)

(assert (=> b!1265031 (= e!720339 e!720345)))

(declare-fun c!123433 () Bool)

(assert (=> b!1265031 (= c!123433 e!720340)))

(declare-fun res!842217 () Bool)

(assert (=> b!1265031 (=> (not res!842217) (not e!720340))))

(assert (=> b!1265031 (= res!842217 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1265032 () Bool)

(assert (=> b!1265032 (= e!720342 e!720343)))

(declare-fun c!123434 () Bool)

(assert (=> b!1265032 (= c!123434 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62314 () Bool)

(assert (=> bm!62314 (= call!62317 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!139107 c!123431) b!1265022))

(assert (= (and d!139107 (not c!123431)) b!1265032))

(assert (= (and b!1265032 c!123434) b!1265024))

(assert (= (and b!1265032 (not c!123434)) b!1265030))

(assert (= (or b!1265024 b!1265030) bm!62314))

(assert (= (and d!139107 res!842215) b!1265028))

(assert (= (and b!1265028 res!842216) b!1265031))

(assert (= (and b!1265031 res!842217) b!1265021))

(assert (= (and b!1265031 c!123433) b!1265026))

(assert (= (and b!1265031 (not c!123433)) b!1265027))

(assert (= (and b!1265026 res!842214) b!1265023))

(assert (= (and b!1265027 c!123432) b!1265025))

(assert (= (and b!1265027 (not c!123432)) b!1265029))

(declare-fun b_lambda!22965 () Bool)

(assert (=> (not b_lambda!22965) (not b!1265023)))

(assert (=> b!1265023 t!41803))

(declare-fun b_and!45519 () Bool)

(assert (= b_and!45517 (and (=> t!41803 result!23393) b_and!45519)))

(declare-fun b_lambda!22967 () Bool)

(assert (=> (not b_lambda!22967) (not b!1265024)))

(assert (=> b!1265024 t!41803))

(declare-fun b_and!45521 () Bool)

(assert (= b_and!45519 (and (=> t!41803 result!23393) b_and!45521)))

(declare-fun m!1165839 () Bool)

(assert (=> b!1265029 m!1165839))

(assert (=> b!1265032 m!1165725))

(assert (=> b!1265032 m!1165725))

(assert (=> b!1265032 m!1165739))

(declare-fun m!1165841 () Bool)

(assert (=> b!1265025 m!1165841))

(declare-fun m!1165843 () Bool)

(assert (=> b!1265024 m!1165843))

(assert (=> b!1265024 m!1165725))

(declare-fun m!1165845 () Bool)

(assert (=> b!1265024 m!1165845))

(declare-fun m!1165847 () Bool)

(assert (=> b!1265024 m!1165847))

(assert (=> b!1265024 m!1165845))

(assert (=> b!1265024 m!1165743))

(assert (=> b!1265024 m!1165743))

(assert (=> b!1265024 m!1165745))

(assert (=> b!1265024 m!1165747))

(assert (=> b!1265024 m!1165745))

(declare-fun m!1165849 () Bool)

(assert (=> b!1265024 m!1165849))

(assert (=> b!1265023 m!1165725))

(declare-fun m!1165851 () Bool)

(assert (=> b!1265023 m!1165851))

(assert (=> b!1265023 m!1165725))

(assert (=> b!1265023 m!1165745))

(assert (=> b!1265023 m!1165743))

(assert (=> b!1265023 m!1165743))

(assert (=> b!1265023 m!1165745))

(assert (=> b!1265023 m!1165747))

(assert (=> b!1265021 m!1165725))

(assert (=> b!1265021 m!1165725))

(assert (=> b!1265021 m!1165739))

(declare-fun m!1165853 () Bool)

(assert (=> d!139107 m!1165853))

(assert (=> d!139107 m!1165643))

(assert (=> bm!62314 m!1165841))

(declare-fun m!1165855 () Bool)

(assert (=> b!1265028 m!1165855))

(assert (=> b!1265026 m!1165725))

(assert (=> b!1265026 m!1165725))

(declare-fun m!1165857 () Bool)

(assert (=> b!1265026 m!1165857))

(assert (=> b!1264840 d!139107))

(declare-fun b!1265033 () Bool)

(declare-fun e!720347 () Bool)

(assert (=> b!1265033 (= e!720347 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265033 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265034 () Bool)

(declare-fun e!720349 () ListLongMap!18953)

(assert (=> b!1265034 (= e!720349 (ListLongMap!18954 Nil!28291))))

(declare-fun d!139109 () Bool)

(declare-fun e!720346 () Bool)

(assert (=> d!139109 e!720346))

(declare-fun res!842219 () Bool)

(assert (=> d!139109 (=> (not res!842219) (not e!720346))))

(declare-fun lt!573718 () ListLongMap!18953)

(assert (=> d!139109 (= res!842219 (not (contains!7631 lt!573718 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139109 (= lt!573718 e!720349)))

(declare-fun c!123435 () Bool)

(assert (=> d!139109 (= c!123435 (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139109 (validMask!0 mask!1466)))

(assert (=> d!139109 (= (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573718)))

(declare-fun b!1265035 () Bool)

(assert (=> b!1265035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> b!1265035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40325 _values!914)))))

(declare-fun e!720351 () Bool)

(assert (=> b!1265035 (= e!720351 (= (apply!1011 lt!573718 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265036 () Bool)

(declare-fun lt!573714 () Unit!42089)

(declare-fun lt!573715 () Unit!42089)

(assert (=> b!1265036 (= lt!573714 lt!573715)))

(declare-fun lt!573719 () V!48583)

(declare-fun lt!573716 () (_ BitVec 64))

(declare-fun lt!573713 () ListLongMap!18953)

(declare-fun lt!573717 () (_ BitVec 64))

(assert (=> b!1265036 (not (contains!7631 (+!4300 lt!573713 (tuple2!21073 lt!573716 lt!573719)) lt!573717))))

(assert (=> b!1265036 (= lt!573715 (addStillNotContains!332 lt!573713 lt!573716 lt!573719 lt!573717))))

(assert (=> b!1265036 (= lt!573717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265036 (= lt!573719 (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265036 (= lt!573716 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62318 () ListLongMap!18953)

(assert (=> b!1265036 (= lt!573713 call!62318)))

(declare-fun e!720350 () ListLongMap!18953)

(assert (=> b!1265036 (= e!720350 (+!4300 call!62318 (tuple2!21073 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000) (get!20342 (select (arr!39788 _values!914) #b00000000000000000000000000000000) (dynLambda!3463 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!720348 () Bool)

(declare-fun b!1265037 () Bool)

(assert (=> b!1265037 (= e!720348 (= lt!573718 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1265038 () Bool)

(declare-fun e!720352 () Bool)

(assert (=> b!1265038 (= e!720352 e!720351)))

(assert (=> b!1265038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun res!842218 () Bool)

(assert (=> b!1265038 (= res!842218 (contains!7631 lt!573718 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265038 (=> (not res!842218) (not e!720351))))

(declare-fun b!1265039 () Bool)

(assert (=> b!1265039 (= e!720352 e!720348)))

(declare-fun c!123436 () Bool)

(assert (=> b!1265039 (= c!123436 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1265040 () Bool)

(declare-fun res!842220 () Bool)

(assert (=> b!1265040 (=> (not res!842220) (not e!720346))))

(assert (=> b!1265040 (= res!842220 (not (contains!7631 lt!573718 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265041 () Bool)

(assert (=> b!1265041 (= e!720348 (isEmpty!1048 lt!573718))))

(declare-fun b!1265042 () Bool)

(assert (=> b!1265042 (= e!720350 call!62318)))

(declare-fun b!1265043 () Bool)

(assert (=> b!1265043 (= e!720346 e!720352)))

(declare-fun c!123437 () Bool)

(assert (=> b!1265043 (= c!123437 e!720347)))

(declare-fun res!842221 () Bool)

(assert (=> b!1265043 (=> (not res!842221) (not e!720347))))

(assert (=> b!1265043 (= res!842221 (bvslt #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(declare-fun b!1265044 () Bool)

(assert (=> b!1265044 (= e!720349 e!720350)))

(declare-fun c!123438 () Bool)

(assert (=> b!1265044 (= c!123438 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62315 () Bool)

(assert (=> bm!62315 (= call!62318 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!139109 c!123435) b!1265034))

(assert (= (and d!139109 (not c!123435)) b!1265044))

(assert (= (and b!1265044 c!123438) b!1265036))

(assert (= (and b!1265044 (not c!123438)) b!1265042))

(assert (= (or b!1265036 b!1265042) bm!62315))

(assert (= (and d!139109 res!842219) b!1265040))

(assert (= (and b!1265040 res!842220) b!1265043))

(assert (= (and b!1265043 res!842221) b!1265033))

(assert (= (and b!1265043 c!123437) b!1265038))

(assert (= (and b!1265043 (not c!123437)) b!1265039))

(assert (= (and b!1265038 res!842218) b!1265035))

(assert (= (and b!1265039 c!123436) b!1265037))

(assert (= (and b!1265039 (not c!123436)) b!1265041))

(declare-fun b_lambda!22969 () Bool)

(assert (=> (not b_lambda!22969) (not b!1265035)))

(assert (=> b!1265035 t!41803))

(declare-fun b_and!45523 () Bool)

(assert (= b_and!45521 (and (=> t!41803 result!23393) b_and!45523)))

(declare-fun b_lambda!22971 () Bool)

(assert (=> (not b_lambda!22971) (not b!1265036)))

(assert (=> b!1265036 t!41803))

(declare-fun b_and!45525 () Bool)

(assert (= b_and!45523 (and (=> t!41803 result!23393) b_and!45525)))

(declare-fun m!1165859 () Bool)

(assert (=> b!1265041 m!1165859))

(assert (=> b!1265044 m!1165725))

(assert (=> b!1265044 m!1165725))

(assert (=> b!1265044 m!1165739))

(declare-fun m!1165861 () Bool)

(assert (=> b!1265037 m!1165861))

(declare-fun m!1165863 () Bool)

(assert (=> b!1265036 m!1165863))

(assert (=> b!1265036 m!1165725))

(declare-fun m!1165865 () Bool)

(assert (=> b!1265036 m!1165865))

(declare-fun m!1165867 () Bool)

(assert (=> b!1265036 m!1165867))

(assert (=> b!1265036 m!1165865))

(assert (=> b!1265036 m!1165743))

(assert (=> b!1265036 m!1165743))

(assert (=> b!1265036 m!1165745))

(assert (=> b!1265036 m!1165747))

(assert (=> b!1265036 m!1165745))

(declare-fun m!1165869 () Bool)

(assert (=> b!1265036 m!1165869))

(assert (=> b!1265035 m!1165725))

(declare-fun m!1165871 () Bool)

(assert (=> b!1265035 m!1165871))

(assert (=> b!1265035 m!1165725))

(assert (=> b!1265035 m!1165745))

(assert (=> b!1265035 m!1165743))

(assert (=> b!1265035 m!1165743))

(assert (=> b!1265035 m!1165745))

(assert (=> b!1265035 m!1165747))

(assert (=> b!1265033 m!1165725))

(assert (=> b!1265033 m!1165725))

(assert (=> b!1265033 m!1165739))

(declare-fun m!1165873 () Bool)

(assert (=> d!139109 m!1165873))

(assert (=> d!139109 m!1165643))

(assert (=> bm!62315 m!1165861))

(declare-fun m!1165875 () Bool)

(assert (=> b!1265040 m!1165875))

(assert (=> b!1265038 m!1165725))

(assert (=> b!1265038 m!1165725))

(declare-fun m!1165877 () Bool)

(assert (=> b!1265038 m!1165877))

(assert (=> b!1264840 d!139109))

(declare-fun b!1265055 () Bool)

(declare-fun e!720361 () Bool)

(declare-fun e!720362 () Bool)

(assert (=> b!1265055 (= e!720361 e!720362)))

(declare-fun c!123441 () Bool)

(assert (=> b!1265055 (= c!123441 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265056 () Bool)

(declare-fun e!720363 () Bool)

(declare-fun contains!7633 (List!28293 (_ BitVec 64)) Bool)

(assert (=> b!1265056 (= e!720363 (contains!7633 Nil!28290 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265057 () Bool)

(declare-fun call!62321 () Bool)

(assert (=> b!1265057 (= e!720362 call!62321)))

(declare-fun b!1265058 () Bool)

(assert (=> b!1265058 (= e!720362 call!62321)))

(declare-fun b!1265059 () Bool)

(declare-fun e!720364 () Bool)

(assert (=> b!1265059 (= e!720364 e!720361)))

(declare-fun res!842228 () Bool)

(assert (=> b!1265059 (=> (not res!842228) (not e!720361))))

(assert (=> b!1265059 (= res!842228 (not e!720363))))

(declare-fun res!842230 () Bool)

(assert (=> b!1265059 (=> (not res!842230) (not e!720363))))

(assert (=> b!1265059 (= res!842230 (validKeyInArray!0 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!139111 () Bool)

(declare-fun res!842229 () Bool)

(assert (=> d!139111 (=> res!842229 e!720364)))

(assert (=> d!139111 (= res!842229 (bvsge #b00000000000000000000000000000000 (size!40326 _keys!1118)))))

(assert (=> d!139111 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28290) e!720364)))

(declare-fun bm!62318 () Bool)

(assert (=> bm!62318 (= call!62321 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123441 (Cons!28289 (select (arr!39789 _keys!1118) #b00000000000000000000000000000000) Nil!28290) Nil!28290)))))

(assert (= (and d!139111 (not res!842229)) b!1265059))

(assert (= (and b!1265059 res!842230) b!1265056))

(assert (= (and b!1265059 res!842228) b!1265055))

(assert (= (and b!1265055 c!123441) b!1265058))

(assert (= (and b!1265055 (not c!123441)) b!1265057))

(assert (= (or b!1265058 b!1265057) bm!62318))

(assert (=> b!1265055 m!1165725))

(assert (=> b!1265055 m!1165725))

(assert (=> b!1265055 m!1165739))

(assert (=> b!1265056 m!1165725))

(assert (=> b!1265056 m!1165725))

(declare-fun m!1165879 () Bool)

(assert (=> b!1265056 m!1165879))

(assert (=> b!1265059 m!1165725))

(assert (=> b!1265059 m!1165725))

(assert (=> b!1265059 m!1165739))

(assert (=> bm!62318 m!1165725))

(declare-fun m!1165881 () Bool)

(assert (=> bm!62318 m!1165881))

(assert (=> b!1264837 d!139111))

(declare-fun mapIsEmpty!50455 () Bool)

(declare-fun mapRes!50455 () Bool)

(assert (=> mapIsEmpty!50455 mapRes!50455))

(declare-fun b!1265066 () Bool)

(declare-fun e!720370 () Bool)

(assert (=> b!1265066 (= e!720370 tp_is_empty!32413)))

(declare-fun mapNonEmpty!50455 () Bool)

(declare-fun tp!96104 () Bool)

(assert (=> mapNonEmpty!50455 (= mapRes!50455 (and tp!96104 e!720370))))

(declare-fun mapRest!50455 () (Array (_ BitVec 32) ValueCell!15443))

(declare-fun mapValue!50455 () ValueCell!15443)

(declare-fun mapKey!50455 () (_ BitVec 32))

(assert (=> mapNonEmpty!50455 (= mapRest!50446 (store mapRest!50455 mapKey!50455 mapValue!50455))))

(declare-fun condMapEmpty!50455 () Bool)

(declare-fun mapDefault!50455 () ValueCell!15443)

(assert (=> mapNonEmpty!50446 (= condMapEmpty!50455 (= mapRest!50446 ((as const (Array (_ BitVec 32) ValueCell!15443)) mapDefault!50455)))))

(declare-fun e!720369 () Bool)

(assert (=> mapNonEmpty!50446 (= tp!96088 (and e!720369 mapRes!50455))))

(declare-fun b!1265067 () Bool)

(assert (=> b!1265067 (= e!720369 tp_is_empty!32413)))

(assert (= (and mapNonEmpty!50446 condMapEmpty!50455) mapIsEmpty!50455))

(assert (= (and mapNonEmpty!50446 (not condMapEmpty!50455)) mapNonEmpty!50455))

(assert (= (and mapNonEmpty!50455 ((_ is ValueCellFull!15443) mapValue!50455)) b!1265066))

(assert (= (and mapNonEmpty!50446 ((_ is ValueCellFull!15443) mapDefault!50455)) b!1265067))

(declare-fun m!1165883 () Bool)

(assert (=> mapNonEmpty!50455 m!1165883))

(declare-fun b_lambda!22973 () Bool)

(assert (= b_lambda!22969 (or (and start!106342 b_free!27511) b_lambda!22973)))

(declare-fun b_lambda!22975 () Bool)

(assert (= b_lambda!22961 (or (and start!106342 b_free!27511) b_lambda!22975)))

(declare-fun b_lambda!22977 () Bool)

(assert (= b_lambda!22965 (or (and start!106342 b_free!27511) b_lambda!22977)))

(declare-fun b_lambda!22979 () Bool)

(assert (= b_lambda!22963 (or (and start!106342 b_free!27511) b_lambda!22979)))

(declare-fun b_lambda!22981 () Bool)

(assert (= b_lambda!22967 (or (and start!106342 b_free!27511) b_lambda!22981)))

(declare-fun b_lambda!22983 () Bool)

(assert (= b_lambda!22971 (or (and start!106342 b_free!27511) b_lambda!22983)))

(check-sat (not bm!62314) (not b!1265055) (not b_lambda!22977) (not b_lambda!22983) (not b!1264966) (not b!1264951) (not b!1265033) (not bm!62307) (not b!1265025) (not b!1265041) (not bm!62311) (not b!1264971) (not b!1265040) (not b!1265029) (not b!1264934) (not d!139097) (not b!1265035) (not b_lambda!22975) (not b!1264933) (not mapNonEmpty!50455) (not b!1264993) (not bm!62315) (not d!139109) tp_is_empty!32413 (not b_lambda!22981) (not b!1265023) (not bm!62302) (not b!1264949) (not b!1264980) (not bm!62301) (not b!1265056) (not bm!62296) (not bm!62308) (not b!1264960) (not b!1265024) (not b!1265026) (not b!1264952) (not d!139099) (not b!1264975) (not d!139101) (not d!139095) (not b!1264982) (not b!1265021) (not b!1264940) (not b!1265059) (not b!1264935) (not b_next!27511) (not bm!62318) (not b!1264983) b_and!45525 (not b!1264965) (not d!139107) (not d!139105) (not bm!62295) (not b!1264962) (not b_lambda!22979) (not b!1265032) (not b!1264964) (not b!1265044) (not bm!62300) (not b!1264994) (not b!1265028) (not b!1265037) (not b!1265038) (not b_lambda!22973) (not b!1264963) (not b!1265036) (not b!1264944) (not b!1264961) (not bm!62303))
(check-sat b_and!45525 (not b_next!27511))
