; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109138 () Bool)

(assert start!109138)

(declare-fun b_free!28627 () Bool)

(declare-fun b_next!28627 () Bool)

(assert (=> start!109138 (= b_free!28627 (not b_next!28627))))

(declare-fun tp!100999 () Bool)

(declare-fun b_and!46717 () Bool)

(assert (=> start!109138 (= tp!100999 b_and!46717)))

(declare-fun b!1290569 () Bool)

(declare-fun res!857368 () Bool)

(declare-fun e!736781 () Bool)

(assert (=> b!1290569 (=> (not res!857368) (not e!736781))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50793 0))(
  ( (V!50794 (val!17208 Int)) )
))
(declare-datatypes ((ValueCell!16235 0))(
  ( (ValueCellFull!16235 (v!19811 V!50793)) (EmptyCell!16235) )
))
(declare-datatypes ((array!85574 0))(
  ( (array!85575 (arr!41288 (Array (_ BitVec 32) ValueCell!16235)) (size!41838 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85574)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85576 0))(
  ( (array!85577 (arr!41289 (Array (_ BitVec 32) (_ BitVec 64))) (size!41839 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85576)

(assert (=> b!1290569 (= res!857368 (and (= (size!41838 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41839 _keys!1741) (size!41838 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290570 () Bool)

(declare-fun res!857370 () Bool)

(assert (=> b!1290570 (=> (not res!857370) (not e!736781))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1290570 (= res!857370 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41839 _keys!1741))))))

(declare-fun mapIsEmpty!52961 () Bool)

(declare-fun mapRes!52961 () Bool)

(assert (=> mapIsEmpty!52961 mapRes!52961))

(declare-fun b!1290571 () Bool)

(declare-fun res!857373 () Bool)

(assert (=> b!1290571 (=> (not res!857373) (not e!736781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290571 (= res!857373 (not (validKeyInArray!0 (select (arr!41289 _keys!1741) from!2144))))))

(declare-fun b!1290572 () Bool)

(declare-fun e!736783 () Bool)

(assert (=> b!1290572 (= e!736781 (not e!736783))))

(declare-fun res!857369 () Bool)

(assert (=> b!1290572 (=> res!857369 e!736783)))

(assert (=> b!1290572 (= res!857369 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22112 0))(
  ( (tuple2!22113 (_1!11067 (_ BitVec 64)) (_2!11067 V!50793)) )
))
(declare-datatypes ((List!29278 0))(
  ( (Nil!29275) (Cons!29274 (h!30483 tuple2!22112) (t!42842 List!29278)) )
))
(declare-datatypes ((ListLongMap!19769 0))(
  ( (ListLongMap!19770 (toList!9900 List!29278)) )
))
(declare-fun contains!8018 (ListLongMap!19769 (_ BitVec 64)) Bool)

(assert (=> b!1290572 (not (contains!8018 (ListLongMap!19770 Nil!29275) k!1205))))

(declare-datatypes ((Unit!42714 0))(
  ( (Unit!42715) )
))
(declare-fun lt!578696 () Unit!42714)

(declare-fun emptyContainsNothing!83 ((_ BitVec 64)) Unit!42714)

(assert (=> b!1290572 (= lt!578696 (emptyContainsNothing!83 k!1205))))

(declare-fun b!1290573 () Bool)

(assert (=> b!1290573 (= e!736783 true)))

(assert (=> b!1290573 false))

(declare-fun minValue!1387 () V!50793)

(declare-fun lt!578693 () ListLongMap!19769)

(declare-fun lt!578695 () Unit!42714)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!42 ((_ BitVec 64) (_ BitVec 64) V!50793 ListLongMap!19769) Unit!42714)

(assert (=> b!1290573 (= lt!578695 (lemmaInListMapAfterAddingDiffThenInBefore!42 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578693))))

(declare-fun lt!578692 () ListLongMap!19769)

(declare-fun +!4368 (ListLongMap!19769 tuple2!22112) ListLongMap!19769)

(assert (=> b!1290573 (not (contains!8018 (+!4368 lt!578692 (tuple2!22113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578694 () Unit!42714)

(declare-fun addStillNotContains!386 (ListLongMap!19769 (_ BitVec 64) V!50793 (_ BitVec 64)) Unit!42714)

(assert (=> b!1290573 (= lt!578694 (addStillNotContains!386 lt!578692 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290573 (not (contains!8018 lt!578693 k!1205))))

(declare-fun zeroValue!1387 () V!50793)

(assert (=> b!1290573 (= lt!578693 (+!4368 lt!578692 (tuple2!22113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578691 () Unit!42714)

(assert (=> b!1290573 (= lt!578691 (addStillNotContains!386 lt!578692 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5999 (array!85576 array!85574 (_ BitVec 32) (_ BitVec 32) V!50793 V!50793 (_ BitVec 32) Int) ListLongMap!19769)

(assert (=> b!1290573 (= lt!578692 (getCurrentListMapNoExtraKeys!5999 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290574 () Bool)

(declare-fun res!857365 () Bool)

(assert (=> b!1290574 (=> (not res!857365) (not e!736781))))

(assert (=> b!1290574 (= res!857365 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41839 _keys!1741))))))

(declare-fun b!1290575 () Bool)

(declare-fun res!857371 () Bool)

(assert (=> b!1290575 (=> (not res!857371) (not e!736781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85576 (_ BitVec 32)) Bool)

(assert (=> b!1290575 (= res!857371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290576 () Bool)

(declare-fun res!857372 () Bool)

(assert (=> b!1290576 (=> (not res!857372) (not e!736781))))

(declare-datatypes ((List!29279 0))(
  ( (Nil!29276) (Cons!29275 (h!30484 (_ BitVec 64)) (t!42843 List!29279)) )
))
(declare-fun arrayNoDuplicates!0 (array!85576 (_ BitVec 32) List!29279) Bool)

(assert (=> b!1290576 (= res!857372 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29276))))

(declare-fun b!1290577 () Bool)

(declare-fun e!736784 () Bool)

(declare-fun e!736782 () Bool)

(assert (=> b!1290577 (= e!736784 (and e!736782 mapRes!52961))))

(declare-fun condMapEmpty!52961 () Bool)

(declare-fun mapDefault!52961 () ValueCell!16235)

