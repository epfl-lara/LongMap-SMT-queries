; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108890 () Bool)

(assert start!108890)

(declare-fun b_free!28403 () Bool)

(declare-fun b_next!28403 () Bool)

(assert (=> start!108890 (= b_free!28403 (not b_next!28403))))

(declare-fun tp!100324 () Bool)

(declare-fun b_and!46469 () Bool)

(assert (=> start!108890 (= tp!100324 b_and!46469)))

(declare-fun b!1286138 () Bool)

(declare-fun e!734611 () Bool)

(declare-fun tp_is_empty!34043 () Bool)

(assert (=> b!1286138 (= e!734611 tp_is_empty!34043)))

(declare-datatypes ((V!50493 0))(
  ( (V!50494 (val!17096 Int)) )
))
(declare-datatypes ((tuple2!21920 0))(
  ( (tuple2!21921 (_1!10971 (_ BitVec 64)) (_2!10971 V!50493)) )
))
(declare-datatypes ((List!29107 0))(
  ( (Nil!29104) (Cons!29103 (h!30312 tuple2!21920) (t!42651 List!29107)) )
))
(declare-datatypes ((ListLongMap!19577 0))(
  ( (ListLongMap!19578 (toList!9804 List!29107)) )
))
(declare-fun lt!577054 () ListLongMap!19577)

(declare-fun lt!577061 () ListLongMap!19577)

(declare-fun lt!577060 () ListLongMap!19577)

(declare-fun c!124128 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun bm!62823 () Bool)

(declare-fun minValue!1387 () V!50493)

(declare-fun c!124127 () Bool)

(declare-fun zeroValue!1387 () V!50493)

(declare-datatypes ((Unit!42515 0))(
  ( (Unit!42516) )
))
(declare-fun call!62829 () Unit!42515)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!27 ((_ BitVec 64) (_ BitVec 64) V!50493 ListLongMap!19577) Unit!42515)

(assert (=> bm!62823 (= call!62829 (lemmaInListMapAfterAddingDiffThenInBefore!27 k!1205 (ite (or c!124128 c!124127) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124128 c!124127) zeroValue!1387 minValue!1387) (ite c!124128 lt!577060 (ite c!124127 lt!577054 lt!577061))))))

(declare-fun b!1286139 () Bool)

(declare-fun res!854390 () Bool)

(declare-fun e!734605 () Bool)

(assert (=> b!1286139 (=> (not res!854390) (not e!734605))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85138 0))(
  ( (array!85139 (arr!41071 (Array (_ BitVec 32) (_ BitVec 64))) (size!41621 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85138)

(assert (=> b!1286139 (= res!854390 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41621 _keys!1741))))))

(declare-fun bm!62824 () Bool)

(declare-fun call!62830 () ListLongMap!19577)

(declare-fun call!62826 () ListLongMap!19577)

(assert (=> bm!62824 (= call!62830 call!62826)))

(declare-fun bm!62825 () Bool)

