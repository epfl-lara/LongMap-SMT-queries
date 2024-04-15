; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104844 () Bool)

(assert start!104844)

(declare-fun b_free!26653 () Bool)

(declare-fun b_next!26653 () Bool)

(assert (=> start!104844 (= b_free!26653 (not b_next!26653))))

(declare-fun tp!93448 () Bool)

(declare-fun b_and!44403 () Bool)

(assert (=> start!104844 (= tp!93448 b_and!44403)))

(declare-fun b!1249664 () Bool)

(declare-fun e!709312 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80703 0))(
  ( (array!80704 (arr!38919 (Array (_ BitVec 32) (_ BitVec 64))) (size!39457 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80703)

(assert (=> b!1249664 (= e!709312 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39457 _keys!1118)))))))

(declare-datatypes ((V!47439 0))(
  ( (V!47440 (val!15840 Int)) )
))
(declare-datatypes ((tuple2!20484 0))(
  ( (tuple2!20485 (_1!10253 (_ BitVec 64)) (_2!10253 V!47439)) )
))
(declare-datatypes ((List!27713 0))(
  ( (Nil!27710) (Cons!27709 (h!28918 tuple2!20484) (t!41175 List!27713)) )
))
(declare-datatypes ((ListLongMap!18357 0))(
  ( (ListLongMap!18358 (toList!9194 List!27713)) )
))
(declare-fun lt!563684 () ListLongMap!18357)

(declare-fun lt!563683 () ListLongMap!18357)

(assert (=> b!1249664 (= lt!563684 lt!563683)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41356 0))(
  ( (Unit!41357) )
))
(declare-fun lt!563682 () Unit!41356)

(declare-fun minValueAfter!43 () V!47439)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47439)

