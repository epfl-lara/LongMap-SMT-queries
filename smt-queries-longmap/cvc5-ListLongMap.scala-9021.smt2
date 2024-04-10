; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108886 () Bool)

(assert start!108886)

(declare-fun b_free!28399 () Bool)

(declare-fun b_next!28399 () Bool)

(assert (=> start!108886 (= b_free!28399 (not b_next!28399))))

(declare-fun tp!100313 () Bool)

(declare-fun b_and!46465 () Bool)

(assert (=> start!108886 (= tp!100313 b_and!46465)))

(declare-datatypes ((V!50489 0))(
  ( (V!50490 (val!17094 Int)) )
))
(declare-fun minValue!1387 () V!50489)

(declare-fun zeroValue!1387 () V!50489)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((tuple2!21916 0))(
  ( (tuple2!21917 (_1!10969 (_ BitVec 64)) (_2!10969 V!50489)) )
))
(declare-datatypes ((List!29103 0))(
  ( (Nil!29100) (Cons!29099 (h!30308 tuple2!21916) (t!42647 List!29103)) )
))
(declare-datatypes ((ListLongMap!19573 0))(
  ( (ListLongMap!19574 (toList!9802 List!29103)) )
))
(declare-fun call!62795 () ListLongMap!19573)

(declare-fun bm!62787 () Bool)

