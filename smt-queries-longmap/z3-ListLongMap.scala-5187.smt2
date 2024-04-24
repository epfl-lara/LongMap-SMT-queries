; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70274 () Bool)

(assert start!70274)

(declare-fun b_free!12529 () Bool)

(declare-fun b_next!12529 () Bool)

(assert (=> start!70274 (= b_free!12529 (not b_next!12529))))

(declare-fun tp!44302 () Bool)

(declare-fun b_and!21311 () Bool)

(assert (=> start!70274 (= tp!44302 b_and!21311)))

(declare-fun b!815604 () Bool)

(declare-fun res!556778 () Bool)

(declare-fun e!452230 () Bool)

(assert (=> b!815604 (=> (not res!556778) (not e!452230))))

(declare-datatypes ((array!44679 0))(
  ( (array!44680 (arr!21395 (Array (_ BitVec 32) (_ BitVec 64))) (size!21815 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44679)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23987 0))(
  ( (V!23988 (val!7167 Int)) )
))
(declare-datatypes ((ValueCell!6704 0))(
  ( (ValueCellFull!6704 (v!9594 V!23987)) (EmptyCell!6704) )
))
(declare-datatypes ((array!44681 0))(
  ( (array!44682 (arr!21396 (Array (_ BitVec 32) ValueCell!6704)) (size!21816 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44681)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815604 (= res!556778 (and (= (size!21816 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21815 _keys!976) (size!21816 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815605 () Bool)

(declare-fun e!452231 () Bool)

(declare-fun e!452227 () Bool)

(declare-fun mapRes!22939 () Bool)

(assert (=> b!815605 (= e!452231 (and e!452227 mapRes!22939))))

(declare-fun condMapEmpty!22939 () Bool)

(declare-fun mapDefault!22939 () ValueCell!6704)

(assert (=> b!815605 (= condMapEmpty!22939 (= (arr!21396 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6704)) mapDefault!22939)))))

(declare-fun b!815606 () Bool)

(assert (=> b!815606 (= e!452230 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21815 _keys!976)))))))

(declare-datatypes ((tuple2!9312 0))(
  ( (tuple2!9313 (_1!4667 (_ BitVec 64)) (_2!4667 V!23987)) )
))
(declare-datatypes ((List!15129 0))(
  ( (Nil!15126) (Cons!15125 (h!16260 tuple2!9312) (t!21438 List!15129)) )
))
(declare-datatypes ((ListLongMap!8137 0))(
  ( (ListLongMap!8138 (toList!4084 List!15129)) )
))
(declare-fun lt!365086 () ListLongMap!8137)

(declare-fun lt!365087 () ListLongMap!8137)

(assert (=> b!815606 (= lt!365086 lt!365087)))

(declare-datatypes ((Unit!27735 0))(
  ( (Unit!27736) )
))
(declare-fun lt!365088 () Unit!27735)

(declare-fun zeroValueAfter!34 () V!23987)

(declare-fun minValue!754 () V!23987)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!23987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!279 (array!44679 array!44681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 V!23987 V!23987 (_ BitVec 32) Int) Unit!27735)

(assert (=> b!815606 (= lt!365088 (lemmaNoChangeToArrayThenSameMapNoExtras!279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2191 (array!44679 array!44681 (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 (_ BitVec 32) Int) ListLongMap!8137)

(assert (=> b!815606 (= lt!365087 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815606 (= lt!365086 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22939 () Bool)

(assert (=> mapIsEmpty!22939 mapRes!22939))

(declare-fun mapNonEmpty!22939 () Bool)

(declare-fun tp!44301 () Bool)

(declare-fun e!452228 () Bool)

(assert (=> mapNonEmpty!22939 (= mapRes!22939 (and tp!44301 e!452228))))

(declare-fun mapRest!22939 () (Array (_ BitVec 32) ValueCell!6704))

(declare-fun mapKey!22939 () (_ BitVec 32))

(declare-fun mapValue!22939 () ValueCell!6704)

(assert (=> mapNonEmpty!22939 (= (arr!21396 _values!788) (store mapRest!22939 mapKey!22939 mapValue!22939))))

(declare-fun b!815607 () Bool)

(declare-fun tp_is_empty!14239 () Bool)

(assert (=> b!815607 (= e!452228 tp_is_empty!14239)))

(declare-fun b!815603 () Bool)

(assert (=> b!815603 (= e!452227 tp_is_empty!14239)))

(declare-fun res!556780 () Bool)

(assert (=> start!70274 (=> (not res!556780) (not e!452230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70274 (= res!556780 (validMask!0 mask!1312))))

(assert (=> start!70274 e!452230))

(assert (=> start!70274 tp_is_empty!14239))

(declare-fun array_inv!17169 (array!44679) Bool)

(assert (=> start!70274 (array_inv!17169 _keys!976)))

(assert (=> start!70274 true))

(declare-fun array_inv!17170 (array!44681) Bool)

(assert (=> start!70274 (and (array_inv!17170 _values!788) e!452231)))

(assert (=> start!70274 tp!44302))

(declare-fun b!815608 () Bool)

(declare-fun res!556779 () Bool)

(assert (=> b!815608 (=> (not res!556779) (not e!452230))))

(declare-datatypes ((List!15130 0))(
  ( (Nil!15127) (Cons!15126 (h!16261 (_ BitVec 64)) (t!21439 List!15130)) )
))
(declare-fun arrayNoDuplicates!0 (array!44679 (_ BitVec 32) List!15130) Bool)

(assert (=> b!815608 (= res!556779 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15127))))

(declare-fun b!815609 () Bool)

(declare-fun res!556777 () Bool)

(assert (=> b!815609 (=> (not res!556777) (not e!452230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44679 (_ BitVec 32)) Bool)

(assert (=> b!815609 (= res!556777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70274 res!556780) b!815604))

(assert (= (and b!815604 res!556778) b!815609))

(assert (= (and b!815609 res!556777) b!815608))

(assert (= (and b!815608 res!556779) b!815606))

(assert (= (and b!815605 condMapEmpty!22939) mapIsEmpty!22939))

(assert (= (and b!815605 (not condMapEmpty!22939)) mapNonEmpty!22939))

(get-info :version)

(assert (= (and mapNonEmpty!22939 ((_ is ValueCellFull!6704) mapValue!22939)) b!815607))

(assert (= (and b!815605 ((_ is ValueCellFull!6704) mapDefault!22939)) b!815603))

(assert (= start!70274 b!815605))

(declare-fun m!757767 () Bool)

(assert (=> b!815606 m!757767))

(declare-fun m!757769 () Bool)

(assert (=> b!815606 m!757769))

(declare-fun m!757771 () Bool)

(assert (=> b!815606 m!757771))

(declare-fun m!757773 () Bool)

(assert (=> b!815608 m!757773))

(declare-fun m!757775 () Bool)

(assert (=> start!70274 m!757775))

(declare-fun m!757777 () Bool)

(assert (=> start!70274 m!757777))

(declare-fun m!757779 () Bool)

(assert (=> start!70274 m!757779))

(declare-fun m!757781 () Bool)

(assert (=> mapNonEmpty!22939 m!757781))

(declare-fun m!757783 () Bool)

(assert (=> b!815609 m!757783))

(check-sat (not mapNonEmpty!22939) b_and!21311 (not b!815606) (not b!815608) (not b!815609) (not start!70274) (not b_next!12529) tp_is_empty!14239)
(check-sat b_and!21311 (not b_next!12529))
(get-model)

(declare-fun b!815662 () Bool)

(declare-fun e!452272 () Bool)

(declare-fun call!35547 () Bool)

(assert (=> b!815662 (= e!452272 call!35547)))

(declare-fun d!104755 () Bool)

(declare-fun res!556813 () Bool)

(declare-fun e!452273 () Bool)

(assert (=> d!104755 (=> res!556813 e!452273)))

(assert (=> d!104755 (= res!556813 (bvsge #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> d!104755 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15127) e!452273)))

(declare-fun b!815663 () Bool)

(declare-fun e!452271 () Bool)

(assert (=> b!815663 (= e!452271 e!452272)))

(declare-fun c!89204 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!815663 (= c!89204 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815664 () Bool)

(assert (=> b!815664 (= e!452272 call!35547)))

(declare-fun bm!35544 () Bool)

(assert (=> bm!35544 (= call!35547 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89204 (Cons!15126 (select (arr!21395 _keys!976) #b00000000000000000000000000000000) Nil!15127) Nil!15127)))))

(declare-fun b!815665 () Bool)

(assert (=> b!815665 (= e!452273 e!452271)))

(declare-fun res!556812 () Bool)

(assert (=> b!815665 (=> (not res!556812) (not e!452271))))

(declare-fun e!452270 () Bool)

(assert (=> b!815665 (= res!556812 (not e!452270))))

(declare-fun res!556811 () Bool)

(assert (=> b!815665 (=> (not res!556811) (not e!452270))))

(assert (=> b!815665 (= res!556811 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815666 () Bool)

(declare-fun contains!4123 (List!15130 (_ BitVec 64)) Bool)

(assert (=> b!815666 (= e!452270 (contains!4123 Nil!15127 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104755 (not res!556813)) b!815665))

(assert (= (and b!815665 res!556811) b!815666))

(assert (= (and b!815665 res!556812) b!815663))

(assert (= (and b!815663 c!89204) b!815664))

(assert (= (and b!815663 (not c!89204)) b!815662))

(assert (= (or b!815664 b!815662) bm!35544))

(declare-fun m!757821 () Bool)

(assert (=> b!815663 m!757821))

(assert (=> b!815663 m!757821))

(declare-fun m!757823 () Bool)

(assert (=> b!815663 m!757823))

(assert (=> bm!35544 m!757821))

(declare-fun m!757825 () Bool)

(assert (=> bm!35544 m!757825))

(assert (=> b!815665 m!757821))

(assert (=> b!815665 m!757821))

(assert (=> b!815665 m!757823))

(assert (=> b!815666 m!757821))

(assert (=> b!815666 m!757821))

(declare-fun m!757827 () Bool)

(assert (=> b!815666 m!757827))

(assert (=> b!815608 d!104755))

(declare-fun bm!35547 () Bool)

(declare-fun call!35550 () Bool)

(assert (=> bm!35547 (= call!35550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!815675 () Bool)

(declare-fun e!452282 () Bool)

(declare-fun e!452280 () Bool)

(assert (=> b!815675 (= e!452282 e!452280)))

(declare-fun c!89207 () Bool)

(assert (=> b!815675 (= c!89207 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815676 () Bool)

(declare-fun e!452281 () Bool)

(assert (=> b!815676 (= e!452280 e!452281)))

(declare-fun lt!365114 () (_ BitVec 64))

(assert (=> b!815676 (= lt!365114 (select (arr!21395 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365115 () Unit!27735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44679 (_ BitVec 64) (_ BitVec 32)) Unit!27735)

(assert (=> b!815676 (= lt!365115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365114 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!815676 (arrayContainsKey!0 _keys!976 lt!365114 #b00000000000000000000000000000000)))

(declare-fun lt!365113 () Unit!27735)

(assert (=> b!815676 (= lt!365113 lt!365115)))

(declare-fun res!556818 () Bool)

(declare-datatypes ((SeekEntryResult!8671 0))(
  ( (MissingZero!8671 (index!37055 (_ BitVec 32))) (Found!8671 (index!37056 (_ BitVec 32))) (Intermediate!8671 (undefined!9483 Bool) (index!37057 (_ BitVec 32)) (x!68498 (_ BitVec 32))) (Undefined!8671) (MissingVacant!8671 (index!37058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44679 (_ BitVec 32)) SeekEntryResult!8671)

(assert (=> b!815676 (= res!556818 (= (seekEntryOrOpen!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8671 #b00000000000000000000000000000000)))))

(assert (=> b!815676 (=> (not res!556818) (not e!452281))))

(declare-fun b!815677 () Bool)

(assert (=> b!815677 (= e!452281 call!35550)))

(declare-fun d!104757 () Bool)

(declare-fun res!556819 () Bool)

(assert (=> d!104757 (=> res!556819 e!452282)))

(assert (=> d!104757 (= res!556819 (bvsge #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> d!104757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452282)))

(declare-fun b!815678 () Bool)

(assert (=> b!815678 (= e!452280 call!35550)))

(assert (= (and d!104757 (not res!556819)) b!815675))

(assert (= (and b!815675 c!89207) b!815676))

(assert (= (and b!815675 (not c!89207)) b!815678))

(assert (= (and b!815676 res!556818) b!815677))

(assert (= (or b!815677 b!815678) bm!35547))

(declare-fun m!757829 () Bool)

(assert (=> bm!35547 m!757829))

(assert (=> b!815675 m!757821))

(assert (=> b!815675 m!757821))

(assert (=> b!815675 m!757823))

(assert (=> b!815676 m!757821))

(declare-fun m!757831 () Bool)

(assert (=> b!815676 m!757831))

(declare-fun m!757833 () Bool)

(assert (=> b!815676 m!757833))

(assert (=> b!815676 m!757821))

(declare-fun m!757835 () Bool)

(assert (=> b!815676 m!757835))

(assert (=> b!815609 d!104757))

(declare-fun d!104759 () Bool)

(assert (=> d!104759 (= (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365118 () Unit!27735)

(declare-fun choose!1393 (array!44679 array!44681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 V!23987 V!23987 (_ BitVec 32) Int) Unit!27735)

(assert (=> d!104759 (= lt!365118 (choose!1393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104759 (validMask!0 mask!1312)))

(assert (=> d!104759 (= (lemmaNoChangeToArrayThenSameMapNoExtras!279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365118)))

(declare-fun bs!22686 () Bool)

(assert (= bs!22686 d!104759))

(assert (=> bs!22686 m!757771))

(assert (=> bs!22686 m!757769))

(declare-fun m!757837 () Bool)

(assert (=> bs!22686 m!757837))

(assert (=> bs!22686 m!757775))

(assert (=> b!815606 d!104759))

(declare-fun b!815703 () Bool)

(declare-fun e!452297 () ListLongMap!8137)

(assert (=> b!815703 (= e!452297 (ListLongMap!8138 Nil!15126))))

(declare-fun b!815705 () Bool)

(declare-fun res!556830 () Bool)

(declare-fun e!452302 () Bool)

(assert (=> b!815705 (=> (not res!556830) (not e!452302))))

(declare-fun lt!365138 () ListLongMap!8137)

(declare-fun contains!4124 (ListLongMap!8137 (_ BitVec 64)) Bool)

(assert (=> b!815705 (= res!556830 (not (contains!4124 lt!365138 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815706 () Bool)

(declare-fun lt!365133 () Unit!27735)

(declare-fun lt!365136 () Unit!27735)

(assert (=> b!815706 (= lt!365133 lt!365136)))

(declare-fun lt!365135 () (_ BitVec 64))

(declare-fun lt!365137 () (_ BitVec 64))

(declare-fun lt!365134 () V!23987)

(declare-fun lt!365139 () ListLongMap!8137)

(declare-fun +!1787 (ListLongMap!8137 tuple2!9312) ListLongMap!8137)

(assert (=> b!815706 (not (contains!4124 (+!1787 lt!365139 (tuple2!9313 lt!365137 lt!365134)) lt!365135))))

(declare-fun addStillNotContains!175 (ListLongMap!8137 (_ BitVec 64) V!23987 (_ BitVec 64)) Unit!27735)

(assert (=> b!815706 (= lt!365136 (addStillNotContains!175 lt!365139 lt!365137 lt!365134 lt!365135))))

(assert (=> b!815706 (= lt!365135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11474 (ValueCell!6704 V!23987) V!23987)

(declare-fun dynLambda!956 (Int (_ BitVec 64)) V!23987)

(assert (=> b!815706 (= lt!365134 (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815706 (= lt!365137 (select (arr!21395 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35553 () ListLongMap!8137)

(assert (=> b!815706 (= lt!365139 call!35553)))

(declare-fun e!452301 () ListLongMap!8137)

(assert (=> b!815706 (= e!452301 (+!1787 call!35553 (tuple2!9313 (select (arr!21395 _keys!976) #b00000000000000000000000000000000) (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815707 () Bool)

(assert (=> b!815707 (= e!452301 call!35553)))

(declare-fun b!815708 () Bool)

(assert (=> b!815708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> b!815708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21816 _values!788)))))

(declare-fun e!452300 () Bool)

(declare-fun apply!348 (ListLongMap!8137 (_ BitVec 64)) V!23987)

(assert (=> b!815708 (= e!452300 (= (apply!348 lt!365138 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)) (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815704 () Bool)

(declare-fun e!452303 () Bool)

(assert (=> b!815704 (= e!452302 e!452303)))

(declare-fun c!89216 () Bool)

(declare-fun e!452298 () Bool)

(assert (=> b!815704 (= c!89216 e!452298)))

(declare-fun res!556831 () Bool)

(assert (=> b!815704 (=> (not res!556831) (not e!452298))))

(assert (=> b!815704 (= res!556831 (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun d!104761 () Bool)

(assert (=> d!104761 e!452302))

(declare-fun res!556828 () Bool)

(assert (=> d!104761 (=> (not res!556828) (not e!452302))))

(assert (=> d!104761 (= res!556828 (not (contains!4124 lt!365138 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104761 (= lt!365138 e!452297)))

(declare-fun c!89217 () Bool)

(assert (=> d!104761 (= c!89217 (bvsge #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> d!104761 (validMask!0 mask!1312)))

(assert (=> d!104761 (= (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365138)))

(declare-fun b!815709 () Bool)

(assert (=> b!815709 (= e!452298 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815709 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!815710 () Bool)

(declare-fun e!452299 () Bool)

(declare-fun isEmpty!636 (ListLongMap!8137) Bool)

(assert (=> b!815710 (= e!452299 (isEmpty!636 lt!365138))))

(declare-fun b!815711 () Bool)

(assert (=> b!815711 (= e!452297 e!452301)))

(declare-fun c!89219 () Bool)

(assert (=> b!815711 (= c!89219 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35550 () Bool)

(assert (=> bm!35550 (= call!35553 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815712 () Bool)

(assert (=> b!815712 (= e!452303 e!452299)))

(declare-fun c!89218 () Bool)

(assert (=> b!815712 (= c!89218 (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun b!815713 () Bool)

(assert (=> b!815713 (= e!452303 e!452300)))

(assert (=> b!815713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun res!556829 () Bool)

(assert (=> b!815713 (= res!556829 (contains!4124 lt!365138 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815713 (=> (not res!556829) (not e!452300))))

(declare-fun b!815714 () Bool)

(assert (=> b!815714 (= e!452299 (= lt!365138 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(assert (= (and d!104761 c!89217) b!815703))

(assert (= (and d!104761 (not c!89217)) b!815711))

(assert (= (and b!815711 c!89219) b!815706))

(assert (= (and b!815711 (not c!89219)) b!815707))

(assert (= (or b!815706 b!815707) bm!35550))

(assert (= (and d!104761 res!556828) b!815705))

(assert (= (and b!815705 res!556830) b!815704))

(assert (= (and b!815704 res!556831) b!815709))

(assert (= (and b!815704 c!89216) b!815713))

(assert (= (and b!815704 (not c!89216)) b!815712))

(assert (= (and b!815713 res!556829) b!815708))

(assert (= (and b!815712 c!89218) b!815714))

(assert (= (and b!815712 (not c!89218)) b!815710))

(declare-fun b_lambda!10845 () Bool)

(assert (=> (not b_lambda!10845) (not b!815706)))

(declare-fun t!21443 () Bool)

(declare-fun tb!4169 () Bool)

(assert (=> (and start!70274 (= defaultEntry!796 defaultEntry!796) t!21443) tb!4169))

(declare-fun result!7863 () Bool)

(assert (=> tb!4169 (= result!7863 tp_is_empty!14239)))

(assert (=> b!815706 t!21443))

(declare-fun b_and!21317 () Bool)

(assert (= b_and!21311 (and (=> t!21443 result!7863) b_and!21317)))

(declare-fun b_lambda!10847 () Bool)

(assert (=> (not b_lambda!10847) (not b!815708)))

(assert (=> b!815708 t!21443))

(declare-fun b_and!21319 () Bool)

(assert (= b_and!21317 (and (=> t!21443 result!7863) b_and!21319)))

(declare-fun m!757839 () Bool)

(assert (=> bm!35550 m!757839))

(declare-fun m!757841 () Bool)

(assert (=> b!815706 m!757841))

(declare-fun m!757843 () Bool)

(assert (=> b!815706 m!757843))

(declare-fun m!757845 () Bool)

(assert (=> b!815706 m!757845))

(assert (=> b!815706 m!757821))

(declare-fun m!757847 () Bool)

(assert (=> b!815706 m!757847))

(declare-fun m!757849 () Bool)

(assert (=> b!815706 m!757849))

(declare-fun m!757851 () Bool)

(assert (=> b!815706 m!757851))

(assert (=> b!815706 m!757841))

(assert (=> b!815706 m!757845))

(assert (=> b!815706 m!757849))

(declare-fun m!757853 () Bool)

(assert (=> b!815706 m!757853))

(assert (=> b!815713 m!757821))

(assert (=> b!815713 m!757821))

(declare-fun m!757855 () Bool)

(assert (=> b!815713 m!757855))

(assert (=> b!815711 m!757821))

(assert (=> b!815711 m!757821))

(assert (=> b!815711 m!757823))

(assert (=> b!815708 m!757845))

(assert (=> b!815708 m!757849))

(assert (=> b!815708 m!757853))

(assert (=> b!815708 m!757821))

(declare-fun m!757857 () Bool)

(assert (=> b!815708 m!757857))

(assert (=> b!815708 m!757845))

(assert (=> b!815708 m!757821))

(assert (=> b!815708 m!757849))

(declare-fun m!757859 () Bool)

(assert (=> b!815705 m!757859))

(assert (=> b!815714 m!757839))

(assert (=> b!815709 m!757821))

(assert (=> b!815709 m!757821))

(assert (=> b!815709 m!757823))

(declare-fun m!757861 () Bool)

(assert (=> b!815710 m!757861))

(declare-fun m!757863 () Bool)

(assert (=> d!104761 m!757863))

(assert (=> d!104761 m!757775))

(assert (=> b!815606 d!104761))

(declare-fun b!815717 () Bool)

(declare-fun e!452304 () ListLongMap!8137)

(assert (=> b!815717 (= e!452304 (ListLongMap!8138 Nil!15126))))

(declare-fun b!815719 () Bool)

(declare-fun res!556834 () Bool)

(declare-fun e!452309 () Bool)

(assert (=> b!815719 (=> (not res!556834) (not e!452309))))

(declare-fun lt!365145 () ListLongMap!8137)

(assert (=> b!815719 (= res!556834 (not (contains!4124 lt!365145 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815720 () Bool)

(declare-fun lt!365140 () Unit!27735)

(declare-fun lt!365143 () Unit!27735)

(assert (=> b!815720 (= lt!365140 lt!365143)))

(declare-fun lt!365142 () (_ BitVec 64))

(declare-fun lt!365144 () (_ BitVec 64))

(declare-fun lt!365146 () ListLongMap!8137)

(declare-fun lt!365141 () V!23987)

(assert (=> b!815720 (not (contains!4124 (+!1787 lt!365146 (tuple2!9313 lt!365144 lt!365141)) lt!365142))))

(assert (=> b!815720 (= lt!365143 (addStillNotContains!175 lt!365146 lt!365144 lt!365141 lt!365142))))

(assert (=> b!815720 (= lt!365142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815720 (= lt!365141 (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815720 (= lt!365144 (select (arr!21395 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35554 () ListLongMap!8137)

(assert (=> b!815720 (= lt!365146 call!35554)))

(declare-fun e!452308 () ListLongMap!8137)

(assert (=> b!815720 (= e!452308 (+!1787 call!35554 (tuple2!9313 (select (arr!21395 _keys!976) #b00000000000000000000000000000000) (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815721 () Bool)

(assert (=> b!815721 (= e!452308 call!35554)))

(declare-fun b!815722 () Bool)

(assert (=> b!815722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> b!815722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21816 _values!788)))))

(declare-fun e!452307 () Bool)

(assert (=> b!815722 (= e!452307 (= (apply!348 lt!365145 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)) (get!11474 (select (arr!21396 _values!788) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815718 () Bool)

(declare-fun e!452310 () Bool)

(assert (=> b!815718 (= e!452309 e!452310)))

(declare-fun c!89220 () Bool)

(declare-fun e!452305 () Bool)

(assert (=> b!815718 (= c!89220 e!452305)))

(declare-fun res!556835 () Bool)

(assert (=> b!815718 (=> (not res!556835) (not e!452305))))

(assert (=> b!815718 (= res!556835 (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun d!104763 () Bool)

(assert (=> d!104763 e!452309))

(declare-fun res!556832 () Bool)

(assert (=> d!104763 (=> (not res!556832) (not e!452309))))

(assert (=> d!104763 (= res!556832 (not (contains!4124 lt!365145 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104763 (= lt!365145 e!452304)))

(declare-fun c!89221 () Bool)

(assert (=> d!104763 (= c!89221 (bvsge #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(assert (=> d!104763 (validMask!0 mask!1312)))

(assert (=> d!104763 (= (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365145)))

(declare-fun b!815723 () Bool)

(assert (=> b!815723 (= e!452305 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815723 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!815724 () Bool)

(declare-fun e!452306 () Bool)

(assert (=> b!815724 (= e!452306 (isEmpty!636 lt!365145))))

(declare-fun b!815725 () Bool)

(assert (=> b!815725 (= e!452304 e!452308)))

(declare-fun c!89223 () Bool)

(assert (=> b!815725 (= c!89223 (validKeyInArray!0 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35551 () Bool)

(assert (=> bm!35551 (= call!35554 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815726 () Bool)

(assert (=> b!815726 (= e!452310 e!452306)))

(declare-fun c!89222 () Bool)

(assert (=> b!815726 (= c!89222 (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun b!815727 () Bool)

(assert (=> b!815727 (= e!452310 e!452307)))

(assert (=> b!815727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21815 _keys!976)))))

(declare-fun res!556833 () Bool)

(assert (=> b!815727 (= res!556833 (contains!4124 lt!365145 (select (arr!21395 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815727 (=> (not res!556833) (not e!452307))))

(declare-fun b!815728 () Bool)

(assert (=> b!815728 (= e!452306 (= lt!365145 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(assert (= (and d!104763 c!89221) b!815717))

(assert (= (and d!104763 (not c!89221)) b!815725))

(assert (= (and b!815725 c!89223) b!815720))

(assert (= (and b!815725 (not c!89223)) b!815721))

(assert (= (or b!815720 b!815721) bm!35551))

(assert (= (and d!104763 res!556832) b!815719))

(assert (= (and b!815719 res!556834) b!815718))

(assert (= (and b!815718 res!556835) b!815723))

(assert (= (and b!815718 c!89220) b!815727))

(assert (= (and b!815718 (not c!89220)) b!815726))

(assert (= (and b!815727 res!556833) b!815722))

(assert (= (and b!815726 c!89222) b!815728))

(assert (= (and b!815726 (not c!89222)) b!815724))

(declare-fun b_lambda!10849 () Bool)

(assert (=> (not b_lambda!10849) (not b!815720)))

(assert (=> b!815720 t!21443))

(declare-fun b_and!21321 () Bool)

(assert (= b_and!21319 (and (=> t!21443 result!7863) b_and!21321)))

(declare-fun b_lambda!10851 () Bool)

(assert (=> (not b_lambda!10851) (not b!815722)))

(assert (=> b!815722 t!21443))

(declare-fun b_and!21323 () Bool)

(assert (= b_and!21321 (and (=> t!21443 result!7863) b_and!21323)))

(declare-fun m!757865 () Bool)

(assert (=> bm!35551 m!757865))

(declare-fun m!757867 () Bool)

(assert (=> b!815720 m!757867))

(declare-fun m!757869 () Bool)

(assert (=> b!815720 m!757869))

(assert (=> b!815720 m!757845))

(assert (=> b!815720 m!757821))

(declare-fun m!757871 () Bool)

(assert (=> b!815720 m!757871))

(assert (=> b!815720 m!757849))

(declare-fun m!757873 () Bool)

(assert (=> b!815720 m!757873))

(assert (=> b!815720 m!757867))

(assert (=> b!815720 m!757845))

(assert (=> b!815720 m!757849))

(assert (=> b!815720 m!757853))

(assert (=> b!815727 m!757821))

(assert (=> b!815727 m!757821))

(declare-fun m!757875 () Bool)

(assert (=> b!815727 m!757875))

(assert (=> b!815725 m!757821))

(assert (=> b!815725 m!757821))

(assert (=> b!815725 m!757823))

(assert (=> b!815722 m!757845))

(assert (=> b!815722 m!757849))

(assert (=> b!815722 m!757853))

(assert (=> b!815722 m!757821))

(declare-fun m!757877 () Bool)

(assert (=> b!815722 m!757877))

(assert (=> b!815722 m!757845))

(assert (=> b!815722 m!757821))

(assert (=> b!815722 m!757849))

(declare-fun m!757879 () Bool)

(assert (=> b!815719 m!757879))

(assert (=> b!815728 m!757865))

(assert (=> b!815723 m!757821))

(assert (=> b!815723 m!757821))

(assert (=> b!815723 m!757823))

(declare-fun m!757881 () Bool)

(assert (=> b!815724 m!757881))

(declare-fun m!757883 () Bool)

(assert (=> d!104763 m!757883))

(assert (=> d!104763 m!757775))

(assert (=> b!815606 d!104763))

(declare-fun d!104765 () Bool)

(assert (=> d!104765 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70274 d!104765))

(declare-fun d!104767 () Bool)

(assert (=> d!104767 (= (array_inv!17169 _keys!976) (bvsge (size!21815 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70274 d!104767))

(declare-fun d!104769 () Bool)

(assert (=> d!104769 (= (array_inv!17170 _values!788) (bvsge (size!21816 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70274 d!104769))

(declare-fun condMapEmpty!22948 () Bool)

(declare-fun mapDefault!22948 () ValueCell!6704)

(assert (=> mapNonEmpty!22939 (= condMapEmpty!22948 (= mapRest!22939 ((as const (Array (_ BitVec 32) ValueCell!6704)) mapDefault!22948)))))

(declare-fun e!452316 () Bool)

(declare-fun mapRes!22948 () Bool)

(assert (=> mapNonEmpty!22939 (= tp!44301 (and e!452316 mapRes!22948))))

(declare-fun mapNonEmpty!22948 () Bool)

(declare-fun tp!44317 () Bool)

(declare-fun e!452315 () Bool)

(assert (=> mapNonEmpty!22948 (= mapRes!22948 (and tp!44317 e!452315))))

(declare-fun mapRest!22948 () (Array (_ BitVec 32) ValueCell!6704))

(declare-fun mapKey!22948 () (_ BitVec 32))

(declare-fun mapValue!22948 () ValueCell!6704)

(assert (=> mapNonEmpty!22948 (= mapRest!22939 (store mapRest!22948 mapKey!22948 mapValue!22948))))

(declare-fun mapIsEmpty!22948 () Bool)

(assert (=> mapIsEmpty!22948 mapRes!22948))

(declare-fun b!815735 () Bool)

(assert (=> b!815735 (= e!452315 tp_is_empty!14239)))

(declare-fun b!815736 () Bool)

(assert (=> b!815736 (= e!452316 tp_is_empty!14239)))

(assert (= (and mapNonEmpty!22939 condMapEmpty!22948) mapIsEmpty!22948))

(assert (= (and mapNonEmpty!22939 (not condMapEmpty!22948)) mapNonEmpty!22948))

(assert (= (and mapNonEmpty!22948 ((_ is ValueCellFull!6704) mapValue!22948)) b!815735))

(assert (= (and mapNonEmpty!22939 ((_ is ValueCellFull!6704) mapDefault!22948)) b!815736))

(declare-fun m!757885 () Bool)

(assert (=> mapNonEmpty!22948 m!757885))

(declare-fun b_lambda!10853 () Bool)

(assert (= b_lambda!10849 (or (and start!70274 b_free!12529) b_lambda!10853)))

(declare-fun b_lambda!10855 () Bool)

(assert (= b_lambda!10845 (or (and start!70274 b_free!12529) b_lambda!10855)))

(declare-fun b_lambda!10857 () Bool)

(assert (= b_lambda!10851 (or (and start!70274 b_free!12529) b_lambda!10857)))

(declare-fun b_lambda!10859 () Bool)

(assert (= b_lambda!10847 (or (and start!70274 b_free!12529) b_lambda!10859)))

(check-sat (not b!815709) (not d!104761) (not b!815711) (not b!815714) (not b!815720) (not mapNonEmpty!22948) (not b!815727) (not b!815706) (not bm!35550) b_and!21323 (not b!815705) (not b_lambda!10859) (not b_lambda!10853) (not b!815663) (not d!104759) (not d!104763) (not b!815722) (not b!815719) (not b!815666) (not b!815713) (not b!815725) (not b_lambda!10855) (not b!815724) (not b!815676) (not bm!35551) (not bm!35544) (not b_lambda!10857) (not b!815723) (not bm!35547) (not b!815708) (not b_next!12529) (not b!815665) tp_is_empty!14239 (not b!815675) (not b!815728) (not b!815710))
(check-sat b_and!21323 (not b_next!12529))
