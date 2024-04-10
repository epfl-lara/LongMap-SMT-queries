; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109592 () Bool)

(assert start!109592)

(declare-fun b_free!29081 () Bool)

(declare-fun b_next!29081 () Bool)

(assert (=> start!109592 (= b_free!29081 (not b_next!29081))))

(declare-fun tp!102361 () Bool)

(declare-fun b_and!47171 () Bool)

(assert (=> start!109592 (= tp!102361 b_and!47171)))

(declare-fun res!862674 () Bool)

(declare-fun e!740580 () Bool)

(assert (=> start!109592 (=> (not res!862674) (not e!740580))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109592 (= res!862674 (validMask!0 mask!2175))))

(assert (=> start!109592 e!740580))

(declare-fun tp_is_empty!34721 () Bool)

(assert (=> start!109592 tp_is_empty!34721))

(assert (=> start!109592 true))

(declare-datatypes ((V!51397 0))(
  ( (V!51398 (val!17435 Int)) )
))
(declare-datatypes ((ValueCell!16462 0))(
  ( (ValueCellFull!16462 (v!20038 V!51397)) (EmptyCell!16462) )
))
(declare-datatypes ((array!86448 0))(
  ( (array!86449 (arr!41725 (Array (_ BitVec 32) ValueCell!16462)) (size!42275 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86448)

(declare-fun e!740582 () Bool)

(declare-fun array_inv!31581 (array!86448) Bool)

(assert (=> start!109592 (and (array_inv!31581 _values!1445) e!740582)))

(declare-datatypes ((array!86450 0))(
  ( (array!86451 (arr!41726 (Array (_ BitVec 32) (_ BitVec 64))) (size!42276 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86450)

(declare-fun array_inv!31582 (array!86450) Bool)

(assert (=> start!109592 (array_inv!31582 _keys!1741)))

(assert (=> start!109592 tp!102361))

(declare-fun b!1298077 () Bool)

(declare-fun res!862673 () Bool)

(assert (=> b!1298077 (=> (not res!862673) (not e!740580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86450 (_ BitVec 32)) Bool)

(assert (=> b!1298077 (= res!862673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53642 () Bool)

(declare-fun mapRes!53642 () Bool)

(assert (=> mapIsEmpty!53642 mapRes!53642))

(declare-fun b!1298078 () Bool)

(declare-fun res!862672 () Bool)

(assert (=> b!1298078 (=> (not res!862672) (not e!740580))))

(declare-fun minValue!1387 () V!51397)

(declare-fun zeroValue!1387 () V!51397)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22476 0))(
  ( (tuple2!22477 (_1!11249 (_ BitVec 64)) (_2!11249 V!51397)) )
))
(declare-datatypes ((List!29607 0))(
  ( (Nil!29604) (Cons!29603 (h!30812 tuple2!22476) (t!43171 List!29607)) )
))
(declare-datatypes ((ListLongMap!20133 0))(
  ( (ListLongMap!20134 (toList!10082 List!29607)) )
))
(declare-fun contains!8200 (ListLongMap!20133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5111 (array!86450 array!86448 (_ BitVec 32) (_ BitVec 32) V!51397 V!51397 (_ BitVec 32) Int) ListLongMap!20133)

(assert (=> b!1298078 (= res!862672 (contains!8200 (getCurrentListMap!5111 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298079 () Bool)

(declare-fun res!862671 () Bool)

(assert (=> b!1298079 (=> (not res!862671) (not e!740580))))

(assert (=> b!1298079 (= res!862671 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42276 _keys!1741))))))

(declare-fun b!1298080 () Bool)

(assert (=> b!1298080 (= e!740580 (not true))))

(assert (=> b!1298080 (contains!8200 (getCurrentListMap!5111 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42977 0))(
  ( (Unit!42978) )
))
(declare-fun lt!580667 () Unit!42977)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!41 (array!86450 array!86448 (_ BitVec 32) (_ BitVec 32) V!51397 V!51397 (_ BitVec 64) (_ BitVec 32) Int) Unit!42977)

(assert (=> b!1298080 (= lt!580667 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!41 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298081 () Bool)

(declare-fun e!740579 () Bool)

(assert (=> b!1298081 (= e!740579 tp_is_empty!34721)))

(declare-fun b!1298082 () Bool)

(declare-fun res!862668 () Bool)

(assert (=> b!1298082 (=> (not res!862668) (not e!740580))))

(declare-datatypes ((List!29608 0))(
  ( (Nil!29605) (Cons!29604 (h!30813 (_ BitVec 64)) (t!43172 List!29608)) )
))
(declare-fun arrayNoDuplicates!0 (array!86450 (_ BitVec 32) List!29608) Bool)

(assert (=> b!1298082 (= res!862668 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29605))))

(declare-fun b!1298083 () Bool)

(declare-fun res!862669 () Bool)

(assert (=> b!1298083 (=> (not res!862669) (not e!740580))))

(assert (=> b!1298083 (= res!862669 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42276 _keys!1741)) (not (= (select (arr!41726 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298084 () Bool)

(declare-fun res!862670 () Bool)

(assert (=> b!1298084 (=> (not res!862670) (not e!740580))))

(assert (=> b!1298084 (= res!862670 (and (= (size!42275 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42276 _keys!1741) (size!42275 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298085 () Bool)

(declare-fun e!740581 () Bool)

(assert (=> b!1298085 (= e!740581 tp_is_empty!34721)))

(declare-fun mapNonEmpty!53642 () Bool)

(declare-fun tp!102362 () Bool)

(assert (=> mapNonEmpty!53642 (= mapRes!53642 (and tp!102362 e!740581))))

(declare-fun mapValue!53642 () ValueCell!16462)

(declare-fun mapRest!53642 () (Array (_ BitVec 32) ValueCell!16462))

(declare-fun mapKey!53642 () (_ BitVec 32))

(assert (=> mapNonEmpty!53642 (= (arr!41725 _values!1445) (store mapRest!53642 mapKey!53642 mapValue!53642))))

(declare-fun b!1298086 () Bool)

(assert (=> b!1298086 (= e!740582 (and e!740579 mapRes!53642))))

(declare-fun condMapEmpty!53642 () Bool)

(declare-fun mapDefault!53642 () ValueCell!16462)

