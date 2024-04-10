; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113464 () Bool)

(assert start!113464)

(declare-fun b_free!31515 () Bool)

(declare-fun b_next!31515 () Bool)

(assert (=> start!113464 (= b_free!31515 (not b_next!31515))))

(declare-fun tp!110350 () Bool)

(declare-fun b_and!50805 () Bool)

(assert (=> start!113464 (= tp!110350 b_and!50805)))

(declare-fun b!1347043 () Bool)

(declare-fun res!893846 () Bool)

(declare-fun e!766421 () Bool)

(assert (=> b!1347043 (=> (not res!893846) (not e!766421))))

(declare-datatypes ((array!91862 0))(
  ( (array!91863 (arr!44387 (Array (_ BitVec 32) (_ BitVec 64))) (size!44937 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91862)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347043 (= res!893846 (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)))))

(declare-fun b!1347044 () Bool)

(declare-fun res!893848 () Bool)

(assert (=> b!1347044 (=> (not res!893848) (not e!766421))))

(declare-datatypes ((List!31433 0))(
  ( (Nil!31430) (Cons!31429 (h!32638 (_ BitVec 64)) (t!46027 List!31433)) )
))
(declare-fun arrayNoDuplicates!0 (array!91862 (_ BitVec 32) List!31433) Bool)

(assert (=> b!1347044 (= res!893848 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31430))))

(declare-fun mapNonEmpty!57979 () Bool)

(declare-fun mapRes!57979 () Bool)

(declare-fun tp!110349 () Bool)

(declare-fun e!766423 () Bool)

(assert (=> mapNonEmpty!57979 (= mapRes!57979 (and tp!110349 e!766423))))

(declare-fun mapKey!57979 () (_ BitVec 32))

(declare-datatypes ((V!55123 0))(
  ( (V!55124 (val!18832 Int)) )
))
(declare-datatypes ((ValueCell!17859 0))(
  ( (ValueCellFull!17859 (v!21480 V!55123)) (EmptyCell!17859) )
))
(declare-fun mapRest!57979 () (Array (_ BitVec 32) ValueCell!17859))

(declare-fun mapValue!57979 () ValueCell!17859)

