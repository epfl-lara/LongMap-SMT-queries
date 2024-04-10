; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108926 () Bool)

(assert start!108926)

(declare-fun b_free!28439 () Bool)

(declare-fun b_next!28439 () Bool)

(assert (=> start!108926 (= b_free!28439 (not b_next!28439))))

(declare-fun tp!100433 () Bool)

(declare-fun b_and!46523 () Bool)

(assert (=> start!108926 (= tp!100433 b_and!46523)))

(declare-fun b!1287101 () Bool)

(declare-fun e!735070 () Bool)

(declare-fun tp_is_empty!34079 () Bool)

(assert (=> b!1287101 (= e!735070 tp_is_empty!34079)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun e!735066 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun b!1287102 () Bool)

(declare-datatypes ((array!85206 0))(
  ( (array!85207 (arr!41105 (Array (_ BitVec 32) (_ BitVec 64))) (size!41655 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85206)

(assert (=> b!1287102 (= e!735066 (not (or (not (= k!1205 (select (arr!41105 _keys!1741) from!2144))) (bvslt (size!41655 _keys!1741) #b01111111111111111111111111111111))))))

(declare-datatypes ((V!50541 0))(
  ( (V!50542 (val!17114 Int)) )
))
(declare-datatypes ((tuple2!21952 0))(
  ( (tuple2!21953 (_1!10987 (_ BitVec 64)) (_2!10987 V!50541)) )
))
(declare-datatypes ((List!29135 0))(
  ( (Nil!29132) (Cons!29131 (h!30340 tuple2!21952) (t!42697 List!29135)) )
))
(declare-datatypes ((ListLongMap!19609 0))(
  ( (ListLongMap!19610 (toList!9820 List!29135)) )
))
(declare-fun contains!7936 (ListLongMap!19609 (_ BitVec 64)) Bool)

(assert (=> b!1287102 (not (contains!7936 (ListLongMap!19610 Nil!29132) k!1205))))

(declare-datatypes ((Unit!42563 0))(
  ( (Unit!42564) )
))
(declare-fun lt!577705 () Unit!42563)

(declare-fun emptyContainsNothing!13 ((_ BitVec 64)) Unit!42563)

(assert (=> b!1287102 (= lt!577705 (emptyContainsNothing!13 k!1205))))

(declare-fun lt!577711 () Unit!42563)

(declare-fun e!735065 () Unit!42563)

(assert (=> b!1287102 (= lt!577711 e!735065)))

(declare-fun c!124289 () Bool)

(declare-fun lt!577710 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287102 (= c!124289 (and (not lt!577710) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287102 (= lt!577710 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1287103 () Bool)

(declare-fun call!63151 () Bool)

(assert (=> b!1287103 call!63151))

(declare-fun lt!577703 () Unit!42563)

(declare-fun call!63152 () Unit!42563)

(assert (=> b!1287103 (= lt!577703 call!63152)))

(declare-fun lt!577709 () ListLongMap!19609)

(declare-fun call!63154 () ListLongMap!19609)

(assert (=> b!1287103 (= lt!577709 call!63154)))

(declare-fun e!735064 () Unit!42563)

(assert (=> b!1287103 (= e!735064 lt!577703)))

(declare-fun bm!63147 () Bool)

(declare-fun call!63150 () Bool)

(assert (=> bm!63147 (= call!63151 call!63150)))

(declare-fun b!1287104 () Bool)

(declare-fun res!854845 () Bool)

(assert (=> b!1287104 (=> (not res!854845) (not e!735066))))

(assert (=> b!1287104 (= res!854845 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41655 _keys!1741))))))

(declare-fun b!1287105 () Bool)

(declare-fun res!854844 () Bool)

(assert (=> b!1287105 (=> (not res!854844) (not e!735066))))

(assert (=> b!1287105 (= res!854844 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41655 _keys!1741))))))

(declare-fun c!124290 () Bool)

(declare-fun lt!577708 () ListLongMap!19609)

(declare-fun lt!577706 () ListLongMap!19609)

(declare-fun bm!63148 () Bool)

(assert (=> bm!63148 (= call!63150 (contains!7936 (ite c!124289 lt!577708 (ite c!124290 lt!577709 lt!577706)) k!1205))))

(declare-fun mapIsEmpty!52676 () Bool)

(declare-fun mapRes!52676 () Bool)

(assert (=> mapIsEmpty!52676 mapRes!52676))

(declare-fun b!1287106 () Bool)

(declare-fun e!735071 () Unit!42563)

(declare-fun lt!577704 () Unit!42563)

(assert (=> b!1287106 (= e!735071 lt!577704)))

(assert (=> b!1287106 (= lt!577706 call!63154)))

(assert (=> b!1287106 (= lt!577704 call!63152)))

(assert (=> b!1287106 call!63151))

(declare-fun minValue!1387 () V!50541)

(declare-fun zeroValue!1387 () V!50541)

(declare-fun call!63153 () ListLongMap!19609)

(declare-fun bm!63149 () Bool)

(declare-datatypes ((ValueCell!16141 0))(
  ( (ValueCellFull!16141 (v!19716 V!50541)) (EmptyCell!16141) )
))
(declare-datatypes ((array!85208 0))(
  ( (array!85209 (arr!41106 (Array (_ BitVec 32) ValueCell!16141)) (size!41656 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85208)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5953 (array!85206 array!85208 (_ BitVec 32) (_ BitVec 32) V!50541 V!50541 (_ BitVec 32) Int) ListLongMap!19609)

(assert (=> bm!63149 (= call!63153 (getCurrentListMapNoExtraKeys!5953 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63150 () Bool)

(declare-fun call!63155 () Unit!42563)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!41 ((_ BitVec 64) (_ BitVec 64) V!50541 ListLongMap!19609) Unit!42563)

(assert (=> bm!63150 (= call!63155 (lemmaInListMapAfterAddingDiffThenInBefore!41 k!1205 (ite (or c!124289 c!124290) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124289 c!124290) zeroValue!1387 minValue!1387) (ite c!124289 lt!577708 (ite c!124290 lt!577709 lt!577706))))))

(declare-fun b!1287107 () Bool)

(declare-fun res!854846 () Bool)

(assert (=> b!1287107 (=> (not res!854846) (not e!735066))))

(assert (=> b!1287107 (= res!854846 (and (= (size!41656 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41655 _keys!1741) (size!41656 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287108 () Bool)

(declare-fun c!124291 () Bool)

(assert (=> b!1287108 (= c!124291 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577710))))

(assert (=> b!1287108 (= e!735064 e!735071)))

(declare-fun b!1287109 () Bool)

(assert (=> b!1287109 (= e!735065 e!735064)))

(assert (=> b!1287109 (= c!124290 (and (not lt!577710) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63151 () Bool)

(assert (=> bm!63151 (= call!63152 call!63155)))

(declare-fun b!1287110 () Bool)

(declare-fun e!735069 () Bool)

(assert (=> b!1287110 (= e!735069 (and e!735070 mapRes!52676))))

(declare-fun condMapEmpty!52676 () Bool)

(declare-fun mapDefault!52676 () ValueCell!16141)

