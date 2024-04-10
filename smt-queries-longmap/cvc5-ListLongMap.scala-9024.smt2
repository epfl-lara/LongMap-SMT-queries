; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108904 () Bool)

(assert start!108904)

(declare-fun b_free!28417 () Bool)

(declare-fun b_next!28417 () Bool)

(assert (=> start!108904 (= b_free!28417 (not b_next!28417))))

(declare-fun tp!100366 () Bool)

(declare-fun b_and!46495 () Bool)

(assert (=> start!108904 (= tp!100366 b_and!46495)))

(declare-fun b!1286527 () Bool)

(declare-fun res!854575 () Bool)

(declare-fun e!734798 () Bool)

(assert (=> b!1286527 (=> (not res!854575) (not e!734798))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85162 0))(
  ( (array!85163 (arr!41083 (Array (_ BitVec 32) (_ BitVec 64))) (size!41633 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85162)

(assert (=> b!1286527 (= res!854575 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41633 _keys!1741))))))

(declare-fun b!1286528 () Bool)

(declare-fun e!734800 () Bool)

(declare-fun tp_is_empty!34057 () Bool)

(assert (=> b!1286528 (= e!734800 tp_is_empty!34057)))

(declare-fun b!1286529 () Bool)

(declare-fun res!854574 () Bool)

(assert (=> b!1286529 (=> (not res!854574) (not e!734798))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50513 0))(
  ( (V!50514 (val!17103 Int)) )
))
(declare-datatypes ((ValueCell!16130 0))(
  ( (ValueCellFull!16130 (v!19705 V!50513)) (EmptyCell!16130) )
))
(declare-datatypes ((array!85164 0))(
  ( (array!85165 (arr!41084 (Array (_ BitVec 32) ValueCell!16130)) (size!41634 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85164)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286529 (= res!854574 (and (= (size!41634 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41633 _keys!1741) (size!41634 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286530 () Bool)

(declare-datatypes ((Unit!42532 0))(
  ( (Unit!42533) )
))
(declare-fun e!734799 () Unit!42532)

(declare-fun Unit!42534 () Unit!42532)

(assert (=> b!1286530 (= e!734799 Unit!42534)))

(declare-fun b!1286531 () Bool)

(declare-fun c!124191 () Bool)

(declare-fun lt!577329 () Bool)

(assert (=> b!1286531 (= c!124191 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577329))))

(declare-fun e!734796 () Unit!42532)

(assert (=> b!1286531 (= e!734796 e!734799)))

(declare-fun b!1286532 () Bool)

(declare-fun e!734795 () Bool)

(assert (=> b!1286532 (= e!734795 true)))

(declare-fun lt!577331 () V!50513)

(declare-datatypes ((tuple2!21932 0))(
  ( (tuple2!21933 (_1!10977 (_ BitVec 64)) (_2!10977 V!50513)) )
))
(declare-datatypes ((List!29117 0))(
  ( (Nil!29114) (Cons!29113 (h!30322 tuple2!21932) (t!42675 List!29117)) )
))
(declare-datatypes ((ListLongMap!19589 0))(
  ( (ListLongMap!19590 (toList!9810 List!29117)) )
))
(declare-fun contains!7926 (ListLongMap!19589 (_ BitVec 64)) Bool)

(declare-fun +!4316 (ListLongMap!19589 tuple2!21932) ListLongMap!19589)

(assert (=> b!1286532 (not (contains!7926 (+!4316 (ListLongMap!19590 Nil!29114) (tuple2!21933 (select (arr!41083 _keys!1741) from!2144) lt!577331)) k!1205))))

(declare-fun lt!577333 () Unit!42532)

(declare-fun addStillNotContains!339 (ListLongMap!19589 (_ BitVec 64) V!50513 (_ BitVec 64)) Unit!42532)

(assert (=> b!1286532 (= lt!577333 (addStillNotContains!339 (ListLongMap!19590 Nil!29114) (select (arr!41083 _keys!1741) from!2144) lt!577331 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun get!20860 (ValueCell!16130 V!50513) V!50513)

(declare-fun dynLambda!3413 (Int (_ BitVec 64)) V!50513)

(assert (=> b!1286532 (= lt!577331 (get!20860 (select (arr!41084 _values!1445) from!2144) (dynLambda!3413 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286533 () Bool)

(declare-fun call!62954 () Bool)

(assert (=> b!1286533 call!62954))

(declare-fun lt!577328 () Unit!42532)

(declare-fun call!62953 () Unit!42532)

(assert (=> b!1286533 (= lt!577328 call!62953)))

(declare-fun lt!577334 () ListLongMap!19589)

(declare-fun call!62952 () ListLongMap!19589)

(assert (=> b!1286533 (= lt!577334 call!62952)))

(assert (=> b!1286533 (= e!734796 lt!577328)))

(declare-fun res!854579 () Bool)

(assert (=> start!108904 (=> (not res!854579) (not e!734798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108904 (= res!854579 (validMask!0 mask!2175))))

(assert (=> start!108904 e!734798))

(assert (=> start!108904 tp_is_empty!34057))

(assert (=> start!108904 true))

(declare-fun e!734797 () Bool)

(declare-fun array_inv!31153 (array!85164) Bool)

(assert (=> start!108904 (and (array_inv!31153 _values!1445) e!734797)))

(declare-fun array_inv!31154 (array!85162) Bool)

(assert (=> start!108904 (array_inv!31154 _keys!1741)))

(assert (=> start!108904 tp!100366))

(declare-fun zeroValue!1387 () V!50513)

(declare-fun lt!577327 () ListLongMap!19589)

(declare-fun lt!577324 () ListLongMap!19589)

(declare-fun call!62957 () Unit!42532)

(declare-fun c!124192 () Bool)

(declare-fun minValue!1387 () V!50513)

(declare-fun bm!62949 () Bool)

(declare-fun c!124190 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!32 ((_ BitVec 64) (_ BitVec 64) V!50513 ListLongMap!19589) Unit!42532)

(assert (=> bm!62949 (= call!62957 (lemmaInListMapAfterAddingDiffThenInBefore!32 k!1205 (ite (or c!124190 c!124192) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124190 c!124192) zeroValue!1387 minValue!1387) (ite c!124190 lt!577327 (ite c!124192 lt!577334 lt!577324))))))

(declare-fun b!1286534 () Bool)

(declare-fun res!854577 () Bool)

(assert (=> b!1286534 (=> (not res!854577) (not e!734798))))

(declare-datatypes ((List!29118 0))(
  ( (Nil!29115) (Cons!29114 (h!30323 (_ BitVec 64)) (t!42676 List!29118)) )
))
(declare-fun arrayNoDuplicates!0 (array!85162 (_ BitVec 32) List!29118) Bool)

(assert (=> b!1286534 (= res!854577 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29115))))

(declare-fun mapIsEmpty!52643 () Bool)

(declare-fun mapRes!52643 () Bool)

(assert (=> mapIsEmpty!52643 mapRes!52643))

(declare-fun bm!62950 () Bool)

(assert (=> bm!62950 (= call!62953 call!62957)))

(declare-fun b!1286535 () Bool)

(assert (=> b!1286535 (= e!734797 (and e!734800 mapRes!52643))))

(declare-fun condMapEmpty!52643 () Bool)

(declare-fun mapDefault!52643 () ValueCell!16130)

