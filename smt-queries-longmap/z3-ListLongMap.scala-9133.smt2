; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109806 () Bool)

(assert start!109806)

(declare-fun b_free!29071 () Bool)

(declare-fun b_next!29071 () Bool)

(assert (=> start!109806 (= b_free!29071 (not b_next!29071))))

(declare-fun tp!102332 () Bool)

(declare-fun b_and!47163 () Bool)

(assert (=> start!109806 (= tp!102332 b_and!47163)))

(declare-fun b!1299232 () Bool)

(declare-fun e!741353 () Bool)

(declare-fun tp_is_empty!34711 () Bool)

(assert (=> b!1299232 (= e!741353 tp_is_empty!34711)))

(declare-fun b!1299233 () Bool)

(declare-fun res!863087 () Bool)

(declare-fun e!741351 () Bool)

(assert (=> b!1299233 (=> (not res!863087) (not e!741351))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86469 0))(
  ( (array!86470 (arr!41731 (Array (_ BitVec 32) (_ BitVec 64))) (size!42282 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86469)

(assert (=> b!1299233 (= res!863087 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42282 _keys!1741))))))

(declare-fun res!863084 () Bool)

(assert (=> start!109806 (=> (not res!863084) (not e!741351))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109806 (= res!863084 (validMask!0 mask!2175))))

(assert (=> start!109806 e!741351))

(assert (=> start!109806 tp_is_empty!34711))

(assert (=> start!109806 true))

