; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108910 () Bool)

(assert start!108910)

(declare-fun b_free!28423 () Bool)

(declare-fun b_next!28423 () Bool)

(assert (=> start!108910 (= b_free!28423 (not b_next!28423))))

(declare-fun tp!100384 () Bool)

(declare-fun b_and!46507 () Bool)

(assert (=> start!108910 (= tp!100384 b_and!46507)))

(declare-fun mapIsEmpty!52652 () Bool)

(declare-fun mapRes!52652 () Bool)

(assert (=> mapIsEmpty!52652 mapRes!52652))

(declare-fun b!1286693 () Bool)

(declare-datatypes ((Unit!42541 0))(
  ( (Unit!42542) )
))
(declare-fun e!734879 () Unit!42541)

(declare-fun lt!577443 () Unit!42541)

(assert (=> b!1286693 (= e!734879 lt!577443)))

(declare-datatypes ((V!50521 0))(
  ( (V!50522 (val!17106 Int)) )
))
(declare-datatypes ((tuple2!21936 0))(
  ( (tuple2!21937 (_1!10979 (_ BitVec 64)) (_2!10979 V!50521)) )
))
(declare-datatypes ((List!29121 0))(
  ( (Nil!29118) (Cons!29117 (h!30326 tuple2!21936) (t!42683 List!29121)) )
))
(declare-datatypes ((ListLongMap!19593 0))(
  ( (ListLongMap!19594 (toList!9812 List!29121)) )
))
(declare-fun lt!577446 () ListLongMap!19593)

(declare-fun call!63008 () ListLongMap!19593)

(assert (=> b!1286693 (= lt!577446 call!63008)))

(declare-fun call!63011 () Unit!42541)

(assert (=> b!1286693 (= lt!577443 call!63011)))

(declare-fun call!63009 () Bool)

(assert (=> b!1286693 call!63009))

(declare-fun minValue!1387 () V!50521)

(declare-fun zeroValue!1387 () V!50521)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16133 0))(
  ( (ValueCellFull!16133 (v!19708 V!50521)) (EmptyCell!16133) )
))
(declare-datatypes ((array!85174 0))(
  ( (array!85175 (arr!41089 (Array (_ BitVec 32) ValueCell!16133)) (size!41639 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85174)

(declare-fun call!63007 () ListLongMap!19593)

(declare-datatypes ((array!85176 0))(
  ( (array!85177 (arr!41090 (Array (_ BitVec 32) (_ BitVec 64))) (size!41640 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85176)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun bm!63003 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5946 (array!85176 array!85174 (_ BitVec 32) (_ BitVec 32) V!50521 V!50521 (_ BitVec 32) Int) ListLongMap!19593)

(assert (=> bm!63003 (= call!63007 (getCurrentListMapNoExtraKeys!5946 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!854654 () Bool)

(declare-fun e!734877 () Bool)

(assert (=> start!108910 (=> (not res!854654) (not e!734877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108910 (= res!854654 (validMask!0 mask!2175))))

(assert (=> start!108910 e!734877))

(declare-fun tp_is_empty!34063 () Bool)

(assert (=> start!108910 tp_is_empty!34063))

(assert (=> start!108910 true))

(declare-fun e!734876 () Bool)

(declare-fun array_inv!31157 (array!85174) Bool)

(assert (=> start!108910 (and (array_inv!31157 _values!1445) e!734876)))

(declare-fun array_inv!31158 (array!85176) Bool)

(assert (=> start!108910 (array_inv!31158 _keys!1741)))

(assert (=> start!108910 tp!100384))

(declare-fun mapNonEmpty!52652 () Bool)

(declare-fun tp!100385 () Bool)

(declare-fun e!734875 () Bool)

(assert (=> mapNonEmpty!52652 (= mapRes!52652 (and tp!100385 e!734875))))

(declare-fun mapKey!52652 () (_ BitVec 32))

(declare-fun mapRest!52652 () (Array (_ BitVec 32) ValueCell!16133))

(declare-fun mapValue!52652 () ValueCell!16133)

(assert (=> mapNonEmpty!52652 (= (arr!41089 _values!1445) (store mapRest!52652 mapKey!52652 mapValue!52652))))

(declare-fun c!124218 () Bool)

(declare-fun c!124217 () Bool)

(declare-fun lt!577439 () ListLongMap!19593)

(declare-fun bm!63004 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun call!63010 () Unit!42541)

(declare-fun lt!577438 () ListLongMap!19593)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!34 ((_ BitVec 64) (_ BitVec 64) V!50521 ListLongMap!19593) Unit!42541)

(assert (=> bm!63004 (= call!63010 (lemmaInListMapAfterAddingDiffThenInBefore!34 k!1205 (ite c!124217 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124218 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124217 minValue!1387 (ite c!124218 zeroValue!1387 minValue!1387)) (ite c!124217 lt!577439 (ite c!124218 lt!577438 lt!577446))))))

(declare-fun b!1286694 () Bool)

(declare-fun e!734873 () Unit!42541)

(declare-fun lt!577445 () Unit!42541)

(assert (=> b!1286694 (= e!734873 lt!577445)))

(declare-fun lt!577437 () ListLongMap!19593)

(assert (=> b!1286694 (= lt!577437 call!63007)))

(declare-fun +!4318 (ListLongMap!19593 tuple2!21936) ListLongMap!19593)

(assert (=> b!1286694 (= lt!577439 (+!4318 lt!577437 (tuple2!21937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577440 () Unit!42541)

(assert (=> b!1286694 (= lt!577440 call!63010)))

(declare-fun call!63006 () Bool)

(assert (=> b!1286694 call!63006))

(assert (=> b!1286694 (= lt!577445 (lemmaInListMapAfterAddingDiffThenInBefore!34 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577437))))

(declare-fun contains!7928 (ListLongMap!19593 (_ BitVec 64)) Bool)

(assert (=> b!1286694 (contains!7928 lt!577437 k!1205)))

(declare-fun b!1286695 () Bool)

(assert (=> b!1286695 call!63009))

(declare-fun lt!577441 () Unit!42541)

(assert (=> b!1286695 (= lt!577441 call!63011)))

(assert (=> b!1286695 (= lt!577438 call!63008)))

(declare-fun e!734878 () Unit!42541)

(assert (=> b!1286695 (= e!734878 lt!577441)))

(declare-fun b!1286696 () Bool)

(declare-fun e!734874 () Bool)

(assert (=> b!1286696 (= e!734876 (and e!734874 mapRes!52652))))

(declare-fun condMapEmpty!52652 () Bool)

(declare-fun mapDefault!52652 () ValueCell!16133)

