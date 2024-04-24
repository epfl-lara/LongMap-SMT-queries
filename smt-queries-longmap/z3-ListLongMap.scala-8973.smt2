; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108788 () Bool)

(assert start!108788)

(declare-fun b_free!28111 () Bool)

(declare-fun b_next!28111 () Bool)

(assert (=> start!108788 (= b_free!28111 (not b_next!28111))))

(declare-fun tp!99442 () Bool)

(declare-fun b_and!46173 () Bool)

(assert (=> start!108788 (= tp!99442 b_and!46173)))

(declare-fun b!1282890 () Bool)

(declare-fun res!851862 () Bool)

(declare-fun e!733065 () Bool)

(assert (=> b!1282890 (=> (not res!851862) (not e!733065))))

(declare-datatypes ((V!50105 0))(
  ( (V!50106 (val!16950 Int)) )
))
(declare-fun minValue!1387 () V!50105)

(declare-fun zeroValue!1387 () V!50105)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15977 0))(
  ( (ValueCellFull!15977 (v!19545 V!50105)) (EmptyCell!15977) )
))
(declare-datatypes ((array!84605 0))(
  ( (array!84606 (arr!40802 (Array (_ BitVec 32) ValueCell!15977)) (size!41353 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84605)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84607 0))(
  ( (array!84608 (arr!40803 (Array (_ BitVec 32) (_ BitVec 64))) (size!41354 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84607)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21726 0))(
  ( (tuple2!21727 (_1!10874 (_ BitVec 64)) (_2!10874 V!50105)) )
))
(declare-datatypes ((List!28940 0))(
  ( (Nil!28937) (Cons!28936 (h!30154 tuple2!21726) (t!42472 List!28940)) )
))
(declare-datatypes ((ListLongMap!19391 0))(
  ( (ListLongMap!19392 (toList!9711 List!28940)) )
))
(declare-fun contains!7840 (ListLongMap!19391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4780 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 32) Int) ListLongMap!19391)

(assert (=> b!1282890 (= res!851862 (contains!7840 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282891 () Bool)

(declare-fun res!851867 () Bool)

(assert (=> b!1282891 (=> (not res!851867) (not e!733065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84607 (_ BitVec 32)) Bool)

(assert (=> b!1282891 (= res!851867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282892 () Bool)

(declare-fun e!733063 () Bool)

(assert (=> b!1282892 (= e!733065 (not e!733063))))

(declare-fun res!851865 () Bool)

(assert (=> b!1282892 (=> res!851865 e!733063)))

(assert (=> b!1282892 (= res!851865 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(assert (=> b!1282892 (contains!7840 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42410 0))(
  ( (Unit!42411) )
))
(declare-fun lt!576743 () Unit!42410)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!26 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42410)

(assert (=> b!1282892 (= lt!576743 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!26 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun res!851864 () Bool)

(assert (=> start!108788 (=> (not res!851864) (not e!733065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108788 (= res!851864 (validMask!0 mask!2175))))

(assert (=> start!108788 e!733065))

(declare-fun tp_is_empty!33751 () Bool)

(assert (=> start!108788 tp_is_empty!33751))

(assert (=> start!108788 true))

(declare-fun e!733066 () Bool)

(declare-fun array_inv!31173 (array!84605) Bool)

(assert (=> start!108788 (and (array_inv!31173 _values!1445) e!733066)))

(declare-fun array_inv!31174 (array!84607) Bool)

(assert (=> start!108788 (array_inv!31174 _keys!1741)))

(assert (=> start!108788 tp!99442))

(declare-fun mapIsEmpty!52178 () Bool)

(declare-fun mapRes!52178 () Bool)

(assert (=> mapIsEmpty!52178 mapRes!52178))

(declare-fun b!1282893 () Bool)

(assert (=> b!1282893 (= e!733063 (bvslt (size!41354 _keys!1741) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!84607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1282893 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576744 () Unit!42410)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!639 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42410)

(assert (=> b!1282893 (= lt!576744 (lemmaListMapContainsThenArrayContainsFrom!639 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1282894 () Bool)

(declare-fun e!733064 () Bool)

(assert (=> b!1282894 (= e!733066 (and e!733064 mapRes!52178))))

(declare-fun condMapEmpty!52178 () Bool)

(declare-fun mapDefault!52178 () ValueCell!15977)

(assert (=> b!1282894 (= condMapEmpty!52178 (= (arr!40802 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15977)) mapDefault!52178)))))

(declare-fun b!1282895 () Bool)

(declare-fun res!851866 () Bool)

(assert (=> b!1282895 (=> (not res!851866) (not e!733065))))

(assert (=> b!1282895 (= res!851866 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41354 _keys!1741))))))

(declare-fun b!1282896 () Bool)

(declare-fun res!851868 () Bool)

(assert (=> b!1282896 (=> (not res!851868) (not e!733065))))

(declare-datatypes ((List!28941 0))(
  ( (Nil!28938) (Cons!28937 (h!30155 (_ BitVec 64)) (t!42473 List!28941)) )
))
(declare-fun arrayNoDuplicates!0 (array!84607 (_ BitVec 32) List!28941) Bool)

(assert (=> b!1282896 (= res!851868 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28938))))

(declare-fun b!1282897 () Bool)

(declare-fun res!851861 () Bool)

(assert (=> b!1282897 (=> (not res!851861) (not e!733065))))

(assert (=> b!1282897 (= res!851861 (and (= (size!41353 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41354 _keys!1741) (size!41353 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282898 () Bool)

(assert (=> b!1282898 (= e!733064 tp_is_empty!33751)))

(declare-fun b!1282899 () Bool)

(declare-fun res!851863 () Bool)

(assert (=> b!1282899 (=> (not res!851863) (not e!733065))))

(assert (=> b!1282899 (= res!851863 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)) (not (= (select (arr!40803 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!52178 () Bool)

(declare-fun tp!99443 () Bool)

(declare-fun e!733068 () Bool)

(assert (=> mapNonEmpty!52178 (= mapRes!52178 (and tp!99443 e!733068))))

(declare-fun mapRest!52178 () (Array (_ BitVec 32) ValueCell!15977))

(declare-fun mapKey!52178 () (_ BitVec 32))

(declare-fun mapValue!52178 () ValueCell!15977)

(assert (=> mapNonEmpty!52178 (= (arr!40802 _values!1445) (store mapRest!52178 mapKey!52178 mapValue!52178))))

(declare-fun b!1282900 () Bool)

(assert (=> b!1282900 (= e!733068 tp_is_empty!33751)))

(assert (= (and start!108788 res!851864) b!1282897))

(assert (= (and b!1282897 res!851861) b!1282891))

(assert (= (and b!1282891 res!851867) b!1282896))

(assert (= (and b!1282896 res!851868) b!1282895))

(assert (= (and b!1282895 res!851866) b!1282890))

(assert (= (and b!1282890 res!851862) b!1282899))

(assert (= (and b!1282899 res!851863) b!1282892))

(assert (= (and b!1282892 (not res!851865)) b!1282893))

(assert (= (and b!1282894 condMapEmpty!52178) mapIsEmpty!52178))

(assert (= (and b!1282894 (not condMapEmpty!52178)) mapNonEmpty!52178))

(get-info :version)

(assert (= (and mapNonEmpty!52178 ((_ is ValueCellFull!15977) mapValue!52178)) b!1282900))

(assert (= (and b!1282894 ((_ is ValueCellFull!15977) mapDefault!52178)) b!1282898))

(assert (= start!108788 b!1282894))

(declare-fun m!1177593 () Bool)

(assert (=> start!108788 m!1177593))

(declare-fun m!1177595 () Bool)

(assert (=> start!108788 m!1177595))

(declare-fun m!1177597 () Bool)

(assert (=> start!108788 m!1177597))

(declare-fun m!1177599 () Bool)

(assert (=> b!1282891 m!1177599))

(declare-fun m!1177601 () Bool)

(assert (=> mapNonEmpty!52178 m!1177601))

(declare-fun m!1177603 () Bool)

(assert (=> b!1282896 m!1177603))

(declare-fun m!1177605 () Bool)

(assert (=> b!1282893 m!1177605))

(declare-fun m!1177607 () Bool)

(assert (=> b!1282893 m!1177607))

(declare-fun m!1177609 () Bool)

(assert (=> b!1282899 m!1177609))

(declare-fun m!1177611 () Bool)

(assert (=> b!1282892 m!1177611))

(assert (=> b!1282892 m!1177611))

(declare-fun m!1177613 () Bool)

(assert (=> b!1282892 m!1177613))

(declare-fun m!1177615 () Bool)

(assert (=> b!1282892 m!1177615))

(declare-fun m!1177617 () Bool)

(assert (=> b!1282890 m!1177617))

(assert (=> b!1282890 m!1177617))

(declare-fun m!1177619 () Bool)

(assert (=> b!1282890 m!1177619))

(check-sat (not b!1282892) (not start!108788) tp_is_empty!33751 (not b_next!28111) (not b!1282896) (not b!1282890) b_and!46173 (not mapNonEmpty!52178) (not b!1282893) (not b!1282891))
(check-sat b_and!46173 (not b_next!28111))
(get-model)

(declare-fun b!1282977 () Bool)

(declare-fun e!733114 () Bool)

(declare-fun e!733113 () Bool)

(assert (=> b!1282977 (= e!733114 e!733113)))

(declare-fun res!851924 () Bool)

(assert (=> b!1282977 (=> (not res!851924) (not e!733113))))

(declare-fun e!733116 () Bool)

(assert (=> b!1282977 (= res!851924 (not e!733116))))

(declare-fun res!851925 () Bool)

(assert (=> b!1282977 (=> (not res!851925) (not e!733116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282977 (= res!851925 (validKeyInArray!0 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1282978 () Bool)

(declare-fun e!733115 () Bool)

(assert (=> b!1282978 (= e!733113 e!733115)))

(declare-fun c!124441 () Bool)

(assert (=> b!1282978 (= c!124441 (validKeyInArray!0 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62781 () Bool)

(declare-fun call!62784 () Bool)

(assert (=> bm!62781 (= call!62784 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124441 (Cons!28937 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000) Nil!28938) Nil!28938)))))

(declare-fun b!1282979 () Bool)

(assert (=> b!1282979 (= e!733115 call!62784)))

(declare-fun b!1282980 () Bool)

(assert (=> b!1282980 (= e!733115 call!62784)))

(declare-fun b!1282981 () Bool)

(declare-fun contains!7843 (List!28941 (_ BitVec 64)) Bool)

(assert (=> b!1282981 (= e!733116 (contains!7843 Nil!28938 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141091 () Bool)

(declare-fun res!851923 () Bool)

(assert (=> d!141091 (=> res!851923 e!733114)))

(assert (=> d!141091 (= res!851923 (bvsge #b00000000000000000000000000000000 (size!41354 _keys!1741)))))

(assert (=> d!141091 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28938) e!733114)))

(assert (= (and d!141091 (not res!851923)) b!1282977))

(assert (= (and b!1282977 res!851925) b!1282981))

(assert (= (and b!1282977 res!851924) b!1282978))

(assert (= (and b!1282978 c!124441) b!1282980))

(assert (= (and b!1282978 (not c!124441)) b!1282979))

(assert (= (or b!1282980 b!1282979) bm!62781))

(declare-fun m!1177677 () Bool)

(assert (=> b!1282977 m!1177677))

(assert (=> b!1282977 m!1177677))

(declare-fun m!1177679 () Bool)

(assert (=> b!1282977 m!1177679))

(assert (=> b!1282978 m!1177677))

(assert (=> b!1282978 m!1177677))

(assert (=> b!1282978 m!1177679))

(assert (=> bm!62781 m!1177677))

(declare-fun m!1177681 () Bool)

(assert (=> bm!62781 m!1177681))

(assert (=> b!1282981 m!1177677))

(assert (=> b!1282981 m!1177677))

(declare-fun m!1177683 () Bool)

(assert (=> b!1282981 m!1177683))

(assert (=> b!1282896 d!141091))

(declare-fun d!141093 () Bool)

(declare-fun e!733121 () Bool)

(assert (=> d!141093 e!733121))

(declare-fun res!851928 () Bool)

(assert (=> d!141093 (=> res!851928 e!733121)))

(declare-fun lt!576767 () Bool)

(assert (=> d!141093 (= res!851928 (not lt!576767))))

(declare-fun lt!576765 () Bool)

(assert (=> d!141093 (= lt!576767 lt!576765)))

(declare-fun lt!576768 () Unit!42410)

(declare-fun e!733122 () Unit!42410)

(assert (=> d!141093 (= lt!576768 e!733122)))

(declare-fun c!124444 () Bool)

(assert (=> d!141093 (= c!124444 lt!576765)))

(declare-fun containsKey!714 (List!28940 (_ BitVec 64)) Bool)

(assert (=> d!141093 (= lt!576765 (containsKey!714 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!141093 (= (contains!7840 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!576767)))

(declare-fun b!1282988 () Bool)

(declare-fun lt!576766 () Unit!42410)

(assert (=> b!1282988 (= e!733122 lt!576766)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!460 (List!28940 (_ BitVec 64)) Unit!42410)

(assert (=> b!1282988 (= lt!576766 (lemmaContainsKeyImpliesGetValueByKeyDefined!460 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!739 0))(
  ( (Some!738 (v!19548 V!50105)) (None!737) )
))
(declare-fun isDefined!497 (Option!739) Bool)

(declare-fun getValueByKey!688 (List!28940 (_ BitVec 64)) Option!739)

(assert (=> b!1282988 (isDefined!497 (getValueByKey!688 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1282989 () Bool)

(declare-fun Unit!42414 () Unit!42410)

(assert (=> b!1282989 (= e!733122 Unit!42414)))

(declare-fun b!1282990 () Bool)

(assert (=> b!1282990 (= e!733121 (isDefined!497 (getValueByKey!688 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141093 c!124444) b!1282988))

(assert (= (and d!141093 (not c!124444)) b!1282989))

(assert (= (and d!141093 (not res!851928)) b!1282990))

(declare-fun m!1177685 () Bool)

(assert (=> d!141093 m!1177685))

(declare-fun m!1177687 () Bool)

(assert (=> b!1282988 m!1177687))

(declare-fun m!1177689 () Bool)

(assert (=> b!1282988 m!1177689))

(assert (=> b!1282988 m!1177689))

(declare-fun m!1177691 () Bool)

(assert (=> b!1282988 m!1177691))

(assert (=> b!1282990 m!1177689))

(assert (=> b!1282990 m!1177689))

(assert (=> b!1282990 m!1177691))

(assert (=> b!1282892 d!141093))

(declare-fun b!1283033 () Bool)

(declare-fun e!733160 () Bool)

(declare-fun e!733153 () Bool)

(assert (=> b!1283033 (= e!733160 e!733153)))

(declare-fun c!124459 () Bool)

(assert (=> b!1283033 (= c!124459 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1283034 () Bool)

(declare-fun c!124460 () Bool)

(assert (=> b!1283034 (= c!124460 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!733155 () ListLongMap!19391)

(declare-fun e!733157 () ListLongMap!19391)

(assert (=> b!1283034 (= e!733155 e!733157)))

(declare-fun b!1283035 () Bool)

(declare-fun e!733152 () Unit!42410)

(declare-fun lt!576820 () Unit!42410)

(assert (=> b!1283035 (= e!733152 lt!576820)))

(declare-fun lt!576824 () ListLongMap!19391)

(declare-fun getCurrentListMapNoExtraKeys!5950 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 32) Int) ListLongMap!19391)

(assert (=> b!1283035 (= lt!576824 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576827 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576823 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576823 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576831 () Unit!42410)

(declare-fun addStillContains!1105 (ListLongMap!19391 (_ BitVec 64) V!50105 (_ BitVec 64)) Unit!42410)

(assert (=> b!1283035 (= lt!576831 (addStillContains!1105 lt!576824 lt!576827 zeroValue!1387 lt!576823))))

(declare-fun +!4318 (ListLongMap!19391 tuple2!21726) ListLongMap!19391)

(assert (=> b!1283035 (contains!7840 (+!4318 lt!576824 (tuple2!21727 lt!576827 zeroValue!1387)) lt!576823)))

(declare-fun lt!576813 () Unit!42410)

(assert (=> b!1283035 (= lt!576813 lt!576831)))

(declare-fun lt!576819 () ListLongMap!19391)

(assert (=> b!1283035 (= lt!576819 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576825 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576825 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576815 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576815 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576826 () Unit!42410)

(declare-fun addApplyDifferent!547 (ListLongMap!19391 (_ BitVec 64) V!50105 (_ BitVec 64)) Unit!42410)

(assert (=> b!1283035 (= lt!576826 (addApplyDifferent!547 lt!576819 lt!576825 minValue!1387 lt!576815))))

(declare-fun apply!1018 (ListLongMap!19391 (_ BitVec 64)) V!50105)

(assert (=> b!1283035 (= (apply!1018 (+!4318 lt!576819 (tuple2!21727 lt!576825 minValue!1387)) lt!576815) (apply!1018 lt!576819 lt!576815))))

(declare-fun lt!576821 () Unit!42410)

(assert (=> b!1283035 (= lt!576821 lt!576826)))

(declare-fun lt!576828 () ListLongMap!19391)

(assert (=> b!1283035 (= lt!576828 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576816 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576832 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576832 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576830 () Unit!42410)

(assert (=> b!1283035 (= lt!576830 (addApplyDifferent!547 lt!576828 lt!576816 zeroValue!1387 lt!576832))))

(assert (=> b!1283035 (= (apply!1018 (+!4318 lt!576828 (tuple2!21727 lt!576816 zeroValue!1387)) lt!576832) (apply!1018 lt!576828 lt!576832))))

(declare-fun lt!576834 () Unit!42410)

(assert (=> b!1283035 (= lt!576834 lt!576830)))

(declare-fun lt!576818 () ListLongMap!19391)

(assert (=> b!1283035 (= lt!576818 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576829 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576829 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576814 () (_ BitVec 64))

(assert (=> b!1283035 (= lt!576814 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1283035 (= lt!576820 (addApplyDifferent!547 lt!576818 lt!576829 minValue!1387 lt!576814))))

(assert (=> b!1283035 (= (apply!1018 (+!4318 lt!576818 (tuple2!21727 lt!576829 minValue!1387)) lt!576814) (apply!1018 lt!576818 lt!576814))))

(declare-fun b!1283036 () Bool)

(declare-fun res!851948 () Bool)

(assert (=> b!1283036 (=> (not res!851948) (not e!733160))))

(declare-fun e!733150 () Bool)

(assert (=> b!1283036 (= res!851948 e!733150)))

(declare-fun res!851949 () Bool)

(assert (=> b!1283036 (=> res!851949 e!733150)))

(declare-fun e!733149 () Bool)

(assert (=> b!1283036 (= res!851949 (not e!733149))))

(declare-fun res!851954 () Bool)

(assert (=> b!1283036 (=> (not res!851954) (not e!733149))))

(assert (=> b!1283036 (= res!851954 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)))))

(declare-fun b!1283038 () Bool)

(declare-fun call!62801 () Bool)

(assert (=> b!1283038 (= e!733153 (not call!62801))))

(declare-fun b!1283039 () Bool)

(declare-fun e!733154 () ListLongMap!19391)

(assert (=> b!1283039 (= e!733154 e!733155)))

(declare-fun c!124458 () Bool)

(assert (=> b!1283039 (= c!124458 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1283040 () Bool)

(declare-fun e!733158 () Bool)

(declare-fun lt!576822 () ListLongMap!19391)

(assert (=> b!1283040 (= e!733158 (= (apply!1018 lt!576822 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1283041 () Bool)

(declare-fun e!733156 () Bool)

(declare-fun get!20803 (ValueCell!15977 V!50105) V!50105)

(declare-fun dynLambda!3470 (Int (_ BitVec 64)) V!50105)

(assert (=> b!1283041 (= e!733156 (= (apply!1018 lt!576822 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!20803 (select (arr!40802 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3470 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1283041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41353 _values!1445)))))

(assert (=> b!1283041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)))))

(declare-fun b!1283042 () Bool)

(declare-fun call!62800 () ListLongMap!19391)

(assert (=> b!1283042 (= e!733157 call!62800)))

(declare-fun bm!62796 () Bool)

(declare-fun call!62803 () Bool)

(assert (=> bm!62796 (= call!62803 (contains!7840 lt!576822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1283043 () Bool)

(declare-fun res!851951 () Bool)

(assert (=> b!1283043 (=> (not res!851951) (not e!733160))))

(declare-fun e!733151 () Bool)

(assert (=> b!1283043 (= res!851951 e!733151)))

(declare-fun c!124457 () Bool)

(assert (=> b!1283043 (= c!124457 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1283044 () Bool)

(declare-fun call!62805 () ListLongMap!19391)

(assert (=> b!1283044 (= e!733155 call!62805)))

(declare-fun bm!62797 () Bool)

(declare-fun call!62802 () ListLongMap!19391)

(declare-fun call!62804 () ListLongMap!19391)

(assert (=> bm!62797 (= call!62802 call!62804)))

(declare-fun b!1283045 () Bool)

(assert (=> b!1283045 (= e!733150 e!733156)))

(declare-fun res!851953 () Bool)

(assert (=> b!1283045 (=> (not res!851953) (not e!733156))))

(assert (=> b!1283045 (= res!851953 (contains!7840 lt!576822 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1283045 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)))))

(declare-fun bm!62798 () Bool)

(assert (=> bm!62798 (= call!62801 (contains!7840 lt!576822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1283046 () Bool)

(assert (=> b!1283046 (= e!733151 (not call!62803))))

(declare-fun b!1283047 () Bool)

(assert (=> b!1283047 (= e!733149 (validKeyInArray!0 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1283048 () Bool)

(declare-fun call!62799 () ListLongMap!19391)

(assert (=> b!1283048 (= e!733154 (+!4318 call!62799 (tuple2!21727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1283037 () Bool)

(declare-fun Unit!42415 () Unit!42410)

(assert (=> b!1283037 (= e!733152 Unit!42415)))

(declare-fun d!141095 () Bool)

(assert (=> d!141095 e!733160))

(declare-fun res!851947 () Bool)

(assert (=> d!141095 (=> (not res!851947) (not e!733160))))

(assert (=> d!141095 (= res!851947 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)))))))

(declare-fun lt!576817 () ListLongMap!19391)

(assert (=> d!141095 (= lt!576822 lt!576817)))

(declare-fun lt!576833 () Unit!42410)

(assert (=> d!141095 (= lt!576833 e!733152)))

(declare-fun c!124461 () Bool)

(declare-fun e!733161 () Bool)

(assert (=> d!141095 (= c!124461 e!733161)))

(declare-fun res!851955 () Bool)

(assert (=> d!141095 (=> (not res!851955) (not e!733161))))

(assert (=> d!141095 (= res!851955 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41354 _keys!1741)))))

(assert (=> d!141095 (= lt!576817 e!733154)))

(declare-fun c!124462 () Bool)

(assert (=> d!141095 (= c!124462 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141095 (validMask!0 mask!2175)))

(assert (=> d!141095 (= (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576822)))

(declare-fun b!1283049 () Bool)

(declare-fun e!733159 () Bool)

(assert (=> b!1283049 (= e!733153 e!733159)))

(declare-fun res!851952 () Bool)

(assert (=> b!1283049 (= res!851952 call!62801)))

(assert (=> b!1283049 (=> (not res!851952) (not e!733159))))

(declare-fun b!1283050 () Bool)

(assert (=> b!1283050 (= e!733161 (validKeyInArray!0 (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1283051 () Bool)

(assert (=> b!1283051 (= e!733157 call!62805)))

(declare-fun bm!62799 () Bool)

(assert (=> bm!62799 (= call!62800 call!62802)))

(declare-fun bm!62800 () Bool)

(assert (=> bm!62800 (= call!62804 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun bm!62801 () Bool)

(assert (=> bm!62801 (= call!62805 call!62799)))

(declare-fun b!1283052 () Bool)

(assert (=> b!1283052 (= e!733159 (= (apply!1018 lt!576822 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!62802 () Bool)

(assert (=> bm!62802 (= call!62799 (+!4318 (ite c!124462 call!62804 (ite c!124458 call!62802 call!62800)) (ite (or c!124462 c!124458) (tuple2!21727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1283053 () Bool)

(assert (=> b!1283053 (= e!733151 e!733158)))

(declare-fun res!851950 () Bool)

(assert (=> b!1283053 (= res!851950 call!62803)))

(assert (=> b!1283053 (=> (not res!851950) (not e!733158))))

(assert (= (and d!141095 c!124462) b!1283048))

(assert (= (and d!141095 (not c!124462)) b!1283039))

(assert (= (and b!1283039 c!124458) b!1283044))

(assert (= (and b!1283039 (not c!124458)) b!1283034))

(assert (= (and b!1283034 c!124460) b!1283051))

(assert (= (and b!1283034 (not c!124460)) b!1283042))

(assert (= (or b!1283051 b!1283042) bm!62799))

(assert (= (or b!1283044 bm!62799) bm!62797))

(assert (= (or b!1283044 b!1283051) bm!62801))

(assert (= (or b!1283048 bm!62797) bm!62800))

(assert (= (or b!1283048 bm!62801) bm!62802))

(assert (= (and d!141095 res!851955) b!1283050))

(assert (= (and d!141095 c!124461) b!1283035))

(assert (= (and d!141095 (not c!124461)) b!1283037))

(assert (= (and d!141095 res!851947) b!1283036))

(assert (= (and b!1283036 res!851954) b!1283047))

(assert (= (and b!1283036 (not res!851949)) b!1283045))

(assert (= (and b!1283045 res!851953) b!1283041))

(assert (= (and b!1283036 res!851948) b!1283043))

(assert (= (and b!1283043 c!124457) b!1283053))

(assert (= (and b!1283043 (not c!124457)) b!1283046))

(assert (= (and b!1283053 res!851950) b!1283040))

(assert (= (or b!1283053 b!1283046) bm!62796))

(assert (= (and b!1283043 res!851951) b!1283033))

(assert (= (and b!1283033 c!124459) b!1283049))

(assert (= (and b!1283033 (not c!124459)) b!1283038))

(assert (= (and b!1283049 res!851952) b!1283052))

(assert (= (or b!1283049 b!1283038) bm!62798))

(declare-fun b_lambda!23089 () Bool)

(assert (=> (not b_lambda!23089) (not b!1283041)))

(declare-fun t!42478 () Bool)

(declare-fun tb!11337 () Bool)

(assert (=> (and start!108788 (= defaultEntry!1448 defaultEntry!1448) t!42478) tb!11337))

(declare-fun result!23677 () Bool)

(assert (=> tb!11337 (= result!23677 tp_is_empty!33751)))

(assert (=> b!1283041 t!42478))

(declare-fun b_and!46179 () Bool)

(assert (= b_and!46173 (and (=> t!42478 result!23677) b_and!46179)))

(declare-fun m!1177693 () Bool)

(assert (=> b!1283052 m!1177693))

(declare-fun m!1177695 () Bool)

(assert (=> bm!62798 m!1177695))

(declare-fun m!1177697 () Bool)

(assert (=> b!1283050 m!1177697))

(assert (=> b!1283050 m!1177697))

(declare-fun m!1177699 () Bool)

(assert (=> b!1283050 m!1177699))

(assert (=> d!141095 m!1177593))

(declare-fun m!1177701 () Bool)

(assert (=> b!1283040 m!1177701))

(declare-fun m!1177703 () Bool)

(assert (=> bm!62796 m!1177703))

(declare-fun m!1177705 () Bool)

(assert (=> b!1283041 m!1177705))

(declare-fun m!1177707 () Bool)

(assert (=> b!1283041 m!1177707))

(assert (=> b!1283041 m!1177707))

(assert (=> b!1283041 m!1177705))

(declare-fun m!1177709 () Bool)

(assert (=> b!1283041 m!1177709))

(assert (=> b!1283041 m!1177697))

(declare-fun m!1177711 () Bool)

(assert (=> b!1283041 m!1177711))

(assert (=> b!1283041 m!1177697))

(declare-fun m!1177713 () Bool)

(assert (=> bm!62802 m!1177713))

(declare-fun m!1177715 () Bool)

(assert (=> bm!62800 m!1177715))

(assert (=> b!1283047 m!1177697))

(assert (=> b!1283047 m!1177697))

(assert (=> b!1283047 m!1177699))

(assert (=> b!1283045 m!1177697))

(assert (=> b!1283045 m!1177697))

(declare-fun m!1177717 () Bool)

(assert (=> b!1283045 m!1177717))

(declare-fun m!1177719 () Bool)

(assert (=> b!1283048 m!1177719))

(declare-fun m!1177721 () Bool)

(assert (=> b!1283035 m!1177721))

(declare-fun m!1177723 () Bool)

(assert (=> b!1283035 m!1177723))

(declare-fun m!1177725 () Bool)

(assert (=> b!1283035 m!1177725))

(declare-fun m!1177727 () Bool)

(assert (=> b!1283035 m!1177727))

(declare-fun m!1177729 () Bool)

(assert (=> b!1283035 m!1177729))

(assert (=> b!1283035 m!1177727))

(declare-fun m!1177731 () Bool)

(assert (=> b!1283035 m!1177731))

(declare-fun m!1177733 () Bool)

(assert (=> b!1283035 m!1177733))

(declare-fun m!1177735 () Bool)

(assert (=> b!1283035 m!1177735))

(declare-fun m!1177737 () Bool)

(assert (=> b!1283035 m!1177737))

(assert (=> b!1283035 m!1177697))

(declare-fun m!1177739 () Bool)

(assert (=> b!1283035 m!1177739))

(assert (=> b!1283035 m!1177721))

(declare-fun m!1177741 () Bool)

(assert (=> b!1283035 m!1177741))

(assert (=> b!1283035 m!1177715))

(declare-fun m!1177743 () Bool)

(assert (=> b!1283035 m!1177743))

(assert (=> b!1283035 m!1177723))

(declare-fun m!1177745 () Bool)

(assert (=> b!1283035 m!1177745))

(declare-fun m!1177747 () Bool)

(assert (=> b!1283035 m!1177747))

(declare-fun m!1177749 () Bool)

(assert (=> b!1283035 m!1177749))

(assert (=> b!1283035 m!1177747))

(assert (=> b!1282892 d!141095))

(declare-fun d!141097 () Bool)

(assert (=> d!141097 (contains!7840 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!576837 () Unit!42410)

(declare-fun choose!1900 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42410)

(assert (=> d!141097 (= lt!576837 (choose!1900 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!141097 (validMask!0 mask!2175)))

(assert (=> d!141097 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!26 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!576837)))

(declare-fun bs!36508 () Bool)

(assert (= bs!36508 d!141097))

(declare-fun m!1177751 () Bool)

(assert (=> bs!36508 m!1177751))

(assert (=> bs!36508 m!1177751))

(declare-fun m!1177753 () Bool)

(assert (=> bs!36508 m!1177753))

(declare-fun m!1177755 () Bool)

(assert (=> bs!36508 m!1177755))

(assert (=> bs!36508 m!1177593))

(assert (=> b!1282892 d!141097))

(declare-fun d!141099 () Bool)

(assert (=> d!141099 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108788 d!141099))

(declare-fun d!141101 () Bool)

(assert (=> d!141101 (= (array_inv!31173 _values!1445) (bvsge (size!41353 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108788 d!141101))

(declare-fun d!141103 () Bool)

(assert (=> d!141103 (= (array_inv!31174 _keys!1741) (bvsge (size!41354 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108788 d!141103))

(declare-fun d!141105 () Bool)

(declare-fun e!733162 () Bool)

(assert (=> d!141105 e!733162))

(declare-fun res!851956 () Bool)

(assert (=> d!141105 (=> res!851956 e!733162)))

(declare-fun lt!576840 () Bool)

(assert (=> d!141105 (= res!851956 (not lt!576840))))

(declare-fun lt!576838 () Bool)

(assert (=> d!141105 (= lt!576840 lt!576838)))

(declare-fun lt!576841 () Unit!42410)

(declare-fun e!733163 () Unit!42410)

(assert (=> d!141105 (= lt!576841 e!733163)))

(declare-fun c!124463 () Bool)

(assert (=> d!141105 (= c!124463 lt!576838)))

(assert (=> d!141105 (= lt!576838 (containsKey!714 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141105 (= (contains!7840 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576840)))

(declare-fun b!1283056 () Bool)

(declare-fun lt!576839 () Unit!42410)

(assert (=> b!1283056 (= e!733163 lt!576839)))

(assert (=> b!1283056 (= lt!576839 (lemmaContainsKeyImpliesGetValueByKeyDefined!460 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1283056 (isDefined!497 (getValueByKey!688 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1283057 () Bool)

(declare-fun Unit!42416 () Unit!42410)

(assert (=> b!1283057 (= e!733163 Unit!42416)))

(declare-fun b!1283058 () Bool)

(assert (=> b!1283058 (= e!733162 (isDefined!497 (getValueByKey!688 (toList!9711 (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141105 c!124463) b!1283056))

(assert (= (and d!141105 (not c!124463)) b!1283057))

(assert (= (and d!141105 (not res!851956)) b!1283058))

(declare-fun m!1177757 () Bool)

(assert (=> d!141105 m!1177757))

(declare-fun m!1177759 () Bool)

(assert (=> b!1283056 m!1177759))

(declare-fun m!1177761 () Bool)

(assert (=> b!1283056 m!1177761))

(assert (=> b!1283056 m!1177761))

(declare-fun m!1177763 () Bool)

(assert (=> b!1283056 m!1177763))

(assert (=> b!1283058 m!1177761))

(assert (=> b!1283058 m!1177761))

(assert (=> b!1283058 m!1177763))

(assert (=> b!1282890 d!141105))

(declare-fun b!1283059 () Bool)

(declare-fun e!733175 () Bool)

(declare-fun e!733168 () Bool)

(assert (=> b!1283059 (= e!733175 e!733168)))

(declare-fun c!124466 () Bool)

(assert (=> b!1283059 (= c!124466 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1283060 () Bool)

(declare-fun c!124467 () Bool)

(assert (=> b!1283060 (= c!124467 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!733170 () ListLongMap!19391)

(declare-fun e!733172 () ListLongMap!19391)

(assert (=> b!1283060 (= e!733170 e!733172)))

(declare-fun b!1283061 () Bool)

(declare-fun e!733167 () Unit!42410)

(declare-fun lt!576849 () Unit!42410)

(assert (=> b!1283061 (= e!733167 lt!576849)))

(declare-fun lt!576853 () ListLongMap!19391)

(assert (=> b!1283061 (= lt!576853 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576856 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576852 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576852 (select (arr!40803 _keys!1741) from!2144))))

(declare-fun lt!576860 () Unit!42410)

(assert (=> b!1283061 (= lt!576860 (addStillContains!1105 lt!576853 lt!576856 zeroValue!1387 lt!576852))))

(assert (=> b!1283061 (contains!7840 (+!4318 lt!576853 (tuple2!21727 lt!576856 zeroValue!1387)) lt!576852)))

(declare-fun lt!576842 () Unit!42410)

(assert (=> b!1283061 (= lt!576842 lt!576860)))

(declare-fun lt!576848 () ListLongMap!19391)

(assert (=> b!1283061 (= lt!576848 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576854 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576844 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576844 (select (arr!40803 _keys!1741) from!2144))))

(declare-fun lt!576855 () Unit!42410)

(assert (=> b!1283061 (= lt!576855 (addApplyDifferent!547 lt!576848 lt!576854 minValue!1387 lt!576844))))

(assert (=> b!1283061 (= (apply!1018 (+!4318 lt!576848 (tuple2!21727 lt!576854 minValue!1387)) lt!576844) (apply!1018 lt!576848 lt!576844))))

(declare-fun lt!576850 () Unit!42410)

(assert (=> b!1283061 (= lt!576850 lt!576855)))

(declare-fun lt!576857 () ListLongMap!19391)

(assert (=> b!1283061 (= lt!576857 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576845 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576861 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576861 (select (arr!40803 _keys!1741) from!2144))))

(declare-fun lt!576859 () Unit!42410)

(assert (=> b!1283061 (= lt!576859 (addApplyDifferent!547 lt!576857 lt!576845 zeroValue!1387 lt!576861))))

(assert (=> b!1283061 (= (apply!1018 (+!4318 lt!576857 (tuple2!21727 lt!576845 zeroValue!1387)) lt!576861) (apply!1018 lt!576857 lt!576861))))

(declare-fun lt!576863 () Unit!42410)

(assert (=> b!1283061 (= lt!576863 lt!576859)))

(declare-fun lt!576847 () ListLongMap!19391)

(assert (=> b!1283061 (= lt!576847 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576858 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576843 () (_ BitVec 64))

(assert (=> b!1283061 (= lt!576843 (select (arr!40803 _keys!1741) from!2144))))

(assert (=> b!1283061 (= lt!576849 (addApplyDifferent!547 lt!576847 lt!576858 minValue!1387 lt!576843))))

(assert (=> b!1283061 (= (apply!1018 (+!4318 lt!576847 (tuple2!21727 lt!576858 minValue!1387)) lt!576843) (apply!1018 lt!576847 lt!576843))))

(declare-fun b!1283062 () Bool)

(declare-fun res!851958 () Bool)

(assert (=> b!1283062 (=> (not res!851958) (not e!733175))))

(declare-fun e!733165 () Bool)

(assert (=> b!1283062 (= res!851958 e!733165)))

(declare-fun res!851959 () Bool)

(assert (=> b!1283062 (=> res!851959 e!733165)))

(declare-fun e!733164 () Bool)

(assert (=> b!1283062 (= res!851959 (not e!733164))))

(declare-fun res!851964 () Bool)

(assert (=> b!1283062 (=> (not res!851964) (not e!733164))))

(assert (=> b!1283062 (= res!851964 (bvslt from!2144 (size!41354 _keys!1741)))))

(declare-fun b!1283064 () Bool)

(declare-fun call!62808 () Bool)

(assert (=> b!1283064 (= e!733168 (not call!62808))))

(declare-fun b!1283065 () Bool)

(declare-fun e!733169 () ListLongMap!19391)

(assert (=> b!1283065 (= e!733169 e!733170)))

(declare-fun c!124465 () Bool)

(assert (=> b!1283065 (= c!124465 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1283066 () Bool)

(declare-fun e!733173 () Bool)

(declare-fun lt!576851 () ListLongMap!19391)

(assert (=> b!1283066 (= e!733173 (= (apply!1018 lt!576851 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1283067 () Bool)

(declare-fun e!733171 () Bool)

(assert (=> b!1283067 (= e!733171 (= (apply!1018 lt!576851 (select (arr!40803 _keys!1741) from!2144)) (get!20803 (select (arr!40802 _values!1445) from!2144) (dynLambda!3470 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1283067 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41353 _values!1445)))))

(assert (=> b!1283067 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41354 _keys!1741)))))

(declare-fun b!1283068 () Bool)

(declare-fun call!62807 () ListLongMap!19391)

(assert (=> b!1283068 (= e!733172 call!62807)))

(declare-fun bm!62803 () Bool)

(declare-fun call!62810 () Bool)

(assert (=> bm!62803 (= call!62810 (contains!7840 lt!576851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1283069 () Bool)

(declare-fun res!851961 () Bool)

(assert (=> b!1283069 (=> (not res!851961) (not e!733175))))

(declare-fun e!733166 () Bool)

(assert (=> b!1283069 (= res!851961 e!733166)))

(declare-fun c!124464 () Bool)

(assert (=> b!1283069 (= c!124464 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1283070 () Bool)

(declare-fun call!62812 () ListLongMap!19391)

(assert (=> b!1283070 (= e!733170 call!62812)))

(declare-fun bm!62804 () Bool)

(declare-fun call!62809 () ListLongMap!19391)

(declare-fun call!62811 () ListLongMap!19391)

(assert (=> bm!62804 (= call!62809 call!62811)))

(declare-fun b!1283071 () Bool)

(assert (=> b!1283071 (= e!733165 e!733171)))

(declare-fun res!851963 () Bool)

(assert (=> b!1283071 (=> (not res!851963) (not e!733171))))

(assert (=> b!1283071 (= res!851963 (contains!7840 lt!576851 (select (arr!40803 _keys!1741) from!2144)))))

(assert (=> b!1283071 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41354 _keys!1741)))))

(declare-fun bm!62805 () Bool)

(assert (=> bm!62805 (= call!62808 (contains!7840 lt!576851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1283072 () Bool)

(assert (=> b!1283072 (= e!733166 (not call!62810))))

(declare-fun b!1283073 () Bool)

(assert (=> b!1283073 (= e!733164 (validKeyInArray!0 (select (arr!40803 _keys!1741) from!2144)))))

(declare-fun b!1283074 () Bool)

(declare-fun call!62806 () ListLongMap!19391)

(assert (=> b!1283074 (= e!733169 (+!4318 call!62806 (tuple2!21727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1283063 () Bool)

(declare-fun Unit!42417 () Unit!42410)

(assert (=> b!1283063 (= e!733167 Unit!42417)))

(declare-fun d!141107 () Bool)

(assert (=> d!141107 e!733175))

(declare-fun res!851957 () Bool)

(assert (=> d!141107 (=> (not res!851957) (not e!733175))))

(assert (=> d!141107 (= res!851957 (or (bvsge from!2144 (size!41354 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41354 _keys!1741)))))))

(declare-fun lt!576846 () ListLongMap!19391)

(assert (=> d!141107 (= lt!576851 lt!576846)))

(declare-fun lt!576862 () Unit!42410)

(assert (=> d!141107 (= lt!576862 e!733167)))

(declare-fun c!124468 () Bool)

(declare-fun e!733176 () Bool)

(assert (=> d!141107 (= c!124468 e!733176)))

(declare-fun res!851965 () Bool)

(assert (=> d!141107 (=> (not res!851965) (not e!733176))))

(assert (=> d!141107 (= res!851965 (bvslt from!2144 (size!41354 _keys!1741)))))

(assert (=> d!141107 (= lt!576846 e!733169)))

(declare-fun c!124469 () Bool)

(assert (=> d!141107 (= c!124469 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141107 (validMask!0 mask!2175)))

(assert (=> d!141107 (= (getCurrentListMap!4780 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576851)))

(declare-fun b!1283075 () Bool)

(declare-fun e!733174 () Bool)

(assert (=> b!1283075 (= e!733168 e!733174)))

(declare-fun res!851962 () Bool)

(assert (=> b!1283075 (= res!851962 call!62808)))

(assert (=> b!1283075 (=> (not res!851962) (not e!733174))))

(declare-fun b!1283076 () Bool)

(assert (=> b!1283076 (= e!733176 (validKeyInArray!0 (select (arr!40803 _keys!1741) from!2144)))))

(declare-fun b!1283077 () Bool)

(assert (=> b!1283077 (= e!733172 call!62812)))

(declare-fun bm!62806 () Bool)

(assert (=> bm!62806 (= call!62807 call!62809)))

(declare-fun bm!62807 () Bool)

(assert (=> bm!62807 (= call!62811 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!62808 () Bool)

(assert (=> bm!62808 (= call!62812 call!62806)))

(declare-fun b!1283078 () Bool)

(assert (=> b!1283078 (= e!733174 (= (apply!1018 lt!576851 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!62809 () Bool)

(assert (=> bm!62809 (= call!62806 (+!4318 (ite c!124469 call!62811 (ite c!124465 call!62809 call!62807)) (ite (or c!124469 c!124465) (tuple2!21727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1283079 () Bool)

(assert (=> b!1283079 (= e!733166 e!733173)))

(declare-fun res!851960 () Bool)

(assert (=> b!1283079 (= res!851960 call!62810)))

(assert (=> b!1283079 (=> (not res!851960) (not e!733173))))

(assert (= (and d!141107 c!124469) b!1283074))

(assert (= (and d!141107 (not c!124469)) b!1283065))

(assert (= (and b!1283065 c!124465) b!1283070))

(assert (= (and b!1283065 (not c!124465)) b!1283060))

(assert (= (and b!1283060 c!124467) b!1283077))

(assert (= (and b!1283060 (not c!124467)) b!1283068))

(assert (= (or b!1283077 b!1283068) bm!62806))

(assert (= (or b!1283070 bm!62806) bm!62804))

(assert (= (or b!1283070 b!1283077) bm!62808))

(assert (= (or b!1283074 bm!62804) bm!62807))

(assert (= (or b!1283074 bm!62808) bm!62809))

(assert (= (and d!141107 res!851965) b!1283076))

(assert (= (and d!141107 c!124468) b!1283061))

(assert (= (and d!141107 (not c!124468)) b!1283063))

(assert (= (and d!141107 res!851957) b!1283062))

(assert (= (and b!1283062 res!851964) b!1283073))

(assert (= (and b!1283062 (not res!851959)) b!1283071))

(assert (= (and b!1283071 res!851963) b!1283067))

(assert (= (and b!1283062 res!851958) b!1283069))

(assert (= (and b!1283069 c!124464) b!1283079))

(assert (= (and b!1283069 (not c!124464)) b!1283072))

(assert (= (and b!1283079 res!851960) b!1283066))

(assert (= (or b!1283079 b!1283072) bm!62803))

(assert (= (and b!1283069 res!851961) b!1283059))

(assert (= (and b!1283059 c!124466) b!1283075))

(assert (= (and b!1283059 (not c!124466)) b!1283064))

(assert (= (and b!1283075 res!851962) b!1283078))

(assert (= (or b!1283075 b!1283064) bm!62805))

(declare-fun b_lambda!23091 () Bool)

(assert (=> (not b_lambda!23091) (not b!1283067)))

(assert (=> b!1283067 t!42478))

(declare-fun b_and!46181 () Bool)

(assert (= b_and!46179 (and (=> t!42478 result!23677) b_and!46181)))

(declare-fun m!1177765 () Bool)

(assert (=> b!1283078 m!1177765))

(declare-fun m!1177767 () Bool)

(assert (=> bm!62805 m!1177767))

(assert (=> b!1283076 m!1177609))

(assert (=> b!1283076 m!1177609))

(declare-fun m!1177769 () Bool)

(assert (=> b!1283076 m!1177769))

(assert (=> d!141107 m!1177593))

(declare-fun m!1177771 () Bool)

(assert (=> b!1283066 m!1177771))

(declare-fun m!1177773 () Bool)

(assert (=> bm!62803 m!1177773))

(assert (=> b!1283067 m!1177705))

(declare-fun m!1177775 () Bool)

(assert (=> b!1283067 m!1177775))

(assert (=> b!1283067 m!1177775))

(assert (=> b!1283067 m!1177705))

(declare-fun m!1177777 () Bool)

(assert (=> b!1283067 m!1177777))

(assert (=> b!1283067 m!1177609))

(declare-fun m!1177779 () Bool)

(assert (=> b!1283067 m!1177779))

(assert (=> b!1283067 m!1177609))

(declare-fun m!1177781 () Bool)

(assert (=> bm!62809 m!1177781))

(declare-fun m!1177783 () Bool)

(assert (=> bm!62807 m!1177783))

(assert (=> b!1283073 m!1177609))

(assert (=> b!1283073 m!1177609))

(assert (=> b!1283073 m!1177769))

(assert (=> b!1283071 m!1177609))

(assert (=> b!1283071 m!1177609))

(declare-fun m!1177785 () Bool)

(assert (=> b!1283071 m!1177785))

(declare-fun m!1177787 () Bool)

(assert (=> b!1283074 m!1177787))

(declare-fun m!1177789 () Bool)

(assert (=> b!1283061 m!1177789))

(declare-fun m!1177791 () Bool)

(assert (=> b!1283061 m!1177791))

(declare-fun m!1177793 () Bool)

(assert (=> b!1283061 m!1177793))

(declare-fun m!1177795 () Bool)

(assert (=> b!1283061 m!1177795))

(declare-fun m!1177797 () Bool)

(assert (=> b!1283061 m!1177797))

(assert (=> b!1283061 m!1177795))

(declare-fun m!1177799 () Bool)

(assert (=> b!1283061 m!1177799))

(declare-fun m!1177801 () Bool)

(assert (=> b!1283061 m!1177801))

(declare-fun m!1177803 () Bool)

(assert (=> b!1283061 m!1177803))

(declare-fun m!1177805 () Bool)

(assert (=> b!1283061 m!1177805))

(assert (=> b!1283061 m!1177609))

(declare-fun m!1177807 () Bool)

(assert (=> b!1283061 m!1177807))

(assert (=> b!1283061 m!1177789))

(declare-fun m!1177809 () Bool)

(assert (=> b!1283061 m!1177809))

(assert (=> b!1283061 m!1177783))

(declare-fun m!1177811 () Bool)

(assert (=> b!1283061 m!1177811))

(assert (=> b!1283061 m!1177791))

(declare-fun m!1177813 () Bool)

(assert (=> b!1283061 m!1177813))

(declare-fun m!1177815 () Bool)

(assert (=> b!1283061 m!1177815))

(declare-fun m!1177817 () Bool)

(assert (=> b!1283061 m!1177817))

(assert (=> b!1283061 m!1177815))

(assert (=> b!1282890 d!141107))

(declare-fun b!1283088 () Bool)

(declare-fun e!733185 () Bool)

(declare-fun call!62815 () Bool)

(assert (=> b!1283088 (= e!733185 call!62815)))

(declare-fun b!1283089 () Bool)

(declare-fun e!733183 () Bool)

(assert (=> b!1283089 (= e!733183 e!733185)))

(declare-fun lt!576870 () (_ BitVec 64))

(assert (=> b!1283089 (= lt!576870 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!576871 () Unit!42410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84607 (_ BitVec 64) (_ BitVec 32)) Unit!42410)

(assert (=> b!1283089 (= lt!576871 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576870 #b00000000000000000000000000000000))))

(assert (=> b!1283089 (arrayContainsKey!0 _keys!1741 lt!576870 #b00000000000000000000000000000000)))

(declare-fun lt!576872 () Unit!42410)

(assert (=> b!1283089 (= lt!576872 lt!576871)))

(declare-fun res!851970 () Bool)

(declare-datatypes ((SeekEntryResult!9968 0))(
  ( (MissingZero!9968 (index!42243 (_ BitVec 32))) (Found!9968 (index!42244 (_ BitVec 32))) (Intermediate!9968 (undefined!10780 Bool) (index!42245 (_ BitVec 32)) (x!113655 (_ BitVec 32))) (Undefined!9968) (MissingVacant!9968 (index!42246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84607 (_ BitVec 32)) SeekEntryResult!9968)

(assert (=> b!1283089 (= res!851970 (= (seekEntryOrOpen!0 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9968 #b00000000000000000000000000000000)))))

(assert (=> b!1283089 (=> (not res!851970) (not e!733185))))

(declare-fun bm!62812 () Bool)

(assert (=> bm!62812 (= call!62815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1283090 () Bool)

(declare-fun e!733184 () Bool)

(assert (=> b!1283090 (= e!733184 e!733183)))

(declare-fun c!124472 () Bool)

(assert (=> b!1283090 (= c!124472 (validKeyInArray!0 (select (arr!40803 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1283091 () Bool)

(assert (=> b!1283091 (= e!733183 call!62815)))

(declare-fun d!141109 () Bool)

(declare-fun res!851971 () Bool)

(assert (=> d!141109 (=> res!851971 e!733184)))

(assert (=> d!141109 (= res!851971 (bvsge #b00000000000000000000000000000000 (size!41354 _keys!1741)))))

(assert (=> d!141109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!733184)))

(assert (= (and d!141109 (not res!851971)) b!1283090))

(assert (= (and b!1283090 c!124472) b!1283089))

(assert (= (and b!1283090 (not c!124472)) b!1283091))

(assert (= (and b!1283089 res!851970) b!1283088))

(assert (= (or b!1283088 b!1283091) bm!62812))

(assert (=> b!1283089 m!1177677))

(declare-fun m!1177819 () Bool)

(assert (=> b!1283089 m!1177819))

(declare-fun m!1177821 () Bool)

(assert (=> b!1283089 m!1177821))

(assert (=> b!1283089 m!1177677))

(declare-fun m!1177823 () Bool)

(assert (=> b!1283089 m!1177823))

(declare-fun m!1177825 () Bool)

(assert (=> bm!62812 m!1177825))

(assert (=> b!1283090 m!1177677))

(assert (=> b!1283090 m!1177677))

(assert (=> b!1283090 m!1177679))

(assert (=> b!1282891 d!141109))

(declare-fun d!141111 () Bool)

(declare-fun res!851976 () Bool)

(declare-fun e!733190 () Bool)

(assert (=> d!141111 (=> res!851976 e!733190)))

(assert (=> d!141111 (= res!851976 (= (select (arr!40803 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!141111 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!733190)))

(declare-fun b!1283096 () Bool)

(declare-fun e!733191 () Bool)

(assert (=> b!1283096 (= e!733190 e!733191)))

(declare-fun res!851977 () Bool)

(assert (=> b!1283096 (=> (not res!851977) (not e!733191))))

(assert (=> b!1283096 (= res!851977 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!41354 _keys!1741)))))

(declare-fun b!1283097 () Bool)

(assert (=> b!1283097 (= e!733191 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141111 (not res!851976)) b!1283096))

(assert (= (and b!1283096 res!851977) b!1283097))

(assert (=> d!141111 m!1177697))

(declare-fun m!1177827 () Bool)

(assert (=> b!1283097 m!1177827))

(assert (=> b!1282893 d!141111))

(declare-fun d!141113 () Bool)

(declare-fun e!733194 () Bool)

(assert (=> d!141113 e!733194))

(declare-fun c!124475 () Bool)

(assert (=> d!141113 (= c!124475 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!576875 () Unit!42410)

(declare-fun choose!1901 (array!84607 array!84605 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42410)

(assert (=> d!141113 (= lt!576875 (choose!1901 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!141113 (validMask!0 mask!2175)))

(assert (=> d!141113 (= (lemmaListMapContainsThenArrayContainsFrom!639 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576875)))

(declare-fun b!1283102 () Bool)

(assert (=> b!1283102 (= e!733194 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1283103 () Bool)

(assert (=> b!1283103 (= e!733194 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!141113 c!124475) b!1283102))

(assert (= (and d!141113 (not c!124475)) b!1283103))

(declare-fun m!1177829 () Bool)

(assert (=> d!141113 m!1177829))

(assert (=> d!141113 m!1177593))

(assert (=> b!1283102 m!1177605))

(assert (=> b!1282893 d!141113))

(declare-fun mapNonEmpty!52187 () Bool)

(declare-fun mapRes!52187 () Bool)

(declare-fun tp!99458 () Bool)

(declare-fun e!733200 () Bool)

(assert (=> mapNonEmpty!52187 (= mapRes!52187 (and tp!99458 e!733200))))

(declare-fun mapKey!52187 () (_ BitVec 32))

(declare-fun mapValue!52187 () ValueCell!15977)

(declare-fun mapRest!52187 () (Array (_ BitVec 32) ValueCell!15977))

(assert (=> mapNonEmpty!52187 (= mapRest!52178 (store mapRest!52187 mapKey!52187 mapValue!52187))))

(declare-fun mapIsEmpty!52187 () Bool)

(assert (=> mapIsEmpty!52187 mapRes!52187))

(declare-fun b!1283111 () Bool)

(declare-fun e!733199 () Bool)

(assert (=> b!1283111 (= e!733199 tp_is_empty!33751)))

(declare-fun condMapEmpty!52187 () Bool)

(declare-fun mapDefault!52187 () ValueCell!15977)

(assert (=> mapNonEmpty!52178 (= condMapEmpty!52187 (= mapRest!52178 ((as const (Array (_ BitVec 32) ValueCell!15977)) mapDefault!52187)))))

(assert (=> mapNonEmpty!52178 (= tp!99443 (and e!733199 mapRes!52187))))

(declare-fun b!1283110 () Bool)

(assert (=> b!1283110 (= e!733200 tp_is_empty!33751)))

(assert (= (and mapNonEmpty!52178 condMapEmpty!52187) mapIsEmpty!52187))

(assert (= (and mapNonEmpty!52178 (not condMapEmpty!52187)) mapNonEmpty!52187))

(assert (= (and mapNonEmpty!52187 ((_ is ValueCellFull!15977) mapValue!52187)) b!1283110))

(assert (= (and mapNonEmpty!52178 ((_ is ValueCellFull!15977) mapDefault!52187)) b!1283111))

(declare-fun m!1177831 () Bool)

(assert (=> mapNonEmpty!52187 m!1177831))

(declare-fun b_lambda!23093 () Bool)

(assert (= b_lambda!23089 (or (and start!108788 b_free!28111) b_lambda!23093)))

(declare-fun b_lambda!23095 () Bool)

(assert (= b_lambda!23091 (or (and start!108788 b_free!28111) b_lambda!23095)))

(check-sat (not bm!62781) (not b!1283048) (not b!1282977) (not b_lambda!23095) (not d!141093) tp_is_empty!33751 (not b!1283050) (not b!1282990) (not b!1283090) (not b!1283058) (not b!1283047) (not b!1283089) (not d!141095) (not b!1283035) (not bm!62803) (not bm!62809) (not b!1283067) (not b!1283056) (not b!1283076) (not d!141105) (not bm!62798) (not mapNonEmpty!52187) (not bm!62807) (not bm!62800) b_and!46181 (not b!1283078) (not d!141113) (not b!1283074) (not b!1283071) (not b!1282981) (not b_next!28111) (not b!1283102) (not bm!62802) (not b!1283061) (not b!1283066) (not b_lambda!23093) (not b!1283040) (not b!1282988) (not b!1283052) (not bm!62812) (not d!141107) (not b!1283041) (not b!1283045) (not b!1282978) (not b!1283097) (not bm!62796) (not d!141097) (not b!1283073) (not bm!62805))
(check-sat b_and!46181 (not b_next!28111))
