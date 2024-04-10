; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108918 () Bool)

(assert start!108918)

(declare-fun b_free!28431 () Bool)

(declare-fun b_next!28431 () Bool)

(assert (=> start!108918 (= b_free!28431 (not b_next!28431))))

(declare-fun tp!100408 () Bool)

(declare-fun b_and!46515 () Bool)

(assert (=> start!108918 (= tp!100408 b_and!46515)))

(declare-fun b!1286897 () Bool)

(declare-fun res!854753 () Bool)

(declare-fun e!734975 () Bool)

(assert (=> b!1286897 (=> (not res!854753) (not e!734975))))

(declare-datatypes ((array!85190 0))(
  ( (array!85191 (arr!41097 (Array (_ BitVec 32) (_ BitVec 64))) (size!41647 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85190)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286897 (= res!854753 (validKeyInArray!0 (select (arr!41097 _keys!1741) from!2144)))))

(declare-fun bm!63075 () Bool)

(declare-datatypes ((Unit!42551 0))(
  ( (Unit!42552) )
))
(declare-fun call!63079 () Unit!42551)

(declare-fun call!63080 () Unit!42551)

(assert (=> bm!63075 (= call!63079 call!63080)))

(declare-datatypes ((V!50531 0))(
  ( (V!50532 (val!17110 Int)) )
))
(declare-fun minValue!1387 () V!50531)

(declare-fun zeroValue!1387 () V!50531)

(declare-datatypes ((ValueCell!16137 0))(
  ( (ValueCellFull!16137 (v!19712 V!50531)) (EmptyCell!16137) )
))
(declare-datatypes ((array!85192 0))(
  ( (array!85193 (arr!41098 (Array (_ BitVec 32) ValueCell!16137)) (size!41648 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85192)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun bm!63076 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21944 0))(
  ( (tuple2!21945 (_1!10983 (_ BitVec 64)) (_2!10983 V!50531)) )
))
(declare-datatypes ((List!29128 0))(
  ( (Nil!29125) (Cons!29124 (h!30333 tuple2!21944) (t!42690 List!29128)) )
))
(declare-datatypes ((ListLongMap!19601 0))(
  ( (ListLongMap!19602 (toList!9816 List!29128)) )
))
(declare-fun call!63078 () ListLongMap!19601)

(declare-fun getCurrentListMapNoExtraKeys!5949 (array!85190 array!85192 (_ BitVec 32) (_ BitVec 32) V!50531 V!50531 (_ BitVec 32) Int) ListLongMap!19601)

(assert (=> bm!63076 (= call!63078 (getCurrentListMapNoExtraKeys!5949 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52664 () Bool)

(declare-fun mapRes!52664 () Bool)

(declare-fun tp!100409 () Bool)

(declare-fun e!734969 () Bool)

(assert (=> mapNonEmpty!52664 (= mapRes!52664 (and tp!100409 e!734969))))

(declare-fun mapKey!52664 () (_ BitVec 32))

(declare-fun mapRest!52664 () (Array (_ BitVec 32) ValueCell!16137))

(declare-fun mapValue!52664 () ValueCell!16137)

(assert (=> mapNonEmpty!52664 (= (arr!41098 _values!1445) (store mapRest!52664 mapKey!52664 mapValue!52664))))

(declare-fun lt!577575 () ListLongMap!19601)

(declare-fun lt!577574 () ListLongMap!19601)

(declare-fun c!124253 () Bool)

(declare-fun lt!577570 () ListLongMap!19601)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun bm!63077 () Bool)

(declare-fun c!124255 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!37 ((_ BitVec 64) (_ BitVec 64) V!50531 ListLongMap!19601) Unit!42551)

(assert (=> bm!63077 (= call!63080 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 (ite c!124255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124253 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124255 minValue!1387 (ite c!124253 zeroValue!1387 minValue!1387)) (ite c!124255 lt!577574 (ite c!124253 lt!577570 lt!577575))))))

(declare-fun b!1286898 () Bool)

(declare-fun res!854751 () Bool)

(assert (=> b!1286898 (=> (not res!854751) (not e!734975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85190 (_ BitVec 32)) Bool)

(assert (=> b!1286898 (= res!854751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286899 () Bool)

(declare-fun res!854752 () Bool)

(assert (=> b!1286899 (=> (not res!854752) (not e!734975))))

(assert (=> b!1286899 (= res!854752 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41647 _keys!1741))))))

(declare-fun bm!63078 () Bool)

(declare-fun call!63083 () Bool)

(declare-fun call!63081 () Bool)

(assert (=> bm!63078 (= call!63083 call!63081)))

(declare-fun b!1286900 () Bool)

(declare-fun res!854754 () Bool)

(assert (=> b!1286900 (=> (not res!854754) (not e!734975))))

(assert (=> b!1286900 (= res!854754 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41647 _keys!1741))))))

(declare-fun res!854749 () Bool)

(assert (=> start!108918 (=> (not res!854749) (not e!734975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108918 (= res!854749 (validMask!0 mask!2175))))

(assert (=> start!108918 e!734975))

(declare-fun tp_is_empty!34071 () Bool)

(assert (=> start!108918 tp_is_empty!34071))

(assert (=> start!108918 true))

(declare-fun e!734974 () Bool)

(declare-fun array_inv!31165 (array!85192) Bool)

(assert (=> start!108918 (and (array_inv!31165 _values!1445) e!734974)))

(declare-fun array_inv!31166 (array!85190) Bool)

(assert (=> start!108918 (array_inv!31166 _keys!1741)))

(assert (=> start!108918 tp!100408))

(declare-fun b!1286901 () Bool)

(assert (=> b!1286901 (= e!734975 (not true))))

(declare-fun contains!7932 (ListLongMap!19601 (_ BitVec 64)) Bool)

(assert (=> b!1286901 (not (contains!7932 (ListLongMap!19602 Nil!29125) k0!1205))))

(declare-fun lt!577576 () Unit!42551)

(declare-fun emptyContainsNothing!9 ((_ BitVec 64)) Unit!42551)

(assert (=> b!1286901 (= lt!577576 (emptyContainsNothing!9 k0!1205))))

(declare-fun lt!577579 () Unit!42551)

(declare-fun e!734971 () Unit!42551)

(assert (=> b!1286901 (= lt!577579 e!734971)))

(declare-fun lt!577572 () Bool)

(assert (=> b!1286901 (= c!124255 (and (not lt!577572) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286901 (= lt!577572 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286902 () Bool)

(declare-fun e!734972 () Bool)

(assert (=> b!1286902 (= e!734974 (and e!734972 mapRes!52664))))

(declare-fun condMapEmpty!52664 () Bool)

(declare-fun mapDefault!52664 () ValueCell!16137)

(assert (=> b!1286902 (= condMapEmpty!52664 (= (arr!41098 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16137)) mapDefault!52664)))))

(declare-fun b!1286903 () Bool)

(assert (=> b!1286903 (= e!734969 tp_is_empty!34071)))

(declare-fun b!1286904 () Bool)

(declare-fun e!734968 () Unit!42551)

(declare-fun lt!577577 () Unit!42551)

(assert (=> b!1286904 (= e!734968 lt!577577)))

(declare-fun call!63082 () ListLongMap!19601)

(assert (=> b!1286904 (= lt!577575 call!63082)))

(assert (=> b!1286904 (= lt!577577 call!63079)))

(assert (=> b!1286904 call!63083))

(declare-fun b!1286905 () Bool)

(declare-fun Unit!42553 () Unit!42551)

(assert (=> b!1286905 (= e!734968 Unit!42553)))

(declare-fun bm!63079 () Bool)

(assert (=> bm!63079 (= call!63081 (contains!7932 (ite c!124255 lt!577574 (ite c!124253 lt!577570 lt!577575)) k0!1205))))

(declare-fun b!1286906 () Bool)

(assert (=> b!1286906 call!63083))

(declare-fun lt!577573 () Unit!42551)

(assert (=> b!1286906 (= lt!577573 call!63079)))

(assert (=> b!1286906 (= lt!577570 call!63082)))

(declare-fun e!734970 () Unit!42551)

(assert (=> b!1286906 (= e!734970 lt!577573)))

(declare-fun b!1286907 () Bool)

(assert (=> b!1286907 (= e!734972 tp_is_empty!34071)))

(declare-fun b!1286908 () Bool)

(declare-fun res!854747 () Bool)

(assert (=> b!1286908 (=> (not res!854747) (not e!734975))))

(assert (=> b!1286908 (= res!854747 (and (= (size!41648 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41647 _keys!1741) (size!41648 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63080 () Bool)

(assert (=> bm!63080 (= call!63082 call!63078)))

(declare-fun b!1286909 () Bool)

(assert (=> b!1286909 (= e!734971 e!734970)))

(assert (=> b!1286909 (= c!124253 (and (not lt!577572) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286910 () Bool)

(declare-fun c!124254 () Bool)

(assert (=> b!1286910 (= c!124254 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577572))))

(assert (=> b!1286910 (= e!734970 e!734968)))

(declare-fun mapIsEmpty!52664 () Bool)

(assert (=> mapIsEmpty!52664 mapRes!52664))

(declare-fun b!1286911 () Bool)

(declare-fun res!854750 () Bool)

(assert (=> b!1286911 (=> (not res!854750) (not e!734975))))

(declare-datatypes ((List!29129 0))(
  ( (Nil!29126) (Cons!29125 (h!30334 (_ BitVec 64)) (t!42691 List!29129)) )
))
(declare-fun arrayNoDuplicates!0 (array!85190 (_ BitVec 32) List!29129) Bool)

(assert (=> b!1286911 (= res!854750 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29126))))

(declare-fun b!1286912 () Bool)

(declare-fun lt!577571 () Unit!42551)

(assert (=> b!1286912 (= e!734971 lt!577571)))

(declare-fun lt!577569 () ListLongMap!19601)

(assert (=> b!1286912 (= lt!577569 call!63078)))

(declare-fun +!4321 (ListLongMap!19601 tuple2!21944) ListLongMap!19601)

(assert (=> b!1286912 (= lt!577574 (+!4321 lt!577569 (tuple2!21945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577578 () Unit!42551)

(assert (=> b!1286912 (= lt!577578 call!63080)))

(assert (=> b!1286912 call!63081))

(assert (=> b!1286912 (= lt!577571 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577569))))

(assert (=> b!1286912 (contains!7932 lt!577569 k0!1205)))

(declare-fun b!1286913 () Bool)

(declare-fun res!854748 () Bool)

(assert (=> b!1286913 (=> (not res!854748) (not e!734975))))

(declare-fun getCurrentListMap!4891 (array!85190 array!85192 (_ BitVec 32) (_ BitVec 32) V!50531 V!50531 (_ BitVec 32) Int) ListLongMap!19601)

(assert (=> b!1286913 (= res!854748 (contains!7932 (getCurrentListMap!4891 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108918 res!854749) b!1286908))

(assert (= (and b!1286908 res!854747) b!1286898))

(assert (= (and b!1286898 res!854751) b!1286911))

(assert (= (and b!1286911 res!854750) b!1286900))

(assert (= (and b!1286900 res!854754) b!1286913))

(assert (= (and b!1286913 res!854748) b!1286899))

(assert (= (and b!1286899 res!854752) b!1286897))

(assert (= (and b!1286897 res!854753) b!1286901))

(assert (= (and b!1286901 c!124255) b!1286912))

(assert (= (and b!1286901 (not c!124255)) b!1286909))

(assert (= (and b!1286909 c!124253) b!1286906))

(assert (= (and b!1286909 (not c!124253)) b!1286910))

(assert (= (and b!1286910 c!124254) b!1286904))

(assert (= (and b!1286910 (not c!124254)) b!1286905))

(assert (= (or b!1286906 b!1286904) bm!63080))

(assert (= (or b!1286906 b!1286904) bm!63075))

(assert (= (or b!1286906 b!1286904) bm!63078))

(assert (= (or b!1286912 bm!63080) bm!63076))

(assert (= (or b!1286912 bm!63075) bm!63077))

(assert (= (or b!1286912 bm!63078) bm!63079))

(assert (= (and b!1286902 condMapEmpty!52664) mapIsEmpty!52664))

(assert (= (and b!1286902 (not condMapEmpty!52664)) mapNonEmpty!52664))

(get-info :version)

(assert (= (and mapNonEmpty!52664 ((_ is ValueCellFull!16137) mapValue!52664)) b!1286903))

(assert (= (and b!1286902 ((_ is ValueCellFull!16137) mapDefault!52664)) b!1286907))

(assert (= start!108918 b!1286902))

(declare-fun m!1179873 () Bool)

(assert (=> start!108918 m!1179873))

(declare-fun m!1179875 () Bool)

(assert (=> start!108918 m!1179875))

(declare-fun m!1179877 () Bool)

(assert (=> start!108918 m!1179877))

(declare-fun m!1179879 () Bool)

(assert (=> bm!63077 m!1179879))

(declare-fun m!1179881 () Bool)

(assert (=> bm!63079 m!1179881))

(declare-fun m!1179883 () Bool)

(assert (=> bm!63076 m!1179883))

(declare-fun m!1179885 () Bool)

(assert (=> b!1286897 m!1179885))

(assert (=> b!1286897 m!1179885))

(declare-fun m!1179887 () Bool)

(assert (=> b!1286897 m!1179887))

(declare-fun m!1179889 () Bool)

(assert (=> b!1286912 m!1179889))

(declare-fun m!1179891 () Bool)

(assert (=> b!1286912 m!1179891))

(declare-fun m!1179893 () Bool)

(assert (=> b!1286912 m!1179893))

(declare-fun m!1179895 () Bool)

(assert (=> b!1286913 m!1179895))

(assert (=> b!1286913 m!1179895))

(declare-fun m!1179897 () Bool)

(assert (=> b!1286913 m!1179897))

(declare-fun m!1179899 () Bool)

(assert (=> b!1286911 m!1179899))

(declare-fun m!1179901 () Bool)

(assert (=> mapNonEmpty!52664 m!1179901))

(declare-fun m!1179903 () Bool)

(assert (=> b!1286898 m!1179903))

(declare-fun m!1179905 () Bool)

(assert (=> b!1286901 m!1179905))

(declare-fun m!1179907 () Bool)

(assert (=> b!1286901 m!1179907))

(check-sat b_and!46515 (not b!1286897) (not mapNonEmpty!52664) (not bm!63077) (not b!1286913) (not b_next!28431) (not bm!63079) (not b!1286911) (not start!108918) (not b!1286901) (not bm!63076) (not b!1286912) tp_is_empty!34071 (not b!1286898))
(check-sat b_and!46515 (not b_next!28431))