(declare-datatypes ((ValueCell!15014 0))(
  ( (ValueCellFull!15014 (v!18535 V!47439)) (EmptyCell!15014) )
))
(declare-datatypes ((array!80705 0))(
  ( (array!80706 (arr!38920 (Array (_ BitVec 32) ValueCell!15014)) (size!39458 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80705)

(declare-fun minValueBefore!43 () V!47439)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!933 (array!80703 array!80705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 V!47439 V!47439 (_ BitVec 32) Int) Unit!41356)

(assert (=> b!1249664 (= lt!563682 (lemmaNoChangeToArrayThenSameMapNoExtras!933 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5611 (array!80703 array!80705 (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 (_ BitVec 32) Int) ListLongMap!18357)

(assert (=> b!1249664 (= lt!563683 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249664 (= lt!563684 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249665 () Bool)

(declare-fun res!833601 () Bool)

(assert (=> b!1249665 (=> (not res!833601) (not e!709312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80703 (_ BitVec 32)) Bool)

(assert (=> b!1249665 (= res!833601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49093 () Bool)

(declare-fun mapRes!49093 () Bool)

(declare-fun tp!93449 () Bool)

(declare-fun e!709308 () Bool)

(assert (=> mapNonEmpty!49093 (= mapRes!49093 (and tp!93449 e!709308))))

(declare-fun mapValue!49093 () ValueCell!15014)

(declare-fun mapKey!49093 () (_ BitVec 32))

(declare-fun mapRest!49093 () (Array (_ BitVec 32) ValueCell!15014))

(assert (=> mapNonEmpty!49093 (= (arr!38920 _values!914) (store mapRest!49093 mapKey!49093 mapValue!49093))))

(declare-fun b!1249666 () Bool)

(declare-fun e!709309 () Bool)

(declare-fun tp_is_empty!31555 () Bool)

(assert (=> b!1249666 (= e!709309 tp_is_empty!31555)))

(declare-fun b!1249667 () Bool)

(declare-fun e!709311 () Bool)

(assert (=> b!1249667 (= e!709311 (and e!709309 mapRes!49093))))

(declare-fun condMapEmpty!49093 () Bool)

(declare-fun mapDefault!49093 () ValueCell!15014)

(assert (=> b!1249667 (= condMapEmpty!49093 (= (arr!38920 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15014)) mapDefault!49093)))))

(declare-fun b!1249668 () Bool)

(declare-fun res!833603 () Bool)

(assert (=> b!1249668 (=> (not res!833603) (not e!709312))))

(declare-datatypes ((List!27714 0))(
  ( (Nil!27711) (Cons!27710 (h!28919 (_ BitVec 64)) (t!41176 List!27714)) )
))
(declare-fun arrayNoDuplicates!0 (array!80703 (_ BitVec 32) List!27714) Bool)

(assert (=> b!1249668 (= res!833603 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27711))))

(declare-fun res!833600 () Bool)

(assert (=> start!104844 (=> (not res!833600) (not e!709312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104844 (= res!833600 (validMask!0 mask!1466))))

(assert (=> start!104844 e!709312))

(assert (=> start!104844 true))

(assert (=> start!104844 tp!93448))

(assert (=> start!104844 tp_is_empty!31555))

(declare-fun array_inv!29829 (array!80703) Bool)

(assert (=> start!104844 (array_inv!29829 _keys!1118)))

(declare-fun array_inv!29830 (array!80705) Bool)

(assert (=> start!104844 (and (array_inv!29830 _values!914) e!709311)))

(declare-fun mapIsEmpty!49093 () Bool)

(assert (=> mapIsEmpty!49093 mapRes!49093))

(declare-fun b!1249669 () Bool)

(assert (=> b!1249669 (= e!709308 tp_is_empty!31555)))

(declare-fun b!1249670 () Bool)

(declare-fun res!833602 () Bool)

(assert (=> b!1249670 (=> (not res!833602) (not e!709312))))

(assert (=> b!1249670 (= res!833602 (and (= (size!39458 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39457 _keys!1118) (size!39458 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104844 res!833600) b!1249670))

(assert (= (and b!1249670 res!833602) b!1249665))

(assert (= (and b!1249665 res!833601) b!1249668))

(assert (= (and b!1249668 res!833603) b!1249664))

(assert (= (and b!1249667 condMapEmpty!49093) mapIsEmpty!49093))

(assert (= (and b!1249667 (not condMapEmpty!49093)) mapNonEmpty!49093))

(get-info :version)

(assert (= (and mapNonEmpty!49093 ((_ is ValueCellFull!15014) mapValue!49093)) b!1249669))

(assert (= (and b!1249667 ((_ is ValueCellFull!15014) mapDefault!49093)) b!1249666))

(assert (= start!104844 b!1249667))

(declare-fun m!1150111 () Bool)

(assert (=> start!104844 m!1150111))

(declare-fun m!1150113 () Bool)

(assert (=> start!104844 m!1150113))

(declare-fun m!1150115 () Bool)

(assert (=> start!104844 m!1150115))

(declare-fun m!1150117 () Bool)

(assert (=> b!1249664 m!1150117))

(declare-fun m!1150119 () Bool)

(assert (=> b!1249664 m!1150119))

(declare-fun m!1150121 () Bool)

(assert (=> b!1249664 m!1150121))

(declare-fun m!1150123 () Bool)

(assert (=> b!1249668 m!1150123))

(declare-fun m!1150125 () Bool)

(assert (=> mapNonEmpty!49093 m!1150125))

(declare-fun m!1150127 () Bool)

(assert (=> b!1249665 m!1150127))

(check-sat b_and!44403 (not b_next!26653) (not b!1249665) (not start!104844) (not b!1249668) tp_is_empty!31555 (not mapNonEmpty!49093) (not b!1249664))
(check-sat b_and!44403 (not b_next!26653))
(get-model)

(declare-fun d!137733 () Bool)

(assert (=> d!137733 (= (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563705 () Unit!41356)

(declare-fun choose!1855 (array!80703 array!80705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 V!47439 V!47439 (_ BitVec 32) Int) Unit!41356)

(assert (=> d!137733 (= lt!563705 (choose!1855 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137733 (validMask!0 mask!1466)))

(assert (=> d!137733 (= (lemmaNoChangeToArrayThenSameMapNoExtras!933 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563705)))

(declare-fun bs!35248 () Bool)

(assert (= bs!35248 d!137733))

(assert (=> bs!35248 m!1150121))

(assert (=> bs!35248 m!1150119))

(declare-fun m!1150165 () Bool)

(assert (=> bs!35248 m!1150165))

(assert (=> bs!35248 m!1150111))

(assert (=> b!1249664 d!137733))

(declare-fun b!1249737 () Bool)

(declare-fun e!709362 () Bool)

(declare-fun e!709357 () Bool)

(assert (=> b!1249737 (= e!709362 e!709357)))

(assert (=> b!1249737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun res!833639 () Bool)

(declare-fun lt!563724 () ListLongMap!18357)

(declare-fun contains!7444 (ListLongMap!18357 (_ BitVec 64)) Bool)

(assert (=> b!1249737 (= res!833639 (contains!7444 lt!563724 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249737 (=> (not res!833639) (not e!709357))))

(declare-fun b!1249738 () Bool)

(declare-fun e!709360 () ListLongMap!18357)

(assert (=> b!1249738 (= e!709360 (ListLongMap!18358 Nil!27710))))

(declare-fun b!1249739 () Bool)

(declare-fun e!709363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1249739 (= e!709363 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249739 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!137735 () Bool)

(declare-fun e!709358 () Bool)

(assert (=> d!137735 e!709358))

(declare-fun res!833637 () Bool)

(assert (=> d!137735 (=> (not res!833637) (not e!709358))))

(assert (=> d!137735 (= res!833637 (not (contains!7444 lt!563724 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137735 (= lt!563724 e!709360)))

(declare-fun c!122117 () Bool)

(assert (=> d!137735 (= c!122117 (bvsge #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> d!137735 (validMask!0 mask!1466)))

(assert (=> d!137735 (= (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563724)))

(declare-fun b!1249740 () Bool)

(declare-fun e!709361 () Bool)

(assert (=> b!1249740 (= e!709361 (= lt!563724 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1249741 () Bool)

(assert (=> b!1249741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> b!1249741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39458 _values!914)))))

(declare-fun apply!973 (ListLongMap!18357 (_ BitVec 64)) V!47439)

(declare-fun get!19984 (ValueCell!15014 V!47439) V!47439)

(declare-fun dynLambda!3403 (Int (_ BitVec 64)) V!47439)

(assert (=> b!1249741 (= e!709357 (= (apply!973 lt!563724 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)) (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1249742 () Bool)

(assert (=> b!1249742 (= e!709362 e!709361)))

(declare-fun c!122116 () Bool)

(assert (=> b!1249742 (= c!122116 (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun b!1249743 () Bool)

(declare-fun res!833636 () Bool)

(assert (=> b!1249743 (=> (not res!833636) (not e!709358))))

(assert (=> b!1249743 (= res!833636 (not (contains!7444 lt!563724 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1249744 () Bool)

(assert (=> b!1249744 (= e!709358 e!709362)))

(declare-fun c!122115 () Bool)

(assert (=> b!1249744 (= c!122115 e!709363)))

(declare-fun res!833638 () Bool)

(assert (=> b!1249744 (=> (not res!833638) (not e!709363))))

(assert (=> b!1249744 (= res!833638 (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun b!1249745 () Bool)

(declare-fun lt!563725 () Unit!41356)

(declare-fun lt!563721 () Unit!41356)

(assert (=> b!1249745 (= lt!563725 lt!563721)))

(declare-fun lt!563723 () ListLongMap!18357)

(declare-fun lt!563726 () V!47439)

(declare-fun lt!563720 () (_ BitVec 64))

(declare-fun lt!563722 () (_ BitVec 64))

(declare-fun +!4184 (ListLongMap!18357 tuple2!20484) ListLongMap!18357)

(assert (=> b!1249745 (not (contains!7444 (+!4184 lt!563723 (tuple2!20485 lt!563722 lt!563726)) lt!563720))))

(declare-fun addStillNotContains!309 (ListLongMap!18357 (_ BitVec 64) V!47439 (_ BitVec 64)) Unit!41356)

(assert (=> b!1249745 (= lt!563721 (addStillNotContains!309 lt!563723 lt!563722 lt!563726 lt!563720))))

(assert (=> b!1249745 (= lt!563720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1249745 (= lt!563726 (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1249745 (= lt!563722 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61562 () ListLongMap!18357)

(assert (=> b!1249745 (= lt!563723 call!61562)))

(declare-fun e!709359 () ListLongMap!18357)

(assert (=> b!1249745 (= e!709359 (+!4184 call!61562 (tuple2!20485 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000) (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1249746 () Bool)

(assert (=> b!1249746 (= e!709360 e!709359)))

(declare-fun c!122118 () Bool)

(assert (=> b!1249746 (= c!122118 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249747 () Bool)

(declare-fun isEmpty!1028 (ListLongMap!18357) Bool)

(assert (=> b!1249747 (= e!709361 (isEmpty!1028 lt!563724))))

(declare-fun b!1249748 () Bool)

(assert (=> b!1249748 (= e!709359 call!61562)))

(declare-fun bm!61559 () Bool)

(assert (=> bm!61559 (= call!61562 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!137735 c!122117) b!1249738))

(assert (= (and d!137735 (not c!122117)) b!1249746))

(assert (= (and b!1249746 c!122118) b!1249745))

(assert (= (and b!1249746 (not c!122118)) b!1249748))

(assert (= (or b!1249745 b!1249748) bm!61559))

(assert (= (and d!137735 res!833637) b!1249743))

(assert (= (and b!1249743 res!833636) b!1249744))

(assert (= (and b!1249744 res!833638) b!1249739))

(assert (= (and b!1249744 c!122115) b!1249737))

(assert (= (and b!1249744 (not c!122115)) b!1249742))

(assert (= (and b!1249737 res!833639) b!1249741))

(assert (= (and b!1249742 c!122116) b!1249740))

(assert (= (and b!1249742 (not c!122116)) b!1249747))

(declare-fun b_lambda!22501 () Bool)

(assert (=> (not b_lambda!22501) (not b!1249741)))

(declare-fun t!41180 () Bool)

(declare-fun tb!11279 () Bool)

(assert (=> (and start!104844 (= defaultEntry!922 defaultEntry!922) t!41180) tb!11279))

(declare-fun result!23261 () Bool)

(assert (=> tb!11279 (= result!23261 tp_is_empty!31555)))

(assert (=> b!1249741 t!41180))

(declare-fun b_and!44409 () Bool)

(assert (= b_and!44403 (and (=> t!41180 result!23261) b_and!44409)))

(declare-fun b_lambda!22503 () Bool)

(assert (=> (not b_lambda!22503) (not b!1249745)))

(assert (=> b!1249745 t!41180))

(declare-fun b_and!44411 () Bool)

(assert (= b_and!44409 (and (=> t!41180 result!23261) b_and!44411)))

(declare-fun m!1150167 () Bool)

(assert (=> b!1249741 m!1150167))

(assert (=> b!1249741 m!1150167))

(declare-fun m!1150169 () Bool)

(assert (=> b!1249741 m!1150169))

(declare-fun m!1150171 () Bool)

(assert (=> b!1249741 m!1150171))

(assert (=> b!1249741 m!1150169))

(declare-fun m!1150173 () Bool)

(assert (=> b!1249741 m!1150173))

(declare-fun m!1150175 () Bool)

(assert (=> b!1249741 m!1150175))

(assert (=> b!1249741 m!1150173))

(declare-fun m!1150177 () Bool)

(assert (=> d!137735 m!1150177))

(assert (=> d!137735 m!1150111))

(declare-fun m!1150179 () Bool)

(assert (=> b!1249743 m!1150179))

(assert (=> b!1249746 m!1150173))

(assert (=> b!1249746 m!1150173))

(declare-fun m!1150181 () Bool)

(assert (=> b!1249746 m!1150181))

(assert (=> b!1249739 m!1150173))

(assert (=> b!1249739 m!1150173))

(assert (=> b!1249739 m!1150181))

(declare-fun m!1150183 () Bool)

(assert (=> bm!61559 m!1150183))

(assert (=> b!1249745 m!1150167))

(declare-fun m!1150185 () Bool)

(assert (=> b!1249745 m!1150185))

(assert (=> b!1249745 m!1150169))

(declare-fun m!1150187 () Bool)

(assert (=> b!1249745 m!1150187))

(declare-fun m!1150189 () Bool)

(assert (=> b!1249745 m!1150189))

(assert (=> b!1249745 m!1150173))

(assert (=> b!1249745 m!1150187))

(declare-fun m!1150191 () Bool)

(assert (=> b!1249745 m!1150191))

(assert (=> b!1249745 m!1150167))

(assert (=> b!1249745 m!1150169))

(assert (=> b!1249745 m!1150171))

(assert (=> b!1249740 m!1150183))

(declare-fun m!1150193 () Bool)

(assert (=> b!1249747 m!1150193))

(assert (=> b!1249737 m!1150173))

(assert (=> b!1249737 m!1150173))

(declare-fun m!1150195 () Bool)

(assert (=> b!1249737 m!1150195))

(assert (=> b!1249664 d!137735))

(declare-fun b!1249751 () Bool)

(declare-fun e!709369 () Bool)

(declare-fun e!709364 () Bool)

(assert (=> b!1249751 (= e!709369 e!709364)))

(assert (=> b!1249751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun res!833643 () Bool)

(declare-fun lt!563731 () ListLongMap!18357)

(assert (=> b!1249751 (= res!833643 (contains!7444 lt!563731 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249751 (=> (not res!833643) (not e!709364))))

(declare-fun b!1249752 () Bool)

(declare-fun e!709367 () ListLongMap!18357)

(assert (=> b!1249752 (= e!709367 (ListLongMap!18358 Nil!27710))))

(declare-fun b!1249753 () Bool)

(declare-fun e!709370 () Bool)

(assert (=> b!1249753 (= e!709370 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249753 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!137737 () Bool)

(declare-fun e!709365 () Bool)

(assert (=> d!137737 e!709365))

(declare-fun res!833641 () Bool)

(assert (=> d!137737 (=> (not res!833641) (not e!709365))))

(assert (=> d!137737 (= res!833641 (not (contains!7444 lt!563731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137737 (= lt!563731 e!709367)))

(declare-fun c!122121 () Bool)

(assert (=> d!137737 (= c!122121 (bvsge #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> d!137737 (validMask!0 mask!1466)))

(assert (=> d!137737 (= (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563731)))

(declare-fun e!709368 () Bool)

(declare-fun b!1249754 () Bool)

(assert (=> b!1249754 (= e!709368 (= lt!563731 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1249755 () Bool)

(assert (=> b!1249755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> b!1249755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39458 _values!914)))))

(assert (=> b!1249755 (= e!709364 (= (apply!973 lt!563731 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)) (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1249756 () Bool)

(assert (=> b!1249756 (= e!709369 e!709368)))

(declare-fun c!122120 () Bool)

(assert (=> b!1249756 (= c!122120 (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun b!1249757 () Bool)

(declare-fun res!833640 () Bool)

(assert (=> b!1249757 (=> (not res!833640) (not e!709365))))

(assert (=> b!1249757 (= res!833640 (not (contains!7444 lt!563731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1249758 () Bool)

(assert (=> b!1249758 (= e!709365 e!709369)))

(declare-fun c!122119 () Bool)

(assert (=> b!1249758 (= c!122119 e!709370)))

(declare-fun res!833642 () Bool)

(assert (=> b!1249758 (=> (not res!833642) (not e!709370))))

(assert (=> b!1249758 (= res!833642 (bvslt #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(declare-fun b!1249759 () Bool)

(declare-fun lt!563732 () Unit!41356)

(declare-fun lt!563728 () Unit!41356)

(assert (=> b!1249759 (= lt!563732 lt!563728)))

(declare-fun lt!563727 () (_ BitVec 64))

(declare-fun lt!563729 () (_ BitVec 64))

(declare-fun lt!563733 () V!47439)

(declare-fun lt!563730 () ListLongMap!18357)

(assert (=> b!1249759 (not (contains!7444 (+!4184 lt!563730 (tuple2!20485 lt!563729 lt!563733)) lt!563727))))

(assert (=> b!1249759 (= lt!563728 (addStillNotContains!309 lt!563730 lt!563729 lt!563733 lt!563727))))

(assert (=> b!1249759 (= lt!563727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1249759 (= lt!563733 (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1249759 (= lt!563729 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61563 () ListLongMap!18357)

(assert (=> b!1249759 (= lt!563730 call!61563)))

(declare-fun e!709366 () ListLongMap!18357)

(assert (=> b!1249759 (= e!709366 (+!4184 call!61563 (tuple2!20485 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000) (get!19984 (select (arr!38920 _values!914) #b00000000000000000000000000000000) (dynLambda!3403 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1249760 () Bool)

(assert (=> b!1249760 (= e!709367 e!709366)))

(declare-fun c!122122 () Bool)

(assert (=> b!1249760 (= c!122122 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249761 () Bool)

(assert (=> b!1249761 (= e!709368 (isEmpty!1028 lt!563731))))

(declare-fun b!1249762 () Bool)

(assert (=> b!1249762 (= e!709366 call!61563)))

(declare-fun bm!61560 () Bool)

(assert (=> bm!61560 (= call!61563 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!137737 c!122121) b!1249752))

(assert (= (and d!137737 (not c!122121)) b!1249760))

(assert (= (and b!1249760 c!122122) b!1249759))

(assert (= (and b!1249760 (not c!122122)) b!1249762))

(assert (= (or b!1249759 b!1249762) bm!61560))

(assert (= (and d!137737 res!833641) b!1249757))

(assert (= (and b!1249757 res!833640) b!1249758))

(assert (= (and b!1249758 res!833642) b!1249753))

(assert (= (and b!1249758 c!122119) b!1249751))

(assert (= (and b!1249758 (not c!122119)) b!1249756))

(assert (= (and b!1249751 res!833643) b!1249755))

(assert (= (and b!1249756 c!122120) b!1249754))

(assert (= (and b!1249756 (not c!122120)) b!1249761))

(declare-fun b_lambda!22505 () Bool)

(assert (=> (not b_lambda!22505) (not b!1249755)))

(assert (=> b!1249755 t!41180))

(declare-fun b_and!44413 () Bool)

(assert (= b_and!44411 (and (=> t!41180 result!23261) b_and!44413)))

(declare-fun b_lambda!22507 () Bool)

(assert (=> (not b_lambda!22507) (not b!1249759)))

(assert (=> b!1249759 t!41180))

(declare-fun b_and!44415 () Bool)

(assert (= b_and!44413 (and (=> t!41180 result!23261) b_and!44415)))

(assert (=> b!1249755 m!1150167))

(assert (=> b!1249755 m!1150167))

(assert (=> b!1249755 m!1150169))

(assert (=> b!1249755 m!1150171))

(assert (=> b!1249755 m!1150169))

(assert (=> b!1249755 m!1150173))

(declare-fun m!1150197 () Bool)

(assert (=> b!1249755 m!1150197))

(assert (=> b!1249755 m!1150173))

(declare-fun m!1150199 () Bool)

(assert (=> d!137737 m!1150199))

(assert (=> d!137737 m!1150111))

(declare-fun m!1150201 () Bool)

(assert (=> b!1249757 m!1150201))

(assert (=> b!1249760 m!1150173))

(assert (=> b!1249760 m!1150173))

(assert (=> b!1249760 m!1150181))

(assert (=> b!1249753 m!1150173))

(assert (=> b!1249753 m!1150173))

(assert (=> b!1249753 m!1150181))

(declare-fun m!1150203 () Bool)

(assert (=> bm!61560 m!1150203))

(assert (=> b!1249759 m!1150167))

(declare-fun m!1150205 () Bool)

(assert (=> b!1249759 m!1150205))

(assert (=> b!1249759 m!1150169))

(declare-fun m!1150207 () Bool)

(assert (=> b!1249759 m!1150207))

(declare-fun m!1150209 () Bool)

(assert (=> b!1249759 m!1150209))

(assert (=> b!1249759 m!1150173))

(assert (=> b!1249759 m!1150207))

(declare-fun m!1150211 () Bool)

(assert (=> b!1249759 m!1150211))

(assert (=> b!1249759 m!1150167))

(assert (=> b!1249759 m!1150169))

(assert (=> b!1249759 m!1150171))

(assert (=> b!1249754 m!1150203))

(declare-fun m!1150213 () Bool)

(assert (=> b!1249761 m!1150213))

(assert (=> b!1249751 m!1150173))

(assert (=> b!1249751 m!1150173))

(declare-fun m!1150215 () Bool)

(assert (=> b!1249751 m!1150215))

(assert (=> b!1249664 d!137737))

(declare-fun d!137739 () Bool)

(declare-fun res!833649 () Bool)

(declare-fun e!709377 () Bool)

(assert (=> d!137739 (=> res!833649 e!709377)))

(assert (=> d!137739 (= res!833649 (bvsge #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> d!137739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!709377)))

(declare-fun b!1249771 () Bool)

(declare-fun e!709379 () Bool)

(assert (=> b!1249771 (= e!709377 e!709379)))

(declare-fun c!122125 () Bool)

(assert (=> b!1249771 (= c!122125 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61563 () Bool)

(declare-fun call!61566 () Bool)

(assert (=> bm!61563 (= call!61566 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1249772 () Bool)

(declare-fun e!709378 () Bool)

(assert (=> b!1249772 (= e!709378 call!61566)))

(declare-fun b!1249773 () Bool)

(assert (=> b!1249773 (= e!709379 e!709378)))

(declare-fun lt!563742 () (_ BitVec 64))

(assert (=> b!1249773 (= lt!563742 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!563741 () Unit!41356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80703 (_ BitVec 64) (_ BitVec 32)) Unit!41356)

(assert (=> b!1249773 (= lt!563741 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563742 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1249773 (arrayContainsKey!0 _keys!1118 lt!563742 #b00000000000000000000000000000000)))

(declare-fun lt!563740 () Unit!41356)

(assert (=> b!1249773 (= lt!563740 lt!563741)))

(declare-fun res!833648 () Bool)

(declare-datatypes ((SeekEntryResult!9957 0))(
  ( (MissingZero!9957 (index!42199 (_ BitVec 32))) (Found!9957 (index!42200 (_ BitVec 32))) (Intermediate!9957 (undefined!10769 Bool) (index!42201 (_ BitVec 32)) (x!109933 (_ BitVec 32))) (Undefined!9957) (MissingVacant!9957 (index!42202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80703 (_ BitVec 32)) SeekEntryResult!9957)

(assert (=> b!1249773 (= res!833648 (= (seekEntryOrOpen!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9957 #b00000000000000000000000000000000)))))

(assert (=> b!1249773 (=> (not res!833648) (not e!709378))))

(declare-fun b!1249774 () Bool)

(assert (=> b!1249774 (= e!709379 call!61566)))

(assert (= (and d!137739 (not res!833649)) b!1249771))

(assert (= (and b!1249771 c!122125) b!1249773))

(assert (= (and b!1249771 (not c!122125)) b!1249774))

(assert (= (and b!1249773 res!833648) b!1249772))

(assert (= (or b!1249772 b!1249774) bm!61563))

(assert (=> b!1249771 m!1150173))

(assert (=> b!1249771 m!1150173))

(assert (=> b!1249771 m!1150181))

(declare-fun m!1150217 () Bool)

(assert (=> bm!61563 m!1150217))

(assert (=> b!1249773 m!1150173))

(declare-fun m!1150219 () Bool)

(assert (=> b!1249773 m!1150219))

(declare-fun m!1150221 () Bool)

(assert (=> b!1249773 m!1150221))

(assert (=> b!1249773 m!1150173))

(declare-fun m!1150223 () Bool)

(assert (=> b!1249773 m!1150223))

(assert (=> b!1249665 d!137739))

(declare-fun d!137741 () Bool)

(assert (=> d!137741 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104844 d!137741))

(declare-fun d!137743 () Bool)

(assert (=> d!137743 (= (array_inv!29829 _keys!1118) (bvsge (size!39457 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104844 d!137743))

(declare-fun d!137745 () Bool)

(assert (=> d!137745 (= (array_inv!29830 _values!914) (bvsge (size!39458 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104844 d!137745))

(declare-fun b!1249785 () Bool)

(declare-fun e!709391 () Bool)

(declare-fun e!709388 () Bool)

(assert (=> b!1249785 (= e!709391 e!709388)))

(declare-fun c!122128 () Bool)

(assert (=> b!1249785 (= c!122128 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249786 () Bool)

(declare-fun call!61569 () Bool)

(assert (=> b!1249786 (= e!709388 call!61569)))

(declare-fun d!137747 () Bool)

(declare-fun res!833658 () Bool)

(declare-fun e!709390 () Bool)

(assert (=> d!137747 (=> res!833658 e!709390)))

(assert (=> d!137747 (= res!833658 (bvsge #b00000000000000000000000000000000 (size!39457 _keys!1118)))))

(assert (=> d!137747 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27711) e!709390)))

(declare-fun bm!61566 () Bool)

(assert (=> bm!61566 (= call!61569 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122128 (Cons!27710 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000) Nil!27711) Nil!27711)))))

(declare-fun b!1249787 () Bool)

(assert (=> b!1249787 (= e!709390 e!709391)))

(declare-fun res!833657 () Bool)

(assert (=> b!1249787 (=> (not res!833657) (not e!709391))))

(declare-fun e!709389 () Bool)

(assert (=> b!1249787 (= res!833657 (not e!709389))))

(declare-fun res!833656 () Bool)

(assert (=> b!1249787 (=> (not res!833656) (not e!709389))))

(assert (=> b!1249787 (= res!833656 (validKeyInArray!0 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249788 () Bool)

(declare-fun contains!7445 (List!27714 (_ BitVec 64)) Bool)

(assert (=> b!1249788 (= e!709389 (contains!7445 Nil!27711 (select (arr!38919 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249789 () Bool)

(assert (=> b!1249789 (= e!709388 call!61569)))

(assert (= (and d!137747 (not res!833658)) b!1249787))

(assert (= (and b!1249787 res!833656) b!1249788))

(assert (= (and b!1249787 res!833657) b!1249785))

(assert (= (and b!1249785 c!122128) b!1249789))

(assert (= (and b!1249785 (not c!122128)) b!1249786))

(assert (= (or b!1249789 b!1249786) bm!61566))

(assert (=> b!1249785 m!1150173))

(assert (=> b!1249785 m!1150173))

(assert (=> b!1249785 m!1150181))

(assert (=> bm!61566 m!1150173))

(declare-fun m!1150225 () Bool)

(assert (=> bm!61566 m!1150225))

(assert (=> b!1249787 m!1150173))

(assert (=> b!1249787 m!1150173))

(assert (=> b!1249787 m!1150181))

(assert (=> b!1249788 m!1150173))

(assert (=> b!1249788 m!1150173))

(declare-fun m!1150227 () Bool)

(assert (=> b!1249788 m!1150227))

(assert (=> b!1249668 d!137747))

(declare-fun condMapEmpty!49102 () Bool)

(declare-fun mapDefault!49102 () ValueCell!15014)

(assert (=> mapNonEmpty!49093 (= condMapEmpty!49102 (= mapRest!49093 ((as const (Array (_ BitVec 32) ValueCell!15014)) mapDefault!49102)))))

(declare-fun e!709396 () Bool)

(declare-fun mapRes!49102 () Bool)

(assert (=> mapNonEmpty!49093 (= tp!93449 (and e!709396 mapRes!49102))))

(declare-fun b!1249797 () Bool)

(assert (=> b!1249797 (= e!709396 tp_is_empty!31555)))

(declare-fun mapIsEmpty!49102 () Bool)

(assert (=> mapIsEmpty!49102 mapRes!49102))

(declare-fun b!1249796 () Bool)

(declare-fun e!709397 () Bool)

(assert (=> b!1249796 (= e!709397 tp_is_empty!31555)))

(declare-fun mapNonEmpty!49102 () Bool)

(declare-fun tp!93464 () Bool)

(assert (=> mapNonEmpty!49102 (= mapRes!49102 (and tp!93464 e!709397))))

(declare-fun mapKey!49102 () (_ BitVec 32))

(declare-fun mapValue!49102 () ValueCell!15014)

(declare-fun mapRest!49102 () (Array (_ BitVec 32) ValueCell!15014))

(assert (=> mapNonEmpty!49102 (= mapRest!49093 (store mapRest!49102 mapKey!49102 mapValue!49102))))

(assert (= (and mapNonEmpty!49093 condMapEmpty!49102) mapIsEmpty!49102))

(assert (= (and mapNonEmpty!49093 (not condMapEmpty!49102)) mapNonEmpty!49102))

(assert (= (and mapNonEmpty!49102 ((_ is ValueCellFull!15014) mapValue!49102)) b!1249796))

(assert (= (and mapNonEmpty!49093 ((_ is ValueCellFull!15014) mapDefault!49102)) b!1249797))

(declare-fun m!1150229 () Bool)

(assert (=> mapNonEmpty!49102 m!1150229))

(declare-fun b_lambda!22509 () Bool)

(assert (= b_lambda!22507 (or (and start!104844 b_free!26653) b_lambda!22509)))

(declare-fun b_lambda!22511 () Bool)

(assert (= b_lambda!22501 (or (and start!104844 b_free!26653) b_lambda!22511)))

(declare-fun b_lambda!22513 () Bool)

(assert (= b_lambda!22503 (or (and start!104844 b_free!26653) b_lambda!22513)))

(declare-fun b_lambda!22515 () Bool)

(assert (= b_lambda!22505 (or (and start!104844 b_free!26653) b_lambda!22515)))

(check-sat (not b_lambda!22511) (not d!137733) (not bm!61559) (not b!1249787) (not b!1249788) (not b_lambda!22509) (not bm!61566) (not mapNonEmpty!49102) (not bm!61560) (not b!1249747) (not b!1249755) (not b!1249737) (not b!1249757) (not bm!61563) (not b_lambda!22513) (not b!1249741) (not b_lambda!22515) (not b!1249761) (not b!1249773) (not b!1249746) (not b!1249739) (not b_next!26653) (not b!1249753) (not b!1249771) (not b!1249785) (not b!1249743) tp_is_empty!31555 (not b!1249745) (not b!1249751) (not b!1249740) (not d!137737) (not b!1249759) b_and!44415 (not b!1249760) (not d!137735) (not b!1249754))
(check-sat b_and!44415 (not b_next!26653))
