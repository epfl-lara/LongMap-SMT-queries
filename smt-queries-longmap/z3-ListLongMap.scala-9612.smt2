; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113676 () Bool)

(assert start!113676)

(declare-fun b_free!31585 () Bool)

(declare-fun b_next!31585 () Bool)

(assert (=> start!113676 (= b_free!31585 (not b_next!31585))))

(declare-fun tp!110571 () Bool)

(declare-fun b_and!50951 () Bool)

(assert (=> start!113676 (= tp!110571 b_and!50951)))

(declare-fun mapIsEmpty!58095 () Bool)

(declare-fun mapRes!58095 () Bool)

(assert (=> mapIsEmpty!58095 mapRes!58095))

(declare-fun b!1349191 () Bool)

(declare-fun e!767506 () Bool)

(declare-fun e!767510 () Bool)

(assert (=> b!1349191 (= e!767506 (and e!767510 mapRes!58095))))

(declare-fun condMapEmpty!58095 () Bool)

(declare-datatypes ((V!55217 0))(
  ( (V!55218 (val!18867 Int)) )
))
(declare-datatypes ((ValueCell!17894 0))(
  ( (ValueCellFull!17894 (v!21521 V!55217)) (EmptyCell!17894) )
))
(declare-datatypes ((array!91949 0))(
  ( (array!91950 (arr!44428 (Array (_ BitVec 32) ValueCell!17894)) (size!44980 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91949)

(declare-fun mapDefault!58095 () ValueCell!17894)

(assert (=> b!1349191 (= condMapEmpty!58095 (= (arr!44428 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17894)) mapDefault!58095)))))

(declare-fun b!1349192 () Bool)

(declare-fun res!895122 () Bool)

(declare-fun e!767511 () Bool)

(assert (=> b!1349192 (=> (not res!895122) (not e!767511))))

(declare-datatypes ((array!91951 0))(
  ( (array!91952 (arr!44429 (Array (_ BitVec 32) (_ BitVec 64))) (size!44981 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91951)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349192 (= res!895122 (validKeyInArray!0 (select (arr!44429 _keys!1571) from!1960)))))

(declare-fun b!1349193 () Bool)

(declare-fun res!895128 () Bool)

(assert (=> b!1349193 (=> (not res!895128) (not e!767511))))

(declare-fun minValue!1245 () V!55217)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55217)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24404 0))(
  ( (tuple2!24405 (_1!12213 (_ BitVec 64)) (_2!12213 V!55217)) )
))
(declare-datatypes ((List!31536 0))(
  ( (Nil!31533) (Cons!31532 (h!32741 tuple2!24404) (t!46180 List!31536)) )
))
(declare-datatypes ((ListLongMap!22061 0))(
  ( (ListLongMap!22062 (toList!11046 List!31536)) )
))
(declare-fun contains!9155 (ListLongMap!22061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5877 (array!91951 array!91949 (_ BitVec 32) (_ BitVec 32) V!55217 V!55217 (_ BitVec 32) Int) ListLongMap!22061)

(assert (=> b!1349193 (= res!895128 (contains!9155 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!58095 () Bool)

(declare-fun tp!110572 () Bool)

(declare-fun e!767507 () Bool)

(assert (=> mapNonEmpty!58095 (= mapRes!58095 (and tp!110572 e!767507))))

(declare-fun mapValue!58095 () ValueCell!17894)

(declare-fun mapKey!58095 () (_ BitVec 32))

(declare-fun mapRest!58095 () (Array (_ BitVec 32) ValueCell!17894))

(assert (=> mapNonEmpty!58095 (= (arr!44428 _values!1303) (store mapRest!58095 mapKey!58095 mapValue!58095))))

(declare-fun res!895124 () Bool)

(assert (=> start!113676 (=> (not res!895124) (not e!767511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113676 (= res!895124 (validMask!0 mask!1977))))

(assert (=> start!113676 e!767511))

(declare-fun tp_is_empty!37585 () Bool)

(assert (=> start!113676 tp_is_empty!37585))

(assert (=> start!113676 true))

(declare-fun array_inv!33665 (array!91951) Bool)

(assert (=> start!113676 (array_inv!33665 _keys!1571)))

(declare-fun array_inv!33666 (array!91949) Bool)

(assert (=> start!113676 (and (array_inv!33666 _values!1303) e!767506)))

(assert (=> start!113676 tp!110571))

(declare-fun b!1349194 () Bool)

(declare-fun res!895120 () Bool)

(assert (=> b!1349194 (=> (not res!895120) (not e!767511))))

(assert (=> b!1349194 (= res!895120 (not (= (select (arr!44429 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349195 () Bool)

(declare-fun res!895125 () Bool)

(assert (=> b!1349195 (=> (not res!895125) (not e!767511))))

(assert (=> b!1349195 (= res!895125 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1349196 () Bool)

(declare-fun res!895127 () Bool)

(declare-fun e!767508 () Bool)

(assert (=> b!1349196 (=> (not res!895127) (not e!767508))))

(assert (=> b!1349196 (= res!895127 (not (= k0!1142 (select (arr!44429 _keys!1571) from!1960))))))

(declare-fun b!1349197 () Bool)

(declare-fun res!895130 () Bool)

(assert (=> b!1349197 (=> (not res!895130) (not e!767511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91951 (_ BitVec 32)) Bool)

(assert (=> b!1349197 (= res!895130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349198 () Bool)

(declare-fun res!895123 () Bool)

(assert (=> b!1349198 (=> (not res!895123) (not e!767511))))

(assert (=> b!1349198 (= res!895123 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44981 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349199 () Bool)

(assert (=> b!1349199 (= e!767510 tp_is_empty!37585)))

(declare-fun b!1349200 () Bool)

(assert (=> b!1349200 (= e!767508 (not (contains!9155 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun lt!596246 () ListLongMap!22061)

(assert (=> b!1349200 (contains!9155 lt!596246 k0!1142)))

(declare-fun lt!596247 () V!55217)

(declare-datatypes ((Unit!44034 0))(
  ( (Unit!44035) )
))
(declare-fun lt!596248 () Unit!44034)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!417 ((_ BitVec 64) (_ BitVec 64) V!55217 ListLongMap!22061) Unit!44034)

(assert (=> b!1349200 (= lt!596248 (lemmaInListMapAfterAddingDiffThenInBefore!417 k0!1142 (select (arr!44429 _keys!1571) from!1960) lt!596247 lt!596246))))

(declare-fun b!1349201 () Bool)

(declare-fun res!895121 () Bool)

(assert (=> b!1349201 (=> (not res!895121) (not e!767511))))

(declare-datatypes ((List!31537 0))(
  ( (Nil!31534) (Cons!31533 (h!32742 (_ BitVec 64)) (t!46181 List!31537)) )
))
(declare-fun arrayNoDuplicates!0 (array!91951 (_ BitVec 32) List!31537) Bool)

(assert (=> b!1349201 (= res!895121 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31534))))

(declare-fun b!1349202 () Bool)

(assert (=> b!1349202 (= e!767507 tp_is_empty!37585)))

(declare-fun b!1349203 () Bool)

(declare-fun res!895129 () Bool)

(assert (=> b!1349203 (=> (not res!895129) (not e!767511))))

(assert (=> b!1349203 (= res!895129 (and (= (size!44980 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44981 _keys!1571) (size!44980 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349204 () Bool)

(assert (=> b!1349204 (= e!767511 e!767508)))

(declare-fun res!895126 () Bool)

(assert (=> b!1349204 (=> (not res!895126) (not e!767508))))

(declare-fun +!4887 (ListLongMap!22061 tuple2!24404) ListLongMap!22061)

(assert (=> b!1349204 (= res!895126 (contains!9155 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6535 (array!91951 array!91949 (_ BitVec 32) (_ BitVec 32) V!55217 V!55217 (_ BitVec 32) Int) ListLongMap!22061)

(assert (=> b!1349204 (= lt!596246 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22463 (ValueCell!17894 V!55217) V!55217)

(declare-fun dynLambda!3817 (Int (_ BitVec 64)) V!55217)

(assert (=> b!1349204 (= lt!596247 (get!22463 (select (arr!44428 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113676 res!895124) b!1349203))

(assert (= (and b!1349203 res!895129) b!1349197))

(assert (= (and b!1349197 res!895130) b!1349201))

(assert (= (and b!1349201 res!895121) b!1349198))

(assert (= (and b!1349198 res!895123) b!1349193))

(assert (= (and b!1349193 res!895128) b!1349194))

(assert (= (and b!1349194 res!895120) b!1349192))

(assert (= (and b!1349192 res!895122) b!1349195))

(assert (= (and b!1349195 res!895125) b!1349204))

(assert (= (and b!1349204 res!895126) b!1349196))

(assert (= (and b!1349196 res!895127) b!1349200))

(assert (= (and b!1349191 condMapEmpty!58095) mapIsEmpty!58095))

(assert (= (and b!1349191 (not condMapEmpty!58095)) mapNonEmpty!58095))

(get-info :version)

(assert (= (and mapNonEmpty!58095 ((_ is ValueCellFull!17894) mapValue!58095)) b!1349202))

(assert (= (and b!1349191 ((_ is ValueCellFull!17894) mapDefault!58095)) b!1349199))

(assert (= start!113676 b!1349191))

(declare-fun b_lambda!24685 () Bool)

(assert (=> (not b_lambda!24685) (not b!1349204)))

(declare-fun t!46179 () Bool)

(declare-fun tb!12447 () Bool)

(assert (=> (and start!113676 (= defaultEntry!1306 defaultEntry!1306) t!46179) tb!12447))

(declare-fun result!25999 () Bool)

(assert (=> tb!12447 (= result!25999 tp_is_empty!37585)))

(assert (=> b!1349204 t!46179))

(declare-fun b_and!50953 () Bool)

(assert (= b_and!50951 (and (=> t!46179 result!25999) b_and!50953)))

(declare-fun m!1235845 () Bool)

(assert (=> b!1349192 m!1235845))

(assert (=> b!1349192 m!1235845))

(declare-fun m!1235847 () Bool)

(assert (=> b!1349192 m!1235847))

(declare-fun m!1235849 () Bool)

(assert (=> b!1349193 m!1235849))

(assert (=> b!1349193 m!1235849))

(declare-fun m!1235851 () Bool)

(assert (=> b!1349193 m!1235851))

(declare-fun m!1235853 () Bool)

(assert (=> b!1349197 m!1235853))

(declare-fun m!1235855 () Bool)

(assert (=> mapNonEmpty!58095 m!1235855))

(declare-fun m!1235857 () Bool)

(assert (=> b!1349200 m!1235857))

(declare-fun m!1235859 () Bool)

(assert (=> b!1349200 m!1235859))

(assert (=> b!1349200 m!1235859))

(declare-fun m!1235861 () Bool)

(assert (=> b!1349200 m!1235861))

(assert (=> b!1349200 m!1235845))

(declare-fun m!1235863 () Bool)

(assert (=> b!1349200 m!1235863))

(assert (=> b!1349200 m!1235845))

(declare-fun m!1235865 () Bool)

(assert (=> b!1349204 m!1235865))

(declare-fun m!1235867 () Bool)

(assert (=> b!1349204 m!1235867))

(declare-fun m!1235869 () Bool)

(assert (=> b!1349204 m!1235869))

(declare-fun m!1235871 () Bool)

(assert (=> b!1349204 m!1235871))

(assert (=> b!1349204 m!1235867))

(assert (=> b!1349204 m!1235845))

(declare-fun m!1235873 () Bool)

(assert (=> b!1349204 m!1235873))

(assert (=> b!1349204 m!1235869))

(assert (=> b!1349204 m!1235873))

(declare-fun m!1235875 () Bool)

(assert (=> b!1349204 m!1235875))

(assert (=> b!1349194 m!1235845))

(declare-fun m!1235877 () Bool)

(assert (=> start!113676 m!1235877))

(declare-fun m!1235879 () Bool)

(assert (=> start!113676 m!1235879))

(declare-fun m!1235881 () Bool)

(assert (=> start!113676 m!1235881))

(assert (=> b!1349196 m!1235845))

(declare-fun m!1235883 () Bool)

(assert (=> b!1349201 m!1235883))

(check-sat (not b_next!31585) b_and!50953 (not b!1349204) tp_is_empty!37585 (not b_lambda!24685) (not start!113676) (not b!1349193) (not b!1349192) (not b!1349201) (not b!1349200) (not b!1349197) (not mapNonEmpty!58095))
(check-sat b_and!50953 (not b_next!31585))
(get-model)

(declare-fun b_lambda!24691 () Bool)

(assert (= b_lambda!24685 (or (and start!113676 b_free!31585) b_lambda!24691)))

(check-sat (not b_next!31585) b_and!50953 (not b!1349204) tp_is_empty!37585 (not start!113676) (not b_lambda!24691) (not b!1349193) (not b!1349192) (not b!1349201) (not b!1349200) (not b!1349197) (not mapNonEmpty!58095))
(check-sat b_and!50953 (not b_next!31585))
(get-model)

(declare-fun d!144541 () Bool)

(declare-fun e!767553 () Bool)

(assert (=> d!144541 e!767553))

(declare-fun res!895199 () Bool)

(assert (=> d!144541 (=> res!895199 e!767553)))

(declare-fun lt!596277 () Bool)

(assert (=> d!144541 (= res!895199 (not lt!596277))))

(declare-fun lt!596278 () Bool)

(assert (=> d!144541 (= lt!596277 lt!596278)))

(declare-fun lt!596275 () Unit!44034)

(declare-fun e!767552 () Unit!44034)

(assert (=> d!144541 (= lt!596275 e!767552)))

(declare-fun c!126536 () Bool)

(assert (=> d!144541 (= c!126536 lt!596278)))

(declare-fun containsKey!743 (List!31536 (_ BitVec 64)) Bool)

(assert (=> d!144541 (= lt!596278 (containsKey!743 (toList!11046 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) k0!1142))))

(assert (=> d!144541 (= (contains!9155 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) k0!1142) lt!596277)))

(declare-fun b!1349301 () Bool)

(declare-fun lt!596276 () Unit!44034)

(assert (=> b!1349301 (= e!767552 lt!596276)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!490 (List!31536 (_ BitVec 64)) Unit!44034)

(assert (=> b!1349301 (= lt!596276 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11046 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) k0!1142))))

(declare-datatypes ((Option!777 0))(
  ( (Some!776 (v!21524 V!55217)) (None!775) )
))
(declare-fun isDefined!533 (Option!777) Bool)

(declare-fun getValueByKey!726 (List!31536 (_ BitVec 64)) Option!777)

(assert (=> b!1349301 (isDefined!533 (getValueByKey!726 (toList!11046 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) k0!1142))))

(declare-fun b!1349302 () Bool)

(declare-fun Unit!44038 () Unit!44034)

(assert (=> b!1349302 (= e!767552 Unit!44038)))

(declare-fun b!1349303 () Bool)

(assert (=> b!1349303 (= e!767553 (isDefined!533 (getValueByKey!726 (toList!11046 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) k0!1142)))))

(assert (= (and d!144541 c!126536) b!1349301))

(assert (= (and d!144541 (not c!126536)) b!1349302))

(assert (= (and d!144541 (not res!895199)) b!1349303))

(declare-fun m!1235965 () Bool)

(assert (=> d!144541 m!1235965))

(declare-fun m!1235967 () Bool)

(assert (=> b!1349301 m!1235967))

(declare-fun m!1235969 () Bool)

(assert (=> b!1349301 m!1235969))

(assert (=> b!1349301 m!1235969))

(declare-fun m!1235971 () Bool)

(assert (=> b!1349301 m!1235971))

(assert (=> b!1349303 m!1235969))

(assert (=> b!1349303 m!1235969))

(assert (=> b!1349303 m!1235971))

(assert (=> b!1349204 d!144541))

(declare-fun d!144543 () Bool)

(declare-fun e!767556 () Bool)

(assert (=> d!144543 e!767556))

(declare-fun res!895204 () Bool)

(assert (=> d!144543 (=> (not res!895204) (not e!767556))))

(declare-fun lt!596289 () ListLongMap!22061)

(assert (=> d!144543 (= res!895204 (contains!9155 lt!596289 (_1!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))))))

(declare-fun lt!596287 () List!31536)

(assert (=> d!144543 (= lt!596289 (ListLongMap!22062 lt!596287))))

(declare-fun lt!596288 () Unit!44034)

(declare-fun lt!596290 () Unit!44034)

(assert (=> d!144543 (= lt!596288 lt!596290)))

(assert (=> d!144543 (= (getValueByKey!726 lt!596287 (_1!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) (Some!776 (_2!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))))))

(declare-fun lemmaContainsTupThenGetReturnValue!369 (List!31536 (_ BitVec 64) V!55217) Unit!44034)

(assert (=> d!144543 (= lt!596290 (lemmaContainsTupThenGetReturnValue!369 lt!596287 (_1!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) (_2!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))))))

(declare-fun insertStrictlySorted!498 (List!31536 (_ BitVec 64) V!55217) List!31536)

(assert (=> d!144543 (= lt!596287 (insertStrictlySorted!498 (toList!11046 lt!596246) (_1!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) (_2!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))))))

(assert (=> d!144543 (= (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) lt!596289)))

(declare-fun b!1349308 () Bool)

(declare-fun res!895205 () Bool)

(assert (=> b!1349308 (=> (not res!895205) (not e!767556))))

(assert (=> b!1349308 (= res!895205 (= (getValueByKey!726 (toList!11046 lt!596289) (_1!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247))) (Some!776 (_2!12213 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)))))))

(declare-fun b!1349309 () Bool)

(declare-fun contains!9157 (List!31536 tuple2!24404) Bool)

(assert (=> b!1349309 (= e!767556 (contains!9157 (toList!11046 lt!596289) (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)))))

(assert (= (and d!144543 res!895204) b!1349308))

(assert (= (and b!1349308 res!895205) b!1349309))

(declare-fun m!1235973 () Bool)

(assert (=> d!144543 m!1235973))

(declare-fun m!1235975 () Bool)

(assert (=> d!144543 m!1235975))

(declare-fun m!1235977 () Bool)

(assert (=> d!144543 m!1235977))

(declare-fun m!1235979 () Bool)

(assert (=> d!144543 m!1235979))

(declare-fun m!1235981 () Bool)

(assert (=> b!1349308 m!1235981))

(declare-fun m!1235983 () Bool)

(assert (=> b!1349309 m!1235983))

(assert (=> b!1349204 d!144543))

(declare-fun b!1349334 () Bool)

(declare-fun e!767573 () Bool)

(declare-fun e!767574 () Bool)

(assert (=> b!1349334 (= e!767573 e!767574)))

(assert (=> b!1349334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun res!895217 () Bool)

(declare-fun lt!596305 () ListLongMap!22061)

(assert (=> b!1349334 (= res!895217 (contains!9155 lt!596305 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349334 (=> (not res!895217) (not e!767574))))

(declare-fun b!1349335 () Bool)

(declare-fun lt!596311 () Unit!44034)

(declare-fun lt!596310 () Unit!44034)

(assert (=> b!1349335 (= lt!596311 lt!596310)))

(declare-fun lt!596306 () (_ BitVec 64))

(declare-fun lt!596308 () (_ BitVec 64))

(declare-fun lt!596309 () ListLongMap!22061)

(declare-fun lt!596307 () V!55217)

(assert (=> b!1349335 (not (contains!9155 (+!4887 lt!596309 (tuple2!24405 lt!596308 lt!596307)) lt!596306))))

(declare-fun addStillNotContains!492 (ListLongMap!22061 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44034)

(assert (=> b!1349335 (= lt!596310 (addStillNotContains!492 lt!596309 lt!596308 lt!596307 lt!596306))))

(assert (=> b!1349335 (= lt!596306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349335 (= lt!596307 (get!22463 (select (arr!44428 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349335 (= lt!596308 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65147 () ListLongMap!22061)

(assert (=> b!1349335 (= lt!596309 call!65147)))

(declare-fun e!767575 () ListLongMap!22061)

(assert (=> b!1349335 (= e!767575 (+!4887 call!65147 (tuple2!24405 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22463 (select (arr!44428 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349336 () Bool)

(declare-fun e!767571 () Bool)

(assert (=> b!1349336 (= e!767573 e!767571)))

(declare-fun c!126546 () Bool)

(assert (=> b!1349336 (= c!126546 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun bm!65144 () Bool)

(assert (=> bm!65144 (= call!65147 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349337 () Bool)

(assert (=> b!1349337 (= e!767571 (= lt!596305 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun d!144545 () Bool)

(declare-fun e!767572 () Bool)

(assert (=> d!144545 e!767572))

(declare-fun res!895214 () Bool)

(assert (=> d!144545 (=> (not res!895214) (not e!767572))))

(assert (=> d!144545 (= res!895214 (not (contains!9155 lt!596305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767577 () ListLongMap!22061)

(assert (=> d!144545 (= lt!596305 e!767577)))

(declare-fun c!126547 () Bool)

(assert (=> d!144545 (= c!126547 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(assert (=> d!144545 (validMask!0 mask!1977)))

(assert (=> d!144545 (= (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596305)))

(declare-fun b!1349338 () Bool)

(assert (=> b!1349338 (= e!767572 e!767573)))

(declare-fun c!126548 () Bool)

(declare-fun e!767576 () Bool)

(assert (=> b!1349338 (= c!126548 e!767576)))

(declare-fun res!895215 () Bool)

(assert (=> b!1349338 (=> (not res!895215) (not e!767576))))

(assert (=> b!1349338 (= res!895215 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun b!1349339 () Bool)

(declare-fun res!895216 () Bool)

(assert (=> b!1349339 (=> (not res!895216) (not e!767572))))

(assert (=> b!1349339 (= res!895216 (not (contains!9155 lt!596305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349340 () Bool)

(assert (=> b!1349340 (= e!767577 (ListLongMap!22062 Nil!31533))))

(declare-fun b!1349341 () Bool)

(assert (=> b!1349341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(assert (=> b!1349341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44980 _values!1303)))))

(declare-fun apply!1033 (ListLongMap!22061 (_ BitVec 64)) V!55217)

(assert (=> b!1349341 (= e!767574 (= (apply!1033 lt!596305 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22463 (select (arr!44428 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349342 () Bool)

(assert (=> b!1349342 (= e!767576 (validKeyInArray!0 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349342 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1349343 () Bool)

(assert (=> b!1349343 (= e!767575 call!65147)))

(declare-fun b!1349344 () Bool)

(declare-fun isEmpty!1104 (ListLongMap!22061) Bool)

(assert (=> b!1349344 (= e!767571 (isEmpty!1104 lt!596305))))

(declare-fun b!1349345 () Bool)

(assert (=> b!1349345 (= e!767577 e!767575)))

(declare-fun c!126545 () Bool)

(assert (=> b!1349345 (= c!126545 (validKeyInArray!0 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (= (and d!144545 c!126547) b!1349340))

(assert (= (and d!144545 (not c!126547)) b!1349345))

(assert (= (and b!1349345 c!126545) b!1349335))

(assert (= (and b!1349345 (not c!126545)) b!1349343))

(assert (= (or b!1349335 b!1349343) bm!65144))

(assert (= (and d!144545 res!895214) b!1349339))

(assert (= (and b!1349339 res!895216) b!1349338))

(assert (= (and b!1349338 res!895215) b!1349342))

(assert (= (and b!1349338 c!126548) b!1349334))

(assert (= (and b!1349338 (not c!126548)) b!1349336))

(assert (= (and b!1349334 res!895217) b!1349341))

(assert (= (and b!1349336 c!126546) b!1349337))

(assert (= (and b!1349336 (not c!126546)) b!1349344))

(declare-fun b_lambda!24693 () Bool)

(assert (=> (not b_lambda!24693) (not b!1349335)))

(assert (=> b!1349335 t!46179))

(declare-fun b_and!50963 () Bool)

(assert (= b_and!50953 (and (=> t!46179 result!25999) b_and!50963)))

(declare-fun b_lambda!24695 () Bool)

(assert (=> (not b_lambda!24695) (not b!1349341)))

(assert (=> b!1349341 t!46179))

(declare-fun b_and!50965 () Bool)

(assert (= b_and!50963 (and (=> t!46179 result!25999) b_and!50965)))

(declare-fun m!1235985 () Bool)

(assert (=> b!1349341 m!1235985))

(declare-fun m!1235987 () Bool)

(assert (=> b!1349341 m!1235987))

(assert (=> b!1349341 m!1235985))

(declare-fun m!1235989 () Bool)

(assert (=> b!1349341 m!1235989))

(assert (=> b!1349341 m!1235989))

(assert (=> b!1349341 m!1235869))

(declare-fun m!1235991 () Bool)

(assert (=> b!1349341 m!1235991))

(assert (=> b!1349341 m!1235869))

(assert (=> b!1349334 m!1235985))

(assert (=> b!1349334 m!1235985))

(declare-fun m!1235993 () Bool)

(assert (=> b!1349334 m!1235993))

(declare-fun m!1235995 () Bool)

(assert (=> b!1349344 m!1235995))

(declare-fun m!1235997 () Bool)

(assert (=> d!144545 m!1235997))

(assert (=> d!144545 m!1235877))

(declare-fun m!1235999 () Bool)

(assert (=> b!1349335 m!1235999))

(declare-fun m!1236001 () Bool)

(assert (=> b!1349335 m!1236001))

(assert (=> b!1349335 m!1235999))

(assert (=> b!1349335 m!1235985))

(declare-fun m!1236003 () Bool)

(assert (=> b!1349335 m!1236003))

(assert (=> b!1349335 m!1235989))

(assert (=> b!1349335 m!1235989))

(assert (=> b!1349335 m!1235869))

(assert (=> b!1349335 m!1235991))

(assert (=> b!1349335 m!1235869))

(declare-fun m!1236005 () Bool)

(assert (=> b!1349335 m!1236005))

(assert (=> b!1349342 m!1235985))

(assert (=> b!1349342 m!1235985))

(declare-fun m!1236007 () Bool)

(assert (=> b!1349342 m!1236007))

(declare-fun m!1236009 () Bool)

(assert (=> b!1349337 m!1236009))

(declare-fun m!1236011 () Bool)

(assert (=> b!1349339 m!1236011))

(assert (=> b!1349345 m!1235985))

(assert (=> b!1349345 m!1235985))

(assert (=> b!1349345 m!1236007))

(assert (=> bm!65144 m!1236009))

(assert (=> b!1349204 d!144545))

(declare-fun d!144547 () Bool)

(declare-fun c!126551 () Bool)

(assert (=> d!144547 (= c!126551 ((_ is ValueCellFull!17894) (select (arr!44428 _values!1303) from!1960)))))

(declare-fun e!767580 () V!55217)

(assert (=> d!144547 (= (get!22463 (select (arr!44428 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767580)))

(declare-fun b!1349350 () Bool)

(declare-fun get!22464 (ValueCell!17894 V!55217) V!55217)

(assert (=> b!1349350 (= e!767580 (get!22464 (select (arr!44428 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349351 () Bool)

(declare-fun get!22465 (ValueCell!17894 V!55217) V!55217)

(assert (=> b!1349351 (= e!767580 (get!22465 (select (arr!44428 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144547 c!126551) b!1349350))

(assert (= (and d!144547 (not c!126551)) b!1349351))

(assert (=> b!1349350 m!1235867))

(assert (=> b!1349350 m!1235869))

(declare-fun m!1236013 () Bool)

(assert (=> b!1349350 m!1236013))

(assert (=> b!1349351 m!1235867))

(assert (=> b!1349351 m!1235869))

(declare-fun m!1236015 () Bool)

(assert (=> b!1349351 m!1236015))

(assert (=> b!1349204 d!144547))

(declare-fun d!144549 () Bool)

(assert (=> d!144549 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113676 d!144549))

(declare-fun d!144551 () Bool)

(assert (=> d!144551 (= (array_inv!33665 _keys!1571) (bvsge (size!44981 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113676 d!144551))

(declare-fun d!144553 () Bool)

(assert (=> d!144553 (= (array_inv!33666 _values!1303) (bvsge (size!44980 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113676 d!144553))

(declare-fun d!144555 () Bool)

(declare-fun e!767582 () Bool)

(assert (=> d!144555 e!767582))

(declare-fun res!895218 () Bool)

(assert (=> d!144555 (=> res!895218 e!767582)))

(declare-fun lt!596314 () Bool)

(assert (=> d!144555 (= res!895218 (not lt!596314))))

(declare-fun lt!596315 () Bool)

(assert (=> d!144555 (= lt!596314 lt!596315)))

(declare-fun lt!596312 () Unit!44034)

(declare-fun e!767581 () Unit!44034)

(assert (=> d!144555 (= lt!596312 e!767581)))

(declare-fun c!126552 () Bool)

(assert (=> d!144555 (= c!126552 lt!596315)))

(assert (=> d!144555 (= lt!596315 (containsKey!743 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144555 (= (contains!9155 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596314)))

(declare-fun b!1349352 () Bool)

(declare-fun lt!596313 () Unit!44034)

(assert (=> b!1349352 (= e!767581 lt!596313)))

(assert (=> b!1349352 (= lt!596313 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1349352 (isDefined!533 (getValueByKey!726 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1349353 () Bool)

(declare-fun Unit!44039 () Unit!44034)

(assert (=> b!1349353 (= e!767581 Unit!44039)))

(declare-fun b!1349354 () Bool)

(assert (=> b!1349354 (= e!767582 (isDefined!533 (getValueByKey!726 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144555 c!126552) b!1349352))

(assert (= (and d!144555 (not c!126552)) b!1349353))

(assert (= (and d!144555 (not res!895218)) b!1349354))

(declare-fun m!1236017 () Bool)

(assert (=> d!144555 m!1236017))

(declare-fun m!1236019 () Bool)

(assert (=> b!1349352 m!1236019))

(declare-fun m!1236021 () Bool)

(assert (=> b!1349352 m!1236021))

(assert (=> b!1349352 m!1236021))

(declare-fun m!1236023 () Bool)

(assert (=> b!1349352 m!1236023))

(assert (=> b!1349354 m!1236021))

(assert (=> b!1349354 m!1236021))

(assert (=> b!1349354 m!1236023))

(assert (=> b!1349193 d!144555))

(declare-fun d!144557 () Bool)

(declare-fun e!767620 () Bool)

(assert (=> d!144557 e!767620))

(declare-fun res!895238 () Bool)

(assert (=> d!144557 (=> (not res!895238) (not e!767620))))

(assert (=> d!144557 (= res!895238 (or (bvsge from!1960 (size!44981 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44981 _keys!1571)))))))

(declare-fun lt!596374 () ListLongMap!22061)

(declare-fun lt!596375 () ListLongMap!22061)

(assert (=> d!144557 (= lt!596374 lt!596375)))

(declare-fun lt!596372 () Unit!44034)

(declare-fun e!767611 () Unit!44034)

(assert (=> d!144557 (= lt!596372 e!767611)))

(declare-fun c!126569 () Bool)

(declare-fun e!767609 () Bool)

(assert (=> d!144557 (= c!126569 e!767609)))

(declare-fun res!895240 () Bool)

(assert (=> d!144557 (=> (not res!895240) (not e!767609))))

(assert (=> d!144557 (= res!895240 (bvslt from!1960 (size!44981 _keys!1571)))))

(declare-fun e!767618 () ListLongMap!22061)

(assert (=> d!144557 (= lt!596375 e!767618)))

(declare-fun c!126567 () Bool)

(assert (=> d!144557 (= c!126567 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144557 (validMask!0 mask!1977)))

(assert (=> d!144557 (= (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596374)))

(declare-fun b!1349397 () Bool)

(declare-fun e!767616 () Bool)

(declare-fun e!767613 () Bool)

(assert (=> b!1349397 (= e!767616 e!767613)))

(declare-fun res!895237 () Bool)

(declare-fun call!65162 () Bool)

(assert (=> b!1349397 (= res!895237 call!65162)))

(assert (=> b!1349397 (=> (not res!895237) (not e!767613))))

(declare-fun b!1349398 () Bool)

(declare-fun e!767615 () ListLongMap!22061)

(assert (=> b!1349398 (= e!767618 e!767615)))

(declare-fun c!126568 () Bool)

(assert (=> b!1349398 (= c!126568 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65159 () Bool)

(declare-fun call!65168 () ListLongMap!22061)

(declare-fun call!65167 () ListLongMap!22061)

(assert (=> bm!65159 (= call!65168 call!65167)))

(declare-fun b!1349399 () Bool)

(declare-fun e!767619 () Bool)

(assert (=> b!1349399 (= e!767619 (= (apply!1033 lt!596374 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349400 () Bool)

(declare-fun c!126570 () Bool)

(assert (=> b!1349400 (= c!126570 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767612 () ListLongMap!22061)

(assert (=> b!1349400 (= e!767615 e!767612)))

(declare-fun b!1349401 () Bool)

(declare-fun res!895239 () Bool)

(assert (=> b!1349401 (=> (not res!895239) (not e!767620))))

(declare-fun e!767621 () Bool)

(assert (=> b!1349401 (= res!895239 e!767621)))

(declare-fun res!895243 () Bool)

(assert (=> b!1349401 (=> res!895243 e!767621)))

(declare-fun e!767614 () Bool)

(assert (=> b!1349401 (= res!895243 (not e!767614))))

(declare-fun res!895241 () Bool)

(assert (=> b!1349401 (=> (not res!895241) (not e!767614))))

(assert (=> b!1349401 (= res!895241 (bvslt from!1960 (size!44981 _keys!1571)))))

(declare-fun call!65166 () ListLongMap!22061)

(declare-fun call!65165 () ListLongMap!22061)

(declare-fun bm!65160 () Bool)

(assert (=> bm!65160 (= call!65165 (+!4887 (ite c!126567 call!65166 (ite c!126568 call!65167 call!65168)) (ite (or c!126567 c!126568) (tuple2!24405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1349402 () Bool)

(declare-fun res!895245 () Bool)

(assert (=> b!1349402 (=> (not res!895245) (not e!767620))))

(assert (=> b!1349402 (= res!895245 e!767616)))

(declare-fun c!126565 () Bool)

(assert (=> b!1349402 (= c!126565 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65161 () Bool)

(assert (=> bm!65161 (= call!65166 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1349403 () Bool)

(assert (=> b!1349403 (= e!767614 (validKeyInArray!0 (select (arr!44429 _keys!1571) from!1960)))))

(declare-fun b!1349404 () Bool)

(declare-fun call!65163 () ListLongMap!22061)

(assert (=> b!1349404 (= e!767612 call!65163)))

(declare-fun b!1349405 () Bool)

(declare-fun e!767610 () Bool)

(assert (=> b!1349405 (= e!767620 e!767610)))

(declare-fun c!126566 () Bool)

(assert (=> b!1349405 (= c!126566 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65162 () Bool)

(assert (=> bm!65162 (= call!65162 (contains!9155 lt!596374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349406 () Bool)

(assert (=> b!1349406 (= e!767616 (not call!65162))))

(declare-fun b!1349407 () Bool)

(assert (=> b!1349407 (= e!767612 call!65168)))

(declare-fun b!1349408 () Bool)

(declare-fun e!767617 () Bool)

(assert (=> b!1349408 (= e!767621 e!767617)))

(declare-fun res!895244 () Bool)

(assert (=> b!1349408 (=> (not res!895244) (not e!767617))))

(assert (=> b!1349408 (= res!895244 (contains!9155 lt!596374 (select (arr!44429 _keys!1571) from!1960)))))

(assert (=> b!1349408 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44981 _keys!1571)))))

(declare-fun b!1349409 () Bool)

(declare-fun Unit!44040 () Unit!44034)

(assert (=> b!1349409 (= e!767611 Unit!44040)))

(declare-fun b!1349410 () Bool)

(assert (=> b!1349410 (= e!767618 (+!4887 call!65165 (tuple2!24405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349411 () Bool)

(declare-fun call!65164 () Bool)

(assert (=> b!1349411 (= e!767610 (not call!65164))))

(declare-fun bm!65163 () Bool)

(assert (=> bm!65163 (= call!65167 call!65166)))

(declare-fun bm!65164 () Bool)

(assert (=> bm!65164 (= call!65164 (contains!9155 lt!596374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349412 () Bool)

(declare-fun lt!596370 () Unit!44034)

(assert (=> b!1349412 (= e!767611 lt!596370)))

(declare-fun lt!596373 () ListLongMap!22061)

(assert (=> b!1349412 (= lt!596373 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596379 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596366 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596366 (select (arr!44429 _keys!1571) from!1960))))

(declare-fun lt!596377 () Unit!44034)

(declare-fun addStillContains!1210 (ListLongMap!22061 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44034)

(assert (=> b!1349412 (= lt!596377 (addStillContains!1210 lt!596373 lt!596379 zeroValue!1245 lt!596366))))

(assert (=> b!1349412 (contains!9155 (+!4887 lt!596373 (tuple2!24405 lt!596379 zeroValue!1245)) lt!596366)))

(declare-fun lt!596376 () Unit!44034)

(assert (=> b!1349412 (= lt!596376 lt!596377)))

(declare-fun lt!596362 () ListLongMap!22061)

(assert (=> b!1349412 (= lt!596362 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596369 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596360 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596360 (select (arr!44429 _keys!1571) from!1960))))

(declare-fun lt!596380 () Unit!44034)

(declare-fun addApplyDifferent!571 (ListLongMap!22061 (_ BitVec 64) V!55217 (_ BitVec 64)) Unit!44034)

(assert (=> b!1349412 (= lt!596380 (addApplyDifferent!571 lt!596362 lt!596369 minValue!1245 lt!596360))))

(assert (=> b!1349412 (= (apply!1033 (+!4887 lt!596362 (tuple2!24405 lt!596369 minValue!1245)) lt!596360) (apply!1033 lt!596362 lt!596360))))

(declare-fun lt!596371 () Unit!44034)

(assert (=> b!1349412 (= lt!596371 lt!596380)))

(declare-fun lt!596363 () ListLongMap!22061)

(assert (=> b!1349412 (= lt!596363 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596364 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596381 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596381 (select (arr!44429 _keys!1571) from!1960))))

(declare-fun lt!596367 () Unit!44034)

(assert (=> b!1349412 (= lt!596367 (addApplyDifferent!571 lt!596363 lt!596364 zeroValue!1245 lt!596381))))

(assert (=> b!1349412 (= (apply!1033 (+!4887 lt!596363 (tuple2!24405 lt!596364 zeroValue!1245)) lt!596381) (apply!1033 lt!596363 lt!596381))))

(declare-fun lt!596365 () Unit!44034)

(assert (=> b!1349412 (= lt!596365 lt!596367)))

(declare-fun lt!596378 () ListLongMap!22061)

(assert (=> b!1349412 (= lt!596378 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596368 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596368 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596361 () (_ BitVec 64))

(assert (=> b!1349412 (= lt!596361 (select (arr!44429 _keys!1571) from!1960))))

(assert (=> b!1349412 (= lt!596370 (addApplyDifferent!571 lt!596378 lt!596368 minValue!1245 lt!596361))))

(assert (=> b!1349412 (= (apply!1033 (+!4887 lt!596378 (tuple2!24405 lt!596368 minValue!1245)) lt!596361) (apply!1033 lt!596378 lt!596361))))

(declare-fun b!1349413 () Bool)

(assert (=> b!1349413 (= e!767615 call!65163)))

(declare-fun b!1349414 () Bool)

(assert (=> b!1349414 (= e!767613 (= (apply!1033 lt!596374 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun bm!65165 () Bool)

(assert (=> bm!65165 (= call!65163 call!65165)))

(declare-fun b!1349415 () Bool)

(assert (=> b!1349415 (= e!767617 (= (apply!1033 lt!596374 (select (arr!44429 _keys!1571) from!1960)) (get!22463 (select (arr!44428 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349415 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44980 _values!1303)))))

(assert (=> b!1349415 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44981 _keys!1571)))))

(declare-fun b!1349416 () Bool)

(assert (=> b!1349416 (= e!767610 e!767619)))

(declare-fun res!895242 () Bool)

(assert (=> b!1349416 (= res!895242 call!65164)))

(assert (=> b!1349416 (=> (not res!895242) (not e!767619))))

(declare-fun b!1349417 () Bool)

(assert (=> b!1349417 (= e!767609 (validKeyInArray!0 (select (arr!44429 _keys!1571) from!1960)))))

(assert (= (and d!144557 c!126567) b!1349410))

(assert (= (and d!144557 (not c!126567)) b!1349398))

(assert (= (and b!1349398 c!126568) b!1349413))

(assert (= (and b!1349398 (not c!126568)) b!1349400))

(assert (= (and b!1349400 c!126570) b!1349404))

(assert (= (and b!1349400 (not c!126570)) b!1349407))

(assert (= (or b!1349404 b!1349407) bm!65159))

(assert (= (or b!1349413 bm!65159) bm!65163))

(assert (= (or b!1349413 b!1349404) bm!65165))

(assert (= (or b!1349410 bm!65163) bm!65161))

(assert (= (or b!1349410 bm!65165) bm!65160))

(assert (= (and d!144557 res!895240) b!1349417))

(assert (= (and d!144557 c!126569) b!1349412))

(assert (= (and d!144557 (not c!126569)) b!1349409))

(assert (= (and d!144557 res!895238) b!1349401))

(assert (= (and b!1349401 res!895241) b!1349403))

(assert (= (and b!1349401 (not res!895243)) b!1349408))

(assert (= (and b!1349408 res!895244) b!1349415))

(assert (= (and b!1349401 res!895239) b!1349402))

(assert (= (and b!1349402 c!126565) b!1349397))

(assert (= (and b!1349402 (not c!126565)) b!1349406))

(assert (= (and b!1349397 res!895237) b!1349414))

(assert (= (or b!1349397 b!1349406) bm!65162))

(assert (= (and b!1349402 res!895245) b!1349405))

(assert (= (and b!1349405 c!126566) b!1349416))

(assert (= (and b!1349405 (not c!126566)) b!1349411))

(assert (= (and b!1349416 res!895242) b!1349399))

(assert (= (or b!1349416 b!1349411) bm!65164))

(declare-fun b_lambda!24697 () Bool)

(assert (=> (not b_lambda!24697) (not b!1349415)))

(assert (=> b!1349415 t!46179))

(declare-fun b_and!50967 () Bool)

(assert (= b_and!50965 (and (=> t!46179 result!25999) b_and!50967)))

(declare-fun m!1236025 () Bool)

(assert (=> bm!65162 m!1236025))

(declare-fun m!1236027 () Bool)

(assert (=> bm!65161 m!1236027))

(declare-fun m!1236029 () Bool)

(assert (=> b!1349412 m!1236029))

(declare-fun m!1236031 () Bool)

(assert (=> b!1349412 m!1236031))

(declare-fun m!1236033 () Bool)

(assert (=> b!1349412 m!1236033))

(declare-fun m!1236035 () Bool)

(assert (=> b!1349412 m!1236035))

(declare-fun m!1236037 () Bool)

(assert (=> b!1349412 m!1236037))

(declare-fun m!1236039 () Bool)

(assert (=> b!1349412 m!1236039))

(assert (=> b!1349412 m!1236031))

(assert (=> b!1349412 m!1235845))

(assert (=> b!1349412 m!1236029))

(declare-fun m!1236041 () Bool)

(assert (=> b!1349412 m!1236041))

(declare-fun m!1236043 () Bool)

(assert (=> b!1349412 m!1236043))

(declare-fun m!1236045 () Bool)

(assert (=> b!1349412 m!1236045))

(declare-fun m!1236047 () Bool)

(assert (=> b!1349412 m!1236047))

(assert (=> b!1349412 m!1236035))

(declare-fun m!1236049 () Bool)

(assert (=> b!1349412 m!1236049))

(assert (=> b!1349412 m!1236045))

(declare-fun m!1236051 () Bool)

(assert (=> b!1349412 m!1236051))

(declare-fun m!1236053 () Bool)

(assert (=> b!1349412 m!1236053))

(declare-fun m!1236055 () Bool)

(assert (=> b!1349412 m!1236055))

(declare-fun m!1236057 () Bool)

(assert (=> b!1349412 m!1236057))

(assert (=> b!1349412 m!1236027))

(declare-fun m!1236059 () Bool)

(assert (=> b!1349414 m!1236059))

(assert (=> b!1349415 m!1235867))

(assert (=> b!1349415 m!1235869))

(assert (=> b!1349415 m!1235871))

(assert (=> b!1349415 m!1235867))

(assert (=> b!1349415 m!1235869))

(assert (=> b!1349415 m!1235845))

(assert (=> b!1349415 m!1235845))

(declare-fun m!1236061 () Bool)

(assert (=> b!1349415 m!1236061))

(declare-fun m!1236063 () Bool)

(assert (=> b!1349399 m!1236063))

(assert (=> b!1349417 m!1235845))

(assert (=> b!1349417 m!1235845))

(assert (=> b!1349417 m!1235847))

(assert (=> b!1349408 m!1235845))

(assert (=> b!1349408 m!1235845))

(declare-fun m!1236065 () Bool)

(assert (=> b!1349408 m!1236065))

(declare-fun m!1236067 () Bool)

(assert (=> b!1349410 m!1236067))

(assert (=> d!144557 m!1235877))

(assert (=> b!1349403 m!1235845))

(assert (=> b!1349403 m!1235845))

(assert (=> b!1349403 m!1235847))

(declare-fun m!1236069 () Bool)

(assert (=> bm!65164 m!1236069))

(declare-fun m!1236071 () Bool)

(assert (=> bm!65160 m!1236071))

(assert (=> b!1349193 d!144557))

(declare-fun d!144559 () Bool)

(declare-fun res!895251 () Bool)

(declare-fun e!767629 () Bool)

(assert (=> d!144559 (=> res!895251 e!767629)))

(assert (=> d!144559 (= res!895251 (bvsge #b00000000000000000000000000000000 (size!44981 _keys!1571)))))

(assert (=> d!144559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767629)))

(declare-fun b!1349426 () Bool)

(declare-fun e!767628 () Bool)

(assert (=> b!1349426 (= e!767629 e!767628)))

(declare-fun c!126573 () Bool)

(assert (=> b!1349426 (= c!126573 (validKeyInArray!0 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349427 () Bool)

(declare-fun e!767630 () Bool)

(declare-fun call!65171 () Bool)

(assert (=> b!1349427 (= e!767630 call!65171)))

(declare-fun b!1349428 () Bool)

(assert (=> b!1349428 (= e!767628 call!65171)))

(declare-fun b!1349429 () Bool)

(assert (=> b!1349429 (= e!767628 e!767630)))

(declare-fun lt!596390 () (_ BitVec 64))

(assert (=> b!1349429 (= lt!596390 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596388 () Unit!44034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91951 (_ BitVec 64) (_ BitVec 32)) Unit!44034)

(assert (=> b!1349429 (= lt!596388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596390 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1349429 (arrayContainsKey!0 _keys!1571 lt!596390 #b00000000000000000000000000000000)))

(declare-fun lt!596389 () Unit!44034)

(assert (=> b!1349429 (= lt!596389 lt!596388)))

(declare-fun res!895250 () Bool)

(declare-datatypes ((SeekEntryResult!10058 0))(
  ( (MissingZero!10058 (index!42603 (_ BitVec 32))) (Found!10058 (index!42604 (_ BitVec 32))) (Intermediate!10058 (undefined!10870 Bool) (index!42605 (_ BitVec 32)) (x!120756 (_ BitVec 32))) (Undefined!10058) (MissingVacant!10058 (index!42606 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91951 (_ BitVec 32)) SeekEntryResult!10058)

(assert (=> b!1349429 (= res!895250 (= (seekEntryOrOpen!0 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10058 #b00000000000000000000000000000000)))))

(assert (=> b!1349429 (=> (not res!895250) (not e!767630))))

(declare-fun bm!65168 () Bool)

(assert (=> bm!65168 (= call!65171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!144559 (not res!895251)) b!1349426))

(assert (= (and b!1349426 c!126573) b!1349429))

(assert (= (and b!1349426 (not c!126573)) b!1349428))

(assert (= (and b!1349429 res!895250) b!1349427))

(assert (= (or b!1349427 b!1349428) bm!65168))

(declare-fun m!1236073 () Bool)

(assert (=> b!1349426 m!1236073))

(assert (=> b!1349426 m!1236073))

(declare-fun m!1236075 () Bool)

(assert (=> b!1349426 m!1236075))

(assert (=> b!1349429 m!1236073))

(declare-fun m!1236077 () Bool)

(assert (=> b!1349429 m!1236077))

(declare-fun m!1236079 () Bool)

(assert (=> b!1349429 m!1236079))

(assert (=> b!1349429 m!1236073))

(declare-fun m!1236081 () Bool)

(assert (=> b!1349429 m!1236081))

(declare-fun m!1236083 () Bool)

(assert (=> bm!65168 m!1236083))

(assert (=> b!1349197 d!144559))

(declare-fun d!144561 () Bool)

(assert (=> d!144561 (= (validKeyInArray!0 (select (arr!44429 _keys!1571) from!1960)) (and (not (= (select (arr!44429 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44429 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349192 d!144561))

(declare-fun b!1349440 () Bool)

(declare-fun e!767640 () Bool)

(declare-fun contains!9158 (List!31537 (_ BitVec 64)) Bool)

(assert (=> b!1349440 (= e!767640 (contains!9158 Nil!31534 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349441 () Bool)

(declare-fun e!767641 () Bool)

(declare-fun call!65174 () Bool)

(assert (=> b!1349441 (= e!767641 call!65174)))

(declare-fun bm!65171 () Bool)

(declare-fun c!126576 () Bool)

(assert (=> bm!65171 (= call!65174 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126576 (Cons!31533 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000) Nil!31534) Nil!31534)))))

(declare-fun d!144563 () Bool)

(declare-fun res!895260 () Bool)

(declare-fun e!767642 () Bool)

(assert (=> d!144563 (=> res!895260 e!767642)))

(assert (=> d!144563 (= res!895260 (bvsge #b00000000000000000000000000000000 (size!44981 _keys!1571)))))

(assert (=> d!144563 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31534) e!767642)))

(declare-fun b!1349442 () Bool)

(declare-fun e!767639 () Bool)

(assert (=> b!1349442 (= e!767642 e!767639)))

(declare-fun res!895258 () Bool)

(assert (=> b!1349442 (=> (not res!895258) (not e!767639))))

(assert (=> b!1349442 (= res!895258 (not e!767640))))

(declare-fun res!895259 () Bool)

(assert (=> b!1349442 (=> (not res!895259) (not e!767640))))

(assert (=> b!1349442 (= res!895259 (validKeyInArray!0 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349443 () Bool)

(assert (=> b!1349443 (= e!767641 call!65174)))

(declare-fun b!1349444 () Bool)

(assert (=> b!1349444 (= e!767639 e!767641)))

(assert (=> b!1349444 (= c!126576 (validKeyInArray!0 (select (arr!44429 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144563 (not res!895260)) b!1349442))

(assert (= (and b!1349442 res!895259) b!1349440))

(assert (= (and b!1349442 res!895258) b!1349444))

(assert (= (and b!1349444 c!126576) b!1349443))

(assert (= (and b!1349444 (not c!126576)) b!1349441))

(assert (= (or b!1349443 b!1349441) bm!65171))

(assert (=> b!1349440 m!1236073))

(assert (=> b!1349440 m!1236073))

(declare-fun m!1236085 () Bool)

(assert (=> b!1349440 m!1236085))

(assert (=> bm!65171 m!1236073))

(declare-fun m!1236087 () Bool)

(assert (=> bm!65171 m!1236087))

(assert (=> b!1349442 m!1236073))

(assert (=> b!1349442 m!1236073))

(assert (=> b!1349442 m!1236075))

(assert (=> b!1349444 m!1236073))

(assert (=> b!1349444 m!1236073))

(assert (=> b!1349444 m!1236075))

(assert (=> b!1349201 d!144563))

(declare-fun d!144565 () Bool)

(declare-fun e!767644 () Bool)

(assert (=> d!144565 e!767644))

(declare-fun res!895261 () Bool)

(assert (=> d!144565 (=> res!895261 e!767644)))

(declare-fun lt!596393 () Bool)

(assert (=> d!144565 (= res!895261 (not lt!596393))))

(declare-fun lt!596394 () Bool)

(assert (=> d!144565 (= lt!596393 lt!596394)))

(declare-fun lt!596391 () Unit!44034)

(declare-fun e!767643 () Unit!44034)

(assert (=> d!144565 (= lt!596391 e!767643)))

(declare-fun c!126577 () Bool)

(assert (=> d!144565 (= c!126577 lt!596394)))

(assert (=> d!144565 (= lt!596394 (containsKey!743 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144565 (= (contains!9155 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596393)))

(declare-fun b!1349445 () Bool)

(declare-fun lt!596392 () Unit!44034)

(assert (=> b!1349445 (= e!767643 lt!596392)))

(assert (=> b!1349445 (= lt!596392 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1349445 (isDefined!533 (getValueByKey!726 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1349446 () Bool)

(declare-fun Unit!44041 () Unit!44034)

(assert (=> b!1349446 (= e!767643 Unit!44041)))

(declare-fun b!1349447 () Bool)

(assert (=> b!1349447 (= e!767644 (isDefined!533 (getValueByKey!726 (toList!11046 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144565 c!126577) b!1349445))

(assert (= (and d!144565 (not c!126577)) b!1349446))

(assert (= (and d!144565 (not res!895261)) b!1349447))

(declare-fun m!1236089 () Bool)

(assert (=> d!144565 m!1236089))

(declare-fun m!1236091 () Bool)

(assert (=> b!1349445 m!1236091))

(declare-fun m!1236093 () Bool)

(assert (=> b!1349445 m!1236093))

(assert (=> b!1349445 m!1236093))

(declare-fun m!1236095 () Bool)

(assert (=> b!1349445 m!1236095))

(assert (=> b!1349447 m!1236093))

(assert (=> b!1349447 m!1236093))

(assert (=> b!1349447 m!1236095))

(assert (=> b!1349200 d!144565))

(declare-fun d!144567 () Bool)

(declare-fun e!767656 () Bool)

(assert (=> d!144567 e!767656))

(declare-fun res!895263 () Bool)

(assert (=> d!144567 (=> (not res!895263) (not e!767656))))

(assert (=> d!144567 (= res!895263 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))))

(declare-fun lt!596409 () ListLongMap!22061)

(declare-fun lt!596410 () ListLongMap!22061)

(assert (=> d!144567 (= lt!596409 lt!596410)))

(declare-fun lt!596407 () Unit!44034)

(declare-fun e!767647 () Unit!44034)

(assert (=> d!144567 (= lt!596407 e!767647)))

(declare-fun c!126582 () Bool)

(declare-fun e!767645 () Bool)

(assert (=> d!144567 (= c!126582 e!767645)))

(declare-fun res!895265 () Bool)

(assert (=> d!144567 (=> (not res!895265) (not e!767645))))

(assert (=> d!144567 (= res!895265 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun e!767654 () ListLongMap!22061)

(assert (=> d!144567 (= lt!596410 e!767654)))

(declare-fun c!126580 () Bool)

(assert (=> d!144567 (= c!126580 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144567 (validMask!0 mask!1977)))

(assert (=> d!144567 (= (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596409)))

(declare-fun b!1349448 () Bool)

(declare-fun e!767652 () Bool)

(declare-fun e!767649 () Bool)

(assert (=> b!1349448 (= e!767652 e!767649)))

(declare-fun res!895262 () Bool)

(declare-fun call!65175 () Bool)

(assert (=> b!1349448 (= res!895262 call!65175)))

(assert (=> b!1349448 (=> (not res!895262) (not e!767649))))

(declare-fun b!1349449 () Bool)

(declare-fun e!767651 () ListLongMap!22061)

(assert (=> b!1349449 (= e!767654 e!767651)))

(declare-fun c!126581 () Bool)

(assert (=> b!1349449 (= c!126581 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65172 () Bool)

(declare-fun call!65181 () ListLongMap!22061)

(declare-fun call!65180 () ListLongMap!22061)

(assert (=> bm!65172 (= call!65181 call!65180)))

(declare-fun b!1349450 () Bool)

(declare-fun e!767655 () Bool)

(assert (=> b!1349450 (= e!767655 (= (apply!1033 lt!596409 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349451 () Bool)

(declare-fun c!126583 () Bool)

(assert (=> b!1349451 (= c!126583 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767648 () ListLongMap!22061)

(assert (=> b!1349451 (= e!767651 e!767648)))

(declare-fun b!1349452 () Bool)

(declare-fun res!895264 () Bool)

(assert (=> b!1349452 (=> (not res!895264) (not e!767656))))

(declare-fun e!767657 () Bool)

(assert (=> b!1349452 (= res!895264 e!767657)))

(declare-fun res!895268 () Bool)

(assert (=> b!1349452 (=> res!895268 e!767657)))

(declare-fun e!767650 () Bool)

(assert (=> b!1349452 (= res!895268 (not e!767650))))

(declare-fun res!895266 () Bool)

(assert (=> b!1349452 (=> (not res!895266) (not e!767650))))

(assert (=> b!1349452 (= res!895266 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun call!65179 () ListLongMap!22061)

(declare-fun bm!65173 () Bool)

(declare-fun call!65178 () ListLongMap!22061)

(assert (=> bm!65173 (= call!65178 (+!4887 (ite c!126580 call!65179 (ite c!126581 call!65180 call!65181)) (ite (or c!126580 c!126581) (tuple2!24405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1349453 () Bool)

(declare-fun res!895270 () Bool)

(assert (=> b!1349453 (=> (not res!895270) (not e!767656))))

(assert (=> b!1349453 (= res!895270 e!767652)))

(declare-fun c!126578 () Bool)

(assert (=> b!1349453 (= c!126578 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65174 () Bool)

(assert (=> bm!65174 (= call!65179 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1349454 () Bool)

(assert (=> b!1349454 (= e!767650 (validKeyInArray!0 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349455 () Bool)

(declare-fun call!65176 () ListLongMap!22061)

(assert (=> b!1349455 (= e!767648 call!65176)))

(declare-fun b!1349456 () Bool)

(declare-fun e!767646 () Bool)

(assert (=> b!1349456 (= e!767656 e!767646)))

(declare-fun c!126579 () Bool)

(assert (=> b!1349456 (= c!126579 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65175 () Bool)

(assert (=> bm!65175 (= call!65175 (contains!9155 lt!596409 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349457 () Bool)

(assert (=> b!1349457 (= e!767652 (not call!65175))))

(declare-fun b!1349458 () Bool)

(assert (=> b!1349458 (= e!767648 call!65181)))

(declare-fun b!1349459 () Bool)

(declare-fun e!767653 () Bool)

(assert (=> b!1349459 (= e!767657 e!767653)))

(declare-fun res!895269 () Bool)

(assert (=> b!1349459 (=> (not res!895269) (not e!767653))))

(assert (=> b!1349459 (= res!895269 (contains!9155 lt!596409 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349459 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun b!1349460 () Bool)

(declare-fun Unit!44042 () Unit!44034)

(assert (=> b!1349460 (= e!767647 Unit!44042)))

(declare-fun b!1349461 () Bool)

(assert (=> b!1349461 (= e!767654 (+!4887 call!65178 (tuple2!24405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349462 () Bool)

(declare-fun call!65177 () Bool)

(assert (=> b!1349462 (= e!767646 (not call!65177))))

(declare-fun bm!65176 () Bool)

(assert (=> bm!65176 (= call!65180 call!65179)))

(declare-fun bm!65177 () Bool)

(assert (=> bm!65177 (= call!65177 (contains!9155 lt!596409 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349463 () Bool)

(declare-fun lt!596405 () Unit!44034)

(assert (=> b!1349463 (= e!767647 lt!596405)))

(declare-fun lt!596408 () ListLongMap!22061)

(assert (=> b!1349463 (= lt!596408 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596414 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596401 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596401 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596412 () Unit!44034)

(assert (=> b!1349463 (= lt!596412 (addStillContains!1210 lt!596408 lt!596414 zeroValue!1245 lt!596401))))

(assert (=> b!1349463 (contains!9155 (+!4887 lt!596408 (tuple2!24405 lt!596414 zeroValue!1245)) lt!596401)))

(declare-fun lt!596411 () Unit!44034)

(assert (=> b!1349463 (= lt!596411 lt!596412)))

(declare-fun lt!596397 () ListLongMap!22061)

(assert (=> b!1349463 (= lt!596397 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596404 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596404 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596395 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596395 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596415 () Unit!44034)

(assert (=> b!1349463 (= lt!596415 (addApplyDifferent!571 lt!596397 lt!596404 minValue!1245 lt!596395))))

(assert (=> b!1349463 (= (apply!1033 (+!4887 lt!596397 (tuple2!24405 lt!596404 minValue!1245)) lt!596395) (apply!1033 lt!596397 lt!596395))))

(declare-fun lt!596406 () Unit!44034)

(assert (=> b!1349463 (= lt!596406 lt!596415)))

(declare-fun lt!596398 () ListLongMap!22061)

(assert (=> b!1349463 (= lt!596398 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596399 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596416 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596416 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596402 () Unit!44034)

(assert (=> b!1349463 (= lt!596402 (addApplyDifferent!571 lt!596398 lt!596399 zeroValue!1245 lt!596416))))

(assert (=> b!1349463 (= (apply!1033 (+!4887 lt!596398 (tuple2!24405 lt!596399 zeroValue!1245)) lt!596416) (apply!1033 lt!596398 lt!596416))))

(declare-fun lt!596400 () Unit!44034)

(assert (=> b!1349463 (= lt!596400 lt!596402)))

(declare-fun lt!596413 () ListLongMap!22061)

(assert (=> b!1349463 (= lt!596413 (getCurrentListMapNoExtraKeys!6535 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596403 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596403 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596396 () (_ BitVec 64))

(assert (=> b!1349463 (= lt!596396 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349463 (= lt!596405 (addApplyDifferent!571 lt!596413 lt!596403 minValue!1245 lt!596396))))

(assert (=> b!1349463 (= (apply!1033 (+!4887 lt!596413 (tuple2!24405 lt!596403 minValue!1245)) lt!596396) (apply!1033 lt!596413 lt!596396))))

(declare-fun b!1349464 () Bool)

(assert (=> b!1349464 (= e!767651 call!65176)))

(declare-fun b!1349465 () Bool)

(assert (=> b!1349465 (= e!767649 (= (apply!1033 lt!596409 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun bm!65178 () Bool)

(assert (=> bm!65178 (= call!65176 call!65178)))

(declare-fun b!1349466 () Bool)

(assert (=> b!1349466 (= e!767653 (= (apply!1033 lt!596409 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22463 (select (arr!44428 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349466 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44980 _values!1303)))))

(assert (=> b!1349466 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44981 _keys!1571)))))

(declare-fun b!1349467 () Bool)

(assert (=> b!1349467 (= e!767646 e!767655)))

(declare-fun res!895267 () Bool)

(assert (=> b!1349467 (= res!895267 call!65177)))

(assert (=> b!1349467 (=> (not res!895267) (not e!767655))))

(declare-fun b!1349468 () Bool)

(assert (=> b!1349468 (= e!767645 (validKeyInArray!0 (select (arr!44429 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (= (and d!144567 c!126580) b!1349461))

(assert (= (and d!144567 (not c!126580)) b!1349449))

(assert (= (and b!1349449 c!126581) b!1349464))

(assert (= (and b!1349449 (not c!126581)) b!1349451))

(assert (= (and b!1349451 c!126583) b!1349455))

(assert (= (and b!1349451 (not c!126583)) b!1349458))

(assert (= (or b!1349455 b!1349458) bm!65172))

(assert (= (or b!1349464 bm!65172) bm!65176))

(assert (= (or b!1349464 b!1349455) bm!65178))

(assert (= (or b!1349461 bm!65176) bm!65174))

(assert (= (or b!1349461 bm!65178) bm!65173))

(assert (= (and d!144567 res!895265) b!1349468))

(assert (= (and d!144567 c!126582) b!1349463))

(assert (= (and d!144567 (not c!126582)) b!1349460))

(assert (= (and d!144567 res!895263) b!1349452))

(assert (= (and b!1349452 res!895266) b!1349454))

(assert (= (and b!1349452 (not res!895268)) b!1349459))

(assert (= (and b!1349459 res!895269) b!1349466))

(assert (= (and b!1349452 res!895264) b!1349453))

(assert (= (and b!1349453 c!126578) b!1349448))

(assert (= (and b!1349453 (not c!126578)) b!1349457))

(assert (= (and b!1349448 res!895262) b!1349465))

(assert (= (or b!1349448 b!1349457) bm!65175))

(assert (= (and b!1349453 res!895270) b!1349456))

(assert (= (and b!1349456 c!126579) b!1349467))

(assert (= (and b!1349456 (not c!126579)) b!1349462))

(assert (= (and b!1349467 res!895267) b!1349450))

(assert (= (or b!1349467 b!1349462) bm!65177))

(declare-fun b_lambda!24699 () Bool)

(assert (=> (not b_lambda!24699) (not b!1349466)))

(assert (=> b!1349466 t!46179))

(declare-fun b_and!50969 () Bool)

(assert (= b_and!50967 (and (=> t!46179 result!25999) b_and!50969)))

(declare-fun m!1236097 () Bool)

(assert (=> bm!65175 m!1236097))

(assert (=> bm!65174 m!1235865))

(declare-fun m!1236099 () Bool)

(assert (=> b!1349463 m!1236099))

(declare-fun m!1236101 () Bool)

(assert (=> b!1349463 m!1236101))

(declare-fun m!1236103 () Bool)

(assert (=> b!1349463 m!1236103))

(declare-fun m!1236105 () Bool)

(assert (=> b!1349463 m!1236105))

(declare-fun m!1236107 () Bool)

(assert (=> b!1349463 m!1236107))

(declare-fun m!1236109 () Bool)

(assert (=> b!1349463 m!1236109))

(assert (=> b!1349463 m!1236101))

(assert (=> b!1349463 m!1235985))

(assert (=> b!1349463 m!1236099))

(declare-fun m!1236111 () Bool)

(assert (=> b!1349463 m!1236111))

(declare-fun m!1236113 () Bool)

(assert (=> b!1349463 m!1236113))

(declare-fun m!1236115 () Bool)

(assert (=> b!1349463 m!1236115))

(declare-fun m!1236117 () Bool)

(assert (=> b!1349463 m!1236117))

(assert (=> b!1349463 m!1236105))

(declare-fun m!1236119 () Bool)

(assert (=> b!1349463 m!1236119))

(assert (=> b!1349463 m!1236115))

(declare-fun m!1236121 () Bool)

(assert (=> b!1349463 m!1236121))

(declare-fun m!1236123 () Bool)

(assert (=> b!1349463 m!1236123))

(declare-fun m!1236125 () Bool)

(assert (=> b!1349463 m!1236125))

(declare-fun m!1236127 () Bool)

(assert (=> b!1349463 m!1236127))

(assert (=> b!1349463 m!1235865))

(declare-fun m!1236129 () Bool)

(assert (=> b!1349465 m!1236129))

(assert (=> b!1349466 m!1235989))

(assert (=> b!1349466 m!1235869))

(assert (=> b!1349466 m!1235991))

(assert (=> b!1349466 m!1235989))

(assert (=> b!1349466 m!1235869))

(assert (=> b!1349466 m!1235985))

(assert (=> b!1349466 m!1235985))

(declare-fun m!1236131 () Bool)

(assert (=> b!1349466 m!1236131))

(declare-fun m!1236133 () Bool)

(assert (=> b!1349450 m!1236133))

(assert (=> b!1349468 m!1235985))

(assert (=> b!1349468 m!1235985))

(assert (=> b!1349468 m!1236007))

(assert (=> b!1349459 m!1235985))

(assert (=> b!1349459 m!1235985))

(declare-fun m!1236135 () Bool)

(assert (=> b!1349459 m!1236135))

(declare-fun m!1236137 () Bool)

(assert (=> b!1349461 m!1236137))

(assert (=> d!144567 m!1235877))

(assert (=> b!1349454 m!1235985))

(assert (=> b!1349454 m!1235985))

(assert (=> b!1349454 m!1236007))

(declare-fun m!1236139 () Bool)

(assert (=> bm!65177 m!1236139))

(declare-fun m!1236141 () Bool)

(assert (=> bm!65173 m!1236141))

(assert (=> b!1349200 d!144567))

(declare-fun d!144569 () Bool)

(declare-fun e!767659 () Bool)

(assert (=> d!144569 e!767659))

(declare-fun res!895271 () Bool)

(assert (=> d!144569 (=> res!895271 e!767659)))

(declare-fun lt!596419 () Bool)

(assert (=> d!144569 (= res!895271 (not lt!596419))))

(declare-fun lt!596420 () Bool)

(assert (=> d!144569 (= lt!596419 lt!596420)))

(declare-fun lt!596417 () Unit!44034)

(declare-fun e!767658 () Unit!44034)

(assert (=> d!144569 (= lt!596417 e!767658)))

(declare-fun c!126584 () Bool)

(assert (=> d!144569 (= c!126584 lt!596420)))

(assert (=> d!144569 (= lt!596420 (containsKey!743 (toList!11046 lt!596246) k0!1142))))

(assert (=> d!144569 (= (contains!9155 lt!596246 k0!1142) lt!596419)))

(declare-fun b!1349469 () Bool)

(declare-fun lt!596418 () Unit!44034)

(assert (=> b!1349469 (= e!767658 lt!596418)))

(assert (=> b!1349469 (= lt!596418 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11046 lt!596246) k0!1142))))

(assert (=> b!1349469 (isDefined!533 (getValueByKey!726 (toList!11046 lt!596246) k0!1142))))

(declare-fun b!1349470 () Bool)

(declare-fun Unit!44043 () Unit!44034)

(assert (=> b!1349470 (= e!767658 Unit!44043)))

(declare-fun b!1349471 () Bool)

(assert (=> b!1349471 (= e!767659 (isDefined!533 (getValueByKey!726 (toList!11046 lt!596246) k0!1142)))))

(assert (= (and d!144569 c!126584) b!1349469))

(assert (= (and d!144569 (not c!126584)) b!1349470))

(assert (= (and d!144569 (not res!895271)) b!1349471))

(declare-fun m!1236143 () Bool)

(assert (=> d!144569 m!1236143))

(declare-fun m!1236145 () Bool)

(assert (=> b!1349469 m!1236145))

(declare-fun m!1236147 () Bool)

(assert (=> b!1349469 m!1236147))

(assert (=> b!1349469 m!1236147))

(declare-fun m!1236149 () Bool)

(assert (=> b!1349469 m!1236149))

(assert (=> b!1349471 m!1236147))

(assert (=> b!1349471 m!1236147))

(assert (=> b!1349471 m!1236149))

(assert (=> b!1349200 d!144569))

(declare-fun d!144571 () Bool)

(assert (=> d!144571 (contains!9155 lt!596246 k0!1142)))

(declare-fun lt!596423 () Unit!44034)

(declare-fun choose!1992 ((_ BitVec 64) (_ BitVec 64) V!55217 ListLongMap!22061) Unit!44034)

(assert (=> d!144571 (= lt!596423 (choose!1992 k0!1142 (select (arr!44429 _keys!1571) from!1960) lt!596247 lt!596246))))

(assert (=> d!144571 (contains!9155 (+!4887 lt!596246 (tuple2!24405 (select (arr!44429 _keys!1571) from!1960) lt!596247)) k0!1142)))

(assert (=> d!144571 (= (lemmaInListMapAfterAddingDiffThenInBefore!417 k0!1142 (select (arr!44429 _keys!1571) from!1960) lt!596247 lt!596246) lt!596423)))

(declare-fun bs!38655 () Bool)

(assert (= bs!38655 d!144571))

(assert (=> bs!38655 m!1235857))

(assert (=> bs!38655 m!1235845))

(declare-fun m!1236151 () Bool)

(assert (=> bs!38655 m!1236151))

(assert (=> bs!38655 m!1235873))

(assert (=> bs!38655 m!1235873))

(assert (=> bs!38655 m!1235875))

(assert (=> b!1349200 d!144571))

(declare-fun condMapEmpty!58104 () Bool)

(declare-fun mapDefault!58104 () ValueCell!17894)

(assert (=> mapNonEmpty!58095 (= condMapEmpty!58104 (= mapRest!58095 ((as const (Array (_ BitVec 32) ValueCell!17894)) mapDefault!58104)))))

(declare-fun e!767664 () Bool)

(declare-fun mapRes!58104 () Bool)

(assert (=> mapNonEmpty!58095 (= tp!110572 (and e!767664 mapRes!58104))))

(declare-fun mapNonEmpty!58104 () Bool)

(declare-fun tp!110587 () Bool)

(declare-fun e!767665 () Bool)

(assert (=> mapNonEmpty!58104 (= mapRes!58104 (and tp!110587 e!767665))))

(declare-fun mapValue!58104 () ValueCell!17894)

(declare-fun mapKey!58104 () (_ BitVec 32))

(declare-fun mapRest!58104 () (Array (_ BitVec 32) ValueCell!17894))

(assert (=> mapNonEmpty!58104 (= mapRest!58095 (store mapRest!58104 mapKey!58104 mapValue!58104))))

(declare-fun mapIsEmpty!58104 () Bool)

(assert (=> mapIsEmpty!58104 mapRes!58104))

(declare-fun b!1349479 () Bool)

(assert (=> b!1349479 (= e!767664 tp_is_empty!37585)))

(declare-fun b!1349478 () Bool)

(assert (=> b!1349478 (= e!767665 tp_is_empty!37585)))

(assert (= (and mapNonEmpty!58095 condMapEmpty!58104) mapIsEmpty!58104))

(assert (= (and mapNonEmpty!58095 (not condMapEmpty!58104)) mapNonEmpty!58104))

(assert (= (and mapNonEmpty!58104 ((_ is ValueCellFull!17894) mapValue!58104)) b!1349478))

(assert (= (and mapNonEmpty!58095 ((_ is ValueCellFull!17894) mapDefault!58104)) b!1349479))

(declare-fun m!1236153 () Bool)

(assert (=> mapNonEmpty!58104 m!1236153))

(declare-fun b_lambda!24701 () Bool)

(assert (= b_lambda!24695 (or (and start!113676 b_free!31585) b_lambda!24701)))

(declare-fun b_lambda!24703 () Bool)

(assert (= b_lambda!24697 (or (and start!113676 b_free!31585) b_lambda!24703)))

(declare-fun b_lambda!24705 () Bool)

(assert (= b_lambda!24693 (or (and start!113676 b_free!31585) b_lambda!24705)))

(declare-fun b_lambda!24707 () Bool)

(assert (= b_lambda!24699 (or (and start!113676 b_free!31585) b_lambda!24707)))

(check-sat (not b!1349354) (not b_next!31585) (not b_lambda!24707) (not b!1349461) (not b!1349426) (not b!1349450) (not b!1349309) (not b!1349339) (not b!1349308) (not b!1349412) (not b!1349447) (not b!1349410) (not b!1349454) (not b!1349399) (not b!1349337) (not bm!65164) (not d!144541) (not d!144557) (not b!1349335) (not b!1349352) (not b!1349408) (not d!144545) tp_is_empty!37585 (not bm!65161) (not bm!65144) (not b!1349429) (not b!1349351) (not b!1349471) (not b!1349440) (not mapNonEmpty!58104) (not b!1349468) (not b_lambda!24705) (not d!144555) (not b_lambda!24691) (not bm!65175) (not b!1349465) (not b!1349444) (not b!1349334) (not bm!65168) (not b!1349303) (not b!1349469) (not d!144565) (not b!1349442) (not b!1349344) (not bm!65173) (not b!1349415) (not b!1349445) (not b!1349301) (not bm!65177) (not d!144543) (not d!144567) (not b_lambda!24703) (not d!144569) (not bm!65162) (not b!1349345) (not b!1349414) (not b!1349459) (not b!1349341) (not b!1349463) (not b!1349342) (not b!1349417) (not b!1349403) (not b!1349466) b_and!50969 (not b_lambda!24701) (not bm!65160) (not b!1349350) (not bm!65174) (not d!144571) (not bm!65171))
(check-sat b_and!50969 (not b_next!31585))
