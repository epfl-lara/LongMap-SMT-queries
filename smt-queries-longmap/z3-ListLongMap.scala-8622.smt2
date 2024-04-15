; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104994 () Bool)

(assert start!104994)

(declare-fun b_free!26767 () Bool)

(declare-fun b_next!26767 () Bool)

(assert (=> start!104994 (= b_free!26767 (not b_next!26767))))

(declare-fun tp!93796 () Bool)

(declare-fun b_and!44535 () Bool)

(assert (=> start!104994 (= tp!93796 b_and!44535)))

(declare-fun b!1251422 () Bool)

(declare-fun e!710643 () Bool)

(declare-fun e!710638 () Bool)

(declare-fun mapRes!49270 () Bool)

(assert (=> b!1251422 (= e!710643 (and e!710638 mapRes!49270))))

(declare-fun condMapEmpty!49270 () Bool)

(declare-datatypes ((V!47591 0))(
  ( (V!47592 (val!15897 Int)) )
))
(declare-datatypes ((ValueCell!15071 0))(
  ( (ValueCellFull!15071 (v!18593 V!47591)) (EmptyCell!15071) )
))
(declare-datatypes ((array!80923 0))(
  ( (array!80924 (arr!39027 (Array (_ BitVec 32) ValueCell!15071)) (size!39565 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80923)

(declare-fun mapDefault!49270 () ValueCell!15071)

(assert (=> b!1251422 (= condMapEmpty!49270 (= (arr!39027 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15071)) mapDefault!49270)))))

(declare-fun b!1251423 () Bool)

(declare-fun res!834695 () Bool)

(declare-fun e!710637 () Bool)

(assert (=> b!1251423 (=> (not res!834695) (not e!710637))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80925 0))(
  ( (array!80926 (arr!39028 (Array (_ BitVec 32) (_ BitVec 64))) (size!39566 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80925)

(assert (=> b!1251423 (= res!834695 (and (= (size!39565 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39566 _keys!1118) (size!39565 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251424 () Bool)

(declare-fun e!710641 () Bool)

(assert (=> b!1251424 (= e!710641 (bvsle #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-datatypes ((tuple2!20584 0))(
  ( (tuple2!20585 (_1!10303 (_ BitVec 64)) (_2!10303 V!47591)) )
))
(declare-datatypes ((List!27799 0))(
  ( (Nil!27796) (Cons!27795 (h!29004 tuple2!20584) (t!41265 List!27799)) )
))
(declare-datatypes ((ListLongMap!18457 0))(
  ( (ListLongMap!18458 (toList!9244 List!27799)) )
))
(declare-fun lt!564680 () ListLongMap!18457)

(declare-fun -!1986 (ListLongMap!18457 (_ BitVec 64)) ListLongMap!18457)

(assert (=> b!1251424 (= (-!1986 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564680)))

(declare-datatypes ((Unit!41452 0))(
  ( (Unit!41453) )
))
(declare-fun lt!564682 () Unit!41452)

(declare-fun removeNotPresentStillSame!114 (ListLongMap!18457 (_ BitVec 64)) Unit!41452)

(assert (=> b!1251424 (= lt!564682 (removeNotPresentStillSame!114 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834699 () Bool)

(assert (=> start!104994 (=> (not res!834699) (not e!710637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104994 (= res!834699 (validMask!0 mask!1466))))

(assert (=> start!104994 e!710637))

(assert (=> start!104994 true))

(assert (=> start!104994 tp!93796))

(declare-fun tp_is_empty!31669 () Bool)

(assert (=> start!104994 tp_is_empty!31669))

(declare-fun array_inv!29895 (array!80925) Bool)

(assert (=> start!104994 (array_inv!29895 _keys!1118)))

(declare-fun array_inv!29896 (array!80923) Bool)

(assert (=> start!104994 (and (array_inv!29896 _values!914) e!710643)))

(declare-fun b!1251425 () Bool)

(assert (=> b!1251425 (= e!710638 tp_is_empty!31669)))

(declare-fun b!1251426 () Bool)

(declare-fun e!710642 () Bool)

(assert (=> b!1251426 (= e!710637 (not e!710642))))

(declare-fun res!834698 () Bool)

(assert (=> b!1251426 (=> res!834698 e!710642)))

(assert (=> b!1251426 (= res!834698 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564678 () ListLongMap!18457)

(declare-fun lt!564681 () ListLongMap!18457)

(assert (=> b!1251426 (= lt!564678 lt!564681)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47591)

(declare-fun zeroValue!871 () V!47591)

(declare-fun minValueBefore!43 () V!47591)

(declare-fun lt!564679 () Unit!41452)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!970 (array!80925 array!80923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 V!47591 V!47591 (_ BitVec 32) Int) Unit!41452)

(assert (=> b!1251426 (= lt!564679 (lemmaNoChangeToArrayThenSameMapNoExtras!970 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5648 (array!80925 array!80923 (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 (_ BitVec 32) Int) ListLongMap!18457)

(assert (=> b!1251426 (= lt!564681 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251426 (= lt!564678 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251427 () Bool)

(declare-fun e!710640 () Bool)

(assert (=> b!1251427 (= e!710640 tp_is_empty!31669)))

(declare-fun mapIsEmpty!49270 () Bool)

(assert (=> mapIsEmpty!49270 mapRes!49270))

(declare-fun b!1251428 () Bool)

(assert (=> b!1251428 (= e!710642 e!710641)))

(declare-fun res!834697 () Bool)

(assert (=> b!1251428 (=> res!834697 e!710641)))

(declare-fun contains!7483 (ListLongMap!18457 (_ BitVec 64)) Bool)

(assert (=> b!1251428 (= res!834697 (contains!7483 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4409 (array!80925 array!80923 (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 (_ BitVec 32) Int) ListLongMap!18457)

(assert (=> b!1251428 (= lt!564680 (getCurrentListMap!4409 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49270 () Bool)

(declare-fun tp!93797 () Bool)

(assert (=> mapNonEmpty!49270 (= mapRes!49270 (and tp!93797 e!710640))))

(declare-fun mapValue!49270 () ValueCell!15071)

(declare-fun mapKey!49270 () (_ BitVec 32))

(declare-fun mapRest!49270 () (Array (_ BitVec 32) ValueCell!15071))

(assert (=> mapNonEmpty!49270 (= (arr!39027 _values!914) (store mapRest!49270 mapKey!49270 mapValue!49270))))

(declare-fun b!1251429 () Bool)

(declare-fun res!834700 () Bool)

(assert (=> b!1251429 (=> (not res!834700) (not e!710637))))

(declare-datatypes ((List!27800 0))(
  ( (Nil!27797) (Cons!27796 (h!29005 (_ BitVec 64)) (t!41266 List!27800)) )
))
(declare-fun arrayNoDuplicates!0 (array!80925 (_ BitVec 32) List!27800) Bool)

(assert (=> b!1251429 (= res!834700 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27797))))

(declare-fun b!1251430 () Bool)

(declare-fun res!834696 () Bool)

(assert (=> b!1251430 (=> (not res!834696) (not e!710637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80925 (_ BitVec 32)) Bool)

(assert (=> b!1251430 (= res!834696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104994 res!834699) b!1251423))

(assert (= (and b!1251423 res!834695) b!1251430))

(assert (= (and b!1251430 res!834696) b!1251429))

(assert (= (and b!1251429 res!834700) b!1251426))

(assert (= (and b!1251426 (not res!834698)) b!1251428))

(assert (= (and b!1251428 (not res!834697)) b!1251424))

(assert (= (and b!1251422 condMapEmpty!49270) mapIsEmpty!49270))

(assert (= (and b!1251422 (not condMapEmpty!49270)) mapNonEmpty!49270))

(get-info :version)

(assert (= (and mapNonEmpty!49270 ((_ is ValueCellFull!15071) mapValue!49270)) b!1251427))

(assert (= (and b!1251422 ((_ is ValueCellFull!15071) mapDefault!49270)) b!1251425))

(assert (= start!104994 b!1251422))

(declare-fun m!1151749 () Bool)

(assert (=> b!1251426 m!1151749))

(declare-fun m!1151751 () Bool)

(assert (=> b!1251426 m!1151751))

(declare-fun m!1151753 () Bool)

(assert (=> b!1251426 m!1151753))

(declare-fun m!1151755 () Bool)

(assert (=> b!1251430 m!1151755))

(declare-fun m!1151757 () Bool)

(assert (=> b!1251428 m!1151757))

(declare-fun m!1151759 () Bool)

(assert (=> b!1251428 m!1151759))

(declare-fun m!1151761 () Bool)

(assert (=> b!1251429 m!1151761))

(declare-fun m!1151763 () Bool)

(assert (=> b!1251424 m!1151763))

(declare-fun m!1151765 () Bool)

(assert (=> b!1251424 m!1151765))

(declare-fun m!1151767 () Bool)

(assert (=> mapNonEmpty!49270 m!1151767))

(declare-fun m!1151769 () Bool)

(assert (=> start!104994 m!1151769))

(declare-fun m!1151771 () Bool)

(assert (=> start!104994 m!1151771))

(declare-fun m!1151773 () Bool)

(assert (=> start!104994 m!1151773))

(check-sat b_and!44535 (not b!1251426) (not b!1251424) (not mapNonEmpty!49270) (not b_next!26767) (not b!1251429) tp_is_empty!31669 (not b!1251430) (not start!104994) (not b!1251428))
(check-sat b_and!44535 (not b_next!26767))
(get-model)

(declare-fun d!137811 () Bool)

(declare-fun lt!564715 () ListLongMap!18457)

(assert (=> d!137811 (not (contains!7483 lt!564715 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!137 (List!27799 (_ BitVec 64)) List!27799)

(assert (=> d!137811 (= lt!564715 (ListLongMap!18458 (removeStrictlySorted!137 (toList!9244 lt!564680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137811 (= (-!1986 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564715)))

(declare-fun bs!35309 () Bool)

(assert (= bs!35309 d!137811))

(declare-fun m!1151827 () Bool)

(assert (=> bs!35309 m!1151827))

(declare-fun m!1151829 () Bool)

(assert (=> bs!35309 m!1151829))

(assert (=> b!1251424 d!137811))

(declare-fun d!137813 () Bool)

(assert (=> d!137813 (= (-!1986 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564680)))

(declare-fun lt!564718 () Unit!41452)

(declare-fun choose!1858 (ListLongMap!18457 (_ BitVec 64)) Unit!41452)

(assert (=> d!137813 (= lt!564718 (choose!1858 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137813 (not (contains!7483 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137813 (= (removeNotPresentStillSame!114 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564718)))

(declare-fun bs!35310 () Bool)

(assert (= bs!35310 d!137813))

(assert (=> bs!35310 m!1151763))

(declare-fun m!1151831 () Bool)

(assert (=> bs!35310 m!1151831))

(assert (=> bs!35310 m!1151757))

(assert (=> b!1251424 d!137813))

(declare-fun d!137815 () Bool)

(assert (=> d!137815 (= (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564721 () Unit!41452)

(declare-fun choose!1859 (array!80925 array!80923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 V!47591 V!47591 (_ BitVec 32) Int) Unit!41452)

(assert (=> d!137815 (= lt!564721 (choose!1859 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137815 (validMask!0 mask!1466)))

(assert (=> d!137815 (= (lemmaNoChangeToArrayThenSameMapNoExtras!970 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564721)))

(declare-fun bs!35311 () Bool)

(assert (= bs!35311 d!137815))

(assert (=> bs!35311 m!1151753))

(assert (=> bs!35311 m!1151751))

(declare-fun m!1151833 () Bool)

(assert (=> bs!35311 m!1151833))

(assert (=> bs!35311 m!1151769))

(assert (=> b!1251426 d!137815))

(declare-fun b!1251509 () Bool)

(declare-fun e!710705 () ListLongMap!18457)

(declare-fun call!61603 () ListLongMap!18457)

(assert (=> b!1251509 (= e!710705 call!61603)))

(declare-fun b!1251510 () Bool)

(declare-fun lt!564737 () ListLongMap!18457)

(declare-fun e!710702 () Bool)

(assert (=> b!1251510 (= e!710702 (= lt!564737 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251512 () Bool)

(declare-fun lt!564742 () Unit!41452)

(declare-fun lt!564740 () Unit!41452)

(assert (=> b!1251512 (= lt!564742 lt!564740)))

(declare-fun lt!564741 () (_ BitVec 64))

(declare-fun lt!564739 () ListLongMap!18457)

(declare-fun lt!564738 () V!47591)

(declare-fun lt!564736 () (_ BitVec 64))

(declare-fun +!4186 (ListLongMap!18457 tuple2!20584) ListLongMap!18457)

(assert (=> b!1251512 (not (contains!7483 (+!4186 lt!564739 (tuple2!20585 lt!564741 lt!564738)) lt!564736))))

(declare-fun addStillNotContains!311 (ListLongMap!18457 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41452)

(assert (=> b!1251512 (= lt!564740 (addStillNotContains!311 lt!564739 lt!564741 lt!564738 lt!564736))))

(assert (=> b!1251512 (= lt!564736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20024 (ValueCell!15071 V!47591) V!47591)

(declare-fun dynLambda!3405 (Int (_ BitVec 64)) V!47591)

(assert (=> b!1251512 (= lt!564738 (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251512 (= lt!564741 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1251512 (= lt!564739 call!61603)))

(assert (=> b!1251512 (= e!710705 (+!4186 call!61603 (tuple2!20585 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000) (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1251513 () Bool)

(declare-fun res!834746 () Bool)

(declare-fun e!710701 () Bool)

(assert (=> b!1251513 (=> (not res!834746) (not e!710701))))

(assert (=> b!1251513 (= res!834746 (not (contains!7483 lt!564737 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251514 () Bool)

(declare-fun isEmpty!1030 (ListLongMap!18457) Bool)

(assert (=> b!1251514 (= e!710702 (isEmpty!1030 lt!564737))))

(declare-fun b!1251515 () Bool)

(assert (=> b!1251515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> b!1251515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39565 _values!914)))))

(declare-fun e!710706 () Bool)

(declare-fun apply!975 (ListLongMap!18457 (_ BitVec 64)) V!47591)

(assert (=> b!1251515 (= e!710706 (= (apply!975 lt!564737 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)) (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251516 () Bool)

(declare-fun e!710704 () Bool)

(assert (=> b!1251516 (= e!710704 e!710702)))

(declare-fun c!122181 () Bool)

(assert (=> b!1251516 (= c!122181 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun b!1251517 () Bool)

(declare-fun e!710703 () ListLongMap!18457)

(assert (=> b!1251517 (= e!710703 (ListLongMap!18458 Nil!27796))))

(declare-fun b!1251511 () Bool)

(assert (=> b!1251511 (= e!710701 e!710704)))

(declare-fun c!122183 () Bool)

(declare-fun e!710700 () Bool)

(assert (=> b!1251511 (= c!122183 e!710700)))

(declare-fun res!834745 () Bool)

(assert (=> b!1251511 (=> (not res!834745) (not e!710700))))

(assert (=> b!1251511 (= res!834745 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun d!137817 () Bool)

(assert (=> d!137817 e!710701))

(declare-fun res!834747 () Bool)

(assert (=> d!137817 (=> (not res!834747) (not e!710701))))

(assert (=> d!137817 (= res!834747 (not (contains!7483 lt!564737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137817 (= lt!564737 e!710703)))

(declare-fun c!122182 () Bool)

(assert (=> d!137817 (= c!122182 (bvsge #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> d!137817 (validMask!0 mask!1466)))

(assert (=> d!137817 (= (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564737)))

(declare-fun b!1251518 () Bool)

(assert (=> b!1251518 (= e!710704 e!710706)))

(assert (=> b!1251518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun res!834748 () Bool)

(assert (=> b!1251518 (= res!834748 (contains!7483 lt!564737 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251518 (=> (not res!834748) (not e!710706))))

(declare-fun bm!61600 () Bool)

(assert (=> bm!61600 (= call!61603 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1251519 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1251519 (= e!710700 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251519 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1251520 () Bool)

(assert (=> b!1251520 (= e!710703 e!710705)))

(declare-fun c!122180 () Bool)

(assert (=> b!1251520 (= c!122180 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137817 c!122182) b!1251517))

(assert (= (and d!137817 (not c!122182)) b!1251520))

(assert (= (and b!1251520 c!122180) b!1251512))

(assert (= (and b!1251520 (not c!122180)) b!1251509))

(assert (= (or b!1251512 b!1251509) bm!61600))

(assert (= (and d!137817 res!834747) b!1251513))

(assert (= (and b!1251513 res!834746) b!1251511))

(assert (= (and b!1251511 res!834745) b!1251519))

(assert (= (and b!1251511 c!122183) b!1251518))

(assert (= (and b!1251511 (not c!122183)) b!1251516))

(assert (= (and b!1251518 res!834748) b!1251515))

(assert (= (and b!1251516 c!122181) b!1251510))

(assert (= (and b!1251516 (not c!122181)) b!1251514))

(declare-fun b_lambda!22537 () Bool)

(assert (=> (not b_lambda!22537) (not b!1251512)))

(declare-fun t!41272 () Bool)

(declare-fun tb!11283 () Bool)

(assert (=> (and start!104994 (= defaultEntry!922 defaultEntry!922) t!41272) tb!11283))

(declare-fun result!23273 () Bool)

(assert (=> tb!11283 (= result!23273 tp_is_empty!31669)))

(assert (=> b!1251512 t!41272))

(declare-fun b_and!44541 () Bool)

(assert (= b_and!44535 (and (=> t!41272 result!23273) b_and!44541)))

(declare-fun b_lambda!22539 () Bool)

(assert (=> (not b_lambda!22539) (not b!1251515)))

(assert (=> b!1251515 t!41272))

(declare-fun b_and!44543 () Bool)

(assert (= b_and!44541 (and (=> t!41272 result!23273) b_and!44543)))

(declare-fun m!1151835 () Bool)

(assert (=> b!1251514 m!1151835))

(declare-fun m!1151837 () Bool)

(assert (=> bm!61600 m!1151837))

(declare-fun m!1151839 () Bool)

(assert (=> b!1251520 m!1151839))

(assert (=> b!1251520 m!1151839))

(declare-fun m!1151841 () Bool)

(assert (=> b!1251520 m!1151841))

(declare-fun m!1151843 () Bool)

(assert (=> b!1251513 m!1151843))

(assert (=> b!1251515 m!1151839))

(declare-fun m!1151845 () Bool)

(assert (=> b!1251515 m!1151845))

(declare-fun m!1151847 () Bool)

(assert (=> b!1251515 m!1151847))

(declare-fun m!1151849 () Bool)

(assert (=> b!1251515 m!1151849))

(declare-fun m!1151851 () Bool)

(assert (=> b!1251515 m!1151851))

(assert (=> b!1251515 m!1151839))

(assert (=> b!1251515 m!1151849))

(assert (=> b!1251515 m!1151847))

(declare-fun m!1151853 () Bool)

(assert (=> b!1251512 m!1151853))

(declare-fun m!1151855 () Bool)

(assert (=> b!1251512 m!1151855))

(assert (=> b!1251512 m!1151847))

(assert (=> b!1251512 m!1151849))

(assert (=> b!1251512 m!1151851))

(assert (=> b!1251512 m!1151839))

(declare-fun m!1151857 () Bool)

(assert (=> b!1251512 m!1151857))

(declare-fun m!1151859 () Bool)

(assert (=> b!1251512 m!1151859))

(assert (=> b!1251512 m!1151857))

(assert (=> b!1251512 m!1151849))

(assert (=> b!1251512 m!1151847))

(declare-fun m!1151861 () Bool)

(assert (=> d!137817 m!1151861))

(assert (=> d!137817 m!1151769))

(assert (=> b!1251518 m!1151839))

(assert (=> b!1251518 m!1151839))

(declare-fun m!1151863 () Bool)

(assert (=> b!1251518 m!1151863))

(assert (=> b!1251519 m!1151839))

(assert (=> b!1251519 m!1151839))

(assert (=> b!1251519 m!1151841))

(assert (=> b!1251510 m!1151837))

(assert (=> b!1251426 d!137817))

(declare-fun b!1251523 () Bool)

(declare-fun e!710712 () ListLongMap!18457)

(declare-fun call!61604 () ListLongMap!18457)

(assert (=> b!1251523 (= e!710712 call!61604)))

(declare-fun e!710709 () Bool)

(declare-fun lt!564744 () ListLongMap!18457)

(declare-fun b!1251524 () Bool)

(assert (=> b!1251524 (= e!710709 (= lt!564744 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251526 () Bool)

(declare-fun lt!564749 () Unit!41452)

(declare-fun lt!564747 () Unit!41452)

(assert (=> b!1251526 (= lt!564749 lt!564747)))

(declare-fun lt!564745 () V!47591)

(declare-fun lt!564746 () ListLongMap!18457)

(declare-fun lt!564748 () (_ BitVec 64))

(declare-fun lt!564743 () (_ BitVec 64))

(assert (=> b!1251526 (not (contains!7483 (+!4186 lt!564746 (tuple2!20585 lt!564748 lt!564745)) lt!564743))))

(assert (=> b!1251526 (= lt!564747 (addStillNotContains!311 lt!564746 lt!564748 lt!564745 lt!564743))))

(assert (=> b!1251526 (= lt!564743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1251526 (= lt!564745 (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251526 (= lt!564748 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1251526 (= lt!564746 call!61604)))

(assert (=> b!1251526 (= e!710712 (+!4186 call!61604 (tuple2!20585 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000) (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1251527 () Bool)

(declare-fun res!834750 () Bool)

(declare-fun e!710708 () Bool)

(assert (=> b!1251527 (=> (not res!834750) (not e!710708))))

(assert (=> b!1251527 (= res!834750 (not (contains!7483 lt!564744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251528 () Bool)

(assert (=> b!1251528 (= e!710709 (isEmpty!1030 lt!564744))))

(declare-fun b!1251529 () Bool)

(assert (=> b!1251529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> b!1251529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39565 _values!914)))))

(declare-fun e!710713 () Bool)

(assert (=> b!1251529 (= e!710713 (= (apply!975 lt!564744 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)) (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251530 () Bool)

(declare-fun e!710711 () Bool)

(assert (=> b!1251530 (= e!710711 e!710709)))

(declare-fun c!122185 () Bool)

(assert (=> b!1251530 (= c!122185 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun b!1251531 () Bool)

(declare-fun e!710710 () ListLongMap!18457)

(assert (=> b!1251531 (= e!710710 (ListLongMap!18458 Nil!27796))))

(declare-fun b!1251525 () Bool)

(assert (=> b!1251525 (= e!710708 e!710711)))

(declare-fun c!122187 () Bool)

(declare-fun e!710707 () Bool)

(assert (=> b!1251525 (= c!122187 e!710707)))

(declare-fun res!834749 () Bool)

(assert (=> b!1251525 (=> (not res!834749) (not e!710707))))

(assert (=> b!1251525 (= res!834749 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun d!137819 () Bool)

(assert (=> d!137819 e!710708))

(declare-fun res!834751 () Bool)

(assert (=> d!137819 (=> (not res!834751) (not e!710708))))

(assert (=> d!137819 (= res!834751 (not (contains!7483 lt!564744 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137819 (= lt!564744 e!710710)))

(declare-fun c!122186 () Bool)

(assert (=> d!137819 (= c!122186 (bvsge #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> d!137819 (validMask!0 mask!1466)))

(assert (=> d!137819 (= (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564744)))

(declare-fun b!1251532 () Bool)

(assert (=> b!1251532 (= e!710711 e!710713)))

(assert (=> b!1251532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun res!834752 () Bool)

(assert (=> b!1251532 (= res!834752 (contains!7483 lt!564744 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251532 (=> (not res!834752) (not e!710713))))

(declare-fun bm!61601 () Bool)

(assert (=> bm!61601 (= call!61604 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1251533 () Bool)

(assert (=> b!1251533 (= e!710707 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251533 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1251534 () Bool)

(assert (=> b!1251534 (= e!710710 e!710712)))

(declare-fun c!122184 () Bool)

(assert (=> b!1251534 (= c!122184 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137819 c!122186) b!1251531))

(assert (= (and d!137819 (not c!122186)) b!1251534))

(assert (= (and b!1251534 c!122184) b!1251526))

(assert (= (and b!1251534 (not c!122184)) b!1251523))

(assert (= (or b!1251526 b!1251523) bm!61601))

(assert (= (and d!137819 res!834751) b!1251527))

(assert (= (and b!1251527 res!834750) b!1251525))

(assert (= (and b!1251525 res!834749) b!1251533))

(assert (= (and b!1251525 c!122187) b!1251532))

(assert (= (and b!1251525 (not c!122187)) b!1251530))

(assert (= (and b!1251532 res!834752) b!1251529))

(assert (= (and b!1251530 c!122185) b!1251524))

(assert (= (and b!1251530 (not c!122185)) b!1251528))

(declare-fun b_lambda!22541 () Bool)

(assert (=> (not b_lambda!22541) (not b!1251526)))

(assert (=> b!1251526 t!41272))

(declare-fun b_and!44545 () Bool)

(assert (= b_and!44543 (and (=> t!41272 result!23273) b_and!44545)))

(declare-fun b_lambda!22543 () Bool)

(assert (=> (not b_lambda!22543) (not b!1251529)))

(assert (=> b!1251529 t!41272))

(declare-fun b_and!44547 () Bool)

(assert (= b_and!44545 (and (=> t!41272 result!23273) b_and!44547)))

(declare-fun m!1151865 () Bool)

(assert (=> b!1251528 m!1151865))

(declare-fun m!1151867 () Bool)

(assert (=> bm!61601 m!1151867))

(assert (=> b!1251534 m!1151839))

(assert (=> b!1251534 m!1151839))

(assert (=> b!1251534 m!1151841))

(declare-fun m!1151869 () Bool)

(assert (=> b!1251527 m!1151869))

(assert (=> b!1251529 m!1151839))

(declare-fun m!1151871 () Bool)

(assert (=> b!1251529 m!1151871))

(assert (=> b!1251529 m!1151847))

(assert (=> b!1251529 m!1151849))

(assert (=> b!1251529 m!1151851))

(assert (=> b!1251529 m!1151839))

(assert (=> b!1251529 m!1151849))

(assert (=> b!1251529 m!1151847))

(declare-fun m!1151873 () Bool)

(assert (=> b!1251526 m!1151873))

(declare-fun m!1151875 () Bool)

(assert (=> b!1251526 m!1151875))

(assert (=> b!1251526 m!1151847))

(assert (=> b!1251526 m!1151849))

(assert (=> b!1251526 m!1151851))

(assert (=> b!1251526 m!1151839))

(declare-fun m!1151877 () Bool)

(assert (=> b!1251526 m!1151877))

(declare-fun m!1151879 () Bool)

(assert (=> b!1251526 m!1151879))

(assert (=> b!1251526 m!1151877))

(assert (=> b!1251526 m!1151849))

(assert (=> b!1251526 m!1151847))

(declare-fun m!1151881 () Bool)

(assert (=> d!137819 m!1151881))

(assert (=> d!137819 m!1151769))

(assert (=> b!1251532 m!1151839))

(assert (=> b!1251532 m!1151839))

(declare-fun m!1151883 () Bool)

(assert (=> b!1251532 m!1151883))

(assert (=> b!1251533 m!1151839))

(assert (=> b!1251533 m!1151839))

(assert (=> b!1251533 m!1151841))

(assert (=> b!1251524 m!1151867))

(assert (=> b!1251426 d!137819))

(declare-fun d!137821 () Bool)

(assert (=> d!137821 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104994 d!137821))

(declare-fun d!137823 () Bool)

(assert (=> d!137823 (= (array_inv!29895 _keys!1118) (bvsge (size!39566 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104994 d!137823))

(declare-fun d!137825 () Bool)

(assert (=> d!137825 (= (array_inv!29896 _values!914) (bvsge (size!39565 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104994 d!137825))

(declare-fun b!1251545 () Bool)

(declare-fun e!710725 () Bool)

(declare-fun e!710723 () Bool)

(assert (=> b!1251545 (= e!710725 e!710723)))

(declare-fun c!122190 () Bool)

(assert (=> b!1251545 (= c!122190 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137827 () Bool)

(declare-fun res!834759 () Bool)

(declare-fun e!710724 () Bool)

(assert (=> d!137827 (=> res!834759 e!710724)))

(assert (=> d!137827 (= res!834759 (bvsge #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> d!137827 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27797) e!710724)))

(declare-fun b!1251546 () Bool)

(declare-fun call!61607 () Bool)

(assert (=> b!1251546 (= e!710723 call!61607)))

(declare-fun b!1251547 () Bool)

(assert (=> b!1251547 (= e!710724 e!710725)))

(declare-fun res!834760 () Bool)

(assert (=> b!1251547 (=> (not res!834760) (not e!710725))))

(declare-fun e!710722 () Bool)

(assert (=> b!1251547 (= res!834760 (not e!710722))))

(declare-fun res!834761 () Bool)

(assert (=> b!1251547 (=> (not res!834761) (not e!710722))))

(assert (=> b!1251547 (= res!834761 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251548 () Bool)

(declare-fun contains!7485 (List!27800 (_ BitVec 64)) Bool)

(assert (=> b!1251548 (= e!710722 (contains!7485 Nil!27797 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61604 () Bool)

(assert (=> bm!61604 (= call!61607 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122190 (Cons!27796 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000) Nil!27797) Nil!27797)))))

(declare-fun b!1251549 () Bool)

(assert (=> b!1251549 (= e!710723 call!61607)))

(assert (= (and d!137827 (not res!834759)) b!1251547))

(assert (= (and b!1251547 res!834761) b!1251548))

(assert (= (and b!1251547 res!834760) b!1251545))

(assert (= (and b!1251545 c!122190) b!1251549))

(assert (= (and b!1251545 (not c!122190)) b!1251546))

(assert (= (or b!1251549 b!1251546) bm!61604))

(assert (=> b!1251545 m!1151839))

(assert (=> b!1251545 m!1151839))

(assert (=> b!1251545 m!1151841))

(assert (=> b!1251547 m!1151839))

(assert (=> b!1251547 m!1151839))

(assert (=> b!1251547 m!1151841))

(assert (=> b!1251548 m!1151839))

(assert (=> b!1251548 m!1151839))

(declare-fun m!1151885 () Bool)

(assert (=> b!1251548 m!1151885))

(assert (=> bm!61604 m!1151839))

(declare-fun m!1151887 () Bool)

(assert (=> bm!61604 m!1151887))

(assert (=> b!1251429 d!137827))

(declare-fun d!137829 () Bool)

(declare-fun res!834766 () Bool)

(declare-fun e!710734 () Bool)

(assert (=> d!137829 (=> res!834766 e!710734)))

(assert (=> d!137829 (= res!834766 (bvsge #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> d!137829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!710734)))

(declare-fun b!1251558 () Bool)

(declare-fun e!710733 () Bool)

(declare-fun e!710732 () Bool)

(assert (=> b!1251558 (= e!710733 e!710732)))

(declare-fun lt!564756 () (_ BitVec 64))

(assert (=> b!1251558 (= lt!564756 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564757 () Unit!41452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80925 (_ BitVec 64) (_ BitVec 32)) Unit!41452)

(assert (=> b!1251558 (= lt!564757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!564756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1251558 (arrayContainsKey!0 _keys!1118 lt!564756 #b00000000000000000000000000000000)))

(declare-fun lt!564758 () Unit!41452)

(assert (=> b!1251558 (= lt!564758 lt!564757)))

(declare-fun res!834767 () Bool)

(declare-datatypes ((SeekEntryResult!9959 0))(
  ( (MissingZero!9959 (index!42207 (_ BitVec 32))) (Found!9959 (index!42208 (_ BitVec 32))) (Intermediate!9959 (undefined!10771 Bool) (index!42209 (_ BitVec 32)) (x!110109 (_ BitVec 32))) (Undefined!9959) (MissingVacant!9959 (index!42210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80925 (_ BitVec 32)) SeekEntryResult!9959)

(assert (=> b!1251558 (= res!834767 (= (seekEntryOrOpen!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9959 #b00000000000000000000000000000000)))))

(assert (=> b!1251558 (=> (not res!834767) (not e!710732))))

(declare-fun b!1251559 () Bool)

(assert (=> b!1251559 (= e!710734 e!710733)))

(declare-fun c!122193 () Bool)

(assert (=> b!1251559 (= c!122193 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61607 () Bool)

(declare-fun call!61610 () Bool)

(assert (=> bm!61607 (= call!61610 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1251560 () Bool)

(assert (=> b!1251560 (= e!710732 call!61610)))

(declare-fun b!1251561 () Bool)

(assert (=> b!1251561 (= e!710733 call!61610)))

(assert (= (and d!137829 (not res!834766)) b!1251559))

(assert (= (and b!1251559 c!122193) b!1251558))

(assert (= (and b!1251559 (not c!122193)) b!1251561))

(assert (= (and b!1251558 res!834767) b!1251560))

(assert (= (or b!1251560 b!1251561) bm!61607))

(assert (=> b!1251558 m!1151839))

(declare-fun m!1151889 () Bool)

(assert (=> b!1251558 m!1151889))

(declare-fun m!1151891 () Bool)

(assert (=> b!1251558 m!1151891))

(assert (=> b!1251558 m!1151839))

(declare-fun m!1151893 () Bool)

(assert (=> b!1251558 m!1151893))

(assert (=> b!1251559 m!1151839))

(assert (=> b!1251559 m!1151839))

(assert (=> b!1251559 m!1151841))

(declare-fun m!1151895 () Bool)

(assert (=> bm!61607 m!1151895))

(assert (=> b!1251430 d!137829))

(declare-fun d!137831 () Bool)

(declare-fun e!710740 () Bool)

(assert (=> d!137831 e!710740))

(declare-fun res!834770 () Bool)

(assert (=> d!137831 (=> res!834770 e!710740)))

(declare-fun lt!564769 () Bool)

(assert (=> d!137831 (= res!834770 (not lt!564769))))

(declare-fun lt!564770 () Bool)

(assert (=> d!137831 (= lt!564769 lt!564770)))

(declare-fun lt!564767 () Unit!41452)

(declare-fun e!710739 () Unit!41452)

(assert (=> d!137831 (= lt!564767 e!710739)))

(declare-fun c!122196 () Bool)

(assert (=> d!137831 (= c!122196 lt!564770)))

(declare-fun containsKey!617 (List!27799 (_ BitVec 64)) Bool)

(assert (=> d!137831 (= lt!564770 (containsKey!617 (toList!9244 lt!564680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137831 (= (contains!7483 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564769)))

(declare-fun b!1251568 () Bool)

(declare-fun lt!564768 () Unit!41452)

(assert (=> b!1251568 (= e!710739 lt!564768)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!427 (List!27799 (_ BitVec 64)) Unit!41452)

(assert (=> b!1251568 (= lt!564768 (lemmaContainsKeyImpliesGetValueByKeyDefined!427 (toList!9244 lt!564680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!706 0))(
  ( (Some!705 (v!18596 V!47591)) (None!704) )
))
(declare-fun isDefined!470 (Option!706) Bool)

(declare-fun getValueByKey!655 (List!27799 (_ BitVec 64)) Option!706)

(assert (=> b!1251568 (isDefined!470 (getValueByKey!655 (toList!9244 lt!564680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251569 () Bool)

(declare-fun Unit!41458 () Unit!41452)

(assert (=> b!1251569 (= e!710739 Unit!41458)))

(declare-fun b!1251570 () Bool)

(assert (=> b!1251570 (= e!710740 (isDefined!470 (getValueByKey!655 (toList!9244 lt!564680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137831 c!122196) b!1251568))

(assert (= (and d!137831 (not c!122196)) b!1251569))

(assert (= (and d!137831 (not res!834770)) b!1251570))

(declare-fun m!1151897 () Bool)

(assert (=> d!137831 m!1151897))

(declare-fun m!1151899 () Bool)

(assert (=> b!1251568 m!1151899))

(declare-fun m!1151901 () Bool)

(assert (=> b!1251568 m!1151901))

(assert (=> b!1251568 m!1151901))

(declare-fun m!1151903 () Bool)

(assert (=> b!1251568 m!1151903))

(assert (=> b!1251570 m!1151901))

(assert (=> b!1251570 m!1151901))

(assert (=> b!1251570 m!1151903))

(assert (=> b!1251428 d!137831))

(declare-fun b!1251613 () Bool)

(declare-fun e!710768 () Unit!41452)

(declare-fun lt!564822 () Unit!41452)

(assert (=> b!1251613 (= e!710768 lt!564822)))

(declare-fun lt!564832 () ListLongMap!18457)

(assert (=> b!1251613 (= lt!564832 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564818 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564825 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564825 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564836 () Unit!41452)

(declare-fun addStillContains!1076 (ListLongMap!18457 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41452)

(assert (=> b!1251613 (= lt!564836 (addStillContains!1076 lt!564832 lt!564818 zeroValue!871 lt!564825))))

(assert (=> b!1251613 (contains!7483 (+!4186 lt!564832 (tuple2!20585 lt!564818 zeroValue!871)) lt!564825)))

(declare-fun lt!564816 () Unit!41452)

(assert (=> b!1251613 (= lt!564816 lt!564836)))

(declare-fun lt!564833 () ListLongMap!18457)

(assert (=> b!1251613 (= lt!564833 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564824 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564815 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564815 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564823 () Unit!41452)

(declare-fun addApplyDifferent!519 (ListLongMap!18457 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41452)

(assert (=> b!1251613 (= lt!564823 (addApplyDifferent!519 lt!564833 lt!564824 minValueBefore!43 lt!564815))))

(assert (=> b!1251613 (= (apply!975 (+!4186 lt!564833 (tuple2!20585 lt!564824 minValueBefore!43)) lt!564815) (apply!975 lt!564833 lt!564815))))

(declare-fun lt!564831 () Unit!41452)

(assert (=> b!1251613 (= lt!564831 lt!564823)))

(declare-fun lt!564830 () ListLongMap!18457)

(assert (=> b!1251613 (= lt!564830 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564820 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564817 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564817 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564835 () Unit!41452)

(assert (=> b!1251613 (= lt!564835 (addApplyDifferent!519 lt!564830 lt!564820 zeroValue!871 lt!564817))))

(assert (=> b!1251613 (= (apply!975 (+!4186 lt!564830 (tuple2!20585 lt!564820 zeroValue!871)) lt!564817) (apply!975 lt!564830 lt!564817))))

(declare-fun lt!564819 () Unit!41452)

(assert (=> b!1251613 (= lt!564819 lt!564835)))

(declare-fun lt!564821 () ListLongMap!18457)

(assert (=> b!1251613 (= lt!564821 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564828 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564828 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564834 () (_ BitVec 64))

(assert (=> b!1251613 (= lt!564834 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1251613 (= lt!564822 (addApplyDifferent!519 lt!564821 lt!564828 minValueBefore!43 lt!564834))))

(assert (=> b!1251613 (= (apply!975 (+!4186 lt!564821 (tuple2!20585 lt!564828 minValueBefore!43)) lt!564834) (apply!975 lt!564821 lt!564834))))

(declare-fun call!61629 () ListLongMap!18457)

(declare-fun call!61625 () ListLongMap!18457)

(declare-fun c!122209 () Bool)

(declare-fun call!61631 () ListLongMap!18457)

(declare-fun call!61630 () ListLongMap!18457)

(declare-fun bm!61622 () Bool)

(declare-fun c!122214 () Bool)

(assert (=> bm!61622 (= call!61630 (+!4186 (ite c!122214 call!61629 (ite c!122209 call!61625 call!61631)) (ite (or c!122214 c!122209) (tuple2!20585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1251614 () Bool)

(declare-fun e!710778 () ListLongMap!18457)

(declare-fun e!710777 () ListLongMap!18457)

(assert (=> b!1251614 (= e!710778 e!710777)))

(assert (=> b!1251614 (= c!122209 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!137833 () Bool)

(declare-fun e!710770 () Bool)

(assert (=> d!137833 e!710770))

(declare-fun res!834796 () Bool)

(assert (=> d!137833 (=> (not res!834796) (not e!710770))))

(assert (=> d!137833 (= res!834796 (or (bvsge #b00000000000000000000000000000000 (size!39566 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))))

(declare-fun lt!564827 () ListLongMap!18457)

(declare-fun lt!564829 () ListLongMap!18457)

(assert (=> d!137833 (= lt!564827 lt!564829)))

(declare-fun lt!564826 () Unit!41452)

(assert (=> d!137833 (= lt!564826 e!710768)))

(declare-fun c!122210 () Bool)

(declare-fun e!710771 () Bool)

(assert (=> d!137833 (= c!122210 e!710771)))

(declare-fun res!834793 () Bool)

(assert (=> d!137833 (=> (not res!834793) (not e!710771))))

(assert (=> d!137833 (= res!834793 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(assert (=> d!137833 (= lt!564829 e!710778)))

(assert (=> d!137833 (= c!122214 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137833 (validMask!0 mask!1466)))

(assert (=> d!137833 (= (getCurrentListMap!4409 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564827)))

(declare-fun b!1251615 () Bool)

(declare-fun e!710775 () ListLongMap!18457)

(declare-fun call!61627 () ListLongMap!18457)

(assert (=> b!1251615 (= e!710775 call!61627)))

(declare-fun b!1251616 () Bool)

(declare-fun e!710769 () Bool)

(assert (=> b!1251616 (= e!710770 e!710769)))

(declare-fun c!122212 () Bool)

(assert (=> b!1251616 (= c!122212 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251617 () Bool)

(assert (=> b!1251617 (= e!710771 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251618 () Bool)

(declare-fun e!710774 () Bool)

(assert (=> b!1251618 (= e!710774 (= (apply!975 lt!564827 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1251619 () Bool)

(assert (=> b!1251619 (= e!710775 call!61631)))

(declare-fun b!1251620 () Bool)

(declare-fun c!122213 () Bool)

(assert (=> b!1251620 (= c!122213 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1251620 (= e!710777 e!710775)))

(declare-fun b!1251621 () Bool)

(declare-fun e!710772 () Bool)

(assert (=> b!1251621 (= e!710772 (= (apply!975 lt!564827 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61623 () Bool)

(assert (=> bm!61623 (= call!61631 call!61625)))

(declare-fun b!1251622 () Bool)

(assert (=> b!1251622 (= e!710778 (+!4186 call!61630 (tuple2!20585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61624 () Bool)

(declare-fun call!61628 () Bool)

(assert (=> bm!61624 (= call!61628 (contains!7483 lt!564827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61625 () Bool)

(assert (=> bm!61625 (= call!61625 call!61629)))

(declare-fun b!1251623 () Bool)

(declare-fun call!61626 () Bool)

(assert (=> b!1251623 (= e!710769 (not call!61626))))

(declare-fun b!1251624 () Bool)

(assert (=> b!1251624 (= e!710777 call!61627)))

(declare-fun b!1251625 () Bool)

(declare-fun e!710773 () Bool)

(declare-fun e!710767 () Bool)

(assert (=> b!1251625 (= e!710773 e!710767)))

(declare-fun res!834794 () Bool)

(assert (=> b!1251625 (=> (not res!834794) (not e!710767))))

(assert (=> b!1251625 (= res!834794 (contains!7483 lt!564827 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun b!1251626 () Bool)

(declare-fun res!834789 () Bool)

(assert (=> b!1251626 (=> (not res!834789) (not e!710770))))

(declare-fun e!710779 () Bool)

(assert (=> b!1251626 (= res!834789 e!710779)))

(declare-fun c!122211 () Bool)

(assert (=> b!1251626 (= c!122211 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61626 () Bool)

(assert (=> bm!61626 (= call!61629 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251627 () Bool)

(declare-fun res!834790 () Bool)

(assert (=> b!1251627 (=> (not res!834790) (not e!710770))))

(assert (=> b!1251627 (= res!834790 e!710773)))

(declare-fun res!834795 () Bool)

(assert (=> b!1251627 (=> res!834795 e!710773)))

(declare-fun e!710776 () Bool)

(assert (=> b!1251627 (= res!834795 (not e!710776))))

(declare-fun res!834791 () Bool)

(assert (=> b!1251627 (=> (not res!834791) (not e!710776))))

(assert (=> b!1251627 (= res!834791 (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun b!1251628 () Bool)

(declare-fun Unit!41459 () Unit!41452)

(assert (=> b!1251628 (= e!710768 Unit!41459)))

(declare-fun b!1251629 () Bool)

(assert (=> b!1251629 (= e!710767 (= (apply!975 lt!564827 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)) (get!20024 (select (arr!39027 _values!914) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1251629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39565 _values!914)))))

(assert (=> b!1251629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39566 _keys!1118)))))

(declare-fun b!1251630 () Bool)

(assert (=> b!1251630 (= e!710779 e!710774)))

(declare-fun res!834792 () Bool)

(assert (=> b!1251630 (= res!834792 call!61628)))

(assert (=> b!1251630 (=> (not res!834792) (not e!710774))))

(declare-fun b!1251631 () Bool)

(assert (=> b!1251631 (= e!710779 (not call!61628))))

(declare-fun b!1251632 () Bool)

(assert (=> b!1251632 (= e!710769 e!710772)))

(declare-fun res!834797 () Bool)

(assert (=> b!1251632 (= res!834797 call!61626)))

(assert (=> b!1251632 (=> (not res!834797) (not e!710772))))

(declare-fun bm!61627 () Bool)

(assert (=> bm!61627 (= call!61627 call!61630)))

(declare-fun bm!61628 () Bool)

(assert (=> bm!61628 (= call!61626 (contains!7483 lt!564827 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251633 () Bool)

(assert (=> b!1251633 (= e!710776 (validKeyInArray!0 (select (arr!39028 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137833 c!122214) b!1251622))

(assert (= (and d!137833 (not c!122214)) b!1251614))

(assert (= (and b!1251614 c!122209) b!1251624))

(assert (= (and b!1251614 (not c!122209)) b!1251620))

(assert (= (and b!1251620 c!122213) b!1251615))

(assert (= (and b!1251620 (not c!122213)) b!1251619))

(assert (= (or b!1251615 b!1251619) bm!61623))

(assert (= (or b!1251624 bm!61623) bm!61625))

(assert (= (or b!1251624 b!1251615) bm!61627))

(assert (= (or b!1251622 bm!61625) bm!61626))

(assert (= (or b!1251622 bm!61627) bm!61622))

(assert (= (and d!137833 res!834793) b!1251617))

(assert (= (and d!137833 c!122210) b!1251613))

(assert (= (and d!137833 (not c!122210)) b!1251628))

(assert (= (and d!137833 res!834796) b!1251627))

(assert (= (and b!1251627 res!834791) b!1251633))

(assert (= (and b!1251627 (not res!834795)) b!1251625))

(assert (= (and b!1251625 res!834794) b!1251629))

(assert (= (and b!1251627 res!834790) b!1251626))

(assert (= (and b!1251626 c!122211) b!1251630))

(assert (= (and b!1251626 (not c!122211)) b!1251631))

(assert (= (and b!1251630 res!834792) b!1251618))

(assert (= (or b!1251630 b!1251631) bm!61624))

(assert (= (and b!1251626 res!834789) b!1251616))

(assert (= (and b!1251616 c!122212) b!1251632))

(assert (= (and b!1251616 (not c!122212)) b!1251623))

(assert (= (and b!1251632 res!834797) b!1251621))

(assert (= (or b!1251632 b!1251623) bm!61628))

(declare-fun b_lambda!22545 () Bool)

(assert (=> (not b_lambda!22545) (not b!1251629)))

(assert (=> b!1251629 t!41272))

(declare-fun b_and!44549 () Bool)

(assert (= b_and!44547 (and (=> t!41272 result!23273) b_and!44549)))

(assert (=> b!1251629 m!1151839))

(assert (=> b!1251629 m!1151847))

(assert (=> b!1251629 m!1151847))

(assert (=> b!1251629 m!1151849))

(assert (=> b!1251629 m!1151851))

(assert (=> b!1251629 m!1151839))

(declare-fun m!1151905 () Bool)

(assert (=> b!1251629 m!1151905))

(assert (=> b!1251629 m!1151849))

(declare-fun m!1151907 () Bool)

(assert (=> b!1251618 m!1151907))

(assert (=> b!1251633 m!1151839))

(assert (=> b!1251633 m!1151839))

(assert (=> b!1251633 m!1151841))

(declare-fun m!1151909 () Bool)

(assert (=> b!1251621 m!1151909))

(assert (=> bm!61626 m!1151753))

(assert (=> b!1251617 m!1151839))

(assert (=> b!1251617 m!1151839))

(assert (=> b!1251617 m!1151841))

(declare-fun m!1151911 () Bool)

(assert (=> bm!61628 m!1151911))

(assert (=> b!1251625 m!1151839))

(assert (=> b!1251625 m!1151839))

(declare-fun m!1151913 () Bool)

(assert (=> b!1251625 m!1151913))

(declare-fun m!1151915 () Bool)

(assert (=> bm!61624 m!1151915))

(declare-fun m!1151917 () Bool)

(assert (=> bm!61622 m!1151917))

(declare-fun m!1151919 () Bool)

(assert (=> b!1251613 m!1151919))

(declare-fun m!1151921 () Bool)

(assert (=> b!1251613 m!1151921))

(declare-fun m!1151923 () Bool)

(assert (=> b!1251613 m!1151923))

(assert (=> b!1251613 m!1151753))

(declare-fun m!1151925 () Bool)

(assert (=> b!1251613 m!1151925))

(assert (=> b!1251613 m!1151839))

(declare-fun m!1151927 () Bool)

(assert (=> b!1251613 m!1151927))

(declare-fun m!1151929 () Bool)

(assert (=> b!1251613 m!1151929))

(assert (=> b!1251613 m!1151927))

(declare-fun m!1151931 () Bool)

(assert (=> b!1251613 m!1151931))

(declare-fun m!1151933 () Bool)

(assert (=> b!1251613 m!1151933))

(declare-fun m!1151935 () Bool)

(assert (=> b!1251613 m!1151935))

(declare-fun m!1151937 () Bool)

(assert (=> b!1251613 m!1151937))

(declare-fun m!1151939 () Bool)

(assert (=> b!1251613 m!1151939))

(assert (=> b!1251613 m!1151937))

(declare-fun m!1151941 () Bool)

(assert (=> b!1251613 m!1151941))

(assert (=> b!1251613 m!1151919))

(declare-fun m!1151943 () Bool)

(assert (=> b!1251613 m!1151943))

(declare-fun m!1151945 () Bool)

(assert (=> b!1251613 m!1151945))

(assert (=> b!1251613 m!1151931))

(declare-fun m!1151947 () Bool)

(assert (=> b!1251613 m!1151947))

(assert (=> d!137833 m!1151769))

(declare-fun m!1151949 () Bool)

(assert (=> b!1251622 m!1151949))

(assert (=> b!1251428 d!137833))

(declare-fun mapIsEmpty!49279 () Bool)

(declare-fun mapRes!49279 () Bool)

(assert (=> mapIsEmpty!49279 mapRes!49279))

(declare-fun mapNonEmpty!49279 () Bool)

(declare-fun tp!93812 () Bool)

(declare-fun e!710784 () Bool)

(assert (=> mapNonEmpty!49279 (= mapRes!49279 (and tp!93812 e!710784))))

(declare-fun mapRest!49279 () (Array (_ BitVec 32) ValueCell!15071))

(declare-fun mapValue!49279 () ValueCell!15071)

(declare-fun mapKey!49279 () (_ BitVec 32))

(assert (=> mapNonEmpty!49279 (= mapRest!49270 (store mapRest!49279 mapKey!49279 mapValue!49279))))

(declare-fun b!1251640 () Bool)

(assert (=> b!1251640 (= e!710784 tp_is_empty!31669)))

(declare-fun b!1251641 () Bool)

(declare-fun e!710785 () Bool)

(assert (=> b!1251641 (= e!710785 tp_is_empty!31669)))

(declare-fun condMapEmpty!49279 () Bool)

(declare-fun mapDefault!49279 () ValueCell!15071)

(assert (=> mapNonEmpty!49270 (= condMapEmpty!49279 (= mapRest!49270 ((as const (Array (_ BitVec 32) ValueCell!15071)) mapDefault!49279)))))

(assert (=> mapNonEmpty!49270 (= tp!93797 (and e!710785 mapRes!49279))))

(assert (= (and mapNonEmpty!49270 condMapEmpty!49279) mapIsEmpty!49279))

(assert (= (and mapNonEmpty!49270 (not condMapEmpty!49279)) mapNonEmpty!49279))

(assert (= (and mapNonEmpty!49279 ((_ is ValueCellFull!15071) mapValue!49279)) b!1251640))

(assert (= (and mapNonEmpty!49270 ((_ is ValueCellFull!15071) mapDefault!49279)) b!1251641))

(declare-fun m!1151951 () Bool)

(assert (=> mapNonEmpty!49279 m!1151951))

(declare-fun b_lambda!22547 () Bool)

(assert (= b_lambda!22541 (or (and start!104994 b_free!26767) b_lambda!22547)))

(declare-fun b_lambda!22549 () Bool)

(assert (= b_lambda!22545 (or (and start!104994 b_free!26767) b_lambda!22549)))

(declare-fun b_lambda!22551 () Bool)

(assert (= b_lambda!22539 (or (and start!104994 b_free!26767) b_lambda!22551)))

(declare-fun b_lambda!22553 () Bool)

(assert (= b_lambda!22543 (or (and start!104994 b_free!26767) b_lambda!22553)))

(declare-fun b_lambda!22555 () Bool)

(assert (= b_lambda!22537 (or (and start!104994 b_free!26767) b_lambda!22555)))

(check-sat (not bm!61624) (not bm!61626) (not b!1251633) (not b!1251518) (not b!1251520) b_and!44549 (not b!1251512) (not b!1251558) (not d!137813) (not b_lambda!22547) (not b!1251526) (not d!137817) (not b!1251513) (not b!1251568) (not b!1251534) (not b!1251545) (not bm!61628) (not b!1251618) (not b_next!26767) (not b_lambda!22549) (not b!1251613) (not b!1251559) (not b!1251510) (not d!137833) (not d!137819) (not d!137831) (not b!1251547) (not b_lambda!22555) (not b_lambda!22551) (not b!1251532) (not bm!61601) (not b!1251515) (not b!1251519) (not b!1251528) (not b!1251514) (not b!1251629) (not b!1251533) (not b!1251621) (not bm!61604) (not b!1251548) (not b!1251617) (not bm!61607) (not b!1251527) (not bm!61600) (not b!1251570) (not b!1251625) (not b!1251622) tp_is_empty!31669 (not mapNonEmpty!49279) (not bm!61622) (not b_lambda!22553) (not d!137815) (not d!137811) (not b!1251529) (not b!1251524))
(check-sat b_and!44549 (not b_next!26767))
