; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109588 () Bool)

(assert start!109588)

(declare-fun b_free!29077 () Bool)

(declare-fun b_next!29077 () Bool)

(assert (=> start!109588 (= b_free!29077 (not b_next!29077))))

(declare-fun tp!102350 () Bool)

(declare-fun b_and!47149 () Bool)

(assert (=> start!109588 (= tp!102350 b_and!47149)))

(declare-fun b!1297953 () Bool)

(declare-fun res!862602 () Bool)

(declare-fun e!740520 () Bool)

(assert (=> b!1297953 (=> (not res!862602) (not e!740520))))

(declare-datatypes ((V!51393 0))(
  ( (V!51394 (val!17433 Int)) )
))
(declare-fun minValue!1387 () V!51393)

(declare-fun zeroValue!1387 () V!51393)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16460 0))(
  ( (ValueCellFull!16460 (v!20035 V!51393)) (EmptyCell!16460) )
))
(declare-datatypes ((array!86335 0))(
  ( (array!86336 (arr!41669 (Array (_ BitVec 32) ValueCell!16460)) (size!42221 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86335)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86337 0))(
  ( (array!86338 (arr!41670 (Array (_ BitVec 32) (_ BitVec 64))) (size!42222 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86337)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22520 0))(
  ( (tuple2!22521 (_1!11271 (_ BitVec 64)) (_2!11271 V!51393)) )
))
(declare-datatypes ((List!29643 0))(
  ( (Nil!29640) (Cons!29639 (h!30848 tuple2!22520) (t!43199 List!29643)) )
))
(declare-datatypes ((ListLongMap!20177 0))(
  ( (ListLongMap!20178 (toList!10104 List!29643)) )
))
(declare-fun contains!8152 (ListLongMap!20177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5020 (array!86337 array!86335 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 32) Int) ListLongMap!20177)

(assert (=> b!1297953 (= res!862602 (contains!8152 (getCurrentListMap!5020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297954 () Bool)

(declare-fun res!862600 () Bool)

(assert (=> b!1297954 (=> (not res!862600) (not e!740520))))

(assert (=> b!1297954 (= res!862600 (and (= (size!42221 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42222 _keys!1741) (size!42221 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53636 () Bool)

(declare-fun mapRes!53636 () Bool)

(declare-fun tp!102351 () Bool)

(declare-fun e!740522 () Bool)

(assert (=> mapNonEmpty!53636 (= mapRes!53636 (and tp!102351 e!740522))))

(declare-fun mapValue!53636 () ValueCell!16460)

(declare-fun mapRest!53636 () (Array (_ BitVec 32) ValueCell!16460))

(declare-fun mapKey!53636 () (_ BitVec 32))

(assert (=> mapNonEmpty!53636 (= (arr!41669 _values!1445) (store mapRest!53636 mapKey!53636 mapValue!53636))))

(declare-fun b!1297955 () Bool)

(declare-fun res!862599 () Bool)

(assert (=> b!1297955 (=> (not res!862599) (not e!740520))))

(assert (=> b!1297955 (= res!862599 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42222 _keys!1741)) (not (= (select (arr!41670 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1297956 () Bool)

(declare-fun res!862604 () Bool)

(assert (=> b!1297956 (=> (not res!862604) (not e!740520))))

(declare-datatypes ((List!29644 0))(
  ( (Nil!29641) (Cons!29640 (h!30849 (_ BitVec 64)) (t!43200 List!29644)) )
))
(declare-fun arrayNoDuplicates!0 (array!86337 (_ BitVec 32) List!29644) Bool)

(assert (=> b!1297956 (= res!862604 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29641))))

(declare-fun b!1297957 () Bool)

(declare-fun e!740523 () Bool)

(declare-fun tp_is_empty!34717 () Bool)

(assert (=> b!1297957 (= e!740523 tp_is_empty!34717)))

(declare-fun res!862605 () Bool)

(assert (=> start!109588 (=> (not res!862605) (not e!740520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109588 (= res!862605 (validMask!0 mask!2175))))

(assert (=> start!109588 e!740520))

(assert (=> start!109588 tp_is_empty!34717))

(assert (=> start!109588 true))

(declare-fun e!740521 () Bool)

(declare-fun array_inv!31699 (array!86335) Bool)

(assert (=> start!109588 (and (array_inv!31699 _values!1445) e!740521)))

(declare-fun array_inv!31700 (array!86337) Bool)

(assert (=> start!109588 (array_inv!31700 _keys!1741)))

(assert (=> start!109588 tp!102350))

(declare-fun b!1297958 () Bool)

(assert (=> b!1297958 (= e!740522 tp_is_empty!34717)))

(declare-fun b!1297959 () Bool)

(declare-fun res!862603 () Bool)

(assert (=> b!1297959 (=> (not res!862603) (not e!740520))))

(assert (=> b!1297959 (= res!862603 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42222 _keys!1741))))))

(declare-fun mapIsEmpty!53636 () Bool)

(assert (=> mapIsEmpty!53636 mapRes!53636))

(declare-fun b!1297960 () Bool)

(assert (=> b!1297960 (= e!740521 (and e!740523 mapRes!53636))))

(declare-fun condMapEmpty!53636 () Bool)

(declare-fun mapDefault!53636 () ValueCell!16460)

(assert (=> b!1297960 (= condMapEmpty!53636 (= (arr!41669 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16460)) mapDefault!53636)))))

(declare-fun b!1297961 () Bool)

(declare-fun res!862601 () Bool)

(assert (=> b!1297961 (=> (not res!862601) (not e!740520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86337 (_ BitVec 32)) Bool)

(assert (=> b!1297961 (= res!862601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297962 () Bool)

(assert (=> b!1297962 (= e!740520 (not true))))

(assert (=> b!1297962 (contains!8152 (getCurrentListMap!5020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42816 0))(
  ( (Unit!42817) )
))
(declare-fun lt!580483 () Unit!42816)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!33 (array!86337 array!86335 (_ BitVec 32) (_ BitVec 32) V!51393 V!51393 (_ BitVec 64) (_ BitVec 32) Int) Unit!42816)

(assert (=> b!1297962 (= lt!580483 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!33 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (= (and start!109588 res!862605) b!1297954))

(assert (= (and b!1297954 res!862600) b!1297961))

(assert (= (and b!1297961 res!862601) b!1297956))

(assert (= (and b!1297956 res!862604) b!1297959))

(assert (= (and b!1297959 res!862603) b!1297953))

(assert (= (and b!1297953 res!862602) b!1297955))

(assert (= (and b!1297955 res!862599) b!1297962))

(assert (= (and b!1297960 condMapEmpty!53636) mapIsEmpty!53636))

(assert (= (and b!1297960 (not condMapEmpty!53636)) mapNonEmpty!53636))

(get-info :version)

(assert (= (and mapNonEmpty!53636 ((_ is ValueCellFull!16460) mapValue!53636)) b!1297958))

(assert (= (and b!1297960 ((_ is ValueCellFull!16460) mapDefault!53636)) b!1297957))

(assert (= start!109588 b!1297960))

(declare-fun m!1188951 () Bool)

(assert (=> b!1297961 m!1188951))

(declare-fun m!1188953 () Bool)

(assert (=> b!1297962 m!1188953))

(assert (=> b!1297962 m!1188953))

(declare-fun m!1188955 () Bool)

(assert (=> b!1297962 m!1188955))

(declare-fun m!1188957 () Bool)

(assert (=> b!1297962 m!1188957))

(declare-fun m!1188959 () Bool)

(assert (=> b!1297953 m!1188959))

(assert (=> b!1297953 m!1188959))

(declare-fun m!1188961 () Bool)

(assert (=> b!1297953 m!1188961))

(declare-fun m!1188963 () Bool)

(assert (=> mapNonEmpty!53636 m!1188963))

(declare-fun m!1188965 () Bool)

(assert (=> b!1297956 m!1188965))

(declare-fun m!1188967 () Bool)

(assert (=> start!109588 m!1188967))

(declare-fun m!1188969 () Bool)

(assert (=> start!109588 m!1188969))

(declare-fun m!1188971 () Bool)

(assert (=> start!109588 m!1188971))

(declare-fun m!1188973 () Bool)

(assert (=> b!1297955 m!1188973))

(check-sat (not start!109588) (not b!1297953) tp_is_empty!34717 (not b!1297961) (not b!1297956) (not b_next!29077) b_and!47149 (not mapNonEmpty!53636) (not b!1297962))
(check-sat b_and!47149 (not b_next!29077))
