; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109584 () Bool)

(assert start!109584)

(declare-fun b_free!29073 () Bool)

(declare-fun b_next!29073 () Bool)

(assert (=> start!109584 (= b_free!29073 (not b_next!29073))))

(declare-fun tp!102337 () Bool)

(declare-fun b_and!47163 () Bool)

(assert (=> start!109584 (= tp!102337 b_and!47163)))

(declare-fun b!1297957 () Bool)

(declare-fun res!862588 () Bool)

(declare-fun e!740518 () Bool)

(assert (=> b!1297957 (=> (not res!862588) (not e!740518))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86432 0))(
  ( (array!86433 (arr!41717 (Array (_ BitVec 32) (_ BitVec 64))) (size!42267 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86432)

(assert (=> b!1297957 (= res!862588 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42267 _keys!1741))))))

(declare-fun b!1297958 () Bool)

(declare-fun e!740521 () Bool)

(declare-fun tp_is_empty!34713 () Bool)

(assert (=> b!1297958 (= e!740521 tp_is_empty!34713)))

(declare-fun b!1297959 () Bool)

(declare-fun e!740520 () Bool)

(declare-fun mapRes!53630 () Bool)

(assert (=> b!1297959 (= e!740520 (and e!740521 mapRes!53630))))

(declare-fun condMapEmpty!53630 () Bool)

