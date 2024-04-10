; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109818 () Bool)

(assert start!109818)

(declare-fun b_free!29211 () Bool)

(declare-fun b_next!29211 () Bool)

(assert (=> start!109818 (= b_free!29211 (not b_next!29211))))

(declare-fun tp!102767 () Bool)

(declare-fun b_and!47325 () Bool)

(assert (=> start!109818 (= tp!102767 b_and!47325)))

(declare-fun b!1301112 () Bool)

(declare-fun res!864513 () Bool)

(declare-fun e!742135 () Bool)

(assert (=> b!1301112 (=> (not res!864513) (not e!742135))))

(declare-datatypes ((array!86712 0))(
  ( (array!86713 (arr!41852 (Array (_ BitVec 32) (_ BitVec 64))) (size!42402 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86712)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301112 (= res!864513 (validKeyInArray!0 (select (arr!41852 _keys!1741) from!2144)))))

(declare-fun b!1301113 () Bool)

(declare-fun e!742133 () Bool)

(declare-fun tp_is_empty!34851 () Bool)

(assert (=> b!1301113 (= e!742133 tp_is_empty!34851)))

(declare-fun b!1301114 () Bool)

(declare-fun c!124696 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!581758 () Bool)

(assert (=> b!1301114 (= c!124696 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581758))))

(declare-datatypes ((Unit!43060 0))(
  ( (Unit!43061) )
))
(declare-fun e!742132 () Unit!43060)

(declare-fun e!742134 () Unit!43060)

(assert (=> b!1301114 (= e!742132 e!742134)))

(declare-fun b!1301115 () Bool)

(declare-fun res!864509 () Bool)

(assert (=> b!1301115 (=> (not res!864509) (not e!742135))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1301115 (= res!864509 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42402 _keys!1741))))))

(declare-fun b!1301116 () Bool)

(declare-fun e!742136 () Unit!43060)

(assert (=> b!1301116 (= e!742136 e!742132)))

(declare-fun c!124697 () Bool)

(assert (=> b!1301116 (= c!124697 (and (not lt!581758) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!51571 0))(
  ( (V!51572 (val!17500 Int)) )
))
(declare-datatypes ((tuple2!22574 0))(
  ( (tuple2!22575 (_1!11298 (_ BitVec 64)) (_2!11298 V!51571)) )
))
(declare-datatypes ((List!29704 0))(
  ( (Nil!29701) (Cons!29700 (h!30909 tuple2!22574) (t!43278 List!29704)) )
))
(declare-datatypes ((ListLongMap!20231 0))(
  ( (ListLongMap!20232 (toList!10131 List!29704)) )
))
(declare-fun lt!581764 () ListLongMap!20231)

(declare-fun lt!581756 () ListLongMap!20231)

(declare-fun bm!63850 () Bool)

(declare-fun c!124695 () Bool)

(declare-fun call!63858 () Bool)

(declare-fun lt!581760 () ListLongMap!20231)

(declare-fun contains!8257 (ListLongMap!20231 (_ BitVec 64)) Bool)

(assert (=> bm!63850 (= call!63858 (contains!8257 (ite c!124695 lt!581764 (ite c!124697 lt!581756 lt!581760)) k0!1205))))

(declare-fun zeroValue!1387 () V!51571)

(declare-fun call!63853 () Unit!43060)

(declare-fun minValue!1387 () V!51571)

(declare-fun bm!63851 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!81 ((_ BitVec 64) (_ BitVec 64) V!51571 ListLongMap!20231) Unit!43060)

(assert (=> bm!63851 (= call!63853 (lemmaInListMapAfterAddingDiffThenInBefore!81 k0!1205 (ite c!124695 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124695 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)) (ite c!124695 lt!581764 (ite c!124697 lt!581756 lt!581760))))))

(declare-fun b!1301117 () Bool)

(declare-fun res!864510 () Bool)