(declare-datatypes ((array!91864 0))(
  ( (array!91865 (arr!44388 (Array (_ BitVec 32) ValueCell!17859)) (size!44938 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91864)

(assert (=> mapNonEmpty!57979 (= (arr!44388 _values!1303) (store mapRest!57979 mapKey!57979 mapValue!57979))))

(declare-fun b!1347045 () Bool)

(declare-fun res!893853 () Bool)

(assert (=> b!1347045 (=> (not res!893853) (not e!766421))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347045 (= res!893853 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347046 () Bool)

(declare-fun e!766424 () Bool)

(declare-fun e!766422 () Bool)

(assert (=> b!1347046 (= e!766424 (and e!766422 mapRes!57979))))

(declare-fun condMapEmpty!57979 () Bool)

(declare-fun mapDefault!57979 () ValueCell!17859)

(assert (=> b!1347046 (= condMapEmpty!57979 (= (arr!44388 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17859)) mapDefault!57979)))))

(declare-fun b!1347047 () Bool)

(declare-fun res!893847 () Bool)

(assert (=> b!1347047 (=> (not res!893847) (not e!766421))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1347047 (= res!893847 (and (= (size!44938 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44937 _keys!1571) (size!44938 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347048 () Bool)

(declare-fun tp_is_empty!37515 () Bool)

(assert (=> b!1347048 (= e!766422 tp_is_empty!37515)))

(declare-fun b!1347049 () Bool)

(declare-fun res!893852 () Bool)

(assert (=> b!1347049 (=> (not res!893852) (not e!766421))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1347049 (= res!893852 (not (= (select (arr!44387 _keys!1571) from!1960) k0!1142)))))

(declare-fun minValue!1245 () V!55123)

(declare-fun b!1347050 () Bool)

(declare-fun zeroValue!1245 () V!55123)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24278 0))(
  ( (tuple2!24279 (_1!12150 (_ BitVec 64)) (_2!12150 V!55123)) )
))
(declare-datatypes ((List!31434 0))(
  ( (Nil!31431) (Cons!31430 (h!32639 tuple2!24278) (t!46028 List!31434)) )
))
(declare-datatypes ((ListLongMap!21935 0))(
  ( (ListLongMap!21936 (toList!10983 List!31434)) )
))
(declare-fun contains!9159 (ListLongMap!21935 (_ BitVec 64)) Bool)

(declare-fun +!4838 (ListLongMap!21935 tuple2!24278) ListLongMap!21935)

(declare-fun getCurrentListMapNoExtraKeys!6484 (array!91862 array!91864 (_ BitVec 32) (_ BitVec 32) V!55123 V!55123 (_ BitVec 32) Int) ListLongMap!21935)

(declare-fun get!22415 (ValueCell!17859 V!55123) V!55123)

(declare-fun dynLambda!3777 (Int (_ BitVec 64)) V!55123)

(assert (=> b!1347050 (= e!766421 (not (contains!9159 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))))

(declare-fun mapIsEmpty!57979 () Bool)

(assert (=> mapIsEmpty!57979 mapRes!57979))

(declare-fun res!893851 () Bool)

(assert (=> start!113464 (=> (not res!893851) (not e!766421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113464 (= res!893851 (validMask!0 mask!1977))))

(assert (=> start!113464 e!766421))

(assert (=> start!113464 tp_is_empty!37515))

(assert (=> start!113464 true))

(declare-fun array_inv!33441 (array!91862) Bool)

(assert (=> start!113464 (array_inv!33441 _keys!1571)))

(declare-fun array_inv!33442 (array!91864) Bool)

(assert (=> start!113464 (and (array_inv!33442 _values!1303) e!766424)))

(assert (=> start!113464 tp!110350))

(declare-fun b!1347051 () Bool)

(assert (=> b!1347051 (= e!766423 tp_is_empty!37515)))

(declare-fun b!1347052 () Bool)

(declare-fun res!893850 () Bool)

(assert (=> b!1347052 (=> (not res!893850) (not e!766421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91862 (_ BitVec 32)) Bool)

(assert (=> b!1347052 (= res!893850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347053 () Bool)

(declare-fun res!893845 () Bool)

(assert (=> b!1347053 (=> (not res!893845) (not e!766421))))

(declare-fun getCurrentListMap!5934 (array!91862 array!91864 (_ BitVec 32) (_ BitVec 32) V!55123 V!55123 (_ BitVec 32) Int) ListLongMap!21935)

(assert (=> b!1347053 (= res!893845 (contains!9159 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347054 () Bool)

(declare-fun res!893849 () Bool)

(assert (=> b!1347054 (=> (not res!893849) (not e!766421))))

(assert (=> b!1347054 (= res!893849 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113464 res!893851) b!1347047))

(assert (= (and b!1347047 res!893847) b!1347052))

(assert (= (and b!1347052 res!893850) b!1347044))

(assert (= (and b!1347044 res!893848) b!1347054))

(assert (= (and b!1347054 res!893849) b!1347053))

(assert (= (and b!1347053 res!893845) b!1347049))

(assert (= (and b!1347049 res!893852) b!1347043))

(assert (= (and b!1347043 res!893846) b!1347045))

(assert (= (and b!1347045 res!893853) b!1347050))

(assert (= (and b!1347046 condMapEmpty!57979) mapIsEmpty!57979))

(assert (= (and b!1347046 (not condMapEmpty!57979)) mapNonEmpty!57979))

(get-info :version)

(assert (= (and mapNonEmpty!57979 ((_ is ValueCellFull!17859) mapValue!57979)) b!1347051))

(assert (= (and b!1347046 ((_ is ValueCellFull!17859) mapDefault!57979)) b!1347048))

(assert (= start!113464 b!1347046))

(declare-fun b_lambda!24559 () Bool)

(assert (=> (not b_lambda!24559) (not b!1347050)))

(declare-fun t!46026 () Bool)

(declare-fun tb!12397 () Bool)

(assert (=> (and start!113464 (= defaultEntry!1306 defaultEntry!1306) t!46026) tb!12397))

(declare-fun result!25885 () Bool)

(assert (=> tb!12397 (= result!25885 tp_is_empty!37515)))

(assert (=> b!1347050 t!46026))

(declare-fun b_and!50807 () Bool)

(assert (= b_and!50805 (and (=> t!46026 result!25885) b_and!50807)))

(declare-fun m!1233977 () Bool)

(assert (=> b!1347044 m!1233977))

(declare-fun m!1233979 () Bool)

(assert (=> b!1347043 m!1233979))

(assert (=> b!1347043 m!1233979))

(declare-fun m!1233981 () Bool)

(assert (=> b!1347043 m!1233981))

(declare-fun m!1233983 () Bool)

(assert (=> b!1347052 m!1233983))

(declare-fun m!1233985 () Bool)

(assert (=> b!1347050 m!1233985))

(declare-fun m!1233987 () Bool)

(assert (=> b!1347050 m!1233987))

(declare-fun m!1233989 () Bool)

(assert (=> b!1347050 m!1233989))

(declare-fun m!1233991 () Bool)

(assert (=> b!1347050 m!1233991))

(declare-fun m!1233993 () Bool)

(assert (=> b!1347050 m!1233993))

(declare-fun m!1233995 () Bool)

(assert (=> b!1347050 m!1233995))

(assert (=> b!1347050 m!1233989))

(declare-fun m!1233997 () Bool)

(assert (=> b!1347050 m!1233997))

(assert (=> b!1347050 m!1233991))

(assert (=> b!1347050 m!1233993))

(assert (=> b!1347050 m!1233979))

(assert (=> b!1347050 m!1233997))

(assert (=> b!1347050 m!1233985))

(declare-fun m!1233999 () Bool)

(assert (=> mapNonEmpty!57979 m!1233999))

(declare-fun m!1234001 () Bool)

(assert (=> b!1347053 m!1234001))

(assert (=> b!1347053 m!1234001))

(declare-fun m!1234003 () Bool)

(assert (=> b!1347053 m!1234003))

(declare-fun m!1234005 () Bool)

(assert (=> start!113464 m!1234005))

(declare-fun m!1234007 () Bool)

(assert (=> start!113464 m!1234007))

(declare-fun m!1234009 () Bool)

(assert (=> start!113464 m!1234009))

(assert (=> b!1347049 m!1233979))

(check-sat (not b!1347050) (not b!1347053) (not b!1347052) (not b_lambda!24559) (not b!1347044) (not b_next!31515) (not b!1347043) b_and!50807 tp_is_empty!37515 (not mapNonEmpty!57979) (not start!113464))
(check-sat b_and!50807 (not b_next!31515))
(get-model)

(declare-fun b_lambda!24563 () Bool)

(assert (= b_lambda!24559 (or (and start!113464 b_free!31515) b_lambda!24563)))

(check-sat (not b!1347050) (not b!1347053) (not b!1347052) (not b_lambda!24563) (not b!1347044) (not b_next!31515) (not b!1347043) b_and!50807 tp_is_empty!37515 (not mapNonEmpty!57979) (not start!113464))
(check-sat b_and!50807 (not b_next!31515))
(get-model)

(declare-fun b!1347103 () Bool)

(declare-fun e!766446 () Bool)

(declare-fun call!65040 () Bool)

(assert (=> b!1347103 (= e!766446 call!65040)))

(declare-fun bm!65037 () Bool)

(assert (=> bm!65037 (= call!65040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144295 () Bool)

(declare-fun res!893885 () Bool)

(declare-fun e!766448 () Bool)

(assert (=> d!144295 (=> res!893885 e!766448)))

(assert (=> d!144295 (= res!893885 (bvsge #b00000000000000000000000000000000 (size!44937 _keys!1571)))))

(assert (=> d!144295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!766448)))

(declare-fun b!1347104 () Bool)

(declare-fun e!766447 () Bool)

(assert (=> b!1347104 (= e!766447 call!65040)))

(declare-fun b!1347105 () Bool)

(assert (=> b!1347105 (= e!766448 e!766447)))

(declare-fun c!126301 () Bool)

(assert (=> b!1347105 (= c!126301 (validKeyInArray!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347106 () Bool)

(assert (=> b!1347106 (= e!766447 e!766446)))

(declare-fun lt!595568 () (_ BitVec 64))

(assert (=> b!1347106 (= lt!595568 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!44143 0))(
  ( (Unit!44144) )
))
(declare-fun lt!595567 () Unit!44143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91862 (_ BitVec 64) (_ BitVec 32)) Unit!44143)

(assert (=> b!1347106 (= lt!595567 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595568 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1347106 (arrayContainsKey!0 _keys!1571 lt!595568 #b00000000000000000000000000000000)))

(declare-fun lt!595569 () Unit!44143)

(assert (=> b!1347106 (= lt!595569 lt!595567)))

(declare-fun res!893886 () Bool)

(declare-datatypes ((SeekEntryResult!10056 0))(
  ( (MissingZero!10056 (index!42595 (_ BitVec 32))) (Found!10056 (index!42596 (_ BitVec 32))) (Intermediate!10056 (undefined!10868 Bool) (index!42597 (_ BitVec 32)) (x!120560 (_ BitVec 32))) (Undefined!10056) (MissingVacant!10056 (index!42598 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91862 (_ BitVec 32)) SeekEntryResult!10056)

(assert (=> b!1347106 (= res!893886 (= (seekEntryOrOpen!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10056 #b00000000000000000000000000000000)))))

(assert (=> b!1347106 (=> (not res!893886) (not e!766446))))

(assert (= (and d!144295 (not res!893885)) b!1347105))

(assert (= (and b!1347105 c!126301) b!1347106))

(assert (= (and b!1347105 (not c!126301)) b!1347104))

(assert (= (and b!1347106 res!893886) b!1347103))

(assert (= (or b!1347103 b!1347104) bm!65037))

(declare-fun m!1234045 () Bool)

(assert (=> bm!65037 m!1234045))

(declare-fun m!1234047 () Bool)

(assert (=> b!1347105 m!1234047))

(assert (=> b!1347105 m!1234047))

(declare-fun m!1234049 () Bool)

(assert (=> b!1347105 m!1234049))

(assert (=> b!1347106 m!1234047))

(declare-fun m!1234051 () Bool)

(assert (=> b!1347106 m!1234051))

(declare-fun m!1234053 () Bool)

(assert (=> b!1347106 m!1234053))

(assert (=> b!1347106 m!1234047))

(declare-fun m!1234055 () Bool)

(assert (=> b!1347106 m!1234055))

(assert (=> b!1347052 d!144295))

(declare-fun b!1347117 () Bool)

(declare-fun e!766457 () Bool)

(declare-fun contains!9160 (List!31433 (_ BitVec 64)) Bool)

(assert (=> b!1347117 (= e!766457 (contains!9160 Nil!31430 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65040 () Bool)

(declare-fun call!65043 () Bool)

(declare-fun c!126304 () Bool)

(assert (=> bm!65040 (= call!65043 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126304 (Cons!31429 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) Nil!31430) Nil!31430)))))

(declare-fun d!144297 () Bool)

(declare-fun res!893894 () Bool)

(declare-fun e!766459 () Bool)

(assert (=> d!144297 (=> res!893894 e!766459)))

(assert (=> d!144297 (= res!893894 (bvsge #b00000000000000000000000000000000 (size!44937 _keys!1571)))))

(assert (=> d!144297 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31430) e!766459)))

(declare-fun b!1347118 () Bool)

(declare-fun e!766458 () Bool)

(assert (=> b!1347118 (= e!766458 call!65043)))

(declare-fun b!1347119 () Bool)

(declare-fun e!766460 () Bool)

(assert (=> b!1347119 (= e!766459 e!766460)))

(declare-fun res!893895 () Bool)

(assert (=> b!1347119 (=> (not res!893895) (not e!766460))))

(assert (=> b!1347119 (= res!893895 (not e!766457))))

(declare-fun res!893893 () Bool)

(assert (=> b!1347119 (=> (not res!893893) (not e!766457))))

(assert (=> b!1347119 (= res!893893 (validKeyInArray!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347120 () Bool)

(assert (=> b!1347120 (= e!766458 call!65043)))

(declare-fun b!1347121 () Bool)

(assert (=> b!1347121 (= e!766460 e!766458)))

(assert (=> b!1347121 (= c!126304 (validKeyInArray!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144297 (not res!893894)) b!1347119))

(assert (= (and b!1347119 res!893893) b!1347117))

(assert (= (and b!1347119 res!893895) b!1347121))

(assert (= (and b!1347121 c!126304) b!1347118))

(assert (= (and b!1347121 (not c!126304)) b!1347120))

(assert (= (or b!1347118 b!1347120) bm!65040))

(assert (=> b!1347117 m!1234047))

(assert (=> b!1347117 m!1234047))

(declare-fun m!1234057 () Bool)

(assert (=> b!1347117 m!1234057))

(assert (=> bm!65040 m!1234047))

(declare-fun m!1234059 () Bool)

(assert (=> bm!65040 m!1234059))

(assert (=> b!1347119 m!1234047))

(assert (=> b!1347119 m!1234047))

(assert (=> b!1347119 m!1234049))

(assert (=> b!1347121 m!1234047))

(assert (=> b!1347121 m!1234047))

(assert (=> b!1347121 m!1234049))

(assert (=> b!1347044 d!144297))

(declare-fun d!144299 () Bool)

(declare-fun e!766465 () Bool)

(assert (=> d!144299 e!766465))

(declare-fun res!893898 () Bool)

(assert (=> d!144299 (=> res!893898 e!766465)))

(declare-fun lt!595578 () Bool)

(assert (=> d!144299 (= res!893898 (not lt!595578))))

(declare-fun lt!595580 () Bool)

(assert (=> d!144299 (= lt!595578 lt!595580)))

(declare-fun lt!595579 () Unit!44143)

(declare-fun e!766466 () Unit!44143)

(assert (=> d!144299 (= lt!595579 e!766466)))

(declare-fun c!126307 () Bool)

(assert (=> d!144299 (= c!126307 lt!595580)))

(declare-fun containsKey!742 (List!31434 (_ BitVec 64)) Bool)

(assert (=> d!144299 (= lt!595580 (containsKey!742 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144299 (= (contains!9159 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!595578)))

(declare-fun b!1347128 () Bool)

(declare-fun lt!595581 () Unit!44143)

(assert (=> b!1347128 (= e!766466 lt!595581)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!488 (List!31434 (_ BitVec 64)) Unit!44143)

(assert (=> b!1347128 (= lt!595581 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!772 0))(
  ( (Some!771 (v!21482 V!55123)) (None!770) )
))
(declare-fun isDefined!527 (Option!772) Bool)

(declare-fun getValueByKey!720 (List!31434 (_ BitVec 64)) Option!772)

(assert (=> b!1347128 (isDefined!527 (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1347129 () Bool)

(declare-fun Unit!44145 () Unit!44143)

(assert (=> b!1347129 (= e!766466 Unit!44145)))

(declare-fun b!1347130 () Bool)

(assert (=> b!1347130 (= e!766465 (isDefined!527 (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144299 c!126307) b!1347128))

(assert (= (and d!144299 (not c!126307)) b!1347129))

(assert (= (and d!144299 (not res!893898)) b!1347130))

(declare-fun m!1234061 () Bool)

(assert (=> d!144299 m!1234061))

(declare-fun m!1234063 () Bool)

(assert (=> b!1347128 m!1234063))

(declare-fun m!1234065 () Bool)

(assert (=> b!1347128 m!1234065))

(assert (=> b!1347128 m!1234065))

(declare-fun m!1234067 () Bool)

(assert (=> b!1347128 m!1234067))

(assert (=> b!1347130 m!1234065))

(assert (=> b!1347130 m!1234065))

(assert (=> b!1347130 m!1234067))

(assert (=> b!1347053 d!144299))

(declare-fun bm!65055 () Bool)

(declare-fun call!65064 () Bool)

(declare-fun lt!595647 () ListLongMap!21935)

(assert (=> bm!65055 (= call!65064 (contains!9159 lt!595647 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65056 () Bool)

(declare-fun call!65063 () ListLongMap!21935)

(declare-fun call!65060 () ListLongMap!21935)

(assert (=> bm!65056 (= call!65063 call!65060)))

(declare-fun b!1347173 () Bool)

(declare-fun res!893924 () Bool)

(declare-fun e!766504 () Bool)

(assert (=> b!1347173 (=> (not res!893924) (not e!766504))))

(declare-fun e!766499 () Bool)

(assert (=> b!1347173 (= res!893924 e!766499)))

(declare-fun c!126322 () Bool)

(assert (=> b!1347173 (= c!126322 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347174 () Bool)

(declare-fun c!126321 () Bool)

(assert (=> b!1347174 (= c!126321 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!766500 () ListLongMap!21935)

(declare-fun e!766495 () ListLongMap!21935)

(assert (=> b!1347174 (= e!766500 e!766495)))

(declare-fun b!1347175 () Bool)

(declare-fun e!766501 () Bool)

(assert (=> b!1347175 (= e!766501 (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)))))

(declare-fun b!1347176 () Bool)

(declare-fun e!766502 () Bool)

(assert (=> b!1347176 (= e!766499 e!766502)))

(declare-fun res!893919 () Bool)

(declare-fun call!65059 () Bool)

(assert (=> b!1347176 (= res!893919 call!65059)))

(assert (=> b!1347176 (=> (not res!893919) (not e!766502))))

(declare-fun c!126325 () Bool)

(declare-fun c!126323 () Bool)

(declare-fun call!65058 () ListLongMap!21935)

(declare-fun call!65062 () ListLongMap!21935)

(declare-fun bm!65057 () Bool)

(assert (=> bm!65057 (= call!65062 (+!4838 (ite c!126323 call!65058 (ite c!126325 call!65060 call!65063)) (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1347178 () Bool)

(declare-fun e!766497 () Bool)

(assert (=> b!1347178 (= e!766497 (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)))))

(declare-fun b!1347179 () Bool)

(declare-fun apply!1037 (ListLongMap!21935 (_ BitVec 64)) V!55123)

(assert (=> b!1347179 (= e!766502 (= (apply!1037 lt!595647 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1347180 () Bool)

(assert (=> b!1347180 (= e!766499 (not call!65059))))

(declare-fun b!1347181 () Bool)

(assert (=> b!1347181 (= e!766495 call!65063)))

(declare-fun b!1347182 () Bool)

(declare-fun e!766496 () ListLongMap!21935)

(assert (=> b!1347182 (= e!766496 e!766500)))

(assert (=> b!1347182 (= c!126325 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1347183 () Bool)

(declare-fun e!766503 () Bool)

(assert (=> b!1347183 (= e!766503 (= (apply!1037 lt!595647 (select (arr!44387 _keys!1571) from!1960)) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347183 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44938 _values!1303)))))

(assert (=> b!1347183 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun b!1347184 () Bool)

(declare-fun e!766493 () Bool)

(assert (=> b!1347184 (= e!766504 e!766493)))

(declare-fun c!126324 () Bool)

(assert (=> b!1347184 (= c!126324 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1347185 () Bool)

(declare-fun call!65061 () ListLongMap!21935)

(assert (=> b!1347185 (= e!766495 call!65061)))

(declare-fun b!1347186 () Bool)

(declare-fun e!766505 () Bool)

(assert (=> b!1347186 (= e!766493 e!766505)))

(declare-fun res!893920 () Bool)

(assert (=> b!1347186 (= res!893920 call!65064)))

(assert (=> b!1347186 (=> (not res!893920) (not e!766505))))

(declare-fun bm!65058 () Bool)

(assert (=> bm!65058 (= call!65061 call!65062)))

(declare-fun b!1347187 () Bool)

(declare-fun e!766494 () Unit!44143)

(declare-fun lt!595638 () Unit!44143)

(assert (=> b!1347187 (= e!766494 lt!595638)))

(declare-fun lt!595637 () ListLongMap!21935)

(assert (=> b!1347187 (= lt!595637 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595636 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595636 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595642 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595642 (select (arr!44387 _keys!1571) from!1960))))

(declare-fun lt!595633 () Unit!44143)

(declare-fun addStillContains!1212 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> b!1347187 (= lt!595633 (addStillContains!1212 lt!595637 lt!595636 zeroValue!1245 lt!595642))))

(assert (=> b!1347187 (contains!9159 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245)) lt!595642)))

(declare-fun lt!595629 () Unit!44143)

(assert (=> b!1347187 (= lt!595629 lt!595633)))

(declare-fun lt!595640 () ListLongMap!21935)

(assert (=> b!1347187 (= lt!595640 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595627 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595627 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595632 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595632 (select (arr!44387 _keys!1571) from!1960))))

(declare-fun lt!595635 () Unit!44143)

(declare-fun addApplyDifferent!579 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> b!1347187 (= lt!595635 (addApplyDifferent!579 lt!595640 lt!595627 minValue!1245 lt!595632))))

(assert (=> b!1347187 (= (apply!1037 (+!4838 lt!595640 (tuple2!24279 lt!595627 minValue!1245)) lt!595632) (apply!1037 lt!595640 lt!595632))))

(declare-fun lt!595641 () Unit!44143)

(assert (=> b!1347187 (= lt!595641 lt!595635)))

(declare-fun lt!595628 () ListLongMap!21935)

(assert (=> b!1347187 (= lt!595628 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595631 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595644 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595644 (select (arr!44387 _keys!1571) from!1960))))

(declare-fun lt!595643 () Unit!44143)

(assert (=> b!1347187 (= lt!595643 (addApplyDifferent!579 lt!595628 lt!595631 zeroValue!1245 lt!595644))))

(assert (=> b!1347187 (= (apply!1037 (+!4838 lt!595628 (tuple2!24279 lt!595631 zeroValue!1245)) lt!595644) (apply!1037 lt!595628 lt!595644))))

(declare-fun lt!595634 () Unit!44143)

(assert (=> b!1347187 (= lt!595634 lt!595643)))

(declare-fun lt!595630 () ListLongMap!21935)

(assert (=> b!1347187 (= lt!595630 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595639 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595639 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595646 () (_ BitVec 64))

(assert (=> b!1347187 (= lt!595646 (select (arr!44387 _keys!1571) from!1960))))

(assert (=> b!1347187 (= lt!595638 (addApplyDifferent!579 lt!595630 lt!595639 minValue!1245 lt!595646))))

(assert (=> b!1347187 (= (apply!1037 (+!4838 lt!595630 (tuple2!24279 lt!595639 minValue!1245)) lt!595646) (apply!1037 lt!595630 lt!595646))))

(declare-fun b!1347188 () Bool)

(assert (=> b!1347188 (= e!766493 (not call!65064))))

(declare-fun b!1347189 () Bool)

(assert (=> b!1347189 (= e!766505 (= (apply!1037 lt!595647 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun bm!65059 () Bool)

(assert (=> bm!65059 (= call!65060 call!65058)))

(declare-fun b!1347190 () Bool)

(declare-fun e!766498 () Bool)

(assert (=> b!1347190 (= e!766498 e!766503)))

(declare-fun res!893923 () Bool)

(assert (=> b!1347190 (=> (not res!893923) (not e!766503))))

(assert (=> b!1347190 (= res!893923 (contains!9159 lt!595647 (select (arr!44387 _keys!1571) from!1960)))))

(assert (=> b!1347190 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun bm!65060 () Bool)

(assert (=> bm!65060 (= call!65059 (contains!9159 lt!595647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65061 () Bool)

(assert (=> bm!65061 (= call!65058 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun d!144301 () Bool)

(assert (=> d!144301 e!766504))

(declare-fun res!893925 () Bool)

(assert (=> d!144301 (=> (not res!893925) (not e!766504))))

(assert (=> d!144301 (= res!893925 (or (bvsge from!1960 (size!44937 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)))))))

(declare-fun lt!595626 () ListLongMap!21935)

(assert (=> d!144301 (= lt!595647 lt!595626)))

(declare-fun lt!595645 () Unit!44143)

(assert (=> d!144301 (= lt!595645 e!766494)))

(declare-fun c!126320 () Bool)

(assert (=> d!144301 (= c!126320 e!766501)))

(declare-fun res!893922 () Bool)

(assert (=> d!144301 (=> (not res!893922) (not e!766501))))

(assert (=> d!144301 (= res!893922 (bvslt from!1960 (size!44937 _keys!1571)))))

(assert (=> d!144301 (= lt!595626 e!766496)))

(assert (=> d!144301 (= c!126323 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144301 (validMask!0 mask!1977)))

(assert (=> d!144301 (= (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!595647)))

(declare-fun b!1347177 () Bool)

(declare-fun res!893918 () Bool)

(assert (=> b!1347177 (=> (not res!893918) (not e!766504))))

(assert (=> b!1347177 (= res!893918 e!766498)))

(declare-fun res!893921 () Bool)

(assert (=> b!1347177 (=> res!893921 e!766498)))

(assert (=> b!1347177 (= res!893921 (not e!766497))))

(declare-fun res!893917 () Bool)

(assert (=> b!1347177 (=> (not res!893917) (not e!766497))))

(assert (=> b!1347177 (= res!893917 (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun b!1347191 () Bool)

(declare-fun Unit!44146 () Unit!44143)

(assert (=> b!1347191 (= e!766494 Unit!44146)))

(declare-fun b!1347192 () Bool)

(assert (=> b!1347192 (= e!766496 (+!4838 call!65062 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1347193 () Bool)

(assert (=> b!1347193 (= e!766500 call!65061)))

(assert (= (and d!144301 c!126323) b!1347192))

(assert (= (and d!144301 (not c!126323)) b!1347182))

(assert (= (and b!1347182 c!126325) b!1347193))

(assert (= (and b!1347182 (not c!126325)) b!1347174))

(assert (= (and b!1347174 c!126321) b!1347185))

(assert (= (and b!1347174 (not c!126321)) b!1347181))

(assert (= (or b!1347185 b!1347181) bm!65056))

(assert (= (or b!1347193 bm!65056) bm!65059))

(assert (= (or b!1347193 b!1347185) bm!65058))

(assert (= (or b!1347192 bm!65059) bm!65061))

(assert (= (or b!1347192 bm!65058) bm!65057))

(assert (= (and d!144301 res!893922) b!1347175))

(assert (= (and d!144301 c!126320) b!1347187))

(assert (= (and d!144301 (not c!126320)) b!1347191))

(assert (= (and d!144301 res!893925) b!1347177))

(assert (= (and b!1347177 res!893917) b!1347178))

(assert (= (and b!1347177 (not res!893921)) b!1347190))

(assert (= (and b!1347190 res!893923) b!1347183))

(assert (= (and b!1347177 res!893918) b!1347173))

(assert (= (and b!1347173 c!126322) b!1347176))

(assert (= (and b!1347173 (not c!126322)) b!1347180))

(assert (= (and b!1347176 res!893919) b!1347179))

(assert (= (or b!1347176 b!1347180) bm!65060))

(assert (= (and b!1347173 res!893924) b!1347184))

(assert (= (and b!1347184 c!126324) b!1347186))

(assert (= (and b!1347184 (not c!126324)) b!1347188))

(assert (= (and b!1347186 res!893920) b!1347189))

(assert (= (or b!1347186 b!1347188) bm!65055))

(declare-fun b_lambda!24565 () Bool)

(assert (=> (not b_lambda!24565) (not b!1347183)))

(assert (=> b!1347183 t!46026))

(declare-fun b_and!50813 () Bool)

(assert (= b_and!50807 (and (=> t!46026 result!25885) b_and!50813)))

(assert (=> b!1347178 m!1233979))

(assert (=> b!1347178 m!1233979))

(assert (=> b!1347178 m!1233981))

(declare-fun m!1234069 () Bool)

(assert (=> bm!65061 m!1234069))

(declare-fun m!1234071 () Bool)

(assert (=> bm!65060 m!1234071))

(declare-fun m!1234073 () Bool)

(assert (=> bm!65057 m!1234073))

(declare-fun m!1234075 () Bool)

(assert (=> b!1347189 m!1234075))

(assert (=> b!1347190 m!1233979))

(assert (=> b!1347190 m!1233979))

(declare-fun m!1234077 () Bool)

(assert (=> b!1347190 m!1234077))

(assert (=> b!1347175 m!1233979))

(assert (=> b!1347175 m!1233979))

(assert (=> b!1347175 m!1233981))

(declare-fun m!1234079 () Bool)

(assert (=> b!1347179 m!1234079))

(assert (=> b!1347187 m!1233979))

(declare-fun m!1234081 () Bool)

(assert (=> b!1347187 m!1234081))

(declare-fun m!1234083 () Bool)

(assert (=> b!1347187 m!1234083))

(declare-fun m!1234085 () Bool)

(assert (=> b!1347187 m!1234085))

(assert (=> b!1347187 m!1234083))

(declare-fun m!1234087 () Bool)

(assert (=> b!1347187 m!1234087))

(declare-fun m!1234089 () Bool)

(assert (=> b!1347187 m!1234089))

(declare-fun m!1234091 () Bool)

(assert (=> b!1347187 m!1234091))

(assert (=> b!1347187 m!1234087))

(assert (=> b!1347187 m!1234081))

(declare-fun m!1234093 () Bool)

(assert (=> b!1347187 m!1234093))

(declare-fun m!1234095 () Bool)

(assert (=> b!1347187 m!1234095))

(declare-fun m!1234097 () Bool)

(assert (=> b!1347187 m!1234097))

(assert (=> b!1347187 m!1234095))

(declare-fun m!1234099 () Bool)

(assert (=> b!1347187 m!1234099))

(declare-fun m!1234101 () Bool)

(assert (=> b!1347187 m!1234101))

(declare-fun m!1234103 () Bool)

(assert (=> b!1347187 m!1234103))

(declare-fun m!1234105 () Bool)

(assert (=> b!1347187 m!1234105))

(assert (=> b!1347187 m!1234069))

(declare-fun m!1234107 () Bool)

(assert (=> b!1347187 m!1234107))

(declare-fun m!1234109 () Bool)

(assert (=> b!1347187 m!1234109))

(assert (=> d!144301 m!1234005))

(assert (=> b!1347183 m!1233979))

(assert (=> b!1347183 m!1233991))

(assert (=> b!1347183 m!1233993))

(assert (=> b!1347183 m!1233979))

(declare-fun m!1234111 () Bool)

(assert (=> b!1347183 m!1234111))

(assert (=> b!1347183 m!1233991))

(assert (=> b!1347183 m!1233993))

(assert (=> b!1347183 m!1233995))

(declare-fun m!1234113 () Bool)

(assert (=> b!1347192 m!1234113))

(declare-fun m!1234115 () Bool)

(assert (=> bm!65055 m!1234115))

(assert (=> b!1347053 d!144301))

(declare-fun d!144303 () Bool)

(assert (=> d!144303 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113464 d!144303))

(declare-fun d!144305 () Bool)

(assert (=> d!144305 (= (array_inv!33441 _keys!1571) (bvsge (size!44937 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113464 d!144305))

(declare-fun d!144307 () Bool)

(assert (=> d!144307 (= (array_inv!33442 _values!1303) (bvsge (size!44938 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113464 d!144307))

(declare-fun d!144309 () Bool)

(assert (=> d!144309 (= (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)) (and (not (= (select (arr!44387 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44387 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347043 d!144309))

(declare-fun d!144311 () Bool)

(declare-fun e!766508 () Bool)

(assert (=> d!144311 e!766508))

(declare-fun res!893930 () Bool)

(assert (=> d!144311 (=> (not res!893930) (not e!766508))))

(declare-fun lt!595657 () ListLongMap!21935)

(assert (=> d!144311 (= res!893930 (contains!9159 lt!595657 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595656 () List!31434)

(assert (=> d!144311 (= lt!595657 (ListLongMap!21936 lt!595656))))

(declare-fun lt!595658 () Unit!44143)

(declare-fun lt!595659 () Unit!44143)

(assert (=> d!144311 (= lt!595658 lt!595659)))

(assert (=> d!144311 (= (getValueByKey!720 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!771 (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!365 (List!31434 (_ BitVec 64) V!55123) Unit!44143)

(assert (=> d!144311 (= lt!595659 (lemmaContainsTupThenGetReturnValue!365 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!494 (List!31434 (_ BitVec 64) V!55123) List!31434)

(assert (=> d!144311 (= lt!595656 (insertStrictlySorted!494 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144311 (= (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595657)))

(declare-fun b!1347198 () Bool)

(declare-fun res!893931 () Bool)

(assert (=> b!1347198 (=> (not res!893931) (not e!766508))))

(assert (=> b!1347198 (= res!893931 (= (getValueByKey!720 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!771 (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1347199 () Bool)

(declare-fun contains!9161 (List!31434 tuple2!24278) Bool)

(assert (=> b!1347199 (= e!766508 (contains!9161 (toList!10983 lt!595657) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144311 res!893930) b!1347198))

(assert (= (and b!1347198 res!893931) b!1347199))

(declare-fun m!1234117 () Bool)

(assert (=> d!144311 m!1234117))

(declare-fun m!1234119 () Bool)

(assert (=> d!144311 m!1234119))

(declare-fun m!1234121 () Bool)

(assert (=> d!144311 m!1234121))

(declare-fun m!1234123 () Bool)

(assert (=> d!144311 m!1234123))

(declare-fun m!1234125 () Bool)

(assert (=> b!1347198 m!1234125))

(declare-fun m!1234127 () Bool)

(assert (=> b!1347199 m!1234127))

(assert (=> b!1347050 d!144311))

(declare-fun d!144313 () Bool)

(declare-fun c!126328 () Bool)

(assert (=> d!144313 (= c!126328 ((_ is ValueCellFull!17859) (select (arr!44388 _values!1303) from!1960)))))

(declare-fun e!766511 () V!55123)

(assert (=> d!144313 (= (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!766511)))

(declare-fun b!1347204 () Bool)

(declare-fun get!22416 (ValueCell!17859 V!55123) V!55123)

(assert (=> b!1347204 (= e!766511 (get!22416 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347205 () Bool)

(declare-fun get!22417 (ValueCell!17859 V!55123) V!55123)

(assert (=> b!1347205 (= e!766511 (get!22417 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144313 c!126328) b!1347204))

(assert (= (and d!144313 (not c!126328)) b!1347205))

(assert (=> b!1347204 m!1233991))

(assert (=> b!1347204 m!1233993))

(declare-fun m!1234129 () Bool)

(assert (=> b!1347204 m!1234129))

(assert (=> b!1347205 m!1233991))

(assert (=> b!1347205 m!1233993))

(declare-fun m!1234131 () Bool)

(assert (=> b!1347205 m!1234131))

(assert (=> b!1347050 d!144313))

(declare-fun d!144315 () Bool)

(declare-fun e!766512 () Bool)

(assert (=> d!144315 e!766512))

(declare-fun res!893932 () Bool)

(assert (=> d!144315 (=> (not res!893932) (not e!766512))))

(declare-fun lt!595661 () ListLongMap!21935)

(assert (=> d!144315 (= res!893932 (contains!9159 lt!595661 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!595660 () List!31434)

(assert (=> d!144315 (= lt!595661 (ListLongMap!21936 lt!595660))))

(declare-fun lt!595662 () Unit!44143)

(declare-fun lt!595663 () Unit!44143)

(assert (=> d!144315 (= lt!595662 lt!595663)))

(assert (=> d!144315 (= (getValueByKey!720 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144315 (= lt!595663 (lemmaContainsTupThenGetReturnValue!365 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144315 (= lt!595660 (insertStrictlySorted!494 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144315 (= (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!595661)))

(declare-fun b!1347206 () Bool)

(declare-fun res!893933 () Bool)

(assert (=> b!1347206 (=> (not res!893933) (not e!766512))))

(assert (=> b!1347206 (= res!893933 (= (getValueByKey!720 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1347207 () Bool)

(assert (=> b!1347207 (= e!766512 (contains!9161 (toList!10983 lt!595661) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144315 res!893932) b!1347206))

(assert (= (and b!1347206 res!893933) b!1347207))

(declare-fun m!1234133 () Bool)

(assert (=> d!144315 m!1234133))

(declare-fun m!1234135 () Bool)

(assert (=> d!144315 m!1234135))

(declare-fun m!1234137 () Bool)

(assert (=> d!144315 m!1234137))

(declare-fun m!1234139 () Bool)

(assert (=> d!144315 m!1234139))

(declare-fun m!1234141 () Bool)

(assert (=> b!1347206 m!1234141))

(declare-fun m!1234143 () Bool)

(assert (=> b!1347207 m!1234143))

(assert (=> b!1347050 d!144315))

(declare-fun d!144317 () Bool)

(declare-fun e!766513 () Bool)

(assert (=> d!144317 e!766513))

(declare-fun res!893934 () Bool)

(assert (=> d!144317 (=> res!893934 e!766513)))

(declare-fun lt!595664 () Bool)

(assert (=> d!144317 (= res!893934 (not lt!595664))))

(declare-fun lt!595666 () Bool)

(assert (=> d!144317 (= lt!595664 lt!595666)))

(declare-fun lt!595665 () Unit!44143)

(declare-fun e!766514 () Unit!44143)

(assert (=> d!144317 (= lt!595665 e!766514)))

(declare-fun c!126329 () Bool)

(assert (=> d!144317 (= c!126329 lt!595666)))

(assert (=> d!144317 (= lt!595666 (containsKey!742 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144317 (= (contains!9159 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!595664)))

(declare-fun b!1347208 () Bool)

(declare-fun lt!595667 () Unit!44143)

(assert (=> b!1347208 (= e!766514 lt!595667)))

(assert (=> b!1347208 (= lt!595667 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> b!1347208 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1347209 () Bool)

(declare-fun Unit!44147 () Unit!44143)

(assert (=> b!1347209 (= e!766514 Unit!44147)))

(declare-fun b!1347210 () Bool)

(assert (=> b!1347210 (= e!766513 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144317 c!126329) b!1347208))

(assert (= (and d!144317 (not c!126329)) b!1347209))

(assert (= (and d!144317 (not res!893934)) b!1347210))

(declare-fun m!1234145 () Bool)

(assert (=> d!144317 m!1234145))

(declare-fun m!1234147 () Bool)

(assert (=> b!1347208 m!1234147))

(declare-fun m!1234149 () Bool)

(assert (=> b!1347208 m!1234149))

(assert (=> b!1347208 m!1234149))

(declare-fun m!1234151 () Bool)

(assert (=> b!1347208 m!1234151))

(assert (=> b!1347210 m!1234149))

(assert (=> b!1347210 m!1234149))

(assert (=> b!1347210 m!1234151))

(assert (=> b!1347050 d!144317))

(declare-fun b!1347235 () Bool)

(declare-fun res!893946 () Bool)

(declare-fun e!766534 () Bool)

(assert (=> b!1347235 (=> (not res!893946) (not e!766534))))

(declare-fun lt!595682 () ListLongMap!21935)

(assert (=> b!1347235 (= res!893946 (not (contains!9159 lt!595682 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144319 () Bool)

(assert (=> d!144319 e!766534))

(declare-fun res!893944 () Bool)

(assert (=> d!144319 (=> (not res!893944) (not e!766534))))

(assert (=> d!144319 (= res!893944 (not (contains!9159 lt!595682 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766530 () ListLongMap!21935)

(assert (=> d!144319 (= lt!595682 e!766530)))

(declare-fun c!126340 () Bool)

(assert (=> d!144319 (= c!126340 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44937 _keys!1571)))))

(assert (=> d!144319 (validMask!0 mask!1977)))

(assert (=> d!144319 (= (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!595682)))

(declare-fun b!1347236 () Bool)

(assert (=> b!1347236 (= e!766530 (ListLongMap!21936 Nil!31431))))

(declare-fun b!1347237 () Bool)

(declare-fun e!766535 () Bool)

(declare-fun e!766533 () Bool)

(assert (=> b!1347237 (= e!766535 e!766533)))

(declare-fun c!126339 () Bool)

(assert (=> b!1347237 (= c!126339 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44937 _keys!1571)))))

(declare-fun b!1347238 () Bool)

(declare-fun isEmpty!1091 (ListLongMap!21935) Bool)

(assert (=> b!1347238 (= e!766533 (isEmpty!1091 lt!595682))))

(declare-fun bm!65064 () Bool)

(declare-fun call!65067 () ListLongMap!21935)

(assert (=> bm!65064 (= call!65067 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347239 () Bool)

(assert (=> b!1347239 (= e!766533 (= lt!595682 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347240 () Bool)

(declare-fun e!766532 () Bool)

(assert (=> b!1347240 (= e!766532 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347240 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1347241 () Bool)

(declare-fun e!766531 () ListLongMap!21935)

(assert (=> b!1347241 (= e!766530 e!766531)))

(declare-fun c!126341 () Bool)

(assert (=> b!1347241 (= c!126341 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1347242 () Bool)

(assert (=> b!1347242 (= e!766531 call!65067)))

(declare-fun b!1347243 () Bool)

(assert (=> b!1347243 (= e!766534 e!766535)))

(declare-fun c!126338 () Bool)

(assert (=> b!1347243 (= c!126338 e!766532)))

(declare-fun res!893943 () Bool)

(assert (=> b!1347243 (=> (not res!893943) (not e!766532))))

(assert (=> b!1347243 (= res!893943 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44937 _keys!1571)))))

(declare-fun b!1347244 () Bool)

(assert (=> b!1347244 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44937 _keys!1571)))))

(assert (=> b!1347244 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44938 _values!1303)))))

(declare-fun e!766529 () Bool)

(assert (=> b!1347244 (= e!766529 (= (apply!1037 lt!595682 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347245 () Bool)

(declare-fun lt!595688 () Unit!44143)

(declare-fun lt!595686 () Unit!44143)

(assert (=> b!1347245 (= lt!595688 lt!595686)))

(declare-fun lt!595683 () (_ BitVec 64))

(declare-fun lt!595685 () (_ BitVec 64))

(declare-fun lt!595687 () V!55123)

(declare-fun lt!595684 () ListLongMap!21935)

(assert (=> b!1347245 (not (contains!9159 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687)) lt!595685))))

(declare-fun addStillNotContains!501 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> b!1347245 (= lt!595686 (addStillNotContains!501 lt!595684 lt!595683 lt!595687 lt!595685))))

(assert (=> b!1347245 (= lt!595685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347245 (= lt!595687 (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347245 (= lt!595683 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1347245 (= lt!595684 call!65067)))

(assert (=> b!1347245 (= e!766531 (+!4838 call!65067 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347246 () Bool)

(assert (=> b!1347246 (= e!766535 e!766529)))

(assert (=> b!1347246 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44937 _keys!1571)))))

(declare-fun res!893945 () Bool)

(assert (=> b!1347246 (= res!893945 (contains!9159 lt!595682 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347246 (=> (not res!893945) (not e!766529))))

(assert (= (and d!144319 c!126340) b!1347236))

(assert (= (and d!144319 (not c!126340)) b!1347241))

(assert (= (and b!1347241 c!126341) b!1347245))

(assert (= (and b!1347241 (not c!126341)) b!1347242))

(assert (= (or b!1347245 b!1347242) bm!65064))

(assert (= (and d!144319 res!893944) b!1347235))

(assert (= (and b!1347235 res!893946) b!1347243))

(assert (= (and b!1347243 res!893943) b!1347240))

(assert (= (and b!1347243 c!126338) b!1347246))

(assert (= (and b!1347243 (not c!126338)) b!1347237))

(assert (= (and b!1347246 res!893945) b!1347244))

(assert (= (and b!1347237 c!126339) b!1347239))

(assert (= (and b!1347237 (not c!126339)) b!1347238))

(declare-fun b_lambda!24567 () Bool)

(assert (=> (not b_lambda!24567) (not b!1347244)))

(assert (=> b!1347244 t!46026))

(declare-fun b_and!50815 () Bool)

(assert (= b_and!50813 (and (=> t!46026 result!25885) b_and!50815)))

(declare-fun b_lambda!24569 () Bool)

(assert (=> (not b_lambda!24569) (not b!1347245)))

(assert (=> b!1347245 t!46026))

(declare-fun b_and!50817 () Bool)

(assert (= b_and!50815 (and (=> t!46026 result!25885) b_and!50817)))

(declare-fun m!1234153 () Bool)

(assert (=> b!1347239 m!1234153))

(declare-fun m!1234155 () Bool)

(assert (=> b!1347245 m!1234155))

(assert (=> b!1347245 m!1233993))

(declare-fun m!1234157 () Bool)

(assert (=> b!1347245 m!1234157))

(declare-fun m!1234159 () Bool)

(assert (=> b!1347245 m!1234159))

(declare-fun m!1234161 () Bool)

(assert (=> b!1347245 m!1234161))

(declare-fun m!1234163 () Bool)

(assert (=> b!1347245 m!1234163))

(declare-fun m!1234165 () Bool)

(assert (=> b!1347245 m!1234165))

(declare-fun m!1234167 () Bool)

(assert (=> b!1347245 m!1234167))

(assert (=> b!1347245 m!1234159))

(assert (=> b!1347245 m!1234155))

(assert (=> b!1347245 m!1233993))

(assert (=> b!1347240 m!1234165))

(assert (=> b!1347240 m!1234165))

(declare-fun m!1234169 () Bool)

(assert (=> b!1347240 m!1234169))

(declare-fun m!1234171 () Bool)

(assert (=> b!1347235 m!1234171))

(assert (=> b!1347241 m!1234165))

(assert (=> b!1347241 m!1234165))

(assert (=> b!1347241 m!1234169))

(declare-fun m!1234173 () Bool)

(assert (=> b!1347238 m!1234173))

(assert (=> b!1347244 m!1234155))

(assert (=> b!1347244 m!1233993))

(assert (=> b!1347244 m!1234157))

(assert (=> b!1347244 m!1234165))

(assert (=> b!1347244 m!1234165))

(declare-fun m!1234175 () Bool)

(assert (=> b!1347244 m!1234175))

(assert (=> b!1347244 m!1234155))

(assert (=> b!1347244 m!1233993))

(assert (=> b!1347246 m!1234165))

(assert (=> b!1347246 m!1234165))

(declare-fun m!1234177 () Bool)

(assert (=> b!1347246 m!1234177))

(declare-fun m!1234179 () Bool)

(assert (=> d!144319 m!1234179))

(assert (=> d!144319 m!1234005))

(assert (=> bm!65064 m!1234153))

(assert (=> b!1347050 d!144319))

(declare-fun mapIsEmpty!57985 () Bool)

(declare-fun mapRes!57985 () Bool)

(assert (=> mapIsEmpty!57985 mapRes!57985))

(declare-fun condMapEmpty!57985 () Bool)

(declare-fun mapDefault!57985 () ValueCell!17859)

(assert (=> mapNonEmpty!57979 (= condMapEmpty!57985 (= mapRest!57979 ((as const (Array (_ BitVec 32) ValueCell!17859)) mapDefault!57985)))))

(declare-fun e!766541 () Bool)

(assert (=> mapNonEmpty!57979 (= tp!110349 (and e!766541 mapRes!57985))))

(declare-fun mapNonEmpty!57985 () Bool)

(declare-fun tp!110359 () Bool)

(declare-fun e!766540 () Bool)

(assert (=> mapNonEmpty!57985 (= mapRes!57985 (and tp!110359 e!766540))))

(declare-fun mapValue!57985 () ValueCell!17859)

(declare-fun mapKey!57985 () (_ BitVec 32))

(declare-fun mapRest!57985 () (Array (_ BitVec 32) ValueCell!17859))

(assert (=> mapNonEmpty!57985 (= mapRest!57979 (store mapRest!57985 mapKey!57985 mapValue!57985))))

(declare-fun b!1347254 () Bool)

(assert (=> b!1347254 (= e!766541 tp_is_empty!37515)))

(declare-fun b!1347253 () Bool)

(assert (=> b!1347253 (= e!766540 tp_is_empty!37515)))

(assert (= (and mapNonEmpty!57979 condMapEmpty!57985) mapIsEmpty!57985))

(assert (= (and mapNonEmpty!57979 (not condMapEmpty!57985)) mapNonEmpty!57985))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17859) mapValue!57985)) b!1347253))

(assert (= (and mapNonEmpty!57979 ((_ is ValueCellFull!17859) mapDefault!57985)) b!1347254))

(declare-fun m!1234181 () Bool)

(assert (=> mapNonEmpty!57985 m!1234181))

(declare-fun b_lambda!24571 () Bool)

(assert (= b_lambda!24567 (or (and start!113464 b_free!31515) b_lambda!24571)))

(declare-fun b_lambda!24573 () Bool)

(assert (= b_lambda!24565 (or (and start!113464 b_free!31515) b_lambda!24573)))

(declare-fun b_lambda!24575 () Bool)

(assert (= b_lambda!24569 (or (and start!113464 b_free!31515) b_lambda!24575)))

(check-sat (not b!1347244) (not b!1347183) (not b!1347239) (not b_next!31515) (not b!1347178) (not b!1347204) (not b!1347206) (not b_lambda!24571) (not b!1347238) (not b!1347189) (not bm!65055) (not b!1347121) (not bm!65064) (not b!1347241) (not b!1347208) (not bm!65061) (not b!1347105) (not bm!65040) (not b_lambda!24563) (not d!144317) (not d!144315) (not b!1347179) (not b!1347117) tp_is_empty!37515 (not b!1347207) (not b!1347192) (not b!1347199) (not b!1347130) (not b!1347190) (not b_lambda!24575) b_and!50817 (not b!1347175) (not b!1347205) (not b!1347128) (not b!1347246) (not b!1347210) (not bm!65060) (not b!1347240) (not b!1347235) (not mapNonEmpty!57985) (not b!1347187) (not bm!65037) (not b!1347245) (not d!144311) (not bm!65057) (not b!1347198) (not b!1347106) (not d!144301) (not b_lambda!24573) (not b!1347119) (not d!144319) (not d!144299))
(check-sat b_and!50817 (not b_next!31515))
(get-model)

(declare-fun d!144321 () Bool)

(declare-fun e!766542 () Bool)

(assert (=> d!144321 e!766542))

(declare-fun res!893947 () Bool)

(assert (=> d!144321 (=> res!893947 e!766542)))

(declare-fun lt!595689 () Bool)

(assert (=> d!144321 (= res!893947 (not lt!595689))))

(declare-fun lt!595691 () Bool)

(assert (=> d!144321 (= lt!595689 lt!595691)))

(declare-fun lt!595690 () Unit!44143)

(declare-fun e!766543 () Unit!44143)

(assert (=> d!144321 (= lt!595690 e!766543)))

(declare-fun c!126342 () Bool)

(assert (=> d!144321 (= c!126342 lt!595691)))

(assert (=> d!144321 (= lt!595691 (containsKey!742 (toList!10983 lt!595647) (select (arr!44387 _keys!1571) from!1960)))))

(assert (=> d!144321 (= (contains!9159 lt!595647 (select (arr!44387 _keys!1571) from!1960)) lt!595689)))

(declare-fun b!1347255 () Bool)

(declare-fun lt!595692 () Unit!44143)

(assert (=> b!1347255 (= e!766543 lt!595692)))

(assert (=> b!1347255 (= lt!595692 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595647) (select (arr!44387 _keys!1571) from!1960)))))

(assert (=> b!1347255 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) (select (arr!44387 _keys!1571) from!1960)))))

(declare-fun b!1347256 () Bool)

(declare-fun Unit!44148 () Unit!44143)

(assert (=> b!1347256 (= e!766543 Unit!44148)))

(declare-fun b!1347257 () Bool)

(assert (=> b!1347257 (= e!766542 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) (select (arr!44387 _keys!1571) from!1960))))))

(assert (= (and d!144321 c!126342) b!1347255))

(assert (= (and d!144321 (not c!126342)) b!1347256))

(assert (= (and d!144321 (not res!893947)) b!1347257))

(assert (=> d!144321 m!1233979))

(declare-fun m!1234183 () Bool)

(assert (=> d!144321 m!1234183))

(assert (=> b!1347255 m!1233979))

(declare-fun m!1234185 () Bool)

(assert (=> b!1347255 m!1234185))

(assert (=> b!1347255 m!1233979))

(declare-fun m!1234187 () Bool)

(assert (=> b!1347255 m!1234187))

(assert (=> b!1347255 m!1234187))

(declare-fun m!1234189 () Bool)

(assert (=> b!1347255 m!1234189))

(assert (=> b!1347257 m!1233979))

(assert (=> b!1347257 m!1234187))

(assert (=> b!1347257 m!1234187))

(assert (=> b!1347257 m!1234189))

(assert (=> b!1347190 d!144321))

(declare-fun d!144323 () Bool)

(declare-fun e!766544 () Bool)

(assert (=> d!144323 e!766544))

(declare-fun res!893948 () Bool)

(assert (=> d!144323 (=> res!893948 e!766544)))

(declare-fun lt!595693 () Bool)

(assert (=> d!144323 (= res!893948 (not lt!595693))))

(declare-fun lt!595695 () Bool)

(assert (=> d!144323 (= lt!595693 lt!595695)))

(declare-fun lt!595694 () Unit!44143)

(declare-fun e!766545 () Unit!44143)

(assert (=> d!144323 (= lt!595694 e!766545)))

(declare-fun c!126343 () Bool)

(assert (=> d!144323 (= c!126343 lt!595695)))

(assert (=> d!144323 (= lt!595695 (containsKey!742 (toList!10983 lt!595647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144323 (= (contains!9159 lt!595647 #b1000000000000000000000000000000000000000000000000000000000000000) lt!595693)))

(declare-fun b!1347258 () Bool)

(declare-fun lt!595696 () Unit!44143)

(assert (=> b!1347258 (= e!766545 lt!595696)))

(assert (=> b!1347258 (= lt!595696 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347258 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347259 () Bool)

(declare-fun Unit!44149 () Unit!44143)

(assert (=> b!1347259 (= e!766545 Unit!44149)))

(declare-fun b!1347260 () Bool)

(assert (=> b!1347260 (= e!766544 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144323 c!126343) b!1347258))

(assert (= (and d!144323 (not c!126343)) b!1347259))

(assert (= (and d!144323 (not res!893948)) b!1347260))

(declare-fun m!1234191 () Bool)

(assert (=> d!144323 m!1234191))

(declare-fun m!1234193 () Bool)

(assert (=> b!1347258 m!1234193))

(declare-fun m!1234195 () Bool)

(assert (=> b!1347258 m!1234195))

(assert (=> b!1347258 m!1234195))

(declare-fun m!1234197 () Bool)

(assert (=> b!1347258 m!1234197))

(assert (=> b!1347260 m!1234195))

(assert (=> b!1347260 m!1234195))

(assert (=> b!1347260 m!1234197))

(assert (=> bm!65055 d!144323))

(declare-fun d!144325 () Bool)

(declare-fun isEmpty!1092 (List!31434) Bool)

(assert (=> d!144325 (= (isEmpty!1091 lt!595682) (isEmpty!1092 (toList!10983 lt!595682)))))

(declare-fun bs!38613 () Bool)

(assert (= bs!38613 d!144325))

(declare-fun m!1234199 () Bool)

(assert (=> bs!38613 m!1234199))

(assert (=> b!1347238 d!144325))

(declare-fun d!144327 () Bool)

(declare-fun e!766546 () Bool)

(assert (=> d!144327 e!766546))

(declare-fun res!893949 () Bool)

(assert (=> d!144327 (=> res!893949 e!766546)))

(declare-fun lt!595697 () Bool)

(assert (=> d!144327 (= res!893949 (not lt!595697))))

(declare-fun lt!595699 () Bool)

(assert (=> d!144327 (= lt!595697 lt!595699)))

(declare-fun lt!595698 () Unit!44143)

(declare-fun e!766547 () Unit!44143)

(assert (=> d!144327 (= lt!595698 e!766547)))

(declare-fun c!126344 () Bool)

(assert (=> d!144327 (= c!126344 lt!595699)))

(assert (=> d!144327 (= lt!595699 (containsKey!742 (toList!10983 lt!595647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144327 (= (contains!9159 lt!595647 #b0000000000000000000000000000000000000000000000000000000000000000) lt!595697)))

(declare-fun b!1347261 () Bool)

(declare-fun lt!595700 () Unit!44143)

(assert (=> b!1347261 (= e!766547 lt!595700)))

(assert (=> b!1347261 (= lt!595700 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347261 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347262 () Bool)

(declare-fun Unit!44150 () Unit!44143)

(assert (=> b!1347262 (= e!766547 Unit!44150)))

(declare-fun b!1347263 () Bool)

(assert (=> b!1347263 (= e!766546 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144327 c!126344) b!1347261))

(assert (= (and d!144327 (not c!126344)) b!1347262))

(assert (= (and d!144327 (not res!893949)) b!1347263))

(declare-fun m!1234201 () Bool)

(assert (=> d!144327 m!1234201))

(declare-fun m!1234203 () Bool)

(assert (=> b!1347261 m!1234203))

(declare-fun m!1234205 () Bool)

(assert (=> b!1347261 m!1234205))

(assert (=> b!1347261 m!1234205))

(declare-fun m!1234207 () Bool)

(assert (=> b!1347261 m!1234207))

(assert (=> b!1347263 m!1234205))

(assert (=> b!1347263 m!1234205))

(assert (=> b!1347263 m!1234207))

(assert (=> bm!65060 d!144327))

(declare-fun d!144329 () Bool)

(declare-fun e!766548 () Bool)

(assert (=> d!144329 e!766548))

(declare-fun res!893950 () Bool)

(assert (=> d!144329 (=> res!893950 e!766548)))

(declare-fun lt!595701 () Bool)

(assert (=> d!144329 (= res!893950 (not lt!595701))))

(declare-fun lt!595703 () Bool)

(assert (=> d!144329 (= lt!595701 lt!595703)))

(declare-fun lt!595702 () Unit!44143)

(declare-fun e!766549 () Unit!44143)

(assert (=> d!144329 (= lt!595702 e!766549)))

(declare-fun c!126345 () Bool)

(assert (=> d!144329 (= c!126345 lt!595703)))

(assert (=> d!144329 (= lt!595703 (containsKey!742 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144329 (= (contains!9159 lt!595661 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595701)))

(declare-fun b!1347264 () Bool)

(declare-fun lt!595704 () Unit!44143)

(assert (=> b!1347264 (= e!766549 lt!595704)))

(assert (=> b!1347264 (= lt!595704 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> b!1347264 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347265 () Bool)

(declare-fun Unit!44151 () Unit!44143)

(assert (=> b!1347265 (= e!766549 Unit!44151)))

(declare-fun b!1347266 () Bool)

(assert (=> b!1347266 (= e!766548 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144329 c!126345) b!1347264))

(assert (= (and d!144329 (not c!126345)) b!1347265))

(assert (= (and d!144329 (not res!893950)) b!1347266))

(declare-fun m!1234209 () Bool)

(assert (=> d!144329 m!1234209))

(declare-fun m!1234211 () Bool)

(assert (=> b!1347264 m!1234211))

(assert (=> b!1347264 m!1234141))

(assert (=> b!1347264 m!1234141))

(declare-fun m!1234213 () Bool)

(assert (=> b!1347264 m!1234213))

(assert (=> b!1347266 m!1234141))

(assert (=> b!1347266 m!1234141))

(assert (=> b!1347266 m!1234213))

(assert (=> d!144315 d!144329))

(declare-fun b!1347277 () Bool)

(declare-fun e!766555 () Option!772)

(assert (=> b!1347277 (= e!766555 (getValueByKey!720 (t!46028 lt!595660) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347278 () Bool)

(assert (=> b!1347278 (= e!766555 None!770)))

(declare-fun b!1347276 () Bool)

(declare-fun e!766554 () Option!772)

(assert (=> b!1347276 (= e!766554 e!766555)))

(declare-fun c!126351 () Bool)

(assert (=> b!1347276 (= c!126351 (and ((_ is Cons!31430) lt!595660) (not (= (_1!12150 (h!32639 lt!595660)) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun b!1347275 () Bool)

(assert (=> b!1347275 (= e!766554 (Some!771 (_2!12150 (h!32639 lt!595660))))))

(declare-fun d!144331 () Bool)

(declare-fun c!126350 () Bool)

(assert (=> d!144331 (= c!126350 (and ((_ is Cons!31430) lt!595660) (= (_1!12150 (h!32639 lt!595660)) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144331 (= (getValueByKey!720 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!766554)))

(assert (= (and d!144331 c!126350) b!1347275))

(assert (= (and d!144331 (not c!126350)) b!1347276))

(assert (= (and b!1347276 c!126351) b!1347277))

(assert (= (and b!1347276 (not c!126351)) b!1347278))

(declare-fun m!1234215 () Bool)

(assert (=> b!1347277 m!1234215))

(assert (=> d!144315 d!144331))

(declare-fun d!144333 () Bool)

(assert (=> d!144333 (= (getValueByKey!720 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!595707 () Unit!44143)

(declare-fun choose!1971 (List!31434 (_ BitVec 64) V!55123) Unit!44143)

(assert (=> d!144333 (= lt!595707 (choose!1971 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun e!766558 () Bool)

(assert (=> d!144333 e!766558))

(declare-fun res!893955 () Bool)

(assert (=> d!144333 (=> (not res!893955) (not e!766558))))

(declare-fun isStrictlySorted!881 (List!31434) Bool)

(assert (=> d!144333 (= res!893955 (isStrictlySorted!881 lt!595660))))

(assert (=> d!144333 (= (lemmaContainsTupThenGetReturnValue!365 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595707)))

(declare-fun b!1347283 () Bool)

(declare-fun res!893956 () Bool)

(assert (=> b!1347283 (=> (not res!893956) (not e!766558))))

(assert (=> b!1347283 (= res!893956 (containsKey!742 lt!595660 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347284 () Bool)

(assert (=> b!1347284 (= e!766558 (contains!9161 lt!595660 (tuple2!24279 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144333 res!893955) b!1347283))

(assert (= (and b!1347283 res!893956) b!1347284))

(assert (=> d!144333 m!1234135))

(declare-fun m!1234217 () Bool)

(assert (=> d!144333 m!1234217))

(declare-fun m!1234219 () Bool)

(assert (=> d!144333 m!1234219))

(declare-fun m!1234221 () Bool)

(assert (=> b!1347283 m!1234221))

(declare-fun m!1234223 () Bool)

(assert (=> b!1347284 m!1234223))

(assert (=> d!144315 d!144333))

(declare-fun b!1347305 () Bool)

(declare-fun e!766569 () List!31434)

(declare-fun call!65074 () List!31434)

(assert (=> b!1347305 (= e!766569 call!65074)))

(declare-fun bm!65071 () Bool)

(declare-fun call!65075 () List!31434)

(assert (=> bm!65071 (= call!65074 call!65075)))

(declare-fun b!1347306 () Bool)

(declare-fun e!766571 () Bool)

(declare-fun lt!595710 () List!31434)

(assert (=> b!1347306 (= e!766571 (contains!9161 lt!595710 (tuple2!24279 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun d!144335 () Bool)

(assert (=> d!144335 e!766571))

(declare-fun res!893962 () Bool)

(assert (=> d!144335 (=> (not res!893962) (not e!766571))))

(assert (=> d!144335 (= res!893962 (isStrictlySorted!881 lt!595710))))

(declare-fun e!766573 () List!31434)

(assert (=> d!144335 (= lt!595710 e!766573)))

(declare-fun c!126362 () Bool)

(assert (=> d!144335 (= c!126362 (and ((_ is Cons!31430) (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12150 (h!32639 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144335 (isStrictlySorted!881 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144335 (= (insertStrictlySorted!494 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!595710)))

(declare-fun b!1347307 () Bool)

(declare-fun e!766570 () List!31434)

(assert (=> b!1347307 (= e!766570 call!65075)))

(declare-fun b!1347308 () Bool)

(assert (=> b!1347308 (= e!766569 call!65074)))

(declare-fun b!1347309 () Bool)

(declare-fun call!65076 () List!31434)

(assert (=> b!1347309 (= e!766573 call!65076)))

(declare-fun e!766572 () List!31434)

(declare-fun b!1347310 () Bool)

(assert (=> b!1347310 (= e!766572 (insertStrictlySorted!494 (t!46028 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347311 () Bool)

(assert (=> b!1347311 (= e!766573 e!766570)))

(declare-fun c!126363 () Bool)

(assert (=> b!1347311 (= c!126363 (and ((_ is Cons!31430) (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12150 (h!32639 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun c!126360 () Bool)

(declare-fun b!1347312 () Bool)

(assert (=> b!1347312 (= e!766572 (ite c!126363 (t!46028 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!126360 (Cons!31430 (h!32639 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!46028 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31431)))))

(declare-fun bm!65072 () Bool)

(declare-fun $colon$colon!672 (List!31434 tuple2!24278) List!31434)

(assert (=> bm!65072 (= call!65076 ($colon$colon!672 e!766572 (ite c!126362 (h!32639 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!24279 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun c!126361 () Bool)

(assert (=> bm!65072 (= c!126361 c!126362)))

(declare-fun bm!65073 () Bool)

(assert (=> bm!65073 (= call!65075 call!65076)))

(declare-fun b!1347313 () Bool)

(assert (=> b!1347313 (= c!126360 (and ((_ is Cons!31430) (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!12150 (h!32639 (toList!10983 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> b!1347313 (= e!766570 e!766569)))

(declare-fun b!1347314 () Bool)

(declare-fun res!893961 () Bool)

(assert (=> b!1347314 (=> (not res!893961) (not e!766571))))

(assert (=> b!1347314 (= res!893961 (containsKey!742 lt!595710 (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (= (and d!144335 c!126362) b!1347309))

(assert (= (and d!144335 (not c!126362)) b!1347311))

(assert (= (and b!1347311 c!126363) b!1347307))

(assert (= (and b!1347311 (not c!126363)) b!1347313))

(assert (= (and b!1347313 c!126360) b!1347308))

(assert (= (and b!1347313 (not c!126360)) b!1347305))

(assert (= (or b!1347308 b!1347305) bm!65071))

(assert (= (or b!1347307 bm!65071) bm!65073))

(assert (= (or b!1347309 bm!65073) bm!65072))

(assert (= (and bm!65072 c!126361) b!1347310))

(assert (= (and bm!65072 (not c!126361)) b!1347312))

(assert (= (and d!144335 res!893962) b!1347314))

(assert (= (and b!1347314 res!893961) b!1347306))

(declare-fun m!1234225 () Bool)

(assert (=> bm!65072 m!1234225))

(declare-fun m!1234227 () Bool)

(assert (=> d!144335 m!1234227))

(declare-fun m!1234229 () Bool)

(assert (=> d!144335 m!1234229))

(declare-fun m!1234231 () Bool)

(assert (=> b!1347314 m!1234231))

(declare-fun m!1234233 () Bool)

(assert (=> b!1347306 m!1234233))

(declare-fun m!1234235 () Bool)

(assert (=> b!1347310 m!1234235))

(assert (=> d!144315 d!144335))

(declare-fun d!144337 () Bool)

(declare-fun res!893967 () Bool)

(declare-fun e!766578 () Bool)

(assert (=> d!144337 (=> res!893967 e!766578)))

(assert (=> d!144337 (= res!893967 (and ((_ is Cons!31430) (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144337 (= (containsKey!742 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!766578)))

(declare-fun b!1347319 () Bool)

(declare-fun e!766579 () Bool)

(assert (=> b!1347319 (= e!766578 e!766579)))

(declare-fun res!893968 () Bool)

(assert (=> b!1347319 (=> (not res!893968) (not e!766579))))

(assert (=> b!1347319 (= res!893968 (and (or (not ((_ is Cons!31430) (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) (bvsle (_1!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)) ((_ is Cons!31430) (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (bvslt (_1!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(declare-fun b!1347320 () Bool)

(assert (=> b!1347320 (= e!766579 (containsKey!742 (t!46028 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(assert (= (and d!144337 (not res!893967)) b!1347319))

(assert (= (and b!1347319 res!893968) b!1347320))

(declare-fun m!1234237 () Bool)

(assert (=> b!1347320 m!1234237))

(assert (=> d!144317 d!144337))

(declare-fun d!144339 () Bool)

(declare-fun e!766580 () Bool)

(assert (=> d!144339 e!766580))

(declare-fun res!893969 () Bool)

(assert (=> d!144339 (=> res!893969 e!766580)))

(declare-fun lt!595711 () Bool)

(assert (=> d!144339 (= res!893969 (not lt!595711))))

(declare-fun lt!595713 () Bool)

(assert (=> d!144339 (= lt!595711 lt!595713)))

(declare-fun lt!595712 () Unit!44143)

(declare-fun e!766581 () Unit!44143)

(assert (=> d!144339 (= lt!595712 e!766581)))

(declare-fun c!126364 () Bool)

(assert (=> d!144339 (= c!126364 lt!595713)))

(assert (=> d!144339 (= lt!595713 (containsKey!742 (toList!10983 lt!595682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144339 (= (contains!9159 lt!595682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!595711)))

(declare-fun b!1347321 () Bool)

(declare-fun lt!595714 () Unit!44143)

(assert (=> b!1347321 (= e!766581 lt!595714)))

(assert (=> b!1347321 (= lt!595714 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347321 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347322 () Bool)

(declare-fun Unit!44152 () Unit!44143)

(assert (=> b!1347322 (= e!766581 Unit!44152)))

(declare-fun b!1347323 () Bool)

(assert (=> b!1347323 (= e!766580 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144339 c!126364) b!1347321))

(assert (= (and d!144339 (not c!126364)) b!1347322))

(assert (= (and d!144339 (not res!893969)) b!1347323))

(declare-fun m!1234239 () Bool)

(assert (=> d!144339 m!1234239))

(declare-fun m!1234241 () Bool)

(assert (=> b!1347321 m!1234241))

(declare-fun m!1234243 () Bool)

(assert (=> b!1347321 m!1234243))

(assert (=> b!1347321 m!1234243))

(declare-fun m!1234245 () Bool)

(assert (=> b!1347321 m!1234245))

(assert (=> b!1347323 m!1234243))

(assert (=> b!1347323 m!1234243))

(assert (=> b!1347323 m!1234245))

(assert (=> b!1347235 d!144339))

(declare-fun d!144341 () Bool)

(declare-fun get!22418 (Option!772) V!55123)

(assert (=> d!144341 (= (apply!1037 lt!595647 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22418 (getValueByKey!720 (toList!10983 lt!595647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38614 () Bool)

(assert (= bs!38614 d!144341))

(assert (=> bs!38614 m!1234195))

(assert (=> bs!38614 m!1234195))

(declare-fun m!1234247 () Bool)

(assert (=> bs!38614 m!1234247))

(assert (=> b!1347189 d!144341))

(declare-fun d!144343 () Bool)

(declare-fun e!766582 () Bool)

(assert (=> d!144343 e!766582))

(declare-fun res!893970 () Bool)

(assert (=> d!144343 (=> res!893970 e!766582)))

(declare-fun lt!595715 () Bool)

(assert (=> d!144343 (= res!893970 (not lt!595715))))

(declare-fun lt!595717 () Bool)

(assert (=> d!144343 (= lt!595715 lt!595717)))

(declare-fun lt!595716 () Unit!44143)

(declare-fun e!766583 () Unit!44143)

(assert (=> d!144343 (= lt!595716 e!766583)))

(declare-fun c!126365 () Bool)

(assert (=> d!144343 (= c!126365 lt!595717)))

(assert (=> d!144343 (= lt!595717 (containsKey!742 (toList!10983 lt!595682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144343 (= (contains!9159 lt!595682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!595715)))

(declare-fun b!1347324 () Bool)

(declare-fun lt!595718 () Unit!44143)

(assert (=> b!1347324 (= e!766583 lt!595718)))

(assert (=> b!1347324 (= lt!595718 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347324 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1347325 () Bool)

(declare-fun Unit!44153 () Unit!44143)

(assert (=> b!1347325 (= e!766583 Unit!44153)))

(declare-fun b!1347326 () Bool)

(assert (=> b!1347326 (= e!766582 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144343 c!126365) b!1347324))

(assert (= (and d!144343 (not c!126365)) b!1347325))

(assert (= (and d!144343 (not res!893970)) b!1347326))

(declare-fun m!1234249 () Bool)

(assert (=> d!144343 m!1234249))

(declare-fun m!1234251 () Bool)

(assert (=> b!1347324 m!1234251))

(declare-fun m!1234253 () Bool)

(assert (=> b!1347324 m!1234253))

(assert (=> b!1347324 m!1234253))

(declare-fun m!1234255 () Bool)

(assert (=> b!1347324 m!1234255))

(assert (=> b!1347326 m!1234253))

(assert (=> b!1347326 m!1234253))

(assert (=> b!1347326 m!1234255))

(assert (=> d!144319 d!144343))

(assert (=> d!144319 d!144303))

(assert (=> d!144301 d!144303))

(declare-fun d!144345 () Bool)

(declare-fun e!766584 () Bool)

(assert (=> d!144345 e!766584))

(declare-fun res!893971 () Bool)

(assert (=> d!144345 (=> (not res!893971) (not e!766584))))

(declare-fun lt!595720 () ListLongMap!21935)

(assert (=> d!144345 (= res!893971 (contains!9159 lt!595720 (_1!12150 (tuple2!24279 lt!595627 minValue!1245))))))

(declare-fun lt!595719 () List!31434)

(assert (=> d!144345 (= lt!595720 (ListLongMap!21936 lt!595719))))

(declare-fun lt!595721 () Unit!44143)

(declare-fun lt!595722 () Unit!44143)

(assert (=> d!144345 (= lt!595721 lt!595722)))

(assert (=> d!144345 (= (getValueByKey!720 lt!595719 (_1!12150 (tuple2!24279 lt!595627 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595627 minValue!1245))))))

(assert (=> d!144345 (= lt!595722 (lemmaContainsTupThenGetReturnValue!365 lt!595719 (_1!12150 (tuple2!24279 lt!595627 minValue!1245)) (_2!12150 (tuple2!24279 lt!595627 minValue!1245))))))

(assert (=> d!144345 (= lt!595719 (insertStrictlySorted!494 (toList!10983 lt!595640) (_1!12150 (tuple2!24279 lt!595627 minValue!1245)) (_2!12150 (tuple2!24279 lt!595627 minValue!1245))))))

(assert (=> d!144345 (= (+!4838 lt!595640 (tuple2!24279 lt!595627 minValue!1245)) lt!595720)))

(declare-fun b!1347327 () Bool)

(declare-fun res!893972 () Bool)

(assert (=> b!1347327 (=> (not res!893972) (not e!766584))))

(assert (=> b!1347327 (= res!893972 (= (getValueByKey!720 (toList!10983 lt!595720) (_1!12150 (tuple2!24279 lt!595627 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595627 minValue!1245)))))))

(declare-fun b!1347328 () Bool)

(assert (=> b!1347328 (= e!766584 (contains!9161 (toList!10983 lt!595720) (tuple2!24279 lt!595627 minValue!1245)))))

(assert (= (and d!144345 res!893971) b!1347327))

(assert (= (and b!1347327 res!893972) b!1347328))

(declare-fun m!1234257 () Bool)

(assert (=> d!144345 m!1234257))

(declare-fun m!1234259 () Bool)

(assert (=> d!144345 m!1234259))

(declare-fun m!1234261 () Bool)

(assert (=> d!144345 m!1234261))

(declare-fun m!1234263 () Bool)

(assert (=> d!144345 m!1234263))

(declare-fun m!1234265 () Bool)

(assert (=> b!1347327 m!1234265))

(declare-fun m!1234267 () Bool)

(assert (=> b!1347328 m!1234267))

(assert (=> b!1347187 d!144345))

(declare-fun d!144347 () Bool)

(declare-fun e!766585 () Bool)

(assert (=> d!144347 e!766585))

(declare-fun res!893973 () Bool)

(assert (=> d!144347 (=> (not res!893973) (not e!766585))))

(declare-fun lt!595724 () ListLongMap!21935)

(assert (=> d!144347 (= res!893973 (contains!9159 lt!595724 (_1!12150 (tuple2!24279 lt!595639 minValue!1245))))))

(declare-fun lt!595723 () List!31434)

(assert (=> d!144347 (= lt!595724 (ListLongMap!21936 lt!595723))))

(declare-fun lt!595725 () Unit!44143)

(declare-fun lt!595726 () Unit!44143)

(assert (=> d!144347 (= lt!595725 lt!595726)))

(assert (=> d!144347 (= (getValueByKey!720 lt!595723 (_1!12150 (tuple2!24279 lt!595639 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595639 minValue!1245))))))

(assert (=> d!144347 (= lt!595726 (lemmaContainsTupThenGetReturnValue!365 lt!595723 (_1!12150 (tuple2!24279 lt!595639 minValue!1245)) (_2!12150 (tuple2!24279 lt!595639 minValue!1245))))))

(assert (=> d!144347 (= lt!595723 (insertStrictlySorted!494 (toList!10983 lt!595630) (_1!12150 (tuple2!24279 lt!595639 minValue!1245)) (_2!12150 (tuple2!24279 lt!595639 minValue!1245))))))

(assert (=> d!144347 (= (+!4838 lt!595630 (tuple2!24279 lt!595639 minValue!1245)) lt!595724)))

(declare-fun b!1347329 () Bool)

(declare-fun res!893974 () Bool)

(assert (=> b!1347329 (=> (not res!893974) (not e!766585))))

(assert (=> b!1347329 (= res!893974 (= (getValueByKey!720 (toList!10983 lt!595724) (_1!12150 (tuple2!24279 lt!595639 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595639 minValue!1245)))))))

(declare-fun b!1347330 () Bool)

(assert (=> b!1347330 (= e!766585 (contains!9161 (toList!10983 lt!595724) (tuple2!24279 lt!595639 minValue!1245)))))

(assert (= (and d!144347 res!893973) b!1347329))

(assert (= (and b!1347329 res!893974) b!1347330))

(declare-fun m!1234269 () Bool)

(assert (=> d!144347 m!1234269))

(declare-fun m!1234271 () Bool)

(assert (=> d!144347 m!1234271))

(declare-fun m!1234273 () Bool)

(assert (=> d!144347 m!1234273))

(declare-fun m!1234275 () Bool)

(assert (=> d!144347 m!1234275))

(declare-fun m!1234277 () Bool)

(assert (=> b!1347329 m!1234277))

(declare-fun m!1234279 () Bool)

(assert (=> b!1347330 m!1234279))

(assert (=> b!1347187 d!144347))

(declare-fun d!144349 () Bool)

(assert (=> d!144349 (= (apply!1037 lt!595630 lt!595646) (get!22418 (getValueByKey!720 (toList!10983 lt!595630) lt!595646)))))

(declare-fun bs!38615 () Bool)

(assert (= bs!38615 d!144349))

(declare-fun m!1234281 () Bool)

(assert (=> bs!38615 m!1234281))

(assert (=> bs!38615 m!1234281))

(declare-fun m!1234283 () Bool)

(assert (=> bs!38615 m!1234283))

(assert (=> b!1347187 d!144349))

(declare-fun d!144351 () Bool)

(assert (=> d!144351 (= (apply!1037 (+!4838 lt!595640 (tuple2!24279 lt!595627 minValue!1245)) lt!595632) (apply!1037 lt!595640 lt!595632))))

(declare-fun lt!595729 () Unit!44143)

(declare-fun choose!1972 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> d!144351 (= lt!595729 (choose!1972 lt!595640 lt!595627 minValue!1245 lt!595632))))

(declare-fun e!766588 () Bool)

(assert (=> d!144351 e!766588))

(declare-fun res!893977 () Bool)

(assert (=> d!144351 (=> (not res!893977) (not e!766588))))

(assert (=> d!144351 (= res!893977 (contains!9159 lt!595640 lt!595632))))

(assert (=> d!144351 (= (addApplyDifferent!579 lt!595640 lt!595627 minValue!1245 lt!595632) lt!595729)))

(declare-fun b!1347334 () Bool)

(assert (=> b!1347334 (= e!766588 (not (= lt!595632 lt!595627)))))

(assert (= (and d!144351 res!893977) b!1347334))

(assert (=> d!144351 m!1234081))

(assert (=> d!144351 m!1234105))

(assert (=> d!144351 m!1234081))

(assert (=> d!144351 m!1234093))

(declare-fun m!1234285 () Bool)

(assert (=> d!144351 m!1234285))

(declare-fun m!1234287 () Bool)

(assert (=> d!144351 m!1234287))

(assert (=> b!1347187 d!144351))

(declare-fun d!144353 () Bool)

(assert (=> d!144353 (= (apply!1037 (+!4838 lt!595630 (tuple2!24279 lt!595639 minValue!1245)) lt!595646) (apply!1037 lt!595630 lt!595646))))

(declare-fun lt!595730 () Unit!44143)

(assert (=> d!144353 (= lt!595730 (choose!1972 lt!595630 lt!595639 minValue!1245 lt!595646))))

(declare-fun e!766589 () Bool)

(assert (=> d!144353 e!766589))

(declare-fun res!893978 () Bool)

(assert (=> d!144353 (=> (not res!893978) (not e!766589))))

(assert (=> d!144353 (= res!893978 (contains!9159 lt!595630 lt!595646))))

(assert (=> d!144353 (= (addApplyDifferent!579 lt!595630 lt!595639 minValue!1245 lt!595646) lt!595730)))

(declare-fun b!1347335 () Bool)

(assert (=> b!1347335 (= e!766589 (not (= lt!595646 lt!595639)))))

(assert (= (and d!144353 res!893978) b!1347335))

(assert (=> d!144353 m!1234087))

(assert (=> d!144353 m!1234107))

(assert (=> d!144353 m!1234087))

(assert (=> d!144353 m!1234089))

(declare-fun m!1234289 () Bool)

(assert (=> d!144353 m!1234289))

(declare-fun m!1234291 () Bool)

(assert (=> d!144353 m!1234291))

(assert (=> b!1347187 d!144353))

(declare-fun b!1347336 () Bool)

(declare-fun res!893982 () Bool)

(declare-fun e!766595 () Bool)

(assert (=> b!1347336 (=> (not res!893982) (not e!766595))))

(declare-fun lt!595731 () ListLongMap!21935)

(assert (=> b!1347336 (= res!893982 (not (contains!9159 lt!595731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144355 () Bool)

(assert (=> d!144355 e!766595))

(declare-fun res!893980 () Bool)

(assert (=> d!144355 (=> (not res!893980) (not e!766595))))

(assert (=> d!144355 (= res!893980 (not (contains!9159 lt!595731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766591 () ListLongMap!21935)

(assert (=> d!144355 (= lt!595731 e!766591)))

(declare-fun c!126368 () Bool)

(assert (=> d!144355 (= c!126368 (bvsge from!1960 (size!44937 _keys!1571)))))

(assert (=> d!144355 (validMask!0 mask!1977)))

(assert (=> d!144355 (= (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!595731)))

(declare-fun b!1347337 () Bool)

(assert (=> b!1347337 (= e!766591 (ListLongMap!21936 Nil!31431))))

(declare-fun b!1347338 () Bool)

(declare-fun e!766596 () Bool)

(declare-fun e!766594 () Bool)

(assert (=> b!1347338 (= e!766596 e!766594)))

(declare-fun c!126367 () Bool)

(assert (=> b!1347338 (= c!126367 (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun b!1347339 () Bool)

(assert (=> b!1347339 (= e!766594 (isEmpty!1091 lt!595731))))

(declare-fun call!65077 () ListLongMap!21935)

(declare-fun bm!65074 () Bool)

(assert (=> bm!65074 (= call!65077 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347340 () Bool)

(assert (=> b!1347340 (= e!766594 (= lt!595731 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347341 () Bool)

(declare-fun e!766593 () Bool)

(assert (=> b!1347341 (= e!766593 (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)))))

(assert (=> b!1347341 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1347342 () Bool)

(declare-fun e!766592 () ListLongMap!21935)

(assert (=> b!1347342 (= e!766591 e!766592)))

(declare-fun c!126369 () Bool)

(assert (=> b!1347342 (= c!126369 (validKeyInArray!0 (select (arr!44387 _keys!1571) from!1960)))))

(declare-fun b!1347343 () Bool)

(assert (=> b!1347343 (= e!766592 call!65077)))

(declare-fun b!1347344 () Bool)

(assert (=> b!1347344 (= e!766595 e!766596)))

(declare-fun c!126366 () Bool)

(assert (=> b!1347344 (= c!126366 e!766593)))

(declare-fun res!893979 () Bool)

(assert (=> b!1347344 (=> (not res!893979) (not e!766593))))

(assert (=> b!1347344 (= res!893979 (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun b!1347345 () Bool)

(assert (=> b!1347345 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)))))

(assert (=> b!1347345 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44938 _values!1303)))))

(declare-fun e!766590 () Bool)

(assert (=> b!1347345 (= e!766590 (= (apply!1037 lt!595731 (select (arr!44387 _keys!1571) from!1960)) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347346 () Bool)

(declare-fun lt!595737 () Unit!44143)

(declare-fun lt!595735 () Unit!44143)

(assert (=> b!1347346 (= lt!595737 lt!595735)))

(declare-fun lt!595733 () ListLongMap!21935)

(declare-fun lt!595736 () V!55123)

(declare-fun lt!595732 () (_ BitVec 64))

(declare-fun lt!595734 () (_ BitVec 64))

(assert (=> b!1347346 (not (contains!9159 (+!4838 lt!595733 (tuple2!24279 lt!595732 lt!595736)) lt!595734))))

(assert (=> b!1347346 (= lt!595735 (addStillNotContains!501 lt!595733 lt!595732 lt!595736 lt!595734))))

(assert (=> b!1347346 (= lt!595734 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347346 (= lt!595736 (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347346 (= lt!595732 (select (arr!44387 _keys!1571) from!1960))))

(assert (=> b!1347346 (= lt!595733 call!65077)))

(assert (=> b!1347346 (= e!766592 (+!4838 call!65077 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347347 () Bool)

(assert (=> b!1347347 (= e!766596 e!766590)))

(assert (=> b!1347347 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44937 _keys!1571)))))

(declare-fun res!893981 () Bool)

(assert (=> b!1347347 (= res!893981 (contains!9159 lt!595731 (select (arr!44387 _keys!1571) from!1960)))))

(assert (=> b!1347347 (=> (not res!893981) (not e!766590))))

(assert (= (and d!144355 c!126368) b!1347337))

(assert (= (and d!144355 (not c!126368)) b!1347342))

(assert (= (and b!1347342 c!126369) b!1347346))

(assert (= (and b!1347342 (not c!126369)) b!1347343))

(assert (= (or b!1347346 b!1347343) bm!65074))

(assert (= (and d!144355 res!893980) b!1347336))

(assert (= (and b!1347336 res!893982) b!1347344))

(assert (= (and b!1347344 res!893979) b!1347341))

(assert (= (and b!1347344 c!126366) b!1347347))

(assert (= (and b!1347344 (not c!126366)) b!1347338))

(assert (= (and b!1347347 res!893981) b!1347345))

(assert (= (and b!1347338 c!126367) b!1347340))

(assert (= (and b!1347338 (not c!126367)) b!1347339))

(declare-fun b_lambda!24577 () Bool)

(assert (=> (not b_lambda!24577) (not b!1347345)))

(assert (=> b!1347345 t!46026))

(declare-fun b_and!50819 () Bool)

(assert (= b_and!50817 (and (=> t!46026 result!25885) b_and!50819)))

(declare-fun b_lambda!24579 () Bool)

(assert (=> (not b_lambda!24579) (not b!1347346)))

(assert (=> b!1347346 t!46026))

(declare-fun b_and!50821 () Bool)

(assert (= b_and!50819 (and (=> t!46026 result!25885) b_and!50821)))

(declare-fun m!1234293 () Bool)

(assert (=> b!1347340 m!1234293))

(assert (=> b!1347346 m!1233991))

(assert (=> b!1347346 m!1233993))

(assert (=> b!1347346 m!1233995))

(declare-fun m!1234295 () Bool)

(assert (=> b!1347346 m!1234295))

(declare-fun m!1234297 () Bool)

(assert (=> b!1347346 m!1234297))

(declare-fun m!1234299 () Bool)

(assert (=> b!1347346 m!1234299))

(assert (=> b!1347346 m!1233979))

(declare-fun m!1234301 () Bool)

(assert (=> b!1347346 m!1234301))

(assert (=> b!1347346 m!1234295))

(assert (=> b!1347346 m!1233991))

(assert (=> b!1347346 m!1233993))

(assert (=> b!1347341 m!1233979))

(assert (=> b!1347341 m!1233979))

(assert (=> b!1347341 m!1233981))

(declare-fun m!1234303 () Bool)

(assert (=> b!1347336 m!1234303))

(assert (=> b!1347342 m!1233979))

(assert (=> b!1347342 m!1233979))

(assert (=> b!1347342 m!1233981))

(declare-fun m!1234305 () Bool)

(assert (=> b!1347339 m!1234305))

(assert (=> b!1347345 m!1233991))

(assert (=> b!1347345 m!1233993))

(assert (=> b!1347345 m!1233995))

(assert (=> b!1347345 m!1233979))

(assert (=> b!1347345 m!1233979))

(declare-fun m!1234307 () Bool)

(assert (=> b!1347345 m!1234307))

(assert (=> b!1347345 m!1233991))

(assert (=> b!1347345 m!1233993))

(assert (=> b!1347347 m!1233979))

(assert (=> b!1347347 m!1233979))

(declare-fun m!1234309 () Bool)

(assert (=> b!1347347 m!1234309))

(declare-fun m!1234311 () Bool)

(assert (=> d!144355 m!1234311))

(assert (=> d!144355 m!1234005))

(assert (=> bm!65074 m!1234293))

(assert (=> b!1347187 d!144355))

(declare-fun d!144357 () Bool)

(assert (=> d!144357 (= (apply!1037 lt!595640 lt!595632) (get!22418 (getValueByKey!720 (toList!10983 lt!595640) lt!595632)))))

(declare-fun bs!38616 () Bool)

(assert (= bs!38616 d!144357))

(declare-fun m!1234313 () Bool)

(assert (=> bs!38616 m!1234313))

(assert (=> bs!38616 m!1234313))

(declare-fun m!1234315 () Bool)

(assert (=> bs!38616 m!1234315))

(assert (=> b!1347187 d!144357))

(declare-fun d!144359 () Bool)

(assert (=> d!144359 (= (apply!1037 (+!4838 lt!595628 (tuple2!24279 lt!595631 zeroValue!1245)) lt!595644) (apply!1037 lt!595628 lt!595644))))

(declare-fun lt!595738 () Unit!44143)

(assert (=> d!144359 (= lt!595738 (choose!1972 lt!595628 lt!595631 zeroValue!1245 lt!595644))))

(declare-fun e!766597 () Bool)

(assert (=> d!144359 e!766597))

(declare-fun res!893983 () Bool)

(assert (=> d!144359 (=> (not res!893983) (not e!766597))))

(assert (=> d!144359 (= res!893983 (contains!9159 lt!595628 lt!595644))))

(assert (=> d!144359 (= (addApplyDifferent!579 lt!595628 lt!595631 zeroValue!1245 lt!595644) lt!595738)))

(declare-fun b!1347348 () Bool)

(assert (=> b!1347348 (= e!766597 (not (= lt!595644 lt!595631)))))

(assert (= (and d!144359 res!893983) b!1347348))

(assert (=> d!144359 m!1234083))

(assert (=> d!144359 m!1234101))

(assert (=> d!144359 m!1234083))

(assert (=> d!144359 m!1234085))

(declare-fun m!1234317 () Bool)

(assert (=> d!144359 m!1234317))

(declare-fun m!1234319 () Bool)

(assert (=> d!144359 m!1234319))

(assert (=> b!1347187 d!144359))

(declare-fun d!144361 () Bool)

(assert (=> d!144361 (contains!9159 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245)) lt!595642)))

(declare-fun lt!595741 () Unit!44143)

(declare-fun choose!1973 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> d!144361 (= lt!595741 (choose!1973 lt!595637 lt!595636 zeroValue!1245 lt!595642))))

(assert (=> d!144361 (contains!9159 lt!595637 lt!595642)))

(assert (=> d!144361 (= (addStillContains!1212 lt!595637 lt!595636 zeroValue!1245 lt!595642) lt!595741)))

(declare-fun bs!38617 () Bool)

(assert (= bs!38617 d!144361))

(assert (=> bs!38617 m!1234095))

(assert (=> bs!38617 m!1234095))

(assert (=> bs!38617 m!1234097))

(declare-fun m!1234321 () Bool)

(assert (=> bs!38617 m!1234321))

(declare-fun m!1234323 () Bool)

(assert (=> bs!38617 m!1234323))

(assert (=> b!1347187 d!144361))

(declare-fun d!144363 () Bool)

(declare-fun e!766598 () Bool)

(assert (=> d!144363 e!766598))

(declare-fun res!893984 () Bool)

(assert (=> d!144363 (=> (not res!893984) (not e!766598))))

(declare-fun lt!595743 () ListLongMap!21935)

(assert (=> d!144363 (= res!893984 (contains!9159 lt!595743 (_1!12150 (tuple2!24279 lt!595631 zeroValue!1245))))))

(declare-fun lt!595742 () List!31434)

(assert (=> d!144363 (= lt!595743 (ListLongMap!21936 lt!595742))))

(declare-fun lt!595744 () Unit!44143)

(declare-fun lt!595745 () Unit!44143)

(assert (=> d!144363 (= lt!595744 lt!595745)))

(assert (=> d!144363 (= (getValueByKey!720 lt!595742 (_1!12150 (tuple2!24279 lt!595631 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595631 zeroValue!1245))))))

(assert (=> d!144363 (= lt!595745 (lemmaContainsTupThenGetReturnValue!365 lt!595742 (_1!12150 (tuple2!24279 lt!595631 zeroValue!1245)) (_2!12150 (tuple2!24279 lt!595631 zeroValue!1245))))))

(assert (=> d!144363 (= lt!595742 (insertStrictlySorted!494 (toList!10983 lt!595628) (_1!12150 (tuple2!24279 lt!595631 zeroValue!1245)) (_2!12150 (tuple2!24279 lt!595631 zeroValue!1245))))))

(assert (=> d!144363 (= (+!4838 lt!595628 (tuple2!24279 lt!595631 zeroValue!1245)) lt!595743)))

(declare-fun b!1347350 () Bool)

(declare-fun res!893985 () Bool)

(assert (=> b!1347350 (=> (not res!893985) (not e!766598))))

(assert (=> b!1347350 (= res!893985 (= (getValueByKey!720 (toList!10983 lt!595743) (_1!12150 (tuple2!24279 lt!595631 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595631 zeroValue!1245)))))))

(declare-fun b!1347351 () Bool)

(assert (=> b!1347351 (= e!766598 (contains!9161 (toList!10983 lt!595743) (tuple2!24279 lt!595631 zeroValue!1245)))))

(assert (= (and d!144363 res!893984) b!1347350))

(assert (= (and b!1347350 res!893985) b!1347351))

(declare-fun m!1234325 () Bool)

(assert (=> d!144363 m!1234325))

(declare-fun m!1234327 () Bool)

(assert (=> d!144363 m!1234327))

(declare-fun m!1234329 () Bool)

(assert (=> d!144363 m!1234329))

(declare-fun m!1234331 () Bool)

(assert (=> d!144363 m!1234331))

(declare-fun m!1234333 () Bool)

(assert (=> b!1347350 m!1234333))

(declare-fun m!1234335 () Bool)

(assert (=> b!1347351 m!1234335))

(assert (=> b!1347187 d!144363))

(declare-fun d!144365 () Bool)

(assert (=> d!144365 (= (apply!1037 (+!4838 lt!595630 (tuple2!24279 lt!595639 minValue!1245)) lt!595646) (get!22418 (getValueByKey!720 (toList!10983 (+!4838 lt!595630 (tuple2!24279 lt!595639 minValue!1245))) lt!595646)))))

(declare-fun bs!38618 () Bool)

(assert (= bs!38618 d!144365))

(declare-fun m!1234337 () Bool)

(assert (=> bs!38618 m!1234337))

(assert (=> bs!38618 m!1234337))

(declare-fun m!1234339 () Bool)

(assert (=> bs!38618 m!1234339))

(assert (=> b!1347187 d!144365))

(declare-fun d!144367 () Bool)

(assert (=> d!144367 (= (apply!1037 (+!4838 lt!595628 (tuple2!24279 lt!595631 zeroValue!1245)) lt!595644) (get!22418 (getValueByKey!720 (toList!10983 (+!4838 lt!595628 (tuple2!24279 lt!595631 zeroValue!1245))) lt!595644)))))

(declare-fun bs!38619 () Bool)

(assert (= bs!38619 d!144367))

(declare-fun m!1234341 () Bool)

(assert (=> bs!38619 m!1234341))

(assert (=> bs!38619 m!1234341))

(declare-fun m!1234343 () Bool)

(assert (=> bs!38619 m!1234343))

(assert (=> b!1347187 d!144367))

(declare-fun d!144369 () Bool)

(assert (=> d!144369 (= (apply!1037 (+!4838 lt!595640 (tuple2!24279 lt!595627 minValue!1245)) lt!595632) (get!22418 (getValueByKey!720 (toList!10983 (+!4838 lt!595640 (tuple2!24279 lt!595627 minValue!1245))) lt!595632)))))

(declare-fun bs!38620 () Bool)

(assert (= bs!38620 d!144369))

(declare-fun m!1234345 () Bool)

(assert (=> bs!38620 m!1234345))

(assert (=> bs!38620 m!1234345))

(declare-fun m!1234347 () Bool)

(assert (=> bs!38620 m!1234347))

(assert (=> b!1347187 d!144369))

(declare-fun d!144371 () Bool)

(declare-fun e!766599 () Bool)

(assert (=> d!144371 e!766599))

(declare-fun res!893986 () Bool)

(assert (=> d!144371 (=> (not res!893986) (not e!766599))))

(declare-fun lt!595747 () ListLongMap!21935)

(assert (=> d!144371 (= res!893986 (contains!9159 lt!595747 (_1!12150 (tuple2!24279 lt!595636 zeroValue!1245))))))

(declare-fun lt!595746 () List!31434)

(assert (=> d!144371 (= lt!595747 (ListLongMap!21936 lt!595746))))

(declare-fun lt!595748 () Unit!44143)

(declare-fun lt!595749 () Unit!44143)

(assert (=> d!144371 (= lt!595748 lt!595749)))

(assert (=> d!144371 (= (getValueByKey!720 lt!595746 (_1!12150 (tuple2!24279 lt!595636 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595636 zeroValue!1245))))))

(assert (=> d!144371 (= lt!595749 (lemmaContainsTupThenGetReturnValue!365 lt!595746 (_1!12150 (tuple2!24279 lt!595636 zeroValue!1245)) (_2!12150 (tuple2!24279 lt!595636 zeroValue!1245))))))

(assert (=> d!144371 (= lt!595746 (insertStrictlySorted!494 (toList!10983 lt!595637) (_1!12150 (tuple2!24279 lt!595636 zeroValue!1245)) (_2!12150 (tuple2!24279 lt!595636 zeroValue!1245))))))

(assert (=> d!144371 (= (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245)) lt!595747)))

(declare-fun b!1347352 () Bool)

(declare-fun res!893987 () Bool)

(assert (=> b!1347352 (=> (not res!893987) (not e!766599))))

(assert (=> b!1347352 (= res!893987 (= (getValueByKey!720 (toList!10983 lt!595747) (_1!12150 (tuple2!24279 lt!595636 zeroValue!1245))) (Some!771 (_2!12150 (tuple2!24279 lt!595636 zeroValue!1245)))))))

(declare-fun b!1347353 () Bool)

(assert (=> b!1347353 (= e!766599 (contains!9161 (toList!10983 lt!595747) (tuple2!24279 lt!595636 zeroValue!1245)))))

(assert (= (and d!144371 res!893986) b!1347352))

(assert (= (and b!1347352 res!893987) b!1347353))

(declare-fun m!1234349 () Bool)

(assert (=> d!144371 m!1234349))

(declare-fun m!1234351 () Bool)

(assert (=> d!144371 m!1234351))

(declare-fun m!1234353 () Bool)

(assert (=> d!144371 m!1234353))

(declare-fun m!1234355 () Bool)

(assert (=> d!144371 m!1234355))

(declare-fun m!1234357 () Bool)

(assert (=> b!1347352 m!1234357))

(declare-fun m!1234359 () Bool)

(assert (=> b!1347353 m!1234359))

(assert (=> b!1347187 d!144371))

(declare-fun d!144373 () Bool)

(assert (=> d!144373 (= (apply!1037 lt!595628 lt!595644) (get!22418 (getValueByKey!720 (toList!10983 lt!595628) lt!595644)))))

(declare-fun bs!38621 () Bool)

(assert (= bs!38621 d!144373))

(declare-fun m!1234361 () Bool)

(assert (=> bs!38621 m!1234361))

(assert (=> bs!38621 m!1234361))

(declare-fun m!1234363 () Bool)

(assert (=> bs!38621 m!1234363))

(assert (=> b!1347187 d!144373))

(declare-fun d!144375 () Bool)

(declare-fun e!766600 () Bool)

(assert (=> d!144375 e!766600))

(declare-fun res!893988 () Bool)

(assert (=> d!144375 (=> res!893988 e!766600)))

(declare-fun lt!595750 () Bool)

(assert (=> d!144375 (= res!893988 (not lt!595750))))

(declare-fun lt!595752 () Bool)

(assert (=> d!144375 (= lt!595750 lt!595752)))

(declare-fun lt!595751 () Unit!44143)

(declare-fun e!766601 () Unit!44143)

(assert (=> d!144375 (= lt!595751 e!766601)))

(declare-fun c!126370 () Bool)

(assert (=> d!144375 (= c!126370 lt!595752)))

(assert (=> d!144375 (= lt!595752 (containsKey!742 (toList!10983 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245))) lt!595642))))

(assert (=> d!144375 (= (contains!9159 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245)) lt!595642) lt!595750)))

(declare-fun b!1347354 () Bool)

(declare-fun lt!595753 () Unit!44143)

(assert (=> b!1347354 (= e!766601 lt!595753)))

(assert (=> b!1347354 (= lt!595753 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245))) lt!595642))))

(assert (=> b!1347354 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245))) lt!595642))))

(declare-fun b!1347355 () Bool)

(declare-fun Unit!44154 () Unit!44143)

(assert (=> b!1347355 (= e!766601 Unit!44154)))

(declare-fun b!1347356 () Bool)

(assert (=> b!1347356 (= e!766600 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 lt!595637 (tuple2!24279 lt!595636 zeroValue!1245))) lt!595642)))))

(assert (= (and d!144375 c!126370) b!1347354))

(assert (= (and d!144375 (not c!126370)) b!1347355))

(assert (= (and d!144375 (not res!893988)) b!1347356))

(declare-fun m!1234365 () Bool)

(assert (=> d!144375 m!1234365))

(declare-fun m!1234367 () Bool)

(assert (=> b!1347354 m!1234367))

(declare-fun m!1234369 () Bool)

(assert (=> b!1347354 m!1234369))

(assert (=> b!1347354 m!1234369))

(declare-fun m!1234371 () Bool)

(assert (=> b!1347354 m!1234371))

(assert (=> b!1347356 m!1234369))

(assert (=> b!1347356 m!1234369))

(assert (=> b!1347356 m!1234371))

(assert (=> b!1347187 d!144375))

(declare-fun d!144377 () Bool)

(declare-fun res!893989 () Bool)

(declare-fun e!766602 () Bool)

(assert (=> d!144377 (=> res!893989 e!766602)))

(assert (=> d!144377 (= res!893989 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144377 (= (containsKey!742 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!766602)))

(declare-fun b!1347357 () Bool)

(declare-fun e!766603 () Bool)

(assert (=> b!1347357 (= e!766602 e!766603)))

(declare-fun res!893990 () Bool)

(assert (=> b!1347357 (=> (not res!893990) (not e!766603))))

(assert (=> b!1347357 (= res!893990 (and (or (not ((_ is Cons!31430) (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31430) (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1347358 () Bool)

(assert (=> b!1347358 (= e!766603 (containsKey!742 (t!46028 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144377 (not res!893989)) b!1347357))

(assert (= (and b!1347357 res!893990) b!1347358))

(declare-fun m!1234373 () Bool)

(assert (=> b!1347358 m!1234373))

(assert (=> d!144299 d!144377))

(declare-fun d!144379 () Bool)

(declare-fun e!766604 () Bool)

(assert (=> d!144379 e!766604))

(declare-fun res!893991 () Bool)

(assert (=> d!144379 (=> res!893991 e!766604)))

(declare-fun lt!595754 () Bool)

(assert (=> d!144379 (= res!893991 (not lt!595754))))

(declare-fun lt!595756 () Bool)

(assert (=> d!144379 (= lt!595754 lt!595756)))

(declare-fun lt!595755 () Unit!44143)

(declare-fun e!766605 () Unit!44143)

(assert (=> d!144379 (= lt!595755 e!766605)))

(declare-fun c!126371 () Bool)

(assert (=> d!144379 (= c!126371 lt!595756)))

(assert (=> d!144379 (= lt!595756 (containsKey!742 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144379 (= (contains!9159 lt!595657 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595754)))

(declare-fun b!1347359 () Bool)

(declare-fun lt!595757 () Unit!44143)

(assert (=> b!1347359 (= e!766605 lt!595757)))

(assert (=> b!1347359 (= lt!595757 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1347359 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347360 () Bool)

(declare-fun Unit!44155 () Unit!44143)

(assert (=> b!1347360 (= e!766605 Unit!44155)))

(declare-fun b!1347361 () Bool)

(assert (=> b!1347361 (= e!766604 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144379 c!126371) b!1347359))

(assert (= (and d!144379 (not c!126371)) b!1347360))

(assert (= (and d!144379 (not res!893991)) b!1347361))

(declare-fun m!1234375 () Bool)

(assert (=> d!144379 m!1234375))

(declare-fun m!1234377 () Bool)

(assert (=> b!1347359 m!1234377))

(assert (=> b!1347359 m!1234125))

(assert (=> b!1347359 m!1234125))

(declare-fun m!1234379 () Bool)

(assert (=> b!1347359 m!1234379))

(assert (=> b!1347361 m!1234125))

(assert (=> b!1347361 m!1234125))

(assert (=> b!1347361 m!1234379))

(assert (=> d!144311 d!144379))

(declare-fun e!766607 () Option!772)

(declare-fun b!1347364 () Bool)

(assert (=> b!1347364 (= e!766607 (getValueByKey!720 (t!46028 lt!595656) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347365 () Bool)

(assert (=> b!1347365 (= e!766607 None!770)))

(declare-fun b!1347363 () Bool)

(declare-fun e!766606 () Option!772)

(assert (=> b!1347363 (= e!766606 e!766607)))

(declare-fun c!126373 () Bool)

(assert (=> b!1347363 (= c!126373 (and ((_ is Cons!31430) lt!595656) (not (= (_1!12150 (h!32639 lt!595656)) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1347362 () Bool)

(assert (=> b!1347362 (= e!766606 (Some!771 (_2!12150 (h!32639 lt!595656))))))

(declare-fun d!144381 () Bool)

(declare-fun c!126372 () Bool)

(assert (=> d!144381 (= c!126372 (and ((_ is Cons!31430) lt!595656) (= (_1!12150 (h!32639 lt!595656)) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144381 (= (getValueByKey!720 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!766606)))

(assert (= (and d!144381 c!126372) b!1347362))

(assert (= (and d!144381 (not c!126372)) b!1347363))

(assert (= (and b!1347363 c!126373) b!1347364))

(assert (= (and b!1347363 (not c!126373)) b!1347365))

(declare-fun m!1234381 () Bool)

(assert (=> b!1347364 m!1234381))

(assert (=> d!144311 d!144381))

(declare-fun d!144383 () Bool)

(assert (=> d!144383 (= (getValueByKey!720 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!771 (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595758 () Unit!44143)

(assert (=> d!144383 (= lt!595758 (choose!1971 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!766608 () Bool)

(assert (=> d!144383 e!766608))

(declare-fun res!893992 () Bool)

(assert (=> d!144383 (=> (not res!893992) (not e!766608))))

(assert (=> d!144383 (= res!893992 (isStrictlySorted!881 lt!595656))))

(assert (=> d!144383 (= (lemmaContainsTupThenGetReturnValue!365 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595758)))

(declare-fun b!1347366 () Bool)

(declare-fun res!893993 () Bool)

(assert (=> b!1347366 (=> (not res!893993) (not e!766608))))

(assert (=> b!1347366 (= res!893993 (containsKey!742 lt!595656 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347367 () Bool)

(assert (=> b!1347367 (= e!766608 (contains!9161 lt!595656 (tuple2!24279 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144383 res!893992) b!1347366))

(assert (= (and b!1347366 res!893993) b!1347367))

(assert (=> d!144383 m!1234119))

(declare-fun m!1234383 () Bool)

(assert (=> d!144383 m!1234383))

(declare-fun m!1234385 () Bool)

(assert (=> d!144383 m!1234385))

(declare-fun m!1234387 () Bool)

(assert (=> b!1347366 m!1234387))

(declare-fun m!1234389 () Bool)

(assert (=> b!1347367 m!1234389))

(assert (=> d!144311 d!144383))

(declare-fun b!1347368 () Bool)

(declare-fun e!766609 () List!31434)

(declare-fun call!65078 () List!31434)

(assert (=> b!1347368 (= e!766609 call!65078)))

(declare-fun bm!65075 () Bool)

(declare-fun call!65079 () List!31434)

(assert (=> bm!65075 (= call!65078 call!65079)))

(declare-fun b!1347369 () Bool)

(declare-fun e!766611 () Bool)

(declare-fun lt!595759 () List!31434)

(assert (=> b!1347369 (= e!766611 (contains!9161 lt!595759 (tuple2!24279 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!144385 () Bool)

(assert (=> d!144385 e!766611))

(declare-fun res!893995 () Bool)

(assert (=> d!144385 (=> (not res!893995) (not e!766611))))

(assert (=> d!144385 (= res!893995 (isStrictlySorted!881 lt!595759))))

(declare-fun e!766613 () List!31434)

(assert (=> d!144385 (= lt!595759 e!766613)))

(declare-fun c!126376 () Bool)

(assert (=> d!144385 (= c!126376 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12150 (h!32639 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144385 (isStrictlySorted!881 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!144385 (= (insertStrictlySorted!494 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!595759)))

(declare-fun b!1347370 () Bool)

(declare-fun e!766610 () List!31434)

(assert (=> b!1347370 (= e!766610 call!65079)))

(declare-fun b!1347371 () Bool)

(assert (=> b!1347371 (= e!766609 call!65078)))

(declare-fun b!1347372 () Bool)

(declare-fun call!65080 () List!31434)

(assert (=> b!1347372 (= e!766613 call!65080)))

(declare-fun b!1347373 () Bool)

(declare-fun e!766612 () List!31434)

(assert (=> b!1347373 (= e!766612 (insertStrictlySorted!494 (t!46028 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347374 () Bool)

(assert (=> b!1347374 (= e!766613 e!766610)))

(declare-fun c!126377 () Bool)

(assert (=> b!1347374 (= c!126377 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12150 (h!32639 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!126374 () Bool)

(declare-fun b!1347375 () Bool)

(assert (=> b!1347375 (= e!766612 (ite c!126377 (t!46028 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126374 (Cons!31430 (h!32639 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46028 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31431)))))

(declare-fun bm!65076 () Bool)

(assert (=> bm!65076 (= call!65080 ($colon$colon!672 e!766612 (ite c!126376 (h!32639 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24279 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126375 () Bool)

(assert (=> bm!65076 (= c!126375 c!126376)))

(declare-fun bm!65077 () Bool)

(assert (=> bm!65077 (= call!65079 call!65080)))

(declare-fun b!1347376 () Bool)

(assert (=> b!1347376 (= c!126374 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12150 (h!32639 (toList!10983 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1347376 (= e!766610 e!766609)))

(declare-fun b!1347377 () Bool)

(declare-fun res!893994 () Bool)

(assert (=> b!1347377 (=> (not res!893994) (not e!766611))))

(assert (=> b!1347377 (= res!893994 (containsKey!742 lt!595759 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144385 c!126376) b!1347372))

(assert (= (and d!144385 (not c!126376)) b!1347374))

(assert (= (and b!1347374 c!126377) b!1347370))

(assert (= (and b!1347374 (not c!126377)) b!1347376))

(assert (= (and b!1347376 c!126374) b!1347371))

(assert (= (and b!1347376 (not c!126374)) b!1347368))

(assert (= (or b!1347371 b!1347368) bm!65075))

(assert (= (or b!1347370 bm!65075) bm!65077))

(assert (= (or b!1347372 bm!65077) bm!65076))

(assert (= (and bm!65076 c!126375) b!1347373))

(assert (= (and bm!65076 (not c!126375)) b!1347375))

(assert (= (and d!144385 res!893995) b!1347377))

(assert (= (and b!1347377 res!893994) b!1347369))

(declare-fun m!1234391 () Bool)

(assert (=> bm!65076 m!1234391))

(declare-fun m!1234393 () Bool)

(assert (=> d!144385 m!1234393))

(declare-fun m!1234395 () Bool)

(assert (=> d!144385 m!1234395))

(declare-fun m!1234397 () Bool)

(assert (=> b!1347377 m!1234397))

(declare-fun m!1234399 () Bool)

(assert (=> b!1347369 m!1234399))

(declare-fun m!1234401 () Bool)

(assert (=> b!1347373 m!1234401))

(assert (=> d!144311 d!144385))

(declare-fun d!144387 () Bool)

(assert (=> d!144387 (= (get!22416 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21480 (select (arr!44388 _values!1303) from!1960)))))

(assert (=> b!1347204 d!144387))

(declare-fun d!144389 () Bool)

(declare-fun e!766614 () Bool)

(assert (=> d!144389 e!766614))

(declare-fun res!893996 () Bool)

(assert (=> d!144389 (=> res!893996 e!766614)))

(declare-fun lt!595760 () Bool)

(assert (=> d!144389 (= res!893996 (not lt!595760))))

(declare-fun lt!595762 () Bool)

(assert (=> d!144389 (= lt!595760 lt!595762)))

(declare-fun lt!595761 () Unit!44143)

(declare-fun e!766615 () Unit!44143)

(assert (=> d!144389 (= lt!595761 e!766615)))

(declare-fun c!126378 () Bool)

(assert (=> d!144389 (= c!126378 lt!595762)))

(assert (=> d!144389 (= lt!595762 (containsKey!742 (toList!10983 lt!595682) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144389 (= (contains!9159 lt!595682 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!595760)))

(declare-fun b!1347378 () Bool)

(declare-fun lt!595763 () Unit!44143)

(assert (=> b!1347378 (= e!766615 lt!595763)))

(assert (=> b!1347378 (= lt!595763 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 lt!595682) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1347378 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1347379 () Bool)

(declare-fun Unit!44156 () Unit!44143)

(assert (=> b!1347379 (= e!766615 Unit!44156)))

(declare-fun b!1347380 () Bool)

(assert (=> b!1347380 (= e!766614 (isDefined!527 (getValueByKey!720 (toList!10983 lt!595682) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144389 c!126378) b!1347378))

(assert (= (and d!144389 (not c!126378)) b!1347379))

(assert (= (and d!144389 (not res!893996)) b!1347380))

(assert (=> d!144389 m!1234165))

(declare-fun m!1234403 () Bool)

(assert (=> d!144389 m!1234403))

(assert (=> b!1347378 m!1234165))

(declare-fun m!1234405 () Bool)

(assert (=> b!1347378 m!1234405))

(assert (=> b!1347378 m!1234165))

(declare-fun m!1234407 () Bool)

(assert (=> b!1347378 m!1234407))

(assert (=> b!1347378 m!1234407))

(declare-fun m!1234409 () Bool)

(assert (=> b!1347378 m!1234409))

(assert (=> b!1347380 m!1234165))

(assert (=> b!1347380 m!1234407))

(assert (=> b!1347380 m!1234407))

(assert (=> b!1347380 m!1234409))

(assert (=> b!1347246 d!144389))

(declare-fun d!144391 () Bool)

(assert (=> d!144391 (= (apply!1037 lt!595647 (select (arr!44387 _keys!1571) from!1960)) (get!22418 (getValueByKey!720 (toList!10983 lt!595647) (select (arr!44387 _keys!1571) from!1960))))))

(declare-fun bs!38622 () Bool)

(assert (= bs!38622 d!144391))

(assert (=> bs!38622 m!1233979))

(assert (=> bs!38622 m!1234187))

(assert (=> bs!38622 m!1234187))

(declare-fun m!1234411 () Bool)

(assert (=> bs!38622 m!1234411))

(assert (=> b!1347183 d!144391))

(assert (=> b!1347183 d!144313))

(declare-fun d!144393 () Bool)

(assert (=> d!144393 (= (get!22417 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347205 d!144393))

(declare-fun d!144395 () Bool)

(assert (=> d!144395 (= (apply!1037 lt!595647 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22418 (getValueByKey!720 (toList!10983 lt!595647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38623 () Bool)

(assert (= bs!38623 d!144395))

(assert (=> bs!38623 m!1234205))

(assert (=> bs!38623 m!1234205))

(declare-fun m!1234413 () Bool)

(assert (=> bs!38623 m!1234413))

(assert (=> b!1347179 d!144395))

(declare-fun d!144397 () Bool)

(assert (=> d!144397 (= (apply!1037 lt!595682 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22418 (getValueByKey!720 (toList!10983 lt!595682) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38624 () Bool)

(assert (= bs!38624 d!144397))

(assert (=> bs!38624 m!1234165))

(assert (=> bs!38624 m!1234407))

(assert (=> bs!38624 m!1234407))

(declare-fun m!1234415 () Bool)

(assert (=> bs!38624 m!1234415))

(assert (=> b!1347244 d!144397))

(declare-fun d!144399 () Bool)

(declare-fun c!126379 () Bool)

(assert (=> d!144399 (= c!126379 ((_ is ValueCellFull!17859) (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!766616 () V!55123)

(assert (=> d!144399 (= (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!766616)))

(declare-fun b!1347381 () Bool)

(assert (=> b!1347381 (= e!766616 (get!22416 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347382 () Bool)

(assert (=> b!1347382 (= e!766616 (get!22417 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144399 c!126379) b!1347381))

(assert (= (and d!144399 (not c!126379)) b!1347382))

(assert (=> b!1347381 m!1234155))

(assert (=> b!1347381 m!1233993))

(declare-fun m!1234417 () Bool)

(assert (=> b!1347381 m!1234417))

(assert (=> b!1347382 m!1234155))

(assert (=> b!1347382 m!1233993))

(declare-fun m!1234419 () Bool)

(assert (=> b!1347382 m!1234419))

(assert (=> b!1347244 d!144399))

(declare-fun d!144401 () Bool)

(declare-fun isEmpty!1093 (Option!772) Bool)

(assert (=> d!144401 (= (isDefined!527 (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1093 (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38625 () Bool)

(assert (= bs!38625 d!144401))

(assert (=> bs!38625 m!1234065))

(declare-fun m!1234421 () Bool)

(assert (=> bs!38625 m!1234421))

(assert (=> b!1347130 d!144401))

(declare-fun e!766618 () Option!772)

(declare-fun b!1347385 () Bool)

(assert (=> b!1347385 (= e!766618 (getValueByKey!720 (t!46028 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(declare-fun b!1347386 () Bool)

(assert (=> b!1347386 (= e!766618 None!770)))

(declare-fun b!1347384 () Bool)

(declare-fun e!766617 () Option!772)

(assert (=> b!1347384 (= e!766617 e!766618)))

(declare-fun c!126381 () Bool)

(assert (=> b!1347384 (= c!126381 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1347383 () Bool)

(assert (=> b!1347383 (= e!766617 (Some!771 (_2!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun c!126380 () Bool)

(declare-fun d!144403 () Bool)

(assert (=> d!144403 (= c!126380 (and ((_ is Cons!31430) (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12150 (h!32639 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144403 (= (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!766617)))

(assert (= (and d!144403 c!126380) b!1347383))

(assert (= (and d!144403 (not c!126380)) b!1347384))

(assert (= (and b!1347384 c!126381) b!1347385))

(assert (= (and b!1347384 (not c!126381)) b!1347386))

(declare-fun m!1234423 () Bool)

(assert (=> b!1347385 m!1234423))

(assert (=> b!1347130 d!144403))

(assert (=> b!1347178 d!144309))

(declare-fun d!144405 () Bool)

(assert (=> d!144405 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun lt!595766 () Unit!44143)

(declare-fun choose!1974 (List!31434 (_ BitVec 64)) Unit!44143)

(assert (=> d!144405 (= lt!595766 (choose!1974 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun e!766621 () Bool)

(assert (=> d!144405 e!766621))

(declare-fun res!893999 () Bool)

(assert (=> d!144405 (=> (not res!893999) (not e!766621))))

(assert (=> d!144405 (= res!893999 (isStrictlySorted!881 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144405 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) lt!595766)))

(declare-fun b!1347389 () Bool)

(assert (=> b!1347389 (= e!766621 (containsKey!742 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (= (and d!144405 res!893999) b!1347389))

(assert (=> d!144405 m!1234149))

(assert (=> d!144405 m!1234149))

(assert (=> d!144405 m!1234151))

(declare-fun m!1234425 () Bool)

(assert (=> d!144405 m!1234425))

(declare-fun m!1234427 () Bool)

(assert (=> d!144405 m!1234427))

(assert (=> b!1347389 m!1234145))

(assert (=> b!1347208 d!144405))

(declare-fun d!144407 () Bool)

(assert (=> d!144407 (= (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)) (not (isEmpty!1093 (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))))

(declare-fun bs!38626 () Bool)

(assert (= bs!38626 d!144407))

(assert (=> bs!38626 m!1234149))

(declare-fun m!1234429 () Bool)

(assert (=> bs!38626 m!1234429))

(assert (=> b!1347208 d!144407))

(declare-fun b!1347392 () Bool)

(declare-fun e!766623 () Option!772)

(assert (=> b!1347392 (= e!766623 (getValueByKey!720 (t!46028 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(declare-fun b!1347393 () Bool)

(assert (=> b!1347393 (= e!766623 None!770)))

(declare-fun b!1347391 () Bool)

(declare-fun e!766622 () Option!772)

(assert (=> b!1347391 (= e!766622 e!766623)))

(declare-fun c!126383 () Bool)

(assert (=> b!1347391 (= c!126383 (and ((_ is Cons!31430) (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (not (= (_1!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142))))))

(declare-fun b!1347390 () Bool)

(assert (=> b!1347390 (= e!766622 (Some!771 (_2!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))))

(declare-fun c!126382 () Bool)

(declare-fun d!144409 () Bool)

(assert (=> d!144409 (= c!126382 (and ((_ is Cons!31430) (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12150 (h!32639 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144409 (= (getValueByKey!720 (toList!10983 (+!4838 (+!4838 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!766622)))

(assert (= (and d!144409 c!126382) b!1347390))

(assert (= (and d!144409 (not c!126382)) b!1347391))

(assert (= (and b!1347391 c!126383) b!1347392))

(assert (= (and b!1347391 (not c!126383)) b!1347393))

(declare-fun m!1234431 () Bool)

(assert (=> b!1347392 m!1234431))

(assert (=> b!1347208 d!144409))

(assert (=> b!1347210 d!144407))

(assert (=> b!1347210 d!144409))

(declare-fun d!144411 () Bool)

(declare-fun e!766624 () Bool)

(assert (=> d!144411 e!766624))

(declare-fun res!894000 () Bool)

(assert (=> d!144411 (=> (not res!894000) (not e!766624))))

(declare-fun lt!595768 () ListLongMap!21935)

(assert (=> d!144411 (= res!894000 (contains!9159 lt!595768 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!595767 () List!31434)

(assert (=> d!144411 (= lt!595768 (ListLongMap!21936 lt!595767))))

(declare-fun lt!595769 () Unit!44143)

(declare-fun lt!595770 () Unit!44143)

(assert (=> d!144411 (= lt!595769 lt!595770)))

(assert (=> d!144411 (= (getValueByKey!720 lt!595767 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!771 (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144411 (= lt!595770 (lemmaContainsTupThenGetReturnValue!365 lt!595767 (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144411 (= lt!595767 (insertStrictlySorted!494 (toList!10983 call!65067) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144411 (= (+!4838 call!65067 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595768)))

(declare-fun b!1347394 () Bool)

(declare-fun res!894001 () Bool)

(assert (=> b!1347394 (=> (not res!894001) (not e!766624))))

(assert (=> b!1347394 (= res!894001 (= (getValueByKey!720 (toList!10983 lt!595768) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!771 (_2!12150 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1347395 () Bool)

(assert (=> b!1347395 (= e!766624 (contains!9161 (toList!10983 lt!595768) (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144411 res!894000) b!1347394))

(assert (= (and b!1347394 res!894001) b!1347395))

(declare-fun m!1234433 () Bool)

(assert (=> d!144411 m!1234433))

(declare-fun m!1234435 () Bool)

(assert (=> d!144411 m!1234435))

(declare-fun m!1234437 () Bool)

(assert (=> d!144411 m!1234437))

(declare-fun m!1234439 () Bool)

(assert (=> d!144411 m!1234439))

(declare-fun m!1234441 () Bool)

(assert (=> b!1347394 m!1234441))

(declare-fun m!1234443 () Bool)

(assert (=> b!1347395 m!1234443))

(assert (=> b!1347245 d!144411))

(assert (=> b!1347245 d!144399))

(declare-fun d!144413 () Bool)

(declare-fun e!766625 () Bool)

(assert (=> d!144413 e!766625))

(declare-fun res!894002 () Bool)

(assert (=> d!144413 (=> res!894002 e!766625)))

(declare-fun lt!595771 () Bool)

(assert (=> d!144413 (= res!894002 (not lt!595771))))

(declare-fun lt!595773 () Bool)

(assert (=> d!144413 (= lt!595771 lt!595773)))

(declare-fun lt!595772 () Unit!44143)

(declare-fun e!766626 () Unit!44143)

(assert (=> d!144413 (= lt!595772 e!766626)))

(declare-fun c!126384 () Bool)

(assert (=> d!144413 (= c!126384 lt!595773)))

(assert (=> d!144413 (= lt!595773 (containsKey!742 (toList!10983 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687))) lt!595685))))

(assert (=> d!144413 (= (contains!9159 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687)) lt!595685) lt!595771)))

(declare-fun b!1347396 () Bool)

(declare-fun lt!595774 () Unit!44143)

(assert (=> b!1347396 (= e!766626 lt!595774)))

(assert (=> b!1347396 (= lt!595774 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687))) lt!595685))))

(assert (=> b!1347396 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687))) lt!595685))))

(declare-fun b!1347397 () Bool)

(declare-fun Unit!44157 () Unit!44143)

(assert (=> b!1347397 (= e!766626 Unit!44157)))

(declare-fun b!1347398 () Bool)

(assert (=> b!1347398 (= e!766625 (isDefined!527 (getValueByKey!720 (toList!10983 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687))) lt!595685)))))

(assert (= (and d!144413 c!126384) b!1347396))

(assert (= (and d!144413 (not c!126384)) b!1347397))

(assert (= (and d!144413 (not res!894002)) b!1347398))

(declare-fun m!1234445 () Bool)

(assert (=> d!144413 m!1234445))

(declare-fun m!1234447 () Bool)

(assert (=> b!1347396 m!1234447))

(declare-fun m!1234449 () Bool)

(assert (=> b!1347396 m!1234449))

(assert (=> b!1347396 m!1234449))

(declare-fun m!1234451 () Bool)

(assert (=> b!1347396 m!1234451))

(assert (=> b!1347398 m!1234449))

(assert (=> b!1347398 m!1234449))

(assert (=> b!1347398 m!1234451))

(assert (=> b!1347245 d!144413))

(declare-fun d!144415 () Bool)

(assert (=> d!144415 (not (contains!9159 (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687)) lt!595685))))

(declare-fun lt!595777 () Unit!44143)

(declare-fun choose!1975 (ListLongMap!21935 (_ BitVec 64) V!55123 (_ BitVec 64)) Unit!44143)

(assert (=> d!144415 (= lt!595777 (choose!1975 lt!595684 lt!595683 lt!595687 lt!595685))))

(declare-fun e!766629 () Bool)

(assert (=> d!144415 e!766629))

(declare-fun res!894005 () Bool)

(assert (=> d!144415 (=> (not res!894005) (not e!766629))))

(assert (=> d!144415 (= res!894005 (not (contains!9159 lt!595684 lt!595685)))))

(assert (=> d!144415 (= (addStillNotContains!501 lt!595684 lt!595683 lt!595687 lt!595685) lt!595777)))

(declare-fun b!1347402 () Bool)

(assert (=> b!1347402 (= e!766629 (not (= lt!595683 lt!595685)))))

(assert (= (and d!144415 res!894005) b!1347402))

(assert (=> d!144415 m!1234159))

(assert (=> d!144415 m!1234159))

(assert (=> d!144415 m!1234161))

(declare-fun m!1234453 () Bool)

(assert (=> d!144415 m!1234453))

(declare-fun m!1234455 () Bool)

(assert (=> d!144415 m!1234455))

(assert (=> b!1347245 d!144415))

(declare-fun d!144417 () Bool)

(declare-fun e!766630 () Bool)

(assert (=> d!144417 e!766630))

(declare-fun res!894006 () Bool)

(assert (=> d!144417 (=> (not res!894006) (not e!766630))))

(declare-fun lt!595779 () ListLongMap!21935)

(assert (=> d!144417 (= res!894006 (contains!9159 lt!595779 (_1!12150 (tuple2!24279 lt!595683 lt!595687))))))

(declare-fun lt!595778 () List!31434)

(assert (=> d!144417 (= lt!595779 (ListLongMap!21936 lt!595778))))

(declare-fun lt!595780 () Unit!44143)

(declare-fun lt!595781 () Unit!44143)

(assert (=> d!144417 (= lt!595780 lt!595781)))

(assert (=> d!144417 (= (getValueByKey!720 lt!595778 (_1!12150 (tuple2!24279 lt!595683 lt!595687))) (Some!771 (_2!12150 (tuple2!24279 lt!595683 lt!595687))))))

(assert (=> d!144417 (= lt!595781 (lemmaContainsTupThenGetReturnValue!365 lt!595778 (_1!12150 (tuple2!24279 lt!595683 lt!595687)) (_2!12150 (tuple2!24279 lt!595683 lt!595687))))))

(assert (=> d!144417 (= lt!595778 (insertStrictlySorted!494 (toList!10983 lt!595684) (_1!12150 (tuple2!24279 lt!595683 lt!595687)) (_2!12150 (tuple2!24279 lt!595683 lt!595687))))))

(assert (=> d!144417 (= (+!4838 lt!595684 (tuple2!24279 lt!595683 lt!595687)) lt!595779)))

(declare-fun b!1347403 () Bool)

(declare-fun res!894007 () Bool)

(assert (=> b!1347403 (=> (not res!894007) (not e!766630))))

(assert (=> b!1347403 (= res!894007 (= (getValueByKey!720 (toList!10983 lt!595779) (_1!12150 (tuple2!24279 lt!595683 lt!595687))) (Some!771 (_2!12150 (tuple2!24279 lt!595683 lt!595687)))))))

(declare-fun b!1347404 () Bool)

(assert (=> b!1347404 (= e!766630 (contains!9161 (toList!10983 lt!595779) (tuple2!24279 lt!595683 lt!595687)))))

(assert (= (and d!144417 res!894006) b!1347403))

(assert (= (and b!1347403 res!894007) b!1347404))

(declare-fun m!1234457 () Bool)

(assert (=> d!144417 m!1234457))

(declare-fun m!1234459 () Bool)

(assert (=> d!144417 m!1234459))

(declare-fun m!1234461 () Bool)

(assert (=> d!144417 m!1234461))

(declare-fun m!1234463 () Bool)

(assert (=> d!144417 m!1234463))

(declare-fun m!1234465 () Bool)

(assert (=> b!1347403 m!1234465))

(declare-fun m!1234467 () Bool)

(assert (=> b!1347404 m!1234467))

(assert (=> b!1347245 d!144417))

(declare-fun d!144419 () Bool)

(declare-fun lt!595784 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!663 (List!31434) (InoxSet tuple2!24278))

(assert (=> d!144419 (= lt!595784 (select (content!663 (toList!10983 lt!595661)) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun e!766636 () Bool)

(assert (=> d!144419 (= lt!595784 e!766636)))

(declare-fun res!894013 () Bool)

(assert (=> d!144419 (=> (not res!894013) (not e!766636))))

(assert (=> d!144419 (= res!894013 ((_ is Cons!31430) (toList!10983 lt!595661)))))

(assert (=> d!144419 (= (contains!9161 (toList!10983 lt!595661) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!595784)))

(declare-fun b!1347409 () Bool)

(declare-fun e!766635 () Bool)

(assert (=> b!1347409 (= e!766636 e!766635)))

(declare-fun res!894012 () Bool)

(assert (=> b!1347409 (=> res!894012 e!766635)))

(assert (=> b!1347409 (= res!894012 (= (h!32639 (toList!10983 lt!595661)) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun b!1347410 () Bool)

(assert (=> b!1347410 (= e!766635 (contains!9161 (t!46028 (toList!10983 lt!595661)) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144419 res!894013) b!1347409))

(assert (= (and b!1347409 (not res!894012)) b!1347410))

(declare-fun m!1234469 () Bool)

(assert (=> d!144419 m!1234469))

(declare-fun m!1234471 () Bool)

(assert (=> d!144419 m!1234471))

(declare-fun m!1234473 () Bool)

(assert (=> b!1347410 m!1234473))

(assert (=> b!1347207 d!144419))

(declare-fun d!144421 () Bool)

(assert (=> d!144421 (isDefined!527 (getValueByKey!720 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!595785 () Unit!44143)

(assert (=> d!144421 (= lt!595785 (choose!1974 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!766637 () Bool)

(assert (=> d!144421 e!766637))

(declare-fun res!894014 () Bool)

(assert (=> d!144421 (=> (not res!894014) (not e!766637))))

(assert (=> d!144421 (= res!894014 (isStrictlySorted!881 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144421 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!595785)))

(declare-fun b!1347411 () Bool)

(assert (=> b!1347411 (= e!766637 (containsKey!742 (toList!10983 (getCurrentListMap!5934 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144421 res!894014) b!1347411))

(assert (=> d!144421 m!1234065))

(assert (=> d!144421 m!1234065))

(assert (=> d!144421 m!1234067))

(declare-fun m!1234475 () Bool)

(assert (=> d!144421 m!1234475))

(declare-fun m!1234477 () Bool)

(assert (=> d!144421 m!1234477))

(assert (=> b!1347411 m!1234061))

(assert (=> b!1347128 d!144421))

(assert (=> b!1347128 d!144401))

(assert (=> b!1347128 d!144403))

(declare-fun d!144423 () Bool)

(assert (=> d!144423 (= (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347241 d!144423))

(declare-fun d!144425 () Bool)

(assert (=> d!144425 (= (validKeyInArray!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1347119 d!144425))

(declare-fun b!1347414 () Bool)

(declare-fun e!766639 () Option!772)

(assert (=> b!1347414 (= e!766639 (getValueByKey!720 (t!46028 (toList!10983 lt!595661)) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1347415 () Bool)

(assert (=> b!1347415 (= e!766639 None!770)))

(declare-fun b!1347413 () Bool)

(declare-fun e!766638 () Option!772)

(assert (=> b!1347413 (= e!766638 e!766639)))

(declare-fun c!126386 () Bool)

(assert (=> b!1347413 (= c!126386 (and ((_ is Cons!31430) (toList!10983 lt!595661)) (not (= (_1!12150 (h!32639 (toList!10983 lt!595661))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun b!1347412 () Bool)

(assert (=> b!1347412 (= e!766638 (Some!771 (_2!12150 (h!32639 (toList!10983 lt!595661)))))))

(declare-fun d!144427 () Bool)

(declare-fun c!126385 () Bool)

(assert (=> d!144427 (= c!126385 (and ((_ is Cons!31430) (toList!10983 lt!595661)) (= (_1!12150 (h!32639 (toList!10983 lt!595661))) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144427 (= (getValueByKey!720 (toList!10983 lt!595661) (_1!12150 (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!766638)))

(assert (= (and d!144427 c!126385) b!1347412))

(assert (= (and d!144427 (not c!126385)) b!1347413))

(assert (= (and b!1347413 c!126386) b!1347414))

(assert (= (and b!1347413 (not c!126386)) b!1347415))

(declare-fun m!1234479 () Bool)

(assert (=> b!1347414 m!1234479))

(assert (=> b!1347206 d!144427))

(declare-fun d!144429 () Bool)

(assert (=> d!144429 (arrayContainsKey!0 _keys!1571 lt!595568 #b00000000000000000000000000000000)))

(declare-fun lt!595788 () Unit!44143)

(declare-fun choose!13 (array!91862 (_ BitVec 64) (_ BitVec 32)) Unit!44143)

(assert (=> d!144429 (= lt!595788 (choose!13 _keys!1571 lt!595568 #b00000000000000000000000000000000))))

(assert (=> d!144429 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144429 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595568 #b00000000000000000000000000000000) lt!595788)))

(declare-fun bs!38627 () Bool)

(assert (= bs!38627 d!144429))

(assert (=> bs!38627 m!1234053))

(declare-fun m!1234481 () Bool)

(assert (=> bs!38627 m!1234481))

(assert (=> b!1347106 d!144429))

(declare-fun d!144431 () Bool)

(declare-fun res!894019 () Bool)

(declare-fun e!766644 () Bool)

(assert (=> d!144431 (=> res!894019 e!766644)))

(assert (=> d!144431 (= res!894019 (= (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) lt!595568))))

(assert (=> d!144431 (= (arrayContainsKey!0 _keys!1571 lt!595568 #b00000000000000000000000000000000) e!766644)))

(declare-fun b!1347420 () Bool)

(declare-fun e!766645 () Bool)

(assert (=> b!1347420 (= e!766644 e!766645)))

(declare-fun res!894020 () Bool)

(assert (=> b!1347420 (=> (not res!894020) (not e!766645))))

(assert (=> b!1347420 (= res!894020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(declare-fun b!1347421 () Bool)

(assert (=> b!1347421 (= e!766645 (arrayContainsKey!0 _keys!1571 lt!595568 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144431 (not res!894019)) b!1347420))

(assert (= (and b!1347420 res!894020) b!1347421))

(assert (=> d!144431 m!1234047))

(declare-fun m!1234483 () Bool)

(assert (=> b!1347421 m!1234483))

(assert (=> b!1347106 d!144431))

(declare-fun lt!595796 () SeekEntryResult!10056)

(declare-fun e!766652 () SeekEntryResult!10056)

(declare-fun b!1347434 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91862 (_ BitVec 32)) SeekEntryResult!10056)

(assert (=> b!1347434 (= e!766652 (seekKeyOrZeroReturnVacant!0 (x!120560 lt!595796) (index!42597 lt!595796) (index!42597 lt!595796) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1347435 () Bool)

(declare-fun e!766654 () SeekEntryResult!10056)

(assert (=> b!1347435 (= e!766654 Undefined!10056)))

(declare-fun d!144433 () Bool)

(declare-fun lt!595797 () SeekEntryResult!10056)

(assert (=> d!144433 (and (or ((_ is Undefined!10056) lt!595797) (not ((_ is Found!10056) lt!595797)) (and (bvsge (index!42596 lt!595797) #b00000000000000000000000000000000) (bvslt (index!42596 lt!595797) (size!44937 _keys!1571)))) (or ((_ is Undefined!10056) lt!595797) ((_ is Found!10056) lt!595797) (not ((_ is MissingZero!10056) lt!595797)) (and (bvsge (index!42595 lt!595797) #b00000000000000000000000000000000) (bvslt (index!42595 lt!595797) (size!44937 _keys!1571)))) (or ((_ is Undefined!10056) lt!595797) ((_ is Found!10056) lt!595797) ((_ is MissingZero!10056) lt!595797) (not ((_ is MissingVacant!10056) lt!595797)) (and (bvsge (index!42598 lt!595797) #b00000000000000000000000000000000) (bvslt (index!42598 lt!595797) (size!44937 _keys!1571)))) (or ((_ is Undefined!10056) lt!595797) (ite ((_ is Found!10056) lt!595797) (= (select (arr!44387 _keys!1571) (index!42596 lt!595797)) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10056) lt!595797) (= (select (arr!44387 _keys!1571) (index!42595 lt!595797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10056) lt!595797) (= (select (arr!44387 _keys!1571) (index!42598 lt!595797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144433 (= lt!595797 e!766654)))

(declare-fun c!126393 () Bool)

(assert (=> d!144433 (= c!126393 (and ((_ is Intermediate!10056) lt!595796) (undefined!10868 lt!595796)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91862 (_ BitVec 32)) SeekEntryResult!10056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144433 (= lt!595796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144433 (validMask!0 mask!1977)))

(assert (=> d!144433 (= (seekEntryOrOpen!0 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!595797)))

(declare-fun b!1347436 () Bool)

(declare-fun e!766653 () SeekEntryResult!10056)

(assert (=> b!1347436 (= e!766653 (Found!10056 (index!42597 lt!595796)))))

(declare-fun b!1347437 () Bool)

(declare-fun c!126394 () Bool)

(declare-fun lt!595795 () (_ BitVec 64))

(assert (=> b!1347437 (= c!126394 (= lt!595795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1347437 (= e!766653 e!766652)))

(declare-fun b!1347438 () Bool)

(assert (=> b!1347438 (= e!766654 e!766653)))

(assert (=> b!1347438 (= lt!595795 (select (arr!44387 _keys!1571) (index!42597 lt!595796)))))

(declare-fun c!126395 () Bool)

(assert (=> b!1347438 (= c!126395 (= lt!595795 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347439 () Bool)

(assert (=> b!1347439 (= e!766652 (MissingZero!10056 (index!42597 lt!595796)))))

(assert (= (and d!144433 c!126393) b!1347435))

(assert (= (and d!144433 (not c!126393)) b!1347438))

(assert (= (and b!1347438 c!126395) b!1347436))

(assert (= (and b!1347438 (not c!126395)) b!1347437))

(assert (= (and b!1347437 c!126394) b!1347439))

(assert (= (and b!1347437 (not c!126394)) b!1347434))

(assert (=> b!1347434 m!1234047))

(declare-fun m!1234485 () Bool)

(assert (=> b!1347434 m!1234485))

(declare-fun m!1234487 () Bool)

(assert (=> d!144433 m!1234487))

(declare-fun m!1234489 () Bool)

(assert (=> d!144433 m!1234489))

(assert (=> d!144433 m!1234047))

(declare-fun m!1234491 () Bool)

(assert (=> d!144433 m!1234491))

(declare-fun m!1234493 () Bool)

(assert (=> d!144433 m!1234493))

(assert (=> d!144433 m!1234491))

(assert (=> d!144433 m!1234047))

(declare-fun m!1234495 () Bool)

(assert (=> d!144433 m!1234495))

(assert (=> d!144433 m!1234005))

(declare-fun m!1234497 () Bool)

(assert (=> b!1347438 m!1234497))

(assert (=> b!1347106 d!144433))

(assert (=> b!1347121 d!144425))

(declare-fun d!144435 () Bool)

(declare-fun e!766655 () Bool)

(assert (=> d!144435 e!766655))

(declare-fun res!894021 () Bool)

(assert (=> d!144435 (=> (not res!894021) (not e!766655))))

(declare-fun lt!595799 () ListLongMap!21935)

(assert (=> d!144435 (= res!894021 (contains!9159 lt!595799 (_1!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!595798 () List!31434)

(assert (=> d!144435 (= lt!595799 (ListLongMap!21936 lt!595798))))

(declare-fun lt!595800 () Unit!44143)

(declare-fun lt!595801 () Unit!44143)

(assert (=> d!144435 (= lt!595800 lt!595801)))

(assert (=> d!144435 (= (getValueByKey!720 lt!595798 (_1!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!771 (_2!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144435 (= lt!595801 (lemmaContainsTupThenGetReturnValue!365 lt!595798 (_1!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144435 (= lt!595798 (insertStrictlySorted!494 (toList!10983 (ite c!126323 call!65058 (ite c!126325 call!65060 call!65063))) (_1!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144435 (= (+!4838 (ite c!126323 call!65058 (ite c!126325 call!65060 call!65063)) (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!595799)))

(declare-fun b!1347440 () Bool)

(declare-fun res!894022 () Bool)

(assert (=> b!1347440 (=> (not res!894022) (not e!766655))))

(assert (=> b!1347440 (= res!894022 (= (getValueByKey!720 (toList!10983 lt!595799) (_1!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!771 (_2!12150 (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1347441 () Bool)

(assert (=> b!1347441 (= e!766655 (contains!9161 (toList!10983 lt!595799) (ite (or c!126323 c!126325) (tuple2!24279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144435 res!894021) b!1347440))

(assert (= (and b!1347440 res!894022) b!1347441))

(declare-fun m!1234499 () Bool)

(assert (=> d!144435 m!1234499))

(declare-fun m!1234501 () Bool)

(assert (=> d!144435 m!1234501))

(declare-fun m!1234503 () Bool)

(assert (=> d!144435 m!1234503))

(declare-fun m!1234505 () Bool)

(assert (=> d!144435 m!1234505))

(declare-fun m!1234507 () Bool)

(assert (=> b!1347440 m!1234507))

(declare-fun m!1234509 () Bool)

(assert (=> b!1347441 m!1234509))

(assert (=> bm!65057 d!144435))

(assert (=> b!1347105 d!144425))

(declare-fun b!1347442 () Bool)

(declare-fun e!766656 () Bool)

(assert (=> b!1347442 (= e!766656 (contains!9160 (ite c!126304 (Cons!31429 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) Nil!31430) Nil!31430) (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!126396 () Bool)

(declare-fun bm!65078 () Bool)

(declare-fun call!65081 () Bool)

(assert (=> bm!65078 (= call!65081 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126396 (Cons!31429 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126304 (Cons!31429 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) Nil!31430) Nil!31430)) (ite c!126304 (Cons!31429 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) Nil!31430) Nil!31430))))))

(declare-fun d!144437 () Bool)

(declare-fun res!894024 () Bool)

(declare-fun e!766658 () Bool)

(assert (=> d!144437 (=> res!894024 e!766658)))

(assert (=> d!144437 (= res!894024 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(assert (=> d!144437 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126304 (Cons!31429 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000) Nil!31430) Nil!31430)) e!766658)))

(declare-fun b!1347443 () Bool)

(declare-fun e!766657 () Bool)

(assert (=> b!1347443 (= e!766657 call!65081)))

(declare-fun b!1347444 () Bool)

(declare-fun e!766659 () Bool)

(assert (=> b!1347444 (= e!766658 e!766659)))

(declare-fun res!894025 () Bool)

(assert (=> b!1347444 (=> (not res!894025) (not e!766659))))

(assert (=> b!1347444 (= res!894025 (not e!766656))))

(declare-fun res!894023 () Bool)

(assert (=> b!1347444 (=> (not res!894023) (not e!766656))))

(assert (=> b!1347444 (= res!894023 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1347445 () Bool)

(assert (=> b!1347445 (= e!766657 call!65081)))

(declare-fun b!1347446 () Bool)

(assert (=> b!1347446 (= e!766659 e!766657)))

(assert (=> b!1347446 (= c!126396 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144437 (not res!894024)) b!1347444))

(assert (= (and b!1347444 res!894023) b!1347442))

(assert (= (and b!1347444 res!894025) b!1347446))

(assert (= (and b!1347446 c!126396) b!1347443))

(assert (= (and b!1347446 (not c!126396)) b!1347445))

(assert (= (or b!1347443 b!1347445) bm!65078))

(declare-fun m!1234511 () Bool)

(assert (=> b!1347442 m!1234511))

(assert (=> b!1347442 m!1234511))

(declare-fun m!1234513 () Bool)

(assert (=> b!1347442 m!1234513))

(assert (=> bm!65078 m!1234511))

(declare-fun m!1234515 () Bool)

(assert (=> bm!65078 m!1234515))

(assert (=> b!1347444 m!1234511))

(assert (=> b!1347444 m!1234511))

(declare-fun m!1234517 () Bool)

(assert (=> b!1347444 m!1234517))

(assert (=> b!1347446 m!1234511))

(assert (=> b!1347446 m!1234511))

(assert (=> b!1347446 m!1234517))

(assert (=> bm!65040 d!144437))

(declare-fun b!1347449 () Bool)

(declare-fun e!766661 () Option!772)

(assert (=> b!1347449 (= e!766661 (getValueByKey!720 (t!46028 (toList!10983 lt!595657)) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1347450 () Bool)

(assert (=> b!1347450 (= e!766661 None!770)))

(declare-fun b!1347448 () Bool)

(declare-fun e!766660 () Option!772)

(assert (=> b!1347448 (= e!766660 e!766661)))

(declare-fun c!126398 () Bool)

(assert (=> b!1347448 (= c!126398 (and ((_ is Cons!31430) (toList!10983 lt!595657)) (not (= (_1!12150 (h!32639 (toList!10983 lt!595657))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1347447 () Bool)

(assert (=> b!1347447 (= e!766660 (Some!771 (_2!12150 (h!32639 (toList!10983 lt!595657)))))))

(declare-fun d!144439 () Bool)

(declare-fun c!126397 () Bool)

(assert (=> d!144439 (= c!126397 (and ((_ is Cons!31430) (toList!10983 lt!595657)) (= (_1!12150 (h!32639 (toList!10983 lt!595657))) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144439 (= (getValueByKey!720 (toList!10983 lt!595657) (_1!12150 (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!766660)))

(assert (= (and d!144439 c!126397) b!1347447))

(assert (= (and d!144439 (not c!126397)) b!1347448))

(assert (= (and b!1347448 c!126398) b!1347449))

(assert (= (and b!1347448 (not c!126398)) b!1347450))

(declare-fun m!1234519 () Bool)

(assert (=> b!1347449 m!1234519))

(assert (=> b!1347198 d!144439))

(declare-fun b!1347451 () Bool)

(declare-fun res!894029 () Bool)

(declare-fun e!766667 () Bool)

(assert (=> b!1347451 (=> (not res!894029) (not e!766667))))

(declare-fun lt!595802 () ListLongMap!21935)

(assert (=> b!1347451 (= res!894029 (not (contains!9159 lt!595802 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144441 () Bool)

(assert (=> d!144441 e!766667))

(declare-fun res!894027 () Bool)

(assert (=> d!144441 (=> (not res!894027) (not e!766667))))

(assert (=> d!144441 (= res!894027 (not (contains!9159 lt!595802 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766663 () ListLongMap!21935)

(assert (=> d!144441 (= lt!595802 e!766663)))

(declare-fun c!126401 () Bool)

(assert (=> d!144441 (= c!126401 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(assert (=> d!144441 (validMask!0 mask!1977)))

(assert (=> d!144441 (= (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!595802)))

(declare-fun b!1347452 () Bool)

(assert (=> b!1347452 (= e!766663 (ListLongMap!21936 Nil!31431))))

(declare-fun b!1347453 () Bool)

(declare-fun e!766668 () Bool)

(declare-fun e!766666 () Bool)

(assert (=> b!1347453 (= e!766668 e!766666)))

(declare-fun c!126400 () Bool)

(assert (=> b!1347453 (= c!126400 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(declare-fun b!1347454 () Bool)

(assert (=> b!1347454 (= e!766666 (isEmpty!1091 lt!595802))))

(declare-fun bm!65079 () Bool)

(declare-fun call!65082 () ListLongMap!21935)

(assert (=> bm!65079 (= call!65082 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1347455 () Bool)

(assert (=> b!1347455 (= e!766666 (= lt!595802 (getCurrentListMapNoExtraKeys!6484 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1347456 () Bool)

(declare-fun e!766665 () Bool)

(assert (=> b!1347456 (= e!766665 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1347456 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1347457 () Bool)

(declare-fun e!766664 () ListLongMap!21935)

(assert (=> b!1347457 (= e!766663 e!766664)))

(declare-fun c!126402 () Bool)

(assert (=> b!1347457 (= c!126402 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(declare-fun b!1347458 () Bool)

(assert (=> b!1347458 (= e!766664 call!65082)))

(declare-fun b!1347459 () Bool)

(assert (=> b!1347459 (= e!766667 e!766668)))

(declare-fun c!126399 () Bool)

(assert (=> b!1347459 (= c!126399 e!766665)))

(declare-fun res!894026 () Bool)

(assert (=> b!1347459 (=> (not res!894026) (not e!766665))))

(assert (=> b!1347459 (= res!894026 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(declare-fun b!1347460 () Bool)

(assert (=> b!1347460 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(assert (=> b!1347460 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44938 _values!1303)))))

(declare-fun e!766662 () Bool)

(assert (=> b!1347460 (= e!766662 (= (apply!1037 lt!595802 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347461 () Bool)

(declare-fun lt!595808 () Unit!44143)

(declare-fun lt!595806 () Unit!44143)

(assert (=> b!1347461 (= lt!595808 lt!595806)))

(declare-fun lt!595803 () (_ BitVec 64))

(declare-fun lt!595807 () V!55123)

(declare-fun lt!595804 () ListLongMap!21935)

(declare-fun lt!595805 () (_ BitVec 64))

(assert (=> b!1347461 (not (contains!9159 (+!4838 lt!595804 (tuple2!24279 lt!595803 lt!595807)) lt!595805))))

(assert (=> b!1347461 (= lt!595806 (addStillNotContains!501 lt!595804 lt!595803 lt!595807 lt!595805))))

(assert (=> b!1347461 (= lt!595805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1347461 (= lt!595807 (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1347461 (= lt!595803 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(assert (=> b!1347461 (= lt!595804 call!65082)))

(assert (=> b!1347461 (= e!766664 (+!4838 call!65082 (tuple2!24279 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22415 (select (arr!44388 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347462 () Bool)

(assert (=> b!1347462 (= e!766668 e!766662)))

(assert (=> b!1347462 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(declare-fun res!894028 () Bool)

(assert (=> b!1347462 (= res!894028 (contains!9159 lt!595802 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1347462 (=> (not res!894028) (not e!766662))))

(assert (= (and d!144441 c!126401) b!1347452))

(assert (= (and d!144441 (not c!126401)) b!1347457))

(assert (= (and b!1347457 c!126402) b!1347461))

(assert (= (and b!1347457 (not c!126402)) b!1347458))

(assert (= (or b!1347461 b!1347458) bm!65079))

(assert (= (and d!144441 res!894027) b!1347451))

(assert (= (and b!1347451 res!894029) b!1347459))

(assert (= (and b!1347459 res!894026) b!1347456))

(assert (= (and b!1347459 c!126399) b!1347462))

(assert (= (and b!1347459 (not c!126399)) b!1347453))

(assert (= (and b!1347462 res!894028) b!1347460))

(assert (= (and b!1347453 c!126400) b!1347455))

(assert (= (and b!1347453 (not c!126400)) b!1347454))

(declare-fun b_lambda!24581 () Bool)

(assert (=> (not b_lambda!24581) (not b!1347460)))

(assert (=> b!1347460 t!46026))

(declare-fun b_and!50823 () Bool)

(assert (= b_and!50821 (and (=> t!46026 result!25885) b_and!50823)))

(declare-fun b_lambda!24583 () Bool)

(assert (=> (not b_lambda!24583) (not b!1347461)))

(assert (=> b!1347461 t!46026))

(declare-fun b_and!50825 () Bool)

(assert (= b_and!50823 (and (=> t!46026 result!25885) b_and!50825)))

(declare-fun m!1234521 () Bool)

(assert (=> b!1347455 m!1234521))

(declare-fun m!1234523 () Bool)

(assert (=> b!1347461 m!1234523))

(assert (=> b!1347461 m!1233993))

(declare-fun m!1234525 () Bool)

(assert (=> b!1347461 m!1234525))

(declare-fun m!1234527 () Bool)

(assert (=> b!1347461 m!1234527))

(declare-fun m!1234529 () Bool)

(assert (=> b!1347461 m!1234529))

(declare-fun m!1234531 () Bool)

(assert (=> b!1347461 m!1234531))

(declare-fun m!1234533 () Bool)

(assert (=> b!1347461 m!1234533))

(declare-fun m!1234535 () Bool)

(assert (=> b!1347461 m!1234535))

(assert (=> b!1347461 m!1234527))

(assert (=> b!1347461 m!1234523))

(assert (=> b!1347461 m!1233993))

(assert (=> b!1347456 m!1234533))

(assert (=> b!1347456 m!1234533))

(declare-fun m!1234537 () Bool)

(assert (=> b!1347456 m!1234537))

(declare-fun m!1234539 () Bool)

(assert (=> b!1347451 m!1234539))

(assert (=> b!1347457 m!1234533))

(assert (=> b!1347457 m!1234533))

(assert (=> b!1347457 m!1234537))

(declare-fun m!1234541 () Bool)

(assert (=> b!1347454 m!1234541))

(assert (=> b!1347460 m!1234523))

(assert (=> b!1347460 m!1233993))

(assert (=> b!1347460 m!1234525))

(assert (=> b!1347460 m!1234533))

(assert (=> b!1347460 m!1234533))

(declare-fun m!1234543 () Bool)

(assert (=> b!1347460 m!1234543))

(assert (=> b!1347460 m!1234523))

(assert (=> b!1347460 m!1233993))

(assert (=> b!1347462 m!1234533))

(assert (=> b!1347462 m!1234533))

(declare-fun m!1234545 () Bool)

(assert (=> b!1347462 m!1234545))

(declare-fun m!1234547 () Bool)

(assert (=> d!144441 m!1234547))

(assert (=> d!144441 m!1234005))

(assert (=> bm!65079 m!1234521))

(assert (=> bm!65064 d!144441))

(declare-fun d!144443 () Bool)

(declare-fun lt!595811 () Bool)

(declare-fun content!664 (List!31433) (InoxSet (_ BitVec 64)))

(assert (=> d!144443 (= lt!595811 (select (content!664 Nil!31430) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!766673 () Bool)

(assert (=> d!144443 (= lt!595811 e!766673)))

(declare-fun res!894035 () Bool)

(assert (=> d!144443 (=> (not res!894035) (not e!766673))))

(assert (=> d!144443 (= res!894035 ((_ is Cons!31429) Nil!31430))))

(assert (=> d!144443 (= (contains!9160 Nil!31430 (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)) lt!595811)))

(declare-fun b!1347467 () Bool)

(declare-fun e!766674 () Bool)

(assert (=> b!1347467 (= e!766673 e!766674)))

(declare-fun res!894034 () Bool)

(assert (=> b!1347467 (=> res!894034 e!766674)))

(assert (=> b!1347467 (= res!894034 (= (h!32638 Nil!31430) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1347468 () Bool)

(assert (=> b!1347468 (= e!766674 (contains!9160 (t!46027 Nil!31430) (select (arr!44387 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144443 res!894035) b!1347467))

(assert (= (and b!1347467 (not res!894034)) b!1347468))

(declare-fun m!1234549 () Bool)

(assert (=> d!144443 m!1234549))

(assert (=> d!144443 m!1234047))

(declare-fun m!1234551 () Bool)

(assert (=> d!144443 m!1234551))

(assert (=> b!1347468 m!1234047))

(declare-fun m!1234553 () Bool)

(assert (=> b!1347468 m!1234553))

(assert (=> b!1347117 d!144443))

(assert (=> bm!65061 d!144355))

(assert (=> b!1347240 d!144423))

(declare-fun b!1347469 () Bool)

(declare-fun e!766675 () Bool)

(declare-fun call!65083 () Bool)

(assert (=> b!1347469 (= e!766675 call!65083)))

(declare-fun bm!65080 () Bool)

(assert (=> bm!65080 (= call!65083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144445 () Bool)

(declare-fun res!894036 () Bool)

(declare-fun e!766677 () Bool)

(assert (=> d!144445 (=> res!894036 e!766677)))

(assert (=> d!144445 (= res!894036 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44937 _keys!1571)))))

(assert (=> d!144445 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!766677)))

(declare-fun b!1347470 () Bool)

(declare-fun e!766676 () Bool)

(assert (=> b!1347470 (= e!766676 call!65083)))

(declare-fun b!1347471 () Bool)

(assert (=> b!1347471 (= e!766677 e!766676)))

(declare-fun c!126403 () Bool)

(assert (=> b!1347471 (= c!126403 (validKeyInArray!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1347472 () Bool)

(assert (=> b!1347472 (= e!766676 e!766675)))

(declare-fun lt!595813 () (_ BitVec 64))

(assert (=> b!1347472 (= lt!595813 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!595812 () Unit!44143)

(assert (=> b!1347472 (= lt!595812 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595813 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1347472 (arrayContainsKey!0 _keys!1571 lt!595813 #b00000000000000000000000000000000)))

(declare-fun lt!595814 () Unit!44143)

(assert (=> b!1347472 (= lt!595814 lt!595812)))

(declare-fun res!894037 () Bool)

(assert (=> b!1347472 (= res!894037 (= (seekEntryOrOpen!0 (select (arr!44387 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1347472 (=> (not res!894037) (not e!766675))))

(assert (= (and d!144445 (not res!894036)) b!1347471))

(assert (= (and b!1347471 c!126403) b!1347472))

(assert (= (and b!1347471 (not c!126403)) b!1347470))

(assert (= (and b!1347472 res!894037) b!1347469))

(assert (= (or b!1347469 b!1347470) bm!65080))

(declare-fun m!1234555 () Bool)

(assert (=> bm!65080 m!1234555))

(assert (=> b!1347471 m!1234511))

(assert (=> b!1347471 m!1234511))

(assert (=> b!1347471 m!1234517))

(assert (=> b!1347472 m!1234511))

(declare-fun m!1234557 () Bool)

(assert (=> b!1347472 m!1234557))

(declare-fun m!1234559 () Bool)

(assert (=> b!1347472 m!1234559))

(assert (=> b!1347472 m!1234511))

(declare-fun m!1234561 () Bool)

(assert (=> b!1347472 m!1234561))

(assert (=> bm!65037 d!144445))

(declare-fun d!144447 () Bool)

(declare-fun e!766678 () Bool)

(assert (=> d!144447 e!766678))

(declare-fun res!894038 () Bool)

(assert (=> d!144447 (=> (not res!894038) (not e!766678))))

(declare-fun lt!595816 () ListLongMap!21935)

(assert (=> d!144447 (= res!894038 (contains!9159 lt!595816 (_1!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!595815 () List!31434)

(assert (=> d!144447 (= lt!595816 (ListLongMap!21936 lt!595815))))

(declare-fun lt!595817 () Unit!44143)

(declare-fun lt!595818 () Unit!44143)

(assert (=> d!144447 (= lt!595817 lt!595818)))

(assert (=> d!144447 (= (getValueByKey!720 lt!595815 (_1!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144447 (= lt!595818 (lemmaContainsTupThenGetReturnValue!365 lt!595815 (_1!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144447 (= lt!595815 (insertStrictlySorted!494 (toList!10983 call!65062) (_1!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144447 (= (+!4838 call!65062 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!595816)))

(declare-fun b!1347473 () Bool)

(declare-fun res!894039 () Bool)

(assert (=> b!1347473 (=> (not res!894039) (not e!766678))))

(assert (=> b!1347473 (= res!894039 (= (getValueByKey!720 (toList!10983 lt!595816) (_1!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!771 (_2!12150 (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1347474 () Bool)

(assert (=> b!1347474 (= e!766678 (contains!9161 (toList!10983 lt!595816) (tuple2!24279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144447 res!894038) b!1347473))

(assert (= (and b!1347473 res!894039) b!1347474))

(declare-fun m!1234563 () Bool)

(assert (=> d!144447 m!1234563))

(declare-fun m!1234565 () Bool)

(assert (=> d!144447 m!1234565))

(declare-fun m!1234567 () Bool)

(assert (=> d!144447 m!1234567))

(declare-fun m!1234569 () Bool)

(assert (=> d!144447 m!1234569))

(declare-fun m!1234571 () Bool)

(assert (=> b!1347473 m!1234571))

(declare-fun m!1234573 () Bool)

(assert (=> b!1347474 m!1234573))

(assert (=> b!1347192 d!144447))

(assert (=> b!1347175 d!144309))

(declare-fun d!144449 () Bool)

(declare-fun lt!595819 () Bool)

(assert (=> d!144449 (= lt!595819 (select (content!663 (toList!10983 lt!595657)) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!766680 () Bool)

(assert (=> d!144449 (= lt!595819 e!766680)))

(declare-fun res!894041 () Bool)

(assert (=> d!144449 (=> (not res!894041) (not e!766680))))

(assert (=> d!144449 (= res!894041 ((_ is Cons!31430) (toList!10983 lt!595657)))))

(assert (=> d!144449 (= (contains!9161 (toList!10983 lt!595657) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!595819)))

(declare-fun b!1347475 () Bool)

(declare-fun e!766679 () Bool)

(assert (=> b!1347475 (= e!766680 e!766679)))

(declare-fun res!894040 () Bool)

(assert (=> b!1347475 (=> res!894040 e!766679)))

(assert (=> b!1347475 (= res!894040 (= (h!32639 (toList!10983 lt!595657)) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347476 () Bool)

(assert (=> b!1347476 (= e!766679 (contains!9161 (t!46028 (toList!10983 lt!595657)) (tuple2!24279 (select (arr!44387 _keys!1571) from!1960) (get!22415 (select (arr!44388 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144449 res!894041) b!1347475))

(assert (= (and b!1347475 (not res!894040)) b!1347476))

(declare-fun m!1234575 () Bool)

(assert (=> d!144449 m!1234575))

(declare-fun m!1234577 () Bool)

(assert (=> d!144449 m!1234577))

(declare-fun m!1234579 () Bool)

(assert (=> b!1347476 m!1234579))

(assert (=> b!1347199 d!144449))

(assert (=> b!1347239 d!144441))

(declare-fun mapIsEmpty!57986 () Bool)

(declare-fun mapRes!57986 () Bool)

(assert (=> mapIsEmpty!57986 mapRes!57986))

(declare-fun condMapEmpty!57986 () Bool)

(declare-fun mapDefault!57986 () ValueCell!17859)

(assert (=> mapNonEmpty!57985 (= condMapEmpty!57986 (= mapRest!57985 ((as const (Array (_ BitVec 32) ValueCell!17859)) mapDefault!57986)))))

(declare-fun e!766682 () Bool)

(assert (=> mapNonEmpty!57985 (= tp!110359 (and e!766682 mapRes!57986))))

(declare-fun mapNonEmpty!57986 () Bool)

(declare-fun tp!110360 () Bool)

(declare-fun e!766681 () Bool)

(assert (=> mapNonEmpty!57986 (= mapRes!57986 (and tp!110360 e!766681))))

(declare-fun mapKey!57986 () (_ BitVec 32))

(declare-fun mapRest!57986 () (Array (_ BitVec 32) ValueCell!17859))

(declare-fun mapValue!57986 () ValueCell!17859)

(assert (=> mapNonEmpty!57986 (= mapRest!57985 (store mapRest!57986 mapKey!57986 mapValue!57986))))

(declare-fun b!1347478 () Bool)

(assert (=> b!1347478 (= e!766682 tp_is_empty!37515)))

(declare-fun b!1347477 () Bool)

(assert (=> b!1347477 (= e!766681 tp_is_empty!37515)))

(assert (= (and mapNonEmpty!57985 condMapEmpty!57986) mapIsEmpty!57986))

(assert (= (and mapNonEmpty!57985 (not condMapEmpty!57986)) mapNonEmpty!57986))

(assert (= (and mapNonEmpty!57986 ((_ is ValueCellFull!17859) mapValue!57986)) b!1347477))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17859) mapDefault!57986)) b!1347478))

(declare-fun m!1234581 () Bool)

(assert (=> mapNonEmpty!57986 m!1234581))

(declare-fun b_lambda!24585 () Bool)

(assert (= b_lambda!24579 (or (and start!113464 b_free!31515) b_lambda!24585)))

(declare-fun b_lambda!24587 () Bool)

(assert (= b_lambda!24583 (or (and start!113464 b_free!31515) b_lambda!24587)))

(declare-fun b_lambda!24589 () Bool)

(assert (= b_lambda!24577 (or (and start!113464 b_free!31515) b_lambda!24589)))

(declare-fun b_lambda!24591 () Bool)

(assert (= b_lambda!24581 (or (and start!113464 b_free!31515) b_lambda!24591)))

(check-sat (not b!1347392) (not b!1347314) (not b!1347329) (not b!1347369) (not b_lambda!24571) (not d!144415) (not d!144391) (not b!1347255) (not bm!65074) (not b!1347310) (not d!144379) (not d!144357) (not b!1347283) (not b!1347449) (not d!144429) (not b!1347345) (not d!144329) (not b!1347264) (not d!144361) (not b!1347266) (not d!144411) (not b!1347473) (not b!1347352) (not b!1347381) (not b!1347330) (not b!1347455) (not d!144327) (not b!1347359) (not bm!65079) (not d!144333) (not b!1347380) (not b!1347353) (not d!144341) (not b!1347385) (not b!1347414) (not d!144385) (not b!1347461) b_and!50825 (not d!144355) (not d!144353) (not b!1347472) (not b!1347462) (not b!1347350) (not b!1347346) (not d!144419) (not b_lambda!24563) (not d!144395) (not d!144421) (not b!1347351) (not b!1347320) (not b!1347442) (not b_lambda!24585) (not b!1347404) (not b!1347389) (not b!1347340) (not b!1347440) (not b!1347277) (not d!144359) (not bm!65072) (not d!144365) (not b!1347341) (not b!1347347) (not b!1347327) tp_is_empty!37515 (not d!144397) (not b!1347456) (not b!1347410) (not d!144321) (not b!1347260) (not d!144435) (not b!1347457) (not d!144405) (not b!1347377) (not b!1347356) (not b!1347361) (not b_lambda!24587) (not b_lambda!24591) (not d!144443) (not b!1347366) (not d!144413) (not b!1347471) (not b!1347411) (not b!1347323) (not bm!65078) (not b!1347476) (not d!144343) (not b_lambda!24575) (not d!144371) (not d!144363) (not b!1347261) (not b!1347451) (not b!1347257) (not d!144447) (not d!144347) (not d!144375) (not b!1347441) (not d!144417) (not d!144335) (not d!144369) (not b!1347396) (not b!1347306) (not d!144441) (not bm!65076) (not b!1347364) (not b!1347284) (not b!1347367) (not d!144449) (not d!144323) (not b!1347395) (not b!1347421) (not b!1347373) (not b!1347326) (not d!144373) (not mapNonEmpty!57986) (not b!1347339) (not b!1347460) (not b!1347321) (not b!1347403) (not d!144407) (not b!1347398) (not d!144325) (not d!144383) (not b!1347336) (not b!1347358) (not b!1347468) (not b_next!31515) (not b!1347474) (not b!1347328) (not b!1347342) (not d!144345) (not d!144401) (not b_lambda!24589) (not b!1347434) (not b!1347324) (not d!144433) (not b!1347258) (not b!1347378) (not b!1347446) (not d!144339) (not d!144367) (not b!1347382) (not d!144351) (not b!1347454) (not b!1347394) (not bm!65080) (not b_lambda!24573) (not b!1347444) (not d!144389) (not d!144349) (not b!1347263) (not b!1347354))
(check-sat b_and!50825 (not b_next!31515))
