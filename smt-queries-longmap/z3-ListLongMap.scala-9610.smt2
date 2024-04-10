; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113608 () Bool)

(assert start!113608)

(declare-fun b_free!31575 () Bool)

(declare-fun b_next!31575 () Bool)

(assert (=> start!113608 (= b_free!31575 (not b_next!31575))))

(declare-fun tp!110536 () Bool)

(declare-fun b_and!50935 () Bool)

(assert (=> start!113608 (= tp!110536 b_and!50935)))

(declare-fun b!1348701 () Bool)

(declare-fun res!894857 () Bool)

(declare-fun e!767237 () Bool)

(assert (=> b!1348701 (=> (not res!894857) (not e!767237))))

(declare-datatypes ((V!55203 0))(
  ( (V!55204 (val!18862 Int)) )
))
(declare-fun minValue!1245 () V!55203)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91978 0))(
  ( (array!91979 (arr!44443 (Array (_ BitVec 32) (_ BitVec 64))) (size!44993 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91978)

(declare-fun zeroValue!1245 () V!55203)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17889 0))(
  ( (ValueCellFull!17889 (v!21514 V!55203)) (EmptyCell!17889) )
))
(declare-datatypes ((array!91980 0))(
  ( (array!91981 (arr!44444 (Array (_ BitVec 32) ValueCell!17889)) (size!44994 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91980)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24324 0))(
  ( (tuple2!24325 (_1!12173 (_ BitVec 64)) (_2!12173 V!55203)) )
))
(declare-datatypes ((List!31476 0))(
  ( (Nil!31473) (Cons!31472 (h!32681 tuple2!24324) (t!46118 List!31476)) )
))
(declare-datatypes ((ListLongMap!21981 0))(
  ( (ListLongMap!21982 (toList!11006 List!31476)) )
))
(declare-fun contains!9186 (ListLongMap!21981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5955 (array!91978 array!91980 (_ BitVec 32) (_ BitVec 32) V!55203 V!55203 (_ BitVec 32) Int) ListLongMap!21981)

(assert (=> b!1348701 (= res!894857 (contains!9186 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348702 () Bool)

(declare-fun e!767236 () Bool)

(declare-fun e!767235 () Bool)

(declare-fun mapRes!58076 () Bool)

(assert (=> b!1348702 (= e!767236 (and e!767235 mapRes!58076))))

(declare-fun condMapEmpty!58076 () Bool)

(declare-fun mapDefault!58076 () ValueCell!17889)

(assert (=> b!1348702 (= condMapEmpty!58076 (= (arr!44444 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17889)) mapDefault!58076)))))

(declare-fun b!1348703 () Bool)

(declare-fun +!4850 (ListLongMap!21981 tuple2!24324) ListLongMap!21981)

(declare-fun getCurrentListMapNoExtraKeys!6496 (array!91978 array!91980 (_ BitVec 32) (_ BitVec 32) V!55203 V!55203 (_ BitVec 32) Int) ListLongMap!21981)

(declare-fun get!22452 (ValueCell!17889 V!55203) V!55203)

(declare-fun dynLambda!3789 (Int (_ BitVec 64)) V!55203)

(assert (=> b!1348703 (= e!767237 (not (contains!9186 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142)))))

(declare-fun b!1348704 () Bool)

(declare-fun res!894850 () Bool)

(assert (=> b!1348704 (=> (not res!894850) (not e!767237))))

(assert (=> b!1348704 (= res!894850 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348706 () Bool)

(declare-fun tp_is_empty!37575 () Bool)

(assert (=> b!1348706 (= e!767235 tp_is_empty!37575)))

(declare-fun mapIsEmpty!58076 () Bool)

(assert (=> mapIsEmpty!58076 mapRes!58076))

(declare-fun b!1348707 () Bool)

(declare-fun res!894849 () Bool)

(assert (=> b!1348707 (=> (not res!894849) (not e!767237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91978 (_ BitVec 32)) Bool)

(assert (=> b!1348707 (= res!894849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348708 () Bool)

(declare-fun res!894851 () Bool)

(assert (=> b!1348708 (=> (not res!894851) (not e!767237))))

(assert (=> b!1348708 (= res!894851 (and (= (size!44994 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44993 _keys!1571) (size!44994 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348709 () Bool)

(declare-fun e!767234 () Bool)

(assert (=> b!1348709 (= e!767234 tp_is_empty!37575)))

(declare-fun b!1348710 () Bool)

(declare-fun res!894856 () Bool)

(assert (=> b!1348710 (=> (not res!894856) (not e!767237))))

(declare-datatypes ((List!31477 0))(
  ( (Nil!31474) (Cons!31473 (h!32682 (_ BitVec 64)) (t!46119 List!31477)) )
))
(declare-fun arrayNoDuplicates!0 (array!91978 (_ BitVec 32) List!31477) Bool)

(assert (=> b!1348710 (= res!894856 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31474))))

(declare-fun b!1348711 () Bool)

(declare-fun res!894853 () Bool)

(assert (=> b!1348711 (=> (not res!894853) (not e!767237))))

(assert (=> b!1348711 (= res!894853 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1348712 () Bool)

(declare-fun res!894855 () Bool)

(assert (=> b!1348712 (=> (not res!894855) (not e!767237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348712 (= res!894855 (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58076 () Bool)

(declare-fun tp!110537 () Bool)

(assert (=> mapNonEmpty!58076 (= mapRes!58076 (and tp!110537 e!767234))))

(declare-fun mapRest!58076 () (Array (_ BitVec 32) ValueCell!17889))

(declare-fun mapKey!58076 () (_ BitVec 32))

(declare-fun mapValue!58076 () ValueCell!17889)

(assert (=> mapNonEmpty!58076 (= (arr!44444 _values!1303) (store mapRest!58076 mapKey!58076 mapValue!58076))))

(declare-fun res!894852 () Bool)

(assert (=> start!113608 (=> (not res!894852) (not e!767237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113608 (= res!894852 (validMask!0 mask!1977))))

(assert (=> start!113608 e!767237))

(assert (=> start!113608 tp_is_empty!37575))

(assert (=> start!113608 true))

(declare-fun array_inv!33479 (array!91978) Bool)

(assert (=> start!113608 (array_inv!33479 _keys!1571)))

(declare-fun array_inv!33480 (array!91980) Bool)

(assert (=> start!113608 (and (array_inv!33480 _values!1303) e!767236)))

(assert (=> start!113608 tp!110536))

(declare-fun b!1348705 () Bool)

(declare-fun res!894854 () Bool)

(assert (=> b!1348705 (=> (not res!894854) (not e!767237))))

(assert (=> b!1348705 (= res!894854 (not (= (select (arr!44443 _keys!1571) from!1960) k0!1142)))))

(assert (= (and start!113608 res!894852) b!1348708))

(assert (= (and b!1348708 res!894851) b!1348707))

(assert (= (and b!1348707 res!894849) b!1348710))

(assert (= (and b!1348710 res!894856) b!1348704))

(assert (= (and b!1348704 res!894850) b!1348701))

(assert (= (and b!1348701 res!894857) b!1348705))

(assert (= (and b!1348705 res!894854) b!1348712))

(assert (= (and b!1348712 res!894855) b!1348711))

(assert (= (and b!1348711 res!894853) b!1348703))

(assert (= (and b!1348702 condMapEmpty!58076) mapIsEmpty!58076))

(assert (= (and b!1348702 (not condMapEmpty!58076)) mapNonEmpty!58076))

(get-info :version)

(assert (= (and mapNonEmpty!58076 ((_ is ValueCellFull!17889) mapValue!58076)) b!1348709))

(assert (= (and b!1348702 ((_ is ValueCellFull!17889) mapDefault!58076)) b!1348706))

(assert (= start!113608 b!1348702))

(declare-fun b_lambda!24655 () Bool)

(assert (=> (not b_lambda!24655) (not b!1348703)))

(declare-fun t!46117 () Bool)

(declare-fun tb!12445 () Bool)

(assert (=> (and start!113608 (= defaultEntry!1306 defaultEntry!1306) t!46117) tb!12445))

(declare-fun result!25985 () Bool)

(assert (=> tb!12445 (= result!25985 tp_is_empty!37575)))

(assert (=> b!1348703 t!46117))

(declare-fun b_and!50937 () Bool)

(assert (= b_and!50935 (and (=> t!46117 result!25985) b_and!50937)))

(declare-fun m!1235711 () Bool)

(assert (=> b!1348703 m!1235711))

(declare-fun m!1235713 () Bool)

(assert (=> b!1348703 m!1235713))

(declare-fun m!1235715 () Bool)

(assert (=> b!1348703 m!1235715))

(declare-fun m!1235717 () Bool)

(assert (=> b!1348703 m!1235717))

(assert (=> b!1348703 m!1235711))

(declare-fun m!1235719 () Bool)

(assert (=> b!1348703 m!1235719))

(assert (=> b!1348703 m!1235713))

(assert (=> b!1348703 m!1235715))

(assert (=> b!1348703 m!1235719))

(declare-fun m!1235721 () Bool)

(assert (=> b!1348703 m!1235721))

(declare-fun m!1235723 () Bool)

(assert (=> b!1348703 m!1235723))

(declare-fun m!1235725 () Bool)

(assert (=> b!1348710 m!1235725))

(assert (=> b!1348712 m!1235723))

(assert (=> b!1348712 m!1235723))

(declare-fun m!1235727 () Bool)

(assert (=> b!1348712 m!1235727))

(declare-fun m!1235729 () Bool)

(assert (=> start!113608 m!1235729))

(declare-fun m!1235731 () Bool)

(assert (=> start!113608 m!1235731))

(declare-fun m!1235733 () Bool)

(assert (=> start!113608 m!1235733))

(declare-fun m!1235735 () Bool)

(assert (=> b!1348701 m!1235735))

(assert (=> b!1348701 m!1235735))

(declare-fun m!1235737 () Bool)

(assert (=> b!1348701 m!1235737))

(declare-fun m!1235739 () Bool)

(assert (=> mapNonEmpty!58076 m!1235739))

(declare-fun m!1235741 () Bool)

(assert (=> b!1348707 m!1235741))

(assert (=> b!1348705 m!1235723))

(check-sat tp_is_empty!37575 (not b!1348712) (not b_lambda!24655) b_and!50937 (not b!1348707) (not b!1348701) (not b!1348710) (not start!113608) (not b!1348703) (not b_next!31575) (not mapNonEmpty!58076))
(check-sat b_and!50937 (not b_next!31575))
(get-model)

(declare-fun b_lambda!24659 () Bool)

(assert (= b_lambda!24655 (or (and start!113608 b_free!31575) b_lambda!24659)))

(check-sat tp_is_empty!37575 (not b!1348712) b_and!50937 (not b!1348707) (not b_lambda!24659) (not b!1348701) (not b!1348710) (not start!113608) (not b!1348703) (not b_next!31575) (not mapNonEmpty!58076))
(check-sat b_and!50937 (not b_next!31575))
(get-model)

(declare-fun d!144511 () Bool)

(declare-fun res!894891 () Bool)

(declare-fun e!767262 () Bool)

(assert (=> d!144511 (=> res!894891 e!767262)))

(assert (=> d!144511 (= res!894891 (bvsge #b00000000000000000000000000000000 (size!44993 _keys!1571)))))

(assert (=> d!144511 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31474) e!767262)))

(declare-fun b!1348763 () Bool)

(declare-fun e!767265 () Bool)

(assert (=> b!1348763 (= e!767262 e!767265)))

(declare-fun res!894892 () Bool)

(assert (=> b!1348763 (=> (not res!894892) (not e!767265))))

(declare-fun e!767264 () Bool)

(assert (=> b!1348763 (= res!894892 (not e!767264))))

(declare-fun res!894893 () Bool)

(assert (=> b!1348763 (=> (not res!894893) (not e!767264))))

(assert (=> b!1348763 (= res!894893 (validKeyInArray!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348764 () Bool)

(declare-fun e!767263 () Bool)

(declare-fun call!65123 () Bool)

(assert (=> b!1348764 (= e!767263 call!65123)))

(declare-fun b!1348765 () Bool)

(assert (=> b!1348765 (= e!767263 call!65123)))

(declare-fun bm!65120 () Bool)

(declare-fun c!126458 () Bool)

(assert (=> bm!65120 (= call!65123 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126458 (Cons!31473 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) Nil!31474) Nil!31474)))))

(declare-fun b!1348766 () Bool)

(declare-fun contains!9188 (List!31477 (_ BitVec 64)) Bool)

(assert (=> b!1348766 (= e!767264 (contains!9188 Nil!31474 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348767 () Bool)

(assert (=> b!1348767 (= e!767265 e!767263)))

(assert (=> b!1348767 (= c!126458 (validKeyInArray!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144511 (not res!894891)) b!1348763))

(assert (= (and b!1348763 res!894893) b!1348766))

(assert (= (and b!1348763 res!894892) b!1348767))

(assert (= (and b!1348767 c!126458) b!1348764))

(assert (= (and b!1348767 (not c!126458)) b!1348765))

(assert (= (or b!1348764 b!1348765) bm!65120))

(declare-fun m!1235775 () Bool)

(assert (=> b!1348763 m!1235775))

(assert (=> b!1348763 m!1235775))

(declare-fun m!1235777 () Bool)

(assert (=> b!1348763 m!1235777))

(assert (=> bm!65120 m!1235775))

(declare-fun m!1235779 () Bool)

(assert (=> bm!65120 m!1235779))

(assert (=> b!1348766 m!1235775))

(assert (=> b!1348766 m!1235775))

(declare-fun m!1235781 () Bool)

(assert (=> b!1348766 m!1235781))

(assert (=> b!1348767 m!1235775))

(assert (=> b!1348767 m!1235775))

(assert (=> b!1348767 m!1235777))

(assert (=> b!1348710 d!144511))

(declare-fun d!144513 () Bool)

(assert (=> d!144513 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113608 d!144513))

(declare-fun d!144515 () Bool)

(assert (=> d!144515 (= (array_inv!33479 _keys!1571) (bvsge (size!44993 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113608 d!144515))

(declare-fun d!144517 () Bool)

(assert (=> d!144517 (= (array_inv!33480 _values!1303) (bvsge (size!44994 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113608 d!144517))

(declare-fun d!144519 () Bool)

(declare-fun e!767270 () Bool)

(assert (=> d!144519 e!767270))

(declare-fun res!894896 () Bool)

(assert (=> d!144519 (=> res!894896 e!767270)))

(declare-fun lt!596189 () Bool)

(assert (=> d!144519 (= res!894896 (not lt!596189))))

(declare-fun lt!596188 () Bool)

(assert (=> d!144519 (= lt!596189 lt!596188)))

(declare-datatypes ((Unit!44181 0))(
  ( (Unit!44182) )
))
(declare-fun lt!596186 () Unit!44181)

(declare-fun e!767271 () Unit!44181)

(assert (=> d!144519 (= lt!596186 e!767271)))

(declare-fun c!126461 () Bool)

(assert (=> d!144519 (= c!126461 lt!596188)))

(declare-fun containsKey!744 (List!31476 (_ BitVec 64)) Bool)

(assert (=> d!144519 (= lt!596188 (containsKey!744 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144519 (= (contains!9186 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596189)))

(declare-fun b!1348774 () Bool)

(declare-fun lt!596187 () Unit!44181)

(assert (=> b!1348774 (= e!767271 lt!596187)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!490 (List!31476 (_ BitVec 64)) Unit!44181)

(assert (=> b!1348774 (= lt!596187 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!774 0))(
  ( (Some!773 (v!21516 V!55203)) (None!772) )
))
(declare-fun isDefined!529 (Option!774) Bool)

(declare-fun getValueByKey!722 (List!31476 (_ BitVec 64)) Option!774)

(assert (=> b!1348774 (isDefined!529 (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1348775 () Bool)

(declare-fun Unit!44183 () Unit!44181)

(assert (=> b!1348775 (= e!767271 Unit!44183)))

(declare-fun b!1348776 () Bool)

(assert (=> b!1348776 (= e!767270 (isDefined!529 (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144519 c!126461) b!1348774))

(assert (= (and d!144519 (not c!126461)) b!1348775))

(assert (= (and d!144519 (not res!894896)) b!1348776))

(declare-fun m!1235783 () Bool)

(assert (=> d!144519 m!1235783))

(declare-fun m!1235785 () Bool)

(assert (=> b!1348774 m!1235785))

(declare-fun m!1235787 () Bool)

(assert (=> b!1348774 m!1235787))

(assert (=> b!1348774 m!1235787))

(declare-fun m!1235789 () Bool)

(assert (=> b!1348774 m!1235789))

(assert (=> b!1348776 m!1235787))

(assert (=> b!1348776 m!1235787))

(assert (=> b!1348776 m!1235789))

(assert (=> b!1348701 d!144519))

(declare-fun b!1348819 () Bool)

(declare-fun e!767310 () Bool)

(declare-fun e!767299 () Bool)

(assert (=> b!1348819 (= e!767310 e!767299)))

(declare-fun res!894917 () Bool)

(assert (=> b!1348819 (=> (not res!894917) (not e!767299))))

(declare-fun lt!596239 () ListLongMap!21981)

(assert (=> b!1348819 (= res!894917 (contains!9186 lt!596239 (select (arr!44443 _keys!1571) from!1960)))))

(assert (=> b!1348819 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun b!1348820 () Bool)

(declare-fun e!767306 () ListLongMap!21981)

(declare-fun call!65144 () ListLongMap!21981)

(assert (=> b!1348820 (= e!767306 (+!4850 call!65144 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1348821 () Bool)

(declare-fun e!767303 () Bool)

(declare-fun call!65138 () Bool)

(assert (=> b!1348821 (= e!767303 (not call!65138))))

(declare-fun bm!65135 () Bool)

(declare-fun call!65139 () ListLongMap!21981)

(declare-fun call!65140 () ListLongMap!21981)

(assert (=> bm!65135 (= call!65139 call!65140)))

(declare-fun b!1348822 () Bool)

(declare-fun res!894921 () Bool)

(declare-fun e!767304 () Bool)

(assert (=> b!1348822 (=> (not res!894921) (not e!767304))))

(assert (=> b!1348822 (= res!894921 e!767310)))

(declare-fun res!894918 () Bool)

(assert (=> b!1348822 (=> res!894918 e!767310)))

(declare-fun e!767309 () Bool)

(assert (=> b!1348822 (= res!894918 (not e!767309))))

(declare-fun res!894923 () Bool)

(assert (=> b!1348822 (=> (not res!894923) (not e!767309))))

(assert (=> b!1348822 (= res!894923 (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun call!65143 () ListLongMap!21981)

(declare-fun bm!65136 () Bool)

(assert (=> bm!65136 (= call!65143 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun bm!65137 () Bool)

(declare-fun call!65142 () Bool)

(assert (=> bm!65137 (= call!65142 (contains!9186 lt!596239 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348823 () Bool)

(declare-fun e!767298 () Bool)

(declare-fun apply!1039 (ListLongMap!21981 (_ BitVec 64)) V!55203)

(assert (=> b!1348823 (= e!767298 (= (apply!1039 lt!596239 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348824 () Bool)

(declare-fun e!767308 () ListLongMap!21981)

(declare-fun call!65141 () ListLongMap!21981)

(assert (=> b!1348824 (= e!767308 call!65141)))

(declare-fun b!1348825 () Bool)

(assert (=> b!1348825 (= e!767306 e!767308)))

(declare-fun c!126474 () Bool)

(assert (=> b!1348825 (= c!126474 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348826 () Bool)

(declare-fun e!767307 () Bool)

(assert (=> b!1348826 (= e!767307 (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)))))

(declare-fun bm!65138 () Bool)

(declare-fun c!126476 () Bool)

(assert (=> bm!65138 (= call!65144 (+!4850 (ite c!126476 call!65143 (ite c!126474 call!65140 call!65139)) (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1348827 () Bool)

(assert (=> b!1348827 (= e!767303 e!767298)))

(declare-fun res!894920 () Bool)

(assert (=> b!1348827 (= res!894920 call!65138)))

(assert (=> b!1348827 (=> (not res!894920) (not e!767298))))

(declare-fun d!144521 () Bool)

(assert (=> d!144521 e!767304))

(declare-fun res!894919 () Bool)

(assert (=> d!144521 (=> (not res!894919) (not e!767304))))

(assert (=> d!144521 (= res!894919 (or (bvsge from!1960 (size!44993 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)))))))

(declare-fun lt!596236 () ListLongMap!21981)

(assert (=> d!144521 (= lt!596239 lt!596236)))

(declare-fun lt!596255 () Unit!44181)

(declare-fun e!767301 () Unit!44181)

(assert (=> d!144521 (= lt!596255 e!767301)))

(declare-fun c!126478 () Bool)

(assert (=> d!144521 (= c!126478 e!767307)))

(declare-fun res!894916 () Bool)

(assert (=> d!144521 (=> (not res!894916) (not e!767307))))

(assert (=> d!144521 (= res!894916 (bvslt from!1960 (size!44993 _keys!1571)))))

(assert (=> d!144521 (= lt!596236 e!767306)))

(assert (=> d!144521 (= c!126476 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144521 (validMask!0 mask!1977)))

(assert (=> d!144521 (= (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596239)))

(declare-fun b!1348828 () Bool)

(declare-fun e!767300 () Bool)

(assert (=> b!1348828 (= e!767304 e!767300)))

(declare-fun c!126479 () Bool)

(assert (=> b!1348828 (= c!126479 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348829 () Bool)

(declare-fun lt!596249 () Unit!44181)

(assert (=> b!1348829 (= e!767301 lt!596249)))

(declare-fun lt!596252 () ListLongMap!21981)

(assert (=> b!1348829 (= lt!596252 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596234 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596253 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596253 (select (arr!44443 _keys!1571) from!1960))))

(declare-fun lt!596237 () Unit!44181)

(declare-fun addStillContains!1214 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> b!1348829 (= lt!596237 (addStillContains!1214 lt!596252 lt!596234 zeroValue!1245 lt!596253))))

(assert (=> b!1348829 (contains!9186 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245)) lt!596253)))

(declare-fun lt!596254 () Unit!44181)

(assert (=> b!1348829 (= lt!596254 lt!596237)))

(declare-fun lt!596251 () ListLongMap!21981)

(assert (=> b!1348829 (= lt!596251 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596235 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596235 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596244 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596244 (select (arr!44443 _keys!1571) from!1960))))

(declare-fun lt!596247 () Unit!44181)

(declare-fun addApplyDifferent!581 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> b!1348829 (= lt!596247 (addApplyDifferent!581 lt!596251 lt!596235 minValue!1245 lt!596244))))

(assert (=> b!1348829 (= (apply!1039 (+!4850 lt!596251 (tuple2!24325 lt!596235 minValue!1245)) lt!596244) (apply!1039 lt!596251 lt!596244))))

(declare-fun lt!596246 () Unit!44181)

(assert (=> b!1348829 (= lt!596246 lt!596247)))

(declare-fun lt!596241 () ListLongMap!21981)

(assert (=> b!1348829 (= lt!596241 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596248 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596245 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596245 (select (arr!44443 _keys!1571) from!1960))))

(declare-fun lt!596242 () Unit!44181)

(assert (=> b!1348829 (= lt!596242 (addApplyDifferent!581 lt!596241 lt!596248 zeroValue!1245 lt!596245))))

(assert (=> b!1348829 (= (apply!1039 (+!4850 lt!596241 (tuple2!24325 lt!596248 zeroValue!1245)) lt!596245) (apply!1039 lt!596241 lt!596245))))

(declare-fun lt!596240 () Unit!44181)

(assert (=> b!1348829 (= lt!596240 lt!596242)))

(declare-fun lt!596250 () ListLongMap!21981)

(assert (=> b!1348829 (= lt!596250 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596238 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596238 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596243 () (_ BitVec 64))

(assert (=> b!1348829 (= lt!596243 (select (arr!44443 _keys!1571) from!1960))))

(assert (=> b!1348829 (= lt!596249 (addApplyDifferent!581 lt!596250 lt!596238 minValue!1245 lt!596243))))

(assert (=> b!1348829 (= (apply!1039 (+!4850 lt!596250 (tuple2!24325 lt!596238 minValue!1245)) lt!596243) (apply!1039 lt!596250 lt!596243))))

(declare-fun b!1348830 () Bool)

(declare-fun res!894915 () Bool)

(assert (=> b!1348830 (=> (not res!894915) (not e!767304))))

(assert (=> b!1348830 (= res!894915 e!767303)))

(declare-fun c!126477 () Bool)

(assert (=> b!1348830 (= c!126477 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348831 () Bool)

(declare-fun Unit!44184 () Unit!44181)

(assert (=> b!1348831 (= e!767301 Unit!44184)))

(declare-fun b!1348832 () Bool)

(declare-fun e!767302 () Bool)

(assert (=> b!1348832 (= e!767300 e!767302)))

(declare-fun res!894922 () Bool)

(assert (=> b!1348832 (= res!894922 call!65142)))

(assert (=> b!1348832 (=> (not res!894922) (not e!767302))))

(declare-fun b!1348833 () Bool)

(assert (=> b!1348833 (= e!767309 (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)))))

(declare-fun b!1348834 () Bool)

(assert (=> b!1348834 (= e!767300 (not call!65142))))

(declare-fun bm!65139 () Bool)

(assert (=> bm!65139 (= call!65138 (contains!9186 lt!596239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348835 () Bool)

(assert (=> b!1348835 (= e!767299 (= (apply!1039 lt!596239 (select (arr!44443 _keys!1571) from!1960)) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348835 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44994 _values!1303)))))

(assert (=> b!1348835 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun b!1348836 () Bool)

(declare-fun e!767305 () ListLongMap!21981)

(assert (=> b!1348836 (= e!767305 call!65141)))

(declare-fun b!1348837 () Bool)

(declare-fun c!126475 () Bool)

(assert (=> b!1348837 (= c!126475 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348837 (= e!767308 e!767305)))

(declare-fun bm!65140 () Bool)

(assert (=> bm!65140 (= call!65141 call!65144)))

(declare-fun b!1348838 () Bool)

(assert (=> b!1348838 (= e!767305 call!65139)))

(declare-fun bm!65141 () Bool)

(assert (=> bm!65141 (= call!65140 call!65143)))

(declare-fun b!1348839 () Bool)

(assert (=> b!1348839 (= e!767302 (= (apply!1039 lt!596239 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(assert (= (and d!144521 c!126476) b!1348820))

(assert (= (and d!144521 (not c!126476)) b!1348825))

(assert (= (and b!1348825 c!126474) b!1348824))

(assert (= (and b!1348825 (not c!126474)) b!1348837))

(assert (= (and b!1348837 c!126475) b!1348836))

(assert (= (and b!1348837 (not c!126475)) b!1348838))

(assert (= (or b!1348836 b!1348838) bm!65135))

(assert (= (or b!1348824 bm!65135) bm!65141))

(assert (= (or b!1348824 b!1348836) bm!65140))

(assert (= (or b!1348820 bm!65141) bm!65136))

(assert (= (or b!1348820 bm!65140) bm!65138))

(assert (= (and d!144521 res!894916) b!1348826))

(assert (= (and d!144521 c!126478) b!1348829))

(assert (= (and d!144521 (not c!126478)) b!1348831))

(assert (= (and d!144521 res!894919) b!1348822))

(assert (= (and b!1348822 res!894923) b!1348833))

(assert (= (and b!1348822 (not res!894918)) b!1348819))

(assert (= (and b!1348819 res!894917) b!1348835))

(assert (= (and b!1348822 res!894921) b!1348830))

(assert (= (and b!1348830 c!126477) b!1348827))

(assert (= (and b!1348830 (not c!126477)) b!1348821))

(assert (= (and b!1348827 res!894920) b!1348823))

(assert (= (or b!1348827 b!1348821) bm!65139))

(assert (= (and b!1348830 res!894915) b!1348828))

(assert (= (and b!1348828 c!126479) b!1348832))

(assert (= (and b!1348828 (not c!126479)) b!1348834))

(assert (= (and b!1348832 res!894922) b!1348839))

(assert (= (or b!1348832 b!1348834) bm!65137))

(declare-fun b_lambda!24661 () Bool)

(assert (=> (not b_lambda!24661) (not b!1348835)))

(assert (=> b!1348835 t!46117))

(declare-fun b_and!50943 () Bool)

(assert (= b_and!50937 (and (=> t!46117 result!25985) b_and!50943)))

(declare-fun m!1235791 () Bool)

(assert (=> bm!65138 m!1235791))

(assert (=> d!144521 m!1235729))

(declare-fun m!1235793 () Bool)

(assert (=> b!1348829 m!1235793))

(declare-fun m!1235795 () Bool)

(assert (=> b!1348829 m!1235795))

(declare-fun m!1235797 () Bool)

(assert (=> b!1348829 m!1235797))

(declare-fun m!1235799 () Bool)

(assert (=> b!1348829 m!1235799))

(declare-fun m!1235801 () Bool)

(assert (=> b!1348829 m!1235801))

(declare-fun m!1235803 () Bool)

(assert (=> b!1348829 m!1235803))

(declare-fun m!1235805 () Bool)

(assert (=> b!1348829 m!1235805))

(declare-fun m!1235807 () Bool)

(assert (=> b!1348829 m!1235807))

(declare-fun m!1235809 () Bool)

(assert (=> b!1348829 m!1235809))

(assert (=> b!1348829 m!1235793))

(declare-fun m!1235811 () Bool)

(assert (=> b!1348829 m!1235811))

(declare-fun m!1235813 () Bool)

(assert (=> b!1348829 m!1235813))

(assert (=> b!1348829 m!1235723))

(declare-fun m!1235815 () Bool)

(assert (=> b!1348829 m!1235815))

(assert (=> b!1348829 m!1235811))

(declare-fun m!1235817 () Bool)

(assert (=> b!1348829 m!1235817))

(assert (=> b!1348829 m!1235799))

(declare-fun m!1235819 () Bool)

(assert (=> b!1348829 m!1235819))

(declare-fun m!1235821 () Bool)

(assert (=> b!1348829 m!1235821))

(assert (=> b!1348829 m!1235809))

(declare-fun m!1235823 () Bool)

(assert (=> b!1348829 m!1235823))

(assert (=> bm!65136 m!1235813))

(assert (=> b!1348819 m!1235723))

(assert (=> b!1348819 m!1235723))

(declare-fun m!1235825 () Bool)

(assert (=> b!1348819 m!1235825))

(assert (=> b!1348826 m!1235723))

(assert (=> b!1348826 m!1235723))

(assert (=> b!1348826 m!1235727))

(declare-fun m!1235827 () Bool)

(assert (=> b!1348820 m!1235827))

(declare-fun m!1235829 () Bool)

(assert (=> b!1348839 m!1235829))

(assert (=> b!1348833 m!1235723))

(assert (=> b!1348833 m!1235723))

(assert (=> b!1348833 m!1235727))

(assert (=> b!1348835 m!1235715))

(assert (=> b!1348835 m!1235723))

(declare-fun m!1235831 () Bool)

(assert (=> b!1348835 m!1235831))

(assert (=> b!1348835 m!1235713))

(assert (=> b!1348835 m!1235723))

(assert (=> b!1348835 m!1235713))

(assert (=> b!1348835 m!1235715))

(assert (=> b!1348835 m!1235717))

(declare-fun m!1235833 () Bool)

(assert (=> bm!65137 m!1235833))

(declare-fun m!1235835 () Bool)

(assert (=> bm!65139 m!1235835))

(declare-fun m!1235837 () Bool)

(assert (=> b!1348823 m!1235837))

(assert (=> b!1348701 d!144521))

(declare-fun d!144523 () Bool)

(declare-fun e!767311 () Bool)

(assert (=> d!144523 e!767311))

(declare-fun res!894924 () Bool)

(assert (=> d!144523 (=> res!894924 e!767311)))

(declare-fun lt!596259 () Bool)

(assert (=> d!144523 (= res!894924 (not lt!596259))))

(declare-fun lt!596258 () Bool)

(assert (=> d!144523 (= lt!596259 lt!596258)))

(declare-fun lt!596256 () Unit!44181)

(declare-fun e!767312 () Unit!44181)

(assert (=> d!144523 (= lt!596256 e!767312)))

(declare-fun c!126480 () Bool)

(assert (=> d!144523 (= c!126480 lt!596258)))

(assert (=> d!144523 (= lt!596258 (containsKey!744 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (=> d!144523 (= (contains!9186 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142) lt!596259)))

(declare-fun b!1348840 () Bool)

(declare-fun lt!596257 () Unit!44181)

(assert (=> b!1348840 (= e!767312 lt!596257)))

(assert (=> b!1348840 (= lt!596257 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (=> b!1348840 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun b!1348841 () Bool)

(declare-fun Unit!44185 () Unit!44181)

(assert (=> b!1348841 (= e!767312 Unit!44185)))

(declare-fun b!1348842 () Bool)

(assert (=> b!1348842 (= e!767311 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)))))

(assert (= (and d!144523 c!126480) b!1348840))

(assert (= (and d!144523 (not c!126480)) b!1348841))

(assert (= (and d!144523 (not res!894924)) b!1348842))

(declare-fun m!1235839 () Bool)

(assert (=> d!144523 m!1235839))

(declare-fun m!1235841 () Bool)

(assert (=> b!1348840 m!1235841))

(declare-fun m!1235843 () Bool)

(assert (=> b!1348840 m!1235843))

(assert (=> b!1348840 m!1235843))

(declare-fun m!1235845 () Bool)

(assert (=> b!1348840 m!1235845))

(assert (=> b!1348842 m!1235843))

(assert (=> b!1348842 m!1235843))

(assert (=> b!1348842 m!1235845))

(assert (=> b!1348703 d!144523))

(declare-fun d!144525 () Bool)

(declare-fun e!767315 () Bool)

(assert (=> d!144525 e!767315))

(declare-fun res!894930 () Bool)

(assert (=> d!144525 (=> (not res!894930) (not e!767315))))

(declare-fun lt!596269 () ListLongMap!21981)

(assert (=> d!144525 (= res!894930 (contains!9186 lt!596269 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596270 () List!31476)

(assert (=> d!144525 (= lt!596269 (ListLongMap!21982 lt!596270))))

(declare-fun lt!596268 () Unit!44181)

(declare-fun lt!596271 () Unit!44181)

(assert (=> d!144525 (= lt!596268 lt!596271)))

(assert (=> d!144525 (= (getValueByKey!722 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!367 (List!31476 (_ BitVec 64) V!55203) Unit!44181)

(assert (=> d!144525 (= lt!596271 (lemmaContainsTupThenGetReturnValue!367 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!496 (List!31476 (_ BitVec 64) V!55203) List!31476)

(assert (=> d!144525 (= lt!596270 (insertStrictlySorted!496 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144525 (= (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596269)))

(declare-fun b!1348847 () Bool)

(declare-fun res!894929 () Bool)

(assert (=> b!1348847 (=> (not res!894929) (not e!767315))))

(assert (=> b!1348847 (= res!894929 (= (getValueByKey!722 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348848 () Bool)

(declare-fun contains!9189 (List!31476 tuple2!24324) Bool)

(assert (=> b!1348848 (= e!767315 (contains!9189 (toList!11006 lt!596269) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144525 res!894930) b!1348847))

(assert (= (and b!1348847 res!894929) b!1348848))

(declare-fun m!1235847 () Bool)

(assert (=> d!144525 m!1235847))

(declare-fun m!1235849 () Bool)

(assert (=> d!144525 m!1235849))

(declare-fun m!1235851 () Bool)

(assert (=> d!144525 m!1235851))

(declare-fun m!1235853 () Bool)

(assert (=> d!144525 m!1235853))

(declare-fun m!1235855 () Bool)

(assert (=> b!1348847 m!1235855))

(declare-fun m!1235857 () Bool)

(assert (=> b!1348848 m!1235857))

(assert (=> b!1348703 d!144525))

(declare-fun b!1348873 () Bool)

(declare-fun lt!596288 () Unit!44181)

(declare-fun lt!596292 () Unit!44181)

(assert (=> b!1348873 (= lt!596288 lt!596292)))

(declare-fun lt!596289 () V!55203)

(declare-fun lt!596290 () (_ BitVec 64))

(declare-fun lt!596291 () (_ BitVec 64))

(declare-fun lt!596286 () ListLongMap!21981)

(assert (=> b!1348873 (not (contains!9186 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289)) lt!596291))))

(declare-fun addStillNotContains!503 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> b!1348873 (= lt!596292 (addStillNotContains!503 lt!596286 lt!596290 lt!596289 lt!596291))))

(assert (=> b!1348873 (= lt!596291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348873 (= lt!596289 (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348873 (= lt!596290 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65147 () ListLongMap!21981)

(assert (=> b!1348873 (= lt!596286 call!65147)))

(declare-fun e!767332 () ListLongMap!21981)

(assert (=> b!1348873 (= e!767332 (+!4850 call!65147 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348874 () Bool)

(declare-fun e!767333 () ListLongMap!21981)

(assert (=> b!1348874 (= e!767333 e!767332)))

(declare-fun c!126490 () Bool)

(assert (=> b!1348874 (= c!126490 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348875 () Bool)

(declare-fun e!767335 () Bool)

(assert (=> b!1348875 (= e!767335 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348875 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1348876 () Bool)

(assert (=> b!1348876 (= e!767333 (ListLongMap!21982 Nil!31473))))

(declare-fun b!1348877 () Bool)

(declare-fun e!767330 () Bool)

(declare-fun e!767334 () Bool)

(assert (=> b!1348877 (= e!767330 e!767334)))

(declare-fun c!126491 () Bool)

(assert (=> b!1348877 (= c!126491 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44993 _keys!1571)))))

(declare-fun b!1348879 () Bool)

(declare-fun res!894939 () Bool)

(declare-fun e!767336 () Bool)

(assert (=> b!1348879 (=> (not res!894939) (not e!767336))))

(declare-fun lt!596287 () ListLongMap!21981)

(assert (=> b!1348879 (= res!894939 (not (contains!9186 lt!596287 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348880 () Bool)

(assert (=> b!1348880 (= e!767336 e!767330)))

(declare-fun c!126489 () Bool)

(assert (=> b!1348880 (= c!126489 e!767335)))

(declare-fun res!894941 () Bool)

(assert (=> b!1348880 (=> (not res!894941) (not e!767335))))

(assert (=> b!1348880 (= res!894941 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44993 _keys!1571)))))

(declare-fun b!1348881 () Bool)

(assert (=> b!1348881 (= e!767332 call!65147)))

(declare-fun b!1348882 () Bool)

(declare-fun e!767331 () Bool)

(assert (=> b!1348882 (= e!767330 e!767331)))

(assert (=> b!1348882 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44993 _keys!1571)))))

(declare-fun res!894942 () Bool)

(assert (=> b!1348882 (= res!894942 (contains!9186 lt!596287 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348882 (=> (not res!894942) (not e!767331))))

(declare-fun b!1348883 () Bool)

(assert (=> b!1348883 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44993 _keys!1571)))))

(assert (=> b!1348883 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44994 _values!1303)))))

(assert (=> b!1348883 (= e!767331 (= (apply!1039 lt!596287 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!65144 () Bool)

(assert (=> bm!65144 (= call!65147 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348884 () Bool)

(declare-fun isEmpty!1095 (ListLongMap!21981) Bool)

(assert (=> b!1348884 (= e!767334 (isEmpty!1095 lt!596287))))

(declare-fun d!144527 () Bool)

(assert (=> d!144527 e!767336))

(declare-fun res!894940 () Bool)

(assert (=> d!144527 (=> (not res!894940) (not e!767336))))

(assert (=> d!144527 (= res!894940 (not (contains!9186 lt!596287 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144527 (= lt!596287 e!767333)))

(declare-fun c!126492 () Bool)

(assert (=> d!144527 (= c!126492 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44993 _keys!1571)))))

(assert (=> d!144527 (validMask!0 mask!1977)))

(assert (=> d!144527 (= (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596287)))

(declare-fun b!1348878 () Bool)

(assert (=> b!1348878 (= e!767334 (= lt!596287 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(assert (= (and d!144527 c!126492) b!1348876))

(assert (= (and d!144527 (not c!126492)) b!1348874))

(assert (= (and b!1348874 c!126490) b!1348873))

(assert (= (and b!1348874 (not c!126490)) b!1348881))

(assert (= (or b!1348873 b!1348881) bm!65144))

(assert (= (and d!144527 res!894940) b!1348879))

(assert (= (and b!1348879 res!894939) b!1348880))

(assert (= (and b!1348880 res!894941) b!1348875))

(assert (= (and b!1348880 c!126489) b!1348882))

(assert (= (and b!1348880 (not c!126489)) b!1348877))

(assert (= (and b!1348882 res!894942) b!1348883))

(assert (= (and b!1348877 c!126491) b!1348878))

(assert (= (and b!1348877 (not c!126491)) b!1348884))

(declare-fun b_lambda!24663 () Bool)

(assert (=> (not b_lambda!24663) (not b!1348873)))

(assert (=> b!1348873 t!46117))

(declare-fun b_and!50945 () Bool)

(assert (= b_and!50943 (and (=> t!46117 result!25985) b_and!50945)))

(declare-fun b_lambda!24665 () Bool)

(assert (=> (not b_lambda!24665) (not b!1348883)))

(assert (=> b!1348883 t!46117))

(declare-fun b_and!50947 () Bool)

(assert (= b_and!50945 (and (=> t!46117 result!25985) b_and!50947)))

(declare-fun m!1235859 () Bool)

(assert (=> b!1348884 m!1235859))

(declare-fun m!1235861 () Bool)

(assert (=> d!144527 m!1235861))

(assert (=> d!144527 m!1235729))

(declare-fun m!1235863 () Bool)

(assert (=> b!1348879 m!1235863))

(declare-fun m!1235865 () Bool)

(assert (=> b!1348873 m!1235865))

(declare-fun m!1235867 () Bool)

(assert (=> b!1348873 m!1235867))

(assert (=> b!1348873 m!1235715))

(declare-fun m!1235869 () Bool)

(assert (=> b!1348873 m!1235869))

(declare-fun m!1235871 () Bool)

(assert (=> b!1348873 m!1235871))

(declare-fun m!1235873 () Bool)

(assert (=> b!1348873 m!1235873))

(assert (=> b!1348873 m!1235873))

(declare-fun m!1235875 () Bool)

(assert (=> b!1348873 m!1235875))

(assert (=> b!1348873 m!1235869))

(assert (=> b!1348873 m!1235715))

(declare-fun m!1235877 () Bool)

(assert (=> b!1348873 m!1235877))

(assert (=> b!1348874 m!1235871))

(assert (=> b!1348874 m!1235871))

(declare-fun m!1235879 () Bool)

(assert (=> b!1348874 m!1235879))

(assert (=> b!1348882 m!1235871))

(assert (=> b!1348882 m!1235871))

(declare-fun m!1235881 () Bool)

(assert (=> b!1348882 m!1235881))

(assert (=> b!1348883 m!1235715))

(assert (=> b!1348883 m!1235869))

(assert (=> b!1348883 m!1235869))

(assert (=> b!1348883 m!1235715))

(assert (=> b!1348883 m!1235877))

(assert (=> b!1348883 m!1235871))

(declare-fun m!1235883 () Bool)

(assert (=> b!1348883 m!1235883))

(assert (=> b!1348883 m!1235871))

(declare-fun m!1235885 () Bool)

(assert (=> bm!65144 m!1235885))

(assert (=> b!1348878 m!1235885))

(assert (=> b!1348875 m!1235871))

(assert (=> b!1348875 m!1235871))

(assert (=> b!1348875 m!1235879))

(assert (=> b!1348703 d!144527))

(declare-fun d!144529 () Bool)

(declare-fun c!126495 () Bool)

(assert (=> d!144529 (= c!126495 ((_ is ValueCellFull!17889) (select (arr!44444 _values!1303) from!1960)))))

(declare-fun e!767339 () V!55203)

(assert (=> d!144529 (= (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767339)))

(declare-fun b!1348889 () Bool)

(declare-fun get!22453 (ValueCell!17889 V!55203) V!55203)

(assert (=> b!1348889 (= e!767339 (get!22453 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348890 () Bool)

(declare-fun get!22454 (ValueCell!17889 V!55203) V!55203)

(assert (=> b!1348890 (= e!767339 (get!22454 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144529 c!126495) b!1348889))

(assert (= (and d!144529 (not c!126495)) b!1348890))

(assert (=> b!1348889 m!1235713))

(assert (=> b!1348889 m!1235715))

(declare-fun m!1235887 () Bool)

(assert (=> b!1348889 m!1235887))

(assert (=> b!1348890 m!1235713))

(assert (=> b!1348890 m!1235715))

(declare-fun m!1235889 () Bool)

(assert (=> b!1348890 m!1235889))

(assert (=> b!1348703 d!144529))

(declare-fun d!144531 () Bool)

(assert (=> d!144531 (= (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)) (and (not (= (select (arr!44443 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44443 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348712 d!144531))

(declare-fun b!1348899 () Bool)

(declare-fun e!767348 () Bool)

(declare-fun call!65150 () Bool)

(assert (=> b!1348899 (= e!767348 call!65150)))

(declare-fun d!144533 () Bool)

(declare-fun res!894947 () Bool)

(declare-fun e!767346 () Bool)

(assert (=> d!144533 (=> res!894947 e!767346)))

(assert (=> d!144533 (= res!894947 (bvsge #b00000000000000000000000000000000 (size!44993 _keys!1571)))))

(assert (=> d!144533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767346)))

(declare-fun bm!65147 () Bool)

(assert (=> bm!65147 (= call!65150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348900 () Bool)

(declare-fun e!767347 () Bool)

(assert (=> b!1348900 (= e!767347 e!767348)))

(declare-fun lt!596300 () (_ BitVec 64))

(assert (=> b!1348900 (= lt!596300 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596299 () Unit!44181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91978 (_ BitVec 64) (_ BitVec 32)) Unit!44181)

(assert (=> b!1348900 (= lt!596299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596300 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1348900 (arrayContainsKey!0 _keys!1571 lt!596300 #b00000000000000000000000000000000)))

(declare-fun lt!596301 () Unit!44181)

(assert (=> b!1348900 (= lt!596301 lt!596299)))

(declare-fun res!894948 () Bool)

(declare-datatypes ((SeekEntryResult!10058 0))(
  ( (MissingZero!10058 (index!42603 (_ BitVec 32))) (Found!10058 (index!42604 (_ BitVec 32))) (Intermediate!10058 (undefined!10870 Bool) (index!42605 (_ BitVec 32)) (x!120716 (_ BitVec 32))) (Undefined!10058) (MissingVacant!10058 (index!42606 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91978 (_ BitVec 32)) SeekEntryResult!10058)

(assert (=> b!1348900 (= res!894948 (= (seekEntryOrOpen!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10058 #b00000000000000000000000000000000)))))

(assert (=> b!1348900 (=> (not res!894948) (not e!767348))))

(declare-fun b!1348901 () Bool)

(assert (=> b!1348901 (= e!767346 e!767347)))

(declare-fun c!126498 () Bool)

(assert (=> b!1348901 (= c!126498 (validKeyInArray!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348902 () Bool)

(assert (=> b!1348902 (= e!767347 call!65150)))

(assert (= (and d!144533 (not res!894947)) b!1348901))

(assert (= (and b!1348901 c!126498) b!1348900))

(assert (= (and b!1348901 (not c!126498)) b!1348902))

(assert (= (and b!1348900 res!894948) b!1348899))

(assert (= (or b!1348899 b!1348902) bm!65147))

(declare-fun m!1235891 () Bool)

(assert (=> bm!65147 m!1235891))

(assert (=> b!1348900 m!1235775))

(declare-fun m!1235893 () Bool)

(assert (=> b!1348900 m!1235893))

(declare-fun m!1235895 () Bool)

(assert (=> b!1348900 m!1235895))

(assert (=> b!1348900 m!1235775))

(declare-fun m!1235897 () Bool)

(assert (=> b!1348900 m!1235897))

(assert (=> b!1348901 m!1235775))

(assert (=> b!1348901 m!1235775))

(assert (=> b!1348901 m!1235777))

(assert (=> b!1348707 d!144533))

(declare-fun b!1348910 () Bool)

(declare-fun e!767354 () Bool)

(assert (=> b!1348910 (= e!767354 tp_is_empty!37575)))

(declare-fun mapIsEmpty!58082 () Bool)

(declare-fun mapRes!58082 () Bool)

(assert (=> mapIsEmpty!58082 mapRes!58082))

(declare-fun mapNonEmpty!58082 () Bool)

(declare-fun tp!110546 () Bool)

(declare-fun e!767353 () Bool)

(assert (=> mapNonEmpty!58082 (= mapRes!58082 (and tp!110546 e!767353))))

(declare-fun mapRest!58082 () (Array (_ BitVec 32) ValueCell!17889))

(declare-fun mapValue!58082 () ValueCell!17889)

(declare-fun mapKey!58082 () (_ BitVec 32))

(assert (=> mapNonEmpty!58082 (= mapRest!58076 (store mapRest!58082 mapKey!58082 mapValue!58082))))

(declare-fun condMapEmpty!58082 () Bool)

(declare-fun mapDefault!58082 () ValueCell!17889)

(assert (=> mapNonEmpty!58076 (= condMapEmpty!58082 (= mapRest!58076 ((as const (Array (_ BitVec 32) ValueCell!17889)) mapDefault!58082)))))

(assert (=> mapNonEmpty!58076 (= tp!110537 (and e!767354 mapRes!58082))))

(declare-fun b!1348909 () Bool)

(assert (=> b!1348909 (= e!767353 tp_is_empty!37575)))

(assert (= (and mapNonEmpty!58076 condMapEmpty!58082) mapIsEmpty!58082))

(assert (= (and mapNonEmpty!58076 (not condMapEmpty!58082)) mapNonEmpty!58082))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17889) mapValue!58082)) b!1348909))

(assert (= (and mapNonEmpty!58076 ((_ is ValueCellFull!17889) mapDefault!58082)) b!1348910))

(declare-fun m!1235899 () Bool)

(assert (=> mapNonEmpty!58082 m!1235899))

(declare-fun b_lambda!24667 () Bool)

(assert (= b_lambda!24661 (or (and start!113608 b_free!31575) b_lambda!24667)))

(declare-fun b_lambda!24669 () Bool)

(assert (= b_lambda!24663 (or (and start!113608 b_free!31575) b_lambda!24669)))

(declare-fun b_lambda!24671 () Bool)

(assert (= b_lambda!24665 (or (and start!113608 b_free!31575) b_lambda!24671)))

(check-sat (not b!1348774) (not b!1348833) (not b!1348890) (not b!1348900) (not bm!65137) (not bm!65144) (not d!144525) (not bm!65138) (not d!144523) (not b!1348889) (not b!1348819) (not b!1348847) (not b!1348767) (not b!1348883) (not b_lambda!24659) (not b!1348882) (not b!1348873) tp_is_empty!37575 (not b!1348884) b_and!50947 (not b!1348878) (not d!144519) (not b!1348840) (not b!1348763) (not b!1348842) (not b_lambda!24667) (not mapNonEmpty!58082) (not bm!65139) (not bm!65136) (not b!1348766) (not b!1348875) (not b_lambda!24669) (not b!1348829) (not b_lambda!24671) (not b!1348776) (not b!1348879) (not b!1348874) (not b!1348901) (not b!1348839) (not d!144527) (not b!1348835) (not b_next!31575) (not bm!65147) (not bm!65120) (not b!1348823) (not b!1348820) (not b!1348826) (not d!144521) (not b!1348848))
(check-sat b_and!50947 (not b_next!31575))
(get-model)

(declare-fun d!144535 () Bool)

(declare-fun res!894953 () Bool)

(declare-fun e!767359 () Bool)

(assert (=> d!144535 (=> res!894953 e!767359)))

(assert (=> d!144535 (= res!894953 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144535 (= (containsKey!744 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767359)))

(declare-fun b!1348915 () Bool)

(declare-fun e!767360 () Bool)

(assert (=> b!1348915 (= e!767359 e!767360)))

(declare-fun res!894954 () Bool)

(assert (=> b!1348915 (=> (not res!894954) (not e!767360))))

(assert (=> b!1348915 (= res!894954 (and (or (not ((_ is Cons!31472) (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31472) (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1348916 () Bool)

(assert (=> b!1348916 (= e!767360 (containsKey!744 (t!46118 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144535 (not res!894953)) b!1348915))

(assert (= (and b!1348915 res!894954) b!1348916))

(declare-fun m!1235901 () Bool)

(assert (=> b!1348916 m!1235901))

(assert (=> d!144519 d!144535))

(declare-fun d!144537 () Bool)

(declare-fun get!22455 (Option!774) V!55203)

(assert (=> d!144537 (= (apply!1039 lt!596251 lt!596244) (get!22455 (getValueByKey!722 (toList!11006 lt!596251) lt!596244)))))

(declare-fun bs!38661 () Bool)

(assert (= bs!38661 d!144537))

(declare-fun m!1235903 () Bool)

(assert (=> bs!38661 m!1235903))

(assert (=> bs!38661 m!1235903))

(declare-fun m!1235905 () Bool)

(assert (=> bs!38661 m!1235905))

(assert (=> b!1348829 d!144537))

(declare-fun d!144539 () Bool)

(assert (=> d!144539 (= (apply!1039 (+!4850 lt!596250 (tuple2!24325 lt!596238 minValue!1245)) lt!596243) (get!22455 (getValueByKey!722 (toList!11006 (+!4850 lt!596250 (tuple2!24325 lt!596238 minValue!1245))) lt!596243)))))

(declare-fun bs!38662 () Bool)

(assert (= bs!38662 d!144539))

(declare-fun m!1235907 () Bool)

(assert (=> bs!38662 m!1235907))

(assert (=> bs!38662 m!1235907))

(declare-fun m!1235909 () Bool)

(assert (=> bs!38662 m!1235909))

(assert (=> b!1348829 d!144539))

(declare-fun d!144541 () Bool)

(declare-fun e!767361 () Bool)

(assert (=> d!144541 e!767361))

(declare-fun res!894956 () Bool)

(assert (=> d!144541 (=> (not res!894956) (not e!767361))))

(declare-fun lt!596303 () ListLongMap!21981)

(assert (=> d!144541 (= res!894956 (contains!9186 lt!596303 (_1!12173 (tuple2!24325 lt!596234 zeroValue!1245))))))

(declare-fun lt!596304 () List!31476)

(assert (=> d!144541 (= lt!596303 (ListLongMap!21982 lt!596304))))

(declare-fun lt!596302 () Unit!44181)

(declare-fun lt!596305 () Unit!44181)

(assert (=> d!144541 (= lt!596302 lt!596305)))

(assert (=> d!144541 (= (getValueByKey!722 lt!596304 (_1!12173 (tuple2!24325 lt!596234 zeroValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596234 zeroValue!1245))))))

(assert (=> d!144541 (= lt!596305 (lemmaContainsTupThenGetReturnValue!367 lt!596304 (_1!12173 (tuple2!24325 lt!596234 zeroValue!1245)) (_2!12173 (tuple2!24325 lt!596234 zeroValue!1245))))))

(assert (=> d!144541 (= lt!596304 (insertStrictlySorted!496 (toList!11006 lt!596252) (_1!12173 (tuple2!24325 lt!596234 zeroValue!1245)) (_2!12173 (tuple2!24325 lt!596234 zeroValue!1245))))))

(assert (=> d!144541 (= (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245)) lt!596303)))

(declare-fun b!1348917 () Bool)

(declare-fun res!894955 () Bool)

(assert (=> b!1348917 (=> (not res!894955) (not e!767361))))

(assert (=> b!1348917 (= res!894955 (= (getValueByKey!722 (toList!11006 lt!596303) (_1!12173 (tuple2!24325 lt!596234 zeroValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596234 zeroValue!1245)))))))

(declare-fun b!1348918 () Bool)

(assert (=> b!1348918 (= e!767361 (contains!9189 (toList!11006 lt!596303) (tuple2!24325 lt!596234 zeroValue!1245)))))

(assert (= (and d!144541 res!894956) b!1348917))

(assert (= (and b!1348917 res!894955) b!1348918))

(declare-fun m!1235911 () Bool)

(assert (=> d!144541 m!1235911))

(declare-fun m!1235913 () Bool)

(assert (=> d!144541 m!1235913))

(declare-fun m!1235915 () Bool)

(assert (=> d!144541 m!1235915))

(declare-fun m!1235917 () Bool)

(assert (=> d!144541 m!1235917))

(declare-fun m!1235919 () Bool)

(assert (=> b!1348917 m!1235919))

(declare-fun m!1235921 () Bool)

(assert (=> b!1348918 m!1235921))

(assert (=> b!1348829 d!144541))

(declare-fun d!144543 () Bool)

(declare-fun e!767362 () Bool)

(assert (=> d!144543 e!767362))

(declare-fun res!894958 () Bool)

(assert (=> d!144543 (=> (not res!894958) (not e!767362))))

(declare-fun lt!596307 () ListLongMap!21981)

(assert (=> d!144543 (= res!894958 (contains!9186 lt!596307 (_1!12173 (tuple2!24325 lt!596238 minValue!1245))))))

(declare-fun lt!596308 () List!31476)

(assert (=> d!144543 (= lt!596307 (ListLongMap!21982 lt!596308))))

(declare-fun lt!596306 () Unit!44181)

(declare-fun lt!596309 () Unit!44181)

(assert (=> d!144543 (= lt!596306 lt!596309)))

(assert (=> d!144543 (= (getValueByKey!722 lt!596308 (_1!12173 (tuple2!24325 lt!596238 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596238 minValue!1245))))))

(assert (=> d!144543 (= lt!596309 (lemmaContainsTupThenGetReturnValue!367 lt!596308 (_1!12173 (tuple2!24325 lt!596238 minValue!1245)) (_2!12173 (tuple2!24325 lt!596238 minValue!1245))))))

(assert (=> d!144543 (= lt!596308 (insertStrictlySorted!496 (toList!11006 lt!596250) (_1!12173 (tuple2!24325 lt!596238 minValue!1245)) (_2!12173 (tuple2!24325 lt!596238 minValue!1245))))))

(assert (=> d!144543 (= (+!4850 lt!596250 (tuple2!24325 lt!596238 minValue!1245)) lt!596307)))

(declare-fun b!1348919 () Bool)

(declare-fun res!894957 () Bool)

(assert (=> b!1348919 (=> (not res!894957) (not e!767362))))

(assert (=> b!1348919 (= res!894957 (= (getValueByKey!722 (toList!11006 lt!596307) (_1!12173 (tuple2!24325 lt!596238 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596238 minValue!1245)))))))

(declare-fun b!1348920 () Bool)

(assert (=> b!1348920 (= e!767362 (contains!9189 (toList!11006 lt!596307) (tuple2!24325 lt!596238 minValue!1245)))))

(assert (= (and d!144543 res!894958) b!1348919))

(assert (= (and b!1348919 res!894957) b!1348920))

(declare-fun m!1235923 () Bool)

(assert (=> d!144543 m!1235923))

(declare-fun m!1235925 () Bool)

(assert (=> d!144543 m!1235925))

(declare-fun m!1235927 () Bool)

(assert (=> d!144543 m!1235927))

(declare-fun m!1235929 () Bool)

(assert (=> d!144543 m!1235929))

(declare-fun m!1235931 () Bool)

(assert (=> b!1348919 m!1235931))

(declare-fun m!1235933 () Bool)

(assert (=> b!1348920 m!1235933))

(assert (=> b!1348829 d!144543))

(declare-fun d!144545 () Bool)

(assert (=> d!144545 (= (apply!1039 (+!4850 lt!596251 (tuple2!24325 lt!596235 minValue!1245)) lt!596244) (apply!1039 lt!596251 lt!596244))))

(declare-fun lt!596312 () Unit!44181)

(declare-fun choose!1978 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> d!144545 (= lt!596312 (choose!1978 lt!596251 lt!596235 minValue!1245 lt!596244))))

(declare-fun e!767365 () Bool)

(assert (=> d!144545 e!767365))

(declare-fun res!894961 () Bool)

(assert (=> d!144545 (=> (not res!894961) (not e!767365))))

(assert (=> d!144545 (= res!894961 (contains!9186 lt!596251 lt!596244))))

(assert (=> d!144545 (= (addApplyDifferent!581 lt!596251 lt!596235 minValue!1245 lt!596244) lt!596312)))

(declare-fun b!1348924 () Bool)

(assert (=> b!1348924 (= e!767365 (not (= lt!596244 lt!596235)))))

(assert (= (and d!144545 res!894961) b!1348924))

(assert (=> d!144545 m!1235803))

(assert (=> d!144545 m!1235799))

(declare-fun m!1235935 () Bool)

(assert (=> d!144545 m!1235935))

(declare-fun m!1235937 () Bool)

(assert (=> d!144545 m!1235937))

(assert (=> d!144545 m!1235799))

(assert (=> d!144545 m!1235801))

(assert (=> b!1348829 d!144545))

(declare-fun d!144547 () Bool)

(assert (=> d!144547 (contains!9186 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245)) lt!596253)))

(declare-fun lt!596315 () Unit!44181)

(declare-fun choose!1979 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> d!144547 (= lt!596315 (choose!1979 lt!596252 lt!596234 zeroValue!1245 lt!596253))))

(assert (=> d!144547 (contains!9186 lt!596252 lt!596253)))

(assert (=> d!144547 (= (addStillContains!1214 lt!596252 lt!596234 zeroValue!1245 lt!596253) lt!596315)))

(declare-fun bs!38663 () Bool)

(assert (= bs!38663 d!144547))

(assert (=> bs!38663 m!1235811))

(assert (=> bs!38663 m!1235811))

(assert (=> bs!38663 m!1235817))

(declare-fun m!1235939 () Bool)

(assert (=> bs!38663 m!1235939))

(declare-fun m!1235941 () Bool)

(assert (=> bs!38663 m!1235941))

(assert (=> b!1348829 d!144547))

(declare-fun d!144549 () Bool)

(assert (=> d!144549 (= (apply!1039 (+!4850 lt!596241 (tuple2!24325 lt!596248 zeroValue!1245)) lt!596245) (get!22455 (getValueByKey!722 (toList!11006 (+!4850 lt!596241 (tuple2!24325 lt!596248 zeroValue!1245))) lt!596245)))))

(declare-fun bs!38664 () Bool)

(assert (= bs!38664 d!144549))

(declare-fun m!1235943 () Bool)

(assert (=> bs!38664 m!1235943))

(assert (=> bs!38664 m!1235943))

(declare-fun m!1235945 () Bool)

(assert (=> bs!38664 m!1235945))

(assert (=> b!1348829 d!144549))

(declare-fun d!144551 () Bool)

(assert (=> d!144551 (= (apply!1039 (+!4850 lt!596241 (tuple2!24325 lt!596248 zeroValue!1245)) lt!596245) (apply!1039 lt!596241 lt!596245))))

(declare-fun lt!596316 () Unit!44181)

(assert (=> d!144551 (= lt!596316 (choose!1978 lt!596241 lt!596248 zeroValue!1245 lt!596245))))

(declare-fun e!767366 () Bool)

(assert (=> d!144551 e!767366))

(declare-fun res!894962 () Bool)

(assert (=> d!144551 (=> (not res!894962) (not e!767366))))

(assert (=> d!144551 (= res!894962 (contains!9186 lt!596241 lt!596245))))

(assert (=> d!144551 (= (addApplyDifferent!581 lt!596241 lt!596248 zeroValue!1245 lt!596245) lt!596316)))

(declare-fun b!1348926 () Bool)

(assert (=> b!1348926 (= e!767366 (not (= lt!596245 lt!596248)))))

(assert (= (and d!144551 res!894962) b!1348926))

(assert (=> d!144551 m!1235797))

(assert (=> d!144551 m!1235809))

(declare-fun m!1235947 () Bool)

(assert (=> d!144551 m!1235947))

(declare-fun m!1235949 () Bool)

(assert (=> d!144551 m!1235949))

(assert (=> d!144551 m!1235809))

(assert (=> d!144551 m!1235823))

(assert (=> b!1348829 d!144551))

(declare-fun d!144553 () Bool)

(declare-fun e!767367 () Bool)

(assert (=> d!144553 e!767367))

(declare-fun res!894964 () Bool)

(assert (=> d!144553 (=> (not res!894964) (not e!767367))))

(declare-fun lt!596318 () ListLongMap!21981)

(assert (=> d!144553 (= res!894964 (contains!9186 lt!596318 (_1!12173 (tuple2!24325 lt!596235 minValue!1245))))))

(declare-fun lt!596319 () List!31476)

(assert (=> d!144553 (= lt!596318 (ListLongMap!21982 lt!596319))))

(declare-fun lt!596317 () Unit!44181)

(declare-fun lt!596320 () Unit!44181)

(assert (=> d!144553 (= lt!596317 lt!596320)))

(assert (=> d!144553 (= (getValueByKey!722 lt!596319 (_1!12173 (tuple2!24325 lt!596235 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596235 minValue!1245))))))

(assert (=> d!144553 (= lt!596320 (lemmaContainsTupThenGetReturnValue!367 lt!596319 (_1!12173 (tuple2!24325 lt!596235 minValue!1245)) (_2!12173 (tuple2!24325 lt!596235 minValue!1245))))))

(assert (=> d!144553 (= lt!596319 (insertStrictlySorted!496 (toList!11006 lt!596251) (_1!12173 (tuple2!24325 lt!596235 minValue!1245)) (_2!12173 (tuple2!24325 lt!596235 minValue!1245))))))

(assert (=> d!144553 (= (+!4850 lt!596251 (tuple2!24325 lt!596235 minValue!1245)) lt!596318)))

(declare-fun b!1348927 () Bool)

(declare-fun res!894963 () Bool)

(assert (=> b!1348927 (=> (not res!894963) (not e!767367))))

(assert (=> b!1348927 (= res!894963 (= (getValueByKey!722 (toList!11006 lt!596318) (_1!12173 (tuple2!24325 lt!596235 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596235 minValue!1245)))))))

(declare-fun b!1348928 () Bool)

(assert (=> b!1348928 (= e!767367 (contains!9189 (toList!11006 lt!596318) (tuple2!24325 lt!596235 minValue!1245)))))

(assert (= (and d!144553 res!894964) b!1348927))

(assert (= (and b!1348927 res!894963) b!1348928))

(declare-fun m!1235951 () Bool)

(assert (=> d!144553 m!1235951))

(declare-fun m!1235953 () Bool)

(assert (=> d!144553 m!1235953))

(declare-fun m!1235955 () Bool)

(assert (=> d!144553 m!1235955))

(declare-fun m!1235957 () Bool)

(assert (=> d!144553 m!1235957))

(declare-fun m!1235959 () Bool)

(assert (=> b!1348927 m!1235959))

(declare-fun m!1235961 () Bool)

(assert (=> b!1348928 m!1235961))

(assert (=> b!1348829 d!144553))

(declare-fun d!144555 () Bool)

(assert (=> d!144555 (= (apply!1039 lt!596250 lt!596243) (get!22455 (getValueByKey!722 (toList!11006 lt!596250) lt!596243)))))

(declare-fun bs!38665 () Bool)

(assert (= bs!38665 d!144555))

(declare-fun m!1235963 () Bool)

(assert (=> bs!38665 m!1235963))

(assert (=> bs!38665 m!1235963))

(declare-fun m!1235965 () Bool)

(assert (=> bs!38665 m!1235965))

(assert (=> b!1348829 d!144555))

(declare-fun d!144557 () Bool)

(assert (=> d!144557 (= (apply!1039 lt!596241 lt!596245) (get!22455 (getValueByKey!722 (toList!11006 lt!596241) lt!596245)))))

(declare-fun bs!38666 () Bool)

(assert (= bs!38666 d!144557))

(declare-fun m!1235967 () Bool)

(assert (=> bs!38666 m!1235967))

(assert (=> bs!38666 m!1235967))

(declare-fun m!1235969 () Bool)

(assert (=> bs!38666 m!1235969))

(assert (=> b!1348829 d!144557))

(declare-fun b!1348929 () Bool)

(declare-fun lt!596323 () Unit!44181)

(declare-fun lt!596327 () Unit!44181)

(assert (=> b!1348929 (= lt!596323 lt!596327)))

(declare-fun lt!596326 () (_ BitVec 64))

(declare-fun lt!596324 () V!55203)

(declare-fun lt!596321 () ListLongMap!21981)

(declare-fun lt!596325 () (_ BitVec 64))

(assert (=> b!1348929 (not (contains!9186 (+!4850 lt!596321 (tuple2!24325 lt!596325 lt!596324)) lt!596326))))

(assert (=> b!1348929 (= lt!596327 (addStillNotContains!503 lt!596321 lt!596325 lt!596324 lt!596326))))

(assert (=> b!1348929 (= lt!596326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348929 (= lt!596324 (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348929 (= lt!596325 (select (arr!44443 _keys!1571) from!1960))))

(declare-fun call!65151 () ListLongMap!21981)

(assert (=> b!1348929 (= lt!596321 call!65151)))

(declare-fun e!767370 () ListLongMap!21981)

(assert (=> b!1348929 (= e!767370 (+!4850 call!65151 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348930 () Bool)

(declare-fun e!767371 () ListLongMap!21981)

(assert (=> b!1348930 (= e!767371 e!767370)))

(declare-fun c!126500 () Bool)

(assert (=> b!1348930 (= c!126500 (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)))))

(declare-fun b!1348931 () Bool)

(declare-fun e!767373 () Bool)

(assert (=> b!1348931 (= e!767373 (validKeyInArray!0 (select (arr!44443 _keys!1571) from!1960)))))

(assert (=> b!1348931 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1348932 () Bool)

(assert (=> b!1348932 (= e!767371 (ListLongMap!21982 Nil!31473))))

(declare-fun b!1348933 () Bool)

(declare-fun e!767368 () Bool)

(declare-fun e!767372 () Bool)

(assert (=> b!1348933 (= e!767368 e!767372)))

(declare-fun c!126501 () Bool)

(assert (=> b!1348933 (= c!126501 (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun b!1348935 () Bool)

(declare-fun res!894965 () Bool)

(declare-fun e!767374 () Bool)

(assert (=> b!1348935 (=> (not res!894965) (not e!767374))))

(declare-fun lt!596322 () ListLongMap!21981)

(assert (=> b!1348935 (= res!894965 (not (contains!9186 lt!596322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348936 () Bool)

(assert (=> b!1348936 (= e!767374 e!767368)))

(declare-fun c!126499 () Bool)

(assert (=> b!1348936 (= c!126499 e!767373)))

(declare-fun res!894967 () Bool)

(assert (=> b!1348936 (=> (not res!894967) (not e!767373))))

(assert (=> b!1348936 (= res!894967 (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun b!1348937 () Bool)

(assert (=> b!1348937 (= e!767370 call!65151)))

(declare-fun b!1348938 () Bool)

(declare-fun e!767369 () Bool)

(assert (=> b!1348938 (= e!767368 e!767369)))

(assert (=> b!1348938 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)))))

(declare-fun res!894968 () Bool)

(assert (=> b!1348938 (= res!894968 (contains!9186 lt!596322 (select (arr!44443 _keys!1571) from!1960)))))

(assert (=> b!1348938 (=> (not res!894968) (not e!767369))))

(declare-fun b!1348939 () Bool)

(assert (=> b!1348939 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44993 _keys!1571)))))

(assert (=> b!1348939 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44994 _values!1303)))))

(assert (=> b!1348939 (= e!767369 (= (apply!1039 lt!596322 (select (arr!44443 _keys!1571) from!1960)) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!65148 () Bool)

(assert (=> bm!65148 (= call!65151 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348940 () Bool)

(assert (=> b!1348940 (= e!767372 (isEmpty!1095 lt!596322))))

(declare-fun d!144559 () Bool)

(assert (=> d!144559 e!767374))

(declare-fun res!894966 () Bool)

(assert (=> d!144559 (=> (not res!894966) (not e!767374))))

(assert (=> d!144559 (= res!894966 (not (contains!9186 lt!596322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144559 (= lt!596322 e!767371)))

(declare-fun c!126502 () Bool)

(assert (=> d!144559 (= c!126502 (bvsge from!1960 (size!44993 _keys!1571)))))

(assert (=> d!144559 (validMask!0 mask!1977)))

(assert (=> d!144559 (= (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596322)))

(declare-fun b!1348934 () Bool)

(assert (=> b!1348934 (= e!767372 (= lt!596322 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(assert (= (and d!144559 c!126502) b!1348932))

(assert (= (and d!144559 (not c!126502)) b!1348930))

(assert (= (and b!1348930 c!126500) b!1348929))

(assert (= (and b!1348930 (not c!126500)) b!1348937))

(assert (= (or b!1348929 b!1348937) bm!65148))

(assert (= (and d!144559 res!894966) b!1348935))

(assert (= (and b!1348935 res!894965) b!1348936))

(assert (= (and b!1348936 res!894967) b!1348931))

(assert (= (and b!1348936 c!126499) b!1348938))

(assert (= (and b!1348936 (not c!126499)) b!1348933))

(assert (= (and b!1348938 res!894968) b!1348939))

(assert (= (and b!1348933 c!126501) b!1348934))

(assert (= (and b!1348933 (not c!126501)) b!1348940))

(declare-fun b_lambda!24673 () Bool)

(assert (=> (not b_lambda!24673) (not b!1348929)))

(assert (=> b!1348929 t!46117))

(declare-fun b_and!50949 () Bool)

(assert (= b_and!50947 (and (=> t!46117 result!25985) b_and!50949)))

(declare-fun b_lambda!24675 () Bool)

(assert (=> (not b_lambda!24675) (not b!1348939)))

(assert (=> b!1348939 t!46117))

(declare-fun b_and!50951 () Bool)

(assert (= b_and!50949 (and (=> t!46117 result!25985) b_and!50951)))

(declare-fun m!1235971 () Bool)

(assert (=> b!1348940 m!1235971))

(declare-fun m!1235973 () Bool)

(assert (=> d!144559 m!1235973))

(assert (=> d!144559 m!1235729))

(declare-fun m!1235975 () Bool)

(assert (=> b!1348935 m!1235975))

(declare-fun m!1235977 () Bool)

(assert (=> b!1348929 m!1235977))

(declare-fun m!1235979 () Bool)

(assert (=> b!1348929 m!1235979))

(assert (=> b!1348929 m!1235715))

(assert (=> b!1348929 m!1235713))

(assert (=> b!1348929 m!1235723))

(declare-fun m!1235981 () Bool)

(assert (=> b!1348929 m!1235981))

(assert (=> b!1348929 m!1235981))

(declare-fun m!1235983 () Bool)

(assert (=> b!1348929 m!1235983))

(assert (=> b!1348929 m!1235713))

(assert (=> b!1348929 m!1235715))

(assert (=> b!1348929 m!1235717))

(assert (=> b!1348930 m!1235723))

(assert (=> b!1348930 m!1235723))

(assert (=> b!1348930 m!1235727))

(assert (=> b!1348938 m!1235723))

(assert (=> b!1348938 m!1235723))

(declare-fun m!1235985 () Bool)

(assert (=> b!1348938 m!1235985))

(assert (=> b!1348939 m!1235715))

(assert (=> b!1348939 m!1235713))

(assert (=> b!1348939 m!1235713))

(assert (=> b!1348939 m!1235715))

(assert (=> b!1348939 m!1235717))

(assert (=> b!1348939 m!1235723))

(declare-fun m!1235987 () Bool)

(assert (=> b!1348939 m!1235987))

(assert (=> b!1348939 m!1235723))

(declare-fun m!1235989 () Bool)

(assert (=> bm!65148 m!1235989))

(assert (=> b!1348934 m!1235989))

(assert (=> b!1348931 m!1235723))

(assert (=> b!1348931 m!1235723))

(assert (=> b!1348931 m!1235727))

(assert (=> b!1348829 d!144559))

(declare-fun d!144561 () Bool)

(assert (=> d!144561 (= (apply!1039 (+!4850 lt!596250 (tuple2!24325 lt!596238 minValue!1245)) lt!596243) (apply!1039 lt!596250 lt!596243))))

(declare-fun lt!596328 () Unit!44181)

(assert (=> d!144561 (= lt!596328 (choose!1978 lt!596250 lt!596238 minValue!1245 lt!596243))))

(declare-fun e!767375 () Bool)

(assert (=> d!144561 e!767375))

(declare-fun res!894969 () Bool)

(assert (=> d!144561 (=> (not res!894969) (not e!767375))))

(assert (=> d!144561 (= res!894969 (contains!9186 lt!596250 lt!596243))))

(assert (=> d!144561 (= (addApplyDifferent!581 lt!596250 lt!596238 minValue!1245 lt!596243) lt!596328)))

(declare-fun b!1348941 () Bool)

(assert (=> b!1348941 (= e!767375 (not (= lt!596243 lt!596238)))))

(assert (= (and d!144561 res!894969) b!1348941))

(assert (=> d!144561 m!1235815))

(assert (=> d!144561 m!1235793))

(declare-fun m!1235991 () Bool)

(assert (=> d!144561 m!1235991))

(declare-fun m!1235993 () Bool)

(assert (=> d!144561 m!1235993))

(assert (=> d!144561 m!1235793))

(assert (=> d!144561 m!1235795))

(assert (=> b!1348829 d!144561))

(declare-fun d!144563 () Bool)

(declare-fun e!767376 () Bool)

(assert (=> d!144563 e!767376))

(declare-fun res!894970 () Bool)

(assert (=> d!144563 (=> res!894970 e!767376)))

(declare-fun lt!596332 () Bool)

(assert (=> d!144563 (= res!894970 (not lt!596332))))

(declare-fun lt!596331 () Bool)

(assert (=> d!144563 (= lt!596332 lt!596331)))

(declare-fun lt!596329 () Unit!44181)

(declare-fun e!767377 () Unit!44181)

(assert (=> d!144563 (= lt!596329 e!767377)))

(declare-fun c!126503 () Bool)

(assert (=> d!144563 (= c!126503 lt!596331)))

(assert (=> d!144563 (= lt!596331 (containsKey!744 (toList!11006 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245))) lt!596253))))

(assert (=> d!144563 (= (contains!9186 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245)) lt!596253) lt!596332)))

(declare-fun b!1348942 () Bool)

(declare-fun lt!596330 () Unit!44181)

(assert (=> b!1348942 (= e!767377 lt!596330)))

(assert (=> b!1348942 (= lt!596330 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245))) lt!596253))))

(assert (=> b!1348942 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245))) lt!596253))))

(declare-fun b!1348943 () Bool)

(declare-fun Unit!44186 () Unit!44181)

(assert (=> b!1348943 (= e!767377 Unit!44186)))

(declare-fun b!1348944 () Bool)

(assert (=> b!1348944 (= e!767376 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 lt!596252 (tuple2!24325 lt!596234 zeroValue!1245))) lt!596253)))))

(assert (= (and d!144563 c!126503) b!1348942))

(assert (= (and d!144563 (not c!126503)) b!1348943))

(assert (= (and d!144563 (not res!894970)) b!1348944))

(declare-fun m!1235995 () Bool)

(assert (=> d!144563 m!1235995))

(declare-fun m!1235997 () Bool)

(assert (=> b!1348942 m!1235997))

(declare-fun m!1235999 () Bool)

(assert (=> b!1348942 m!1235999))

(assert (=> b!1348942 m!1235999))

(declare-fun m!1236001 () Bool)

(assert (=> b!1348942 m!1236001))

(assert (=> b!1348944 m!1235999))

(assert (=> b!1348944 m!1235999))

(assert (=> b!1348944 m!1236001))

(assert (=> b!1348829 d!144563))

(declare-fun d!144565 () Bool)

(declare-fun e!767378 () Bool)

(assert (=> d!144565 e!767378))

(declare-fun res!894972 () Bool)

(assert (=> d!144565 (=> (not res!894972) (not e!767378))))

(declare-fun lt!596334 () ListLongMap!21981)

(assert (=> d!144565 (= res!894972 (contains!9186 lt!596334 (_1!12173 (tuple2!24325 lt!596248 zeroValue!1245))))))

(declare-fun lt!596335 () List!31476)

(assert (=> d!144565 (= lt!596334 (ListLongMap!21982 lt!596335))))

(declare-fun lt!596333 () Unit!44181)

(declare-fun lt!596336 () Unit!44181)

(assert (=> d!144565 (= lt!596333 lt!596336)))

(assert (=> d!144565 (= (getValueByKey!722 lt!596335 (_1!12173 (tuple2!24325 lt!596248 zeroValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596248 zeroValue!1245))))))

(assert (=> d!144565 (= lt!596336 (lemmaContainsTupThenGetReturnValue!367 lt!596335 (_1!12173 (tuple2!24325 lt!596248 zeroValue!1245)) (_2!12173 (tuple2!24325 lt!596248 zeroValue!1245))))))

(assert (=> d!144565 (= lt!596335 (insertStrictlySorted!496 (toList!11006 lt!596241) (_1!12173 (tuple2!24325 lt!596248 zeroValue!1245)) (_2!12173 (tuple2!24325 lt!596248 zeroValue!1245))))))

(assert (=> d!144565 (= (+!4850 lt!596241 (tuple2!24325 lt!596248 zeroValue!1245)) lt!596334)))

(declare-fun b!1348945 () Bool)

(declare-fun res!894971 () Bool)

(assert (=> b!1348945 (=> (not res!894971) (not e!767378))))

(assert (=> b!1348945 (= res!894971 (= (getValueByKey!722 (toList!11006 lt!596334) (_1!12173 (tuple2!24325 lt!596248 zeroValue!1245))) (Some!773 (_2!12173 (tuple2!24325 lt!596248 zeroValue!1245)))))))

(declare-fun b!1348946 () Bool)

(assert (=> b!1348946 (= e!767378 (contains!9189 (toList!11006 lt!596334) (tuple2!24325 lt!596248 zeroValue!1245)))))

(assert (= (and d!144565 res!894972) b!1348945))

(assert (= (and b!1348945 res!894971) b!1348946))

(declare-fun m!1236003 () Bool)

(assert (=> d!144565 m!1236003))

(declare-fun m!1236005 () Bool)

(assert (=> d!144565 m!1236005))

(declare-fun m!1236007 () Bool)

(assert (=> d!144565 m!1236007))

(declare-fun m!1236009 () Bool)

(assert (=> d!144565 m!1236009))

(declare-fun m!1236011 () Bool)

(assert (=> b!1348945 m!1236011))

(declare-fun m!1236013 () Bool)

(assert (=> b!1348946 m!1236013))

(assert (=> b!1348829 d!144565))

(declare-fun d!144567 () Bool)

(assert (=> d!144567 (= (apply!1039 (+!4850 lt!596251 (tuple2!24325 lt!596235 minValue!1245)) lt!596244) (get!22455 (getValueByKey!722 (toList!11006 (+!4850 lt!596251 (tuple2!24325 lt!596235 minValue!1245))) lt!596244)))))

(declare-fun bs!38667 () Bool)

(assert (= bs!38667 d!144567))

(declare-fun m!1236015 () Bool)

(assert (=> bs!38667 m!1236015))

(assert (=> bs!38667 m!1236015))

(declare-fun m!1236017 () Bool)

(assert (=> bs!38667 m!1236017))

(assert (=> b!1348829 d!144567))

(declare-fun b!1348947 () Bool)

(declare-fun e!767381 () Bool)

(declare-fun call!65152 () Bool)

(assert (=> b!1348947 (= e!767381 call!65152)))

(declare-fun d!144569 () Bool)

(declare-fun res!894973 () Bool)

(declare-fun e!767379 () Bool)

(assert (=> d!144569 (=> res!894973 e!767379)))

(assert (=> d!144569 (= res!894973 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(assert (=> d!144569 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!767379)))

(declare-fun bm!65149 () Bool)

(assert (=> bm!65149 (= call!65152 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348948 () Bool)

(declare-fun e!767380 () Bool)

(assert (=> b!1348948 (= e!767380 e!767381)))

(declare-fun lt!596338 () (_ BitVec 64))

(assert (=> b!1348948 (= lt!596338 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596337 () Unit!44181)

(assert (=> b!1348948 (= lt!596337 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1348948 (arrayContainsKey!0 _keys!1571 lt!596338 #b00000000000000000000000000000000)))

(declare-fun lt!596339 () Unit!44181)

(assert (=> b!1348948 (= lt!596339 lt!596337)))

(declare-fun res!894974 () Bool)

(assert (=> b!1348948 (= res!894974 (= (seekEntryOrOpen!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1348948 (=> (not res!894974) (not e!767381))))

(declare-fun b!1348949 () Bool)

(assert (=> b!1348949 (= e!767379 e!767380)))

(declare-fun c!126504 () Bool)

(assert (=> b!1348949 (= c!126504 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1348950 () Bool)

(assert (=> b!1348950 (= e!767380 call!65152)))

(assert (= (and d!144569 (not res!894973)) b!1348949))

(assert (= (and b!1348949 c!126504) b!1348948))

(assert (= (and b!1348949 (not c!126504)) b!1348950))

(assert (= (and b!1348948 res!894974) b!1348947))

(assert (= (or b!1348947 b!1348950) bm!65149))

(declare-fun m!1236019 () Bool)

(assert (=> bm!65149 m!1236019))

(declare-fun m!1236021 () Bool)

(assert (=> b!1348948 m!1236021))

(declare-fun m!1236023 () Bool)

(assert (=> b!1348948 m!1236023))

(declare-fun m!1236025 () Bool)

(assert (=> b!1348948 m!1236025))

(assert (=> b!1348948 m!1236021))

(declare-fun m!1236027 () Bool)

(assert (=> b!1348948 m!1236027))

(assert (=> b!1348949 m!1236021))

(assert (=> b!1348949 m!1236021))

(declare-fun m!1236029 () Bool)

(assert (=> b!1348949 m!1236029))

(assert (=> bm!65147 d!144569))

(declare-fun d!144571 () Bool)

(assert (=> d!144571 (arrayContainsKey!0 _keys!1571 lt!596300 #b00000000000000000000000000000000)))

(declare-fun lt!596342 () Unit!44181)

(declare-fun choose!13 (array!91978 (_ BitVec 64) (_ BitVec 32)) Unit!44181)

(assert (=> d!144571 (= lt!596342 (choose!13 _keys!1571 lt!596300 #b00000000000000000000000000000000))))

(assert (=> d!144571 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144571 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596300 #b00000000000000000000000000000000) lt!596342)))

(declare-fun bs!38668 () Bool)

(assert (= bs!38668 d!144571))

(assert (=> bs!38668 m!1235895))

(declare-fun m!1236031 () Bool)

(assert (=> bs!38668 m!1236031))

(assert (=> b!1348900 d!144571))

(declare-fun d!144573 () Bool)

(declare-fun res!894979 () Bool)

(declare-fun e!767386 () Bool)

(assert (=> d!144573 (=> res!894979 e!767386)))

(assert (=> d!144573 (= res!894979 (= (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) lt!596300))))

(assert (=> d!144573 (= (arrayContainsKey!0 _keys!1571 lt!596300 #b00000000000000000000000000000000) e!767386)))

(declare-fun b!1348955 () Bool)

(declare-fun e!767387 () Bool)

(assert (=> b!1348955 (= e!767386 e!767387)))

(declare-fun res!894980 () Bool)

(assert (=> b!1348955 (=> (not res!894980) (not e!767387))))

(assert (=> b!1348955 (= res!894980 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(declare-fun b!1348956 () Bool)

(assert (=> b!1348956 (= e!767387 (arrayContainsKey!0 _keys!1571 lt!596300 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144573 (not res!894979)) b!1348955))

(assert (= (and b!1348955 res!894980) b!1348956))

(assert (=> d!144573 m!1235775))

(declare-fun m!1236033 () Bool)

(assert (=> b!1348956 m!1236033))

(assert (=> b!1348900 d!144573))

(declare-fun b!1348969 () Bool)

(declare-fun e!767395 () SeekEntryResult!10058)

(declare-fun lt!596351 () SeekEntryResult!10058)

(assert (=> b!1348969 (= e!767395 (Found!10058 (index!42605 lt!596351)))))

(declare-fun b!1348970 () Bool)

(declare-fun e!767394 () SeekEntryResult!10058)

(assert (=> b!1348970 (= e!767394 e!767395)))

(declare-fun lt!596349 () (_ BitVec 64))

(assert (=> b!1348970 (= lt!596349 (select (arr!44443 _keys!1571) (index!42605 lt!596351)))))

(declare-fun c!126513 () Bool)

(assert (=> b!1348970 (= c!126513 (= lt!596349 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348971 () Bool)

(declare-fun e!767396 () SeekEntryResult!10058)

(assert (=> b!1348971 (= e!767396 (MissingZero!10058 (index!42605 lt!596351)))))

(declare-fun b!1348972 () Bool)

(assert (=> b!1348972 (= e!767394 Undefined!10058)))

(declare-fun b!1348973 () Bool)

(declare-fun c!126511 () Bool)

(assert (=> b!1348973 (= c!126511 (= lt!596349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348973 (= e!767395 e!767396)))

(declare-fun b!1348974 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91978 (_ BitVec 32)) SeekEntryResult!10058)

(assert (=> b!1348974 (= e!767396 (seekKeyOrZeroReturnVacant!0 (x!120716 lt!596351) (index!42605 lt!596351) (index!42605 lt!596351) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun d!144575 () Bool)

(declare-fun lt!596350 () SeekEntryResult!10058)

(assert (=> d!144575 (and (or ((_ is Undefined!10058) lt!596350) (not ((_ is Found!10058) lt!596350)) (and (bvsge (index!42604 lt!596350) #b00000000000000000000000000000000) (bvslt (index!42604 lt!596350) (size!44993 _keys!1571)))) (or ((_ is Undefined!10058) lt!596350) ((_ is Found!10058) lt!596350) (not ((_ is MissingZero!10058) lt!596350)) (and (bvsge (index!42603 lt!596350) #b00000000000000000000000000000000) (bvslt (index!42603 lt!596350) (size!44993 _keys!1571)))) (or ((_ is Undefined!10058) lt!596350) ((_ is Found!10058) lt!596350) ((_ is MissingZero!10058) lt!596350) (not ((_ is MissingVacant!10058) lt!596350)) (and (bvsge (index!42606 lt!596350) #b00000000000000000000000000000000) (bvslt (index!42606 lt!596350) (size!44993 _keys!1571)))) (or ((_ is Undefined!10058) lt!596350) (ite ((_ is Found!10058) lt!596350) (= (select (arr!44443 _keys!1571) (index!42604 lt!596350)) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10058) lt!596350) (= (select (arr!44443 _keys!1571) (index!42603 lt!596350)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10058) lt!596350) (= (select (arr!44443 _keys!1571) (index!42606 lt!596350)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144575 (= lt!596350 e!767394)))

(declare-fun c!126512 () Bool)

(assert (=> d!144575 (= c!126512 (and ((_ is Intermediate!10058) lt!596351) (undefined!10870 lt!596351)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91978 (_ BitVec 32)) SeekEntryResult!10058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144575 (= lt!596351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144575 (validMask!0 mask!1977)))

(assert (=> d!144575 (= (seekEntryOrOpen!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596350)))

(assert (= (and d!144575 c!126512) b!1348972))

(assert (= (and d!144575 (not c!126512)) b!1348970))

(assert (= (and b!1348970 c!126513) b!1348969))

(assert (= (and b!1348970 (not c!126513)) b!1348973))

(assert (= (and b!1348973 c!126511) b!1348971))

(assert (= (and b!1348973 (not c!126511)) b!1348974))

(declare-fun m!1236035 () Bool)

(assert (=> b!1348970 m!1236035))

(assert (=> b!1348974 m!1235775))

(declare-fun m!1236037 () Bool)

(assert (=> b!1348974 m!1236037))

(declare-fun m!1236039 () Bool)

(assert (=> d!144575 m!1236039))

(assert (=> d!144575 m!1235729))

(declare-fun m!1236041 () Bool)

(assert (=> d!144575 m!1236041))

(assert (=> d!144575 m!1235775))

(declare-fun m!1236043 () Bool)

(assert (=> d!144575 m!1236043))

(assert (=> d!144575 m!1236043))

(assert (=> d!144575 m!1235775))

(declare-fun m!1236045 () Bool)

(assert (=> d!144575 m!1236045))

(declare-fun m!1236047 () Bool)

(assert (=> d!144575 m!1236047))

(assert (=> b!1348900 d!144575))

(declare-fun d!144577 () Bool)

(declare-fun res!894981 () Bool)

(declare-fun e!767397 () Bool)

(assert (=> d!144577 (=> res!894981 e!767397)))

(assert (=> d!144577 (= res!894981 (and ((_ is Cons!31472) (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(assert (=> d!144577 (= (containsKey!744 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!767397)))

(declare-fun b!1348975 () Bool)

(declare-fun e!767398 () Bool)

(assert (=> b!1348975 (= e!767397 e!767398)))

(declare-fun res!894982 () Bool)

(assert (=> b!1348975 (=> (not res!894982) (not e!767398))))

(assert (=> b!1348975 (= res!894982 (and (or (not ((_ is Cons!31472) (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)) ((_ is Cons!31472) (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(declare-fun b!1348976 () Bool)

(assert (=> b!1348976 (= e!767398 (containsKey!744 (t!46118 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(assert (= (and d!144577 (not res!894981)) b!1348975))

(assert (= (and b!1348975 res!894982) b!1348976))

(declare-fun m!1236049 () Bool)

(assert (=> b!1348976 m!1236049))

(assert (=> d!144523 d!144577))

(declare-fun d!144579 () Bool)

(declare-fun e!767399 () Bool)

(assert (=> d!144579 e!767399))

(declare-fun res!894983 () Bool)

(assert (=> d!144579 (=> res!894983 e!767399)))

(declare-fun lt!596355 () Bool)

(assert (=> d!144579 (= res!894983 (not lt!596355))))

(declare-fun lt!596354 () Bool)

(assert (=> d!144579 (= lt!596355 lt!596354)))

(declare-fun lt!596352 () Unit!44181)

(declare-fun e!767400 () Unit!44181)

(assert (=> d!144579 (= lt!596352 e!767400)))

(declare-fun c!126514 () Bool)

(assert (=> d!144579 (= c!126514 lt!596354)))

(assert (=> d!144579 (= lt!596354 (containsKey!744 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144579 (= (contains!9186 lt!596269 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596355)))

(declare-fun b!1348977 () Bool)

(declare-fun lt!596353 () Unit!44181)

(assert (=> b!1348977 (= e!767400 lt!596353)))

(assert (=> b!1348977 (= lt!596353 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1348977 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348978 () Bool)

(declare-fun Unit!44187 () Unit!44181)

(assert (=> b!1348978 (= e!767400 Unit!44187)))

(declare-fun b!1348979 () Bool)

(assert (=> b!1348979 (= e!767399 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144579 c!126514) b!1348977))

(assert (= (and d!144579 (not c!126514)) b!1348978))

(assert (= (and d!144579 (not res!894983)) b!1348979))

(declare-fun m!1236051 () Bool)

(assert (=> d!144579 m!1236051))

(declare-fun m!1236053 () Bool)

(assert (=> b!1348977 m!1236053))

(assert (=> b!1348977 m!1235855))

(assert (=> b!1348977 m!1235855))

(declare-fun m!1236055 () Bool)

(assert (=> b!1348977 m!1236055))

(assert (=> b!1348979 m!1235855))

(assert (=> b!1348979 m!1235855))

(assert (=> b!1348979 m!1236055))

(assert (=> d!144525 d!144579))

(declare-fun b!1348990 () Bool)

(declare-fun e!767406 () Option!774)

(assert (=> b!1348990 (= e!767406 (getValueByKey!722 (t!46118 lt!596270) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!144581 () Bool)

(declare-fun c!126519 () Bool)

(assert (=> d!144581 (= c!126519 (and ((_ is Cons!31472) lt!596270) (= (_1!12173 (h!32681 lt!596270)) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!767405 () Option!774)

(assert (=> d!144581 (= (getValueByKey!722 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767405)))

(declare-fun b!1348988 () Bool)

(assert (=> b!1348988 (= e!767405 (Some!773 (_2!12173 (h!32681 lt!596270))))))

(declare-fun b!1348989 () Bool)

(assert (=> b!1348989 (= e!767405 e!767406)))

(declare-fun c!126520 () Bool)

(assert (=> b!1348989 (= c!126520 (and ((_ is Cons!31472) lt!596270) (not (= (_1!12173 (h!32681 lt!596270)) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1348991 () Bool)

(assert (=> b!1348991 (= e!767406 None!772)))

(assert (= (and d!144581 c!126519) b!1348988))

(assert (= (and d!144581 (not c!126519)) b!1348989))

(assert (= (and b!1348989 c!126520) b!1348990))

(assert (= (and b!1348989 (not c!126520)) b!1348991))

(declare-fun m!1236057 () Bool)

(assert (=> b!1348990 m!1236057))

(assert (=> d!144525 d!144581))

(declare-fun d!144583 () Bool)

(assert (=> d!144583 (= (getValueByKey!722 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596358 () Unit!44181)

(declare-fun choose!1980 (List!31476 (_ BitVec 64) V!55203) Unit!44181)

(assert (=> d!144583 (= lt!596358 (choose!1980 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!767409 () Bool)

(assert (=> d!144583 e!767409))

(declare-fun res!894988 () Bool)

(assert (=> d!144583 (=> (not res!894988) (not e!767409))))

(declare-fun isStrictlySorted!882 (List!31476) Bool)

(assert (=> d!144583 (= res!894988 (isStrictlySorted!882 lt!596270))))

(assert (=> d!144583 (= (lemmaContainsTupThenGetReturnValue!367 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596358)))

(declare-fun b!1348996 () Bool)

(declare-fun res!894989 () Bool)

(assert (=> b!1348996 (=> (not res!894989) (not e!767409))))

(assert (=> b!1348996 (= res!894989 (containsKey!744 lt!596270 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348997 () Bool)

(assert (=> b!1348997 (= e!767409 (contains!9189 lt!596270 (tuple2!24325 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144583 res!894988) b!1348996))

(assert (= (and b!1348996 res!894989) b!1348997))

(assert (=> d!144583 m!1235849))

(declare-fun m!1236059 () Bool)

(assert (=> d!144583 m!1236059))

(declare-fun m!1236061 () Bool)

(assert (=> d!144583 m!1236061))

(declare-fun m!1236063 () Bool)

(assert (=> b!1348996 m!1236063))

(declare-fun m!1236065 () Bool)

(assert (=> b!1348997 m!1236065))

(assert (=> d!144525 d!144583))

(declare-fun e!767424 () List!31476)

(declare-fun c!126531 () Bool)

(declare-fun b!1349018 () Bool)

(declare-fun c!126532 () Bool)

(assert (=> b!1349018 (= e!767424 (ite c!126532 (t!46118 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126531 (Cons!31472 (h!32681 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46118 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31473)))))

(declare-fun b!1349019 () Bool)

(declare-fun e!767423 () List!31476)

(declare-fun call!65161 () List!31476)

(assert (=> b!1349019 (= e!767423 call!65161)))

(declare-fun b!1349020 () Bool)

(declare-fun e!767422 () List!31476)

(assert (=> b!1349020 (= e!767422 e!767423)))

(assert (=> b!1349020 (= c!126532 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12173 (h!32681 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1349021 () Bool)

(declare-fun e!767421 () List!31476)

(declare-fun call!65159 () List!31476)

(assert (=> b!1349021 (= e!767421 call!65159)))

(declare-fun c!126529 () Bool)

(declare-fun call!65160 () List!31476)

(declare-fun bm!65156 () Bool)

(declare-fun $colon$colon!673 (List!31476 tuple2!24324) List!31476)

(assert (=> bm!65156 (= call!65160 ($colon$colon!673 e!767424 (ite c!126529 (h!32681 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24325 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126530 () Bool)

(assert (=> bm!65156 (= c!126530 c!126529)))

(declare-fun bm!65157 () Bool)

(assert (=> bm!65157 (= call!65159 call!65161)))

(declare-fun bm!65158 () Bool)

(assert (=> bm!65158 (= call!65161 call!65160)))

(declare-fun e!767420 () Bool)

(declare-fun lt!596361 () List!31476)

(declare-fun b!1349023 () Bool)

(assert (=> b!1349023 (= e!767420 (contains!9189 lt!596361 (tuple2!24325 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1349024 () Bool)

(declare-fun res!894994 () Bool)

(assert (=> b!1349024 (=> (not res!894994) (not e!767420))))

(assert (=> b!1349024 (= res!894994 (containsKey!744 lt!596361 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1349025 () Bool)

(assert (=> b!1349025 (= e!767421 call!65159)))

(declare-fun d!144585 () Bool)

(assert (=> d!144585 e!767420))

(declare-fun res!894995 () Bool)

(assert (=> d!144585 (=> (not res!894995) (not e!767420))))

(assert (=> d!144585 (= res!894995 (isStrictlySorted!882 lt!596361))))

(assert (=> d!144585 (= lt!596361 e!767422)))

(assert (=> d!144585 (= c!126529 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12173 (h!32681 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144585 (isStrictlySorted!882 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!144585 (= (insertStrictlySorted!496 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596361)))

(declare-fun b!1349022 () Bool)

(assert (=> b!1349022 (= c!126531 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12173 (h!32681 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1349022 (= e!767423 e!767421)))

(declare-fun b!1349026 () Bool)

(assert (=> b!1349026 (= e!767424 (insertStrictlySorted!496 (t!46118 (toList!11006 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1349027 () Bool)

(assert (=> b!1349027 (= e!767422 call!65160)))

(assert (= (and d!144585 c!126529) b!1349027))

(assert (= (and d!144585 (not c!126529)) b!1349020))

(assert (= (and b!1349020 c!126532) b!1349019))

(assert (= (and b!1349020 (not c!126532)) b!1349022))

(assert (= (and b!1349022 c!126531) b!1349025))

(assert (= (and b!1349022 (not c!126531)) b!1349021))

(assert (= (or b!1349025 b!1349021) bm!65157))

(assert (= (or b!1349019 bm!65157) bm!65158))

(assert (= (or b!1349027 bm!65158) bm!65156))

(assert (= (and bm!65156 c!126530) b!1349026))

(assert (= (and bm!65156 (not c!126530)) b!1349018))

(assert (= (and d!144585 res!894995) b!1349024))

(assert (= (and b!1349024 res!894994) b!1349023))

(declare-fun m!1236067 () Bool)

(assert (=> b!1349026 m!1236067))

(declare-fun m!1236069 () Bool)

(assert (=> b!1349023 m!1236069))

(declare-fun m!1236071 () Bool)

(assert (=> b!1349024 m!1236071))

(declare-fun m!1236073 () Bool)

(assert (=> d!144585 m!1236073))

(declare-fun m!1236075 () Bool)

(assert (=> d!144585 m!1236075))

(declare-fun m!1236077 () Bool)

(assert (=> bm!65156 m!1236077))

(assert (=> d!144525 d!144585))

(declare-fun d!144587 () Bool)

(assert (=> d!144587 (= (apply!1039 lt!596239 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22455 (getValueByKey!722 (toList!11006 lt!596239) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38669 () Bool)

(assert (= bs!38669 d!144587))

(declare-fun m!1236079 () Bool)

(assert (=> bs!38669 m!1236079))

(assert (=> bs!38669 m!1236079))

(declare-fun m!1236081 () Bool)

(assert (=> bs!38669 m!1236081))

(assert (=> b!1348823 d!144587))

(declare-fun d!144589 () Bool)

(declare-fun e!767425 () Bool)

(assert (=> d!144589 e!767425))

(declare-fun res!894996 () Bool)

(assert (=> d!144589 (=> res!894996 e!767425)))

(declare-fun lt!596365 () Bool)

(assert (=> d!144589 (= res!894996 (not lt!596365))))

(declare-fun lt!596364 () Bool)

(assert (=> d!144589 (= lt!596365 lt!596364)))

(declare-fun lt!596362 () Unit!44181)

(declare-fun e!767426 () Unit!44181)

(assert (=> d!144589 (= lt!596362 e!767426)))

(declare-fun c!126533 () Bool)

(assert (=> d!144589 (= c!126533 lt!596364)))

(assert (=> d!144589 (= lt!596364 (containsKey!744 (toList!11006 lt!596287) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144589 (= (contains!9186 lt!596287 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596365)))

(declare-fun b!1349028 () Bool)

(declare-fun lt!596363 () Unit!44181)

(assert (=> b!1349028 (= e!767426 lt!596363)))

(assert (=> b!1349028 (= lt!596363 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596287) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349028 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349029 () Bool)

(declare-fun Unit!44188 () Unit!44181)

(assert (=> b!1349029 (= e!767426 Unit!44188)))

(declare-fun b!1349030 () Bool)

(assert (=> b!1349030 (= e!767425 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144589 c!126533) b!1349028))

(assert (= (and d!144589 (not c!126533)) b!1349029))

(assert (= (and d!144589 (not res!894996)) b!1349030))

(assert (=> d!144589 m!1235871))

(declare-fun m!1236083 () Bool)

(assert (=> d!144589 m!1236083))

(assert (=> b!1349028 m!1235871))

(declare-fun m!1236085 () Bool)

(assert (=> b!1349028 m!1236085))

(assert (=> b!1349028 m!1235871))

(declare-fun m!1236087 () Bool)

(assert (=> b!1349028 m!1236087))

(assert (=> b!1349028 m!1236087))

(declare-fun m!1236089 () Bool)

(assert (=> b!1349028 m!1236089))

(assert (=> b!1349030 m!1235871))

(assert (=> b!1349030 m!1236087))

(assert (=> b!1349030 m!1236087))

(assert (=> b!1349030 m!1236089))

(assert (=> b!1348882 d!144589))

(declare-fun d!144591 () Bool)

(declare-fun isEmpty!1096 (Option!774) Bool)

(assert (=> d!144591 (= (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)) (not (isEmpty!1096 (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))))

(declare-fun bs!38670 () Bool)

(assert (= bs!38670 d!144591))

(assert (=> bs!38670 m!1235843))

(declare-fun m!1236091 () Bool)

(assert (=> bs!38670 m!1236091))

(assert (=> b!1348842 d!144591))

(declare-fun b!1349033 () Bool)

(declare-fun e!767428 () Option!774)

(assert (=> b!1349033 (= e!767428 (getValueByKey!722 (t!46118 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(declare-fun c!126534 () Bool)

(declare-fun d!144593 () Bool)

(assert (=> d!144593 (= c!126534 (and ((_ is Cons!31472) (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(declare-fun e!767427 () Option!774)

(assert (=> d!144593 (= (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!767427)))

(declare-fun b!1349031 () Bool)

(assert (=> b!1349031 (= e!767427 (Some!773 (_2!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!1349032 () Bool)

(assert (=> b!1349032 (= e!767427 e!767428)))

(declare-fun c!126535 () Bool)

(assert (=> b!1349032 (= c!126535 (and ((_ is Cons!31472) (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!12173 (h!32681 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142))))))

(declare-fun b!1349034 () Bool)

(assert (=> b!1349034 (= e!767428 None!772)))

(assert (= (and d!144593 c!126534) b!1349031))

(assert (= (and d!144593 (not c!126534)) b!1349032))

(assert (= (and b!1349032 c!126535) b!1349033))

(assert (= (and b!1349032 (not c!126535)) b!1349034))

(declare-fun m!1236093 () Bool)

(assert (=> b!1349033 m!1236093))

(assert (=> b!1348842 d!144593))

(declare-fun d!144595 () Bool)

(declare-fun res!894997 () Bool)

(declare-fun e!767429 () Bool)

(assert (=> d!144595 (=> res!894997 e!767429)))

(assert (=> d!144595 (= res!894997 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(assert (=> d!144595 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126458 (Cons!31473 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) Nil!31474) Nil!31474)) e!767429)))

(declare-fun b!1349035 () Bool)

(declare-fun e!767432 () Bool)

(assert (=> b!1349035 (= e!767429 e!767432)))

(declare-fun res!894998 () Bool)

(assert (=> b!1349035 (=> (not res!894998) (not e!767432))))

(declare-fun e!767431 () Bool)

(assert (=> b!1349035 (= res!894998 (not e!767431))))

(declare-fun res!894999 () Bool)

(assert (=> b!1349035 (=> (not res!894999) (not e!767431))))

(assert (=> b!1349035 (= res!894999 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349036 () Bool)

(declare-fun e!767430 () Bool)

(declare-fun call!65162 () Bool)

(assert (=> b!1349036 (= e!767430 call!65162)))

(declare-fun b!1349037 () Bool)

(assert (=> b!1349037 (= e!767430 call!65162)))

(declare-fun c!126536 () Bool)

(declare-fun bm!65159 () Bool)

(assert (=> bm!65159 (= call!65162 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126536 (Cons!31473 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126458 (Cons!31473 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) Nil!31474) Nil!31474)) (ite c!126458 (Cons!31473 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) Nil!31474) Nil!31474))))))

(declare-fun b!1349038 () Bool)

(assert (=> b!1349038 (= e!767431 (contains!9188 (ite c!126458 (Cons!31473 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) Nil!31474) Nil!31474) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349039 () Bool)

(assert (=> b!1349039 (= e!767432 e!767430)))

(assert (=> b!1349039 (= c!126536 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144595 (not res!894997)) b!1349035))

(assert (= (and b!1349035 res!894999) b!1349038))

(assert (= (and b!1349035 res!894998) b!1349039))

(assert (= (and b!1349039 c!126536) b!1349036))

(assert (= (and b!1349039 (not c!126536)) b!1349037))

(assert (= (or b!1349036 b!1349037) bm!65159))

(assert (=> b!1349035 m!1236021))

(assert (=> b!1349035 m!1236021))

(assert (=> b!1349035 m!1236029))

(assert (=> bm!65159 m!1236021))

(declare-fun m!1236095 () Bool)

(assert (=> bm!65159 m!1236095))

(assert (=> b!1349038 m!1236021))

(assert (=> b!1349038 m!1236021))

(declare-fun m!1236097 () Bool)

(assert (=> b!1349038 m!1236097))

(assert (=> b!1349039 m!1236021))

(assert (=> b!1349039 m!1236021))

(assert (=> b!1349039 m!1236029))

(assert (=> bm!65120 d!144595))

(declare-fun d!144597 () Bool)

(assert (=> d!144597 (= (isDefined!529 (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1096 (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38671 () Bool)

(assert (= bs!38671 d!144597))

(assert (=> bs!38671 m!1235787))

(declare-fun m!1236099 () Bool)

(assert (=> bs!38671 m!1236099))

(assert (=> b!1348776 d!144597))

(declare-fun e!767434 () Option!774)

(declare-fun b!1349042 () Bool)

(assert (=> b!1349042 (= e!767434 (getValueByKey!722 (t!46118 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(declare-fun c!126537 () Bool)

(declare-fun d!144599 () Bool)

(assert (=> d!144599 (= c!126537 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun e!767433 () Option!774)

(assert (=> d!144599 (= (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767433)))

(declare-fun b!1349040 () Bool)

(assert (=> b!1349040 (= e!767433 (Some!773 (_2!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1349041 () Bool)

(assert (=> b!1349041 (= e!767433 e!767434)))

(declare-fun c!126538 () Bool)

(assert (=> b!1349041 (= c!126538 (and ((_ is Cons!31472) (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12173 (h!32681 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1349043 () Bool)

(assert (=> b!1349043 (= e!767434 None!772)))

(assert (= (and d!144599 c!126537) b!1349040))

(assert (= (and d!144599 (not c!126537)) b!1349041))

(assert (= (and b!1349041 c!126538) b!1349042))

(assert (= (and b!1349041 (not c!126538)) b!1349043))

(declare-fun m!1236101 () Bool)

(assert (=> b!1349042 m!1236101))

(assert (=> b!1348776 d!144599))

(declare-fun d!144601 () Bool)

(assert (=> d!144601 (= (apply!1039 lt!596287 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22455 (getValueByKey!722 (toList!11006 lt!596287) (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38672 () Bool)

(assert (= bs!38672 d!144601))

(assert (=> bs!38672 m!1235871))

(assert (=> bs!38672 m!1236087))

(assert (=> bs!38672 m!1236087))

(declare-fun m!1236103 () Bool)

(assert (=> bs!38672 m!1236103))

(assert (=> b!1348883 d!144601))

(declare-fun d!144603 () Bool)

(declare-fun c!126539 () Bool)

(assert (=> d!144603 (= c!126539 ((_ is ValueCellFull!17889) (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!767435 () V!55203)

(assert (=> d!144603 (= (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767435)))

(declare-fun b!1349044 () Bool)

(assert (=> b!1349044 (= e!767435 (get!22453 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349045 () Bool)

(assert (=> b!1349045 (= e!767435 (get!22454 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144603 c!126539) b!1349044))

(assert (= (and d!144603 (not c!126539)) b!1349045))

(assert (=> b!1349044 m!1235869))

(assert (=> b!1349044 m!1235715))

(declare-fun m!1236105 () Bool)

(assert (=> b!1349044 m!1236105))

(assert (=> b!1349045 m!1235869))

(assert (=> b!1349045 m!1235715))

(declare-fun m!1236107 () Bool)

(assert (=> b!1349045 m!1236107))

(assert (=> b!1348883 d!144603))

(declare-fun d!144605 () Bool)

(declare-fun lt!596368 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!665 (List!31477) (InoxSet (_ BitVec 64)))

(assert (=> d!144605 (= lt!596368 (select (content!665 Nil!31474) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!767440 () Bool)

(assert (=> d!144605 (= lt!596368 e!767440)))

(declare-fun res!895004 () Bool)

(assert (=> d!144605 (=> (not res!895004) (not e!767440))))

(assert (=> d!144605 (= res!895004 ((_ is Cons!31473) Nil!31474))))

(assert (=> d!144605 (= (contains!9188 Nil!31474 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)) lt!596368)))

(declare-fun b!1349050 () Bool)

(declare-fun e!767441 () Bool)

(assert (=> b!1349050 (= e!767440 e!767441)))

(declare-fun res!895005 () Bool)

(assert (=> b!1349050 (=> res!895005 e!767441)))

(assert (=> b!1349050 (= res!895005 (= (h!32682 Nil!31474) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349051 () Bool)

(assert (=> b!1349051 (= e!767441 (contains!9188 (t!46119 Nil!31474) (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144605 res!895004) b!1349050))

(assert (= (and b!1349050 (not res!895005)) b!1349051))

(declare-fun m!1236109 () Bool)

(assert (=> d!144605 m!1236109))

(assert (=> d!144605 m!1235775))

(declare-fun m!1236111 () Bool)

(assert (=> d!144605 m!1236111))

(assert (=> b!1349051 m!1235775))

(declare-fun m!1236113 () Bool)

(assert (=> b!1349051 m!1236113))

(assert (=> b!1348766 d!144605))

(declare-fun b!1349052 () Bool)

(declare-fun lt!596371 () Unit!44181)

(declare-fun lt!596375 () Unit!44181)

(assert (=> b!1349052 (= lt!596371 lt!596375)))

(declare-fun lt!596374 () (_ BitVec 64))

(declare-fun lt!596372 () V!55203)

(declare-fun lt!596373 () (_ BitVec 64))

(declare-fun lt!596369 () ListLongMap!21981)

(assert (=> b!1349052 (not (contains!9186 (+!4850 lt!596369 (tuple2!24325 lt!596373 lt!596372)) lt!596374))))

(assert (=> b!1349052 (= lt!596375 (addStillNotContains!503 lt!596369 lt!596373 lt!596372 lt!596374))))

(assert (=> b!1349052 (= lt!596374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349052 (= lt!596372 (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349052 (= lt!596373 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(declare-fun call!65163 () ListLongMap!21981)

(assert (=> b!1349052 (= lt!596369 call!65163)))

(declare-fun e!767444 () ListLongMap!21981)

(assert (=> b!1349052 (= e!767444 (+!4850 call!65163 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349053 () Bool)

(declare-fun e!767445 () ListLongMap!21981)

(assert (=> b!1349053 (= e!767445 e!767444)))

(declare-fun c!126541 () Bool)

(assert (=> b!1349053 (= c!126541 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(declare-fun b!1349054 () Bool)

(declare-fun e!767447 () Bool)

(assert (=> b!1349054 (= e!767447 (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1349054 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1349055 () Bool)

(assert (=> b!1349055 (= e!767445 (ListLongMap!21982 Nil!31473))))

(declare-fun b!1349056 () Bool)

(declare-fun e!767442 () Bool)

(declare-fun e!767446 () Bool)

(assert (=> b!1349056 (= e!767442 e!767446)))

(declare-fun c!126542 () Bool)

(assert (=> b!1349056 (= c!126542 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(declare-fun b!1349058 () Bool)

(declare-fun res!895006 () Bool)

(declare-fun e!767448 () Bool)

(assert (=> b!1349058 (=> (not res!895006) (not e!767448))))

(declare-fun lt!596370 () ListLongMap!21981)

(assert (=> b!1349058 (= res!895006 (not (contains!9186 lt!596370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349059 () Bool)

(assert (=> b!1349059 (= e!767448 e!767442)))

(declare-fun c!126540 () Bool)

(assert (=> b!1349059 (= c!126540 e!767447)))

(declare-fun res!895008 () Bool)

(assert (=> b!1349059 (=> (not res!895008) (not e!767447))))

(assert (=> b!1349059 (= res!895008 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(declare-fun b!1349060 () Bool)

(assert (=> b!1349060 (= e!767444 call!65163)))

(declare-fun b!1349061 () Bool)

(declare-fun e!767443 () Bool)

(assert (=> b!1349061 (= e!767442 e!767443)))

(assert (=> b!1349061 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(declare-fun res!895009 () Bool)

(assert (=> b!1349061 (= res!895009 (contains!9186 lt!596370 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1349061 (=> (not res!895009) (not e!767443))))

(declare-fun b!1349062 () Bool)

(assert (=> b!1349062 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(assert (=> b!1349062 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44994 _values!1303)))))

(assert (=> b!1349062 (= e!767443 (= (apply!1039 lt!596370 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!65160 () Bool)

(assert (=> bm!65160 (= call!65163 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349063 () Bool)

(assert (=> b!1349063 (= e!767446 (isEmpty!1095 lt!596370))))

(declare-fun d!144607 () Bool)

(assert (=> d!144607 e!767448))

(declare-fun res!895007 () Bool)

(assert (=> d!144607 (=> (not res!895007) (not e!767448))))

(assert (=> d!144607 (= res!895007 (not (contains!9186 lt!596370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144607 (= lt!596370 e!767445)))

(declare-fun c!126543 () Bool)

(assert (=> d!144607 (= c!126543 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44993 _keys!1571)))))

(assert (=> d!144607 (validMask!0 mask!1977)))

(assert (=> d!144607 (= (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!596370)))

(declare-fun b!1349057 () Bool)

(assert (=> b!1349057 (= e!767446 (= lt!596370 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(assert (= (and d!144607 c!126543) b!1349055))

(assert (= (and d!144607 (not c!126543)) b!1349053))

(assert (= (and b!1349053 c!126541) b!1349052))

(assert (= (and b!1349053 (not c!126541)) b!1349060))

(assert (= (or b!1349052 b!1349060) bm!65160))

(assert (= (and d!144607 res!895007) b!1349058))

(assert (= (and b!1349058 res!895006) b!1349059))

(assert (= (and b!1349059 res!895008) b!1349054))

(assert (= (and b!1349059 c!126540) b!1349061))

(assert (= (and b!1349059 (not c!126540)) b!1349056))

(assert (= (and b!1349061 res!895009) b!1349062))

(assert (= (and b!1349056 c!126542) b!1349057))

(assert (= (and b!1349056 (not c!126542)) b!1349063))

(declare-fun b_lambda!24677 () Bool)

(assert (=> (not b_lambda!24677) (not b!1349052)))

(assert (=> b!1349052 t!46117))

(declare-fun b_and!50953 () Bool)

(assert (= b_and!50951 (and (=> t!46117 result!25985) b_and!50953)))

(declare-fun b_lambda!24679 () Bool)

(assert (=> (not b_lambda!24679) (not b!1349062)))

(assert (=> b!1349062 t!46117))

(declare-fun b_and!50955 () Bool)

(assert (= b_and!50953 (and (=> t!46117 result!25985) b_and!50955)))

(declare-fun m!1236115 () Bool)

(assert (=> b!1349063 m!1236115))

(declare-fun m!1236117 () Bool)

(assert (=> d!144607 m!1236117))

(assert (=> d!144607 m!1235729))

(declare-fun m!1236119 () Bool)

(assert (=> b!1349058 m!1236119))

(declare-fun m!1236121 () Bool)

(assert (=> b!1349052 m!1236121))

(declare-fun m!1236123 () Bool)

(assert (=> b!1349052 m!1236123))

(assert (=> b!1349052 m!1235715))

(declare-fun m!1236125 () Bool)

(assert (=> b!1349052 m!1236125))

(declare-fun m!1236127 () Bool)

(assert (=> b!1349052 m!1236127))

(declare-fun m!1236129 () Bool)

(assert (=> b!1349052 m!1236129))

(assert (=> b!1349052 m!1236129))

(declare-fun m!1236131 () Bool)

(assert (=> b!1349052 m!1236131))

(assert (=> b!1349052 m!1236125))

(assert (=> b!1349052 m!1235715))

(declare-fun m!1236133 () Bool)

(assert (=> b!1349052 m!1236133))

(assert (=> b!1349053 m!1236127))

(assert (=> b!1349053 m!1236127))

(declare-fun m!1236135 () Bool)

(assert (=> b!1349053 m!1236135))

(assert (=> b!1349061 m!1236127))

(assert (=> b!1349061 m!1236127))

(declare-fun m!1236137 () Bool)

(assert (=> b!1349061 m!1236137))

(assert (=> b!1349062 m!1235715))

(assert (=> b!1349062 m!1236125))

(assert (=> b!1349062 m!1236125))

(assert (=> b!1349062 m!1235715))

(assert (=> b!1349062 m!1236133))

(assert (=> b!1349062 m!1236127))

(declare-fun m!1236139 () Bool)

(assert (=> b!1349062 m!1236139))

(assert (=> b!1349062 m!1236127))

(declare-fun m!1236141 () Bool)

(assert (=> bm!65160 m!1236141))

(assert (=> b!1349057 m!1236141))

(assert (=> b!1349054 m!1236127))

(assert (=> b!1349054 m!1236127))

(assert (=> b!1349054 m!1236135))

(assert (=> bm!65144 d!144607))

(declare-fun d!144609 () Bool)

(assert (=> d!144609 (= (validKeyInArray!0 (select (arr!44443 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44443 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348767 d!144609))

(assert (=> b!1348826 d!144531))

(declare-fun d!144611 () Bool)

(declare-fun isEmpty!1097 (List!31476) Bool)

(assert (=> d!144611 (= (isEmpty!1095 lt!596287) (isEmpty!1097 (toList!11006 lt!596287)))))

(declare-fun bs!38673 () Bool)

(assert (= bs!38673 d!144611))

(declare-fun m!1236143 () Bool)

(assert (=> bs!38673 m!1236143))

(assert (=> b!1348884 d!144611))

(declare-fun d!144613 () Bool)

(declare-fun e!767449 () Bool)

(assert (=> d!144613 e!767449))

(declare-fun res!895011 () Bool)

(assert (=> d!144613 (=> (not res!895011) (not e!767449))))

(declare-fun lt!596377 () ListLongMap!21981)

(assert (=> d!144613 (= res!895011 (contains!9186 lt!596377 (_1!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596378 () List!31476)

(assert (=> d!144613 (= lt!596377 (ListLongMap!21982 lt!596378))))

(declare-fun lt!596376 () Unit!44181)

(declare-fun lt!596379 () Unit!44181)

(assert (=> d!144613 (= lt!596376 lt!596379)))

(assert (=> d!144613 (= (getValueByKey!722 lt!596378 (_1!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!773 (_2!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144613 (= lt!596379 (lemmaContainsTupThenGetReturnValue!367 lt!596378 (_1!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144613 (= lt!596378 (insertStrictlySorted!496 (toList!11006 (ite c!126476 call!65143 (ite c!126474 call!65140 call!65139))) (_1!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144613 (= (+!4850 (ite c!126476 call!65143 (ite c!126474 call!65140 call!65139)) (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596377)))

(declare-fun b!1349064 () Bool)

(declare-fun res!895010 () Bool)

(assert (=> b!1349064 (=> (not res!895010) (not e!767449))))

(assert (=> b!1349064 (= res!895010 (= (getValueByKey!722 (toList!11006 lt!596377) (_1!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!773 (_2!12173 (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1349065 () Bool)

(assert (=> b!1349065 (= e!767449 (contains!9189 (toList!11006 lt!596377) (ite (or c!126476 c!126474) (tuple2!24325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144613 res!895011) b!1349064))

(assert (= (and b!1349064 res!895010) b!1349065))

(declare-fun m!1236145 () Bool)

(assert (=> d!144613 m!1236145))

(declare-fun m!1236147 () Bool)

(assert (=> d!144613 m!1236147))

(declare-fun m!1236149 () Bool)

(assert (=> d!144613 m!1236149))

(declare-fun m!1236151 () Bool)

(assert (=> d!144613 m!1236151))

(declare-fun m!1236153 () Bool)

(assert (=> b!1349064 m!1236153))

(declare-fun m!1236155 () Bool)

(assert (=> b!1349065 m!1236155))

(assert (=> bm!65138 d!144613))

(assert (=> b!1348878 d!144607))

(declare-fun b!1349068 () Bool)

(declare-fun e!767451 () Option!774)

(assert (=> b!1349068 (= e!767451 (getValueByKey!722 (t!46118 (toList!11006 lt!596269)) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!144615 () Bool)

(declare-fun c!126544 () Bool)

(assert (=> d!144615 (= c!126544 (and ((_ is Cons!31472) (toList!11006 lt!596269)) (= (_1!12173 (h!32681 (toList!11006 lt!596269))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!767450 () Option!774)

(assert (=> d!144615 (= (getValueByKey!722 (toList!11006 lt!596269) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767450)))

(declare-fun b!1349066 () Bool)

(assert (=> b!1349066 (= e!767450 (Some!773 (_2!12173 (h!32681 (toList!11006 lt!596269)))))))

(declare-fun b!1349067 () Bool)

(assert (=> b!1349067 (= e!767450 e!767451)))

(declare-fun c!126545 () Bool)

(assert (=> b!1349067 (= c!126545 (and ((_ is Cons!31472) (toList!11006 lt!596269)) (not (= (_1!12173 (h!32681 (toList!11006 lt!596269))) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1349069 () Bool)

(assert (=> b!1349069 (= e!767451 None!772)))

(assert (= (and d!144615 c!126544) b!1349066))

(assert (= (and d!144615 (not c!126544)) b!1349067))

(assert (= (and b!1349067 c!126545) b!1349068))

(assert (= (and b!1349067 (not c!126545)) b!1349069))

(declare-fun m!1236157 () Bool)

(assert (=> b!1349068 m!1236157))

(assert (=> b!1348847 d!144615))

(declare-fun d!144617 () Bool)

(declare-fun e!767452 () Bool)

(assert (=> d!144617 e!767452))

(declare-fun res!895012 () Bool)

(assert (=> d!144617 (=> res!895012 e!767452)))

(declare-fun lt!596383 () Bool)

(assert (=> d!144617 (= res!895012 (not lt!596383))))

(declare-fun lt!596382 () Bool)

(assert (=> d!144617 (= lt!596383 lt!596382)))

(declare-fun lt!596380 () Unit!44181)

(declare-fun e!767453 () Unit!44181)

(assert (=> d!144617 (= lt!596380 e!767453)))

(declare-fun c!126546 () Bool)

(assert (=> d!144617 (= c!126546 lt!596382)))

(assert (=> d!144617 (= lt!596382 (containsKey!744 (toList!11006 lt!596287) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144617 (= (contains!9186 lt!596287 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596383)))

(declare-fun b!1349070 () Bool)

(declare-fun lt!596381 () Unit!44181)

(assert (=> b!1349070 (= e!767453 lt!596381)))

(assert (=> b!1349070 (= lt!596381 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596287) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349070 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349071 () Bool)

(declare-fun Unit!44189 () Unit!44181)

(assert (=> b!1349071 (= e!767453 Unit!44189)))

(declare-fun b!1349072 () Bool)

(assert (=> b!1349072 (= e!767452 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144617 c!126546) b!1349070))

(assert (= (and d!144617 (not c!126546)) b!1349071))

(assert (= (and d!144617 (not res!895012)) b!1349072))

(declare-fun m!1236159 () Bool)

(assert (=> d!144617 m!1236159))

(declare-fun m!1236161 () Bool)

(assert (=> b!1349070 m!1236161))

(declare-fun m!1236163 () Bool)

(assert (=> b!1349070 m!1236163))

(assert (=> b!1349070 m!1236163))

(declare-fun m!1236165 () Bool)

(assert (=> b!1349070 m!1236165))

(assert (=> b!1349072 m!1236163))

(assert (=> b!1349072 m!1236163))

(assert (=> b!1349072 m!1236165))

(assert (=> b!1348879 d!144617))

(assert (=> b!1348763 d!144609))

(assert (=> bm!65136 d!144559))

(declare-fun lt!596386 () Bool)

(declare-fun d!144619 () Bool)

(declare-fun content!666 (List!31476) (InoxSet tuple2!24324))

(assert (=> d!144619 (= lt!596386 (select (content!666 (toList!11006 lt!596269)) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!767458 () Bool)

(assert (=> d!144619 (= lt!596386 e!767458)))

(declare-fun res!895017 () Bool)

(assert (=> d!144619 (=> (not res!895017) (not e!767458))))

(assert (=> d!144619 (= res!895017 ((_ is Cons!31472) (toList!11006 lt!596269)))))

(assert (=> d!144619 (= (contains!9189 (toList!11006 lt!596269) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596386)))

(declare-fun b!1349077 () Bool)

(declare-fun e!767459 () Bool)

(assert (=> b!1349077 (= e!767458 e!767459)))

(declare-fun res!895018 () Bool)

(assert (=> b!1349077 (=> res!895018 e!767459)))

(assert (=> b!1349077 (= res!895018 (= (h!32681 (toList!11006 lt!596269)) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349078 () Bool)

(assert (=> b!1349078 (= e!767459 (contains!9189 (t!46118 (toList!11006 lt!596269)) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144619 res!895017) b!1349077))

(assert (= (and b!1349077 (not res!895018)) b!1349078))

(declare-fun m!1236167 () Bool)

(assert (=> d!144619 m!1236167))

(declare-fun m!1236169 () Bool)

(assert (=> d!144619 m!1236169))

(declare-fun m!1236171 () Bool)

(assert (=> b!1349078 m!1236171))

(assert (=> b!1348848 d!144619))

(declare-fun d!144621 () Bool)

(assert (=> d!144621 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun lt!596389 () Unit!44181)

(declare-fun choose!1981 (List!31476 (_ BitVec 64)) Unit!44181)

(assert (=> d!144621 (= lt!596389 (choose!1981 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun e!767462 () Bool)

(assert (=> d!144621 e!767462))

(declare-fun res!895021 () Bool)

(assert (=> d!144621 (=> (not res!895021) (not e!767462))))

(assert (=> d!144621 (= res!895021 (isStrictlySorted!882 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144621 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) lt!596389)))

(declare-fun b!1349081 () Bool)

(assert (=> b!1349081 (= e!767462 (containsKey!744 (toList!11006 (+!4850 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24325 (select (arr!44443 _keys!1571) from!1960) (get!22452 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (= (and d!144621 res!895021) b!1349081))

(assert (=> d!144621 m!1235843))

(assert (=> d!144621 m!1235843))

(assert (=> d!144621 m!1235845))

(declare-fun m!1236173 () Bool)

(assert (=> d!144621 m!1236173))

(declare-fun m!1236175 () Bool)

(assert (=> d!144621 m!1236175))

(assert (=> b!1349081 m!1235839))

(assert (=> b!1348840 d!144621))

(assert (=> b!1348840 d!144591))

(assert (=> b!1348840 d!144593))

(declare-fun d!144623 () Bool)

(assert (=> d!144623 (= (apply!1039 lt!596239 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22455 (getValueByKey!722 (toList!11006 lt!596239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38674 () Bool)

(assert (= bs!38674 d!144623))

(declare-fun m!1236177 () Bool)

(assert (=> bs!38674 m!1236177))

(assert (=> bs!38674 m!1236177))

(declare-fun m!1236179 () Bool)

(assert (=> bs!38674 m!1236179))

(assert (=> b!1348839 d!144623))

(declare-fun d!144625 () Bool)

(assert (=> d!144625 (isDefined!529 (getValueByKey!722 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596390 () Unit!44181)

(assert (=> d!144625 (= lt!596390 (choose!1981 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!767463 () Bool)

(assert (=> d!144625 e!767463))

(declare-fun res!895022 () Bool)

(assert (=> d!144625 (=> (not res!895022) (not e!767463))))

(assert (=> d!144625 (= res!895022 (isStrictlySorted!882 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144625 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596390)))

(declare-fun b!1349082 () Bool)

(assert (=> b!1349082 (= e!767463 (containsKey!744 (toList!11006 (getCurrentListMap!5955 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144625 res!895022) b!1349082))

(assert (=> d!144625 m!1235787))

(assert (=> d!144625 m!1235787))

(assert (=> d!144625 m!1235789))

(declare-fun m!1236181 () Bool)

(assert (=> d!144625 m!1236181))

(declare-fun m!1236183 () Bool)

(assert (=> d!144625 m!1236183))

(assert (=> b!1349082 m!1235783))

(assert (=> b!1348774 d!144625))

(assert (=> b!1348774 d!144597))

(assert (=> b!1348774 d!144599))

(declare-fun d!144627 () Bool)

(declare-fun e!767464 () Bool)

(assert (=> d!144627 e!767464))

(declare-fun res!895023 () Bool)

(assert (=> d!144627 (=> res!895023 e!767464)))

(declare-fun lt!596394 () Bool)

(assert (=> d!144627 (= res!895023 (not lt!596394))))

(declare-fun lt!596393 () Bool)

(assert (=> d!144627 (= lt!596394 lt!596393)))

(declare-fun lt!596391 () Unit!44181)

(declare-fun e!767465 () Unit!44181)

(assert (=> d!144627 (= lt!596391 e!767465)))

(declare-fun c!126547 () Bool)

(assert (=> d!144627 (= c!126547 lt!596393)))

(assert (=> d!144627 (= lt!596393 (containsKey!744 (toList!11006 lt!596239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144627 (= (contains!9186 lt!596239 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596394)))

(declare-fun b!1349083 () Bool)

(declare-fun lt!596392 () Unit!44181)

(assert (=> b!1349083 (= e!767465 lt!596392)))

(assert (=> b!1349083 (= lt!596392 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349083 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349084 () Bool)

(declare-fun Unit!44190 () Unit!44181)

(assert (=> b!1349084 (= e!767465 Unit!44190)))

(declare-fun b!1349085 () Bool)

(assert (=> b!1349085 (= e!767464 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144627 c!126547) b!1349083))

(assert (= (and d!144627 (not c!126547)) b!1349084))

(assert (= (and d!144627 (not res!895023)) b!1349085))

(declare-fun m!1236185 () Bool)

(assert (=> d!144627 m!1236185))

(declare-fun m!1236187 () Bool)

(assert (=> b!1349083 m!1236187))

(assert (=> b!1349083 m!1236177))

(assert (=> b!1349083 m!1236177))

(declare-fun m!1236189 () Bool)

(assert (=> b!1349083 m!1236189))

(assert (=> b!1349085 m!1236177))

(assert (=> b!1349085 m!1236177))

(assert (=> b!1349085 m!1236189))

(assert (=> bm!65137 d!144627))

(assert (=> b!1348901 d!144609))

(assert (=> d!144521 d!144513))

(assert (=> b!1348833 d!144531))

(declare-fun d!144629 () Bool)

(declare-fun e!767466 () Bool)

(assert (=> d!144629 e!767466))

(declare-fun res!895024 () Bool)

(assert (=> d!144629 (=> res!895024 e!767466)))

(declare-fun lt!596398 () Bool)

(assert (=> d!144629 (= res!895024 (not lt!596398))))

(declare-fun lt!596397 () Bool)

(assert (=> d!144629 (= lt!596398 lt!596397)))

(declare-fun lt!596395 () Unit!44181)

(declare-fun e!767467 () Unit!44181)

(assert (=> d!144629 (= lt!596395 e!767467)))

(declare-fun c!126548 () Bool)

(assert (=> d!144629 (= c!126548 lt!596397)))

(assert (=> d!144629 (= lt!596397 (containsKey!744 (toList!11006 lt!596287) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144629 (= (contains!9186 lt!596287 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596398)))

(declare-fun b!1349086 () Bool)

(declare-fun lt!596396 () Unit!44181)

(assert (=> b!1349086 (= e!767467 lt!596396)))

(assert (=> b!1349086 (= lt!596396 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596287) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349086 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349087 () Bool)

(declare-fun Unit!44191 () Unit!44181)

(assert (=> b!1349087 (= e!767467 Unit!44191)))

(declare-fun b!1349088 () Bool)

(assert (=> b!1349088 (= e!767466 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596287) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144629 c!126548) b!1349086))

(assert (= (and d!144629 (not c!126548)) b!1349087))

(assert (= (and d!144629 (not res!895024)) b!1349088))

(declare-fun m!1236191 () Bool)

(assert (=> d!144629 m!1236191))

(declare-fun m!1236193 () Bool)

(assert (=> b!1349086 m!1236193))

(declare-fun m!1236195 () Bool)

(assert (=> b!1349086 m!1236195))

(assert (=> b!1349086 m!1236195))

(declare-fun m!1236197 () Bool)

(assert (=> b!1349086 m!1236197))

(assert (=> b!1349088 m!1236195))

(assert (=> b!1349088 m!1236195))

(assert (=> b!1349088 m!1236197))

(assert (=> d!144527 d!144629))

(assert (=> d!144527 d!144513))

(declare-fun d!144631 () Bool)

(declare-fun e!767468 () Bool)

(assert (=> d!144631 e!767468))

(declare-fun res!895025 () Bool)

(assert (=> d!144631 (=> res!895025 e!767468)))

(declare-fun lt!596402 () Bool)

(assert (=> d!144631 (= res!895025 (not lt!596402))))

(declare-fun lt!596401 () Bool)

(assert (=> d!144631 (= lt!596402 lt!596401)))

(declare-fun lt!596399 () Unit!44181)

(declare-fun e!767469 () Unit!44181)

(assert (=> d!144631 (= lt!596399 e!767469)))

(declare-fun c!126549 () Bool)

(assert (=> d!144631 (= c!126549 lt!596401)))

(assert (=> d!144631 (= lt!596401 (containsKey!744 (toList!11006 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289))) lt!596291))))

(assert (=> d!144631 (= (contains!9186 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289)) lt!596291) lt!596402)))

(declare-fun b!1349089 () Bool)

(declare-fun lt!596400 () Unit!44181)

(assert (=> b!1349089 (= e!767469 lt!596400)))

(assert (=> b!1349089 (= lt!596400 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289))) lt!596291))))

(assert (=> b!1349089 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289))) lt!596291))))

(declare-fun b!1349090 () Bool)

(declare-fun Unit!44192 () Unit!44181)

(assert (=> b!1349090 (= e!767469 Unit!44192)))

(declare-fun b!1349091 () Bool)

(assert (=> b!1349091 (= e!767468 (isDefined!529 (getValueByKey!722 (toList!11006 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289))) lt!596291)))))

(assert (= (and d!144631 c!126549) b!1349089))

(assert (= (and d!144631 (not c!126549)) b!1349090))

(assert (= (and d!144631 (not res!895025)) b!1349091))

(declare-fun m!1236199 () Bool)

(assert (=> d!144631 m!1236199))

(declare-fun m!1236201 () Bool)

(assert (=> b!1349089 m!1236201))

(declare-fun m!1236203 () Bool)

(assert (=> b!1349089 m!1236203))

(assert (=> b!1349089 m!1236203))

(declare-fun m!1236205 () Bool)

(assert (=> b!1349089 m!1236205))

(assert (=> b!1349091 m!1236203))

(assert (=> b!1349091 m!1236203))

(assert (=> b!1349091 m!1236205))

(assert (=> b!1348873 d!144631))

(assert (=> b!1348873 d!144603))

(declare-fun d!144633 () Bool)

(assert (=> d!144633 (not (contains!9186 (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289)) lt!596291))))

(declare-fun lt!596405 () Unit!44181)

(declare-fun choose!1982 (ListLongMap!21981 (_ BitVec 64) V!55203 (_ BitVec 64)) Unit!44181)

(assert (=> d!144633 (= lt!596405 (choose!1982 lt!596286 lt!596290 lt!596289 lt!596291))))

(declare-fun e!767472 () Bool)

(assert (=> d!144633 e!767472))

(declare-fun res!895028 () Bool)

(assert (=> d!144633 (=> (not res!895028) (not e!767472))))

(assert (=> d!144633 (= res!895028 (not (contains!9186 lt!596286 lt!596291)))))

(assert (=> d!144633 (= (addStillNotContains!503 lt!596286 lt!596290 lt!596289 lt!596291) lt!596405)))

(declare-fun b!1349095 () Bool)

(assert (=> b!1349095 (= e!767472 (not (= lt!596290 lt!596291)))))

(assert (= (and d!144633 res!895028) b!1349095))

(assert (=> d!144633 m!1235873))

(assert (=> d!144633 m!1235873))

(assert (=> d!144633 m!1235875))

(declare-fun m!1236207 () Bool)

(assert (=> d!144633 m!1236207))

(declare-fun m!1236209 () Bool)

(assert (=> d!144633 m!1236209))

(assert (=> b!1348873 d!144633))

(declare-fun d!144635 () Bool)

(declare-fun e!767473 () Bool)

(assert (=> d!144635 e!767473))

(declare-fun res!895030 () Bool)

(assert (=> d!144635 (=> (not res!895030) (not e!767473))))

(declare-fun lt!596407 () ListLongMap!21981)

(assert (=> d!144635 (= res!895030 (contains!9186 lt!596407 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596408 () List!31476)

(assert (=> d!144635 (= lt!596407 (ListLongMap!21982 lt!596408))))

(declare-fun lt!596406 () Unit!44181)

(declare-fun lt!596409 () Unit!44181)

(assert (=> d!144635 (= lt!596406 lt!596409)))

(assert (=> d!144635 (= (getValueByKey!722 lt!596408 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144635 (= lt!596409 (lemmaContainsTupThenGetReturnValue!367 lt!596408 (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144635 (= lt!596408 (insertStrictlySorted!496 (toList!11006 call!65147) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144635 (= (+!4850 call!65147 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596407)))

(declare-fun b!1349096 () Bool)

(declare-fun res!895029 () Bool)

(assert (=> b!1349096 (=> (not res!895029) (not e!767473))))

(assert (=> b!1349096 (= res!895029 (= (getValueByKey!722 (toList!11006 lt!596407) (_1!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!773 (_2!12173 (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1349097 () Bool)

(assert (=> b!1349097 (= e!767473 (contains!9189 (toList!11006 lt!596407) (tuple2!24325 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22452 (select (arr!44444 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144635 res!895030) b!1349096))

(assert (= (and b!1349096 res!895029) b!1349097))

(declare-fun m!1236211 () Bool)

(assert (=> d!144635 m!1236211))

(declare-fun m!1236213 () Bool)

(assert (=> d!144635 m!1236213))

(declare-fun m!1236215 () Bool)

(assert (=> d!144635 m!1236215))

(declare-fun m!1236217 () Bool)

(assert (=> d!144635 m!1236217))

(declare-fun m!1236219 () Bool)

(assert (=> b!1349096 m!1236219))

(declare-fun m!1236221 () Bool)

(assert (=> b!1349097 m!1236221))

(assert (=> b!1348873 d!144635))

(declare-fun d!144637 () Bool)

(declare-fun e!767474 () Bool)

(assert (=> d!144637 e!767474))

(declare-fun res!895032 () Bool)

(assert (=> d!144637 (=> (not res!895032) (not e!767474))))

(declare-fun lt!596411 () ListLongMap!21981)

(assert (=> d!144637 (= res!895032 (contains!9186 lt!596411 (_1!12173 (tuple2!24325 lt!596290 lt!596289))))))

(declare-fun lt!596412 () List!31476)

(assert (=> d!144637 (= lt!596411 (ListLongMap!21982 lt!596412))))

(declare-fun lt!596410 () Unit!44181)

(declare-fun lt!596413 () Unit!44181)

(assert (=> d!144637 (= lt!596410 lt!596413)))

(assert (=> d!144637 (= (getValueByKey!722 lt!596412 (_1!12173 (tuple2!24325 lt!596290 lt!596289))) (Some!773 (_2!12173 (tuple2!24325 lt!596290 lt!596289))))))

(assert (=> d!144637 (= lt!596413 (lemmaContainsTupThenGetReturnValue!367 lt!596412 (_1!12173 (tuple2!24325 lt!596290 lt!596289)) (_2!12173 (tuple2!24325 lt!596290 lt!596289))))))

(assert (=> d!144637 (= lt!596412 (insertStrictlySorted!496 (toList!11006 lt!596286) (_1!12173 (tuple2!24325 lt!596290 lt!596289)) (_2!12173 (tuple2!24325 lt!596290 lt!596289))))))

(assert (=> d!144637 (= (+!4850 lt!596286 (tuple2!24325 lt!596290 lt!596289)) lt!596411)))

(declare-fun b!1349098 () Bool)

(declare-fun res!895031 () Bool)

(assert (=> b!1349098 (=> (not res!895031) (not e!767474))))

(assert (=> b!1349098 (= res!895031 (= (getValueByKey!722 (toList!11006 lt!596411) (_1!12173 (tuple2!24325 lt!596290 lt!596289))) (Some!773 (_2!12173 (tuple2!24325 lt!596290 lt!596289)))))))

(declare-fun b!1349099 () Bool)

(assert (=> b!1349099 (= e!767474 (contains!9189 (toList!11006 lt!596411) (tuple2!24325 lt!596290 lt!596289)))))

(assert (= (and d!144637 res!895032) b!1349098))

(assert (= (and b!1349098 res!895031) b!1349099))

(declare-fun m!1236223 () Bool)

(assert (=> d!144637 m!1236223))

(declare-fun m!1236225 () Bool)

(assert (=> d!144637 m!1236225))

(declare-fun m!1236227 () Bool)

(assert (=> d!144637 m!1236227))

(declare-fun m!1236229 () Bool)

(assert (=> d!144637 m!1236229))

(declare-fun m!1236231 () Bool)

(assert (=> b!1349098 m!1236231))

(declare-fun m!1236233 () Bool)

(assert (=> b!1349099 m!1236233))

(assert (=> b!1348873 d!144637))

(declare-fun d!144639 () Bool)

(assert (=> d!144639 (= (validKeyInArray!0 (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44443 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348874 d!144639))

(declare-fun d!144641 () Bool)

(assert (=> d!144641 (= (get!22453 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21514 (select (arr!44444 _values!1303) from!1960)))))

(assert (=> b!1348889 d!144641))

(declare-fun d!144643 () Bool)

(declare-fun e!767475 () Bool)

(assert (=> d!144643 e!767475))

(declare-fun res!895033 () Bool)

(assert (=> d!144643 (=> res!895033 e!767475)))

(declare-fun lt!596417 () Bool)

(assert (=> d!144643 (= res!895033 (not lt!596417))))

(declare-fun lt!596416 () Bool)

(assert (=> d!144643 (= lt!596417 lt!596416)))

(declare-fun lt!596414 () Unit!44181)

(declare-fun e!767476 () Unit!44181)

(assert (=> d!144643 (= lt!596414 e!767476)))

(declare-fun c!126550 () Bool)

(assert (=> d!144643 (= c!126550 lt!596416)))

(assert (=> d!144643 (= lt!596416 (containsKey!744 (toList!11006 lt!596239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144643 (= (contains!9186 lt!596239 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596417)))

(declare-fun b!1349100 () Bool)

(declare-fun lt!596415 () Unit!44181)

(assert (=> b!1349100 (= e!767476 lt!596415)))

(assert (=> b!1349100 (= lt!596415 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349100 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349101 () Bool)

(declare-fun Unit!44193 () Unit!44181)

(assert (=> b!1349101 (= e!767476 Unit!44193)))

(declare-fun b!1349102 () Bool)

(assert (=> b!1349102 (= e!767475 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144643 c!126550) b!1349100))

(assert (= (and d!144643 (not c!126550)) b!1349101))

(assert (= (and d!144643 (not res!895033)) b!1349102))

(declare-fun m!1236235 () Bool)

(assert (=> d!144643 m!1236235))

(declare-fun m!1236237 () Bool)

(assert (=> b!1349100 m!1236237))

(assert (=> b!1349100 m!1236079))

(assert (=> b!1349100 m!1236079))

(declare-fun m!1236239 () Bool)

(assert (=> b!1349100 m!1236239))

(assert (=> b!1349102 m!1236079))

(assert (=> b!1349102 m!1236079))

(assert (=> b!1349102 m!1236239))

(assert (=> bm!65139 d!144643))

(declare-fun d!144645 () Bool)

(assert (=> d!144645 (= (apply!1039 lt!596239 (select (arr!44443 _keys!1571) from!1960)) (get!22455 (getValueByKey!722 (toList!11006 lt!596239) (select (arr!44443 _keys!1571) from!1960))))))

(declare-fun bs!38675 () Bool)

(assert (= bs!38675 d!144645))

(assert (=> bs!38675 m!1235723))

(declare-fun m!1236241 () Bool)

(assert (=> bs!38675 m!1236241))

(assert (=> bs!38675 m!1236241))

(declare-fun m!1236243 () Bool)

(assert (=> bs!38675 m!1236243))

(assert (=> b!1348835 d!144645))

(assert (=> b!1348835 d!144529))

(declare-fun d!144647 () Bool)

(declare-fun e!767477 () Bool)

(assert (=> d!144647 e!767477))

(declare-fun res!895034 () Bool)

(assert (=> d!144647 (=> res!895034 e!767477)))

(declare-fun lt!596421 () Bool)

(assert (=> d!144647 (= res!895034 (not lt!596421))))

(declare-fun lt!596420 () Bool)

(assert (=> d!144647 (= lt!596421 lt!596420)))

(declare-fun lt!596418 () Unit!44181)

(declare-fun e!767478 () Unit!44181)

(assert (=> d!144647 (= lt!596418 e!767478)))

(declare-fun c!126551 () Bool)

(assert (=> d!144647 (= c!126551 lt!596420)))

(assert (=> d!144647 (= lt!596420 (containsKey!744 (toList!11006 lt!596239) (select (arr!44443 _keys!1571) from!1960)))))

(assert (=> d!144647 (= (contains!9186 lt!596239 (select (arr!44443 _keys!1571) from!1960)) lt!596421)))

(declare-fun b!1349103 () Bool)

(declare-fun lt!596419 () Unit!44181)

(assert (=> b!1349103 (= e!767478 lt!596419)))

(assert (=> b!1349103 (= lt!596419 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11006 lt!596239) (select (arr!44443 _keys!1571) from!1960)))))

(assert (=> b!1349103 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) (select (arr!44443 _keys!1571) from!1960)))))

(declare-fun b!1349104 () Bool)

(declare-fun Unit!44194 () Unit!44181)

(assert (=> b!1349104 (= e!767478 Unit!44194)))

(declare-fun b!1349105 () Bool)

(assert (=> b!1349105 (= e!767477 (isDefined!529 (getValueByKey!722 (toList!11006 lt!596239) (select (arr!44443 _keys!1571) from!1960))))))

(assert (= (and d!144647 c!126551) b!1349103))

(assert (= (and d!144647 (not c!126551)) b!1349104))

(assert (= (and d!144647 (not res!895034)) b!1349105))

(assert (=> d!144647 m!1235723))

(declare-fun m!1236245 () Bool)

(assert (=> d!144647 m!1236245))

(assert (=> b!1349103 m!1235723))

(declare-fun m!1236247 () Bool)

(assert (=> b!1349103 m!1236247))

(assert (=> b!1349103 m!1235723))

(assert (=> b!1349103 m!1236241))

(assert (=> b!1349103 m!1236241))

(declare-fun m!1236249 () Bool)

(assert (=> b!1349103 m!1236249))

(assert (=> b!1349105 m!1235723))

(assert (=> b!1349105 m!1236241))

(assert (=> b!1349105 m!1236241))

(assert (=> b!1349105 m!1236249))

(assert (=> b!1348819 d!144647))

(assert (=> b!1348875 d!144639))

(declare-fun d!144649 () Bool)

(assert (=> d!144649 (= (get!22454 (select (arr!44444 _values!1303) from!1960) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3789 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348890 d!144649))

(declare-fun d!144651 () Bool)

(declare-fun e!767479 () Bool)

(assert (=> d!144651 e!767479))

(declare-fun res!895036 () Bool)

(assert (=> d!144651 (=> (not res!895036) (not e!767479))))

(declare-fun lt!596423 () ListLongMap!21981)

(assert (=> d!144651 (= res!895036 (contains!9186 lt!596423 (_1!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596424 () List!31476)

(assert (=> d!144651 (= lt!596423 (ListLongMap!21982 lt!596424))))

(declare-fun lt!596422 () Unit!44181)

(declare-fun lt!596425 () Unit!44181)

(assert (=> d!144651 (= lt!596422 lt!596425)))

(assert (=> d!144651 (= (getValueByKey!722 lt!596424 (_1!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144651 (= lt!596425 (lemmaContainsTupThenGetReturnValue!367 lt!596424 (_1!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144651 (= lt!596424 (insertStrictlySorted!496 (toList!11006 call!65144) (_1!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144651 (= (+!4850 call!65144 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596423)))

(declare-fun b!1349106 () Bool)

(declare-fun res!895035 () Bool)

(assert (=> b!1349106 (=> (not res!895035) (not e!767479))))

(assert (=> b!1349106 (= res!895035 (= (getValueByKey!722 (toList!11006 lt!596423) (_1!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!773 (_2!12173 (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1349107 () Bool)

(assert (=> b!1349107 (= e!767479 (contains!9189 (toList!11006 lt!596423) (tuple2!24325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144651 res!895036) b!1349106))

(assert (= (and b!1349106 res!895035) b!1349107))

(declare-fun m!1236251 () Bool)

(assert (=> d!144651 m!1236251))

(declare-fun m!1236253 () Bool)

(assert (=> d!144651 m!1236253))

(declare-fun m!1236255 () Bool)

(assert (=> d!144651 m!1236255))

(declare-fun m!1236257 () Bool)

(assert (=> d!144651 m!1236257))

(declare-fun m!1236259 () Bool)

(assert (=> b!1349106 m!1236259))

(declare-fun m!1236261 () Bool)

(assert (=> b!1349107 m!1236261))

(assert (=> b!1348820 d!144651))

(declare-fun b!1349109 () Bool)

(declare-fun e!767481 () Bool)

(assert (=> b!1349109 (= e!767481 tp_is_empty!37575)))

(declare-fun mapIsEmpty!58083 () Bool)

(declare-fun mapRes!58083 () Bool)

(assert (=> mapIsEmpty!58083 mapRes!58083))

(declare-fun mapNonEmpty!58083 () Bool)

(declare-fun tp!110547 () Bool)

(declare-fun e!767480 () Bool)

(assert (=> mapNonEmpty!58083 (= mapRes!58083 (and tp!110547 e!767480))))

(declare-fun mapValue!58083 () ValueCell!17889)

(declare-fun mapKey!58083 () (_ BitVec 32))

(declare-fun mapRest!58083 () (Array (_ BitVec 32) ValueCell!17889))

(assert (=> mapNonEmpty!58083 (= mapRest!58082 (store mapRest!58083 mapKey!58083 mapValue!58083))))

(declare-fun condMapEmpty!58083 () Bool)

(declare-fun mapDefault!58083 () ValueCell!17889)

(assert (=> mapNonEmpty!58082 (= condMapEmpty!58083 (= mapRest!58082 ((as const (Array (_ BitVec 32) ValueCell!17889)) mapDefault!58083)))))

(assert (=> mapNonEmpty!58082 (= tp!110546 (and e!767481 mapRes!58083))))

(declare-fun b!1349108 () Bool)

(assert (=> b!1349108 (= e!767480 tp_is_empty!37575)))

(assert (= (and mapNonEmpty!58082 condMapEmpty!58083) mapIsEmpty!58083))

(assert (= (and mapNonEmpty!58082 (not condMapEmpty!58083)) mapNonEmpty!58083))

(assert (= (and mapNonEmpty!58083 ((_ is ValueCellFull!17889) mapValue!58083)) b!1349108))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17889) mapDefault!58083)) b!1349109))

(declare-fun m!1236263 () Bool)

(assert (=> mapNonEmpty!58083 m!1236263))

(declare-fun b_lambda!24681 () Bool)

(assert (= b_lambda!24675 (or (and start!113608 b_free!31575) b_lambda!24681)))

(declare-fun b_lambda!24683 () Bool)

(assert (= b_lambda!24673 (or (and start!113608 b_free!31575) b_lambda!24683)))

(declare-fun b_lambda!24685 () Bool)

(assert (= b_lambda!24677 (or (and start!113608 b_free!31575) b_lambda!24685)))

(declare-fun b_lambda!24687 () Bool)

(assert (= b_lambda!24679 (or (and start!113608 b_free!31575) b_lambda!24687)))

(check-sat (not d!144575) (not b!1349086) tp_is_empty!37575 (not b!1349038) (not b!1349063) (not b!1348949) (not b!1348997) (not b!1349030) (not b!1349051) (not b!1348927) (not d!144643) (not b!1348940) (not bm!65156) (not d!144555) (not b!1349070) (not b!1349085) (not b!1348919) (not b!1349045) (not b!1348939) (not d!144601) (not b!1349064) (not b!1349057) (not b_lambda!24667) (not b!1349105) (not b!1349098) (not b!1349039) (not b!1349052) (not b!1349033) (not d!144537) (not b!1348935) (not bm!65159) (not b!1349089) (not b!1349028) (not d!144621) (not d!144585) (not b!1349061) (not b_lambda!24669) (not b!1348942) (not b!1348948) (not d!144543) (not b_lambda!24681) (not b!1349100) (not b!1348930) (not d!144645) (not b!1348956) (not d!144631) (not d!144623) (not d!144625) (not d!144587) (not b_lambda!24685) (not b!1349024) (not b!1348929) (not d!144553) (not b!1348938) (not d!144567) (not bm!65160) (not b_lambda!24671) (not b!1349096) (not b!1349097) (not d!144613) (not b!1349023) (not b!1348945) (not d!144589) (not b!1349099) (not d!144637) (not d!144627) (not d!144559) (not b_lambda!24687) (not d!144551) (not b_lambda!24683) (not d!144571) (not b!1348934) (not d!144597) (not d!144579) (not b!1349088) (not b!1349053) (not d!144563) (not b!1349026) (not b!1349078) (not b!1349072) (not b!1348920) (not b!1348916) (not b!1349065) (not b!1348928) (not b!1349102) (not b!1348974) (not d!144617) (not d!144591) (not bm!65148) (not b!1349082) (not b!1348931) (not b!1348918) (not bm!65149) (not b!1349081) (not d!144611) (not b!1349035) (not b!1349058) (not d!144607) (not b!1348996) (not d!144619) (not d!144545) (not b_next!31575) (not b!1348977) (not b!1349068) (not d!144635) (not d!144565) (not b!1348917) (not b!1349083) (not d!144557) (not mapNonEmpty!58083) (not d!144583) (not b!1348979) (not d!144561) (not d!144605) (not b!1349044) (not d!144633) (not b!1349091) (not d!144539) (not d!144647) (not b!1349106) (not b!1349107) (not d!144549) (not b_lambda!24659) b_and!50955 (not b!1348976) (not d!144541) (not b!1348946) (not d!144547) (not b!1349042) (not b!1349062) (not b!1349103) (not b!1348944) (not b!1348990) (not d!144629) (not b!1349054) (not d!144651))
(check-sat b_and!50955 (not b_next!31575))