(assert (=> b!1301117 (=> (not res!864510) (not e!742135))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16527 0))(
  ( (ValueCellFull!16527 (v!20108 V!51571)) (EmptyCell!16527) )
))
(declare-datatypes ((array!86714 0))(
  ( (array!86715 (arr!41853 (Array (_ BitVec 32) ValueCell!16527)) (size!42403 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86714)

(assert (=> b!1301117 (= res!864510 (and (= (size!42403 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42402 _keys!1741) (size!42403 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!864512 () Bool)

(assert (=> start!109818 (=> (not res!864512) (not e!742135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109818 (= res!864512 (validMask!0 mask!2175))))

(assert (=> start!109818 e!742135))

(assert (=> start!109818 tp_is_empty!34851))

(assert (=> start!109818 true))

(declare-fun e!742130 () Bool)

(declare-fun array_inv!31663 (array!86714) Bool)

(assert (=> start!109818 (and (array_inv!31663 _values!1445) e!742130)))

(declare-fun array_inv!31664 (array!86712) Bool)

(assert (=> start!109818 (array_inv!31664 _keys!1741)))

(assert (=> start!109818 tp!102767))

(declare-fun b!1301118 () Bool)

(declare-fun call!63857 () Bool)

(assert (=> b!1301118 call!63857))

(declare-fun lt!581759 () Unit!43060)

(declare-fun call!63854 () Unit!43060)

(assert (=> b!1301118 (= lt!581759 call!63854)))

(declare-fun call!63856 () ListLongMap!20231)

(assert (=> b!1301118 (= lt!581756 call!63856)))

(assert (=> b!1301118 (= e!742132 lt!581759)))

(declare-fun b!1301119 () Bool)

(declare-fun res!864515 () Bool)

(assert (=> b!1301119 (=> (not res!864515) (not e!742135))))

(assert (=> b!1301119 (= res!864515 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42402 _keys!1741))))))

(declare-fun b!1301120 () Bool)

(declare-fun lt!581762 () Unit!43060)

(assert (=> b!1301120 (= e!742136 lt!581762)))

(declare-fun lt!581757 () ListLongMap!20231)

(declare-fun call!63855 () ListLongMap!20231)

(assert (=> b!1301120 (= lt!581757 call!63855)))

(declare-fun +!4458 (ListLongMap!20231 tuple2!22574) ListLongMap!20231)

(assert (=> b!1301120 (= lt!581764 (+!4458 lt!581757 (tuple2!22575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581765 () Unit!43060)

(assert (=> b!1301120 (= lt!581765 call!63853)))

(assert (=> b!1301120 call!63858))

(assert (=> b!1301120 (= lt!581762 (lemmaInListMapAfterAddingDiffThenInBefore!81 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581757))))

(assert (=> b!1301120 (contains!8257 lt!581757 k0!1205)))

(declare-fun b!1301121 () Bool)

(assert (=> b!1301121 (= e!742135 (not (or (= k0!1205 (select (arr!41852 _keys!1741) from!2144)) (not (= (select (arr!41852 _keys!1741) from!2144) k0!1205)))))))

(assert (=> b!1301121 (not (contains!8257 (ListLongMap!20232 Nil!29701) k0!1205))))

(declare-fun lt!581763 () Unit!43060)

(declare-fun emptyContainsNothing!199 ((_ BitVec 64)) Unit!43060)

(assert (=> b!1301121 (= lt!581763 (emptyContainsNothing!199 k0!1205))))

(declare-fun lt!581761 () Unit!43060)

(assert (=> b!1301121 (= lt!581761 e!742136)))

(assert (=> b!1301121 (= c!124695 (and (not lt!581758) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301121 (= lt!581758 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301122 () Bool)

(declare-fun res!864511 () Bool)

(assert (=> b!1301122 (=> (not res!864511) (not e!742135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86712 (_ BitVec 32)) Bool)

(assert (=> b!1301122 (= res!864511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301123 () Bool)

(declare-fun lt!581755 () Unit!43060)

(assert (=> b!1301123 (= e!742134 lt!581755)))

(assert (=> b!1301123 (= lt!581760 call!63856)))

(assert (=> b!1301123 (= lt!581755 call!63854)))

(assert (=> b!1301123 call!63857))

(declare-fun b!1301124 () Bool)

(declare-fun e!742129 () Bool)

(assert (=> b!1301124 (= e!742129 tp_is_empty!34851)))

(declare-fun mapNonEmpty!53852 () Bool)

(declare-fun mapRes!53852 () Bool)

(declare-fun tp!102766 () Bool)

(assert (=> mapNonEmpty!53852 (= mapRes!53852 (and tp!102766 e!742133))))

(declare-fun mapKey!53852 () (_ BitVec 32))

(declare-fun mapRest!53852 () (Array (_ BitVec 32) ValueCell!16527))

(declare-fun mapValue!53852 () ValueCell!16527)

(assert (=> mapNonEmpty!53852 (= (arr!41853 _values!1445) (store mapRest!53852 mapKey!53852 mapValue!53852))))

(declare-fun b!1301125 () Bool)

(declare-fun res!864514 () Bool)

(assert (=> b!1301125 (=> (not res!864514) (not e!742135))))

(declare-datatypes ((List!29705 0))(
  ( (Nil!29702) (Cons!29701 (h!30910 (_ BitVec 64)) (t!43279 List!29705)) )
))
(declare-fun arrayNoDuplicates!0 (array!86712 (_ BitVec 32) List!29705) Bool)

(assert (=> b!1301125 (= res!864514 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29702))))

(declare-fun mapIsEmpty!53852 () Bool)

(assert (=> mapIsEmpty!53852 mapRes!53852))

(declare-fun b!1301126 () Bool)

(declare-fun res!864508 () Bool)

(assert (=> b!1301126 (=> (not res!864508) (not e!742135))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5156 (array!86712 array!86714 (_ BitVec 32) (_ BitVec 32) V!51571 V!51571 (_ BitVec 32) Int) ListLongMap!20231)

(assert (=> b!1301126 (= res!864508 (contains!8257 (getCurrentListMap!5156 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63852 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6090 (array!86712 array!86714 (_ BitVec 32) (_ BitVec 32) V!51571 V!51571 (_ BitVec 32) Int) ListLongMap!20231)

(assert (=> bm!63852 (= call!63855 (getCurrentListMapNoExtraKeys!6090 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63853 () Bool)

(assert (=> bm!63853 (= call!63857 call!63858)))

(declare-fun bm!63854 () Bool)

(assert (=> bm!63854 (= call!63854 call!63853)))

(declare-fun b!1301127 () Bool)

(declare-fun Unit!43062 () Unit!43060)

(assert (=> b!1301127 (= e!742134 Unit!43062)))

(declare-fun b!1301128 () Bool)

(assert (=> b!1301128 (= e!742130 (and e!742129 mapRes!53852))))

(declare-fun condMapEmpty!53852 () Bool)

(declare-fun mapDefault!53852 () ValueCell!16527)

(assert (=> b!1301128 (= condMapEmpty!53852 (= (arr!41853 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16527)) mapDefault!53852)))))

(declare-fun bm!63855 () Bool)

(assert (=> bm!63855 (= call!63856 call!63855)))

(assert (= (and start!109818 res!864512) b!1301117))

(assert (= (and b!1301117 res!864510) b!1301122))

(assert (= (and b!1301122 res!864511) b!1301125))

(assert (= (and b!1301125 res!864514) b!1301119))

(assert (= (and b!1301119 res!864515) b!1301126))

(assert (= (and b!1301126 res!864508) b!1301115))

(assert (= (and b!1301115 res!864509) b!1301112))

(assert (= (and b!1301112 res!864513) b!1301121))

(assert (= (and b!1301121 c!124695) b!1301120))

(assert (= (and b!1301121 (not c!124695)) b!1301116))

(assert (= (and b!1301116 c!124697) b!1301118))

(assert (= (and b!1301116 (not c!124697)) b!1301114))

(assert (= (and b!1301114 c!124696) b!1301123))

(assert (= (and b!1301114 (not c!124696)) b!1301127))

(assert (= (or b!1301118 b!1301123) bm!63855))

(assert (= (or b!1301118 b!1301123) bm!63854))

(assert (= (or b!1301118 b!1301123) bm!63853))

(assert (= (or b!1301120 bm!63855) bm!63852))

(assert (= (or b!1301120 bm!63854) bm!63851))

(assert (= (or b!1301120 bm!63853) bm!63850))

(assert (= (and b!1301128 condMapEmpty!53852) mapIsEmpty!53852))

(assert (= (and b!1301128 (not condMapEmpty!53852)) mapNonEmpty!53852))

(get-info :version)

(assert (= (and mapNonEmpty!53852 ((_ is ValueCellFull!16527) mapValue!53852)) b!1301113))

(assert (= (and b!1301128 ((_ is ValueCellFull!16527) mapDefault!53852)) b!1301124))

(assert (= start!109818 b!1301128))

(declare-fun m!1191841 () Bool)

(assert (=> b!1301121 m!1191841))

(declare-fun m!1191843 () Bool)

(assert (=> b!1301121 m!1191843))

(declare-fun m!1191845 () Bool)

(assert (=> b!1301121 m!1191845))

(assert (=> b!1301112 m!1191841))

(assert (=> b!1301112 m!1191841))

(declare-fun m!1191847 () Bool)

(assert (=> b!1301112 m!1191847))

(declare-fun m!1191849 () Bool)

(assert (=> bm!63851 m!1191849))

(declare-fun m!1191851 () Bool)

(assert (=> b!1301120 m!1191851))

(declare-fun m!1191853 () Bool)

(assert (=> b!1301120 m!1191853))

(declare-fun m!1191855 () Bool)

(assert (=> b!1301120 m!1191855))

(declare-fun m!1191857 () Bool)

(assert (=> start!109818 m!1191857))

(declare-fun m!1191859 () Bool)

(assert (=> start!109818 m!1191859))

(declare-fun m!1191861 () Bool)

(assert (=> start!109818 m!1191861))

(declare-fun m!1191863 () Bool)

(assert (=> bm!63850 m!1191863))

(declare-fun m!1191865 () Bool)

(assert (=> b!1301125 m!1191865))

(declare-fun m!1191867 () Bool)

(assert (=> bm!63852 m!1191867))

(declare-fun m!1191869 () Bool)

(assert (=> mapNonEmpty!53852 m!1191869))

(declare-fun m!1191871 () Bool)

(assert (=> b!1301122 m!1191871))

(declare-fun m!1191873 () Bool)

(assert (=> b!1301126 m!1191873))

(assert (=> b!1301126 m!1191873))

(declare-fun m!1191875 () Bool)

(assert (=> b!1301126 m!1191875))

(check-sat (not mapNonEmpty!53852) b_and!47325 (not bm!63851) (not b!1301112) tp_is_empty!34851 (not bm!63852) (not b!1301120) (not b!1301121) (not b!1301122) (not start!109818) (not b!1301125) (not b!1301126) (not b_next!29211) (not bm!63850))
(check-sat b_and!47325 (not b_next!29211))
