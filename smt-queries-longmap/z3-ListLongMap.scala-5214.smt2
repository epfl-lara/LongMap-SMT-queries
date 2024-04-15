; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70296 () Bool)

(assert start!70296)

(declare-fun b_free!12691 () Bool)

(declare-fun b_next!12691 () Bool)

(assert (=> start!70296 (= b_free!12691 (not b_next!12691))))

(declare-fun tp!44796 () Bool)

(declare-fun b_and!21465 () Bool)

(assert (=> start!70296 (= tp!44796 b_and!21465)))

(declare-fun res!557599 () Bool)

(declare-fun e!453093 () Bool)

(assert (=> start!70296 (=> (not res!557599) (not e!453093))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70296 (= res!557599 (validMask!0 mask!1312))))

(assert (=> start!70296 e!453093))

(declare-fun tp_is_empty!14401 () Bool)

(assert (=> start!70296 tp_is_empty!14401))

(declare-datatypes ((array!44979 0))(
  ( (array!44980 (arr!21547 (Array (_ BitVec 32) (_ BitVec 64))) (size!21968 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44979)

(declare-fun array_inv!17313 (array!44979) Bool)

(assert (=> start!70296 (array_inv!17313 _keys!976)))

(assert (=> start!70296 true))

(declare-datatypes ((V!24203 0))(
  ( (V!24204 (val!7248 Int)) )
))
(declare-datatypes ((ValueCell!6785 0))(
  ( (ValueCellFull!6785 (v!9670 V!24203)) (EmptyCell!6785) )
))
(declare-datatypes ((array!44981 0))(
  ( (array!44982 (arr!21548 (Array (_ BitVec 32) ValueCell!6785)) (size!21969 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44981)

(declare-fun e!453089 () Bool)

(declare-fun array_inv!17314 (array!44981) Bool)

(assert (=> start!70296 (and (array_inv!17314 _values!788) e!453089)))

(assert (=> start!70296 tp!44796))

(declare-fun mapNonEmpty!23191 () Bool)

(declare-fun mapRes!23191 () Bool)

(declare-fun tp!44797 () Bool)

(declare-fun e!453092 () Bool)

(assert (=> mapNonEmpty!23191 (= mapRes!23191 (and tp!44797 e!453092))))

(declare-fun mapRest!23191 () (Array (_ BitVec 32) ValueCell!6785))

(declare-fun mapValue!23191 () ValueCell!6785)

(declare-fun mapKey!23191 () (_ BitVec 32))

(assert (=> mapNonEmpty!23191 (= (arr!21548 _values!788) (store mapRest!23191 mapKey!23191 mapValue!23191))))

(declare-fun b!816675 () Bool)

(declare-fun res!557598 () Bool)

(assert (=> b!816675 (=> (not res!557598) (not e!453093))))

(declare-datatypes ((List!15364 0))(
  ( (Nil!15361) (Cons!15360 (h!16489 (_ BitVec 64)) (t!21678 List!15364)) )
))
(declare-fun arrayNoDuplicates!0 (array!44979 (_ BitVec 32) List!15364) Bool)

(assert (=> b!816675 (= res!557598 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15361))))

(declare-fun b!816676 () Bool)

(declare-fun e!453090 () Bool)

(assert (=> b!816676 (= e!453090 tp_is_empty!14401)))

(declare-fun b!816677 () Bool)

(declare-fun res!557601 () Bool)

(declare-fun e!453094 () Bool)

(assert (=> b!816677 (=> res!557601 e!453094)))

(declare-fun zeroValueBefore!34 () V!24203)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24203)

(declare-fun minValue!754 () V!24203)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9542 0))(
  ( (tuple2!9543 (_1!4782 (_ BitVec 64)) (_2!4782 V!24203)) )
))
(declare-datatypes ((List!15365 0))(
  ( (Nil!15362) (Cons!15361 (h!16490 tuple2!9542) (t!21679 List!15365)) )
))
(declare-datatypes ((ListLongMap!8355 0))(
  ( (ListLongMap!8356 (toList!4193 List!15365)) )
))
(declare-fun +!1852 (ListLongMap!8355 tuple2!9542) ListLongMap!8355)

(declare-fun getCurrentListMap!2364 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 (_ BitVec 32) Int) ListLongMap!8355)

(assert (=> b!816677 (= res!557601 (not (= (+!1852 (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun b!816678 () Bool)

(assert (=> b!816678 (= e!453089 (and e!453090 mapRes!23191))))

(declare-fun condMapEmpty!23191 () Bool)

(declare-fun mapDefault!23191 () ValueCell!6785)

(assert (=> b!816678 (= condMapEmpty!23191 (= (arr!21548 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6785)) mapDefault!23191)))))

(declare-fun b!816679 () Bool)

(assert (=> b!816679 (= e!453094 (bvsle #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816680 () Bool)

(assert (=> b!816680 (= e!453092 tp_is_empty!14401)))

(declare-fun mapIsEmpty!23191 () Bool)

(assert (=> mapIsEmpty!23191 mapRes!23191))

(declare-fun b!816681 () Bool)

(assert (=> b!816681 (= e!453093 (not e!453094))))

(declare-fun res!557600 () Bool)

(assert (=> b!816681 (=> res!557600 e!453094)))

(assert (=> b!816681 (= res!557600 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365727 () ListLongMap!8355)

(declare-fun lt!365726 () ListLongMap!8355)

(assert (=> b!816681 (= lt!365727 lt!365726)))

(declare-datatypes ((Unit!27812 0))(
  ( (Unit!27813) )
))
(declare-fun lt!365728 () Unit!27812)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!346 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 V!24203 V!24203 (_ BitVec 32) Int) Unit!27812)

(assert (=> b!816681 (= lt!365728 (lemmaNoChangeToArrayThenSameMapNoExtras!346 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2253 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 (_ BitVec 32) Int) ListLongMap!8355)

(assert (=> b!816681 (= lt!365726 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816681 (= lt!365727 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816682 () Bool)

(declare-fun res!557603 () Bool)

(assert (=> b!816682 (=> (not res!557603) (not e!453093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44979 (_ BitVec 32)) Bool)

(assert (=> b!816682 (= res!557603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816683 () Bool)

(declare-fun res!557602 () Bool)

(assert (=> b!816683 (=> (not res!557602) (not e!453093))))

(assert (=> b!816683 (= res!557602 (and (= (size!21969 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21968 _keys!976) (size!21969 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70296 res!557599) b!816683))

(assert (= (and b!816683 res!557602) b!816682))

(assert (= (and b!816682 res!557603) b!816675))

(assert (= (and b!816675 res!557598) b!816681))

(assert (= (and b!816681 (not res!557600)) b!816677))

(assert (= (and b!816677 (not res!557601)) b!816679))

(assert (= (and b!816678 condMapEmpty!23191) mapIsEmpty!23191))

(assert (= (and b!816678 (not condMapEmpty!23191)) mapNonEmpty!23191))

(get-info :version)

(assert (= (and mapNonEmpty!23191 ((_ is ValueCellFull!6785) mapValue!23191)) b!816680))

(assert (= (and b!816678 ((_ is ValueCellFull!6785) mapDefault!23191)) b!816676))

(assert (= start!70296 b!816678))

(declare-fun m!757799 () Bool)

(assert (=> b!816677 m!757799))

(assert (=> b!816677 m!757799))

(declare-fun m!757801 () Bool)

(assert (=> b!816677 m!757801))

(declare-fun m!757803 () Bool)

(assert (=> b!816677 m!757803))

(declare-fun m!757805 () Bool)

(assert (=> start!70296 m!757805))

(declare-fun m!757807 () Bool)

(assert (=> start!70296 m!757807))

(declare-fun m!757809 () Bool)

(assert (=> start!70296 m!757809))

(declare-fun m!757811 () Bool)

(assert (=> b!816675 m!757811))

(declare-fun m!757813 () Bool)

(assert (=> b!816681 m!757813))

(declare-fun m!757815 () Bool)

(assert (=> b!816681 m!757815))

(declare-fun m!757817 () Bool)

(assert (=> b!816681 m!757817))

(declare-fun m!757819 () Bool)

(assert (=> mapNonEmpty!23191 m!757819))

(declare-fun m!757821 () Bool)

(assert (=> b!816682 m!757821))

(check-sat (not b_next!12691) (not mapNonEmpty!23191) (not b!816677) (not b!816675) tp_is_empty!14401 b_and!21465 (not b!816681) (not b!816682) (not start!70296))
(check-sat b_and!21465 (not b_next!12691))
(get-model)

(declare-fun d!104347 () Bool)

(assert (=> d!104347 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70296 d!104347))

(declare-fun d!104349 () Bool)

(assert (=> d!104349 (= (array_inv!17313 _keys!976) (bvsge (size!21968 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70296 d!104349))

(declare-fun d!104351 () Bool)

(assert (=> d!104351 (= (array_inv!17314 _values!788) (bvsge (size!21969 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70296 d!104351))

(declare-fun b!816748 () Bool)

(declare-fun e!453140 () Bool)

(declare-fun e!453141 () Bool)

(assert (=> b!816748 (= e!453140 e!453141)))

(declare-fun res!557646 () Bool)

(assert (=> b!816748 (=> (not res!557646) (not e!453141))))

(declare-fun e!453139 () Bool)

(assert (=> b!816748 (= res!557646 (not e!453139))))

(declare-fun res!557647 () Bool)

(assert (=> b!816748 (=> (not res!557647) (not e!453139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!816748 (= res!557647 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104353 () Bool)

(declare-fun res!557648 () Bool)

(assert (=> d!104353 (=> res!557648 e!453140)))

(assert (=> d!104353 (= res!557648 (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104353 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15361) e!453140)))

(declare-fun bm!35531 () Bool)

(declare-fun call!35534 () Bool)

(declare-fun c!88947 () Bool)

(assert (=> bm!35531 (= call!35534 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88947 (Cons!15360 (select (arr!21547 _keys!976) #b00000000000000000000000000000000) Nil!15361) Nil!15361)))))

(declare-fun b!816749 () Bool)

(declare-fun e!453142 () Bool)

(assert (=> b!816749 (= e!453141 e!453142)))

(assert (=> b!816749 (= c!88947 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816750 () Bool)

(assert (=> b!816750 (= e!453142 call!35534)))

(declare-fun b!816751 () Bool)

(assert (=> b!816751 (= e!453142 call!35534)))

(declare-fun b!816752 () Bool)

(declare-fun contains!4131 (List!15364 (_ BitVec 64)) Bool)

(assert (=> b!816752 (= e!453139 (contains!4131 Nil!15361 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104353 (not res!557648)) b!816748))

(assert (= (and b!816748 res!557647) b!816752))

(assert (= (and b!816748 res!557646) b!816749))

(assert (= (and b!816749 c!88947) b!816750))

(assert (= (and b!816749 (not c!88947)) b!816751))

(assert (= (or b!816750 b!816751) bm!35531))

(declare-fun m!757871 () Bool)

(assert (=> b!816748 m!757871))

(assert (=> b!816748 m!757871))

(declare-fun m!757873 () Bool)

(assert (=> b!816748 m!757873))

(assert (=> bm!35531 m!757871))

(declare-fun m!757875 () Bool)

(assert (=> bm!35531 m!757875))

(assert (=> b!816749 m!757871))

(assert (=> b!816749 m!757871))

(assert (=> b!816749 m!757873))

(assert (=> b!816752 m!757871))

(assert (=> b!816752 m!757871))

(declare-fun m!757877 () Bool)

(assert (=> b!816752 m!757877))

(assert (=> b!816675 d!104353))

(declare-fun d!104355 () Bool)

(assert (=> d!104355 (= (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365749 () Unit!27812)

(declare-fun choose!1399 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 V!24203 V!24203 (_ BitVec 32) Int) Unit!27812)

(assert (=> d!104355 (= lt!365749 (choose!1399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104355 (validMask!0 mask!1312)))

(assert (=> d!104355 (= (lemmaNoChangeToArrayThenSameMapNoExtras!346 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365749)))

(declare-fun bs!22724 () Bool)

(assert (= bs!22724 d!104355))

(assert (=> bs!22724 m!757817))

(assert (=> bs!22724 m!757815))

(declare-fun m!757879 () Bool)

(assert (=> bs!22724 m!757879))

(assert (=> bs!22724 m!757805))

(assert (=> b!816681 d!104355))

(declare-fun b!816777 () Bool)

(declare-fun e!453159 () ListLongMap!8355)

(assert (=> b!816777 (= e!453159 (ListLongMap!8356 Nil!15362))))

(declare-fun b!816778 () Bool)

(declare-fun e!453163 () ListLongMap!8355)

(assert (=> b!816778 (= e!453159 e!453163)))

(declare-fun c!88959 () Bool)

(assert (=> b!816778 (= c!88959 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816779 () Bool)

(declare-fun e!453160 () Bool)

(declare-fun e!453158 () Bool)

(assert (=> b!816779 (= e!453160 e!453158)))

(declare-fun c!88957 () Bool)

(declare-fun e!453157 () Bool)

(assert (=> b!816779 (= c!88957 e!453157)))

(declare-fun res!557660 () Bool)

(assert (=> b!816779 (=> (not res!557660) (not e!453157))))

(assert (=> b!816779 (= res!557660 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816780 () Bool)

(assert (=> b!816780 (= e!453157 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816780 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!816781 () Bool)

(declare-fun e!453162 () Bool)

(declare-fun lt!365765 () ListLongMap!8355)

(assert (=> b!816781 (= e!453162 (= lt!365765 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!816782 () Bool)

(declare-fun call!35537 () ListLongMap!8355)

(assert (=> b!816782 (= e!453163 call!35537)))

(declare-fun b!816783 () Bool)

(declare-fun isEmpty!638 (ListLongMap!8355) Bool)

(assert (=> b!816783 (= e!453162 (isEmpty!638 lt!365765))))

(declare-fun d!104357 () Bool)

(assert (=> d!104357 e!453160))

(declare-fun res!557658 () Bool)

(assert (=> d!104357 (=> (not res!557658) (not e!453160))))

(declare-fun contains!4132 (ListLongMap!8355 (_ BitVec 64)) Bool)

(assert (=> d!104357 (= res!557658 (not (contains!4132 lt!365765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104357 (= lt!365765 e!453159)))

(declare-fun c!88958 () Bool)

(assert (=> d!104357 (= c!88958 (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104357 (validMask!0 mask!1312)))

(assert (=> d!104357 (= (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365765)))

(declare-fun b!816784 () Bool)

(assert (=> b!816784 (= e!453158 e!453162)))

(declare-fun c!88956 () Bool)

(assert (=> b!816784 (= c!88956 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816785 () Bool)

(declare-fun lt!365767 () Unit!27812)

(declare-fun lt!365770 () Unit!27812)

(assert (=> b!816785 (= lt!365767 lt!365770)))

(declare-fun lt!365764 () V!24203)

(declare-fun lt!365766 () (_ BitVec 64))

(declare-fun lt!365768 () ListLongMap!8355)

(declare-fun lt!365769 () (_ BitVec 64))

(assert (=> b!816785 (not (contains!4132 (+!1852 lt!365768 (tuple2!9543 lt!365766 lt!365764)) lt!365769))))

(declare-fun addStillNotContains!177 (ListLongMap!8355 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27812)

(assert (=> b!816785 (= lt!365770 (addStillNotContains!177 lt!365768 lt!365766 lt!365764 lt!365769))))

(assert (=> b!816785 (= lt!365769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11534 (ValueCell!6785 V!24203) V!24203)

(declare-fun dynLambda!965 (Int (_ BitVec 64)) V!24203)

(assert (=> b!816785 (= lt!365764 (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816785 (= lt!365766 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816785 (= lt!365768 call!35537)))

(assert (=> b!816785 (= e!453163 (+!1852 call!35537 (tuple2!9543 (select (arr!21547 _keys!976) #b00000000000000000000000000000000) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35534 () Bool)

(assert (=> bm!35534 (= call!35537 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!816786 () Bool)

(declare-fun res!557657 () Bool)

(assert (=> b!816786 (=> (not res!557657) (not e!453160))))

(assert (=> b!816786 (= res!557657 (not (contains!4132 lt!365765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!816787 () Bool)

(declare-fun e!453161 () Bool)

(assert (=> b!816787 (= e!453158 e!453161)))

(assert (=> b!816787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun res!557659 () Bool)

(assert (=> b!816787 (= res!557659 (contains!4132 lt!365765 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816787 (=> (not res!557659) (not e!453161))))

(declare-fun b!816788 () Bool)

(assert (=> b!816788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> b!816788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21969 _values!788)))))

(declare-fun apply!351 (ListLongMap!8355 (_ BitVec 64)) V!24203)

(assert (=> b!816788 (= e!453161 (= (apply!351 lt!365765 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104357 c!88958) b!816777))

(assert (= (and d!104357 (not c!88958)) b!816778))

(assert (= (and b!816778 c!88959) b!816785))

(assert (= (and b!816778 (not c!88959)) b!816782))

(assert (= (or b!816785 b!816782) bm!35534))

(assert (= (and d!104357 res!557658) b!816786))

(assert (= (and b!816786 res!557657) b!816779))

(assert (= (and b!816779 res!557660) b!816780))

(assert (= (and b!816779 c!88957) b!816787))

(assert (= (and b!816779 (not c!88957)) b!816784))

(assert (= (and b!816787 res!557659) b!816788))

(assert (= (and b!816784 c!88956) b!816781))

(assert (= (and b!816784 (not c!88956)) b!816783))

(declare-fun b_lambda!10869 () Bool)

(assert (=> (not b_lambda!10869) (not b!816785)))

(declare-fun t!21685 () Bool)

(declare-fun tb!4175 () Bool)

(assert (=> (and start!70296 (= defaultEntry!796 defaultEntry!796) t!21685) tb!4175))

(declare-fun result!7881 () Bool)

(assert (=> tb!4175 (= result!7881 tp_is_empty!14401)))

(assert (=> b!816785 t!21685))

(declare-fun b_and!21471 () Bool)

(assert (= b_and!21465 (and (=> t!21685 result!7881) b_and!21471)))

(declare-fun b_lambda!10871 () Bool)

(assert (=> (not b_lambda!10871) (not b!816788)))

(assert (=> b!816788 t!21685))

(declare-fun b_and!21473 () Bool)

(assert (= b_and!21471 (and (=> t!21685 result!7881) b_and!21473)))

(declare-fun m!757881 () Bool)

(assert (=> d!104357 m!757881))

(assert (=> d!104357 m!757805))

(declare-fun m!757883 () Bool)

(assert (=> b!816781 m!757883))

(declare-fun m!757885 () Bool)

(assert (=> b!816786 m!757885))

(assert (=> b!816787 m!757871))

(assert (=> b!816787 m!757871))

(declare-fun m!757887 () Bool)

(assert (=> b!816787 m!757887))

(assert (=> bm!35534 m!757883))

(assert (=> b!816788 m!757871))

(declare-fun m!757889 () Bool)

(assert (=> b!816788 m!757889))

(declare-fun m!757891 () Bool)

(assert (=> b!816788 m!757891))

(declare-fun m!757893 () Bool)

(assert (=> b!816788 m!757893))

(assert (=> b!816788 m!757889))

(assert (=> b!816788 m!757871))

(declare-fun m!757895 () Bool)

(assert (=> b!816788 m!757895))

(assert (=> b!816788 m!757891))

(assert (=> b!816780 m!757871))

(assert (=> b!816780 m!757871))

(assert (=> b!816780 m!757873))

(assert (=> b!816785 m!757889))

(assert (=> b!816785 m!757891))

(assert (=> b!816785 m!757893))

(declare-fun m!757897 () Bool)

(assert (=> b!816785 m!757897))

(assert (=> b!816785 m!757889))

(assert (=> b!816785 m!757891))

(declare-fun m!757899 () Bool)

(assert (=> b!816785 m!757899))

(declare-fun m!757901 () Bool)

(assert (=> b!816785 m!757901))

(assert (=> b!816785 m!757871))

(assert (=> b!816785 m!757899))

(declare-fun m!757903 () Bool)

(assert (=> b!816785 m!757903))

(assert (=> b!816778 m!757871))

(assert (=> b!816778 m!757871))

(assert (=> b!816778 m!757873))

(declare-fun m!757905 () Bool)

(assert (=> b!816783 m!757905))

(assert (=> b!816681 d!104357))

(declare-fun b!816791 () Bool)

(declare-fun e!453166 () ListLongMap!8355)

(assert (=> b!816791 (= e!453166 (ListLongMap!8356 Nil!15362))))

(declare-fun b!816792 () Bool)

(declare-fun e!453170 () ListLongMap!8355)

(assert (=> b!816792 (= e!453166 e!453170)))

(declare-fun c!88963 () Bool)

(assert (=> b!816792 (= c!88963 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816793 () Bool)

(declare-fun e!453167 () Bool)

(declare-fun e!453165 () Bool)

(assert (=> b!816793 (= e!453167 e!453165)))

(declare-fun c!88961 () Bool)

(declare-fun e!453164 () Bool)

(assert (=> b!816793 (= c!88961 e!453164)))

(declare-fun res!557664 () Bool)

(assert (=> b!816793 (=> (not res!557664) (not e!453164))))

(assert (=> b!816793 (= res!557664 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816794 () Bool)

(assert (=> b!816794 (= e!453164 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816794 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!453169 () Bool)

(declare-fun lt!365772 () ListLongMap!8355)

(declare-fun b!816795 () Bool)

(assert (=> b!816795 (= e!453169 (= lt!365772 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!816796 () Bool)

(declare-fun call!35538 () ListLongMap!8355)

(assert (=> b!816796 (= e!453170 call!35538)))

(declare-fun b!816797 () Bool)

(assert (=> b!816797 (= e!453169 (isEmpty!638 lt!365772))))

(declare-fun d!104359 () Bool)

(assert (=> d!104359 e!453167))

(declare-fun res!557662 () Bool)

(assert (=> d!104359 (=> (not res!557662) (not e!453167))))

(assert (=> d!104359 (= res!557662 (not (contains!4132 lt!365772 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104359 (= lt!365772 e!453166)))

(declare-fun c!88962 () Bool)

(assert (=> d!104359 (= c!88962 (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104359 (validMask!0 mask!1312)))

(assert (=> d!104359 (= (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365772)))

(declare-fun b!816798 () Bool)

(assert (=> b!816798 (= e!453165 e!453169)))

(declare-fun c!88960 () Bool)

(assert (=> b!816798 (= c!88960 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816799 () Bool)

(declare-fun lt!365774 () Unit!27812)

(declare-fun lt!365777 () Unit!27812)

(assert (=> b!816799 (= lt!365774 lt!365777)))

(declare-fun lt!365773 () (_ BitVec 64))

(declare-fun lt!365775 () ListLongMap!8355)

(declare-fun lt!365776 () (_ BitVec 64))

(declare-fun lt!365771 () V!24203)

(assert (=> b!816799 (not (contains!4132 (+!1852 lt!365775 (tuple2!9543 lt!365773 lt!365771)) lt!365776))))

(assert (=> b!816799 (= lt!365777 (addStillNotContains!177 lt!365775 lt!365773 lt!365771 lt!365776))))

(assert (=> b!816799 (= lt!365776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!816799 (= lt!365771 (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816799 (= lt!365773 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816799 (= lt!365775 call!35538)))

(assert (=> b!816799 (= e!453170 (+!1852 call!35538 (tuple2!9543 (select (arr!21547 _keys!976) #b00000000000000000000000000000000) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35535 () Bool)

(assert (=> bm!35535 (= call!35538 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!816800 () Bool)

(declare-fun res!557661 () Bool)

(assert (=> b!816800 (=> (not res!557661) (not e!453167))))

(assert (=> b!816800 (= res!557661 (not (contains!4132 lt!365772 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!816801 () Bool)

(declare-fun e!453168 () Bool)

(assert (=> b!816801 (= e!453165 e!453168)))

(assert (=> b!816801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun res!557663 () Bool)

(assert (=> b!816801 (= res!557663 (contains!4132 lt!365772 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816801 (=> (not res!557663) (not e!453168))))

(declare-fun b!816802 () Bool)

(assert (=> b!816802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> b!816802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21969 _values!788)))))

(assert (=> b!816802 (= e!453168 (= (apply!351 lt!365772 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104359 c!88962) b!816791))

(assert (= (and d!104359 (not c!88962)) b!816792))

(assert (= (and b!816792 c!88963) b!816799))

(assert (= (and b!816792 (not c!88963)) b!816796))

(assert (= (or b!816799 b!816796) bm!35535))

(assert (= (and d!104359 res!557662) b!816800))

(assert (= (and b!816800 res!557661) b!816793))

(assert (= (and b!816793 res!557664) b!816794))

(assert (= (and b!816793 c!88961) b!816801))

(assert (= (and b!816793 (not c!88961)) b!816798))

(assert (= (and b!816801 res!557663) b!816802))

(assert (= (and b!816798 c!88960) b!816795))

(assert (= (and b!816798 (not c!88960)) b!816797))

(declare-fun b_lambda!10873 () Bool)

(assert (=> (not b_lambda!10873) (not b!816799)))

(assert (=> b!816799 t!21685))

(declare-fun b_and!21475 () Bool)

(assert (= b_and!21473 (and (=> t!21685 result!7881) b_and!21475)))

(declare-fun b_lambda!10875 () Bool)

(assert (=> (not b_lambda!10875) (not b!816802)))

(assert (=> b!816802 t!21685))

(declare-fun b_and!21477 () Bool)

(assert (= b_and!21475 (and (=> t!21685 result!7881) b_and!21477)))

(declare-fun m!757907 () Bool)

(assert (=> d!104359 m!757907))

(assert (=> d!104359 m!757805))

(declare-fun m!757909 () Bool)

(assert (=> b!816795 m!757909))

(declare-fun m!757911 () Bool)

(assert (=> b!816800 m!757911))

(assert (=> b!816801 m!757871))

(assert (=> b!816801 m!757871))

(declare-fun m!757913 () Bool)

(assert (=> b!816801 m!757913))

(assert (=> bm!35535 m!757909))

(assert (=> b!816802 m!757871))

(assert (=> b!816802 m!757889))

(assert (=> b!816802 m!757891))

(assert (=> b!816802 m!757893))

(assert (=> b!816802 m!757889))

(assert (=> b!816802 m!757871))

(declare-fun m!757915 () Bool)

(assert (=> b!816802 m!757915))

(assert (=> b!816802 m!757891))

(assert (=> b!816794 m!757871))

(assert (=> b!816794 m!757871))

(assert (=> b!816794 m!757873))

(assert (=> b!816799 m!757889))

(assert (=> b!816799 m!757891))

(assert (=> b!816799 m!757893))

(declare-fun m!757917 () Bool)

(assert (=> b!816799 m!757917))

(assert (=> b!816799 m!757889))

(assert (=> b!816799 m!757891))

(declare-fun m!757919 () Bool)

(assert (=> b!816799 m!757919))

(declare-fun m!757921 () Bool)

(assert (=> b!816799 m!757921))

(assert (=> b!816799 m!757871))

(assert (=> b!816799 m!757919))

(declare-fun m!757923 () Bool)

(assert (=> b!816799 m!757923))

(assert (=> b!816792 m!757871))

(assert (=> b!816792 m!757871))

(assert (=> b!816792 m!757873))

(declare-fun m!757925 () Bool)

(assert (=> b!816797 m!757925))

(assert (=> b!816681 d!104359))

(declare-fun d!104361 () Bool)

(declare-fun e!453173 () Bool)

(assert (=> d!104361 e!453173))

(declare-fun res!557670 () Bool)

(assert (=> d!104361 (=> (not res!557670) (not e!453173))))

(declare-fun lt!365787 () ListLongMap!8355)

(assert (=> d!104361 (= res!557670 (contains!4132 lt!365787 (_1!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!365788 () List!15365)

(assert (=> d!104361 (= lt!365787 (ListLongMap!8356 lt!365788))))

(declare-fun lt!365789 () Unit!27812)

(declare-fun lt!365786 () Unit!27812)

(assert (=> d!104361 (= lt!365789 lt!365786)))

(declare-datatypes ((Option!405 0))(
  ( (Some!404 (v!9673 V!24203)) (None!403) )
))
(declare-fun getValueByKey!399 (List!15365 (_ BitVec 64)) Option!405)

(assert (=> d!104361 (= (getValueByKey!399 lt!365788 (_1!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!404 (_2!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!216 (List!15365 (_ BitVec 64) V!24203) Unit!27812)

(assert (=> d!104361 (= lt!365786 (lemmaContainsTupThenGetReturnValue!216 lt!365788 (_1!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!255 (List!15365 (_ BitVec 64) V!24203) List!15365)

(assert (=> d!104361 (= lt!365788 (insertStrictlySorted!255 (toList!4193 (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104361 (= (+!1852 (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!365787)))

(declare-fun b!816807 () Bool)

(declare-fun res!557669 () Bool)

(assert (=> b!816807 (=> (not res!557669) (not e!453173))))

(assert (=> b!816807 (= res!557669 (= (getValueByKey!399 (toList!4193 lt!365787) (_1!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!404 (_2!4782 (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!816808 () Bool)

(declare-fun contains!4133 (List!15365 tuple2!9542) Bool)

(assert (=> b!816808 (= e!453173 (contains!4133 (toList!4193 lt!365787) (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104361 res!557670) b!816807))

(assert (= (and b!816807 res!557669) b!816808))

(declare-fun m!757927 () Bool)

(assert (=> d!104361 m!757927))

(declare-fun m!757929 () Bool)

(assert (=> d!104361 m!757929))

(declare-fun m!757931 () Bool)

(assert (=> d!104361 m!757931))

(declare-fun m!757933 () Bool)

(assert (=> d!104361 m!757933))

(declare-fun m!757935 () Bool)

(assert (=> b!816807 m!757935))

(declare-fun m!757937 () Bool)

(assert (=> b!816808 m!757937))

(assert (=> b!816677 d!104361))

(declare-fun b!816851 () Bool)

(declare-fun e!453206 () ListLongMap!8355)

(declare-fun call!35553 () ListLongMap!8355)

(assert (=> b!816851 (= e!453206 (+!1852 call!35553 (tuple2!9543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35550 () Bool)

(declare-fun call!35556 () ListLongMap!8355)

(declare-fun call!35559 () ListLongMap!8355)

(assert (=> bm!35550 (= call!35556 call!35559)))

(declare-fun b!816852 () Bool)

(declare-fun e!453212 () Unit!27812)

(declare-fun Unit!27818 () Unit!27812)

(assert (=> b!816852 (= e!453212 Unit!27818)))

(declare-fun c!88978 () Bool)

(declare-fun call!35558 () ListLongMap!8355)

(declare-fun bm!35551 () Bool)

(declare-fun c!88980 () Bool)

(assert (=> bm!35551 (= call!35553 (+!1852 (ite c!88980 call!35559 (ite c!88978 call!35556 call!35558)) (ite (or c!88980 c!88978) (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!104363 () Bool)

(declare-fun e!453205 () Bool)

(assert (=> d!104363 e!453205))

(declare-fun res!557692 () Bool)

(assert (=> d!104363 (=> (not res!557692) (not e!453205))))

(assert (=> d!104363 (= res!557692 (or (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))))

(declare-fun lt!365855 () ListLongMap!8355)

(declare-fun lt!365835 () ListLongMap!8355)

(assert (=> d!104363 (= lt!365855 lt!365835)))

(declare-fun lt!365851 () Unit!27812)

(assert (=> d!104363 (= lt!365851 e!453212)))

(declare-fun c!88981 () Bool)

(declare-fun e!453207 () Bool)

(assert (=> d!104363 (= c!88981 e!453207)))

(declare-fun res!557697 () Bool)

(assert (=> d!104363 (=> (not res!557697) (not e!453207))))

(assert (=> d!104363 (= res!557697 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104363 (= lt!365835 e!453206)))

(assert (=> d!104363 (= c!88980 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104363 (validMask!0 mask!1312)))

(assert (=> d!104363 (= (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365855)))

(declare-fun b!816853 () Bool)

(declare-fun e!453204 () Bool)

(declare-fun e!453210 () Bool)

(assert (=> b!816853 (= e!453204 e!453210)))

(declare-fun res!557694 () Bool)

(assert (=> b!816853 (=> (not res!557694) (not e!453210))))

(assert (=> b!816853 (= res!557694 (contains!4132 lt!365855 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816854 () Bool)

(declare-fun e!453200 () ListLongMap!8355)

(assert (=> b!816854 (= e!453206 e!453200)))

(assert (=> b!816854 (= c!88978 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!816855 () Bool)

(declare-fun e!453211 () Bool)

(assert (=> b!816855 (= e!453211 (= (apply!351 lt!365855 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35552 () Bool)

(assert (=> bm!35552 (= call!35558 call!35556)))

(declare-fun b!816856 () Bool)

(declare-fun e!453202 () Bool)

(declare-fun e!453203 () Bool)

(assert (=> b!816856 (= e!453202 e!453203)))

(declare-fun res!557693 () Bool)

(declare-fun call!35555 () Bool)

(assert (=> b!816856 (= res!557693 call!35555)))

(assert (=> b!816856 (=> (not res!557693) (not e!453203))))

(declare-fun b!816857 () Bool)

(assert (=> b!816857 (= e!453202 (not call!35555))))

(declare-fun b!816858 () Bool)

(assert (=> b!816858 (= e!453203 (= (apply!351 lt!365855 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!816859 () Bool)

(assert (=> b!816859 (= e!453210 (= (apply!351 lt!365855 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21969 _values!788)))))

(assert (=> b!816859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816860 () Bool)

(declare-fun e!453201 () Bool)

(assert (=> b!816860 (= e!453201 e!453211)))

(declare-fun res!557689 () Bool)

(declare-fun call!35557 () Bool)

(assert (=> b!816860 (= res!557689 call!35557)))

(assert (=> b!816860 (=> (not res!557689) (not e!453211))))

(declare-fun b!816861 () Bool)

(declare-fun e!453209 () ListLongMap!8355)

(declare-fun call!35554 () ListLongMap!8355)

(assert (=> b!816861 (= e!453209 call!35554)))

(declare-fun bm!35553 () Bool)

(assert (=> bm!35553 (= call!35559 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35554 () Bool)

(assert (=> bm!35554 (= call!35555 (contains!4132 lt!365855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35555 () Bool)

(assert (=> bm!35555 (= call!35554 call!35553)))

(declare-fun b!816862 () Bool)

(assert (=> b!816862 (= e!453207 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816863 () Bool)

(declare-fun lt!365849 () Unit!27812)

(assert (=> b!816863 (= e!453212 lt!365849)))

(declare-fun lt!365838 () ListLongMap!8355)

(assert (=> b!816863 (= lt!365838 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365839 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365844 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365844 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365845 () Unit!27812)

(declare-fun addStillContains!306 (ListLongMap!8355 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27812)

(assert (=> b!816863 (= lt!365845 (addStillContains!306 lt!365838 lt!365839 zeroValueBefore!34 lt!365844))))

(assert (=> b!816863 (contains!4132 (+!1852 lt!365838 (tuple2!9543 lt!365839 zeroValueBefore!34)) lt!365844)))

(declare-fun lt!365836 () Unit!27812)

(assert (=> b!816863 (= lt!365836 lt!365845)))

(declare-fun lt!365837 () ListLongMap!8355)

(assert (=> b!816863 (= lt!365837 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365842 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365854 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365854 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365848 () Unit!27812)

(declare-fun addApplyDifferent!306 (ListLongMap!8355 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27812)

(assert (=> b!816863 (= lt!365848 (addApplyDifferent!306 lt!365837 lt!365842 minValue!754 lt!365854))))

(assert (=> b!816863 (= (apply!351 (+!1852 lt!365837 (tuple2!9543 lt!365842 minValue!754)) lt!365854) (apply!351 lt!365837 lt!365854))))

(declare-fun lt!365852 () Unit!27812)

(assert (=> b!816863 (= lt!365852 lt!365848)))

(declare-fun lt!365850 () ListLongMap!8355)

(assert (=> b!816863 (= lt!365850 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365846 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365840 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365840 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365853 () Unit!27812)

(assert (=> b!816863 (= lt!365853 (addApplyDifferent!306 lt!365850 lt!365846 zeroValueBefore!34 lt!365840))))

(assert (=> b!816863 (= (apply!351 (+!1852 lt!365850 (tuple2!9543 lt!365846 zeroValueBefore!34)) lt!365840) (apply!351 lt!365850 lt!365840))))

(declare-fun lt!365841 () Unit!27812)

(assert (=> b!816863 (= lt!365841 lt!365853)))

(declare-fun lt!365847 () ListLongMap!8355)

(assert (=> b!816863 (= lt!365847 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365834 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365843 () (_ BitVec 64))

(assert (=> b!816863 (= lt!365843 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816863 (= lt!365849 (addApplyDifferent!306 lt!365847 lt!365834 minValue!754 lt!365843))))

(assert (=> b!816863 (= (apply!351 (+!1852 lt!365847 (tuple2!9543 lt!365834 minValue!754)) lt!365843) (apply!351 lt!365847 lt!365843))))

(declare-fun bm!35556 () Bool)

(assert (=> bm!35556 (= call!35557 (contains!4132 lt!365855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816864 () Bool)

(assert (=> b!816864 (= e!453205 e!453201)))

(declare-fun c!88977 () Bool)

(assert (=> b!816864 (= c!88977 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!816865 () Bool)

(declare-fun c!88976 () Bool)

(assert (=> b!816865 (= c!88976 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!816865 (= e!453200 e!453209)))

(declare-fun b!816866 () Bool)

(declare-fun res!557695 () Bool)

(assert (=> b!816866 (=> (not res!557695) (not e!453205))))

(assert (=> b!816866 (= res!557695 e!453202)))

(declare-fun c!88979 () Bool)

(assert (=> b!816866 (= c!88979 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!816867 () Bool)

(assert (=> b!816867 (= e!453209 call!35558)))

(declare-fun b!816868 () Bool)

(assert (=> b!816868 (= e!453201 (not call!35557))))

(declare-fun b!816869 () Bool)

(declare-fun res!557691 () Bool)

(assert (=> b!816869 (=> (not res!557691) (not e!453205))))

(assert (=> b!816869 (= res!557691 e!453204)))

(declare-fun res!557690 () Bool)

(assert (=> b!816869 (=> res!557690 e!453204)))

(declare-fun e!453208 () Bool)

(assert (=> b!816869 (= res!557690 (not e!453208))))

(declare-fun res!557696 () Bool)

(assert (=> b!816869 (=> (not res!557696) (not e!453208))))

(assert (=> b!816869 (= res!557696 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816870 () Bool)

(assert (=> b!816870 (= e!453200 call!35554)))

(declare-fun b!816871 () Bool)

(assert (=> b!816871 (= e!453208 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104363 c!88980) b!816851))

(assert (= (and d!104363 (not c!88980)) b!816854))

(assert (= (and b!816854 c!88978) b!816870))

(assert (= (and b!816854 (not c!88978)) b!816865))

(assert (= (and b!816865 c!88976) b!816861))

(assert (= (and b!816865 (not c!88976)) b!816867))

(assert (= (or b!816861 b!816867) bm!35552))

(assert (= (or b!816870 bm!35552) bm!35550))

(assert (= (or b!816870 b!816861) bm!35555))

(assert (= (or b!816851 bm!35550) bm!35553))

(assert (= (or b!816851 bm!35555) bm!35551))

(assert (= (and d!104363 res!557697) b!816862))

(assert (= (and d!104363 c!88981) b!816863))

(assert (= (and d!104363 (not c!88981)) b!816852))

(assert (= (and d!104363 res!557692) b!816869))

(assert (= (and b!816869 res!557696) b!816871))

(assert (= (and b!816869 (not res!557690)) b!816853))

(assert (= (and b!816853 res!557694) b!816859))

(assert (= (and b!816869 res!557691) b!816866))

(assert (= (and b!816866 c!88979) b!816856))

(assert (= (and b!816866 (not c!88979)) b!816857))

(assert (= (and b!816856 res!557693) b!816858))

(assert (= (or b!816856 b!816857) bm!35554))

(assert (= (and b!816866 res!557695) b!816864))

(assert (= (and b!816864 c!88977) b!816860))

(assert (= (and b!816864 (not c!88977)) b!816868))

(assert (= (and b!816860 res!557689) b!816855))

(assert (= (or b!816860 b!816868) bm!35556))

(declare-fun b_lambda!10877 () Bool)

(assert (=> (not b_lambda!10877) (not b!816859)))

(assert (=> b!816859 t!21685))

(declare-fun b_and!21479 () Bool)

(assert (= b_and!21477 (and (=> t!21685 result!7881) b_and!21479)))

(assert (=> d!104363 m!757805))

(declare-fun m!757939 () Bool)

(assert (=> bm!35554 m!757939))

(assert (=> b!816853 m!757871))

(assert (=> b!816853 m!757871))

(declare-fun m!757941 () Bool)

(assert (=> b!816853 m!757941))

(declare-fun m!757943 () Bool)

(assert (=> b!816858 m!757943))

(declare-fun m!757945 () Bool)

(assert (=> bm!35556 m!757945))

(declare-fun m!757947 () Bool)

(assert (=> bm!35551 m!757947))

(assert (=> b!816859 m!757871))

(declare-fun m!757949 () Bool)

(assert (=> b!816859 m!757949))

(assert (=> b!816859 m!757871))

(assert (=> b!816859 m!757891))

(assert (=> b!816859 m!757889))

(assert (=> b!816859 m!757889))

(assert (=> b!816859 m!757891))

(assert (=> b!816859 m!757893))

(declare-fun m!757951 () Bool)

(assert (=> b!816855 m!757951))

(declare-fun m!757953 () Bool)

(assert (=> b!816851 m!757953))

(declare-fun m!757955 () Bool)

(assert (=> b!816863 m!757955))

(declare-fun m!757957 () Bool)

(assert (=> b!816863 m!757957))

(declare-fun m!757959 () Bool)

(assert (=> b!816863 m!757959))

(declare-fun m!757961 () Bool)

(assert (=> b!816863 m!757961))

(declare-fun m!757963 () Bool)

(assert (=> b!816863 m!757963))

(declare-fun m!757965 () Bool)

(assert (=> b!816863 m!757965))

(assert (=> b!816863 m!757955))

(assert (=> b!816863 m!757871))

(declare-fun m!757967 () Bool)

(assert (=> b!816863 m!757967))

(declare-fun m!757969 () Bool)

(assert (=> b!816863 m!757969))

(assert (=> b!816863 m!757817))

(assert (=> b!816863 m!757959))

(declare-fun m!757971 () Bool)

(assert (=> b!816863 m!757971))

(declare-fun m!757973 () Bool)

(assert (=> b!816863 m!757973))

(declare-fun m!757975 () Bool)

(assert (=> b!816863 m!757975))

(assert (=> b!816863 m!757963))

(declare-fun m!757977 () Bool)

(assert (=> b!816863 m!757977))

(declare-fun m!757979 () Bool)

(assert (=> b!816863 m!757979))

(assert (=> b!816863 m!757979))

(declare-fun m!757981 () Bool)

(assert (=> b!816863 m!757981))

(declare-fun m!757983 () Bool)

(assert (=> b!816863 m!757983))

(assert (=> bm!35553 m!757817))

(assert (=> b!816862 m!757871))

(assert (=> b!816862 m!757871))

(assert (=> b!816862 m!757873))

(assert (=> b!816871 m!757871))

(assert (=> b!816871 m!757871))

(assert (=> b!816871 m!757873))

(assert (=> b!816677 d!104363))

(declare-fun b!816872 () Bool)

(declare-fun e!453219 () ListLongMap!8355)

(declare-fun call!35560 () ListLongMap!8355)

(assert (=> b!816872 (= e!453219 (+!1852 call!35560 (tuple2!9543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35557 () Bool)

(declare-fun call!35563 () ListLongMap!8355)

(declare-fun call!35566 () ListLongMap!8355)

(assert (=> bm!35557 (= call!35563 call!35566)))

(declare-fun b!816873 () Bool)

(declare-fun e!453225 () Unit!27812)

(declare-fun Unit!27819 () Unit!27812)

(assert (=> b!816873 (= e!453225 Unit!27819)))

(declare-fun bm!35558 () Bool)

(declare-fun call!35565 () ListLongMap!8355)

(declare-fun c!88984 () Bool)

(declare-fun c!88986 () Bool)

(assert (=> bm!35558 (= call!35560 (+!1852 (ite c!88986 call!35566 (ite c!88984 call!35563 call!35565)) (ite (or c!88986 c!88984) (tuple2!9543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!104365 () Bool)

(declare-fun e!453218 () Bool)

(assert (=> d!104365 e!453218))

(declare-fun res!557701 () Bool)

(assert (=> d!104365 (=> (not res!557701) (not e!453218))))

(assert (=> d!104365 (= res!557701 (or (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))))

(declare-fun lt!365877 () ListLongMap!8355)

(declare-fun lt!365857 () ListLongMap!8355)

(assert (=> d!104365 (= lt!365877 lt!365857)))

(declare-fun lt!365873 () Unit!27812)

(assert (=> d!104365 (= lt!365873 e!453225)))

(declare-fun c!88987 () Bool)

(declare-fun e!453220 () Bool)

(assert (=> d!104365 (= c!88987 e!453220)))

(declare-fun res!557706 () Bool)

(assert (=> d!104365 (=> (not res!557706) (not e!453220))))

(assert (=> d!104365 (= res!557706 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104365 (= lt!365857 e!453219)))

(assert (=> d!104365 (= c!88986 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104365 (validMask!0 mask!1312)))

(assert (=> d!104365 (= (getCurrentListMap!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365877)))

(declare-fun b!816874 () Bool)

(declare-fun e!453217 () Bool)

(declare-fun e!453223 () Bool)

(assert (=> b!816874 (= e!453217 e!453223)))

(declare-fun res!557703 () Bool)

(assert (=> b!816874 (=> (not res!557703) (not e!453223))))

(assert (=> b!816874 (= res!557703 (contains!4132 lt!365877 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816875 () Bool)

(declare-fun e!453213 () ListLongMap!8355)

(assert (=> b!816875 (= e!453219 e!453213)))

(assert (=> b!816875 (= c!88984 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!816876 () Bool)

(declare-fun e!453224 () Bool)

(assert (=> b!816876 (= e!453224 (= (apply!351 lt!365877 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35559 () Bool)

(assert (=> bm!35559 (= call!35565 call!35563)))

(declare-fun b!816877 () Bool)

(declare-fun e!453215 () Bool)

(declare-fun e!453216 () Bool)

(assert (=> b!816877 (= e!453215 e!453216)))

(declare-fun res!557702 () Bool)

(declare-fun call!35562 () Bool)

(assert (=> b!816877 (= res!557702 call!35562)))

(assert (=> b!816877 (=> (not res!557702) (not e!453216))))

(declare-fun b!816878 () Bool)

(assert (=> b!816878 (= e!453215 (not call!35562))))

(declare-fun b!816879 () Bool)

(assert (=> b!816879 (= e!453216 (= (apply!351 lt!365877 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!816880 () Bool)

(assert (=> b!816880 (= e!453223 (= (apply!351 lt!365877 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)) (get!11534 (select (arr!21548 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!816880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21969 _values!788)))))

(assert (=> b!816880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816881 () Bool)

(declare-fun e!453214 () Bool)

(assert (=> b!816881 (= e!453214 e!453224)))

(declare-fun res!557698 () Bool)

(declare-fun call!35564 () Bool)

(assert (=> b!816881 (= res!557698 call!35564)))

(assert (=> b!816881 (=> (not res!557698) (not e!453224))))

(declare-fun b!816882 () Bool)

(declare-fun e!453222 () ListLongMap!8355)

(declare-fun call!35561 () ListLongMap!8355)

(assert (=> b!816882 (= e!453222 call!35561)))

(declare-fun bm!35560 () Bool)

(assert (=> bm!35560 (= call!35566 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35561 () Bool)

(assert (=> bm!35561 (= call!35562 (contains!4132 lt!365877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35562 () Bool)

(assert (=> bm!35562 (= call!35561 call!35560)))

(declare-fun b!816883 () Bool)

(assert (=> b!816883 (= e!453220 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816884 () Bool)

(declare-fun lt!365871 () Unit!27812)

(assert (=> b!816884 (= e!453225 lt!365871)))

(declare-fun lt!365860 () ListLongMap!8355)

(assert (=> b!816884 (= lt!365860 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365861 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365866 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365866 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365867 () Unit!27812)

(assert (=> b!816884 (= lt!365867 (addStillContains!306 lt!365860 lt!365861 zeroValueAfter!34 lt!365866))))

(assert (=> b!816884 (contains!4132 (+!1852 lt!365860 (tuple2!9543 lt!365861 zeroValueAfter!34)) lt!365866)))

(declare-fun lt!365858 () Unit!27812)

(assert (=> b!816884 (= lt!365858 lt!365867)))

(declare-fun lt!365859 () ListLongMap!8355)

(assert (=> b!816884 (= lt!365859 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365864 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365864 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365876 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365876 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365870 () Unit!27812)

(assert (=> b!816884 (= lt!365870 (addApplyDifferent!306 lt!365859 lt!365864 minValue!754 lt!365876))))

(assert (=> b!816884 (= (apply!351 (+!1852 lt!365859 (tuple2!9543 lt!365864 minValue!754)) lt!365876) (apply!351 lt!365859 lt!365876))))

(declare-fun lt!365874 () Unit!27812)

(assert (=> b!816884 (= lt!365874 lt!365870)))

(declare-fun lt!365872 () ListLongMap!8355)

(assert (=> b!816884 (= lt!365872 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365868 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365862 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365862 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365875 () Unit!27812)

(assert (=> b!816884 (= lt!365875 (addApplyDifferent!306 lt!365872 lt!365868 zeroValueAfter!34 lt!365862))))

(assert (=> b!816884 (= (apply!351 (+!1852 lt!365872 (tuple2!9543 lt!365868 zeroValueAfter!34)) lt!365862) (apply!351 lt!365872 lt!365862))))

(declare-fun lt!365863 () Unit!27812)

(assert (=> b!816884 (= lt!365863 lt!365875)))

(declare-fun lt!365869 () ListLongMap!8355)

(assert (=> b!816884 (= lt!365869 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365856 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!365865 () (_ BitVec 64))

(assert (=> b!816884 (= lt!365865 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816884 (= lt!365871 (addApplyDifferent!306 lt!365869 lt!365856 minValue!754 lt!365865))))

(assert (=> b!816884 (= (apply!351 (+!1852 lt!365869 (tuple2!9543 lt!365856 minValue!754)) lt!365865) (apply!351 lt!365869 lt!365865))))

(declare-fun bm!35563 () Bool)

(assert (=> bm!35563 (= call!35564 (contains!4132 lt!365877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!816885 () Bool)

(assert (=> b!816885 (= e!453218 e!453214)))

(declare-fun c!88983 () Bool)

(assert (=> b!816885 (= c!88983 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!816886 () Bool)

(declare-fun c!88982 () Bool)

(assert (=> b!816886 (= c!88982 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!816886 (= e!453213 e!453222)))

(declare-fun b!816887 () Bool)

(declare-fun res!557704 () Bool)

(assert (=> b!816887 (=> (not res!557704) (not e!453218))))

(assert (=> b!816887 (= res!557704 e!453215)))

(declare-fun c!88985 () Bool)

(assert (=> b!816887 (= c!88985 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!816888 () Bool)

(assert (=> b!816888 (= e!453222 call!35565)))

(declare-fun b!816889 () Bool)

(assert (=> b!816889 (= e!453214 (not call!35564))))

(declare-fun b!816890 () Bool)

(declare-fun res!557700 () Bool)

(assert (=> b!816890 (=> (not res!557700) (not e!453218))))

(assert (=> b!816890 (= res!557700 e!453217)))

(declare-fun res!557699 () Bool)

(assert (=> b!816890 (=> res!557699 e!453217)))

(declare-fun e!453221 () Bool)

(assert (=> b!816890 (= res!557699 (not e!453221))))

(declare-fun res!557705 () Bool)

(assert (=> b!816890 (=> (not res!557705) (not e!453221))))

(assert (=> b!816890 (= res!557705 (bvslt #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(declare-fun b!816891 () Bool)

(assert (=> b!816891 (= e!453213 call!35561)))

(declare-fun b!816892 () Bool)

(assert (=> b!816892 (= e!453221 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104365 c!88986) b!816872))

(assert (= (and d!104365 (not c!88986)) b!816875))

(assert (= (and b!816875 c!88984) b!816891))

(assert (= (and b!816875 (not c!88984)) b!816886))

(assert (= (and b!816886 c!88982) b!816882))

(assert (= (and b!816886 (not c!88982)) b!816888))

(assert (= (or b!816882 b!816888) bm!35559))

(assert (= (or b!816891 bm!35559) bm!35557))

(assert (= (or b!816891 b!816882) bm!35562))

(assert (= (or b!816872 bm!35557) bm!35560))

(assert (= (or b!816872 bm!35562) bm!35558))

(assert (= (and d!104365 res!557706) b!816883))

(assert (= (and d!104365 c!88987) b!816884))

(assert (= (and d!104365 (not c!88987)) b!816873))

(assert (= (and d!104365 res!557701) b!816890))

(assert (= (and b!816890 res!557705) b!816892))

(assert (= (and b!816890 (not res!557699)) b!816874))

(assert (= (and b!816874 res!557703) b!816880))

(assert (= (and b!816890 res!557700) b!816887))

(assert (= (and b!816887 c!88985) b!816877))

(assert (= (and b!816887 (not c!88985)) b!816878))

(assert (= (and b!816877 res!557702) b!816879))

(assert (= (or b!816877 b!816878) bm!35561))

(assert (= (and b!816887 res!557704) b!816885))

(assert (= (and b!816885 c!88983) b!816881))

(assert (= (and b!816885 (not c!88983)) b!816889))

(assert (= (and b!816881 res!557698) b!816876))

(assert (= (or b!816881 b!816889) bm!35563))

(declare-fun b_lambda!10879 () Bool)

(assert (=> (not b_lambda!10879) (not b!816880)))

(assert (=> b!816880 t!21685))

(declare-fun b_and!21481 () Bool)

(assert (= b_and!21479 (and (=> t!21685 result!7881) b_and!21481)))

(assert (=> d!104365 m!757805))

(declare-fun m!757985 () Bool)

(assert (=> bm!35561 m!757985))

(assert (=> b!816874 m!757871))

(assert (=> b!816874 m!757871))

(declare-fun m!757987 () Bool)

(assert (=> b!816874 m!757987))

(declare-fun m!757989 () Bool)

(assert (=> b!816879 m!757989))

(declare-fun m!757991 () Bool)

(assert (=> bm!35563 m!757991))

(declare-fun m!757993 () Bool)

(assert (=> bm!35558 m!757993))

(assert (=> b!816880 m!757871))

(declare-fun m!757995 () Bool)

(assert (=> b!816880 m!757995))

(assert (=> b!816880 m!757871))

(assert (=> b!816880 m!757891))

(assert (=> b!816880 m!757889))

(assert (=> b!816880 m!757889))

(assert (=> b!816880 m!757891))

(assert (=> b!816880 m!757893))

(declare-fun m!757997 () Bool)

(assert (=> b!816876 m!757997))

(declare-fun m!757999 () Bool)

(assert (=> b!816872 m!757999))

(declare-fun m!758001 () Bool)

(assert (=> b!816884 m!758001))

(declare-fun m!758003 () Bool)

(assert (=> b!816884 m!758003))

(declare-fun m!758005 () Bool)

(assert (=> b!816884 m!758005))

(declare-fun m!758007 () Bool)

(assert (=> b!816884 m!758007))

(declare-fun m!758009 () Bool)

(assert (=> b!816884 m!758009))

(declare-fun m!758011 () Bool)

(assert (=> b!816884 m!758011))

(assert (=> b!816884 m!758001))

(assert (=> b!816884 m!757871))

(declare-fun m!758013 () Bool)

(assert (=> b!816884 m!758013))

(declare-fun m!758015 () Bool)

(assert (=> b!816884 m!758015))

(assert (=> b!816884 m!757815))

(assert (=> b!816884 m!758005))

(declare-fun m!758017 () Bool)

(assert (=> b!816884 m!758017))

(declare-fun m!758019 () Bool)

(assert (=> b!816884 m!758019))

(declare-fun m!758021 () Bool)

(assert (=> b!816884 m!758021))

(assert (=> b!816884 m!758009))

(declare-fun m!758023 () Bool)

(assert (=> b!816884 m!758023))

(declare-fun m!758025 () Bool)

(assert (=> b!816884 m!758025))

(assert (=> b!816884 m!758025))

(declare-fun m!758027 () Bool)

(assert (=> b!816884 m!758027))

(declare-fun m!758029 () Bool)

(assert (=> b!816884 m!758029))

(assert (=> bm!35560 m!757815))

(assert (=> b!816883 m!757871))

(assert (=> b!816883 m!757871))

(assert (=> b!816883 m!757873))

(assert (=> b!816892 m!757871))

(assert (=> b!816892 m!757871))

(assert (=> b!816892 m!757873))

(assert (=> b!816677 d!104365))

(declare-fun b!816901 () Bool)

(declare-fun e!453234 () Bool)

(declare-fun call!35569 () Bool)

(assert (=> b!816901 (= e!453234 call!35569)))

(declare-fun d!104367 () Bool)

(declare-fun res!557711 () Bool)

(declare-fun e!453233 () Bool)

(assert (=> d!104367 (=> res!557711 e!453233)))

(assert (=> d!104367 (= res!557711 (bvsge #b00000000000000000000000000000000 (size!21968 _keys!976)))))

(assert (=> d!104367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453233)))

(declare-fun b!816902 () Bool)

(assert (=> b!816902 (= e!453233 e!453234)))

(declare-fun c!88990 () Bool)

(assert (=> b!816902 (= c!88990 (validKeyInArray!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816903 () Bool)

(declare-fun e!453232 () Bool)

(assert (=> b!816903 (= e!453234 e!453232)))

(declare-fun lt!365885 () (_ BitVec 64))

(assert (=> b!816903 (= lt!365885 (select (arr!21547 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365886 () Unit!27812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44979 (_ BitVec 64) (_ BitVec 32)) Unit!27812)

(assert (=> b!816903 (= lt!365886 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365885 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!816903 (arrayContainsKey!0 _keys!976 lt!365885 #b00000000000000000000000000000000)))

(declare-fun lt!365884 () Unit!27812)

(assert (=> b!816903 (= lt!365884 lt!365886)))

(declare-fun res!557712 () Bool)

(declare-datatypes ((SeekEntryResult!8719 0))(
  ( (MissingZero!8719 (index!37247 (_ BitVec 32))) (Found!8719 (index!37248 (_ BitVec 32))) (Intermediate!8719 (undefined!9531 Bool) (index!37249 (_ BitVec 32)) (x!68776 (_ BitVec 32))) (Undefined!8719) (MissingVacant!8719 (index!37250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44979 (_ BitVec 32)) SeekEntryResult!8719)

(assert (=> b!816903 (= res!557712 (= (seekEntryOrOpen!0 (select (arr!21547 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8719 #b00000000000000000000000000000000)))))

(assert (=> b!816903 (=> (not res!557712) (not e!453232))))

(declare-fun b!816904 () Bool)

(assert (=> b!816904 (= e!453232 call!35569)))

(declare-fun bm!35566 () Bool)

(assert (=> bm!35566 (= call!35569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104367 (not res!557711)) b!816902))

(assert (= (and b!816902 c!88990) b!816903))

(assert (= (and b!816902 (not c!88990)) b!816901))

(assert (= (and b!816903 res!557712) b!816904))

(assert (= (or b!816904 b!816901) bm!35566))

(assert (=> b!816902 m!757871))

(assert (=> b!816902 m!757871))

(assert (=> b!816902 m!757873))

(assert (=> b!816903 m!757871))

(declare-fun m!758031 () Bool)

(assert (=> b!816903 m!758031))

(declare-fun m!758033 () Bool)

(assert (=> b!816903 m!758033))

(assert (=> b!816903 m!757871))

(declare-fun m!758035 () Bool)

(assert (=> b!816903 m!758035))

(declare-fun m!758037 () Bool)

(assert (=> bm!35566 m!758037))

(assert (=> b!816682 d!104367))

(declare-fun mapNonEmpty!23200 () Bool)

(declare-fun mapRes!23200 () Bool)

(declare-fun tp!44812 () Bool)

(declare-fun e!453239 () Bool)

(assert (=> mapNonEmpty!23200 (= mapRes!23200 (and tp!44812 e!453239))))

(declare-fun mapKey!23200 () (_ BitVec 32))

(declare-fun mapValue!23200 () ValueCell!6785)

(declare-fun mapRest!23200 () (Array (_ BitVec 32) ValueCell!6785))

(assert (=> mapNonEmpty!23200 (= mapRest!23191 (store mapRest!23200 mapKey!23200 mapValue!23200))))

(declare-fun b!816911 () Bool)

(assert (=> b!816911 (= e!453239 tp_is_empty!14401)))

(declare-fun b!816912 () Bool)

(declare-fun e!453240 () Bool)

(assert (=> b!816912 (= e!453240 tp_is_empty!14401)))

(declare-fun mapIsEmpty!23200 () Bool)

(assert (=> mapIsEmpty!23200 mapRes!23200))

(declare-fun condMapEmpty!23200 () Bool)

(declare-fun mapDefault!23200 () ValueCell!6785)

(assert (=> mapNonEmpty!23191 (= condMapEmpty!23200 (= mapRest!23191 ((as const (Array (_ BitVec 32) ValueCell!6785)) mapDefault!23200)))))

(assert (=> mapNonEmpty!23191 (= tp!44797 (and e!453240 mapRes!23200))))

(assert (= (and mapNonEmpty!23191 condMapEmpty!23200) mapIsEmpty!23200))

(assert (= (and mapNonEmpty!23191 (not condMapEmpty!23200)) mapNonEmpty!23200))

(assert (= (and mapNonEmpty!23200 ((_ is ValueCellFull!6785) mapValue!23200)) b!816911))

(assert (= (and mapNonEmpty!23191 ((_ is ValueCellFull!6785) mapDefault!23200)) b!816912))

(declare-fun m!758039 () Bool)

(assert (=> mapNonEmpty!23200 m!758039))

(declare-fun b_lambda!10881 () Bool)

(assert (= b_lambda!10875 (or (and start!70296 b_free!12691) b_lambda!10881)))

(declare-fun b_lambda!10883 () Bool)

(assert (= b_lambda!10869 (or (and start!70296 b_free!12691) b_lambda!10883)))

(declare-fun b_lambda!10885 () Bool)

(assert (= b_lambda!10871 (or (and start!70296 b_free!12691) b_lambda!10885)))

(declare-fun b_lambda!10887 () Bool)

(assert (= b_lambda!10873 (or (and start!70296 b_free!12691) b_lambda!10887)))

(declare-fun b_lambda!10889 () Bool)

(assert (= b_lambda!10879 (or (and start!70296 b_free!12691) b_lambda!10889)))

(declare-fun b_lambda!10891 () Bool)

(assert (= b_lambda!10877 (or (and start!70296 b_free!12691) b_lambda!10891)))

(check-sat (not b!816879) (not b!816783) (not b!816859) (not b_next!12691) (not b!816802) (not b!816780) (not bm!35561) tp_is_empty!14401 (not d!104365) (not d!104359) (not b!816786) (not b!816752) b_and!21481 (not bm!35560) (not b!816880) (not b_lambda!10891) (not bm!35531) (not b!816749) (not mapNonEmpty!23200) (not b!816801) (not b_lambda!10887) (not b_lambda!10883) (not b!816797) (not b!816748) (not d!104357) (not b!816785) (not b!816788) (not b!816883) (not b!816863) (not b!816787) (not d!104355) (not bm!35535) (not b!816778) (not b!816903) (not bm!35534) (not b!816781) (not bm!35554) (not b!816872) (not d!104361) (not b!816892) (not b!816800) (not b!816792) (not bm!35558) (not b!816795) (not b!816871) (not bm!35556) (not b_lambda!10889) (not b_lambda!10881) (not b!816853) (not b!816808) (not b!816855) (not bm!35566) (not b!816874) (not bm!35553) (not b!816862) (not d!104363) (not bm!35551) (not b!816876) (not b!816902) (not b!816794) (not b!816884) (not b!816851) (not b!816858) (not b!816807) (not b_lambda!10885) (not b!816799) (not bm!35563))
(check-sat b_and!21481 (not b_next!12691))
