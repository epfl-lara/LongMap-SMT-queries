; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95416 () Bool)

(assert start!95416)

(declare-fun b_free!22219 () Bool)

(declare-fun b_next!22219 () Bool)

(assert (=> start!95416 (= b_free!22219 (not b_next!22219))))

(declare-fun tp!78149 () Bool)

(declare-fun b_and!35183 () Bool)

(assert (=> start!95416 (= tp!78149 b_and!35183)))

(declare-fun b!1077179 () Bool)

(declare-fun e!615758 () Bool)

(declare-fun tp_is_empty!26029 () Bool)

(assert (=> b!1077179 (= e!615758 tp_is_empty!26029)))

(declare-fun b!1077180 () Bool)

(declare-fun e!615764 () Bool)

(declare-fun e!615759 () Bool)

(assert (=> b!1077180 (= e!615764 e!615759)))

(declare-fun res!717657 () Bool)

(assert (=> b!1077180 (=> res!717657 e!615759)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1077180 (= res!717657 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077181 () Bool)

(declare-datatypes ((V!39841 0))(
  ( (V!39842 (val!13065 Int)) )
))
(declare-datatypes ((ValueCell!12311 0))(
  ( (ValueCellFull!12311 (v!15687 V!39841)) (EmptyCell!12311) )
))
(declare-datatypes ((array!69073 0))(
  ( (array!69074 (arr!33215 (Array (_ BitVec 32) ValueCell!12311)) (size!33752 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69073)

(declare-fun minValue!907 () V!39841)

(declare-datatypes ((array!69075 0))(
  ( (array!69076 (arr!33216 (Array (_ BitVec 32) (_ BitVec 64))) (size!33753 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69075)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun e!615760 () Bool)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39841)

(declare-datatypes ((tuple2!16638 0))(
  ( (tuple2!16639 (_1!8330 (_ BitVec 64)) (_2!8330 V!39841)) )
))
(declare-datatypes ((List!23187 0))(
  ( (Nil!23184) (Cons!23183 (h!24401 tuple2!16638) (t!32534 List!23187)) )
))
(declare-datatypes ((ListLongMap!14615 0))(
  ( (ListLongMap!14616 (toList!7323 List!23187)) )
))
(declare-fun lt!478198 () ListLongMap!14615)

(declare-fun getCurrentListMap!4180 (array!69075 array!69073 (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 (_ BitVec 32) Int) ListLongMap!14615)

(declare-fun +!3250 (ListLongMap!14615 tuple2!16638) ListLongMap!14615)

(assert (=> b!1077181 (= e!615760 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3250 lt!478198 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun res!717658 () Bool)

(declare-fun e!615761 () Bool)

(assert (=> start!95416 (=> (not res!717658) (not e!615761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95416 (= res!717658 (validMask!0 mask!1515))))

(assert (=> start!95416 e!615761))

(assert (=> start!95416 true))

(assert (=> start!95416 tp_is_empty!26029))

(declare-fun e!615762 () Bool)

(declare-fun array_inv!25706 (array!69073) Bool)

(assert (=> start!95416 (and (array_inv!25706 _values!955) e!615762)))

(assert (=> start!95416 tp!78149))

(declare-fun array_inv!25707 (array!69075) Bool)

(assert (=> start!95416 (array_inv!25707 _keys!1163)))

(declare-fun b!1077182 () Bool)

(declare-fun res!717655 () Bool)

(assert (=> b!1077182 (=> (not res!717655) (not e!615761))))

(declare-datatypes ((List!23188 0))(
  ( (Nil!23185) (Cons!23184 (h!24402 (_ BitVec 64)) (t!32535 List!23188)) )
))
(declare-fun arrayNoDuplicates!0 (array!69075 (_ BitVec 32) List!23188) Bool)

(assert (=> b!1077182 (= res!717655 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23185))))

(declare-fun mapIsEmpty!40783 () Bool)

(declare-fun mapRes!40783 () Bool)

(assert (=> mapIsEmpty!40783 mapRes!40783))

(declare-fun b!1077183 () Bool)

(declare-fun res!717660 () Bool)

(assert (=> b!1077183 (=> (not res!717660) (not e!615761))))

(assert (=> b!1077183 (= res!717660 (and (= (size!33752 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33753 _keys!1163) (size!33752 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40783 () Bool)

(declare-fun tp!78148 () Bool)

(declare-fun e!615765 () Bool)

(assert (=> mapNonEmpty!40783 (= mapRes!40783 (and tp!78148 e!615765))))

(declare-fun mapValue!40783 () ValueCell!12311)

(declare-fun mapKey!40783 () (_ BitVec 32))

(declare-fun mapRest!40783 () (Array (_ BitVec 32) ValueCell!12311))

(assert (=> mapNonEmpty!40783 (= (arr!33215 _values!955) (store mapRest!40783 mapKey!40783 mapValue!40783))))

(declare-fun b!1077184 () Bool)

(declare-fun res!717659 () Bool)

(assert (=> b!1077184 (=> (not res!717659) (not e!615761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69075 (_ BitVec 32)) Bool)

(assert (=> b!1077184 (= res!717659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1077185 () Bool)

(assert (=> b!1077185 (= e!615761 (not e!615760))))

(declare-fun res!717656 () Bool)

(assert (=> b!1077185 (=> res!717656 e!615760)))

(assert (=> b!1077185 (= res!717656 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077185 e!615764))

(declare-fun res!717654 () Bool)

(assert (=> b!1077185 (=> (not res!717654) (not e!615764))))

(declare-fun lt!478197 () ListLongMap!14615)

(assert (=> b!1077185 (= res!717654 (= lt!478197 lt!478198))))

(declare-fun zeroValueBefore!47 () V!39841)

(declare-datatypes ((Unit!35394 0))(
  ( (Unit!35395) )
))
(declare-fun lt!478196 () Unit!35394)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!895 (array!69075 array!69073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 V!39841 V!39841 (_ BitVec 32) Int) Unit!35394)

(assert (=> b!1077185 (= lt!478196 (lemmaNoChangeToArrayThenSameMapNoExtras!895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3915 (array!69075 array!69073 (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 (_ BitVec 32) Int) ListLongMap!14615)

(assert (=> b!1077185 (= lt!478198 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077185 (= lt!478197 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077186 () Bool)

(assert (=> b!1077186 (= e!615759 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3250 (+!3250 lt!478197 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077187 () Bool)

(assert (=> b!1077187 (= e!615762 (and e!615758 mapRes!40783))))

(declare-fun condMapEmpty!40783 () Bool)

(declare-fun mapDefault!40783 () ValueCell!12311)

(assert (=> b!1077187 (= condMapEmpty!40783 (= (arr!33215 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12311)) mapDefault!40783)))))

(declare-fun b!1077188 () Bool)

(assert (=> b!1077188 (= e!615765 tp_is_empty!26029)))

(assert (= (and start!95416 res!717658) b!1077183))

(assert (= (and b!1077183 res!717660) b!1077184))

(assert (= (and b!1077184 res!717659) b!1077182))

(assert (= (and b!1077182 res!717655) b!1077185))

(assert (= (and b!1077185 res!717654) b!1077180))

(assert (= (and b!1077180 (not res!717657)) b!1077186))

(assert (= (and b!1077185 (not res!717656)) b!1077181))

(assert (= (and b!1077187 condMapEmpty!40783) mapIsEmpty!40783))

(assert (= (and b!1077187 (not condMapEmpty!40783)) mapNonEmpty!40783))

(get-info :version)

(assert (= (and mapNonEmpty!40783 ((_ is ValueCellFull!12311) mapValue!40783)) b!1077188))

(assert (= (and b!1077187 ((_ is ValueCellFull!12311) mapDefault!40783)) b!1077179))

(assert (= start!95416 b!1077187))

(declare-fun m!996359 () Bool)

(assert (=> mapNonEmpty!40783 m!996359))

(declare-fun m!996361 () Bool)

(assert (=> b!1077184 m!996361))

(declare-fun m!996363 () Bool)

(assert (=> b!1077186 m!996363))

(declare-fun m!996365 () Bool)

(assert (=> b!1077186 m!996365))

(assert (=> b!1077186 m!996365))

(declare-fun m!996367 () Bool)

(assert (=> b!1077186 m!996367))

(declare-fun m!996369 () Bool)

(assert (=> b!1077182 m!996369))

(declare-fun m!996371 () Bool)

(assert (=> start!95416 m!996371))

(declare-fun m!996373 () Bool)

(assert (=> start!95416 m!996373))

(declare-fun m!996375 () Bool)

(assert (=> start!95416 m!996375))

(declare-fun m!996377 () Bool)

(assert (=> b!1077185 m!996377))

(declare-fun m!996379 () Bool)

(assert (=> b!1077185 m!996379))

(declare-fun m!996381 () Bool)

(assert (=> b!1077185 m!996381))

(declare-fun m!996383 () Bool)

(assert (=> b!1077181 m!996383))

(declare-fun m!996385 () Bool)

(assert (=> b!1077181 m!996385))

(check-sat tp_is_empty!26029 (not b!1077186) (not b!1077185) (not mapNonEmpty!40783) b_and!35183 (not b_next!22219) (not b!1077181) (not start!95416) (not b!1077182) (not b!1077184))
(check-sat b_and!35183 (not b_next!22219))
(get-model)

(declare-fun d!130107 () Bool)

(assert (=> d!130107 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95416 d!130107))

(declare-fun d!130109 () Bool)

(assert (=> d!130109 (= (array_inv!25706 _values!955) (bvsge (size!33752 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95416 d!130109))

(declare-fun d!130111 () Bool)

(assert (=> d!130111 (= (array_inv!25707 _keys!1163) (bvsge (size!33753 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95416 d!130111))

(declare-fun b!1077257 () Bool)

(declare-fun e!615820 () Bool)

(declare-fun call!45647 () Bool)

(assert (=> b!1077257 (= e!615820 call!45647)))

(declare-fun bm!45644 () Bool)

(assert (=> bm!45644 (= call!45647 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1077258 () Bool)

(declare-fun e!615822 () Bool)

(assert (=> b!1077258 (= e!615822 e!615820)))

(declare-fun lt!478225 () (_ BitVec 64))

(assert (=> b!1077258 (= lt!478225 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478224 () Unit!35394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69075 (_ BitVec 64) (_ BitVec 32)) Unit!35394)

(assert (=> b!1077258 (= lt!478224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!478225 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077258 (arrayContainsKey!0 _keys!1163 lt!478225 #b00000000000000000000000000000000)))

(declare-fun lt!478223 () Unit!35394)

(assert (=> b!1077258 (= lt!478223 lt!478224)))

(declare-fun res!717708 () Bool)

(declare-datatypes ((SeekEntryResult!9850 0))(
  ( (MissingZero!9850 (index!41771 (_ BitVec 32))) (Found!9850 (index!41772 (_ BitVec 32))) (Intermediate!9850 (undefined!10662 Bool) (index!41773 (_ BitVec 32)) (x!96400 (_ BitVec 32))) (Undefined!9850) (MissingVacant!9850 (index!41774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69075 (_ BitVec 32)) SeekEntryResult!9850)

(assert (=> b!1077258 (= res!717708 (= (seekEntryOrOpen!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9850 #b00000000000000000000000000000000)))))

(assert (=> b!1077258 (=> (not res!717708) (not e!615820))))

(declare-fun d!130113 () Bool)

(declare-fun res!717707 () Bool)

(declare-fun e!615821 () Bool)

(assert (=> d!130113 (=> res!717707 e!615821)))

(assert (=> d!130113 (= res!717707 (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> d!130113 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615821)))

(declare-fun b!1077259 () Bool)

(assert (=> b!1077259 (= e!615821 e!615822)))

(declare-fun c!108547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077259 (= c!108547 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077260 () Bool)

(assert (=> b!1077260 (= e!615822 call!45647)))

(assert (= (and d!130113 (not res!717707)) b!1077259))

(assert (= (and b!1077259 c!108547) b!1077258))

(assert (= (and b!1077259 (not c!108547)) b!1077260))

(assert (= (and b!1077258 res!717708) b!1077257))

(assert (= (or b!1077257 b!1077260) bm!45644))

(declare-fun m!996443 () Bool)

(assert (=> bm!45644 m!996443))

(declare-fun m!996445 () Bool)

(assert (=> b!1077258 m!996445))

(declare-fun m!996447 () Bool)

(assert (=> b!1077258 m!996447))

(declare-fun m!996449 () Bool)

(assert (=> b!1077258 m!996449))

(assert (=> b!1077258 m!996445))

(declare-fun m!996451 () Bool)

(assert (=> b!1077258 m!996451))

(assert (=> b!1077259 m!996445))

(assert (=> b!1077259 m!996445))

(declare-fun m!996453 () Bool)

(assert (=> b!1077259 m!996453))

(assert (=> b!1077184 d!130113))

(declare-fun b!1077303 () Bool)

(declare-fun e!615860 () Bool)

(declare-fun e!615854 () Bool)

(assert (=> b!1077303 (= e!615860 e!615854)))

(declare-fun res!717732 () Bool)

(assert (=> b!1077303 (=> (not res!717732) (not e!615854))))

(declare-fun lt!478270 () ListLongMap!14615)

(declare-fun contains!6378 (ListLongMap!14615 (_ BitVec 64)) Bool)

(assert (=> b!1077303 (= res!717732 (contains!6378 lt!478270 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun b!1077304 () Bool)

(declare-fun e!615861 () Bool)

(declare-fun e!615852 () Bool)

(assert (=> b!1077304 (= e!615861 e!615852)))

(declare-fun c!108564 () Bool)

(assert (=> b!1077304 (= c!108564 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130115 () Bool)

(assert (=> d!130115 e!615861))

(declare-fun res!717735 () Bool)

(assert (=> d!130115 (=> (not res!717735) (not e!615861))))

(assert (=> d!130115 (= res!717735 (or (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))))

(declare-fun lt!478277 () ListLongMap!14615)

(assert (=> d!130115 (= lt!478270 lt!478277)))

(declare-fun lt!478273 () Unit!35394)

(declare-fun e!615858 () Unit!35394)

(assert (=> d!130115 (= lt!478273 e!615858)))

(declare-fun c!108561 () Bool)

(declare-fun e!615855 () Bool)

(assert (=> d!130115 (= c!108561 e!615855)))

(declare-fun res!717728 () Bool)

(assert (=> d!130115 (=> (not res!717728) (not e!615855))))

(assert (=> d!130115 (= res!717728 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun e!615857 () ListLongMap!14615)

(assert (=> d!130115 (= lt!478277 e!615857)))

(declare-fun c!108562 () Bool)

(assert (=> d!130115 (= c!108562 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130115 (validMask!0 mask!1515)))

(assert (=> d!130115 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478270)))

(declare-fun b!1077305 () Bool)

(declare-fun res!717727 () Bool)

(assert (=> b!1077305 (=> (not res!717727) (not e!615861))))

(assert (=> b!1077305 (= res!717727 e!615860)))

(declare-fun res!717733 () Bool)

(assert (=> b!1077305 (=> res!717733 e!615860)))

(declare-fun e!615849 () Bool)

(assert (=> b!1077305 (= res!717733 (not e!615849))))

(declare-fun res!717730 () Bool)

(assert (=> b!1077305 (=> (not res!717730) (not e!615849))))

(assert (=> b!1077305 (= res!717730 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun bm!45659 () Bool)

(declare-fun call!45666 () ListLongMap!14615)

(declare-fun call!45662 () ListLongMap!14615)

(assert (=> bm!45659 (= call!45666 call!45662)))

(declare-fun b!1077306 () Bool)

(declare-fun e!615853 () Bool)

(assert (=> b!1077306 (= e!615852 e!615853)))

(declare-fun res!717729 () Bool)

(declare-fun call!45668 () Bool)

(assert (=> b!1077306 (= res!717729 call!45668)))

(assert (=> b!1077306 (=> (not res!717729) (not e!615853))))

(declare-fun b!1077307 () Bool)

(declare-fun e!615850 () ListLongMap!14615)

(assert (=> b!1077307 (= e!615850 call!45666)))

(declare-fun b!1077308 () Bool)

(declare-fun e!615851 () Bool)

(declare-fun call!45667 () Bool)

(assert (=> b!1077308 (= e!615851 (not call!45667))))

(declare-fun bm!45660 () Bool)

(declare-fun call!45663 () ListLongMap!14615)

(declare-fun call!45665 () ListLongMap!14615)

(assert (=> bm!45660 (= call!45663 call!45665)))

(declare-fun b!1077309 () Bool)

(declare-fun call!45664 () ListLongMap!14615)

(assert (=> b!1077309 (= e!615850 call!45664)))

(declare-fun b!1077310 () Bool)

(declare-fun apply!950 (ListLongMap!14615 (_ BitVec 64)) V!39841)

(assert (=> b!1077310 (= e!615853 (= (apply!950 lt!478270 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077311 () Bool)

(declare-fun e!615856 () ListLongMap!14615)

(assert (=> b!1077311 (= e!615856 call!45666)))

(declare-fun b!1077312 () Bool)

(declare-fun c!108565 () Bool)

(assert (=> b!1077312 (= c!108565 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077312 (= e!615856 e!615850)))

(declare-fun b!1077313 () Bool)

(assert (=> b!1077313 (= e!615855 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077314 () Bool)

(declare-fun res!717731 () Bool)

(assert (=> b!1077314 (=> (not res!717731) (not e!615861))))

(assert (=> b!1077314 (= res!717731 e!615851)))

(declare-fun c!108563 () Bool)

(assert (=> b!1077314 (= c!108563 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077315 () Bool)

(assert (=> b!1077315 (= e!615857 (+!3250 call!45662 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1077316 () Bool)

(declare-fun Unit!35400 () Unit!35394)

(assert (=> b!1077316 (= e!615858 Unit!35400)))

(declare-fun bm!45661 () Bool)

(assert (=> bm!45661 (= call!45664 call!45663)))

(declare-fun bm!45662 () Bool)

(assert (=> bm!45662 (= call!45668 (contains!6378 lt!478270 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077317 () Bool)

(assert (=> b!1077317 (= e!615852 (not call!45668))))

(declare-fun c!108560 () Bool)

(declare-fun bm!45663 () Bool)

(assert (=> bm!45663 (= call!45662 (+!3250 (ite c!108562 call!45665 (ite c!108560 call!45663 call!45664)) (ite (or c!108562 c!108560) (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077318 () Bool)

(declare-fun e!615859 () Bool)

(assert (=> b!1077318 (= e!615851 e!615859)))

(declare-fun res!717734 () Bool)

(assert (=> b!1077318 (= res!717734 call!45667)))

(assert (=> b!1077318 (=> (not res!717734) (not e!615859))))

(declare-fun b!1077319 () Bool)

(declare-fun lt!478282 () Unit!35394)

(assert (=> b!1077319 (= e!615858 lt!478282)))

(declare-fun lt!478280 () ListLongMap!14615)

(assert (=> b!1077319 (= lt!478280 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478289 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478290 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478290 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478287 () Unit!35394)

(declare-fun addStillContains!654 (ListLongMap!14615 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35394)

(assert (=> b!1077319 (= lt!478287 (addStillContains!654 lt!478280 lt!478289 zeroValueBefore!47 lt!478290))))

(assert (=> b!1077319 (contains!6378 (+!3250 lt!478280 (tuple2!16639 lt!478289 zeroValueBefore!47)) lt!478290)))

(declare-fun lt!478272 () Unit!35394)

(assert (=> b!1077319 (= lt!478272 lt!478287)))

(declare-fun lt!478291 () ListLongMap!14615)

(assert (=> b!1077319 (= lt!478291 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478281 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478274 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478274 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478283 () Unit!35394)

(declare-fun addApplyDifferent!510 (ListLongMap!14615 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35394)

(assert (=> b!1077319 (= lt!478283 (addApplyDifferent!510 lt!478291 lt!478281 minValue!907 lt!478274))))

(assert (=> b!1077319 (= (apply!950 (+!3250 lt!478291 (tuple2!16639 lt!478281 minValue!907)) lt!478274) (apply!950 lt!478291 lt!478274))))

(declare-fun lt!478286 () Unit!35394)

(assert (=> b!1077319 (= lt!478286 lt!478283)))

(declare-fun lt!478288 () ListLongMap!14615)

(assert (=> b!1077319 (= lt!478288 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478284 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478279 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478279 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478276 () Unit!35394)

(assert (=> b!1077319 (= lt!478276 (addApplyDifferent!510 lt!478288 lt!478284 zeroValueBefore!47 lt!478279))))

(assert (=> b!1077319 (= (apply!950 (+!3250 lt!478288 (tuple2!16639 lt!478284 zeroValueBefore!47)) lt!478279) (apply!950 lt!478288 lt!478279))))

(declare-fun lt!478285 () Unit!35394)

(assert (=> b!1077319 (= lt!478285 lt!478276)))

(declare-fun lt!478278 () ListLongMap!14615)

(assert (=> b!1077319 (= lt!478278 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478271 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478271 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478275 () (_ BitVec 64))

(assert (=> b!1077319 (= lt!478275 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077319 (= lt!478282 (addApplyDifferent!510 lt!478278 lt!478271 minValue!907 lt!478275))))

(assert (=> b!1077319 (= (apply!950 (+!3250 lt!478278 (tuple2!16639 lt!478271 minValue!907)) lt!478275) (apply!950 lt!478278 lt!478275))))

(declare-fun b!1077320 () Bool)

(declare-fun get!17272 (ValueCell!12311 V!39841) V!39841)

(declare-fun dynLambda!2065 (Int (_ BitVec 64)) V!39841)

(assert (=> b!1077320 (= e!615854 (= (apply!950 lt!478270 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33752 _values!955)))))

(assert (=> b!1077320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun bm!45664 () Bool)

(assert (=> bm!45664 (= call!45667 (contains!6378 lt!478270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45665 () Bool)

(assert (=> bm!45665 (= call!45665 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077321 () Bool)

(assert (=> b!1077321 (= e!615857 e!615856)))

(assert (=> b!1077321 (= c!108560 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077322 () Bool)

(assert (=> b!1077322 (= e!615849 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077323 () Bool)

(assert (=> b!1077323 (= e!615859 (= (apply!950 lt!478270 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(assert (= (and d!130115 c!108562) b!1077315))

(assert (= (and d!130115 (not c!108562)) b!1077321))

(assert (= (and b!1077321 c!108560) b!1077311))

(assert (= (and b!1077321 (not c!108560)) b!1077312))

(assert (= (and b!1077312 c!108565) b!1077307))

(assert (= (and b!1077312 (not c!108565)) b!1077309))

(assert (= (or b!1077307 b!1077309) bm!45661))

(assert (= (or b!1077311 bm!45661) bm!45660))

(assert (= (or b!1077311 b!1077307) bm!45659))

(assert (= (or b!1077315 bm!45660) bm!45665))

(assert (= (or b!1077315 bm!45659) bm!45663))

(assert (= (and d!130115 res!717728) b!1077313))

(assert (= (and d!130115 c!108561) b!1077319))

(assert (= (and d!130115 (not c!108561)) b!1077316))

(assert (= (and d!130115 res!717735) b!1077305))

(assert (= (and b!1077305 res!717730) b!1077322))

(assert (= (and b!1077305 (not res!717733)) b!1077303))

(assert (= (and b!1077303 res!717732) b!1077320))

(assert (= (and b!1077305 res!717727) b!1077314))

(assert (= (and b!1077314 c!108563) b!1077318))

(assert (= (and b!1077314 (not c!108563)) b!1077308))

(assert (= (and b!1077318 res!717734) b!1077323))

(assert (= (or b!1077318 b!1077308) bm!45664))

(assert (= (and b!1077314 res!717731) b!1077304))

(assert (= (and b!1077304 c!108564) b!1077306))

(assert (= (and b!1077304 (not c!108564)) b!1077317))

(assert (= (and b!1077306 res!717729) b!1077310))

(assert (= (or b!1077306 b!1077317) bm!45662))

(declare-fun b_lambda!16935 () Bool)

(assert (=> (not b_lambda!16935) (not b!1077320)))

(declare-fun t!32541 () Bool)

(declare-fun tb!7169 () Bool)

(assert (=> (and start!95416 (= defaultEntry!963 defaultEntry!963) t!32541) tb!7169))

(declare-fun result!14831 () Bool)

(assert (=> tb!7169 (= result!14831 tp_is_empty!26029)))

(assert (=> b!1077320 t!32541))

(declare-fun b_and!35189 () Bool)

(assert (= b_and!35183 (and (=> t!32541 result!14831) b_and!35189)))

(assert (=> b!1077313 m!996445))

(assert (=> b!1077313 m!996445))

(assert (=> b!1077313 m!996453))

(assert (=> b!1077322 m!996445))

(assert (=> b!1077322 m!996445))

(assert (=> b!1077322 m!996453))

(declare-fun m!996455 () Bool)

(assert (=> bm!45663 m!996455))

(assert (=> b!1077303 m!996445))

(assert (=> b!1077303 m!996445))

(declare-fun m!996457 () Bool)

(assert (=> b!1077303 m!996457))

(assert (=> bm!45665 m!996381))

(declare-fun m!996459 () Bool)

(assert (=> b!1077315 m!996459))

(declare-fun m!996461 () Bool)

(assert (=> bm!45662 m!996461))

(declare-fun m!996463 () Bool)

(assert (=> bm!45664 m!996463))

(declare-fun m!996465 () Bool)

(assert (=> b!1077323 m!996465))

(declare-fun m!996467 () Bool)

(assert (=> b!1077319 m!996467))

(declare-fun m!996469 () Bool)

(assert (=> b!1077319 m!996469))

(assert (=> b!1077319 m!996445))

(declare-fun m!996471 () Bool)

(assert (=> b!1077319 m!996471))

(declare-fun m!996473 () Bool)

(assert (=> b!1077319 m!996473))

(assert (=> b!1077319 m!996381))

(declare-fun m!996475 () Bool)

(assert (=> b!1077319 m!996475))

(declare-fun m!996477 () Bool)

(assert (=> b!1077319 m!996477))

(declare-fun m!996479 () Bool)

(assert (=> b!1077319 m!996479))

(declare-fun m!996481 () Bool)

(assert (=> b!1077319 m!996481))

(declare-fun m!996483 () Bool)

(assert (=> b!1077319 m!996483))

(declare-fun m!996485 () Bool)

(assert (=> b!1077319 m!996485))

(assert (=> b!1077319 m!996479))

(declare-fun m!996487 () Bool)

(assert (=> b!1077319 m!996487))

(assert (=> b!1077319 m!996467))

(declare-fun m!996489 () Bool)

(assert (=> b!1077319 m!996489))

(declare-fun m!996491 () Bool)

(assert (=> b!1077319 m!996491))

(declare-fun m!996493 () Bool)

(assert (=> b!1077319 m!996493))

(assert (=> b!1077319 m!996489))

(assert (=> b!1077319 m!996493))

(declare-fun m!996495 () Bool)

(assert (=> b!1077319 m!996495))

(assert (=> b!1077320 m!996445))

(declare-fun m!996497 () Bool)

(assert (=> b!1077320 m!996497))

(declare-fun m!996499 () Bool)

(assert (=> b!1077320 m!996499))

(declare-fun m!996501 () Bool)

(assert (=> b!1077320 m!996501))

(assert (=> b!1077320 m!996497))

(assert (=> b!1077320 m!996499))

(assert (=> b!1077320 m!996445))

(declare-fun m!996503 () Bool)

(assert (=> b!1077320 m!996503))

(assert (=> d!130115 m!996371))

(declare-fun m!996505 () Bool)

(assert (=> b!1077310 m!996505))

(assert (=> b!1077186 d!130115))

(declare-fun d!130117 () Bool)

(declare-fun e!615864 () Bool)

(assert (=> d!130117 e!615864))

(declare-fun res!717740 () Bool)

(assert (=> d!130117 (=> (not res!717740) (not e!615864))))

(declare-fun lt!478300 () ListLongMap!14615)

(assert (=> d!130117 (= res!717740 (contains!6378 lt!478300 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!478303 () List!23187)

(assert (=> d!130117 (= lt!478300 (ListLongMap!14616 lt!478303))))

(declare-fun lt!478302 () Unit!35394)

(declare-fun lt!478301 () Unit!35394)

(assert (=> d!130117 (= lt!478302 lt!478301)))

(declare-datatypes ((Option!660 0))(
  ( (Some!659 (v!15690 V!39841)) (None!658) )
))
(declare-fun getValueByKey!609 (List!23187 (_ BitVec 64)) Option!660)

(assert (=> d!130117 (= (getValueByKey!609 lt!478303 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!659 (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!291 (List!23187 (_ BitVec 64) V!39841) Unit!35394)

(assert (=> d!130117 (= lt!478301 (lemmaContainsTupThenGetReturnValue!291 lt!478303 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!384 (List!23187 (_ BitVec 64) V!39841) List!23187)

(assert (=> d!130117 (= lt!478303 (insertStrictlySorted!384 (toList!7323 (+!3250 lt!478197 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!130117 (= (+!3250 (+!3250 lt!478197 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!478300)))

(declare-fun b!1077330 () Bool)

(declare-fun res!717741 () Bool)

(assert (=> b!1077330 (=> (not res!717741) (not e!615864))))

(assert (=> b!1077330 (= res!717741 (= (getValueByKey!609 (toList!7323 lt!478300) (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!659 (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1077331 () Bool)

(declare-fun contains!6379 (List!23187 tuple2!16638) Bool)

(assert (=> b!1077331 (= e!615864 (contains!6379 (toList!7323 lt!478300) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!130117 res!717740) b!1077330))

(assert (= (and b!1077330 res!717741) b!1077331))

(declare-fun m!996507 () Bool)

(assert (=> d!130117 m!996507))

(declare-fun m!996509 () Bool)

(assert (=> d!130117 m!996509))

(declare-fun m!996511 () Bool)

(assert (=> d!130117 m!996511))

(declare-fun m!996513 () Bool)

(assert (=> d!130117 m!996513))

(declare-fun m!996515 () Bool)

(assert (=> b!1077330 m!996515))

(declare-fun m!996517 () Bool)

(assert (=> b!1077331 m!996517))

(assert (=> b!1077186 d!130117))

(declare-fun d!130119 () Bool)

(declare-fun e!615865 () Bool)

(assert (=> d!130119 e!615865))

(declare-fun res!717742 () Bool)

(assert (=> d!130119 (=> (not res!717742) (not e!615865))))

(declare-fun lt!478304 () ListLongMap!14615)

(assert (=> d!130119 (= res!717742 (contains!6378 lt!478304 (_1!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!478307 () List!23187)

(assert (=> d!130119 (= lt!478304 (ListLongMap!14616 lt!478307))))

(declare-fun lt!478306 () Unit!35394)

(declare-fun lt!478305 () Unit!35394)

(assert (=> d!130119 (= lt!478306 lt!478305)))

(assert (=> d!130119 (= (getValueByKey!609 lt!478307 (_1!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130119 (= lt!478305 (lemmaContainsTupThenGetReturnValue!291 lt!478307 (_1!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130119 (= lt!478307 (insertStrictlySorted!384 (toList!7323 lt!478197) (_1!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130119 (= (+!3250 lt!478197 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!478304)))

(declare-fun b!1077332 () Bool)

(declare-fun res!717743 () Bool)

(assert (=> b!1077332 (=> (not res!717743) (not e!615865))))

(assert (=> b!1077332 (= res!717743 (= (getValueByKey!609 (toList!7323 lt!478304) (_1!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8330 (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1077333 () Bool)

(assert (=> b!1077333 (= e!615865 (contains!6379 (toList!7323 lt!478304) (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!130119 res!717742) b!1077332))

(assert (= (and b!1077332 res!717743) b!1077333))

(declare-fun m!996519 () Bool)

(assert (=> d!130119 m!996519))

(declare-fun m!996521 () Bool)

(assert (=> d!130119 m!996521))

(declare-fun m!996523 () Bool)

(assert (=> d!130119 m!996523))

(declare-fun m!996525 () Bool)

(assert (=> d!130119 m!996525))

(declare-fun m!996527 () Bool)

(assert (=> b!1077332 m!996527))

(declare-fun m!996529 () Bool)

(assert (=> b!1077333 m!996529))

(assert (=> b!1077186 d!130119))

(declare-fun b!1077334 () Bool)

(declare-fun e!615877 () Bool)

(declare-fun e!615871 () Bool)

(assert (=> b!1077334 (= e!615877 e!615871)))

(declare-fun res!717749 () Bool)

(assert (=> b!1077334 (=> (not res!717749) (not e!615871))))

(declare-fun lt!478308 () ListLongMap!14615)

(assert (=> b!1077334 (= res!717749 (contains!6378 lt!478308 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun b!1077335 () Bool)

(declare-fun e!615878 () Bool)

(declare-fun e!615869 () Bool)

(assert (=> b!1077335 (= e!615878 e!615869)))

(declare-fun c!108570 () Bool)

(assert (=> b!1077335 (= c!108570 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130121 () Bool)

(assert (=> d!130121 e!615878))

(declare-fun res!717752 () Bool)

(assert (=> d!130121 (=> (not res!717752) (not e!615878))))

(assert (=> d!130121 (= res!717752 (or (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))))

(declare-fun lt!478315 () ListLongMap!14615)

(assert (=> d!130121 (= lt!478308 lt!478315)))

(declare-fun lt!478311 () Unit!35394)

(declare-fun e!615875 () Unit!35394)

(assert (=> d!130121 (= lt!478311 e!615875)))

(declare-fun c!108567 () Bool)

(declare-fun e!615872 () Bool)

(assert (=> d!130121 (= c!108567 e!615872)))

(declare-fun res!717745 () Bool)

(assert (=> d!130121 (=> (not res!717745) (not e!615872))))

(assert (=> d!130121 (= res!717745 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun e!615874 () ListLongMap!14615)

(assert (=> d!130121 (= lt!478315 e!615874)))

(declare-fun c!108568 () Bool)

(assert (=> d!130121 (= c!108568 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130121 (validMask!0 mask!1515)))

(assert (=> d!130121 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478308)))

(declare-fun b!1077336 () Bool)

(declare-fun res!717744 () Bool)

(assert (=> b!1077336 (=> (not res!717744) (not e!615878))))

(assert (=> b!1077336 (= res!717744 e!615877)))

(declare-fun res!717750 () Bool)

(assert (=> b!1077336 (=> res!717750 e!615877)))

(declare-fun e!615866 () Bool)

(assert (=> b!1077336 (= res!717750 (not e!615866))))

(declare-fun res!717747 () Bool)

(assert (=> b!1077336 (=> (not res!717747) (not e!615866))))

(assert (=> b!1077336 (= res!717747 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun bm!45666 () Bool)

(declare-fun call!45673 () ListLongMap!14615)

(declare-fun call!45669 () ListLongMap!14615)

(assert (=> bm!45666 (= call!45673 call!45669)))

(declare-fun b!1077337 () Bool)

(declare-fun e!615870 () Bool)

(assert (=> b!1077337 (= e!615869 e!615870)))

(declare-fun res!717746 () Bool)

(declare-fun call!45675 () Bool)

(assert (=> b!1077337 (= res!717746 call!45675)))

(assert (=> b!1077337 (=> (not res!717746) (not e!615870))))

(declare-fun b!1077338 () Bool)

(declare-fun e!615867 () ListLongMap!14615)

(assert (=> b!1077338 (= e!615867 call!45673)))

(declare-fun b!1077339 () Bool)

(declare-fun e!615868 () Bool)

(declare-fun call!45674 () Bool)

(assert (=> b!1077339 (= e!615868 (not call!45674))))

(declare-fun bm!45667 () Bool)

(declare-fun call!45670 () ListLongMap!14615)

(declare-fun call!45672 () ListLongMap!14615)

(assert (=> bm!45667 (= call!45670 call!45672)))

(declare-fun b!1077340 () Bool)

(declare-fun call!45671 () ListLongMap!14615)

(assert (=> b!1077340 (= e!615867 call!45671)))

(declare-fun b!1077341 () Bool)

(assert (=> b!1077341 (= e!615870 (= (apply!950 lt!478308 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077342 () Bool)

(declare-fun e!615873 () ListLongMap!14615)

(assert (=> b!1077342 (= e!615873 call!45673)))

(declare-fun b!1077343 () Bool)

(declare-fun c!108571 () Bool)

(assert (=> b!1077343 (= c!108571 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077343 (= e!615873 e!615867)))

(declare-fun b!1077344 () Bool)

(assert (=> b!1077344 (= e!615872 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077345 () Bool)

(declare-fun res!717748 () Bool)

(assert (=> b!1077345 (=> (not res!717748) (not e!615878))))

(assert (=> b!1077345 (= res!717748 e!615868)))

(declare-fun c!108569 () Bool)

(assert (=> b!1077345 (= c!108569 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077346 () Bool)

(assert (=> b!1077346 (= e!615874 (+!3250 call!45669 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1077347 () Bool)

(declare-fun Unit!35401 () Unit!35394)

(assert (=> b!1077347 (= e!615875 Unit!35401)))

(declare-fun bm!45668 () Bool)

(assert (=> bm!45668 (= call!45671 call!45670)))

(declare-fun bm!45669 () Bool)

(assert (=> bm!45669 (= call!45675 (contains!6378 lt!478308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077348 () Bool)

(assert (=> b!1077348 (= e!615869 (not call!45675))))

(declare-fun c!108566 () Bool)

(declare-fun bm!45670 () Bool)

(assert (=> bm!45670 (= call!45669 (+!3250 (ite c!108568 call!45672 (ite c!108566 call!45670 call!45671)) (ite (or c!108568 c!108566) (tuple2!16639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077349 () Bool)

(declare-fun e!615876 () Bool)

(assert (=> b!1077349 (= e!615868 e!615876)))

(declare-fun res!717751 () Bool)

(assert (=> b!1077349 (= res!717751 call!45674)))

(assert (=> b!1077349 (=> (not res!717751) (not e!615876))))

(declare-fun b!1077350 () Bool)

(declare-fun lt!478320 () Unit!35394)

(assert (=> b!1077350 (= e!615875 lt!478320)))

(declare-fun lt!478318 () ListLongMap!14615)

(assert (=> b!1077350 (= lt!478318 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478327 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478328 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478328 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478325 () Unit!35394)

(assert (=> b!1077350 (= lt!478325 (addStillContains!654 lt!478318 lt!478327 zeroValueAfter!47 lt!478328))))

(assert (=> b!1077350 (contains!6378 (+!3250 lt!478318 (tuple2!16639 lt!478327 zeroValueAfter!47)) lt!478328)))

(declare-fun lt!478310 () Unit!35394)

(assert (=> b!1077350 (= lt!478310 lt!478325)))

(declare-fun lt!478329 () ListLongMap!14615)

(assert (=> b!1077350 (= lt!478329 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478319 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478319 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478312 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478312 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478321 () Unit!35394)

(assert (=> b!1077350 (= lt!478321 (addApplyDifferent!510 lt!478329 lt!478319 minValue!907 lt!478312))))

(assert (=> b!1077350 (= (apply!950 (+!3250 lt!478329 (tuple2!16639 lt!478319 minValue!907)) lt!478312) (apply!950 lt!478329 lt!478312))))

(declare-fun lt!478324 () Unit!35394)

(assert (=> b!1077350 (= lt!478324 lt!478321)))

(declare-fun lt!478326 () ListLongMap!14615)

(assert (=> b!1077350 (= lt!478326 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478322 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478317 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478317 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478314 () Unit!35394)

(assert (=> b!1077350 (= lt!478314 (addApplyDifferent!510 lt!478326 lt!478322 zeroValueAfter!47 lt!478317))))

(assert (=> b!1077350 (= (apply!950 (+!3250 lt!478326 (tuple2!16639 lt!478322 zeroValueAfter!47)) lt!478317) (apply!950 lt!478326 lt!478317))))

(declare-fun lt!478323 () Unit!35394)

(assert (=> b!1077350 (= lt!478323 lt!478314)))

(declare-fun lt!478316 () ListLongMap!14615)

(assert (=> b!1077350 (= lt!478316 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478309 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478309 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478313 () (_ BitVec 64))

(assert (=> b!1077350 (= lt!478313 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077350 (= lt!478320 (addApplyDifferent!510 lt!478316 lt!478309 minValue!907 lt!478313))))

(assert (=> b!1077350 (= (apply!950 (+!3250 lt!478316 (tuple2!16639 lt!478309 minValue!907)) lt!478313) (apply!950 lt!478316 lt!478313))))

(declare-fun b!1077351 () Bool)

(assert (=> b!1077351 (= e!615871 (= (apply!950 lt!478308 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33752 _values!955)))))

(assert (=> b!1077351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun bm!45671 () Bool)

(assert (=> bm!45671 (= call!45674 (contains!6378 lt!478308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45672 () Bool)

(assert (=> bm!45672 (= call!45672 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077352 () Bool)

(assert (=> b!1077352 (= e!615874 e!615873)))

(assert (=> b!1077352 (= c!108566 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077353 () Bool)

(assert (=> b!1077353 (= e!615866 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077354 () Bool)

(assert (=> b!1077354 (= e!615876 (= (apply!950 lt!478308 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(assert (= (and d!130121 c!108568) b!1077346))

(assert (= (and d!130121 (not c!108568)) b!1077352))

(assert (= (and b!1077352 c!108566) b!1077342))

(assert (= (and b!1077352 (not c!108566)) b!1077343))

(assert (= (and b!1077343 c!108571) b!1077338))

(assert (= (and b!1077343 (not c!108571)) b!1077340))

(assert (= (or b!1077338 b!1077340) bm!45668))

(assert (= (or b!1077342 bm!45668) bm!45667))

(assert (= (or b!1077342 b!1077338) bm!45666))

(assert (= (or b!1077346 bm!45667) bm!45672))

(assert (= (or b!1077346 bm!45666) bm!45670))

(assert (= (and d!130121 res!717745) b!1077344))

(assert (= (and d!130121 c!108567) b!1077350))

(assert (= (and d!130121 (not c!108567)) b!1077347))

(assert (= (and d!130121 res!717752) b!1077336))

(assert (= (and b!1077336 res!717747) b!1077353))

(assert (= (and b!1077336 (not res!717750)) b!1077334))

(assert (= (and b!1077334 res!717749) b!1077351))

(assert (= (and b!1077336 res!717744) b!1077345))

(assert (= (and b!1077345 c!108569) b!1077349))

(assert (= (and b!1077345 (not c!108569)) b!1077339))

(assert (= (and b!1077349 res!717751) b!1077354))

(assert (= (or b!1077349 b!1077339) bm!45671))

(assert (= (and b!1077345 res!717748) b!1077335))

(assert (= (and b!1077335 c!108570) b!1077337))

(assert (= (and b!1077335 (not c!108570)) b!1077348))

(assert (= (and b!1077337 res!717746) b!1077341))

(assert (= (or b!1077337 b!1077348) bm!45669))

(declare-fun b_lambda!16937 () Bool)

(assert (=> (not b_lambda!16937) (not b!1077351)))

(assert (=> b!1077351 t!32541))

(declare-fun b_and!35191 () Bool)

(assert (= b_and!35189 (and (=> t!32541 result!14831) b_and!35191)))

(assert (=> b!1077344 m!996445))

(assert (=> b!1077344 m!996445))

(assert (=> b!1077344 m!996453))

(assert (=> b!1077353 m!996445))

(assert (=> b!1077353 m!996445))

(assert (=> b!1077353 m!996453))

(declare-fun m!996531 () Bool)

(assert (=> bm!45670 m!996531))

(assert (=> b!1077334 m!996445))

(assert (=> b!1077334 m!996445))

(declare-fun m!996533 () Bool)

(assert (=> b!1077334 m!996533))

(assert (=> bm!45672 m!996379))

(declare-fun m!996535 () Bool)

(assert (=> b!1077346 m!996535))

(declare-fun m!996537 () Bool)

(assert (=> bm!45669 m!996537))

(declare-fun m!996539 () Bool)

(assert (=> bm!45671 m!996539))

(declare-fun m!996541 () Bool)

(assert (=> b!1077354 m!996541))

(declare-fun m!996543 () Bool)

(assert (=> b!1077350 m!996543))

(declare-fun m!996545 () Bool)

(assert (=> b!1077350 m!996545))

(assert (=> b!1077350 m!996445))

(declare-fun m!996547 () Bool)

(assert (=> b!1077350 m!996547))

(declare-fun m!996549 () Bool)

(assert (=> b!1077350 m!996549))

(assert (=> b!1077350 m!996379))

(declare-fun m!996551 () Bool)

(assert (=> b!1077350 m!996551))

(declare-fun m!996553 () Bool)

(assert (=> b!1077350 m!996553))

(declare-fun m!996555 () Bool)

(assert (=> b!1077350 m!996555))

(declare-fun m!996557 () Bool)

(assert (=> b!1077350 m!996557))

(declare-fun m!996559 () Bool)

(assert (=> b!1077350 m!996559))

(declare-fun m!996561 () Bool)

(assert (=> b!1077350 m!996561))

(assert (=> b!1077350 m!996555))

(declare-fun m!996563 () Bool)

(assert (=> b!1077350 m!996563))

(assert (=> b!1077350 m!996543))

(declare-fun m!996565 () Bool)

(assert (=> b!1077350 m!996565))

(declare-fun m!996567 () Bool)

(assert (=> b!1077350 m!996567))

(declare-fun m!996569 () Bool)

(assert (=> b!1077350 m!996569))

(assert (=> b!1077350 m!996565))

(assert (=> b!1077350 m!996569))

(declare-fun m!996571 () Bool)

(assert (=> b!1077350 m!996571))

(assert (=> b!1077351 m!996445))

(assert (=> b!1077351 m!996497))

(assert (=> b!1077351 m!996499))

(assert (=> b!1077351 m!996501))

(assert (=> b!1077351 m!996497))

(assert (=> b!1077351 m!996499))

(assert (=> b!1077351 m!996445))

(declare-fun m!996573 () Bool)

(assert (=> b!1077351 m!996573))

(assert (=> d!130121 m!996371))

(declare-fun m!996575 () Bool)

(assert (=> b!1077341 m!996575))

(assert (=> b!1077181 d!130121))

(declare-fun d!130123 () Bool)

(declare-fun e!615879 () Bool)

(assert (=> d!130123 e!615879))

(declare-fun res!717753 () Bool)

(assert (=> d!130123 (=> (not res!717753) (not e!615879))))

(declare-fun lt!478330 () ListLongMap!14615)

(assert (=> d!130123 (= res!717753 (contains!6378 lt!478330 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!478333 () List!23187)

(assert (=> d!130123 (= lt!478330 (ListLongMap!14616 lt!478333))))

(declare-fun lt!478332 () Unit!35394)

(declare-fun lt!478331 () Unit!35394)

(assert (=> d!130123 (= lt!478332 lt!478331)))

(assert (=> d!130123 (= (getValueByKey!609 lt!478333 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!659 (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!130123 (= lt!478331 (lemmaContainsTupThenGetReturnValue!291 lt!478333 (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!130123 (= lt!478333 (insertStrictlySorted!384 (toList!7323 lt!478198) (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!130123 (= (+!3250 lt!478198 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!478330)))

(declare-fun b!1077355 () Bool)

(declare-fun res!717754 () Bool)

(assert (=> b!1077355 (=> (not res!717754) (not e!615879))))

(assert (=> b!1077355 (= res!717754 (= (getValueByKey!609 (toList!7323 lt!478330) (_1!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!659 (_2!8330 (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1077356 () Bool)

(assert (=> b!1077356 (= e!615879 (contains!6379 (toList!7323 lt!478330) (tuple2!16639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!130123 res!717753) b!1077355))

(assert (= (and b!1077355 res!717754) b!1077356))

(declare-fun m!996577 () Bool)

(assert (=> d!130123 m!996577))

(declare-fun m!996579 () Bool)

(assert (=> d!130123 m!996579))

(declare-fun m!996581 () Bool)

(assert (=> d!130123 m!996581))

(declare-fun m!996583 () Bool)

(assert (=> d!130123 m!996583))

(declare-fun m!996585 () Bool)

(assert (=> b!1077355 m!996585))

(declare-fun m!996587 () Bool)

(assert (=> b!1077356 m!996587))

(assert (=> b!1077181 d!130123))

(declare-fun d!130125 () Bool)

(assert (=> d!130125 (= (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478336 () Unit!35394)

(declare-fun choose!1761 (array!69075 array!69073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 V!39841 V!39841 (_ BitVec 32) Int) Unit!35394)

(assert (=> d!130125 (= lt!478336 (choose!1761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130125 (validMask!0 mask!1515)))

(assert (=> d!130125 (= (lemmaNoChangeToArrayThenSameMapNoExtras!895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478336)))

(declare-fun bs!31713 () Bool)

(assert (= bs!31713 d!130125))

(assert (=> bs!31713 m!996381))

(assert (=> bs!31713 m!996379))

(declare-fun m!996589 () Bool)

(assert (=> bs!31713 m!996589))

(assert (=> bs!31713 m!996371))

(assert (=> b!1077185 d!130125))

(declare-fun b!1077381 () Bool)

(declare-fun e!615894 () Bool)

(declare-fun e!615898 () Bool)

(assert (=> b!1077381 (= e!615894 e!615898)))

(declare-fun c!108583 () Bool)

(assert (=> b!1077381 (= c!108583 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun lt!478356 () ListLongMap!14615)

(declare-fun b!1077382 () Bool)

(assert (=> b!1077382 (= e!615898 (= lt!478356 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077383 () Bool)

(declare-fun e!615897 () ListLongMap!14615)

(declare-fun e!615895 () ListLongMap!14615)

(assert (=> b!1077383 (= e!615897 e!615895)))

(declare-fun c!108581 () Bool)

(assert (=> b!1077383 (= c!108581 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077384 () Bool)

(declare-fun lt!478355 () Unit!35394)

(declare-fun lt!478351 () Unit!35394)

(assert (=> b!1077384 (= lt!478355 lt!478351)))

(declare-fun lt!478353 () (_ BitVec 64))

(declare-fun lt!478354 () V!39841)

(declare-fun lt!478352 () ListLongMap!14615)

(declare-fun lt!478357 () (_ BitVec 64))

(assert (=> b!1077384 (not (contains!6378 (+!3250 lt!478352 (tuple2!16639 lt!478353 lt!478354)) lt!478357))))

(declare-fun addStillNotContains!271 (ListLongMap!14615 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35394)

(assert (=> b!1077384 (= lt!478351 (addStillNotContains!271 lt!478352 lt!478353 lt!478354 lt!478357))))

(assert (=> b!1077384 (= lt!478357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1077384 (= lt!478354 (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077384 (= lt!478353 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45678 () ListLongMap!14615)

(assert (=> b!1077384 (= lt!478352 call!45678)))

(assert (=> b!1077384 (= e!615895 (+!3250 call!45678 (tuple2!16639 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1077385 () Bool)

(assert (=> b!1077385 (= e!615895 call!45678)))

(declare-fun b!1077386 () Bool)

(assert (=> b!1077386 (= e!615897 (ListLongMap!14616 Nil!23184))))

(declare-fun d!130127 () Bool)

(declare-fun e!615896 () Bool)

(assert (=> d!130127 e!615896))

(declare-fun res!717764 () Bool)

(assert (=> d!130127 (=> (not res!717764) (not e!615896))))

(assert (=> d!130127 (= res!717764 (not (contains!6378 lt!478356 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130127 (= lt!478356 e!615897)))

(declare-fun c!108580 () Bool)

(assert (=> d!130127 (= c!108580 (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> d!130127 (validMask!0 mask!1515)))

(assert (=> d!130127 (= (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478356)))

(declare-fun b!1077387 () Bool)

(assert (=> b!1077387 (= e!615896 e!615894)))

(declare-fun c!108582 () Bool)

(declare-fun e!615899 () Bool)

(assert (=> b!1077387 (= c!108582 e!615899)))

(declare-fun res!717765 () Bool)

(assert (=> b!1077387 (=> (not res!717765) (not e!615899))))

(assert (=> b!1077387 (= res!717765 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun b!1077388 () Bool)

(declare-fun e!615900 () Bool)

(assert (=> b!1077388 (= e!615894 e!615900)))

(assert (=> b!1077388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun res!717763 () Bool)

(assert (=> b!1077388 (= res!717763 (contains!6378 lt!478356 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077388 (=> (not res!717763) (not e!615900))))

(declare-fun b!1077389 () Bool)

(declare-fun isEmpty!963 (ListLongMap!14615) Bool)

(assert (=> b!1077389 (= e!615898 (isEmpty!963 lt!478356))))

(declare-fun bm!45675 () Bool)

(assert (=> bm!45675 (= call!45678 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077390 () Bool)

(declare-fun res!717766 () Bool)

(assert (=> b!1077390 (=> (not res!717766) (not e!615896))))

(assert (=> b!1077390 (= res!717766 (not (contains!6378 lt!478356 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077391 () Bool)

(assert (=> b!1077391 (= e!615899 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077391 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1077392 () Bool)

(assert (=> b!1077392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> b!1077392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33752 _values!955)))))

(assert (=> b!1077392 (= e!615900 (= (apply!950 lt!478356 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!130127 c!108580) b!1077386))

(assert (= (and d!130127 (not c!108580)) b!1077383))

(assert (= (and b!1077383 c!108581) b!1077384))

(assert (= (and b!1077383 (not c!108581)) b!1077385))

(assert (= (or b!1077384 b!1077385) bm!45675))

(assert (= (and d!130127 res!717764) b!1077390))

(assert (= (and b!1077390 res!717766) b!1077387))

(assert (= (and b!1077387 res!717765) b!1077391))

(assert (= (and b!1077387 c!108582) b!1077388))

(assert (= (and b!1077387 (not c!108582)) b!1077381))

(assert (= (and b!1077388 res!717763) b!1077392))

(assert (= (and b!1077381 c!108583) b!1077382))

(assert (= (and b!1077381 (not c!108583)) b!1077389))

(declare-fun b_lambda!16939 () Bool)

(assert (=> (not b_lambda!16939) (not b!1077384)))

(assert (=> b!1077384 t!32541))

(declare-fun b_and!35193 () Bool)

(assert (= b_and!35191 (and (=> t!32541 result!14831) b_and!35193)))

(declare-fun b_lambda!16941 () Bool)

(assert (=> (not b_lambda!16941) (not b!1077392)))

(assert (=> b!1077392 t!32541))

(declare-fun b_and!35195 () Bool)

(assert (= b_and!35193 (and (=> t!32541 result!14831) b_and!35195)))

(declare-fun m!996591 () Bool)

(assert (=> b!1077382 m!996591))

(declare-fun m!996593 () Bool)

(assert (=> b!1077389 m!996593))

(declare-fun m!996595 () Bool)

(assert (=> b!1077384 m!996595))

(assert (=> b!1077384 m!996497))

(declare-fun m!996597 () Bool)

(assert (=> b!1077384 m!996597))

(assert (=> b!1077384 m!996497))

(assert (=> b!1077384 m!996499))

(assert (=> b!1077384 m!996501))

(assert (=> b!1077384 m!996595))

(declare-fun m!996599 () Bool)

(assert (=> b!1077384 m!996599))

(assert (=> b!1077384 m!996499))

(assert (=> b!1077384 m!996445))

(declare-fun m!996601 () Bool)

(assert (=> b!1077384 m!996601))

(assert (=> b!1077388 m!996445))

(assert (=> b!1077388 m!996445))

(declare-fun m!996603 () Bool)

(assert (=> b!1077388 m!996603))

(assert (=> bm!45675 m!996591))

(declare-fun m!996605 () Bool)

(assert (=> d!130127 m!996605))

(assert (=> d!130127 m!996371))

(assert (=> b!1077383 m!996445))

(assert (=> b!1077383 m!996445))

(assert (=> b!1077383 m!996453))

(assert (=> b!1077392 m!996497))

(assert (=> b!1077392 m!996497))

(assert (=> b!1077392 m!996499))

(assert (=> b!1077392 m!996501))

(assert (=> b!1077392 m!996499))

(assert (=> b!1077392 m!996445))

(assert (=> b!1077392 m!996445))

(declare-fun m!996607 () Bool)

(assert (=> b!1077392 m!996607))

(assert (=> b!1077391 m!996445))

(assert (=> b!1077391 m!996445))

(assert (=> b!1077391 m!996453))

(declare-fun m!996609 () Bool)

(assert (=> b!1077390 m!996609))

(assert (=> b!1077185 d!130127))

(declare-fun b!1077393 () Bool)

(declare-fun e!615901 () Bool)

(declare-fun e!615905 () Bool)

(assert (=> b!1077393 (= e!615901 e!615905)))

(declare-fun c!108587 () Bool)

(assert (=> b!1077393 (= c!108587 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun lt!478363 () ListLongMap!14615)

(declare-fun b!1077394 () Bool)

(assert (=> b!1077394 (= e!615905 (= lt!478363 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077395 () Bool)

(declare-fun e!615904 () ListLongMap!14615)

(declare-fun e!615902 () ListLongMap!14615)

(assert (=> b!1077395 (= e!615904 e!615902)))

(declare-fun c!108585 () Bool)

(assert (=> b!1077395 (= c!108585 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077396 () Bool)

(declare-fun lt!478362 () Unit!35394)

(declare-fun lt!478358 () Unit!35394)

(assert (=> b!1077396 (= lt!478362 lt!478358)))

(declare-fun lt!478361 () V!39841)

(declare-fun lt!478359 () ListLongMap!14615)

(declare-fun lt!478364 () (_ BitVec 64))

(declare-fun lt!478360 () (_ BitVec 64))

(assert (=> b!1077396 (not (contains!6378 (+!3250 lt!478359 (tuple2!16639 lt!478360 lt!478361)) lt!478364))))

(assert (=> b!1077396 (= lt!478358 (addStillNotContains!271 lt!478359 lt!478360 lt!478361 lt!478364))))

(assert (=> b!1077396 (= lt!478364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1077396 (= lt!478361 (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077396 (= lt!478360 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45679 () ListLongMap!14615)

(assert (=> b!1077396 (= lt!478359 call!45679)))

(assert (=> b!1077396 (= e!615902 (+!3250 call!45679 (tuple2!16639 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1077397 () Bool)

(assert (=> b!1077397 (= e!615902 call!45679)))

(declare-fun b!1077398 () Bool)

(assert (=> b!1077398 (= e!615904 (ListLongMap!14616 Nil!23184))))

(declare-fun d!130129 () Bool)

(declare-fun e!615903 () Bool)

(assert (=> d!130129 e!615903))

(declare-fun res!717768 () Bool)

(assert (=> d!130129 (=> (not res!717768) (not e!615903))))

(assert (=> d!130129 (= res!717768 (not (contains!6378 lt!478363 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130129 (= lt!478363 e!615904)))

(declare-fun c!108584 () Bool)

(assert (=> d!130129 (= c!108584 (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> d!130129 (validMask!0 mask!1515)))

(assert (=> d!130129 (= (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478363)))

(declare-fun b!1077399 () Bool)

(assert (=> b!1077399 (= e!615903 e!615901)))

(declare-fun c!108586 () Bool)

(declare-fun e!615906 () Bool)

(assert (=> b!1077399 (= c!108586 e!615906)))

(declare-fun res!717769 () Bool)

(assert (=> b!1077399 (=> (not res!717769) (not e!615906))))

(assert (=> b!1077399 (= res!717769 (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun b!1077400 () Bool)

(declare-fun e!615907 () Bool)

(assert (=> b!1077400 (= e!615901 e!615907)))

(assert (=> b!1077400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(declare-fun res!717767 () Bool)

(assert (=> b!1077400 (= res!717767 (contains!6378 lt!478363 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077400 (=> (not res!717767) (not e!615907))))

(declare-fun b!1077401 () Bool)

(assert (=> b!1077401 (= e!615905 (isEmpty!963 lt!478363))))

(declare-fun bm!45676 () Bool)

(assert (=> bm!45676 (= call!45679 (getCurrentListMapNoExtraKeys!3915 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077402 () Bool)

(declare-fun res!717770 () Bool)

(assert (=> b!1077402 (=> (not res!717770) (not e!615903))))

(assert (=> b!1077402 (= res!717770 (not (contains!6378 lt!478363 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077403 () Bool)

(assert (=> b!1077403 (= e!615906 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077403 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1077404 () Bool)

(assert (=> b!1077404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> b!1077404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33752 _values!955)))))

(assert (=> b!1077404 (= e!615907 (= (apply!950 lt!478363 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)) (get!17272 (select (arr!33215 _values!955) #b00000000000000000000000000000000) (dynLambda!2065 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!130129 c!108584) b!1077398))

(assert (= (and d!130129 (not c!108584)) b!1077395))

(assert (= (and b!1077395 c!108585) b!1077396))

(assert (= (and b!1077395 (not c!108585)) b!1077397))

(assert (= (or b!1077396 b!1077397) bm!45676))

(assert (= (and d!130129 res!717768) b!1077402))

(assert (= (and b!1077402 res!717770) b!1077399))

(assert (= (and b!1077399 res!717769) b!1077403))

(assert (= (and b!1077399 c!108586) b!1077400))

(assert (= (and b!1077399 (not c!108586)) b!1077393))

(assert (= (and b!1077400 res!717767) b!1077404))

(assert (= (and b!1077393 c!108587) b!1077394))

(assert (= (and b!1077393 (not c!108587)) b!1077401))

(declare-fun b_lambda!16943 () Bool)

(assert (=> (not b_lambda!16943) (not b!1077396)))

(assert (=> b!1077396 t!32541))

(declare-fun b_and!35197 () Bool)

(assert (= b_and!35195 (and (=> t!32541 result!14831) b_and!35197)))

(declare-fun b_lambda!16945 () Bool)

(assert (=> (not b_lambda!16945) (not b!1077404)))

(assert (=> b!1077404 t!32541))

(declare-fun b_and!35199 () Bool)

(assert (= b_and!35197 (and (=> t!32541 result!14831) b_and!35199)))

(declare-fun m!996611 () Bool)

(assert (=> b!1077394 m!996611))

(declare-fun m!996613 () Bool)

(assert (=> b!1077401 m!996613))

(declare-fun m!996615 () Bool)

(assert (=> b!1077396 m!996615))

(assert (=> b!1077396 m!996497))

(declare-fun m!996617 () Bool)

(assert (=> b!1077396 m!996617))

(assert (=> b!1077396 m!996497))

(assert (=> b!1077396 m!996499))

(assert (=> b!1077396 m!996501))

(assert (=> b!1077396 m!996615))

(declare-fun m!996619 () Bool)

(assert (=> b!1077396 m!996619))

(assert (=> b!1077396 m!996499))

(assert (=> b!1077396 m!996445))

(declare-fun m!996621 () Bool)

(assert (=> b!1077396 m!996621))

(assert (=> b!1077400 m!996445))

(assert (=> b!1077400 m!996445))

(declare-fun m!996623 () Bool)

(assert (=> b!1077400 m!996623))

(assert (=> bm!45676 m!996611))

(declare-fun m!996625 () Bool)

(assert (=> d!130129 m!996625))

(assert (=> d!130129 m!996371))

(assert (=> b!1077395 m!996445))

(assert (=> b!1077395 m!996445))

(assert (=> b!1077395 m!996453))

(assert (=> b!1077404 m!996497))

(assert (=> b!1077404 m!996497))

(assert (=> b!1077404 m!996499))

(assert (=> b!1077404 m!996501))

(assert (=> b!1077404 m!996499))

(assert (=> b!1077404 m!996445))

(assert (=> b!1077404 m!996445))

(declare-fun m!996627 () Bool)

(assert (=> b!1077404 m!996627))

(assert (=> b!1077403 m!996445))

(assert (=> b!1077403 m!996445))

(assert (=> b!1077403 m!996453))

(declare-fun m!996629 () Bool)

(assert (=> b!1077402 m!996629))

(assert (=> b!1077185 d!130129))

(declare-fun d!130131 () Bool)

(declare-fun res!717778 () Bool)

(declare-fun e!615917 () Bool)

(assert (=> d!130131 (=> res!717778 e!615917)))

(assert (=> d!130131 (= res!717778 (bvsge #b00000000000000000000000000000000 (size!33753 _keys!1163)))))

(assert (=> d!130131 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23185) e!615917)))

(declare-fun b!1077415 () Bool)

(declare-fun e!615918 () Bool)

(declare-fun contains!6380 (List!23188 (_ BitVec 64)) Bool)

(assert (=> b!1077415 (= e!615918 (contains!6380 Nil!23185 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077416 () Bool)

(declare-fun e!615916 () Bool)

(declare-fun e!615919 () Bool)

(assert (=> b!1077416 (= e!615916 e!615919)))

(declare-fun c!108590 () Bool)

(assert (=> b!1077416 (= c!108590 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077417 () Bool)

(declare-fun call!45682 () Bool)

(assert (=> b!1077417 (= e!615919 call!45682)))

(declare-fun b!1077418 () Bool)

(assert (=> b!1077418 (= e!615917 e!615916)))

(declare-fun res!717779 () Bool)

(assert (=> b!1077418 (=> (not res!717779) (not e!615916))))

(assert (=> b!1077418 (= res!717779 (not e!615918))))

(declare-fun res!717777 () Bool)

(assert (=> b!1077418 (=> (not res!717777) (not e!615918))))

(assert (=> b!1077418 (= res!717777 (validKeyInArray!0 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077419 () Bool)

(assert (=> b!1077419 (= e!615919 call!45682)))

(declare-fun bm!45679 () Bool)

(assert (=> bm!45679 (= call!45682 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108590 (Cons!23184 (select (arr!33216 _keys!1163) #b00000000000000000000000000000000) Nil!23185) Nil!23185)))))

(assert (= (and d!130131 (not res!717778)) b!1077418))

(assert (= (and b!1077418 res!717777) b!1077415))

(assert (= (and b!1077418 res!717779) b!1077416))

(assert (= (and b!1077416 c!108590) b!1077417))

(assert (= (and b!1077416 (not c!108590)) b!1077419))

(assert (= (or b!1077417 b!1077419) bm!45679))

(assert (=> b!1077415 m!996445))

(assert (=> b!1077415 m!996445))

(declare-fun m!996631 () Bool)

(assert (=> b!1077415 m!996631))

(assert (=> b!1077416 m!996445))

(assert (=> b!1077416 m!996445))

(assert (=> b!1077416 m!996453))

(assert (=> b!1077418 m!996445))

(assert (=> b!1077418 m!996445))

(assert (=> b!1077418 m!996453))

(assert (=> bm!45679 m!996445))

(declare-fun m!996633 () Bool)

(assert (=> bm!45679 m!996633))

(assert (=> b!1077182 d!130131))

(declare-fun condMapEmpty!40792 () Bool)

(declare-fun mapDefault!40792 () ValueCell!12311)

(assert (=> mapNonEmpty!40783 (= condMapEmpty!40792 (= mapRest!40783 ((as const (Array (_ BitVec 32) ValueCell!12311)) mapDefault!40792)))))

(declare-fun e!615924 () Bool)

(declare-fun mapRes!40792 () Bool)

(assert (=> mapNonEmpty!40783 (= tp!78148 (and e!615924 mapRes!40792))))

(declare-fun b!1077427 () Bool)

(assert (=> b!1077427 (= e!615924 tp_is_empty!26029)))

(declare-fun mapIsEmpty!40792 () Bool)

(assert (=> mapIsEmpty!40792 mapRes!40792))

(declare-fun b!1077426 () Bool)

(declare-fun e!615925 () Bool)

(assert (=> b!1077426 (= e!615925 tp_is_empty!26029)))

(declare-fun mapNonEmpty!40792 () Bool)

(declare-fun tp!78164 () Bool)

(assert (=> mapNonEmpty!40792 (= mapRes!40792 (and tp!78164 e!615925))))

(declare-fun mapKey!40792 () (_ BitVec 32))

(declare-fun mapValue!40792 () ValueCell!12311)

(declare-fun mapRest!40792 () (Array (_ BitVec 32) ValueCell!12311))

(assert (=> mapNonEmpty!40792 (= mapRest!40783 (store mapRest!40792 mapKey!40792 mapValue!40792))))

(assert (= (and mapNonEmpty!40783 condMapEmpty!40792) mapIsEmpty!40792))

(assert (= (and mapNonEmpty!40783 (not condMapEmpty!40792)) mapNonEmpty!40792))

(assert (= (and mapNonEmpty!40792 ((_ is ValueCellFull!12311) mapValue!40792)) b!1077426))

(assert (= (and mapNonEmpty!40783 ((_ is ValueCellFull!12311) mapDefault!40792)) b!1077427))

(declare-fun m!996635 () Bool)

(assert (=> mapNonEmpty!40792 m!996635))

(declare-fun b_lambda!16947 () Bool)

(assert (= b_lambda!16945 (or (and start!95416 b_free!22219) b_lambda!16947)))

(declare-fun b_lambda!16949 () Bool)

(assert (= b_lambda!16939 (or (and start!95416 b_free!22219) b_lambda!16949)))

(declare-fun b_lambda!16951 () Bool)

(assert (= b_lambda!16937 (or (and start!95416 b_free!22219) b_lambda!16951)))

(declare-fun b_lambda!16953 () Bool)

(assert (= b_lambda!16943 (or (and start!95416 b_free!22219) b_lambda!16953)))

(declare-fun b_lambda!16955 () Bool)

(assert (= b_lambda!16941 (or (and start!95416 b_free!22219) b_lambda!16955)))

(declare-fun b_lambda!16957 () Bool)

(assert (= b_lambda!16935 (or (and start!95416 b_free!22219) b_lambda!16957)))

(check-sat (not b!1077401) (not b!1077382) (not bm!45664) (not b!1077259) (not b!1077403) tp_is_empty!26029 (not bm!45676) (not b_lambda!16951) (not b!1077390) (not b!1077331) (not d!130121) (not b!1077355) (not b!1077320) (not b!1077315) (not d!130129) b_and!35199 (not bm!45671) (not b!1077346) (not b!1077396) (not bm!45669) (not b!1077350) (not b!1077313) (not bm!45679) (not b!1077334) (not d!130127) (not b!1077341) (not bm!45663) (not bm!45675) (not b_lambda!16947) (not b!1077415) (not d!130117) (not d!130123) (not b!1077323) (not mapNonEmpty!40792) (not bm!45662) (not b!1077392) (not b!1077333) (not b!1077389) (not bm!45670) (not b!1077391) (not d!130119) (not b_lambda!16955) (not b!1077418) (not bm!45644) (not b!1077330) (not b!1077354) (not b!1077402) (not b_lambda!16949) (not b!1077310) (not b_lambda!16957) (not b!1077322) (not b!1077332) (not b!1077400) (not bm!45672) (not b!1077416) (not b!1077319) (not bm!45665) (not d!130125) (not b!1077344) (not b!1077384) (not b_next!22219) (not b!1077303) (not d!130115) (not b!1077395) (not b!1077353) (not b!1077404) (not b!1077388) (not b!1077351) (not b!1077258) (not b!1077383) (not b_lambda!16953) (not b!1077394) (not b!1077356))
(check-sat b_and!35199 (not b_next!22219))
