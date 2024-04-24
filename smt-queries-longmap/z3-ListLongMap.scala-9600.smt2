; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113686 () Bool)

(assert start!113686)

(declare-fun b_free!31513 () Bool)

(declare-fun b_next!31513 () Bool)

(assert (=> start!113686 (= b_free!31513 (not b_next!31513))))

(declare-fun tp!110343 () Bool)

(declare-fun b_and!50803 () Bool)

(assert (=> start!113686 (= tp!110343 b_and!50803)))

(declare-fun b!1348304 () Bool)

(declare-fun res!894344 () Bool)

(declare-fun e!767252 () Bool)

(assert (=> b!1348304 (=> (not res!894344) (not e!767252))))

(declare-datatypes ((array!91967 0))(
  ( (array!91968 (arr!44435 (Array (_ BitVec 32) (_ BitVec 64))) (size!44986 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91967)

(declare-datatypes ((List!31463 0))(
  ( (Nil!31460) (Cons!31459 (h!32677 (_ BitVec 64)) (t!46047 List!31463)) )
))
(declare-fun arrayNoDuplicates!0 (array!91967 (_ BitVec 32) List!31463) Bool)

(assert (=> b!1348304 (= res!894344 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31460))))

(declare-fun b!1348305 () Bool)

(declare-fun res!894337 () Bool)

(assert (=> b!1348305 (=> (not res!894337) (not e!767252))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91967 (_ BitVec 32)) Bool)

(assert (=> b!1348305 (= res!894337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348306 () Bool)

(declare-fun res!894343 () Bool)

(assert (=> b!1348306 (=> (not res!894343) (not e!767252))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1348306 (= res!894343 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348307 () Bool)

(declare-fun res!894341 () Bool)

(assert (=> b!1348307 (=> (not res!894341) (not e!767252))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348307 (= res!894341 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348308 () Bool)

(declare-fun e!767249 () Bool)

(declare-fun e!767250 () Bool)

(declare-fun mapRes!57976 () Bool)

(assert (=> b!1348308 (= e!767249 (and e!767250 mapRes!57976))))

(declare-fun condMapEmpty!57976 () Bool)

(declare-datatypes ((V!55121 0))(
  ( (V!55122 (val!18831 Int)) )
))
(declare-datatypes ((ValueCell!17858 0))(
  ( (ValueCellFull!17858 (v!21474 V!55121)) (EmptyCell!17858) )
))
(declare-datatypes ((array!91969 0))(
  ( (array!91970 (arr!44436 (Array (_ BitVec 32) ValueCell!17858)) (size!44987 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91969)

(declare-fun mapDefault!57976 () ValueCell!17858)

(assert (=> b!1348308 (= condMapEmpty!57976 (= (arr!44436 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57976)))))

(declare-fun res!894338 () Bool)

(assert (=> start!113686 (=> (not res!894338) (not e!767252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113686 (= res!894338 (validMask!0 mask!1977))))

(assert (=> start!113686 e!767252))

(declare-fun tp_is_empty!37513 () Bool)

(assert (=> start!113686 tp_is_empty!37513))

(assert (=> start!113686 true))

(declare-fun array_inv!33737 (array!91967) Bool)

(assert (=> start!113686 (array_inv!33737 _keys!1571)))

(declare-fun array_inv!33738 (array!91969) Bool)

(assert (=> start!113686 (and (array_inv!33738 _values!1303) e!767249)))

(assert (=> start!113686 tp!110343))

(declare-fun b!1348309 () Bool)

(declare-fun e!767251 () Bool)

(assert (=> b!1348309 (= e!767251 tp_is_empty!37513)))

(declare-fun b!1348310 () Bool)

(declare-fun res!894342 () Bool)

(assert (=> b!1348310 (=> (not res!894342) (not e!767252))))

(assert (=> b!1348310 (= res!894342 (not (= (select (arr!44435 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57976 () Bool)

(assert (=> mapIsEmpty!57976 mapRes!57976))

(declare-fun b!1348311 () Bool)

(declare-fun minValue!1245 () V!55121)

(declare-fun zeroValue!1245 () V!55121)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24322 0))(
  ( (tuple2!24323 (_1!12172 (_ BitVec 64)) (_2!12172 V!55121)) )
))
(declare-datatypes ((List!31464 0))(
  ( (Nil!31461) (Cons!31460 (h!32678 tuple2!24322) (t!46048 List!31464)) )
))
(declare-datatypes ((ListLongMap!21987 0))(
  ( (ListLongMap!21988 (toList!11009 List!31464)) )
))
(declare-fun contains!9196 (ListLongMap!21987 (_ BitVec 64)) Bool)

(declare-fun +!4872 (ListLongMap!21987 tuple2!24322) ListLongMap!21987)

(declare-fun getCurrentListMapNoExtraKeys!6525 (array!91967 array!91969 (_ BitVec 32) (_ BitVec 32) V!55121 V!55121 (_ BitVec 32) Int) ListLongMap!21987)

(declare-fun get!22452 (ValueCell!17858 V!55121) V!55121)

(declare-fun dynLambda!3826 (Int (_ BitVec 64)) V!55121)

(assert (=> b!1348311 (= e!767252 (not (contains!9196 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))))

(declare-fun b!1348312 () Bool)

(declare-fun res!894336 () Bool)

(assert (=> b!1348312 (=> (not res!894336) (not e!767252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348312 (= res!894336 (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)))))

(declare-fun b!1348313 () Bool)

(assert (=> b!1348313 (= e!767250 tp_is_empty!37513)))

(declare-fun b!1348314 () Bool)

(declare-fun res!894339 () Bool)

(assert (=> b!1348314 (=> (not res!894339) (not e!767252))))

(declare-fun getCurrentListMap!5948 (array!91967 array!91969 (_ BitVec 32) (_ BitVec 32) V!55121 V!55121 (_ BitVec 32) Int) ListLongMap!21987)

(assert (=> b!1348314 (= res!894339 (contains!9196 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348315 () Bool)

(declare-fun res!894340 () Bool)

(assert (=> b!1348315 (=> (not res!894340) (not e!767252))))

(assert (=> b!1348315 (= res!894340 (and (= (size!44987 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44986 _keys!1571) (size!44987 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57976 () Bool)

(declare-fun tp!110344 () Bool)

(assert (=> mapNonEmpty!57976 (= mapRes!57976 (and tp!110344 e!767251))))

(declare-fun mapRest!57976 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapValue!57976 () ValueCell!17858)

(declare-fun mapKey!57976 () (_ BitVec 32))

(assert (=> mapNonEmpty!57976 (= (arr!44436 _values!1303) (store mapRest!57976 mapKey!57976 mapValue!57976))))

(assert (= (and start!113686 res!894338) b!1348315))

(assert (= (and b!1348315 res!894340) b!1348305))

(assert (= (and b!1348305 res!894337) b!1348304))

(assert (= (and b!1348304 res!894344) b!1348307))

(assert (= (and b!1348307 res!894341) b!1348314))

(assert (= (and b!1348314 res!894339) b!1348310))

(assert (= (and b!1348310 res!894342) b!1348312))

(assert (= (and b!1348312 res!894336) b!1348306))

(assert (= (and b!1348306 res!894343) b!1348311))

(assert (= (and b!1348308 condMapEmpty!57976) mapIsEmpty!57976))

(assert (= (and b!1348308 (not condMapEmpty!57976)) mapNonEmpty!57976))

(get-info :version)

(assert (= (and mapNonEmpty!57976 ((_ is ValueCellFull!17858) mapValue!57976)) b!1348309))

(assert (= (and b!1348308 ((_ is ValueCellFull!17858) mapDefault!57976)) b!1348313))

(assert (= start!113686 b!1348308))

(declare-fun b_lambda!24551 () Bool)

(assert (=> (not b_lambda!24551) (not b!1348311)))

(declare-fun t!46046 () Bool)

(declare-fun tb!12387 () Bool)

(assert (=> (and start!113686 (= defaultEntry!1306 defaultEntry!1306) t!46046) tb!12387))

(declare-fun result!25873 () Bool)

(assert (=> tb!12387 (= result!25873 tp_is_empty!37513)))

(assert (=> b!1348311 t!46046))

(declare-fun b_and!50805 () Bool)

(assert (= b_and!50803 (and (=> t!46046 result!25873) b_and!50805)))

(declare-fun m!1235541 () Bool)

(assert (=> b!1348311 m!1235541))

(declare-fun m!1235543 () Bool)

(assert (=> b!1348311 m!1235543))

(declare-fun m!1235545 () Bool)

(assert (=> b!1348311 m!1235545))

(declare-fun m!1235547 () Bool)

(assert (=> b!1348311 m!1235547))

(declare-fun m!1235549 () Bool)

(assert (=> b!1348311 m!1235549))

(declare-fun m!1235551 () Bool)

(assert (=> b!1348311 m!1235551))

(assert (=> b!1348311 m!1235545))

(declare-fun m!1235553 () Bool)

(assert (=> b!1348311 m!1235553))

(assert (=> b!1348311 m!1235547))

(assert (=> b!1348311 m!1235549))

(declare-fun m!1235555 () Bool)

(assert (=> b!1348311 m!1235555))

(assert (=> b!1348311 m!1235553))

(assert (=> b!1348311 m!1235541))

(declare-fun m!1235557 () Bool)

(assert (=> b!1348314 m!1235557))

(assert (=> b!1348314 m!1235557))

(declare-fun m!1235559 () Bool)

(assert (=> b!1348314 m!1235559))

(assert (=> b!1348312 m!1235555))

(assert (=> b!1348312 m!1235555))

(declare-fun m!1235561 () Bool)

(assert (=> b!1348312 m!1235561))

(declare-fun m!1235563 () Bool)

(assert (=> b!1348305 m!1235563))

(declare-fun m!1235565 () Bool)

(assert (=> b!1348304 m!1235565))

(declare-fun m!1235567 () Bool)

(assert (=> start!113686 m!1235567))

(declare-fun m!1235569 () Bool)

(assert (=> start!113686 m!1235569))

(declare-fun m!1235571 () Bool)

(assert (=> start!113686 m!1235571))

(assert (=> b!1348310 m!1235555))

(declare-fun m!1235573 () Bool)

(assert (=> mapNonEmpty!57976 m!1235573))

(check-sat tp_is_empty!37513 (not b!1348314) (not b!1348304) b_and!50805 (not b_next!31513) (not b!1348312) (not mapNonEmpty!57976) (not b_lambda!24551) (not start!113686) (not b!1348305) (not b!1348311))
(check-sat b_and!50805 (not b_next!31513))
(get-model)

(declare-fun b_lambda!24557 () Bool)

(assert (= b_lambda!24551 (or (and start!113686 b_free!31513) b_lambda!24557)))

(check-sat (not start!113686) tp_is_empty!37513 (not b!1348314) (not b!1348304) b_and!50805 (not b_next!31513) (not b!1348312) (not mapNonEmpty!57976) (not b!1348305) (not b_lambda!24557) (not b!1348311))
(check-sat b_and!50805 (not b_next!31513))
(get-model)

(declare-fun d!144739 () Bool)

(declare-fun e!767285 () Bool)

(assert (=> d!144739 e!767285))

(declare-fun res!894403 () Bool)

(assert (=> d!144739 (=> (not res!894403) (not e!767285))))

(declare-fun lt!596048 () ListLongMap!21987)

(assert (=> d!144739 (= res!894403 (contains!9196 lt!596048 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596045 () List!31464)

(assert (=> d!144739 (= lt!596048 (ListLongMap!21988 lt!596045))))

(declare-datatypes ((Unit!44074 0))(
  ( (Unit!44075) )
))
(declare-fun lt!596047 () Unit!44074)

(declare-fun lt!596046 () Unit!44074)

(assert (=> d!144739 (= lt!596047 lt!596046)))

(declare-datatypes ((Option!767 0))(
  ( (Some!766 (v!21477 V!55121)) (None!765) )
))
(declare-fun getValueByKey!716 (List!31464 (_ BitVec 64)) Option!767)

(assert (=> d!144739 (= (getValueByKey!716 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!366 (List!31464 (_ BitVec 64) V!55121) Unit!44074)

(assert (=> d!144739 (= lt!596046 (lemmaContainsTupThenGetReturnValue!366 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!495 (List!31464 (_ BitVec 64) V!55121) List!31464)

(assert (=> d!144739 (= lt!596045 (insertStrictlySorted!495 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144739 (= (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596048)))

(declare-fun b!1348398 () Bool)

(declare-fun res!894404 () Bool)

(assert (=> b!1348398 (=> (not res!894404) (not e!767285))))

(assert (=> b!1348398 (= res!894404 (= (getValueByKey!716 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348399 () Bool)

(declare-fun contains!9199 (List!31464 tuple2!24322) Bool)

(assert (=> b!1348399 (= e!767285 (contains!9199 (toList!11009 lt!596048) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144739 res!894403) b!1348398))

(assert (= (and b!1348398 res!894404) b!1348399))

(declare-fun m!1235643 () Bool)

(assert (=> d!144739 m!1235643))

(declare-fun m!1235645 () Bool)

(assert (=> d!144739 m!1235645))

(declare-fun m!1235647 () Bool)

(assert (=> d!144739 m!1235647))

(declare-fun m!1235649 () Bool)

(assert (=> d!144739 m!1235649))

(declare-fun m!1235651 () Bool)

(assert (=> b!1348398 m!1235651))

(declare-fun m!1235653 () Bool)

(assert (=> b!1348399 m!1235653))

(assert (=> b!1348311 d!144739))

(declare-fun d!144741 () Bool)

(declare-fun c!126699 () Bool)

(assert (=> d!144741 (= c!126699 ((_ is ValueCellFull!17858) (select (arr!44436 _values!1303) from!1960)))))

(declare-fun e!767288 () V!55121)

(assert (=> d!144741 (= (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767288)))

(declare-fun b!1348404 () Bool)

(declare-fun get!22454 (ValueCell!17858 V!55121) V!55121)

(assert (=> b!1348404 (= e!767288 (get!22454 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348405 () Bool)

(declare-fun get!22455 (ValueCell!17858 V!55121) V!55121)

(assert (=> b!1348405 (= e!767288 (get!22455 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144741 c!126699) b!1348404))

(assert (= (and d!144741 (not c!126699)) b!1348405))

(assert (=> b!1348404 m!1235547))

(assert (=> b!1348404 m!1235549))

(declare-fun m!1235655 () Bool)

(assert (=> b!1348404 m!1235655))

(assert (=> b!1348405 m!1235547))

(assert (=> b!1348405 m!1235549))

(declare-fun m!1235657 () Bool)

(assert (=> b!1348405 m!1235657))

(assert (=> b!1348311 d!144741))

(declare-fun d!144743 () Bool)

(declare-fun e!767289 () Bool)

(assert (=> d!144743 e!767289))

(declare-fun res!894405 () Bool)

(assert (=> d!144743 (=> (not res!894405) (not e!767289))))

(declare-fun lt!596052 () ListLongMap!21987)

(assert (=> d!144743 (= res!894405 (contains!9196 lt!596052 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!596049 () List!31464)

(assert (=> d!144743 (= lt!596052 (ListLongMap!21988 lt!596049))))

(declare-fun lt!596051 () Unit!44074)

(declare-fun lt!596050 () Unit!44074)

(assert (=> d!144743 (= lt!596051 lt!596050)))

(assert (=> d!144743 (= (getValueByKey!716 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144743 (= lt!596050 (lemmaContainsTupThenGetReturnValue!366 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144743 (= lt!596049 (insertStrictlySorted!495 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144743 (= (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!596052)))

(declare-fun b!1348406 () Bool)

(declare-fun res!894406 () Bool)

(assert (=> b!1348406 (=> (not res!894406) (not e!767289))))

(assert (=> b!1348406 (= res!894406 (= (getValueByKey!716 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1348407 () Bool)

(assert (=> b!1348407 (= e!767289 (contains!9199 (toList!11009 lt!596052) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144743 res!894405) b!1348406))

(assert (= (and b!1348406 res!894406) b!1348407))

(declare-fun m!1235659 () Bool)

(assert (=> d!144743 m!1235659))

(declare-fun m!1235661 () Bool)

(assert (=> d!144743 m!1235661))

(declare-fun m!1235663 () Bool)

(assert (=> d!144743 m!1235663))

(declare-fun m!1235665 () Bool)

(assert (=> d!144743 m!1235665))

(declare-fun m!1235667 () Bool)

(assert (=> b!1348406 m!1235667))

(declare-fun m!1235669 () Bool)

(assert (=> b!1348407 m!1235669))

(assert (=> b!1348311 d!144743))

(declare-fun d!144745 () Bool)

(declare-fun e!767294 () Bool)

(assert (=> d!144745 e!767294))

(declare-fun res!894409 () Bool)

(assert (=> d!144745 (=> res!894409 e!767294)))

(declare-fun lt!596063 () Bool)

(assert (=> d!144745 (= res!894409 (not lt!596063))))

(declare-fun lt!596062 () Bool)

(assert (=> d!144745 (= lt!596063 lt!596062)))

(declare-fun lt!596061 () Unit!44074)

(declare-fun e!767295 () Unit!44074)

(assert (=> d!144745 (= lt!596061 e!767295)))

(declare-fun c!126702 () Bool)

(assert (=> d!144745 (= c!126702 lt!596062)))

(declare-fun containsKey!742 (List!31464 (_ BitVec 64)) Bool)

(assert (=> d!144745 (= lt!596062 (containsKey!742 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144745 (= (contains!9196 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!596063)))

(declare-fun b!1348414 () Bool)

(declare-fun lt!596064 () Unit!44074)

(assert (=> b!1348414 (= e!767295 lt!596064)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!488 (List!31464 (_ BitVec 64)) Unit!44074)

(assert (=> b!1348414 (= lt!596064 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun isDefined!525 (Option!767) Bool)

(assert (=> b!1348414 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1348415 () Bool)

(declare-fun Unit!44076 () Unit!44074)

(assert (=> b!1348415 (= e!767295 Unit!44076)))

(declare-fun b!1348416 () Bool)

(assert (=> b!1348416 (= e!767294 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144745 c!126702) b!1348414))

(assert (= (and d!144745 (not c!126702)) b!1348415))

(assert (= (and d!144745 (not res!894409)) b!1348416))

(declare-fun m!1235671 () Bool)

(assert (=> d!144745 m!1235671))

(declare-fun m!1235673 () Bool)

(assert (=> b!1348414 m!1235673))

(declare-fun m!1235675 () Bool)

(assert (=> b!1348414 m!1235675))

(assert (=> b!1348414 m!1235675))

(declare-fun m!1235677 () Bool)

(assert (=> b!1348414 m!1235677))

(assert (=> b!1348416 m!1235675))

(assert (=> b!1348416 m!1235675))

(assert (=> b!1348416 m!1235677))

(assert (=> b!1348311 d!144745))

(declare-fun b!1348441 () Bool)

(declare-fun lt!596082 () Unit!44074)

(declare-fun lt!596084 () Unit!44074)

(assert (=> b!1348441 (= lt!596082 lt!596084)))

(declare-fun lt!596080 () V!55121)

(declare-fun lt!596081 () (_ BitVec 64))

(declare-fun lt!596085 () ListLongMap!21987)

(declare-fun lt!596083 () (_ BitVec 64))

(assert (=> b!1348441 (not (contains!9196 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080)) lt!596083))))

(declare-fun addStillNotContains!502 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> b!1348441 (= lt!596084 (addStillNotContains!502 lt!596085 lt!596081 lt!596080 lt!596083))))

(assert (=> b!1348441 (= lt!596083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348441 (= lt!596080 (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348441 (= lt!596081 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65105 () ListLongMap!21987)

(assert (=> b!1348441 (= lt!596085 call!65105)))

(declare-fun e!767313 () ListLongMap!21987)

(assert (=> b!1348441 (= e!767313 (+!4872 call!65105 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348442 () Bool)

(declare-fun e!767316 () Bool)

(declare-fun lt!596079 () ListLongMap!21987)

(assert (=> b!1348442 (= e!767316 (= lt!596079 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65102 () Bool)

(assert (=> bm!65102 (= call!65105 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348443 () Bool)

(declare-fun res!894419 () Bool)

(declare-fun e!767311 () Bool)

(assert (=> b!1348443 (=> (not res!894419) (not e!767311))))

(assert (=> b!1348443 (= res!894419 (not (contains!9196 lt!596079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348444 () Bool)

(declare-fun e!767314 () Bool)

(assert (=> b!1348444 (= e!767314 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348444 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1348445 () Bool)

(declare-fun isEmpty!1095 (ListLongMap!21987) Bool)

(assert (=> b!1348445 (= e!767316 (isEmpty!1095 lt!596079))))

(declare-fun b!1348446 () Bool)

(declare-fun e!767312 () ListLongMap!21987)

(assert (=> b!1348446 (= e!767312 e!767313)))

(declare-fun c!126714 () Bool)

(assert (=> b!1348446 (= c!126714 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348447 () Bool)

(declare-fun e!767310 () Bool)

(assert (=> b!1348447 (= e!767311 e!767310)))

(declare-fun c!126711 () Bool)

(assert (=> b!1348447 (= c!126711 e!767314)))

(declare-fun res!894418 () Bool)

(assert (=> b!1348447 (=> (not res!894418) (not e!767314))))

(assert (=> b!1348447 (= res!894418 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun b!1348448 () Bool)

(assert (=> b!1348448 (= e!767312 (ListLongMap!21988 Nil!31461))))

(declare-fun d!144747 () Bool)

(assert (=> d!144747 e!767311))

(declare-fun res!894421 () Bool)

(assert (=> d!144747 (=> (not res!894421) (not e!767311))))

(assert (=> d!144747 (= res!894421 (not (contains!9196 lt!596079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144747 (= lt!596079 e!767312)))

(declare-fun c!126712 () Bool)

(assert (=> d!144747 (= c!126712 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(assert (=> d!144747 (validMask!0 mask!1977)))

(assert (=> d!144747 (= (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596079)))

(declare-fun b!1348449 () Bool)

(assert (=> b!1348449 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(assert (=> b!1348449 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44987 _values!1303)))))

(declare-fun e!767315 () Bool)

(declare-fun apply!1046 (ListLongMap!21987 (_ BitVec 64)) V!55121)

(assert (=> b!1348449 (= e!767315 (= (apply!1046 lt!596079 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348450 () Bool)

(assert (=> b!1348450 (= e!767310 e!767316)))

(declare-fun c!126713 () Bool)

(assert (=> b!1348450 (= c!126713 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun b!1348451 () Bool)

(assert (=> b!1348451 (= e!767310 e!767315)))

(assert (=> b!1348451 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun res!894420 () Bool)

(assert (=> b!1348451 (= res!894420 (contains!9196 lt!596079 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348451 (=> (not res!894420) (not e!767315))))

(declare-fun b!1348452 () Bool)

(assert (=> b!1348452 (= e!767313 call!65105)))

(assert (= (and d!144747 c!126712) b!1348448))

(assert (= (and d!144747 (not c!126712)) b!1348446))

(assert (= (and b!1348446 c!126714) b!1348441))

(assert (= (and b!1348446 (not c!126714)) b!1348452))

(assert (= (or b!1348441 b!1348452) bm!65102))

(assert (= (and d!144747 res!894421) b!1348443))

(assert (= (and b!1348443 res!894419) b!1348447))

(assert (= (and b!1348447 res!894418) b!1348444))

(assert (= (and b!1348447 c!126711) b!1348451))

(assert (= (and b!1348447 (not c!126711)) b!1348450))

(assert (= (and b!1348451 res!894420) b!1348449))

(assert (= (and b!1348450 c!126713) b!1348442))

(assert (= (and b!1348450 (not c!126713)) b!1348445))

(declare-fun b_lambda!24559 () Bool)

(assert (=> (not b_lambda!24559) (not b!1348441)))

(assert (=> b!1348441 t!46046))

(declare-fun b_and!50815 () Bool)

(assert (= b_and!50805 (and (=> t!46046 result!25873) b_and!50815)))

(declare-fun b_lambda!24561 () Bool)

(assert (=> (not b_lambda!24561) (not b!1348449)))

(assert (=> b!1348449 t!46046))

(declare-fun b_and!50817 () Bool)

(assert (= b_and!50815 (and (=> t!46046 result!25873) b_and!50817)))

(declare-fun m!1235679 () Bool)

(assert (=> b!1348443 m!1235679))

(declare-fun m!1235681 () Bool)

(assert (=> b!1348446 m!1235681))

(assert (=> b!1348446 m!1235681))

(declare-fun m!1235683 () Bool)

(assert (=> b!1348446 m!1235683))

(assert (=> b!1348441 m!1235681))

(assert (=> b!1348441 m!1235549))

(declare-fun m!1235685 () Bool)

(assert (=> b!1348441 m!1235685))

(declare-fun m!1235687 () Bool)

(assert (=> b!1348441 m!1235687))

(assert (=> b!1348441 m!1235549))

(declare-fun m!1235689 () Bool)

(assert (=> b!1348441 m!1235689))

(declare-fun m!1235691 () Bool)

(assert (=> b!1348441 m!1235691))

(declare-fun m!1235693 () Bool)

(assert (=> b!1348441 m!1235693))

(assert (=> b!1348441 m!1235691))

(declare-fun m!1235695 () Bool)

(assert (=> b!1348441 m!1235695))

(assert (=> b!1348441 m!1235687))

(assert (=> b!1348444 m!1235681))

(assert (=> b!1348444 m!1235681))

(assert (=> b!1348444 m!1235683))

(assert (=> b!1348451 m!1235681))

(assert (=> b!1348451 m!1235681))

(declare-fun m!1235697 () Bool)

(assert (=> b!1348451 m!1235697))

(declare-fun m!1235699 () Bool)

(assert (=> bm!65102 m!1235699))

(assert (=> b!1348442 m!1235699))

(declare-fun m!1235701 () Bool)

(assert (=> d!144747 m!1235701))

(assert (=> d!144747 m!1235567))

(assert (=> b!1348449 m!1235681))

(assert (=> b!1348449 m!1235549))

(assert (=> b!1348449 m!1235687))

(assert (=> b!1348449 m!1235549))

(assert (=> b!1348449 m!1235689))

(assert (=> b!1348449 m!1235681))

(declare-fun m!1235703 () Bool)

(assert (=> b!1348449 m!1235703))

(assert (=> b!1348449 m!1235687))

(declare-fun m!1235705 () Bool)

(assert (=> b!1348445 m!1235705))

(assert (=> b!1348311 d!144747))

(declare-fun b!1348461 () Bool)

(declare-fun e!767324 () Bool)

(declare-fun call!65108 () Bool)

(assert (=> b!1348461 (= e!767324 call!65108)))

(declare-fun b!1348462 () Bool)

(declare-fun e!767323 () Bool)

(assert (=> b!1348462 (= e!767323 e!767324)))

(declare-fun lt!596092 () (_ BitVec 64))

(assert (=> b!1348462 (= lt!596092 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596094 () Unit!44074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91967 (_ BitVec 64) (_ BitVec 32)) Unit!44074)

(assert (=> b!1348462 (= lt!596094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1348462 (arrayContainsKey!0 _keys!1571 lt!596092 #b00000000000000000000000000000000)))

(declare-fun lt!596093 () Unit!44074)

(assert (=> b!1348462 (= lt!596093 lt!596094)))

(declare-fun res!894426 () Bool)

(declare-datatypes ((SeekEntryResult!10012 0))(
  ( (MissingZero!10012 (index!42419 (_ BitVec 32))) (Found!10012 (index!42420 (_ BitVec 32))) (Intermediate!10012 (undefined!10824 Bool) (index!42421 (_ BitVec 32)) (x!120538 (_ BitVec 32))) (Undefined!10012) (MissingVacant!10012 (index!42422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91967 (_ BitVec 32)) SeekEntryResult!10012)

(assert (=> b!1348462 (= res!894426 (= (seekEntryOrOpen!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10012 #b00000000000000000000000000000000)))))

(assert (=> b!1348462 (=> (not res!894426) (not e!767324))))

(declare-fun bm!65105 () Bool)

(assert (=> bm!65105 (= call!65108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348463 () Bool)

(assert (=> b!1348463 (= e!767323 call!65108)))

(declare-fun d!144749 () Bool)

(declare-fun res!894427 () Bool)

(declare-fun e!767325 () Bool)

(assert (=> d!144749 (=> res!894427 e!767325)))

(assert (=> d!144749 (= res!894427 (bvsge #b00000000000000000000000000000000 (size!44986 _keys!1571)))))

(assert (=> d!144749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767325)))

(declare-fun b!1348464 () Bool)

(assert (=> b!1348464 (= e!767325 e!767323)))

(declare-fun c!126717 () Bool)

(assert (=> b!1348464 (= c!126717 (validKeyInArray!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144749 (not res!894427)) b!1348464))

(assert (= (and b!1348464 c!126717) b!1348462))

(assert (= (and b!1348464 (not c!126717)) b!1348463))

(assert (= (and b!1348462 res!894426) b!1348461))

(assert (= (or b!1348461 b!1348463) bm!65105))

(declare-fun m!1235707 () Bool)

(assert (=> b!1348462 m!1235707))

(declare-fun m!1235709 () Bool)

(assert (=> b!1348462 m!1235709))

(declare-fun m!1235711 () Bool)

(assert (=> b!1348462 m!1235711))

(assert (=> b!1348462 m!1235707))

(declare-fun m!1235713 () Bool)

(assert (=> b!1348462 m!1235713))

(declare-fun m!1235715 () Bool)

(assert (=> bm!65105 m!1235715))

(assert (=> b!1348464 m!1235707))

(assert (=> b!1348464 m!1235707))

(declare-fun m!1235717 () Bool)

(assert (=> b!1348464 m!1235717))

(assert (=> b!1348305 d!144749))

(declare-fun d!144751 () Bool)

(declare-fun e!767326 () Bool)

(assert (=> d!144751 e!767326))

(declare-fun res!894428 () Bool)

(assert (=> d!144751 (=> res!894428 e!767326)))

(declare-fun lt!596097 () Bool)

(assert (=> d!144751 (= res!894428 (not lt!596097))))

(declare-fun lt!596096 () Bool)

(assert (=> d!144751 (= lt!596097 lt!596096)))

(declare-fun lt!596095 () Unit!44074)

(declare-fun e!767327 () Unit!44074)

(assert (=> d!144751 (= lt!596095 e!767327)))

(declare-fun c!126718 () Bool)

(assert (=> d!144751 (= c!126718 lt!596096)))

(assert (=> d!144751 (= lt!596096 (containsKey!742 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144751 (= (contains!9196 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596097)))

(declare-fun b!1348465 () Bool)

(declare-fun lt!596098 () Unit!44074)

(assert (=> b!1348465 (= e!767327 lt!596098)))

(assert (=> b!1348465 (= lt!596098 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1348465 (isDefined!525 (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1348466 () Bool)

(declare-fun Unit!44077 () Unit!44074)

(assert (=> b!1348466 (= e!767327 Unit!44077)))

(declare-fun b!1348467 () Bool)

(assert (=> b!1348467 (= e!767326 (isDefined!525 (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144751 c!126718) b!1348465))

(assert (= (and d!144751 (not c!126718)) b!1348466))

(assert (= (and d!144751 (not res!894428)) b!1348467))

(declare-fun m!1235719 () Bool)

(assert (=> d!144751 m!1235719))

(declare-fun m!1235721 () Bool)

(assert (=> b!1348465 m!1235721))

(declare-fun m!1235723 () Bool)

(assert (=> b!1348465 m!1235723))

(assert (=> b!1348465 m!1235723))

(declare-fun m!1235725 () Bool)

(assert (=> b!1348465 m!1235725))

(assert (=> b!1348467 m!1235723))

(assert (=> b!1348467 m!1235723))

(assert (=> b!1348467 m!1235725))

(assert (=> b!1348314 d!144751))

(declare-fun b!1348510 () Bool)

(declare-fun e!767359 () ListLongMap!21987)

(declare-fun call!65128 () ListLongMap!21987)

(assert (=> b!1348510 (= e!767359 call!65128)))

(declare-fun bm!65120 () Bool)

(declare-fun call!65129 () ListLongMap!21987)

(declare-fun call!65126 () ListLongMap!21987)

(assert (=> bm!65120 (= call!65129 call!65126)))

(declare-fun b!1348511 () Bool)

(declare-fun e!767360 () Bool)

(declare-fun lt!596162 () ListLongMap!21987)

(assert (=> b!1348511 (= e!767360 (= (apply!1046 lt!596162 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1348512 () Bool)

(declare-fun e!767364 () ListLongMap!21987)

(declare-fun call!65127 () ListLongMap!21987)

(assert (=> b!1348512 (= e!767364 (+!4872 call!65127 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun bm!65121 () Bool)

(declare-fun call!65124 () ListLongMap!21987)

(assert (=> bm!65121 (= call!65124 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1348513 () Bool)

(declare-fun res!894455 () Bool)

(declare-fun e!767358 () Bool)

(assert (=> b!1348513 (=> (not res!894455) (not e!767358))))

(declare-fun e!767365 () Bool)

(assert (=> b!1348513 (= res!894455 e!767365)))

(declare-fun res!894447 () Bool)

(assert (=> b!1348513 (=> res!894447 e!767365)))

(declare-fun e!767356 () Bool)

(assert (=> b!1348513 (= res!894447 (not e!767356))))

(declare-fun res!894449 () Bool)

(assert (=> b!1348513 (=> (not res!894449) (not e!767356))))

(assert (=> b!1348513 (= res!894449 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1348514 () Bool)

(declare-fun e!767354 () Bool)

(declare-fun call!65125 () Bool)

(assert (=> b!1348514 (= e!767354 (not call!65125))))

(declare-fun b!1348515 () Bool)

(declare-fun e!767363 () Bool)

(assert (=> b!1348515 (= e!767358 e!767363)))

(declare-fun c!126731 () Bool)

(assert (=> b!1348515 (= c!126731 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!144753 () Bool)

(assert (=> d!144753 e!767358))

(declare-fun res!894450 () Bool)

(assert (=> d!144753 (=> (not res!894450) (not e!767358))))

(assert (=> d!144753 (= res!894450 (or (bvsge from!1960 (size!44986 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))))

(declare-fun lt!596149 () ListLongMap!21987)

(assert (=> d!144753 (= lt!596162 lt!596149)))

(declare-fun lt!596153 () Unit!44074)

(declare-fun e!767355 () Unit!44074)

(assert (=> d!144753 (= lt!596153 e!767355)))

(declare-fun c!126733 () Bool)

(declare-fun e!767357 () Bool)

(assert (=> d!144753 (= c!126733 e!767357)))

(declare-fun res!894448 () Bool)

(assert (=> d!144753 (=> (not res!894448) (not e!767357))))

(assert (=> d!144753 (= res!894448 (bvslt from!1960 (size!44986 _keys!1571)))))

(assert (=> d!144753 (= lt!596149 e!767364)))

(declare-fun c!126734 () Bool)

(assert (=> d!144753 (= c!126734 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144753 (validMask!0 mask!1977)))

(assert (=> d!144753 (= (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596162)))

(declare-fun bm!65122 () Bool)

(declare-fun call!65123 () Bool)

(assert (=> bm!65122 (= call!65123 (contains!9196 lt!596162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348516 () Bool)

(declare-fun e!767361 () Bool)

(assert (=> b!1348516 (= e!767365 e!767361)))

(declare-fun res!894454 () Bool)

(assert (=> b!1348516 (=> (not res!894454) (not e!767361))))

(assert (=> b!1348516 (= res!894454 (contains!9196 lt!596162 (select (arr!44435 _keys!1571) from!1960)))))

(assert (=> b!1348516 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1348517 () Bool)

(assert (=> b!1348517 (= e!767363 (not call!65123))))

(declare-fun b!1348518 () Bool)

(declare-fun c!126736 () Bool)

(assert (=> b!1348518 (= c!126736 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767366 () ListLongMap!21987)

(assert (=> b!1348518 (= e!767359 e!767366)))

(declare-fun b!1348519 () Bool)

(assert (=> b!1348519 (= e!767364 e!767359)))

(declare-fun c!126735 () Bool)

(assert (=> b!1348519 (= c!126735 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348520 () Bool)

(assert (=> b!1348520 (= e!767363 e!767360)))

(declare-fun res!894451 () Bool)

(assert (=> b!1348520 (= res!894451 call!65123)))

(assert (=> b!1348520 (=> (not res!894451) (not e!767360))))

(declare-fun b!1348521 () Bool)

(declare-fun lt!596155 () Unit!44074)

(assert (=> b!1348521 (= e!767355 lt!596155)))

(declare-fun lt!596164 () ListLongMap!21987)

(assert (=> b!1348521 (= lt!596164 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596147 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596147 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596159 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596159 (select (arr!44435 _keys!1571) from!1960))))

(declare-fun lt!596143 () Unit!44074)

(declare-fun addStillContains!1213 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> b!1348521 (= lt!596143 (addStillContains!1213 lt!596164 lt!596147 zeroValue!1245 lt!596159))))

(assert (=> b!1348521 (contains!9196 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245)) lt!596159)))

(declare-fun lt!596161 () Unit!44074)

(assert (=> b!1348521 (= lt!596161 lt!596143)))

(declare-fun lt!596151 () ListLongMap!21987)

(assert (=> b!1348521 (= lt!596151 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596156 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596146 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596146 (select (arr!44435 _keys!1571) from!1960))))

(declare-fun lt!596150 () Unit!44074)

(declare-fun addApplyDifferent!575 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> b!1348521 (= lt!596150 (addApplyDifferent!575 lt!596151 lt!596156 minValue!1245 lt!596146))))

(assert (=> b!1348521 (= (apply!1046 (+!4872 lt!596151 (tuple2!24323 lt!596156 minValue!1245)) lt!596146) (apply!1046 lt!596151 lt!596146))))

(declare-fun lt!596158 () Unit!44074)

(assert (=> b!1348521 (= lt!596158 lt!596150)))

(declare-fun lt!596145 () ListLongMap!21987)

(assert (=> b!1348521 (= lt!596145 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596163 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596154 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596154 (select (arr!44435 _keys!1571) from!1960))))

(declare-fun lt!596144 () Unit!44074)

(assert (=> b!1348521 (= lt!596144 (addApplyDifferent!575 lt!596145 lt!596163 zeroValue!1245 lt!596154))))

(assert (=> b!1348521 (= (apply!1046 (+!4872 lt!596145 (tuple2!24323 lt!596163 zeroValue!1245)) lt!596154) (apply!1046 lt!596145 lt!596154))))

(declare-fun lt!596148 () Unit!44074)

(assert (=> b!1348521 (= lt!596148 lt!596144)))

(declare-fun lt!596157 () ListLongMap!21987)

(assert (=> b!1348521 (= lt!596157 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596152 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596160 () (_ BitVec 64))

(assert (=> b!1348521 (= lt!596160 (select (arr!44435 _keys!1571) from!1960))))

(assert (=> b!1348521 (= lt!596155 (addApplyDifferent!575 lt!596157 lt!596152 minValue!1245 lt!596160))))

(assert (=> b!1348521 (= (apply!1046 (+!4872 lt!596157 (tuple2!24323 lt!596152 minValue!1245)) lt!596160) (apply!1046 lt!596157 lt!596160))))

(declare-fun b!1348522 () Bool)

(declare-fun Unit!44078 () Unit!44074)

(assert (=> b!1348522 (= e!767355 Unit!44078)))

(declare-fun b!1348523 () Bool)

(assert (=> b!1348523 (= e!767366 call!65128)))

(declare-fun bm!65123 () Bool)

(assert (=> bm!65123 (= call!65126 call!65124)))

(declare-fun bm!65124 () Bool)

(assert (=> bm!65124 (= call!65125 (contains!9196 lt!596162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348524 () Bool)

(assert (=> b!1348524 (= e!767357 (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)))))

(declare-fun b!1348525 () Bool)

(declare-fun e!767362 () Bool)

(assert (=> b!1348525 (= e!767354 e!767362)))

(declare-fun res!894453 () Bool)

(assert (=> b!1348525 (= res!894453 call!65125)))

(assert (=> b!1348525 (=> (not res!894453) (not e!767362))))

(declare-fun bm!65125 () Bool)

(assert (=> bm!65125 (= call!65127 (+!4872 (ite c!126734 call!65124 (ite c!126735 call!65126 call!65129)) (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1348526 () Bool)

(assert (=> b!1348526 (= e!767366 call!65129)))

(declare-fun b!1348527 () Bool)

(assert (=> b!1348527 (= e!767361 (= (apply!1046 lt!596162 (select (arr!44435 _keys!1571) from!1960)) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348527 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44987 _values!1303)))))

(assert (=> b!1348527 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1348528 () Bool)

(assert (=> b!1348528 (= e!767362 (= (apply!1046 lt!596162 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348529 () Bool)

(assert (=> b!1348529 (= e!767356 (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)))))

(declare-fun b!1348530 () Bool)

(declare-fun res!894452 () Bool)

(assert (=> b!1348530 (=> (not res!894452) (not e!767358))))

(assert (=> b!1348530 (= res!894452 e!767354)))

(declare-fun c!126732 () Bool)

(assert (=> b!1348530 (= c!126732 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65126 () Bool)

(assert (=> bm!65126 (= call!65128 call!65127)))

(assert (= (and d!144753 c!126734) b!1348512))

(assert (= (and d!144753 (not c!126734)) b!1348519))

(assert (= (and b!1348519 c!126735) b!1348510))

(assert (= (and b!1348519 (not c!126735)) b!1348518))

(assert (= (and b!1348518 c!126736) b!1348523))

(assert (= (and b!1348518 (not c!126736)) b!1348526))

(assert (= (or b!1348523 b!1348526) bm!65120))

(assert (= (or b!1348510 bm!65120) bm!65123))

(assert (= (or b!1348510 b!1348523) bm!65126))

(assert (= (or b!1348512 bm!65123) bm!65121))

(assert (= (or b!1348512 bm!65126) bm!65125))

(assert (= (and d!144753 res!894448) b!1348524))

(assert (= (and d!144753 c!126733) b!1348521))

(assert (= (and d!144753 (not c!126733)) b!1348522))

(assert (= (and d!144753 res!894450) b!1348513))

(assert (= (and b!1348513 res!894449) b!1348529))

(assert (= (and b!1348513 (not res!894447)) b!1348516))

(assert (= (and b!1348516 res!894454) b!1348527))

(assert (= (and b!1348513 res!894455) b!1348530))

(assert (= (and b!1348530 c!126732) b!1348525))

(assert (= (and b!1348530 (not c!126732)) b!1348514))

(assert (= (and b!1348525 res!894453) b!1348528))

(assert (= (or b!1348525 b!1348514) bm!65124))

(assert (= (and b!1348530 res!894452) b!1348515))

(assert (= (and b!1348515 c!126731) b!1348520))

(assert (= (and b!1348515 (not c!126731)) b!1348517))

(assert (= (and b!1348520 res!894451) b!1348511))

(assert (= (or b!1348520 b!1348517) bm!65122))

(declare-fun b_lambda!24563 () Bool)

(assert (=> (not b_lambda!24563) (not b!1348527)))

(assert (=> b!1348527 t!46046))

(declare-fun b_and!50819 () Bool)

(assert (= b_and!50817 (and (=> t!46046 result!25873) b_and!50819)))

(declare-fun m!1235727 () Bool)

(assert (=> b!1348512 m!1235727))

(assert (=> b!1348527 m!1235547))

(assert (=> b!1348527 m!1235549))

(assert (=> b!1348527 m!1235547))

(assert (=> b!1348527 m!1235549))

(assert (=> b!1348527 m!1235551))

(assert (=> b!1348527 m!1235555))

(assert (=> b!1348527 m!1235555))

(declare-fun m!1235729 () Bool)

(assert (=> b!1348527 m!1235729))

(declare-fun m!1235731 () Bool)

(assert (=> bm!65125 m!1235731))

(assert (=> b!1348524 m!1235555))

(assert (=> b!1348524 m!1235555))

(assert (=> b!1348524 m!1235561))

(assert (=> b!1348529 m!1235555))

(assert (=> b!1348529 m!1235555))

(assert (=> b!1348529 m!1235561))

(declare-fun m!1235733 () Bool)

(assert (=> b!1348528 m!1235733))

(declare-fun m!1235735 () Bool)

(assert (=> b!1348511 m!1235735))

(declare-fun m!1235737 () Bool)

(assert (=> b!1348521 m!1235737))

(assert (=> b!1348521 m!1235555))

(assert (=> b!1348521 m!1235737))

(declare-fun m!1235739 () Bool)

(assert (=> b!1348521 m!1235739))

(declare-fun m!1235741 () Bool)

(assert (=> b!1348521 m!1235741))

(declare-fun m!1235743 () Bool)

(assert (=> b!1348521 m!1235743))

(declare-fun m!1235745 () Bool)

(assert (=> b!1348521 m!1235745))

(declare-fun m!1235747 () Bool)

(assert (=> b!1348521 m!1235747))

(declare-fun m!1235749 () Bool)

(assert (=> b!1348521 m!1235749))

(declare-fun m!1235751 () Bool)

(assert (=> b!1348521 m!1235751))

(declare-fun m!1235753 () Bool)

(assert (=> b!1348521 m!1235753))

(declare-fun m!1235755 () Bool)

(assert (=> b!1348521 m!1235755))

(assert (=> b!1348521 m!1235741))

(declare-fun m!1235757 () Bool)

(assert (=> b!1348521 m!1235757))

(assert (=> b!1348521 m!1235747))

(declare-fun m!1235759 () Bool)

(assert (=> b!1348521 m!1235759))

(declare-fun m!1235761 () Bool)

(assert (=> b!1348521 m!1235761))

(declare-fun m!1235763 () Bool)

(assert (=> b!1348521 m!1235763))

(assert (=> b!1348521 m!1235745))

(declare-fun m!1235765 () Bool)

(assert (=> b!1348521 m!1235765))

(declare-fun m!1235767 () Bool)

(assert (=> b!1348521 m!1235767))

(assert (=> bm!65121 m!1235755))

(assert (=> b!1348516 m!1235555))

(assert (=> b!1348516 m!1235555))

(declare-fun m!1235769 () Bool)

(assert (=> b!1348516 m!1235769))

(declare-fun m!1235771 () Bool)

(assert (=> bm!65122 m!1235771))

(declare-fun m!1235773 () Bool)

(assert (=> bm!65124 m!1235773))

(assert (=> d!144753 m!1235567))

(assert (=> b!1348314 d!144753))

(declare-fun b!1348541 () Bool)

(declare-fun e!767375 () Bool)

(declare-fun e!767377 () Bool)

(assert (=> b!1348541 (= e!767375 e!767377)))

(declare-fun res!894464 () Bool)

(assert (=> b!1348541 (=> (not res!894464) (not e!767377))))

(declare-fun e!767378 () Bool)

(assert (=> b!1348541 (= res!894464 (not e!767378))))

(declare-fun res!894463 () Bool)

(assert (=> b!1348541 (=> (not res!894463) (not e!767378))))

(assert (=> b!1348541 (= res!894463 (validKeyInArray!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348542 () Bool)

(declare-fun e!767376 () Bool)

(assert (=> b!1348542 (= e!767377 e!767376)))

(declare-fun c!126739 () Bool)

(assert (=> b!1348542 (= c!126739 (validKeyInArray!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348543 () Bool)

(declare-fun call!65132 () Bool)

(assert (=> b!1348543 (= e!767376 call!65132)))

(declare-fun b!1348544 () Bool)

(declare-fun contains!9200 (List!31463 (_ BitVec 64)) Bool)

(assert (=> b!1348544 (= e!767378 (contains!9200 Nil!31460 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348545 () Bool)

(assert (=> b!1348545 (= e!767376 call!65132)))

(declare-fun bm!65129 () Bool)

(assert (=> bm!65129 (= call!65132 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126739 (Cons!31459 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) Nil!31460) Nil!31460)))))

(declare-fun d!144755 () Bool)

(declare-fun res!894462 () Bool)

(assert (=> d!144755 (=> res!894462 e!767375)))

(assert (=> d!144755 (= res!894462 (bvsge #b00000000000000000000000000000000 (size!44986 _keys!1571)))))

(assert (=> d!144755 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31460) e!767375)))

(assert (= (and d!144755 (not res!894462)) b!1348541))

(assert (= (and b!1348541 res!894463) b!1348544))

(assert (= (and b!1348541 res!894464) b!1348542))

(assert (= (and b!1348542 c!126739) b!1348545))

(assert (= (and b!1348542 (not c!126739)) b!1348543))

(assert (= (or b!1348545 b!1348543) bm!65129))

(assert (=> b!1348541 m!1235707))

(assert (=> b!1348541 m!1235707))

(assert (=> b!1348541 m!1235717))

(assert (=> b!1348542 m!1235707))

(assert (=> b!1348542 m!1235707))

(assert (=> b!1348542 m!1235717))

(assert (=> b!1348544 m!1235707))

(assert (=> b!1348544 m!1235707))

(declare-fun m!1235775 () Bool)

(assert (=> b!1348544 m!1235775))

(assert (=> bm!65129 m!1235707))

(declare-fun m!1235777 () Bool)

(assert (=> bm!65129 m!1235777))

(assert (=> b!1348304 d!144755))

(declare-fun d!144757 () Bool)

(assert (=> d!144757 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113686 d!144757))

(declare-fun d!144759 () Bool)

(assert (=> d!144759 (= (array_inv!33737 _keys!1571) (bvsge (size!44986 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113686 d!144759))

(declare-fun d!144761 () Bool)

(assert (=> d!144761 (= (array_inv!33738 _values!1303) (bvsge (size!44987 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113686 d!144761))

(declare-fun d!144763 () Bool)

(assert (=> d!144763 (= (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)) (and (not (= (select (arr!44435 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44435 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348312 d!144763))

(declare-fun condMapEmpty!57985 () Bool)

(declare-fun mapDefault!57985 () ValueCell!17858)

(assert (=> mapNonEmpty!57976 (= condMapEmpty!57985 (= mapRest!57976 ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57985)))))

(declare-fun e!767384 () Bool)

(declare-fun mapRes!57985 () Bool)

(assert (=> mapNonEmpty!57976 (= tp!110344 (and e!767384 mapRes!57985))))

(declare-fun mapNonEmpty!57985 () Bool)

(declare-fun tp!110359 () Bool)

(declare-fun e!767383 () Bool)

(assert (=> mapNonEmpty!57985 (= mapRes!57985 (and tp!110359 e!767383))))

(declare-fun mapRest!57985 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapValue!57985 () ValueCell!17858)

(declare-fun mapKey!57985 () (_ BitVec 32))

(assert (=> mapNonEmpty!57985 (= mapRest!57976 (store mapRest!57985 mapKey!57985 mapValue!57985))))

(declare-fun mapIsEmpty!57985 () Bool)

(assert (=> mapIsEmpty!57985 mapRes!57985))

(declare-fun b!1348552 () Bool)

(assert (=> b!1348552 (= e!767383 tp_is_empty!37513)))

(declare-fun b!1348553 () Bool)

(assert (=> b!1348553 (= e!767384 tp_is_empty!37513)))

(assert (= (and mapNonEmpty!57976 condMapEmpty!57985) mapIsEmpty!57985))

(assert (= (and mapNonEmpty!57976 (not condMapEmpty!57985)) mapNonEmpty!57985))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17858) mapValue!57985)) b!1348552))

(assert (= (and mapNonEmpty!57976 ((_ is ValueCellFull!17858) mapDefault!57985)) b!1348553))

(declare-fun m!1235779 () Bool)

(assert (=> mapNonEmpty!57985 m!1235779))

(declare-fun b_lambda!24565 () Bool)

(assert (= b_lambda!24561 (or (and start!113686 b_free!31513) b_lambda!24565)))

(declare-fun b_lambda!24567 () Bool)

(assert (= b_lambda!24559 (or (and start!113686 b_free!31513) b_lambda!24567)))

(declare-fun b_lambda!24569 () Bool)

(assert (= b_lambda!24563 (or (and start!113686 b_free!31513) b_lambda!24569)))

(check-sat tp_is_empty!37513 (not b!1348529) (not d!144751) (not b!1348541) (not b!1348404) (not b_lambda!24557) (not b!1348521) (not bm!65105) (not b!1348443) (not b!1348527) (not b!1348442) (not bm!65102) (not b!1348406) (not bm!65129) (not b!1348399) (not b!1348544) (not b!1348441) (not b_lambda!24567) (not b!1348462) (not bm!65121) (not b!1348465) (not b!1348512) (not b!1348416) (not b!1348446) (not b!1348464) (not b!1348511) (not b!1348467) (not d!144747) (not bm!65122) (not mapNonEmpty!57985) (not bm!65124) (not b!1348407) (not d!144753) (not d!144739) (not b!1348516) (not d!144743) (not b_lambda!24569) (not b!1348444) (not b_lambda!24565) (not b!1348414) (not b!1348528) (not b!1348449) (not b!1348524) (not b_next!31513) (not b!1348451) (not d!144745) (not b!1348542) (not bm!65125) b_and!50819 (not b!1348398) (not b!1348405) (not b!1348445))
(check-sat b_and!50819 (not b_next!31513))
(get-model)

(declare-fun b!1348554 () Bool)

(declare-fun lt!596168 () Unit!44074)

(declare-fun lt!596170 () Unit!44074)

(assert (=> b!1348554 (= lt!596168 lt!596170)))

(declare-fun lt!596171 () ListLongMap!21987)

(declare-fun lt!596167 () (_ BitVec 64))

(declare-fun lt!596169 () (_ BitVec 64))

(declare-fun lt!596166 () V!55121)

(assert (=> b!1348554 (not (contains!9196 (+!4872 lt!596171 (tuple2!24323 lt!596167 lt!596166)) lt!596169))))

(assert (=> b!1348554 (= lt!596170 (addStillNotContains!502 lt!596171 lt!596167 lt!596166 lt!596169))))

(assert (=> b!1348554 (= lt!596169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348554 (= lt!596166 (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348554 (= lt!596167 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(declare-fun call!65133 () ListLongMap!21987)

(assert (=> b!1348554 (= lt!596171 call!65133)))

(declare-fun e!767388 () ListLongMap!21987)

(assert (=> b!1348554 (= e!767388 (+!4872 call!65133 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348555 () Bool)

(declare-fun lt!596165 () ListLongMap!21987)

(declare-fun e!767391 () Bool)

(assert (=> b!1348555 (= e!767391 (= lt!596165 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65130 () Bool)

(assert (=> bm!65130 (= call!65133 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348556 () Bool)

(declare-fun res!894466 () Bool)

(declare-fun e!767386 () Bool)

(assert (=> b!1348556 (=> (not res!894466) (not e!767386))))

(assert (=> b!1348556 (= res!894466 (not (contains!9196 lt!596165 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348557 () Bool)

(declare-fun e!767389 () Bool)

(assert (=> b!1348557 (= e!767389 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1348557 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1348558 () Bool)

(assert (=> b!1348558 (= e!767391 (isEmpty!1095 lt!596165))))

(declare-fun b!1348559 () Bool)

(declare-fun e!767387 () ListLongMap!21987)

(assert (=> b!1348559 (= e!767387 e!767388)))

(declare-fun c!126743 () Bool)

(assert (=> b!1348559 (= c!126743 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(declare-fun b!1348560 () Bool)

(declare-fun e!767385 () Bool)

(assert (=> b!1348560 (= e!767386 e!767385)))

(declare-fun c!126740 () Bool)

(assert (=> b!1348560 (= c!126740 e!767389)))

(declare-fun res!894465 () Bool)

(assert (=> b!1348560 (=> (not res!894465) (not e!767389))))

(assert (=> b!1348560 (= res!894465 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(declare-fun b!1348561 () Bool)

(assert (=> b!1348561 (= e!767387 (ListLongMap!21988 Nil!31461))))

(declare-fun d!144765 () Bool)

(assert (=> d!144765 e!767386))

(declare-fun res!894468 () Bool)

(assert (=> d!144765 (=> (not res!894468) (not e!767386))))

(assert (=> d!144765 (= res!894468 (not (contains!9196 lt!596165 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144765 (= lt!596165 e!767387)))

(declare-fun c!126741 () Bool)

(assert (=> d!144765 (= c!126741 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> d!144765 (validMask!0 mask!1977)))

(assert (=> d!144765 (= (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!596165)))

(declare-fun b!1348562 () Bool)

(assert (=> b!1348562 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> b!1348562 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44987 _values!1303)))))

(declare-fun e!767390 () Bool)

(assert (=> b!1348562 (= e!767390 (= (apply!1046 lt!596165 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348563 () Bool)

(assert (=> b!1348563 (= e!767385 e!767391)))

(declare-fun c!126742 () Bool)

(assert (=> b!1348563 (= c!126742 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(declare-fun b!1348564 () Bool)

(assert (=> b!1348564 (= e!767385 e!767390)))

(assert (=> b!1348564 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(declare-fun res!894467 () Bool)

(assert (=> b!1348564 (= res!894467 (contains!9196 lt!596165 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1348564 (=> (not res!894467) (not e!767390))))

(declare-fun b!1348565 () Bool)

(assert (=> b!1348565 (= e!767388 call!65133)))

(assert (= (and d!144765 c!126741) b!1348561))

(assert (= (and d!144765 (not c!126741)) b!1348559))

(assert (= (and b!1348559 c!126743) b!1348554))

(assert (= (and b!1348559 (not c!126743)) b!1348565))

(assert (= (or b!1348554 b!1348565) bm!65130))

(assert (= (and d!144765 res!894468) b!1348556))

(assert (= (and b!1348556 res!894466) b!1348560))

(assert (= (and b!1348560 res!894465) b!1348557))

(assert (= (and b!1348560 c!126740) b!1348564))

(assert (= (and b!1348560 (not c!126740)) b!1348563))

(assert (= (and b!1348564 res!894467) b!1348562))

(assert (= (and b!1348563 c!126742) b!1348555))

(assert (= (and b!1348563 (not c!126742)) b!1348558))

(declare-fun b_lambda!24571 () Bool)

(assert (=> (not b_lambda!24571) (not b!1348554)))

(assert (=> b!1348554 t!46046))

(declare-fun b_and!50821 () Bool)

(assert (= b_and!50819 (and (=> t!46046 result!25873) b_and!50821)))

(declare-fun b_lambda!24573 () Bool)

(assert (=> (not b_lambda!24573) (not b!1348562)))

(assert (=> b!1348562 t!46046))

(declare-fun b_and!50823 () Bool)

(assert (= b_and!50821 (and (=> t!46046 result!25873) b_and!50823)))

(declare-fun m!1235781 () Bool)

(assert (=> b!1348556 m!1235781))

(declare-fun m!1235783 () Bool)

(assert (=> b!1348559 m!1235783))

(assert (=> b!1348559 m!1235783))

(declare-fun m!1235785 () Bool)

(assert (=> b!1348559 m!1235785))

(assert (=> b!1348554 m!1235783))

(assert (=> b!1348554 m!1235549))

(declare-fun m!1235787 () Bool)

(assert (=> b!1348554 m!1235787))

(declare-fun m!1235789 () Bool)

(assert (=> b!1348554 m!1235789))

(assert (=> b!1348554 m!1235549))

(declare-fun m!1235791 () Bool)

(assert (=> b!1348554 m!1235791))

(declare-fun m!1235793 () Bool)

(assert (=> b!1348554 m!1235793))

(declare-fun m!1235795 () Bool)

(assert (=> b!1348554 m!1235795))

(assert (=> b!1348554 m!1235793))

(declare-fun m!1235797 () Bool)

(assert (=> b!1348554 m!1235797))

(assert (=> b!1348554 m!1235789))

(assert (=> b!1348557 m!1235783))

(assert (=> b!1348557 m!1235783))

(assert (=> b!1348557 m!1235785))

(assert (=> b!1348564 m!1235783))

(assert (=> b!1348564 m!1235783))

(declare-fun m!1235799 () Bool)

(assert (=> b!1348564 m!1235799))

(declare-fun m!1235801 () Bool)

(assert (=> bm!65130 m!1235801))

(assert (=> b!1348555 m!1235801))

(declare-fun m!1235803 () Bool)

(assert (=> d!144765 m!1235803))

(assert (=> d!144765 m!1235567))

(assert (=> b!1348562 m!1235783))

(assert (=> b!1348562 m!1235549))

(assert (=> b!1348562 m!1235789))

(assert (=> b!1348562 m!1235549))

(assert (=> b!1348562 m!1235791))

(assert (=> b!1348562 m!1235783))

(declare-fun m!1235805 () Bool)

(assert (=> b!1348562 m!1235805))

(assert (=> b!1348562 m!1235789))

(declare-fun m!1235807 () Bool)

(assert (=> b!1348558 m!1235807))

(assert (=> b!1348442 d!144765))

(assert (=> bm!65102 d!144765))

(declare-fun b!1348574 () Bool)

(declare-fun e!767396 () Option!767)

(assert (=> b!1348574 (= e!767396 (Some!766 (_2!12172 (h!32678 (toList!11009 lt!596052)))))))

(declare-fun b!1348577 () Bool)

(declare-fun e!767397 () Option!767)

(assert (=> b!1348577 (= e!767397 None!765)))

(declare-fun d!144767 () Bool)

(declare-fun c!126748 () Bool)

(assert (=> d!144767 (= c!126748 (and ((_ is Cons!31460) (toList!11009 lt!596052)) (= (_1!12172 (h!32678 (toList!11009 lt!596052))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144767 (= (getValueByKey!716 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!767396)))

(declare-fun b!1348575 () Bool)

(assert (=> b!1348575 (= e!767396 e!767397)))

(declare-fun c!126749 () Bool)

(assert (=> b!1348575 (= c!126749 (and ((_ is Cons!31460) (toList!11009 lt!596052)) (not (= (_1!12172 (h!32678 (toList!11009 lt!596052))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun b!1348576 () Bool)

(assert (=> b!1348576 (= e!767397 (getValueByKey!716 (t!46048 (toList!11009 lt!596052)) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (= (and d!144767 c!126748) b!1348574))

(assert (= (and d!144767 (not c!126748)) b!1348575))

(assert (= (and b!1348575 c!126749) b!1348576))

(assert (= (and b!1348575 (not c!126749)) b!1348577))

(declare-fun m!1235809 () Bool)

(assert (=> b!1348576 m!1235809))

(assert (=> b!1348406 d!144767))

(declare-fun d!144769 () Bool)

(declare-fun e!767398 () Bool)

(assert (=> d!144769 e!767398))

(declare-fun res!894469 () Bool)

(assert (=> d!144769 (=> (not res!894469) (not e!767398))))

(declare-fun lt!596175 () ListLongMap!21987)

(assert (=> d!144769 (= res!894469 (contains!9196 lt!596175 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596172 () List!31464)

(assert (=> d!144769 (= lt!596175 (ListLongMap!21988 lt!596172))))

(declare-fun lt!596174 () Unit!44074)

(declare-fun lt!596173 () Unit!44074)

(assert (=> d!144769 (= lt!596174 lt!596173)))

(assert (=> d!144769 (= (getValueByKey!716 lt!596172 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144769 (= lt!596173 (lemmaContainsTupThenGetReturnValue!366 lt!596172 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144769 (= lt!596172 (insertStrictlySorted!495 (toList!11009 call!65105) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144769 (= (+!4872 call!65105 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596175)))

(declare-fun b!1348578 () Bool)

(declare-fun res!894470 () Bool)

(assert (=> b!1348578 (=> (not res!894470) (not e!767398))))

(assert (=> b!1348578 (= res!894470 (= (getValueByKey!716 (toList!11009 lt!596175) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348579 () Bool)

(assert (=> b!1348579 (= e!767398 (contains!9199 (toList!11009 lt!596175) (tuple2!24323 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144769 res!894469) b!1348578))

(assert (= (and b!1348578 res!894470) b!1348579))

(declare-fun m!1235811 () Bool)

(assert (=> d!144769 m!1235811))

(declare-fun m!1235813 () Bool)

(assert (=> d!144769 m!1235813))

(declare-fun m!1235815 () Bool)

(assert (=> d!144769 m!1235815))

(declare-fun m!1235817 () Bool)

(assert (=> d!144769 m!1235817))

(declare-fun m!1235819 () Bool)

(assert (=> b!1348578 m!1235819))

(declare-fun m!1235821 () Bool)

(assert (=> b!1348579 m!1235821))

(assert (=> b!1348441 d!144769))

(declare-fun d!144771 () Bool)

(declare-fun c!126750 () Bool)

(assert (=> d!144771 (= c!126750 ((_ is ValueCellFull!17858) (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!767399 () V!55121)

(assert (=> d!144771 (= (get!22452 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767399)))

(declare-fun b!1348580 () Bool)

(assert (=> b!1348580 (= e!767399 (get!22454 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348581 () Bool)

(assert (=> b!1348581 (= e!767399 (get!22455 (select (arr!44436 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144771 c!126750) b!1348580))

(assert (= (and d!144771 (not c!126750)) b!1348581))

(assert (=> b!1348580 m!1235687))

(assert (=> b!1348580 m!1235549))

(declare-fun m!1235823 () Bool)

(assert (=> b!1348580 m!1235823))

(assert (=> b!1348581 m!1235687))

(assert (=> b!1348581 m!1235549))

(declare-fun m!1235825 () Bool)

(assert (=> b!1348581 m!1235825))

(assert (=> b!1348441 d!144771))

(declare-fun d!144773 () Bool)

(assert (=> d!144773 (not (contains!9196 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080)) lt!596083))))

(declare-fun lt!596178 () Unit!44074)

(declare-fun choose!1974 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> d!144773 (= lt!596178 (choose!1974 lt!596085 lt!596081 lt!596080 lt!596083))))

(declare-fun e!767402 () Bool)

(assert (=> d!144773 e!767402))

(declare-fun res!894473 () Bool)

(assert (=> d!144773 (=> (not res!894473) (not e!767402))))

(assert (=> d!144773 (= res!894473 (not (contains!9196 lt!596085 lt!596083)))))

(assert (=> d!144773 (= (addStillNotContains!502 lt!596085 lt!596081 lt!596080 lt!596083) lt!596178)))

(declare-fun b!1348585 () Bool)

(assert (=> b!1348585 (= e!767402 (not (= lt!596081 lt!596083)))))

(assert (= (and d!144773 res!894473) b!1348585))

(assert (=> d!144773 m!1235691))

(assert (=> d!144773 m!1235691))

(assert (=> d!144773 m!1235695))

(declare-fun m!1235827 () Bool)

(assert (=> d!144773 m!1235827))

(declare-fun m!1235829 () Bool)

(assert (=> d!144773 m!1235829))

(assert (=> b!1348441 d!144773))

(declare-fun d!144775 () Bool)

(declare-fun e!767403 () Bool)

(assert (=> d!144775 e!767403))

(declare-fun res!894474 () Bool)

(assert (=> d!144775 (=> (not res!894474) (not e!767403))))

(declare-fun lt!596182 () ListLongMap!21987)

(assert (=> d!144775 (= res!894474 (contains!9196 lt!596182 (_1!12172 (tuple2!24323 lt!596081 lt!596080))))))

(declare-fun lt!596179 () List!31464)

(assert (=> d!144775 (= lt!596182 (ListLongMap!21988 lt!596179))))

(declare-fun lt!596181 () Unit!44074)

(declare-fun lt!596180 () Unit!44074)

(assert (=> d!144775 (= lt!596181 lt!596180)))

(assert (=> d!144775 (= (getValueByKey!716 lt!596179 (_1!12172 (tuple2!24323 lt!596081 lt!596080))) (Some!766 (_2!12172 (tuple2!24323 lt!596081 lt!596080))))))

(assert (=> d!144775 (= lt!596180 (lemmaContainsTupThenGetReturnValue!366 lt!596179 (_1!12172 (tuple2!24323 lt!596081 lt!596080)) (_2!12172 (tuple2!24323 lt!596081 lt!596080))))))

(assert (=> d!144775 (= lt!596179 (insertStrictlySorted!495 (toList!11009 lt!596085) (_1!12172 (tuple2!24323 lt!596081 lt!596080)) (_2!12172 (tuple2!24323 lt!596081 lt!596080))))))

(assert (=> d!144775 (= (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080)) lt!596182)))

(declare-fun b!1348586 () Bool)

(declare-fun res!894475 () Bool)

(assert (=> b!1348586 (=> (not res!894475) (not e!767403))))

(assert (=> b!1348586 (= res!894475 (= (getValueByKey!716 (toList!11009 lt!596182) (_1!12172 (tuple2!24323 lt!596081 lt!596080))) (Some!766 (_2!12172 (tuple2!24323 lt!596081 lt!596080)))))))

(declare-fun b!1348587 () Bool)

(assert (=> b!1348587 (= e!767403 (contains!9199 (toList!11009 lt!596182) (tuple2!24323 lt!596081 lt!596080)))))

(assert (= (and d!144775 res!894474) b!1348586))

(assert (= (and b!1348586 res!894475) b!1348587))

(declare-fun m!1235831 () Bool)

(assert (=> d!144775 m!1235831))

(declare-fun m!1235833 () Bool)

(assert (=> d!144775 m!1235833))

(declare-fun m!1235835 () Bool)

(assert (=> d!144775 m!1235835))

(declare-fun m!1235837 () Bool)

(assert (=> d!144775 m!1235837))

(declare-fun m!1235839 () Bool)

(assert (=> b!1348586 m!1235839))

(declare-fun m!1235841 () Bool)

(assert (=> b!1348587 m!1235841))

(assert (=> b!1348441 d!144775))

(declare-fun d!144777 () Bool)

(declare-fun e!767404 () Bool)

(assert (=> d!144777 e!767404))

(declare-fun res!894476 () Bool)

(assert (=> d!144777 (=> res!894476 e!767404)))

(declare-fun lt!596185 () Bool)

(assert (=> d!144777 (= res!894476 (not lt!596185))))

(declare-fun lt!596184 () Bool)

(assert (=> d!144777 (= lt!596185 lt!596184)))

(declare-fun lt!596183 () Unit!44074)

(declare-fun e!767405 () Unit!44074)

(assert (=> d!144777 (= lt!596183 e!767405)))

(declare-fun c!126751 () Bool)

(assert (=> d!144777 (= c!126751 lt!596184)))

(assert (=> d!144777 (= lt!596184 (containsKey!742 (toList!11009 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080))) lt!596083))))

(assert (=> d!144777 (= (contains!9196 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080)) lt!596083) lt!596185)))

(declare-fun b!1348588 () Bool)

(declare-fun lt!596186 () Unit!44074)

(assert (=> b!1348588 (= e!767405 lt!596186)))

(assert (=> b!1348588 (= lt!596186 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080))) lt!596083))))

(assert (=> b!1348588 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080))) lt!596083))))

(declare-fun b!1348589 () Bool)

(declare-fun Unit!44079 () Unit!44074)

(assert (=> b!1348589 (= e!767405 Unit!44079)))

(declare-fun b!1348590 () Bool)

(assert (=> b!1348590 (= e!767404 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 lt!596085 (tuple2!24323 lt!596081 lt!596080))) lt!596083)))))

(assert (= (and d!144777 c!126751) b!1348588))

(assert (= (and d!144777 (not c!126751)) b!1348589))

(assert (= (and d!144777 (not res!894476)) b!1348590))

(declare-fun m!1235843 () Bool)

(assert (=> d!144777 m!1235843))

(declare-fun m!1235845 () Bool)

(assert (=> b!1348588 m!1235845))

(declare-fun m!1235847 () Bool)

(assert (=> b!1348588 m!1235847))

(assert (=> b!1348588 m!1235847))

(declare-fun m!1235849 () Bool)

(assert (=> b!1348588 m!1235849))

(assert (=> b!1348590 m!1235847))

(assert (=> b!1348590 m!1235847))

(assert (=> b!1348590 m!1235849))

(assert (=> b!1348441 d!144777))

(declare-fun d!144779 () Bool)

(declare-fun e!767406 () Bool)

(assert (=> d!144779 e!767406))

(declare-fun res!894477 () Bool)

(assert (=> d!144779 (=> res!894477 e!767406)))

(declare-fun lt!596189 () Bool)

(assert (=> d!144779 (= res!894477 (not lt!596189))))

(declare-fun lt!596188 () Bool)

(assert (=> d!144779 (= lt!596189 lt!596188)))

(declare-fun lt!596187 () Unit!44074)

(declare-fun e!767407 () Unit!44074)

(assert (=> d!144779 (= lt!596187 e!767407)))

(declare-fun c!126752 () Bool)

(assert (=> d!144779 (= c!126752 lt!596188)))

(assert (=> d!144779 (= lt!596188 (containsKey!742 (toList!11009 lt!596079) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144779 (= (contains!9196 lt!596079 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596189)))

(declare-fun b!1348591 () Bool)

(declare-fun lt!596190 () Unit!44074)

(assert (=> b!1348591 (= e!767407 lt!596190)))

(assert (=> b!1348591 (= lt!596190 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596079) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348591 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348592 () Bool)

(declare-fun Unit!44080 () Unit!44074)

(assert (=> b!1348592 (= e!767407 Unit!44080)))

(declare-fun b!1348593 () Bool)

(assert (=> b!1348593 (= e!767406 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144779 c!126752) b!1348591))

(assert (= (and d!144779 (not c!126752)) b!1348592))

(assert (= (and d!144779 (not res!894477)) b!1348593))

(declare-fun m!1235851 () Bool)

(assert (=> d!144779 m!1235851))

(declare-fun m!1235853 () Bool)

(assert (=> b!1348591 m!1235853))

(declare-fun m!1235855 () Bool)

(assert (=> b!1348591 m!1235855))

(assert (=> b!1348591 m!1235855))

(declare-fun m!1235857 () Bool)

(assert (=> b!1348591 m!1235857))

(assert (=> b!1348593 m!1235855))

(assert (=> b!1348593 m!1235855))

(assert (=> b!1348593 m!1235857))

(assert (=> d!144747 d!144779))

(assert (=> d!144747 d!144757))

(declare-fun d!144781 () Bool)

(declare-fun lt!596193 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!662 (List!31464) (InoxSet tuple2!24322))

(assert (=> d!144781 (= lt!596193 (select (content!662 (toList!11009 lt!596048)) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!767412 () Bool)

(assert (=> d!144781 (= lt!596193 e!767412)))

(declare-fun res!894483 () Bool)

(assert (=> d!144781 (=> (not res!894483) (not e!767412))))

(assert (=> d!144781 (= res!894483 ((_ is Cons!31460) (toList!11009 lt!596048)))))

(assert (=> d!144781 (= (contains!9199 (toList!11009 lt!596048) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596193)))

(declare-fun b!1348598 () Bool)

(declare-fun e!767413 () Bool)

(assert (=> b!1348598 (= e!767412 e!767413)))

(declare-fun res!894482 () Bool)

(assert (=> b!1348598 (=> res!894482 e!767413)))

(assert (=> b!1348598 (= res!894482 (= (h!32678 (toList!11009 lt!596048)) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348599 () Bool)

(assert (=> b!1348599 (= e!767413 (contains!9199 (t!46048 (toList!11009 lt!596048)) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144781 res!894483) b!1348598))

(assert (= (and b!1348598 (not res!894482)) b!1348599))

(declare-fun m!1235859 () Bool)

(assert (=> d!144781 m!1235859))

(declare-fun m!1235861 () Bool)

(assert (=> d!144781 m!1235861))

(declare-fun m!1235863 () Bool)

(assert (=> b!1348599 m!1235863))

(assert (=> b!1348399 d!144781))

(declare-fun d!144783 () Bool)

(assert (=> d!144783 (= (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348444 d!144783))

(declare-fun d!144785 () Bool)

(declare-fun lt!596194 () Bool)

(assert (=> d!144785 (= lt!596194 (select (content!662 (toList!11009 lt!596052)) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun e!767414 () Bool)

(assert (=> d!144785 (= lt!596194 e!767414)))

(declare-fun res!894485 () Bool)

(assert (=> d!144785 (=> (not res!894485) (not e!767414))))

(assert (=> d!144785 (= res!894485 ((_ is Cons!31460) (toList!11009 lt!596052)))))

(assert (=> d!144785 (= (contains!9199 (toList!11009 lt!596052) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!596194)))

(declare-fun b!1348600 () Bool)

(declare-fun e!767415 () Bool)

(assert (=> b!1348600 (= e!767414 e!767415)))

(declare-fun res!894484 () Bool)

(assert (=> b!1348600 (=> res!894484 e!767415)))

(assert (=> b!1348600 (= res!894484 (= (h!32678 (toList!11009 lt!596052)) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(declare-fun b!1348601 () Bool)

(assert (=> b!1348601 (= e!767415 (contains!9199 (t!46048 (toList!11009 lt!596052)) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144785 res!894485) b!1348600))

(assert (= (and b!1348600 (not res!894484)) b!1348601))

(declare-fun m!1235865 () Bool)

(assert (=> d!144785 m!1235865))

(declare-fun m!1235867 () Bool)

(assert (=> d!144785 m!1235867))

(declare-fun m!1235869 () Bool)

(assert (=> b!1348601 m!1235869))

(assert (=> b!1348407 d!144785))

(declare-fun d!144787 () Bool)

(declare-fun e!767416 () Bool)

(assert (=> d!144787 e!767416))

(declare-fun res!894486 () Bool)

(assert (=> d!144787 (=> res!894486 e!767416)))

(declare-fun lt!596197 () Bool)

(assert (=> d!144787 (= res!894486 (not lt!596197))))

(declare-fun lt!596196 () Bool)

(assert (=> d!144787 (= lt!596197 lt!596196)))

(declare-fun lt!596195 () Unit!44074)

(declare-fun e!767417 () Unit!44074)

(assert (=> d!144787 (= lt!596195 e!767417)))

(declare-fun c!126753 () Bool)

(assert (=> d!144787 (= c!126753 lt!596196)))

(assert (=> d!144787 (= lt!596196 (containsKey!742 (toList!11009 lt!596079) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144787 (= (contains!9196 lt!596079 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596197)))

(declare-fun b!1348602 () Bool)

(declare-fun lt!596198 () Unit!44074)

(assert (=> b!1348602 (= e!767417 lt!596198)))

(assert (=> b!1348602 (= lt!596198 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596079) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348602 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348603 () Bool)

(declare-fun Unit!44081 () Unit!44074)

(assert (=> b!1348603 (= e!767417 Unit!44081)))

(declare-fun b!1348604 () Bool)

(assert (=> b!1348604 (= e!767416 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144787 c!126753) b!1348602))

(assert (= (and d!144787 (not c!126753)) b!1348603))

(assert (= (and d!144787 (not res!894486)) b!1348604))

(declare-fun m!1235871 () Bool)

(assert (=> d!144787 m!1235871))

(declare-fun m!1235873 () Bool)

(assert (=> b!1348602 m!1235873))

(declare-fun m!1235875 () Bool)

(assert (=> b!1348602 m!1235875))

(assert (=> b!1348602 m!1235875))

(declare-fun m!1235877 () Bool)

(assert (=> b!1348602 m!1235877))

(assert (=> b!1348604 m!1235875))

(assert (=> b!1348604 m!1235875))

(assert (=> b!1348604 m!1235877))

(assert (=> b!1348443 d!144787))

(declare-fun d!144789 () Bool)

(declare-fun get!22456 (Option!767) V!55121)

(assert (=> d!144789 (= (apply!1046 lt!596157 lt!596160) (get!22456 (getValueByKey!716 (toList!11009 lt!596157) lt!596160)))))

(declare-fun bs!38629 () Bool)

(assert (= bs!38629 d!144789))

(declare-fun m!1235879 () Bool)

(assert (=> bs!38629 m!1235879))

(assert (=> bs!38629 m!1235879))

(declare-fun m!1235881 () Bool)

(assert (=> bs!38629 m!1235881))

(assert (=> b!1348521 d!144789))

(declare-fun d!144791 () Bool)

(assert (=> d!144791 (= (apply!1046 (+!4872 lt!596145 (tuple2!24323 lt!596163 zeroValue!1245)) lt!596154) (apply!1046 lt!596145 lt!596154))))

(declare-fun lt!596201 () Unit!44074)

(declare-fun choose!1975 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> d!144791 (= lt!596201 (choose!1975 lt!596145 lt!596163 zeroValue!1245 lt!596154))))

(declare-fun e!767420 () Bool)

(assert (=> d!144791 e!767420))

(declare-fun res!894489 () Bool)

(assert (=> d!144791 (=> (not res!894489) (not e!767420))))

(assert (=> d!144791 (= res!894489 (contains!9196 lt!596145 lt!596154))))

(assert (=> d!144791 (= (addApplyDifferent!575 lt!596145 lt!596163 zeroValue!1245 lt!596154) lt!596201)))

(declare-fun b!1348608 () Bool)

(assert (=> b!1348608 (= e!767420 (not (= lt!596154 lt!596163)))))

(assert (= (and d!144791 res!894489) b!1348608))

(assert (=> d!144791 m!1235749))

(assert (=> d!144791 m!1235745))

(assert (=> d!144791 m!1235745))

(assert (=> d!144791 m!1235765))

(declare-fun m!1235883 () Bool)

(assert (=> d!144791 m!1235883))

(declare-fun m!1235885 () Bool)

(assert (=> d!144791 m!1235885))

(assert (=> b!1348521 d!144791))

(declare-fun d!144793 () Bool)

(declare-fun e!767421 () Bool)

(assert (=> d!144793 e!767421))

(declare-fun res!894490 () Bool)

(assert (=> d!144793 (=> (not res!894490) (not e!767421))))

(declare-fun lt!596205 () ListLongMap!21987)

(assert (=> d!144793 (= res!894490 (contains!9196 lt!596205 (_1!12172 (tuple2!24323 lt!596152 minValue!1245))))))

(declare-fun lt!596202 () List!31464)

(assert (=> d!144793 (= lt!596205 (ListLongMap!21988 lt!596202))))

(declare-fun lt!596204 () Unit!44074)

(declare-fun lt!596203 () Unit!44074)

(assert (=> d!144793 (= lt!596204 lt!596203)))

(assert (=> d!144793 (= (getValueByKey!716 lt!596202 (_1!12172 (tuple2!24323 lt!596152 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596152 minValue!1245))))))

(assert (=> d!144793 (= lt!596203 (lemmaContainsTupThenGetReturnValue!366 lt!596202 (_1!12172 (tuple2!24323 lt!596152 minValue!1245)) (_2!12172 (tuple2!24323 lt!596152 minValue!1245))))))

(assert (=> d!144793 (= lt!596202 (insertStrictlySorted!495 (toList!11009 lt!596157) (_1!12172 (tuple2!24323 lt!596152 minValue!1245)) (_2!12172 (tuple2!24323 lt!596152 minValue!1245))))))

(assert (=> d!144793 (= (+!4872 lt!596157 (tuple2!24323 lt!596152 minValue!1245)) lt!596205)))

(declare-fun b!1348609 () Bool)

(declare-fun res!894491 () Bool)

(assert (=> b!1348609 (=> (not res!894491) (not e!767421))))

(assert (=> b!1348609 (= res!894491 (= (getValueByKey!716 (toList!11009 lt!596205) (_1!12172 (tuple2!24323 lt!596152 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596152 minValue!1245)))))))

(declare-fun b!1348610 () Bool)

(assert (=> b!1348610 (= e!767421 (contains!9199 (toList!11009 lt!596205) (tuple2!24323 lt!596152 minValue!1245)))))

(assert (= (and d!144793 res!894490) b!1348609))

(assert (= (and b!1348609 res!894491) b!1348610))

(declare-fun m!1235887 () Bool)

(assert (=> d!144793 m!1235887))

(declare-fun m!1235889 () Bool)

(assert (=> d!144793 m!1235889))

(declare-fun m!1235891 () Bool)

(assert (=> d!144793 m!1235891))

(declare-fun m!1235893 () Bool)

(assert (=> d!144793 m!1235893))

(declare-fun m!1235895 () Bool)

(assert (=> b!1348609 m!1235895))

(declare-fun m!1235897 () Bool)

(assert (=> b!1348610 m!1235897))

(assert (=> b!1348521 d!144793))

(declare-fun d!144795 () Bool)

(declare-fun e!767422 () Bool)

(assert (=> d!144795 e!767422))

(declare-fun res!894492 () Bool)

(assert (=> d!144795 (=> (not res!894492) (not e!767422))))

(declare-fun lt!596209 () ListLongMap!21987)

(assert (=> d!144795 (= res!894492 (contains!9196 lt!596209 (_1!12172 (tuple2!24323 lt!596156 minValue!1245))))))

(declare-fun lt!596206 () List!31464)

(assert (=> d!144795 (= lt!596209 (ListLongMap!21988 lt!596206))))

(declare-fun lt!596208 () Unit!44074)

(declare-fun lt!596207 () Unit!44074)

(assert (=> d!144795 (= lt!596208 lt!596207)))

(assert (=> d!144795 (= (getValueByKey!716 lt!596206 (_1!12172 (tuple2!24323 lt!596156 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596156 minValue!1245))))))

(assert (=> d!144795 (= lt!596207 (lemmaContainsTupThenGetReturnValue!366 lt!596206 (_1!12172 (tuple2!24323 lt!596156 minValue!1245)) (_2!12172 (tuple2!24323 lt!596156 minValue!1245))))))

(assert (=> d!144795 (= lt!596206 (insertStrictlySorted!495 (toList!11009 lt!596151) (_1!12172 (tuple2!24323 lt!596156 minValue!1245)) (_2!12172 (tuple2!24323 lt!596156 minValue!1245))))))

(assert (=> d!144795 (= (+!4872 lt!596151 (tuple2!24323 lt!596156 minValue!1245)) lt!596209)))

(declare-fun b!1348611 () Bool)

(declare-fun res!894493 () Bool)

(assert (=> b!1348611 (=> (not res!894493) (not e!767422))))

(assert (=> b!1348611 (= res!894493 (= (getValueByKey!716 (toList!11009 lt!596209) (_1!12172 (tuple2!24323 lt!596156 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596156 minValue!1245)))))))

(declare-fun b!1348612 () Bool)

(assert (=> b!1348612 (= e!767422 (contains!9199 (toList!11009 lt!596209) (tuple2!24323 lt!596156 minValue!1245)))))

(assert (= (and d!144795 res!894492) b!1348611))

(assert (= (and b!1348611 res!894493) b!1348612))

(declare-fun m!1235899 () Bool)

(assert (=> d!144795 m!1235899))

(declare-fun m!1235901 () Bool)

(assert (=> d!144795 m!1235901))

(declare-fun m!1235903 () Bool)

(assert (=> d!144795 m!1235903))

(declare-fun m!1235905 () Bool)

(assert (=> d!144795 m!1235905))

(declare-fun m!1235907 () Bool)

(assert (=> b!1348611 m!1235907))

(declare-fun m!1235909 () Bool)

(assert (=> b!1348612 m!1235909))

(assert (=> b!1348521 d!144795))

(declare-fun d!144797 () Bool)

(declare-fun e!767423 () Bool)

(assert (=> d!144797 e!767423))

(declare-fun res!894494 () Bool)

(assert (=> d!144797 (=> res!894494 e!767423)))

(declare-fun lt!596212 () Bool)

(assert (=> d!144797 (= res!894494 (not lt!596212))))

(declare-fun lt!596211 () Bool)

(assert (=> d!144797 (= lt!596212 lt!596211)))

(declare-fun lt!596210 () Unit!44074)

(declare-fun e!767424 () Unit!44074)

(assert (=> d!144797 (= lt!596210 e!767424)))

(declare-fun c!126754 () Bool)

(assert (=> d!144797 (= c!126754 lt!596211)))

(assert (=> d!144797 (= lt!596211 (containsKey!742 (toList!11009 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245))) lt!596159))))

(assert (=> d!144797 (= (contains!9196 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245)) lt!596159) lt!596212)))

(declare-fun b!1348613 () Bool)

(declare-fun lt!596213 () Unit!44074)

(assert (=> b!1348613 (= e!767424 lt!596213)))

(assert (=> b!1348613 (= lt!596213 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245))) lt!596159))))

(assert (=> b!1348613 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245))) lt!596159))))

(declare-fun b!1348614 () Bool)

(declare-fun Unit!44082 () Unit!44074)

(assert (=> b!1348614 (= e!767424 Unit!44082)))

(declare-fun b!1348615 () Bool)

(assert (=> b!1348615 (= e!767423 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245))) lt!596159)))))

(assert (= (and d!144797 c!126754) b!1348613))

(assert (= (and d!144797 (not c!126754)) b!1348614))

(assert (= (and d!144797 (not res!894494)) b!1348615))

(declare-fun m!1235911 () Bool)

(assert (=> d!144797 m!1235911))

(declare-fun m!1235913 () Bool)

(assert (=> b!1348613 m!1235913))

(declare-fun m!1235915 () Bool)

(assert (=> b!1348613 m!1235915))

(assert (=> b!1348613 m!1235915))

(declare-fun m!1235917 () Bool)

(assert (=> b!1348613 m!1235917))

(assert (=> b!1348615 m!1235915))

(assert (=> b!1348615 m!1235915))

(assert (=> b!1348615 m!1235917))

(assert (=> b!1348521 d!144797))

(declare-fun d!144799 () Bool)

(assert (=> d!144799 (= (apply!1046 (+!4872 lt!596145 (tuple2!24323 lt!596163 zeroValue!1245)) lt!596154) (get!22456 (getValueByKey!716 (toList!11009 (+!4872 lt!596145 (tuple2!24323 lt!596163 zeroValue!1245))) lt!596154)))))

(declare-fun bs!38630 () Bool)

(assert (= bs!38630 d!144799))

(declare-fun m!1235919 () Bool)

(assert (=> bs!38630 m!1235919))

(assert (=> bs!38630 m!1235919))

(declare-fun m!1235921 () Bool)

(assert (=> bs!38630 m!1235921))

(assert (=> b!1348521 d!144799))

(declare-fun d!144801 () Bool)

(assert (=> d!144801 (= (apply!1046 lt!596145 lt!596154) (get!22456 (getValueByKey!716 (toList!11009 lt!596145) lt!596154)))))

(declare-fun bs!38631 () Bool)

(assert (= bs!38631 d!144801))

(declare-fun m!1235923 () Bool)

(assert (=> bs!38631 m!1235923))

(assert (=> bs!38631 m!1235923))

(declare-fun m!1235925 () Bool)

(assert (=> bs!38631 m!1235925))

(assert (=> b!1348521 d!144801))

(declare-fun d!144803 () Bool)

(declare-fun e!767425 () Bool)

(assert (=> d!144803 e!767425))

(declare-fun res!894495 () Bool)

(assert (=> d!144803 (=> (not res!894495) (not e!767425))))

(declare-fun lt!596217 () ListLongMap!21987)

(assert (=> d!144803 (= res!894495 (contains!9196 lt!596217 (_1!12172 (tuple2!24323 lt!596163 zeroValue!1245))))))

(declare-fun lt!596214 () List!31464)

(assert (=> d!144803 (= lt!596217 (ListLongMap!21988 lt!596214))))

(declare-fun lt!596216 () Unit!44074)

(declare-fun lt!596215 () Unit!44074)

(assert (=> d!144803 (= lt!596216 lt!596215)))

(assert (=> d!144803 (= (getValueByKey!716 lt!596214 (_1!12172 (tuple2!24323 lt!596163 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596163 zeroValue!1245))))))

(assert (=> d!144803 (= lt!596215 (lemmaContainsTupThenGetReturnValue!366 lt!596214 (_1!12172 (tuple2!24323 lt!596163 zeroValue!1245)) (_2!12172 (tuple2!24323 lt!596163 zeroValue!1245))))))

(assert (=> d!144803 (= lt!596214 (insertStrictlySorted!495 (toList!11009 lt!596145) (_1!12172 (tuple2!24323 lt!596163 zeroValue!1245)) (_2!12172 (tuple2!24323 lt!596163 zeroValue!1245))))))

(assert (=> d!144803 (= (+!4872 lt!596145 (tuple2!24323 lt!596163 zeroValue!1245)) lt!596217)))

(declare-fun b!1348616 () Bool)

(declare-fun res!894496 () Bool)

(assert (=> b!1348616 (=> (not res!894496) (not e!767425))))

(assert (=> b!1348616 (= res!894496 (= (getValueByKey!716 (toList!11009 lt!596217) (_1!12172 (tuple2!24323 lt!596163 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596163 zeroValue!1245)))))))

(declare-fun b!1348617 () Bool)

(assert (=> b!1348617 (= e!767425 (contains!9199 (toList!11009 lt!596217) (tuple2!24323 lt!596163 zeroValue!1245)))))

(assert (= (and d!144803 res!894495) b!1348616))

(assert (= (and b!1348616 res!894496) b!1348617))

(declare-fun m!1235927 () Bool)

(assert (=> d!144803 m!1235927))

(declare-fun m!1235929 () Bool)

(assert (=> d!144803 m!1235929))

(declare-fun m!1235931 () Bool)

(assert (=> d!144803 m!1235931))

(declare-fun m!1235933 () Bool)

(assert (=> d!144803 m!1235933))

(declare-fun m!1235935 () Bool)

(assert (=> b!1348616 m!1235935))

(declare-fun m!1235937 () Bool)

(assert (=> b!1348617 m!1235937))

(assert (=> b!1348521 d!144803))

(declare-fun d!144805 () Bool)

(assert (=> d!144805 (contains!9196 (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245)) lt!596159)))

(declare-fun lt!596220 () Unit!44074)

(declare-fun choose!1976 (ListLongMap!21987 (_ BitVec 64) V!55121 (_ BitVec 64)) Unit!44074)

(assert (=> d!144805 (= lt!596220 (choose!1976 lt!596164 lt!596147 zeroValue!1245 lt!596159))))

(assert (=> d!144805 (contains!9196 lt!596164 lt!596159)))

(assert (=> d!144805 (= (addStillContains!1213 lt!596164 lt!596147 zeroValue!1245 lt!596159) lt!596220)))

(declare-fun bs!38632 () Bool)

(assert (= bs!38632 d!144805))

(assert (=> bs!38632 m!1235737))

(assert (=> bs!38632 m!1235737))

(assert (=> bs!38632 m!1235739))

(declare-fun m!1235939 () Bool)

(assert (=> bs!38632 m!1235939))

(declare-fun m!1235941 () Bool)

(assert (=> bs!38632 m!1235941))

(assert (=> b!1348521 d!144805))

(declare-fun d!144807 () Bool)

(assert (=> d!144807 (= (apply!1046 (+!4872 lt!596157 (tuple2!24323 lt!596152 minValue!1245)) lt!596160) (get!22456 (getValueByKey!716 (toList!11009 (+!4872 lt!596157 (tuple2!24323 lt!596152 minValue!1245))) lt!596160)))))

(declare-fun bs!38633 () Bool)

(assert (= bs!38633 d!144807))

(declare-fun m!1235943 () Bool)

(assert (=> bs!38633 m!1235943))

(assert (=> bs!38633 m!1235943))

(declare-fun m!1235945 () Bool)

(assert (=> bs!38633 m!1235945))

(assert (=> b!1348521 d!144807))

(declare-fun d!144809 () Bool)

(assert (=> d!144809 (= (apply!1046 (+!4872 lt!596151 (tuple2!24323 lt!596156 minValue!1245)) lt!596146) (get!22456 (getValueByKey!716 (toList!11009 (+!4872 lt!596151 (tuple2!24323 lt!596156 minValue!1245))) lt!596146)))))

(declare-fun bs!38634 () Bool)

(assert (= bs!38634 d!144809))

(declare-fun m!1235947 () Bool)

(assert (=> bs!38634 m!1235947))

(assert (=> bs!38634 m!1235947))

(declare-fun m!1235949 () Bool)

(assert (=> bs!38634 m!1235949))

(assert (=> b!1348521 d!144809))

(declare-fun d!144811 () Bool)

(declare-fun e!767426 () Bool)

(assert (=> d!144811 e!767426))

(declare-fun res!894497 () Bool)

(assert (=> d!144811 (=> (not res!894497) (not e!767426))))

(declare-fun lt!596224 () ListLongMap!21987)

(assert (=> d!144811 (= res!894497 (contains!9196 lt!596224 (_1!12172 (tuple2!24323 lt!596147 zeroValue!1245))))))

(declare-fun lt!596221 () List!31464)

(assert (=> d!144811 (= lt!596224 (ListLongMap!21988 lt!596221))))

(declare-fun lt!596223 () Unit!44074)

(declare-fun lt!596222 () Unit!44074)

(assert (=> d!144811 (= lt!596223 lt!596222)))

(assert (=> d!144811 (= (getValueByKey!716 lt!596221 (_1!12172 (tuple2!24323 lt!596147 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596147 zeroValue!1245))))))

(assert (=> d!144811 (= lt!596222 (lemmaContainsTupThenGetReturnValue!366 lt!596221 (_1!12172 (tuple2!24323 lt!596147 zeroValue!1245)) (_2!12172 (tuple2!24323 lt!596147 zeroValue!1245))))))

(assert (=> d!144811 (= lt!596221 (insertStrictlySorted!495 (toList!11009 lt!596164) (_1!12172 (tuple2!24323 lt!596147 zeroValue!1245)) (_2!12172 (tuple2!24323 lt!596147 zeroValue!1245))))))

(assert (=> d!144811 (= (+!4872 lt!596164 (tuple2!24323 lt!596147 zeroValue!1245)) lt!596224)))

(declare-fun b!1348619 () Bool)

(declare-fun res!894498 () Bool)

(assert (=> b!1348619 (=> (not res!894498) (not e!767426))))

(assert (=> b!1348619 (= res!894498 (= (getValueByKey!716 (toList!11009 lt!596224) (_1!12172 (tuple2!24323 lt!596147 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 lt!596147 zeroValue!1245)))))))

(declare-fun b!1348620 () Bool)

(assert (=> b!1348620 (= e!767426 (contains!9199 (toList!11009 lt!596224) (tuple2!24323 lt!596147 zeroValue!1245)))))

(assert (= (and d!144811 res!894497) b!1348619))

(assert (= (and b!1348619 res!894498) b!1348620))

(declare-fun m!1235951 () Bool)

(assert (=> d!144811 m!1235951))

(declare-fun m!1235953 () Bool)

(assert (=> d!144811 m!1235953))

(declare-fun m!1235955 () Bool)

(assert (=> d!144811 m!1235955))

(declare-fun m!1235957 () Bool)

(assert (=> d!144811 m!1235957))

(declare-fun m!1235959 () Bool)

(assert (=> b!1348619 m!1235959))

(declare-fun m!1235961 () Bool)

(assert (=> b!1348620 m!1235961))

(assert (=> b!1348521 d!144811))

(declare-fun b!1348621 () Bool)

(declare-fun lt!596228 () Unit!44074)

(declare-fun lt!596230 () Unit!44074)

(assert (=> b!1348621 (= lt!596228 lt!596230)))

(declare-fun lt!596226 () V!55121)

(declare-fun lt!596227 () (_ BitVec 64))

(declare-fun lt!596229 () (_ BitVec 64))

(declare-fun lt!596231 () ListLongMap!21987)

(assert (=> b!1348621 (not (contains!9196 (+!4872 lt!596231 (tuple2!24323 lt!596227 lt!596226)) lt!596229))))

(assert (=> b!1348621 (= lt!596230 (addStillNotContains!502 lt!596231 lt!596227 lt!596226 lt!596229))))

(assert (=> b!1348621 (= lt!596229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348621 (= lt!596226 (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348621 (= lt!596227 (select (arr!44435 _keys!1571) from!1960))))

(declare-fun call!65134 () ListLongMap!21987)

(assert (=> b!1348621 (= lt!596231 call!65134)))

(declare-fun e!767430 () ListLongMap!21987)

(assert (=> b!1348621 (= e!767430 (+!4872 call!65134 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348622 () Bool)

(declare-fun e!767433 () Bool)

(declare-fun lt!596225 () ListLongMap!21987)

(assert (=> b!1348622 (= e!767433 (= lt!596225 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65131 () Bool)

(assert (=> bm!65131 (= call!65134 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348623 () Bool)

(declare-fun res!894500 () Bool)

(declare-fun e!767428 () Bool)

(assert (=> b!1348623 (=> (not res!894500) (not e!767428))))

(assert (=> b!1348623 (= res!894500 (not (contains!9196 lt!596225 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348624 () Bool)

(declare-fun e!767431 () Bool)

(assert (=> b!1348624 (= e!767431 (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)))))

(assert (=> b!1348624 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1348625 () Bool)

(assert (=> b!1348625 (= e!767433 (isEmpty!1095 lt!596225))))

(declare-fun b!1348626 () Bool)

(declare-fun e!767429 () ListLongMap!21987)

(assert (=> b!1348626 (= e!767429 e!767430)))

(declare-fun c!126758 () Bool)

(assert (=> b!1348626 (= c!126758 (validKeyInArray!0 (select (arr!44435 _keys!1571) from!1960)))))

(declare-fun b!1348627 () Bool)

(declare-fun e!767427 () Bool)

(assert (=> b!1348627 (= e!767428 e!767427)))

(declare-fun c!126755 () Bool)

(assert (=> b!1348627 (= c!126755 e!767431)))

(declare-fun res!894499 () Bool)

(assert (=> b!1348627 (=> (not res!894499) (not e!767431))))

(assert (=> b!1348627 (= res!894499 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1348628 () Bool)

(assert (=> b!1348628 (= e!767429 (ListLongMap!21988 Nil!31461))))

(declare-fun d!144813 () Bool)

(assert (=> d!144813 e!767428))

(declare-fun res!894502 () Bool)

(assert (=> d!144813 (=> (not res!894502) (not e!767428))))

(assert (=> d!144813 (= res!894502 (not (contains!9196 lt!596225 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144813 (= lt!596225 e!767429)))

(declare-fun c!126756 () Bool)

(assert (=> d!144813 (= c!126756 (bvsge from!1960 (size!44986 _keys!1571)))))

(assert (=> d!144813 (validMask!0 mask!1977)))

(assert (=> d!144813 (= (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596225)))

(declare-fun b!1348629 () Bool)

(assert (=> b!1348629 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(assert (=> b!1348629 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44987 _values!1303)))))

(declare-fun e!767432 () Bool)

(assert (=> b!1348629 (= e!767432 (= (apply!1046 lt!596225 (select (arr!44435 _keys!1571) from!1960)) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348630 () Bool)

(assert (=> b!1348630 (= e!767427 e!767433)))

(declare-fun c!126757 () Bool)

(assert (=> b!1348630 (= c!126757 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1348631 () Bool)

(assert (=> b!1348631 (= e!767427 e!767432)))

(assert (=> b!1348631 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun res!894501 () Bool)

(assert (=> b!1348631 (= res!894501 (contains!9196 lt!596225 (select (arr!44435 _keys!1571) from!1960)))))

(assert (=> b!1348631 (=> (not res!894501) (not e!767432))))

(declare-fun b!1348632 () Bool)

(assert (=> b!1348632 (= e!767430 call!65134)))

(assert (= (and d!144813 c!126756) b!1348628))

(assert (= (and d!144813 (not c!126756)) b!1348626))

(assert (= (and b!1348626 c!126758) b!1348621))

(assert (= (and b!1348626 (not c!126758)) b!1348632))

(assert (= (or b!1348621 b!1348632) bm!65131))

(assert (= (and d!144813 res!894502) b!1348623))

(assert (= (and b!1348623 res!894500) b!1348627))

(assert (= (and b!1348627 res!894499) b!1348624))

(assert (= (and b!1348627 c!126755) b!1348631))

(assert (= (and b!1348627 (not c!126755)) b!1348630))

(assert (= (and b!1348631 res!894501) b!1348629))

(assert (= (and b!1348630 c!126757) b!1348622))

(assert (= (and b!1348630 (not c!126757)) b!1348625))

(declare-fun b_lambda!24575 () Bool)

(assert (=> (not b_lambda!24575) (not b!1348621)))

(assert (=> b!1348621 t!46046))

(declare-fun b_and!50825 () Bool)

(assert (= b_and!50823 (and (=> t!46046 result!25873) b_and!50825)))

(declare-fun b_lambda!24577 () Bool)

(assert (=> (not b_lambda!24577) (not b!1348629)))

(assert (=> b!1348629 t!46046))

(declare-fun b_and!50827 () Bool)

(assert (= b_and!50825 (and (=> t!46046 result!25873) b_and!50827)))

(declare-fun m!1235963 () Bool)

(assert (=> b!1348623 m!1235963))

(assert (=> b!1348626 m!1235555))

(assert (=> b!1348626 m!1235555))

(assert (=> b!1348626 m!1235561))

(assert (=> b!1348621 m!1235555))

(assert (=> b!1348621 m!1235549))

(declare-fun m!1235965 () Bool)

(assert (=> b!1348621 m!1235965))

(assert (=> b!1348621 m!1235547))

(assert (=> b!1348621 m!1235549))

(assert (=> b!1348621 m!1235551))

(declare-fun m!1235967 () Bool)

(assert (=> b!1348621 m!1235967))

(declare-fun m!1235969 () Bool)

(assert (=> b!1348621 m!1235969))

(assert (=> b!1348621 m!1235967))

(declare-fun m!1235971 () Bool)

(assert (=> b!1348621 m!1235971))

(assert (=> b!1348621 m!1235547))

(assert (=> b!1348624 m!1235555))

(assert (=> b!1348624 m!1235555))

(assert (=> b!1348624 m!1235561))

(assert (=> b!1348631 m!1235555))

(assert (=> b!1348631 m!1235555))

(declare-fun m!1235973 () Bool)

(assert (=> b!1348631 m!1235973))

(declare-fun m!1235975 () Bool)

(assert (=> bm!65131 m!1235975))

(assert (=> b!1348622 m!1235975))

(declare-fun m!1235977 () Bool)

(assert (=> d!144813 m!1235977))

(assert (=> d!144813 m!1235567))

(assert (=> b!1348629 m!1235555))

(assert (=> b!1348629 m!1235549))

(assert (=> b!1348629 m!1235547))

(assert (=> b!1348629 m!1235549))

(assert (=> b!1348629 m!1235551))

(assert (=> b!1348629 m!1235555))

(declare-fun m!1235979 () Bool)

(assert (=> b!1348629 m!1235979))

(assert (=> b!1348629 m!1235547))

(declare-fun m!1235981 () Bool)

(assert (=> b!1348625 m!1235981))

(assert (=> b!1348521 d!144813))

(declare-fun d!144815 () Bool)

(assert (=> d!144815 (= (apply!1046 (+!4872 lt!596151 (tuple2!24323 lt!596156 minValue!1245)) lt!596146) (apply!1046 lt!596151 lt!596146))))

(declare-fun lt!596232 () Unit!44074)

(assert (=> d!144815 (= lt!596232 (choose!1975 lt!596151 lt!596156 minValue!1245 lt!596146))))

(declare-fun e!767434 () Bool)

(assert (=> d!144815 e!767434))

(declare-fun res!894503 () Bool)

(assert (=> d!144815 (=> (not res!894503) (not e!767434))))

(assert (=> d!144815 (= res!894503 (contains!9196 lt!596151 lt!596146))))

(assert (=> d!144815 (= (addApplyDifferent!575 lt!596151 lt!596156 minValue!1245 lt!596146) lt!596232)))

(declare-fun b!1348633 () Bool)

(assert (=> b!1348633 (= e!767434 (not (= lt!596146 lt!596156)))))

(assert (= (and d!144815 res!894503) b!1348633))

(assert (=> d!144815 m!1235743))

(assert (=> d!144815 m!1235747))

(assert (=> d!144815 m!1235747))

(assert (=> d!144815 m!1235759))

(declare-fun m!1235983 () Bool)

(assert (=> d!144815 m!1235983))

(declare-fun m!1235985 () Bool)

(assert (=> d!144815 m!1235985))

(assert (=> b!1348521 d!144815))

(declare-fun d!144817 () Bool)

(assert (=> d!144817 (= (apply!1046 (+!4872 lt!596157 (tuple2!24323 lt!596152 minValue!1245)) lt!596160) (apply!1046 lt!596157 lt!596160))))

(declare-fun lt!596233 () Unit!44074)

(assert (=> d!144817 (= lt!596233 (choose!1975 lt!596157 lt!596152 minValue!1245 lt!596160))))

(declare-fun e!767435 () Bool)

(assert (=> d!144817 e!767435))

(declare-fun res!894504 () Bool)

(assert (=> d!144817 (=> (not res!894504) (not e!767435))))

(assert (=> d!144817 (= res!894504 (contains!9196 lt!596157 lt!596160))))

(assert (=> d!144817 (= (addApplyDifferent!575 lt!596157 lt!596152 minValue!1245 lt!596160) lt!596233)))

(declare-fun b!1348634 () Bool)

(assert (=> b!1348634 (= e!767435 (not (= lt!596160 lt!596152)))))

(assert (= (and d!144817 res!894504) b!1348634))

(assert (=> d!144817 m!1235761))

(assert (=> d!144817 m!1235741))

(assert (=> d!144817 m!1235741))

(assert (=> d!144817 m!1235757))

(declare-fun m!1235987 () Bool)

(assert (=> d!144817 m!1235987))

(declare-fun m!1235989 () Bool)

(assert (=> d!144817 m!1235989))

(assert (=> b!1348521 d!144817))

(declare-fun d!144819 () Bool)

(assert (=> d!144819 (= (apply!1046 lt!596151 lt!596146) (get!22456 (getValueByKey!716 (toList!11009 lt!596151) lt!596146)))))

(declare-fun bs!38635 () Bool)

(assert (= bs!38635 d!144819))

(declare-fun m!1235991 () Bool)

(assert (=> bs!38635 m!1235991))

(assert (=> bs!38635 m!1235991))

(declare-fun m!1235993 () Bool)

(assert (=> bs!38635 m!1235993))

(assert (=> b!1348521 d!144819))

(declare-fun d!144821 () Bool)

(declare-fun res!894509 () Bool)

(declare-fun e!767440 () Bool)

(assert (=> d!144821 (=> res!894509 e!767440)))

(assert (=> d!144821 (= res!894509 (and ((_ is Cons!31460) (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144821 (= (containsKey!742 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!767440)))

(declare-fun b!1348639 () Bool)

(declare-fun e!767441 () Bool)

(assert (=> b!1348639 (= e!767440 e!767441)))

(declare-fun res!894510 () Bool)

(assert (=> b!1348639 (=> (not res!894510) (not e!767441))))

(assert (=> b!1348639 (= res!894510 (and (or (not ((_ is Cons!31460) (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) (bvsle (_1!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)) ((_ is Cons!31460) (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (bvslt (_1!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(declare-fun b!1348640 () Bool)

(assert (=> b!1348640 (= e!767441 (containsKey!742 (t!46048 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(assert (= (and d!144821 (not res!894509)) b!1348639))

(assert (= (and b!1348639 res!894510) b!1348640))

(declare-fun m!1235995 () Bool)

(assert (=> b!1348640 m!1235995))

(assert (=> d!144745 d!144821))

(declare-fun d!144823 () Bool)

(assert (=> d!144823 (isDefined!525 (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596236 () Unit!44074)

(declare-fun choose!1977 (List!31464 (_ BitVec 64)) Unit!44074)

(assert (=> d!144823 (= lt!596236 (choose!1977 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!767444 () Bool)

(assert (=> d!144823 e!767444))

(declare-fun res!894513 () Bool)

(assert (=> d!144823 (=> (not res!894513) (not e!767444))))

(declare-fun isStrictlySorted!870 (List!31464) Bool)

(assert (=> d!144823 (= res!894513 (isStrictlySorted!870 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144823 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596236)))

(declare-fun b!1348643 () Bool)

(assert (=> b!1348643 (= e!767444 (containsKey!742 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144823 res!894513) b!1348643))

(assert (=> d!144823 m!1235723))

(assert (=> d!144823 m!1235723))

(assert (=> d!144823 m!1235725))

(declare-fun m!1235997 () Bool)

(assert (=> d!144823 m!1235997))

(declare-fun m!1235999 () Bool)

(assert (=> d!144823 m!1235999))

(assert (=> b!1348643 m!1235719))

(assert (=> b!1348465 d!144823))

(declare-fun d!144825 () Bool)

(declare-fun isEmpty!1096 (Option!767) Bool)

(assert (=> d!144825 (= (isDefined!525 (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1096 (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38636 () Bool)

(assert (= bs!38636 d!144825))

(assert (=> bs!38636 m!1235723))

(declare-fun m!1236001 () Bool)

(assert (=> bs!38636 m!1236001))

(assert (=> b!1348465 d!144825))

(declare-fun b!1348644 () Bool)

(declare-fun e!767445 () Option!767)

(assert (=> b!1348644 (= e!767445 (Some!766 (_2!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1348647 () Bool)

(declare-fun e!767446 () Option!767)

(assert (=> b!1348647 (= e!767446 None!765)))

(declare-fun c!126759 () Bool)

(declare-fun d!144827 () Bool)

(assert (=> d!144827 (= c!126759 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144827 (= (getValueByKey!716 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767445)))

(declare-fun b!1348645 () Bool)

(assert (=> b!1348645 (= e!767445 e!767446)))

(declare-fun c!126760 () Bool)

(assert (=> b!1348645 (= c!126760 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1348646 () Bool)

(assert (=> b!1348646 (= e!767446 (getValueByKey!716 (t!46048 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144827 c!126759) b!1348644))

(assert (= (and d!144827 (not c!126759)) b!1348645))

(assert (= (and b!1348645 c!126760) b!1348646))

(assert (= (and b!1348645 (not c!126760)) b!1348647))

(declare-fun m!1236003 () Bool)

(assert (=> b!1348646 m!1236003))

(assert (=> b!1348465 d!144827))

(declare-fun b!1348648 () Bool)

(declare-fun e!767447 () Option!767)

(assert (=> b!1348648 (= e!767447 (Some!766 (_2!12172 (h!32678 (toList!11009 lt!596048)))))))

(declare-fun b!1348651 () Bool)

(declare-fun e!767448 () Option!767)

(assert (=> b!1348651 (= e!767448 None!765)))

(declare-fun d!144829 () Bool)

(declare-fun c!126761 () Bool)

(assert (=> d!144829 (= c!126761 (and ((_ is Cons!31460) (toList!11009 lt!596048)) (= (_1!12172 (h!32678 (toList!11009 lt!596048))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144829 (= (getValueByKey!716 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767447)))

(declare-fun b!1348649 () Bool)

(assert (=> b!1348649 (= e!767447 e!767448)))

(declare-fun c!126762 () Bool)

(assert (=> b!1348649 (= c!126762 (and ((_ is Cons!31460) (toList!11009 lt!596048)) (not (= (_1!12172 (h!32678 (toList!11009 lt!596048))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1348650 () Bool)

(assert (=> b!1348650 (= e!767448 (getValueByKey!716 (t!46048 (toList!11009 lt!596048)) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144829 c!126761) b!1348648))

(assert (= (and d!144829 (not c!126761)) b!1348649))

(assert (= (and b!1348649 c!126762) b!1348650))

(assert (= (and b!1348649 (not c!126762)) b!1348651))

(declare-fun m!1236005 () Bool)

(assert (=> b!1348650 m!1236005))

(assert (=> b!1348398 d!144829))

(assert (=> b!1348467 d!144825))

(assert (=> b!1348467 d!144827))

(declare-fun d!144831 () Bool)

(declare-fun e!767449 () Bool)

(assert (=> d!144831 e!767449))

(declare-fun res!894514 () Bool)

(assert (=> d!144831 (=> res!894514 e!767449)))

(declare-fun lt!596239 () Bool)

(assert (=> d!144831 (= res!894514 (not lt!596239))))

(declare-fun lt!596238 () Bool)

(assert (=> d!144831 (= lt!596239 lt!596238)))

(declare-fun lt!596237 () Unit!44074)

(declare-fun e!767450 () Unit!44074)

(assert (=> d!144831 (= lt!596237 e!767450)))

(declare-fun c!126763 () Bool)

(assert (=> d!144831 (= c!126763 lt!596238)))

(assert (=> d!144831 (= lt!596238 (containsKey!742 (toList!11009 lt!596162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144831 (= (contains!9196 lt!596162 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596239)))

(declare-fun b!1348652 () Bool)

(declare-fun lt!596240 () Unit!44074)

(assert (=> b!1348652 (= e!767450 lt!596240)))

(assert (=> b!1348652 (= lt!596240 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348652 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348653 () Bool)

(declare-fun Unit!44083 () Unit!44074)

(assert (=> b!1348653 (= e!767450 Unit!44083)))

(declare-fun b!1348654 () Bool)

(assert (=> b!1348654 (= e!767449 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144831 c!126763) b!1348652))

(assert (= (and d!144831 (not c!126763)) b!1348653))

(assert (= (and d!144831 (not res!894514)) b!1348654))

(declare-fun m!1236007 () Bool)

(assert (=> d!144831 m!1236007))

(declare-fun m!1236009 () Bool)

(assert (=> b!1348652 m!1236009))

(declare-fun m!1236011 () Bool)

(assert (=> b!1348652 m!1236011))

(assert (=> b!1348652 m!1236011))

(declare-fun m!1236013 () Bool)

(assert (=> b!1348652 m!1236013))

(assert (=> b!1348654 m!1236011))

(assert (=> b!1348654 m!1236011))

(assert (=> b!1348654 m!1236013))

(assert (=> bm!65122 d!144831))

(declare-fun d!144833 () Bool)

(declare-fun e!767451 () Bool)

(assert (=> d!144833 e!767451))

(declare-fun res!894515 () Bool)

(assert (=> d!144833 (=> res!894515 e!767451)))

(declare-fun lt!596243 () Bool)

(assert (=> d!144833 (= res!894515 (not lt!596243))))

(declare-fun lt!596242 () Bool)

(assert (=> d!144833 (= lt!596243 lt!596242)))

(declare-fun lt!596241 () Unit!44074)

(declare-fun e!767452 () Unit!44074)

(assert (=> d!144833 (= lt!596241 e!767452)))

(declare-fun c!126764 () Bool)

(assert (=> d!144833 (= c!126764 lt!596242)))

(assert (=> d!144833 (= lt!596242 (containsKey!742 (toList!11009 lt!596162) (select (arr!44435 _keys!1571) from!1960)))))

(assert (=> d!144833 (= (contains!9196 lt!596162 (select (arr!44435 _keys!1571) from!1960)) lt!596243)))

(declare-fun b!1348655 () Bool)

(declare-fun lt!596244 () Unit!44074)

(assert (=> b!1348655 (= e!767452 lt!596244)))

(assert (=> b!1348655 (= lt!596244 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596162) (select (arr!44435 _keys!1571) from!1960)))))

(assert (=> b!1348655 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) (select (arr!44435 _keys!1571) from!1960)))))

(declare-fun b!1348656 () Bool)

(declare-fun Unit!44084 () Unit!44074)

(assert (=> b!1348656 (= e!767452 Unit!44084)))

(declare-fun b!1348657 () Bool)

(assert (=> b!1348657 (= e!767451 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) (select (arr!44435 _keys!1571) from!1960))))))

(assert (= (and d!144833 c!126764) b!1348655))

(assert (= (and d!144833 (not c!126764)) b!1348656))

(assert (= (and d!144833 (not res!894515)) b!1348657))

(assert (=> d!144833 m!1235555))

(declare-fun m!1236015 () Bool)

(assert (=> d!144833 m!1236015))

(assert (=> b!1348655 m!1235555))

(declare-fun m!1236017 () Bool)

(assert (=> b!1348655 m!1236017))

(assert (=> b!1348655 m!1235555))

(declare-fun m!1236019 () Bool)

(assert (=> b!1348655 m!1236019))

(assert (=> b!1348655 m!1236019))

(declare-fun m!1236021 () Bool)

(assert (=> b!1348655 m!1236021))

(assert (=> b!1348657 m!1235555))

(assert (=> b!1348657 m!1236019))

(assert (=> b!1348657 m!1236019))

(assert (=> b!1348657 m!1236021))

(assert (=> b!1348516 d!144833))

(declare-fun d!144835 () Bool)

(declare-fun e!767453 () Bool)

(assert (=> d!144835 e!767453))

(declare-fun res!894516 () Bool)

(assert (=> d!144835 (=> res!894516 e!767453)))

(declare-fun lt!596247 () Bool)

(assert (=> d!144835 (= res!894516 (not lt!596247))))

(declare-fun lt!596246 () Bool)

(assert (=> d!144835 (= lt!596247 lt!596246)))

(declare-fun lt!596245 () Unit!44074)

(declare-fun e!767454 () Unit!44074)

(assert (=> d!144835 (= lt!596245 e!767454)))

(declare-fun c!126765 () Bool)

(assert (=> d!144835 (= c!126765 lt!596246)))

(assert (=> d!144835 (= lt!596246 (containsKey!742 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144835 (= (contains!9196 lt!596048 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596247)))

(declare-fun b!1348658 () Bool)

(declare-fun lt!596248 () Unit!44074)

(assert (=> b!1348658 (= e!767454 lt!596248)))

(assert (=> b!1348658 (= lt!596248 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1348658 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348659 () Bool)

(declare-fun Unit!44085 () Unit!44074)

(assert (=> b!1348659 (= e!767454 Unit!44085)))

(declare-fun b!1348660 () Bool)

(assert (=> b!1348660 (= e!767453 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596048) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144835 c!126765) b!1348658))

(assert (= (and d!144835 (not c!126765)) b!1348659))

(assert (= (and d!144835 (not res!894516)) b!1348660))

(declare-fun m!1236023 () Bool)

(assert (=> d!144835 m!1236023))

(declare-fun m!1236025 () Bool)

(assert (=> b!1348658 m!1236025))

(assert (=> b!1348658 m!1235651))

(assert (=> b!1348658 m!1235651))

(declare-fun m!1236027 () Bool)

(assert (=> b!1348658 m!1236027))

(assert (=> b!1348660 m!1235651))

(assert (=> b!1348660 m!1235651))

(assert (=> b!1348660 m!1236027))

(assert (=> d!144739 d!144835))

(declare-fun b!1348661 () Bool)

(declare-fun e!767455 () Option!767)

(assert (=> b!1348661 (= e!767455 (Some!766 (_2!12172 (h!32678 lt!596045))))))

(declare-fun b!1348664 () Bool)

(declare-fun e!767456 () Option!767)

(assert (=> b!1348664 (= e!767456 None!765)))

(declare-fun c!126766 () Bool)

(declare-fun d!144837 () Bool)

(assert (=> d!144837 (= c!126766 (and ((_ is Cons!31460) lt!596045) (= (_1!12172 (h!32678 lt!596045)) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144837 (= (getValueByKey!716 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767455)))

(declare-fun b!1348662 () Bool)

(assert (=> b!1348662 (= e!767455 e!767456)))

(declare-fun c!126767 () Bool)

(assert (=> b!1348662 (= c!126767 (and ((_ is Cons!31460) lt!596045) (not (= (_1!12172 (h!32678 lt!596045)) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1348663 () Bool)

(assert (=> b!1348663 (= e!767456 (getValueByKey!716 (t!46048 lt!596045) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144837 c!126766) b!1348661))

(assert (= (and d!144837 (not c!126766)) b!1348662))

(assert (= (and b!1348662 c!126767) b!1348663))

(assert (= (and b!1348662 (not c!126767)) b!1348664))

(declare-fun m!1236029 () Bool)

(assert (=> b!1348663 m!1236029))

(assert (=> d!144739 d!144837))

(declare-fun d!144839 () Bool)

(assert (=> d!144839 (= (getValueByKey!716 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596251 () Unit!44074)

(declare-fun choose!1978 (List!31464 (_ BitVec 64) V!55121) Unit!44074)

(assert (=> d!144839 (= lt!596251 (choose!1978 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!767459 () Bool)

(assert (=> d!144839 e!767459))

(declare-fun res!894521 () Bool)

(assert (=> d!144839 (=> (not res!894521) (not e!767459))))

(assert (=> d!144839 (= res!894521 (isStrictlySorted!870 lt!596045))))

(assert (=> d!144839 (= (lemmaContainsTupThenGetReturnValue!366 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596251)))

(declare-fun b!1348669 () Bool)

(declare-fun res!894522 () Bool)

(assert (=> b!1348669 (=> (not res!894522) (not e!767459))))

(assert (=> b!1348669 (= res!894522 (containsKey!742 lt!596045 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348670 () Bool)

(assert (=> b!1348670 (= e!767459 (contains!9199 lt!596045 (tuple2!24323 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144839 res!894521) b!1348669))

(assert (= (and b!1348669 res!894522) b!1348670))

(assert (=> d!144839 m!1235645))

(declare-fun m!1236031 () Bool)

(assert (=> d!144839 m!1236031))

(declare-fun m!1236033 () Bool)

(assert (=> d!144839 m!1236033))

(declare-fun m!1236035 () Bool)

(assert (=> b!1348669 m!1236035))

(declare-fun m!1236037 () Bool)

(assert (=> b!1348670 m!1236037))

(assert (=> d!144739 d!144839))

(declare-fun bm!65138 () Bool)

(declare-fun call!65141 () List!31464)

(declare-fun call!65143 () List!31464)

(assert (=> bm!65138 (= call!65141 call!65143)))

(declare-fun b!1348691 () Bool)

(declare-fun e!767474 () List!31464)

(assert (=> b!1348691 (= e!767474 call!65141)))

(declare-fun b!1348692 () Bool)

(declare-fun e!767471 () List!31464)

(declare-fun call!65142 () List!31464)

(assert (=> b!1348692 (= e!767471 call!65142)))

(declare-fun e!767470 () List!31464)

(declare-fun b!1348693 () Bool)

(assert (=> b!1348693 (= e!767470 (insertStrictlySorted!495 (t!46048 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!144841 () Bool)

(declare-fun e!767472 () Bool)

(assert (=> d!144841 e!767472))

(declare-fun res!894528 () Bool)

(assert (=> d!144841 (=> (not res!894528) (not e!767472))))

(declare-fun lt!596254 () List!31464)

(assert (=> d!144841 (= res!894528 (isStrictlySorted!870 lt!596254))))

(declare-fun e!767473 () List!31464)

(assert (=> d!144841 (= lt!596254 e!767473)))

(declare-fun c!126779 () Bool)

(assert (=> d!144841 (= c!126779 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12172 (h!32678 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144841 (isStrictlySorted!870 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!144841 (= (insertStrictlySorted!495 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596254)))

(declare-fun b!1348694 () Bool)

(assert (=> b!1348694 (= e!767472 (contains!9199 lt!596254 (tuple2!24323 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348695 () Bool)

(assert (=> b!1348695 (= e!767471 call!65142)))

(declare-fun bm!65139 () Bool)

(assert (=> bm!65139 (= call!65142 call!65141)))

(declare-fun b!1348696 () Bool)

(declare-fun c!126778 () Bool)

(assert (=> b!1348696 (= c!126778 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12172 (h!32678 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1348696 (= e!767474 e!767471)))

(declare-fun c!126777 () Bool)

(declare-fun b!1348697 () Bool)

(assert (=> b!1348697 (= e!767470 (ite c!126777 (t!46048 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126778 (Cons!31460 (h!32678 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46048 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31461)))))

(declare-fun b!1348698 () Bool)

(declare-fun res!894527 () Bool)

(assert (=> b!1348698 (=> (not res!894527) (not e!767472))))

(assert (=> b!1348698 (= res!894527 (containsKey!742 lt!596254 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348699 () Bool)

(assert (=> b!1348699 (= e!767473 e!767474)))

(assert (=> b!1348699 (= c!126777 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12172 (h!32678 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!65140 () Bool)

(declare-fun $colon$colon!671 (List!31464 tuple2!24322) List!31464)

(assert (=> bm!65140 (= call!65143 ($colon$colon!671 e!767470 (ite c!126779 (h!32678 (toList!11009 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24323 (_1!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12172 (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126776 () Bool)

(assert (=> bm!65140 (= c!126776 c!126779)))

(declare-fun b!1348700 () Bool)

(assert (=> b!1348700 (= e!767473 call!65143)))

(assert (= (and d!144841 c!126779) b!1348700))

(assert (= (and d!144841 (not c!126779)) b!1348699))

(assert (= (and b!1348699 c!126777) b!1348691))

(assert (= (and b!1348699 (not c!126777)) b!1348696))

(assert (= (and b!1348696 c!126778) b!1348692))

(assert (= (and b!1348696 (not c!126778)) b!1348695))

(assert (= (or b!1348692 b!1348695) bm!65139))

(assert (= (or b!1348691 bm!65139) bm!65138))

(assert (= (or b!1348700 bm!65138) bm!65140))

(assert (= (and bm!65140 c!126776) b!1348693))

(assert (= (and bm!65140 (not c!126776)) b!1348697))

(assert (= (and d!144841 res!894528) b!1348698))

(assert (= (and b!1348698 res!894527) b!1348694))

(declare-fun m!1236039 () Bool)

(assert (=> bm!65140 m!1236039))

(declare-fun m!1236041 () Bool)

(assert (=> b!1348694 m!1236041))

(declare-fun m!1236043 () Bool)

(assert (=> b!1348693 m!1236043))

(declare-fun m!1236045 () Bool)

(assert (=> d!144841 m!1236045))

(declare-fun m!1236047 () Bool)

(assert (=> d!144841 m!1236047))

(declare-fun m!1236049 () Bool)

(assert (=> b!1348698 m!1236049))

(assert (=> d!144739 d!144841))

(declare-fun d!144843 () Bool)

(assert (=> d!144843 (= (apply!1046 lt!596162 (select (arr!44435 _keys!1571) from!1960)) (get!22456 (getValueByKey!716 (toList!11009 lt!596162) (select (arr!44435 _keys!1571) from!1960))))))

(declare-fun bs!38637 () Bool)

(assert (= bs!38637 d!144843))

(assert (=> bs!38637 m!1235555))

(assert (=> bs!38637 m!1236019))

(assert (=> bs!38637 m!1236019))

(declare-fun m!1236051 () Bool)

(assert (=> bs!38637 m!1236051))

(assert (=> b!1348527 d!144843))

(assert (=> b!1348527 d!144741))

(declare-fun d!144845 () Bool)

(assert (=> d!144845 (arrayContainsKey!0 _keys!1571 lt!596092 #b00000000000000000000000000000000)))

(declare-fun lt!596257 () Unit!44074)

(declare-fun choose!13 (array!91967 (_ BitVec 64) (_ BitVec 32)) Unit!44074)

(assert (=> d!144845 (= lt!596257 (choose!13 _keys!1571 lt!596092 #b00000000000000000000000000000000))))

(assert (=> d!144845 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144845 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596092 #b00000000000000000000000000000000) lt!596257)))

(declare-fun bs!38638 () Bool)

(assert (= bs!38638 d!144845))

(assert (=> bs!38638 m!1235711))

(declare-fun m!1236053 () Bool)

(assert (=> bs!38638 m!1236053))

(assert (=> b!1348462 d!144845))

(declare-fun d!144847 () Bool)

(declare-fun res!894533 () Bool)

(declare-fun e!767479 () Bool)

(assert (=> d!144847 (=> res!894533 e!767479)))

(assert (=> d!144847 (= res!894533 (= (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) lt!596092))))

(assert (=> d!144847 (= (arrayContainsKey!0 _keys!1571 lt!596092 #b00000000000000000000000000000000) e!767479)))

(declare-fun b!1348705 () Bool)

(declare-fun e!767480 () Bool)

(assert (=> b!1348705 (= e!767479 e!767480)))

(declare-fun res!894534 () Bool)

(assert (=> b!1348705 (=> (not res!894534) (not e!767480))))

(assert (=> b!1348705 (= res!894534 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(declare-fun b!1348706 () Bool)

(assert (=> b!1348706 (= e!767480 (arrayContainsKey!0 _keys!1571 lt!596092 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144847 (not res!894533)) b!1348705))

(assert (= (and b!1348705 res!894534) b!1348706))

(assert (=> d!144847 m!1235707))

(declare-fun m!1236055 () Bool)

(assert (=> b!1348706 m!1236055))

(assert (=> b!1348462 d!144847))

(declare-fun b!1348719 () Bool)

(declare-fun e!767487 () SeekEntryResult!10012)

(declare-fun lt!596266 () SeekEntryResult!10012)

(assert (=> b!1348719 (= e!767487 (MissingZero!10012 (index!42421 lt!596266)))))

(declare-fun b!1348720 () Bool)

(declare-fun c!126786 () Bool)

(declare-fun lt!596265 () (_ BitVec 64))

(assert (=> b!1348720 (= c!126786 (= lt!596265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!767488 () SeekEntryResult!10012)

(assert (=> b!1348720 (= e!767488 e!767487)))

(declare-fun d!144849 () Bool)

(declare-fun lt!596264 () SeekEntryResult!10012)

(assert (=> d!144849 (and (or ((_ is Undefined!10012) lt!596264) (not ((_ is Found!10012) lt!596264)) (and (bvsge (index!42420 lt!596264) #b00000000000000000000000000000000) (bvslt (index!42420 lt!596264) (size!44986 _keys!1571)))) (or ((_ is Undefined!10012) lt!596264) ((_ is Found!10012) lt!596264) (not ((_ is MissingZero!10012) lt!596264)) (and (bvsge (index!42419 lt!596264) #b00000000000000000000000000000000) (bvslt (index!42419 lt!596264) (size!44986 _keys!1571)))) (or ((_ is Undefined!10012) lt!596264) ((_ is Found!10012) lt!596264) ((_ is MissingZero!10012) lt!596264) (not ((_ is MissingVacant!10012) lt!596264)) (and (bvsge (index!42422 lt!596264) #b00000000000000000000000000000000) (bvslt (index!42422 lt!596264) (size!44986 _keys!1571)))) (or ((_ is Undefined!10012) lt!596264) (ite ((_ is Found!10012) lt!596264) (= (select (arr!44435 _keys!1571) (index!42420 lt!596264)) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10012) lt!596264) (= (select (arr!44435 _keys!1571) (index!42419 lt!596264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10012) lt!596264) (= (select (arr!44435 _keys!1571) (index!42422 lt!596264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!767489 () SeekEntryResult!10012)

(assert (=> d!144849 (= lt!596264 e!767489)))

(declare-fun c!126787 () Bool)

(assert (=> d!144849 (= c!126787 (and ((_ is Intermediate!10012) lt!596266) (undefined!10824 lt!596266)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91967 (_ BitVec 32)) SeekEntryResult!10012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144849 (= lt!596266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144849 (validMask!0 mask!1977)))

(assert (=> d!144849 (= (seekEntryOrOpen!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596264)))

(declare-fun b!1348721 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91967 (_ BitVec 32)) SeekEntryResult!10012)

(assert (=> b!1348721 (= e!767487 (seekKeyOrZeroReturnVacant!0 (x!120538 lt!596266) (index!42421 lt!596266) (index!42421 lt!596266) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1348722 () Bool)

(assert (=> b!1348722 (= e!767488 (Found!10012 (index!42421 lt!596266)))))

(declare-fun b!1348723 () Bool)

(assert (=> b!1348723 (= e!767489 e!767488)))

(assert (=> b!1348723 (= lt!596265 (select (arr!44435 _keys!1571) (index!42421 lt!596266)))))

(declare-fun c!126788 () Bool)

(assert (=> b!1348723 (= c!126788 (= lt!596265 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348724 () Bool)

(assert (=> b!1348724 (= e!767489 Undefined!10012)))

(assert (= (and d!144849 c!126787) b!1348724))

(assert (= (and d!144849 (not c!126787)) b!1348723))

(assert (= (and b!1348723 c!126788) b!1348722))

(assert (= (and b!1348723 (not c!126788)) b!1348720))

(assert (= (and b!1348720 c!126786) b!1348719))

(assert (= (and b!1348720 (not c!126786)) b!1348721))

(declare-fun m!1236057 () Bool)

(assert (=> d!144849 m!1236057))

(assert (=> d!144849 m!1235707))

(declare-fun m!1236059 () Bool)

(assert (=> d!144849 m!1236059))

(declare-fun m!1236061 () Bool)

(assert (=> d!144849 m!1236061))

(declare-fun m!1236063 () Bool)

(assert (=> d!144849 m!1236063))

(assert (=> d!144849 m!1236059))

(assert (=> d!144849 m!1235707))

(declare-fun m!1236065 () Bool)

(assert (=> d!144849 m!1236065))

(assert (=> d!144849 m!1235567))

(assert (=> b!1348721 m!1235707))

(declare-fun m!1236067 () Bool)

(assert (=> b!1348721 m!1236067))

(declare-fun m!1236069 () Bool)

(assert (=> b!1348723 m!1236069))

(assert (=> b!1348462 d!144849))

(declare-fun b!1348725 () Bool)

(declare-fun e!767491 () Bool)

(declare-fun call!65144 () Bool)

(assert (=> b!1348725 (= e!767491 call!65144)))

(declare-fun b!1348726 () Bool)

(declare-fun e!767490 () Bool)

(assert (=> b!1348726 (= e!767490 e!767491)))

(declare-fun lt!596267 () (_ BitVec 64))

(assert (=> b!1348726 (= lt!596267 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596269 () Unit!44074)

(assert (=> b!1348726 (= lt!596269 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1348726 (arrayContainsKey!0 _keys!1571 lt!596267 #b00000000000000000000000000000000)))

(declare-fun lt!596268 () Unit!44074)

(assert (=> b!1348726 (= lt!596268 lt!596269)))

(declare-fun res!894535 () Bool)

(assert (=> b!1348726 (= res!894535 (= (seekEntryOrOpen!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1348726 (=> (not res!894535) (not e!767491))))

(declare-fun bm!65141 () Bool)

(assert (=> bm!65141 (= call!65144 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348727 () Bool)

(assert (=> b!1348727 (= e!767490 call!65144)))

(declare-fun d!144851 () Bool)

(declare-fun res!894536 () Bool)

(declare-fun e!767492 () Bool)

(assert (=> d!144851 (=> res!894536 e!767492)))

(assert (=> d!144851 (= res!894536 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> d!144851 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!767492)))

(declare-fun b!1348728 () Bool)

(assert (=> b!1348728 (= e!767492 e!767490)))

(declare-fun c!126789 () Bool)

(assert (=> b!1348728 (= c!126789 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144851 (not res!894536)) b!1348728))

(assert (= (and b!1348728 c!126789) b!1348726))

(assert (= (and b!1348728 (not c!126789)) b!1348727))

(assert (= (and b!1348726 res!894535) b!1348725))

(assert (= (or b!1348725 b!1348727) bm!65141))

(declare-fun m!1236071 () Bool)

(assert (=> b!1348726 m!1236071))

(declare-fun m!1236073 () Bool)

(assert (=> b!1348726 m!1236073))

(declare-fun m!1236075 () Bool)

(assert (=> b!1348726 m!1236075))

(assert (=> b!1348726 m!1236071))

(declare-fun m!1236077 () Bool)

(assert (=> b!1348726 m!1236077))

(declare-fun m!1236079 () Bool)

(assert (=> bm!65141 m!1236079))

(assert (=> b!1348728 m!1236071))

(assert (=> b!1348728 m!1236071))

(declare-fun m!1236081 () Bool)

(assert (=> b!1348728 m!1236081))

(assert (=> bm!65105 d!144851))

(declare-fun d!144853 () Bool)

(assert (=> d!144853 (= (apply!1046 lt!596162 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22456 (getValueByKey!716 (toList!11009 lt!596162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38639 () Bool)

(assert (= bs!38639 d!144853))

(assert (=> bs!38639 m!1236011))

(assert (=> bs!38639 m!1236011))

(declare-fun m!1236083 () Bool)

(assert (=> bs!38639 m!1236083))

(assert (=> b!1348511 d!144853))

(declare-fun b!1348729 () Bool)

(declare-fun e!767493 () Bool)

(declare-fun e!767495 () Bool)

(assert (=> b!1348729 (= e!767493 e!767495)))

(declare-fun res!894539 () Bool)

(assert (=> b!1348729 (=> (not res!894539) (not e!767495))))

(declare-fun e!767496 () Bool)

(assert (=> b!1348729 (= res!894539 (not e!767496))))

(declare-fun res!894538 () Bool)

(assert (=> b!1348729 (=> (not res!894538) (not e!767496))))

(assert (=> b!1348729 (= res!894538 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1348730 () Bool)

(declare-fun e!767494 () Bool)

(assert (=> b!1348730 (= e!767495 e!767494)))

(declare-fun c!126790 () Bool)

(assert (=> b!1348730 (= c!126790 (validKeyInArray!0 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1348731 () Bool)

(declare-fun call!65145 () Bool)

(assert (=> b!1348731 (= e!767494 call!65145)))

(declare-fun b!1348732 () Bool)

(assert (=> b!1348732 (= e!767496 (contains!9200 (ite c!126739 (Cons!31459 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) Nil!31460) Nil!31460) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1348733 () Bool)

(assert (=> b!1348733 (= e!767494 call!65145)))

(declare-fun bm!65142 () Bool)

(assert (=> bm!65142 (= call!65145 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126790 (Cons!31459 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126739 (Cons!31459 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) Nil!31460) Nil!31460)) (ite c!126739 (Cons!31459 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) Nil!31460) Nil!31460))))))

(declare-fun d!144855 () Bool)

(declare-fun res!894537 () Bool)

(assert (=> d!144855 (=> res!894537 e!767493)))

(assert (=> d!144855 (= res!894537 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> d!144855 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126739 (Cons!31459 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) Nil!31460) Nil!31460)) e!767493)))

(assert (= (and d!144855 (not res!894537)) b!1348729))

(assert (= (and b!1348729 res!894538) b!1348732))

(assert (= (and b!1348729 res!894539) b!1348730))

(assert (= (and b!1348730 c!126790) b!1348733))

(assert (= (and b!1348730 (not c!126790)) b!1348731))

(assert (= (or b!1348733 b!1348731) bm!65142))

(assert (=> b!1348729 m!1236071))

(assert (=> b!1348729 m!1236071))

(assert (=> b!1348729 m!1236081))

(assert (=> b!1348730 m!1236071))

(assert (=> b!1348730 m!1236071))

(assert (=> b!1348730 m!1236081))

(assert (=> b!1348732 m!1236071))

(assert (=> b!1348732 m!1236071))

(declare-fun m!1236085 () Bool)

(assert (=> b!1348732 m!1236085))

(assert (=> bm!65142 m!1236071))

(declare-fun m!1236087 () Bool)

(assert (=> bm!65142 m!1236087))

(assert (=> bm!65129 d!144855))

(declare-fun d!144857 () Bool)

(declare-fun lt!596272 () Bool)

(declare-fun content!663 (List!31463) (InoxSet (_ BitVec 64)))

(assert (=> d!144857 (= lt!596272 (select (content!663 Nil!31460) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!767502 () Bool)

(assert (=> d!144857 (= lt!596272 e!767502)))

(declare-fun res!894545 () Bool)

(assert (=> d!144857 (=> (not res!894545) (not e!767502))))

(assert (=> d!144857 (= res!894545 ((_ is Cons!31459) Nil!31460))))

(assert (=> d!144857 (= (contains!9200 Nil!31460 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)) lt!596272)))

(declare-fun b!1348738 () Bool)

(declare-fun e!767501 () Bool)

(assert (=> b!1348738 (= e!767502 e!767501)))

(declare-fun res!894544 () Bool)

(assert (=> b!1348738 (=> res!894544 e!767501)))

(assert (=> b!1348738 (= res!894544 (= (h!32677 Nil!31460) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348739 () Bool)

(assert (=> b!1348739 (= e!767501 (contains!9200 (t!46047 Nil!31460) (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144857 res!894545) b!1348738))

(assert (= (and b!1348738 (not res!894544)) b!1348739))

(declare-fun m!1236089 () Bool)

(assert (=> d!144857 m!1236089))

(assert (=> d!144857 m!1235707))

(declare-fun m!1236091 () Bool)

(assert (=> d!144857 m!1236091))

(assert (=> b!1348739 m!1235707))

(declare-fun m!1236093 () Bool)

(assert (=> b!1348739 m!1236093))

(assert (=> b!1348544 d!144857))

(declare-fun d!144859 () Bool)

(assert (=> d!144859 (= (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)) (not (isEmpty!1096 (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))))

(declare-fun bs!38640 () Bool)

(assert (= bs!38640 d!144859))

(assert (=> bs!38640 m!1235675))

(declare-fun m!1236095 () Bool)

(assert (=> bs!38640 m!1236095))

(assert (=> b!1348416 d!144859))

(declare-fun e!767503 () Option!767)

(declare-fun b!1348740 () Bool)

(assert (=> b!1348740 (= e!767503 (Some!766 (_2!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))))

(declare-fun b!1348743 () Bool)

(declare-fun e!767504 () Option!767)

(assert (=> b!1348743 (= e!767504 None!765)))

(declare-fun d!144861 () Bool)

(declare-fun c!126791 () Bool)

(assert (=> d!144861 (= c!126791 (and ((_ is Cons!31460) (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (= (_1!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142)))))

(assert (=> d!144861 (= (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) e!767503)))

(declare-fun b!1348741 () Bool)

(assert (=> b!1348741 (= e!767503 e!767504)))

(declare-fun c!126792 () Bool)

(assert (=> b!1348741 (= c!126792 (and ((_ is Cons!31460) (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) (not (= (_1!12172 (h!32678 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))) k0!1142))))))

(declare-fun b!1348742 () Bool)

(assert (=> b!1348742 (= e!767504 (getValueByKey!716 (t!46048 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))) k0!1142))))

(assert (= (and d!144861 c!126791) b!1348740))

(assert (= (and d!144861 (not c!126791)) b!1348741))

(assert (= (and b!1348741 c!126792) b!1348742))

(assert (= (and b!1348741 (not c!126792)) b!1348743))

(declare-fun m!1236097 () Bool)

(assert (=> b!1348742 m!1236097))

(assert (=> b!1348416 d!144861))

(declare-fun d!144863 () Bool)

(declare-fun e!767505 () Bool)

(assert (=> d!144863 e!767505))

(declare-fun res!894546 () Bool)

(assert (=> d!144863 (=> res!894546 e!767505)))

(declare-fun lt!596275 () Bool)

(assert (=> d!144863 (= res!894546 (not lt!596275))))

(declare-fun lt!596274 () Bool)

(assert (=> d!144863 (= lt!596275 lt!596274)))

(declare-fun lt!596273 () Unit!44074)

(declare-fun e!767506 () Unit!44074)

(assert (=> d!144863 (= lt!596273 e!767506)))

(declare-fun c!126793 () Bool)

(assert (=> d!144863 (= c!126793 lt!596274)))

(assert (=> d!144863 (= lt!596274 (containsKey!742 (toList!11009 lt!596079) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144863 (= (contains!9196 lt!596079 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596275)))

(declare-fun b!1348744 () Bool)

(declare-fun lt!596276 () Unit!44074)

(assert (=> b!1348744 (= e!767506 lt!596276)))

(assert (=> b!1348744 (= lt!596276 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596079) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348744 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348745 () Bool)

(declare-fun Unit!44086 () Unit!44074)

(assert (=> b!1348745 (= e!767506 Unit!44086)))

(declare-fun b!1348746 () Bool)

(assert (=> b!1348746 (= e!767505 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596079) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144863 c!126793) b!1348744))

(assert (= (and d!144863 (not c!126793)) b!1348745))

(assert (= (and d!144863 (not res!894546)) b!1348746))

(assert (=> d!144863 m!1235681))

(declare-fun m!1236099 () Bool)

(assert (=> d!144863 m!1236099))

(assert (=> b!1348744 m!1235681))

(declare-fun m!1236101 () Bool)

(assert (=> b!1348744 m!1236101))

(assert (=> b!1348744 m!1235681))

(declare-fun m!1236103 () Bool)

(assert (=> b!1348744 m!1236103))

(assert (=> b!1348744 m!1236103))

(declare-fun m!1236105 () Bool)

(assert (=> b!1348744 m!1236105))

(assert (=> b!1348746 m!1235681))

(assert (=> b!1348746 m!1236103))

(assert (=> b!1348746 m!1236103))

(assert (=> b!1348746 m!1236105))

(assert (=> b!1348451 d!144863))

(declare-fun d!144865 () Bool)

(assert (=> d!144865 (= (validKeyInArray!0 (select (arr!44435 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44435 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348464 d!144865))

(assert (=> bm!65121 d!144813))

(declare-fun d!144867 () Bool)

(declare-fun e!767507 () Bool)

(assert (=> d!144867 e!767507))

(declare-fun res!894547 () Bool)

(assert (=> d!144867 (=> res!894547 e!767507)))

(declare-fun lt!596279 () Bool)

(assert (=> d!144867 (= res!894547 (not lt!596279))))

(declare-fun lt!596278 () Bool)

(assert (=> d!144867 (= lt!596279 lt!596278)))

(declare-fun lt!596277 () Unit!44074)

(declare-fun e!767508 () Unit!44074)

(assert (=> d!144867 (= lt!596277 e!767508)))

(declare-fun c!126794 () Bool)

(assert (=> d!144867 (= c!126794 lt!596278)))

(assert (=> d!144867 (= lt!596278 (containsKey!742 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144867 (= (contains!9196 lt!596052 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!596279)))

(declare-fun b!1348747 () Bool)

(declare-fun lt!596280 () Unit!44074)

(assert (=> b!1348747 (= e!767508 lt!596280)))

(assert (=> b!1348747 (= lt!596280 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> b!1348747 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1348748 () Bool)

(declare-fun Unit!44087 () Unit!44074)

(assert (=> b!1348748 (= e!767508 Unit!44087)))

(declare-fun b!1348749 () Bool)

(assert (=> b!1348749 (= e!767507 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596052) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144867 c!126794) b!1348747))

(assert (= (and d!144867 (not c!126794)) b!1348748))

(assert (= (and d!144867 (not res!894547)) b!1348749))

(declare-fun m!1236107 () Bool)

(assert (=> d!144867 m!1236107))

(declare-fun m!1236109 () Bool)

(assert (=> b!1348747 m!1236109))

(assert (=> b!1348747 m!1235667))

(assert (=> b!1348747 m!1235667))

(declare-fun m!1236111 () Bool)

(assert (=> b!1348747 m!1236111))

(assert (=> b!1348749 m!1235667))

(assert (=> b!1348749 m!1235667))

(assert (=> b!1348749 m!1236111))

(assert (=> d!144743 d!144867))

(declare-fun b!1348750 () Bool)

(declare-fun e!767509 () Option!767)

(assert (=> b!1348750 (= e!767509 (Some!766 (_2!12172 (h!32678 lt!596049))))))

(declare-fun b!1348753 () Bool)

(declare-fun e!767510 () Option!767)

(assert (=> b!1348753 (= e!767510 None!765)))

(declare-fun d!144869 () Bool)

(declare-fun c!126795 () Bool)

(assert (=> d!144869 (= c!126795 (and ((_ is Cons!31460) lt!596049) (= (_1!12172 (h!32678 lt!596049)) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144869 (= (getValueByKey!716 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) e!767509)))

(declare-fun b!1348751 () Bool)

(assert (=> b!1348751 (= e!767509 e!767510)))

(declare-fun c!126796 () Bool)

(assert (=> b!1348751 (= c!126796 (and ((_ is Cons!31460) lt!596049) (not (= (_1!12172 (h!32678 lt!596049)) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun b!1348752 () Bool)

(assert (=> b!1348752 (= e!767510 (getValueByKey!716 (t!46048 lt!596049) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (= (and d!144869 c!126795) b!1348750))

(assert (= (and d!144869 (not c!126795)) b!1348751))

(assert (= (and b!1348751 c!126796) b!1348752))

(assert (= (and b!1348751 (not c!126796)) b!1348753))

(declare-fun m!1236113 () Bool)

(assert (=> b!1348752 m!1236113))

(assert (=> d!144743 d!144869))

(declare-fun d!144871 () Bool)

(assert (=> d!144871 (= (getValueByKey!716 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!766 (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!596281 () Unit!44074)

(assert (=> d!144871 (= lt!596281 (choose!1978 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun e!767511 () Bool)

(assert (=> d!144871 e!767511))

(declare-fun res!894548 () Bool)

(assert (=> d!144871 (=> (not res!894548) (not e!767511))))

(assert (=> d!144871 (= res!894548 (isStrictlySorted!870 lt!596049))))

(assert (=> d!144871 (= (lemmaContainsTupThenGetReturnValue!366 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!596281)))

(declare-fun b!1348754 () Bool)

(declare-fun res!894549 () Bool)

(assert (=> b!1348754 (=> (not res!894549) (not e!767511))))

(assert (=> b!1348754 (= res!894549 (containsKey!742 lt!596049 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1348755 () Bool)

(assert (=> b!1348755 (= e!767511 (contains!9199 lt!596049 (tuple2!24323 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (= (and d!144871 res!894548) b!1348754))

(assert (= (and b!1348754 res!894549) b!1348755))

(assert (=> d!144871 m!1235661))

(declare-fun m!1236115 () Bool)

(assert (=> d!144871 m!1236115))

(declare-fun m!1236117 () Bool)

(assert (=> d!144871 m!1236117))

(declare-fun m!1236119 () Bool)

(assert (=> b!1348754 m!1236119))

(declare-fun m!1236121 () Bool)

(assert (=> b!1348755 m!1236121))

(assert (=> d!144743 d!144871))

(declare-fun bm!65143 () Bool)

(declare-fun call!65146 () List!31464)

(declare-fun call!65148 () List!31464)

(assert (=> bm!65143 (= call!65146 call!65148)))

(declare-fun b!1348756 () Bool)

(declare-fun e!767516 () List!31464)

(assert (=> b!1348756 (= e!767516 call!65146)))

(declare-fun b!1348757 () Bool)

(declare-fun e!767513 () List!31464)

(declare-fun call!65147 () List!31464)

(assert (=> b!1348757 (= e!767513 call!65147)))

(declare-fun e!767512 () List!31464)

(declare-fun b!1348758 () Bool)

(assert (=> b!1348758 (= e!767512 (insertStrictlySorted!495 (t!46048 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun d!144873 () Bool)

(declare-fun e!767514 () Bool)

(assert (=> d!144873 e!767514))

(declare-fun res!894551 () Bool)

(assert (=> d!144873 (=> (not res!894551) (not e!767514))))

(declare-fun lt!596282 () List!31464)

(assert (=> d!144873 (= res!894551 (isStrictlySorted!870 lt!596282))))

(declare-fun e!767515 () List!31464)

(assert (=> d!144873 (= lt!596282 e!767515)))

(declare-fun c!126800 () Bool)

(assert (=> d!144873 (= c!126800 (and ((_ is Cons!31460) (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12172 (h!32678 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144873 (isStrictlySorted!870 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144873 (= (insertStrictlySorted!495 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) lt!596282)))

(declare-fun b!1348759 () Bool)

(assert (=> b!1348759 (= e!767514 (contains!9199 lt!596282 (tuple2!24323 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1348760 () Bool)

(assert (=> b!1348760 (= e!767513 call!65147)))

(declare-fun bm!65144 () Bool)

(assert (=> bm!65144 (= call!65147 call!65146)))

(declare-fun b!1348761 () Bool)

(declare-fun c!126799 () Bool)

(assert (=> b!1348761 (= c!126799 (and ((_ is Cons!31460) (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!12172 (h!32678 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> b!1348761 (= e!767516 e!767513)))

(declare-fun b!1348762 () Bool)

(declare-fun c!126798 () Bool)

(assert (=> b!1348762 (= e!767512 (ite c!126798 (t!46048 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!126799 (Cons!31460 (h!32678 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!46048 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31461)))))

(declare-fun b!1348763 () Bool)

(declare-fun res!894550 () Bool)

(assert (=> b!1348763 (=> (not res!894550) (not e!767514))))

(assert (=> b!1348763 (= res!894550 (containsKey!742 lt!596282 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun b!1348764 () Bool)

(assert (=> b!1348764 (= e!767515 e!767516)))

(assert (=> b!1348764 (= c!126798 (and ((_ is Cons!31460) (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12172 (h!32678 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun bm!65145 () Bool)

(assert (=> bm!65145 (= call!65148 ($colon$colon!671 e!767512 (ite c!126800 (h!32678 (toList!11009 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!24323 (_1!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12172 (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))))

(declare-fun c!126797 () Bool)

(assert (=> bm!65145 (= c!126797 c!126800)))

(declare-fun b!1348765 () Bool)

(assert (=> b!1348765 (= e!767515 call!65148)))

(assert (= (and d!144873 c!126800) b!1348765))

(assert (= (and d!144873 (not c!126800)) b!1348764))

(assert (= (and b!1348764 c!126798) b!1348756))

(assert (= (and b!1348764 (not c!126798)) b!1348761))

(assert (= (and b!1348761 c!126799) b!1348757))

(assert (= (and b!1348761 (not c!126799)) b!1348760))

(assert (= (or b!1348757 b!1348760) bm!65144))

(assert (= (or b!1348756 bm!65144) bm!65143))

(assert (= (or b!1348765 bm!65143) bm!65145))

(assert (= (and bm!65145 c!126797) b!1348758))

(assert (= (and bm!65145 (not c!126797)) b!1348762))

(assert (= (and d!144873 res!894551) b!1348763))

(assert (= (and b!1348763 res!894550) b!1348759))

(declare-fun m!1236123 () Bool)

(assert (=> bm!65145 m!1236123))

(declare-fun m!1236125 () Bool)

(assert (=> b!1348759 m!1236125))

(declare-fun m!1236127 () Bool)

(assert (=> b!1348758 m!1236127))

(declare-fun m!1236129 () Bool)

(assert (=> d!144873 m!1236129))

(declare-fun m!1236131 () Bool)

(assert (=> d!144873 m!1236131))

(declare-fun m!1236133 () Bool)

(assert (=> b!1348763 m!1236133))

(assert (=> d!144743 d!144873))

(declare-fun d!144875 () Bool)

(declare-fun e!767517 () Bool)

(assert (=> d!144875 e!767517))

(declare-fun res!894552 () Bool)

(assert (=> d!144875 (=> (not res!894552) (not e!767517))))

(declare-fun lt!596286 () ListLongMap!21987)

(assert (=> d!144875 (= res!894552 (contains!9196 lt!596286 (_1!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596283 () List!31464)

(assert (=> d!144875 (= lt!596286 (ListLongMap!21988 lt!596283))))

(declare-fun lt!596285 () Unit!44074)

(declare-fun lt!596284 () Unit!44074)

(assert (=> d!144875 (= lt!596285 lt!596284)))

(assert (=> d!144875 (= (getValueByKey!716 lt!596283 (_1!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144875 (= lt!596284 (lemmaContainsTupThenGetReturnValue!366 lt!596283 (_1!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144875 (= lt!596283 (insertStrictlySorted!495 (toList!11009 call!65127) (_1!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144875 (= (+!4872 call!65127 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596286)))

(declare-fun b!1348766 () Bool)

(declare-fun res!894553 () Bool)

(assert (=> b!1348766 (=> (not res!894553) (not e!767517))))

(assert (=> b!1348766 (= res!894553 (= (getValueByKey!716 (toList!11009 lt!596286) (_1!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!766 (_2!12172 (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1348767 () Bool)

(assert (=> b!1348767 (= e!767517 (contains!9199 (toList!11009 lt!596286) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144875 res!894552) b!1348766))

(assert (= (and b!1348766 res!894553) b!1348767))

(declare-fun m!1236135 () Bool)

(assert (=> d!144875 m!1236135))

(declare-fun m!1236137 () Bool)

(assert (=> d!144875 m!1236137))

(declare-fun m!1236139 () Bool)

(assert (=> d!144875 m!1236139))

(declare-fun m!1236141 () Bool)

(assert (=> d!144875 m!1236141))

(declare-fun m!1236143 () Bool)

(assert (=> b!1348766 m!1236143))

(declare-fun m!1236145 () Bool)

(assert (=> b!1348767 m!1236145))

(assert (=> b!1348512 d!144875))

(declare-fun d!144877 () Bool)

(assert (=> d!144877 (= (apply!1046 lt!596162 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22456 (getValueByKey!716 (toList!11009 lt!596162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38641 () Bool)

(assert (= bs!38641 d!144877))

(declare-fun m!1236147 () Bool)

(assert (=> bs!38641 m!1236147))

(assert (=> bs!38641 m!1236147))

(declare-fun m!1236149 () Bool)

(assert (=> bs!38641 m!1236149))

(assert (=> b!1348528 d!144877))

(assert (=> b!1348529 d!144763))

(declare-fun d!144879 () Bool)

(declare-fun res!894554 () Bool)

(declare-fun e!767518 () Bool)

(assert (=> d!144879 (=> res!894554 e!767518)))

(assert (=> d!144879 (= res!894554 (and ((_ is Cons!31460) (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144879 (= (containsKey!742 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767518)))

(declare-fun b!1348768 () Bool)

(declare-fun e!767519 () Bool)

(assert (=> b!1348768 (= e!767518 e!767519)))

(declare-fun res!894555 () Bool)

(assert (=> b!1348768 (=> (not res!894555) (not e!767519))))

(assert (=> b!1348768 (= res!894555 (and (or (not ((_ is Cons!31460) (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31460) (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12172 (h!32678 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1348769 () Bool)

(assert (=> b!1348769 (= e!767519 (containsKey!742 (t!46048 (toList!11009 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144879 (not res!894554)) b!1348768))

(assert (= (and b!1348768 res!894555) b!1348769))

(declare-fun m!1236151 () Bool)

(assert (=> b!1348769 m!1236151))

(assert (=> d!144751 d!144879))

(assert (=> d!144753 d!144757))

(declare-fun d!144881 () Bool)

(declare-fun e!767520 () Bool)

(assert (=> d!144881 e!767520))

(declare-fun res!894556 () Bool)

(assert (=> d!144881 (=> res!894556 e!767520)))

(declare-fun lt!596289 () Bool)

(assert (=> d!144881 (= res!894556 (not lt!596289))))

(declare-fun lt!596288 () Bool)

(assert (=> d!144881 (= lt!596289 lt!596288)))

(declare-fun lt!596287 () Unit!44074)

(declare-fun e!767521 () Unit!44074)

(assert (=> d!144881 (= lt!596287 e!767521)))

(declare-fun c!126801 () Bool)

(assert (=> d!144881 (= c!126801 lt!596288)))

(assert (=> d!144881 (= lt!596288 (containsKey!742 (toList!11009 lt!596162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144881 (= (contains!9196 lt!596162 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596289)))

(declare-fun b!1348770 () Bool)

(declare-fun lt!596290 () Unit!44074)

(assert (=> b!1348770 (= e!767521 lt!596290)))

(assert (=> b!1348770 (= lt!596290 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 lt!596162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348770 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348771 () Bool)

(declare-fun Unit!44088 () Unit!44074)

(assert (=> b!1348771 (= e!767521 Unit!44088)))

(declare-fun b!1348772 () Bool)

(assert (=> b!1348772 (= e!767520 (isDefined!525 (getValueByKey!716 (toList!11009 lt!596162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144881 c!126801) b!1348770))

(assert (= (and d!144881 (not c!126801)) b!1348771))

(assert (= (and d!144881 (not res!894556)) b!1348772))

(declare-fun m!1236153 () Bool)

(assert (=> d!144881 m!1236153))

(declare-fun m!1236155 () Bool)

(assert (=> b!1348770 m!1236155))

(assert (=> b!1348770 m!1236147))

(assert (=> b!1348770 m!1236147))

(declare-fun m!1236157 () Bool)

(assert (=> b!1348770 m!1236157))

(assert (=> b!1348772 m!1236147))

(assert (=> b!1348772 m!1236147))

(assert (=> b!1348772 m!1236157))

(assert (=> bm!65124 d!144881))

(declare-fun d!144883 () Bool)

(declare-fun isEmpty!1097 (List!31464) Bool)

(assert (=> d!144883 (= (isEmpty!1095 lt!596079) (isEmpty!1097 (toList!11009 lt!596079)))))

(declare-fun bs!38642 () Bool)

(assert (= bs!38642 d!144883))

(declare-fun m!1236159 () Bool)

(assert (=> bs!38642 m!1236159))

(assert (=> b!1348445 d!144883))

(assert (=> b!1348446 d!144783))

(assert (=> b!1348542 d!144865))

(declare-fun d!144885 () Bool)

(assert (=> d!144885 (= (get!22455 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348405 d!144885))

(declare-fun d!144887 () Bool)

(assert (=> d!144887 (isDefined!525 (getValueByKey!716 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun lt!596291 () Unit!44074)

(assert (=> d!144887 (= lt!596291 (choose!1977 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun e!767522 () Bool)

(assert (=> d!144887 e!767522))

(declare-fun res!894557 () Bool)

(assert (=> d!144887 (=> (not res!894557) (not e!767522))))

(assert (=> d!144887 (= res!894557 (isStrictlySorted!870 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(assert (=> d!144887 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142) lt!596291)))

(declare-fun b!1348773 () Bool)

(assert (=> b!1348773 (= e!767522 (containsKey!742 (toList!11009 (+!4872 (+!4872 (getCurrentListMapNoExtraKeys!6525 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44435 _keys!1571) from!1960) (get!22452 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (= (and d!144887 res!894557) b!1348773))

(assert (=> d!144887 m!1235675))

(assert (=> d!144887 m!1235675))

(assert (=> d!144887 m!1235677))

(declare-fun m!1236161 () Bool)

(assert (=> d!144887 m!1236161))

(declare-fun m!1236163 () Bool)

(assert (=> d!144887 m!1236163))

(assert (=> b!1348773 m!1235671))

(assert (=> b!1348414 d!144887))

(assert (=> b!1348414 d!144859))

(assert (=> b!1348414 d!144861))

(declare-fun d!144889 () Bool)

(assert (=> d!144889 (= (apply!1046 lt!596079 (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22456 (getValueByKey!716 (toList!11009 lt!596079) (select (arr!44435 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38643 () Bool)

(assert (= bs!38643 d!144889))

(assert (=> bs!38643 m!1235681))

(assert (=> bs!38643 m!1236103))

(assert (=> bs!38643 m!1236103))

(declare-fun m!1236165 () Bool)

(assert (=> bs!38643 m!1236165))

(assert (=> b!1348449 d!144889))

(assert (=> b!1348449 d!144771))

(declare-fun d!144891 () Bool)

(declare-fun e!767523 () Bool)

(assert (=> d!144891 e!767523))

(declare-fun res!894558 () Bool)

(assert (=> d!144891 (=> (not res!894558) (not e!767523))))

(declare-fun lt!596295 () ListLongMap!21987)

(assert (=> d!144891 (= res!894558 (contains!9196 lt!596295 (_1!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596292 () List!31464)

(assert (=> d!144891 (= lt!596295 (ListLongMap!21988 lt!596292))))

(declare-fun lt!596294 () Unit!44074)

(declare-fun lt!596293 () Unit!44074)

(assert (=> d!144891 (= lt!596294 lt!596293)))

(assert (=> d!144891 (= (getValueByKey!716 lt!596292 (_1!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!766 (_2!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144891 (= lt!596293 (lemmaContainsTupThenGetReturnValue!366 lt!596292 (_1!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144891 (= lt!596292 (insertStrictlySorted!495 (toList!11009 (ite c!126734 call!65124 (ite c!126735 call!65126 call!65129))) (_1!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144891 (= (+!4872 (ite c!126734 call!65124 (ite c!126735 call!65126 call!65129)) (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596295)))

(declare-fun b!1348774 () Bool)

(declare-fun res!894559 () Bool)

(assert (=> b!1348774 (=> (not res!894559) (not e!767523))))

(assert (=> b!1348774 (= res!894559 (= (getValueByKey!716 (toList!11009 lt!596295) (_1!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!766 (_2!12172 (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1348775 () Bool)

(assert (=> b!1348775 (= e!767523 (contains!9199 (toList!11009 lt!596295) (ite (or c!126734 c!126735) (tuple2!24323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144891 res!894558) b!1348774))

(assert (= (and b!1348774 res!894559) b!1348775))

(declare-fun m!1236167 () Bool)

(assert (=> d!144891 m!1236167))

(declare-fun m!1236169 () Bool)

(assert (=> d!144891 m!1236169))

(declare-fun m!1236171 () Bool)

(assert (=> d!144891 m!1236171))

(declare-fun m!1236173 () Bool)

(assert (=> d!144891 m!1236173))

(declare-fun m!1236175 () Bool)

(assert (=> b!1348774 m!1236175))

(declare-fun m!1236177 () Bool)

(assert (=> b!1348775 m!1236177))

(assert (=> bm!65125 d!144891))

(declare-fun d!144893 () Bool)

(assert (=> d!144893 (= (get!22454 (select (arr!44436 _values!1303) from!1960) (dynLambda!3826 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21474 (select (arr!44436 _values!1303) from!1960)))))

(assert (=> b!1348404 d!144893))

(assert (=> b!1348524 d!144763))

(assert (=> b!1348541 d!144865))

(declare-fun condMapEmpty!57986 () Bool)

(declare-fun mapDefault!57986 () ValueCell!17858)

(assert (=> mapNonEmpty!57985 (= condMapEmpty!57986 (= mapRest!57985 ((as const (Array (_ BitVec 32) ValueCell!17858)) mapDefault!57986)))))

(declare-fun e!767525 () Bool)

(declare-fun mapRes!57986 () Bool)

(assert (=> mapNonEmpty!57985 (= tp!110359 (and e!767525 mapRes!57986))))

(declare-fun mapNonEmpty!57986 () Bool)

(declare-fun tp!110360 () Bool)

(declare-fun e!767524 () Bool)

(assert (=> mapNonEmpty!57986 (= mapRes!57986 (and tp!110360 e!767524))))

(declare-fun mapValue!57986 () ValueCell!17858)

(declare-fun mapRest!57986 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapKey!57986 () (_ BitVec 32))

(assert (=> mapNonEmpty!57986 (= mapRest!57985 (store mapRest!57986 mapKey!57986 mapValue!57986))))

(declare-fun mapIsEmpty!57986 () Bool)

(assert (=> mapIsEmpty!57986 mapRes!57986))

(declare-fun b!1348776 () Bool)

(assert (=> b!1348776 (= e!767524 tp_is_empty!37513)))

(declare-fun b!1348777 () Bool)

(assert (=> b!1348777 (= e!767525 tp_is_empty!37513)))

(assert (= (and mapNonEmpty!57985 condMapEmpty!57986) mapIsEmpty!57986))

(assert (= (and mapNonEmpty!57985 (not condMapEmpty!57986)) mapNonEmpty!57986))

(assert (= (and mapNonEmpty!57986 ((_ is ValueCellFull!17858) mapValue!57986)) b!1348776))

(assert (= (and mapNonEmpty!57985 ((_ is ValueCellFull!17858) mapDefault!57986)) b!1348777))

(declare-fun m!1236179 () Bool)

(assert (=> mapNonEmpty!57986 m!1236179))

(declare-fun b_lambda!24579 () Bool)

(assert (= b_lambda!24577 (or (and start!113686 b_free!31513) b_lambda!24579)))

(declare-fun b_lambda!24581 () Bool)

(assert (= b_lambda!24571 (or (and start!113686 b_free!31513) b_lambda!24581)))

(declare-fun b_lambda!24583 () Bool)

(assert (= b_lambda!24573 (or (and start!113686 b_free!31513) b_lambda!24583)))

(declare-fun b_lambda!24585 () Bool)

(assert (= b_lambda!24575 (or (and start!113686 b_free!31513) b_lambda!24585)))

(check-sat (not d!144831) (not b!1348559) (not d!144801) (not b!1348670) (not b!1348590) (not b!1348752) (not d!144781) (not b!1348770) (not d!144819) (not b!1348769) (not b!1348617) (not b!1348555) (not b!1348652) (not d!144787) (not d!144889) (not b!1348706) (not b!1348749) tp_is_empty!37513 (not d!144769) (not b!1348694) (not b!1348643) (not b!1348586) (not b_lambda!24567) (not d!144823) (not b!1348626) (not d!144811) (not b!1348774) (not b!1348579) (not d!144875) (not b!1348742) (not b!1348773) (not d!144813) (not bm!65145) (not b!1348739) (not b!1348730) (not b!1348556) (not d!144881) (not d!144775) (not d!144765) (not d!144853) (not b!1348640) (not b!1348726) (not d!144797) (not b!1348601) (not d!144873) (not b!1348624) (not b!1348604) (not b!1348564) (not d!144779) (not b!1348613) (not d!144791) (not b!1348744) (not b!1348557) (not b!1348654) (not b!1348602) (not d!144817) (not b!1348698) (not d!144887) (not b!1348609) (not b!1348631) (not b_lambda!24557) (not d!144809) (not b!1348558) (not b!1348669) (not b!1348775) (not d!144793) (not bm!65130) (not b!1348657) (not b!1348615) (not d!144815) (not b_lambda!24579) (not d!144871) (not b!1348747) (not b!1348612) (not b_lambda!24569) (not b!1348766) (not b!1348578) (not d!144863) (not b!1348591) (not b!1348746) (not b!1348611) (not mapNonEmpty!57986) (not b!1348580) (not b!1348625) (not d!144777) (not d!144785) (not b!1348622) (not d!144841) (not b!1348660) (not d!144859) (not d!144799) (not b_lambda!24585) (not b!1348619) (not b!1348754) (not b!1348655) (not d!144877) (not b!1348599) (not d!144839) (not bm!65140) (not d!144857) (not d!144835) (not b!1348755) (not b!1348620) (not bm!65131) (not b_lambda!24565) (not d!144803) (not b!1348650) (not d!144867) (not b!1348581) (not bm!65141) (not b_lambda!24583) (not d!144805) (not b!1348629) (not d!144845) (not d!144807) (not b!1348658) (not d!144833) (not b!1348616) (not b!1348588) (not b_next!31513) (not d!144849) (not d!144843) (not b!1348587) (not b!1348693) (not b!1348576) (not b!1348621) (not b!1348759) (not b!1348562) (not b!1348554) (not b!1348623) (not b!1348593) (not b!1348610) (not bm!65142) (not b!1348646) (not b!1348758) (not b!1348763) (not b!1348772) (not b!1348729) (not b_lambda!24581) (not d!144883) (not d!144773) (not d!144825) (not b!1348721) (not b!1348663) (not d!144795) b_and!50827 (not d!144891) (not b!1348728) (not d!144789) (not b!1348767) (not b!1348732))
(check-sat b_and!50827 (not b_next!31513))
