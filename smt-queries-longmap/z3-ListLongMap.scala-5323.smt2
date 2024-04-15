; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71158 () Bool)

(assert start!71158)

(declare-fun b_free!13345 () Bool)

(declare-fun b_next!13345 () Bool)

(assert (=> start!71158 (= b_free!13345 (not b_next!13345))))

(declare-fun tp!46794 () Bool)

(declare-fun b_and!22245 () Bool)

(assert (=> start!71158 (= tp!46794 b_and!22245)))

(declare-fun b!826600 () Bool)

(declare-fun e!460384 () Bool)

(declare-fun e!460382 () Bool)

(assert (=> b!826600 (= e!460384 (not e!460382))))

(declare-fun res!563538 () Bool)

(assert (=> b!826600 (=> res!563538 e!460382)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826600 (= res!563538 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25075 0))(
  ( (V!25076 (val!7575 Int)) )
))
(declare-datatypes ((tuple2!10050 0))(
  ( (tuple2!10051 (_1!5036 (_ BitVec 64)) (_2!5036 V!25075)) )
))
(declare-datatypes ((List!15838 0))(
  ( (Nil!15835) (Cons!15834 (h!16963 tuple2!10050) (t!22176 List!15838)) )
))
(declare-datatypes ((ListLongMap!8863 0))(
  ( (ListLongMap!8864 (toList!4447 List!15838)) )
))
(declare-fun lt!374293 () ListLongMap!8863)

(declare-fun lt!374284 () ListLongMap!8863)

(assert (=> b!826600 (= lt!374293 lt!374284)))

(declare-fun zeroValueBefore!34 () V!25075)

