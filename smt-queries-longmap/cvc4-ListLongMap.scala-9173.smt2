; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110332 () Bool)

(assert start!110332)

(declare-fun b_free!29315 () Bool)

(declare-fun b_next!29315 () Bool)

(assert (=> start!110332 (= b_free!29315 (not b_next!29315))))

(declare-fun tp!103114 () Bool)

(declare-fun b_and!47521 () Bool)

(assert (=> start!110332 (= tp!103114 b_and!47521)))

(declare-fun b!1305865 () Bool)

(declare-fun res!867030 () Bool)

(declare-fun e!744878 () Bool)

(assert (=> b!1305865 (=> (not res!867030) (not e!744878))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86926 0))(
  ( (array!86927 (arr!41949 (Array (_ BitVec 32) (_ BitVec 64))) (size!42499 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86926)

(assert (=> b!1305865 (= res!867030 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42499 _keys!1741))))))

(declare-fun b!1305866 () Bool)

(declare-fun res!867034 () Bool)

(assert (=> b!1305866 (=> (not res!867034) (not e!744878))))

(assert (=> b!1305866 (= res!867034 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42499 _keys!1741))))))

(declare-fun b!1305867 () Bool)

(declare-fun res!867037 () Bool)

(assert (=> b!1305867 (=> (not res!867037) (not e!744878))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86926 (_ BitVec 32)) Bool)

