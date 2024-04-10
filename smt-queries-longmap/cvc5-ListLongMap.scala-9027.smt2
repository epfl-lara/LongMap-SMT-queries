; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108922 () Bool)

(assert start!108922)

(declare-fun b_free!28435 () Bool)

(declare-fun b_next!28435 () Bool)

(assert (=> start!108922 (= b_free!28435 (not b_next!28435))))

(declare-fun tp!100421 () Bool)

(declare-fun b_and!46519 () Bool)

(assert (=> start!108922 (= tp!100421 b_and!46519)))

(declare-fun b!1286999 () Bool)

(declare-fun e!735019 () Bool)

(declare-fun tp_is_empty!34075 () Bool)

(assert (=> b!1286999 (= e!735019 tp_is_empty!34075)))

(declare-fun bm!63111 () Bool)

(declare-datatypes ((V!50537 0))(
  ( (V!50538 (val!17112 Int)) )
))
(declare-datatypes ((tuple2!21948 0))(
  ( (tuple2!21949 (_1!10985 (_ BitVec 64)) (_2!10985 V!50537)) )
))
(declare-datatypes ((List!29131 0))(
  ( (Nil!29128) (Cons!29127 (h!30336 tuple2!21948) (t!42693 List!29131)) )
))
(declare-datatypes ((ListLongMap!19605 0))(
  ( (ListLongMap!19606 (toList!9818 List!29131)) )
))
(declare-fun call!63116 () ListLongMap!19605)

(declare-fun call!63115 () ListLongMap!19605)

(assert (=> bm!63111 (= call!63116 call!63115)))

(declare-fun b!1287001 () Bool)

(declare-fun res!854796 () Bool)

(declare-fun e!735021 () Bool)

(assert (=> b!1287001 (=> (not res!854796) (not e!735021))))

(declare-fun minValue!1387 () V!50537)

(declare-fun zeroValue!1387 () V!50537)

