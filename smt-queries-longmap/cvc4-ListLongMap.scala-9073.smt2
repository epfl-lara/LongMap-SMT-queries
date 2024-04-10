; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109226 () Bool)

(assert start!109226)

(declare-fun b_free!28715 () Bool)

(declare-fun b_next!28715 () Bool)

(assert (=> start!109226 (= b_free!28715 (not b_next!28715))))

(declare-fun tp!101263 () Bool)

(declare-fun b_and!46805 () Bool)

(assert (=> start!109226 (= tp!101263 b_and!46805)))

(declare-fun b!1292118 () Bool)

(declare-fun e!737538 () Bool)

(assert (=> b!1292118 (= e!737538 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50909 0))(
  ( (V!50910 (val!17252 Int)) )
))
(declare-datatypes ((tuple2!22192 0))(
  ( (tuple2!22193 (_1!11107 (_ BitVec 64)) (_2!11107 V!50909)) )
))
(declare-datatypes ((List!29345 0))(
  ( (Nil!29342) (Cons!29341 (h!30550 tuple2!22192) (t!42909 List!29345)) )
))
(declare-datatypes ((ListLongMap!19849 0))(
  ( (ListLongMap!19850 (toList!9940 List!29345)) )
))
(declare-fun contains!8058 (ListLongMap!19849 (_ BitVec 64)) Bool)

(assert (=> b!1292118 (not (contains!8058 (ListLongMap!19850 Nil!29342) k!1205))))

(declare-datatypes ((Unit!42790 0))(
  ( (Unit!42791) )
))
(declare-fun lt!579308 () Unit!42790)

(declare-fun emptyContainsNothing!117 ((_ BitVec 64)) Unit!42790)

(assert (=> b!1292118 (= lt!579308 (emptyContainsNothing!117 k!1205))))

(declare-fun b!1292119 () Bool)

(declare-fun res!858521 () Bool)

(assert (=> b!1292119 (=> (not res!858521) (not e!737538))))

(declare-datatypes ((array!85744 0))(
  ( (array!85745 (arr!41373 (Array (_ BitVec 32) (_ BitVec 64))) (size!41923 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85744)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292119 (= res!858521 (not (validKeyInArray!0 (select (arr!41373 _keys!1741) from!2144))))))

(declare-fun b!1292120 () Bool)

(declare-fun e!737536 () Bool)

(declare-fun tp_is_empty!34355 () Bool)

(assert (=> b!1292120 (= e!737536 tp_is_empty!34355)))

(declare-fun mapNonEmpty!53093 () Bool)

(declare-fun mapRes!53093 () Bool)

(declare-fun tp!101264 () Bool)

(declare-fun e!737537 () Bool)

(assert (=> mapNonEmpty!53093 (= mapRes!53093 (and tp!101264 e!737537))))

(declare-datatypes ((ValueCell!16279 0))(
  ( (ValueCellFull!16279 (v!19855 V!50909)) (EmptyCell!16279) )
))
(declare-datatypes ((array!85746 0))(
  ( (array!85747 (arr!41374 (Array (_ BitVec 32) ValueCell!16279)) (size!41924 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85746)

(declare-fun mapRest!53093 () (Array (_ BitVec 32) ValueCell!16279))

(declare-fun mapKey!53093 () (_ BitVec 32))

(declare-fun mapValue!53093 () ValueCell!16279)

(assert (=> mapNonEmpty!53093 (= (arr!41374 _values!1445) (store mapRest!53093 mapKey!53093 mapValue!53093))))

(declare-fun res!858525 () Bool)

(assert (=> start!109226 (=> (not res!858525) (not e!737538))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109226 (= res!858525 (validMask!0 mask!2175))))

(assert (=> start!109226 e!737538))

(assert (=> start!109226 tp_is_empty!34355))

(assert (=> start!109226 true))

(declare-fun e!737539 () Bool)

(declare-fun array_inv!31349 (array!85746) Bool)

(assert (=> start!109226 (and (array_inv!31349 _values!1445) e!737539)))

(declare-fun array_inv!31350 (array!85744) Bool)

(assert (=> start!109226 (array_inv!31350 _keys!1741)))

(assert (=> start!109226 tp!101263))

(declare-fun mapIsEmpty!53093 () Bool)

(assert (=> mapIsEmpty!53093 mapRes!53093))

(declare-fun b!1292121 () Bool)

(declare-fun res!858518 () Bool)

(assert (=> b!1292121 (=> (not res!858518) (not e!737538))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292121 (= res!858518 (and (= (size!41924 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41923 _keys!1741) (size!41924 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292122 () Bool)

(assert (=> b!1292122 (= e!737537 tp_is_empty!34355)))

(declare-fun b!1292123 () Bool)

(declare-fun res!858522 () Bool)

(assert (=> b!1292123 (=> (not res!858522) (not e!737538))))

(declare-fun minValue!1387 () V!50909)

(declare-fun zeroValue!1387 () V!50909)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4986 (array!85744 array!85746 (_ BitVec 32) (_ BitVec 32) V!50909 V!50909 (_ BitVec 32) Int) ListLongMap!19849)

(assert (=> b!1292123 (= res!858522 (contains!8058 (getCurrentListMap!4986 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292124 () Bool)

(declare-fun res!858523 () Bool)

(assert (=> b!1292124 (=> (not res!858523) (not e!737538))))

(declare-datatypes ((List!29346 0))(
  ( (Nil!29343) (Cons!29342 (h!30551 (_ BitVec 64)) (t!42910 List!29346)) )
))
(declare-fun arrayNoDuplicates!0 (array!85744 (_ BitVec 32) List!29346) Bool)

(assert (=> b!1292124 (= res!858523 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29343))))

(declare-fun b!1292125 () Bool)

(assert (=> b!1292125 (= e!737539 (and e!737536 mapRes!53093))))

(declare-fun condMapEmpty!53093 () Bool)

(declare-fun mapDefault!53093 () ValueCell!16279)