(declare-datatypes ((array!46251 0))(
  ( (array!46252 (arr!22171 (Array (_ BitVec 32) (_ BitVec 64))) (size!22592 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46251)

(declare-fun minValue!754 () V!25075)

(declare-datatypes ((ValueCell!7112 0))(
  ( (ValueCellFull!7112 (v!10003 V!25075)) (EmptyCell!7112) )
))
(declare-datatypes ((array!46253 0))(
  ( (array!46254 (arr!22172 (Array (_ BitVec 32) ValueCell!7112)) (size!22593 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46253)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28307 0))(
  ( (Unit!28308) )
))
(declare-fun lt!374294 () Unit!28307)

(declare-fun zeroValueAfter!34 () V!25075)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!572 (array!46251 array!46253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 V!25075 V!25075 (_ BitVec 32) Int) Unit!28307)

(assert (=> b!826600 (= lt!374294 (lemmaNoChangeToArrayThenSameMapNoExtras!572 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2479 (array!46251 array!46253 (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 (_ BitVec 32) Int) ListLongMap!8863)

(assert (=> b!826600 (= lt!374284 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826600 (= lt!374293 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826601 () Bool)

(declare-fun e!460379 () Bool)

(assert (=> b!826601 (= e!460379 (bvsle #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826602 () Bool)

(declare-fun e!460378 () Bool)

(declare-fun tp_is_empty!15055 () Bool)

(assert (=> b!826602 (= e!460378 tp_is_empty!15055)))

(declare-fun b!826603 () Bool)

(declare-fun res!563537 () Bool)

(assert (=> b!826603 (=> (not res!563537) (not e!460384))))

(assert (=> b!826603 (= res!563537 (and (= (size!22593 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22592 _keys!976) (size!22593 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826604 () Bool)

(declare-fun e!460376 () Bool)

(assert (=> b!826604 (= e!460376 tp_is_empty!15055)))

(declare-fun b!826605 () Bool)

(declare-fun res!563539 () Bool)

(assert (=> b!826605 (=> (not res!563539) (not e!460384))))

(declare-datatypes ((List!15839 0))(
  ( (Nil!15836) (Cons!15835 (h!16964 (_ BitVec 64)) (t!22177 List!15839)) )
))
(declare-fun arrayNoDuplicates!0 (array!46251 (_ BitVec 32) List!15839) Bool)

(assert (=> b!826605 (= res!563539 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15836))))

(declare-fun res!563540 () Bool)

(assert (=> start!71158 (=> (not res!563540) (not e!460384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71158 (= res!563540 (validMask!0 mask!1312))))

(assert (=> start!71158 e!460384))

(assert (=> start!71158 tp_is_empty!15055))

(declare-fun array_inv!17739 (array!46251) Bool)

(assert (=> start!71158 (array_inv!17739 _keys!976)))

(assert (=> start!71158 true))

(declare-fun e!460381 () Bool)

(declare-fun array_inv!17740 (array!46253) Bool)

(assert (=> start!71158 (and (array_inv!17740 _values!788) e!460381)))

(assert (=> start!71158 tp!46794))

(declare-fun mapIsEmpty!24208 () Bool)

(declare-fun mapRes!24208 () Bool)

(assert (=> mapIsEmpty!24208 mapRes!24208))

(declare-fun b!826606 () Bool)

(assert (=> b!826606 (= e!460381 (and e!460376 mapRes!24208))))

(declare-fun condMapEmpty!24208 () Bool)

(declare-fun mapDefault!24208 () ValueCell!7112)

(assert (=> b!826606 (= condMapEmpty!24208 (= (arr!22172 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7112)) mapDefault!24208)))))

(declare-fun mapNonEmpty!24208 () Bool)

(declare-fun tp!46795 () Bool)

(assert (=> mapNonEmpty!24208 (= mapRes!24208 (and tp!46795 e!460378))))

(declare-fun mapRest!24208 () (Array (_ BitVec 32) ValueCell!7112))

(declare-fun mapValue!24208 () ValueCell!7112)

(declare-fun mapKey!24208 () (_ BitVec 32))

(assert (=> mapNonEmpty!24208 (= (arr!22172 _values!788) (store mapRest!24208 mapKey!24208 mapValue!24208))))

(declare-fun b!826607 () Bool)

(declare-fun res!563541 () Bool)

(assert (=> b!826607 (=> (not res!563541) (not e!460384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46251 (_ BitVec 32)) Bool)

(assert (=> b!826607 (= res!563541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun lt!374289 () tuple2!10050)

(declare-fun b!826608 () Bool)

(declare-fun e!460377 () Bool)

(declare-fun lt!374295 () ListLongMap!8863)

(declare-fun +!1981 (ListLongMap!8863 tuple2!10050) ListLongMap!8863)

(assert (=> b!826608 (= e!460377 (= lt!374295 (+!1981 (+!1981 lt!374284 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374289)))))

(declare-fun b!826609 () Bool)

(assert (=> b!826609 (= e!460382 e!460379)))

(declare-fun res!563536 () Bool)

(assert (=> b!826609 (=> res!563536 e!460379)))

(declare-fun lt!374296 () tuple2!10050)

(assert (=> b!826609 (= res!563536 (not (= lt!374295 (+!1981 (+!1981 lt!374293 lt!374296) lt!374289))))))

(declare-fun lt!374291 () ListLongMap!8863)

(declare-fun lt!374286 () ListLongMap!8863)

(assert (=> b!826609 (and (= lt!374291 lt!374286) (= lt!374295 lt!374286) (= lt!374295 lt!374291))))

(declare-fun lt!374288 () ListLongMap!8863)

(assert (=> b!826609 (= lt!374286 (+!1981 lt!374288 lt!374296))))

(declare-fun lt!374292 () ListLongMap!8863)

(assert (=> b!826609 (= lt!374291 (+!1981 lt!374292 lt!374296))))

(declare-fun lt!374290 () Unit!28307)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!244 (ListLongMap!8863 (_ BitVec 64) V!25075 V!25075) Unit!28307)

(assert (=> b!826609 (= lt!374290 (addSameAsAddTwiceSameKeyDiffValues!244 lt!374292 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460380 () Bool)

(assert (=> b!826609 e!460380))

(declare-fun res!563542 () Bool)

(assert (=> b!826609 (=> (not res!563542) (not e!460380))))

(declare-fun lt!374285 () ListLongMap!8863)

(assert (=> b!826609 (= res!563542 (= lt!374285 lt!374288))))

(declare-fun lt!374287 () tuple2!10050)

(assert (=> b!826609 (= lt!374288 (+!1981 lt!374292 lt!374287))))

(assert (=> b!826609 (= lt!374292 (+!1981 lt!374293 lt!374289))))

(assert (=> b!826609 (= lt!374296 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826609 e!460377))

(declare-fun res!563543 () Bool)

(assert (=> b!826609 (=> (not res!563543) (not e!460377))))

(assert (=> b!826609 (= res!563543 (= lt!374285 (+!1981 (+!1981 lt!374293 lt!374287) lt!374289)))))

(assert (=> b!826609 (= lt!374289 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826609 (= lt!374287 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2527 (array!46251 array!46253 (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 (_ BitVec 32) Int) ListLongMap!8863)

(assert (=> b!826609 (= lt!374295 (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826609 (= lt!374285 (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826610 () Bool)

(assert (=> b!826610 (= e!460380 (= lt!374295 (+!1981 (+!1981 lt!374284 lt!374289) lt!374296)))))

(assert (= (and start!71158 res!563540) b!826603))

(assert (= (and b!826603 res!563537) b!826607))

(assert (= (and b!826607 res!563541) b!826605))

(assert (= (and b!826605 res!563539) b!826600))

(assert (= (and b!826600 (not res!563538)) b!826609))

(assert (= (and b!826609 res!563543) b!826608))

(assert (= (and b!826609 res!563542) b!826610))

(assert (= (and b!826609 (not res!563536)) b!826601))

(assert (= (and b!826606 condMapEmpty!24208) mapIsEmpty!24208))

(assert (= (and b!826606 (not condMapEmpty!24208)) mapNonEmpty!24208))

(get-info :version)

(assert (= (and mapNonEmpty!24208 ((_ is ValueCellFull!7112) mapValue!24208)) b!826602))

(assert (= (and b!826606 ((_ is ValueCellFull!7112) mapDefault!24208)) b!826604))

(assert (= start!71158 b!826606))

(declare-fun m!769075 () Bool)

(assert (=> b!826605 m!769075))

(declare-fun m!769077 () Bool)

(assert (=> b!826600 m!769077))

(declare-fun m!769079 () Bool)

(assert (=> b!826600 m!769079))

(declare-fun m!769081 () Bool)

(assert (=> b!826600 m!769081))

(declare-fun m!769083 () Bool)

(assert (=> mapNonEmpty!24208 m!769083))

(declare-fun m!769085 () Bool)

(assert (=> start!71158 m!769085))

(declare-fun m!769087 () Bool)

(assert (=> start!71158 m!769087))

(declare-fun m!769089 () Bool)

(assert (=> start!71158 m!769089))

(declare-fun m!769091 () Bool)

(assert (=> b!826608 m!769091))

(assert (=> b!826608 m!769091))

(declare-fun m!769093 () Bool)

(assert (=> b!826608 m!769093))

(declare-fun m!769095 () Bool)

(assert (=> b!826607 m!769095))

(declare-fun m!769097 () Bool)

(assert (=> b!826610 m!769097))

(assert (=> b!826610 m!769097))

(declare-fun m!769099 () Bool)

(assert (=> b!826610 m!769099))

(declare-fun m!769101 () Bool)

(assert (=> b!826609 m!769101))

(declare-fun m!769103 () Bool)

(assert (=> b!826609 m!769103))

(declare-fun m!769105 () Bool)

(assert (=> b!826609 m!769105))

(assert (=> b!826609 m!769101))

(declare-fun m!769107 () Bool)

(assert (=> b!826609 m!769107))

(declare-fun m!769109 () Bool)

(assert (=> b!826609 m!769109))

(declare-fun m!769111 () Bool)

(assert (=> b!826609 m!769111))

(declare-fun m!769113 () Bool)

(assert (=> b!826609 m!769113))

(assert (=> b!826609 m!769111))

(declare-fun m!769115 () Bool)

(assert (=> b!826609 m!769115))

(declare-fun m!769117 () Bool)

(assert (=> b!826609 m!769117))

(declare-fun m!769119 () Bool)

(assert (=> b!826609 m!769119))

(declare-fun m!769121 () Bool)

(assert (=> b!826609 m!769121))

(check-sat (not b!826610) (not mapNonEmpty!24208) (not start!71158) (not b!826600) (not b!826607) (not b!826605) (not b_next!13345) (not b!826608) tp_is_empty!15055 (not b!826609) b_and!22245)
(check-sat b_and!22245 (not b_next!13345))
(get-model)

(declare-fun d!104863 () Bool)

(declare-fun res!563597 () Bool)

(declare-fun e!460446 () Bool)

(assert (=> d!104863 (=> res!563597 e!460446)))

(assert (=> d!104863 (= res!563597 (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!460446)))

(declare-fun b!826685 () Bool)

(declare-fun e!460447 () Bool)

(declare-fun call!35885 () Bool)

(assert (=> b!826685 (= e!460447 call!35885)))

(declare-fun b!826686 () Bool)

(declare-fun e!460445 () Bool)

(assert (=> b!826686 (= e!460445 e!460447)))

(declare-fun lt!374383 () (_ BitVec 64))

(assert (=> b!826686 (= lt!374383 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374382 () Unit!28307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46251 (_ BitVec 64) (_ BitVec 32)) Unit!28307)

(assert (=> b!826686 (= lt!374382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!374383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!826686 (arrayContainsKey!0 _keys!976 lt!374383 #b00000000000000000000000000000000)))

(declare-fun lt!374381 () Unit!28307)

(assert (=> b!826686 (= lt!374381 lt!374382)))

(declare-fun res!563596 () Bool)

(declare-datatypes ((SeekEntryResult!8731 0))(
  ( (MissingZero!8731 (index!37295 (_ BitVec 32))) (Found!8731 (index!37296 (_ BitVec 32))) (Intermediate!8731 (undefined!9543 Bool) (index!37297 (_ BitVec 32)) (x!69792 (_ BitVec 32))) (Undefined!8731) (MissingVacant!8731 (index!37298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46251 (_ BitVec 32)) SeekEntryResult!8731)

(assert (=> b!826686 (= res!563596 (= (seekEntryOrOpen!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8731 #b00000000000000000000000000000000)))))

(assert (=> b!826686 (=> (not res!563596) (not e!460447))))

(declare-fun bm!35882 () Bool)

(assert (=> bm!35882 (= call!35885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!826687 () Bool)

(assert (=> b!826687 (= e!460446 e!460445)))

(declare-fun c!89409 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!826687 (= c!89409 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826688 () Bool)

(assert (=> b!826688 (= e!460445 call!35885)))

(assert (= (and d!104863 (not res!563597)) b!826687))

(assert (= (and b!826687 c!89409) b!826686))

(assert (= (and b!826687 (not c!89409)) b!826688))

(assert (= (and b!826686 res!563596) b!826685))

(assert (= (or b!826685 b!826688) bm!35882))

(declare-fun m!769219 () Bool)

(assert (=> b!826686 m!769219))

(declare-fun m!769221 () Bool)

(assert (=> b!826686 m!769221))

(declare-fun m!769223 () Bool)

(assert (=> b!826686 m!769223))

(assert (=> b!826686 m!769219))

(declare-fun m!769225 () Bool)

(assert (=> b!826686 m!769225))

(declare-fun m!769227 () Bool)

(assert (=> bm!35882 m!769227))

(assert (=> b!826687 m!769219))

(assert (=> b!826687 m!769219))

(declare-fun m!769229 () Bool)

(assert (=> b!826687 m!769229))

(assert (=> b!826607 d!104863))

(declare-fun d!104865 () Bool)

(declare-fun e!460450 () Bool)

(assert (=> d!104865 e!460450))

(declare-fun res!563603 () Bool)

(assert (=> d!104865 (=> (not res!563603) (not e!460450))))

(declare-fun lt!374394 () ListLongMap!8863)

(declare-fun contains!4161 (ListLongMap!8863 (_ BitVec 64)) Bool)

(assert (=> d!104865 (= res!563603 (contains!4161 lt!374394 (_1!5036 lt!374289)))))

(declare-fun lt!374395 () List!15838)

(assert (=> d!104865 (= lt!374394 (ListLongMap!8864 lt!374395))))

(declare-fun lt!374393 () Unit!28307)

(declare-fun lt!374392 () Unit!28307)

(assert (=> d!104865 (= lt!374393 lt!374392)))

(declare-datatypes ((Option!411 0))(
  ( (Some!410 (v!10006 V!25075)) (None!409) )
))
(declare-fun getValueByKey!405 (List!15838 (_ BitVec 64)) Option!411)

(assert (=> d!104865 (= (getValueByKey!405 lt!374395 (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289)))))

(declare-fun lemmaContainsTupThenGetReturnValue!222 (List!15838 (_ BitVec 64) V!25075) Unit!28307)

(assert (=> d!104865 (= lt!374392 (lemmaContainsTupThenGetReturnValue!222 lt!374395 (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(declare-fun insertStrictlySorted!261 (List!15838 (_ BitVec 64) V!25075) List!15838)

(assert (=> d!104865 (= lt!374395 (insertStrictlySorted!261 (toList!4447 (+!1981 lt!374293 lt!374296)) (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104865 (= (+!1981 (+!1981 lt!374293 lt!374296) lt!374289) lt!374394)))

(declare-fun b!826693 () Bool)

(declare-fun res!563602 () Bool)

(assert (=> b!826693 (=> (not res!563602) (not e!460450))))

(assert (=> b!826693 (= res!563602 (= (getValueByKey!405 (toList!4447 lt!374394) (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289))))))

(declare-fun b!826694 () Bool)

(declare-fun contains!4162 (List!15838 tuple2!10050) Bool)

(assert (=> b!826694 (= e!460450 (contains!4162 (toList!4447 lt!374394) lt!374289))))

(assert (= (and d!104865 res!563603) b!826693))

(assert (= (and b!826693 res!563602) b!826694))

(declare-fun m!769231 () Bool)

(assert (=> d!104865 m!769231))

(declare-fun m!769233 () Bool)

(assert (=> d!104865 m!769233))

(declare-fun m!769235 () Bool)

(assert (=> d!104865 m!769235))

(declare-fun m!769237 () Bool)

(assert (=> d!104865 m!769237))

(declare-fun m!769239 () Bool)

(assert (=> b!826693 m!769239))

(declare-fun m!769241 () Bool)

(assert (=> b!826694 m!769241))

(assert (=> b!826609 d!104865))

(declare-fun d!104867 () Bool)

(declare-fun e!460451 () Bool)

(assert (=> d!104867 e!460451))

(declare-fun res!563605 () Bool)

(assert (=> d!104867 (=> (not res!563605) (not e!460451))))

(declare-fun lt!374398 () ListLongMap!8863)

(assert (=> d!104867 (= res!563605 (contains!4161 lt!374398 (_1!5036 lt!374296)))))

(declare-fun lt!374399 () List!15838)

(assert (=> d!104867 (= lt!374398 (ListLongMap!8864 lt!374399))))

(declare-fun lt!374397 () Unit!28307)

(declare-fun lt!374396 () Unit!28307)

(assert (=> d!104867 (= lt!374397 lt!374396)))

(assert (=> d!104867 (= (getValueByKey!405 lt!374399 (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296)))))

(assert (=> d!104867 (= lt!374396 (lemmaContainsTupThenGetReturnValue!222 lt!374399 (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104867 (= lt!374399 (insertStrictlySorted!261 (toList!4447 lt!374292) (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104867 (= (+!1981 lt!374292 lt!374296) lt!374398)))

(declare-fun b!826695 () Bool)

(declare-fun res!563604 () Bool)

(assert (=> b!826695 (=> (not res!563604) (not e!460451))))

(assert (=> b!826695 (= res!563604 (= (getValueByKey!405 (toList!4447 lt!374398) (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296))))))

(declare-fun b!826696 () Bool)

(assert (=> b!826696 (= e!460451 (contains!4162 (toList!4447 lt!374398) lt!374296))))

(assert (= (and d!104867 res!563605) b!826695))

(assert (= (and b!826695 res!563604) b!826696))

(declare-fun m!769243 () Bool)

(assert (=> d!104867 m!769243))

(declare-fun m!769245 () Bool)

(assert (=> d!104867 m!769245))

(declare-fun m!769247 () Bool)

(assert (=> d!104867 m!769247))

(declare-fun m!769249 () Bool)

(assert (=> d!104867 m!769249))

(declare-fun m!769251 () Bool)

(assert (=> b!826695 m!769251))

(declare-fun m!769253 () Bool)

(assert (=> b!826696 m!769253))

(assert (=> b!826609 d!104867))

(declare-fun d!104869 () Bool)

(declare-fun e!460452 () Bool)

(assert (=> d!104869 e!460452))

(declare-fun res!563607 () Bool)

(assert (=> d!104869 (=> (not res!563607) (not e!460452))))

(declare-fun lt!374402 () ListLongMap!8863)

(assert (=> d!104869 (= res!563607 (contains!4161 lt!374402 (_1!5036 lt!374296)))))

(declare-fun lt!374403 () List!15838)

(assert (=> d!104869 (= lt!374402 (ListLongMap!8864 lt!374403))))

(declare-fun lt!374401 () Unit!28307)

(declare-fun lt!374400 () Unit!28307)

(assert (=> d!104869 (= lt!374401 lt!374400)))

(assert (=> d!104869 (= (getValueByKey!405 lt!374403 (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296)))))

(assert (=> d!104869 (= lt!374400 (lemmaContainsTupThenGetReturnValue!222 lt!374403 (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104869 (= lt!374403 (insertStrictlySorted!261 (toList!4447 lt!374293) (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104869 (= (+!1981 lt!374293 lt!374296) lt!374402)))

(declare-fun b!826697 () Bool)

(declare-fun res!563606 () Bool)

(assert (=> b!826697 (=> (not res!563606) (not e!460452))))

(assert (=> b!826697 (= res!563606 (= (getValueByKey!405 (toList!4447 lt!374402) (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296))))))

(declare-fun b!826698 () Bool)

(assert (=> b!826698 (= e!460452 (contains!4162 (toList!4447 lt!374402) lt!374296))))

(assert (= (and d!104869 res!563607) b!826697))

(assert (= (and b!826697 res!563606) b!826698))

(declare-fun m!769255 () Bool)

(assert (=> d!104869 m!769255))

(declare-fun m!769257 () Bool)

(assert (=> d!104869 m!769257))

(declare-fun m!769259 () Bool)

(assert (=> d!104869 m!769259))

(declare-fun m!769261 () Bool)

(assert (=> d!104869 m!769261))

(declare-fun m!769263 () Bool)

(assert (=> b!826697 m!769263))

(declare-fun m!769265 () Bool)

(assert (=> b!826698 m!769265))

(assert (=> b!826609 d!104869))

(declare-fun d!104871 () Bool)

(declare-fun e!460453 () Bool)

(assert (=> d!104871 e!460453))

(declare-fun res!563609 () Bool)

(assert (=> d!104871 (=> (not res!563609) (not e!460453))))

(declare-fun lt!374406 () ListLongMap!8863)

(assert (=> d!104871 (= res!563609 (contains!4161 lt!374406 (_1!5036 lt!374287)))))

(declare-fun lt!374407 () List!15838)

(assert (=> d!104871 (= lt!374406 (ListLongMap!8864 lt!374407))))

(declare-fun lt!374405 () Unit!28307)

(declare-fun lt!374404 () Unit!28307)

(assert (=> d!104871 (= lt!374405 lt!374404)))

(assert (=> d!104871 (= (getValueByKey!405 lt!374407 (_1!5036 lt!374287)) (Some!410 (_2!5036 lt!374287)))))

(assert (=> d!104871 (= lt!374404 (lemmaContainsTupThenGetReturnValue!222 lt!374407 (_1!5036 lt!374287) (_2!5036 lt!374287)))))

(assert (=> d!104871 (= lt!374407 (insertStrictlySorted!261 (toList!4447 lt!374293) (_1!5036 lt!374287) (_2!5036 lt!374287)))))

(assert (=> d!104871 (= (+!1981 lt!374293 lt!374287) lt!374406)))

(declare-fun b!826699 () Bool)

(declare-fun res!563608 () Bool)

(assert (=> b!826699 (=> (not res!563608) (not e!460453))))

(assert (=> b!826699 (= res!563608 (= (getValueByKey!405 (toList!4447 lt!374406) (_1!5036 lt!374287)) (Some!410 (_2!5036 lt!374287))))))

(declare-fun b!826700 () Bool)

(assert (=> b!826700 (= e!460453 (contains!4162 (toList!4447 lt!374406) lt!374287))))

(assert (= (and d!104871 res!563609) b!826699))

(assert (= (and b!826699 res!563608) b!826700))

(declare-fun m!769267 () Bool)

(assert (=> d!104871 m!769267))

(declare-fun m!769269 () Bool)

(assert (=> d!104871 m!769269))

(declare-fun m!769271 () Bool)

(assert (=> d!104871 m!769271))

(declare-fun m!769273 () Bool)

(assert (=> d!104871 m!769273))

(declare-fun m!769275 () Bool)

(assert (=> b!826699 m!769275))

(declare-fun m!769277 () Bool)

(assert (=> b!826700 m!769277))

(assert (=> b!826609 d!104871))

(declare-fun b!826743 () Bool)

(declare-fun e!460492 () Bool)

(declare-fun lt!374470 () ListLongMap!8863)

(declare-fun apply!363 (ListLongMap!8863 (_ BitVec 64)) V!25075)

(assert (=> b!826743 (= e!460492 (= (apply!363 lt!374470 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35897 () Bool)

(declare-fun call!35904 () ListLongMap!8863)

(declare-fun call!35901 () ListLongMap!8863)

(assert (=> bm!35897 (= call!35904 call!35901)))

(declare-fun b!826744 () Bool)

(declare-fun res!563636 () Bool)

(declare-fun e!460488 () Bool)

(assert (=> b!826744 (=> (not res!563636) (not e!460488))))

(declare-fun e!460482 () Bool)

(assert (=> b!826744 (= res!563636 e!460482)))

(declare-fun c!89426 () Bool)

(assert (=> b!826744 (= c!89426 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!826745 () Bool)

(declare-fun e!460486 () Bool)

(declare-fun e!460489 () Bool)

(assert (=> b!826745 (= e!460486 e!460489)))

(declare-fun res!563630 () Bool)

(assert (=> b!826745 (=> (not res!563630) (not e!460489))))

(assert (=> b!826745 (= res!563630 (contains!4161 lt!374470 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826745 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun bm!35898 () Bool)

(declare-fun call!35903 () ListLongMap!8863)

(assert (=> bm!35898 (= call!35901 call!35903)))

(declare-fun b!826746 () Bool)

(declare-fun e!460490 () ListLongMap!8863)

(declare-fun call!35902 () ListLongMap!8863)

(assert (=> b!826746 (= e!460490 call!35902)))

(declare-fun bm!35899 () Bool)

(declare-fun call!35900 () ListLongMap!8863)

(assert (=> bm!35899 (= call!35902 call!35900)))

(declare-fun b!826748 () Bool)

(declare-fun e!460484 () Unit!28307)

(declare-fun lt!374453 () Unit!28307)

(assert (=> b!826748 (= e!460484 lt!374453)))

(declare-fun lt!374463 () ListLongMap!8863)

(assert (=> b!826748 (= lt!374463 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374467 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374457 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374457 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374462 () Unit!28307)

(declare-fun addStillContains!315 (ListLongMap!8863 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28307)

(assert (=> b!826748 (= lt!374462 (addStillContains!315 lt!374463 lt!374467 zeroValueBefore!34 lt!374457))))

(assert (=> b!826748 (contains!4161 (+!1981 lt!374463 (tuple2!10051 lt!374467 zeroValueBefore!34)) lt!374457)))

(declare-fun lt!374472 () Unit!28307)

(assert (=> b!826748 (= lt!374472 lt!374462)))

(declare-fun lt!374466 () ListLongMap!8863)

(assert (=> b!826748 (= lt!374466 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374465 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374465 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374460 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374460 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374473 () Unit!28307)

(declare-fun addApplyDifferent!315 (ListLongMap!8863 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28307)

(assert (=> b!826748 (= lt!374473 (addApplyDifferent!315 lt!374466 lt!374465 minValue!754 lt!374460))))

(assert (=> b!826748 (= (apply!363 (+!1981 lt!374466 (tuple2!10051 lt!374465 minValue!754)) lt!374460) (apply!363 lt!374466 lt!374460))))

(declare-fun lt!374455 () Unit!28307)

(assert (=> b!826748 (= lt!374455 lt!374473)))

(declare-fun lt!374468 () ListLongMap!8863)

(assert (=> b!826748 (= lt!374468 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374458 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374454 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374454 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374464 () Unit!28307)

(assert (=> b!826748 (= lt!374464 (addApplyDifferent!315 lt!374468 lt!374458 zeroValueBefore!34 lt!374454))))

(assert (=> b!826748 (= (apply!363 (+!1981 lt!374468 (tuple2!10051 lt!374458 zeroValueBefore!34)) lt!374454) (apply!363 lt!374468 lt!374454))))

(declare-fun lt!374461 () Unit!28307)

(assert (=> b!826748 (= lt!374461 lt!374464)))

(declare-fun lt!374452 () ListLongMap!8863)

(assert (=> b!826748 (= lt!374452 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374459 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374456 () (_ BitVec 64))

(assert (=> b!826748 (= lt!374456 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826748 (= lt!374453 (addApplyDifferent!315 lt!374452 lt!374459 minValue!754 lt!374456))))

(assert (=> b!826748 (= (apply!363 (+!1981 lt!374452 (tuple2!10051 lt!374459 minValue!754)) lt!374456) (apply!363 lt!374452 lt!374456))))

(declare-fun b!826749 () Bool)

(declare-fun get!11764 (ValueCell!7112 V!25075) V!25075)

(declare-fun dynLambda!977 (Int (_ BitVec 64)) V!25075)

(assert (=> b!826749 (= e!460489 (= (apply!363 lt!374470 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!826749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22593 _values!788)))))

(assert (=> b!826749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826750 () Bool)

(declare-fun e!460487 () Bool)

(assert (=> b!826750 (= e!460482 e!460487)))

(declare-fun res!563629 () Bool)

(declare-fun call!35905 () Bool)

(assert (=> b!826750 (= res!563629 call!35905)))

(assert (=> b!826750 (=> (not res!563629) (not e!460487))))

(declare-fun bm!35900 () Bool)

(assert (=> bm!35900 (= call!35903 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826751 () Bool)

(declare-fun e!460483 () ListLongMap!8863)

(assert (=> b!826751 (= e!460483 (+!1981 call!35900 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!826752 () Bool)

(declare-fun e!460485 () Bool)

(assert (=> b!826752 (= e!460485 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826753 () Bool)

(declare-fun Unit!28311 () Unit!28307)

(assert (=> b!826753 (= e!460484 Unit!28311)))

(declare-fun b!826754 () Bool)

(assert (=> b!826754 (= e!460482 (not call!35905))))

(declare-fun b!826755 () Bool)

(assert (=> b!826755 (= e!460490 call!35904)))

(declare-fun b!826756 () Bool)

(declare-fun e!460480 () Bool)

(assert (=> b!826756 (= e!460480 e!460492)))

(declare-fun res!563633 () Bool)

(declare-fun call!35906 () Bool)

(assert (=> b!826756 (= res!563633 call!35906)))

(assert (=> b!826756 (=> (not res!563633) (not e!460492))))

(declare-fun bm!35901 () Bool)

(assert (=> bm!35901 (= call!35906 (contains!4161 lt!374470 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826757 () Bool)

(declare-fun c!89424 () Bool)

(assert (=> b!826757 (= c!89424 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!460481 () ListLongMap!8863)

(assert (=> b!826757 (= e!460481 e!460490)))

(declare-fun b!826758 () Bool)

(assert (=> b!826758 (= e!460487 (= (apply!363 lt!374470 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun d!104873 () Bool)

(assert (=> d!104873 e!460488))

(declare-fun res!563635 () Bool)

(assert (=> d!104873 (=> (not res!563635) (not e!460488))))

(assert (=> d!104873 (= res!563635 (or (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))))

(declare-fun lt!374471 () ListLongMap!8863)

(assert (=> d!104873 (= lt!374470 lt!374471)))

(declare-fun lt!374469 () Unit!28307)

(assert (=> d!104873 (= lt!374469 e!460484)))

(declare-fun c!89423 () Bool)

(assert (=> d!104873 (= c!89423 e!460485)))

(declare-fun res!563632 () Bool)

(assert (=> d!104873 (=> (not res!563632) (not e!460485))))

(assert (=> d!104873 (= res!563632 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104873 (= lt!374471 e!460483)))

(declare-fun c!89422 () Bool)

(assert (=> d!104873 (= c!89422 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104873 (validMask!0 mask!1312)))

(assert (=> d!104873 (= (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374470)))

(declare-fun b!826747 () Bool)

(declare-fun res!563634 () Bool)

(assert (=> b!826747 (=> (not res!563634) (not e!460488))))

(assert (=> b!826747 (= res!563634 e!460486)))

(declare-fun res!563628 () Bool)

(assert (=> b!826747 (=> res!563628 e!460486)))

(declare-fun e!460491 () Bool)

(assert (=> b!826747 (= res!563628 (not e!460491))))

(declare-fun res!563631 () Bool)

(assert (=> b!826747 (=> (not res!563631) (not e!460491))))

(assert (=> b!826747 (= res!563631 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun c!89425 () Bool)

(declare-fun bm!35902 () Bool)

(assert (=> bm!35902 (= call!35900 (+!1981 (ite c!89422 call!35903 (ite c!89425 call!35901 call!35904)) (ite (or c!89422 c!89425) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!826759 () Bool)

(assert (=> b!826759 (= e!460491 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826760 () Bool)

(assert (=> b!826760 (= e!460483 e!460481)))

(assert (=> b!826760 (= c!89425 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35903 () Bool)

(assert (=> bm!35903 (= call!35905 (contains!4161 lt!374470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826761 () Bool)

(assert (=> b!826761 (= e!460480 (not call!35906))))

(declare-fun b!826762 () Bool)

(assert (=> b!826762 (= e!460481 call!35902)))

(declare-fun b!826763 () Bool)

(assert (=> b!826763 (= e!460488 e!460480)))

(declare-fun c!89427 () Bool)

(assert (=> b!826763 (= c!89427 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104873 c!89422) b!826751))

(assert (= (and d!104873 (not c!89422)) b!826760))

(assert (= (and b!826760 c!89425) b!826762))

(assert (= (and b!826760 (not c!89425)) b!826757))

(assert (= (and b!826757 c!89424) b!826746))

(assert (= (and b!826757 (not c!89424)) b!826755))

(assert (= (or b!826746 b!826755) bm!35897))

(assert (= (or b!826762 bm!35897) bm!35898))

(assert (= (or b!826762 b!826746) bm!35899))

(assert (= (or b!826751 bm!35898) bm!35900))

(assert (= (or b!826751 bm!35899) bm!35902))

(assert (= (and d!104873 res!563632) b!826752))

(assert (= (and d!104873 c!89423) b!826748))

(assert (= (and d!104873 (not c!89423)) b!826753))

(assert (= (and d!104873 res!563635) b!826747))

(assert (= (and b!826747 res!563631) b!826759))

(assert (= (and b!826747 (not res!563628)) b!826745))

(assert (= (and b!826745 res!563630) b!826749))

(assert (= (and b!826747 res!563634) b!826744))

(assert (= (and b!826744 c!89426) b!826750))

(assert (= (and b!826744 (not c!89426)) b!826754))

(assert (= (and b!826750 res!563629) b!826758))

(assert (= (or b!826750 b!826754) bm!35903))

(assert (= (and b!826744 res!563636) b!826763))

(assert (= (and b!826763 c!89427) b!826756))

(assert (= (and b!826763 (not c!89427)) b!826761))

(assert (= (and b!826756 res!563633) b!826743))

(assert (= (or b!826756 b!826761) bm!35901))

(declare-fun b_lambda!11121 () Bool)

(assert (=> (not b_lambda!11121) (not b!826749)))

(declare-fun t!22180 () Bool)

(declare-fun tb!4199 () Bool)

(assert (=> (and start!71158 (= defaultEntry!796 defaultEntry!796) t!22180) tb!4199))

(declare-fun result!7953 () Bool)

(assert (=> tb!4199 (= result!7953 tp_is_empty!15055)))

(assert (=> b!826749 t!22180))

(declare-fun b_and!22251 () Bool)

(assert (= b_and!22245 (and (=> t!22180 result!7953) b_and!22251)))

(assert (=> b!826749 m!769219))

(declare-fun m!769279 () Bool)

(assert (=> b!826749 m!769279))

(declare-fun m!769281 () Bool)

(assert (=> b!826749 m!769281))

(declare-fun m!769283 () Bool)

(assert (=> b!826749 m!769283))

(assert (=> b!826749 m!769281))

(declare-fun m!769285 () Bool)

(assert (=> b!826749 m!769285))

(assert (=> b!826749 m!769219))

(assert (=> b!826749 m!769283))

(declare-fun m!769287 () Bool)

(assert (=> b!826748 m!769287))

(declare-fun m!769289 () Bool)

(assert (=> b!826748 m!769289))

(declare-fun m!769291 () Bool)

(assert (=> b!826748 m!769291))

(declare-fun m!769293 () Bool)

(assert (=> b!826748 m!769293))

(assert (=> b!826748 m!769287))

(declare-fun m!769295 () Bool)

(assert (=> b!826748 m!769295))

(assert (=> b!826748 m!769289))

(declare-fun m!769297 () Bool)

(assert (=> b!826748 m!769297))

(declare-fun m!769299 () Bool)

(assert (=> b!826748 m!769299))

(declare-fun m!769301 () Bool)

(assert (=> b!826748 m!769301))

(declare-fun m!769303 () Bool)

(assert (=> b!826748 m!769303))

(declare-fun m!769305 () Bool)

(assert (=> b!826748 m!769305))

(assert (=> b!826748 m!769293))

(declare-fun m!769307 () Bool)

(assert (=> b!826748 m!769307))

(assert (=> b!826748 m!769081))

(declare-fun m!769309 () Bool)

(assert (=> b!826748 m!769309))

(declare-fun m!769311 () Bool)

(assert (=> b!826748 m!769311))

(declare-fun m!769313 () Bool)

(assert (=> b!826748 m!769313))

(assert (=> b!826748 m!769219))

(declare-fun m!769315 () Bool)

(assert (=> b!826748 m!769315))

(assert (=> b!826748 m!769299))

(declare-fun m!769317 () Bool)

(assert (=> b!826751 m!769317))

(declare-fun m!769319 () Bool)

(assert (=> b!826758 m!769319))

(declare-fun m!769321 () Bool)

(assert (=> bm!35903 m!769321))

(declare-fun m!769323 () Bool)

(assert (=> bm!35902 m!769323))

(assert (=> b!826745 m!769219))

(assert (=> b!826745 m!769219))

(declare-fun m!769325 () Bool)

(assert (=> b!826745 m!769325))

(assert (=> b!826759 m!769219))

(assert (=> b!826759 m!769219))

(assert (=> b!826759 m!769229))

(declare-fun m!769327 () Bool)

(assert (=> bm!35901 m!769327))

(assert (=> b!826752 m!769219))

(assert (=> b!826752 m!769219))

(assert (=> b!826752 m!769229))

(declare-fun m!769329 () Bool)

(assert (=> b!826743 m!769329))

(assert (=> d!104873 m!769085))

(assert (=> bm!35900 m!769081))

(assert (=> b!826609 d!104873))

(declare-fun b!826766 () Bool)

(declare-fun e!460505 () Bool)

(declare-fun lt!374492 () ListLongMap!8863)

(assert (=> b!826766 (= e!460505 (= (apply!363 lt!374492 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35904 () Bool)

(declare-fun call!35911 () ListLongMap!8863)

(declare-fun call!35908 () ListLongMap!8863)

(assert (=> bm!35904 (= call!35911 call!35908)))

(declare-fun b!826767 () Bool)

(declare-fun res!563645 () Bool)

(declare-fun e!460501 () Bool)

(assert (=> b!826767 (=> (not res!563645) (not e!460501))))

(declare-fun e!460495 () Bool)

(assert (=> b!826767 (= res!563645 e!460495)))

(declare-fun c!89432 () Bool)

(assert (=> b!826767 (= c!89432 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!826768 () Bool)

(declare-fun e!460499 () Bool)

(declare-fun e!460502 () Bool)

(assert (=> b!826768 (= e!460499 e!460502)))

(declare-fun res!563639 () Bool)

(assert (=> b!826768 (=> (not res!563639) (not e!460502))))

(assert (=> b!826768 (= res!563639 (contains!4161 lt!374492 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun bm!35905 () Bool)

(declare-fun call!35910 () ListLongMap!8863)

(assert (=> bm!35905 (= call!35908 call!35910)))

(declare-fun b!826769 () Bool)

(declare-fun e!460503 () ListLongMap!8863)

(declare-fun call!35909 () ListLongMap!8863)

(assert (=> b!826769 (= e!460503 call!35909)))

(declare-fun bm!35906 () Bool)

(declare-fun call!35907 () ListLongMap!8863)

(assert (=> bm!35906 (= call!35909 call!35907)))

(declare-fun b!826771 () Bool)

(declare-fun e!460497 () Unit!28307)

(declare-fun lt!374475 () Unit!28307)

(assert (=> b!826771 (= e!460497 lt!374475)))

(declare-fun lt!374485 () ListLongMap!8863)

(assert (=> b!826771 (= lt!374485 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374489 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374479 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374479 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374484 () Unit!28307)

(assert (=> b!826771 (= lt!374484 (addStillContains!315 lt!374485 lt!374489 zeroValueAfter!34 lt!374479))))

(assert (=> b!826771 (contains!4161 (+!1981 lt!374485 (tuple2!10051 lt!374489 zeroValueAfter!34)) lt!374479)))

(declare-fun lt!374494 () Unit!28307)

(assert (=> b!826771 (= lt!374494 lt!374484)))

(declare-fun lt!374488 () ListLongMap!8863)

(assert (=> b!826771 (= lt!374488 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374487 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374482 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374482 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374495 () Unit!28307)

(assert (=> b!826771 (= lt!374495 (addApplyDifferent!315 lt!374488 lt!374487 minValue!754 lt!374482))))

(assert (=> b!826771 (= (apply!363 (+!1981 lt!374488 (tuple2!10051 lt!374487 minValue!754)) lt!374482) (apply!363 lt!374488 lt!374482))))

(declare-fun lt!374477 () Unit!28307)

(assert (=> b!826771 (= lt!374477 lt!374495)))

(declare-fun lt!374490 () ListLongMap!8863)

(assert (=> b!826771 (= lt!374490 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374480 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374476 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374476 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374486 () Unit!28307)

(assert (=> b!826771 (= lt!374486 (addApplyDifferent!315 lt!374490 lt!374480 zeroValueAfter!34 lt!374476))))

(assert (=> b!826771 (= (apply!363 (+!1981 lt!374490 (tuple2!10051 lt!374480 zeroValueAfter!34)) lt!374476) (apply!363 lt!374490 lt!374476))))

(declare-fun lt!374483 () Unit!28307)

(assert (=> b!826771 (= lt!374483 lt!374486)))

(declare-fun lt!374474 () ListLongMap!8863)

(assert (=> b!826771 (= lt!374474 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374481 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374481 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374478 () (_ BitVec 64))

(assert (=> b!826771 (= lt!374478 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826771 (= lt!374475 (addApplyDifferent!315 lt!374474 lt!374481 minValue!754 lt!374478))))

(assert (=> b!826771 (= (apply!363 (+!1981 lt!374474 (tuple2!10051 lt!374481 minValue!754)) lt!374478) (apply!363 lt!374474 lt!374478))))

(declare-fun b!826772 () Bool)

(assert (=> b!826772 (= e!460502 (= (apply!363 lt!374492 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!826772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22593 _values!788)))))

(assert (=> b!826772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826773 () Bool)

(declare-fun e!460500 () Bool)

(assert (=> b!826773 (= e!460495 e!460500)))

(declare-fun res!563638 () Bool)

(declare-fun call!35912 () Bool)

(assert (=> b!826773 (= res!563638 call!35912)))

(assert (=> b!826773 (=> (not res!563638) (not e!460500))))

(declare-fun bm!35907 () Bool)

(assert (=> bm!35907 (= call!35910 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826774 () Bool)

(declare-fun e!460496 () ListLongMap!8863)

(assert (=> b!826774 (= e!460496 (+!1981 call!35907 (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!826775 () Bool)

(declare-fun e!460498 () Bool)

(assert (=> b!826775 (= e!460498 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826776 () Bool)

(declare-fun Unit!28312 () Unit!28307)

(assert (=> b!826776 (= e!460497 Unit!28312)))

(declare-fun b!826777 () Bool)

(assert (=> b!826777 (= e!460495 (not call!35912))))

(declare-fun b!826778 () Bool)

(assert (=> b!826778 (= e!460503 call!35911)))

(declare-fun b!826779 () Bool)

(declare-fun e!460493 () Bool)

(assert (=> b!826779 (= e!460493 e!460505)))

(declare-fun res!563642 () Bool)

(declare-fun call!35913 () Bool)

(assert (=> b!826779 (= res!563642 call!35913)))

(assert (=> b!826779 (=> (not res!563642) (not e!460505))))

(declare-fun bm!35908 () Bool)

(assert (=> bm!35908 (= call!35913 (contains!4161 lt!374492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826780 () Bool)

(declare-fun c!89430 () Bool)

(assert (=> b!826780 (= c!89430 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!460494 () ListLongMap!8863)

(assert (=> b!826780 (= e!460494 e!460503)))

(declare-fun b!826781 () Bool)

(assert (=> b!826781 (= e!460500 (= (apply!363 lt!374492 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun d!104875 () Bool)

(assert (=> d!104875 e!460501))

(declare-fun res!563644 () Bool)

(assert (=> d!104875 (=> (not res!563644) (not e!460501))))

(assert (=> d!104875 (= res!563644 (or (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))))

(declare-fun lt!374493 () ListLongMap!8863)

(assert (=> d!104875 (= lt!374492 lt!374493)))

(declare-fun lt!374491 () Unit!28307)

(assert (=> d!104875 (= lt!374491 e!460497)))

(declare-fun c!89429 () Bool)

(assert (=> d!104875 (= c!89429 e!460498)))

(declare-fun res!563641 () Bool)

(assert (=> d!104875 (=> (not res!563641) (not e!460498))))

(assert (=> d!104875 (= res!563641 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104875 (= lt!374493 e!460496)))

(declare-fun c!89428 () Bool)

(assert (=> d!104875 (= c!89428 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104875 (validMask!0 mask!1312)))

(assert (=> d!104875 (= (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374492)))

(declare-fun b!826770 () Bool)

(declare-fun res!563643 () Bool)

(assert (=> b!826770 (=> (not res!563643) (not e!460501))))

(assert (=> b!826770 (= res!563643 e!460499)))

(declare-fun res!563637 () Bool)

(assert (=> b!826770 (=> res!563637 e!460499)))

(declare-fun e!460504 () Bool)

(assert (=> b!826770 (= res!563637 (not e!460504))))

(declare-fun res!563640 () Bool)

(assert (=> b!826770 (=> (not res!563640) (not e!460504))))

(assert (=> b!826770 (= res!563640 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun bm!35909 () Bool)

(declare-fun c!89431 () Bool)

(assert (=> bm!35909 (= call!35907 (+!1981 (ite c!89428 call!35910 (ite c!89431 call!35908 call!35911)) (ite (or c!89428 c!89431) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!826782 () Bool)

(assert (=> b!826782 (= e!460504 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826783 () Bool)

(assert (=> b!826783 (= e!460496 e!460494)))

(assert (=> b!826783 (= c!89431 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35910 () Bool)

(assert (=> bm!35910 (= call!35912 (contains!4161 lt!374492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826784 () Bool)

(assert (=> b!826784 (= e!460493 (not call!35913))))

(declare-fun b!826785 () Bool)

(assert (=> b!826785 (= e!460494 call!35909)))

(declare-fun b!826786 () Bool)

(assert (=> b!826786 (= e!460501 e!460493)))

(declare-fun c!89433 () Bool)

(assert (=> b!826786 (= c!89433 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104875 c!89428) b!826774))

(assert (= (and d!104875 (not c!89428)) b!826783))

(assert (= (and b!826783 c!89431) b!826785))

(assert (= (and b!826783 (not c!89431)) b!826780))

(assert (= (and b!826780 c!89430) b!826769))

(assert (= (and b!826780 (not c!89430)) b!826778))

(assert (= (or b!826769 b!826778) bm!35904))

(assert (= (or b!826785 bm!35904) bm!35905))

(assert (= (or b!826785 b!826769) bm!35906))

(assert (= (or b!826774 bm!35905) bm!35907))

(assert (= (or b!826774 bm!35906) bm!35909))

(assert (= (and d!104875 res!563641) b!826775))

(assert (= (and d!104875 c!89429) b!826771))

(assert (= (and d!104875 (not c!89429)) b!826776))

(assert (= (and d!104875 res!563644) b!826770))

(assert (= (and b!826770 res!563640) b!826782))

(assert (= (and b!826770 (not res!563637)) b!826768))

(assert (= (and b!826768 res!563639) b!826772))

(assert (= (and b!826770 res!563643) b!826767))

(assert (= (and b!826767 c!89432) b!826773))

(assert (= (and b!826767 (not c!89432)) b!826777))

(assert (= (and b!826773 res!563638) b!826781))

(assert (= (or b!826773 b!826777) bm!35910))

(assert (= (and b!826767 res!563645) b!826786))

(assert (= (and b!826786 c!89433) b!826779))

(assert (= (and b!826786 (not c!89433)) b!826784))

(assert (= (and b!826779 res!563642) b!826766))

(assert (= (or b!826779 b!826784) bm!35908))

(declare-fun b_lambda!11123 () Bool)

(assert (=> (not b_lambda!11123) (not b!826772)))

(assert (=> b!826772 t!22180))

(declare-fun b_and!22253 () Bool)

(assert (= b_and!22251 (and (=> t!22180 result!7953) b_and!22253)))

(assert (=> b!826772 m!769219))

(declare-fun m!769331 () Bool)

(assert (=> b!826772 m!769331))

(assert (=> b!826772 m!769281))

(assert (=> b!826772 m!769283))

(assert (=> b!826772 m!769281))

(assert (=> b!826772 m!769285))

(assert (=> b!826772 m!769219))

(assert (=> b!826772 m!769283))

(declare-fun m!769333 () Bool)

(assert (=> b!826771 m!769333))

(declare-fun m!769335 () Bool)

(assert (=> b!826771 m!769335))

(declare-fun m!769337 () Bool)

(assert (=> b!826771 m!769337))

(declare-fun m!769339 () Bool)

(assert (=> b!826771 m!769339))

(assert (=> b!826771 m!769333))

(declare-fun m!769341 () Bool)

(assert (=> b!826771 m!769341))

(assert (=> b!826771 m!769335))

(declare-fun m!769343 () Bool)

(assert (=> b!826771 m!769343))

(declare-fun m!769345 () Bool)

(assert (=> b!826771 m!769345))

(declare-fun m!769347 () Bool)

(assert (=> b!826771 m!769347))

(declare-fun m!769349 () Bool)

(assert (=> b!826771 m!769349))

(declare-fun m!769351 () Bool)

(assert (=> b!826771 m!769351))

(assert (=> b!826771 m!769339))

(declare-fun m!769353 () Bool)

(assert (=> b!826771 m!769353))

(assert (=> b!826771 m!769079))

(declare-fun m!769355 () Bool)

(assert (=> b!826771 m!769355))

(declare-fun m!769357 () Bool)

(assert (=> b!826771 m!769357))

(declare-fun m!769359 () Bool)

(assert (=> b!826771 m!769359))

(assert (=> b!826771 m!769219))

(declare-fun m!769361 () Bool)

(assert (=> b!826771 m!769361))

(assert (=> b!826771 m!769345))

(declare-fun m!769363 () Bool)

(assert (=> b!826774 m!769363))

(declare-fun m!769365 () Bool)

(assert (=> b!826781 m!769365))

(declare-fun m!769367 () Bool)

(assert (=> bm!35910 m!769367))

(declare-fun m!769369 () Bool)

(assert (=> bm!35909 m!769369))

(assert (=> b!826768 m!769219))

(assert (=> b!826768 m!769219))

(declare-fun m!769371 () Bool)

(assert (=> b!826768 m!769371))

(assert (=> b!826782 m!769219))

(assert (=> b!826782 m!769219))

(assert (=> b!826782 m!769229))

(declare-fun m!769373 () Bool)

(assert (=> bm!35908 m!769373))

(assert (=> b!826775 m!769219))

(assert (=> b!826775 m!769219))

(assert (=> b!826775 m!769229))

(declare-fun m!769375 () Bool)

(assert (=> b!826766 m!769375))

(assert (=> d!104875 m!769085))

(assert (=> bm!35907 m!769079))

(assert (=> b!826609 d!104875))

(declare-fun d!104877 () Bool)

(assert (=> d!104877 (= (+!1981 lt!374292 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1981 (+!1981 lt!374292 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!374498 () Unit!28307)

(declare-fun choose!1416 (ListLongMap!8863 (_ BitVec 64) V!25075 V!25075) Unit!28307)

(assert (=> d!104877 (= lt!374498 (choose!1416 lt!374292 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104877 (= (addSameAsAddTwiceSameKeyDiffValues!244 lt!374292 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!374498)))

(declare-fun bs!23068 () Bool)

(assert (= bs!23068 d!104877))

(declare-fun m!769377 () Bool)

(assert (=> bs!23068 m!769377))

(declare-fun m!769379 () Bool)

(assert (=> bs!23068 m!769379))

(assert (=> bs!23068 m!769379))

(declare-fun m!769381 () Bool)

(assert (=> bs!23068 m!769381))

(declare-fun m!769383 () Bool)

(assert (=> bs!23068 m!769383))

(assert (=> b!826609 d!104877))

(declare-fun d!104879 () Bool)

(declare-fun e!460506 () Bool)

(assert (=> d!104879 e!460506))

(declare-fun res!563647 () Bool)

(assert (=> d!104879 (=> (not res!563647) (not e!460506))))

(declare-fun lt!374501 () ListLongMap!8863)

(assert (=> d!104879 (= res!563647 (contains!4161 lt!374501 (_1!5036 lt!374287)))))

(declare-fun lt!374502 () List!15838)

(assert (=> d!104879 (= lt!374501 (ListLongMap!8864 lt!374502))))

(declare-fun lt!374500 () Unit!28307)

(declare-fun lt!374499 () Unit!28307)

(assert (=> d!104879 (= lt!374500 lt!374499)))

(assert (=> d!104879 (= (getValueByKey!405 lt!374502 (_1!5036 lt!374287)) (Some!410 (_2!5036 lt!374287)))))

(assert (=> d!104879 (= lt!374499 (lemmaContainsTupThenGetReturnValue!222 lt!374502 (_1!5036 lt!374287) (_2!5036 lt!374287)))))

(assert (=> d!104879 (= lt!374502 (insertStrictlySorted!261 (toList!4447 lt!374292) (_1!5036 lt!374287) (_2!5036 lt!374287)))))

(assert (=> d!104879 (= (+!1981 lt!374292 lt!374287) lt!374501)))

(declare-fun b!826787 () Bool)

(declare-fun res!563646 () Bool)

(assert (=> b!826787 (=> (not res!563646) (not e!460506))))

(assert (=> b!826787 (= res!563646 (= (getValueByKey!405 (toList!4447 lt!374501) (_1!5036 lt!374287)) (Some!410 (_2!5036 lt!374287))))))

(declare-fun b!826788 () Bool)

(assert (=> b!826788 (= e!460506 (contains!4162 (toList!4447 lt!374501) lt!374287))))

(assert (= (and d!104879 res!563647) b!826787))

(assert (= (and b!826787 res!563646) b!826788))

(declare-fun m!769385 () Bool)

(assert (=> d!104879 m!769385))

(declare-fun m!769387 () Bool)

(assert (=> d!104879 m!769387))

(declare-fun m!769389 () Bool)

(assert (=> d!104879 m!769389))

(declare-fun m!769391 () Bool)

(assert (=> d!104879 m!769391))

(declare-fun m!769393 () Bool)

(assert (=> b!826787 m!769393))

(declare-fun m!769395 () Bool)

(assert (=> b!826788 m!769395))

(assert (=> b!826609 d!104879))

(declare-fun d!104881 () Bool)

(declare-fun e!460507 () Bool)

(assert (=> d!104881 e!460507))

(declare-fun res!563649 () Bool)

(assert (=> d!104881 (=> (not res!563649) (not e!460507))))

(declare-fun lt!374505 () ListLongMap!8863)

(assert (=> d!104881 (= res!563649 (contains!4161 lt!374505 (_1!5036 lt!374296)))))

(declare-fun lt!374506 () List!15838)

(assert (=> d!104881 (= lt!374505 (ListLongMap!8864 lt!374506))))

(declare-fun lt!374504 () Unit!28307)

(declare-fun lt!374503 () Unit!28307)

(assert (=> d!104881 (= lt!374504 lt!374503)))

(assert (=> d!104881 (= (getValueByKey!405 lt!374506 (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296)))))

(assert (=> d!104881 (= lt!374503 (lemmaContainsTupThenGetReturnValue!222 lt!374506 (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104881 (= lt!374506 (insertStrictlySorted!261 (toList!4447 lt!374288) (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104881 (= (+!1981 lt!374288 lt!374296) lt!374505)))

(declare-fun b!826789 () Bool)

(declare-fun res!563648 () Bool)

(assert (=> b!826789 (=> (not res!563648) (not e!460507))))

(assert (=> b!826789 (= res!563648 (= (getValueByKey!405 (toList!4447 lt!374505) (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296))))))

(declare-fun b!826790 () Bool)

(assert (=> b!826790 (= e!460507 (contains!4162 (toList!4447 lt!374505) lt!374296))))

(assert (= (and d!104881 res!563649) b!826789))

(assert (= (and b!826789 res!563648) b!826790))

(declare-fun m!769397 () Bool)

(assert (=> d!104881 m!769397))

(declare-fun m!769399 () Bool)

(assert (=> d!104881 m!769399))

(declare-fun m!769401 () Bool)

(assert (=> d!104881 m!769401))

(declare-fun m!769403 () Bool)

(assert (=> d!104881 m!769403))

(declare-fun m!769405 () Bool)

(assert (=> b!826789 m!769405))

(declare-fun m!769407 () Bool)

(assert (=> b!826790 m!769407))

(assert (=> b!826609 d!104881))

(declare-fun d!104883 () Bool)

(declare-fun e!460508 () Bool)

(assert (=> d!104883 e!460508))

(declare-fun res!563651 () Bool)

(assert (=> d!104883 (=> (not res!563651) (not e!460508))))

(declare-fun lt!374509 () ListLongMap!8863)

(assert (=> d!104883 (= res!563651 (contains!4161 lt!374509 (_1!5036 lt!374289)))))

(declare-fun lt!374510 () List!15838)

(assert (=> d!104883 (= lt!374509 (ListLongMap!8864 lt!374510))))

(declare-fun lt!374508 () Unit!28307)

(declare-fun lt!374507 () Unit!28307)

(assert (=> d!104883 (= lt!374508 lt!374507)))

(assert (=> d!104883 (= (getValueByKey!405 lt!374510 (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289)))))

(assert (=> d!104883 (= lt!374507 (lemmaContainsTupThenGetReturnValue!222 lt!374510 (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104883 (= lt!374510 (insertStrictlySorted!261 (toList!4447 lt!374293) (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104883 (= (+!1981 lt!374293 lt!374289) lt!374509)))

(declare-fun b!826791 () Bool)

(declare-fun res!563650 () Bool)

(assert (=> b!826791 (=> (not res!563650) (not e!460508))))

(assert (=> b!826791 (= res!563650 (= (getValueByKey!405 (toList!4447 lt!374509) (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289))))))

(declare-fun b!826792 () Bool)

(assert (=> b!826792 (= e!460508 (contains!4162 (toList!4447 lt!374509) lt!374289))))

(assert (= (and d!104883 res!563651) b!826791))

(assert (= (and b!826791 res!563650) b!826792))

(declare-fun m!769409 () Bool)

(assert (=> d!104883 m!769409))

(declare-fun m!769411 () Bool)

(assert (=> d!104883 m!769411))

(declare-fun m!769413 () Bool)

(assert (=> d!104883 m!769413))

(declare-fun m!769415 () Bool)

(assert (=> d!104883 m!769415))

(declare-fun m!769417 () Bool)

(assert (=> b!826791 m!769417))

(declare-fun m!769419 () Bool)

(assert (=> b!826792 m!769419))

(assert (=> b!826609 d!104883))

(declare-fun d!104885 () Bool)

(declare-fun e!460509 () Bool)

(assert (=> d!104885 e!460509))

(declare-fun res!563653 () Bool)

(assert (=> d!104885 (=> (not res!563653) (not e!460509))))

(declare-fun lt!374513 () ListLongMap!8863)

(assert (=> d!104885 (= res!563653 (contains!4161 lt!374513 (_1!5036 lt!374289)))))

(declare-fun lt!374514 () List!15838)

(assert (=> d!104885 (= lt!374513 (ListLongMap!8864 lt!374514))))

(declare-fun lt!374512 () Unit!28307)

(declare-fun lt!374511 () Unit!28307)

(assert (=> d!104885 (= lt!374512 lt!374511)))

(assert (=> d!104885 (= (getValueByKey!405 lt!374514 (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289)))))

(assert (=> d!104885 (= lt!374511 (lemmaContainsTupThenGetReturnValue!222 lt!374514 (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104885 (= lt!374514 (insertStrictlySorted!261 (toList!4447 (+!1981 lt!374293 lt!374287)) (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104885 (= (+!1981 (+!1981 lt!374293 lt!374287) lt!374289) lt!374513)))

(declare-fun b!826793 () Bool)

(declare-fun res!563652 () Bool)

(assert (=> b!826793 (=> (not res!563652) (not e!460509))))

(assert (=> b!826793 (= res!563652 (= (getValueByKey!405 (toList!4447 lt!374513) (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289))))))

(declare-fun b!826794 () Bool)

(assert (=> b!826794 (= e!460509 (contains!4162 (toList!4447 lt!374513) lt!374289))))

(assert (= (and d!104885 res!563653) b!826793))

(assert (= (and b!826793 res!563652) b!826794))

(declare-fun m!769421 () Bool)

(assert (=> d!104885 m!769421))

(declare-fun m!769423 () Bool)

(assert (=> d!104885 m!769423))

(declare-fun m!769425 () Bool)

(assert (=> d!104885 m!769425))

(declare-fun m!769427 () Bool)

(assert (=> d!104885 m!769427))

(declare-fun m!769429 () Bool)

(assert (=> b!826793 m!769429))

(declare-fun m!769431 () Bool)

(assert (=> b!826794 m!769431))

(assert (=> b!826609 d!104885))

(declare-fun d!104887 () Bool)

(declare-fun e!460510 () Bool)

(assert (=> d!104887 e!460510))

(declare-fun res!563655 () Bool)

(assert (=> d!104887 (=> (not res!563655) (not e!460510))))

(declare-fun lt!374517 () ListLongMap!8863)

(assert (=> d!104887 (= res!563655 (contains!4161 lt!374517 (_1!5036 lt!374296)))))

(declare-fun lt!374518 () List!15838)

(assert (=> d!104887 (= lt!374517 (ListLongMap!8864 lt!374518))))

(declare-fun lt!374516 () Unit!28307)

(declare-fun lt!374515 () Unit!28307)

(assert (=> d!104887 (= lt!374516 lt!374515)))

(assert (=> d!104887 (= (getValueByKey!405 lt!374518 (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296)))))

(assert (=> d!104887 (= lt!374515 (lemmaContainsTupThenGetReturnValue!222 lt!374518 (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104887 (= lt!374518 (insertStrictlySorted!261 (toList!4447 (+!1981 lt!374284 lt!374289)) (_1!5036 lt!374296) (_2!5036 lt!374296)))))

(assert (=> d!104887 (= (+!1981 (+!1981 lt!374284 lt!374289) lt!374296) lt!374517)))

(declare-fun b!826795 () Bool)

(declare-fun res!563654 () Bool)

(assert (=> b!826795 (=> (not res!563654) (not e!460510))))

(assert (=> b!826795 (= res!563654 (= (getValueByKey!405 (toList!4447 lt!374517) (_1!5036 lt!374296)) (Some!410 (_2!5036 lt!374296))))))

(declare-fun b!826796 () Bool)

(assert (=> b!826796 (= e!460510 (contains!4162 (toList!4447 lt!374517) lt!374296))))

(assert (= (and d!104887 res!563655) b!826795))

(assert (= (and b!826795 res!563654) b!826796))

(declare-fun m!769433 () Bool)

(assert (=> d!104887 m!769433))

(declare-fun m!769435 () Bool)

(assert (=> d!104887 m!769435))

(declare-fun m!769437 () Bool)

(assert (=> d!104887 m!769437))

(declare-fun m!769439 () Bool)

(assert (=> d!104887 m!769439))

(declare-fun m!769441 () Bool)

(assert (=> b!826795 m!769441))

(declare-fun m!769443 () Bool)

(assert (=> b!826796 m!769443))

(assert (=> b!826610 d!104887))

(declare-fun d!104889 () Bool)

(declare-fun e!460511 () Bool)

(assert (=> d!104889 e!460511))

(declare-fun res!563657 () Bool)

(assert (=> d!104889 (=> (not res!563657) (not e!460511))))

(declare-fun lt!374521 () ListLongMap!8863)

(assert (=> d!104889 (= res!563657 (contains!4161 lt!374521 (_1!5036 lt!374289)))))

(declare-fun lt!374522 () List!15838)

(assert (=> d!104889 (= lt!374521 (ListLongMap!8864 lt!374522))))

(declare-fun lt!374520 () Unit!28307)

(declare-fun lt!374519 () Unit!28307)

(assert (=> d!104889 (= lt!374520 lt!374519)))

(assert (=> d!104889 (= (getValueByKey!405 lt!374522 (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289)))))

(assert (=> d!104889 (= lt!374519 (lemmaContainsTupThenGetReturnValue!222 lt!374522 (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104889 (= lt!374522 (insertStrictlySorted!261 (toList!4447 lt!374284) (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104889 (= (+!1981 lt!374284 lt!374289) lt!374521)))

(declare-fun b!826797 () Bool)

(declare-fun res!563656 () Bool)

(assert (=> b!826797 (=> (not res!563656) (not e!460511))))

(assert (=> b!826797 (= res!563656 (= (getValueByKey!405 (toList!4447 lt!374521) (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289))))))

(declare-fun b!826798 () Bool)

(assert (=> b!826798 (= e!460511 (contains!4162 (toList!4447 lt!374521) lt!374289))))

(assert (= (and d!104889 res!563657) b!826797))

(assert (= (and b!826797 res!563656) b!826798))

(declare-fun m!769445 () Bool)

(assert (=> d!104889 m!769445))

(declare-fun m!769447 () Bool)

(assert (=> d!104889 m!769447))

(declare-fun m!769449 () Bool)

(assert (=> d!104889 m!769449))

(declare-fun m!769451 () Bool)

(assert (=> d!104889 m!769451))

(declare-fun m!769453 () Bool)

(assert (=> b!826797 m!769453))

(declare-fun m!769455 () Bool)

(assert (=> b!826798 m!769455))

(assert (=> b!826610 d!104889))

(declare-fun d!104891 () Bool)

(declare-fun e!460512 () Bool)

(assert (=> d!104891 e!460512))

(declare-fun res!563659 () Bool)

(assert (=> d!104891 (=> (not res!563659) (not e!460512))))

(declare-fun lt!374525 () ListLongMap!8863)

(assert (=> d!104891 (= res!563659 (contains!4161 lt!374525 (_1!5036 lt!374289)))))

(declare-fun lt!374526 () List!15838)

(assert (=> d!104891 (= lt!374525 (ListLongMap!8864 lt!374526))))

(declare-fun lt!374524 () Unit!28307)

(declare-fun lt!374523 () Unit!28307)

(assert (=> d!104891 (= lt!374524 lt!374523)))

(assert (=> d!104891 (= (getValueByKey!405 lt!374526 (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289)))))

(assert (=> d!104891 (= lt!374523 (lemmaContainsTupThenGetReturnValue!222 lt!374526 (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104891 (= lt!374526 (insertStrictlySorted!261 (toList!4447 (+!1981 lt!374284 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5036 lt!374289) (_2!5036 lt!374289)))))

(assert (=> d!104891 (= (+!1981 (+!1981 lt!374284 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374289) lt!374525)))

(declare-fun b!826799 () Bool)

(declare-fun res!563658 () Bool)

(assert (=> b!826799 (=> (not res!563658) (not e!460512))))

(assert (=> b!826799 (= res!563658 (= (getValueByKey!405 (toList!4447 lt!374525) (_1!5036 lt!374289)) (Some!410 (_2!5036 lt!374289))))))

(declare-fun b!826800 () Bool)

(assert (=> b!826800 (= e!460512 (contains!4162 (toList!4447 lt!374525) lt!374289))))

(assert (= (and d!104891 res!563659) b!826799))

(assert (= (and b!826799 res!563658) b!826800))

(declare-fun m!769457 () Bool)

(assert (=> d!104891 m!769457))

(declare-fun m!769459 () Bool)

(assert (=> d!104891 m!769459))

(declare-fun m!769461 () Bool)

(assert (=> d!104891 m!769461))

(declare-fun m!769463 () Bool)

(assert (=> d!104891 m!769463))

(declare-fun m!769465 () Bool)

(assert (=> b!826799 m!769465))

(declare-fun m!769467 () Bool)

(assert (=> b!826800 m!769467))

(assert (=> b!826608 d!104891))

(declare-fun d!104893 () Bool)

(declare-fun e!460513 () Bool)

(assert (=> d!104893 e!460513))

(declare-fun res!563661 () Bool)

(assert (=> d!104893 (=> (not res!563661) (not e!460513))))

(declare-fun lt!374529 () ListLongMap!8863)

(assert (=> d!104893 (= res!563661 (contains!4161 lt!374529 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!374530 () List!15838)

(assert (=> d!104893 (= lt!374529 (ListLongMap!8864 lt!374530))))

(declare-fun lt!374528 () Unit!28307)

(declare-fun lt!374527 () Unit!28307)

(assert (=> d!104893 (= lt!374528 lt!374527)))

(assert (=> d!104893 (= (getValueByKey!405 lt!374530 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!410 (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104893 (= lt!374527 (lemmaContainsTupThenGetReturnValue!222 lt!374530 (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104893 (= lt!374530 (insertStrictlySorted!261 (toList!4447 lt!374284) (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104893 (= (+!1981 lt!374284 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374529)))

(declare-fun b!826801 () Bool)

(declare-fun res!563660 () Bool)

(assert (=> b!826801 (=> (not res!563660) (not e!460513))))

(assert (=> b!826801 (= res!563660 (= (getValueByKey!405 (toList!4447 lt!374529) (_1!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!410 (_2!5036 (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!826802 () Bool)

(assert (=> b!826802 (= e!460513 (contains!4162 (toList!4447 lt!374529) (tuple2!10051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104893 res!563661) b!826801))

(assert (= (and b!826801 res!563660) b!826802))

(declare-fun m!769469 () Bool)

(assert (=> d!104893 m!769469))

(declare-fun m!769471 () Bool)

(assert (=> d!104893 m!769471))

(declare-fun m!769473 () Bool)

(assert (=> d!104893 m!769473))

(declare-fun m!769475 () Bool)

(assert (=> d!104893 m!769475))

(declare-fun m!769477 () Bool)

(assert (=> b!826801 m!769477))

(declare-fun m!769479 () Bool)

(assert (=> b!826802 m!769479))

(assert (=> b!826608 d!104893))

(declare-fun b!826813 () Bool)

(declare-fun e!460525 () Bool)

(declare-fun e!460524 () Bool)

(assert (=> b!826813 (= e!460525 e!460524)))

(declare-fun c!89436 () Bool)

(assert (=> b!826813 (= c!89436 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826814 () Bool)

(declare-fun e!460522 () Bool)

(assert (=> b!826814 (= e!460522 e!460525)))

(declare-fun res!563668 () Bool)

(assert (=> b!826814 (=> (not res!563668) (not e!460525))))

(declare-fun e!460523 () Bool)

(assert (=> b!826814 (= res!563668 (not e!460523))))

(declare-fun res!563670 () Bool)

(assert (=> b!826814 (=> (not res!563670) (not e!460523))))

(assert (=> b!826814 (= res!563670 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104895 () Bool)

(declare-fun res!563669 () Bool)

(assert (=> d!104895 (=> res!563669 e!460522)))

(assert (=> d!104895 (= res!563669 (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104895 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15836) e!460522)))

(declare-fun b!826815 () Bool)

(declare-fun call!35916 () Bool)

(assert (=> b!826815 (= e!460524 call!35916)))

(declare-fun b!826816 () Bool)

(assert (=> b!826816 (= e!460524 call!35916)))

(declare-fun bm!35913 () Bool)

(assert (=> bm!35913 (= call!35916 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89436 (Cons!15835 (select (arr!22171 _keys!976) #b00000000000000000000000000000000) Nil!15836) Nil!15836)))))

(declare-fun b!826817 () Bool)

(declare-fun contains!4163 (List!15839 (_ BitVec 64)) Bool)

(assert (=> b!826817 (= e!460523 (contains!4163 Nil!15836 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104895 (not res!563669)) b!826814))

(assert (= (and b!826814 res!563670) b!826817))

(assert (= (and b!826814 res!563668) b!826813))

(assert (= (and b!826813 c!89436) b!826816))

(assert (= (and b!826813 (not c!89436)) b!826815))

(assert (= (or b!826816 b!826815) bm!35913))

(assert (=> b!826813 m!769219))

(assert (=> b!826813 m!769219))

(assert (=> b!826813 m!769229))

(assert (=> b!826814 m!769219))

(assert (=> b!826814 m!769219))

(assert (=> b!826814 m!769229))

(assert (=> bm!35913 m!769219))

(declare-fun m!769481 () Bool)

(assert (=> bm!35913 m!769481))

(assert (=> b!826817 m!769219))

(assert (=> b!826817 m!769219))

(declare-fun m!769483 () Bool)

(assert (=> b!826817 m!769483))

(assert (=> b!826605 d!104895))

(declare-fun d!104897 () Bool)

(assert (=> d!104897 (= (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374533 () Unit!28307)

(declare-fun choose!1417 (array!46251 array!46253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25075 V!25075 V!25075 V!25075 (_ BitVec 32) Int) Unit!28307)

(assert (=> d!104897 (= lt!374533 (choose!1417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104897 (validMask!0 mask!1312)))

(assert (=> d!104897 (= (lemmaNoChangeToArrayThenSameMapNoExtras!572 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374533)))

(declare-fun bs!23069 () Bool)

(assert (= bs!23069 d!104897))

(assert (=> bs!23069 m!769081))

(assert (=> bs!23069 m!769079))

(declare-fun m!769485 () Bool)

(assert (=> bs!23069 m!769485))

(assert (=> bs!23069 m!769085))

(assert (=> b!826600 d!104897))

(declare-fun b!826842 () Bool)

(declare-fun lt!374552 () Unit!28307)

(declare-fun lt!374553 () Unit!28307)

(assert (=> b!826842 (= lt!374552 lt!374553)))

(declare-fun lt!374551 () (_ BitVec 64))

(declare-fun lt!374549 () V!25075)

(declare-fun lt!374550 () ListLongMap!8863)

(declare-fun lt!374554 () (_ BitVec 64))

(assert (=> b!826842 (not (contains!4161 (+!1981 lt!374550 (tuple2!10051 lt!374554 lt!374549)) lt!374551))))

(declare-fun addStillNotContains!189 (ListLongMap!8863 (_ BitVec 64) V!25075 (_ BitVec 64)) Unit!28307)

(assert (=> b!826842 (= lt!374553 (addStillNotContains!189 lt!374550 lt!374554 lt!374549 lt!374551))))

(assert (=> b!826842 (= lt!374551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826842 (= lt!374549 (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826842 (= lt!374554 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35919 () ListLongMap!8863)

(assert (=> b!826842 (= lt!374550 call!35919)))

(declare-fun e!460546 () ListLongMap!8863)

(assert (=> b!826842 (= e!460546 (+!1981 call!35919 (tuple2!10051 (select (arr!22171 _keys!976) #b00000000000000000000000000000000) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!826843 () Bool)

(declare-fun e!460542 () Bool)

(declare-fun lt!374548 () ListLongMap!8863)

(assert (=> b!826843 (= e!460542 (= lt!374548 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826844 () Bool)

(assert (=> b!826844 (= e!460546 call!35919)))

(declare-fun b!826845 () Bool)

(declare-fun e!460540 () Bool)

(assert (=> b!826845 (= e!460540 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826845 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826846 () Bool)

(declare-fun isEmpty!650 (ListLongMap!8863) Bool)

(assert (=> b!826846 (= e!460542 (isEmpty!650 lt!374548))))

(declare-fun bm!35916 () Bool)

(assert (=> bm!35916 (= call!35919 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826847 () Bool)

(assert (=> b!826847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> b!826847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22593 _values!788)))))

(declare-fun e!460544 () Bool)

(assert (=> b!826847 (= e!460544 (= (apply!363 lt!374548 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826848 () Bool)

(declare-fun e!460543 () Bool)

(assert (=> b!826848 (= e!460543 e!460542)))

(declare-fun c!89445 () Bool)

(assert (=> b!826848 (= c!89445 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826849 () Bool)

(declare-fun e!460541 () ListLongMap!8863)

(assert (=> b!826849 (= e!460541 e!460546)))

(declare-fun c!89447 () Bool)

(assert (=> b!826849 (= c!89447 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826851 () Bool)

(declare-fun e!460545 () Bool)

(assert (=> b!826851 (= e!460545 e!460543)))

(declare-fun c!89446 () Bool)

(assert (=> b!826851 (= c!89446 e!460540)))

(declare-fun res!563682 () Bool)

(assert (=> b!826851 (=> (not res!563682) (not e!460540))))

(assert (=> b!826851 (= res!563682 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826852 () Bool)

(declare-fun res!563681 () Bool)

(assert (=> b!826852 (=> (not res!563681) (not e!460545))))

(assert (=> b!826852 (= res!563681 (not (contains!4161 lt!374548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!826853 () Bool)

(assert (=> b!826853 (= e!460541 (ListLongMap!8864 Nil!15835))))

(declare-fun d!104899 () Bool)

(assert (=> d!104899 e!460545))

(declare-fun res!563679 () Bool)

(assert (=> d!104899 (=> (not res!563679) (not e!460545))))

(assert (=> d!104899 (= res!563679 (not (contains!4161 lt!374548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104899 (= lt!374548 e!460541)))

(declare-fun c!89448 () Bool)

(assert (=> d!104899 (= c!89448 (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104899 (validMask!0 mask!1312)))

(assert (=> d!104899 (= (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374548)))

(declare-fun b!826850 () Bool)

(assert (=> b!826850 (= e!460543 e!460544)))

(assert (=> b!826850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun res!563680 () Bool)

(assert (=> b!826850 (= res!563680 (contains!4161 lt!374548 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826850 (=> (not res!563680) (not e!460544))))

(assert (= (and d!104899 c!89448) b!826853))

(assert (= (and d!104899 (not c!89448)) b!826849))

(assert (= (and b!826849 c!89447) b!826842))

(assert (= (and b!826849 (not c!89447)) b!826844))

(assert (= (or b!826842 b!826844) bm!35916))

(assert (= (and d!104899 res!563679) b!826852))

(assert (= (and b!826852 res!563681) b!826851))

(assert (= (and b!826851 res!563682) b!826845))

(assert (= (and b!826851 c!89446) b!826850))

(assert (= (and b!826851 (not c!89446)) b!826848))

(assert (= (and b!826850 res!563680) b!826847))

(assert (= (and b!826848 c!89445) b!826843))

(assert (= (and b!826848 (not c!89445)) b!826846))

(declare-fun b_lambda!11125 () Bool)

(assert (=> (not b_lambda!11125) (not b!826842)))

(assert (=> b!826842 t!22180))

(declare-fun b_and!22255 () Bool)

(assert (= b_and!22253 (and (=> t!22180 result!7953) b_and!22255)))

(declare-fun b_lambda!11127 () Bool)

(assert (=> (not b_lambda!11127) (not b!826847)))

(assert (=> b!826847 t!22180))

(declare-fun b_and!22257 () Bool)

(assert (= b_and!22255 (and (=> t!22180 result!7953) b_and!22257)))

(declare-fun m!769487 () Bool)

(assert (=> bm!35916 m!769487))

(assert (=> b!826849 m!769219))

(assert (=> b!826849 m!769219))

(assert (=> b!826849 m!769229))

(assert (=> b!826843 m!769487))

(declare-fun m!769489 () Bool)

(assert (=> d!104899 m!769489))

(assert (=> d!104899 m!769085))

(declare-fun m!769491 () Bool)

(assert (=> b!826846 m!769491))

(assert (=> b!826847 m!769283))

(assert (=> b!826847 m!769281))

(assert (=> b!826847 m!769285))

(assert (=> b!826847 m!769281))

(assert (=> b!826847 m!769219))

(assert (=> b!826847 m!769283))

(assert (=> b!826847 m!769219))

(declare-fun m!769493 () Bool)

(assert (=> b!826847 m!769493))

(assert (=> b!826845 m!769219))

(assert (=> b!826845 m!769219))

(assert (=> b!826845 m!769229))

(assert (=> b!826842 m!769283))

(assert (=> b!826842 m!769281))

(assert (=> b!826842 m!769285))

(assert (=> b!826842 m!769281))

(declare-fun m!769495 () Bool)

(assert (=> b!826842 m!769495))

(declare-fun m!769497 () Bool)

(assert (=> b!826842 m!769497))

(assert (=> b!826842 m!769219))

(assert (=> b!826842 m!769495))

(declare-fun m!769499 () Bool)

(assert (=> b!826842 m!769499))

(assert (=> b!826842 m!769283))

(declare-fun m!769501 () Bool)

(assert (=> b!826842 m!769501))

(assert (=> b!826850 m!769219))

(assert (=> b!826850 m!769219))

(declare-fun m!769503 () Bool)

(assert (=> b!826850 m!769503))

(declare-fun m!769505 () Bool)

(assert (=> b!826852 m!769505))

(assert (=> b!826600 d!104899))

(declare-fun b!826854 () Bool)

(declare-fun lt!374559 () Unit!28307)

(declare-fun lt!374560 () Unit!28307)

(assert (=> b!826854 (= lt!374559 lt!374560)))

(declare-fun lt!374557 () ListLongMap!8863)

(declare-fun lt!374561 () (_ BitVec 64))

(declare-fun lt!374556 () V!25075)

(declare-fun lt!374558 () (_ BitVec 64))

(assert (=> b!826854 (not (contains!4161 (+!1981 lt!374557 (tuple2!10051 lt!374561 lt!374556)) lt!374558))))

(assert (=> b!826854 (= lt!374560 (addStillNotContains!189 lt!374557 lt!374561 lt!374556 lt!374558))))

(assert (=> b!826854 (= lt!374558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826854 (= lt!374556 (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826854 (= lt!374561 (select (arr!22171 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35920 () ListLongMap!8863)

(assert (=> b!826854 (= lt!374557 call!35920)))

(declare-fun e!460553 () ListLongMap!8863)

(assert (=> b!826854 (= e!460553 (+!1981 call!35920 (tuple2!10051 (select (arr!22171 _keys!976) #b00000000000000000000000000000000) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!374555 () ListLongMap!8863)

(declare-fun e!460549 () Bool)

(declare-fun b!826855 () Bool)

(assert (=> b!826855 (= e!460549 (= lt!374555 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826856 () Bool)

(assert (=> b!826856 (= e!460553 call!35920)))

(declare-fun b!826857 () Bool)

(declare-fun e!460547 () Bool)

(assert (=> b!826857 (= e!460547 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826857 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826858 () Bool)

(assert (=> b!826858 (= e!460549 (isEmpty!650 lt!374555))))

(declare-fun bm!35917 () Bool)

(assert (=> bm!35917 (= call!35920 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826859 () Bool)

(assert (=> b!826859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> b!826859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22593 _values!788)))))

(declare-fun e!460551 () Bool)

(assert (=> b!826859 (= e!460551 (= (apply!363 lt!374555 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)) (get!11764 (select (arr!22172 _values!788) #b00000000000000000000000000000000) (dynLambda!977 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826860 () Bool)

(declare-fun e!460550 () Bool)

(assert (=> b!826860 (= e!460550 e!460549)))

(declare-fun c!89449 () Bool)

(assert (=> b!826860 (= c!89449 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826861 () Bool)

(declare-fun e!460548 () ListLongMap!8863)

(assert (=> b!826861 (= e!460548 e!460553)))

(declare-fun c!89451 () Bool)

(assert (=> b!826861 (= c!89451 (validKeyInArray!0 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826863 () Bool)

(declare-fun e!460552 () Bool)

(assert (=> b!826863 (= e!460552 e!460550)))

(declare-fun c!89450 () Bool)

(assert (=> b!826863 (= c!89450 e!460547)))

(declare-fun res!563686 () Bool)

(assert (=> b!826863 (=> (not res!563686) (not e!460547))))

(assert (=> b!826863 (= res!563686 (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun b!826864 () Bool)

(declare-fun res!563685 () Bool)

(assert (=> b!826864 (=> (not res!563685) (not e!460552))))

(assert (=> b!826864 (= res!563685 (not (contains!4161 lt!374555 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!826865 () Bool)

(assert (=> b!826865 (= e!460548 (ListLongMap!8864 Nil!15835))))

(declare-fun d!104901 () Bool)

(assert (=> d!104901 e!460552))

(declare-fun res!563683 () Bool)

(assert (=> d!104901 (=> (not res!563683) (not e!460552))))

(assert (=> d!104901 (= res!563683 (not (contains!4161 lt!374555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104901 (= lt!374555 e!460548)))

(declare-fun c!89452 () Bool)

(assert (=> d!104901 (= c!89452 (bvsge #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(assert (=> d!104901 (validMask!0 mask!1312)))

(assert (=> d!104901 (= (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374555)))

(declare-fun b!826862 () Bool)

(assert (=> b!826862 (= e!460550 e!460551)))

(assert (=> b!826862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22592 _keys!976)))))

(declare-fun res!563684 () Bool)

(assert (=> b!826862 (= res!563684 (contains!4161 lt!374555 (select (arr!22171 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826862 (=> (not res!563684) (not e!460551))))

(assert (= (and d!104901 c!89452) b!826865))

(assert (= (and d!104901 (not c!89452)) b!826861))

(assert (= (and b!826861 c!89451) b!826854))

(assert (= (and b!826861 (not c!89451)) b!826856))

(assert (= (or b!826854 b!826856) bm!35917))

(assert (= (and d!104901 res!563683) b!826864))

(assert (= (and b!826864 res!563685) b!826863))

(assert (= (and b!826863 res!563686) b!826857))

(assert (= (and b!826863 c!89450) b!826862))

(assert (= (and b!826863 (not c!89450)) b!826860))

(assert (= (and b!826862 res!563684) b!826859))

(assert (= (and b!826860 c!89449) b!826855))

(assert (= (and b!826860 (not c!89449)) b!826858))

(declare-fun b_lambda!11129 () Bool)

(assert (=> (not b_lambda!11129) (not b!826854)))

(assert (=> b!826854 t!22180))

(declare-fun b_and!22259 () Bool)

(assert (= b_and!22257 (and (=> t!22180 result!7953) b_and!22259)))

(declare-fun b_lambda!11131 () Bool)

(assert (=> (not b_lambda!11131) (not b!826859)))

(assert (=> b!826859 t!22180))

(declare-fun b_and!22261 () Bool)

(assert (= b_and!22259 (and (=> t!22180 result!7953) b_and!22261)))

(declare-fun m!769507 () Bool)

(assert (=> bm!35917 m!769507))

(assert (=> b!826861 m!769219))

(assert (=> b!826861 m!769219))

(assert (=> b!826861 m!769229))

(assert (=> b!826855 m!769507))

(declare-fun m!769509 () Bool)

(assert (=> d!104901 m!769509))

(assert (=> d!104901 m!769085))

(declare-fun m!769511 () Bool)

(assert (=> b!826858 m!769511))

(assert (=> b!826859 m!769283))

(assert (=> b!826859 m!769281))

(assert (=> b!826859 m!769285))

(assert (=> b!826859 m!769281))

(assert (=> b!826859 m!769219))

(assert (=> b!826859 m!769283))

(assert (=> b!826859 m!769219))

(declare-fun m!769513 () Bool)

(assert (=> b!826859 m!769513))

(assert (=> b!826857 m!769219))

(assert (=> b!826857 m!769219))

(assert (=> b!826857 m!769229))

(assert (=> b!826854 m!769283))

(assert (=> b!826854 m!769281))

(assert (=> b!826854 m!769285))

(assert (=> b!826854 m!769281))

(declare-fun m!769515 () Bool)

(assert (=> b!826854 m!769515))

(declare-fun m!769517 () Bool)

(assert (=> b!826854 m!769517))

(assert (=> b!826854 m!769219))

(assert (=> b!826854 m!769515))

(declare-fun m!769519 () Bool)

(assert (=> b!826854 m!769519))

(assert (=> b!826854 m!769283))

(declare-fun m!769521 () Bool)

(assert (=> b!826854 m!769521))

(assert (=> b!826862 m!769219))

(assert (=> b!826862 m!769219))

(declare-fun m!769523 () Bool)

(assert (=> b!826862 m!769523))

(declare-fun m!769525 () Bool)

(assert (=> b!826864 m!769525))

(assert (=> b!826600 d!104901))

(declare-fun d!104903 () Bool)

(assert (=> d!104903 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71158 d!104903))

(declare-fun d!104905 () Bool)

(assert (=> d!104905 (= (array_inv!17739 _keys!976) (bvsge (size!22592 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71158 d!104905))

(declare-fun d!104907 () Bool)

(assert (=> d!104907 (= (array_inv!17740 _values!788) (bvsge (size!22593 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71158 d!104907))

(declare-fun condMapEmpty!24217 () Bool)

(declare-fun mapDefault!24217 () ValueCell!7112)

(assert (=> mapNonEmpty!24208 (= condMapEmpty!24217 (= mapRest!24208 ((as const (Array (_ BitVec 32) ValueCell!7112)) mapDefault!24217)))))

(declare-fun e!460559 () Bool)

(declare-fun mapRes!24217 () Bool)

(assert (=> mapNonEmpty!24208 (= tp!46795 (and e!460559 mapRes!24217))))

(declare-fun b!826872 () Bool)

(declare-fun e!460558 () Bool)

(assert (=> b!826872 (= e!460558 tp_is_empty!15055)))

(declare-fun mapIsEmpty!24217 () Bool)

(assert (=> mapIsEmpty!24217 mapRes!24217))

(declare-fun mapNonEmpty!24217 () Bool)

(declare-fun tp!46810 () Bool)

(assert (=> mapNonEmpty!24217 (= mapRes!24217 (and tp!46810 e!460558))))

(declare-fun mapRest!24217 () (Array (_ BitVec 32) ValueCell!7112))

(declare-fun mapValue!24217 () ValueCell!7112)

(declare-fun mapKey!24217 () (_ BitVec 32))

(assert (=> mapNonEmpty!24217 (= mapRest!24208 (store mapRest!24217 mapKey!24217 mapValue!24217))))

(declare-fun b!826873 () Bool)

(assert (=> b!826873 (= e!460559 tp_is_empty!15055)))

(assert (= (and mapNonEmpty!24208 condMapEmpty!24217) mapIsEmpty!24217))

(assert (= (and mapNonEmpty!24208 (not condMapEmpty!24217)) mapNonEmpty!24217))

(assert (= (and mapNonEmpty!24217 ((_ is ValueCellFull!7112) mapValue!24217)) b!826872))

(assert (= (and mapNonEmpty!24208 ((_ is ValueCellFull!7112) mapDefault!24217)) b!826873))

(declare-fun m!769527 () Bool)

(assert (=> mapNonEmpty!24217 m!769527))

(declare-fun b_lambda!11133 () Bool)

(assert (= b_lambda!11129 (or (and start!71158 b_free!13345) b_lambda!11133)))

(declare-fun b_lambda!11135 () Bool)

(assert (= b_lambda!11123 (or (and start!71158 b_free!13345) b_lambda!11135)))

(declare-fun b_lambda!11137 () Bool)

(assert (= b_lambda!11131 (or (and start!71158 b_free!13345) b_lambda!11137)))

(declare-fun b_lambda!11139 () Bool)

(assert (= b_lambda!11127 (or (and start!71158 b_free!13345) b_lambda!11139)))

(declare-fun b_lambda!11141 () Bool)

(assert (= b_lambda!11125 (or (and start!71158 b_free!13345) b_lambda!11141)))

(declare-fun b_lambda!11143 () Bool)

(assert (= b_lambda!11121 (or (and start!71158 b_free!13345) b_lambda!11143)))

(check-sat (not bm!35907) (not b!826775) (not b_lambda!11133) (not d!104867) (not b!826766) (not d!104901) (not b!826791) (not b!826801) (not b!826792) (not b!826787) (not b!826693) (not b!826774) (not mapNonEmpty!24217) (not bm!35900) (not bm!35908) (not b!826789) (not b!826743) (not b!826749) (not b!826800) (not b!826748) (not d!104893) (not b!826845) (not b!826864) (not b!826861) (not b!826697) (not b!826813) (not b!826849) (not b!826686) (not bm!35913) (not b_lambda!11137) (not b!826802) (not d!104897) (not b_lambda!11143) (not d!104883) (not b!826771) (not bm!35916) (not b!826796) (not b!826759) (not d!104869) (not b!826751) (not b!826846) (not d!104881) (not d!104875) (not b!826857) (not b!826859) (not d!104889) (not d!104873) (not b!826698) (not b!826700) (not b!826781) (not d!104879) (not b!826798) (not d!104891) (not b!826788) (not b!826797) (not d!104871) (not b!826699) (not d!104899) (not b!826850) (not b!826758) tp_is_empty!15055 (not bm!35917) (not b!826854) (not b!826793) (not d!104885) (not b!826862) (not bm!35910) (not b!826795) (not b!826695) (not b!826794) (not b!826772) (not b!826782) (not b!826847) (not b_lambda!11141) (not b_lambda!11139) (not d!104887) (not b!826799) (not b!826814) (not b_lambda!11135) (not bm!35902) (not b!826694) (not b!826842) b_and!22261 (not d!104865) (not bm!35903) (not b!826817) (not bm!35909) (not b!826855) (not b!826852) (not b!826752) (not b!826790) (not bm!35882) (not bm!35901) (not d!104877) (not b!826745) (not b!826858) (not b_next!13345) (not b!826843) (not b!826768) (not b!826687) (not b!826696))
(check-sat b_and!22261 (not b_next!13345))
