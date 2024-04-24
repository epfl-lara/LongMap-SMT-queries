; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71344 () Bool)

(assert start!71344)

(declare-fun b_free!13345 () Bool)

(declare-fun b_next!13345 () Bool)

(assert (=> start!71344 (= b_free!13345 (not b_next!13345))))

(declare-fun tp!46794 () Bool)

(declare-fun b_and!22281 () Bool)

(assert (=> start!71344 (= tp!46794 b_and!22281)))

(declare-fun b!827740 () Bool)

(declare-fun res!563991 () Bool)

(declare-fun e!461104 () Bool)

(assert (=> b!827740 (=> (not res!563991) (not e!461104))))

(declare-datatypes ((array!46289 0))(
  ( (array!46290 (arr!22185 (Array (_ BitVec 32) (_ BitVec 64))) (size!22605 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46289)

(declare-datatypes ((List!15741 0))(
  ( (Nil!15738) (Cons!15737 (h!16872 (_ BitVec 64)) (t!22080 List!15741)) )
))
(declare-fun arrayNoDuplicates!0 (array!46289 (_ BitVec 32) List!15741) Bool)

(assert (=> b!827740 (= res!563991 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15738))))

(declare-fun b!827741 () Bool)

(declare-fun res!563994 () Bool)

(assert (=> b!827741 (=> (not res!563994) (not e!461104))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25075 0))(
  ( (V!25076 (val!7575 Int)) )
))
(declare-datatypes ((ValueCell!7112 0))(
  ( (ValueCellFull!7112 (v!10009 V!25075)) (EmptyCell!7112) )
))
(declare-datatypes ((array!46291 0))(
  ( (array!46292 (arr!22186 (Array (_ BitVec 32) ValueCell!7112)) (size!22606 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46291)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827741 (= res!563994 (and (= (size!22606 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22605 _keys!976) (size!22606 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827742 () Bool)

(declare-fun e!461106 () Bool)

(assert (=> b!827742 (= e!461106 (bvsle #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun res!563990 () Bool)

(assert (=> start!71344 (=> (not res!563990) (not e!461104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71344 (= res!563990 (validMask!0 mask!1312))))

(assert (=> start!71344 e!461104))

(declare-fun tp_is_empty!15055 () Bool)

(assert (=> start!71344 tp_is_empty!15055))

(declare-fun array_inv!17723 (array!46289) Bool)

(assert (=> start!71344 (array_inv!17723 _keys!976)))

(assert (=> start!71344 true))

(declare-fun e!461105 () Bool)

(declare-fun array_inv!17724 (array!46291) Bool)

(assert (=> start!71344 (and (array_inv!17724 _values!788) e!461105)))

(assert (=> start!71344 tp!46794))

(declare-fun b!827743 () Bool)

(declare-fun e!461112 () Bool)

(declare-fun mapRes!24208 () Bool)

(assert (=> b!827743 (= e!461105 (and e!461112 mapRes!24208))))

(declare-fun condMapEmpty!24208 () Bool)

(declare-fun mapDefault!24208 () ValueCell!7112)

(assert (=> b!827743 (= condMapEmpty!24208 (= (arr!22186 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7112)) mapDefault!24208)))))

(declare-fun e!461107 () Bool)

(declare-datatypes ((tuple2!9966 0))(
  ( (tuple2!9967 (_1!4994 (_ BitVec 64)) (_2!4994 V!25075)) )
))
(declare-fun lt!374883 () tuple2!9966)

(declare-datatypes ((List!15742 0))(
  ( (Nil!15739) (Cons!15738 (h!16873 tuple2!9966) (t!22081 List!15742)) )
))
(declare-datatypes ((ListLongMap!8791 0))(
  ( (ListLongMap!8792 (toList!4411 List!15742)) )
))
(declare-fun lt!374892 () ListLongMap!8791)

(declare-fun lt!374884 () ListLongMap!8791)

(declare-fun b!827744 () Bool)

(declare-fun zeroValueAfter!34 () V!25075)

(declare-fun +!1956 (ListLongMap!8791 tuple2!9966) ListLongMap!8791)

(assert (=> b!827744 (= e!461107 (= lt!374892 (+!1956 (+!1956 lt!374884 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374883)))))

(declare-fun mapNonEmpty!24208 () Bool)

(declare-fun tp!46795 () Bool)

(declare-fun e!461111 () Bool)

(assert (=> mapNonEmpty!24208 (= mapRes!24208 (and tp!46795 e!461111))))

(declare-fun mapValue!24208 () ValueCell!7112)

(declare-fun mapRest!24208 () (Array (_ BitVec 32) ValueCell!7112))

(declare-fun mapKey!24208 () (_ BitVec 32))

(assert (=> mapNonEmpty!24208 (= (arr!22186 _values!788) (store mapRest!24208 mapKey!24208 mapValue!24208))))

(declare-fun b!827745 () Bool)

(declare-fun e!461108 () Bool)

(assert (=> b!827745 (= e!461108 e!461106)))

(declare-fun res!563995 () Bool)

(assert (=> b!827745 (=> res!563995 e!461106)))

(declare-fun lt!374888 () tuple2!9966)

(declare-fun lt!374890 () ListLongMap!8791)

(assert (=> b!827745 (= res!563995 (not (= lt!374892 (+!1956 (+!1956 lt!374890 lt!374888) lt!374883))))))

(declare-fun lt!374885 () ListLongMap!8791)

(declare-fun lt!374887 () ListLongMap!8791)

(assert (=> b!827745 (and (= lt!374885 lt!374887) (= lt!374892 lt!374887) (= lt!374892 lt!374885))))

(declare-fun lt!374882 () ListLongMap!8791)

(assert (=> b!827745 (= lt!374887 (+!1956 lt!374882 lt!374888))))

(declare-fun lt!374886 () ListLongMap!8791)

(assert (=> b!827745 (= lt!374885 (+!1956 lt!374886 lt!374888))))

(declare-fun zeroValueBefore!34 () V!25075)

(declare-datatypes ((Unit!28374 0))(
  ( (Unit!28375) )
))
(declare-fun lt!374889 () Unit!28374)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!240 (ListLongMap!8791 (_ BitVec 64) V!25075 V!25075) Unit!28374)

(assert (=> b!827745 (= lt!374889 (addSameAsAddTwiceSameKeyDiffValues!240 lt!374886 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!461109 () Bool)

(assert (=> b!827745 e!461109))

(declare-fun res!563988 () Bool)

(assert (=> b!827745 (=> (not res!563988) (not e!461109))))

(declare-fun lt!374893 () ListLongMap!8791)

(assert (=> b!827745 (= res!563988 (= lt!374893 lt!374882))))

(declare-fun lt!374881 () tuple2!9966)

(assert (=> b!827745 (= lt!374882 (+!1956 lt!374886 lt!374881))))

(assert (=> b!827745 (= lt!374886 (+!1956 lt!374890 lt!374883))))

(assert (=> b!827745 (= lt!374888 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!827745 e!461107))

(declare-fun res!563989 () Bool)

(assert (=> b!827745 (=> (not res!563989) (not e!461107))))

(assert (=> b!827745 (= res!563989 (= lt!374893 (+!1956 (+!1956 lt!374890 lt!374881) lt!374883)))))

(declare-fun minValue!754 () V!25075)

(assert (=> b!827745 (= lt!374883 (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827745 (= lt!374881 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2531 (array!46289 array!46291 (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 (_ BitVec 32) Int) ListLongMap!8791)

(assert (=> b!827745 (= lt!374892 (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827745 (= lt!374893 (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827746 () Bool)

(declare-fun res!563992 () Bool)

(assert (=> b!827746 (=> (not res!563992) (not e!461104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46289 (_ BitVec 32)) Bool)

(assert (=> b!827746 (= res!563992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827747 () Bool)

(assert (=> b!827747 (= e!461112 tp_is_empty!15055)))

(declare-fun mapIsEmpty!24208 () Bool)

(assert (=> mapIsEmpty!24208 mapRes!24208))

(declare-fun b!827748 () Bool)

(assert (=> b!827748 (= e!461111 tp_is_empty!15055)))

(declare-fun b!827749 () Bool)

(assert (=> b!827749 (= e!461104 (not e!461108))))

(declare-fun res!563993 () Bool)

(assert (=> b!827749 (=> res!563993 e!461108)))

(assert (=> b!827749 (= res!563993 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827749 (= lt!374890 lt!374884)))

(declare-fun lt!374891 () Unit!28374)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!577 (array!46289 array!46291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 V!25075 V!25075 (_ BitVec 32) Int) Unit!28374)

(assert (=> b!827749 (= lt!374891 (lemmaNoChangeToArrayThenSameMapNoExtras!577 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2489 (array!46289 array!46291 (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 (_ BitVec 32) Int) ListLongMap!8791)

(assert (=> b!827749 (= lt!374884 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827749 (= lt!374890 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827750 () Bool)

(assert (=> b!827750 (= e!461109 (= lt!374892 (+!1956 (+!1956 lt!374884 lt!374883) lt!374888)))))

(assert (= (and start!71344 res!563990) b!827741))

(assert (= (and b!827741 res!563994) b!827746))

(assert (= (and b!827746 res!563992) b!827740))

(assert (= (and b!827740 res!563991) b!827749))

(assert (= (and b!827749 (not res!563993)) b!827745))

(assert (= (and b!827745 res!563989) b!827744))

(assert (= (and b!827745 res!563988) b!827750))

(assert (= (and b!827745 (not res!563995)) b!827742))

(assert (= (and b!827743 condMapEmpty!24208) mapIsEmpty!24208))

(assert (= (and b!827743 (not condMapEmpty!24208)) mapNonEmpty!24208))

(get-info :version)

(assert (= (and mapNonEmpty!24208 ((_ is ValueCellFull!7112) mapValue!24208)) b!827748))

(assert (= (and b!827743 ((_ is ValueCellFull!7112) mapDefault!24208)) b!827747))

(assert (= start!71344 b!827743))

(declare-fun m!771109 () Bool)

(assert (=> start!71344 m!771109))

(declare-fun m!771111 () Bool)

(assert (=> start!71344 m!771111))

(declare-fun m!771113 () Bool)

(assert (=> start!71344 m!771113))

(declare-fun m!771115 () Bool)

(assert (=> b!827746 m!771115))

(declare-fun m!771117 () Bool)

(assert (=> b!827745 m!771117))

(declare-fun m!771119 () Bool)

(assert (=> b!827745 m!771119))

(declare-fun m!771121 () Bool)

(assert (=> b!827745 m!771121))

(declare-fun m!771123 () Bool)

(assert (=> b!827745 m!771123))

(declare-fun m!771125 () Bool)

(assert (=> b!827745 m!771125))

(declare-fun m!771127 () Bool)

(assert (=> b!827745 m!771127))

(declare-fun m!771129 () Bool)

(assert (=> b!827745 m!771129))

(declare-fun m!771131 () Bool)

(assert (=> b!827745 m!771131))

(declare-fun m!771133 () Bool)

(assert (=> b!827745 m!771133))

(declare-fun m!771135 () Bool)

(assert (=> b!827745 m!771135))

(assert (=> b!827745 m!771127))

(assert (=> b!827745 m!771119))

(declare-fun m!771137 () Bool)

(assert (=> b!827745 m!771137))

(declare-fun m!771139 () Bool)

(assert (=> b!827749 m!771139))

(declare-fun m!771141 () Bool)

(assert (=> b!827749 m!771141))

(declare-fun m!771143 () Bool)

(assert (=> b!827749 m!771143))

(declare-fun m!771145 () Bool)

(assert (=> b!827740 m!771145))

(declare-fun m!771147 () Bool)

(assert (=> b!827744 m!771147))

(assert (=> b!827744 m!771147))

(declare-fun m!771149 () Bool)

(assert (=> b!827744 m!771149))

(declare-fun m!771151 () Bool)

(assert (=> b!827750 m!771151))

(assert (=> b!827750 m!771151))

(declare-fun m!771153 () Bool)

(assert (=> b!827750 m!771153))

(declare-fun m!771155 () Bool)

(assert (=> mapNonEmpty!24208 m!771155))

(check-sat (not b!827745) (not b!827740) tp_is_empty!15055 (not b_next!13345) (not b!827746) (not mapNonEmpty!24208) (not b!827750) (not b!827744) b_and!22281 (not start!71344) (not b!827749))
(check-sat b_and!22281 (not b_next!13345))
(get-model)

(declare-fun d!105379 () Bool)

(declare-fun e!461169 () Bool)

(assert (=> d!105379 e!461169))

(declare-fun res!564048 () Bool)

(assert (=> d!105379 (=> (not res!564048) (not e!461169))))

(declare-fun lt!374982 () ListLongMap!8791)

(declare-fun contains!4160 (ListLongMap!8791 (_ BitVec 64)) Bool)

(assert (=> d!105379 (= res!564048 (contains!4160 lt!374982 (_1!4994 lt!374888)))))

(declare-fun lt!374980 () List!15742)

(assert (=> d!105379 (= lt!374982 (ListLongMap!8792 lt!374980))))

(declare-fun lt!374981 () Unit!28374)

(declare-fun lt!374983 () Unit!28374)

(assert (=> d!105379 (= lt!374981 lt!374983)))

(declare-datatypes ((Option!414 0))(
  ( (Some!413 (v!10012 V!25075)) (None!412) )
))
(declare-fun getValueByKey!408 (List!15742 (_ BitVec 64)) Option!414)

(assert (=> d!105379 (= (getValueByKey!408 lt!374980 (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888)))))

(declare-fun lemmaContainsTupThenGetReturnValue!222 (List!15742 (_ BitVec 64) V!25075) Unit!28374)

(assert (=> d!105379 (= lt!374983 (lemmaContainsTupThenGetReturnValue!222 lt!374980 (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(declare-fun insertStrictlySorted!261 (List!15742 (_ BitVec 64) V!25075) List!15742)

(assert (=> d!105379 (= lt!374980 (insertStrictlySorted!261 (toList!4411 lt!374886) (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105379 (= (+!1956 lt!374886 lt!374888) lt!374982)))

(declare-fun b!827821 () Bool)

(declare-fun res!564049 () Bool)

(assert (=> b!827821 (=> (not res!564049) (not e!461169))))

(assert (=> b!827821 (= res!564049 (= (getValueByKey!408 (toList!4411 lt!374982) (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888))))))

(declare-fun b!827822 () Bool)

(declare-fun contains!4161 (List!15742 tuple2!9966) Bool)

(assert (=> b!827822 (= e!461169 (contains!4161 (toList!4411 lt!374982) lt!374888))))

(assert (= (and d!105379 res!564048) b!827821))

(assert (= (and b!827821 res!564049) b!827822))

(declare-fun m!771253 () Bool)

(assert (=> d!105379 m!771253))

(declare-fun m!771255 () Bool)

(assert (=> d!105379 m!771255))

(declare-fun m!771257 () Bool)

(assert (=> d!105379 m!771257))

(declare-fun m!771259 () Bool)

(assert (=> d!105379 m!771259))

(declare-fun m!771261 () Bool)

(assert (=> b!827821 m!771261))

(declare-fun m!771263 () Bool)

(assert (=> b!827822 m!771263))

(assert (=> b!827745 d!105379))

(declare-fun d!105381 () Bool)

(declare-fun e!461170 () Bool)

(assert (=> d!105381 e!461170))

(declare-fun res!564050 () Bool)

(assert (=> d!105381 (=> (not res!564050) (not e!461170))))

(declare-fun lt!374986 () ListLongMap!8791)

(assert (=> d!105381 (= res!564050 (contains!4160 lt!374986 (_1!4994 lt!374881)))))

(declare-fun lt!374984 () List!15742)

(assert (=> d!105381 (= lt!374986 (ListLongMap!8792 lt!374984))))

(declare-fun lt!374985 () Unit!28374)

(declare-fun lt!374987 () Unit!28374)

(assert (=> d!105381 (= lt!374985 lt!374987)))

(assert (=> d!105381 (= (getValueByKey!408 lt!374984 (_1!4994 lt!374881)) (Some!413 (_2!4994 lt!374881)))))

(assert (=> d!105381 (= lt!374987 (lemmaContainsTupThenGetReturnValue!222 lt!374984 (_1!4994 lt!374881) (_2!4994 lt!374881)))))

(assert (=> d!105381 (= lt!374984 (insertStrictlySorted!261 (toList!4411 lt!374890) (_1!4994 lt!374881) (_2!4994 lt!374881)))))

(assert (=> d!105381 (= (+!1956 lt!374890 lt!374881) lt!374986)))

(declare-fun b!827823 () Bool)

(declare-fun res!564051 () Bool)

(assert (=> b!827823 (=> (not res!564051) (not e!461170))))

(assert (=> b!827823 (= res!564051 (= (getValueByKey!408 (toList!4411 lt!374986) (_1!4994 lt!374881)) (Some!413 (_2!4994 lt!374881))))))

(declare-fun b!827824 () Bool)

(assert (=> b!827824 (= e!461170 (contains!4161 (toList!4411 lt!374986) lt!374881))))

(assert (= (and d!105381 res!564050) b!827823))

(assert (= (and b!827823 res!564051) b!827824))

(declare-fun m!771265 () Bool)

(assert (=> d!105381 m!771265))

(declare-fun m!771267 () Bool)

(assert (=> d!105381 m!771267))

(declare-fun m!771269 () Bool)

(assert (=> d!105381 m!771269))

(declare-fun m!771271 () Bool)

(assert (=> d!105381 m!771271))

(declare-fun m!771273 () Bool)

(assert (=> b!827823 m!771273))

(declare-fun m!771275 () Bool)

(assert (=> b!827824 m!771275))

(assert (=> b!827745 d!105381))

(declare-fun d!105383 () Bool)

(declare-fun e!461171 () Bool)

(assert (=> d!105383 e!461171))

(declare-fun res!564052 () Bool)

(assert (=> d!105383 (=> (not res!564052) (not e!461171))))

(declare-fun lt!374990 () ListLongMap!8791)

(assert (=> d!105383 (= res!564052 (contains!4160 lt!374990 (_1!4994 lt!374881)))))

(declare-fun lt!374988 () List!15742)

(assert (=> d!105383 (= lt!374990 (ListLongMap!8792 lt!374988))))

(declare-fun lt!374989 () Unit!28374)

(declare-fun lt!374991 () Unit!28374)

(assert (=> d!105383 (= lt!374989 lt!374991)))

(assert (=> d!105383 (= (getValueByKey!408 lt!374988 (_1!4994 lt!374881)) (Some!413 (_2!4994 lt!374881)))))

(assert (=> d!105383 (= lt!374991 (lemmaContainsTupThenGetReturnValue!222 lt!374988 (_1!4994 lt!374881) (_2!4994 lt!374881)))))

(assert (=> d!105383 (= lt!374988 (insertStrictlySorted!261 (toList!4411 lt!374886) (_1!4994 lt!374881) (_2!4994 lt!374881)))))

(assert (=> d!105383 (= (+!1956 lt!374886 lt!374881) lt!374990)))

(declare-fun b!827825 () Bool)

(declare-fun res!564053 () Bool)

(assert (=> b!827825 (=> (not res!564053) (not e!461171))))

(assert (=> b!827825 (= res!564053 (= (getValueByKey!408 (toList!4411 lt!374990) (_1!4994 lt!374881)) (Some!413 (_2!4994 lt!374881))))))

(declare-fun b!827826 () Bool)

(assert (=> b!827826 (= e!461171 (contains!4161 (toList!4411 lt!374990) lt!374881))))

(assert (= (and d!105383 res!564052) b!827825))

(assert (= (and b!827825 res!564053) b!827826))

(declare-fun m!771277 () Bool)

(assert (=> d!105383 m!771277))

(declare-fun m!771279 () Bool)

(assert (=> d!105383 m!771279))

(declare-fun m!771281 () Bool)

(assert (=> d!105383 m!771281))

(declare-fun m!771283 () Bool)

(assert (=> d!105383 m!771283))

(declare-fun m!771285 () Bool)

(assert (=> b!827825 m!771285))

(declare-fun m!771287 () Bool)

(assert (=> b!827826 m!771287))

(assert (=> b!827745 d!105383))

(declare-fun b!827869 () Bool)

(declare-fun e!461210 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!827869 (= e!461210 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35965 () Bool)

(declare-fun call!35971 () ListLongMap!8791)

(declare-fun call!35972 () ListLongMap!8791)

(assert (=> bm!35965 (= call!35971 call!35972)))

(declare-fun b!827870 () Bool)

(declare-fun e!461208 () Bool)

(declare-fun call!35973 () Bool)

(assert (=> b!827870 (= e!461208 (not call!35973))))

(declare-fun call!35974 () ListLongMap!8791)

(declare-fun bm!35966 () Bool)

(assert (=> bm!35966 (= call!35974 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827871 () Bool)

(declare-fun res!564077 () Bool)

(declare-fun e!461199 () Bool)

(assert (=> b!827871 (=> (not res!564077) (not e!461199))))

(declare-fun e!461202 () Bool)

(assert (=> b!827871 (= res!564077 e!461202)))

(declare-fun res!564075 () Bool)

(assert (=> b!827871 (=> res!564075 e!461202)))

(assert (=> b!827871 (= res!564075 (not e!461210))))

(declare-fun res!564078 () Bool)

(assert (=> b!827871 (=> (not res!564078) (not e!461210))))

(assert (=> b!827871 (= res!564078 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827872 () Bool)

(declare-fun e!461204 () Bool)

(declare-fun call!35970 () Bool)

(assert (=> b!827872 (= e!461204 (not call!35970))))

(declare-fun bm!35967 () Bool)

(declare-fun lt!375041 () ListLongMap!8791)

(assert (=> bm!35967 (= call!35973 (contains!4160 lt!375041 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827873 () Bool)

(declare-fun res!564072 () Bool)

(assert (=> b!827873 (=> (not res!564072) (not e!461199))))

(assert (=> b!827873 (= res!564072 e!461204)))

(declare-fun c!89767 () Bool)

(assert (=> b!827873 (= c!89767 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827874 () Bool)

(declare-fun e!461206 () Bool)

(declare-fun apply!363 (ListLongMap!8791 (_ BitVec 64)) V!25075)

(assert (=> b!827874 (= e!461206 (= (apply!363 lt!375041 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun d!105385 () Bool)

(assert (=> d!105385 e!461199))

(declare-fun res!564073 () Bool)

(assert (=> d!105385 (=> (not res!564073) (not e!461199))))

(assert (=> d!105385 (= res!564073 (or (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))))

(declare-fun lt!375045 () ListLongMap!8791)

(assert (=> d!105385 (= lt!375041 lt!375045)))

(declare-fun lt!375048 () Unit!28374)

(declare-fun e!461200 () Unit!28374)

(assert (=> d!105385 (= lt!375048 e!461200)))

(declare-fun c!89769 () Bool)

(declare-fun e!461209 () Bool)

(assert (=> d!105385 (= c!89769 e!461209)))

(declare-fun res!564080 () Bool)

(assert (=> d!105385 (=> (not res!564080) (not e!461209))))

(assert (=> d!105385 (= res!564080 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun e!461205 () ListLongMap!8791)

(assert (=> d!105385 (= lt!375045 e!461205)))

(declare-fun c!89770 () Bool)

(assert (=> d!105385 (= c!89770 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105385 (validMask!0 mask!1312)))

(assert (=> d!105385 (= (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375041)))

(declare-fun bm!35968 () Bool)

(declare-fun call!35968 () ListLongMap!8791)

(declare-fun call!35969 () ListLongMap!8791)

(assert (=> bm!35968 (= call!35968 call!35969)))

(declare-fun b!827875 () Bool)

(assert (=> b!827875 (= e!461208 e!461206)))

(declare-fun res!564079 () Bool)

(assert (=> b!827875 (= res!564079 call!35973)))

(assert (=> b!827875 (=> (not res!564079) (not e!461206))))

(declare-fun b!827876 () Bool)

(declare-fun e!461201 () ListLongMap!8791)

(assert (=> b!827876 (= e!461201 call!35971)))

(declare-fun b!827877 () Bool)

(declare-fun Unit!28378 () Unit!28374)

(assert (=> b!827877 (= e!461200 Unit!28378)))

(declare-fun bm!35969 () Bool)

(assert (=> bm!35969 (= call!35972 call!35974)))

(declare-fun e!461207 () Bool)

(declare-fun b!827878 () Bool)

(declare-fun get!11761 (ValueCell!7112 V!25075) V!25075)

(declare-fun dynLambda!971 (Int (_ BitVec 64)) V!25075)

(assert (=> b!827878 (= e!461207 (= (apply!363 lt!375041 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22606 _values!788)))))

(assert (=> b!827878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827879 () Bool)

(declare-fun e!461198 () ListLongMap!8791)

(assert (=> b!827879 (= e!461198 call!35968)))

(declare-fun b!827880 () Bool)

(declare-fun e!461203 () Bool)

(assert (=> b!827880 (= e!461203 (= (apply!363 lt!375041 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!827881 () Bool)

(assert (=> b!827881 (= e!461201 call!35968)))

(declare-fun b!827882 () Bool)

(declare-fun lt!375050 () Unit!28374)

(assert (=> b!827882 (= e!461200 lt!375050)))

(declare-fun lt!375047 () ListLongMap!8791)

(assert (=> b!827882 (= lt!375047 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375046 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375055 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375055 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375049 () Unit!28374)

(declare-fun addStillContains!315 (ListLongMap!8791 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28374)

(assert (=> b!827882 (= lt!375049 (addStillContains!315 lt!375047 lt!375046 zeroValueAfter!34 lt!375055))))

(assert (=> b!827882 (contains!4160 (+!1956 lt!375047 (tuple2!9967 lt!375046 zeroValueAfter!34)) lt!375055)))

(declare-fun lt!375040 () Unit!28374)

(assert (=> b!827882 (= lt!375040 lt!375049)))

(declare-fun lt!375052 () ListLongMap!8791)

(assert (=> b!827882 (= lt!375052 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375044 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375036 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375036 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375037 () Unit!28374)

(declare-fun addApplyDifferent!315 (ListLongMap!8791 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28374)

(assert (=> b!827882 (= lt!375037 (addApplyDifferent!315 lt!375052 lt!375044 minValue!754 lt!375036))))

(assert (=> b!827882 (= (apply!363 (+!1956 lt!375052 (tuple2!9967 lt!375044 minValue!754)) lt!375036) (apply!363 lt!375052 lt!375036))))

(declare-fun lt!375053 () Unit!28374)

(assert (=> b!827882 (= lt!375053 lt!375037)))

(declare-fun lt!375054 () ListLongMap!8791)

(assert (=> b!827882 (= lt!375054 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375051 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375056 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375056 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375043 () Unit!28374)

(assert (=> b!827882 (= lt!375043 (addApplyDifferent!315 lt!375054 lt!375051 zeroValueAfter!34 lt!375056))))

(assert (=> b!827882 (= (apply!363 (+!1956 lt!375054 (tuple2!9967 lt!375051 zeroValueAfter!34)) lt!375056) (apply!363 lt!375054 lt!375056))))

(declare-fun lt!375042 () Unit!28374)

(assert (=> b!827882 (= lt!375042 lt!375043)))

(declare-fun lt!375038 () ListLongMap!8791)

(assert (=> b!827882 (= lt!375038 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375039 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375057 () (_ BitVec 64))

(assert (=> b!827882 (= lt!375057 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827882 (= lt!375050 (addApplyDifferent!315 lt!375038 lt!375039 minValue!754 lt!375057))))

(assert (=> b!827882 (= (apply!363 (+!1956 lt!375038 (tuple2!9967 lt!375039 minValue!754)) lt!375057) (apply!363 lt!375038 lt!375057))))

(declare-fun b!827883 () Bool)

(assert (=> b!827883 (= e!461205 (+!1956 call!35969 (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35970 () Bool)

(assert (=> bm!35970 (= call!35970 (contains!4160 lt!375041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35971 () Bool)

(declare-fun c!89768 () Bool)

(assert (=> bm!35971 (= call!35969 (+!1956 (ite c!89770 call!35974 (ite c!89768 call!35972 call!35971)) (ite (or c!89770 c!89768) (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827884 () Bool)

(assert (=> b!827884 (= e!461209 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827885 () Bool)

(assert (=> b!827885 (= e!461205 e!461198)))

(assert (=> b!827885 (= c!89768 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!827886 () Bool)

(assert (=> b!827886 (= e!461204 e!461203)))

(declare-fun res!564074 () Bool)

(assert (=> b!827886 (= res!564074 call!35970)))

(assert (=> b!827886 (=> (not res!564074) (not e!461203))))

(declare-fun b!827887 () Bool)

(assert (=> b!827887 (= e!461202 e!461207)))

(declare-fun res!564076 () Bool)

(assert (=> b!827887 (=> (not res!564076) (not e!461207))))

(assert (=> b!827887 (= res!564076 (contains!4160 lt!375041 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827888 () Bool)

(declare-fun c!89771 () Bool)

(assert (=> b!827888 (= c!89771 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827888 (= e!461198 e!461201)))

(declare-fun b!827889 () Bool)

(assert (=> b!827889 (= e!461199 e!461208)))

(declare-fun c!89766 () Bool)

(assert (=> b!827889 (= c!89766 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!105385 c!89770) b!827883))

(assert (= (and d!105385 (not c!89770)) b!827885))

(assert (= (and b!827885 c!89768) b!827879))

(assert (= (and b!827885 (not c!89768)) b!827888))

(assert (= (and b!827888 c!89771) b!827881))

(assert (= (and b!827888 (not c!89771)) b!827876))

(assert (= (or b!827881 b!827876) bm!35965))

(assert (= (or b!827879 bm!35965) bm!35969))

(assert (= (or b!827879 b!827881) bm!35968))

(assert (= (or b!827883 bm!35969) bm!35966))

(assert (= (or b!827883 bm!35968) bm!35971))

(assert (= (and d!105385 res!564080) b!827884))

(assert (= (and d!105385 c!89769) b!827882))

(assert (= (and d!105385 (not c!89769)) b!827877))

(assert (= (and d!105385 res!564073) b!827871))

(assert (= (and b!827871 res!564078) b!827869))

(assert (= (and b!827871 (not res!564075)) b!827887))

(assert (= (and b!827887 res!564076) b!827878))

(assert (= (and b!827871 res!564077) b!827873))

(assert (= (and b!827873 c!89767) b!827886))

(assert (= (and b!827873 (not c!89767)) b!827872))

(assert (= (and b!827886 res!564074) b!827880))

(assert (= (or b!827886 b!827872) bm!35970))

(assert (= (and b!827873 res!564072) b!827889))

(assert (= (and b!827889 c!89766) b!827875))

(assert (= (and b!827889 (not c!89766)) b!827870))

(assert (= (and b!827875 res!564079) b!827874))

(assert (= (or b!827875 b!827870) bm!35967))

(declare-fun b_lambda!11153 () Bool)

(assert (=> (not b_lambda!11153) (not b!827878)))

(declare-fun t!22086 () Bool)

(declare-fun tb!4199 () Bool)

(assert (=> (and start!71344 (= defaultEntry!796 defaultEntry!796) t!22086) tb!4199))

(declare-fun result!7953 () Bool)

(assert (=> tb!4199 (= result!7953 tp_is_empty!15055)))

(assert (=> b!827878 t!22086))

(declare-fun b_and!22287 () Bool)

(assert (= b_and!22281 (and (=> t!22086 result!7953) b_and!22287)))

(declare-fun m!771289 () Bool)

(assert (=> b!827883 m!771289))

(declare-fun m!771291 () Bool)

(assert (=> b!827869 m!771291))

(assert (=> b!827869 m!771291))

(declare-fun m!771293 () Bool)

(assert (=> b!827869 m!771293))

(assert (=> b!827887 m!771291))

(assert (=> b!827887 m!771291))

(declare-fun m!771295 () Bool)

(assert (=> b!827887 m!771295))

(assert (=> d!105385 m!771109))

(declare-fun m!771297 () Bool)

(assert (=> b!827878 m!771297))

(assert (=> b!827878 m!771297))

(declare-fun m!771299 () Bool)

(assert (=> b!827878 m!771299))

(declare-fun m!771301 () Bool)

(assert (=> b!827878 m!771301))

(assert (=> b!827878 m!771291))

(assert (=> b!827878 m!771291))

(declare-fun m!771303 () Bool)

(assert (=> b!827878 m!771303))

(assert (=> b!827878 m!771299))

(assert (=> bm!35966 m!771141))

(declare-fun m!771305 () Bool)

(assert (=> bm!35971 m!771305))

(declare-fun m!771307 () Bool)

(assert (=> bm!35970 m!771307))

(declare-fun m!771309 () Bool)

(assert (=> bm!35967 m!771309))

(assert (=> b!827884 m!771291))

(assert (=> b!827884 m!771291))

(assert (=> b!827884 m!771293))

(declare-fun m!771311 () Bool)

(assert (=> b!827880 m!771311))

(declare-fun m!771313 () Bool)

(assert (=> b!827882 m!771313))

(declare-fun m!771315 () Bool)

(assert (=> b!827882 m!771315))

(declare-fun m!771317 () Bool)

(assert (=> b!827882 m!771317))

(declare-fun m!771319 () Bool)

(assert (=> b!827882 m!771319))

(declare-fun m!771321 () Bool)

(assert (=> b!827882 m!771321))

(declare-fun m!771323 () Bool)

(assert (=> b!827882 m!771323))

(assert (=> b!827882 m!771141))

(assert (=> b!827882 m!771313))

(declare-fun m!771325 () Bool)

(assert (=> b!827882 m!771325))

(declare-fun m!771327 () Bool)

(assert (=> b!827882 m!771327))

(declare-fun m!771329 () Bool)

(assert (=> b!827882 m!771329))

(assert (=> b!827882 m!771291))

(declare-fun m!771331 () Bool)

(assert (=> b!827882 m!771331))

(declare-fun m!771333 () Bool)

(assert (=> b!827882 m!771333))

(declare-fun m!771335 () Bool)

(assert (=> b!827882 m!771335))

(assert (=> b!827882 m!771315))

(declare-fun m!771337 () Bool)

(assert (=> b!827882 m!771337))

(assert (=> b!827882 m!771327))

(declare-fun m!771339 () Bool)

(assert (=> b!827882 m!771339))

(declare-fun m!771341 () Bool)

(assert (=> b!827882 m!771341))

(assert (=> b!827882 m!771321))

(declare-fun m!771343 () Bool)

(assert (=> b!827874 m!771343))

(assert (=> b!827745 d!105385))

(declare-fun d!105387 () Bool)

(assert (=> d!105387 (= (+!1956 lt!374886 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1956 (+!1956 lt!374886 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!375060 () Unit!28374)

(declare-fun choose!1413 (ListLongMap!8791 (_ BitVec 64) V!25075 V!25075) Unit!28374)

(assert (=> d!105387 (= lt!375060 (choose!1413 lt!374886 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!105387 (= (addSameAsAddTwiceSameKeyDiffValues!240 lt!374886 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!375060)))

(declare-fun bs!23114 () Bool)

(assert (= bs!23114 d!105387))

(declare-fun m!771345 () Bool)

(assert (=> bs!23114 m!771345))

(declare-fun m!771347 () Bool)

(assert (=> bs!23114 m!771347))

(assert (=> bs!23114 m!771347))

(declare-fun m!771349 () Bool)

(assert (=> bs!23114 m!771349))

(declare-fun m!771351 () Bool)

(assert (=> bs!23114 m!771351))

(assert (=> b!827745 d!105387))

(declare-fun d!105389 () Bool)

(declare-fun e!461211 () Bool)

(assert (=> d!105389 e!461211))

(declare-fun res!564081 () Bool)

(assert (=> d!105389 (=> (not res!564081) (not e!461211))))

(declare-fun lt!375063 () ListLongMap!8791)

(assert (=> d!105389 (= res!564081 (contains!4160 lt!375063 (_1!4994 lt!374883)))))

(declare-fun lt!375061 () List!15742)

(assert (=> d!105389 (= lt!375063 (ListLongMap!8792 lt!375061))))

(declare-fun lt!375062 () Unit!28374)

(declare-fun lt!375064 () Unit!28374)

(assert (=> d!105389 (= lt!375062 lt!375064)))

(assert (=> d!105389 (= (getValueByKey!408 lt!375061 (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883)))))

(assert (=> d!105389 (= lt!375064 (lemmaContainsTupThenGetReturnValue!222 lt!375061 (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105389 (= lt!375061 (insertStrictlySorted!261 (toList!4411 (+!1956 lt!374890 lt!374888)) (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105389 (= (+!1956 (+!1956 lt!374890 lt!374888) lt!374883) lt!375063)))

(declare-fun b!827892 () Bool)

(declare-fun res!564082 () Bool)

(assert (=> b!827892 (=> (not res!564082) (not e!461211))))

(assert (=> b!827892 (= res!564082 (= (getValueByKey!408 (toList!4411 lt!375063) (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883))))))

(declare-fun b!827893 () Bool)

(assert (=> b!827893 (= e!461211 (contains!4161 (toList!4411 lt!375063) lt!374883))))

(assert (= (and d!105389 res!564081) b!827892))

(assert (= (and b!827892 res!564082) b!827893))

(declare-fun m!771353 () Bool)

(assert (=> d!105389 m!771353))

(declare-fun m!771355 () Bool)

(assert (=> d!105389 m!771355))

(declare-fun m!771357 () Bool)

(assert (=> d!105389 m!771357))

(declare-fun m!771359 () Bool)

(assert (=> d!105389 m!771359))

(declare-fun m!771361 () Bool)

(assert (=> b!827892 m!771361))

(declare-fun m!771363 () Bool)

(assert (=> b!827893 m!771363))

(assert (=> b!827745 d!105389))

(declare-fun d!105391 () Bool)

(declare-fun e!461212 () Bool)

(assert (=> d!105391 e!461212))

(declare-fun res!564083 () Bool)

(assert (=> d!105391 (=> (not res!564083) (not e!461212))))

(declare-fun lt!375067 () ListLongMap!8791)

(assert (=> d!105391 (= res!564083 (contains!4160 lt!375067 (_1!4994 lt!374883)))))

(declare-fun lt!375065 () List!15742)

(assert (=> d!105391 (= lt!375067 (ListLongMap!8792 lt!375065))))

(declare-fun lt!375066 () Unit!28374)

(declare-fun lt!375068 () Unit!28374)

(assert (=> d!105391 (= lt!375066 lt!375068)))

(assert (=> d!105391 (= (getValueByKey!408 lt!375065 (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883)))))

(assert (=> d!105391 (= lt!375068 (lemmaContainsTupThenGetReturnValue!222 lt!375065 (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105391 (= lt!375065 (insertStrictlySorted!261 (toList!4411 lt!374890) (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105391 (= (+!1956 lt!374890 lt!374883) lt!375067)))

(declare-fun b!827894 () Bool)

(declare-fun res!564084 () Bool)

(assert (=> b!827894 (=> (not res!564084) (not e!461212))))

(assert (=> b!827894 (= res!564084 (= (getValueByKey!408 (toList!4411 lt!375067) (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883))))))

(declare-fun b!827895 () Bool)

(assert (=> b!827895 (= e!461212 (contains!4161 (toList!4411 lt!375067) lt!374883))))

(assert (= (and d!105391 res!564083) b!827894))

(assert (= (and b!827894 res!564084) b!827895))

(declare-fun m!771365 () Bool)

(assert (=> d!105391 m!771365))

(declare-fun m!771367 () Bool)

(assert (=> d!105391 m!771367))

(declare-fun m!771369 () Bool)

(assert (=> d!105391 m!771369))

(declare-fun m!771371 () Bool)

(assert (=> d!105391 m!771371))

(declare-fun m!771373 () Bool)

(assert (=> b!827894 m!771373))

(declare-fun m!771375 () Bool)

(assert (=> b!827895 m!771375))

(assert (=> b!827745 d!105391))

(declare-fun d!105393 () Bool)

(declare-fun e!461213 () Bool)

(assert (=> d!105393 e!461213))

(declare-fun res!564085 () Bool)

(assert (=> d!105393 (=> (not res!564085) (not e!461213))))

(declare-fun lt!375071 () ListLongMap!8791)

(assert (=> d!105393 (= res!564085 (contains!4160 lt!375071 (_1!4994 lt!374888)))))

(declare-fun lt!375069 () List!15742)

(assert (=> d!105393 (= lt!375071 (ListLongMap!8792 lt!375069))))

(declare-fun lt!375070 () Unit!28374)

(declare-fun lt!375072 () Unit!28374)

(assert (=> d!105393 (= lt!375070 lt!375072)))

(assert (=> d!105393 (= (getValueByKey!408 lt!375069 (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888)))))

(assert (=> d!105393 (= lt!375072 (lemmaContainsTupThenGetReturnValue!222 lt!375069 (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105393 (= lt!375069 (insertStrictlySorted!261 (toList!4411 lt!374882) (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105393 (= (+!1956 lt!374882 lt!374888) lt!375071)))

(declare-fun b!827896 () Bool)

(declare-fun res!564086 () Bool)

(assert (=> b!827896 (=> (not res!564086) (not e!461213))))

(assert (=> b!827896 (= res!564086 (= (getValueByKey!408 (toList!4411 lt!375071) (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888))))))

(declare-fun b!827897 () Bool)

(assert (=> b!827897 (= e!461213 (contains!4161 (toList!4411 lt!375071) lt!374888))))

(assert (= (and d!105393 res!564085) b!827896))

(assert (= (and b!827896 res!564086) b!827897))

(declare-fun m!771377 () Bool)

(assert (=> d!105393 m!771377))

(declare-fun m!771379 () Bool)

(assert (=> d!105393 m!771379))

(declare-fun m!771381 () Bool)

(assert (=> d!105393 m!771381))

(declare-fun m!771383 () Bool)

(assert (=> d!105393 m!771383))

(declare-fun m!771385 () Bool)

(assert (=> b!827896 m!771385))

(declare-fun m!771387 () Bool)

(assert (=> b!827897 m!771387))

(assert (=> b!827745 d!105393))

(declare-fun d!105395 () Bool)

(declare-fun e!461214 () Bool)

(assert (=> d!105395 e!461214))

(declare-fun res!564087 () Bool)

(assert (=> d!105395 (=> (not res!564087) (not e!461214))))

(declare-fun lt!375075 () ListLongMap!8791)

(assert (=> d!105395 (= res!564087 (contains!4160 lt!375075 (_1!4994 lt!374883)))))

(declare-fun lt!375073 () List!15742)

(assert (=> d!105395 (= lt!375075 (ListLongMap!8792 lt!375073))))

(declare-fun lt!375074 () Unit!28374)

(declare-fun lt!375076 () Unit!28374)

(assert (=> d!105395 (= lt!375074 lt!375076)))

(assert (=> d!105395 (= (getValueByKey!408 lt!375073 (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883)))))

(assert (=> d!105395 (= lt!375076 (lemmaContainsTupThenGetReturnValue!222 lt!375073 (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105395 (= lt!375073 (insertStrictlySorted!261 (toList!4411 (+!1956 lt!374890 lt!374881)) (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105395 (= (+!1956 (+!1956 lt!374890 lt!374881) lt!374883) lt!375075)))

(declare-fun b!827898 () Bool)

(declare-fun res!564088 () Bool)

(assert (=> b!827898 (=> (not res!564088) (not e!461214))))

(assert (=> b!827898 (= res!564088 (= (getValueByKey!408 (toList!4411 lt!375075) (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883))))))

(declare-fun b!827899 () Bool)

(assert (=> b!827899 (= e!461214 (contains!4161 (toList!4411 lt!375075) lt!374883))))

(assert (= (and d!105395 res!564087) b!827898))

(assert (= (and b!827898 res!564088) b!827899))

(declare-fun m!771389 () Bool)

(assert (=> d!105395 m!771389))

(declare-fun m!771391 () Bool)

(assert (=> d!105395 m!771391))

(declare-fun m!771393 () Bool)

(assert (=> d!105395 m!771393))

(declare-fun m!771395 () Bool)

(assert (=> d!105395 m!771395))

(declare-fun m!771397 () Bool)

(assert (=> b!827898 m!771397))

(declare-fun m!771399 () Bool)

(assert (=> b!827899 m!771399))

(assert (=> b!827745 d!105395))

(declare-fun d!105397 () Bool)

(declare-fun e!461215 () Bool)

(assert (=> d!105397 e!461215))

(declare-fun res!564089 () Bool)

(assert (=> d!105397 (=> (not res!564089) (not e!461215))))

(declare-fun lt!375079 () ListLongMap!8791)

(assert (=> d!105397 (= res!564089 (contains!4160 lt!375079 (_1!4994 lt!374888)))))

(declare-fun lt!375077 () List!15742)

(assert (=> d!105397 (= lt!375079 (ListLongMap!8792 lt!375077))))

(declare-fun lt!375078 () Unit!28374)

(declare-fun lt!375080 () Unit!28374)

(assert (=> d!105397 (= lt!375078 lt!375080)))

(assert (=> d!105397 (= (getValueByKey!408 lt!375077 (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888)))))

(assert (=> d!105397 (= lt!375080 (lemmaContainsTupThenGetReturnValue!222 lt!375077 (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105397 (= lt!375077 (insertStrictlySorted!261 (toList!4411 lt!374890) (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105397 (= (+!1956 lt!374890 lt!374888) lt!375079)))

(declare-fun b!827900 () Bool)

(declare-fun res!564090 () Bool)

(assert (=> b!827900 (=> (not res!564090) (not e!461215))))

(assert (=> b!827900 (= res!564090 (= (getValueByKey!408 (toList!4411 lt!375079) (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888))))))

(declare-fun b!827901 () Bool)

(assert (=> b!827901 (= e!461215 (contains!4161 (toList!4411 lt!375079) lt!374888))))

(assert (= (and d!105397 res!564089) b!827900))

(assert (= (and b!827900 res!564090) b!827901))

(declare-fun m!771401 () Bool)

(assert (=> d!105397 m!771401))

(declare-fun m!771403 () Bool)

(assert (=> d!105397 m!771403))

(declare-fun m!771405 () Bool)

(assert (=> d!105397 m!771405))

(declare-fun m!771407 () Bool)

(assert (=> d!105397 m!771407))

(declare-fun m!771409 () Bool)

(assert (=> b!827900 m!771409))

(declare-fun m!771411 () Bool)

(assert (=> b!827901 m!771411))

(assert (=> b!827745 d!105397))

(declare-fun b!827902 () Bool)

(declare-fun e!461228 () Bool)

(assert (=> b!827902 (= e!461228 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35972 () Bool)

(declare-fun call!35978 () ListLongMap!8791)

(declare-fun call!35979 () ListLongMap!8791)

(assert (=> bm!35972 (= call!35978 call!35979)))

(declare-fun b!827903 () Bool)

(declare-fun e!461226 () Bool)

(declare-fun call!35980 () Bool)

(assert (=> b!827903 (= e!461226 (not call!35980))))

(declare-fun bm!35973 () Bool)

(declare-fun call!35981 () ListLongMap!8791)

(assert (=> bm!35973 (= call!35981 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827904 () Bool)

(declare-fun res!564096 () Bool)

(declare-fun e!461217 () Bool)

(assert (=> b!827904 (=> (not res!564096) (not e!461217))))

(declare-fun e!461220 () Bool)

(assert (=> b!827904 (= res!564096 e!461220)))

(declare-fun res!564094 () Bool)

(assert (=> b!827904 (=> res!564094 e!461220)))

(assert (=> b!827904 (= res!564094 (not e!461228))))

(declare-fun res!564097 () Bool)

(assert (=> b!827904 (=> (not res!564097) (not e!461228))))

(assert (=> b!827904 (= res!564097 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827905 () Bool)

(declare-fun e!461222 () Bool)

(declare-fun call!35977 () Bool)

(assert (=> b!827905 (= e!461222 (not call!35977))))

(declare-fun bm!35974 () Bool)

(declare-fun lt!375086 () ListLongMap!8791)

(assert (=> bm!35974 (= call!35980 (contains!4160 lt!375086 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827906 () Bool)

(declare-fun res!564091 () Bool)

(assert (=> b!827906 (=> (not res!564091) (not e!461217))))

(assert (=> b!827906 (= res!564091 e!461222)))

(declare-fun c!89773 () Bool)

(assert (=> b!827906 (= c!89773 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827907 () Bool)

(declare-fun e!461224 () Bool)

(assert (=> b!827907 (= e!461224 (= (apply!363 lt!375086 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun d!105399 () Bool)

(assert (=> d!105399 e!461217))

(declare-fun res!564092 () Bool)

(assert (=> d!105399 (=> (not res!564092) (not e!461217))))

(assert (=> d!105399 (= res!564092 (or (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))))

(declare-fun lt!375090 () ListLongMap!8791)

(assert (=> d!105399 (= lt!375086 lt!375090)))

(declare-fun lt!375093 () Unit!28374)

(declare-fun e!461218 () Unit!28374)

(assert (=> d!105399 (= lt!375093 e!461218)))

(declare-fun c!89775 () Bool)

(declare-fun e!461227 () Bool)

(assert (=> d!105399 (= c!89775 e!461227)))

(declare-fun res!564099 () Bool)

(assert (=> d!105399 (=> (not res!564099) (not e!461227))))

(assert (=> d!105399 (= res!564099 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun e!461223 () ListLongMap!8791)

(assert (=> d!105399 (= lt!375090 e!461223)))

(declare-fun c!89776 () Bool)

(assert (=> d!105399 (= c!89776 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105399 (validMask!0 mask!1312)))

(assert (=> d!105399 (= (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375086)))

(declare-fun bm!35975 () Bool)

(declare-fun call!35975 () ListLongMap!8791)

(declare-fun call!35976 () ListLongMap!8791)

(assert (=> bm!35975 (= call!35975 call!35976)))

(declare-fun b!827908 () Bool)

(assert (=> b!827908 (= e!461226 e!461224)))

(declare-fun res!564098 () Bool)

(assert (=> b!827908 (= res!564098 call!35980)))

(assert (=> b!827908 (=> (not res!564098) (not e!461224))))

(declare-fun b!827909 () Bool)

(declare-fun e!461219 () ListLongMap!8791)

(assert (=> b!827909 (= e!461219 call!35978)))

(declare-fun b!827910 () Bool)

(declare-fun Unit!28379 () Unit!28374)

(assert (=> b!827910 (= e!461218 Unit!28379)))

(declare-fun bm!35976 () Bool)

(assert (=> bm!35976 (= call!35979 call!35981)))

(declare-fun e!461225 () Bool)

(declare-fun b!827911 () Bool)

(assert (=> b!827911 (= e!461225 (= (apply!363 lt!375086 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22606 _values!788)))))

(assert (=> b!827911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827912 () Bool)

(declare-fun e!461216 () ListLongMap!8791)

(assert (=> b!827912 (= e!461216 call!35975)))

(declare-fun b!827913 () Bool)

(declare-fun e!461221 () Bool)

(assert (=> b!827913 (= e!461221 (= (apply!363 lt!375086 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!827914 () Bool)

(assert (=> b!827914 (= e!461219 call!35975)))

(declare-fun b!827915 () Bool)

(declare-fun lt!375095 () Unit!28374)

(assert (=> b!827915 (= e!461218 lt!375095)))

(declare-fun lt!375092 () ListLongMap!8791)

(assert (=> b!827915 (= lt!375092 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375091 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375100 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375100 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375094 () Unit!28374)

(assert (=> b!827915 (= lt!375094 (addStillContains!315 lt!375092 lt!375091 zeroValueBefore!34 lt!375100))))

(assert (=> b!827915 (contains!4160 (+!1956 lt!375092 (tuple2!9967 lt!375091 zeroValueBefore!34)) lt!375100)))

(declare-fun lt!375085 () Unit!28374)

(assert (=> b!827915 (= lt!375085 lt!375094)))

(declare-fun lt!375097 () ListLongMap!8791)

(assert (=> b!827915 (= lt!375097 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375089 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375089 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375081 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375081 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375082 () Unit!28374)

(assert (=> b!827915 (= lt!375082 (addApplyDifferent!315 lt!375097 lt!375089 minValue!754 lt!375081))))

(assert (=> b!827915 (= (apply!363 (+!1956 lt!375097 (tuple2!9967 lt!375089 minValue!754)) lt!375081) (apply!363 lt!375097 lt!375081))))

(declare-fun lt!375098 () Unit!28374)

(assert (=> b!827915 (= lt!375098 lt!375082)))

(declare-fun lt!375099 () ListLongMap!8791)

(assert (=> b!827915 (= lt!375099 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375096 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375101 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375101 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375088 () Unit!28374)

(assert (=> b!827915 (= lt!375088 (addApplyDifferent!315 lt!375099 lt!375096 zeroValueBefore!34 lt!375101))))

(assert (=> b!827915 (= (apply!363 (+!1956 lt!375099 (tuple2!9967 lt!375096 zeroValueBefore!34)) lt!375101) (apply!363 lt!375099 lt!375101))))

(declare-fun lt!375087 () Unit!28374)

(assert (=> b!827915 (= lt!375087 lt!375088)))

(declare-fun lt!375083 () ListLongMap!8791)

(assert (=> b!827915 (= lt!375083 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375084 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375084 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375102 () (_ BitVec 64))

(assert (=> b!827915 (= lt!375102 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827915 (= lt!375095 (addApplyDifferent!315 lt!375083 lt!375084 minValue!754 lt!375102))))

(assert (=> b!827915 (= (apply!363 (+!1956 lt!375083 (tuple2!9967 lt!375084 minValue!754)) lt!375102) (apply!363 lt!375083 lt!375102))))

(declare-fun b!827916 () Bool)

(assert (=> b!827916 (= e!461223 (+!1956 call!35976 (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35977 () Bool)

(assert (=> bm!35977 (= call!35977 (contains!4160 lt!375086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35978 () Bool)

(declare-fun c!89774 () Bool)

(assert (=> bm!35978 (= call!35976 (+!1956 (ite c!89776 call!35981 (ite c!89774 call!35979 call!35978)) (ite (or c!89776 c!89774) (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827917 () Bool)

(assert (=> b!827917 (= e!461227 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827918 () Bool)

(assert (=> b!827918 (= e!461223 e!461216)))

(assert (=> b!827918 (= c!89774 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!827919 () Bool)

(assert (=> b!827919 (= e!461222 e!461221)))

(declare-fun res!564093 () Bool)

(assert (=> b!827919 (= res!564093 call!35977)))

(assert (=> b!827919 (=> (not res!564093) (not e!461221))))

(declare-fun b!827920 () Bool)

(assert (=> b!827920 (= e!461220 e!461225)))

(declare-fun res!564095 () Bool)

(assert (=> b!827920 (=> (not res!564095) (not e!461225))))

(assert (=> b!827920 (= res!564095 (contains!4160 lt!375086 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827920 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827921 () Bool)

(declare-fun c!89777 () Bool)

(assert (=> b!827921 (= c!89777 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827921 (= e!461216 e!461219)))

(declare-fun b!827922 () Bool)

(assert (=> b!827922 (= e!461217 e!461226)))

(declare-fun c!89772 () Bool)

(assert (=> b!827922 (= c!89772 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!105399 c!89776) b!827916))

(assert (= (and d!105399 (not c!89776)) b!827918))

(assert (= (and b!827918 c!89774) b!827912))

(assert (= (and b!827918 (not c!89774)) b!827921))

(assert (= (and b!827921 c!89777) b!827914))

(assert (= (and b!827921 (not c!89777)) b!827909))

(assert (= (or b!827914 b!827909) bm!35972))

(assert (= (or b!827912 bm!35972) bm!35976))

(assert (= (or b!827912 b!827914) bm!35975))

(assert (= (or b!827916 bm!35976) bm!35973))

(assert (= (or b!827916 bm!35975) bm!35978))

(assert (= (and d!105399 res!564099) b!827917))

(assert (= (and d!105399 c!89775) b!827915))

(assert (= (and d!105399 (not c!89775)) b!827910))

(assert (= (and d!105399 res!564092) b!827904))

(assert (= (and b!827904 res!564097) b!827902))

(assert (= (and b!827904 (not res!564094)) b!827920))

(assert (= (and b!827920 res!564095) b!827911))

(assert (= (and b!827904 res!564096) b!827906))

(assert (= (and b!827906 c!89773) b!827919))

(assert (= (and b!827906 (not c!89773)) b!827905))

(assert (= (and b!827919 res!564093) b!827913))

(assert (= (or b!827919 b!827905) bm!35977))

(assert (= (and b!827906 res!564091) b!827922))

(assert (= (and b!827922 c!89772) b!827908))

(assert (= (and b!827922 (not c!89772)) b!827903))

(assert (= (and b!827908 res!564098) b!827907))

(assert (= (or b!827908 b!827903) bm!35974))

(declare-fun b_lambda!11155 () Bool)

(assert (=> (not b_lambda!11155) (not b!827911)))

(assert (=> b!827911 t!22086))

(declare-fun b_and!22289 () Bool)

(assert (= b_and!22287 (and (=> t!22086 result!7953) b_and!22289)))

(declare-fun m!771413 () Bool)

(assert (=> b!827916 m!771413))

(assert (=> b!827902 m!771291))

(assert (=> b!827902 m!771291))

(assert (=> b!827902 m!771293))

(assert (=> b!827920 m!771291))

(assert (=> b!827920 m!771291))

(declare-fun m!771415 () Bool)

(assert (=> b!827920 m!771415))

(assert (=> d!105399 m!771109))

(assert (=> b!827911 m!771297))

(assert (=> b!827911 m!771297))

(assert (=> b!827911 m!771299))

(assert (=> b!827911 m!771301))

(assert (=> b!827911 m!771291))

(assert (=> b!827911 m!771291))

(declare-fun m!771417 () Bool)

(assert (=> b!827911 m!771417))

(assert (=> b!827911 m!771299))

(assert (=> bm!35973 m!771143))

(declare-fun m!771419 () Bool)

(assert (=> bm!35978 m!771419))

(declare-fun m!771421 () Bool)

(assert (=> bm!35977 m!771421))

(declare-fun m!771423 () Bool)

(assert (=> bm!35974 m!771423))

(assert (=> b!827917 m!771291))

(assert (=> b!827917 m!771291))

(assert (=> b!827917 m!771293))

(declare-fun m!771425 () Bool)

(assert (=> b!827913 m!771425))

(declare-fun m!771427 () Bool)

(assert (=> b!827915 m!771427))

(declare-fun m!771429 () Bool)

(assert (=> b!827915 m!771429))

(declare-fun m!771431 () Bool)

(assert (=> b!827915 m!771431))

(declare-fun m!771433 () Bool)

(assert (=> b!827915 m!771433))

(declare-fun m!771435 () Bool)

(assert (=> b!827915 m!771435))

(declare-fun m!771437 () Bool)

(assert (=> b!827915 m!771437))

(assert (=> b!827915 m!771143))

(assert (=> b!827915 m!771427))

(declare-fun m!771439 () Bool)

(assert (=> b!827915 m!771439))

(declare-fun m!771441 () Bool)

(assert (=> b!827915 m!771441))

(declare-fun m!771443 () Bool)

(assert (=> b!827915 m!771443))

(assert (=> b!827915 m!771291))

(declare-fun m!771445 () Bool)

(assert (=> b!827915 m!771445))

(declare-fun m!771447 () Bool)

(assert (=> b!827915 m!771447))

(declare-fun m!771449 () Bool)

(assert (=> b!827915 m!771449))

(assert (=> b!827915 m!771429))

(declare-fun m!771451 () Bool)

(assert (=> b!827915 m!771451))

(assert (=> b!827915 m!771441))

(declare-fun m!771453 () Bool)

(assert (=> b!827915 m!771453))

(declare-fun m!771455 () Bool)

(assert (=> b!827915 m!771455))

(assert (=> b!827915 m!771435))

(declare-fun m!771457 () Bool)

(assert (=> b!827907 m!771457))

(assert (=> b!827745 d!105399))

(declare-fun d!105401 () Bool)

(assert (=> d!105401 (= (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375105 () Unit!28374)

(declare-fun choose!1414 (array!46289 array!46291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 V!25075 V!25075 (_ BitVec 32) Int) Unit!28374)

(assert (=> d!105401 (= lt!375105 (choose!1414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105401 (validMask!0 mask!1312)))

(assert (=> d!105401 (= (lemmaNoChangeToArrayThenSameMapNoExtras!577 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375105)))

(declare-fun bs!23115 () Bool)

(assert (= bs!23115 d!105401))

(assert (=> bs!23115 m!771143))

(assert (=> bs!23115 m!771141))

(declare-fun m!771459 () Bool)

(assert (=> bs!23115 m!771459))

(assert (=> bs!23115 m!771109))

(assert (=> b!827749 d!105401))

(declare-fun b!827947 () Bool)

(declare-fun e!461245 () ListLongMap!8791)

(assert (=> b!827947 (= e!461245 (ListLongMap!8792 Nil!15739))))

(declare-fun b!827948 () Bool)

(declare-fun e!461247 () ListLongMap!8791)

(declare-fun call!35984 () ListLongMap!8791)

(assert (=> b!827948 (= e!461247 call!35984)))

(declare-fun b!827949 () Bool)

(declare-fun e!461248 () Bool)

(declare-fun lt!375121 () ListLongMap!8791)

(assert (=> b!827949 (= e!461248 (= lt!375121 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827950 () Bool)

(declare-fun e!461249 () Bool)

(declare-fun e!461243 () Bool)

(assert (=> b!827950 (= e!461249 e!461243)))

(assert (=> b!827950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun res!564108 () Bool)

(assert (=> b!827950 (= res!564108 (contains!4160 lt!375121 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827950 (=> (not res!564108) (not e!461243))))

(declare-fun b!827951 () Bool)

(declare-fun lt!375120 () Unit!28374)

(declare-fun lt!375125 () Unit!28374)

(assert (=> b!827951 (= lt!375120 lt!375125)))

(declare-fun lt!375122 () V!25075)

(declare-fun lt!375126 () (_ BitVec 64))

(declare-fun lt!375124 () (_ BitVec 64))

(declare-fun lt!375123 () ListLongMap!8791)

(assert (=> b!827951 (not (contains!4160 (+!1956 lt!375123 (tuple2!9967 lt!375124 lt!375122)) lt!375126))))

(declare-fun addStillNotContains!190 (ListLongMap!8791 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28374)

(assert (=> b!827951 (= lt!375125 (addStillNotContains!190 lt!375123 lt!375124 lt!375122 lt!375126))))

(assert (=> b!827951 (= lt!375126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827951 (= lt!375122 (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827951 (= lt!375124 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827951 (= lt!375123 call!35984)))

(assert (=> b!827951 (= e!461247 (+!1956 call!35984 (tuple2!9967 (select (arr!22185 _keys!976) #b00000000000000000000000000000000) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827953 () Bool)

(assert (=> b!827953 (= e!461245 e!461247)))

(declare-fun c!89788 () Bool)

(assert (=> b!827953 (= c!89788 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827954 () Bool)

(declare-fun e!461246 () Bool)

(assert (=> b!827954 (= e!461246 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827954 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827955 () Bool)

(declare-fun isEmpty!651 (ListLongMap!8791) Bool)

(assert (=> b!827955 (= e!461248 (isEmpty!651 lt!375121))))

(declare-fun b!827956 () Bool)

(assert (=> b!827956 (= e!461249 e!461248)))

(declare-fun c!89787 () Bool)

(assert (=> b!827956 (= c!89787 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827957 () Bool)

(assert (=> b!827957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> b!827957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22606 _values!788)))))

(assert (=> b!827957 (= e!461243 (= (apply!363 lt!375121 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827958 () Bool)

(declare-fun res!564111 () Bool)

(declare-fun e!461244 () Bool)

(assert (=> b!827958 (=> (not res!564111) (not e!461244))))

(assert (=> b!827958 (= res!564111 (not (contains!4160 lt!375121 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35981 () Bool)

(assert (=> bm!35981 (= call!35984 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827952 () Bool)

(assert (=> b!827952 (= e!461244 e!461249)))

(declare-fun c!89789 () Bool)

(assert (=> b!827952 (= c!89789 e!461246)))

(declare-fun res!564109 () Bool)

(assert (=> b!827952 (=> (not res!564109) (not e!461246))))

(assert (=> b!827952 (= res!564109 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun d!105403 () Bool)

(assert (=> d!105403 e!461244))

(declare-fun res!564110 () Bool)

(assert (=> d!105403 (=> (not res!564110) (not e!461244))))

(assert (=> d!105403 (= res!564110 (not (contains!4160 lt!375121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105403 (= lt!375121 e!461245)))

(declare-fun c!89786 () Bool)

(assert (=> d!105403 (= c!89786 (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> d!105403 (validMask!0 mask!1312)))

(assert (=> d!105403 (= (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375121)))

(assert (= (and d!105403 c!89786) b!827947))

(assert (= (and d!105403 (not c!89786)) b!827953))

(assert (= (and b!827953 c!89788) b!827951))

(assert (= (and b!827953 (not c!89788)) b!827948))

(assert (= (or b!827951 b!827948) bm!35981))

(assert (= (and d!105403 res!564110) b!827958))

(assert (= (and b!827958 res!564111) b!827952))

(assert (= (and b!827952 res!564109) b!827954))

(assert (= (and b!827952 c!89789) b!827950))

(assert (= (and b!827952 (not c!89789)) b!827956))

(assert (= (and b!827950 res!564108) b!827957))

(assert (= (and b!827956 c!89787) b!827949))

(assert (= (and b!827956 (not c!89787)) b!827955))

(declare-fun b_lambda!11157 () Bool)

(assert (=> (not b_lambda!11157) (not b!827951)))

(assert (=> b!827951 t!22086))

(declare-fun b_and!22291 () Bool)

(assert (= b_and!22289 (and (=> t!22086 result!7953) b_and!22291)))

(declare-fun b_lambda!11159 () Bool)

(assert (=> (not b_lambda!11159) (not b!827957)))

(assert (=> b!827957 t!22086))

(declare-fun b_and!22293 () Bool)

(assert (= b_and!22291 (and (=> t!22086 result!7953) b_and!22293)))

(declare-fun m!771461 () Bool)

(assert (=> b!827949 m!771461))

(assert (=> b!827954 m!771291))

(assert (=> b!827954 m!771291))

(assert (=> b!827954 m!771293))

(declare-fun m!771463 () Bool)

(assert (=> b!827958 m!771463))

(declare-fun m!771465 () Bool)

(assert (=> d!105403 m!771465))

(assert (=> d!105403 m!771109))

(assert (=> b!827951 m!771297))

(assert (=> b!827951 m!771297))

(assert (=> b!827951 m!771299))

(assert (=> b!827951 m!771301))

(assert (=> b!827951 m!771291))

(declare-fun m!771467 () Bool)

(assert (=> b!827951 m!771467))

(declare-fun m!771469 () Bool)

(assert (=> b!827951 m!771469))

(declare-fun m!771471 () Bool)

(assert (=> b!827951 m!771471))

(assert (=> b!827951 m!771299))

(assert (=> b!827951 m!771469))

(declare-fun m!771473 () Bool)

(assert (=> b!827951 m!771473))

(assert (=> bm!35981 m!771461))

(declare-fun m!771475 () Bool)

(assert (=> b!827955 m!771475))

(assert (=> b!827953 m!771291))

(assert (=> b!827953 m!771291))

(assert (=> b!827953 m!771293))

(assert (=> b!827950 m!771291))

(assert (=> b!827950 m!771291))

(declare-fun m!771477 () Bool)

(assert (=> b!827950 m!771477))

(assert (=> b!827957 m!771297))

(assert (=> b!827957 m!771297))

(assert (=> b!827957 m!771299))

(assert (=> b!827957 m!771301))

(assert (=> b!827957 m!771291))

(assert (=> b!827957 m!771291))

(declare-fun m!771479 () Bool)

(assert (=> b!827957 m!771479))

(assert (=> b!827957 m!771299))

(assert (=> b!827749 d!105403))

(declare-fun b!827959 () Bool)

(declare-fun e!461252 () ListLongMap!8791)

(assert (=> b!827959 (= e!461252 (ListLongMap!8792 Nil!15739))))

(declare-fun b!827960 () Bool)

(declare-fun e!461254 () ListLongMap!8791)

(declare-fun call!35985 () ListLongMap!8791)

(assert (=> b!827960 (= e!461254 call!35985)))

(declare-fun lt!375128 () ListLongMap!8791)

(declare-fun b!827961 () Bool)

(declare-fun e!461255 () Bool)

(assert (=> b!827961 (= e!461255 (= lt!375128 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827962 () Bool)

(declare-fun e!461256 () Bool)

(declare-fun e!461250 () Bool)

(assert (=> b!827962 (= e!461256 e!461250)))

(assert (=> b!827962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun res!564112 () Bool)

(assert (=> b!827962 (= res!564112 (contains!4160 lt!375128 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827962 (=> (not res!564112) (not e!461250))))

(declare-fun b!827963 () Bool)

(declare-fun lt!375127 () Unit!28374)

(declare-fun lt!375132 () Unit!28374)

(assert (=> b!827963 (= lt!375127 lt!375132)))

(declare-fun lt!375131 () (_ BitVec 64))

(declare-fun lt!375129 () V!25075)

(declare-fun lt!375133 () (_ BitVec 64))

(declare-fun lt!375130 () ListLongMap!8791)

(assert (=> b!827963 (not (contains!4160 (+!1956 lt!375130 (tuple2!9967 lt!375131 lt!375129)) lt!375133))))

(assert (=> b!827963 (= lt!375132 (addStillNotContains!190 lt!375130 lt!375131 lt!375129 lt!375133))))

(assert (=> b!827963 (= lt!375133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827963 (= lt!375129 (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827963 (= lt!375131 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827963 (= lt!375130 call!35985)))

(assert (=> b!827963 (= e!461254 (+!1956 call!35985 (tuple2!9967 (select (arr!22185 _keys!976) #b00000000000000000000000000000000) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827965 () Bool)

(assert (=> b!827965 (= e!461252 e!461254)))

(declare-fun c!89792 () Bool)

(assert (=> b!827965 (= c!89792 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827966 () Bool)

(declare-fun e!461253 () Bool)

(assert (=> b!827966 (= e!461253 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827966 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827967 () Bool)

(assert (=> b!827967 (= e!461255 (isEmpty!651 lt!375128))))

(declare-fun b!827968 () Bool)

(assert (=> b!827968 (= e!461256 e!461255)))

(declare-fun c!89791 () Bool)

(assert (=> b!827968 (= c!89791 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun b!827969 () Bool)

(assert (=> b!827969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> b!827969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22606 _values!788)))))

(assert (=> b!827969 (= e!461250 (= (apply!363 lt!375128 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)) (get!11761 (select (arr!22186 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827970 () Bool)

(declare-fun res!564115 () Bool)

(declare-fun e!461251 () Bool)

(assert (=> b!827970 (=> (not res!564115) (not e!461251))))

(assert (=> b!827970 (= res!564115 (not (contains!4160 lt!375128 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35982 () Bool)

(assert (=> bm!35982 (= call!35985 (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827964 () Bool)

(assert (=> b!827964 (= e!461251 e!461256)))

(declare-fun c!89793 () Bool)

(assert (=> b!827964 (= c!89793 e!461253)))

(declare-fun res!564113 () Bool)

(assert (=> b!827964 (=> (not res!564113) (not e!461253))))

(assert (=> b!827964 (= res!564113 (bvslt #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(declare-fun d!105405 () Bool)

(assert (=> d!105405 e!461251))

(declare-fun res!564114 () Bool)

(assert (=> d!105405 (=> (not res!564114) (not e!461251))))

(assert (=> d!105405 (= res!564114 (not (contains!4160 lt!375128 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105405 (= lt!375128 e!461252)))

(declare-fun c!89790 () Bool)

(assert (=> d!105405 (= c!89790 (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> d!105405 (validMask!0 mask!1312)))

(assert (=> d!105405 (= (getCurrentListMapNoExtraKeys!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375128)))

(assert (= (and d!105405 c!89790) b!827959))

(assert (= (and d!105405 (not c!89790)) b!827965))

(assert (= (and b!827965 c!89792) b!827963))

(assert (= (and b!827965 (not c!89792)) b!827960))

(assert (= (or b!827963 b!827960) bm!35982))

(assert (= (and d!105405 res!564114) b!827970))

(assert (= (and b!827970 res!564115) b!827964))

(assert (= (and b!827964 res!564113) b!827966))

(assert (= (and b!827964 c!89793) b!827962))

(assert (= (and b!827964 (not c!89793)) b!827968))

(assert (= (and b!827962 res!564112) b!827969))

(assert (= (and b!827968 c!89791) b!827961))

(assert (= (and b!827968 (not c!89791)) b!827967))

(declare-fun b_lambda!11161 () Bool)

(assert (=> (not b_lambda!11161) (not b!827963)))

(assert (=> b!827963 t!22086))

(declare-fun b_and!22295 () Bool)

(assert (= b_and!22293 (and (=> t!22086 result!7953) b_and!22295)))

(declare-fun b_lambda!11163 () Bool)

(assert (=> (not b_lambda!11163) (not b!827969)))

(assert (=> b!827969 t!22086))

(declare-fun b_and!22297 () Bool)

(assert (= b_and!22295 (and (=> t!22086 result!7953) b_and!22297)))

(declare-fun m!771481 () Bool)

(assert (=> b!827961 m!771481))

(assert (=> b!827966 m!771291))

(assert (=> b!827966 m!771291))

(assert (=> b!827966 m!771293))

(declare-fun m!771483 () Bool)

(assert (=> b!827970 m!771483))

(declare-fun m!771485 () Bool)

(assert (=> d!105405 m!771485))

(assert (=> d!105405 m!771109))

(assert (=> b!827963 m!771297))

(assert (=> b!827963 m!771297))

(assert (=> b!827963 m!771299))

(assert (=> b!827963 m!771301))

(assert (=> b!827963 m!771291))

(declare-fun m!771487 () Bool)

(assert (=> b!827963 m!771487))

(declare-fun m!771489 () Bool)

(assert (=> b!827963 m!771489))

(declare-fun m!771491 () Bool)

(assert (=> b!827963 m!771491))

(assert (=> b!827963 m!771299))

(assert (=> b!827963 m!771489))

(declare-fun m!771493 () Bool)

(assert (=> b!827963 m!771493))

(assert (=> bm!35982 m!771481))

(declare-fun m!771495 () Bool)

(assert (=> b!827967 m!771495))

(assert (=> b!827965 m!771291))

(assert (=> b!827965 m!771291))

(assert (=> b!827965 m!771293))

(assert (=> b!827962 m!771291))

(assert (=> b!827962 m!771291))

(declare-fun m!771497 () Bool)

(assert (=> b!827962 m!771497))

(assert (=> b!827969 m!771297))

(assert (=> b!827969 m!771297))

(assert (=> b!827969 m!771299))

(assert (=> b!827969 m!771301))

(assert (=> b!827969 m!771291))

(assert (=> b!827969 m!771291))

(declare-fun m!771499 () Bool)

(assert (=> b!827969 m!771499))

(assert (=> b!827969 m!771299))

(assert (=> b!827749 d!105405))

(declare-fun b!827981 () Bool)

(declare-fun e!461267 () Bool)

(declare-fun e!461266 () Bool)

(assert (=> b!827981 (= e!461267 e!461266)))

(declare-fun c!89796 () Bool)

(assert (=> b!827981 (= c!89796 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827982 () Bool)

(declare-fun call!35988 () Bool)

(assert (=> b!827982 (= e!461266 call!35988)))

(declare-fun b!827983 () Bool)

(declare-fun e!461265 () Bool)

(assert (=> b!827983 (= e!461265 e!461267)))

(declare-fun res!564123 () Bool)

(assert (=> b!827983 (=> (not res!564123) (not e!461267))))

(declare-fun e!461268 () Bool)

(assert (=> b!827983 (= res!564123 (not e!461268))))

(declare-fun res!564122 () Bool)

(assert (=> b!827983 (=> (not res!564122) (not e!461268))))

(assert (=> b!827983 (= res!564122 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105407 () Bool)

(declare-fun res!564124 () Bool)

(assert (=> d!105407 (=> res!564124 e!461265)))

(assert (=> d!105407 (= res!564124 (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> d!105407 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15738) e!461265)))

(declare-fun b!827984 () Bool)

(assert (=> b!827984 (= e!461266 call!35988)))

(declare-fun bm!35985 () Bool)

(assert (=> bm!35985 (= call!35988 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89796 (Cons!15737 (select (arr!22185 _keys!976) #b00000000000000000000000000000000) Nil!15738) Nil!15738)))))

(declare-fun b!827985 () Bool)

(declare-fun contains!4162 (List!15741 (_ BitVec 64)) Bool)

(assert (=> b!827985 (= e!461268 (contains!4162 Nil!15738 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105407 (not res!564124)) b!827983))

(assert (= (and b!827983 res!564122) b!827985))

(assert (= (and b!827983 res!564123) b!827981))

(assert (= (and b!827981 c!89796) b!827982))

(assert (= (and b!827981 (not c!89796)) b!827984))

(assert (= (or b!827982 b!827984) bm!35985))

(assert (=> b!827981 m!771291))

(assert (=> b!827981 m!771291))

(assert (=> b!827981 m!771293))

(assert (=> b!827983 m!771291))

(assert (=> b!827983 m!771291))

(assert (=> b!827983 m!771293))

(assert (=> bm!35985 m!771291))

(declare-fun m!771501 () Bool)

(assert (=> bm!35985 m!771501))

(assert (=> b!827985 m!771291))

(assert (=> b!827985 m!771291))

(declare-fun m!771503 () Bool)

(assert (=> b!827985 m!771503))

(assert (=> b!827740 d!105407))

(declare-fun d!105409 () Bool)

(assert (=> d!105409 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71344 d!105409))

(declare-fun d!105411 () Bool)

(assert (=> d!105411 (= (array_inv!17723 _keys!976) (bvsge (size!22605 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71344 d!105411))

(declare-fun d!105413 () Bool)

(assert (=> d!105413 (= (array_inv!17724 _values!788) (bvsge (size!22606 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71344 d!105413))

(declare-fun d!105415 () Bool)

(declare-fun e!461269 () Bool)

(assert (=> d!105415 e!461269))

(declare-fun res!564125 () Bool)

(assert (=> d!105415 (=> (not res!564125) (not e!461269))))

(declare-fun lt!375136 () ListLongMap!8791)

(assert (=> d!105415 (= res!564125 (contains!4160 lt!375136 (_1!4994 lt!374883)))))

(declare-fun lt!375134 () List!15742)

(assert (=> d!105415 (= lt!375136 (ListLongMap!8792 lt!375134))))

(declare-fun lt!375135 () Unit!28374)

(declare-fun lt!375137 () Unit!28374)

(assert (=> d!105415 (= lt!375135 lt!375137)))

(assert (=> d!105415 (= (getValueByKey!408 lt!375134 (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883)))))

(assert (=> d!105415 (= lt!375137 (lemmaContainsTupThenGetReturnValue!222 lt!375134 (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105415 (= lt!375134 (insertStrictlySorted!261 (toList!4411 (+!1956 lt!374884 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105415 (= (+!1956 (+!1956 lt!374884 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374883) lt!375136)))

(declare-fun b!827986 () Bool)

(declare-fun res!564126 () Bool)

(assert (=> b!827986 (=> (not res!564126) (not e!461269))))

(assert (=> b!827986 (= res!564126 (= (getValueByKey!408 (toList!4411 lt!375136) (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883))))))

(declare-fun b!827987 () Bool)

(assert (=> b!827987 (= e!461269 (contains!4161 (toList!4411 lt!375136) lt!374883))))

(assert (= (and d!105415 res!564125) b!827986))

(assert (= (and b!827986 res!564126) b!827987))

(declare-fun m!771505 () Bool)

(assert (=> d!105415 m!771505))

(declare-fun m!771507 () Bool)

(assert (=> d!105415 m!771507))

(declare-fun m!771509 () Bool)

(assert (=> d!105415 m!771509))

(declare-fun m!771511 () Bool)

(assert (=> d!105415 m!771511))

(declare-fun m!771513 () Bool)

(assert (=> b!827986 m!771513))

(declare-fun m!771515 () Bool)

(assert (=> b!827987 m!771515))

(assert (=> b!827744 d!105415))

(declare-fun d!105417 () Bool)

(declare-fun e!461270 () Bool)

(assert (=> d!105417 e!461270))

(declare-fun res!564127 () Bool)

(assert (=> d!105417 (=> (not res!564127) (not e!461270))))

(declare-fun lt!375140 () ListLongMap!8791)

(assert (=> d!105417 (= res!564127 (contains!4160 lt!375140 (_1!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375138 () List!15742)

(assert (=> d!105417 (= lt!375140 (ListLongMap!8792 lt!375138))))

(declare-fun lt!375139 () Unit!28374)

(declare-fun lt!375141 () Unit!28374)

(assert (=> d!105417 (= lt!375139 lt!375141)))

(assert (=> d!105417 (= (getValueByKey!408 lt!375138 (_1!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105417 (= lt!375141 (lemmaContainsTupThenGetReturnValue!222 lt!375138 (_1!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105417 (= lt!375138 (insertStrictlySorted!261 (toList!4411 lt!374884) (_1!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105417 (= (+!1956 lt!374884 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375140)))

(declare-fun b!827988 () Bool)

(declare-fun res!564128 () Bool)

(assert (=> b!827988 (=> (not res!564128) (not e!461270))))

(assert (=> b!827988 (= res!564128 (= (getValueByKey!408 (toList!4411 lt!375140) (_1!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!413 (_2!4994 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!827989 () Bool)

(assert (=> b!827989 (= e!461270 (contains!4161 (toList!4411 lt!375140) (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105417 res!564127) b!827988))

(assert (= (and b!827988 res!564128) b!827989))

(declare-fun m!771517 () Bool)

(assert (=> d!105417 m!771517))

(declare-fun m!771519 () Bool)

(assert (=> d!105417 m!771519))

(declare-fun m!771521 () Bool)

(assert (=> d!105417 m!771521))

(declare-fun m!771523 () Bool)

(assert (=> d!105417 m!771523))

(declare-fun m!771525 () Bool)

(assert (=> b!827988 m!771525))

(declare-fun m!771527 () Bool)

(assert (=> b!827989 m!771527))

(assert (=> b!827744 d!105417))

(declare-fun b!827998 () Bool)

(declare-fun e!461278 () Bool)

(declare-fun e!461277 () Bool)

(assert (=> b!827998 (= e!461278 e!461277)))

(declare-fun lt!375149 () (_ BitVec 64))

(assert (=> b!827998 (= lt!375149 (select (arr!22185 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375150 () Unit!28374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46289 (_ BitVec 64) (_ BitVec 32)) Unit!28374)

(assert (=> b!827998 (= lt!375150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375149 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!827998 (arrayContainsKey!0 _keys!976 lt!375149 #b00000000000000000000000000000000)))

(declare-fun lt!375148 () Unit!28374)

(assert (=> b!827998 (= lt!375148 lt!375150)))

(declare-fun res!564133 () Bool)

(declare-datatypes ((SeekEntryResult!8686 0))(
  ( (MissingZero!8686 (index!37115 (_ BitVec 32))) (Found!8686 (index!37116 (_ BitVec 32))) (Intermediate!8686 (undefined!9498 Bool) (index!37117 (_ BitVec 32)) (x!69766 (_ BitVec 32))) (Undefined!8686) (MissingVacant!8686 (index!37118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46289 (_ BitVec 32)) SeekEntryResult!8686)

(assert (=> b!827998 (= res!564133 (= (seekEntryOrOpen!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8686 #b00000000000000000000000000000000)))))

(assert (=> b!827998 (=> (not res!564133) (not e!461277))))

(declare-fun bm!35988 () Bool)

(declare-fun call!35991 () Bool)

(assert (=> bm!35988 (= call!35991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828000 () Bool)

(assert (=> b!828000 (= e!461277 call!35991)))

(declare-fun b!828001 () Bool)

(assert (=> b!828001 (= e!461278 call!35991)))

(declare-fun d!105419 () Bool)

(declare-fun res!564134 () Bool)

(declare-fun e!461279 () Bool)

(assert (=> d!105419 (=> res!564134 e!461279)))

(assert (=> d!105419 (= res!564134 (bvsge #b00000000000000000000000000000000 (size!22605 _keys!976)))))

(assert (=> d!105419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461279)))

(declare-fun b!827999 () Bool)

(assert (=> b!827999 (= e!461279 e!461278)))

(declare-fun c!89799 () Bool)

(assert (=> b!827999 (= c!89799 (validKeyInArray!0 (select (arr!22185 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105419 (not res!564134)) b!827999))

(assert (= (and b!827999 c!89799) b!827998))

(assert (= (and b!827999 (not c!89799)) b!828001))

(assert (= (and b!827998 res!564133) b!828000))

(assert (= (or b!828000 b!828001) bm!35988))

(assert (=> b!827998 m!771291))

(declare-fun m!771529 () Bool)

(assert (=> b!827998 m!771529))

(declare-fun m!771531 () Bool)

(assert (=> b!827998 m!771531))

(assert (=> b!827998 m!771291))

(declare-fun m!771533 () Bool)

(assert (=> b!827998 m!771533))

(declare-fun m!771535 () Bool)

(assert (=> bm!35988 m!771535))

(assert (=> b!827999 m!771291))

(assert (=> b!827999 m!771291))

(assert (=> b!827999 m!771293))

(assert (=> b!827746 d!105419))

(declare-fun d!105421 () Bool)

(declare-fun e!461280 () Bool)

(assert (=> d!105421 e!461280))

(declare-fun res!564135 () Bool)

(assert (=> d!105421 (=> (not res!564135) (not e!461280))))

(declare-fun lt!375153 () ListLongMap!8791)

(assert (=> d!105421 (= res!564135 (contains!4160 lt!375153 (_1!4994 lt!374888)))))

(declare-fun lt!375151 () List!15742)

(assert (=> d!105421 (= lt!375153 (ListLongMap!8792 lt!375151))))

(declare-fun lt!375152 () Unit!28374)

(declare-fun lt!375154 () Unit!28374)

(assert (=> d!105421 (= lt!375152 lt!375154)))

(assert (=> d!105421 (= (getValueByKey!408 lt!375151 (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888)))))

(assert (=> d!105421 (= lt!375154 (lemmaContainsTupThenGetReturnValue!222 lt!375151 (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105421 (= lt!375151 (insertStrictlySorted!261 (toList!4411 (+!1956 lt!374884 lt!374883)) (_1!4994 lt!374888) (_2!4994 lt!374888)))))

(assert (=> d!105421 (= (+!1956 (+!1956 lt!374884 lt!374883) lt!374888) lt!375153)))

(declare-fun b!828002 () Bool)

(declare-fun res!564136 () Bool)

(assert (=> b!828002 (=> (not res!564136) (not e!461280))))

(assert (=> b!828002 (= res!564136 (= (getValueByKey!408 (toList!4411 lt!375153) (_1!4994 lt!374888)) (Some!413 (_2!4994 lt!374888))))))

(declare-fun b!828003 () Bool)

(assert (=> b!828003 (= e!461280 (contains!4161 (toList!4411 lt!375153) lt!374888))))

(assert (= (and d!105421 res!564135) b!828002))

(assert (= (and b!828002 res!564136) b!828003))

(declare-fun m!771537 () Bool)

(assert (=> d!105421 m!771537))

(declare-fun m!771539 () Bool)

(assert (=> d!105421 m!771539))

(declare-fun m!771541 () Bool)

(assert (=> d!105421 m!771541))

(declare-fun m!771543 () Bool)

(assert (=> d!105421 m!771543))

(declare-fun m!771545 () Bool)

(assert (=> b!828002 m!771545))

(declare-fun m!771547 () Bool)

(assert (=> b!828003 m!771547))

(assert (=> b!827750 d!105421))

(declare-fun d!105423 () Bool)

(declare-fun e!461281 () Bool)

(assert (=> d!105423 e!461281))

(declare-fun res!564137 () Bool)

(assert (=> d!105423 (=> (not res!564137) (not e!461281))))

(declare-fun lt!375157 () ListLongMap!8791)

(assert (=> d!105423 (= res!564137 (contains!4160 lt!375157 (_1!4994 lt!374883)))))

(declare-fun lt!375155 () List!15742)

(assert (=> d!105423 (= lt!375157 (ListLongMap!8792 lt!375155))))

(declare-fun lt!375156 () Unit!28374)

(declare-fun lt!375158 () Unit!28374)

(assert (=> d!105423 (= lt!375156 lt!375158)))

(assert (=> d!105423 (= (getValueByKey!408 lt!375155 (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883)))))

(assert (=> d!105423 (= lt!375158 (lemmaContainsTupThenGetReturnValue!222 lt!375155 (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105423 (= lt!375155 (insertStrictlySorted!261 (toList!4411 lt!374884) (_1!4994 lt!374883) (_2!4994 lt!374883)))))

(assert (=> d!105423 (= (+!1956 lt!374884 lt!374883) lt!375157)))

(declare-fun b!828004 () Bool)

(declare-fun res!564138 () Bool)

(assert (=> b!828004 (=> (not res!564138) (not e!461281))))

(assert (=> b!828004 (= res!564138 (= (getValueByKey!408 (toList!4411 lt!375157) (_1!4994 lt!374883)) (Some!413 (_2!4994 lt!374883))))))

(declare-fun b!828005 () Bool)

(assert (=> b!828005 (= e!461281 (contains!4161 (toList!4411 lt!375157) lt!374883))))

(assert (= (and d!105423 res!564137) b!828004))

(assert (= (and b!828004 res!564138) b!828005))

(declare-fun m!771549 () Bool)

(assert (=> d!105423 m!771549))

(declare-fun m!771551 () Bool)

(assert (=> d!105423 m!771551))

(declare-fun m!771553 () Bool)

(assert (=> d!105423 m!771553))

(declare-fun m!771555 () Bool)

(assert (=> d!105423 m!771555))

(declare-fun m!771557 () Bool)

(assert (=> b!828004 m!771557))

(declare-fun m!771559 () Bool)

(assert (=> b!828005 m!771559))

(assert (=> b!827750 d!105423))

(declare-fun condMapEmpty!24217 () Bool)

(declare-fun mapDefault!24217 () ValueCell!7112)

(assert (=> mapNonEmpty!24208 (= condMapEmpty!24217 (= mapRest!24208 ((as const (Array (_ BitVec 32) ValueCell!7112)) mapDefault!24217)))))

(declare-fun e!461287 () Bool)

(declare-fun mapRes!24217 () Bool)

(assert (=> mapNonEmpty!24208 (= tp!46795 (and e!461287 mapRes!24217))))

(declare-fun b!828013 () Bool)

(assert (=> b!828013 (= e!461287 tp_is_empty!15055)))

(declare-fun b!828012 () Bool)

(declare-fun e!461286 () Bool)

(assert (=> b!828012 (= e!461286 tp_is_empty!15055)))

(declare-fun mapIsEmpty!24217 () Bool)

(assert (=> mapIsEmpty!24217 mapRes!24217))

(declare-fun mapNonEmpty!24217 () Bool)

(declare-fun tp!46810 () Bool)

(assert (=> mapNonEmpty!24217 (= mapRes!24217 (and tp!46810 e!461286))))

(declare-fun mapRest!24217 () (Array (_ BitVec 32) ValueCell!7112))

(declare-fun mapValue!24217 () ValueCell!7112)

(declare-fun mapKey!24217 () (_ BitVec 32))

(assert (=> mapNonEmpty!24217 (= mapRest!24208 (store mapRest!24217 mapKey!24217 mapValue!24217))))

(assert (= (and mapNonEmpty!24208 condMapEmpty!24217) mapIsEmpty!24217))

(assert (= (and mapNonEmpty!24208 (not condMapEmpty!24217)) mapNonEmpty!24217))

(assert (= (and mapNonEmpty!24217 ((_ is ValueCellFull!7112) mapValue!24217)) b!828012))

(assert (= (and mapNonEmpty!24208 ((_ is ValueCellFull!7112) mapDefault!24217)) b!828013))

(declare-fun m!771561 () Bool)

(assert (=> mapNonEmpty!24217 m!771561))

(declare-fun b_lambda!11165 () Bool)

(assert (= b_lambda!11163 (or (and start!71344 b_free!13345) b_lambda!11165)))

(declare-fun b_lambda!11167 () Bool)

(assert (= b_lambda!11159 (or (and start!71344 b_free!13345) b_lambda!11167)))

(declare-fun b_lambda!11169 () Bool)

(assert (= b_lambda!11155 (or (and start!71344 b_free!13345) b_lambda!11169)))

(declare-fun b_lambda!11171 () Bool)

(assert (= b_lambda!11161 (or (and start!71344 b_free!13345) b_lambda!11171)))

(declare-fun b_lambda!11173 () Bool)

(assert (= b_lambda!11157 (or (and start!71344 b_free!13345) b_lambda!11173)))

(declare-fun b_lambda!11175 () Bool)

(assert (= b_lambda!11153 (or (and start!71344 b_free!13345) b_lambda!11175)))

(check-sat (not b!827950) (not b!827880) (not d!105391) (not b!828004) (not b_lambda!11175) (not b!827895) (not b!827962) (not b!827963) (not b!827892) (not b!827965) (not d!105385) (not b!827824) (not d!105395) (not b!827915) (not b!827821) (not bm!35974) (not d!105387) (not b!827882) (not b!827900) (not b!827899) (not d!105399) (not b!827913) (not b!827902) (not b!827897) (not d!105403) (not d!105423) (not b!827949) tp_is_empty!15055 (not bm!35970) (not bm!35973) (not b!827917) (not b!827901) (not b!827985) (not bm!35971) (not b!827966) (not b!827951) (not bm!35985) (not b!827883) (not b_lambda!11169) (not bm!35977) (not b!827967) (not b_next!13345) (not b!827958) (not bm!35981) (not b!827823) (not b!827916) (not bm!35982) (not d!105415) (not b!827969) (not b!827887) (not d!105393) (not b!827893) (not b!827987) (not b!827988) (not b!828002) (not b!827998) (not b!827957) (not b!827826) (not d!105421) (not b!827874) (not b!827981) (not d!105405) b_and!22297 (not d!105379) (not b!827954) (not b_lambda!11173) (not b!827907) (not d!105381) (not d!105397) (not b!827986) (not b!827896) (not bm!35988) (not b!827878) (not b!827884) (not d!105417) (not b_lambda!11167) (not b!828005) (not b!827970) (not b!827822) (not b!827869) (not b!827894) (not b!827989) (not b_lambda!11171) (not b!827983) (not d!105389) (not d!105383) (not mapNonEmpty!24217) (not b!827953) (not b!827898) (not bm!35978) (not b!828003) (not b!827999) (not b!827961) (not b_lambda!11165) (not b!827955) (not bm!35967) (not b!827825) (not b!827911) (not d!105401) (not bm!35966) (not b!827920))
(check-sat b_and!22297 (not b_next!13345))
