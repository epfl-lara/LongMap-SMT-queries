; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109808 () Bool)

(assert start!109808)

(declare-fun b_free!29201 () Bool)

(declare-fun b_next!29201 () Bool)

(assert (=> start!109808 (= b_free!29201 (not b_next!29201))))

(declare-fun tp!102736 () Bool)

(declare-fun b_and!47315 () Bool)

(assert (=> start!109808 (= tp!102736 b_and!47315)))

(declare-datatypes ((V!51557 0))(
  ( (V!51558 (val!17495 Int)) )
))
(declare-fun minValue!1387 () V!51557)

(declare-fun zeroValue!1387 () V!51557)

(declare-fun c!124651 () Bool)

(declare-datatypes ((tuple2!22568 0))(
  ( (tuple2!22569 (_1!11295 (_ BitVec 64)) (_2!11295 V!51557)) )
))
(declare-datatypes ((List!29699 0))(
  ( (Nil!29696) (Cons!29695 (h!30904 tuple2!22568) (t!43273 List!29699)) )
))
(declare-datatypes ((ListLongMap!20225 0))(
  ( (ListLongMap!20226 (toList!10128 List!29699)) )
))
(declare-fun lt!581599 () ListLongMap!20225)

(declare-fun bm!63760 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun c!124652 () Bool)

(declare-fun lt!581597 () ListLongMap!20225)

(declare-fun lt!581595 () ListLongMap!20225)

(declare-datatypes ((Unit!43052 0))(
  ( (Unit!43053) )
))
(declare-fun call!63766 () Unit!43052)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!78 ((_ BitVec 64) (_ BitVec 64) V!51557 ListLongMap!20225) Unit!43052)

(assert (=> bm!63760 (= call!63766 (lemmaInListMapAfterAddingDiffThenInBefore!78 k!1205 (ite c!124652 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124651 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124652 minValue!1387 (ite c!124651 zeroValue!1387 minValue!1387)) (ite c!124652 lt!581599 (ite c!124651 lt!581597 lt!581595))))))

(declare-fun b!1300857 () Bool)

(declare-fun e!742016 () Bool)

(assert (=> b!1300857 (= e!742016 (not true))))

(declare-fun contains!8254 (ListLongMap!20225 (_ BitVec 64)) Bool)

(assert (=> b!1300857 (not (contains!8254 (ListLongMap!20226 Nil!29696) k!1205))))

(declare-fun lt!581598 () Unit!43052)

(declare-fun emptyContainsNothing!196 ((_ BitVec 64)) Unit!43052)

(assert (=> b!1300857 (= lt!581598 (emptyContainsNothing!196 k!1205))))

(declare-fun lt!581592 () Unit!43052)

(declare-fun e!742015 () Unit!43052)

(assert (=> b!1300857 (= lt!581592 e!742015)))

(declare-fun lt!581594 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300857 (= c!124652 (and (not lt!581594) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300857 (= lt!581594 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300858 () Bool)

(declare-fun e!742013 () Unit!43052)

(declare-fun lt!581600 () Unit!43052)

(assert (=> b!1300858 (= e!742013 lt!581600)))

(declare-fun call!63764 () ListLongMap!20225)

(assert (=> b!1300858 (= lt!581595 call!63764)))

(declare-fun call!63765 () Unit!43052)

(assert (=> b!1300858 (= lt!581600 call!63765)))

(declare-fun call!63768 () Bool)

(assert (=> b!1300858 call!63768))

(declare-fun b!1300859 () Bool)

(declare-fun e!742009 () Bool)

(declare-fun tp_is_empty!34841 () Bool)

(assert (=> b!1300859 (= e!742009 tp_is_empty!34841)))

(declare-fun b!1300860 () Bool)

(declare-fun e!742014 () Unit!43052)

(assert (=> b!1300860 (= e!742015 e!742014)))

(assert (=> b!1300860 (= c!124651 (and (not lt!581594) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63761 () Bool)

(assert (=> bm!63761 (= call!63765 call!63766)))

(declare-fun res!864389 () Bool)

(assert (=> start!109808 (=> (not res!864389) (not e!742016))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109808 (= res!864389 (validMask!0 mask!2175))))

(assert (=> start!109808 e!742016))

(assert (=> start!109808 tp_is_empty!34841))

(assert (=> start!109808 true))

(declare-datatypes ((ValueCell!16522 0))(
  ( (ValueCellFull!16522 (v!20103 V!51557)) (EmptyCell!16522) )
))
(declare-datatypes ((array!86694 0))(
  ( (array!86695 (arr!41843 (Array (_ BitVec 32) ValueCell!16522)) (size!42393 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86694)

(declare-fun e!742012 () Bool)

(declare-fun array_inv!31657 (array!86694) Bool)

(assert (=> start!109808 (and (array_inv!31657 _values!1445) e!742012)))

(declare-datatypes ((array!86696 0))(
  ( (array!86697 (arr!41844 (Array (_ BitVec 32) (_ BitVec 64))) (size!42394 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86696)

(declare-fun array_inv!31658 (array!86696) Bool)

(assert (=> start!109808 (array_inv!31658 _keys!1741)))

(assert (=> start!109808 tp!102736))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun call!63763 () ListLongMap!20225)

(declare-fun bm!63762 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6087 (array!86696 array!86694 (_ BitVec 32) (_ BitVec 32) V!51557 V!51557 (_ BitVec 32) Int) ListLongMap!20225)

(assert (=> bm!63762 (= call!63763 (getCurrentListMapNoExtraKeys!6087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53837 () Bool)

(declare-fun mapRes!53837 () Bool)

(assert (=> mapIsEmpty!53837 mapRes!53837))

(declare-fun b!1300861 () Bool)

(assert (=> b!1300861 (= e!742012 (and e!742009 mapRes!53837))))

(declare-fun condMapEmpty!53837 () Bool)

(declare-fun mapDefault!53837 () ValueCell!16522)