(assert (=> b!1305867 (= res!867037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!64579 () Bool)

(declare-fun call!64589 () Bool)

(declare-fun call!64591 () Bool)

(assert (=> bm!64579 (= call!64589 call!64591)))

(declare-fun b!1305868 () Bool)

(assert (=> b!1305868 (= e!744878 (not true))))

(declare-datatypes ((Unit!43259 0))(
  ( (Unit!43260) )
))
(declare-fun lt!584795 () Unit!43259)

(declare-fun e!744885 () Unit!43259)

(assert (=> b!1305868 (= lt!584795 e!744885)))

(declare-fun c!125507 () Bool)

(declare-fun lt!584793 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305868 (= c!125507 (and (not lt!584793) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305868 (= lt!584793 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!51709 0))(
  ( (V!51710 (val!17552 Int)) )
))
(declare-datatypes ((tuple2!22662 0))(
  ( (tuple2!22663 (_1!11342 (_ BitVec 64)) (_2!11342 V!51709)) )
))
(declare-datatypes ((List!29781 0))(
  ( (Nil!29778) (Cons!29777 (h!30986 tuple2!22662) (t!43385 List!29781)) )
))
(declare-datatypes ((ListLongMap!20319 0))(
  ( (ListLongMap!20320 (toList!10175 List!29781)) )
))
(declare-fun contains!8320 (ListLongMap!20319 (_ BitVec 64)) Bool)

(assert (=> b!1305868 (not (contains!8320 (ListLongMap!20320 Nil!29778) k!1205))))

(declare-fun lt!584801 () Unit!43259)

(declare-fun emptyContainsNothing!236 ((_ BitVec 64)) Unit!43259)

(assert (=> b!1305868 (= lt!584801 (emptyContainsNothing!236 k!1205))))

(declare-fun b!1305869 () Bool)

(assert (=> b!1305869 call!64589))

(declare-fun lt!584800 () Unit!43259)

(declare-fun call!64587 () Unit!43259)

(assert (=> b!1305869 (= lt!584800 call!64587)))

(declare-fun call!64588 () Bool)

(assert (=> b!1305869 (not call!64588)))

(declare-fun lt!584787 () Unit!43259)

(declare-fun call!64584 () Unit!43259)

(assert (=> b!1305869 (= lt!584787 call!64584)))

(declare-fun lt!584789 () ListLongMap!20319)

(declare-fun call!64593 () ListLongMap!20319)

(assert (=> b!1305869 (= lt!584789 call!64593)))

(declare-fun e!744883 () Unit!43259)

(assert (=> b!1305869 (= e!744883 lt!584800)))

(declare-fun mapNonEmpty!54043 () Bool)

(declare-fun mapRes!54043 () Bool)

(declare-fun tp!103113 () Bool)

(declare-fun e!744884 () Bool)

(assert (=> mapNonEmpty!54043 (= mapRes!54043 (and tp!103113 e!744884))))

(declare-fun mapKey!54043 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16579 0))(
  ( (ValueCellFull!16579 (v!20177 V!51709)) (EmptyCell!16579) )
))
(declare-fun mapRest!54043 () (Array (_ BitVec 32) ValueCell!16579))

(declare-datatypes ((array!86928 0))(
  ( (array!86929 (arr!41950 (Array (_ BitVec 32) ValueCell!16579)) (size!42500 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86928)

(declare-fun mapValue!54043 () ValueCell!16579)

(assert (=> mapNonEmpty!54043 (= (arr!41950 _values!1445) (store mapRest!54043 mapKey!54043 mapValue!54043))))

(declare-fun minValue!1387 () V!51709)

(declare-fun zeroValue!1387 () V!51709)

(declare-fun call!64583 () Unit!43259)

(declare-fun c!125508 () Bool)

(declare-fun bm!64580 () Bool)

(declare-fun lt!584797 () ListLongMap!20319)

(declare-fun lt!584786 () ListLongMap!20319)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!96 ((_ BitVec 64) (_ BitVec 64) V!51709 ListLongMap!20319) Unit!43259)

(assert (=> bm!64580 (= call!64583 (lemmaInListMapAfterAddingDiffThenInBefore!96 k!1205 (ite (or c!125507 c!125508) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125507 c!125508) zeroValue!1387 minValue!1387) (ite c!125507 lt!584797 (ite c!125508 lt!584789 lt!584786))))))

(declare-fun b!1305870 () Bool)

(declare-fun res!867033 () Bool)

(assert (=> b!1305870 (=> (not res!867033) (not e!744878))))

(declare-datatypes ((List!29782 0))(
  ( (Nil!29779) (Cons!29778 (h!30987 (_ BitVec 64)) (t!43386 List!29782)) )
))
(declare-fun arrayNoDuplicates!0 (array!86926 (_ BitVec 32) List!29782) Bool)

(assert (=> b!1305870 (= res!867033 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29779))))

(declare-fun bm!64581 () Bool)

(declare-fun call!64585 () Unit!43259)

(declare-fun addStillNotContains!491 (ListLongMap!20319 (_ BitVec 64) V!51709 (_ BitVec 64)) Unit!43259)

(assert (=> bm!64581 (= call!64585 (addStillNotContains!491 (ite c!125507 lt!584797 (ite c!125508 lt!584789 lt!584786)) (ite c!125507 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125508 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125507 minValue!1387 (ite c!125508 zeroValue!1387 minValue!1387)) k!1205))))

(declare-fun bm!64582 () Bool)

(assert (=> bm!64582 (= call!64584 call!64585)))

(declare-fun b!1305871 () Bool)

(declare-fun e!744881 () Bool)

(declare-fun tp_is_empty!34955 () Bool)

(assert (=> b!1305871 (= e!744881 tp_is_empty!34955)))

(declare-fun lt!584799 () ListLongMap!20319)

(declare-fun bm!64583 () Bool)

(assert (=> bm!64583 (= call!64591 (contains!8320 (ite c!125507 lt!584799 (ite c!125508 lt!584789 lt!584786)) k!1205))))

(declare-fun b!1305872 () Bool)

(declare-fun e!744879 () Unit!43259)

(declare-fun lt!584788 () Unit!43259)

(assert (=> b!1305872 (= e!744879 lt!584788)))

(assert (=> b!1305872 (= lt!584786 call!64593)))

(declare-fun lt!584798 () Unit!43259)

(assert (=> b!1305872 (= lt!584798 call!64584)))

(assert (=> b!1305872 (not call!64588)))

(assert (=> b!1305872 (= lt!584788 call!64587)))

(assert (=> b!1305872 call!64589))

(declare-fun bm!64584 () Bool)

(declare-fun call!64592 () ListLongMap!20319)

(declare-fun call!64582 () ListLongMap!20319)

(assert (=> bm!64584 (= call!64592 call!64582)))

(declare-fun b!1305873 () Bool)

(declare-fun Unit!43261 () Unit!43259)

(assert (=> b!1305873 (= e!744879 Unit!43261)))

(declare-fun b!1305874 () Bool)

(declare-fun lt!584790 () Unit!43259)

(assert (=> b!1305874 (= e!744885 lt!584790)))

(declare-fun call!64586 () ListLongMap!20319)

(assert (=> b!1305874 (= lt!584797 call!64586)))

(declare-fun lt!584792 () Unit!43259)

(assert (=> b!1305874 (= lt!584792 (addStillNotContains!491 lt!584797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun +!4494 (ListLongMap!20319 tuple2!22662) ListLongMap!20319)

(assert (=> b!1305874 (= lt!584799 (+!4494 lt!584797 (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1305874 (not call!64591)))

(declare-fun lt!584791 () Unit!43259)

(assert (=> b!1305874 (= lt!584791 call!64585)))

(assert (=> b!1305874 (not (contains!8320 call!64582 k!1205))))

(declare-fun lt!584796 () Unit!43259)

(assert (=> b!1305874 (= lt!584796 (lemmaInListMapAfterAddingDiffThenInBefore!96 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!584799))))

(assert (=> b!1305874 false))

(assert (=> b!1305874 (= lt!584790 call!64583)))

(declare-fun lt!584794 () Bool)

(declare-fun call!64590 () Bool)

(assert (=> b!1305874 (= lt!584794 call!64590)))

(declare-fun b!1305875 () Bool)

(assert (=> b!1305875 (= e!744885 e!744883)))

(assert (=> b!1305875 (= c!125508 (and (not lt!584793) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305876 () Bool)

(declare-fun res!867036 () Bool)

(assert (=> b!1305876 (=> (not res!867036) (not e!744878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305876 (= res!867036 (not (validKeyInArray!0 (select (arr!41949 _keys!1741) from!2144))))))

(declare-fun bm!64585 () Bool)

(assert (=> bm!64585 (= call!64593 call!64586)))

(declare-fun bm!64586 () Bool)

(assert (=> bm!64586 (= call!64588 call!64590)))

(declare-fun b!1305877 () Bool)

(declare-fun res!867031 () Bool)

(assert (=> b!1305877 (=> (not res!867031) (not e!744878))))

(assert (=> b!1305877 (= res!867031 (and (= (size!42500 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42499 _keys!1741) (size!42500 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!867035 () Bool)

(assert (=> start!110332 (=> (not res!867035) (not e!744878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110332 (= res!867035 (validMask!0 mask!2175))))

(assert (=> start!110332 e!744878))

(assert (=> start!110332 tp_is_empty!34955))

(assert (=> start!110332 true))

(declare-fun e!744880 () Bool)

(declare-fun array_inv!31719 (array!86928) Bool)

(assert (=> start!110332 (and (array_inv!31719 _values!1445) e!744880)))

(declare-fun array_inv!31720 (array!86926) Bool)

(assert (=> start!110332 (array_inv!31720 _keys!1741)))

(assert (=> start!110332 tp!103114))

(declare-fun b!1305878 () Bool)

(assert (=> b!1305878 (= e!744880 (and e!744881 mapRes!54043))))

(declare-fun condMapEmpty!54043 () Bool)

(declare-fun mapDefault!54043 () ValueCell!16579)