(declare-datatypes ((ValueCell!16139 0))(
  ( (ValueCellFull!16139 (v!19714 V!50537)) (EmptyCell!16139) )
))
(declare-datatypes ((array!85198 0))(
  ( (array!85199 (arr!41101 (Array (_ BitVec 32) ValueCell!16139)) (size!41651 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85198)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85200 0))(
  ( (array!85201 (arr!41102 (Array (_ BitVec 32) (_ BitVec 64))) (size!41652 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85200)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun contains!7934 (ListLongMap!19605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4893 (array!85200 array!85198 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19605)

(assert (=> b!1287001 (= res!854796 (contains!7934 (getCurrentListMap!4893 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287002 () Bool)

(declare-fun res!854798 () Bool)

(assert (=> b!1287002 (=> (not res!854798) (not e!735021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287002 (= res!854798 (validKeyInArray!0 (select (arr!41102 _keys!1741) from!2144)))))

(declare-fun b!1287003 () Bool)

(assert (=> b!1287003 (= e!735021 (not (or (not (= k!1205 (select (arr!41102 _keys!1741) from!2144))) (bvslt (size!41652 _keys!1741) #b01111111111111111111111111111111))))))

(assert (=> b!1287003 (not (contains!7934 (ListLongMap!19606 Nil!29128) k!1205))))

(declare-datatypes ((Unit!42557 0))(
  ( (Unit!42558) )
))
(declare-fun lt!577640 () Unit!42557)

(declare-fun emptyContainsNothing!11 ((_ BitVec 64)) Unit!42557)

(assert (=> b!1287003 (= lt!577640 (emptyContainsNothing!11 k!1205))))

(declare-fun lt!577638 () Unit!42557)

(declare-fun e!735018 () Unit!42557)

(assert (=> b!1287003 (= lt!577638 e!735018)))

(declare-fun c!124273 () Bool)

(declare-fun lt!577644 () Bool)

(assert (=> b!1287003 (= c!124273 (and (not lt!577644) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287003 (= lt!577644 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!124272 () Bool)

(declare-fun lt!577635 () ListLongMap!19605)

(declare-fun lt!577636 () ListLongMap!19605)

(declare-fun lt!577645 () ListLongMap!19605)

(declare-fun bm!63112 () Bool)

(declare-fun call!63114 () Bool)

(assert (=> bm!63112 (= call!63114 (contains!7934 (ite c!124273 lt!577645 (ite c!124272 lt!577636 lt!577635)) k!1205))))

(declare-fun b!1287004 () Bool)

(declare-fun e!735016 () Unit!42557)

(declare-fun Unit!42559 () Unit!42557)

(assert (=> b!1287004 (= e!735016 Unit!42559)))

(declare-fun b!1287005 () Bool)

(declare-fun res!854801 () Bool)

(assert (=> b!1287005 (=> (not res!854801) (not e!735021))))

(assert (=> b!1287005 (= res!854801 (and (= (size!41651 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41652 _keys!1741) (size!41651 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287006 () Bool)

(declare-fun e!735017 () Bool)

(assert (=> b!1287006 (= e!735017 tp_is_empty!34075)))

(declare-fun mapNonEmpty!52670 () Bool)

(declare-fun mapRes!52670 () Bool)

(declare-fun tp!100420 () Bool)

(assert (=> mapNonEmpty!52670 (= mapRes!52670 (and tp!100420 e!735019))))

(declare-fun mapValue!52670 () ValueCell!16139)

(declare-fun mapKey!52670 () (_ BitVec 32))

(declare-fun mapRest!52670 () (Array (_ BitVec 32) ValueCell!16139))

(assert (=> mapNonEmpty!52670 (= (arr!41101 _values!1445) (store mapRest!52670 mapKey!52670 mapValue!52670))))

(declare-fun call!63119 () Unit!42557)

(declare-fun bm!63113 () Bool)

(declare-fun lt!577643 () ListLongMap!19605)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!39 ((_ BitVec 64) (_ BitVec 64) V!50537 ListLongMap!19605) Unit!42557)

(assert (=> bm!63113 (= call!63119 (lemmaInListMapAfterAddingDiffThenInBefore!39 k!1205 (ite c!124273 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124272 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124273 minValue!1387 (ite c!124272 zeroValue!1387 minValue!1387)) (ite c!124273 lt!577643 (ite c!124272 lt!577636 lt!577635))))))

(declare-fun mapIsEmpty!52670 () Bool)

(assert (=> mapIsEmpty!52670 mapRes!52670))

(declare-fun bm!63114 () Bool)

(declare-fun call!63118 () Unit!42557)

(assert (=> bm!63114 (= call!63118 call!63119)))

(declare-fun b!1287007 () Bool)

(declare-fun c!124271 () Bool)

(assert (=> b!1287007 (= c!124271 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577644))))

(declare-fun e!735022 () Unit!42557)

(assert (=> b!1287007 (= e!735022 e!735016)))

(declare-fun bm!63115 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5951 (array!85200 array!85198 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19605)

(assert (=> bm!63115 (= call!63115 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!854795 () Bool)

(assert (=> start!108922 (=> (not res!854795) (not e!735021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108922 (= res!854795 (validMask!0 mask!2175))))

(assert (=> start!108922 e!735021))

(assert (=> start!108922 tp_is_empty!34075))

(assert (=> start!108922 true))

(declare-fun e!735023 () Bool)

(declare-fun array_inv!31167 (array!85198) Bool)

(assert (=> start!108922 (and (array_inv!31167 _values!1445) e!735023)))

(declare-fun array_inv!31168 (array!85200) Bool)

(assert (=> start!108922 (array_inv!31168 _keys!1741)))

(assert (=> start!108922 tp!100421))

(declare-fun b!1287000 () Bool)

(declare-fun res!854799 () Bool)

(assert (=> b!1287000 (=> (not res!854799) (not e!735021))))

(declare-datatypes ((List!29132 0))(
  ( (Nil!29129) (Cons!29128 (h!30337 (_ BitVec 64)) (t!42694 List!29132)) )
))
(declare-fun arrayNoDuplicates!0 (array!85200 (_ BitVec 32) List!29132) Bool)

(assert (=> b!1287000 (= res!854799 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29129))))

(declare-fun b!1287008 () Bool)

(declare-fun call!63117 () Bool)

(assert (=> b!1287008 call!63117))

(declare-fun lt!577639 () Unit!42557)

(assert (=> b!1287008 (= lt!577639 call!63118)))

(assert (=> b!1287008 (= lt!577636 call!63116)))

(assert (=> b!1287008 (= e!735022 lt!577639)))

(declare-fun b!1287009 () Bool)

(declare-fun res!854800 () Bool)

(assert (=> b!1287009 (=> (not res!854800) (not e!735021))))

(assert (=> b!1287009 (= res!854800 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41652 _keys!1741))))))

(declare-fun b!1287010 () Bool)

(declare-fun res!854802 () Bool)

(assert (=> b!1287010 (=> (not res!854802) (not e!735021))))

(assert (=> b!1287010 (= res!854802 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41652 _keys!1741))))))

(declare-fun b!1287011 () Bool)

(declare-fun lt!577641 () Unit!42557)

(assert (=> b!1287011 (= e!735018 lt!577641)))

(assert (=> b!1287011 (= lt!577645 call!63115)))

(declare-fun +!4322 (ListLongMap!19605 tuple2!21948) ListLongMap!19605)

(assert (=> b!1287011 (= lt!577643 (+!4322 lt!577645 (tuple2!21949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577637 () Unit!42557)

(assert (=> b!1287011 (= lt!577637 call!63119)))

(assert (=> b!1287011 (contains!7934 lt!577643 k!1205)))

(assert (=> b!1287011 (= lt!577641 (lemmaInListMapAfterAddingDiffThenInBefore!39 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577645))))

(assert (=> b!1287011 call!63114))

(declare-fun bm!63116 () Bool)

(assert (=> bm!63116 (= call!63117 call!63114)))

(declare-fun b!1287012 () Bool)

(assert (=> b!1287012 (= e!735023 (and e!735017 mapRes!52670))))

(declare-fun condMapEmpty!52670 () Bool)

(declare-fun mapDefault!52670 () ValueCell!16139)

