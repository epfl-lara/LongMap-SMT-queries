; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109344 () Bool)

(assert start!109344)

(declare-fun b_free!28833 () Bool)

(declare-fun b_next!28833 () Bool)

(assert (=> start!109344 (= b_free!28833 (not b_next!28833))))

(declare-fun tp!101617 () Bool)

(declare-fun b_and!46923 () Bool)

(assert (=> start!109344 (= tp!101617 b_and!46923)))

(declare-fun b!1294173 () Bool)

(declare-fun res!860046 () Bool)

(declare-fun e!738532 () Bool)

(assert (=> b!1294173 (=> (not res!860046) (not e!738532))))

(declare-datatypes ((array!85968 0))(
  ( (array!85969 (arr!41485 (Array (_ BitVec 32) (_ BitVec 64))) (size!42035 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85968)

(declare-datatypes ((List!29425 0))(
  ( (Nil!29422) (Cons!29421 (h!30630 (_ BitVec 64)) (t!42989 List!29425)) )
))
(declare-fun arrayNoDuplicates!0 (array!85968 (_ BitVec 32) List!29425) Bool)

(assert (=> b!1294173 (= res!860046 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29422))))

(declare-fun b!1294174 () Bool)

(declare-fun e!738529 () Bool)

(declare-fun e!738530 () Bool)

(declare-fun mapRes!53270 () Bool)

(assert (=> b!1294174 (= e!738529 (and e!738530 mapRes!53270))))

(declare-fun condMapEmpty!53270 () Bool)

(declare-datatypes ((V!51067 0))(
  ( (V!51068 (val!17311 Int)) )
))
(declare-datatypes ((ValueCell!16338 0))(
  ( (ValueCellFull!16338 (v!19914 V!51067)) (EmptyCell!16338) )
))
(declare-datatypes ((array!85970 0))(
  ( (array!85971 (arr!41486 (Array (_ BitVec 32) ValueCell!16338)) (size!42036 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85970)

(declare-fun mapDefault!53270 () ValueCell!16338)

(assert (=> b!1294174 (= condMapEmpty!53270 (= (arr!41486 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16338)) mapDefault!53270)))))

(declare-fun b!1294175 () Bool)

(declare-fun e!738531 () Bool)

(declare-fun tp_is_empty!34473 () Bool)

(assert (=> b!1294175 (= e!738531 tp_is_empty!34473)))

(declare-fun b!1294176 () Bool)

(declare-fun res!860043 () Bool)

(assert (=> b!1294176 (=> (not res!860043) (not e!738532))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85968 (_ BitVec 32)) Bool)

(assert (=> b!1294176 (= res!860043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294177 () Bool)

(declare-fun res!860048 () Bool)

(assert (=> b!1294177 (=> (not res!860048) (not e!738532))))

(declare-fun minValue!1387 () V!51067)

(declare-fun zeroValue!1387 () V!51067)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22280 0))(
  ( (tuple2!22281 (_1!11151 (_ BitVec 64)) (_2!11151 V!51067)) )
))
(declare-datatypes ((List!29426 0))(
  ( (Nil!29423) (Cons!29422 (h!30631 tuple2!22280) (t!42990 List!29426)) )
))
(declare-datatypes ((ListLongMap!19937 0))(
  ( (ListLongMap!19938 (toList!9984 List!29426)) )
))
(declare-fun contains!8102 (ListLongMap!19937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5023 (array!85968 array!85970 (_ BitVec 32) (_ BitVec 32) V!51067 V!51067 (_ BitVec 32) Int) ListLongMap!19937)

(assert (=> b!1294177 (= res!860048 (contains!8102 (getCurrentListMap!5023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294178 () Bool)

(assert (=> b!1294178 (= e!738532 (not true))))

(assert (=> b!1294178 (not (contains!8102 (ListLongMap!19938 Nil!29423) k0!1205))))

(declare-datatypes ((Unit!42860 0))(
  ( (Unit!42861) )
))
(declare-fun lt!579692 () Unit!42860)

(declare-fun emptyContainsNothing!151 ((_ BitVec 64)) Unit!42860)

(assert (=> b!1294178 (= lt!579692 (emptyContainsNothing!151 k0!1205))))

(declare-fun res!860049 () Bool)

(assert (=> start!109344 (=> (not res!860049) (not e!738532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109344 (= res!860049 (validMask!0 mask!2175))))

(assert (=> start!109344 e!738532))

(assert (=> start!109344 tp_is_empty!34473))

(assert (=> start!109344 true))

(declare-fun array_inv!31421 (array!85970) Bool)

(assert (=> start!109344 (and (array_inv!31421 _values!1445) e!738529)))

(declare-fun array_inv!31422 (array!85968) Bool)

(assert (=> start!109344 (array_inv!31422 _keys!1741)))

(assert (=> start!109344 tp!101617))

(declare-fun b!1294179 () Bool)

(declare-fun res!860042 () Bool)

(assert (=> b!1294179 (=> (not res!860042) (not e!738532))))

(assert (=> b!1294179 (= res!860042 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42035 _keys!1741))))))

(declare-fun b!1294180 () Bool)

(assert (=> b!1294180 (= e!738530 tp_is_empty!34473)))

(declare-fun mapNonEmpty!53270 () Bool)

(declare-fun tp!101618 () Bool)

(assert (=> mapNonEmpty!53270 (= mapRes!53270 (and tp!101618 e!738531))))

(declare-fun mapValue!53270 () ValueCell!16338)

(declare-fun mapRest!53270 () (Array (_ BitVec 32) ValueCell!16338))

(declare-fun mapKey!53270 () (_ BitVec 32))

(assert (=> mapNonEmpty!53270 (= (arr!41486 _values!1445) (store mapRest!53270 mapKey!53270 mapValue!53270))))

(declare-fun b!1294181 () Bool)

(declare-fun res!860047 () Bool)

(assert (=> b!1294181 (=> (not res!860047) (not e!738532))))

(assert (=> b!1294181 (= res!860047 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42035 _keys!1741))))))

(declare-fun b!1294182 () Bool)

(declare-fun res!860045 () Bool)

(assert (=> b!1294182 (=> (not res!860045) (not e!738532))))

(assert (=> b!1294182 (= res!860045 (and (= (size!42036 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42035 _keys!1741) (size!42036 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294183 () Bool)

(declare-fun res!860044 () Bool)

(assert (=> b!1294183 (=> (not res!860044) (not e!738532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294183 (= res!860044 (not (validKeyInArray!0 (select (arr!41485 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53270 () Bool)

(assert (=> mapIsEmpty!53270 mapRes!53270))

(assert (= (and start!109344 res!860049) b!1294182))

(assert (= (and b!1294182 res!860045) b!1294176))

(assert (= (and b!1294176 res!860043) b!1294173))

(assert (= (and b!1294173 res!860046) b!1294179))

(assert (= (and b!1294179 res!860042) b!1294177))

(assert (= (and b!1294177 res!860048) b!1294181))

(assert (= (and b!1294181 res!860047) b!1294183))

(assert (= (and b!1294183 res!860044) b!1294178))

(assert (= (and b!1294174 condMapEmpty!53270) mapIsEmpty!53270))

(assert (= (and b!1294174 (not condMapEmpty!53270)) mapNonEmpty!53270))

(get-info :version)

(assert (= (and mapNonEmpty!53270 ((_ is ValueCellFull!16338) mapValue!53270)) b!1294175))

(assert (= (and b!1294174 ((_ is ValueCellFull!16338) mapDefault!53270)) b!1294180))

(assert (= start!109344 b!1294174))

(declare-fun m!1186451 () Bool)

(assert (=> b!1294178 m!1186451))

(declare-fun m!1186453 () Bool)

(assert (=> b!1294178 m!1186453))

(declare-fun m!1186455 () Bool)

(assert (=> b!1294177 m!1186455))

(assert (=> b!1294177 m!1186455))

(declare-fun m!1186457 () Bool)

(assert (=> b!1294177 m!1186457))

(declare-fun m!1186459 () Bool)

(assert (=> b!1294173 m!1186459))

(declare-fun m!1186461 () Bool)

(assert (=> b!1294176 m!1186461))

(declare-fun m!1186463 () Bool)

(assert (=> start!109344 m!1186463))

(declare-fun m!1186465 () Bool)

(assert (=> start!109344 m!1186465))

(declare-fun m!1186467 () Bool)

(assert (=> start!109344 m!1186467))

(declare-fun m!1186469 () Bool)

(assert (=> b!1294183 m!1186469))

(assert (=> b!1294183 m!1186469))

(declare-fun m!1186471 () Bool)

(assert (=> b!1294183 m!1186471))

(declare-fun m!1186473 () Bool)

(assert (=> mapNonEmpty!53270 m!1186473))

(check-sat (not b!1294173) tp_is_empty!34473 (not b!1294183) b_and!46923 (not b!1294176) (not b!1294178) (not b!1294177) (not b_next!28833) (not start!109344) (not mapNonEmpty!53270))
(check-sat b_and!46923 (not b_next!28833))