(declare-datatypes ((ValueCell!16121 0))(
  ( (ValueCellFull!16121 (v!19696 V!50489)) (EmptyCell!16121) )
))
(declare-datatypes ((array!85130 0))(
  ( (array!85131 (arr!41067 (Array (_ BitVec 32) ValueCell!16121)) (size!41617 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85130)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85132 0))(
  ( (array!85133 (arr!41068 (Array (_ BitVec 32) (_ BitVec 64))) (size!41618 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85132)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5940 (array!85132 array!85130 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19573)

(assert (=> bm!62787 (= call!62795 (getCurrentListMapNoExtraKeys!5940 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286036 () Bool)

(declare-fun res!854338 () Bool)

(declare-fun e!734564 () Bool)

(assert (=> b!1286036 (=> (not res!854338) (not e!734564))))

(assert (=> b!1286036 (= res!854338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41618 _keys!1741))))))

(declare-fun b!1286037 () Bool)

(declare-datatypes ((Unit!42509 0))(
  ( (Unit!42510) )
))
(declare-fun e!734560 () Unit!42509)

(declare-fun lt!576995 () Unit!42509)

(assert (=> b!1286037 (= e!734560 lt!576995)))

(declare-fun lt!576992 () ListLongMap!19573)

(declare-fun call!62792 () ListLongMap!19573)

(assert (=> b!1286037 (= lt!576992 call!62792)))

(declare-fun call!62791 () Unit!42509)

(assert (=> b!1286037 (= lt!576995 call!62791)))

(declare-fun call!62794 () Bool)

(assert (=> b!1286037 call!62794))

(declare-fun b!1286038 () Bool)

(assert (=> b!1286038 call!62794))

(declare-fun lt!576991 () Unit!42509)

(assert (=> b!1286038 (= lt!576991 call!62791)))

(declare-fun lt!576988 () ListLongMap!19573)

(assert (=> b!1286038 (= lt!576988 call!62792)))

(declare-fun e!734561 () Unit!42509)

(assert (=> b!1286038 (= e!734561 lt!576991)))

(declare-fun bm!62788 () Bool)

(declare-fun call!62793 () Unit!42509)

(assert (=> bm!62788 (= call!62791 call!62793)))

(declare-fun mapNonEmpty!52616 () Bool)

(declare-fun mapRes!52616 () Bool)

(declare-fun tp!100312 () Bool)

(declare-fun e!734557 () Bool)

(assert (=> mapNonEmpty!52616 (= mapRes!52616 (and tp!100312 e!734557))))

(declare-fun mapRest!52616 () (Array (_ BitVec 32) ValueCell!16121))

(declare-fun mapValue!52616 () ValueCell!16121)

(declare-fun mapKey!52616 () (_ BitVec 32))

(assert (=> mapNonEmpty!52616 (= (arr!41067 _values!1445) (store mapRest!52616 mapKey!52616 mapValue!52616))))

(declare-fun b!1286039 () Bool)

(assert (=> b!1286039 (= e!734564 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7919 (ListLongMap!19573 (_ BitVec 64)) Bool)

(assert (=> b!1286039 (not (contains!7919 (ListLongMap!19574 Nil!29100) k!1205))))

(declare-fun lt!576990 () Unit!42509)

(declare-fun emptyContainsNothing!1 ((_ BitVec 64)) Unit!42509)

(assert (=> b!1286039 (= lt!576990 (emptyContainsNothing!1 k!1205))))

(declare-fun lt!576994 () Unit!42509)

(declare-fun e!734563 () Unit!42509)

(assert (=> b!1286039 (= lt!576994 e!734563)))

(declare-fun c!124110 () Bool)

(declare-fun lt!576996 () Bool)

(assert (=> b!1286039 (= c!124110 (and (not lt!576996) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286039 (= lt!576996 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286040 () Bool)

(assert (=> b!1286040 (= e!734563 e!734561)))

(declare-fun c!124111 () Bool)

(assert (=> b!1286040 (= c!124111 (and (not lt!576996) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286041 () Bool)

(declare-fun e!734559 () Bool)

(declare-fun tp_is_empty!34039 () Bool)

(assert (=> b!1286041 (= e!734559 tp_is_empty!34039)))

(declare-fun b!1286042 () Bool)

(assert (=> b!1286042 (= e!734557 tp_is_empty!34039)))

(declare-fun b!1286043 () Bool)

(declare-fun res!854342 () Bool)

(assert (=> b!1286043 (=> (not res!854342) (not e!734564))))

(declare-datatypes ((List!29104 0))(
  ( (Nil!29101) (Cons!29100 (h!30309 (_ BitVec 64)) (t!42648 List!29104)) )
))
(declare-fun arrayNoDuplicates!0 (array!85132 (_ BitVec 32) List!29104) Bool)

(assert (=> b!1286043 (= res!854342 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29101))))

(declare-fun bm!62790 () Bool)

(assert (=> bm!62790 (= call!62792 call!62795)))

(declare-fun b!1286044 () Bool)

(declare-fun res!854341 () Bool)

(assert (=> b!1286044 (=> (not res!854341) (not e!734564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286044 (= res!854341 (validKeyInArray!0 (select (arr!41068 _keys!1741) from!2144)))))

(declare-fun b!1286045 () Bool)

(declare-fun lt!576989 () Unit!42509)

(assert (=> b!1286045 (= e!734563 lt!576989)))

(declare-fun lt!576987 () ListLongMap!19573)

(assert (=> b!1286045 (= lt!576987 call!62795)))

(declare-fun lt!576993 () ListLongMap!19573)

(declare-fun +!4310 (ListLongMap!19573 tuple2!21916) ListLongMap!19573)

(assert (=> b!1286045 (= lt!576993 (+!4310 lt!576987 (tuple2!21917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!576997 () Unit!42509)

(assert (=> b!1286045 (= lt!576997 call!62793)))

(assert (=> b!1286045 (contains!7919 lt!576993 k!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!25 ((_ BitVec 64) (_ BitVec 64) V!50489 ListLongMap!19573) Unit!42509)

(assert (=> b!1286045 (= lt!576989 (lemmaInListMapAfterAddingDiffThenInBefore!25 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!576987))))

(declare-fun call!62790 () Bool)

(assert (=> b!1286045 call!62790))

(declare-fun b!1286046 () Bool)

(declare-fun res!854339 () Bool)

(assert (=> b!1286046 (=> (not res!854339) (not e!734564))))

(declare-fun getCurrentListMap!4880 (array!85132 array!85130 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19573)

(assert (=> b!1286046 (= res!854339 (contains!7919 (getCurrentListMap!4880 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1286047 () Bool)

(declare-fun Unit!42511 () Unit!42509)

(assert (=> b!1286047 (= e!734560 Unit!42511)))

(declare-fun bm!62791 () Bool)

(assert (=> bm!62791 (= call!62790 (contains!7919 (ite c!124110 lt!576987 (ite c!124111 lt!576988 lt!576992)) k!1205))))

(declare-fun b!1286048 () Bool)

(declare-fun c!124109 () Bool)

(assert (=> b!1286048 (= c!124109 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!576996))))

(assert (=> b!1286048 (= e!734561 e!734560)))

(declare-fun b!1286049 () Bool)

(declare-fun res!854336 () Bool)

(assert (=> b!1286049 (=> (not res!854336) (not e!734564))))

(assert (=> b!1286049 (= res!854336 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41618 _keys!1741))))))

(declare-fun bm!62792 () Bool)

(assert (=> bm!62792 (= call!62793 (lemmaInListMapAfterAddingDiffThenInBefore!25 k!1205 (ite c!124110 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124111 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124110 minValue!1387 (ite c!124111 zeroValue!1387 minValue!1387)) (ite c!124110 lt!576993 (ite c!124111 lt!576988 lt!576992))))))

(declare-fun b!1286050 () Bool)

(declare-fun res!854343 () Bool)

(assert (=> b!1286050 (=> (not res!854343) (not e!734564))))

(assert (=> b!1286050 (= res!854343 (and (= (size!41617 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41618 _keys!1741) (size!41617 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286051 () Bool)

(declare-fun res!854337 () Bool)

(assert (=> b!1286051 (=> (not res!854337) (not e!734564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85132 (_ BitVec 32)) Bool)

(assert (=> b!1286051 (= res!854337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!854340 () Bool)

(assert (=> start!108886 (=> (not res!854340) (not e!734564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108886 (= res!854340 (validMask!0 mask!2175))))

(assert (=> start!108886 e!734564))

(assert (=> start!108886 tp_is_empty!34039))

(assert (=> start!108886 true))

(declare-fun e!734558 () Bool)

(declare-fun array_inv!31141 (array!85130) Bool)

(assert (=> start!108886 (and (array_inv!31141 _values!1445) e!734558)))

(declare-fun array_inv!31142 (array!85132) Bool)

(assert (=> start!108886 (array_inv!31142 _keys!1741)))

(assert (=> start!108886 tp!100313))

(declare-fun bm!62789 () Bool)

(assert (=> bm!62789 (= call!62794 call!62790)))

(declare-fun b!1286052 () Bool)

(assert (=> b!1286052 (= e!734558 (and e!734559 mapRes!52616))))

(declare-fun condMapEmpty!52616 () Bool)

(declare-fun mapDefault!52616 () ValueCell!16121)

