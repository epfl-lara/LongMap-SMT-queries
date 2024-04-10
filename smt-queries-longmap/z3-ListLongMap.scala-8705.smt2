; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105666 () Bool)

(assert start!105666)

(declare-fun b_free!27267 () Bool)

(declare-fun b_next!27267 () Bool)

(assert (=> start!105666 (= b_free!27267 (not b_next!27267))))

(declare-fun tp!95324 () Bool)

(declare-fun b_and!45141 () Bool)

(assert (=> start!105666 (= tp!95324 b_and!45141)))

(declare-fun b!1258681 () Bool)

(declare-fun e!715915 () Bool)

(declare-datatypes ((array!81958 0))(
  ( (array!81959 (arr!39535 (Array (_ BitVec 32) (_ BitVec 64))) (size!40071 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81958)

(assert (=> b!1258681 (= e!715915 (bvsle #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48257 0))(
  ( (V!48258 (val!16147 Int)) )
))
(declare-datatypes ((tuple2!20862 0))(
  ( (tuple2!20863 (_1!10442 (_ BitVec 64)) (_2!10442 V!48257)) )
))
(declare-datatypes ((List!28073 0))(
  ( (Nil!28070) (Cons!28069 (h!29278 tuple2!20862) (t!41566 List!28073)) )
))
(declare-datatypes ((ListLongMap!18735 0))(
  ( (ListLongMap!18736 (toList!9383 List!28073)) )
))
(declare-fun lt!569326 () ListLongMap!18735)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48257)

(declare-datatypes ((ValueCell!15321 0))(
  ( (ValueCellFull!15321 (v!18849 V!48257)) (EmptyCell!15321) )
))
(declare-datatypes ((array!81960 0))(
  ( (array!81961 (arr!39536 (Array (_ BitVec 32) ValueCell!15321)) (size!40072 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81960)

(declare-fun minValueBefore!43 () V!48257)

(declare-fun getCurrentListMap!4584 (array!81958 array!81960 (_ BitVec 32) (_ BitVec 32) V!48257 V!48257 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1258681 (= lt!569326 (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50047 () Bool)

(declare-fun mapRes!50047 () Bool)

(assert (=> mapIsEmpty!50047 mapRes!50047))

(declare-fun b!1258682 () Bool)

(declare-fun res!838920 () Bool)

(declare-fun e!715918 () Bool)

(assert (=> b!1258682 (=> (not res!838920) (not e!715918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81958 (_ BitVec 32)) Bool)

(assert (=> b!1258682 (= res!838920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258683 () Bool)

(assert (=> b!1258683 (= e!715918 (not e!715915))))

(declare-fun res!838919 () Bool)

(assert (=> b!1258683 (=> res!838919 e!715915)))

(assert (=> b!1258683 (= res!838919 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569325 () ListLongMap!18735)

(declare-fun lt!569323 () ListLongMap!18735)

(assert (=> b!1258683 (= lt!569325 lt!569323)))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41948 0))(
  ( (Unit!41949) )
))
(declare-fun lt!569324 () Unit!41948)

(declare-fun minValueAfter!43 () V!48257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1124 (array!81958 array!81960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48257 V!48257 V!48257 V!48257 (_ BitVec 32) Int) Unit!41948)

(assert (=> b!1258683 (= lt!569324 (lemmaNoChangeToArrayThenSameMapNoExtras!1124 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5760 (array!81958 array!81960 (_ BitVec 32) (_ BitVec 32) V!48257 V!48257 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1258683 (= lt!569323 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258683 (= lt!569325 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838918 () Bool)

(assert (=> start!105666 (=> (not res!838918) (not e!715918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105666 (= res!838918 (validMask!0 mask!1466))))

(assert (=> start!105666 e!715918))

(assert (=> start!105666 true))

(assert (=> start!105666 tp!95324))

(declare-fun tp_is_empty!32169 () Bool)

(assert (=> start!105666 tp_is_empty!32169))

(declare-fun array_inv!30105 (array!81958) Bool)

(assert (=> start!105666 (array_inv!30105 _keys!1118)))

(declare-fun e!715919 () Bool)

(declare-fun array_inv!30106 (array!81960) Bool)

(assert (=> start!105666 (and (array_inv!30106 _values!914) e!715919)))

(declare-fun b!1258684 () Bool)

(declare-fun res!838921 () Bool)

(assert (=> b!1258684 (=> (not res!838921) (not e!715918))))

(declare-datatypes ((List!28074 0))(
  ( (Nil!28071) (Cons!28070 (h!29279 (_ BitVec 64)) (t!41567 List!28074)) )
))
(declare-fun arrayNoDuplicates!0 (array!81958 (_ BitVec 32) List!28074) Bool)

(assert (=> b!1258684 (= res!838921 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28071))))

(declare-fun b!1258685 () Bool)

(declare-fun e!715916 () Bool)

(assert (=> b!1258685 (= e!715916 tp_is_empty!32169)))

(declare-fun b!1258686 () Bool)

(declare-fun e!715917 () Bool)

(assert (=> b!1258686 (= e!715919 (and e!715917 mapRes!50047))))

(declare-fun condMapEmpty!50047 () Bool)

(declare-fun mapDefault!50047 () ValueCell!15321)

(assert (=> b!1258686 (= condMapEmpty!50047 (= (arr!39536 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15321)) mapDefault!50047)))))

(declare-fun b!1258687 () Bool)

(declare-fun res!838922 () Bool)

(assert (=> b!1258687 (=> (not res!838922) (not e!715918))))

(assert (=> b!1258687 (= res!838922 (and (= (size!40072 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40071 _keys!1118) (size!40072 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258688 () Bool)

(assert (=> b!1258688 (= e!715917 tp_is_empty!32169)))

(declare-fun mapNonEmpty!50047 () Bool)

(declare-fun tp!95323 () Bool)

(assert (=> mapNonEmpty!50047 (= mapRes!50047 (and tp!95323 e!715916))))

(declare-fun mapKey!50047 () (_ BitVec 32))

(declare-fun mapRest!50047 () (Array (_ BitVec 32) ValueCell!15321))

(declare-fun mapValue!50047 () ValueCell!15321)

(assert (=> mapNonEmpty!50047 (= (arr!39536 _values!914) (store mapRest!50047 mapKey!50047 mapValue!50047))))

(assert (= (and start!105666 res!838918) b!1258687))

(assert (= (and b!1258687 res!838922) b!1258682))

(assert (= (and b!1258682 res!838920) b!1258684))

(assert (= (and b!1258684 res!838921) b!1258683))

(assert (= (and b!1258683 (not res!838919)) b!1258681))

(assert (= (and b!1258686 condMapEmpty!50047) mapIsEmpty!50047))

(assert (= (and b!1258686 (not condMapEmpty!50047)) mapNonEmpty!50047))

(get-info :version)

(assert (= (and mapNonEmpty!50047 ((_ is ValueCellFull!15321) mapValue!50047)) b!1258685))

(assert (= (and b!1258686 ((_ is ValueCellFull!15321) mapDefault!50047)) b!1258688))

(assert (= start!105666 b!1258686))

(declare-fun m!1159069 () Bool)

(assert (=> b!1258681 m!1159069))

(declare-fun m!1159071 () Bool)

(assert (=> mapNonEmpty!50047 m!1159071))

(declare-fun m!1159073 () Bool)

(assert (=> start!105666 m!1159073))

(declare-fun m!1159075 () Bool)

(assert (=> start!105666 m!1159075))

(declare-fun m!1159077 () Bool)

(assert (=> start!105666 m!1159077))

(declare-fun m!1159079 () Bool)

(assert (=> b!1258683 m!1159079))

(declare-fun m!1159081 () Bool)

(assert (=> b!1258683 m!1159081))

(declare-fun m!1159083 () Bool)

(assert (=> b!1258683 m!1159083))

(declare-fun m!1159085 () Bool)

(assert (=> b!1258682 m!1159085))

(declare-fun m!1159087 () Bool)

(assert (=> b!1258684 m!1159087))

(check-sat (not mapNonEmpty!50047) (not b!1258683) (not start!105666) (not b!1258684) tp_is_empty!32169 (not b_next!27267) (not b!1258682) (not b!1258681) b_and!45141)
(check-sat b_and!45141 (not b_next!27267))
(get-model)

(declare-fun b!1258755 () Bool)

(declare-fun e!715974 () Bool)

(declare-fun lt!569383 () ListLongMap!18735)

(declare-fun apply!991 (ListLongMap!18735 (_ BitVec 64)) V!48257)

(assert (=> b!1258755 (= e!715974 (= (apply!991 lt!569383 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1258756 () Bool)

(declare-fun e!715968 () Bool)

(declare-fun get!20198 (ValueCell!15321 V!48257) V!48257)

(declare-fun dynLambda!3389 (Int (_ BitVec 64)) V!48257)

(assert (=> b!1258756 (= e!715968 (= (apply!991 lt!569383 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)) (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1258756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40072 _values!914)))))

(assert (=> b!1258756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun c!122529 () Bool)

(declare-fun call!61869 () ListLongMap!18735)

(declare-fun c!122531 () Bool)

(declare-fun call!61870 () ListLongMap!18735)

(declare-fun call!61864 () ListLongMap!18735)

(declare-fun bm!61861 () Bool)

(declare-fun call!61865 () ListLongMap!18735)

(declare-fun +!4190 (ListLongMap!18735 tuple2!20862) ListLongMap!18735)

(assert (=> bm!61861 (= call!61869 (+!4190 (ite c!122531 call!61864 (ite c!122529 call!61870 call!61865)) (ite (or c!122531 c!122529) (tuple2!20863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61862 () Bool)

(declare-fun call!61866 () ListLongMap!18735)

(assert (=> bm!61862 (= call!61866 call!61869)))

(declare-fun b!1258757 () Bool)

(declare-fun e!715964 () ListLongMap!18735)

(assert (=> b!1258757 (= e!715964 call!61865)))

(declare-fun b!1258758 () Bool)

(declare-fun e!715975 () Bool)

(declare-fun call!61868 () Bool)

(assert (=> b!1258758 (= e!715975 (not call!61868))))

(declare-fun b!1258759 () Bool)

(declare-fun e!715972 () Bool)

(assert (=> b!1258759 (= e!715972 (= (apply!991 lt!569383 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1258760 () Bool)

(declare-fun c!122532 () Bool)

(assert (=> b!1258760 (= c!122532 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!715970 () ListLongMap!18735)

(assert (=> b!1258760 (= e!715970 e!715964)))

(declare-fun b!1258761 () Bool)

(declare-fun res!838963 () Bool)

(declare-fun e!715976 () Bool)

(assert (=> b!1258761 (=> (not res!838963) (not e!715976))))

(declare-fun e!715966 () Bool)

(assert (=> b!1258761 (= res!838963 e!715966)))

(declare-fun res!838956 () Bool)

(assert (=> b!1258761 (=> res!838956 e!715966)))

(declare-fun e!715973 () Bool)

(assert (=> b!1258761 (= res!838956 (not e!715973))))

(declare-fun res!838961 () Bool)

(assert (=> b!1258761 (=> (not res!838961) (not e!715973))))

(assert (=> b!1258761 (= res!838961 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun b!1258762 () Bool)

(assert (=> b!1258762 (= e!715975 e!715972)))

(declare-fun res!838958 () Bool)

(assert (=> b!1258762 (= res!838958 call!61868)))

(assert (=> b!1258762 (=> (not res!838958) (not e!715972))))

(declare-fun d!138303 () Bool)

(assert (=> d!138303 e!715976))

(declare-fun res!838959 () Bool)

(assert (=> d!138303 (=> (not res!838959) (not e!715976))))

(assert (=> d!138303 (= res!838959 (or (bvsge #b00000000000000000000000000000000 (size!40071 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))))

(declare-fun lt!569398 () ListLongMap!18735)

(assert (=> d!138303 (= lt!569383 lt!569398)))

(declare-fun lt!569403 () Unit!41948)

(declare-fun e!715971 () Unit!41948)

(assert (=> d!138303 (= lt!569403 e!715971)))

(declare-fun c!122534 () Bool)

(declare-fun e!715967 () Bool)

(assert (=> d!138303 (= c!122534 e!715967)))

(declare-fun res!838960 () Bool)

(assert (=> d!138303 (=> (not res!838960) (not e!715967))))

(assert (=> d!138303 (= res!838960 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun e!715965 () ListLongMap!18735)

(assert (=> d!138303 (= lt!569398 e!715965)))

(assert (=> d!138303 (= c!122531 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138303 (validMask!0 mask!1466)))

(assert (=> d!138303 (= (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569383)))

(declare-fun b!1258763 () Bool)

(assert (=> b!1258763 (= e!715964 call!61866)))

(declare-fun b!1258764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1258764 (= e!715973 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61863 () Bool)

(declare-fun call!61867 () Bool)

(declare-fun contains!7569 (ListLongMap!18735 (_ BitVec 64)) Bool)

(assert (=> bm!61863 (= call!61867 (contains!7569 lt!569383 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61864 () Bool)

(assert (=> bm!61864 (= call!61870 call!61864)))

(declare-fun bm!61865 () Bool)

(assert (=> bm!61865 (= call!61868 (contains!7569 lt!569383 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258765 () Bool)

(assert (=> b!1258765 (= e!715965 e!715970)))

(assert (=> b!1258765 (= c!122529 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258766 () Bool)

(assert (=> b!1258766 (= e!715965 (+!4190 call!61869 (tuple2!20863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1258767 () Bool)

(declare-fun lt!569386 () Unit!41948)

(assert (=> b!1258767 (= e!715971 lt!569386)))

(declare-fun lt!569394 () ListLongMap!18735)

(assert (=> b!1258767 (= lt!569394 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569399 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569395 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569395 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569389 () Unit!41948)

(declare-fun addStillContains!1082 (ListLongMap!18735 (_ BitVec 64) V!48257 (_ BitVec 64)) Unit!41948)

(assert (=> b!1258767 (= lt!569389 (addStillContains!1082 lt!569394 lt!569399 zeroValue!871 lt!569395))))

(assert (=> b!1258767 (contains!7569 (+!4190 lt!569394 (tuple2!20863 lt!569399 zeroValue!871)) lt!569395)))

(declare-fun lt!569397 () Unit!41948)

(assert (=> b!1258767 (= lt!569397 lt!569389)))

(declare-fun lt!569400 () ListLongMap!18735)

(assert (=> b!1258767 (= lt!569400 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569390 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569390 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569388 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569388 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569396 () Unit!41948)

(declare-fun addApplyDifferent!536 (ListLongMap!18735 (_ BitVec 64) V!48257 (_ BitVec 64)) Unit!41948)

(assert (=> b!1258767 (= lt!569396 (addApplyDifferent!536 lt!569400 lt!569390 minValueBefore!43 lt!569388))))

(assert (=> b!1258767 (= (apply!991 (+!4190 lt!569400 (tuple2!20863 lt!569390 minValueBefore!43)) lt!569388) (apply!991 lt!569400 lt!569388))))

(declare-fun lt!569391 () Unit!41948)

(assert (=> b!1258767 (= lt!569391 lt!569396)))

(declare-fun lt!569384 () ListLongMap!18735)

(assert (=> b!1258767 (= lt!569384 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569401 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569392 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569392 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569385 () Unit!41948)

(assert (=> b!1258767 (= lt!569385 (addApplyDifferent!536 lt!569384 lt!569401 zeroValue!871 lt!569392))))

(assert (=> b!1258767 (= (apply!991 (+!4190 lt!569384 (tuple2!20863 lt!569401 zeroValue!871)) lt!569392) (apply!991 lt!569384 lt!569392))))

(declare-fun lt!569402 () Unit!41948)

(assert (=> b!1258767 (= lt!569402 lt!569385)))

(declare-fun lt!569387 () ListLongMap!18735)

(assert (=> b!1258767 (= lt!569387 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569393 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569404 () (_ BitVec 64))

(assert (=> b!1258767 (= lt!569404 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258767 (= lt!569386 (addApplyDifferent!536 lt!569387 lt!569393 minValueBefore!43 lt!569404))))

(assert (=> b!1258767 (= (apply!991 (+!4190 lt!569387 (tuple2!20863 lt!569393 minValueBefore!43)) lt!569404) (apply!991 lt!569387 lt!569404))))

(declare-fun b!1258768 () Bool)

(declare-fun e!715969 () Bool)

(assert (=> b!1258768 (= e!715969 e!715974)))

(declare-fun res!838964 () Bool)

(assert (=> b!1258768 (= res!838964 call!61867)))

(assert (=> b!1258768 (=> (not res!838964) (not e!715974))))

(declare-fun b!1258769 () Bool)

(assert (=> b!1258769 (= e!715967 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258770 () Bool)

(assert (=> b!1258770 (= e!715966 e!715968)))

(declare-fun res!838957 () Bool)

(assert (=> b!1258770 (=> (not res!838957) (not e!715968))))

(assert (=> b!1258770 (= res!838957 (contains!7569 lt!569383 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun bm!61866 () Bool)

(assert (=> bm!61866 (= call!61864 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258771 () Bool)

(declare-fun Unit!41950 () Unit!41948)

(assert (=> b!1258771 (= e!715971 Unit!41950)))

(declare-fun b!1258772 () Bool)

(assert (=> b!1258772 (= e!715970 call!61866)))

(declare-fun b!1258773 () Bool)

(declare-fun res!838962 () Bool)

(assert (=> b!1258773 (=> (not res!838962) (not e!715976))))

(assert (=> b!1258773 (= res!838962 e!715975)))

(declare-fun c!122530 () Bool)

(assert (=> b!1258773 (= c!122530 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1258774 () Bool)

(assert (=> b!1258774 (= e!715969 (not call!61867))))

(declare-fun bm!61867 () Bool)

(assert (=> bm!61867 (= call!61865 call!61870)))

(declare-fun b!1258775 () Bool)

(assert (=> b!1258775 (= e!715976 e!715969)))

(declare-fun c!122533 () Bool)

(assert (=> b!1258775 (= c!122533 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138303 c!122531) b!1258766))

(assert (= (and d!138303 (not c!122531)) b!1258765))

(assert (= (and b!1258765 c!122529) b!1258772))

(assert (= (and b!1258765 (not c!122529)) b!1258760))

(assert (= (and b!1258760 c!122532) b!1258763))

(assert (= (and b!1258760 (not c!122532)) b!1258757))

(assert (= (or b!1258763 b!1258757) bm!61867))

(assert (= (or b!1258772 bm!61867) bm!61864))

(assert (= (or b!1258772 b!1258763) bm!61862))

(assert (= (or b!1258766 bm!61864) bm!61866))

(assert (= (or b!1258766 bm!61862) bm!61861))

(assert (= (and d!138303 res!838960) b!1258769))

(assert (= (and d!138303 c!122534) b!1258767))

(assert (= (and d!138303 (not c!122534)) b!1258771))

(assert (= (and d!138303 res!838959) b!1258761))

(assert (= (and b!1258761 res!838961) b!1258764))

(assert (= (and b!1258761 (not res!838956)) b!1258770))

(assert (= (and b!1258770 res!838957) b!1258756))

(assert (= (and b!1258761 res!838963) b!1258773))

(assert (= (and b!1258773 c!122530) b!1258762))

(assert (= (and b!1258773 (not c!122530)) b!1258758))

(assert (= (and b!1258762 res!838958) b!1258759))

(assert (= (or b!1258762 b!1258758) bm!61865))

(assert (= (and b!1258773 res!838962) b!1258775))

(assert (= (and b!1258775 c!122533) b!1258768))

(assert (= (and b!1258775 (not c!122533)) b!1258774))

(assert (= (and b!1258768 res!838964) b!1258755))

(assert (= (or b!1258768 b!1258774) bm!61863))

(declare-fun b_lambda!22723 () Bool)

(assert (=> (not b_lambda!22723) (not b!1258756)))

(declare-fun t!41569 () Bool)

(declare-fun tb!11309 () Bool)

(assert (=> (and start!105666 (= defaultEntry!922 defaultEntry!922) t!41569) tb!11309))

(declare-fun result!23335 () Bool)

(assert (=> tb!11309 (= result!23335 tp_is_empty!32169)))

(assert (=> b!1258756 t!41569))

(declare-fun b_and!45145 () Bool)

(assert (= b_and!45141 (and (=> t!41569 result!23335) b_and!45145)))

(declare-fun m!1159109 () Bool)

(assert (=> bm!61861 m!1159109))

(declare-fun m!1159111 () Bool)

(assert (=> b!1258766 m!1159111))

(declare-fun m!1159113 () Bool)

(assert (=> b!1258770 m!1159113))

(assert (=> b!1258770 m!1159113))

(declare-fun m!1159115 () Bool)

(assert (=> b!1258770 m!1159115))

(declare-fun m!1159117 () Bool)

(assert (=> bm!61865 m!1159117))

(assert (=> b!1258769 m!1159113))

(assert (=> b!1258769 m!1159113))

(declare-fun m!1159119 () Bool)

(assert (=> b!1258769 m!1159119))

(declare-fun m!1159121 () Bool)

(assert (=> bm!61863 m!1159121))

(assert (=> d!138303 m!1159073))

(declare-fun m!1159123 () Bool)

(assert (=> b!1258759 m!1159123))

(declare-fun m!1159125 () Bool)

(assert (=> b!1258756 m!1159125))

(declare-fun m!1159127 () Bool)

(assert (=> b!1258756 m!1159127))

(assert (=> b!1258756 m!1159125))

(declare-fun m!1159129 () Bool)

(assert (=> b!1258756 m!1159129))

(assert (=> b!1258756 m!1159113))

(assert (=> b!1258756 m!1159127))

(assert (=> b!1258756 m!1159113))

(declare-fun m!1159131 () Bool)

(assert (=> b!1258756 m!1159131))

(assert (=> b!1258764 m!1159113))

(assert (=> b!1258764 m!1159113))

(assert (=> b!1258764 m!1159119))

(declare-fun m!1159133 () Bool)

(assert (=> b!1258767 m!1159133))

(declare-fun m!1159135 () Bool)

(assert (=> b!1258767 m!1159135))

(declare-fun m!1159137 () Bool)

(assert (=> b!1258767 m!1159137))

(assert (=> b!1258767 m!1159133))

(declare-fun m!1159139 () Bool)

(assert (=> b!1258767 m!1159139))

(declare-fun m!1159141 () Bool)

(assert (=> b!1258767 m!1159141))

(declare-fun m!1159143 () Bool)

(assert (=> b!1258767 m!1159143))

(declare-fun m!1159145 () Bool)

(assert (=> b!1258767 m!1159145))

(declare-fun m!1159147 () Bool)

(assert (=> b!1258767 m!1159147))

(declare-fun m!1159149 () Bool)

(assert (=> b!1258767 m!1159149))

(declare-fun m!1159151 () Bool)

(assert (=> b!1258767 m!1159151))

(declare-fun m!1159153 () Bool)

(assert (=> b!1258767 m!1159153))

(assert (=> b!1258767 m!1159149))

(declare-fun m!1159155 () Bool)

(assert (=> b!1258767 m!1159155))

(assert (=> b!1258767 m!1159083))

(declare-fun m!1159157 () Bool)

(assert (=> b!1258767 m!1159157))

(declare-fun m!1159159 () Bool)

(assert (=> b!1258767 m!1159159))

(assert (=> b!1258767 m!1159145))

(assert (=> b!1258767 m!1159141))

(declare-fun m!1159161 () Bool)

(assert (=> b!1258767 m!1159161))

(assert (=> b!1258767 m!1159113))

(assert (=> bm!61866 m!1159083))

(declare-fun m!1159163 () Bool)

(assert (=> b!1258755 m!1159163))

(assert (=> b!1258681 d!138303))

(declare-fun bm!61870 () Bool)

(declare-fun call!61873 () Bool)

(assert (=> bm!61870 (= call!61873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1258786 () Bool)

(declare-fun e!715983 () Bool)

(assert (=> b!1258786 (= e!715983 call!61873)))

(declare-fun b!1258787 () Bool)

(declare-fun e!715984 () Bool)

(assert (=> b!1258787 (= e!715984 call!61873)))

(declare-fun d!138305 () Bool)

(declare-fun res!838970 () Bool)

(declare-fun e!715985 () Bool)

(assert (=> d!138305 (=> res!838970 e!715985)))

(assert (=> d!138305 (= res!838970 (bvsge #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> d!138305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715985)))

(declare-fun b!1258788 () Bool)

(assert (=> b!1258788 (= e!715983 e!715984)))

(declare-fun lt!569413 () (_ BitVec 64))

(assert (=> b!1258788 (= lt!569413 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569412 () Unit!41948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81958 (_ BitVec 64) (_ BitVec 32)) Unit!41948)

(assert (=> b!1258788 (= lt!569412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569413 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1258788 (arrayContainsKey!0 _keys!1118 lt!569413 #b00000000000000000000000000000000)))

(declare-fun lt!569411 () Unit!41948)

(assert (=> b!1258788 (= lt!569411 lt!569412)))

(declare-fun res!838969 () Bool)

(declare-datatypes ((SeekEntryResult!9969 0))(
  ( (MissingZero!9969 (index!42247 (_ BitVec 32))) (Found!9969 (index!42248 (_ BitVec 32))) (Intermediate!9969 (undefined!10781 Bool) (index!42249 (_ BitVec 32)) (x!110885 (_ BitVec 32))) (Undefined!9969) (MissingVacant!9969 (index!42250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81958 (_ BitVec 32)) SeekEntryResult!9969)

(assert (=> b!1258788 (= res!838969 (= (seekEntryOrOpen!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9969 #b00000000000000000000000000000000)))))

(assert (=> b!1258788 (=> (not res!838969) (not e!715984))))

(declare-fun b!1258789 () Bool)

(assert (=> b!1258789 (= e!715985 e!715983)))

(declare-fun c!122537 () Bool)

(assert (=> b!1258789 (= c!122537 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138305 (not res!838970)) b!1258789))

(assert (= (and b!1258789 c!122537) b!1258788))

(assert (= (and b!1258789 (not c!122537)) b!1258786))

(assert (= (and b!1258788 res!838969) b!1258787))

(assert (= (or b!1258787 b!1258786) bm!61870))

(declare-fun m!1159165 () Bool)

(assert (=> bm!61870 m!1159165))

(assert (=> b!1258788 m!1159113))

(declare-fun m!1159167 () Bool)

(assert (=> b!1258788 m!1159167))

(declare-fun m!1159169 () Bool)

(assert (=> b!1258788 m!1159169))

(assert (=> b!1258788 m!1159113))

(declare-fun m!1159171 () Bool)

(assert (=> b!1258788 m!1159171))

(assert (=> b!1258789 m!1159113))

(assert (=> b!1258789 m!1159113))

(assert (=> b!1258789 m!1159119))

(assert (=> b!1258682 d!138305))

(declare-fun d!138307 () Bool)

(assert (=> d!138307 (= (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569416 () Unit!41948)

(declare-fun choose!1863 (array!81958 array!81960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48257 V!48257 V!48257 V!48257 (_ BitVec 32) Int) Unit!41948)

(assert (=> d!138307 (= lt!569416 (choose!1863 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138307 (validMask!0 mask!1466)))

(assert (=> d!138307 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1124 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569416)))

(declare-fun bs!35607 () Bool)

(assert (= bs!35607 d!138307))

(assert (=> bs!35607 m!1159083))

(assert (=> bs!35607 m!1159081))

(declare-fun m!1159173 () Bool)

(assert (=> bs!35607 m!1159173))

(assert (=> bs!35607 m!1159073))

(assert (=> b!1258683 d!138307))

(declare-fun b!1258814 () Bool)

(assert (=> b!1258814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> b!1258814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40072 _values!914)))))

(declare-fun e!716000 () Bool)

(declare-fun lt!569436 () ListLongMap!18735)

(assert (=> b!1258814 (= e!716000 (= (apply!991 lt!569436 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)) (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258815 () Bool)

(declare-fun e!716005 () Bool)

(assert (=> b!1258815 (= e!716005 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258815 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!61876 () ListLongMap!18735)

(declare-fun bm!61873 () Bool)

(assert (=> bm!61873 (= call!61876 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258816 () Bool)

(declare-fun lt!569433 () Unit!41948)

(declare-fun lt!569435 () Unit!41948)

(assert (=> b!1258816 (= lt!569433 lt!569435)))

(declare-fun lt!569437 () (_ BitVec 64))

(declare-fun lt!569432 () (_ BitVec 64))

(declare-fun lt!569434 () ListLongMap!18735)

(declare-fun lt!569431 () V!48257)

(assert (=> b!1258816 (not (contains!7569 (+!4190 lt!569434 (tuple2!20863 lt!569437 lt!569431)) lt!569432))))

(declare-fun addStillNotContains!319 (ListLongMap!18735 (_ BitVec 64) V!48257 (_ BitVec 64)) Unit!41948)

(assert (=> b!1258816 (= lt!569435 (addStillNotContains!319 lt!569434 lt!569437 lt!569431 lt!569432))))

(assert (=> b!1258816 (= lt!569432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258816 (= lt!569431 (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258816 (= lt!569437 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258816 (= lt!569434 call!61876)))

(declare-fun e!716001 () ListLongMap!18735)

(assert (=> b!1258816 (= e!716001 (+!4190 call!61876 (tuple2!20863 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000) (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258817 () Bool)

(assert (=> b!1258817 (= e!716001 call!61876)))

(declare-fun b!1258818 () Bool)

(declare-fun e!716003 () Bool)

(declare-fun e!716002 () Bool)

(assert (=> b!1258818 (= e!716003 e!716002)))

(declare-fun c!122548 () Bool)

(assert (=> b!1258818 (= c!122548 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun b!1258819 () Bool)

(declare-fun res!838980 () Bool)

(declare-fun e!716006 () Bool)

(assert (=> b!1258819 (=> (not res!838980) (not e!716006))))

(assert (=> b!1258819 (= res!838980 (not (contains!7569 lt!569436 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258820 () Bool)

(declare-fun isEmpty!1033 (ListLongMap!18735) Bool)

(assert (=> b!1258820 (= e!716002 (isEmpty!1033 lt!569436))))

(declare-fun b!1258821 () Bool)

(assert (=> b!1258821 (= e!716003 e!716000)))

(assert (=> b!1258821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun res!838979 () Bool)

(assert (=> b!1258821 (= res!838979 (contains!7569 lt!569436 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258821 (=> (not res!838979) (not e!716000))))

(declare-fun b!1258822 () Bool)

(declare-fun e!716004 () ListLongMap!18735)

(assert (=> b!1258822 (= e!716004 (ListLongMap!18736 Nil!28070))))

(declare-fun d!138309 () Bool)

(assert (=> d!138309 e!716006))

(declare-fun res!838981 () Bool)

(assert (=> d!138309 (=> (not res!838981) (not e!716006))))

(assert (=> d!138309 (= res!838981 (not (contains!7569 lt!569436 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138309 (= lt!569436 e!716004)))

(declare-fun c!122549 () Bool)

(assert (=> d!138309 (= c!122549 (bvsge #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> d!138309 (validMask!0 mask!1466)))

(assert (=> d!138309 (= (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569436)))

(declare-fun b!1258823 () Bool)

(assert (=> b!1258823 (= e!716006 e!716003)))

(declare-fun c!122546 () Bool)

(assert (=> b!1258823 (= c!122546 e!716005)))

(declare-fun res!838982 () Bool)

(assert (=> b!1258823 (=> (not res!838982) (not e!716005))))

(assert (=> b!1258823 (= res!838982 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun b!1258824 () Bool)

(assert (=> b!1258824 (= e!716002 (= lt!569436 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258825 () Bool)

(assert (=> b!1258825 (= e!716004 e!716001)))

(declare-fun c!122547 () Bool)

(assert (=> b!1258825 (= c!122547 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138309 c!122549) b!1258822))

(assert (= (and d!138309 (not c!122549)) b!1258825))

(assert (= (and b!1258825 c!122547) b!1258816))

(assert (= (and b!1258825 (not c!122547)) b!1258817))

(assert (= (or b!1258816 b!1258817) bm!61873))

(assert (= (and d!138309 res!838981) b!1258819))

(assert (= (and b!1258819 res!838980) b!1258823))

(assert (= (and b!1258823 res!838982) b!1258815))

(assert (= (and b!1258823 c!122546) b!1258821))

(assert (= (and b!1258823 (not c!122546)) b!1258818))

(assert (= (and b!1258821 res!838979) b!1258814))

(assert (= (and b!1258818 c!122548) b!1258824))

(assert (= (and b!1258818 (not c!122548)) b!1258820))

(declare-fun b_lambda!22725 () Bool)

(assert (=> (not b_lambda!22725) (not b!1258814)))

(assert (=> b!1258814 t!41569))

(declare-fun b_and!45147 () Bool)

(assert (= b_and!45145 (and (=> t!41569 result!23335) b_and!45147)))

(declare-fun b_lambda!22727 () Bool)

(assert (=> (not b_lambda!22727) (not b!1258816)))

(assert (=> b!1258816 t!41569))

(declare-fun b_and!45149 () Bool)

(assert (= b_and!45147 (and (=> t!41569 result!23335) b_and!45149)))

(assert (=> b!1258815 m!1159113))

(assert (=> b!1258815 m!1159113))

(assert (=> b!1258815 m!1159119))

(declare-fun m!1159175 () Bool)

(assert (=> bm!61873 m!1159175))

(assert (=> b!1258821 m!1159113))

(assert (=> b!1258821 m!1159113))

(declare-fun m!1159177 () Bool)

(assert (=> b!1258821 m!1159177))

(declare-fun m!1159179 () Bool)

(assert (=> d!138309 m!1159179))

(assert (=> d!138309 m!1159073))

(declare-fun m!1159181 () Bool)

(assert (=> b!1258820 m!1159181))

(assert (=> b!1258825 m!1159113))

(assert (=> b!1258825 m!1159113))

(assert (=> b!1258825 m!1159119))

(assert (=> b!1258824 m!1159175))

(assert (=> b!1258814 m!1159127))

(assert (=> b!1258814 m!1159125))

(assert (=> b!1258814 m!1159113))

(assert (=> b!1258814 m!1159127))

(assert (=> b!1258814 m!1159125))

(assert (=> b!1258814 m!1159129))

(assert (=> b!1258814 m!1159113))

(declare-fun m!1159183 () Bool)

(assert (=> b!1258814 m!1159183))

(declare-fun m!1159185 () Bool)

(assert (=> b!1258819 m!1159185))

(assert (=> b!1258816 m!1159127))

(assert (=> b!1258816 m!1159125))

(assert (=> b!1258816 m!1159113))

(declare-fun m!1159187 () Bool)

(assert (=> b!1258816 m!1159187))

(declare-fun m!1159189 () Bool)

(assert (=> b!1258816 m!1159189))

(declare-fun m!1159191 () Bool)

(assert (=> b!1258816 m!1159191))

(assert (=> b!1258816 m!1159127))

(assert (=> b!1258816 m!1159125))

(assert (=> b!1258816 m!1159129))

(assert (=> b!1258816 m!1159189))

(declare-fun m!1159193 () Bool)

(assert (=> b!1258816 m!1159193))

(assert (=> b!1258683 d!138309))

(declare-fun b!1258826 () Bool)

(assert (=> b!1258826 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> b!1258826 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40072 _values!914)))))

(declare-fun e!716007 () Bool)

(declare-fun lt!569443 () ListLongMap!18735)

(assert (=> b!1258826 (= e!716007 (= (apply!991 lt!569443 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)) (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258827 () Bool)

(declare-fun e!716012 () Bool)

(assert (=> b!1258827 (= e!716012 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258827 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!61874 () Bool)

(declare-fun call!61877 () ListLongMap!18735)

(assert (=> bm!61874 (= call!61877 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258828 () Bool)

(declare-fun lt!569440 () Unit!41948)

(declare-fun lt!569442 () Unit!41948)

(assert (=> b!1258828 (= lt!569440 lt!569442)))

(declare-fun lt!569441 () ListLongMap!18735)

(declare-fun lt!569444 () (_ BitVec 64))

(declare-fun lt!569439 () (_ BitVec 64))

(declare-fun lt!569438 () V!48257)

(assert (=> b!1258828 (not (contains!7569 (+!4190 lt!569441 (tuple2!20863 lt!569444 lt!569438)) lt!569439))))

(assert (=> b!1258828 (= lt!569442 (addStillNotContains!319 lt!569441 lt!569444 lt!569438 lt!569439))))

(assert (=> b!1258828 (= lt!569439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258828 (= lt!569438 (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258828 (= lt!569444 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258828 (= lt!569441 call!61877)))

(declare-fun e!716008 () ListLongMap!18735)

(assert (=> b!1258828 (= e!716008 (+!4190 call!61877 (tuple2!20863 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000) (get!20198 (select (arr!39536 _values!914) #b00000000000000000000000000000000) (dynLambda!3389 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258829 () Bool)

(assert (=> b!1258829 (= e!716008 call!61877)))

(declare-fun b!1258830 () Bool)

(declare-fun e!716010 () Bool)

(declare-fun e!716009 () Bool)

(assert (=> b!1258830 (= e!716010 e!716009)))

(declare-fun c!122552 () Bool)

(assert (=> b!1258830 (= c!122552 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun b!1258831 () Bool)

(declare-fun res!838984 () Bool)

(declare-fun e!716013 () Bool)

(assert (=> b!1258831 (=> (not res!838984) (not e!716013))))

(assert (=> b!1258831 (= res!838984 (not (contains!7569 lt!569443 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258832 () Bool)

(assert (=> b!1258832 (= e!716009 (isEmpty!1033 lt!569443))))

(declare-fun b!1258833 () Bool)

(assert (=> b!1258833 (= e!716010 e!716007)))

(assert (=> b!1258833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun res!838983 () Bool)

(assert (=> b!1258833 (= res!838983 (contains!7569 lt!569443 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258833 (=> (not res!838983) (not e!716007))))

(declare-fun b!1258834 () Bool)

(declare-fun e!716011 () ListLongMap!18735)

(assert (=> b!1258834 (= e!716011 (ListLongMap!18736 Nil!28070))))

(declare-fun d!138311 () Bool)

(assert (=> d!138311 e!716013))

(declare-fun res!838985 () Bool)

(assert (=> d!138311 (=> (not res!838985) (not e!716013))))

(assert (=> d!138311 (= res!838985 (not (contains!7569 lt!569443 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138311 (= lt!569443 e!716011)))

(declare-fun c!122553 () Bool)

(assert (=> d!138311 (= c!122553 (bvsge #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> d!138311 (validMask!0 mask!1466)))

(assert (=> d!138311 (= (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569443)))

(declare-fun b!1258835 () Bool)

(assert (=> b!1258835 (= e!716013 e!716010)))

(declare-fun c!122550 () Bool)

(assert (=> b!1258835 (= c!122550 e!716012)))

(declare-fun res!838986 () Bool)

(assert (=> b!1258835 (=> (not res!838986) (not e!716012))))

(assert (=> b!1258835 (= res!838986 (bvslt #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(declare-fun b!1258836 () Bool)

(assert (=> b!1258836 (= e!716009 (= lt!569443 (getCurrentListMapNoExtraKeys!5760 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258837 () Bool)

(assert (=> b!1258837 (= e!716011 e!716008)))

(declare-fun c!122551 () Bool)

(assert (=> b!1258837 (= c!122551 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138311 c!122553) b!1258834))

(assert (= (and d!138311 (not c!122553)) b!1258837))

(assert (= (and b!1258837 c!122551) b!1258828))

(assert (= (and b!1258837 (not c!122551)) b!1258829))

(assert (= (or b!1258828 b!1258829) bm!61874))

(assert (= (and d!138311 res!838985) b!1258831))

(assert (= (and b!1258831 res!838984) b!1258835))

(assert (= (and b!1258835 res!838986) b!1258827))

(assert (= (and b!1258835 c!122550) b!1258833))

(assert (= (and b!1258835 (not c!122550)) b!1258830))

(assert (= (and b!1258833 res!838983) b!1258826))

(assert (= (and b!1258830 c!122552) b!1258836))

(assert (= (and b!1258830 (not c!122552)) b!1258832))

(declare-fun b_lambda!22729 () Bool)

(assert (=> (not b_lambda!22729) (not b!1258826)))

(assert (=> b!1258826 t!41569))

(declare-fun b_and!45151 () Bool)

(assert (= b_and!45149 (and (=> t!41569 result!23335) b_and!45151)))

(declare-fun b_lambda!22731 () Bool)

(assert (=> (not b_lambda!22731) (not b!1258828)))

(assert (=> b!1258828 t!41569))

(declare-fun b_and!45153 () Bool)

(assert (= b_and!45151 (and (=> t!41569 result!23335) b_and!45153)))

(assert (=> b!1258827 m!1159113))

(assert (=> b!1258827 m!1159113))

(assert (=> b!1258827 m!1159119))

(declare-fun m!1159195 () Bool)

(assert (=> bm!61874 m!1159195))

(assert (=> b!1258833 m!1159113))

(assert (=> b!1258833 m!1159113))

(declare-fun m!1159197 () Bool)

(assert (=> b!1258833 m!1159197))

(declare-fun m!1159199 () Bool)

(assert (=> d!138311 m!1159199))

(assert (=> d!138311 m!1159073))

(declare-fun m!1159201 () Bool)

(assert (=> b!1258832 m!1159201))

(assert (=> b!1258837 m!1159113))

(assert (=> b!1258837 m!1159113))

(assert (=> b!1258837 m!1159119))

(assert (=> b!1258836 m!1159195))

(assert (=> b!1258826 m!1159127))

(assert (=> b!1258826 m!1159125))

(assert (=> b!1258826 m!1159113))

(assert (=> b!1258826 m!1159127))

(assert (=> b!1258826 m!1159125))

(assert (=> b!1258826 m!1159129))

(assert (=> b!1258826 m!1159113))

(declare-fun m!1159203 () Bool)

(assert (=> b!1258826 m!1159203))

(declare-fun m!1159205 () Bool)

(assert (=> b!1258831 m!1159205))

(assert (=> b!1258828 m!1159127))

(assert (=> b!1258828 m!1159125))

(assert (=> b!1258828 m!1159113))

(declare-fun m!1159207 () Bool)

(assert (=> b!1258828 m!1159207))

(declare-fun m!1159209 () Bool)

(assert (=> b!1258828 m!1159209))

(declare-fun m!1159211 () Bool)

(assert (=> b!1258828 m!1159211))

(assert (=> b!1258828 m!1159127))

(assert (=> b!1258828 m!1159125))

(assert (=> b!1258828 m!1159129))

(assert (=> b!1258828 m!1159209))

(declare-fun m!1159213 () Bool)

(assert (=> b!1258828 m!1159213))

(assert (=> b!1258683 d!138311))

(declare-fun d!138313 () Bool)

(assert (=> d!138313 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105666 d!138313))

(declare-fun d!138315 () Bool)

(assert (=> d!138315 (= (array_inv!30105 _keys!1118) (bvsge (size!40071 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105666 d!138315))

(declare-fun d!138317 () Bool)

(assert (=> d!138317 (= (array_inv!30106 _values!914) (bvsge (size!40072 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105666 d!138317))

(declare-fun b!1258848 () Bool)

(declare-fun e!716023 () Bool)

(declare-fun contains!7570 (List!28074 (_ BitVec 64)) Bool)

(assert (=> b!1258848 (= e!716023 (contains!7570 Nil!28071 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61877 () Bool)

(declare-fun call!61880 () Bool)

(declare-fun c!122556 () Bool)

(assert (=> bm!61877 (= call!61880 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122556 (Cons!28070 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000) Nil!28071) Nil!28071)))))

(declare-fun b!1258849 () Bool)

(declare-fun e!716024 () Bool)

(assert (=> b!1258849 (= e!716024 call!61880)))

(declare-fun d!138319 () Bool)

(declare-fun res!838994 () Bool)

(declare-fun e!716025 () Bool)

(assert (=> d!138319 (=> res!838994 e!716025)))

(assert (=> d!138319 (= res!838994 (bvsge #b00000000000000000000000000000000 (size!40071 _keys!1118)))))

(assert (=> d!138319 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28071) e!716025)))

(declare-fun b!1258850 () Bool)

(assert (=> b!1258850 (= e!716024 call!61880)))

(declare-fun b!1258851 () Bool)

(declare-fun e!716022 () Bool)

(assert (=> b!1258851 (= e!716022 e!716024)))

(assert (=> b!1258851 (= c!122556 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258852 () Bool)

(assert (=> b!1258852 (= e!716025 e!716022)))

(declare-fun res!838995 () Bool)

(assert (=> b!1258852 (=> (not res!838995) (not e!716022))))

(assert (=> b!1258852 (= res!838995 (not e!716023))))

(declare-fun res!838993 () Bool)

(assert (=> b!1258852 (=> (not res!838993) (not e!716023))))

(assert (=> b!1258852 (= res!838993 (validKeyInArray!0 (select (arr!39535 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138319 (not res!838994)) b!1258852))

(assert (= (and b!1258852 res!838993) b!1258848))

(assert (= (and b!1258852 res!838995) b!1258851))

(assert (= (and b!1258851 c!122556) b!1258849))

(assert (= (and b!1258851 (not c!122556)) b!1258850))

(assert (= (or b!1258849 b!1258850) bm!61877))

(assert (=> b!1258848 m!1159113))

(assert (=> b!1258848 m!1159113))

(declare-fun m!1159215 () Bool)

(assert (=> b!1258848 m!1159215))

(assert (=> bm!61877 m!1159113))

(declare-fun m!1159217 () Bool)

(assert (=> bm!61877 m!1159217))

(assert (=> b!1258851 m!1159113))

(assert (=> b!1258851 m!1159113))

(assert (=> b!1258851 m!1159119))

(assert (=> b!1258852 m!1159113))

(assert (=> b!1258852 m!1159113))

(assert (=> b!1258852 m!1159119))

(assert (=> b!1258684 d!138319))

(declare-fun b!1258860 () Bool)

(declare-fun e!716030 () Bool)

(assert (=> b!1258860 (= e!716030 tp_is_empty!32169)))

(declare-fun b!1258859 () Bool)

(declare-fun e!716031 () Bool)

(assert (=> b!1258859 (= e!716031 tp_is_empty!32169)))

(declare-fun mapNonEmpty!50053 () Bool)

(declare-fun mapRes!50053 () Bool)

(declare-fun tp!95333 () Bool)

(assert (=> mapNonEmpty!50053 (= mapRes!50053 (and tp!95333 e!716031))))

(declare-fun mapValue!50053 () ValueCell!15321)

(declare-fun mapRest!50053 () (Array (_ BitVec 32) ValueCell!15321))

(declare-fun mapKey!50053 () (_ BitVec 32))

(assert (=> mapNonEmpty!50053 (= mapRest!50047 (store mapRest!50053 mapKey!50053 mapValue!50053))))

(declare-fun condMapEmpty!50053 () Bool)

(declare-fun mapDefault!50053 () ValueCell!15321)

(assert (=> mapNonEmpty!50047 (= condMapEmpty!50053 (= mapRest!50047 ((as const (Array (_ BitVec 32) ValueCell!15321)) mapDefault!50053)))))

(assert (=> mapNonEmpty!50047 (= tp!95323 (and e!716030 mapRes!50053))))

(declare-fun mapIsEmpty!50053 () Bool)

(assert (=> mapIsEmpty!50053 mapRes!50053))

(assert (= (and mapNonEmpty!50047 condMapEmpty!50053) mapIsEmpty!50053))

(assert (= (and mapNonEmpty!50047 (not condMapEmpty!50053)) mapNonEmpty!50053))

(assert (= (and mapNonEmpty!50053 ((_ is ValueCellFull!15321) mapValue!50053)) b!1258859))

(assert (= (and mapNonEmpty!50047 ((_ is ValueCellFull!15321) mapDefault!50053)) b!1258860))

(declare-fun m!1159219 () Bool)

(assert (=> mapNonEmpty!50053 m!1159219))

(declare-fun b_lambda!22733 () Bool)

(assert (= b_lambda!22727 (or (and start!105666 b_free!27267) b_lambda!22733)))

(declare-fun b_lambda!22735 () Bool)

(assert (= b_lambda!22729 (or (and start!105666 b_free!27267) b_lambda!22735)))

(declare-fun b_lambda!22737 () Bool)

(assert (= b_lambda!22723 (or (and start!105666 b_free!27267) b_lambda!22737)))

(declare-fun b_lambda!22739 () Bool)

(assert (= b_lambda!22731 (or (and start!105666 b_free!27267) b_lambda!22739)))

(declare-fun b_lambda!22741 () Bool)

(assert (= b_lambda!22725 (or (and start!105666 b_free!27267) b_lambda!22741)))

(check-sat (not b!1258755) (not d!138309) (not bm!61877) (not b!1258770) (not b!1258827) (not bm!61870) (not b_lambda!22735) (not b!1258824) (not b!1258769) (not b!1258814) (not b!1258848) (not b!1258788) (not b!1258819) (not b!1258764) (not b_lambda!22739) (not b!1258789) (not b!1258759) (not b!1258825) (not bm!61874) (not bm!61873) b_and!45153 (not bm!61866) (not b_lambda!22741) (not b!1258766) (not d!138303) (not b!1258826) (not b!1258851) (not b_lambda!22733) (not b!1258816) (not d!138311) (not b!1258828) (not b_lambda!22737) tp_is_empty!32169 (not b!1258815) (not b!1258832) (not d!138307) (not b!1258833) (not b!1258852) (not mapNonEmpty!50053) (not b!1258756) (not b!1258837) (not b!1258820) (not bm!61863) (not b_next!27267) (not bm!61865) (not bm!61861) (not b!1258767) (not b!1258821) (not b!1258836) (not b!1258831))
(check-sat b_and!45153 (not b_next!27267))
