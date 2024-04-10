; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108902 () Bool)

(assert start!108902)

(declare-fun b_free!28415 () Bool)

(declare-fun b_next!28415 () Bool)

(assert (=> start!108902 (= b_free!28415 (not b_next!28415))))

(declare-fun tp!100360 () Bool)

(declare-fun b_and!46491 () Bool)

(assert (=> start!108902 (= tp!100360 b_and!46491)))

(declare-fun bm!62931 () Bool)

(declare-datatypes ((V!50509 0))(
  ( (V!50510 (val!17102 Int)) )
))
(declare-datatypes ((tuple2!21930 0))(
  ( (tuple2!21931 (_1!10976 (_ BitVec 64)) (_2!10976 V!50509)) )
))
(declare-datatypes ((List!29115 0))(
  ( (Nil!29112) (Cons!29111 (h!30320 tuple2!21930) (t!42671 List!29115)) )
))
(declare-datatypes ((ListLongMap!19587 0))(
  ( (ListLongMap!19588 (toList!9809 List!29115)) )
))
(declare-fun call!62937 () ListLongMap!19587)

(declare-fun call!62936 () ListLongMap!19587)

(assert (=> bm!62931 (= call!62937 call!62936)))

(declare-fun b!1286472 () Bool)

(declare-fun e!734770 () Bool)

(declare-fun tp_is_empty!34055 () Bool)

(assert (=> b!1286472 (= e!734770 tp_is_empty!34055)))

(declare-fun b!1286473 () Bool)

(declare-datatypes ((Unit!42529 0))(
  ( (Unit!42530) )
))
(declare-fun e!734766 () Unit!42529)

(declare-fun lt!577290 () Unit!42529)

(assert (=> b!1286473 (= e!734766 lt!577290)))

(declare-fun lt!577287 () ListLongMap!19587)

(assert (=> b!1286473 (= lt!577287 call!62936)))

(declare-fun lt!577296 () ListLongMap!19587)

(declare-fun zeroValue!1387 () V!50509)

(declare-fun +!4315 (ListLongMap!19587 tuple2!21930) ListLongMap!19587)