(declare-datatypes ((ValueCell!16123 0))(
  ( (ValueCellFull!16123 (v!19698 V!50493)) (EmptyCell!16123) )
))
(declare-datatypes ((array!85140 0))(
  ( (array!85141 (arr!41072 (Array (_ BitVec 32) ValueCell!16123)) (size!41622 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85140)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5942 (array!85138 array!85140 (_ BitVec 32) (_ BitVec 32) V!50493 V!50493 (_ BitVec 32) Int) ListLongMap!19577)

(assert (=> bm!62825 (= call!62826 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286140 () Bool)

(declare-fun res!854384 () Bool)

(assert (=> b!1286140 (=> (not res!854384) (not e!734605))))

(declare-fun contains!7921 (ListLongMap!19577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4882 (array!85138 array!85140 (_ BitVec 32) (_ BitVec 32) V!50493 V!50493 (_ BitVec 32) Int) ListLongMap!19577)

(assert (=> b!1286140 (= res!854384 (contains!7921 (getCurrentListMap!4882 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1286141 () Bool)

(declare-fun res!854386 () Bool)

(assert (=> b!1286141 (=> (not res!854386) (not e!734605))))

(assert (=> b!1286141 (= res!854386 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41621 _keys!1741))))))

(declare-fun mapNonEmpty!52622 () Bool)

(declare-fun mapRes!52622 () Bool)

(declare-fun tp!100325 () Bool)

(declare-fun e!734609 () Bool)

(assert (=> mapNonEmpty!52622 (= mapRes!52622 (and tp!100325 e!734609))))

(declare-fun mapValue!52622 () ValueCell!16123)

(declare-fun mapRest!52622 () (Array (_ BitVec 32) ValueCell!16123))

(declare-fun mapKey!52622 () (_ BitVec 32))

(assert (=> mapNonEmpty!52622 (= (arr!41072 _values!1445) (store mapRest!52622 mapKey!52622 mapValue!52622))))

(declare-fun b!1286142 () Bool)

(assert (=> b!1286142 (= e!734609 tp_is_empty!34043)))

(declare-fun call!62828 () Bool)

(declare-fun bm!62826 () Bool)

(assert (=> bm!62826 (= call!62828 (contains!7921 (ite c!124128 lt!577060 (ite c!124127 lt!577054 lt!577061)) k!1205))))

(declare-fun b!1286143 () Bool)

(declare-fun call!62827 () Bool)

(assert (=> b!1286143 call!62827))

(declare-fun lt!577059 () Unit!42515)

(declare-fun call!62831 () Unit!42515)

(assert (=> b!1286143 (= lt!577059 call!62831)))

(assert (=> b!1286143 (= lt!577054 call!62830)))

(declare-fun e!734608 () Unit!42515)

(assert (=> b!1286143 (= e!734608 lt!577059)))

(declare-fun bm!62827 () Bool)

(assert (=> bm!62827 (= call!62831 call!62829)))

(declare-fun b!1286144 () Bool)

(declare-fun res!854388 () Bool)

(assert (=> b!1286144 (=> (not res!854388) (not e!734605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286144 (= res!854388 (validKeyInArray!0 (select (arr!41071 _keys!1741) from!2144)))))

(declare-fun b!1286145 () Bool)

(declare-fun res!854391 () Bool)

(assert (=> b!1286145 (=> (not res!854391) (not e!734605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85138 (_ BitVec 32)) Bool)

(assert (=> b!1286145 (= res!854391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286146 () Bool)

(declare-fun res!854387 () Bool)

(assert (=> b!1286146 (=> (not res!854387) (not e!734605))))

(assert (=> b!1286146 (= res!854387 (and (= (size!41622 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41621 _keys!1741) (size!41622 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286147 () Bool)

(declare-fun e!734612 () Unit!42515)

(assert (=> b!1286147 (= e!734612 e!734608)))

(declare-fun lt!577058 () Bool)

(assert (=> b!1286147 (= c!124127 (and (not lt!577058) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62828 () Bool)

(assert (=> bm!62828 (= call!62827 call!62828)))

(declare-fun b!1286148 () Bool)

(declare-fun c!124129 () Bool)

(assert (=> b!1286148 (= c!124129 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577058))))

(declare-fun e!734607 () Unit!42515)

(assert (=> b!1286148 (= e!734608 e!734607)))

(declare-fun mapIsEmpty!52622 () Bool)

(assert (=> mapIsEmpty!52622 mapRes!52622))

(declare-fun b!1286149 () Bool)

(declare-fun Unit!42517 () Unit!42515)

(assert (=> b!1286149 (= e!734607 Unit!42517)))

(declare-fun b!1286150 () Bool)

(declare-fun lt!577055 () Unit!42515)

(assert (=> b!1286150 (= e!734607 lt!577055)))

(assert (=> b!1286150 (= lt!577061 call!62830)))

(assert (=> b!1286150 (= lt!577055 call!62831)))

(assert (=> b!1286150 call!62827))

(declare-fun b!1286151 () Bool)

(declare-fun res!854389 () Bool)

(assert (=> b!1286151 (=> (not res!854389) (not e!734605))))

(declare-datatypes ((List!29108 0))(
  ( (Nil!29105) (Cons!29104 (h!30313 (_ BitVec 64)) (t!42652 List!29108)) )
))
(declare-fun arrayNoDuplicates!0 (array!85138 (_ BitVec 32) List!29108) Bool)

(assert (=> b!1286151 (= res!854389 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29105))))

(declare-fun b!1286152 () Bool)

(declare-fun e!734610 () Bool)

(assert (=> b!1286152 (= e!734610 (and e!734611 mapRes!52622))))

(declare-fun condMapEmpty!52622 () Bool)

(declare-fun mapDefault!52622 () ValueCell!16123)