(declare-datatypes ((V!51387 0))(
  ( (V!51388 (val!17431 Int)) )
))
(declare-datatypes ((ValueCell!16458 0))(
  ( (ValueCellFull!16458 (v!20034 V!51387)) (EmptyCell!16458) )
))
(declare-datatypes ((array!86434 0))(
  ( (array!86435 (arr!41718 (Array (_ BitVec 32) ValueCell!16458)) (size!42268 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86434)

(declare-fun mapDefault!53630 () ValueCell!16458)

(assert (=> b!1297959 (= condMapEmpty!53630 (= (arr!41718 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16458)) mapDefault!53630)))))

(declare-fun b!1297960 () Bool)

(declare-fun res!862589 () Bool)

(assert (=> b!1297960 (=> (not res!862589) (not e!740518))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297960 (= res!862589 (and (= (size!42268 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42267 _keys!1741) (size!42268 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297961 () Bool)

(declare-fun res!862586 () Bool)

(assert (=> b!1297961 (=> (not res!862586) (not e!740518))))

(declare-datatypes ((List!29600 0))(
  ( (Nil!29597) (Cons!29596 (h!30805 (_ BitVec 64)) (t!43164 List!29600)) )
))
(declare-fun arrayNoDuplicates!0 (array!86432 (_ BitVec 32) List!29600) Bool)

(assert (=> b!1297961 (= res!862586 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29597))))

(declare-fun b!1297962 () Bool)

(declare-fun res!862590 () Bool)

(assert (=> b!1297962 (=> (not res!862590) (not e!740518))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1297962 (= res!862590 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42267 _keys!1741)) (not (= (select (arr!41717 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!53630 () Bool)

(declare-fun tp!102338 () Bool)

(declare-fun e!740519 () Bool)

(assert (=> mapNonEmpty!53630 (= mapRes!53630 (and tp!102338 e!740519))))

(declare-fun mapRest!53630 () (Array (_ BitVec 32) ValueCell!16458))

(declare-fun mapKey!53630 () (_ BitVec 32))

(declare-fun mapValue!53630 () ValueCell!16458)

(assert (=> mapNonEmpty!53630 (= (arr!41718 _values!1445) (store mapRest!53630 mapKey!53630 mapValue!53630))))

(declare-fun b!1297964 () Bool)

(assert (=> b!1297964 (= e!740518 (not true))))

(declare-fun minValue!1387 () V!51387)

(declare-fun zeroValue!1387 () V!51387)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22468 0))(
  ( (tuple2!22469 (_1!11245 (_ BitVec 64)) (_2!11245 V!51387)) )
))
(declare-datatypes ((List!29601 0))(
  ( (Nil!29598) (Cons!29597 (h!30806 tuple2!22468) (t!43165 List!29601)) )
))
(declare-datatypes ((ListLongMap!20125 0))(
  ( (ListLongMap!20126 (toList!10078 List!29601)) )
))
(declare-fun contains!8196 (ListLongMap!20125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5107 (array!86432 array!86434 (_ BitVec 32) (_ BitVec 32) V!51387 V!51387 (_ BitVec 32) Int) ListLongMap!20125)

(assert (=> b!1297964 (contains!8196 (getCurrentListMap!5107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42969 0))(
  ( (Unit!42970) )
))
(declare-fun lt!580655 () Unit!42969)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!37 (array!86432 array!86434 (_ BitVec 32) (_ BitVec 32) V!51387 V!51387 (_ BitVec 64) (_ BitVec 32) Int) Unit!42969)

(assert (=> b!1297964 (= lt!580655 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!37 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297965 () Bool)

(assert (=> b!1297965 (= e!740519 tp_is_empty!34713)))

(declare-fun res!862584 () Bool)

(assert (=> start!109584 (=> (not res!862584) (not e!740518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109584 (= res!862584 (validMask!0 mask!2175))))

(assert (=> start!109584 e!740518))

(assert (=> start!109584 tp_is_empty!34713))

(assert (=> start!109584 true))

(declare-fun array_inv!31575 (array!86434) Bool)

(assert (=> start!109584 (and (array_inv!31575 _values!1445) e!740520)))

(declare-fun array_inv!31576 (array!86432) Bool)

(assert (=> start!109584 (array_inv!31576 _keys!1741)))

(assert (=> start!109584 tp!102337))

(declare-fun b!1297963 () Bool)

(declare-fun res!862585 () Bool)

(assert (=> b!1297963 (=> (not res!862585) (not e!740518))))

(assert (=> b!1297963 (= res!862585 (contains!8196 (getCurrentListMap!5107 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53630 () Bool)

(assert (=> mapIsEmpty!53630 mapRes!53630))

(declare-fun b!1297966 () Bool)

(declare-fun res!862587 () Bool)

(assert (=> b!1297966 (=> (not res!862587) (not e!740518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86432 (_ BitVec 32)) Bool)

(assert (=> b!1297966 (= res!862587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109584 res!862584) b!1297960))

(assert (= (and b!1297960 res!862589) b!1297966))

(assert (= (and b!1297966 res!862587) b!1297961))

(assert (= (and b!1297961 res!862586) b!1297957))

(assert (= (and b!1297957 res!862588) b!1297963))

(assert (= (and b!1297963 res!862585) b!1297962))

(assert (= (and b!1297962 res!862590) b!1297964))

(assert (= (and b!1297959 condMapEmpty!53630) mapIsEmpty!53630))

(assert (= (and b!1297959 (not condMapEmpty!53630)) mapNonEmpty!53630))

(get-info :version)

(assert (= (and mapNonEmpty!53630 ((_ is ValueCellFull!16458) mapValue!53630)) b!1297965))

(assert (= (and b!1297959 ((_ is ValueCellFull!16458) mapDefault!53630)) b!1297958))

(assert (= start!109584 b!1297959))

(declare-fun m!1189403 () Bool)

(assert (=> mapNonEmpty!53630 m!1189403))

(declare-fun m!1189405 () Bool)

(assert (=> b!1297962 m!1189405))

(declare-fun m!1189407 () Bool)

(assert (=> b!1297966 m!1189407))

(declare-fun m!1189409 () Bool)

(assert (=> b!1297961 m!1189409))

(declare-fun m!1189411 () Bool)

(assert (=> b!1297963 m!1189411))

(assert (=> b!1297963 m!1189411))

(declare-fun m!1189413 () Bool)

(assert (=> b!1297963 m!1189413))

(declare-fun m!1189415 () Bool)

(assert (=> b!1297964 m!1189415))

(assert (=> b!1297964 m!1189415))

(declare-fun m!1189417 () Bool)

(assert (=> b!1297964 m!1189417))

(declare-fun m!1189419 () Bool)

(assert (=> b!1297964 m!1189419))

(declare-fun m!1189421 () Bool)

(assert (=> start!109584 m!1189421))

(declare-fun m!1189423 () Bool)

(assert (=> start!109584 m!1189423))

(declare-fun m!1189425 () Bool)

(assert (=> start!109584 m!1189425))

(check-sat b_and!47163 (not b!1297961) (not mapNonEmpty!53630) tp_is_empty!34713 (not b!1297963) (not b!1297964) (not b_next!29073) (not start!109584) (not b!1297966))
(check-sat b_and!47163 (not b_next!29073))
