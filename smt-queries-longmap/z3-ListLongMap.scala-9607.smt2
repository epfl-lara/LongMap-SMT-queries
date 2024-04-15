; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113562 () Bool)

(assert start!113562)

(declare-fun b_free!31555 () Bool)

(declare-fun b_next!31555 () Bool)

(assert (=> start!113562 (= b_free!31555 (not b_next!31555))))

(declare-fun tp!110475 () Bool)

(declare-fun b_and!50881 () Bool)

(assert (=> start!113562 (= tp!110475 b_and!50881)))

(declare-fun b!1348117 () Bool)

(declare-fun res!894523 () Bool)

(declare-fun e!766930 () Bool)

(assert (=> b!1348117 (=> (not res!894523) (not e!766930))))

(declare-datatypes ((array!91887 0))(
  ( (array!91888 (arr!44399 (Array (_ BitVec 32) (_ BitVec 64))) (size!44951 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91887)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348117 (= res!894523 (validKeyInArray!0 (select (arr!44399 _keys!1571) from!1960)))))

(declare-fun b!1348118 () Bool)

(declare-fun res!894520 () Bool)

(assert (=> b!1348118 (=> (not res!894520) (not e!766930))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1348118 (= res!894520 (not (= (select (arr!44399 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348119 () Bool)

(declare-fun res!894522 () Bool)

(assert (=> b!1348119 (=> (not res!894522) (not e!766930))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55177 0))(
  ( (V!55178 (val!18852 Int)) )
))
(declare-datatypes ((ValueCell!17879 0))(
  ( (ValueCellFull!17879 (v!21502 V!55177)) (EmptyCell!17879) )
))
(declare-datatypes ((array!91889 0))(
  ( (array!91890 (arr!44400 (Array (_ BitVec 32) ValueCell!17879)) (size!44952 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91889)

(assert (=> b!1348119 (= res!894522 (and (= (size!44952 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44951 _keys!1571) (size!44952 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348120 () Bool)

(declare-fun res!894521 () Bool)

(assert (=> b!1348120 (=> (not res!894521) (not e!766930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91887 (_ BitVec 32)) Bool)

(assert (=> b!1348120 (= res!894521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894519 () Bool)

(assert (=> start!113562 (=> (not res!894519) (not e!766930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113562 (= res!894519 (validMask!0 mask!1977))))

(assert (=> start!113562 e!766930))

(declare-fun tp_is_empty!37555 () Bool)

(assert (=> start!113562 tp_is_empty!37555))

(assert (=> start!113562 true))

(declare-fun array_inv!33643 (array!91887) Bool)

(assert (=> start!113562 (array_inv!33643 _keys!1571)))

(declare-fun e!766931 () Bool)

(declare-fun array_inv!33644 (array!91889) Bool)

(assert (=> start!113562 (and (array_inv!33644 _values!1303) e!766931)))

(assert (=> start!113562 tp!110475))

(declare-fun b!1348121 () Bool)

(declare-fun e!766934 () Bool)

(assert (=> b!1348121 (= e!766934 tp_is_empty!37555)))

(declare-fun b!1348122 () Bool)

(declare-fun mapRes!58043 () Bool)

(assert (=> b!1348122 (= e!766931 (and e!766934 mapRes!58043))))

(declare-fun condMapEmpty!58043 () Bool)

(declare-fun mapDefault!58043 () ValueCell!17879)

(assert (=> b!1348122 (= condMapEmpty!58043 (= (arr!44400 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17879)) mapDefault!58043)))))

(declare-fun minValue!1245 () V!55177)

(declare-fun b!1348123 () Bool)

(declare-fun zeroValue!1245 () V!55177)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24382 0))(
  ( (tuple2!24383 (_1!12202 (_ BitVec 64)) (_2!12202 V!55177)) )
))
(declare-datatypes ((List!31515 0))(
  ( (Nil!31512) (Cons!31511 (h!32720 tuple2!24382) (t!46141 List!31515)) )
))
(declare-datatypes ((ListLongMap!22039 0))(
  ( (ListLongMap!22040 (toList!11035 List!31515)) )
))
(declare-fun contains!9140 (ListLongMap!22039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5867 (array!91887 array!91889 (_ BitVec 32) (_ BitVec 32) V!55177 V!55177 (_ BitVec 32) Int) ListLongMap!22039)

(assert (=> b!1348123 (= e!766930 (not (contains!9140 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun lt!595775 () ListLongMap!22039)

(declare-fun +!4882 (ListLongMap!22039 tuple2!24382) ListLongMap!22039)

(assert (=> b!1348123 (contains!9140 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44009 0))(
  ( (Unit!44010) )
))
(declare-fun lt!595777 () Unit!44009)

(declare-fun addStillContains!1207 (ListLongMap!22039 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44009)

(assert (=> b!1348123 (= lt!595777 (addStillContains!1207 lt!595775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1348123 (contains!9140 lt!595775 k0!1142)))

(declare-fun lt!595773 () Unit!44009)

(declare-fun lt!595772 () V!55177)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!415 ((_ BitVec 64) (_ BitVec 64) V!55177 ListLongMap!22039) Unit!44009)

(assert (=> b!1348123 (= lt!595773 (lemmaInListMapAfterAddingDiffThenInBefore!415 k0!1142 (select (arr!44399 _keys!1571) from!1960) lt!595772 lt!595775))))

(declare-fun lt!595774 () ListLongMap!22039)

(assert (=> b!1348123 (contains!9140 lt!595774 k0!1142)))

(declare-fun lt!595776 () Unit!44009)

(assert (=> b!1348123 (= lt!595776 (lemmaInListMapAfterAddingDiffThenInBefore!415 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595774))))

(assert (=> b!1348123 (= lt!595774 (+!4882 lt!595775 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)))))

(declare-fun get!22443 (ValueCell!17879 V!55177) V!55177)

(declare-fun dynLambda!3812 (Int (_ BitVec 64)) V!55177)

(assert (=> b!1348123 (= lt!595772 (get!22443 (select (arr!44400 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6530 (array!91887 array!91889 (_ BitVec 32) (_ BitVec 32) V!55177 V!55177 (_ BitVec 32) Int) ListLongMap!22039)

(assert (=> b!1348123 (= lt!595775 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348124 () Bool)

(declare-fun res!894518 () Bool)

(assert (=> b!1348124 (=> (not res!894518) (not e!766930))))

(assert (=> b!1348124 (= res!894518 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44951 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348125 () Bool)

(declare-fun e!766933 () Bool)

(assert (=> b!1348125 (= e!766933 tp_is_empty!37555)))

(declare-fun b!1348126 () Bool)

(declare-fun res!894524 () Bool)

(assert (=> b!1348126 (=> (not res!894524) (not e!766930))))

(assert (=> b!1348126 (= res!894524 (contains!9140 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!58043 () Bool)

(declare-fun tp!110474 () Bool)

(assert (=> mapNonEmpty!58043 (= mapRes!58043 (and tp!110474 e!766933))))

(declare-fun mapKey!58043 () (_ BitVec 32))

(declare-fun mapValue!58043 () ValueCell!17879)

(declare-fun mapRest!58043 () (Array (_ BitVec 32) ValueCell!17879))

(assert (=> mapNonEmpty!58043 (= (arr!44400 _values!1303) (store mapRest!58043 mapKey!58043 mapValue!58043))))

(declare-fun b!1348127 () Bool)

(declare-fun res!894517 () Bool)

(assert (=> b!1348127 (=> (not res!894517) (not e!766930))))

(declare-datatypes ((List!31516 0))(
  ( (Nil!31513) (Cons!31512 (h!32721 (_ BitVec 64)) (t!46142 List!31516)) )
))
(declare-fun arrayNoDuplicates!0 (array!91887 (_ BitVec 32) List!31516) Bool)

(assert (=> b!1348127 (= res!894517 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31513))))

(declare-fun mapIsEmpty!58043 () Bool)

(assert (=> mapIsEmpty!58043 mapRes!58043))

(declare-fun b!1348128 () Bool)

(declare-fun res!894525 () Bool)

(assert (=> b!1348128 (=> (not res!894525) (not e!766930))))

(assert (=> b!1348128 (= res!894525 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113562 res!894519) b!1348119))

(assert (= (and b!1348119 res!894522) b!1348120))

(assert (= (and b!1348120 res!894521) b!1348127))

(assert (= (and b!1348127 res!894517) b!1348124))

(assert (= (and b!1348124 res!894518) b!1348126))

(assert (= (and b!1348126 res!894524) b!1348118))

(assert (= (and b!1348118 res!894520) b!1348117))

(assert (= (and b!1348117 res!894523) b!1348128))

(assert (= (and b!1348128 res!894525) b!1348123))

(assert (= (and b!1348122 condMapEmpty!58043) mapIsEmpty!58043))

(assert (= (and b!1348122 (not condMapEmpty!58043)) mapNonEmpty!58043))

(get-info :version)

(assert (= (and mapNonEmpty!58043 ((_ is ValueCellFull!17879) mapValue!58043)) b!1348125))

(assert (= (and b!1348122 ((_ is ValueCellFull!17879) mapDefault!58043)) b!1348121))

(assert (= start!113562 b!1348122))

(declare-fun b_lambda!24619 () Bool)

(assert (=> (not b_lambda!24619) (not b!1348123)))

(declare-fun t!46140 () Bool)

(declare-fun tb!12429 () Bool)

(assert (=> (and start!113562 (= defaultEntry!1306 defaultEntry!1306) t!46140) tb!12429))

(declare-fun result!25959 () Bool)

(assert (=> tb!12429 (= result!25959 tp_is_empty!37555)))

(assert (=> b!1348123 t!46140))

(declare-fun b_and!50883 () Bool)

(assert (= b_and!50881 (and (=> t!46140 result!25959) b_and!50883)))

(declare-fun m!1234691 () Bool)

(assert (=> b!1348127 m!1234691))

(declare-fun m!1234693 () Bool)

(assert (=> start!113562 m!1234693))

(declare-fun m!1234695 () Bool)

(assert (=> start!113562 m!1234695))

(declare-fun m!1234697 () Bool)

(assert (=> start!113562 m!1234697))

(declare-fun m!1234699 () Bool)

(assert (=> b!1348117 m!1234699))

(assert (=> b!1348117 m!1234699))

(declare-fun m!1234701 () Bool)

(assert (=> b!1348117 m!1234701))

(declare-fun m!1234703 () Bool)

(assert (=> b!1348120 m!1234703))

(assert (=> b!1348118 m!1234699))

(declare-fun m!1234705 () Bool)

(assert (=> mapNonEmpty!58043 m!1234705))

(declare-fun m!1234707 () Bool)

(assert (=> b!1348126 m!1234707))

(assert (=> b!1348126 m!1234707))

(declare-fun m!1234709 () Bool)

(assert (=> b!1348126 m!1234709))

(declare-fun m!1234711 () Bool)

(assert (=> b!1348123 m!1234711))

(declare-fun m!1234713 () Bool)

(assert (=> b!1348123 m!1234713))

(declare-fun m!1234715 () Bool)

(assert (=> b!1348123 m!1234715))

(declare-fun m!1234717 () Bool)

(assert (=> b!1348123 m!1234717))

(declare-fun m!1234719 () Bool)

(assert (=> b!1348123 m!1234719))

(declare-fun m!1234721 () Bool)

(assert (=> b!1348123 m!1234721))

(assert (=> b!1348123 m!1234715))

(declare-fun m!1234723 () Bool)

(assert (=> b!1348123 m!1234723))

(assert (=> b!1348123 m!1234719))

(declare-fun m!1234725 () Bool)

(assert (=> b!1348123 m!1234725))

(assert (=> b!1348123 m!1234699))

(assert (=> b!1348123 m!1234725))

(declare-fun m!1234727 () Bool)

(assert (=> b!1348123 m!1234727))

(declare-fun m!1234729 () Bool)

(assert (=> b!1348123 m!1234729))

(declare-fun m!1234731 () Bool)

(assert (=> b!1348123 m!1234731))

(assert (=> b!1348123 m!1234717))

(assert (=> b!1348123 m!1234699))

(declare-fun m!1234733 () Bool)

(assert (=> b!1348123 m!1234733))

(declare-fun m!1234735 () Bool)

(assert (=> b!1348123 m!1234735))

(declare-fun m!1234737 () Bool)

(assert (=> b!1348123 m!1234737))

(check-sat tp_is_empty!37555 (not b!1348117) (not b_lambda!24619) (not b!1348123) (not b!1348120) (not b!1348127) (not start!113562) (not mapNonEmpty!58043) b_and!50883 (not b_next!31555) (not b!1348126))
(check-sat b_and!50883 (not b_next!31555))
(get-model)

(declare-fun b_lambda!24625 () Bool)

(assert (= b_lambda!24619 (or (and start!113562 b_free!31555) b_lambda!24625)))

(check-sat (not b_lambda!24625) tp_is_empty!37555 (not b!1348117) (not b!1348123) (not b!1348120) (not b!1348127) (not start!113562) (not mapNonEmpty!58043) b_and!50883 (not b_next!31555) (not b!1348126))
(check-sat b_and!50883 (not b_next!31555))
(get-model)

(declare-fun d!144349 () Bool)

(assert (=> d!144349 (contains!9140 lt!595775 k0!1142)))

(declare-fun lt!595816 () Unit!44009)

(declare-fun choose!1985 ((_ BitVec 64) (_ BitVec 64) V!55177 ListLongMap!22039) Unit!44009)

(assert (=> d!144349 (= lt!595816 (choose!1985 k0!1142 (select (arr!44399 _keys!1571) from!1960) lt!595772 lt!595775))))

(assert (=> d!144349 (contains!9140 (+!4882 lt!595775 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)) k0!1142)))

(assert (=> d!144349 (= (lemmaInListMapAfterAddingDiffThenInBefore!415 k0!1142 (select (arr!44399 _keys!1571) from!1960) lt!595772 lt!595775) lt!595816)))

(declare-fun bs!38622 () Bool)

(assert (= bs!38622 d!144349))

(assert (=> bs!38622 m!1234737))

(assert (=> bs!38622 m!1234699))

(declare-fun m!1234835 () Bool)

(assert (=> bs!38622 m!1234835))

(assert (=> bs!38622 m!1234711))

(assert (=> bs!38622 m!1234711))

(declare-fun m!1234837 () Bool)

(assert (=> bs!38622 m!1234837))

(assert (=> b!1348123 d!144349))

(declare-fun d!144351 () Bool)

(declare-fun e!766969 () Bool)

(assert (=> d!144351 e!766969))

(declare-fun res!894582 () Bool)

(assert (=> d!144351 (=> res!894582 e!766969)))

(declare-fun lt!595828 () Bool)

(assert (=> d!144351 (= res!894582 (not lt!595828))))

(declare-fun lt!595826 () Bool)

(assert (=> d!144351 (= lt!595828 lt!595826)))

(declare-fun lt!595827 () Unit!44009)

(declare-fun e!766970 () Unit!44009)

(assert (=> d!144351 (= lt!595827 e!766970)))

(declare-fun c!126388 () Bool)

(assert (=> d!144351 (= c!126388 lt!595826)))

(declare-fun containsKey!741 (List!31515 (_ BitVec 64)) Bool)

(assert (=> d!144351 (= lt!595826 (containsKey!741 (toList!11035 lt!595774) k0!1142))))

(assert (=> d!144351 (= (contains!9140 lt!595774 k0!1142) lt!595828)))

(declare-fun b!1348213 () Bool)

(declare-fun lt!595825 () Unit!44009)

(assert (=> b!1348213 (= e!766970 lt!595825)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!488 (List!31515 (_ BitVec 64)) Unit!44009)

(assert (=> b!1348213 (= lt!595825 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11035 lt!595774) k0!1142))))

(declare-datatypes ((Option!775 0))(
  ( (Some!774 (v!21505 V!55177)) (None!773) )
))
(declare-fun isDefined!531 (Option!775) Bool)

(declare-fun getValueByKey!724 (List!31515 (_ BitVec 64)) Option!775)

(assert (=> b!1348213 (isDefined!531 (getValueByKey!724 (toList!11035 lt!595774) k0!1142))))

(declare-fun b!1348214 () Bool)

(declare-fun Unit!44013 () Unit!44009)

(assert (=> b!1348214 (= e!766970 Unit!44013)))

(declare-fun b!1348215 () Bool)

(assert (=> b!1348215 (= e!766969 (isDefined!531 (getValueByKey!724 (toList!11035 lt!595774) k0!1142)))))

(assert (= (and d!144351 c!126388) b!1348213))

(assert (= (and d!144351 (not c!126388)) b!1348214))

(assert (= (and d!144351 (not res!894582)) b!1348215))

(declare-fun m!1234839 () Bool)

(assert (=> d!144351 m!1234839))

(declare-fun m!1234841 () Bool)

(assert (=> b!1348213 m!1234841))

(declare-fun m!1234843 () Bool)

(assert (=> b!1348213 m!1234843))

(assert (=> b!1348213 m!1234843))

(declare-fun m!1234845 () Bool)

(assert (=> b!1348213 m!1234845))

(assert (=> b!1348215 m!1234843))

(assert (=> b!1348215 m!1234843))

(assert (=> b!1348215 m!1234845))

(assert (=> b!1348123 d!144351))

(declare-fun d!144353 () Bool)

(declare-fun e!766971 () Bool)

(assert (=> d!144353 e!766971))

(declare-fun res!894583 () Bool)

(assert (=> d!144353 (=> res!894583 e!766971)))

(declare-fun lt!595832 () Bool)

(assert (=> d!144353 (= res!894583 (not lt!595832))))

(declare-fun lt!595830 () Bool)

(assert (=> d!144353 (= lt!595832 lt!595830)))

(declare-fun lt!595831 () Unit!44009)

(declare-fun e!766972 () Unit!44009)

(assert (=> d!144353 (= lt!595831 e!766972)))

(declare-fun c!126389 () Bool)

(assert (=> d!144353 (= c!126389 lt!595830)))

(assert (=> d!144353 (= lt!595830 (containsKey!741 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144353 (= (contains!9140 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!595832)))

(declare-fun b!1348216 () Bool)

(declare-fun lt!595829 () Unit!44009)

(assert (=> b!1348216 (= e!766972 lt!595829)))

(assert (=> b!1348216 (= lt!595829 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1348216 (isDefined!531 (getValueByKey!724 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1348217 () Bool)

(declare-fun Unit!44014 () Unit!44009)

(assert (=> b!1348217 (= e!766972 Unit!44014)))

(declare-fun b!1348218 () Bool)

(assert (=> b!1348218 (= e!766971 (isDefined!531 (getValueByKey!724 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144353 c!126389) b!1348216))

(assert (= (and d!144353 (not c!126389)) b!1348217))

(assert (= (and d!144353 (not res!894583)) b!1348218))

(declare-fun m!1234847 () Bool)

(assert (=> d!144353 m!1234847))

(declare-fun m!1234849 () Bool)

(assert (=> b!1348216 m!1234849))

(declare-fun m!1234851 () Bool)

(assert (=> b!1348216 m!1234851))

(assert (=> b!1348216 m!1234851))

(declare-fun m!1234853 () Bool)

(assert (=> b!1348216 m!1234853))

(assert (=> b!1348218 m!1234851))

(assert (=> b!1348218 m!1234851))

(assert (=> b!1348218 m!1234853))

(assert (=> b!1348123 d!144353))

(declare-fun d!144355 () Bool)

(declare-fun e!766975 () Bool)

(assert (=> d!144355 e!766975))

(declare-fun res!894588 () Bool)

(assert (=> d!144355 (=> (not res!894588) (not e!766975))))

(declare-fun lt!595844 () ListLongMap!22039)

(assert (=> d!144355 (= res!894588 (contains!9140 lt!595844 (_1!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))))))

(declare-fun lt!595842 () List!31515)

(assert (=> d!144355 (= lt!595844 (ListLongMap!22040 lt!595842))))

(declare-fun lt!595841 () Unit!44009)

(declare-fun lt!595843 () Unit!44009)

(assert (=> d!144355 (= lt!595841 lt!595843)))

(assert (=> d!144355 (= (getValueByKey!724 lt!595842 (_1!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))) (Some!774 (_2!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))))))

(declare-fun lemmaContainsTupThenGetReturnValue!367 (List!31515 (_ BitVec 64) V!55177) Unit!44009)

(assert (=> d!144355 (= lt!595843 (lemmaContainsTupThenGetReturnValue!367 lt!595842 (_1!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)) (_2!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))))))

(declare-fun insertStrictlySorted!496 (List!31515 (_ BitVec 64) V!55177) List!31515)

(assert (=> d!144355 (= lt!595842 (insertStrictlySorted!496 (toList!11035 lt!595775) (_1!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)) (_2!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))))))

(assert (=> d!144355 (= (+!4882 lt!595775 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)) lt!595844)))

(declare-fun b!1348223 () Bool)

(declare-fun res!894589 () Bool)

(assert (=> b!1348223 (=> (not res!894589) (not e!766975))))

(assert (=> b!1348223 (= res!894589 (= (getValueByKey!724 (toList!11035 lt!595844) (_1!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772))) (Some!774 (_2!12202 (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)))))))

(declare-fun b!1348224 () Bool)

(declare-fun contains!9142 (List!31515 tuple2!24382) Bool)

(assert (=> b!1348224 (= e!766975 (contains!9142 (toList!11035 lt!595844) (tuple2!24383 (select (arr!44399 _keys!1571) from!1960) lt!595772)))))

(assert (= (and d!144355 res!894588) b!1348223))

(assert (= (and b!1348223 res!894589) b!1348224))

(declare-fun m!1234855 () Bool)

(assert (=> d!144355 m!1234855))

(declare-fun m!1234857 () Bool)

(assert (=> d!144355 m!1234857))

(declare-fun m!1234859 () Bool)

(assert (=> d!144355 m!1234859))

(declare-fun m!1234861 () Bool)

(assert (=> d!144355 m!1234861))

(declare-fun m!1234863 () Bool)

(assert (=> b!1348223 m!1234863))

(declare-fun m!1234865 () Bool)

(assert (=> b!1348224 m!1234865))

(assert (=> b!1348123 d!144355))

(declare-fun d!144357 () Bool)

(declare-fun e!766976 () Bool)

(assert (=> d!144357 e!766976))

(declare-fun res!894590 () Bool)

(assert (=> d!144357 (=> res!894590 e!766976)))

(declare-fun lt!595848 () Bool)

(assert (=> d!144357 (= res!894590 (not lt!595848))))

(declare-fun lt!595846 () Bool)

(assert (=> d!144357 (= lt!595848 lt!595846)))

(declare-fun lt!595847 () Unit!44009)

(declare-fun e!766977 () Unit!44009)

(assert (=> d!144357 (= lt!595847 e!766977)))

(declare-fun c!126390 () Bool)

(assert (=> d!144357 (= c!126390 lt!595846)))

(assert (=> d!144357 (= lt!595846 (containsKey!741 (toList!11035 lt!595775) k0!1142))))

(assert (=> d!144357 (= (contains!9140 lt!595775 k0!1142) lt!595848)))

(declare-fun b!1348225 () Bool)

(declare-fun lt!595845 () Unit!44009)

(assert (=> b!1348225 (= e!766977 lt!595845)))

(assert (=> b!1348225 (= lt!595845 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11035 lt!595775) k0!1142))))

(assert (=> b!1348225 (isDefined!531 (getValueByKey!724 (toList!11035 lt!595775) k0!1142))))

(declare-fun b!1348226 () Bool)

(declare-fun Unit!44015 () Unit!44009)

(assert (=> b!1348226 (= e!766977 Unit!44015)))

(declare-fun b!1348227 () Bool)

(assert (=> b!1348227 (= e!766976 (isDefined!531 (getValueByKey!724 (toList!11035 lt!595775) k0!1142)))))

(assert (= (and d!144357 c!126390) b!1348225))

(assert (= (and d!144357 (not c!126390)) b!1348226))

(assert (= (and d!144357 (not res!894590)) b!1348227))

(declare-fun m!1234867 () Bool)

(assert (=> d!144357 m!1234867))

(declare-fun m!1234869 () Bool)

(assert (=> b!1348225 m!1234869))

(declare-fun m!1234871 () Bool)

(assert (=> b!1348225 m!1234871))

(assert (=> b!1348225 m!1234871))

(declare-fun m!1234873 () Bool)

(assert (=> b!1348225 m!1234873))

(assert (=> b!1348227 m!1234871))

(assert (=> b!1348227 m!1234871))

(assert (=> b!1348227 m!1234873))

(assert (=> b!1348123 d!144357))

(declare-fun d!144359 () Bool)

(declare-fun e!766978 () Bool)

(assert (=> d!144359 e!766978))

(declare-fun res!894591 () Bool)

(assert (=> d!144359 (=> res!894591 e!766978)))

(declare-fun lt!595852 () Bool)

(assert (=> d!144359 (= res!894591 (not lt!595852))))

(declare-fun lt!595850 () Bool)

(assert (=> d!144359 (= lt!595852 lt!595850)))

(declare-fun lt!595851 () Unit!44009)

(declare-fun e!766979 () Unit!44009)

(assert (=> d!144359 (= lt!595851 e!766979)))

(declare-fun c!126391 () Bool)

(assert (=> d!144359 (= c!126391 lt!595850)))

(assert (=> d!144359 (= lt!595850 (containsKey!741 (toList!11035 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144359 (= (contains!9140 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!595852)))

(declare-fun b!1348228 () Bool)

(declare-fun lt!595849 () Unit!44009)

(assert (=> b!1348228 (= e!766979 lt!595849)))

(assert (=> b!1348228 (= lt!595849 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11035 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> b!1348228 (isDefined!531 (getValueByKey!724 (toList!11035 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1348229 () Bool)

(declare-fun Unit!44016 () Unit!44009)

(assert (=> b!1348229 (= e!766979 Unit!44016)))

(declare-fun b!1348230 () Bool)

(assert (=> b!1348230 (= e!766978 (isDefined!531 (getValueByKey!724 (toList!11035 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144359 c!126391) b!1348228))

(assert (= (and d!144359 (not c!126391)) b!1348229))

(assert (= (and d!144359 (not res!894591)) b!1348230))

(declare-fun m!1234875 () Bool)

(assert (=> d!144359 m!1234875))

(declare-fun m!1234877 () Bool)

(assert (=> b!1348228 m!1234877))

(declare-fun m!1234879 () Bool)

(assert (=> b!1348228 m!1234879))

(assert (=> b!1348228 m!1234879))

(declare-fun m!1234881 () Bool)

(assert (=> b!1348228 m!1234881))

(assert (=> b!1348230 m!1234879))

(assert (=> b!1348230 m!1234879))

(assert (=> b!1348230 m!1234881))

(assert (=> b!1348123 d!144359))

(declare-fun b!1348255 () Bool)

(declare-fun res!894603 () Bool)

(declare-fun e!766995 () Bool)

(assert (=> b!1348255 (=> (not res!894603) (not e!766995))))

(declare-fun lt!595868 () ListLongMap!22039)

(assert (=> b!1348255 (= res!894603 (not (contains!9140 lt!595868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348256 () Bool)

(declare-fun e!767000 () Bool)

(declare-fun e!766997 () Bool)

(assert (=> b!1348256 (= e!767000 e!766997)))

(declare-fun c!126403 () Bool)

(assert (=> b!1348256 (= c!126403 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun b!1348257 () Bool)

(declare-fun isEmpty!1100 (ListLongMap!22039) Bool)

(assert (=> b!1348257 (= e!766997 (isEmpty!1100 lt!595868))))

(declare-fun b!1348258 () Bool)

(assert (=> b!1348258 (= e!766995 e!767000)))

(declare-fun c!126400 () Bool)

(declare-fun e!766996 () Bool)

(assert (=> b!1348258 (= c!126400 e!766996)))

(declare-fun res!894600 () Bool)

(assert (=> b!1348258 (=> (not res!894600) (not e!766996))))

(assert (=> b!1348258 (= res!894600 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun b!1348259 () Bool)

(assert (=> b!1348259 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(assert (=> b!1348259 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44952 _values!1303)))))

(declare-fun e!766998 () Bool)

(declare-fun apply!1031 (ListLongMap!22039 (_ BitVec 64)) V!55177)

(assert (=> b!1348259 (= e!766998 (= (apply!1031 lt!595868 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22443 (select (arr!44400 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!65067 () ListLongMap!22039)

(declare-fun bm!65064 () Bool)

(assert (=> bm!65064 (= call!65067 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348260 () Bool)

(assert (=> b!1348260 (= e!766997 (= lt!595868 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1348261 () Bool)

(assert (=> b!1348261 (= e!767000 e!766998)))

(assert (=> b!1348261 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun res!894602 () Bool)

(assert (=> b!1348261 (= res!894602 (contains!9140 lt!595868 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348261 (=> (not res!894602) (not e!766998))))

(declare-fun b!1348262 () Bool)

(assert (=> b!1348262 (= e!766996 (validKeyInArray!0 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348262 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun d!144361 () Bool)

(assert (=> d!144361 e!766995))

(declare-fun res!894601 () Bool)

(assert (=> d!144361 (=> (not res!894601) (not e!766995))))

(assert (=> d!144361 (= res!894601 (not (contains!9140 lt!595868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!766999 () ListLongMap!22039)

(assert (=> d!144361 (= lt!595868 e!766999)))

(declare-fun c!126402 () Bool)

(assert (=> d!144361 (= c!126402 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(assert (=> d!144361 (validMask!0 mask!1977)))

(assert (=> d!144361 (= (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!595868)))

(declare-fun b!1348263 () Bool)

(declare-fun e!766994 () ListLongMap!22039)

(assert (=> b!1348263 (= e!766999 e!766994)))

(declare-fun c!126401 () Bool)

(assert (=> b!1348263 (= c!126401 (validKeyInArray!0 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348264 () Bool)

(declare-fun lt!595870 () Unit!44009)

(declare-fun lt!595872 () Unit!44009)

(assert (=> b!1348264 (= lt!595870 lt!595872)))

(declare-fun lt!595867 () (_ BitVec 64))

(declare-fun lt!595871 () V!55177)

(declare-fun lt!595873 () (_ BitVec 64))

(declare-fun lt!595869 () ListLongMap!22039)

(assert (=> b!1348264 (not (contains!9140 (+!4882 lt!595869 (tuple2!24383 lt!595867 lt!595871)) lt!595873))))

(declare-fun addStillNotContains!490 (ListLongMap!22039 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44009)

(assert (=> b!1348264 (= lt!595872 (addStillNotContains!490 lt!595869 lt!595867 lt!595871 lt!595873))))

(assert (=> b!1348264 (= lt!595873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348264 (= lt!595871 (get!22443 (select (arr!44400 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348264 (= lt!595867 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1348264 (= lt!595869 call!65067)))

(assert (=> b!1348264 (= e!766994 (+!4882 call!65067 (tuple2!24383 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22443 (select (arr!44400 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348265 () Bool)

(assert (=> b!1348265 (= e!766999 (ListLongMap!22040 Nil!31512))))

(declare-fun b!1348266 () Bool)

(assert (=> b!1348266 (= e!766994 call!65067)))

(assert (= (and d!144361 c!126402) b!1348265))

(assert (= (and d!144361 (not c!126402)) b!1348263))

(assert (= (and b!1348263 c!126401) b!1348264))

(assert (= (and b!1348263 (not c!126401)) b!1348266))

(assert (= (or b!1348264 b!1348266) bm!65064))

(assert (= (and d!144361 res!894601) b!1348255))

(assert (= (and b!1348255 res!894603) b!1348258))

(assert (= (and b!1348258 res!894600) b!1348262))

(assert (= (and b!1348258 c!126400) b!1348261))

(assert (= (and b!1348258 (not c!126400)) b!1348256))

(assert (= (and b!1348261 res!894602) b!1348259))

(assert (= (and b!1348256 c!126403) b!1348260))

(assert (= (and b!1348256 (not c!126403)) b!1348257))

(declare-fun b_lambda!24627 () Bool)

(assert (=> (not b_lambda!24627) (not b!1348259)))

(assert (=> b!1348259 t!46140))

(declare-fun b_and!50893 () Bool)

(assert (= b_and!50883 (and (=> t!46140 result!25959) b_and!50893)))

(declare-fun b_lambda!24629 () Bool)

(assert (=> (not b_lambda!24629) (not b!1348264)))

(assert (=> b!1348264 t!46140))

(declare-fun b_and!50895 () Bool)

(assert (= b_and!50893 (and (=> t!46140 result!25959) b_and!50895)))

(declare-fun m!1234883 () Bool)

(assert (=> b!1348262 m!1234883))

(assert (=> b!1348262 m!1234883))

(declare-fun m!1234885 () Bool)

(assert (=> b!1348262 m!1234885))

(declare-fun m!1234887 () Bool)

(assert (=> d!144361 m!1234887))

(assert (=> d!144361 m!1234693))

(assert (=> b!1348259 m!1234883))

(assert (=> b!1348259 m!1234883))

(declare-fun m!1234889 () Bool)

(assert (=> b!1348259 m!1234889))

(declare-fun m!1234891 () Bool)

(assert (=> b!1348259 m!1234891))

(assert (=> b!1348259 m!1234891))

(assert (=> b!1348259 m!1234719))

(declare-fun m!1234893 () Bool)

(assert (=> b!1348259 m!1234893))

(assert (=> b!1348259 m!1234719))

(declare-fun m!1234895 () Bool)

(assert (=> b!1348260 m!1234895))

(assert (=> b!1348263 m!1234883))

(assert (=> b!1348263 m!1234883))

(assert (=> b!1348263 m!1234885))

(declare-fun m!1234897 () Bool)

(assert (=> b!1348257 m!1234897))

(assert (=> b!1348261 m!1234883))

(assert (=> b!1348261 m!1234883))

(declare-fun m!1234899 () Bool)

(assert (=> b!1348261 m!1234899))

(assert (=> bm!65064 m!1234895))

(declare-fun m!1234901 () Bool)

(assert (=> b!1348255 m!1234901))

(declare-fun m!1234903 () Bool)

(assert (=> b!1348264 m!1234903))

(declare-fun m!1234905 () Bool)

(assert (=> b!1348264 m!1234905))

(assert (=> b!1348264 m!1234883))

(declare-fun m!1234907 () Bool)

(assert (=> b!1348264 m!1234907))

(assert (=> b!1348264 m!1234891))

(assert (=> b!1348264 m!1234891))

(assert (=> b!1348264 m!1234719))

(assert (=> b!1348264 m!1234893))

(assert (=> b!1348264 m!1234719))

(declare-fun m!1234909 () Bool)

(assert (=> b!1348264 m!1234909))

(assert (=> b!1348264 m!1234903))

(assert (=> b!1348123 d!144361))

(declare-fun d!144363 () Bool)

(assert (=> d!144363 (contains!9140 lt!595774 k0!1142)))

(declare-fun lt!595874 () Unit!44009)

(assert (=> d!144363 (= lt!595874 (choose!1985 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595774))))

(assert (=> d!144363 (contains!9140 (+!4882 lt!595774 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(assert (=> d!144363 (= (lemmaInListMapAfterAddingDiffThenInBefore!415 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595774) lt!595874)))

(declare-fun bs!38623 () Bool)

(assert (= bs!38623 d!144363))

(assert (=> bs!38623 m!1234729))

(declare-fun m!1234911 () Bool)

(assert (=> bs!38623 m!1234911))

(declare-fun m!1234913 () Bool)

(assert (=> bs!38623 m!1234913))

(assert (=> bs!38623 m!1234913))

(declare-fun m!1234915 () Bool)

(assert (=> bs!38623 m!1234915))

(assert (=> b!1348123 d!144363))

(declare-fun d!144365 () Bool)

(declare-fun e!767001 () Bool)

(assert (=> d!144365 e!767001))

(declare-fun res!894604 () Bool)

(assert (=> d!144365 (=> (not res!894604) (not e!767001))))

(declare-fun lt!595878 () ListLongMap!22039)

(assert (=> d!144365 (= res!894604 (contains!9140 lt!595878 (_1!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!595876 () List!31515)

(assert (=> d!144365 (= lt!595878 (ListLongMap!22040 lt!595876))))

(declare-fun lt!595875 () Unit!44009)

(declare-fun lt!595877 () Unit!44009)

(assert (=> d!144365 (= lt!595875 lt!595877)))

(assert (=> d!144365 (= (getValueByKey!724 lt!595876 (_1!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!774 (_2!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144365 (= lt!595877 (lemmaContainsTupThenGetReturnValue!367 lt!595876 (_1!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144365 (= lt!595876 (insertStrictlySorted!496 (toList!11035 lt!595775) (_1!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144365 (= (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!595878)))

(declare-fun b!1348267 () Bool)

(declare-fun res!894605 () Bool)

(assert (=> b!1348267 (=> (not res!894605) (not e!767001))))

(assert (=> b!1348267 (= res!894605 (= (getValueByKey!724 (toList!11035 lt!595878) (_1!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!774 (_2!12202 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1348268 () Bool)

(assert (=> b!1348268 (= e!767001 (contains!9142 (toList!11035 lt!595878) (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144365 res!894604) b!1348267))

(assert (= (and b!1348267 res!894605) b!1348268))

(declare-fun m!1234917 () Bool)

(assert (=> d!144365 m!1234917))

(declare-fun m!1234919 () Bool)

(assert (=> d!144365 m!1234919))

(declare-fun m!1234921 () Bool)

(assert (=> d!144365 m!1234921))

(declare-fun m!1234923 () Bool)

(assert (=> d!144365 m!1234923))

(declare-fun m!1234925 () Bool)

(assert (=> b!1348267 m!1234925))

(declare-fun m!1234927 () Bool)

(assert (=> b!1348268 m!1234927))

(assert (=> b!1348123 d!144365))

(declare-fun d!144367 () Bool)

(declare-fun c!126406 () Bool)

(assert (=> d!144367 (= c!126406 ((_ is ValueCellFull!17879) (select (arr!44400 _values!1303) from!1960)))))

(declare-fun e!767004 () V!55177)

(assert (=> d!144367 (= (get!22443 (select (arr!44400 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767004)))

(declare-fun b!1348273 () Bool)

(declare-fun get!22445 (ValueCell!17879 V!55177) V!55177)

(assert (=> b!1348273 (= e!767004 (get!22445 (select (arr!44400 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348274 () Bool)

(declare-fun get!22446 (ValueCell!17879 V!55177) V!55177)

(assert (=> b!1348274 (= e!767004 (get!22446 (select (arr!44400 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144367 c!126406) b!1348273))

(assert (= (and d!144367 (not c!126406)) b!1348274))

(assert (=> b!1348273 m!1234717))

(assert (=> b!1348273 m!1234719))

(declare-fun m!1234929 () Bool)

(assert (=> b!1348273 m!1234929))

(assert (=> b!1348274 m!1234717))

(assert (=> b!1348274 m!1234719))

(declare-fun m!1234931 () Bool)

(assert (=> b!1348274 m!1234931))

(assert (=> b!1348123 d!144367))

(declare-fun b!1348317 () Bool)

(declare-fun e!767040 () Unit!44009)

(declare-fun Unit!44017 () Unit!44009)

(assert (=> b!1348317 (= e!767040 Unit!44017)))

(declare-fun b!1348318 () Bool)

(declare-fun lt!595939 () Unit!44009)

(assert (=> b!1348318 (= e!767040 lt!595939)))

(declare-fun lt!595927 () ListLongMap!22039)

(assert (=> b!1348318 (= lt!595927 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!595924 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595923 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595923 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!595944 () Unit!44009)

(assert (=> b!1348318 (= lt!595944 (addStillContains!1207 lt!595927 lt!595924 zeroValue!1245 lt!595923))))

(assert (=> b!1348318 (contains!9140 (+!4882 lt!595927 (tuple2!24383 lt!595924 zeroValue!1245)) lt!595923)))

(declare-fun lt!595925 () Unit!44009)

(assert (=> b!1348318 (= lt!595925 lt!595944)))

(declare-fun lt!595937 () ListLongMap!22039)

(assert (=> b!1348318 (= lt!595937 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!595940 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595940 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595943 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595943 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!595941 () Unit!44009)

(declare-fun addApplyDifferent!569 (ListLongMap!22039 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44009)

(assert (=> b!1348318 (= lt!595941 (addApplyDifferent!569 lt!595937 lt!595940 minValue!1245 lt!595943))))

(assert (=> b!1348318 (= (apply!1031 (+!4882 lt!595937 (tuple2!24383 lt!595940 minValue!1245)) lt!595943) (apply!1031 lt!595937 lt!595943))))

(declare-fun lt!595933 () Unit!44009)

(assert (=> b!1348318 (= lt!595933 lt!595941)))

(declare-fun lt!595936 () ListLongMap!22039)

(assert (=> b!1348318 (= lt!595936 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!595942 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595935 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595935 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!595928 () Unit!44009)

(assert (=> b!1348318 (= lt!595928 (addApplyDifferent!569 lt!595936 lt!595942 zeroValue!1245 lt!595935))))

(assert (=> b!1348318 (= (apply!1031 (+!4882 lt!595936 (tuple2!24383 lt!595942 zeroValue!1245)) lt!595935) (apply!1031 lt!595936 lt!595935))))

(declare-fun lt!595938 () Unit!44009)

(assert (=> b!1348318 (= lt!595938 lt!595928)))

(declare-fun lt!595932 () ListLongMap!22039)

(assert (=> b!1348318 (= lt!595932 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!595934 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595934 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595926 () (_ BitVec 64))

(assert (=> b!1348318 (= lt!595926 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1348318 (= lt!595939 (addApplyDifferent!569 lt!595932 lt!595934 minValue!1245 lt!595926))))

(assert (=> b!1348318 (= (apply!1031 (+!4882 lt!595932 (tuple2!24383 lt!595934 minValue!1245)) lt!595926) (apply!1031 lt!595932 lt!595926))))

(declare-fun bm!65079 () Bool)

(declare-fun call!65082 () Bool)

(declare-fun lt!595931 () ListLongMap!22039)

(assert (=> bm!65079 (= call!65082 (contains!9140 lt!595931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348319 () Bool)

(declare-fun e!767041 () ListLongMap!22039)

(declare-fun call!65083 () ListLongMap!22039)

(assert (=> b!1348319 (= e!767041 call!65083)))

(declare-fun b!1348320 () Bool)

(declare-fun e!767043 () ListLongMap!22039)

(declare-fun e!767032 () ListLongMap!22039)

(assert (=> b!1348320 (= e!767043 e!767032)))

(declare-fun c!126420 () Bool)

(assert (=> b!1348320 (= c!126420 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348321 () Bool)

(declare-fun e!767037 () Bool)

(declare-fun e!767042 () Bool)

(assert (=> b!1348321 (= e!767037 e!767042)))

(declare-fun res!894626 () Bool)

(assert (=> b!1348321 (= res!894626 call!65082)))

(assert (=> b!1348321 (=> (not res!894626) (not e!767042))))

(declare-fun b!1348322 () Bool)

(declare-fun res!894628 () Bool)

(declare-fun e!767035 () Bool)

(assert (=> b!1348322 (=> (not res!894628) (not e!767035))))

(declare-fun e!767033 () Bool)

(assert (=> b!1348322 (= res!894628 e!767033)))

(declare-fun c!126421 () Bool)

(assert (=> b!1348322 (= c!126421 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65080 () Bool)

(declare-fun call!65088 () ListLongMap!22039)

(declare-fun call!65085 () ListLongMap!22039)

(assert (=> bm!65080 (= call!65088 call!65085)))

(declare-fun d!144369 () Bool)

(assert (=> d!144369 e!767035))

(declare-fun res!894624 () Bool)

(assert (=> d!144369 (=> (not res!894624) (not e!767035))))

(assert (=> d!144369 (= res!894624 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))))

(declare-fun lt!595929 () ListLongMap!22039)

(assert (=> d!144369 (= lt!595931 lt!595929)))

(declare-fun lt!595930 () Unit!44009)

(assert (=> d!144369 (= lt!595930 e!767040)))

(declare-fun c!126423 () Bool)

(declare-fun e!767038 () Bool)

(assert (=> d!144369 (= c!126423 e!767038)))

(declare-fun res!894632 () Bool)

(assert (=> d!144369 (=> (not res!894632) (not e!767038))))

(assert (=> d!144369 (= res!894632 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(assert (=> d!144369 (= lt!595929 e!767043)))

(declare-fun c!126419 () Bool)

(assert (=> d!144369 (= c!126419 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144369 (validMask!0 mask!1977)))

(assert (=> d!144369 (= (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!595931)))

(declare-fun b!1348323 () Bool)

(assert (=> b!1348323 (= e!767038 (validKeyInArray!0 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348324 () Bool)

(assert (=> b!1348324 (= e!767032 call!65088)))

(declare-fun call!65084 () ListLongMap!22039)

(declare-fun bm!65081 () Bool)

(declare-fun call!65087 () ListLongMap!22039)

(assert (=> bm!65081 (= call!65085 (+!4882 (ite c!126419 call!65087 (ite c!126420 call!65084 call!65083)) (ite (or c!126419 c!126420) (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65082 () Bool)

(assert (=> bm!65082 (= call!65083 call!65084)))

(declare-fun b!1348325 () Bool)

(assert (=> b!1348325 (= e!767041 call!65088)))

(declare-fun b!1348326 () Bool)

(assert (=> b!1348326 (= e!767035 e!767037)))

(declare-fun c!126422 () Bool)

(assert (=> b!1348326 (= c!126422 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348327 () Bool)

(declare-fun e!767031 () Bool)

(declare-fun e!767036 () Bool)

(assert (=> b!1348327 (= e!767031 e!767036)))

(declare-fun res!894630 () Bool)

(assert (=> b!1348327 (=> (not res!894630) (not e!767036))))

(assert (=> b!1348327 (= res!894630 (contains!9140 lt!595931 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun bm!65083 () Bool)

(assert (=> bm!65083 (= call!65084 call!65087)))

(declare-fun b!1348328 () Bool)

(declare-fun call!65086 () Bool)

(assert (=> b!1348328 (= e!767033 (not call!65086))))

(declare-fun b!1348329 () Bool)

(assert (=> b!1348329 (= e!767037 (not call!65082))))

(declare-fun b!1348330 () Bool)

(assert (=> b!1348330 (= e!767042 (= (apply!1031 lt!595931 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1348331 () Bool)

(declare-fun e!767039 () Bool)

(assert (=> b!1348331 (= e!767039 (validKeyInArray!0 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348332 () Bool)

(assert (=> b!1348332 (= e!767036 (= (apply!1031 lt!595931 (select (arr!44399 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22443 (select (arr!44400 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348332 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44952 _values!1303)))))

(assert (=> b!1348332 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun b!1348333 () Bool)

(assert (=> b!1348333 (= e!767043 (+!4882 call!65085 (tuple2!24383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun bm!65084 () Bool)

(assert (=> bm!65084 (= call!65086 (contains!9140 lt!595931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65085 () Bool)

(assert (=> bm!65085 (= call!65087 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348334 () Bool)

(declare-fun c!126424 () Bool)

(assert (=> b!1348334 (= c!126424 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348334 (= e!767032 e!767041)))

(declare-fun b!1348335 () Bool)

(declare-fun e!767034 () Bool)

(assert (=> b!1348335 (= e!767034 (= (apply!1031 lt!595931 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348336 () Bool)

(declare-fun res!894625 () Bool)

(assert (=> b!1348336 (=> (not res!894625) (not e!767035))))

(assert (=> b!1348336 (= res!894625 e!767031)))

(declare-fun res!894627 () Bool)

(assert (=> b!1348336 (=> res!894627 e!767031)))

(assert (=> b!1348336 (= res!894627 (not e!767039))))

(declare-fun res!894631 () Bool)

(assert (=> b!1348336 (=> (not res!894631) (not e!767039))))

(assert (=> b!1348336 (= res!894631 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44951 _keys!1571)))))

(declare-fun b!1348337 () Bool)

(assert (=> b!1348337 (= e!767033 e!767034)))

(declare-fun res!894629 () Bool)

(assert (=> b!1348337 (= res!894629 call!65086)))

(assert (=> b!1348337 (=> (not res!894629) (not e!767034))))

(assert (= (and d!144369 c!126419) b!1348333))

(assert (= (and d!144369 (not c!126419)) b!1348320))

(assert (= (and b!1348320 c!126420) b!1348324))

(assert (= (and b!1348320 (not c!126420)) b!1348334))

(assert (= (and b!1348334 c!126424) b!1348325))

(assert (= (and b!1348334 (not c!126424)) b!1348319))

(assert (= (or b!1348325 b!1348319) bm!65082))

(assert (= (or b!1348324 bm!65082) bm!65083))

(assert (= (or b!1348324 b!1348325) bm!65080))

(assert (= (or b!1348333 bm!65083) bm!65085))

(assert (= (or b!1348333 bm!65080) bm!65081))

(assert (= (and d!144369 res!894632) b!1348323))

(assert (= (and d!144369 c!126423) b!1348318))

(assert (= (and d!144369 (not c!126423)) b!1348317))

(assert (= (and d!144369 res!894624) b!1348336))

(assert (= (and b!1348336 res!894631) b!1348331))

(assert (= (and b!1348336 (not res!894627)) b!1348327))

(assert (= (and b!1348327 res!894630) b!1348332))

(assert (= (and b!1348336 res!894625) b!1348322))

(assert (= (and b!1348322 c!126421) b!1348337))

(assert (= (and b!1348322 (not c!126421)) b!1348328))

(assert (= (and b!1348337 res!894629) b!1348335))

(assert (= (or b!1348337 b!1348328) bm!65084))

(assert (= (and b!1348322 res!894628) b!1348326))

(assert (= (and b!1348326 c!126422) b!1348321))

(assert (= (and b!1348326 (not c!126422)) b!1348329))

(assert (= (and b!1348321 res!894626) b!1348330))

(assert (= (or b!1348321 b!1348329) bm!65079))

(declare-fun b_lambda!24631 () Bool)

(assert (=> (not b_lambda!24631) (not b!1348332)))

(assert (=> b!1348332 t!46140))

(declare-fun b_and!50897 () Bool)

(assert (= b_and!50895 (and (=> t!46140 result!25959) b_and!50897)))

(declare-fun m!1234933 () Bool)

(assert (=> b!1348333 m!1234933))

(declare-fun m!1234935 () Bool)

(assert (=> b!1348318 m!1234935))

(declare-fun m!1234937 () Bool)

(assert (=> b!1348318 m!1234937))

(declare-fun m!1234939 () Bool)

(assert (=> b!1348318 m!1234939))

(declare-fun m!1234941 () Bool)

(assert (=> b!1348318 m!1234941))

(declare-fun m!1234943 () Bool)

(assert (=> b!1348318 m!1234943))

(declare-fun m!1234945 () Bool)

(assert (=> b!1348318 m!1234945))

(assert (=> b!1348318 m!1234941))

(declare-fun m!1234947 () Bool)

(assert (=> b!1348318 m!1234947))

(declare-fun m!1234949 () Bool)

(assert (=> b!1348318 m!1234949))

(declare-fun m!1234951 () Bool)

(assert (=> b!1348318 m!1234951))

(assert (=> b!1348318 m!1234939))

(declare-fun m!1234953 () Bool)

(assert (=> b!1348318 m!1234953))

(declare-fun m!1234955 () Bool)

(assert (=> b!1348318 m!1234955))

(declare-fun m!1234957 () Bool)

(assert (=> b!1348318 m!1234957))

(assert (=> b!1348318 m!1234883))

(assert (=> b!1348318 m!1234713))

(declare-fun m!1234959 () Bool)

(assert (=> b!1348318 m!1234959))

(assert (=> b!1348318 m!1234935))

(declare-fun m!1234961 () Bool)

(assert (=> b!1348318 m!1234961))

(assert (=> b!1348318 m!1234947))

(declare-fun m!1234963 () Bool)

(assert (=> b!1348318 m!1234963))

(assert (=> b!1348332 m!1234883))

(declare-fun m!1234965 () Bool)

(assert (=> b!1348332 m!1234965))

(assert (=> b!1348332 m!1234719))

(assert (=> b!1348332 m!1234891))

(assert (=> b!1348332 m!1234719))

(assert (=> b!1348332 m!1234893))

(assert (=> b!1348332 m!1234883))

(assert (=> b!1348332 m!1234891))

(assert (=> b!1348323 m!1234883))

(assert (=> b!1348323 m!1234883))

(assert (=> b!1348323 m!1234885))

(assert (=> d!144369 m!1234693))

(declare-fun m!1234967 () Bool)

(assert (=> b!1348330 m!1234967))

(assert (=> b!1348327 m!1234883))

(assert (=> b!1348327 m!1234883))

(declare-fun m!1234969 () Bool)

(assert (=> b!1348327 m!1234969))

(assert (=> bm!65085 m!1234713))

(declare-fun m!1234971 () Bool)

(assert (=> bm!65084 m!1234971))

(declare-fun m!1234973 () Bool)

(assert (=> bm!65079 m!1234973))

(declare-fun m!1234975 () Bool)

(assert (=> b!1348335 m!1234975))

(assert (=> b!1348331 m!1234883))

(assert (=> b!1348331 m!1234883))

(assert (=> b!1348331 m!1234885))

(declare-fun m!1234977 () Bool)

(assert (=> bm!65081 m!1234977))

(assert (=> b!1348123 d!144369))

(declare-fun d!144371 () Bool)

(assert (=> d!144371 (contains!9140 (+!4882 lt!595775 (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-fun lt!595947 () Unit!44009)

(declare-fun choose!1986 (ListLongMap!22039 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44009)

(assert (=> d!144371 (= lt!595947 (choose!1986 lt!595775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> d!144371 (contains!9140 lt!595775 k0!1142)))

(assert (=> d!144371 (= (addStillContains!1207 lt!595775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142) lt!595947)))

(declare-fun bs!38624 () Bool)

(assert (= bs!38624 d!144371))

(assert (=> bs!38624 m!1234725))

(assert (=> bs!38624 m!1234725))

(assert (=> bs!38624 m!1234727))

(declare-fun m!1234979 () Bool)

(assert (=> bs!38624 m!1234979))

(assert (=> bs!38624 m!1234737))

(assert (=> b!1348123 d!144371))

(declare-fun d!144373 () Bool)

(assert (=> d!144373 (= (validKeyInArray!0 (select (arr!44399 _keys!1571) from!1960)) (and (not (= (select (arr!44399 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44399 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348117 d!144373))

(declare-fun d!144375 () Bool)

(declare-fun res!894641 () Bool)

(declare-fun e!767055 () Bool)

(assert (=> d!144375 (=> res!894641 e!767055)))

(assert (=> d!144375 (= res!894641 (bvsge #b00000000000000000000000000000000 (size!44951 _keys!1571)))))

(assert (=> d!144375 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31513) e!767055)))

(declare-fun b!1348349 () Bool)

(declare-fun e!767052 () Bool)

(declare-fun call!65091 () Bool)

(assert (=> b!1348349 (= e!767052 call!65091)))

(declare-fun b!1348350 () Bool)

(declare-fun e!767053 () Bool)

(declare-fun contains!9143 (List!31516 (_ BitVec 64)) Bool)

(assert (=> b!1348350 (= e!767053 (contains!9143 Nil!31513 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348351 () Bool)

(assert (=> b!1348351 (= e!767052 call!65091)))

(declare-fun b!1348352 () Bool)

(declare-fun e!767054 () Bool)

(assert (=> b!1348352 (= e!767055 e!767054)))

(declare-fun res!894639 () Bool)

(assert (=> b!1348352 (=> (not res!894639) (not e!767054))))

(assert (=> b!1348352 (= res!894639 (not e!767053))))

(declare-fun res!894640 () Bool)

(assert (=> b!1348352 (=> (not res!894640) (not e!767053))))

(assert (=> b!1348352 (= res!894640 (validKeyInArray!0 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348353 () Bool)

(assert (=> b!1348353 (= e!767054 e!767052)))

(declare-fun c!126427 () Bool)

(assert (=> b!1348353 (= c!126427 (validKeyInArray!0 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65088 () Bool)

(assert (=> bm!65088 (= call!65091 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126427 (Cons!31512 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000) Nil!31513) Nil!31513)))))

(assert (= (and d!144375 (not res!894641)) b!1348352))

(assert (= (and b!1348352 res!894640) b!1348350))

(assert (= (and b!1348352 res!894639) b!1348353))

(assert (= (and b!1348353 c!126427) b!1348351))

(assert (= (and b!1348353 (not c!126427)) b!1348349))

(assert (= (or b!1348351 b!1348349) bm!65088))

(declare-fun m!1234981 () Bool)

(assert (=> b!1348350 m!1234981))

(assert (=> b!1348350 m!1234981))

(declare-fun m!1234983 () Bool)

(assert (=> b!1348350 m!1234983))

(assert (=> b!1348352 m!1234981))

(assert (=> b!1348352 m!1234981))

(declare-fun m!1234985 () Bool)

(assert (=> b!1348352 m!1234985))

(assert (=> b!1348353 m!1234981))

(assert (=> b!1348353 m!1234981))

(assert (=> b!1348353 m!1234985))

(assert (=> bm!65088 m!1234981))

(declare-fun m!1234987 () Bool)

(assert (=> bm!65088 m!1234987))

(assert (=> b!1348127 d!144375))

(declare-fun d!144377 () Bool)

(declare-fun e!767056 () Bool)

(assert (=> d!144377 e!767056))

(declare-fun res!894642 () Bool)

(assert (=> d!144377 (=> res!894642 e!767056)))

(declare-fun lt!595951 () Bool)

(assert (=> d!144377 (= res!894642 (not lt!595951))))

(declare-fun lt!595949 () Bool)

(assert (=> d!144377 (= lt!595951 lt!595949)))

(declare-fun lt!595950 () Unit!44009)

(declare-fun e!767057 () Unit!44009)

(assert (=> d!144377 (= lt!595950 e!767057)))

(declare-fun c!126428 () Bool)

(assert (=> d!144377 (= c!126428 lt!595949)))

(assert (=> d!144377 (= lt!595949 (containsKey!741 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144377 (= (contains!9140 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!595951)))

(declare-fun b!1348354 () Bool)

(declare-fun lt!595948 () Unit!44009)

(assert (=> b!1348354 (= e!767057 lt!595948)))

(assert (=> b!1348354 (= lt!595948 (lemmaContainsKeyImpliesGetValueByKeyDefined!488 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1348354 (isDefined!531 (getValueByKey!724 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1348355 () Bool)

(declare-fun Unit!44018 () Unit!44009)

(assert (=> b!1348355 (= e!767057 Unit!44018)))

(declare-fun b!1348356 () Bool)

(assert (=> b!1348356 (= e!767056 (isDefined!531 (getValueByKey!724 (toList!11035 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144377 c!126428) b!1348354))

(assert (= (and d!144377 (not c!126428)) b!1348355))

(assert (= (and d!144377 (not res!894642)) b!1348356))

(declare-fun m!1234989 () Bool)

(assert (=> d!144377 m!1234989))

(declare-fun m!1234991 () Bool)

(assert (=> b!1348354 m!1234991))

(declare-fun m!1234993 () Bool)

(assert (=> b!1348354 m!1234993))

(assert (=> b!1348354 m!1234993))

(declare-fun m!1234995 () Bool)

(assert (=> b!1348354 m!1234995))

(assert (=> b!1348356 m!1234993))

(assert (=> b!1348356 m!1234993))

(assert (=> b!1348356 m!1234995))

(assert (=> b!1348126 d!144377))

(declare-fun b!1348357 () Bool)

(declare-fun e!767067 () Unit!44009)

(declare-fun Unit!44019 () Unit!44009)

(assert (=> b!1348357 (= e!767067 Unit!44019)))

(declare-fun b!1348358 () Bool)

(declare-fun lt!595968 () Unit!44009)

(assert (=> b!1348358 (= e!767067 lt!595968)))

(declare-fun lt!595956 () ListLongMap!22039)

(assert (=> b!1348358 (= lt!595956 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595953 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595952 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595952 (select (arr!44399 _keys!1571) from!1960))))

(declare-fun lt!595973 () Unit!44009)

(assert (=> b!1348358 (= lt!595973 (addStillContains!1207 lt!595956 lt!595953 zeroValue!1245 lt!595952))))

(assert (=> b!1348358 (contains!9140 (+!4882 lt!595956 (tuple2!24383 lt!595953 zeroValue!1245)) lt!595952)))

(declare-fun lt!595954 () Unit!44009)

(assert (=> b!1348358 (= lt!595954 lt!595973)))

(declare-fun lt!595966 () ListLongMap!22039)

(assert (=> b!1348358 (= lt!595966 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595969 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595972 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595972 (select (arr!44399 _keys!1571) from!1960))))

(declare-fun lt!595970 () Unit!44009)

(assert (=> b!1348358 (= lt!595970 (addApplyDifferent!569 lt!595966 lt!595969 minValue!1245 lt!595972))))

(assert (=> b!1348358 (= (apply!1031 (+!4882 lt!595966 (tuple2!24383 lt!595969 minValue!1245)) lt!595972) (apply!1031 lt!595966 lt!595972))))

(declare-fun lt!595962 () Unit!44009)

(assert (=> b!1348358 (= lt!595962 lt!595970)))

(declare-fun lt!595965 () ListLongMap!22039)

(assert (=> b!1348358 (= lt!595965 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595971 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595964 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595964 (select (arr!44399 _keys!1571) from!1960))))

(declare-fun lt!595957 () Unit!44009)

(assert (=> b!1348358 (= lt!595957 (addApplyDifferent!569 lt!595965 lt!595971 zeroValue!1245 lt!595964))))

(assert (=> b!1348358 (= (apply!1031 (+!4882 lt!595965 (tuple2!24383 lt!595971 zeroValue!1245)) lt!595964) (apply!1031 lt!595965 lt!595964))))

(declare-fun lt!595967 () Unit!44009)

(assert (=> b!1348358 (= lt!595967 lt!595957)))

(declare-fun lt!595961 () ListLongMap!22039)

(assert (=> b!1348358 (= lt!595961 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!595963 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595963 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!595955 () (_ BitVec 64))

(assert (=> b!1348358 (= lt!595955 (select (arr!44399 _keys!1571) from!1960))))

(assert (=> b!1348358 (= lt!595968 (addApplyDifferent!569 lt!595961 lt!595963 minValue!1245 lt!595955))))

(assert (=> b!1348358 (= (apply!1031 (+!4882 lt!595961 (tuple2!24383 lt!595963 minValue!1245)) lt!595955) (apply!1031 lt!595961 lt!595955))))

(declare-fun bm!65089 () Bool)

(declare-fun call!65092 () Bool)

(declare-fun lt!595960 () ListLongMap!22039)

(assert (=> bm!65089 (= call!65092 (contains!9140 lt!595960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348359 () Bool)

(declare-fun e!767068 () ListLongMap!22039)

(declare-fun call!65093 () ListLongMap!22039)

(assert (=> b!1348359 (= e!767068 call!65093)))

(declare-fun b!1348360 () Bool)

(declare-fun e!767070 () ListLongMap!22039)

(declare-fun e!767059 () ListLongMap!22039)

(assert (=> b!1348360 (= e!767070 e!767059)))

(declare-fun c!126430 () Bool)

(assert (=> b!1348360 (= c!126430 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348361 () Bool)

(declare-fun e!767064 () Bool)

(declare-fun e!767069 () Bool)

(assert (=> b!1348361 (= e!767064 e!767069)))

(declare-fun res!894645 () Bool)

(assert (=> b!1348361 (= res!894645 call!65092)))

(assert (=> b!1348361 (=> (not res!894645) (not e!767069))))

(declare-fun b!1348362 () Bool)

(declare-fun res!894647 () Bool)

(declare-fun e!767062 () Bool)

(assert (=> b!1348362 (=> (not res!894647) (not e!767062))))

(declare-fun e!767060 () Bool)

(assert (=> b!1348362 (= res!894647 e!767060)))

(declare-fun c!126431 () Bool)

(assert (=> b!1348362 (= c!126431 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65090 () Bool)

(declare-fun call!65098 () ListLongMap!22039)

(declare-fun call!65095 () ListLongMap!22039)

(assert (=> bm!65090 (= call!65098 call!65095)))

(declare-fun d!144379 () Bool)

(assert (=> d!144379 e!767062))

(declare-fun res!894643 () Bool)

(assert (=> d!144379 (=> (not res!894643) (not e!767062))))

(assert (=> d!144379 (= res!894643 (or (bvsge from!1960 (size!44951 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44951 _keys!1571)))))))

(declare-fun lt!595958 () ListLongMap!22039)

(assert (=> d!144379 (= lt!595960 lt!595958)))

(declare-fun lt!595959 () Unit!44009)

(assert (=> d!144379 (= lt!595959 e!767067)))

(declare-fun c!126433 () Bool)

(declare-fun e!767065 () Bool)

(assert (=> d!144379 (= c!126433 e!767065)))

(declare-fun res!894651 () Bool)

(assert (=> d!144379 (=> (not res!894651) (not e!767065))))

(assert (=> d!144379 (= res!894651 (bvslt from!1960 (size!44951 _keys!1571)))))

(assert (=> d!144379 (= lt!595958 e!767070)))

(declare-fun c!126429 () Bool)

(assert (=> d!144379 (= c!126429 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144379 (validMask!0 mask!1977)))

(assert (=> d!144379 (= (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!595960)))

(declare-fun b!1348363 () Bool)

(assert (=> b!1348363 (= e!767065 (validKeyInArray!0 (select (arr!44399 _keys!1571) from!1960)))))

(declare-fun b!1348364 () Bool)

(assert (=> b!1348364 (= e!767059 call!65098)))

(declare-fun call!65094 () ListLongMap!22039)

(declare-fun bm!65091 () Bool)

(declare-fun call!65097 () ListLongMap!22039)

(assert (=> bm!65091 (= call!65095 (+!4882 (ite c!126429 call!65097 (ite c!126430 call!65094 call!65093)) (ite (or c!126429 c!126430) (tuple2!24383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65092 () Bool)

(assert (=> bm!65092 (= call!65093 call!65094)))

(declare-fun b!1348365 () Bool)

(assert (=> b!1348365 (= e!767068 call!65098)))

(declare-fun b!1348366 () Bool)

(assert (=> b!1348366 (= e!767062 e!767064)))

(declare-fun c!126432 () Bool)

(assert (=> b!1348366 (= c!126432 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348367 () Bool)

(declare-fun e!767058 () Bool)

(declare-fun e!767063 () Bool)

(assert (=> b!1348367 (= e!767058 e!767063)))

(declare-fun res!894649 () Bool)

(assert (=> b!1348367 (=> (not res!894649) (not e!767063))))

(assert (=> b!1348367 (= res!894649 (contains!9140 lt!595960 (select (arr!44399 _keys!1571) from!1960)))))

(assert (=> b!1348367 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44951 _keys!1571)))))

(declare-fun bm!65093 () Bool)

(assert (=> bm!65093 (= call!65094 call!65097)))

(declare-fun b!1348368 () Bool)

(declare-fun call!65096 () Bool)

(assert (=> b!1348368 (= e!767060 (not call!65096))))

(declare-fun b!1348369 () Bool)

(assert (=> b!1348369 (= e!767064 (not call!65092))))

(declare-fun b!1348370 () Bool)

(assert (=> b!1348370 (= e!767069 (= (apply!1031 lt!595960 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1348371 () Bool)

(declare-fun e!767066 () Bool)

(assert (=> b!1348371 (= e!767066 (validKeyInArray!0 (select (arr!44399 _keys!1571) from!1960)))))

(declare-fun b!1348372 () Bool)

(assert (=> b!1348372 (= e!767063 (= (apply!1031 lt!595960 (select (arr!44399 _keys!1571) from!1960)) (get!22443 (select (arr!44400 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348372 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44952 _values!1303)))))

(assert (=> b!1348372 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44951 _keys!1571)))))

(declare-fun b!1348373 () Bool)

(assert (=> b!1348373 (= e!767070 (+!4882 call!65095 (tuple2!24383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun bm!65094 () Bool)

(assert (=> bm!65094 (= call!65096 (contains!9140 lt!595960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65095 () Bool)

(assert (=> bm!65095 (= call!65097 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1348374 () Bool)

(declare-fun c!126434 () Bool)

(assert (=> b!1348374 (= c!126434 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348374 (= e!767059 e!767068)))

(declare-fun b!1348375 () Bool)

(declare-fun e!767061 () Bool)

(assert (=> b!1348375 (= e!767061 (= (apply!1031 lt!595960 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348376 () Bool)

(declare-fun res!894644 () Bool)

(assert (=> b!1348376 (=> (not res!894644) (not e!767062))))

(assert (=> b!1348376 (= res!894644 e!767058)))

(declare-fun res!894646 () Bool)

(assert (=> b!1348376 (=> res!894646 e!767058)))

(assert (=> b!1348376 (= res!894646 (not e!767066))))

(declare-fun res!894650 () Bool)

(assert (=> b!1348376 (=> (not res!894650) (not e!767066))))

(assert (=> b!1348376 (= res!894650 (bvslt from!1960 (size!44951 _keys!1571)))))

(declare-fun b!1348377 () Bool)

(assert (=> b!1348377 (= e!767060 e!767061)))

(declare-fun res!894648 () Bool)

(assert (=> b!1348377 (= res!894648 call!65096)))

(assert (=> b!1348377 (=> (not res!894648) (not e!767061))))

(assert (= (and d!144379 c!126429) b!1348373))

(assert (= (and d!144379 (not c!126429)) b!1348360))

(assert (= (and b!1348360 c!126430) b!1348364))

(assert (= (and b!1348360 (not c!126430)) b!1348374))

(assert (= (and b!1348374 c!126434) b!1348365))

(assert (= (and b!1348374 (not c!126434)) b!1348359))

(assert (= (or b!1348365 b!1348359) bm!65092))

(assert (= (or b!1348364 bm!65092) bm!65093))

(assert (= (or b!1348364 b!1348365) bm!65090))

(assert (= (or b!1348373 bm!65093) bm!65095))

(assert (= (or b!1348373 bm!65090) bm!65091))

(assert (= (and d!144379 res!894651) b!1348363))

(assert (= (and d!144379 c!126433) b!1348358))

(assert (= (and d!144379 (not c!126433)) b!1348357))

(assert (= (and d!144379 res!894643) b!1348376))

(assert (= (and b!1348376 res!894650) b!1348371))

(assert (= (and b!1348376 (not res!894646)) b!1348367))

(assert (= (and b!1348367 res!894649) b!1348372))

(assert (= (and b!1348376 res!894644) b!1348362))

(assert (= (and b!1348362 c!126431) b!1348377))

(assert (= (and b!1348362 (not c!126431)) b!1348368))

(assert (= (and b!1348377 res!894648) b!1348375))

(assert (= (or b!1348377 b!1348368) bm!65094))

(assert (= (and b!1348362 res!894647) b!1348366))

(assert (= (and b!1348366 c!126432) b!1348361))

(assert (= (and b!1348366 (not c!126432)) b!1348369))

(assert (= (and b!1348361 res!894645) b!1348370))

(assert (= (or b!1348361 b!1348369) bm!65089))

(declare-fun b_lambda!24633 () Bool)

(assert (=> (not b_lambda!24633) (not b!1348372)))

(assert (=> b!1348372 t!46140))

(declare-fun b_and!50899 () Bool)

(assert (= b_and!50897 (and (=> t!46140 result!25959) b_and!50899)))

(declare-fun m!1234997 () Bool)

(assert (=> b!1348373 m!1234997))

(declare-fun m!1234999 () Bool)

(assert (=> b!1348358 m!1234999))

(declare-fun m!1235001 () Bool)

(assert (=> b!1348358 m!1235001))

(declare-fun m!1235003 () Bool)

(assert (=> b!1348358 m!1235003))

(declare-fun m!1235005 () Bool)

(assert (=> b!1348358 m!1235005))

(declare-fun m!1235007 () Bool)

(assert (=> b!1348358 m!1235007))

(declare-fun m!1235009 () Bool)

(assert (=> b!1348358 m!1235009))

(assert (=> b!1348358 m!1235005))

(declare-fun m!1235011 () Bool)

(assert (=> b!1348358 m!1235011))

(declare-fun m!1235013 () Bool)

(assert (=> b!1348358 m!1235013))

(declare-fun m!1235015 () Bool)

(assert (=> b!1348358 m!1235015))

(assert (=> b!1348358 m!1235003))

(declare-fun m!1235017 () Bool)

(assert (=> b!1348358 m!1235017))

(declare-fun m!1235019 () Bool)

(assert (=> b!1348358 m!1235019))

(declare-fun m!1235021 () Bool)

(assert (=> b!1348358 m!1235021))

(assert (=> b!1348358 m!1234699))

(declare-fun m!1235023 () Bool)

(assert (=> b!1348358 m!1235023))

(declare-fun m!1235025 () Bool)

(assert (=> b!1348358 m!1235025))

(assert (=> b!1348358 m!1234999))

(declare-fun m!1235027 () Bool)

(assert (=> b!1348358 m!1235027))

(assert (=> b!1348358 m!1235011))

(declare-fun m!1235029 () Bool)

(assert (=> b!1348358 m!1235029))

(assert (=> b!1348372 m!1234699))

(declare-fun m!1235031 () Bool)

(assert (=> b!1348372 m!1235031))

(assert (=> b!1348372 m!1234719))

(assert (=> b!1348372 m!1234717))

(assert (=> b!1348372 m!1234719))

(assert (=> b!1348372 m!1234721))

(assert (=> b!1348372 m!1234699))

(assert (=> b!1348372 m!1234717))

(assert (=> b!1348363 m!1234699))

(assert (=> b!1348363 m!1234699))

(assert (=> b!1348363 m!1234701))

(assert (=> d!144379 m!1234693))

(declare-fun m!1235033 () Bool)

(assert (=> b!1348370 m!1235033))

(assert (=> b!1348367 m!1234699))

(assert (=> b!1348367 m!1234699))

(declare-fun m!1235035 () Bool)

(assert (=> b!1348367 m!1235035))

(assert (=> bm!65095 m!1235023))

(declare-fun m!1235037 () Bool)

(assert (=> bm!65094 m!1235037))

(declare-fun m!1235039 () Bool)

(assert (=> bm!65089 m!1235039))

(declare-fun m!1235041 () Bool)

(assert (=> b!1348375 m!1235041))

(assert (=> b!1348371 m!1234699))

(assert (=> b!1348371 m!1234699))

(assert (=> b!1348371 m!1234701))

(declare-fun m!1235043 () Bool)

(assert (=> bm!65091 m!1235043))

(assert (=> b!1348126 d!144379))

(declare-fun bm!65098 () Bool)

(declare-fun call!65101 () Bool)

(assert (=> bm!65098 (= call!65101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348386 () Bool)

(declare-fun e!767078 () Bool)

(assert (=> b!1348386 (= e!767078 call!65101)))

(declare-fun b!1348387 () Bool)

(declare-fun e!767077 () Bool)

(assert (=> b!1348387 (= e!767077 e!767078)))

(declare-fun c!126437 () Bool)

(assert (=> b!1348387 (= c!126437 (validKeyInArray!0 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348389 () Bool)

(declare-fun e!767079 () Bool)

(assert (=> b!1348389 (= e!767079 call!65101)))

(declare-fun b!1348388 () Bool)

(assert (=> b!1348388 (= e!767078 e!767079)))

(declare-fun lt!595981 () (_ BitVec 64))

(assert (=> b!1348388 (= lt!595981 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!595980 () Unit!44009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91887 (_ BitVec 64) (_ BitVec 32)) Unit!44009)

(assert (=> b!1348388 (= lt!595980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595981 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1348388 (arrayContainsKey!0 _keys!1571 lt!595981 #b00000000000000000000000000000000)))

(declare-fun lt!595982 () Unit!44009)

(assert (=> b!1348388 (= lt!595982 lt!595980)))

(declare-fun res!894656 () Bool)

(declare-datatypes ((SeekEntryResult!10056 0))(
  ( (MissingZero!10056 (index!42595 (_ BitVec 32))) (Found!10056 (index!42596 (_ BitVec 32))) (Intermediate!10056 (undefined!10868 Bool) (index!42597 (_ BitVec 32)) (x!120670 (_ BitVec 32))) (Undefined!10056) (MissingVacant!10056 (index!42598 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91887 (_ BitVec 32)) SeekEntryResult!10056)

(assert (=> b!1348388 (= res!894656 (= (seekEntryOrOpen!0 (select (arr!44399 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10056 #b00000000000000000000000000000000)))))

(assert (=> b!1348388 (=> (not res!894656) (not e!767079))))

(declare-fun d!144381 () Bool)

(declare-fun res!894657 () Bool)

(assert (=> d!144381 (=> res!894657 e!767077)))

(assert (=> d!144381 (= res!894657 (bvsge #b00000000000000000000000000000000 (size!44951 _keys!1571)))))

(assert (=> d!144381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767077)))

(assert (= (and d!144381 (not res!894657)) b!1348387))

(assert (= (and b!1348387 c!126437) b!1348388))

(assert (= (and b!1348387 (not c!126437)) b!1348386))

(assert (= (and b!1348388 res!894656) b!1348389))

(assert (= (or b!1348389 b!1348386) bm!65098))

(declare-fun m!1235045 () Bool)

(assert (=> bm!65098 m!1235045))

(assert (=> b!1348387 m!1234981))

(assert (=> b!1348387 m!1234981))

(assert (=> b!1348387 m!1234985))

(assert (=> b!1348388 m!1234981))

(declare-fun m!1235047 () Bool)

(assert (=> b!1348388 m!1235047))

(declare-fun m!1235049 () Bool)

(assert (=> b!1348388 m!1235049))

(assert (=> b!1348388 m!1234981))

(declare-fun m!1235051 () Bool)

(assert (=> b!1348388 m!1235051))

(assert (=> b!1348120 d!144381))

(declare-fun d!144383 () Bool)

(assert (=> d!144383 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113562 d!144383))

(declare-fun d!144385 () Bool)

(assert (=> d!144385 (= (array_inv!33643 _keys!1571) (bvsge (size!44951 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113562 d!144385))

(declare-fun d!144387 () Bool)

(assert (=> d!144387 (= (array_inv!33644 _values!1303) (bvsge (size!44952 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113562 d!144387))

(declare-fun b!1348397 () Bool)

(declare-fun e!767084 () Bool)

(assert (=> b!1348397 (= e!767084 tp_is_empty!37555)))

(declare-fun mapNonEmpty!58052 () Bool)

(declare-fun mapRes!58052 () Bool)

(declare-fun tp!110490 () Bool)

(declare-fun e!767085 () Bool)

(assert (=> mapNonEmpty!58052 (= mapRes!58052 (and tp!110490 e!767085))))

(declare-fun mapRest!58052 () (Array (_ BitVec 32) ValueCell!17879))

(declare-fun mapValue!58052 () ValueCell!17879)

(declare-fun mapKey!58052 () (_ BitVec 32))

(assert (=> mapNonEmpty!58052 (= mapRest!58043 (store mapRest!58052 mapKey!58052 mapValue!58052))))

(declare-fun condMapEmpty!58052 () Bool)

(declare-fun mapDefault!58052 () ValueCell!17879)

(assert (=> mapNonEmpty!58043 (= condMapEmpty!58052 (= mapRest!58043 ((as const (Array (_ BitVec 32) ValueCell!17879)) mapDefault!58052)))))

(assert (=> mapNonEmpty!58043 (= tp!110474 (and e!767084 mapRes!58052))))

(declare-fun mapIsEmpty!58052 () Bool)

(assert (=> mapIsEmpty!58052 mapRes!58052))

(declare-fun b!1348396 () Bool)

(assert (=> b!1348396 (= e!767085 tp_is_empty!37555)))

(assert (= (and mapNonEmpty!58043 condMapEmpty!58052) mapIsEmpty!58052))

(assert (= (and mapNonEmpty!58043 (not condMapEmpty!58052)) mapNonEmpty!58052))

(assert (= (and mapNonEmpty!58052 ((_ is ValueCellFull!17879) mapValue!58052)) b!1348396))

(assert (= (and mapNonEmpty!58043 ((_ is ValueCellFull!17879) mapDefault!58052)) b!1348397))

(declare-fun m!1235053 () Bool)

(assert (=> mapNonEmpty!58052 m!1235053))

(declare-fun b_lambda!24635 () Bool)

(assert (= b_lambda!24627 (or (and start!113562 b_free!31555) b_lambda!24635)))

(declare-fun b_lambda!24637 () Bool)

(assert (= b_lambda!24631 (or (and start!113562 b_free!31555) b_lambda!24637)))

(declare-fun b_lambda!24639 () Bool)

(assert (= b_lambda!24633 (or (and start!113562 b_free!31555) b_lambda!24639)))

(declare-fun b_lambda!24641 () Bool)

(assert (= b_lambda!24629 (or (and start!113562 b_free!31555) b_lambda!24641)))

(check-sat (not b!1348216) (not d!144365) (not b!1348218) (not b_lambda!24639) (not b!1348330) (not b!1348333) (not b_lambda!24625) (not d!144351) (not b!1348350) (not bm!65064) (not b_lambda!24637) (not b!1348375) (not b!1348370) (not b_lambda!24641) (not d!144377) (not b!1348262) (not d!144363) tp_is_empty!37555 (not b!1348352) (not bm!65088) (not d!144379) (not b!1348230) (not b!1348263) (not b!1348354) (not b!1348215) (not b_lambda!24635) (not d!144371) (not d!144349) (not bm!65089) (not b!1348274) (not b!1348225) (not bm!65079) (not b_next!31555) (not b!1348228) (not b!1348268) (not b!1348264) (not b!1348353) (not b!1348213) (not b!1348224) (not bm!65094) (not b!1348373) (not d!144355) (not b!1348255) (not b!1348356) (not b!1348223) (not bm!65081) (not b!1348257) (not b!1348335) (not bm!65084) (not b!1348332) (not d!144359) (not b!1348358) (not b!1348372) (not b!1348267) (not b!1348323) (not bm!65085) (not d!144353) (not d!144357) (not b!1348318) (not d!144369) (not b!1348387) b_and!50899 (not b!1348327) (not b!1348260) (not b!1348227) (not b!1348388) (not d!144361) (not bm!65098) (not bm!65091) (not b!1348259) (not b!1348261) (not mapNonEmpty!58052) (not b!1348273) (not b!1348363) (not b!1348371) (not bm!65095) (not b!1348367) (not b!1348331))
(check-sat b_and!50899 (not b_next!31555))
