; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109600 () Bool)

(assert start!109600)

(declare-fun b_free!29089 () Bool)

(declare-fun b_next!29089 () Bool)

(assert (=> start!109600 (= b_free!29089 (not b_next!29089))))

(declare-fun tp!102385 () Bool)

(declare-fun b_and!47179 () Bool)

(assert (=> start!109600 (= tp!102385 b_and!47179)))

(declare-fun b!1298197 () Bool)

(declare-fun res!862753 () Bool)

(declare-fun e!740641 () Bool)

(assert (=> b!1298197 (=> (not res!862753) (not e!740641))))

(declare-datatypes ((array!86464 0))(
  ( (array!86465 (arr!41733 (Array (_ BitVec 32) (_ BitVec 64))) (size!42283 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86464)

(declare-datatypes ((List!29614 0))(
  ( (Nil!29611) (Cons!29610 (h!30819 (_ BitVec 64)) (t!43178 List!29614)) )
))
(declare-fun arrayNoDuplicates!0 (array!86464 (_ BitVec 32) List!29614) Bool)

(assert (=> b!1298197 (= res!862753 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29611))))

(declare-fun b!1298198 () Bool)

(assert (=> b!1298198 (= e!740641 (not true))))

(declare-datatypes ((V!51409 0))(
  ( (V!51410 (val!17439 Int)) )
))
(declare-fun minValue!1387 () V!51409)

(declare-fun zeroValue!1387 () V!51409)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16466 0))(
  ( (ValueCellFull!16466 (v!20042 V!51409)) (EmptyCell!16466) )
))
(declare-datatypes ((array!86466 0))(
  ( (array!86467 (arr!41734 (Array (_ BitVec 32) ValueCell!16466)) (size!42284 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86466)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22484 0))(
  ( (tuple2!22485 (_1!11253 (_ BitVec 64)) (_2!11253 V!51409)) )
))
(declare-datatypes ((List!29615 0))(
  ( (Nil!29612) (Cons!29611 (h!30820 tuple2!22484) (t!43179 List!29615)) )
))
(declare-datatypes ((ListLongMap!20141 0))(
  ( (ListLongMap!20142 (toList!10086 List!29615)) )
))
(declare-fun contains!8204 (ListLongMap!20141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5115 (array!86464 array!86466 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 32) Int) ListLongMap!20141)

(assert (=> b!1298198 (contains!8204 (getCurrentListMap!5115 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42983 0))(
  ( (Unit!42984) )
))
(declare-fun lt!580679 () Unit!42983)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!44 (array!86464 array!86466 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 64) (_ BitVec 32) Int) Unit!42983)

(assert (=> b!1298198 (= lt!580679 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!44 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53654 () Bool)

(declare-fun mapRes!53654 () Bool)

(assert (=> mapIsEmpty!53654 mapRes!53654))

(declare-fun b!1298199 () Bool)

(declare-fun res!862757 () Bool)

(assert (=> b!1298199 (=> (not res!862757) (not e!740641))))

(assert (=> b!1298199 (= res!862757 (contains!8204 (getCurrentListMap!5115 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!53654 () Bool)

(declare-fun tp!102386 () Bool)

(declare-fun e!740640 () Bool)

(assert (=> mapNonEmpty!53654 (= mapRes!53654 (and tp!102386 e!740640))))

(declare-fun mapRest!53654 () (Array (_ BitVec 32) ValueCell!16466))

(declare-fun mapValue!53654 () ValueCell!16466)

(declare-fun mapKey!53654 () (_ BitVec 32))

(assert (=> mapNonEmpty!53654 (= (arr!41734 _values!1445) (store mapRest!53654 mapKey!53654 mapValue!53654))))

(declare-fun b!1298200 () Bool)

(declare-fun res!862758 () Bool)

(assert (=> b!1298200 (=> (not res!862758) (not e!740641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86464 (_ BitVec 32)) Bool)

(assert (=> b!1298200 (= res!862758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298201 () Bool)

(declare-fun res!862752 () Bool)

(assert (=> b!1298201 (=> (not res!862752) (not e!740641))))

(assert (=> b!1298201 (= res!862752 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42283 _keys!1741))))))

(declare-fun b!1298202 () Bool)

(declare-fun tp_is_empty!34729 () Bool)

(assert (=> b!1298202 (= e!740640 tp_is_empty!34729)))

(declare-fun b!1298203 () Bool)

(declare-fun e!740642 () Bool)

(assert (=> b!1298203 (= e!740642 tp_is_empty!34729)))

(declare-fun res!862755 () Bool)

(assert (=> start!109600 (=> (not res!862755) (not e!740641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109600 (= res!862755 (validMask!0 mask!2175))))

(assert (=> start!109600 e!740641))

(assert (=> start!109600 tp_is_empty!34729))

(assert (=> start!109600 true))

(declare-fun e!740639 () Bool)

(declare-fun array_inv!31589 (array!86466) Bool)

(assert (=> start!109600 (and (array_inv!31589 _values!1445) e!740639)))

(declare-fun array_inv!31590 (array!86464) Bool)

(assert (=> start!109600 (array_inv!31590 _keys!1741)))

(assert (=> start!109600 tp!102385))

(declare-fun b!1298204 () Bool)

(declare-fun res!862756 () Bool)

(assert (=> b!1298204 (=> (not res!862756) (not e!740641))))

(assert (=> b!1298204 (= res!862756 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42283 _keys!1741)) (not (= (select (arr!41733 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298205 () Bool)

(assert (=> b!1298205 (= e!740639 (and e!740642 mapRes!53654))))

(declare-fun condMapEmpty!53654 () Bool)

(declare-fun mapDefault!53654 () ValueCell!16466)

