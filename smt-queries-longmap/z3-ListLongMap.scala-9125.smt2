; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109536 () Bool)

(assert start!109536)

(declare-fun b_free!29025 () Bool)

(declare-fun b_next!29025 () Bool)

(assert (=> start!109536 (= b_free!29025 (not b_next!29025))))

(declare-fun tp!102193 () Bool)

(declare-fun b_and!47115 () Bool)

(assert (=> start!109536 (= tp!102193 b_and!47115)))

(declare-fun b!1297335 () Bool)

(declare-fun e!740158 () Bool)

(declare-fun tp_is_empty!34665 () Bool)

(assert (=> b!1297335 (= e!740158 tp_is_empty!34665)))

(declare-fun b!1297336 () Bool)

(declare-fun e!740159 () Bool)

(assert (=> b!1297336 (= e!740159 false)))

(declare-datatypes ((V!51323 0))(
  ( (V!51324 (val!17407 Int)) )
))
(declare-fun minValue!1387 () V!51323)

(declare-fun zeroValue!1387 () V!51323)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16434 0))(
  ( (ValueCellFull!16434 (v!20010 V!51323)) (EmptyCell!16434) )
))
(declare-datatypes ((array!86340 0))(
  ( (array!86341 (arr!41671 (Array (_ BitVec 32) ValueCell!16434)) (size!42221 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86340)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86342 0))(
  ( (array!86343 (arr!41672 (Array (_ BitVec 32) (_ BitVec 64))) (size!42222 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86342)

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!580583 () Bool)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22428 0))(
  ( (tuple2!22429 (_1!11225 (_ BitVec 64)) (_2!11225 V!51323)) )
))
(declare-datatypes ((List!29564 0))(
  ( (Nil!29561) (Cons!29560 (h!30769 tuple2!22428) (t!43128 List!29564)) )
))
(declare-datatypes ((ListLongMap!20085 0))(
  ( (ListLongMap!20086 (toList!10058 List!29564)) )
))
(declare-fun contains!8176 (ListLongMap!20085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5087 (array!86342 array!86340 (_ BitVec 32) (_ BitVec 32) V!51323 V!51323 (_ BitVec 32) Int) ListLongMap!20085)

(assert (=> b!1297336 (= lt!580583 (contains!8176 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297337 () Bool)

(declare-fun res!862178 () Bool)

(assert (=> b!1297337 (=> (not res!862178) (not e!740159))))

(assert (=> b!1297337 (= res!862178 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42222 _keys!1741))))))

(declare-fun b!1297338 () Bool)

(declare-fun res!862181 () Bool)

(assert (=> b!1297338 (=> (not res!862181) (not e!740159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86342 (_ BitVec 32)) Bool)

(assert (=> b!1297338 (= res!862181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53558 () Bool)

(declare-fun mapRes!53558 () Bool)

(declare-fun tp!102194 () Bool)

(assert (=> mapNonEmpty!53558 (= mapRes!53558 (and tp!102194 e!740158))))

(declare-fun mapRest!53558 () (Array (_ BitVec 32) ValueCell!16434))

(declare-fun mapKey!53558 () (_ BitVec 32))

(declare-fun mapValue!53558 () ValueCell!16434)

(assert (=> mapNonEmpty!53558 (= (arr!41671 _values!1445) (store mapRest!53558 mapKey!53558 mapValue!53558))))

(declare-fun res!862179 () Bool)

(assert (=> start!109536 (=> (not res!862179) (not e!740159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109536 (= res!862179 (validMask!0 mask!2175))))

(assert (=> start!109536 e!740159))

(assert (=> start!109536 tp_is_empty!34665))

(assert (=> start!109536 true))

(declare-fun e!740160 () Bool)

(declare-fun array_inv!31537 (array!86340) Bool)

(assert (=> start!109536 (and (array_inv!31537 _values!1445) e!740160)))

(declare-fun array_inv!31538 (array!86342) Bool)

(assert (=> start!109536 (array_inv!31538 _keys!1741)))

(assert (=> start!109536 tp!102193))

(declare-fun b!1297339 () Bool)

(declare-fun e!740161 () Bool)

(assert (=> b!1297339 (= e!740160 (and e!740161 mapRes!53558))))

(declare-fun condMapEmpty!53558 () Bool)

(declare-fun mapDefault!53558 () ValueCell!16434)

(assert (=> b!1297339 (= condMapEmpty!53558 (= (arr!41671 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16434)) mapDefault!53558)))))

(declare-fun b!1297340 () Bool)

(declare-fun res!862180 () Bool)

(assert (=> b!1297340 (=> (not res!862180) (not e!740159))))

(assert (=> b!1297340 (= res!862180 (and (= (size!42221 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42222 _keys!1741) (size!42221 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297341 () Bool)

(assert (=> b!1297341 (= e!740161 tp_is_empty!34665)))

(declare-fun b!1297342 () Bool)

(declare-fun res!862182 () Bool)

(assert (=> b!1297342 (=> (not res!862182) (not e!740159))))

(declare-datatypes ((List!29565 0))(
  ( (Nil!29562) (Cons!29561 (h!30770 (_ BitVec 64)) (t!43129 List!29565)) )
))
(declare-fun arrayNoDuplicates!0 (array!86342 (_ BitVec 32) List!29565) Bool)

(assert (=> b!1297342 (= res!862182 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29562))))

(declare-fun mapIsEmpty!53558 () Bool)

(assert (=> mapIsEmpty!53558 mapRes!53558))

(assert (= (and start!109536 res!862179) b!1297340))

(assert (= (and b!1297340 res!862180) b!1297338))

(assert (= (and b!1297338 res!862181) b!1297342))

(assert (= (and b!1297342 res!862182) b!1297337))

(assert (= (and b!1297337 res!862178) b!1297336))

(assert (= (and b!1297339 condMapEmpty!53558) mapIsEmpty!53558))

(assert (= (and b!1297339 (not condMapEmpty!53558)) mapNonEmpty!53558))

(get-info :version)

(assert (= (and mapNonEmpty!53558 ((_ is ValueCellFull!16434) mapValue!53558)) b!1297335))

(assert (= (and b!1297339 ((_ is ValueCellFull!16434) mapDefault!53558)) b!1297341))

(assert (= start!109536 b!1297339))

(declare-fun m!1188963 () Bool)

(assert (=> start!109536 m!1188963))

(declare-fun m!1188965 () Bool)

(assert (=> start!109536 m!1188965))

(declare-fun m!1188967 () Bool)

(assert (=> start!109536 m!1188967))

(declare-fun m!1188969 () Bool)

(assert (=> mapNonEmpty!53558 m!1188969))

(declare-fun m!1188971 () Bool)

(assert (=> b!1297338 m!1188971))

(declare-fun m!1188973 () Bool)

(assert (=> b!1297336 m!1188973))

(assert (=> b!1297336 m!1188973))

(declare-fun m!1188975 () Bool)

(assert (=> b!1297336 m!1188975))

(declare-fun m!1188977 () Bool)

(assert (=> b!1297342 m!1188977))

(check-sat (not b!1297336) (not mapNonEmpty!53558) b_and!47115 tp_is_empty!34665 (not b!1297342) (not start!109536) (not b_next!29025) (not b!1297338))
(check-sat b_and!47115 (not b_next!29025))
