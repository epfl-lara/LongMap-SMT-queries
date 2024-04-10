; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109542 () Bool)

(assert start!109542)

(declare-fun b_free!29031 () Bool)

(declare-fun b_next!29031 () Bool)

(assert (=> start!109542 (= b_free!29031 (not b_next!29031))))

(declare-fun tp!102211 () Bool)

(declare-fun b_and!47121 () Bool)

(assert (=> start!109542 (= tp!102211 b_and!47121)))

(declare-fun b!1297408 () Bool)

(declare-fun e!740206 () Bool)

(assert (=> b!1297408 (= e!740206 false)))

(declare-datatypes ((V!51331 0))(
  ( (V!51332 (val!17410 Int)) )
))
(declare-fun minValue!1387 () V!51331)

(declare-fun zeroValue!1387 () V!51331)

(declare-fun lt!580592 () Bool)

(declare-datatypes ((ValueCell!16437 0))(
  ( (ValueCellFull!16437 (v!20013 V!51331)) (EmptyCell!16437) )
))
(declare-datatypes ((array!86352 0))(
  ( (array!86353 (arr!41677 (Array (_ BitVec 32) ValueCell!16437)) (size!42227 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86352)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86354 0))(
  ( (array!86355 (arr!41678 (Array (_ BitVec 32) (_ BitVec 64))) (size!42228 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86354)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22432 0))(
  ( (tuple2!22433 (_1!11227 (_ BitVec 64)) (_2!11227 V!51331)) )
))
(declare-datatypes ((List!29568 0))(
  ( (Nil!29565) (Cons!29564 (h!30773 tuple2!22432) (t!43132 List!29568)) )
))
(declare-datatypes ((ListLongMap!20089 0))(
  ( (ListLongMap!20090 (toList!10060 List!29568)) )
))
(declare-fun contains!8178 (ListLongMap!20089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5089 (array!86354 array!86352 (_ BitVec 32) (_ BitVec 32) V!51331 V!51331 (_ BitVec 32) Int) ListLongMap!20089)

(assert (=> b!1297408 (= lt!580592 (contains!8178 (getCurrentListMap!5089 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297409 () Bool)

(declare-fun res!862224 () Bool)

(assert (=> b!1297409 (=> (not res!862224) (not e!740206))))

(assert (=> b!1297409 (= res!862224 (and (= (size!42227 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42228 _keys!1741) (size!42227 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297410 () Bool)

(declare-fun e!740203 () Bool)

(declare-fun e!740207 () Bool)

(declare-fun mapRes!53567 () Bool)

(assert (=> b!1297410 (= e!740203 (and e!740207 mapRes!53567))))

(declare-fun condMapEmpty!53567 () Bool)

(declare-fun mapDefault!53567 () ValueCell!16437)

(assert (=> b!1297410 (= condMapEmpty!53567 (= (arr!41677 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16437)) mapDefault!53567)))))

(declare-fun mapNonEmpty!53567 () Bool)

(declare-fun tp!102212 () Bool)

(declare-fun e!740205 () Bool)

(assert (=> mapNonEmpty!53567 (= mapRes!53567 (and tp!102212 e!740205))))

(declare-fun mapRest!53567 () (Array (_ BitVec 32) ValueCell!16437))

(declare-fun mapKey!53567 () (_ BitVec 32))

(declare-fun mapValue!53567 () ValueCell!16437)

(assert (=> mapNonEmpty!53567 (= (arr!41677 _values!1445) (store mapRest!53567 mapKey!53567 mapValue!53567))))

(declare-fun b!1297411 () Bool)

(declare-fun res!862227 () Bool)

(assert (=> b!1297411 (=> (not res!862227) (not e!740206))))

(declare-datatypes ((List!29569 0))(
  ( (Nil!29566) (Cons!29565 (h!30774 (_ BitVec 64)) (t!43133 List!29569)) )
))
(declare-fun arrayNoDuplicates!0 (array!86354 (_ BitVec 32) List!29569) Bool)

(assert (=> b!1297411 (= res!862227 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29566))))

(declare-fun res!862226 () Bool)

(assert (=> start!109542 (=> (not res!862226) (not e!740206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109542 (= res!862226 (validMask!0 mask!2175))))

(assert (=> start!109542 e!740206))

(declare-fun tp_is_empty!34671 () Bool)

(assert (=> start!109542 tp_is_empty!34671))

(assert (=> start!109542 true))

(declare-fun array_inv!31543 (array!86352) Bool)

(assert (=> start!109542 (and (array_inv!31543 _values!1445) e!740203)))

(declare-fun array_inv!31544 (array!86354) Bool)

(assert (=> start!109542 (array_inv!31544 _keys!1741)))

(assert (=> start!109542 tp!102211))

(declare-fun b!1297407 () Bool)

(assert (=> b!1297407 (= e!740207 tp_is_empty!34671)))

(declare-fun b!1297412 () Bool)

(assert (=> b!1297412 (= e!740205 tp_is_empty!34671)))

(declare-fun b!1297413 () Bool)

(declare-fun res!862223 () Bool)

(assert (=> b!1297413 (=> (not res!862223) (not e!740206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86354 (_ BitVec 32)) Bool)

(assert (=> b!1297413 (= res!862223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53567 () Bool)

(assert (=> mapIsEmpty!53567 mapRes!53567))

(declare-fun b!1297414 () Bool)

(declare-fun res!862225 () Bool)

(assert (=> b!1297414 (=> (not res!862225) (not e!740206))))

(assert (=> b!1297414 (= res!862225 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42228 _keys!1741))))))

(assert (= (and start!109542 res!862226) b!1297409))

(assert (= (and b!1297409 res!862224) b!1297413))

(assert (= (and b!1297413 res!862223) b!1297411))

(assert (= (and b!1297411 res!862227) b!1297414))

(assert (= (and b!1297414 res!862225) b!1297408))

(assert (= (and b!1297410 condMapEmpty!53567) mapIsEmpty!53567))

(assert (= (and b!1297410 (not condMapEmpty!53567)) mapNonEmpty!53567))

(get-info :version)

(assert (= (and mapNonEmpty!53567 ((_ is ValueCellFull!16437) mapValue!53567)) b!1297412))

(assert (= (and b!1297410 ((_ is ValueCellFull!16437) mapDefault!53567)) b!1297407))

(assert (= start!109542 b!1297410))

(declare-fun m!1189011 () Bool)

(assert (=> start!109542 m!1189011))

(declare-fun m!1189013 () Bool)

(assert (=> start!109542 m!1189013))

(declare-fun m!1189015 () Bool)

(assert (=> start!109542 m!1189015))

(declare-fun m!1189017 () Bool)

(assert (=> b!1297411 m!1189017))

(declare-fun m!1189019 () Bool)

(assert (=> b!1297413 m!1189019))

(declare-fun m!1189021 () Bool)

(assert (=> mapNonEmpty!53567 m!1189021))

(declare-fun m!1189023 () Bool)

(assert (=> b!1297408 m!1189023))

(assert (=> b!1297408 m!1189023))

(declare-fun m!1189025 () Bool)

(assert (=> b!1297408 m!1189025))

(check-sat (not b_next!29031) (not mapNonEmpty!53567) b_and!47121 (not start!109542) (not b!1297411) (not b!1297413) tp_is_empty!34671 (not b!1297408))
(check-sat b_and!47121 (not b_next!29031))
