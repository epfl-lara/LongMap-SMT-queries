; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108914 () Bool)

(assert start!108914)

(declare-fun b_free!28427 () Bool)

(declare-fun b_next!28427 () Bool)

(assert (=> start!108914 (= b_free!28427 (not b_next!28427))))

(declare-fun tp!100397 () Bool)

(declare-fun b_and!46511 () Bool)

(assert (=> start!108914 (= tp!100397 b_and!46511)))

(declare-fun b!1286795 () Bool)

(declare-fun e!734927 () Bool)

(declare-fun tp_is_empty!34067 () Bool)

(assert (=> b!1286795 (= e!734927 tp_is_empty!34067)))

(declare-fun res!854705 () Bool)

(declare-fun e!734922 () Bool)

(assert (=> start!108914 (=> (not res!854705) (not e!734922))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108914 (= res!854705 (validMask!0 mask!2175))))

(assert (=> start!108914 e!734922))

(assert (=> start!108914 tp_is_empty!34067))

(assert (=> start!108914 true))

(declare-datatypes ((V!50525 0))(
  ( (V!50526 (val!17108 Int)) )
))
(declare-datatypes ((ValueCell!16135 0))(
  ( (ValueCellFull!16135 (v!19710 V!50525)) (EmptyCell!16135) )
))
(declare-datatypes ((array!85182 0))(
  ( (array!85183 (arr!41093 (Array (_ BitVec 32) ValueCell!16135)) (size!41643 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85182)

(declare-fun e!734920 () Bool)

(declare-fun array_inv!31161 (array!85182) Bool)

(assert (=> start!108914 (and (array_inv!31161 _values!1445) e!734920)))

(declare-datatypes ((array!85184 0))(
  ( (array!85185 (arr!41094 (Array (_ BitVec 32) (_ BitVec 64))) (size!41644 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85184)

(declare-fun array_inv!31162 (array!85184) Bool)

(assert (=> start!108914 (array_inv!31162 _keys!1741)))

(assert (=> start!108914 tp!100397))

(declare-fun b!1286796 () Bool)

(declare-datatypes ((Unit!42546 0))(
  ( (Unit!42547) )
))
(declare-fun e!734925 () Unit!42546)

(declare-fun Unit!42548 () Unit!42546)

(assert (=> b!1286796 (= e!734925 Unit!42548)))

(declare-fun b!1286797 () Bool)

(declare-fun res!854700 () Bool)

(assert (=> b!1286797 (=> (not res!854700) (not e!734922))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1286797 (= res!854700 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41644 _keys!1741))))))

(declare-fun bm!63039 () Bool)

(declare-datatypes ((tuple2!21940 0))(
  ( (tuple2!21941 (_1!10981 (_ BitVec 64)) (_2!10981 V!50525)) )
))
(declare-datatypes ((List!29124 0))(
  ( (Nil!29121) (Cons!29120 (h!30329 tuple2!21940) (t!42686 List!29124)) )
))
(declare-datatypes ((ListLongMap!19597 0))(
  ( (ListLongMap!19598 (toList!9814 List!29124)) )
))
(declare-fun call!63042 () ListLongMap!19597)

(declare-fun call!63043 () ListLongMap!19597)

(assert (=> bm!63039 (= call!63042 call!63043)))

(declare-fun b!1286798 () Bool)

(declare-fun res!854701 () Bool)

(assert (=> b!1286798 (=> (not res!854701) (not e!734922))))

(declare-datatypes ((List!29125 0))(
  ( (Nil!29122) (Cons!29121 (h!30330 (_ BitVec 64)) (t!42687 List!29125)) )
))
(declare-fun arrayNoDuplicates!0 (array!85184 (_ BitVec 32) List!29125) Bool)

(assert (=> b!1286798 (= res!854701 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29122))))

(declare-fun bm!63040 () Bool)

(declare-fun call!63046 () Bool)

(declare-fun call!63047 () Bool)

(assert (=> bm!63040 (= call!63046 call!63047)))

(declare-fun mapIsEmpty!52658 () Bool)

(declare-fun mapRes!52658 () Bool)

(assert (=> mapIsEmpty!52658 mapRes!52658))

(declare-fun mapNonEmpty!52658 () Bool)

(declare-fun tp!100396 () Bool)

(assert (=> mapNonEmpty!52658 (= mapRes!52658 (and tp!100396 e!734927))))

(declare-fun mapRest!52658 () (Array (_ BitVec 32) ValueCell!16135))

(declare-fun mapValue!52658 () ValueCell!16135)

(declare-fun mapKey!52658 () (_ BitVec 32))

(assert (=> mapNonEmpty!52658 (= (arr!41093 _values!1445) (store mapRest!52658 mapKey!52658 mapValue!52658))))

(declare-fun b!1286799 () Bool)

(declare-fun c!124237 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!577509 () Bool)

(assert (=> b!1286799 (= c!124237 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577509))))

(declare-fun e!734924 () Unit!42546)

(assert (=> b!1286799 (= e!734924 e!734925)))

(declare-fun b!1286800 () Bool)

(assert (=> b!1286800 call!63046))

(declare-fun lt!577505 () Unit!42546)

(declare-fun call!63044 () Unit!42546)

(assert (=> b!1286800 (= lt!577505 call!63044)))

(declare-fun lt!577507 () ListLongMap!19597)

(assert (=> b!1286800 (= lt!577507 call!63042)))

(assert (=> b!1286800 (= e!734924 lt!577505)))

(declare-fun b!1286801 () Bool)

(declare-fun res!854706 () Bool)

(assert (=> b!1286801 (=> (not res!854706) (not e!734922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85184 (_ BitVec 32)) Bool)

(assert (=> b!1286801 (= res!854706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286802 () Bool)

(declare-fun e!734926 () Unit!42546)

(assert (=> b!1286802 (= e!734926 e!734924)))

(declare-fun c!124235 () Bool)

(assert (=> b!1286802 (= c!124235 (and (not lt!577509) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63041 () Bool)

(declare-fun call!63045 () Unit!42546)

(assert (=> bm!63041 (= call!63044 call!63045)))

(declare-fun bm!63042 () Bool)

(declare-fun lt!577504 () ListLongMap!19597)

(declare-fun lt!577503 () ListLongMap!19597)

(declare-fun c!124236 () Bool)

(declare-fun contains!7930 (ListLongMap!19597 (_ BitVec 64)) Bool)

(assert (=> bm!63042 (= call!63047 (contains!7930 (ite c!124236 lt!577503 (ite c!124235 lt!577507 lt!577504)) k!1205))))

(declare-fun b!1286803 () Bool)

(declare-fun lt!577512 () Unit!42546)

(assert (=> b!1286803 (= e!734926 lt!577512)))

(assert (=> b!1286803 (= lt!577503 call!63043)))

(declare-fun lt!577510 () ListLongMap!19597)

(declare-fun zeroValue!1387 () V!50525)

(declare-fun +!4320 (ListLongMap!19597 tuple2!21940) ListLongMap!19597)

(assert (=> b!1286803 (= lt!577510 (+!4320 lt!577503 (tuple2!21941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577506 () Unit!42546)

(assert (=> b!1286803 (= lt!577506 call!63045)))

(assert (=> b!1286803 (contains!7930 lt!577510 k!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!36 ((_ BitVec 64) (_ BitVec 64) V!50525 ListLongMap!19597) Unit!42546)

(assert (=> b!1286803 (= lt!577512 (lemmaInListMapAfterAddingDiffThenInBefore!36 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577503))))

(assert (=> b!1286803 call!63047))

(declare-fun b!1286804 () Bool)

(declare-fun res!854699 () Bool)

(assert (=> b!1286804 (=> (not res!854699) (not e!734922))))

(declare-fun minValue!1387 () V!50525)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4889 (array!85184 array!85182 (_ BitVec 32) (_ BitVec 32) V!50525 V!50525 (_ BitVec 32) Int) ListLongMap!19597)

(assert (=> b!1286804 (= res!854699 (contains!7930 (getCurrentListMap!4889 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1286805 () Bool)

(declare-fun e!734923 () Bool)

(assert (=> b!1286805 (= e!734923 tp_is_empty!34067)))

(declare-fun bm!63043 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5948 (array!85184 array!85182 (_ BitVec 32) (_ BitVec 32) V!50525 V!50525 (_ BitVec 32) Int) ListLongMap!19597)

(assert (=> bm!63043 (= call!63043 (getCurrentListMapNoExtraKeys!5948 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286806 () Bool)

(declare-fun res!854703 () Bool)

(assert (=> b!1286806 (=> (not res!854703) (not e!734922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286806 (= res!854703 (validKeyInArray!0 (select (arr!41094 _keys!1741) from!2144)))))

(declare-fun b!1286807 () Bool)

(declare-fun res!854702 () Bool)

(assert (=> b!1286807 (=> (not res!854702) (not e!734922))))

(assert (=> b!1286807 (= res!854702 (and (= (size!41643 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41644 _keys!1741) (size!41643 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63044 () Bool)

(assert (=> bm!63044 (= call!63045 (lemmaInListMapAfterAddingDiffThenInBefore!36 k!1205 (ite c!124236 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124235 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124236 minValue!1387 (ite c!124235 zeroValue!1387 minValue!1387)) (ite c!124236 lt!577510 (ite c!124235 lt!577507 lt!577504))))))

(declare-fun b!1286808 () Bool)

(declare-fun res!854704 () Bool)

(assert (=> b!1286808 (=> (not res!854704) (not e!734922))))

(assert (=> b!1286808 (= res!854704 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41644 _keys!1741))))))

(declare-fun b!1286809 () Bool)

(assert (=> b!1286809 (= e!734922 (not true))))

(assert (=> b!1286809 (not (contains!7930 (ListLongMap!19598 Nil!29121) k!1205))))

(declare-fun lt!577511 () Unit!42546)

(declare-fun emptyContainsNothing!8 ((_ BitVec 64)) Unit!42546)

(assert (=> b!1286809 (= lt!577511 (emptyContainsNothing!8 k!1205))))

(declare-fun lt!577508 () Unit!42546)

(assert (=> b!1286809 (= lt!577508 e!734926)))

(assert (=> b!1286809 (= c!124236 (and (not lt!577509) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286809 (= lt!577509 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286810 () Bool)

(assert (=> b!1286810 (= e!734920 (and e!734923 mapRes!52658))))

(declare-fun condMapEmpty!52658 () Bool)

(declare-fun mapDefault!52658 () ValueCell!16135)