(declare-datatypes ((V!51385 0))(
  ( (V!51386 (val!17430 Int)) )
))
(declare-datatypes ((ValueCell!16457 0))(
  ( (ValueCellFull!16457 (v!20028 V!51385)) (EmptyCell!16457) )
))
(declare-datatypes ((array!86471 0))(
  ( (array!86472 (arr!41732 (Array (_ BitVec 32) ValueCell!16457)) (size!42283 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86471)

(declare-fun e!741354 () Bool)

(declare-fun array_inv!31815 (array!86471) Bool)

(assert (=> start!109806 (and (array_inv!31815 _values!1445) e!741354)))

(declare-fun array_inv!31816 (array!86469) Bool)

(assert (=> start!109806 (array_inv!31816 _keys!1741)))

(assert (=> start!109806 tp!102332))

(declare-fun b!1299234 () Bool)

(declare-fun res!863083 () Bool)

(assert (=> b!1299234 (=> (not res!863083) (not e!741351))))

(declare-datatypes ((List!29637 0))(
  ( (Nil!29634) (Cons!29633 (h!30851 (_ BitVec 64)) (t!43193 List!29637)) )
))
(declare-fun arrayNoDuplicates!0 (array!86469 (_ BitVec 32) List!29637) Bool)

(assert (=> b!1299234 (= res!863083 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29634))))

(declare-fun b!1299235 () Bool)

(declare-fun res!863085 () Bool)

(assert (=> b!1299235 (=> (not res!863085) (not e!741351))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299235 (= res!863085 (and (= (size!42283 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42282 _keys!1741) (size!42283 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299236 () Bool)

(declare-fun res!863088 () Bool)

(assert (=> b!1299236 (=> (not res!863088) (not e!741351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86469 (_ BitVec 32)) Bool)

(assert (=> b!1299236 (= res!863088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53627 () Bool)

(declare-fun mapRes!53627 () Bool)

(assert (=> mapIsEmpty!53627 mapRes!53627))

(declare-fun mapNonEmpty!53627 () Bool)

(declare-fun tp!102331 () Bool)

(declare-fun e!741350 () Bool)

(assert (=> mapNonEmpty!53627 (= mapRes!53627 (and tp!102331 e!741350))))

(declare-fun mapRest!53627 () (Array (_ BitVec 32) ValueCell!16457))

(declare-fun mapKey!53627 () (_ BitVec 32))

(declare-fun mapValue!53627 () ValueCell!16457)

(assert (=> mapNonEmpty!53627 (= (arr!41732 _values!1445) (store mapRest!53627 mapKey!53627 mapValue!53627))))

(declare-fun b!1299237 () Bool)

(assert (=> b!1299237 (= e!741351 (not true))))

(declare-fun minValue!1387 () V!51385)

(declare-fun zeroValue!1387 () V!51385)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22478 0))(
  ( (tuple2!22479 (_1!11250 (_ BitVec 64)) (_2!11250 V!51385)) )
))
(declare-datatypes ((List!29638 0))(
  ( (Nil!29635) (Cons!29634 (h!30852 tuple2!22478) (t!43194 List!29638)) )
))
(declare-datatypes ((ListLongMap!20143 0))(
  ( (ListLongMap!20144 (toList!10087 List!29638)) )
))
(declare-fun contains!8217 (ListLongMap!20143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5106 (array!86469 array!86471 (_ BitVec 32) (_ BitVec 32) V!51385 V!51385 (_ BitVec 32) Int) ListLongMap!20143)

(assert (=> b!1299237 (contains!8217 (getCurrentListMap!5106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42929 0))(
  ( (Unit!42930) )
))
(declare-fun lt!581136 () Unit!42929)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 (array!86469 array!86471 (_ BitVec 32) (_ BitVec 32) V!51385 V!51385 (_ BitVec 64) (_ BitVec 32) Int) Unit!42929)

(assert (=> b!1299237 (= lt!581136 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299238 () Bool)

(declare-fun res!863089 () Bool)

(assert (=> b!1299238 (=> (not res!863089) (not e!741351))))

(assert (=> b!1299238 (= res!863089 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42282 _keys!1741)) (not (= (select (arr!41731 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299239 () Bool)

(assert (=> b!1299239 (= e!741354 (and e!741353 mapRes!53627))))

(declare-fun condMapEmpty!53627 () Bool)

(declare-fun mapDefault!53627 () ValueCell!16457)

(assert (=> b!1299239 (= condMapEmpty!53627 (= (arr!41732 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16457)) mapDefault!53627)))))

(declare-fun b!1299240 () Bool)

(assert (=> b!1299240 (= e!741350 tp_is_empty!34711)))

(declare-fun b!1299241 () Bool)

(declare-fun res!863086 () Bool)

(assert (=> b!1299241 (=> (not res!863086) (not e!741351))))

(assert (=> b!1299241 (= res!863086 (contains!8217 (getCurrentListMap!5106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109806 res!863084) b!1299235))

(assert (= (and b!1299235 res!863085) b!1299236))

(assert (= (and b!1299236 res!863088) b!1299234))

(assert (= (and b!1299234 res!863083) b!1299233))

(assert (= (and b!1299233 res!863087) b!1299241))

(assert (= (and b!1299241 res!863086) b!1299238))

(assert (= (and b!1299238 res!863089) b!1299237))

(assert (= (and b!1299239 condMapEmpty!53627) mapIsEmpty!53627))

(assert (= (and b!1299239 (not condMapEmpty!53627)) mapNonEmpty!53627))

(get-info :version)

(assert (= (and mapNonEmpty!53627 ((_ is ValueCellFull!16457) mapValue!53627)) b!1299240))

(assert (= (and b!1299239 ((_ is ValueCellFull!16457) mapDefault!53627)) b!1299232))

(assert (= start!109806 b!1299239))

(declare-fun m!1190997 () Bool)

(assert (=> start!109806 m!1190997))

(declare-fun m!1190999 () Bool)

(assert (=> start!109806 m!1190999))

(declare-fun m!1191001 () Bool)

(assert (=> start!109806 m!1191001))

(declare-fun m!1191003 () Bool)

(assert (=> b!1299241 m!1191003))

(assert (=> b!1299241 m!1191003))

(declare-fun m!1191005 () Bool)

(assert (=> b!1299241 m!1191005))

(declare-fun m!1191007 () Bool)

(assert (=> b!1299238 m!1191007))

(declare-fun m!1191009 () Bool)

(assert (=> b!1299236 m!1191009))

(declare-fun m!1191011 () Bool)

(assert (=> mapNonEmpty!53627 m!1191011))

(declare-fun m!1191013 () Bool)

(assert (=> b!1299234 m!1191013))

(declare-fun m!1191015 () Bool)

(assert (=> b!1299237 m!1191015))

(assert (=> b!1299237 m!1191015))

(declare-fun m!1191017 () Bool)

(assert (=> b!1299237 m!1191017))

(declare-fun m!1191019 () Bool)

(assert (=> b!1299237 m!1191019))

(check-sat (not start!109806) (not b!1299241) (not b!1299236) b_and!47163 (not mapNonEmpty!53627) tp_is_empty!34711 (not b!1299237) (not b!1299234) (not b_next!29071))
(check-sat b_and!47163 (not b_next!29071))
