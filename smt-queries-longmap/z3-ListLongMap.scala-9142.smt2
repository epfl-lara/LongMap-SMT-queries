; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109638 () Bool)

(assert start!109638)

(declare-fun b_free!29127 () Bool)

(declare-fun b_next!29127 () Bool)

(assert (=> start!109638 (= b_free!29127 (not b_next!29127))))

(declare-fun tp!102499 () Bool)

(declare-fun b_and!47217 () Bool)

(assert (=> start!109638 (= tp!102499 b_and!47217)))

(declare-fun b!1298772 () Bool)

(declare-fun res!863157 () Bool)

(declare-fun e!740933 () Bool)

(assert (=> b!1298772 (=> (not res!863157) (not e!740933))))

(declare-datatypes ((array!86540 0))(
  ( (array!86541 (arr!41771 (Array (_ BitVec 32) (_ BitVec 64))) (size!42321 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86540)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86540 (_ BitVec 32)) Bool)

(assert (=> b!1298772 (= res!863157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298773 () Bool)

(declare-fun res!863156 () Bool)

(assert (=> b!1298773 (=> (not res!863156) (not e!740933))))

(declare-datatypes ((List!29645 0))(
  ( (Nil!29642) (Cons!29641 (h!30850 (_ BitVec 64)) (t!43209 List!29645)) )
))
(declare-fun arrayNoDuplicates!0 (array!86540 (_ BitVec 32) List!29645) Bool)

(assert (=> b!1298773 (= res!863156 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29642))))

(declare-fun b!1298774 () Bool)

(declare-fun res!863161 () Bool)

(assert (=> b!1298774 (=> (not res!863161) (not e!740933))))

(declare-datatypes ((V!51459 0))(
  ( (V!51460 (val!17458 Int)) )
))
(declare-datatypes ((ValueCell!16485 0))(
  ( (ValueCellFull!16485 (v!20061 V!51459)) (EmptyCell!16485) )
))
(declare-datatypes ((array!86542 0))(
  ( (array!86543 (arr!41772 (Array (_ BitVec 32) ValueCell!16485)) (size!42322 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86542)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298774 (= res!863161 (and (= (size!42322 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42321 _keys!1741) (size!42322 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53711 () Bool)

(declare-fun mapRes!53711 () Bool)

(assert (=> mapIsEmpty!53711 mapRes!53711))

(declare-fun b!1298775 () Bool)

(declare-fun e!740932 () Bool)

(declare-fun tp_is_empty!34767 () Bool)

(assert (=> b!1298775 (= e!740932 tp_is_empty!34767)))

(declare-fun b!1298776 () Bool)

(declare-fun e!740928 () Bool)

(assert (=> b!1298776 (= e!740933 (not e!740928))))

(declare-fun res!863159 () Bool)

(assert (=> b!1298776 (=> res!863159 e!740928)))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298776 (= res!863159 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!51459)

(declare-fun zeroValue!1387 () V!51459)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22516 0))(
  ( (tuple2!22517 (_1!11269 (_ BitVec 64)) (_2!11269 V!51459)) )
))
(declare-datatypes ((List!29646 0))(
  ( (Nil!29643) (Cons!29642 (h!30851 tuple2!22516) (t!43210 List!29646)) )
))
(declare-datatypes ((ListLongMap!20173 0))(
  ( (ListLongMap!20174 (toList!10102 List!29646)) )
))
(declare-fun contains!8220 (ListLongMap!20173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5131 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 32) Int) ListLongMap!20173)

(assert (=> b!1298776 (contains!8220 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!43009 0))(
  ( (Unit!43010) )
))
(declare-fun lt!580741 () Unit!43009)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!57 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 64) (_ BitVec 32) Int) Unit!43009)

(assert (=> b!1298776 (= lt!580741 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!57 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298777 () Bool)

(declare-fun res!863160 () Bool)

(assert (=> b!1298777 (=> (not res!863160) (not e!740933))))

(assert (=> b!1298777 (= res!863160 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)) (not (= (select (arr!41771 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!863163 () Bool)

(assert (=> start!109638 (=> (not res!863163) (not e!740933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109638 (= res!863163 (validMask!0 mask!2175))))

(assert (=> start!109638 e!740933))

(assert (=> start!109638 tp_is_empty!34767))

(assert (=> start!109638 true))

(declare-fun e!740929 () Bool)

(declare-fun array_inv!31613 (array!86542) Bool)

(assert (=> start!109638 (and (array_inv!31613 _values!1445) e!740929)))

(declare-fun array_inv!31614 (array!86540) Bool)

(assert (=> start!109638 (array_inv!31614 _keys!1741)))

(assert (=> start!109638 tp!102499))

(declare-fun b!1298778 () Bool)

(declare-fun res!863162 () Bool)

(assert (=> b!1298778 (=> (not res!863162) (not e!740933))))

(assert (=> b!1298778 (= res!863162 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42321 _keys!1741))))))

(declare-fun mapNonEmpty!53711 () Bool)

(declare-fun tp!102500 () Bool)

(assert (=> mapNonEmpty!53711 (= mapRes!53711 (and tp!102500 e!740932))))

(declare-fun mapValue!53711 () ValueCell!16485)

(declare-fun mapKey!53711 () (_ BitVec 32))

(declare-fun mapRest!53711 () (Array (_ BitVec 32) ValueCell!16485))

(assert (=> mapNonEmpty!53711 (= (arr!41772 _values!1445) (store mapRest!53711 mapKey!53711 mapValue!53711))))

(declare-fun b!1298779 () Bool)

(declare-fun arrayContainsKey!0 (array!86540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1298779 (= e!740928 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(assert (=> b!1298779 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!580742 () Unit!43009)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!638 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 64) (_ BitVec 32) Int) Unit!43009)

(assert (=> b!1298779 (= lt!580742 (lemmaListMapContainsThenArrayContainsFrom!638 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1298780 () Bool)

(declare-fun e!740930 () Bool)

(assert (=> b!1298780 (= e!740930 tp_is_empty!34767)))

(declare-fun b!1298781 () Bool)

(assert (=> b!1298781 (= e!740929 (and e!740930 mapRes!53711))))

(declare-fun condMapEmpty!53711 () Bool)

(declare-fun mapDefault!53711 () ValueCell!16485)

(assert (=> b!1298781 (= condMapEmpty!53711 (= (arr!41772 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16485)) mapDefault!53711)))))

(declare-fun b!1298782 () Bool)

(declare-fun res!863158 () Bool)

(assert (=> b!1298782 (=> (not res!863158) (not e!740933))))

(assert (=> b!1298782 (= res!863158 (contains!8220 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109638 res!863163) b!1298774))

(assert (= (and b!1298774 res!863161) b!1298772))

(assert (= (and b!1298772 res!863157) b!1298773))

(assert (= (and b!1298773 res!863156) b!1298778))

(assert (= (and b!1298778 res!863162) b!1298782))

(assert (= (and b!1298782 res!863158) b!1298777))

(assert (= (and b!1298777 res!863160) b!1298776))

(assert (= (and b!1298776 (not res!863159)) b!1298779))

(assert (= (and b!1298781 condMapEmpty!53711) mapIsEmpty!53711))

(assert (= (and b!1298781 (not condMapEmpty!53711)) mapNonEmpty!53711))

(get-info :version)

(assert (= (and mapNonEmpty!53711 ((_ is ValueCellFull!16485) mapValue!53711)) b!1298775))

(assert (= (and b!1298781 ((_ is ValueCellFull!16485) mapDefault!53711)) b!1298780))

(assert (= start!109638 b!1298781))

(declare-fun m!1190057 () Bool)

(assert (=> start!109638 m!1190057))

(declare-fun m!1190059 () Bool)

(assert (=> start!109638 m!1190059))

(declare-fun m!1190061 () Bool)

(assert (=> start!109638 m!1190061))

(declare-fun m!1190063 () Bool)

(assert (=> mapNonEmpty!53711 m!1190063))

(declare-fun m!1190065 () Bool)

(assert (=> b!1298777 m!1190065))

(declare-fun m!1190067 () Bool)

(assert (=> b!1298779 m!1190067))

(declare-fun m!1190069 () Bool)

(assert (=> b!1298779 m!1190069))

(declare-fun m!1190071 () Bool)

(assert (=> b!1298779 m!1190071))

(declare-fun m!1190073 () Bool)

(assert (=> b!1298773 m!1190073))

(declare-fun m!1190075 () Bool)

(assert (=> b!1298782 m!1190075))

(assert (=> b!1298782 m!1190075))

(declare-fun m!1190077 () Bool)

(assert (=> b!1298782 m!1190077))

(declare-fun m!1190079 () Bool)

(assert (=> b!1298776 m!1190079))

(assert (=> b!1298776 m!1190079))

(declare-fun m!1190081 () Bool)

(assert (=> b!1298776 m!1190081))

(declare-fun m!1190083 () Bool)

(assert (=> b!1298776 m!1190083))

(declare-fun m!1190085 () Bool)

(assert (=> b!1298772 m!1190085))

(check-sat (not start!109638) (not b!1298776) (not b!1298772) b_and!47217 (not b!1298773) (not b!1298782) (not b_next!29127) (not b!1298779) tp_is_empty!34767 (not mapNonEmpty!53711))
(check-sat b_and!47217 (not b_next!29127))
(get-model)

(declare-fun d!141051 () Bool)

(declare-fun res!863192 () Bool)

(declare-fun e!740956 () Bool)

(assert (=> d!141051 (=> res!863192 e!740956)))

(assert (=> d!141051 (= res!863192 (= (select (arr!41771 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141051 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!740956)))

(declare-fun b!1298820 () Bool)

(declare-fun e!740957 () Bool)

(assert (=> b!1298820 (= e!740956 e!740957)))

(declare-fun res!863193 () Bool)

(assert (=> b!1298820 (=> (not res!863193) (not e!740957))))

(assert (=> b!1298820 (= res!863193 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42321 _keys!1741)))))

(declare-fun b!1298821 () Bool)

(assert (=> b!1298821 (= e!740957 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141051 (not res!863192)) b!1298820))

(assert (= (and b!1298820 res!863193) b!1298821))

(assert (=> d!141051 m!1190065))

(declare-fun m!1190117 () Bool)

(assert (=> b!1298821 m!1190117))

(assert (=> b!1298779 d!141051))

(declare-fun d!141053 () Bool)

(declare-fun res!863194 () Bool)

(declare-fun e!740958 () Bool)

(assert (=> d!141053 (=> res!863194 e!740958)))

(assert (=> d!141053 (= res!863194 (= (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!141053 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!740958)))

(declare-fun b!1298822 () Bool)

(declare-fun e!740959 () Bool)

(assert (=> b!1298822 (= e!740958 e!740959)))

(declare-fun res!863195 () Bool)

(assert (=> b!1298822 (=> (not res!863195) (not e!740959))))

(assert (=> b!1298822 (= res!863195 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!42321 _keys!1741)))))

(declare-fun b!1298823 () Bool)

(assert (=> b!1298823 (= e!740959 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141053 (not res!863194)) b!1298822))

(assert (= (and b!1298822 res!863195) b!1298823))

(declare-fun m!1190119 () Bool)

(assert (=> d!141053 m!1190119))

(declare-fun m!1190121 () Bool)

(assert (=> b!1298823 m!1190121))

(assert (=> b!1298779 d!141053))

(declare-fun d!141055 () Bool)

(declare-fun e!740962 () Bool)

(assert (=> d!141055 e!740962))

(declare-fun c!124417 () Bool)

(assert (=> d!141055 (= c!124417 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!580751 () Unit!43009)

(declare-fun choose!1901 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 64) (_ BitVec 32) Int) Unit!43009)

(assert (=> d!141055 (= lt!580751 (choose!1901 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!141055 (validMask!0 mask!2175)))

(assert (=> d!141055 (= (lemmaListMapContainsThenArrayContainsFrom!638 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!580751)))

(declare-fun b!1298828 () Bool)

(assert (=> b!1298828 (= e!740962 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1298829 () Bool)

(assert (=> b!1298829 (= e!740962 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!141055 c!124417) b!1298828))

(assert (= (and d!141055 (not c!124417)) b!1298829))

(declare-fun m!1190123 () Bool)

(assert (=> d!141055 m!1190123))

(assert (=> d!141055 m!1190057))

(assert (=> b!1298828 m!1190069))

(assert (=> b!1298779 d!141055))

(declare-fun b!1298840 () Bool)

(declare-fun e!740972 () Bool)

(declare-fun call!63512 () Bool)

(assert (=> b!1298840 (= e!740972 call!63512)))

(declare-fun b!1298841 () Bool)

(declare-fun e!740971 () Bool)

(declare-fun e!740974 () Bool)

(assert (=> b!1298841 (= e!740971 e!740974)))

(declare-fun res!863203 () Bool)

(assert (=> b!1298841 (=> (not res!863203) (not e!740974))))

(declare-fun e!740973 () Bool)

(assert (=> b!1298841 (= res!863203 (not e!740973))))

(declare-fun res!863204 () Bool)

(assert (=> b!1298841 (=> (not res!863204) (not e!740973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1298841 (= res!863204 (validKeyInArray!0 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1298842 () Bool)

(assert (=> b!1298842 (= e!740974 e!740972)))

(declare-fun c!124420 () Bool)

(assert (=> b!1298842 (= c!124420 (validKeyInArray!0 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63509 () Bool)

(assert (=> bm!63509 (= call!63512 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124420 (Cons!29641 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000) Nil!29642) Nil!29642)))))

(declare-fun d!141057 () Bool)

(declare-fun res!863202 () Bool)

(assert (=> d!141057 (=> res!863202 e!740971)))

(assert (=> d!141057 (= res!863202 (bvsge #b00000000000000000000000000000000 (size!42321 _keys!1741)))))

(assert (=> d!141057 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29642) e!740971)))

(declare-fun b!1298843 () Bool)

(declare-fun contains!8222 (List!29645 (_ BitVec 64)) Bool)

(assert (=> b!1298843 (= e!740973 (contains!8222 Nil!29642 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1298844 () Bool)

(assert (=> b!1298844 (= e!740972 call!63512)))

(assert (= (and d!141057 (not res!863202)) b!1298841))

(assert (= (and b!1298841 res!863204) b!1298843))

(assert (= (and b!1298841 res!863203) b!1298842))

(assert (= (and b!1298842 c!124420) b!1298840))

(assert (= (and b!1298842 (not c!124420)) b!1298844))

(assert (= (or b!1298840 b!1298844) bm!63509))

(declare-fun m!1190125 () Bool)

(assert (=> b!1298841 m!1190125))

(assert (=> b!1298841 m!1190125))

(declare-fun m!1190127 () Bool)

(assert (=> b!1298841 m!1190127))

(assert (=> b!1298842 m!1190125))

(assert (=> b!1298842 m!1190125))

(assert (=> b!1298842 m!1190127))

(assert (=> bm!63509 m!1190125))

(declare-fun m!1190129 () Bool)

(assert (=> bm!63509 m!1190129))

(assert (=> b!1298843 m!1190125))

(assert (=> b!1298843 m!1190125))

(declare-fun m!1190131 () Bool)

(assert (=> b!1298843 m!1190131))

(assert (=> b!1298773 d!141057))

(declare-fun d!141059 () Bool)

(declare-fun e!740980 () Bool)

(assert (=> d!141059 e!740980))

(declare-fun res!863207 () Bool)

(assert (=> d!141059 (=> res!863207 e!740980)))

(declare-fun lt!580760 () Bool)

(assert (=> d!141059 (= res!863207 (not lt!580760))))

(declare-fun lt!580761 () Bool)

(assert (=> d!141059 (= lt!580760 lt!580761)))

(declare-fun lt!580762 () Unit!43009)

(declare-fun e!740979 () Unit!43009)

(assert (=> d!141059 (= lt!580762 e!740979)))

(declare-fun c!124423 () Bool)

(assert (=> d!141059 (= c!124423 lt!580761)))

(declare-fun containsKey!717 (List!29646 (_ BitVec 64)) Bool)

(assert (=> d!141059 (= lt!580761 (containsKey!717 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141059 (= (contains!8220 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580760)))

(declare-fun b!1298851 () Bool)

(declare-fun lt!580763 () Unit!43009)

(assert (=> b!1298851 (= e!740979 lt!580763)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!463 (List!29646 (_ BitVec 64)) Unit!43009)

(assert (=> b!1298851 (= lt!580763 (lemmaContainsKeyImpliesGetValueByKeyDefined!463 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!747 0))(
  ( (Some!746 (v!20063 V!51459)) (None!745) )
))
(declare-fun isDefined!502 (Option!747) Bool)

(declare-fun getValueByKey!695 (List!29646 (_ BitVec 64)) Option!747)

(assert (=> b!1298851 (isDefined!502 (getValueByKey!695 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1298852 () Bool)

(declare-fun Unit!43013 () Unit!43009)

(assert (=> b!1298852 (= e!740979 Unit!43013)))

(declare-fun b!1298853 () Bool)

(assert (=> b!1298853 (= e!740980 (isDefined!502 (getValueByKey!695 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141059 c!124423) b!1298851))

(assert (= (and d!141059 (not c!124423)) b!1298852))

(assert (= (and d!141059 (not res!863207)) b!1298853))

(declare-fun m!1190133 () Bool)

(assert (=> d!141059 m!1190133))

(declare-fun m!1190135 () Bool)

(assert (=> b!1298851 m!1190135))

(declare-fun m!1190137 () Bool)

(assert (=> b!1298851 m!1190137))

(assert (=> b!1298851 m!1190137))

(declare-fun m!1190139 () Bool)

(assert (=> b!1298851 m!1190139))

(assert (=> b!1298853 m!1190137))

(assert (=> b!1298853 m!1190137))

(assert (=> b!1298853 m!1190139))

(assert (=> b!1298782 d!141059))

(declare-fun b!1298896 () Bool)

(declare-fun e!741014 () Unit!43009)

(declare-fun Unit!43014 () Unit!43009)

(assert (=> b!1298896 (= e!741014 Unit!43014)))

(declare-fun bm!63524 () Bool)

(declare-fun call!63531 () Bool)

(declare-fun lt!580828 () ListLongMap!20173)

(assert (=> bm!63524 (= call!63531 (contains!8220 lt!580828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298898 () Bool)

(declare-fun lt!580821 () Unit!43009)

(assert (=> b!1298898 (= e!741014 lt!580821)))

(declare-fun lt!580817 () ListLongMap!20173)

(declare-fun getCurrentListMapNoExtraKeys!6070 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 32) Int) ListLongMap!20173)

(assert (=> b!1298898 (= lt!580817 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580816 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580813 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580813 (select (arr!41771 _keys!1741) from!2144))))

(declare-fun lt!580820 () Unit!43009)

(declare-fun addStillContains!1100 (ListLongMap!20173 (_ BitVec 64) V!51459 (_ BitVec 64)) Unit!43009)

(assert (=> b!1298898 (= lt!580820 (addStillContains!1100 lt!580817 lt!580816 zeroValue!1387 lt!580813))))

(declare-fun +!4439 (ListLongMap!20173 tuple2!22516) ListLongMap!20173)

(assert (=> b!1298898 (contains!8220 (+!4439 lt!580817 (tuple2!22517 lt!580816 zeroValue!1387)) lt!580813)))

(declare-fun lt!580809 () Unit!43009)

(assert (=> b!1298898 (= lt!580809 lt!580820)))

(declare-fun lt!580814 () ListLongMap!20173)

(assert (=> b!1298898 (= lt!580814 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580826 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580811 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580811 (select (arr!41771 _keys!1741) from!2144))))

(declare-fun lt!580815 () Unit!43009)

(declare-fun addApplyDifferent!554 (ListLongMap!20173 (_ BitVec 64) V!51459 (_ BitVec 64)) Unit!43009)

(assert (=> b!1298898 (= lt!580815 (addApplyDifferent!554 lt!580814 lt!580826 minValue!1387 lt!580811))))

(declare-fun apply!1012 (ListLongMap!20173 (_ BitVec 64)) V!51459)

(assert (=> b!1298898 (= (apply!1012 (+!4439 lt!580814 (tuple2!22517 lt!580826 minValue!1387)) lt!580811) (apply!1012 lt!580814 lt!580811))))

(declare-fun lt!580818 () Unit!43009)

(assert (=> b!1298898 (= lt!580818 lt!580815)))

(declare-fun lt!580808 () ListLongMap!20173)

(assert (=> b!1298898 (= lt!580808 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580827 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580822 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580822 (select (arr!41771 _keys!1741) from!2144))))

(declare-fun lt!580825 () Unit!43009)

(assert (=> b!1298898 (= lt!580825 (addApplyDifferent!554 lt!580808 lt!580827 zeroValue!1387 lt!580822))))

(assert (=> b!1298898 (= (apply!1012 (+!4439 lt!580808 (tuple2!22517 lt!580827 zeroValue!1387)) lt!580822) (apply!1012 lt!580808 lt!580822))))

(declare-fun lt!580810 () Unit!43009)

(assert (=> b!1298898 (= lt!580810 lt!580825)))

(declare-fun lt!580823 () ListLongMap!20173)

(assert (=> b!1298898 (= lt!580823 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580819 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580819 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580812 () (_ BitVec 64))

(assert (=> b!1298898 (= lt!580812 (select (arr!41771 _keys!1741) from!2144))))

(assert (=> b!1298898 (= lt!580821 (addApplyDifferent!554 lt!580823 lt!580819 minValue!1387 lt!580812))))

(assert (=> b!1298898 (= (apply!1012 (+!4439 lt!580823 (tuple2!22517 lt!580819 minValue!1387)) lt!580812) (apply!1012 lt!580823 lt!580812))))

(declare-fun b!1298899 () Bool)

(declare-fun e!741015 () Bool)

(declare-fun e!741012 () Bool)

(assert (=> b!1298899 (= e!741015 e!741012)))

(declare-fun c!124439 () Bool)

(assert (=> b!1298899 (= c!124439 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63525 () Bool)

(declare-fun call!63532 () Bool)

(assert (=> bm!63525 (= call!63532 (contains!8220 lt!580828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298900 () Bool)

(declare-fun e!741008 () ListLongMap!20173)

(declare-fun e!741017 () ListLongMap!20173)

(assert (=> b!1298900 (= e!741008 e!741017)))

(declare-fun c!124438 () Bool)

(assert (=> b!1298900 (= c!124438 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63526 () Bool)

(declare-fun call!63530 () ListLongMap!20173)

(declare-fun call!63528 () ListLongMap!20173)

(assert (=> bm!63526 (= call!63530 call!63528)))

(declare-fun bm!63527 () Bool)

(declare-fun call!63527 () ListLongMap!20173)

(declare-fun call!63533 () ListLongMap!20173)

(assert (=> bm!63527 (= call!63527 call!63533)))

(declare-fun b!1298901 () Bool)

(declare-fun e!741018 () Bool)

(assert (=> b!1298901 (= e!741018 (validKeyInArray!0 (select (arr!41771 _keys!1741) from!2144)))))

(declare-fun b!1298902 () Bool)

(declare-fun e!741013 () Bool)

(assert (=> b!1298902 (= e!741013 (= (apply!1012 lt!580828 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1298903 () Bool)

(declare-fun e!741011 () Bool)

(assert (=> b!1298903 (= e!741011 (not call!63532))))

(declare-fun b!1298904 () Bool)

(declare-fun e!741009 () Bool)

(assert (=> b!1298904 (= e!741011 e!741009)))

(declare-fun res!863233 () Bool)

(assert (=> b!1298904 (= res!863233 call!63532)))

(assert (=> b!1298904 (=> (not res!863233) (not e!741009))))

(declare-fun bm!63528 () Bool)

(declare-fun c!124436 () Bool)

(declare-fun call!63529 () ListLongMap!20173)

(assert (=> bm!63528 (= call!63528 (+!4439 (ite c!124436 call!63533 (ite c!124438 call!63527 call!63529)) (ite (or c!124436 c!124438) (tuple2!22517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1298905 () Bool)

(declare-fun c!124437 () Bool)

(assert (=> b!1298905 (= c!124437 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741016 () ListLongMap!20173)

(assert (=> b!1298905 (= e!741017 e!741016)))

(declare-fun b!1298906 () Bool)

(declare-fun e!741007 () Bool)

(declare-fun get!21099 (ValueCell!16485 V!51459) V!51459)

(declare-fun dynLambda!3416 (Int (_ BitVec 64)) V!51459)

(assert (=> b!1298906 (= e!741007 (= (apply!1012 lt!580828 (select (arr!41771 _keys!1741) from!2144)) (get!21099 (select (arr!41772 _values!1445) from!2144) (dynLambda!3416 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1298906 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42322 _values!1445)))))

(assert (=> b!1298906 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42321 _keys!1741)))))

(declare-fun b!1298907 () Bool)

(assert (=> b!1298907 (= e!741008 (+!4439 call!63528 (tuple2!22517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63529 () Bool)

(assert (=> bm!63529 (= call!63529 call!63527)))

(declare-fun bm!63530 () Bool)

(assert (=> bm!63530 (= call!63533 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1298908 () Bool)

(declare-fun res!863229 () Bool)

(assert (=> b!1298908 (=> (not res!863229) (not e!741015))))

(declare-fun e!741010 () Bool)

(assert (=> b!1298908 (= res!863229 e!741010)))

(declare-fun res!863228 () Bool)

(assert (=> b!1298908 (=> res!863228 e!741010)))

(declare-fun e!741019 () Bool)

(assert (=> b!1298908 (= res!863228 (not e!741019))))

(declare-fun res!863232 () Bool)

(assert (=> b!1298908 (=> (not res!863232) (not e!741019))))

(assert (=> b!1298908 (= res!863232 (bvslt from!2144 (size!42321 _keys!1741)))))

(declare-fun b!1298909 () Bool)

(declare-fun res!863226 () Bool)

(assert (=> b!1298909 (=> (not res!863226) (not e!741015))))

(assert (=> b!1298909 (= res!863226 e!741011)))

(declare-fun c!124440 () Bool)

(assert (=> b!1298909 (= c!124440 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1298897 () Bool)

(assert (=> b!1298897 (= e!741010 e!741007)))

(declare-fun res!863234 () Bool)

(assert (=> b!1298897 (=> (not res!863234) (not e!741007))))

(assert (=> b!1298897 (= res!863234 (contains!8220 lt!580828 (select (arr!41771 _keys!1741) from!2144)))))

(assert (=> b!1298897 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42321 _keys!1741)))))

(declare-fun d!141061 () Bool)

(assert (=> d!141061 e!741015))

(declare-fun res!863230 () Bool)

(assert (=> d!141061 (=> (not res!863230) (not e!741015))))

(assert (=> d!141061 (= res!863230 (or (bvsge from!2144 (size!42321 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42321 _keys!1741)))))))

(declare-fun lt!580829 () ListLongMap!20173)

(assert (=> d!141061 (= lt!580828 lt!580829)))

(declare-fun lt!580824 () Unit!43009)

(assert (=> d!141061 (= lt!580824 e!741014)))

(declare-fun c!124441 () Bool)

(assert (=> d!141061 (= c!124441 e!741018)))

(declare-fun res!863231 () Bool)

(assert (=> d!141061 (=> (not res!863231) (not e!741018))))

(assert (=> d!141061 (= res!863231 (bvslt from!2144 (size!42321 _keys!1741)))))

(assert (=> d!141061 (= lt!580829 e!741008)))

(assert (=> d!141061 (= c!124436 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141061 (validMask!0 mask!2175)))

(assert (=> d!141061 (= (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580828)))

(declare-fun b!1298910 () Bool)

(assert (=> b!1298910 (= e!741009 (= (apply!1012 lt!580828 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1298911 () Bool)

(assert (=> b!1298911 (= e!741016 call!63530)))

(declare-fun b!1298912 () Bool)

(assert (=> b!1298912 (= e!741019 (validKeyInArray!0 (select (arr!41771 _keys!1741) from!2144)))))

(declare-fun b!1298913 () Bool)

(assert (=> b!1298913 (= e!741012 e!741013)))

(declare-fun res!863227 () Bool)

(assert (=> b!1298913 (= res!863227 call!63531)))

(assert (=> b!1298913 (=> (not res!863227) (not e!741013))))

(declare-fun b!1298914 () Bool)

(assert (=> b!1298914 (= e!741016 call!63529)))

(declare-fun b!1298915 () Bool)

(assert (=> b!1298915 (= e!741017 call!63530)))

(declare-fun b!1298916 () Bool)

(assert (=> b!1298916 (= e!741012 (not call!63531))))

(assert (= (and d!141061 c!124436) b!1298907))

(assert (= (and d!141061 (not c!124436)) b!1298900))

(assert (= (and b!1298900 c!124438) b!1298915))

(assert (= (and b!1298900 (not c!124438)) b!1298905))

(assert (= (and b!1298905 c!124437) b!1298911))

(assert (= (and b!1298905 (not c!124437)) b!1298914))

(assert (= (or b!1298911 b!1298914) bm!63529))

(assert (= (or b!1298915 bm!63529) bm!63527))

(assert (= (or b!1298915 b!1298911) bm!63526))

(assert (= (or b!1298907 bm!63527) bm!63530))

(assert (= (or b!1298907 bm!63526) bm!63528))

(assert (= (and d!141061 res!863231) b!1298901))

(assert (= (and d!141061 c!124441) b!1298898))

(assert (= (and d!141061 (not c!124441)) b!1298896))

(assert (= (and d!141061 res!863230) b!1298908))

(assert (= (and b!1298908 res!863232) b!1298912))

(assert (= (and b!1298908 (not res!863228)) b!1298897))

(assert (= (and b!1298897 res!863234) b!1298906))

(assert (= (and b!1298908 res!863229) b!1298909))

(assert (= (and b!1298909 c!124440) b!1298904))

(assert (= (and b!1298909 (not c!124440)) b!1298903))

(assert (= (and b!1298904 res!863233) b!1298910))

(assert (= (or b!1298904 b!1298903) bm!63525))

(assert (= (and b!1298909 res!863226) b!1298899))

(assert (= (and b!1298899 c!124439) b!1298913))

(assert (= (and b!1298899 (not c!124439)) b!1298916))

(assert (= (and b!1298913 res!863227) b!1298902))

(assert (= (or b!1298913 b!1298916) bm!63524))

(declare-fun b_lambda!23137 () Bool)

(assert (=> (not b_lambda!23137) (not b!1298906)))

(declare-fun t!43214 () Bool)

(declare-fun tb!11369 () Bool)

(assert (=> (and start!109638 (= defaultEntry!1448 defaultEntry!1448) t!43214) tb!11369))

(declare-fun result!23739 () Bool)

(assert (=> tb!11369 (= result!23739 tp_is_empty!34767)))

(assert (=> b!1298906 t!43214))

(declare-fun b_and!47221 () Bool)

(assert (= b_and!47217 (and (=> t!43214 result!23739) b_and!47221)))

(declare-fun m!1190141 () Bool)

(assert (=> b!1298898 m!1190141))

(declare-fun m!1190143 () Bool)

(assert (=> b!1298898 m!1190143))

(declare-fun m!1190145 () Bool)

(assert (=> b!1298898 m!1190145))

(declare-fun m!1190147 () Bool)

(assert (=> b!1298898 m!1190147))

(declare-fun m!1190149 () Bool)

(assert (=> b!1298898 m!1190149))

(declare-fun m!1190151 () Bool)

(assert (=> b!1298898 m!1190151))

(declare-fun m!1190153 () Bool)

(assert (=> b!1298898 m!1190153))

(assert (=> b!1298898 m!1190065))

(declare-fun m!1190155 () Bool)

(assert (=> b!1298898 m!1190155))

(declare-fun m!1190157 () Bool)

(assert (=> b!1298898 m!1190157))

(declare-fun m!1190159 () Bool)

(assert (=> b!1298898 m!1190159))

(declare-fun m!1190161 () Bool)

(assert (=> b!1298898 m!1190161))

(declare-fun m!1190163 () Bool)

(assert (=> b!1298898 m!1190163))

(declare-fun m!1190165 () Bool)

(assert (=> b!1298898 m!1190165))

(assert (=> b!1298898 m!1190159))

(assert (=> b!1298898 m!1190141))

(assert (=> b!1298898 m!1190147))

(declare-fun m!1190167 () Bool)

(assert (=> b!1298898 m!1190167))

(assert (=> b!1298898 m!1190155))

(declare-fun m!1190169 () Bool)

(assert (=> b!1298898 m!1190169))

(declare-fun m!1190171 () Bool)

(assert (=> b!1298898 m!1190171))

(declare-fun m!1190173 () Bool)

(assert (=> b!1298906 m!1190173))

(assert (=> b!1298906 m!1190065))

(declare-fun m!1190175 () Bool)

(assert (=> b!1298906 m!1190175))

(declare-fun m!1190177 () Bool)

(assert (=> b!1298906 m!1190177))

(assert (=> b!1298906 m!1190173))

(declare-fun m!1190179 () Bool)

(assert (=> b!1298906 m!1190179))

(assert (=> b!1298906 m!1190177))

(assert (=> b!1298906 m!1190065))

(declare-fun m!1190181 () Bool)

(assert (=> bm!63528 m!1190181))

(assert (=> b!1298912 m!1190065))

(assert (=> b!1298912 m!1190065))

(declare-fun m!1190183 () Bool)

(assert (=> b!1298912 m!1190183))

(declare-fun m!1190185 () Bool)

(assert (=> b!1298902 m!1190185))

(assert (=> b!1298901 m!1190065))

(assert (=> b!1298901 m!1190065))

(assert (=> b!1298901 m!1190183))

(assert (=> bm!63530 m!1190145))

(declare-fun m!1190187 () Bool)

(assert (=> b!1298910 m!1190187))

(assert (=> b!1298897 m!1190065))

(assert (=> b!1298897 m!1190065))

(declare-fun m!1190189 () Bool)

(assert (=> b!1298897 m!1190189))

(declare-fun m!1190191 () Bool)

(assert (=> bm!63525 m!1190191))

(declare-fun m!1190193 () Bool)

(assert (=> b!1298907 m!1190193))

(declare-fun m!1190195 () Bool)

(assert (=> bm!63524 m!1190195))

(assert (=> d!141061 m!1190057))

(assert (=> b!1298782 d!141061))

(declare-fun d!141063 () Bool)

(declare-fun e!741021 () Bool)

(assert (=> d!141063 e!741021))

(declare-fun res!863235 () Bool)

(assert (=> d!141063 (=> res!863235 e!741021)))

(declare-fun lt!580830 () Bool)

(assert (=> d!141063 (= res!863235 (not lt!580830))))

(declare-fun lt!580831 () Bool)

(assert (=> d!141063 (= lt!580830 lt!580831)))

(declare-fun lt!580832 () Unit!43009)

(declare-fun e!741020 () Unit!43009)

(assert (=> d!141063 (= lt!580832 e!741020)))

(declare-fun c!124442 () Bool)

(assert (=> d!141063 (= c!124442 lt!580831)))

(assert (=> d!141063 (= lt!580831 (containsKey!717 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!141063 (= (contains!8220 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!580830)))

(declare-fun b!1298919 () Bool)

(declare-fun lt!580833 () Unit!43009)

(assert (=> b!1298919 (= e!741020 lt!580833)))

(assert (=> b!1298919 (= lt!580833 (lemmaContainsKeyImpliesGetValueByKeyDefined!463 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> b!1298919 (isDefined!502 (getValueByKey!695 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1298920 () Bool)

(declare-fun Unit!43015 () Unit!43009)

(assert (=> b!1298920 (= e!741020 Unit!43015)))

(declare-fun b!1298921 () Bool)

(assert (=> b!1298921 (= e!741021 (isDefined!502 (getValueByKey!695 (toList!10102 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141063 c!124442) b!1298919))

(assert (= (and d!141063 (not c!124442)) b!1298920))

(assert (= (and d!141063 (not res!863235)) b!1298921))

(declare-fun m!1190197 () Bool)

(assert (=> d!141063 m!1190197))

(declare-fun m!1190199 () Bool)

(assert (=> b!1298919 m!1190199))

(declare-fun m!1190201 () Bool)

(assert (=> b!1298919 m!1190201))

(assert (=> b!1298919 m!1190201))

(declare-fun m!1190203 () Bool)

(assert (=> b!1298919 m!1190203))

(assert (=> b!1298921 m!1190201))

(assert (=> b!1298921 m!1190201))

(assert (=> b!1298921 m!1190203))

(assert (=> b!1298776 d!141063))

(declare-fun b!1298922 () Bool)

(declare-fun e!741029 () Unit!43009)

(declare-fun Unit!43016 () Unit!43009)

(assert (=> b!1298922 (= e!741029 Unit!43016)))

(declare-fun bm!63531 () Bool)

(declare-fun call!63538 () Bool)

(declare-fun lt!580854 () ListLongMap!20173)

(assert (=> bm!63531 (= call!63538 (contains!8220 lt!580854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298924 () Bool)

(declare-fun lt!580847 () Unit!43009)

(assert (=> b!1298924 (= e!741029 lt!580847)))

(declare-fun lt!580843 () ListLongMap!20173)

(assert (=> b!1298924 (= lt!580843 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580842 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580839 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580839 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580846 () Unit!43009)

(assert (=> b!1298924 (= lt!580846 (addStillContains!1100 lt!580843 lt!580842 zeroValue!1387 lt!580839))))

(assert (=> b!1298924 (contains!8220 (+!4439 lt!580843 (tuple2!22517 lt!580842 zeroValue!1387)) lt!580839)))

(declare-fun lt!580835 () Unit!43009)

(assert (=> b!1298924 (= lt!580835 lt!580846)))

(declare-fun lt!580840 () ListLongMap!20173)

(assert (=> b!1298924 (= lt!580840 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580852 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580837 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580837 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580841 () Unit!43009)

(assert (=> b!1298924 (= lt!580841 (addApplyDifferent!554 lt!580840 lt!580852 minValue!1387 lt!580837))))

(assert (=> b!1298924 (= (apply!1012 (+!4439 lt!580840 (tuple2!22517 lt!580852 minValue!1387)) lt!580837) (apply!1012 lt!580840 lt!580837))))

(declare-fun lt!580844 () Unit!43009)

(assert (=> b!1298924 (= lt!580844 lt!580841)))

(declare-fun lt!580834 () ListLongMap!20173)

(assert (=> b!1298924 (= lt!580834 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580853 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580848 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580848 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580851 () Unit!43009)

(assert (=> b!1298924 (= lt!580851 (addApplyDifferent!554 lt!580834 lt!580853 zeroValue!1387 lt!580848))))

(assert (=> b!1298924 (= (apply!1012 (+!4439 lt!580834 (tuple2!22517 lt!580853 zeroValue!1387)) lt!580848) (apply!1012 lt!580834 lt!580848))))

(declare-fun lt!580836 () Unit!43009)

(assert (=> b!1298924 (= lt!580836 lt!580851)))

(declare-fun lt!580849 () ListLongMap!20173)

(assert (=> b!1298924 (= lt!580849 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580845 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580845 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580838 () (_ BitVec 64))

(assert (=> b!1298924 (= lt!580838 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1298924 (= lt!580847 (addApplyDifferent!554 lt!580849 lt!580845 minValue!1387 lt!580838))))

(assert (=> b!1298924 (= (apply!1012 (+!4439 lt!580849 (tuple2!22517 lt!580845 minValue!1387)) lt!580838) (apply!1012 lt!580849 lt!580838))))

(declare-fun b!1298925 () Bool)

(declare-fun e!741030 () Bool)

(declare-fun e!741027 () Bool)

(assert (=> b!1298925 (= e!741030 e!741027)))

(declare-fun c!124446 () Bool)

(assert (=> b!1298925 (= c!124446 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63532 () Bool)

(declare-fun call!63539 () Bool)

(assert (=> bm!63532 (= call!63539 (contains!8220 lt!580854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298926 () Bool)

(declare-fun e!741023 () ListLongMap!20173)

(declare-fun e!741032 () ListLongMap!20173)

(assert (=> b!1298926 (= e!741023 e!741032)))

(declare-fun c!124445 () Bool)

(assert (=> b!1298926 (= c!124445 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63533 () Bool)

(declare-fun call!63537 () ListLongMap!20173)

(declare-fun call!63535 () ListLongMap!20173)

(assert (=> bm!63533 (= call!63537 call!63535)))

(declare-fun bm!63534 () Bool)

(declare-fun call!63534 () ListLongMap!20173)

(declare-fun call!63540 () ListLongMap!20173)

(assert (=> bm!63534 (= call!63534 call!63540)))

(declare-fun b!1298927 () Bool)

(declare-fun e!741033 () Bool)

(assert (=> b!1298927 (= e!741033 (validKeyInArray!0 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1298928 () Bool)

(declare-fun e!741028 () Bool)

(assert (=> b!1298928 (= e!741028 (= (apply!1012 lt!580854 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1298929 () Bool)

(declare-fun e!741026 () Bool)

(assert (=> b!1298929 (= e!741026 (not call!63539))))

(declare-fun b!1298930 () Bool)

(declare-fun e!741024 () Bool)

(assert (=> b!1298930 (= e!741026 e!741024)))

(declare-fun res!863243 () Bool)

(assert (=> b!1298930 (= res!863243 call!63539)))

(assert (=> b!1298930 (=> (not res!863243) (not e!741024))))

(declare-fun bm!63535 () Bool)

(declare-fun c!124443 () Bool)

(declare-fun call!63536 () ListLongMap!20173)

(assert (=> bm!63535 (= call!63535 (+!4439 (ite c!124443 call!63540 (ite c!124445 call!63534 call!63536)) (ite (or c!124443 c!124445) (tuple2!22517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1298931 () Bool)

(declare-fun c!124444 () Bool)

(assert (=> b!1298931 (= c!124444 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741031 () ListLongMap!20173)

(assert (=> b!1298931 (= e!741032 e!741031)))

(declare-fun e!741022 () Bool)

(declare-fun b!1298932 () Bool)

(assert (=> b!1298932 (= e!741022 (= (apply!1012 lt!580854 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!21099 (select (arr!41772 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3416 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1298932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42322 _values!1445)))))

(assert (=> b!1298932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)))))

(declare-fun b!1298933 () Bool)

(assert (=> b!1298933 (= e!741023 (+!4439 call!63535 (tuple2!22517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63536 () Bool)

(assert (=> bm!63536 (= call!63536 call!63534)))

(declare-fun bm!63537 () Bool)

(assert (=> bm!63537 (= call!63540 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1298934 () Bool)

(declare-fun res!863239 () Bool)

(assert (=> b!1298934 (=> (not res!863239) (not e!741030))))

(declare-fun e!741025 () Bool)

(assert (=> b!1298934 (= res!863239 e!741025)))

(declare-fun res!863238 () Bool)

(assert (=> b!1298934 (=> res!863238 e!741025)))

(declare-fun e!741034 () Bool)

(assert (=> b!1298934 (= res!863238 (not e!741034))))

(declare-fun res!863242 () Bool)

(assert (=> b!1298934 (=> (not res!863242) (not e!741034))))

(assert (=> b!1298934 (= res!863242 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)))))

(declare-fun b!1298935 () Bool)

(declare-fun res!863236 () Bool)

(assert (=> b!1298935 (=> (not res!863236) (not e!741030))))

(assert (=> b!1298935 (= res!863236 e!741026)))

(declare-fun c!124447 () Bool)

(assert (=> b!1298935 (= c!124447 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1298923 () Bool)

(assert (=> b!1298923 (= e!741025 e!741022)))

(declare-fun res!863244 () Bool)

(assert (=> b!1298923 (=> (not res!863244) (not e!741022))))

(assert (=> b!1298923 (= res!863244 (contains!8220 lt!580854 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1298923 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)))))

(declare-fun d!141065 () Bool)

(assert (=> d!141065 e!741030))

(declare-fun res!863240 () Bool)

(assert (=> d!141065 (=> (not res!863240) (not e!741030))))

(assert (=> d!141065 (= res!863240 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)))))))

(declare-fun lt!580855 () ListLongMap!20173)

(assert (=> d!141065 (= lt!580854 lt!580855)))

(declare-fun lt!580850 () Unit!43009)

(assert (=> d!141065 (= lt!580850 e!741029)))

(declare-fun c!124448 () Bool)

(assert (=> d!141065 (= c!124448 e!741033)))

(declare-fun res!863241 () Bool)

(assert (=> d!141065 (=> (not res!863241) (not e!741033))))

(assert (=> d!141065 (= res!863241 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42321 _keys!1741)))))

(assert (=> d!141065 (= lt!580855 e!741023)))

(assert (=> d!141065 (= c!124443 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141065 (validMask!0 mask!2175)))

(assert (=> d!141065 (= (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!580854)))

(declare-fun b!1298936 () Bool)

(assert (=> b!1298936 (= e!741024 (= (apply!1012 lt!580854 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1298937 () Bool)

(assert (=> b!1298937 (= e!741031 call!63537)))

(declare-fun b!1298938 () Bool)

(assert (=> b!1298938 (= e!741034 (validKeyInArray!0 (select (arr!41771 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1298939 () Bool)

(assert (=> b!1298939 (= e!741027 e!741028)))

(declare-fun res!863237 () Bool)

(assert (=> b!1298939 (= res!863237 call!63538)))

(assert (=> b!1298939 (=> (not res!863237) (not e!741028))))

(declare-fun b!1298940 () Bool)

(assert (=> b!1298940 (= e!741031 call!63536)))

(declare-fun b!1298941 () Bool)

(assert (=> b!1298941 (= e!741032 call!63537)))

(declare-fun b!1298942 () Bool)

(assert (=> b!1298942 (= e!741027 (not call!63538))))

(assert (= (and d!141065 c!124443) b!1298933))

(assert (= (and d!141065 (not c!124443)) b!1298926))

(assert (= (and b!1298926 c!124445) b!1298941))

(assert (= (and b!1298926 (not c!124445)) b!1298931))

(assert (= (and b!1298931 c!124444) b!1298937))

(assert (= (and b!1298931 (not c!124444)) b!1298940))

(assert (= (or b!1298937 b!1298940) bm!63536))

(assert (= (or b!1298941 bm!63536) bm!63534))

(assert (= (or b!1298941 b!1298937) bm!63533))

(assert (= (or b!1298933 bm!63534) bm!63537))

(assert (= (or b!1298933 bm!63533) bm!63535))

(assert (= (and d!141065 res!863241) b!1298927))

(assert (= (and d!141065 c!124448) b!1298924))

(assert (= (and d!141065 (not c!124448)) b!1298922))

(assert (= (and d!141065 res!863240) b!1298934))

(assert (= (and b!1298934 res!863242) b!1298938))

(assert (= (and b!1298934 (not res!863238)) b!1298923))

(assert (= (and b!1298923 res!863244) b!1298932))

(assert (= (and b!1298934 res!863239) b!1298935))

(assert (= (and b!1298935 c!124447) b!1298930))

(assert (= (and b!1298935 (not c!124447)) b!1298929))

(assert (= (and b!1298930 res!863243) b!1298936))

(assert (= (or b!1298930 b!1298929) bm!63532))

(assert (= (and b!1298935 res!863236) b!1298925))

(assert (= (and b!1298925 c!124446) b!1298939))

(assert (= (and b!1298925 (not c!124446)) b!1298942))

(assert (= (and b!1298939 res!863237) b!1298928))

(assert (= (or b!1298939 b!1298942) bm!63531))

(declare-fun b_lambda!23139 () Bool)

(assert (=> (not b_lambda!23139) (not b!1298932)))

(assert (=> b!1298932 t!43214))

(declare-fun b_and!47223 () Bool)

(assert (= b_and!47221 (and (=> t!43214 result!23739) b_and!47223)))

(declare-fun m!1190205 () Bool)

(assert (=> b!1298924 m!1190205))

(declare-fun m!1190207 () Bool)

(assert (=> b!1298924 m!1190207))

(declare-fun m!1190209 () Bool)

(assert (=> b!1298924 m!1190209))

(declare-fun m!1190211 () Bool)

(assert (=> b!1298924 m!1190211))

(declare-fun m!1190213 () Bool)

(assert (=> b!1298924 m!1190213))

(declare-fun m!1190215 () Bool)

(assert (=> b!1298924 m!1190215))

(declare-fun m!1190217 () Bool)

(assert (=> b!1298924 m!1190217))

(assert (=> b!1298924 m!1190119))

(declare-fun m!1190219 () Bool)

(assert (=> b!1298924 m!1190219))

(declare-fun m!1190221 () Bool)

(assert (=> b!1298924 m!1190221))

(declare-fun m!1190223 () Bool)

(assert (=> b!1298924 m!1190223))

(declare-fun m!1190225 () Bool)

(assert (=> b!1298924 m!1190225))

(declare-fun m!1190227 () Bool)

(assert (=> b!1298924 m!1190227))

(declare-fun m!1190229 () Bool)

(assert (=> b!1298924 m!1190229))

(assert (=> b!1298924 m!1190223))

(assert (=> b!1298924 m!1190205))

(assert (=> b!1298924 m!1190211))

(declare-fun m!1190231 () Bool)

(assert (=> b!1298924 m!1190231))

(assert (=> b!1298924 m!1190219))

(declare-fun m!1190233 () Bool)

(assert (=> b!1298924 m!1190233))

(declare-fun m!1190235 () Bool)

(assert (=> b!1298924 m!1190235))

(assert (=> b!1298932 m!1190173))

(assert (=> b!1298932 m!1190119))

(declare-fun m!1190237 () Bool)

(assert (=> b!1298932 m!1190237))

(declare-fun m!1190239 () Bool)

(assert (=> b!1298932 m!1190239))

(assert (=> b!1298932 m!1190173))

(declare-fun m!1190241 () Bool)

(assert (=> b!1298932 m!1190241))

(assert (=> b!1298932 m!1190239))

(assert (=> b!1298932 m!1190119))

(declare-fun m!1190243 () Bool)

(assert (=> bm!63535 m!1190243))

(assert (=> b!1298938 m!1190119))

(assert (=> b!1298938 m!1190119))

(declare-fun m!1190245 () Bool)

(assert (=> b!1298938 m!1190245))

(declare-fun m!1190247 () Bool)

(assert (=> b!1298928 m!1190247))

(assert (=> b!1298927 m!1190119))

(assert (=> b!1298927 m!1190119))

(assert (=> b!1298927 m!1190245))

(assert (=> bm!63537 m!1190209))

(declare-fun m!1190249 () Bool)

(assert (=> b!1298936 m!1190249))

(assert (=> b!1298923 m!1190119))

(assert (=> b!1298923 m!1190119))

(declare-fun m!1190251 () Bool)

(assert (=> b!1298923 m!1190251))

(declare-fun m!1190253 () Bool)

(assert (=> bm!63532 m!1190253))

(declare-fun m!1190255 () Bool)

(assert (=> b!1298933 m!1190255))

(declare-fun m!1190257 () Bool)

(assert (=> bm!63531 m!1190257))

(assert (=> d!141065 m!1190057))

(assert (=> b!1298776 d!141065))

(declare-fun d!141067 () Bool)

(assert (=> d!141067 (contains!8220 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!580858 () Unit!43009)

(declare-fun choose!1902 (array!86540 array!86542 (_ BitVec 32) (_ BitVec 32) V!51459 V!51459 (_ BitVec 64) (_ BitVec 32) Int) Unit!43009)

(assert (=> d!141067 (= lt!580858 (choose!1902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!141067 (validMask!0 mask!2175)))

(assert (=> d!141067 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!57 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!580858)))

(declare-fun bs!37003 () Bool)

(assert (= bs!37003 d!141067))

(declare-fun m!1190259 () Bool)

(assert (=> bs!37003 m!1190259))

(assert (=> bs!37003 m!1190259))

(declare-fun m!1190261 () Bool)

(assert (=> bs!37003 m!1190261))

(declare-fun m!1190263 () Bool)

(assert (=> bs!37003 m!1190263))

(assert (=> bs!37003 m!1190057))

(assert (=> b!1298776 d!141067))

(declare-fun d!141069 () Bool)

(declare-fun res!863249 () Bool)

(declare-fun e!741041 () Bool)

(assert (=> d!141069 (=> res!863249 e!741041)))

(assert (=> d!141069 (= res!863249 (bvsge #b00000000000000000000000000000000 (size!42321 _keys!1741)))))

(assert (=> d!141069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741041)))

(declare-fun b!1298951 () Bool)

(declare-fun e!741043 () Bool)

(declare-fun call!63543 () Bool)

(assert (=> b!1298951 (= e!741043 call!63543)))

(declare-fun bm!63540 () Bool)

(assert (=> bm!63540 (= call!63543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1298952 () Bool)

(assert (=> b!1298952 (= e!741041 e!741043)))

(declare-fun c!124451 () Bool)

(assert (=> b!1298952 (= c!124451 (validKeyInArray!0 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1298953 () Bool)

(declare-fun e!741042 () Bool)

(assert (=> b!1298953 (= e!741042 call!63543)))

(declare-fun b!1298954 () Bool)

(assert (=> b!1298954 (= e!741043 e!741042)))

(declare-fun lt!580867 () (_ BitVec 64))

(assert (=> b!1298954 (= lt!580867 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!580866 () Unit!43009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86540 (_ BitVec 64) (_ BitVec 32)) Unit!43009)

(assert (=> b!1298954 (= lt!580866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580867 #b00000000000000000000000000000000))))

(assert (=> b!1298954 (arrayContainsKey!0 _keys!1741 lt!580867 #b00000000000000000000000000000000)))

(declare-fun lt!580865 () Unit!43009)

(assert (=> b!1298954 (= lt!580865 lt!580866)))

(declare-fun res!863250 () Bool)

(declare-datatypes ((SeekEntryResult!10015 0))(
  ( (MissingZero!10015 (index!42431 (_ BitVec 32))) (Found!10015 (index!42432 (_ BitVec 32))) (Intermediate!10015 (undefined!10827 Bool) (index!42433 (_ BitVec 32)) (x!115383 (_ BitVec 32))) (Undefined!10015) (MissingVacant!10015 (index!42434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86540 (_ BitVec 32)) SeekEntryResult!10015)

(assert (=> b!1298954 (= res!863250 (= (seekEntryOrOpen!0 (select (arr!41771 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10015 #b00000000000000000000000000000000)))))

(assert (=> b!1298954 (=> (not res!863250) (not e!741042))))

(assert (= (and d!141069 (not res!863249)) b!1298952))

(assert (= (and b!1298952 c!124451) b!1298954))

(assert (= (and b!1298952 (not c!124451)) b!1298951))

(assert (= (and b!1298954 res!863250) b!1298953))

(assert (= (or b!1298953 b!1298951) bm!63540))

(declare-fun m!1190265 () Bool)

(assert (=> bm!63540 m!1190265))

(assert (=> b!1298952 m!1190125))

(assert (=> b!1298952 m!1190125))

(assert (=> b!1298952 m!1190127))

(assert (=> b!1298954 m!1190125))

(declare-fun m!1190267 () Bool)

(assert (=> b!1298954 m!1190267))

(declare-fun m!1190269 () Bool)

(assert (=> b!1298954 m!1190269))

(assert (=> b!1298954 m!1190125))

(declare-fun m!1190271 () Bool)

(assert (=> b!1298954 m!1190271))

(assert (=> b!1298772 d!141069))

(declare-fun d!141071 () Bool)

(assert (=> d!141071 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109638 d!141071))

(declare-fun d!141073 () Bool)

(assert (=> d!141073 (= (array_inv!31613 _values!1445) (bvsge (size!42322 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109638 d!141073))

(declare-fun d!141075 () Bool)

(assert (=> d!141075 (= (array_inv!31614 _keys!1741) (bvsge (size!42321 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109638 d!141075))

(declare-fun mapIsEmpty!53717 () Bool)

(declare-fun mapRes!53717 () Bool)

(assert (=> mapIsEmpty!53717 mapRes!53717))

(declare-fun mapNonEmpty!53717 () Bool)

(declare-fun tp!102509 () Bool)

(declare-fun e!741049 () Bool)

(assert (=> mapNonEmpty!53717 (= mapRes!53717 (and tp!102509 e!741049))))

(declare-fun mapKey!53717 () (_ BitVec 32))

(declare-fun mapValue!53717 () ValueCell!16485)

(declare-fun mapRest!53717 () (Array (_ BitVec 32) ValueCell!16485))

(assert (=> mapNonEmpty!53717 (= mapRest!53711 (store mapRest!53717 mapKey!53717 mapValue!53717))))

(declare-fun b!1298962 () Bool)

(declare-fun e!741048 () Bool)

(assert (=> b!1298962 (= e!741048 tp_is_empty!34767)))

(declare-fun b!1298961 () Bool)

(assert (=> b!1298961 (= e!741049 tp_is_empty!34767)))

(declare-fun condMapEmpty!53717 () Bool)

(declare-fun mapDefault!53717 () ValueCell!16485)

(assert (=> mapNonEmpty!53711 (= condMapEmpty!53717 (= mapRest!53711 ((as const (Array (_ BitVec 32) ValueCell!16485)) mapDefault!53717)))))

(assert (=> mapNonEmpty!53711 (= tp!102500 (and e!741048 mapRes!53717))))

(assert (= (and mapNonEmpty!53711 condMapEmpty!53717) mapIsEmpty!53717))

(assert (= (and mapNonEmpty!53711 (not condMapEmpty!53717)) mapNonEmpty!53717))

(assert (= (and mapNonEmpty!53717 ((_ is ValueCellFull!16485) mapValue!53717)) b!1298961))

(assert (= (and mapNonEmpty!53711 ((_ is ValueCellFull!16485) mapDefault!53717)) b!1298962))

(declare-fun m!1190273 () Bool)

(assert (=> mapNonEmpty!53717 m!1190273))

(declare-fun b_lambda!23141 () Bool)

(assert (= b_lambda!23137 (or (and start!109638 b_free!29127) b_lambda!23141)))

(declare-fun b_lambda!23143 () Bool)

(assert (= b_lambda!23139 (or (and start!109638 b_free!29127) b_lambda!23143)))

(check-sat (not bm!63528) (not b!1298853) (not b!1298897) (not b!1298898) (not b!1298921) (not d!141055) (not b!1298927) (not b!1298932) (not bm!63537) (not bm!63530) (not b!1298842) (not b!1298823) (not d!141059) (not b!1298851) (not b!1298933) (not b!1298928) (not b!1298902) (not b!1298841) (not b_next!29127) (not b!1298843) (not bm!63532) (not b!1298906) (not d!141061) (not d!141065) (not bm!63525) (not b!1298821) (not b_lambda!23143) (not bm!63540) (not bm!63535) (not b!1298828) (not bm!63531) (not d!141067) tp_is_empty!34767 (not b_lambda!23141) (not b!1298912) (not b!1298954) (not b!1298952) (not bm!63524) b_and!47223 (not bm!63509) (not b!1298910) (not b!1298938) (not b!1298907) (not b!1298936) (not b!1298923) (not b!1298924) (not b!1298919) (not mapNonEmpty!53717) (not b!1298901) (not d!141063))
(check-sat b_and!47223 (not b_next!29127))
