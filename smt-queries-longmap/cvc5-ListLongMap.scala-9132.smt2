; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109576 () Bool)

(assert start!109576)

(declare-fun b_free!29065 () Bool)

(declare-fun b_next!29065 () Bool)

(assert (=> start!109576 (= b_free!29065 (not b_next!29065))))

(declare-fun tp!102314 () Bool)

(declare-fun b_and!47155 () Bool)

(assert (=> start!109576 (= tp!102314 b_and!47155)))

(declare-fun b!1297837 () Bool)

(declare-fun res!862506 () Bool)

(declare-fun e!740461 () Bool)

(assert (=> b!1297837 (=> (not res!862506) (not e!740461))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51377 0))(
  ( (V!51378 (val!17427 Int)) )
))
(declare-datatypes ((ValueCell!16454 0))(
  ( (ValueCellFull!16454 (v!20030 V!51377)) (EmptyCell!16454) )
))
(declare-datatypes ((array!86418 0))(
  ( (array!86419 (arr!41710 (Array (_ BitVec 32) ValueCell!16454)) (size!42260 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86418)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86420 0))(
  ( (array!86421 (arr!41711 (Array (_ BitVec 32) (_ BitVec 64))) (size!42261 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86420)

(assert (=> b!1297837 (= res!862506 (and (= (size!42260 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42261 _keys!1741) (size!42260 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297838 () Bool)

(declare-fun e!740458 () Bool)

(declare-fun tp_is_empty!34705 () Bool)

(assert (=> b!1297838 (= e!740458 tp_is_empty!34705)))

(declare-fun b!1297839 () Bool)

(assert (=> b!1297839 (= e!740461 (not true))))

(declare-fun minValue!1387 () V!51377)

(declare-fun zeroValue!1387 () V!51377)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22462 0))(
  ( (tuple2!22463 (_1!11242 (_ BitVec 64)) (_2!11242 V!51377)) )
))
(declare-datatypes ((List!29595 0))(
  ( (Nil!29592) (Cons!29591 (h!30800 tuple2!22462) (t!43159 List!29595)) )
))
(declare-datatypes ((ListLongMap!20119 0))(
  ( (ListLongMap!20120 (toList!10075 List!29595)) )
))
(declare-fun contains!8193 (ListLongMap!20119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5104 (array!86420 array!86418 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 32) Int) ListLongMap!20119)

(assert (=> b!1297839 (contains!8193 (getCurrentListMap!5104 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42963 0))(
  ( (Unit!42964) )
))
(declare-fun lt!580643 () Unit!42963)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!34 (array!86420 array!86418 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 64) (_ BitVec 32) Int) Unit!42963)

(assert (=> b!1297839 (= lt!580643 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!34 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53618 () Bool)

(declare-fun mapRes!53618 () Bool)

(assert (=> mapIsEmpty!53618 mapRes!53618))

(declare-fun res!862505 () Bool)

(assert (=> start!109576 (=> (not res!862505) (not e!740461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109576 (= res!862505 (validMask!0 mask!2175))))

(assert (=> start!109576 e!740461))

(assert (=> start!109576 tp_is_empty!34705))

(assert (=> start!109576 true))

(declare-fun e!740459 () Bool)

(declare-fun array_inv!31571 (array!86418) Bool)

(assert (=> start!109576 (and (array_inv!31571 _values!1445) e!740459)))

(declare-fun array_inv!31572 (array!86420) Bool)

(assert (=> start!109576 (array_inv!31572 _keys!1741)))

(assert (=> start!109576 tp!102314))

(declare-fun b!1297840 () Bool)

(declare-fun res!862502 () Bool)

(assert (=> b!1297840 (=> (not res!862502) (not e!740461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86420 (_ BitVec 32)) Bool)

(assert (=> b!1297840 (= res!862502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297841 () Bool)

(declare-fun res!862501 () Bool)

(assert (=> b!1297841 (=> (not res!862501) (not e!740461))))

(declare-datatypes ((List!29596 0))(
  ( (Nil!29593) (Cons!29592 (h!30801 (_ BitVec 64)) (t!43160 List!29596)) )
))
(declare-fun arrayNoDuplicates!0 (array!86420 (_ BitVec 32) List!29596) Bool)

(assert (=> b!1297841 (= res!862501 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29593))))

(declare-fun b!1297842 () Bool)

(declare-fun e!740462 () Bool)

(assert (=> b!1297842 (= e!740462 tp_is_empty!34705)))

(declare-fun b!1297843 () Bool)

(declare-fun res!862504 () Bool)

(assert (=> b!1297843 (=> (not res!862504) (not e!740461))))

(assert (=> b!1297843 (= res!862504 (contains!8193 (getCurrentListMap!5104 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297844 () Bool)

(assert (=> b!1297844 (= e!740459 (and e!740462 mapRes!53618))))

(declare-fun condMapEmpty!53618 () Bool)

(declare-fun mapDefault!53618 () ValueCell!16454)

