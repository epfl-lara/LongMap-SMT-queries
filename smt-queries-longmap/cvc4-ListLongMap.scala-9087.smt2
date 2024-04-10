; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109310 () Bool)

(assert start!109310)

(declare-fun b_free!28799 () Bool)

(declare-fun b_next!28799 () Bool)

(assert (=> start!109310 (= b_free!28799 (not b_next!28799))))

(declare-fun tp!101516 () Bool)

(declare-fun b_and!46889 () Bool)

(assert (=> start!109310 (= tp!101516 b_and!46889)))

(declare-fun b!1293584 () Bool)

(declare-fun res!859608 () Bool)

(declare-fun e!738249 () Bool)

(assert (=> b!1293584 (=> (not res!859608) (not e!738249))))

(declare-datatypes ((array!85906 0))(
  ( (array!85907 (arr!41454 (Array (_ BitVec 32) (_ BitVec 64))) (size!42004 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85906)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293584 (= res!859608 (not (validKeyInArray!0 (select (arr!41454 _keys!1741) from!2144))))))

(declare-fun b!1293585 () Bool)

(declare-fun res!859610 () Bool)

(assert (=> b!1293585 (=> (not res!859610) (not e!738249))))

(declare-datatypes ((List!29406 0))(
  ( (Nil!29403) (Cons!29402 (h!30611 (_ BitVec 64)) (t!42970 List!29406)) )
))
(declare-fun arrayNoDuplicates!0 (array!85906 (_ BitVec 32) List!29406) Bool)

(assert (=> b!1293585 (= res!859610 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29403))))

(declare-fun b!1293587 () Bool)

(declare-fun res!859614 () Bool)

(assert (=> b!1293587 (=> (not res!859614) (not e!738249))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51021 0))(
  ( (V!51022 (val!17294 Int)) )
))
(declare-datatypes ((ValueCell!16321 0))(
  ( (ValueCellFull!16321 (v!19897 V!51021)) (EmptyCell!16321) )
))
(declare-datatypes ((array!85908 0))(
  ( (array!85909 (arr!41455 (Array (_ BitVec 32) ValueCell!16321)) (size!42005 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85908)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293587 (= res!859614 (and (= (size!42005 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42004 _keys!1741) (size!42005 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293588 () Bool)

(declare-fun res!859607 () Bool)

(assert (=> b!1293588 (=> (not res!859607) (not e!738249))))

(assert (=> b!1293588 (= res!859607 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42004 _keys!1741))))))

(declare-fun b!1293589 () Bool)

(declare-fun e!738251 () Bool)

(assert (=> b!1293589 (= e!738249 (not e!738251))))

(declare-fun res!859613 () Bool)

(assert (=> b!1293589 (=> res!859613 e!738251)))

(assert (=> b!1293589 (= res!859613 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22258 0))(
  ( (tuple2!22259 (_1!11140 (_ BitVec 64)) (_2!11140 V!51021)) )
))
(declare-datatypes ((List!29407 0))(
  ( (Nil!29404) (Cons!29403 (h!30612 tuple2!22258) (t!42971 List!29407)) )
))
(declare-datatypes ((ListLongMap!19915 0))(
  ( (ListLongMap!19916 (toList!9973 List!29407)) )
))
(declare-fun contains!8091 (ListLongMap!19915 (_ BitVec 64)) Bool)

(assert (=> b!1293589 (not (contains!8091 (ListLongMap!19916 Nil!29404) k!1205))))

(declare-datatypes ((Unit!42842 0))(
  ( (Unit!42843) )
))
(declare-fun lt!579587 () Unit!42842)

(declare-fun emptyContainsNothing!142 ((_ BitVec 64)) Unit!42842)

(assert (=> b!1293589 (= lt!579587 (emptyContainsNothing!142 k!1205))))

(declare-fun b!1293590 () Bool)

(declare-fun res!859609 () Bool)

(assert (=> b!1293590 (=> (not res!859609) (not e!738249))))

(assert (=> b!1293590 (= res!859609 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42004 _keys!1741))))))

(declare-fun b!1293591 () Bool)

(declare-fun e!738250 () Bool)

(declare-fun e!738246 () Bool)

(declare-fun mapRes!53219 () Bool)

(assert (=> b!1293591 (= e!738250 (and e!738246 mapRes!53219))))

(declare-fun condMapEmpty!53219 () Bool)

(declare-fun mapDefault!53219 () ValueCell!16321)

