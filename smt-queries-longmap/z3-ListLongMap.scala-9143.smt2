; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109662 () Bool)

(assert start!109662)

(declare-fun b_free!29131 () Bool)

(declare-fun b_next!29131 () Bool)

(assert (=> start!109662 (= b_free!29131 (not b_next!29131))))

(declare-fun tp!102516 () Bool)

(declare-fun b_and!47207 () Bool)

(assert (=> start!109662 (= tp!102516 b_and!47207)))

(declare-fun b!1298919 () Bool)

(declare-fun res!863240 () Bool)

(declare-fun e!741031 () Bool)

(assert (=> b!1298919 (=> (not res!863240) (not e!741031))))

(declare-datatypes ((V!51465 0))(
  ( (V!51466 (val!17460 Int)) )
))
(declare-fun minValue!1387 () V!51465)

(declare-fun zeroValue!1387 () V!51465)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16487 0))(
  ( (ValueCellFull!16487 (v!20063 V!51465)) (EmptyCell!16487) )
))
(declare-datatypes ((array!86445 0))(
  ( (array!86446 (arr!41723 (Array (_ BitVec 32) ValueCell!16487)) (size!42275 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86445)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86447 0))(
  ( (array!86448 (arr!41724 (Array (_ BitVec 32) (_ BitVec 64))) (size!42276 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86447)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22562 0))(
  ( (tuple2!22563 (_1!11292 (_ BitVec 64)) (_2!11292 V!51465)) )
))
(declare-datatypes ((List!29683 0))(
  ( (Nil!29680) (Cons!29679 (h!30888 tuple2!22562) (t!43241 List!29683)) )
))
(declare-datatypes ((ListLongMap!20219 0))(
  ( (ListLongMap!20220 (toList!10125 List!29683)) )
))
(declare-fun contains!8174 (ListLongMap!20219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5041 (array!86447 array!86445 (_ BitVec 32) (_ BitVec 32) V!51465 V!51465 (_ BitVec 32) Int) ListLongMap!20219)

(assert (=> b!1298919 (= res!863240 (contains!8174 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53720 () Bool)

(declare-fun mapRes!53720 () Bool)

(declare-fun tp!102515 () Bool)

(declare-fun e!741034 () Bool)

(assert (=> mapNonEmpty!53720 (= mapRes!53720 (and tp!102515 e!741034))))

(declare-fun mapValue!53720 () ValueCell!16487)

(declare-fun mapRest!53720 () (Array (_ BitVec 32) ValueCell!16487))

(declare-fun mapKey!53720 () (_ BitVec 32))

(assert (=> mapNonEmpty!53720 (= (arr!41723 _values!1445) (store mapRest!53720 mapKey!53720 mapValue!53720))))

(declare-fun b!1298920 () Bool)

(declare-fun tp_is_empty!34771 () Bool)

(assert (=> b!1298920 (= e!741034 tp_is_empty!34771)))

(declare-fun b!1298921 () Bool)

(declare-fun res!863238 () Bool)

(assert (=> b!1298921 (=> (not res!863238) (not e!741031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86447 (_ BitVec 32)) Bool)

(assert (=> b!1298921 (= res!863238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298922 () Bool)

(declare-fun e!741033 () Bool)

(declare-fun e!741032 () Bool)

(assert (=> b!1298922 (= e!741033 (and e!741032 mapRes!53720))))

(declare-fun condMapEmpty!53720 () Bool)

(declare-fun mapDefault!53720 () ValueCell!16487)

(assert (=> b!1298922 (= condMapEmpty!53720 (= (arr!41723 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16487)) mapDefault!53720)))))

(declare-fun b!1298923 () Bool)

(declare-fun res!863244 () Bool)

(assert (=> b!1298923 (=> (not res!863244) (not e!741031))))

(declare-datatypes ((List!29684 0))(
  ( (Nil!29681) (Cons!29680 (h!30889 (_ BitVec 64)) (t!43242 List!29684)) )
))
(declare-fun arrayNoDuplicates!0 (array!86447 (_ BitVec 32) List!29684) Bool)

(assert (=> b!1298923 (= res!863244 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29681))))

(declare-fun b!1298924 () Bool)

(declare-fun arrayContainsKey!0 (array!86447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1298924 (= e!741031 (not (arrayContainsKey!0 _keys!1741 k0!1205 from!2144)))))

(declare-fun b!1298925 () Bool)

(declare-fun res!863242 () Bool)

(assert (=> b!1298925 (=> (not res!863242) (not e!741031))))

(assert (=> b!1298925 (= res!863242 (and (= (size!42275 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42276 _keys!1741) (size!42275 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298926 () Bool)

(assert (=> b!1298926 (= e!741032 tp_is_empty!34771)))

(declare-fun b!1298927 () Bool)

(declare-fun res!863239 () Bool)

(assert (=> b!1298927 (=> (not res!863239) (not e!741031))))

(assert (=> b!1298927 (= res!863239 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42276 _keys!1741)) (= (select (arr!41724 _keys!1741) from!2144) k0!1205)))))

(declare-fun res!863243 () Bool)

(assert (=> start!109662 (=> (not res!863243) (not e!741031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109662 (= res!863243 (validMask!0 mask!2175))))

(assert (=> start!109662 e!741031))

(assert (=> start!109662 tp_is_empty!34771))

(assert (=> start!109662 true))

(declare-fun array_inv!31733 (array!86445) Bool)

(assert (=> start!109662 (and (array_inv!31733 _values!1445) e!741033)))

(declare-fun array_inv!31734 (array!86447) Bool)

(assert (=> start!109662 (array_inv!31734 _keys!1741)))

(assert (=> start!109662 tp!102516))

(declare-fun mapIsEmpty!53720 () Bool)

(assert (=> mapIsEmpty!53720 mapRes!53720))

(declare-fun b!1298928 () Bool)

(declare-fun res!863241 () Bool)

(assert (=> b!1298928 (=> (not res!863241) (not e!741031))))

(assert (=> b!1298928 (= res!863241 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741))))))

(assert (= (and start!109662 res!863243) b!1298925))

(assert (= (and b!1298925 res!863242) b!1298921))

(assert (= (and b!1298921 res!863238) b!1298923))

(assert (= (and b!1298923 res!863244) b!1298928))

(assert (= (and b!1298928 res!863241) b!1298919))

(assert (= (and b!1298919 res!863240) b!1298927))

(assert (= (and b!1298927 res!863239) b!1298924))

(assert (= (and b!1298922 condMapEmpty!53720) mapIsEmpty!53720))

(assert (= (and b!1298922 (not condMapEmpty!53720)) mapNonEmpty!53720))

(get-info :version)

(assert (= (and mapNonEmpty!53720 ((_ is ValueCellFull!16487) mapValue!53720)) b!1298920))

(assert (= (and b!1298922 ((_ is ValueCellFull!16487) mapDefault!53720)) b!1298926))

(assert (= start!109662 b!1298922))

(declare-fun m!1189775 () Bool)

(assert (=> b!1298927 m!1189775))

(declare-fun m!1189777 () Bool)

(assert (=> b!1298919 m!1189777))

(assert (=> b!1298919 m!1189777))

(declare-fun m!1189779 () Bool)

(assert (=> b!1298919 m!1189779))

(declare-fun m!1189781 () Bool)

(assert (=> b!1298923 m!1189781))

(declare-fun m!1189783 () Bool)

(assert (=> b!1298924 m!1189783))

(declare-fun m!1189785 () Bool)

(assert (=> b!1298921 m!1189785))

(declare-fun m!1189787 () Bool)

(assert (=> start!109662 m!1189787))

(declare-fun m!1189789 () Bool)

(assert (=> start!109662 m!1189789))

(declare-fun m!1189791 () Bool)

(assert (=> start!109662 m!1189791))

(declare-fun m!1189793 () Bool)

(assert (=> mapNonEmpty!53720 m!1189793))

(check-sat (not mapNonEmpty!53720) (not b_next!29131) (not b!1298919) b_and!47207 tp_is_empty!34771 (not b!1298921) (not b!1298923) (not b!1298924) (not start!109662))
(check-sat b_and!47207 (not b_next!29131))
(get-model)

(declare-fun d!140967 () Bool)

(declare-fun e!741070 () Bool)

(assert (=> d!140967 e!741070))

(declare-fun res!863289 () Bool)

(assert (=> d!140967 (=> res!863289 e!741070)))

(declare-fun lt!580700 () Bool)

(assert (=> d!140967 (= res!863289 (not lt!580700))))

(declare-fun lt!580701 () Bool)

(assert (=> d!140967 (= lt!580700 lt!580701)))

(declare-datatypes ((Unit!42854 0))(
  ( (Unit!42855) )
))
(declare-fun lt!580698 () Unit!42854)

(declare-fun e!741071 () Unit!42854)

(assert (=> d!140967 (= lt!580698 e!741071)))

(declare-fun c!124438 () Bool)

(assert (=> d!140967 (= c!124438 lt!580701)))

(declare-fun containsKey!716 (List!29683 (_ BitVec 64)) Bool)

(assert (=> d!140967 (= lt!580701 (containsKey!716 (toList!10125 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140967 (= (contains!8174 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580700)))

(declare-fun b!1298995 () Bool)

(declare-fun lt!580699 () Unit!42854)

(assert (=> b!1298995 (= e!741071 lt!580699)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!463 (List!29683 (_ BitVec 64)) Unit!42854)

(assert (=> b!1298995 (= lt!580699 (lemmaContainsKeyImpliesGetValueByKeyDefined!463 (toList!10125 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!750 0))(
  ( (Some!749 (v!20066 V!51465)) (None!748) )
))
(declare-fun isDefined!506 (Option!750) Bool)

(declare-fun getValueByKey!699 (List!29683 (_ BitVec 64)) Option!750)

(assert (=> b!1298995 (isDefined!506 (getValueByKey!699 (toList!10125 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1298996 () Bool)

(declare-fun Unit!42856 () Unit!42854)

(assert (=> b!1298996 (= e!741071 Unit!42856)))

(declare-fun b!1298997 () Bool)

(assert (=> b!1298997 (= e!741070 (isDefined!506 (getValueByKey!699 (toList!10125 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140967 c!124438) b!1298995))

(assert (= (and d!140967 (not c!124438)) b!1298996))

(assert (= (and d!140967 (not res!863289)) b!1298997))

(declare-fun m!1189835 () Bool)

(assert (=> d!140967 m!1189835))

(declare-fun m!1189837 () Bool)

(assert (=> b!1298995 m!1189837))

(declare-fun m!1189839 () Bool)

(assert (=> b!1298995 m!1189839))

(assert (=> b!1298995 m!1189839))

(declare-fun m!1189841 () Bool)

(assert (=> b!1298995 m!1189841))

(assert (=> b!1298997 m!1189839))

(assert (=> b!1298997 m!1189839))

(assert (=> b!1298997 m!1189841))

(assert (=> b!1298919 d!140967))

(declare-fun b!1299040 () Bool)

(declare-fun c!124454 () Bool)

(assert (=> b!1299040 (= c!124454 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741104 () ListLongMap!20219)

(declare-fun e!741099 () ListLongMap!20219)

(assert (=> b!1299040 (= e!741104 e!741099)))

(declare-fun b!1299042 () Bool)

(declare-fun e!741101 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299042 (= e!741101 (validKeyInArray!0 (select (arr!41724 _keys!1741) from!2144)))))

(declare-fun b!1299043 () Bool)

(declare-fun call!63540 () ListLongMap!20219)

(assert (=> b!1299043 (= e!741099 call!63540)))

(declare-fun bm!63536 () Bool)

(declare-fun call!63542 () ListLongMap!20219)

(assert (=> bm!63536 (= call!63540 call!63542)))

(declare-fun b!1299044 () Bool)

(declare-fun e!741105 () Bool)

(declare-fun call!63541 () Bool)

(assert (=> b!1299044 (= e!741105 (not call!63541))))

(declare-fun b!1299045 () Bool)

(declare-fun e!741103 () Bool)

(declare-fun lt!580763 () ListLongMap!20219)

(declare-fun apply!1006 (ListLongMap!20219 (_ BitVec 64)) V!51465)

(assert (=> b!1299045 (= e!741103 (= (apply!1006 lt!580763 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1299046 () Bool)

(declare-fun res!863311 () Bool)

(declare-fun e!741107 () Bool)

(assert (=> b!1299046 (=> (not res!863311) (not e!741107))))

(assert (=> b!1299046 (= res!863311 e!741105)))

(declare-fun c!124456 () Bool)

(assert (=> b!1299046 (= c!124456 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1299047 () Bool)

(declare-fun e!741108 () Bool)

(declare-fun call!63544 () Bool)

(assert (=> b!1299047 (= e!741108 (not call!63544))))

(declare-fun d!140969 () Bool)

(assert (=> d!140969 e!741107))

(declare-fun res!863308 () Bool)

(assert (=> d!140969 (=> (not res!863308) (not e!741107))))

(assert (=> d!140969 (= res!863308 (or (bvsge from!2144 (size!42276 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741)))))))

(declare-fun lt!580765 () ListLongMap!20219)

(assert (=> d!140969 (= lt!580763 lt!580765)))

(declare-fun lt!580750 () Unit!42854)

(declare-fun e!741106 () Unit!42854)

(assert (=> d!140969 (= lt!580750 e!741106)))

(declare-fun c!124453 () Bool)

(assert (=> d!140969 (= c!124453 e!741101)))

(declare-fun res!863313 () Bool)

(assert (=> d!140969 (=> (not res!863313) (not e!741101))))

(assert (=> d!140969 (= res!863313 (bvslt from!2144 (size!42276 _keys!1741)))))

(declare-fun e!741109 () ListLongMap!20219)

(assert (=> d!140969 (= lt!580765 e!741109)))

(declare-fun c!124455 () Bool)

(assert (=> d!140969 (= c!124455 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140969 (validMask!0 mask!2175)))

(assert (=> d!140969 (= (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580763)))

(declare-fun b!1299041 () Bool)

(declare-fun e!741110 () Bool)

(declare-fun e!741098 () Bool)

(assert (=> b!1299041 (= e!741110 e!741098)))

(declare-fun res!863309 () Bool)

(assert (=> b!1299041 (=> (not res!863309) (not e!741098))))

(assert (=> b!1299041 (= res!863309 (contains!8174 lt!580763 (select (arr!41724 _keys!1741) from!2144)))))

(assert (=> b!1299041 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741)))))

(declare-fun bm!63537 () Bool)

(declare-fun call!63545 () ListLongMap!20219)

(declare-fun call!63539 () ListLongMap!20219)

(assert (=> bm!63537 (= call!63545 call!63539)))

(declare-fun b!1299048 () Bool)

(declare-fun lt!580748 () Unit!42854)

(assert (=> b!1299048 (= e!741106 lt!580748)))

(declare-fun lt!580766 () ListLongMap!20219)

(declare-fun getCurrentListMapNoExtraKeys!6106 (array!86447 array!86445 (_ BitVec 32) (_ BitVec 32) V!51465 V!51465 (_ BitVec 32) Int) ListLongMap!20219)

(assert (=> b!1299048 (= lt!580766 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580762 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580753 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580753 (select (arr!41724 _keys!1741) from!2144))))

(declare-fun lt!580767 () Unit!42854)

(declare-fun addStillContains!1101 (ListLongMap!20219 (_ BitVec 64) V!51465 (_ BitVec 64)) Unit!42854)

(assert (=> b!1299048 (= lt!580767 (addStillContains!1101 lt!580766 lt!580762 zeroValue!1387 lt!580753))))

(declare-fun +!4475 (ListLongMap!20219 tuple2!22562) ListLongMap!20219)

(assert (=> b!1299048 (contains!8174 (+!4475 lt!580766 (tuple2!22563 lt!580762 zeroValue!1387)) lt!580753)))

(declare-fun lt!580749 () Unit!42854)

(assert (=> b!1299048 (= lt!580749 lt!580767)))

(declare-fun lt!580746 () ListLongMap!20219)

(assert (=> b!1299048 (= lt!580746 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580751 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580760 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580760 (select (arr!41724 _keys!1741) from!2144))))

(declare-fun lt!580752 () Unit!42854)

(declare-fun addApplyDifferent!544 (ListLongMap!20219 (_ BitVec 64) V!51465 (_ BitVec 64)) Unit!42854)

(assert (=> b!1299048 (= lt!580752 (addApplyDifferent!544 lt!580746 lt!580751 minValue!1387 lt!580760))))

(assert (=> b!1299048 (= (apply!1006 (+!4475 lt!580746 (tuple2!22563 lt!580751 minValue!1387)) lt!580760) (apply!1006 lt!580746 lt!580760))))

(declare-fun lt!580764 () Unit!42854)

(assert (=> b!1299048 (= lt!580764 lt!580752)))

(declare-fun lt!580755 () ListLongMap!20219)

(assert (=> b!1299048 (= lt!580755 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580761 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580747 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580747 (select (arr!41724 _keys!1741) from!2144))))

(declare-fun lt!580756 () Unit!42854)

(assert (=> b!1299048 (= lt!580756 (addApplyDifferent!544 lt!580755 lt!580761 zeroValue!1387 lt!580747))))

(assert (=> b!1299048 (= (apply!1006 (+!4475 lt!580755 (tuple2!22563 lt!580761 zeroValue!1387)) lt!580747) (apply!1006 lt!580755 lt!580747))))

(declare-fun lt!580758 () Unit!42854)

(assert (=> b!1299048 (= lt!580758 lt!580756)))

(declare-fun lt!580759 () ListLongMap!20219)

(assert (=> b!1299048 (= lt!580759 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580757 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580754 () (_ BitVec 64))

(assert (=> b!1299048 (= lt!580754 (select (arr!41724 _keys!1741) from!2144))))

(assert (=> b!1299048 (= lt!580748 (addApplyDifferent!544 lt!580759 lt!580757 minValue!1387 lt!580754))))

(assert (=> b!1299048 (= (apply!1006 (+!4475 lt!580759 (tuple2!22563 lt!580757 minValue!1387)) lt!580754) (apply!1006 lt!580759 lt!580754))))

(declare-fun bm!63538 () Bool)

(assert (=> bm!63538 (= call!63544 (contains!8174 lt!580763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299049 () Bool)

(declare-fun Unit!42857 () Unit!42854)

(assert (=> b!1299049 (= e!741106 Unit!42857)))

(declare-fun b!1299050 () Bool)

(assert (=> b!1299050 (= e!741107 e!741108)))

(declare-fun c!124451 () Bool)

(assert (=> b!1299050 (= c!124451 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63539 () Bool)

(declare-fun call!63543 () ListLongMap!20219)

(assert (=> bm!63539 (= call!63543 call!63545)))

(declare-fun b!1299051 () Bool)

(declare-fun e!741100 () Bool)

(assert (=> b!1299051 (= e!741100 (= (apply!1006 lt!580763 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1299052 () Bool)

(assert (=> b!1299052 (= e!741099 call!63543)))

(declare-fun b!1299053 () Bool)

(assert (=> b!1299053 (= e!741104 call!63540)))

(declare-fun b!1299054 () Bool)

(assert (=> b!1299054 (= e!741105 e!741100)))

(declare-fun res!863315 () Bool)

(assert (=> b!1299054 (= res!863315 call!63541)))

(assert (=> b!1299054 (=> (not res!863315) (not e!741100))))

(declare-fun b!1299055 () Bool)

(declare-fun res!863310 () Bool)

(assert (=> b!1299055 (=> (not res!863310) (not e!741107))))

(assert (=> b!1299055 (= res!863310 e!741110)))

(declare-fun res!863316 () Bool)

(assert (=> b!1299055 (=> res!863316 e!741110)))

(declare-fun e!741102 () Bool)

(assert (=> b!1299055 (= res!863316 (not e!741102))))

(declare-fun res!863314 () Bool)

(assert (=> b!1299055 (=> (not res!863314) (not e!741102))))

(assert (=> b!1299055 (= res!863314 (bvslt from!2144 (size!42276 _keys!1741)))))

(declare-fun c!124452 () Bool)

(declare-fun bm!63540 () Bool)

(assert (=> bm!63540 (= call!63542 (+!4475 (ite c!124455 call!63539 (ite c!124452 call!63545 call!63543)) (ite (or c!124455 c!124452) (tuple2!22563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1299056 () Bool)

(assert (=> b!1299056 (= e!741102 (validKeyInArray!0 (select (arr!41724 _keys!1741) from!2144)))))

(declare-fun b!1299057 () Bool)

(declare-fun get!21102 (ValueCell!16487 V!51465) V!51465)

(declare-fun dynLambda!3441 (Int (_ BitVec 64)) V!51465)

(assert (=> b!1299057 (= e!741098 (= (apply!1006 lt!580763 (select (arr!41724 _keys!1741) from!2144)) (get!21102 (select (arr!41723 _values!1445) from!2144) (dynLambda!3441 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299057 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42275 _values!1445)))))

(assert (=> b!1299057 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741)))))

(declare-fun b!1299058 () Bool)

(assert (=> b!1299058 (= e!741109 (+!4475 call!63542 (tuple2!22563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63541 () Bool)

(assert (=> bm!63541 (= call!63539 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1299059 () Bool)

(assert (=> b!1299059 (= e!741108 e!741103)))

(declare-fun res!863312 () Bool)

(assert (=> b!1299059 (= res!863312 call!63544)))

(assert (=> b!1299059 (=> (not res!863312) (not e!741103))))

(declare-fun bm!63542 () Bool)

(assert (=> bm!63542 (= call!63541 (contains!8174 lt!580763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299060 () Bool)

(assert (=> b!1299060 (= e!741109 e!741104)))

(assert (=> b!1299060 (= c!124452 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140969 c!124455) b!1299058))

(assert (= (and d!140969 (not c!124455)) b!1299060))

(assert (= (and b!1299060 c!124452) b!1299053))

(assert (= (and b!1299060 (not c!124452)) b!1299040))

(assert (= (and b!1299040 c!124454) b!1299043))

(assert (= (and b!1299040 (not c!124454)) b!1299052))

(assert (= (or b!1299043 b!1299052) bm!63539))

(assert (= (or b!1299053 bm!63539) bm!63537))

(assert (= (or b!1299053 b!1299043) bm!63536))

(assert (= (or b!1299058 bm!63537) bm!63541))

(assert (= (or b!1299058 bm!63536) bm!63540))

(assert (= (and d!140969 res!863313) b!1299042))

(assert (= (and d!140969 c!124453) b!1299048))

(assert (= (and d!140969 (not c!124453)) b!1299049))

(assert (= (and d!140969 res!863308) b!1299055))

(assert (= (and b!1299055 res!863314) b!1299056))

(assert (= (and b!1299055 (not res!863316)) b!1299041))

(assert (= (and b!1299041 res!863309) b!1299057))

(assert (= (and b!1299055 res!863310) b!1299046))

(assert (= (and b!1299046 c!124456) b!1299054))

(assert (= (and b!1299046 (not c!124456)) b!1299044))

(assert (= (and b!1299054 res!863315) b!1299051))

(assert (= (or b!1299054 b!1299044) bm!63542))

(assert (= (and b!1299046 res!863311) b!1299050))

(assert (= (and b!1299050 c!124451) b!1299059))

(assert (= (and b!1299050 (not c!124451)) b!1299047))

(assert (= (and b!1299059 res!863312) b!1299045))

(assert (= (or b!1299059 b!1299047) bm!63538))

(declare-fun b_lambda!23135 () Bool)

(assert (=> (not b_lambda!23135) (not b!1299057)))

(declare-fun t!43247 () Bool)

(declare-fun tb!11363 () Bool)

(assert (=> (and start!109662 (= defaultEntry!1448 defaultEntry!1448) t!43247) tb!11363))

(declare-fun result!23737 () Bool)

(assert (=> tb!11363 (= result!23737 tp_is_empty!34771)))

(assert (=> b!1299057 t!43247))

(declare-fun b_and!47213 () Bool)

(assert (= b_and!47207 (and (=> t!43247 result!23737) b_and!47213)))

(declare-fun m!1189843 () Bool)

(assert (=> b!1299051 m!1189843))

(assert (=> b!1299041 m!1189775))

(assert (=> b!1299041 m!1189775))

(declare-fun m!1189845 () Bool)

(assert (=> b!1299041 m!1189845))

(declare-fun m!1189847 () Bool)

(assert (=> b!1299057 m!1189847))

(declare-fun m!1189849 () Bool)

(assert (=> b!1299057 m!1189849))

(assert (=> b!1299057 m!1189847))

(declare-fun m!1189851 () Bool)

(assert (=> b!1299057 m!1189851))

(assert (=> b!1299057 m!1189775))

(declare-fun m!1189853 () Bool)

(assert (=> b!1299057 m!1189853))

(assert (=> b!1299057 m!1189849))

(assert (=> b!1299057 m!1189775))

(declare-fun m!1189855 () Bool)

(assert (=> bm!63542 m!1189855))

(declare-fun m!1189857 () Bool)

(assert (=> bm!63541 m!1189857))

(assert (=> b!1299056 m!1189775))

(assert (=> b!1299056 m!1189775))

(declare-fun m!1189859 () Bool)

(assert (=> b!1299056 m!1189859))

(declare-fun m!1189861 () Bool)

(assert (=> bm!63540 m!1189861))

(declare-fun m!1189863 () Bool)

(assert (=> b!1299048 m!1189863))

(declare-fun m!1189865 () Bool)

(assert (=> b!1299048 m!1189865))

(declare-fun m!1189867 () Bool)

(assert (=> b!1299048 m!1189867))

(declare-fun m!1189869 () Bool)

(assert (=> b!1299048 m!1189869))

(assert (=> b!1299048 m!1189863))

(declare-fun m!1189871 () Bool)

(assert (=> b!1299048 m!1189871))

(declare-fun m!1189873 () Bool)

(assert (=> b!1299048 m!1189873))

(declare-fun m!1189875 () Bool)

(assert (=> b!1299048 m!1189875))

(assert (=> b!1299048 m!1189869))

(declare-fun m!1189877 () Bool)

(assert (=> b!1299048 m!1189877))

(declare-fun m!1189879 () Bool)

(assert (=> b!1299048 m!1189879))

(declare-fun m!1189881 () Bool)

(assert (=> b!1299048 m!1189881))

(assert (=> b!1299048 m!1189873))

(declare-fun m!1189883 () Bool)

(assert (=> b!1299048 m!1189883))

(assert (=> b!1299048 m!1189857))

(assert (=> b!1299048 m!1189867))

(declare-fun m!1189885 () Bool)

(assert (=> b!1299048 m!1189885))

(declare-fun m!1189887 () Bool)

(assert (=> b!1299048 m!1189887))

(declare-fun m!1189889 () Bool)

(assert (=> b!1299048 m!1189889))

(assert (=> b!1299048 m!1189775))

(declare-fun m!1189891 () Bool)

(assert (=> b!1299048 m!1189891))

(assert (=> b!1299042 m!1189775))

(assert (=> b!1299042 m!1189775))

(assert (=> b!1299042 m!1189859))

(declare-fun m!1189893 () Bool)

(assert (=> b!1299045 m!1189893))

(assert (=> d!140969 m!1189787))

(declare-fun m!1189895 () Bool)

(assert (=> b!1299058 m!1189895))

(declare-fun m!1189897 () Bool)

(assert (=> bm!63538 m!1189897))

(assert (=> b!1298919 d!140969))

(declare-fun d!140971 () Bool)

(declare-fun res!863323 () Bool)

(declare-fun e!741122 () Bool)

(assert (=> d!140971 (=> res!863323 e!741122)))

(assert (=> d!140971 (= res!863323 (bvsge #b00000000000000000000000000000000 (size!42276 _keys!1741)))))

(assert (=> d!140971 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29681) e!741122)))

(declare-fun b!1299073 () Bool)

(declare-fun e!741121 () Bool)

(declare-fun contains!8177 (List!29684 (_ BitVec 64)) Bool)

(assert (=> b!1299073 (= e!741121 (contains!8177 Nil!29681 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299074 () Bool)

(declare-fun e!741120 () Bool)

(declare-fun call!63548 () Bool)

(assert (=> b!1299074 (= e!741120 call!63548)))

(declare-fun b!1299075 () Bool)

(declare-fun e!741119 () Bool)

(assert (=> b!1299075 (= e!741122 e!741119)))

(declare-fun res!863324 () Bool)

(assert (=> b!1299075 (=> (not res!863324) (not e!741119))))

(assert (=> b!1299075 (= res!863324 (not e!741121))))

(declare-fun res!863325 () Bool)

(assert (=> b!1299075 (=> (not res!863325) (not e!741121))))

(assert (=> b!1299075 (= res!863325 (validKeyInArray!0 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63545 () Bool)

(declare-fun c!124459 () Bool)

(assert (=> bm!63545 (= call!63548 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124459 (Cons!29680 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000) Nil!29681) Nil!29681)))))

(declare-fun b!1299076 () Bool)

(assert (=> b!1299076 (= e!741119 e!741120)))

(assert (=> b!1299076 (= c!124459 (validKeyInArray!0 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299077 () Bool)

(assert (=> b!1299077 (= e!741120 call!63548)))

(assert (= (and d!140971 (not res!863323)) b!1299075))

(assert (= (and b!1299075 res!863325) b!1299073))

(assert (= (and b!1299075 res!863324) b!1299076))

(assert (= (and b!1299076 c!124459) b!1299074))

(assert (= (and b!1299076 (not c!124459)) b!1299077))

(assert (= (or b!1299074 b!1299077) bm!63545))

(declare-fun m!1189899 () Bool)

(assert (=> b!1299073 m!1189899))

(assert (=> b!1299073 m!1189899))

(declare-fun m!1189901 () Bool)

(assert (=> b!1299073 m!1189901))

(assert (=> b!1299075 m!1189899))

(assert (=> b!1299075 m!1189899))

(declare-fun m!1189903 () Bool)

(assert (=> b!1299075 m!1189903))

(assert (=> bm!63545 m!1189899))

(declare-fun m!1189905 () Bool)

(assert (=> bm!63545 m!1189905))

(assert (=> b!1299076 m!1189899))

(assert (=> b!1299076 m!1189899))

(assert (=> b!1299076 m!1189903))

(assert (=> b!1298923 d!140971))

(declare-fun d!140973 () Bool)

(declare-fun res!863330 () Bool)

(declare-fun e!741127 () Bool)

(assert (=> d!140973 (=> res!863330 e!741127)))

(assert (=> d!140973 (= res!863330 (= (select (arr!41724 _keys!1741) from!2144) k0!1205))))

(assert (=> d!140973 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!741127)))

(declare-fun b!1299082 () Bool)

(declare-fun e!741128 () Bool)

(assert (=> b!1299082 (= e!741127 e!741128)))

(declare-fun res!863331 () Bool)

(assert (=> b!1299082 (=> (not res!863331) (not e!741128))))

(assert (=> b!1299082 (= res!863331 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42276 _keys!1741)))))

(declare-fun b!1299083 () Bool)

(assert (=> b!1299083 (= e!741128 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!140973 (not res!863330)) b!1299082))

(assert (= (and b!1299082 res!863331) b!1299083))

(assert (=> d!140973 m!1189775))

(declare-fun m!1189907 () Bool)

(assert (=> b!1299083 m!1189907))

(assert (=> b!1298924 d!140973))

(declare-fun bm!63548 () Bool)

(declare-fun call!63551 () Bool)

(assert (=> bm!63548 (= call!63551 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1299092 () Bool)

(declare-fun e!741136 () Bool)

(declare-fun e!741137 () Bool)

(assert (=> b!1299092 (= e!741136 e!741137)))

(declare-fun lt!580775 () (_ BitVec 64))

(assert (=> b!1299092 (= lt!580775 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!580776 () Unit!42854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86447 (_ BitVec 64) (_ BitVec 32)) Unit!42854)

(assert (=> b!1299092 (= lt!580776 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580775 #b00000000000000000000000000000000))))

(assert (=> b!1299092 (arrayContainsKey!0 _keys!1741 lt!580775 #b00000000000000000000000000000000)))

(declare-fun lt!580774 () Unit!42854)

(assert (=> b!1299092 (= lt!580774 lt!580776)))

(declare-fun res!863336 () Bool)

(declare-datatypes ((SeekEntryResult!10015 0))(
  ( (MissingZero!10015 (index!42431 (_ BitVec 32))) (Found!10015 (index!42432 (_ BitVec 32))) (Intermediate!10015 (undefined!10827 Bool) (index!42433 (_ BitVec 32)) (x!115398 (_ BitVec 32))) (Undefined!10015) (MissingVacant!10015 (index!42434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86447 (_ BitVec 32)) SeekEntryResult!10015)

(assert (=> b!1299092 (= res!863336 (= (seekEntryOrOpen!0 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10015 #b00000000000000000000000000000000)))))

(assert (=> b!1299092 (=> (not res!863336) (not e!741137))))

(declare-fun d!140975 () Bool)

(declare-fun res!863337 () Bool)

(declare-fun e!741135 () Bool)

(assert (=> d!140975 (=> res!863337 e!741135)))

(assert (=> d!140975 (= res!863337 (bvsge #b00000000000000000000000000000000 (size!42276 _keys!1741)))))

(assert (=> d!140975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741135)))

(declare-fun b!1299093 () Bool)

(assert (=> b!1299093 (= e!741135 e!741136)))

(declare-fun c!124462 () Bool)

(assert (=> b!1299093 (= c!124462 (validKeyInArray!0 (select (arr!41724 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299094 () Bool)

(assert (=> b!1299094 (= e!741136 call!63551)))

(declare-fun b!1299095 () Bool)

(assert (=> b!1299095 (= e!741137 call!63551)))

(assert (= (and d!140975 (not res!863337)) b!1299093))

(assert (= (and b!1299093 c!124462) b!1299092))

(assert (= (and b!1299093 (not c!124462)) b!1299094))

(assert (= (and b!1299092 res!863336) b!1299095))

(assert (= (or b!1299095 b!1299094) bm!63548))

(declare-fun m!1189909 () Bool)

(assert (=> bm!63548 m!1189909))

(assert (=> b!1299092 m!1189899))

(declare-fun m!1189911 () Bool)

(assert (=> b!1299092 m!1189911))

(declare-fun m!1189913 () Bool)

(assert (=> b!1299092 m!1189913))

(assert (=> b!1299092 m!1189899))

(declare-fun m!1189915 () Bool)

(assert (=> b!1299092 m!1189915))

(assert (=> b!1299093 m!1189899))

(assert (=> b!1299093 m!1189899))

(assert (=> b!1299093 m!1189903))

(assert (=> b!1298921 d!140975))

(declare-fun d!140977 () Bool)

(assert (=> d!140977 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109662 d!140977))

(declare-fun d!140979 () Bool)

(assert (=> d!140979 (= (array_inv!31733 _values!1445) (bvsge (size!42275 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109662 d!140979))

(declare-fun d!140981 () Bool)

(assert (=> d!140981 (= (array_inv!31734 _keys!1741) (bvsge (size!42276 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109662 d!140981))

(declare-fun condMapEmpty!53729 () Bool)

(declare-fun mapDefault!53729 () ValueCell!16487)

(assert (=> mapNonEmpty!53720 (= condMapEmpty!53729 (= mapRest!53720 ((as const (Array (_ BitVec 32) ValueCell!16487)) mapDefault!53729)))))

(declare-fun e!741143 () Bool)

(declare-fun mapRes!53729 () Bool)

(assert (=> mapNonEmpty!53720 (= tp!102515 (and e!741143 mapRes!53729))))

(declare-fun mapNonEmpty!53729 () Bool)

(declare-fun tp!102531 () Bool)

(declare-fun e!741142 () Bool)

(assert (=> mapNonEmpty!53729 (= mapRes!53729 (and tp!102531 e!741142))))

(declare-fun mapRest!53729 () (Array (_ BitVec 32) ValueCell!16487))

(declare-fun mapValue!53729 () ValueCell!16487)

(declare-fun mapKey!53729 () (_ BitVec 32))

(assert (=> mapNonEmpty!53729 (= mapRest!53720 (store mapRest!53729 mapKey!53729 mapValue!53729))))

(declare-fun mapIsEmpty!53729 () Bool)

(assert (=> mapIsEmpty!53729 mapRes!53729))

(declare-fun b!1299103 () Bool)

(assert (=> b!1299103 (= e!741143 tp_is_empty!34771)))

(declare-fun b!1299102 () Bool)

(assert (=> b!1299102 (= e!741142 tp_is_empty!34771)))

(assert (= (and mapNonEmpty!53720 condMapEmpty!53729) mapIsEmpty!53729))

(assert (= (and mapNonEmpty!53720 (not condMapEmpty!53729)) mapNonEmpty!53729))

(assert (= (and mapNonEmpty!53729 ((_ is ValueCellFull!16487) mapValue!53729)) b!1299102))

(assert (= (and mapNonEmpty!53720 ((_ is ValueCellFull!16487) mapDefault!53729)) b!1299103))

(declare-fun m!1189917 () Bool)

(assert (=> mapNonEmpty!53729 m!1189917))

(declare-fun b_lambda!23137 () Bool)

(assert (= b_lambda!23135 (or (and start!109662 b_free!29131) b_lambda!23137)))

(check-sat (not b!1299042) (not b!1299073) (not b!1299092) (not b!1298995) (not b!1299057) (not bm!63542) b_and!47213 (not b!1299041) (not b_lambda!23137) (not d!140967) (not b_next!29131) (not b!1299056) (not b!1299045) (not b!1299048) (not bm!63538) (not b!1299051) (not bm!63545) (not b!1299075) (not b!1299083) (not b!1299058) (not d!140969) (not bm!63540) tp_is_empty!34771 (not bm!63548) (not b!1299076) (not mapNonEmpty!53729) (not b!1298997) (not bm!63541) (not b!1299093))
(check-sat b_and!47213 (not b_next!29131))