(assert (=> b!1286473 (= lt!577296 (+!4315 lt!577287 (tuple2!21931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577285 () Unit!42529)

(declare-fun call!62934 () Unit!42529)

(assert (=> b!1286473 (= lt!577285 call!62934)))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7925 (ListLongMap!19587 (_ BitVec 64)) Bool)

(assert (=> b!1286473 (contains!7925 lt!577296 k!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!31 ((_ BitVec 64) (_ BitVec 64) V!50509 ListLongMap!19587) Unit!42529)

(assert (=> b!1286473 (= lt!577290 (lemmaInListMapAfterAddingDiffThenInBefore!31 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577287))))

(declare-fun call!62939 () Bool)

(assert (=> b!1286473 call!62939))

(declare-fun b!1286474 () Bool)

(declare-fun c!124182 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!577289 () Bool)

(assert (=> b!1286474 (= c!124182 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577289))))

(declare-fun e!734771 () Unit!42529)

(declare-fun e!734772 () Unit!42529)

(assert (=> b!1286474 (= e!734771 e!734772)))

(declare-fun mapNonEmpty!52640 () Bool)

(declare-fun mapRes!52640 () Bool)

(declare-fun tp!100361 () Bool)

(declare-fun e!734769 () Bool)

(assert (=> mapNonEmpty!52640 (= mapRes!52640 (and tp!100361 e!734769))))

(declare-datatypes ((ValueCell!16129 0))(
  ( (ValueCellFull!16129 (v!19704 V!50509)) (EmptyCell!16129) )
))
(declare-fun mapRest!52640 () (Array (_ BitVec 32) ValueCell!16129))

(declare-datatypes ((array!85158 0))(
  ( (array!85159 (arr!41081 (Array (_ BitVec 32) ValueCell!16129)) (size!41631 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85158)

(declare-fun mapValue!52640 () ValueCell!16129)

(declare-fun mapKey!52640 () (_ BitVec 32))

(assert (=> mapNonEmpty!52640 (= (arr!41081 _values!1445) (store mapRest!52640 mapKey!52640 mapValue!52640))))

(declare-fun b!1286475 () Bool)

(declare-fun res!854553 () Bool)

(declare-fun e!734773 () Bool)

(assert (=> b!1286475 (=> (not res!854553) (not e!734773))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85160 0))(
  ( (array!85161 (arr!41082 (Array (_ BitVec 32) (_ BitVec 64))) (size!41632 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85160)

(assert (=> b!1286475 (= res!854553 (and (= (size!41631 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41632 _keys!1741) (size!41631 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286476 () Bool)

(declare-fun res!854551 () Bool)

(assert (=> b!1286476 (=> (not res!854551) (not e!734773))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286476 (= res!854551 (validKeyInArray!0 (select (arr!41082 _keys!1741) from!2144)))))

(declare-fun bm!62932 () Bool)

(declare-fun call!62938 () Unit!42529)

(assert (=> bm!62932 (= call!62938 call!62934)))

(declare-fun b!1286477 () Bool)

(declare-fun call!62935 () Bool)

(assert (=> b!1286477 call!62935))

(declare-fun lt!577297 () Unit!42529)

(assert (=> b!1286477 (= lt!577297 call!62938)))

(declare-fun lt!577291 () ListLongMap!19587)

(assert (=> b!1286477 (= lt!577291 call!62937)))

(assert (=> b!1286477 (= e!734771 lt!577297)))

(declare-fun b!1286478 () Bool)

(declare-fun res!854550 () Bool)

(assert (=> b!1286478 (=> (not res!854550) (not e!734773))))

(declare-datatypes ((List!29116 0))(
  ( (Nil!29113) (Cons!29112 (h!30321 (_ BitVec 64)) (t!42672 List!29116)) )
))
(declare-fun arrayNoDuplicates!0 (array!85160 (_ BitVec 32) List!29116) Bool)

(assert (=> b!1286478 (= res!854550 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29113))))

(declare-fun b!1286479 () Bool)

(declare-fun res!854552 () Bool)

(assert (=> b!1286479 (=> (not res!854552) (not e!734773))))

(declare-fun minValue!1387 () V!50509)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4886 (array!85160 array!85158 (_ BitVec 32) (_ BitVec 32) V!50509 V!50509 (_ BitVec 32) Int) ListLongMap!19587)

(assert (=> b!1286479 (= res!854552 (contains!7925 (getCurrentListMap!4886 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun bm!62933 () Bool)

(assert (=> bm!62933 (= call!62935 call!62939)))

(declare-fun b!1286480 () Bool)

(declare-fun e!734774 () Bool)

(assert (=> b!1286480 (= e!734774 true)))

(declare-fun lt!577292 () V!50509)

(assert (=> b!1286480 (not (contains!7925 (+!4315 (ListLongMap!19588 Nil!29112) (tuple2!21931 (select (arr!41082 _keys!1741) from!2144) lt!577292)) k!1205))))

(declare-fun lt!577288 () Unit!42529)

(declare-fun addStillNotContains!338 (ListLongMap!19587 (_ BitVec 64) V!50509 (_ BitVec 64)) Unit!42529)

(assert (=> b!1286480 (= lt!577288 (addStillNotContains!338 (ListLongMap!19588 Nil!29112) (select (arr!41082 _keys!1741) from!2144) lt!577292 k!1205))))

(declare-fun get!20857 (ValueCell!16129 V!50509) V!50509)

(declare-fun dynLambda!3412 (Int (_ BitVec 64)) V!50509)

(assert (=> b!1286480 (= lt!577292 (get!20857 (select (arr!41081 _values!1445) from!2144) (dynLambda!3412 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!854546 () Bool)

(assert (=> start!108902 (=> (not res!854546) (not e!734773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108902 (= res!854546 (validMask!0 mask!2175))))

(assert (=> start!108902 e!734773))

(assert (=> start!108902 tp_is_empty!34055))

(assert (=> start!108902 true))

(declare-fun e!734767 () Bool)

(declare-fun array_inv!31151 (array!85158) Bool)

(assert (=> start!108902 (and (array_inv!31151 _values!1445) e!734767)))

(declare-fun array_inv!31152 (array!85160) Bool)

(assert (=> start!108902 (array_inv!31152 _keys!1741)))

(assert (=> start!108902 tp!100360))

(declare-fun b!1286471 () Bool)

(declare-fun Unit!42531 () Unit!42529)

(assert (=> b!1286471 (= e!734772 Unit!42531)))

(declare-fun b!1286481 () Bool)

(assert (=> b!1286481 (= e!734767 (and e!734770 mapRes!52640))))

(declare-fun condMapEmpty!52640 () Bool)

(declare-fun mapDefault!52640 () ValueCell!16129)

