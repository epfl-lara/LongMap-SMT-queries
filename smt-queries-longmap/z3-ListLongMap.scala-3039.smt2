; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42606 () Bool)

(assert start!42606)

(declare-fun b_free!12043 () Bool)

(declare-fun b_next!12043 () Bool)

(assert (=> start!42606 (= b_free!12043 (not b_next!12043))))

(declare-fun tp!42171 () Bool)

(declare-fun b_and!20505 () Bool)

(assert (=> start!42606 (= tp!42171 b_and!20505)))

(declare-fun mapNonEmpty!21928 () Bool)

(declare-fun mapRes!21928 () Bool)

(declare-fun tp!42172 () Bool)

(declare-fun e!278991 () Bool)

(assert (=> mapNonEmpty!21928 (= mapRes!21928 (and tp!42172 e!278991))))

(declare-datatypes ((V!19067 0))(
  ( (V!19068 (val!6780 Int)) )
))
(declare-datatypes ((ValueCell!6392 0))(
  ( (ValueCellFull!6392 (v!9067 V!19067)) (EmptyCell!6392) )
))
(declare-fun mapRest!21928 () (Array (_ BitVec 32) ValueCell!6392))

(declare-datatypes ((array!30671 0))(
  ( (array!30672 (arr!14752 (Array (_ BitVec 32) ValueCell!6392)) (size!15105 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30671)

(declare-fun mapValue!21928 () ValueCell!6392)

(declare-fun mapKey!21928 () (_ BitVec 32))

(assert (=> mapNonEmpty!21928 (= (arr!14752 _values!833) (store mapRest!21928 mapKey!21928 mapValue!21928))))

(declare-fun b!475156 () Bool)

(declare-fun e!278992 () Bool)

(declare-fun e!278990 () Bool)

(assert (=> b!475156 (= e!278992 (and e!278990 mapRes!21928))))

(declare-fun condMapEmpty!21928 () Bool)

(declare-fun mapDefault!21928 () ValueCell!6392)

(assert (=> b!475156 (= condMapEmpty!21928 (= (arr!14752 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6392)) mapDefault!21928)))))

(declare-fun b!475157 () Bool)

(declare-fun e!278987 () Bool)

(declare-fun e!278989 () Bool)

(assert (=> b!475157 (= e!278987 (not e!278989))))

(declare-fun res!283779 () Bool)

(assert (=> b!475157 (=> res!283779 e!278989)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475157 (= res!283779 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8998 0))(
  ( (tuple2!8999 (_1!4510 (_ BitVec 64)) (_2!4510 V!19067)) )
))
(declare-datatypes ((List!9060 0))(
  ( (Nil!9057) (Cons!9056 (h!9912 tuple2!8998) (t!15027 List!9060)) )
))
(declare-datatypes ((ListLongMap!7901 0))(
  ( (ListLongMap!7902 (toList!3966 List!9060)) )
))
(declare-fun lt!216253 () ListLongMap!7901)

(declare-fun lt!216255 () ListLongMap!7901)

(assert (=> b!475157 (= lt!216253 lt!216255)))

(declare-fun minValueBefore!38 () V!19067)

(declare-datatypes ((Unit!13986 0))(
  ( (Unit!13987) )
))
(declare-fun lt!216254 () Unit!13986)

(declare-fun zeroValue!794 () V!19067)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30673 0))(
  ( (array!30674 (arr!14753 (Array (_ BitVec 32) (_ BitVec 64))) (size!15106 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30673)

(declare-fun minValueAfter!38 () V!19067)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!267 (array!30673 array!30671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 V!19067 V!19067 (_ BitVec 32) Int) Unit!13986)

(assert (=> b!475157 (= lt!216254 (lemmaNoChangeToArrayThenSameMapNoExtras!267 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2133 (array!30673 array!30671 (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 (_ BitVec 32) Int) ListLongMap!7901)

(assert (=> b!475157 (= lt!216255 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475157 (= lt!216253 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475158 () Bool)

(declare-fun res!283780 () Bool)

(assert (=> b!475158 (=> (not res!283780) (not e!278987))))

(assert (=> b!475158 (= res!283780 (and (= (size!15105 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15106 _keys!1025) (size!15105 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283781 () Bool)

(assert (=> start!42606 (=> (not res!283781) (not e!278987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42606 (= res!283781 (validMask!0 mask!1365))))

(assert (=> start!42606 e!278987))

(declare-fun tp_is_empty!13471 () Bool)

(assert (=> start!42606 tp_is_empty!13471))

(assert (=> start!42606 tp!42171))

(assert (=> start!42606 true))

(declare-fun array_inv!10728 (array!30673) Bool)

(assert (=> start!42606 (array_inv!10728 _keys!1025)))

(declare-fun array_inv!10729 (array!30671) Bool)

(assert (=> start!42606 (and (array_inv!10729 _values!833) e!278992)))

(declare-fun b!475159 () Bool)

(assert (=> b!475159 (= e!278991 tp_is_empty!13471)))

(declare-fun b!475160 () Bool)

(declare-fun +!1789 (ListLongMap!7901 tuple2!8998) ListLongMap!7901)

(declare-fun getCurrentListMap!2240 (array!30673 array!30671 (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 (_ BitVec 32) Int) ListLongMap!7901)

(assert (=> b!475160 (= e!278989 (= (+!1789 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475161 () Bool)

(declare-fun res!283782 () Bool)

(assert (=> b!475161 (=> (not res!283782) (not e!278987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30673 (_ BitVec 32)) Bool)

(assert (=> b!475161 (= res!283782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475162 () Bool)

(declare-fun res!283783 () Bool)

(assert (=> b!475162 (=> (not res!283783) (not e!278987))))

(declare-datatypes ((List!9061 0))(
  ( (Nil!9058) (Cons!9057 (h!9913 (_ BitVec 64)) (t!15028 List!9061)) )
))
(declare-fun arrayNoDuplicates!0 (array!30673 (_ BitVec 32) List!9061) Bool)

(assert (=> b!475162 (= res!283783 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9058))))

(declare-fun mapIsEmpty!21928 () Bool)

(assert (=> mapIsEmpty!21928 mapRes!21928))

(declare-fun b!475163 () Bool)

(assert (=> b!475163 (= e!278990 tp_is_empty!13471)))

(assert (= (and start!42606 res!283781) b!475158))

(assert (= (and b!475158 res!283780) b!475161))

(assert (= (and b!475161 res!283782) b!475162))

(assert (= (and b!475162 res!283783) b!475157))

(assert (= (and b!475157 (not res!283779)) b!475160))

(assert (= (and b!475156 condMapEmpty!21928) mapIsEmpty!21928))

(assert (= (and b!475156 (not condMapEmpty!21928)) mapNonEmpty!21928))

(get-info :version)

(assert (= (and mapNonEmpty!21928 ((_ is ValueCellFull!6392) mapValue!21928)) b!475159))

(assert (= (and b!475156 ((_ is ValueCellFull!6392) mapDefault!21928)) b!475163))

(assert (= start!42606 b!475156))

(declare-fun m!456873 () Bool)

(assert (=> b!475160 m!456873))

(assert (=> b!475160 m!456873))

(declare-fun m!456875 () Bool)

(assert (=> b!475160 m!456875))

(declare-fun m!456877 () Bool)

(assert (=> b!475160 m!456877))

(declare-fun m!456879 () Bool)

(assert (=> b!475157 m!456879))

(declare-fun m!456881 () Bool)

(assert (=> b!475157 m!456881))

(declare-fun m!456883 () Bool)

(assert (=> b!475157 m!456883))

(declare-fun m!456885 () Bool)

(assert (=> start!42606 m!456885))

(declare-fun m!456887 () Bool)

(assert (=> start!42606 m!456887))

(declare-fun m!456889 () Bool)

(assert (=> start!42606 m!456889))

(declare-fun m!456891 () Bool)

(assert (=> mapNonEmpty!21928 m!456891))

(declare-fun m!456893 () Bool)

(assert (=> b!475162 m!456893))

(declare-fun m!456895 () Bool)

(assert (=> b!475161 m!456895))

(check-sat (not b!475161) (not b!475160) (not b_next!12043) b_and!20505 (not b!475162) (not start!42606) tp_is_empty!13471 (not b!475157) (not mapNonEmpty!21928))
(check-sat b_and!20505 (not b_next!12043))
(get-model)

(declare-fun b!475220 () Bool)

(declare-fun e!279037 () Bool)

(declare-fun call!30556 () Bool)

(assert (=> b!475220 (= e!279037 call!30556)))

(declare-fun bm!30553 () Bool)

(assert (=> bm!30553 (= call!30556 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475221 () Bool)

(declare-fun e!279035 () Bool)

(assert (=> b!475221 (= e!279035 e!279037)))

(declare-fun lt!216281 () (_ BitVec 64))

(assert (=> b!475221 (= lt!216281 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216282 () Unit!13986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30673 (_ BitVec 64) (_ BitVec 32)) Unit!13986)

(assert (=> b!475221 (= lt!216282 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216281 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475221 (arrayContainsKey!0 _keys!1025 lt!216281 #b00000000000000000000000000000000)))

(declare-fun lt!216280 () Unit!13986)

(assert (=> b!475221 (= lt!216280 lt!216282)))

(declare-fun res!283819 () Bool)

(declare-datatypes ((SeekEntryResult!3554 0))(
  ( (MissingZero!3554 (index!16395 (_ BitVec 32))) (Found!3554 (index!16396 (_ BitVec 32))) (Intermediate!3554 (undefined!4366 Bool) (index!16397 (_ BitVec 32)) (x!44626 (_ BitVec 32))) (Undefined!3554) (MissingVacant!3554 (index!16398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30673 (_ BitVec 32)) SeekEntryResult!3554)

(assert (=> b!475221 (= res!283819 (= (seekEntryOrOpen!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3554 #b00000000000000000000000000000000)))))

(assert (=> b!475221 (=> (not res!283819) (not e!279037))))

(declare-fun d!75417 () Bool)

(declare-fun res!283818 () Bool)

(declare-fun e!279036 () Bool)

(assert (=> d!75417 (=> res!283818 e!279036)))

(assert (=> d!75417 (= res!283818 (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279036)))

(declare-fun b!475222 () Bool)

(assert (=> b!475222 (= e!279036 e!279035)))

(declare-fun c!57094 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475222 (= c!57094 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475223 () Bool)

(assert (=> b!475223 (= e!279035 call!30556)))

(assert (= (and d!75417 (not res!283818)) b!475222))

(assert (= (and b!475222 c!57094) b!475221))

(assert (= (and b!475222 (not c!57094)) b!475223))

(assert (= (and b!475221 res!283819) b!475220))

(assert (= (or b!475220 b!475223) bm!30553))

(declare-fun m!456945 () Bool)

(assert (=> bm!30553 m!456945))

(declare-fun m!456947 () Bool)

(assert (=> b!475221 m!456947))

(declare-fun m!456949 () Bool)

(assert (=> b!475221 m!456949))

(declare-fun m!456951 () Bool)

(assert (=> b!475221 m!456951))

(assert (=> b!475221 m!456947))

(declare-fun m!456953 () Bool)

(assert (=> b!475221 m!456953))

(assert (=> b!475222 m!456947))

(assert (=> b!475222 m!456947))

(declare-fun m!456955 () Bool)

(assert (=> b!475222 m!456955))

(assert (=> b!475161 d!75417))

(declare-fun b!475234 () Bool)

(declare-fun e!279046 () Bool)

(declare-fun e!279049 () Bool)

(assert (=> b!475234 (= e!279046 e!279049)))

(declare-fun res!283826 () Bool)

(assert (=> b!475234 (=> (not res!283826) (not e!279049))))

(declare-fun e!279048 () Bool)

(assert (=> b!475234 (= res!283826 (not e!279048))))

(declare-fun res!283828 () Bool)

(assert (=> b!475234 (=> (not res!283828) (not e!279048))))

(assert (=> b!475234 (= res!283828 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475235 () Bool)

(declare-fun e!279047 () Bool)

(assert (=> b!475235 (= e!279049 e!279047)))

(declare-fun c!57097 () Bool)

(assert (=> b!475235 (= c!57097 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475236 () Bool)

(declare-fun contains!2547 (List!9061 (_ BitVec 64)) Bool)

(assert (=> b!475236 (= e!279048 (contains!2547 Nil!9058 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475237 () Bool)

(declare-fun call!30559 () Bool)

(assert (=> b!475237 (= e!279047 call!30559)))

(declare-fun b!475238 () Bool)

(assert (=> b!475238 (= e!279047 call!30559)))

(declare-fun d!75419 () Bool)

(declare-fun res!283827 () Bool)

(assert (=> d!75419 (=> res!283827 e!279046)))

(assert (=> d!75419 (= res!283827 (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75419 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9058) e!279046)))

(declare-fun bm!30556 () Bool)

(assert (=> bm!30556 (= call!30559 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57097 (Cons!9057 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000) Nil!9058) Nil!9058)))))

(assert (= (and d!75419 (not res!283827)) b!475234))

(assert (= (and b!475234 res!283828) b!475236))

(assert (= (and b!475234 res!283826) b!475235))

(assert (= (and b!475235 c!57097) b!475237))

(assert (= (and b!475235 (not c!57097)) b!475238))

(assert (= (or b!475237 b!475238) bm!30556))

(assert (=> b!475234 m!456947))

(assert (=> b!475234 m!456947))

(assert (=> b!475234 m!456955))

(assert (=> b!475235 m!456947))

(assert (=> b!475235 m!456947))

(assert (=> b!475235 m!456955))

(assert (=> b!475236 m!456947))

(assert (=> b!475236 m!456947))

(declare-fun m!456957 () Bool)

(assert (=> b!475236 m!456957))

(assert (=> bm!30556 m!456947))

(declare-fun m!456959 () Bool)

(assert (=> bm!30556 m!456959))

(assert (=> b!475162 d!75419))

(declare-fun d!75421 () Bool)

(assert (=> d!75421 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42606 d!75421))

(declare-fun d!75423 () Bool)

(assert (=> d!75423 (= (array_inv!10728 _keys!1025) (bvsge (size!15106 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42606 d!75423))

(declare-fun d!75425 () Bool)

(assert (=> d!75425 (= (array_inv!10729 _values!833) (bvsge (size!15105 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42606 d!75425))

(declare-fun d!75427 () Bool)

(assert (=> d!75427 (= (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216285 () Unit!13986)

(declare-fun choose!1362 (array!30673 array!30671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 V!19067 V!19067 (_ BitVec 32) Int) Unit!13986)

(assert (=> d!75427 (= lt!216285 (choose!1362 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75427 (validMask!0 mask!1365)))

(assert (=> d!75427 (= (lemmaNoChangeToArrayThenSameMapNoExtras!267 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216285)))

(declare-fun bs!15072 () Bool)

(assert (= bs!15072 d!75427))

(assert (=> bs!15072 m!456883))

(assert (=> bs!15072 m!456881))

(declare-fun m!456961 () Bool)

(assert (=> bs!15072 m!456961))

(assert (=> bs!15072 m!456885))

(assert (=> b!475157 d!75427))

(declare-fun b!475263 () Bool)

(declare-fun e!279066 () Bool)

(declare-fun e!279069 () Bool)

(assert (=> b!475263 (= e!279066 e!279069)))

(declare-fun c!57108 () Bool)

(declare-fun e!279064 () Bool)

(assert (=> b!475263 (= c!57108 e!279064)))

(declare-fun res!283837 () Bool)

(assert (=> b!475263 (=> (not res!283837) (not e!279064))))

(assert (=> b!475263 (= res!283837 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475264 () Bool)

(declare-fun lt!216306 () Unit!13986)

(declare-fun lt!216301 () Unit!13986)

(assert (=> b!475264 (= lt!216306 lt!216301)))

(declare-fun lt!216300 () (_ BitVec 64))

(declare-fun lt!216304 () ListLongMap!7901)

(declare-fun lt!216302 () V!19067)

(declare-fun lt!216305 () (_ BitVec 64))

(declare-fun contains!2548 (ListLongMap!7901 (_ BitVec 64)) Bool)

(assert (=> b!475264 (not (contains!2548 (+!1789 lt!216304 (tuple2!8999 lt!216305 lt!216302)) lt!216300))))

(declare-fun addStillNotContains!169 (ListLongMap!7901 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13986)

(assert (=> b!475264 (= lt!216301 (addStillNotContains!169 lt!216304 lt!216305 lt!216302 lt!216300))))

(assert (=> b!475264 (= lt!216300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7168 (ValueCell!6392 V!19067) V!19067)

(declare-fun dynLambda!931 (Int (_ BitVec 64)) V!19067)

(assert (=> b!475264 (= lt!216302 (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475264 (= lt!216305 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30562 () ListLongMap!7901)

(assert (=> b!475264 (= lt!216304 call!30562)))

(declare-fun e!279070 () ListLongMap!7901)

(assert (=> b!475264 (= e!279070 (+!1789 call!30562 (tuple2!8999 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!216303 () ListLongMap!7901)

(declare-fun e!279067 () Bool)

(declare-fun b!475265 () Bool)

(assert (=> b!475265 (= e!279067 (= lt!216303 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475266 () Bool)

(declare-fun res!283838 () Bool)

(assert (=> b!475266 (=> (not res!283838) (not e!279066))))

(assert (=> b!475266 (= res!283838 (not (contains!2548 lt!216303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30559 () Bool)

(assert (=> bm!30559 (= call!30562 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475267 () Bool)

(assert (=> b!475267 (= e!279069 e!279067)))

(declare-fun c!57107 () Bool)

(assert (=> b!475267 (= c!57107 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475268 () Bool)

(declare-fun e!279068 () ListLongMap!7901)

(assert (=> b!475268 (= e!279068 (ListLongMap!7902 Nil!9057))))

(declare-fun b!475269 () Bool)

(assert (=> b!475269 (= e!279068 e!279070)))

(declare-fun c!57109 () Bool)

(assert (=> b!475269 (= c!57109 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475270 () Bool)

(declare-fun e!279065 () Bool)

(assert (=> b!475270 (= e!279069 e!279065)))

(assert (=> b!475270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun res!283839 () Bool)

(assert (=> b!475270 (= res!283839 (contains!2548 lt!216303 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475270 (=> (not res!283839) (not e!279065))))

(declare-fun d!75429 () Bool)

(assert (=> d!75429 e!279066))

(declare-fun res!283840 () Bool)

(assert (=> d!75429 (=> (not res!283840) (not e!279066))))

(assert (=> d!75429 (= res!283840 (not (contains!2548 lt!216303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75429 (= lt!216303 e!279068)))

(declare-fun c!57106 () Bool)

(assert (=> d!75429 (= c!57106 (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75429 (validMask!0 mask!1365)))

(assert (=> d!75429 (= (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216303)))

(declare-fun b!475271 () Bool)

(declare-fun isEmpty!586 (ListLongMap!7901) Bool)

(assert (=> b!475271 (= e!279067 (isEmpty!586 lt!216303))))

(declare-fun b!475272 () Bool)

(assert (=> b!475272 (= e!279064 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475272 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475273 () Bool)

(assert (=> b!475273 (= e!279070 call!30562)))

(declare-fun b!475274 () Bool)

(assert (=> b!475274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> b!475274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(declare-fun apply!335 (ListLongMap!7901 (_ BitVec 64)) V!19067)

(assert (=> b!475274 (= e!279065 (= (apply!335 lt!216303 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75429 c!57106) b!475268))

(assert (= (and d!75429 (not c!57106)) b!475269))

(assert (= (and b!475269 c!57109) b!475264))

(assert (= (and b!475269 (not c!57109)) b!475273))

(assert (= (or b!475264 b!475273) bm!30559))

(assert (= (and d!75429 res!283840) b!475266))

(assert (= (and b!475266 res!283838) b!475263))

(assert (= (and b!475263 res!283837) b!475272))

(assert (= (and b!475263 c!57108) b!475270))

(assert (= (and b!475263 (not c!57108)) b!475267))

(assert (= (and b!475270 res!283839) b!475274))

(assert (= (and b!475267 c!57107) b!475265))

(assert (= (and b!475267 (not c!57107)) b!475271))

(declare-fun b_lambda!10251 () Bool)

(assert (=> (not b_lambda!10251) (not b!475264)))

(declare-fun t!15033 () Bool)

(declare-fun tb!3927 () Bool)

(assert (=> (and start!42606 (= defaultEntry!841 defaultEntry!841) t!15033) tb!3927))

(declare-fun result!7455 () Bool)

(assert (=> tb!3927 (= result!7455 tp_is_empty!13471)))

(assert (=> b!475264 t!15033))

(declare-fun b_and!20511 () Bool)

(assert (= b_and!20505 (and (=> t!15033 result!7455) b_and!20511)))

(declare-fun b_lambda!10253 () Bool)

(assert (=> (not b_lambda!10253) (not b!475274)))

(assert (=> b!475274 t!15033))

(declare-fun b_and!20513 () Bool)

(assert (= b_and!20511 (and (=> t!15033 result!7455) b_and!20513)))

(declare-fun m!456963 () Bool)

(assert (=> b!475274 m!456963))

(declare-fun m!456965 () Bool)

(assert (=> b!475274 m!456965))

(declare-fun m!456967 () Bool)

(assert (=> b!475274 m!456967))

(assert (=> b!475274 m!456947))

(assert (=> b!475274 m!456963))

(assert (=> b!475274 m!456965))

(assert (=> b!475274 m!456947))

(declare-fun m!456969 () Bool)

(assert (=> b!475274 m!456969))

(assert (=> b!475272 m!456947))

(assert (=> b!475272 m!456947))

(assert (=> b!475272 m!456955))

(assert (=> b!475270 m!456947))

(assert (=> b!475270 m!456947))

(declare-fun m!456971 () Bool)

(assert (=> b!475270 m!456971))

(assert (=> b!475269 m!456947))

(assert (=> b!475269 m!456947))

(assert (=> b!475269 m!456955))

(declare-fun m!456973 () Bool)

(assert (=> bm!30559 m!456973))

(declare-fun m!456975 () Bool)

(assert (=> d!75429 m!456975))

(assert (=> d!75429 m!456885))

(declare-fun m!456977 () Bool)

(assert (=> b!475266 m!456977))

(assert (=> b!475265 m!456973))

(declare-fun m!456979 () Bool)

(assert (=> b!475264 m!456979))

(assert (=> b!475264 m!456963))

(assert (=> b!475264 m!456965))

(assert (=> b!475264 m!456967))

(assert (=> b!475264 m!456947))

(declare-fun m!456981 () Bool)

(assert (=> b!475264 m!456981))

(assert (=> b!475264 m!456963))

(assert (=> b!475264 m!456965))

(declare-fun m!456983 () Bool)

(assert (=> b!475264 m!456983))

(assert (=> b!475264 m!456979))

(declare-fun m!456985 () Bool)

(assert (=> b!475264 m!456985))

(declare-fun m!456987 () Bool)

(assert (=> b!475271 m!456987))

(assert (=> b!475157 d!75429))

(declare-fun b!475277 () Bool)

(declare-fun e!279073 () Bool)

(declare-fun e!279076 () Bool)

(assert (=> b!475277 (= e!279073 e!279076)))

(declare-fun c!57112 () Bool)

(declare-fun e!279071 () Bool)

(assert (=> b!475277 (= c!57112 e!279071)))

(declare-fun res!283841 () Bool)

(assert (=> b!475277 (=> (not res!283841) (not e!279071))))

(assert (=> b!475277 (= res!283841 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475278 () Bool)

(declare-fun lt!216313 () Unit!13986)

(declare-fun lt!216308 () Unit!13986)

(assert (=> b!475278 (= lt!216313 lt!216308)))

(declare-fun lt!216309 () V!19067)

(declare-fun lt!216307 () (_ BitVec 64))

(declare-fun lt!216311 () ListLongMap!7901)

(declare-fun lt!216312 () (_ BitVec 64))

(assert (=> b!475278 (not (contains!2548 (+!1789 lt!216311 (tuple2!8999 lt!216312 lt!216309)) lt!216307))))

(assert (=> b!475278 (= lt!216308 (addStillNotContains!169 lt!216311 lt!216312 lt!216309 lt!216307))))

(assert (=> b!475278 (= lt!216307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475278 (= lt!216309 (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475278 (= lt!216312 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30563 () ListLongMap!7901)

(assert (=> b!475278 (= lt!216311 call!30563)))

(declare-fun e!279077 () ListLongMap!7901)

(assert (=> b!475278 (= e!279077 (+!1789 call!30563 (tuple2!8999 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!216310 () ListLongMap!7901)

(declare-fun b!475279 () Bool)

(declare-fun e!279074 () Bool)

(assert (=> b!475279 (= e!279074 (= lt!216310 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475280 () Bool)

(declare-fun res!283842 () Bool)

(assert (=> b!475280 (=> (not res!283842) (not e!279073))))

(assert (=> b!475280 (= res!283842 (not (contains!2548 lt!216310 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30560 () Bool)

(assert (=> bm!30560 (= call!30563 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475281 () Bool)

(assert (=> b!475281 (= e!279076 e!279074)))

(declare-fun c!57111 () Bool)

(assert (=> b!475281 (= c!57111 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475282 () Bool)

(declare-fun e!279075 () ListLongMap!7901)

(assert (=> b!475282 (= e!279075 (ListLongMap!7902 Nil!9057))))

(declare-fun b!475283 () Bool)

(assert (=> b!475283 (= e!279075 e!279077)))

(declare-fun c!57113 () Bool)

(assert (=> b!475283 (= c!57113 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475284 () Bool)

(declare-fun e!279072 () Bool)

(assert (=> b!475284 (= e!279076 e!279072)))

(assert (=> b!475284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun res!283843 () Bool)

(assert (=> b!475284 (= res!283843 (contains!2548 lt!216310 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475284 (=> (not res!283843) (not e!279072))))

(declare-fun d!75431 () Bool)

(assert (=> d!75431 e!279073))

(declare-fun res!283844 () Bool)

(assert (=> d!75431 (=> (not res!283844) (not e!279073))))

(assert (=> d!75431 (= res!283844 (not (contains!2548 lt!216310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75431 (= lt!216310 e!279075)))

(declare-fun c!57110 () Bool)

(assert (=> d!75431 (= c!57110 (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75431 (validMask!0 mask!1365)))

(assert (=> d!75431 (= (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216310)))

(declare-fun b!475285 () Bool)

(assert (=> b!475285 (= e!279074 (isEmpty!586 lt!216310))))

(declare-fun b!475286 () Bool)

(assert (=> b!475286 (= e!279071 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475286 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475287 () Bool)

(assert (=> b!475287 (= e!279077 call!30563)))

(declare-fun b!475288 () Bool)

(assert (=> b!475288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> b!475288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(assert (=> b!475288 (= e!279072 (= (apply!335 lt!216310 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75431 c!57110) b!475282))

(assert (= (and d!75431 (not c!57110)) b!475283))

(assert (= (and b!475283 c!57113) b!475278))

(assert (= (and b!475283 (not c!57113)) b!475287))

(assert (= (or b!475278 b!475287) bm!30560))

(assert (= (and d!75431 res!283844) b!475280))

(assert (= (and b!475280 res!283842) b!475277))

(assert (= (and b!475277 res!283841) b!475286))

(assert (= (and b!475277 c!57112) b!475284))

(assert (= (and b!475277 (not c!57112)) b!475281))

(assert (= (and b!475284 res!283843) b!475288))

(assert (= (and b!475281 c!57111) b!475279))

(assert (= (and b!475281 (not c!57111)) b!475285))

(declare-fun b_lambda!10255 () Bool)

(assert (=> (not b_lambda!10255) (not b!475278)))

(assert (=> b!475278 t!15033))

(declare-fun b_and!20515 () Bool)

(assert (= b_and!20513 (and (=> t!15033 result!7455) b_and!20515)))

(declare-fun b_lambda!10257 () Bool)

(assert (=> (not b_lambda!10257) (not b!475288)))

(assert (=> b!475288 t!15033))

(declare-fun b_and!20517 () Bool)

(assert (= b_and!20515 (and (=> t!15033 result!7455) b_and!20517)))

(assert (=> b!475288 m!456963))

(assert (=> b!475288 m!456965))

(assert (=> b!475288 m!456967))

(assert (=> b!475288 m!456947))

(assert (=> b!475288 m!456963))

(assert (=> b!475288 m!456965))

(assert (=> b!475288 m!456947))

(declare-fun m!456989 () Bool)

(assert (=> b!475288 m!456989))

(assert (=> b!475286 m!456947))

(assert (=> b!475286 m!456947))

(assert (=> b!475286 m!456955))

(assert (=> b!475284 m!456947))

(assert (=> b!475284 m!456947))

(declare-fun m!456991 () Bool)

(assert (=> b!475284 m!456991))

(assert (=> b!475283 m!456947))

(assert (=> b!475283 m!456947))

(assert (=> b!475283 m!456955))

(declare-fun m!456993 () Bool)

(assert (=> bm!30560 m!456993))

(declare-fun m!456995 () Bool)

(assert (=> d!75431 m!456995))

(assert (=> d!75431 m!456885))

(declare-fun m!456997 () Bool)

(assert (=> b!475280 m!456997))

(assert (=> b!475279 m!456993))

(declare-fun m!456999 () Bool)

(assert (=> b!475278 m!456999))

(assert (=> b!475278 m!456963))

(assert (=> b!475278 m!456965))

(assert (=> b!475278 m!456967))

(assert (=> b!475278 m!456947))

(declare-fun m!457001 () Bool)

(assert (=> b!475278 m!457001))

(assert (=> b!475278 m!456963))

(assert (=> b!475278 m!456965))

(declare-fun m!457003 () Bool)

(assert (=> b!475278 m!457003))

(assert (=> b!475278 m!456999))

(declare-fun m!457005 () Bool)

(assert (=> b!475278 m!457005))

(declare-fun m!457007 () Bool)

(assert (=> b!475285 m!457007))

(assert (=> b!475157 d!75431))

(declare-fun d!75433 () Bool)

(declare-fun e!279080 () Bool)

(assert (=> d!75433 e!279080))

(declare-fun res!283849 () Bool)

(assert (=> d!75433 (=> (not res!283849) (not e!279080))))

(declare-fun lt!216324 () ListLongMap!7901)

(assert (=> d!75433 (= res!283849 (contains!2548 lt!216324 (_1!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216325 () List!9060)

(assert (=> d!75433 (= lt!216324 (ListLongMap!7902 lt!216325))))

(declare-fun lt!216322 () Unit!13986)

(declare-fun lt!216323 () Unit!13986)

(assert (=> d!75433 (= lt!216322 lt!216323)))

(declare-datatypes ((Option!386 0))(
  ( (Some!385 (v!9070 V!19067)) (None!384) )
))
(declare-fun getValueByKey!380 (List!9060 (_ BitVec 64)) Option!386)

(assert (=> d!75433 (= (getValueByKey!380 lt!216325 (_1!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!385 (_2!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!205 (List!9060 (_ BitVec 64) V!19067) Unit!13986)

(assert (=> d!75433 (= lt!216323 (lemmaContainsTupThenGetReturnValue!205 lt!216325 (_1!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!208 (List!9060 (_ BitVec 64) V!19067) List!9060)

(assert (=> d!75433 (= lt!216325 (insertStrictlySorted!208 (toList!3966 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75433 (= (+!1789 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216324)))

(declare-fun b!475293 () Bool)

(declare-fun res!283850 () Bool)

(assert (=> b!475293 (=> (not res!283850) (not e!279080))))

(assert (=> b!475293 (= res!283850 (= (getValueByKey!380 (toList!3966 lt!216324) (_1!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!385 (_2!4510 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!475294 () Bool)

(declare-fun contains!2549 (List!9060 tuple2!8998) Bool)

(assert (=> b!475294 (= e!279080 (contains!2549 (toList!3966 lt!216324) (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75433 res!283849) b!475293))

(assert (= (and b!475293 res!283850) b!475294))

(declare-fun m!457009 () Bool)

(assert (=> d!75433 m!457009))

(declare-fun m!457011 () Bool)

(assert (=> d!75433 m!457011))

(declare-fun m!457013 () Bool)

(assert (=> d!75433 m!457013))

(declare-fun m!457015 () Bool)

(assert (=> d!75433 m!457015))

(declare-fun m!457017 () Bool)

(assert (=> b!475293 m!457017))

(declare-fun m!457019 () Bool)

(assert (=> b!475294 m!457019))

(assert (=> b!475160 d!75433))

(declare-fun call!30582 () ListLongMap!7901)

(declare-fun call!30579 () ListLongMap!7901)

(declare-fun c!57130 () Bool)

(declare-fun bm!30575 () Bool)

(declare-fun c!57127 () Bool)

(declare-fun call!30578 () ListLongMap!7901)

(declare-fun call!30583 () ListLongMap!7901)

(assert (=> bm!30575 (= call!30582 (+!1789 (ite c!57127 call!30578 (ite c!57130 call!30579 call!30583)) (ite (or c!57127 c!57130) (tuple2!8999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475338 () Bool)

(declare-fun e!279111 () Bool)

(declare-fun call!30581 () Bool)

(assert (=> b!475338 (= e!279111 (not call!30581))))

(declare-fun b!475339 () Bool)

(declare-fun e!279114 () Bool)

(declare-fun e!279119 () Bool)

(assert (=> b!475339 (= e!279114 e!279119)))

(declare-fun res!283875 () Bool)

(declare-fun call!30580 () Bool)

(assert (=> b!475339 (= res!283875 call!30580)))

(assert (=> b!475339 (=> (not res!283875) (not e!279119))))

(declare-fun b!475340 () Bool)

(declare-fun res!283872 () Bool)

(declare-fun e!279118 () Bool)

(assert (=> b!475340 (=> (not res!283872) (not e!279118))))

(declare-fun e!279117 () Bool)

(assert (=> b!475340 (= res!283872 e!279117)))

(declare-fun res!283870 () Bool)

(assert (=> b!475340 (=> res!283870 e!279117)))

(declare-fun e!279109 () Bool)

(assert (=> b!475340 (= res!283870 (not e!279109))))

(declare-fun res!283874 () Bool)

(assert (=> b!475340 (=> (not res!283874) (not e!279109))))

(assert (=> b!475340 (= res!283874 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475341 () Bool)

(assert (=> b!475341 (= e!279109 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30576 () Bool)

(declare-fun lt!216386 () ListLongMap!7901)

(assert (=> bm!30576 (= call!30581 (contains!2548 lt!216386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475342 () Bool)

(declare-fun e!279116 () Bool)

(assert (=> b!475342 (= e!279116 (= (apply!335 lt!216386 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!475343 () Bool)

(declare-fun e!279110 () Unit!13986)

(declare-fun Unit!13992 () Unit!13986)

(assert (=> b!475343 (= e!279110 Unit!13992)))

(declare-fun bm!30577 () Bool)

(assert (=> bm!30577 (= call!30579 call!30578)))

(declare-fun b!475344 () Bool)

(declare-fun e!279107 () ListLongMap!7901)

(declare-fun e!279112 () ListLongMap!7901)

(assert (=> b!475344 (= e!279107 e!279112)))

(assert (=> b!475344 (= c!57130 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475345 () Bool)

(assert (=> b!475345 (= e!279118 e!279111)))

(declare-fun c!57126 () Bool)

(assert (=> b!475345 (= c!57126 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475346 () Bool)

(declare-fun e!279115 () ListLongMap!7901)

(assert (=> b!475346 (= e!279115 call!30583)))

(declare-fun bm!30578 () Bool)

(assert (=> bm!30578 (= call!30583 call!30579)))

(declare-fun b!475337 () Bool)

(declare-fun e!279108 () Bool)

(assert (=> b!475337 (= e!279117 e!279108)))

(declare-fun res!283869 () Bool)

(assert (=> b!475337 (=> (not res!283869) (not e!279108))))

(assert (=> b!475337 (= res!283869 (contains!2548 lt!216386 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun d!75435 () Bool)

(assert (=> d!75435 e!279118))

(declare-fun res!283873 () Bool)

(assert (=> d!75435 (=> (not res!283873) (not e!279118))))

(assert (=> d!75435 (= res!283873 (or (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))))

(declare-fun lt!216378 () ListLongMap!7901)

(assert (=> d!75435 (= lt!216386 lt!216378)))

(declare-fun lt!216381 () Unit!13986)

(assert (=> d!75435 (= lt!216381 e!279110)))

(declare-fun c!57129 () Bool)

(declare-fun e!279113 () Bool)

(assert (=> d!75435 (= c!57129 e!279113)))

(declare-fun res!283877 () Bool)

(assert (=> d!75435 (=> (not res!283877) (not e!279113))))

(assert (=> d!75435 (= res!283877 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75435 (= lt!216378 e!279107)))

(assert (=> d!75435 (= c!57127 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75435 (validMask!0 mask!1365)))

(assert (=> d!75435 (= (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216386)))

(declare-fun b!475347 () Bool)

(declare-fun c!57128 () Bool)

(assert (=> b!475347 (= c!57128 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475347 (= e!279112 e!279115)))

(declare-fun b!475348 () Bool)

(declare-fun res!283871 () Bool)

(assert (=> b!475348 (=> (not res!283871) (not e!279118))))

(assert (=> b!475348 (= res!283871 e!279114)))

(declare-fun c!57131 () Bool)

(assert (=> b!475348 (= c!57131 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475349 () Bool)

(assert (=> b!475349 (= e!279113 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475350 () Bool)

(declare-fun call!30584 () ListLongMap!7901)

(assert (=> b!475350 (= e!279112 call!30584)))

(declare-fun bm!30579 () Bool)

(assert (=> bm!30579 (= call!30580 (contains!2548 lt!216386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30580 () Bool)

(assert (=> bm!30580 (= call!30584 call!30582)))

(declare-fun b!475351 () Bool)

(declare-fun lt!216391 () Unit!13986)

(assert (=> b!475351 (= e!279110 lt!216391)))

(declare-fun lt!216383 () ListLongMap!7901)

(assert (=> b!475351 (= lt!216383 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216388 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216379 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216379 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216376 () Unit!13986)

(declare-fun addStillContains!293 (ListLongMap!7901 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13986)

(assert (=> b!475351 (= lt!216376 (addStillContains!293 lt!216383 lt!216388 zeroValue!794 lt!216379))))

(assert (=> b!475351 (contains!2548 (+!1789 lt!216383 (tuple2!8999 lt!216388 zeroValue!794)) lt!216379)))

(declare-fun lt!216380 () Unit!13986)

(assert (=> b!475351 (= lt!216380 lt!216376)))

(declare-fun lt!216390 () ListLongMap!7901)

(assert (=> b!475351 (= lt!216390 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216374 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216374 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216387 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216387 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216375 () Unit!13986)

(declare-fun addApplyDifferent!293 (ListLongMap!7901 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13986)

(assert (=> b!475351 (= lt!216375 (addApplyDifferent!293 lt!216390 lt!216374 minValueBefore!38 lt!216387))))

(assert (=> b!475351 (= (apply!335 (+!1789 lt!216390 (tuple2!8999 lt!216374 minValueBefore!38)) lt!216387) (apply!335 lt!216390 lt!216387))))

(declare-fun lt!216382 () Unit!13986)

(assert (=> b!475351 (= lt!216382 lt!216375)))

(declare-fun lt!216370 () ListLongMap!7901)

(assert (=> b!475351 (= lt!216370 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216384 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216385 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216385 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216372 () Unit!13986)

(assert (=> b!475351 (= lt!216372 (addApplyDifferent!293 lt!216370 lt!216384 zeroValue!794 lt!216385))))

(assert (=> b!475351 (= (apply!335 (+!1789 lt!216370 (tuple2!8999 lt!216384 zeroValue!794)) lt!216385) (apply!335 lt!216370 lt!216385))))

(declare-fun lt!216389 () Unit!13986)

(assert (=> b!475351 (= lt!216389 lt!216372)))

(declare-fun lt!216371 () ListLongMap!7901)

(assert (=> b!475351 (= lt!216371 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216373 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216377 () (_ BitVec 64))

(assert (=> b!475351 (= lt!216377 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475351 (= lt!216391 (addApplyDifferent!293 lt!216371 lt!216373 minValueBefore!38 lt!216377))))

(assert (=> b!475351 (= (apply!335 (+!1789 lt!216371 (tuple2!8999 lt!216373 minValueBefore!38)) lt!216377) (apply!335 lt!216371 lt!216377))))

(declare-fun b!475352 () Bool)

(assert (=> b!475352 (= e!279108 (= (apply!335 lt!216386 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(assert (=> b!475352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475353 () Bool)

(assert (=> b!475353 (= e!279115 call!30584)))

(declare-fun b!475354 () Bool)

(assert (=> b!475354 (= e!279111 e!279116)))

(declare-fun res!283876 () Bool)

(assert (=> b!475354 (= res!283876 call!30581)))

(assert (=> b!475354 (=> (not res!283876) (not e!279116))))

(declare-fun bm!30581 () Bool)

(assert (=> bm!30581 (= call!30578 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475355 () Bool)

(assert (=> b!475355 (= e!279114 (not call!30580))))

(declare-fun b!475356 () Bool)

(assert (=> b!475356 (= e!279119 (= (apply!335 lt!216386 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475357 () Bool)

(assert (=> b!475357 (= e!279107 (+!1789 call!30582 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75435 c!57127) b!475357))

(assert (= (and d!75435 (not c!57127)) b!475344))

(assert (= (and b!475344 c!57130) b!475350))

(assert (= (and b!475344 (not c!57130)) b!475347))

(assert (= (and b!475347 c!57128) b!475353))

(assert (= (and b!475347 (not c!57128)) b!475346))

(assert (= (or b!475353 b!475346) bm!30578))

(assert (= (or b!475350 bm!30578) bm!30577))

(assert (= (or b!475350 b!475353) bm!30580))

(assert (= (or b!475357 bm!30577) bm!30581))

(assert (= (or b!475357 bm!30580) bm!30575))

(assert (= (and d!75435 res!283877) b!475349))

(assert (= (and d!75435 c!57129) b!475351))

(assert (= (and d!75435 (not c!57129)) b!475343))

(assert (= (and d!75435 res!283873) b!475340))

(assert (= (and b!475340 res!283874) b!475341))

(assert (= (and b!475340 (not res!283870)) b!475337))

(assert (= (and b!475337 res!283869) b!475352))

(assert (= (and b!475340 res!283872) b!475348))

(assert (= (and b!475348 c!57131) b!475339))

(assert (= (and b!475348 (not c!57131)) b!475355))

(assert (= (and b!475339 res!283875) b!475356))

(assert (= (or b!475339 b!475355) bm!30579))

(assert (= (and b!475348 res!283871) b!475345))

(assert (= (and b!475345 c!57126) b!475354))

(assert (= (and b!475345 (not c!57126)) b!475338))

(assert (= (and b!475354 res!283876) b!475342))

(assert (= (or b!475354 b!475338) bm!30576))

(declare-fun b_lambda!10259 () Bool)

(assert (=> (not b_lambda!10259) (not b!475352)))

(assert (=> b!475352 t!15033))

(declare-fun b_and!20519 () Bool)

(assert (= b_and!20517 (and (=> t!15033 result!7455) b_and!20519)))

(assert (=> b!475341 m!456947))

(assert (=> b!475341 m!456947))

(assert (=> b!475341 m!456955))

(declare-fun m!457021 () Bool)

(assert (=> bm!30576 m!457021))

(declare-fun m!457023 () Bool)

(assert (=> bm!30579 m!457023))

(assert (=> d!75435 m!456885))

(declare-fun m!457025 () Bool)

(assert (=> b!475357 m!457025))

(assert (=> b!475351 m!456883))

(declare-fun m!457027 () Bool)

(assert (=> b!475351 m!457027))

(declare-fun m!457029 () Bool)

(assert (=> b!475351 m!457029))

(declare-fun m!457031 () Bool)

(assert (=> b!475351 m!457031))

(assert (=> b!475351 m!456947))

(declare-fun m!457033 () Bool)

(assert (=> b!475351 m!457033))

(declare-fun m!457035 () Bool)

(assert (=> b!475351 m!457035))

(declare-fun m!457037 () Bool)

(assert (=> b!475351 m!457037))

(declare-fun m!457039 () Bool)

(assert (=> b!475351 m!457039))

(declare-fun m!457041 () Bool)

(assert (=> b!475351 m!457041))

(declare-fun m!457043 () Bool)

(assert (=> b!475351 m!457043))

(declare-fun m!457045 () Bool)

(assert (=> b!475351 m!457045))

(declare-fun m!457047 () Bool)

(assert (=> b!475351 m!457047))

(declare-fun m!457049 () Bool)

(assert (=> b!475351 m!457049))

(declare-fun m!457051 () Bool)

(assert (=> b!475351 m!457051))

(declare-fun m!457053 () Bool)

(assert (=> b!475351 m!457053))

(assert (=> b!475351 m!457037))

(assert (=> b!475351 m!457045))

(assert (=> b!475351 m!457033))

(assert (=> b!475351 m!457049))

(declare-fun m!457055 () Bool)

(assert (=> b!475351 m!457055))

(declare-fun m!457057 () Bool)

(assert (=> b!475342 m!457057))

(declare-fun m!457059 () Bool)

(assert (=> b!475356 m!457059))

(declare-fun m!457061 () Bool)

(assert (=> bm!30575 m!457061))

(assert (=> b!475349 m!456947))

(assert (=> b!475349 m!456947))

(assert (=> b!475349 m!456955))

(assert (=> b!475352 m!456963))

(assert (=> b!475352 m!456965))

(assert (=> b!475352 m!456967))

(assert (=> b!475352 m!456965))

(assert (=> b!475352 m!456963))

(assert (=> b!475352 m!456947))

(declare-fun m!457063 () Bool)

(assert (=> b!475352 m!457063))

(assert (=> b!475352 m!456947))

(assert (=> bm!30581 m!456883))

(assert (=> b!475337 m!456947))

(assert (=> b!475337 m!456947))

(declare-fun m!457065 () Bool)

(assert (=> b!475337 m!457065))

(assert (=> b!475160 d!75435))

(declare-fun bm!30582 () Bool)

(declare-fun call!30590 () ListLongMap!7901)

(declare-fun c!57133 () Bool)

(declare-fun call!30586 () ListLongMap!7901)

(declare-fun call!30589 () ListLongMap!7901)

(declare-fun c!57136 () Bool)

(declare-fun call!30585 () ListLongMap!7901)

(assert (=> bm!30582 (= call!30589 (+!1789 (ite c!57133 call!30585 (ite c!57136 call!30586 call!30590)) (ite (or c!57133 c!57136) (tuple2!8999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475359 () Bool)

(declare-fun e!279124 () Bool)

(declare-fun call!30588 () Bool)

(assert (=> b!475359 (= e!279124 (not call!30588))))

(declare-fun b!475360 () Bool)

(declare-fun e!279127 () Bool)

(declare-fun e!279132 () Bool)

(assert (=> b!475360 (= e!279127 e!279132)))

(declare-fun res!283884 () Bool)

(declare-fun call!30587 () Bool)

(assert (=> b!475360 (= res!283884 call!30587)))

(assert (=> b!475360 (=> (not res!283884) (not e!279132))))

(declare-fun b!475361 () Bool)

(declare-fun res!283881 () Bool)

(declare-fun e!279131 () Bool)

(assert (=> b!475361 (=> (not res!283881) (not e!279131))))

(declare-fun e!279130 () Bool)

(assert (=> b!475361 (= res!283881 e!279130)))

(declare-fun res!283879 () Bool)

(assert (=> b!475361 (=> res!283879 e!279130)))

(declare-fun e!279122 () Bool)

(assert (=> b!475361 (= res!283879 (not e!279122))))

(declare-fun res!283883 () Bool)

(assert (=> b!475361 (=> (not res!283883) (not e!279122))))

(assert (=> b!475361 (= res!283883 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475362 () Bool)

(assert (=> b!475362 (= e!279122 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30583 () Bool)

(declare-fun lt!216408 () ListLongMap!7901)

(assert (=> bm!30583 (= call!30588 (contains!2548 lt!216408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475363 () Bool)

(declare-fun e!279129 () Bool)

(assert (=> b!475363 (= e!279129 (= (apply!335 lt!216408 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!475364 () Bool)

(declare-fun e!279123 () Unit!13986)

(declare-fun Unit!13993 () Unit!13986)

(assert (=> b!475364 (= e!279123 Unit!13993)))

(declare-fun bm!30584 () Bool)

(assert (=> bm!30584 (= call!30586 call!30585)))

(declare-fun b!475365 () Bool)

(declare-fun e!279120 () ListLongMap!7901)

(declare-fun e!279125 () ListLongMap!7901)

(assert (=> b!475365 (= e!279120 e!279125)))

(assert (=> b!475365 (= c!57136 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475366 () Bool)

(assert (=> b!475366 (= e!279131 e!279124)))

(declare-fun c!57132 () Bool)

(assert (=> b!475366 (= c!57132 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475367 () Bool)

(declare-fun e!279128 () ListLongMap!7901)

(assert (=> b!475367 (= e!279128 call!30590)))

(declare-fun bm!30585 () Bool)

(assert (=> bm!30585 (= call!30590 call!30586)))

(declare-fun b!475358 () Bool)

(declare-fun e!279121 () Bool)

(assert (=> b!475358 (= e!279130 e!279121)))

(declare-fun res!283878 () Bool)

(assert (=> b!475358 (=> (not res!283878) (not e!279121))))

(assert (=> b!475358 (= res!283878 (contains!2548 lt!216408 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun d!75437 () Bool)

(assert (=> d!75437 e!279131))

(declare-fun res!283882 () Bool)

(assert (=> d!75437 (=> (not res!283882) (not e!279131))))

(assert (=> d!75437 (= res!283882 (or (bvsge #b00000000000000000000000000000000 (size!15106 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))))

(declare-fun lt!216400 () ListLongMap!7901)

(assert (=> d!75437 (= lt!216408 lt!216400)))

(declare-fun lt!216403 () Unit!13986)

(assert (=> d!75437 (= lt!216403 e!279123)))

(declare-fun c!57135 () Bool)

(declare-fun e!279126 () Bool)

(assert (=> d!75437 (= c!57135 e!279126)))

(declare-fun res!283886 () Bool)

(assert (=> d!75437 (=> (not res!283886) (not e!279126))))

(assert (=> d!75437 (= res!283886 (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(assert (=> d!75437 (= lt!216400 e!279120)))

(assert (=> d!75437 (= c!57133 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75437 (validMask!0 mask!1365)))

(assert (=> d!75437 (= (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216408)))

(declare-fun b!475368 () Bool)

(declare-fun c!57134 () Bool)

(assert (=> b!475368 (= c!57134 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475368 (= e!279125 e!279128)))

(declare-fun b!475369 () Bool)

(declare-fun res!283880 () Bool)

(assert (=> b!475369 (=> (not res!283880) (not e!279131))))

(assert (=> b!475369 (= res!283880 e!279127)))

(declare-fun c!57137 () Bool)

(assert (=> b!475369 (= c!57137 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475370 () Bool)

(assert (=> b!475370 (= e!279126 (validKeyInArray!0 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475371 () Bool)

(declare-fun call!30591 () ListLongMap!7901)

(assert (=> b!475371 (= e!279125 call!30591)))

(declare-fun bm!30586 () Bool)

(assert (=> bm!30586 (= call!30587 (contains!2548 lt!216408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30587 () Bool)

(assert (=> bm!30587 (= call!30591 call!30589)))

(declare-fun b!475372 () Bool)

(declare-fun lt!216413 () Unit!13986)

(assert (=> b!475372 (= e!279123 lt!216413)))

(declare-fun lt!216405 () ListLongMap!7901)

(assert (=> b!475372 (= lt!216405 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216410 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216401 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216401 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216398 () Unit!13986)

(assert (=> b!475372 (= lt!216398 (addStillContains!293 lt!216405 lt!216410 zeroValue!794 lt!216401))))

(assert (=> b!475372 (contains!2548 (+!1789 lt!216405 (tuple2!8999 lt!216410 zeroValue!794)) lt!216401)))

(declare-fun lt!216402 () Unit!13986)

(assert (=> b!475372 (= lt!216402 lt!216398)))

(declare-fun lt!216412 () ListLongMap!7901)

(assert (=> b!475372 (= lt!216412 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216396 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216396 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216409 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216409 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216397 () Unit!13986)

(assert (=> b!475372 (= lt!216397 (addApplyDifferent!293 lt!216412 lt!216396 minValueAfter!38 lt!216409))))

(assert (=> b!475372 (= (apply!335 (+!1789 lt!216412 (tuple2!8999 lt!216396 minValueAfter!38)) lt!216409) (apply!335 lt!216412 lt!216409))))

(declare-fun lt!216404 () Unit!13986)

(assert (=> b!475372 (= lt!216404 lt!216397)))

(declare-fun lt!216392 () ListLongMap!7901)

(assert (=> b!475372 (= lt!216392 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216406 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216407 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216407 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216394 () Unit!13986)

(assert (=> b!475372 (= lt!216394 (addApplyDifferent!293 lt!216392 lt!216406 zeroValue!794 lt!216407))))

(assert (=> b!475372 (= (apply!335 (+!1789 lt!216392 (tuple2!8999 lt!216406 zeroValue!794)) lt!216407) (apply!335 lt!216392 lt!216407))))

(declare-fun lt!216411 () Unit!13986)

(assert (=> b!475372 (= lt!216411 lt!216394)))

(declare-fun lt!216393 () ListLongMap!7901)

(assert (=> b!475372 (= lt!216393 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216395 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216399 () (_ BitVec 64))

(assert (=> b!475372 (= lt!216399 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475372 (= lt!216413 (addApplyDifferent!293 lt!216393 lt!216395 minValueAfter!38 lt!216399))))

(assert (=> b!475372 (= (apply!335 (+!1789 lt!216393 (tuple2!8999 lt!216395 minValueAfter!38)) lt!216399) (apply!335 lt!216393 lt!216399))))

(declare-fun b!475373 () Bool)

(assert (=> b!475373 (= e!279121 (= (apply!335 lt!216408 (select (arr!14753 _keys!1025) #b00000000000000000000000000000000)) (get!7168 (select (arr!14752 _values!833) #b00000000000000000000000000000000) (dynLambda!931 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15105 _values!833)))))

(assert (=> b!475373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15106 _keys!1025)))))

(declare-fun b!475374 () Bool)

(assert (=> b!475374 (= e!279128 call!30591)))

(declare-fun b!475375 () Bool)

(assert (=> b!475375 (= e!279124 e!279129)))

(declare-fun res!283885 () Bool)

(assert (=> b!475375 (= res!283885 call!30588)))

(assert (=> b!475375 (=> (not res!283885) (not e!279129))))

(declare-fun bm!30588 () Bool)

(assert (=> bm!30588 (= call!30585 (getCurrentListMapNoExtraKeys!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475376 () Bool)

(assert (=> b!475376 (= e!279127 (not call!30587))))

(declare-fun b!475377 () Bool)

(assert (=> b!475377 (= e!279132 (= (apply!335 lt!216408 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475378 () Bool)

(assert (=> b!475378 (= e!279120 (+!1789 call!30589 (tuple2!8999 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75437 c!57133) b!475378))

(assert (= (and d!75437 (not c!57133)) b!475365))

(assert (= (and b!475365 c!57136) b!475371))

(assert (= (and b!475365 (not c!57136)) b!475368))

(assert (= (and b!475368 c!57134) b!475374))

(assert (= (and b!475368 (not c!57134)) b!475367))

(assert (= (or b!475374 b!475367) bm!30585))

(assert (= (or b!475371 bm!30585) bm!30584))

(assert (= (or b!475371 b!475374) bm!30587))

(assert (= (or b!475378 bm!30584) bm!30588))

(assert (= (or b!475378 bm!30587) bm!30582))

(assert (= (and d!75437 res!283886) b!475370))

(assert (= (and d!75437 c!57135) b!475372))

(assert (= (and d!75437 (not c!57135)) b!475364))

(assert (= (and d!75437 res!283882) b!475361))

(assert (= (and b!475361 res!283883) b!475362))

(assert (= (and b!475361 (not res!283879)) b!475358))

(assert (= (and b!475358 res!283878) b!475373))

(assert (= (and b!475361 res!283881) b!475369))

(assert (= (and b!475369 c!57137) b!475360))

(assert (= (and b!475369 (not c!57137)) b!475376))

(assert (= (and b!475360 res!283884) b!475377))

(assert (= (or b!475360 b!475376) bm!30586))

(assert (= (and b!475369 res!283880) b!475366))

(assert (= (and b!475366 c!57132) b!475375))

(assert (= (and b!475366 (not c!57132)) b!475359))

(assert (= (and b!475375 res!283885) b!475363))

(assert (= (or b!475375 b!475359) bm!30583))

(declare-fun b_lambda!10261 () Bool)

(assert (=> (not b_lambda!10261) (not b!475373)))

(assert (=> b!475373 t!15033))

(declare-fun b_and!20521 () Bool)

(assert (= b_and!20519 (and (=> t!15033 result!7455) b_and!20521)))

(assert (=> b!475362 m!456947))

(assert (=> b!475362 m!456947))

(assert (=> b!475362 m!456955))

(declare-fun m!457067 () Bool)

(assert (=> bm!30583 m!457067))

(declare-fun m!457069 () Bool)

(assert (=> bm!30586 m!457069))

(assert (=> d!75437 m!456885))

(declare-fun m!457071 () Bool)

(assert (=> b!475378 m!457071))

(assert (=> b!475372 m!456881))

(declare-fun m!457073 () Bool)

(assert (=> b!475372 m!457073))

(declare-fun m!457075 () Bool)

(assert (=> b!475372 m!457075))

(declare-fun m!457077 () Bool)

(assert (=> b!475372 m!457077))

(assert (=> b!475372 m!456947))

(declare-fun m!457079 () Bool)

(assert (=> b!475372 m!457079))

(declare-fun m!457081 () Bool)

(assert (=> b!475372 m!457081))

(declare-fun m!457083 () Bool)

(assert (=> b!475372 m!457083))

(declare-fun m!457085 () Bool)

(assert (=> b!475372 m!457085))

(declare-fun m!457087 () Bool)

(assert (=> b!475372 m!457087))

(declare-fun m!457089 () Bool)

(assert (=> b!475372 m!457089))

(declare-fun m!457091 () Bool)

(assert (=> b!475372 m!457091))

(declare-fun m!457093 () Bool)

(assert (=> b!475372 m!457093))

(declare-fun m!457095 () Bool)

(assert (=> b!475372 m!457095))

(declare-fun m!457097 () Bool)

(assert (=> b!475372 m!457097))

(declare-fun m!457099 () Bool)

(assert (=> b!475372 m!457099))

(assert (=> b!475372 m!457083))

(assert (=> b!475372 m!457091))

(assert (=> b!475372 m!457079))

(assert (=> b!475372 m!457095))

(declare-fun m!457101 () Bool)

(assert (=> b!475372 m!457101))

(declare-fun m!457103 () Bool)

(assert (=> b!475363 m!457103))

(declare-fun m!457105 () Bool)

(assert (=> b!475377 m!457105))

(declare-fun m!457107 () Bool)

(assert (=> bm!30582 m!457107))

(assert (=> b!475370 m!456947))

(assert (=> b!475370 m!456947))

(assert (=> b!475370 m!456955))

(assert (=> b!475373 m!456963))

(assert (=> b!475373 m!456965))

(assert (=> b!475373 m!456967))

(assert (=> b!475373 m!456965))

(assert (=> b!475373 m!456963))

(assert (=> b!475373 m!456947))

(declare-fun m!457109 () Bool)

(assert (=> b!475373 m!457109))

(assert (=> b!475373 m!456947))

(assert (=> bm!30588 m!456881))

(assert (=> b!475358 m!456947))

(assert (=> b!475358 m!456947))

(declare-fun m!457111 () Bool)

(assert (=> b!475358 m!457111))

(assert (=> b!475160 d!75437))

(declare-fun condMapEmpty!21937 () Bool)

(declare-fun mapDefault!21937 () ValueCell!6392)

(assert (=> mapNonEmpty!21928 (= condMapEmpty!21937 (= mapRest!21928 ((as const (Array (_ BitVec 32) ValueCell!6392)) mapDefault!21937)))))

(declare-fun e!279137 () Bool)

(declare-fun mapRes!21937 () Bool)

(assert (=> mapNonEmpty!21928 (= tp!42172 (and e!279137 mapRes!21937))))

(declare-fun b!475386 () Bool)

(assert (=> b!475386 (= e!279137 tp_is_empty!13471)))

(declare-fun b!475385 () Bool)

(declare-fun e!279138 () Bool)

(assert (=> b!475385 (= e!279138 tp_is_empty!13471)))

(declare-fun mapIsEmpty!21937 () Bool)

(assert (=> mapIsEmpty!21937 mapRes!21937))

(declare-fun mapNonEmpty!21937 () Bool)

(declare-fun tp!42187 () Bool)

(assert (=> mapNonEmpty!21937 (= mapRes!21937 (and tp!42187 e!279138))))

(declare-fun mapKey!21937 () (_ BitVec 32))

(declare-fun mapRest!21937 () (Array (_ BitVec 32) ValueCell!6392))

(declare-fun mapValue!21937 () ValueCell!6392)

(assert (=> mapNonEmpty!21937 (= mapRest!21928 (store mapRest!21937 mapKey!21937 mapValue!21937))))

(assert (= (and mapNonEmpty!21928 condMapEmpty!21937) mapIsEmpty!21937))

(assert (= (and mapNonEmpty!21928 (not condMapEmpty!21937)) mapNonEmpty!21937))

(assert (= (and mapNonEmpty!21937 ((_ is ValueCellFull!6392) mapValue!21937)) b!475385))

(assert (= (and mapNonEmpty!21928 ((_ is ValueCellFull!6392) mapDefault!21937)) b!475386))

(declare-fun m!457113 () Bool)

(assert (=> mapNonEmpty!21937 m!457113))

(declare-fun b_lambda!10263 () Bool)

(assert (= b_lambda!10251 (or (and start!42606 b_free!12043) b_lambda!10263)))

(declare-fun b_lambda!10265 () Bool)

(assert (= b_lambda!10259 (or (and start!42606 b_free!12043) b_lambda!10265)))

(declare-fun b_lambda!10267 () Bool)

(assert (= b_lambda!10257 (or (and start!42606 b_free!12043) b_lambda!10267)))

(declare-fun b_lambda!10269 () Bool)

(assert (= b_lambda!10253 (or (and start!42606 b_free!12043) b_lambda!10269)))

(declare-fun b_lambda!10271 () Bool)

(assert (= b_lambda!10261 (or (and start!42606 b_free!12043) b_lambda!10271)))

(declare-fun b_lambda!10273 () Bool)

(assert (= b_lambda!10255 (or (and start!42606 b_free!12043) b_lambda!10273)))

(check-sat (not b!475269) (not b!475351) (not b!475283) (not b_lambda!10271) (not b!475358) (not bm!30586) (not bm!30575) tp_is_empty!13471 (not b!475285) (not b!475284) (not b!475349) (not b!475294) (not b!475279) (not bm!30579) (not b!475272) (not b!475378) (not b_lambda!10269) (not b!475293) (not d!75429) (not b!475372) (not b!475373) (not b!475341) (not mapNonEmpty!21937) (not b!475370) (not b_next!12043) (not b!475266) (not b!475274) (not d!75437) (not b!475265) (not b!475362) (not d!75431) (not d!75427) (not bm!30581) (not bm!30576) (not b!475352) (not bm!30559) (not bm!30553) (not b!475356) (not bm!30582) (not b!475235) (not b!475278) (not b!475271) (not b!475286) (not b!475236) (not b!475222) (not b!475234) (not b!475280) (not b!475342) (not b!475363) (not bm!30583) (not b!475357) (not b_lambda!10267) (not b!475377) (not bm!30556) b_and!20521 (not b!475221) (not b_lambda!10273) (not b_lambda!10265) (not bm!30560) (not bm!30588) (not b!475337) (not b!475270) (not b_lambda!10263) (not d!75435) (not d!75433) (not b!475264) (not b!475288))
(check-sat b_and!20521 (not b_next!12043))
