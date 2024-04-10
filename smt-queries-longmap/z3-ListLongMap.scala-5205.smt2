; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70246 () Bool)

(assert start!70246)

(declare-fun b_free!12639 () Bool)

(declare-fun b_next!12639 () Bool)

(assert (=> start!70246 (= b_free!12639 (not b_next!12639))))

(declare-fun tp!44637 () Bool)

(declare-fun b_and!21427 () Bool)

(assert (=> start!70246 (= tp!44637 b_and!21427)))

(declare-fun res!557237 () Bool)

(declare-fun e!452666 () Bool)

(assert (=> start!70246 (=> (not res!557237) (not e!452666))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70246 (= res!557237 (validMask!0 mask!1312))))

(assert (=> start!70246 e!452666))

(declare-fun tp_is_empty!14349 () Bool)

(assert (=> start!70246 tp_is_empty!14349))

(declare-datatypes ((array!44898 0))(
  ( (array!44899 (arr!21507 (Array (_ BitVec 32) (_ BitVec 64))) (size!21928 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44898)

(declare-fun array_inv!17209 (array!44898) Bool)

(assert (=> start!70246 (array_inv!17209 _keys!976)))

(assert (=> start!70246 true))

(declare-datatypes ((V!24133 0))(
  ( (V!24134 (val!7222 Int)) )
))
(declare-datatypes ((ValueCell!6759 0))(
  ( (ValueCellFull!6759 (v!9649 V!24133)) (EmptyCell!6759) )
))
(declare-datatypes ((array!44900 0))(
  ( (array!44901 (arr!21508 (Array (_ BitVec 32) ValueCell!6759)) (size!21929 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44900)

(declare-fun e!452663 () Bool)

(declare-fun array_inv!17210 (array!44900) Bool)

(assert (=> start!70246 (and (array_inv!17210 _values!788) e!452663)))

(assert (=> start!70246 tp!44637))

(declare-fun b!816116 () Bool)

(declare-fun e!452664 () Bool)

(declare-fun mapRes!23110 () Bool)

(assert (=> b!816116 (= e!452663 (and e!452664 mapRes!23110))))

(declare-fun condMapEmpty!23110 () Bool)

(declare-fun mapDefault!23110 () ValueCell!6759)

(assert (=> b!816116 (= condMapEmpty!23110 (= (arr!21508 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6759)) mapDefault!23110)))))

(declare-fun b!816117 () Bool)

(declare-fun res!557239 () Bool)

(assert (=> b!816117 (=> (not res!557239) (not e!452666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44898 (_ BitVec 32)) Bool)

(assert (=> b!816117 (= res!557239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816118 () Bool)

(declare-fun res!557235 () Bool)

(assert (=> b!816118 (=> (not res!557235) (not e!452666))))

(declare-datatypes ((List!15314 0))(
  ( (Nil!15311) (Cons!15310 (h!16439 (_ BitVec 64)) (t!21635 List!15314)) )
))
(declare-fun arrayNoDuplicates!0 (array!44898 (_ BitVec 32) List!15314) Bool)

(assert (=> b!816118 (= res!557235 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15311))))

(declare-fun b!816119 () Bool)

(declare-fun e!452665 () Bool)

(assert (=> b!816119 (= e!452665 (bvsle #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun mapNonEmpty!23110 () Bool)

(declare-fun tp!44638 () Bool)

(declare-fun e!452662 () Bool)

(assert (=> mapNonEmpty!23110 (= mapRes!23110 (and tp!44638 e!452662))))

(declare-fun mapValue!23110 () ValueCell!6759)

(declare-fun mapRest!23110 () (Array (_ BitVec 32) ValueCell!6759))

(declare-fun mapKey!23110 () (_ BitVec 32))

(assert (=> mapNonEmpty!23110 (= (arr!21508 _values!788) (store mapRest!23110 mapKey!23110 mapValue!23110))))

(declare-fun b!816120 () Bool)

(declare-fun res!557238 () Bool)

(assert (=> b!816120 (=> (not res!557238) (not e!452666))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816120 (= res!557238 (and (= (size!21929 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21928 _keys!976) (size!21929 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816121 () Bool)

(assert (=> b!816121 (= e!452664 tp_is_empty!14349)))

(declare-fun b!816122 () Bool)

(declare-fun res!557236 () Bool)

(assert (=> b!816122 (=> res!557236 e!452665)))

(declare-fun zeroValueBefore!34 () V!24133)

(declare-fun zeroValueAfter!34 () V!24133)

(declare-fun minValue!754 () V!24133)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9484 0))(
  ( (tuple2!9485 (_1!4753 (_ BitVec 64)) (_2!4753 V!24133)) )
))
(declare-datatypes ((List!15315 0))(
  ( (Nil!15312) (Cons!15311 (h!16440 tuple2!9484) (t!21636 List!15315)) )
))
(declare-datatypes ((ListLongMap!8307 0))(
  ( (ListLongMap!8308 (toList!4169 List!15315)) )
))
(declare-fun +!1802 (ListLongMap!8307 tuple2!9484) ListLongMap!8307)

(declare-fun getCurrentListMap!2396 (array!44898 array!44900 (_ BitVec 32) (_ BitVec 32) V!24133 V!24133 (_ BitVec 32) Int) ListLongMap!8307)

(assert (=> b!816122 (= res!557236 (not (= (+!1802 (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun b!816123 () Bool)

(assert (=> b!816123 (= e!452662 tp_is_empty!14349)))

(declare-fun mapIsEmpty!23110 () Bool)

(assert (=> mapIsEmpty!23110 mapRes!23110))

(declare-fun b!816124 () Bool)

(assert (=> b!816124 (= e!452666 (not e!452665))))

(declare-fun res!557240 () Bool)

(assert (=> b!816124 (=> res!557240 e!452665)))

(assert (=> b!816124 (= res!557240 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365453 () ListLongMap!8307)

(declare-fun lt!365452 () ListLongMap!8307)

(assert (=> b!816124 (= lt!365453 lt!365452)))

(declare-datatypes ((Unit!27826 0))(
  ( (Unit!27827) )
))
(declare-fun lt!365451 () Unit!27826)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!324 (array!44898 array!44900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24133 V!24133 V!24133 V!24133 (_ BitVec 32) Int) Unit!27826)

(assert (=> b!816124 (= lt!365451 (lemmaNoChangeToArrayThenSameMapNoExtras!324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2214 (array!44898 array!44900 (_ BitVec 32) (_ BitVec 32) V!24133 V!24133 (_ BitVec 32) Int) ListLongMap!8307)

(assert (=> b!816124 (= lt!365452 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816124 (= lt!365453 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70246 res!557237) b!816120))

(assert (= (and b!816120 res!557238) b!816117))

(assert (= (and b!816117 res!557239) b!816118))

(assert (= (and b!816118 res!557235) b!816124))

(assert (= (and b!816124 (not res!557240)) b!816122))

(assert (= (and b!816122 (not res!557236)) b!816119))

(assert (= (and b!816116 condMapEmpty!23110) mapIsEmpty!23110))

(assert (= (and b!816116 (not condMapEmpty!23110)) mapNonEmpty!23110))

(get-info :version)

(assert (= (and mapNonEmpty!23110 ((_ is ValueCellFull!6759) mapValue!23110)) b!816123))

(assert (= (and b!816116 ((_ is ValueCellFull!6759) mapDefault!23110)) b!816121))

(assert (= start!70246 b!816116))

(declare-fun m!757757 () Bool)

(assert (=> b!816122 m!757757))

(assert (=> b!816122 m!757757))

(declare-fun m!757759 () Bool)

(assert (=> b!816122 m!757759))

(declare-fun m!757761 () Bool)

(assert (=> b!816122 m!757761))

(declare-fun m!757763 () Bool)

(assert (=> b!816118 m!757763))

(declare-fun m!757765 () Bool)

(assert (=> start!70246 m!757765))

(declare-fun m!757767 () Bool)

(assert (=> start!70246 m!757767))

(declare-fun m!757769 () Bool)

(assert (=> start!70246 m!757769))

(declare-fun m!757771 () Bool)

(assert (=> mapNonEmpty!23110 m!757771))

(declare-fun m!757773 () Bool)

(assert (=> b!816117 m!757773))

(declare-fun m!757775 () Bool)

(assert (=> b!816124 m!757775))

(declare-fun m!757777 () Bool)

(assert (=> b!816124 m!757777))

(declare-fun m!757779 () Bool)

(assert (=> b!816124 m!757779))

(check-sat tp_is_empty!14349 b_and!21427 (not b!816124) (not b_next!12639) (not b!816117) (not b!816122) (not b!816118) (not start!70246) (not mapNonEmpty!23110))
(check-sat b_and!21427 (not b_next!12639))
(get-model)

(declare-fun d!104503 () Bool)

(declare-fun res!557263 () Bool)

(declare-fun e!452693 () Bool)

(assert (=> d!104503 (=> res!557263 e!452693)))

(assert (=> d!104503 (= res!557263 (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452693)))

(declare-fun b!816160 () Bool)

(declare-fun e!452692 () Bool)

(declare-fun e!452691 () Bool)

(assert (=> b!816160 (= e!452692 e!452691)))

(declare-fun lt!365469 () (_ BitVec 64))

(assert (=> b!816160 (= lt!365469 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365470 () Unit!27826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44898 (_ BitVec 64) (_ BitVec 32)) Unit!27826)

(assert (=> b!816160 (= lt!365470 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365469 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!816160 (arrayContainsKey!0 _keys!976 lt!365469 #b00000000000000000000000000000000)))

(declare-fun lt!365471 () Unit!27826)

(assert (=> b!816160 (= lt!365471 lt!365470)))

(declare-fun res!557264 () Bool)

(declare-datatypes ((SeekEntryResult!8722 0))(
  ( (MissingZero!8722 (index!37259 (_ BitVec 32))) (Found!8722 (index!37260 (_ BitVec 32))) (Intermediate!8722 (undefined!9534 Bool) (index!37261 (_ BitVec 32)) (x!68701 (_ BitVec 32))) (Undefined!8722) (MissingVacant!8722 (index!37262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44898 (_ BitVec 32)) SeekEntryResult!8722)

(assert (=> b!816160 (= res!557264 (= (seekEntryOrOpen!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8722 #b00000000000000000000000000000000)))))

(assert (=> b!816160 (=> (not res!557264) (not e!452691))))

(declare-fun b!816161 () Bool)

(declare-fun call!35522 () Bool)

(assert (=> b!816161 (= e!452691 call!35522)))

(declare-fun bm!35519 () Bool)

(assert (=> bm!35519 (= call!35522 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!816162 () Bool)

(assert (=> b!816162 (= e!452692 call!35522)))

(declare-fun b!816163 () Bool)

(assert (=> b!816163 (= e!452693 e!452692)))

(declare-fun c!88971 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!816163 (= c!88971 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104503 (not res!557263)) b!816163))

(assert (= (and b!816163 c!88971) b!816160))

(assert (= (and b!816163 (not c!88971)) b!816162))

(assert (= (and b!816160 res!557264) b!816161))

(assert (= (or b!816161 b!816162) bm!35519))

(declare-fun m!757805 () Bool)

(assert (=> b!816160 m!757805))

(declare-fun m!757807 () Bool)

(assert (=> b!816160 m!757807))

(declare-fun m!757809 () Bool)

(assert (=> b!816160 m!757809))

(assert (=> b!816160 m!757805))

(declare-fun m!757811 () Bool)

(assert (=> b!816160 m!757811))

(declare-fun m!757813 () Bool)

(assert (=> bm!35519 m!757813))

(assert (=> b!816163 m!757805))

(assert (=> b!816163 m!757805))

(declare-fun m!757815 () Bool)

(assert (=> b!816163 m!757815))

(assert (=> b!816117 d!104503))

(declare-fun d!104505 () Bool)

(assert (=> d!104505 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70246 d!104505))

(declare-fun d!104507 () Bool)

(assert (=> d!104507 (= (array_inv!17209 _keys!976) (bvsge (size!21928 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70246 d!104507))

(declare-fun d!104509 () Bool)

(assert (=> d!104509 (= (array_inv!17210 _values!788) (bvsge (size!21929 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70246 d!104509))

(declare-fun d!104511 () Bool)

(declare-fun e!452696 () Bool)

(assert (=> d!104511 e!452696))

(declare-fun res!557269 () Bool)

(assert (=> d!104511 (=> (not res!557269) (not e!452696))))

(declare-fun lt!365480 () ListLongMap!8307)

(declare-fun contains!4149 (ListLongMap!8307 (_ BitVec 64)) Bool)

(assert (=> d!104511 (= res!557269 (contains!4149 lt!365480 (_1!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!365483 () List!15315)

(assert (=> d!104511 (= lt!365480 (ListLongMap!8308 lt!365483))))

(declare-fun lt!365482 () Unit!27826)

(declare-fun lt!365481 () Unit!27826)

(assert (=> d!104511 (= lt!365482 lt!365481)))

(declare-datatypes ((Option!406 0))(
  ( (Some!405 (v!9651 V!24133)) (None!404) )
))
(declare-fun getValueByKey!400 (List!15315 (_ BitVec 64)) Option!406)

(assert (=> d!104511 (= (getValueByKey!400 lt!365483 (_1!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!405 (_2!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!214 (List!15315 (_ BitVec 64) V!24133) Unit!27826)

(assert (=> d!104511 (= lt!365481 (lemmaContainsTupThenGetReturnValue!214 lt!365483 (_1!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!253 (List!15315 (_ BitVec 64) V!24133) List!15315)

(assert (=> d!104511 (= lt!365483 (insertStrictlySorted!253 (toList!4169 (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104511 (= (+!1802 (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!365480)))

(declare-fun b!816168 () Bool)

(declare-fun res!557270 () Bool)

(assert (=> b!816168 (=> (not res!557270) (not e!452696))))

(assert (=> b!816168 (= res!557270 (= (getValueByKey!400 (toList!4169 lt!365480) (_1!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!405 (_2!4753 (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!816169 () Bool)

(declare-fun contains!4150 (List!15315 tuple2!9484) Bool)

(assert (=> b!816169 (= e!452696 (contains!4150 (toList!4169 lt!365480) (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104511 res!557269) b!816168))

(assert (= (and b!816168 res!557270) b!816169))

(declare-fun m!757817 () Bool)

(assert (=> d!104511 m!757817))

(declare-fun m!757819 () Bool)

(assert (=> d!104511 m!757819))

(declare-fun m!757821 () Bool)

(assert (=> d!104511 m!757821))

(declare-fun m!757823 () Bool)

(assert (=> d!104511 m!757823))

(declare-fun m!757825 () Bool)

(assert (=> b!816168 m!757825))

(declare-fun m!757827 () Bool)

(assert (=> b!816169 m!757827))

(assert (=> b!816122 d!104511))

(declare-fun b!816212 () Bool)

(declare-fun lt!365533 () ListLongMap!8307)

(declare-fun e!452733 () Bool)

(declare-fun apply!350 (ListLongMap!8307 (_ BitVec 64)) V!24133)

(declare-fun get!11509 (ValueCell!6759 V!24133) V!24133)

(declare-fun dynLambda!961 (Int (_ BitVec 64)) V!24133)

(assert (=> b!816212 (= e!452733 (= (apply!350 lt!365533 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21929 _values!788)))))

(assert (=> b!816212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816213 () Bool)

(declare-fun c!88989 () Bool)

(assert (=> b!816213 (= c!88989 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!452725 () ListLongMap!8307)

(declare-fun e!452731 () ListLongMap!8307)

(assert (=> b!816213 (= e!452725 e!452731)))

(declare-fun call!35541 () ListLongMap!8307)

(declare-fun call!35539 () ListLongMap!8307)

(declare-fun bm!35534 () Bool)

(declare-fun call!35537 () ListLongMap!8307)

(declare-fun c!88988 () Bool)

(declare-fun c!88984 () Bool)

(declare-fun call!35540 () ListLongMap!8307)

(assert (=> bm!35534 (= call!35539 (+!1802 (ite c!88988 call!35540 (ite c!88984 call!35541 call!35537)) (ite (or c!88988 c!88984) (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!816214 () Bool)

(declare-fun e!452734 () Bool)

(declare-fun call!35538 () Bool)

(assert (=> b!816214 (= e!452734 (not call!35538))))

(declare-fun b!816216 () Bool)

(declare-fun e!452735 () Bool)

(assert (=> b!816216 (= e!452735 (= (apply!350 lt!365533 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35535 () Bool)

(declare-fun call!35542 () Bool)

(assert (=> bm!35535 (= call!35542 (contains!4149 lt!365533 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816217 () Bool)

(declare-fun call!35543 () ListLongMap!8307)

(assert (=> b!816217 (= e!452725 call!35543)))

(declare-fun b!816218 () Bool)

(declare-fun res!557297 () Bool)

(declare-fun e!452726 () Bool)

(assert (=> b!816218 (=> (not res!557297) (not e!452726))))

(assert (=> b!816218 (= res!557297 e!452734)))

(declare-fun c!88987 () Bool)

(assert (=> b!816218 (= c!88987 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!816219 () Bool)

(declare-fun e!452730 () ListLongMap!8307)

(assert (=> b!816219 (= e!452730 (+!1802 call!35539 (tuple2!9485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!816220 () Bool)

(assert (=> b!816220 (= e!452731 call!35537)))

(declare-fun b!816221 () Bool)

(declare-fun res!557291 () Bool)

(assert (=> b!816221 (=> (not res!557291) (not e!452726))))

(declare-fun e!452729 () Bool)

(assert (=> b!816221 (= res!557291 e!452729)))

(declare-fun res!557292 () Bool)

(assert (=> b!816221 (=> res!557292 e!452729)))

(declare-fun e!452723 () Bool)

(assert (=> b!816221 (= res!557292 (not e!452723))))

(declare-fun res!557294 () Bool)

(assert (=> b!816221 (=> (not res!557294) (not e!452723))))

(assert (=> b!816221 (= res!557294 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816222 () Bool)

(declare-fun e!452727 () Bool)

(assert (=> b!816222 (= e!452727 e!452735)))

(declare-fun res!557295 () Bool)

(assert (=> b!816222 (= res!557295 call!35542)))

(assert (=> b!816222 (=> (not res!557295) (not e!452735))))

(declare-fun b!816223 () Bool)

(assert (=> b!816223 (= e!452727 (not call!35542))))

(declare-fun b!816224 () Bool)

(declare-fun e!452724 () Bool)

(assert (=> b!816224 (= e!452734 e!452724)))

(declare-fun res!557290 () Bool)

(assert (=> b!816224 (= res!557290 call!35538)))

(assert (=> b!816224 (=> (not res!557290) (not e!452724))))

(declare-fun b!816225 () Bool)

(assert (=> b!816225 (= e!452723 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104513 () Bool)

(assert (=> d!104513 e!452726))

(declare-fun res!557296 () Bool)

(assert (=> d!104513 (=> (not res!557296) (not e!452726))))

(assert (=> d!104513 (= res!557296 (or (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))))

(declare-fun lt!365545 () ListLongMap!8307)

(assert (=> d!104513 (= lt!365533 lt!365545)))

(declare-fun lt!365530 () Unit!27826)

(declare-fun e!452732 () Unit!27826)

(assert (=> d!104513 (= lt!365530 e!452732)))

(declare-fun c!88985 () Bool)

(declare-fun e!452728 () Bool)

(assert (=> d!104513 (= c!88985 e!452728)))

(declare-fun res!557293 () Bool)

(assert (=> d!104513 (=> (not res!557293) (not e!452728))))

(assert (=> d!104513 (= res!557293 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104513 (= lt!365545 e!452730)))

(assert (=> d!104513 (= c!88988 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104513 (validMask!0 mask!1312)))

(assert (=> d!104513 (= (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365533)))

(declare-fun b!816215 () Bool)

(declare-fun Unit!27830 () Unit!27826)

(assert (=> b!816215 (= e!452732 Unit!27830)))

(declare-fun b!816226 () Bool)

(assert (=> b!816226 (= e!452729 e!452733)))

(declare-fun res!557289 () Bool)

(assert (=> b!816226 (=> (not res!557289) (not e!452733))))

(assert (=> b!816226 (= res!557289 (contains!4149 lt!365533 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun bm!35536 () Bool)

(assert (=> bm!35536 (= call!35538 (contains!4149 lt!365533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816227 () Bool)

(assert (=> b!816227 (= e!452731 call!35543)))

(declare-fun b!816228 () Bool)

(assert (=> b!816228 (= e!452730 e!452725)))

(assert (=> b!816228 (= c!88984 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35537 () Bool)

(assert (=> bm!35537 (= call!35541 call!35540)))

(declare-fun b!816229 () Bool)

(assert (=> b!816229 (= e!452726 e!452727)))

(declare-fun c!88986 () Bool)

(assert (=> b!816229 (= c!88986 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35538 () Bool)

(assert (=> bm!35538 (= call!35543 call!35539)))

(declare-fun bm!35539 () Bool)

(assert (=> bm!35539 (= call!35540 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35540 () Bool)

(assert (=> bm!35540 (= call!35537 call!35541)))

(declare-fun b!816230 () Bool)

(assert (=> b!816230 (= e!452724 (= (apply!350 lt!365533 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!816231 () Bool)

(assert (=> b!816231 (= e!452728 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816232 () Bool)

(declare-fun lt!365540 () Unit!27826)

(assert (=> b!816232 (= e!452732 lt!365540)))

(declare-fun lt!365546 () ListLongMap!8307)

(assert (=> b!816232 (= lt!365546 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365532 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365528 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365528 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365537 () Unit!27826)

(declare-fun addStillContains!305 (ListLongMap!8307 (_ BitVec 64) V!24133 (_ BitVec 64)) Unit!27826)

(assert (=> b!816232 (= lt!365537 (addStillContains!305 lt!365546 lt!365532 zeroValueBefore!34 lt!365528))))

(assert (=> b!816232 (contains!4149 (+!1802 lt!365546 (tuple2!9485 lt!365532 zeroValueBefore!34)) lt!365528)))

(declare-fun lt!365548 () Unit!27826)

(assert (=> b!816232 (= lt!365548 lt!365537)))

(declare-fun lt!365542 () ListLongMap!8307)

(assert (=> b!816232 (= lt!365542 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365539 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365539 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365543 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365543 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365535 () Unit!27826)

(declare-fun addApplyDifferent!305 (ListLongMap!8307 (_ BitVec 64) V!24133 (_ BitVec 64)) Unit!27826)

(assert (=> b!816232 (= lt!365535 (addApplyDifferent!305 lt!365542 lt!365539 minValue!754 lt!365543))))

(assert (=> b!816232 (= (apply!350 (+!1802 lt!365542 (tuple2!9485 lt!365539 minValue!754)) lt!365543) (apply!350 lt!365542 lt!365543))))

(declare-fun lt!365541 () Unit!27826)

(assert (=> b!816232 (= lt!365541 lt!365535)))

(declare-fun lt!365544 () ListLongMap!8307)

(assert (=> b!816232 (= lt!365544 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365549 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365547 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365547 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365531 () Unit!27826)

(assert (=> b!816232 (= lt!365531 (addApplyDifferent!305 lt!365544 lt!365549 zeroValueBefore!34 lt!365547))))

(assert (=> b!816232 (= (apply!350 (+!1802 lt!365544 (tuple2!9485 lt!365549 zeroValueBefore!34)) lt!365547) (apply!350 lt!365544 lt!365547))))

(declare-fun lt!365538 () Unit!27826)

(assert (=> b!816232 (= lt!365538 lt!365531)))

(declare-fun lt!365534 () ListLongMap!8307)

(assert (=> b!816232 (= lt!365534 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365529 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365529 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365536 () (_ BitVec 64))

(assert (=> b!816232 (= lt!365536 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816232 (= lt!365540 (addApplyDifferent!305 lt!365534 lt!365529 minValue!754 lt!365536))))

(assert (=> b!816232 (= (apply!350 (+!1802 lt!365534 (tuple2!9485 lt!365529 minValue!754)) lt!365536) (apply!350 lt!365534 lt!365536))))

(assert (= (and d!104513 c!88988) b!816219))

(assert (= (and d!104513 (not c!88988)) b!816228))

(assert (= (and b!816228 c!88984) b!816217))

(assert (= (and b!816228 (not c!88984)) b!816213))

(assert (= (and b!816213 c!88989) b!816227))

(assert (= (and b!816213 (not c!88989)) b!816220))

(assert (= (or b!816227 b!816220) bm!35540))

(assert (= (or b!816217 bm!35540) bm!35537))

(assert (= (or b!816217 b!816227) bm!35538))

(assert (= (or b!816219 bm!35537) bm!35539))

(assert (= (or b!816219 bm!35538) bm!35534))

(assert (= (and d!104513 res!557293) b!816231))

(assert (= (and d!104513 c!88985) b!816232))

(assert (= (and d!104513 (not c!88985)) b!816215))

(assert (= (and d!104513 res!557296) b!816221))

(assert (= (and b!816221 res!557294) b!816225))

(assert (= (and b!816221 (not res!557292)) b!816226))

(assert (= (and b!816226 res!557289) b!816212))

(assert (= (and b!816221 res!557291) b!816218))

(assert (= (and b!816218 c!88987) b!816224))

(assert (= (and b!816218 (not c!88987)) b!816214))

(assert (= (and b!816224 res!557290) b!816230))

(assert (= (or b!816224 b!816214) bm!35536))

(assert (= (and b!816218 res!557297) b!816229))

(assert (= (and b!816229 c!88986) b!816222))

(assert (= (and b!816229 (not c!88986)) b!816223))

(assert (= (and b!816222 res!557295) b!816216))

(assert (= (or b!816222 b!816223) bm!35535))

(declare-fun b_lambda!10863 () Bool)

(assert (=> (not b_lambda!10863) (not b!816212)))

(declare-fun t!21639 () Bool)

(declare-fun tb!4181 () Bool)

(assert (=> (and start!70246 (= defaultEntry!796 defaultEntry!796) t!21639) tb!4181))

(declare-fun result!7883 () Bool)

(assert (=> tb!4181 (= result!7883 tp_is_empty!14349)))

(assert (=> b!816212 t!21639))

(declare-fun b_and!21431 () Bool)

(assert (= b_and!21427 (and (=> t!21639 result!7883) b_and!21431)))

(declare-fun m!757829 () Bool)

(assert (=> b!816219 m!757829))

(declare-fun m!757831 () Bool)

(assert (=> b!816212 m!757831))

(assert (=> b!816212 m!757805))

(declare-fun m!757833 () Bool)

(assert (=> b!816212 m!757833))

(declare-fun m!757835 () Bool)

(assert (=> b!816212 m!757835))

(assert (=> b!816212 m!757835))

(assert (=> b!816212 m!757831))

(declare-fun m!757837 () Bool)

(assert (=> b!816212 m!757837))

(assert (=> b!816212 m!757805))

(declare-fun m!757839 () Bool)

(assert (=> bm!35534 m!757839))

(assert (=> b!816226 m!757805))

(assert (=> b!816226 m!757805))

(declare-fun m!757841 () Bool)

(assert (=> b!816226 m!757841))

(assert (=> bm!35539 m!757779))

(assert (=> b!816231 m!757805))

(assert (=> b!816231 m!757805))

(assert (=> b!816231 m!757815))

(declare-fun m!757843 () Bool)

(assert (=> bm!35535 m!757843))

(declare-fun m!757845 () Bool)

(assert (=> bm!35536 m!757845))

(assert (=> b!816225 m!757805))

(assert (=> b!816225 m!757805))

(assert (=> b!816225 m!757815))

(assert (=> b!816232 m!757805))

(declare-fun m!757847 () Bool)

(assert (=> b!816232 m!757847))

(declare-fun m!757849 () Bool)

(assert (=> b!816232 m!757849))

(assert (=> b!816232 m!757847))

(declare-fun m!757851 () Bool)

(assert (=> b!816232 m!757851))

(declare-fun m!757853 () Bool)

(assert (=> b!816232 m!757853))

(declare-fun m!757855 () Bool)

(assert (=> b!816232 m!757855))

(declare-fun m!757857 () Bool)

(assert (=> b!816232 m!757857))

(declare-fun m!757859 () Bool)

(assert (=> b!816232 m!757859))

(declare-fun m!757861 () Bool)

(assert (=> b!816232 m!757861))

(declare-fun m!757863 () Bool)

(assert (=> b!816232 m!757863))

(assert (=> b!816232 m!757859))

(assert (=> b!816232 m!757855))

(declare-fun m!757865 () Bool)

(assert (=> b!816232 m!757865))

(assert (=> b!816232 m!757779))

(declare-fun m!757867 () Bool)

(assert (=> b!816232 m!757867))

(declare-fun m!757869 () Bool)

(assert (=> b!816232 m!757869))

(declare-fun m!757871 () Bool)

(assert (=> b!816232 m!757871))

(declare-fun m!757873 () Bool)

(assert (=> b!816232 m!757873))

(assert (=> b!816232 m!757867))

(declare-fun m!757875 () Bool)

(assert (=> b!816232 m!757875))

(declare-fun m!757877 () Bool)

(assert (=> b!816230 m!757877))

(assert (=> d!104513 m!757765))

(declare-fun m!757879 () Bool)

(assert (=> b!816216 m!757879))

(assert (=> b!816122 d!104513))

(declare-fun e!452746 () Bool)

(declare-fun lt!365555 () ListLongMap!8307)

(declare-fun b!816235 () Bool)

(assert (=> b!816235 (= e!452746 (= (apply!350 lt!365555 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21929 _values!788)))))

(assert (=> b!816235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816236 () Bool)

(declare-fun c!88995 () Bool)

(assert (=> b!816236 (= c!88995 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!452738 () ListLongMap!8307)

(declare-fun e!452744 () ListLongMap!8307)

(assert (=> b!816236 (= e!452738 e!452744)))

(declare-fun call!35547 () ListLongMap!8307)

(declare-fun call!35548 () ListLongMap!8307)

(declare-fun c!88990 () Bool)

(declare-fun call!35544 () ListLongMap!8307)

(declare-fun call!35546 () ListLongMap!8307)

(declare-fun c!88994 () Bool)

(declare-fun bm!35541 () Bool)

(assert (=> bm!35541 (= call!35546 (+!1802 (ite c!88994 call!35547 (ite c!88990 call!35548 call!35544)) (ite (or c!88994 c!88990) (tuple2!9485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!816237 () Bool)

(declare-fun e!452747 () Bool)

(declare-fun call!35545 () Bool)

(assert (=> b!816237 (= e!452747 (not call!35545))))

(declare-fun b!816239 () Bool)

(declare-fun e!452748 () Bool)

(assert (=> b!816239 (= e!452748 (= (apply!350 lt!365555 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35542 () Bool)

(declare-fun call!35549 () Bool)

(assert (=> bm!35542 (= call!35549 (contains!4149 lt!365555 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816240 () Bool)

(declare-fun call!35550 () ListLongMap!8307)

(assert (=> b!816240 (= e!452738 call!35550)))

(declare-fun b!816241 () Bool)

(declare-fun res!557306 () Bool)

(declare-fun e!452739 () Bool)

(assert (=> b!816241 (=> (not res!557306) (not e!452739))))

(assert (=> b!816241 (= res!557306 e!452747)))

(declare-fun c!88993 () Bool)

(assert (=> b!816241 (= c!88993 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!816242 () Bool)

(declare-fun e!452743 () ListLongMap!8307)

(assert (=> b!816242 (= e!452743 (+!1802 call!35546 (tuple2!9485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!816243 () Bool)

(assert (=> b!816243 (= e!452744 call!35544)))

(declare-fun b!816244 () Bool)

(declare-fun res!557300 () Bool)

(assert (=> b!816244 (=> (not res!557300) (not e!452739))))

(declare-fun e!452742 () Bool)

(assert (=> b!816244 (= res!557300 e!452742)))

(declare-fun res!557301 () Bool)

(assert (=> b!816244 (=> res!557301 e!452742)))

(declare-fun e!452736 () Bool)

(assert (=> b!816244 (= res!557301 (not e!452736))))

(declare-fun res!557303 () Bool)

(assert (=> b!816244 (=> (not res!557303) (not e!452736))))

(assert (=> b!816244 (= res!557303 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816245 () Bool)

(declare-fun e!452740 () Bool)

(assert (=> b!816245 (= e!452740 e!452748)))

(declare-fun res!557304 () Bool)

(assert (=> b!816245 (= res!557304 call!35549)))

(assert (=> b!816245 (=> (not res!557304) (not e!452748))))

(declare-fun b!816246 () Bool)

(assert (=> b!816246 (= e!452740 (not call!35549))))

(declare-fun b!816247 () Bool)

(declare-fun e!452737 () Bool)

(assert (=> b!816247 (= e!452747 e!452737)))

(declare-fun res!557299 () Bool)

(assert (=> b!816247 (= res!557299 call!35545)))

(assert (=> b!816247 (=> (not res!557299) (not e!452737))))

(declare-fun b!816248 () Bool)

(assert (=> b!816248 (= e!452736 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104515 () Bool)

(assert (=> d!104515 e!452739))

(declare-fun res!557305 () Bool)

(assert (=> d!104515 (=> (not res!557305) (not e!452739))))

(assert (=> d!104515 (= res!557305 (or (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))))

(declare-fun lt!365567 () ListLongMap!8307)

(assert (=> d!104515 (= lt!365555 lt!365567)))

(declare-fun lt!365552 () Unit!27826)

(declare-fun e!452745 () Unit!27826)

(assert (=> d!104515 (= lt!365552 e!452745)))

(declare-fun c!88991 () Bool)

(declare-fun e!452741 () Bool)

(assert (=> d!104515 (= c!88991 e!452741)))

(declare-fun res!557302 () Bool)

(assert (=> d!104515 (=> (not res!557302) (not e!452741))))

(assert (=> d!104515 (= res!557302 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104515 (= lt!365567 e!452743)))

(assert (=> d!104515 (= c!88994 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104515 (validMask!0 mask!1312)))

(assert (=> d!104515 (= (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365555)))

(declare-fun b!816238 () Bool)

(declare-fun Unit!27831 () Unit!27826)

(assert (=> b!816238 (= e!452745 Unit!27831)))

(declare-fun b!816249 () Bool)

(assert (=> b!816249 (= e!452742 e!452746)))

(declare-fun res!557298 () Bool)

(assert (=> b!816249 (=> (not res!557298) (not e!452746))))

(assert (=> b!816249 (= res!557298 (contains!4149 lt!365555 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun bm!35543 () Bool)

(assert (=> bm!35543 (= call!35545 (contains!4149 lt!365555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816250 () Bool)

(assert (=> b!816250 (= e!452744 call!35550)))

(declare-fun b!816251 () Bool)

(assert (=> b!816251 (= e!452743 e!452738)))

(assert (=> b!816251 (= c!88990 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35544 () Bool)

(assert (=> bm!35544 (= call!35548 call!35547)))

(declare-fun b!816252 () Bool)

(assert (=> b!816252 (= e!452739 e!452740)))

(declare-fun c!88992 () Bool)

(assert (=> b!816252 (= c!88992 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35545 () Bool)

(assert (=> bm!35545 (= call!35550 call!35546)))

(declare-fun bm!35546 () Bool)

(assert (=> bm!35546 (= call!35547 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35547 () Bool)

(assert (=> bm!35547 (= call!35544 call!35548)))

(declare-fun b!816253 () Bool)

(assert (=> b!816253 (= e!452737 (= (apply!350 lt!365555 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!816254 () Bool)

(assert (=> b!816254 (= e!452741 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816255 () Bool)

(declare-fun lt!365562 () Unit!27826)

(assert (=> b!816255 (= e!452745 lt!365562)))

(declare-fun lt!365568 () ListLongMap!8307)

(assert (=> b!816255 (= lt!365568 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365554 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365550 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365550 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365559 () Unit!27826)

(assert (=> b!816255 (= lt!365559 (addStillContains!305 lt!365568 lt!365554 zeroValueAfter!34 lt!365550))))

(assert (=> b!816255 (contains!4149 (+!1802 lt!365568 (tuple2!9485 lt!365554 zeroValueAfter!34)) lt!365550)))

(declare-fun lt!365570 () Unit!27826)

(assert (=> b!816255 (= lt!365570 lt!365559)))

(declare-fun lt!365564 () ListLongMap!8307)

(assert (=> b!816255 (= lt!365564 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365561 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365561 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365565 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365565 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365557 () Unit!27826)

(assert (=> b!816255 (= lt!365557 (addApplyDifferent!305 lt!365564 lt!365561 minValue!754 lt!365565))))

(assert (=> b!816255 (= (apply!350 (+!1802 lt!365564 (tuple2!9485 lt!365561 minValue!754)) lt!365565) (apply!350 lt!365564 lt!365565))))

(declare-fun lt!365563 () Unit!27826)

(assert (=> b!816255 (= lt!365563 lt!365557)))

(declare-fun lt!365566 () ListLongMap!8307)

(assert (=> b!816255 (= lt!365566 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365571 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365571 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365569 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365569 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365553 () Unit!27826)

(assert (=> b!816255 (= lt!365553 (addApplyDifferent!305 lt!365566 lt!365571 zeroValueAfter!34 lt!365569))))

(assert (=> b!816255 (= (apply!350 (+!1802 lt!365566 (tuple2!9485 lt!365571 zeroValueAfter!34)) lt!365569) (apply!350 lt!365566 lt!365569))))

(declare-fun lt!365560 () Unit!27826)

(assert (=> b!816255 (= lt!365560 lt!365553)))

(declare-fun lt!365556 () ListLongMap!8307)

(assert (=> b!816255 (= lt!365556 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365551 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365551 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365558 () (_ BitVec 64))

(assert (=> b!816255 (= lt!365558 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816255 (= lt!365562 (addApplyDifferent!305 lt!365556 lt!365551 minValue!754 lt!365558))))

(assert (=> b!816255 (= (apply!350 (+!1802 lt!365556 (tuple2!9485 lt!365551 minValue!754)) lt!365558) (apply!350 lt!365556 lt!365558))))

(assert (= (and d!104515 c!88994) b!816242))

(assert (= (and d!104515 (not c!88994)) b!816251))

(assert (= (and b!816251 c!88990) b!816240))

(assert (= (and b!816251 (not c!88990)) b!816236))

(assert (= (and b!816236 c!88995) b!816250))

(assert (= (and b!816236 (not c!88995)) b!816243))

(assert (= (or b!816250 b!816243) bm!35547))

(assert (= (or b!816240 bm!35547) bm!35544))

(assert (= (or b!816240 b!816250) bm!35545))

(assert (= (or b!816242 bm!35544) bm!35546))

(assert (= (or b!816242 bm!35545) bm!35541))

(assert (= (and d!104515 res!557302) b!816254))

(assert (= (and d!104515 c!88991) b!816255))

(assert (= (and d!104515 (not c!88991)) b!816238))

(assert (= (and d!104515 res!557305) b!816244))

(assert (= (and b!816244 res!557303) b!816248))

(assert (= (and b!816244 (not res!557301)) b!816249))

(assert (= (and b!816249 res!557298) b!816235))

(assert (= (and b!816244 res!557300) b!816241))

(assert (= (and b!816241 c!88993) b!816247))

(assert (= (and b!816241 (not c!88993)) b!816237))

(assert (= (and b!816247 res!557299) b!816253))

(assert (= (or b!816247 b!816237) bm!35543))

(assert (= (and b!816241 res!557306) b!816252))

(assert (= (and b!816252 c!88992) b!816245))

(assert (= (and b!816252 (not c!88992)) b!816246))

(assert (= (and b!816245 res!557304) b!816239))

(assert (= (or b!816245 b!816246) bm!35542))

(declare-fun b_lambda!10865 () Bool)

(assert (=> (not b_lambda!10865) (not b!816235)))

(assert (=> b!816235 t!21639))

(declare-fun b_and!21433 () Bool)

(assert (= b_and!21431 (and (=> t!21639 result!7883) b_and!21433)))

(declare-fun m!757881 () Bool)

(assert (=> b!816242 m!757881))

(assert (=> b!816235 m!757831))

(assert (=> b!816235 m!757805))

(declare-fun m!757883 () Bool)

(assert (=> b!816235 m!757883))

(assert (=> b!816235 m!757835))

(assert (=> b!816235 m!757835))

(assert (=> b!816235 m!757831))

(assert (=> b!816235 m!757837))

(assert (=> b!816235 m!757805))

(declare-fun m!757885 () Bool)

(assert (=> bm!35541 m!757885))

(assert (=> b!816249 m!757805))

(assert (=> b!816249 m!757805))

(declare-fun m!757887 () Bool)

(assert (=> b!816249 m!757887))

(assert (=> bm!35546 m!757777))

(assert (=> b!816254 m!757805))

(assert (=> b!816254 m!757805))

(assert (=> b!816254 m!757815))

(declare-fun m!757889 () Bool)

(assert (=> bm!35542 m!757889))

(declare-fun m!757891 () Bool)

(assert (=> bm!35543 m!757891))

(assert (=> b!816248 m!757805))

(assert (=> b!816248 m!757805))

(assert (=> b!816248 m!757815))

(assert (=> b!816255 m!757805))

(declare-fun m!757893 () Bool)

(assert (=> b!816255 m!757893))

(declare-fun m!757895 () Bool)

(assert (=> b!816255 m!757895))

(assert (=> b!816255 m!757893))

(declare-fun m!757897 () Bool)

(assert (=> b!816255 m!757897))

(declare-fun m!757899 () Bool)

(assert (=> b!816255 m!757899))

(declare-fun m!757901 () Bool)

(assert (=> b!816255 m!757901))

(declare-fun m!757903 () Bool)

(assert (=> b!816255 m!757903))

(declare-fun m!757905 () Bool)

(assert (=> b!816255 m!757905))

(declare-fun m!757907 () Bool)

(assert (=> b!816255 m!757907))

(declare-fun m!757909 () Bool)

(assert (=> b!816255 m!757909))

(assert (=> b!816255 m!757905))

(assert (=> b!816255 m!757901))

(declare-fun m!757911 () Bool)

(assert (=> b!816255 m!757911))

(assert (=> b!816255 m!757777))

(declare-fun m!757913 () Bool)

(assert (=> b!816255 m!757913))

(declare-fun m!757915 () Bool)

(assert (=> b!816255 m!757915))

(declare-fun m!757917 () Bool)

(assert (=> b!816255 m!757917))

(declare-fun m!757919 () Bool)

(assert (=> b!816255 m!757919))

(assert (=> b!816255 m!757913))

(declare-fun m!757921 () Bool)

(assert (=> b!816255 m!757921))

(declare-fun m!757923 () Bool)

(assert (=> b!816253 m!757923))

(assert (=> d!104515 m!757765))

(declare-fun m!757925 () Bool)

(assert (=> b!816239 m!757925))

(assert (=> b!816122 d!104515))

(declare-fun d!104517 () Bool)

(declare-fun res!557313 () Bool)

(declare-fun e!452760 () Bool)

(assert (=> d!104517 (=> res!557313 e!452760)))

(assert (=> d!104517 (= res!557313 (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104517 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15311) e!452760)))

(declare-fun b!816266 () Bool)

(declare-fun e!452758 () Bool)

(declare-fun e!452759 () Bool)

(assert (=> b!816266 (= e!452758 e!452759)))

(declare-fun c!88998 () Bool)

(assert (=> b!816266 (= c!88998 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816267 () Bool)

(declare-fun call!35553 () Bool)

(assert (=> b!816267 (= e!452759 call!35553)))

(declare-fun b!816268 () Bool)

(assert (=> b!816268 (= e!452760 e!452758)))

(declare-fun res!557314 () Bool)

(assert (=> b!816268 (=> (not res!557314) (not e!452758))))

(declare-fun e!452757 () Bool)

(assert (=> b!816268 (= res!557314 (not e!452757))))

(declare-fun res!557315 () Bool)

(assert (=> b!816268 (=> (not res!557315) (not e!452757))))

(assert (=> b!816268 (= res!557315 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816269 () Bool)

(assert (=> b!816269 (= e!452759 call!35553)))

(declare-fun bm!35550 () Bool)

(assert (=> bm!35550 (= call!35553 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88998 (Cons!15310 (select (arr!21507 _keys!976) #b00000000000000000000000000000000) Nil!15311) Nil!15311)))))

(declare-fun b!816270 () Bool)

(declare-fun contains!4151 (List!15314 (_ BitVec 64)) Bool)

(assert (=> b!816270 (= e!452757 (contains!4151 Nil!15311 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104517 (not res!557313)) b!816268))

(assert (= (and b!816268 res!557315) b!816270))

(assert (= (and b!816268 res!557314) b!816266))

(assert (= (and b!816266 c!88998) b!816267))

(assert (= (and b!816266 (not c!88998)) b!816269))

(assert (= (or b!816267 b!816269) bm!35550))

(assert (=> b!816266 m!757805))

(assert (=> b!816266 m!757805))

(assert (=> b!816266 m!757815))

(assert (=> b!816268 m!757805))

(assert (=> b!816268 m!757805))

(assert (=> b!816268 m!757815))

(assert (=> bm!35550 m!757805))

(declare-fun m!757927 () Bool)

(assert (=> bm!35550 m!757927))

(assert (=> b!816270 m!757805))

(assert (=> b!816270 m!757805))

(declare-fun m!757929 () Bool)

(assert (=> b!816270 m!757929))

(assert (=> b!816118 d!104517))

(declare-fun d!104519 () Bool)

(assert (=> d!104519 (= (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365574 () Unit!27826)

(declare-fun choose!1389 (array!44898 array!44900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24133 V!24133 V!24133 V!24133 (_ BitVec 32) Int) Unit!27826)

(assert (=> d!104519 (= lt!365574 (choose!1389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104519 (validMask!0 mask!1312)))

(assert (=> d!104519 (= (lemmaNoChangeToArrayThenSameMapNoExtras!324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365574)))

(declare-fun bs!22728 () Bool)

(assert (= bs!22728 d!104519))

(assert (=> bs!22728 m!757779))

(assert (=> bs!22728 m!757777))

(declare-fun m!757931 () Bool)

(assert (=> bs!22728 m!757931))

(assert (=> bs!22728 m!757765))

(assert (=> b!816124 d!104519))

(declare-fun b!816295 () Bool)

(declare-fun lt!365592 () Unit!27826)

(declare-fun lt!365594 () Unit!27826)

(assert (=> b!816295 (= lt!365592 lt!365594)))

(declare-fun lt!365595 () (_ BitVec 64))

(declare-fun lt!365591 () V!24133)

(declare-fun lt!365593 () (_ BitVec 64))

(declare-fun lt!365590 () ListLongMap!8307)

(assert (=> b!816295 (not (contains!4149 (+!1802 lt!365590 (tuple2!9485 lt!365595 lt!365591)) lt!365593))))

(declare-fun addStillNotContains!175 (ListLongMap!8307 (_ BitVec 64) V!24133 (_ BitVec 64)) Unit!27826)

(assert (=> b!816295 (= lt!365594 (addStillNotContains!175 lt!365590 lt!365595 lt!365591 lt!365593))))

(assert (=> b!816295 (= lt!365593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!816295 (= lt!365591 (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816295 (= lt!365595 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35556 () ListLongMap!8307)

(assert (=> b!816295 (= lt!365590 call!35556)))

(declare-fun e!452777 () ListLongMap!8307)

(assert (=> b!816295 (= e!452777 (+!1802 call!35556 (tuple2!9485 (select (arr!21507 _keys!976) #b00000000000000000000000000000000) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!816296 () Bool)

(declare-fun e!452778 () Bool)

(declare-fun lt!365589 () ListLongMap!8307)

(declare-fun isEmpty!632 (ListLongMap!8307) Bool)

(assert (=> b!816296 (= e!452778 (isEmpty!632 lt!365589))))

(declare-fun b!816297 () Bool)

(assert (=> b!816297 (= e!452777 call!35556)))

(declare-fun b!816298 () Bool)

(declare-fun e!452776 () Bool)

(declare-fun e!452780 () Bool)

(assert (=> b!816298 (= e!452776 e!452780)))

(assert (=> b!816298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun res!557325 () Bool)

(assert (=> b!816298 (= res!557325 (contains!4149 lt!365589 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816298 (=> (not res!557325) (not e!452780))))

(declare-fun b!816299 () Bool)

(assert (=> b!816299 (= e!452778 (= lt!365589 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!816300 () Bool)

(assert (=> b!816300 (= e!452776 e!452778)))

(declare-fun c!89009 () Bool)

(assert (=> b!816300 (= c!89009 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816301 () Bool)

(declare-fun res!557327 () Bool)

(declare-fun e!452781 () Bool)

(assert (=> b!816301 (=> (not res!557327) (not e!452781))))

(assert (=> b!816301 (= res!557327 (not (contains!4149 lt!365589 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35553 () Bool)

(assert (=> bm!35553 (= call!35556 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!104521 () Bool)

(assert (=> d!104521 e!452781))

(declare-fun res!557326 () Bool)

(assert (=> d!104521 (=> (not res!557326) (not e!452781))))

(assert (=> d!104521 (= res!557326 (not (contains!4149 lt!365589 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!452775 () ListLongMap!8307)

(assert (=> d!104521 (= lt!365589 e!452775)))

(declare-fun c!89007 () Bool)

(assert (=> d!104521 (= c!89007 (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104521 (validMask!0 mask!1312)))

(assert (=> d!104521 (= (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365589)))

(declare-fun b!816302 () Bool)

(declare-fun e!452779 () Bool)

(assert (=> b!816302 (= e!452779 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816302 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!816303 () Bool)

(assert (=> b!816303 (= e!452781 e!452776)))

(declare-fun c!89010 () Bool)

(assert (=> b!816303 (= c!89010 e!452779)))

(declare-fun res!557324 () Bool)

(assert (=> b!816303 (=> (not res!557324) (not e!452779))))

(assert (=> b!816303 (= res!557324 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816304 () Bool)

(assert (=> b!816304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> b!816304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21929 _values!788)))))

(assert (=> b!816304 (= e!452780 (= (apply!350 lt!365589 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!816305 () Bool)

(assert (=> b!816305 (= e!452775 e!452777)))

(declare-fun c!89008 () Bool)

(assert (=> b!816305 (= c!89008 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816306 () Bool)

(assert (=> b!816306 (= e!452775 (ListLongMap!8308 Nil!15312))))

(assert (= (and d!104521 c!89007) b!816306))

(assert (= (and d!104521 (not c!89007)) b!816305))

(assert (= (and b!816305 c!89008) b!816295))

(assert (= (and b!816305 (not c!89008)) b!816297))

(assert (= (or b!816295 b!816297) bm!35553))

(assert (= (and d!104521 res!557326) b!816301))

(assert (= (and b!816301 res!557327) b!816303))

(assert (= (and b!816303 res!557324) b!816302))

(assert (= (and b!816303 c!89010) b!816298))

(assert (= (and b!816303 (not c!89010)) b!816300))

(assert (= (and b!816298 res!557325) b!816304))

(assert (= (and b!816300 c!89009) b!816299))

(assert (= (and b!816300 (not c!89009)) b!816296))

(declare-fun b_lambda!10867 () Bool)

(assert (=> (not b_lambda!10867) (not b!816295)))

(assert (=> b!816295 t!21639))

(declare-fun b_and!21435 () Bool)

(assert (= b_and!21433 (and (=> t!21639 result!7883) b_and!21435)))

(declare-fun b_lambda!10869 () Bool)

(assert (=> (not b_lambda!10869) (not b!816304)))

(assert (=> b!816304 t!21639))

(declare-fun b_and!21437 () Bool)

(assert (= b_and!21435 (and (=> t!21639 result!7883) b_and!21437)))

(declare-fun m!757933 () Bool)

(assert (=> bm!35553 m!757933))

(declare-fun m!757935 () Bool)

(assert (=> d!104521 m!757935))

(assert (=> d!104521 m!757765))

(declare-fun m!757937 () Bool)

(assert (=> b!816295 m!757937))

(declare-fun m!757939 () Bool)

(assert (=> b!816295 m!757939))

(assert (=> b!816295 m!757831))

(assert (=> b!816295 m!757835))

(assert (=> b!816295 m!757835))

(assert (=> b!816295 m!757831))

(assert (=> b!816295 m!757837))

(assert (=> b!816295 m!757805))

(declare-fun m!757941 () Bool)

(assert (=> b!816295 m!757941))

(assert (=> b!816295 m!757939))

(declare-fun m!757943 () Bool)

(assert (=> b!816295 m!757943))

(assert (=> b!816305 m!757805))

(assert (=> b!816305 m!757805))

(assert (=> b!816305 m!757815))

(declare-fun m!757945 () Bool)

(assert (=> b!816296 m!757945))

(assert (=> b!816304 m!757831))

(assert (=> b!816304 m!757835))

(assert (=> b!816304 m!757835))

(assert (=> b!816304 m!757831))

(assert (=> b!816304 m!757837))

(assert (=> b!816304 m!757805))

(declare-fun m!757947 () Bool)

(assert (=> b!816304 m!757947))

(assert (=> b!816304 m!757805))

(assert (=> b!816298 m!757805))

(assert (=> b!816298 m!757805))

(declare-fun m!757949 () Bool)

(assert (=> b!816298 m!757949))

(declare-fun m!757951 () Bool)

(assert (=> b!816301 m!757951))

(assert (=> b!816302 m!757805))

(assert (=> b!816302 m!757805))

(assert (=> b!816302 m!757815))

(assert (=> b!816299 m!757933))

(assert (=> b!816124 d!104521))

(declare-fun b!816307 () Bool)

(declare-fun lt!365599 () Unit!27826)

(declare-fun lt!365601 () Unit!27826)

(assert (=> b!816307 (= lt!365599 lt!365601)))

(declare-fun lt!365602 () (_ BitVec 64))

(declare-fun lt!365600 () (_ BitVec 64))

(declare-fun lt!365597 () ListLongMap!8307)

(declare-fun lt!365598 () V!24133)

(assert (=> b!816307 (not (contains!4149 (+!1802 lt!365597 (tuple2!9485 lt!365602 lt!365598)) lt!365600))))

(assert (=> b!816307 (= lt!365601 (addStillNotContains!175 lt!365597 lt!365602 lt!365598 lt!365600))))

(assert (=> b!816307 (= lt!365600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!816307 (= lt!365598 (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816307 (= lt!365602 (select (arr!21507 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35557 () ListLongMap!8307)

(assert (=> b!816307 (= lt!365597 call!35557)))

(declare-fun e!452784 () ListLongMap!8307)

(assert (=> b!816307 (= e!452784 (+!1802 call!35557 (tuple2!9485 (select (arr!21507 _keys!976) #b00000000000000000000000000000000) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!816308 () Bool)

(declare-fun e!452785 () Bool)

(declare-fun lt!365596 () ListLongMap!8307)

(assert (=> b!816308 (= e!452785 (isEmpty!632 lt!365596))))

(declare-fun b!816309 () Bool)

(assert (=> b!816309 (= e!452784 call!35557)))

(declare-fun b!816310 () Bool)

(declare-fun e!452783 () Bool)

(declare-fun e!452787 () Bool)

(assert (=> b!816310 (= e!452783 e!452787)))

(assert (=> b!816310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun res!557329 () Bool)

(assert (=> b!816310 (= res!557329 (contains!4149 lt!365596 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816310 (=> (not res!557329) (not e!452787))))

(declare-fun b!816311 () Bool)

(assert (=> b!816311 (= e!452785 (= lt!365596 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!816312 () Bool)

(assert (=> b!816312 (= e!452783 e!452785)))

(declare-fun c!89013 () Bool)

(assert (=> b!816312 (= c!89013 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816313 () Bool)

(declare-fun res!557331 () Bool)

(declare-fun e!452788 () Bool)

(assert (=> b!816313 (=> (not res!557331) (not e!452788))))

(assert (=> b!816313 (= res!557331 (not (contains!4149 lt!365596 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35554 () Bool)

(assert (=> bm!35554 (= call!35557 (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!104523 () Bool)

(assert (=> d!104523 e!452788))

(declare-fun res!557330 () Bool)

(assert (=> d!104523 (=> (not res!557330) (not e!452788))))

(assert (=> d!104523 (= res!557330 (not (contains!4149 lt!365596 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!452782 () ListLongMap!8307)

(assert (=> d!104523 (= lt!365596 e!452782)))

(declare-fun c!89011 () Bool)

(assert (=> d!104523 (= c!89011 (bvsge #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> d!104523 (validMask!0 mask!1312)))

(assert (=> d!104523 (= (getCurrentListMapNoExtraKeys!2214 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365596)))

(declare-fun b!816314 () Bool)

(declare-fun e!452786 () Bool)

(assert (=> b!816314 (= e!452786 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816314 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!816315 () Bool)

(assert (=> b!816315 (= e!452788 e!452783)))

(declare-fun c!89014 () Bool)

(assert (=> b!816315 (= c!89014 e!452786)))

(declare-fun res!557328 () Bool)

(assert (=> b!816315 (=> (not res!557328) (not e!452786))))

(assert (=> b!816315 (= res!557328 (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(declare-fun b!816316 () Bool)

(assert (=> b!816316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21928 _keys!976)))))

(assert (=> b!816316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21929 _values!788)))))

(assert (=> b!816316 (= e!452787 (= (apply!350 lt!365596 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)) (get!11509 (select (arr!21508 _values!788) #b00000000000000000000000000000000) (dynLambda!961 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!816317 () Bool)

(assert (=> b!816317 (= e!452782 e!452784)))

(declare-fun c!89012 () Bool)

(assert (=> b!816317 (= c!89012 (validKeyInArray!0 (select (arr!21507 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816318 () Bool)

(assert (=> b!816318 (= e!452782 (ListLongMap!8308 Nil!15312))))

(assert (= (and d!104523 c!89011) b!816318))

(assert (= (and d!104523 (not c!89011)) b!816317))

(assert (= (and b!816317 c!89012) b!816307))

(assert (= (and b!816317 (not c!89012)) b!816309))

(assert (= (or b!816307 b!816309) bm!35554))

(assert (= (and d!104523 res!557330) b!816313))

(assert (= (and b!816313 res!557331) b!816315))

(assert (= (and b!816315 res!557328) b!816314))

(assert (= (and b!816315 c!89014) b!816310))

(assert (= (and b!816315 (not c!89014)) b!816312))

(assert (= (and b!816310 res!557329) b!816316))

(assert (= (and b!816312 c!89013) b!816311))

(assert (= (and b!816312 (not c!89013)) b!816308))

(declare-fun b_lambda!10871 () Bool)

(assert (=> (not b_lambda!10871) (not b!816307)))

(assert (=> b!816307 t!21639))

(declare-fun b_and!21439 () Bool)

(assert (= b_and!21437 (and (=> t!21639 result!7883) b_and!21439)))

(declare-fun b_lambda!10873 () Bool)

(assert (=> (not b_lambda!10873) (not b!816316)))

(assert (=> b!816316 t!21639))

(declare-fun b_and!21441 () Bool)

(assert (= b_and!21439 (and (=> t!21639 result!7883) b_and!21441)))

(declare-fun m!757953 () Bool)

(assert (=> bm!35554 m!757953))

(declare-fun m!757955 () Bool)

(assert (=> d!104523 m!757955))

(assert (=> d!104523 m!757765))

(declare-fun m!757957 () Bool)

(assert (=> b!816307 m!757957))

(declare-fun m!757959 () Bool)

(assert (=> b!816307 m!757959))

(assert (=> b!816307 m!757831))

(assert (=> b!816307 m!757835))

(assert (=> b!816307 m!757835))

(assert (=> b!816307 m!757831))

(assert (=> b!816307 m!757837))

(assert (=> b!816307 m!757805))

(declare-fun m!757961 () Bool)

(assert (=> b!816307 m!757961))

(assert (=> b!816307 m!757959))

(declare-fun m!757963 () Bool)

(assert (=> b!816307 m!757963))

(assert (=> b!816317 m!757805))

(assert (=> b!816317 m!757805))

(assert (=> b!816317 m!757815))

(declare-fun m!757965 () Bool)

(assert (=> b!816308 m!757965))

(assert (=> b!816316 m!757831))

(assert (=> b!816316 m!757835))

(assert (=> b!816316 m!757835))

(assert (=> b!816316 m!757831))

(assert (=> b!816316 m!757837))

(assert (=> b!816316 m!757805))

(declare-fun m!757967 () Bool)

(assert (=> b!816316 m!757967))

(assert (=> b!816316 m!757805))

(assert (=> b!816310 m!757805))

(assert (=> b!816310 m!757805))

(declare-fun m!757969 () Bool)

(assert (=> b!816310 m!757969))

(declare-fun m!757971 () Bool)

(assert (=> b!816313 m!757971))

(assert (=> b!816314 m!757805))

(assert (=> b!816314 m!757805))

(assert (=> b!816314 m!757815))

(assert (=> b!816311 m!757953))

(assert (=> b!816124 d!104523))

(declare-fun mapIsEmpty!23116 () Bool)

(declare-fun mapRes!23116 () Bool)

(assert (=> mapIsEmpty!23116 mapRes!23116))

(declare-fun mapNonEmpty!23116 () Bool)

(declare-fun tp!44647 () Bool)

(declare-fun e!452794 () Bool)

(assert (=> mapNonEmpty!23116 (= mapRes!23116 (and tp!44647 e!452794))))

(declare-fun mapKey!23116 () (_ BitVec 32))

(declare-fun mapValue!23116 () ValueCell!6759)

(declare-fun mapRest!23116 () (Array (_ BitVec 32) ValueCell!6759))

(assert (=> mapNonEmpty!23116 (= mapRest!23110 (store mapRest!23116 mapKey!23116 mapValue!23116))))

(declare-fun condMapEmpty!23116 () Bool)

(declare-fun mapDefault!23116 () ValueCell!6759)

(assert (=> mapNonEmpty!23110 (= condMapEmpty!23116 (= mapRest!23110 ((as const (Array (_ BitVec 32) ValueCell!6759)) mapDefault!23116)))))

(declare-fun e!452793 () Bool)

(assert (=> mapNonEmpty!23110 (= tp!44638 (and e!452793 mapRes!23116))))

(declare-fun b!816326 () Bool)

(assert (=> b!816326 (= e!452793 tp_is_empty!14349)))

(declare-fun b!816325 () Bool)

(assert (=> b!816325 (= e!452794 tp_is_empty!14349)))

(assert (= (and mapNonEmpty!23110 condMapEmpty!23116) mapIsEmpty!23116))

(assert (= (and mapNonEmpty!23110 (not condMapEmpty!23116)) mapNonEmpty!23116))

(assert (= (and mapNonEmpty!23116 ((_ is ValueCellFull!6759) mapValue!23116)) b!816325))

(assert (= (and mapNonEmpty!23110 ((_ is ValueCellFull!6759) mapDefault!23116)) b!816326))

(declare-fun m!757973 () Bool)

(assert (=> mapNonEmpty!23116 m!757973))

(declare-fun b_lambda!10875 () Bool)

(assert (= b_lambda!10873 (or (and start!70246 b_free!12639) b_lambda!10875)))

(declare-fun b_lambda!10877 () Bool)

(assert (= b_lambda!10865 (or (and start!70246 b_free!12639) b_lambda!10877)))

(declare-fun b_lambda!10879 () Bool)

(assert (= b_lambda!10869 (or (and start!70246 b_free!12639) b_lambda!10879)))

(declare-fun b_lambda!10881 () Bool)

(assert (= b_lambda!10871 (or (and start!70246 b_free!12639) b_lambda!10881)))

(declare-fun b_lambda!10883 () Bool)

(assert (= b_lambda!10863 (or (and start!70246 b_free!12639) b_lambda!10883)))

(declare-fun b_lambda!10885 () Bool)

(assert (= b_lambda!10867 (or (and start!70246 b_free!12639) b_lambda!10885)))

(check-sat (not b!816313) (not b!816232) (not b!816239) (not b!816270) (not d!104513) tp_is_empty!14349 (not bm!35543) (not b!816160) (not bm!35542) (not b!816314) (not bm!35539) (not b!816304) (not b!816295) (not b!816249) (not b!816254) (not b!816225) (not bm!35535) (not b!816219) (not b!816255) (not b_lambda!10883) (not b!816163) (not b!816296) (not b!816305) (not bm!35546) (not b!816301) (not b_lambda!10877) (not b_lambda!10885) (not b!816253) (not mapNonEmpty!23116) (not b!816298) (not b!816266) (not b!816242) (not d!104519) (not b_lambda!10881) (not bm!35553) (not d!104523) (not b!816268) (not bm!35550) (not d!104521) (not b!816299) (not b!816168) (not d!104515) (not b_lambda!10875) (not b!816317) (not b!816169) (not b!816235) b_and!21441 (not bm!35554) (not b!816302) (not b!816316) (not d!104511) (not b!816216) (not bm!35541) (not b!816311) (not b!816308) (not b_next!12639) (not b_lambda!10879) (not b!816230) (not b!816226) (not b!816307) (not bm!35519) (not b!816231) (not b!816310) (not b!816248) (not bm!35536) (not b!816212) (not bm!35534))
(check-sat b_and!21441 (not b_next!12639))
