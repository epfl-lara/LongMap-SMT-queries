; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109506 () Bool)

(assert start!109506)

(declare-fun b_free!28995 () Bool)

(declare-fun b_next!28995 () Bool)

(assert (=> start!109506 (= b_free!28995 (not b_next!28995))))

(declare-fun tp!102104 () Bool)

(declare-fun b_and!47085 () Bool)

(assert (=> start!109506 (= tp!102104 b_and!47085)))

(declare-fun res!861954 () Bool)

(declare-fun e!739934 () Bool)

(assert (=> start!109506 (=> (not res!861954) (not e!739934))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109506 (= res!861954 (validMask!0 mask!2175))))

(assert (=> start!109506 e!739934))

(declare-fun tp_is_empty!34635 () Bool)

(assert (=> start!109506 tp_is_empty!34635))

(assert (=> start!109506 true))

(declare-datatypes ((V!51283 0))(
  ( (V!51284 (val!17392 Int)) )
))
(declare-datatypes ((ValueCell!16419 0))(
  ( (ValueCellFull!16419 (v!19995 V!51283)) (EmptyCell!16419) )
))
(declare-datatypes ((array!86286 0))(
  ( (array!86287 (arr!41644 (Array (_ BitVec 32) ValueCell!16419)) (size!42194 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86286)

(declare-fun e!739936 () Bool)

(declare-fun array_inv!31517 (array!86286) Bool)

(assert (=> start!109506 (and (array_inv!31517 _values!1445) e!739936)))

(declare-datatypes ((array!86288 0))(
  ( (array!86289 (arr!41645 (Array (_ BitVec 32) (_ BitVec 64))) (size!42195 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86288)

(declare-fun array_inv!31518 (array!86288) Bool)

(assert (=> start!109506 (array_inv!31518 _keys!1741)))

(assert (=> start!109506 tp!102104))

(declare-fun mapNonEmpty!53513 () Bool)

(declare-fun mapRes!53513 () Bool)

(declare-fun tp!102103 () Bool)

(declare-fun e!739937 () Bool)

(assert (=> mapNonEmpty!53513 (= mapRes!53513 (and tp!102103 e!739937))))

(declare-fun mapValue!53513 () ValueCell!16419)

(declare-fun mapRest!53513 () (Array (_ BitVec 32) ValueCell!16419))

(declare-fun mapKey!53513 () (_ BitVec 32))

(assert (=> mapNonEmpty!53513 (= (arr!41644 _values!1445) (store mapRest!53513 mapKey!53513 mapValue!53513))))

(declare-fun b!1296975 () Bool)

(declare-fun res!861957 () Bool)

(assert (=> b!1296975 (=> (not res!861957) (not e!739934))))

(declare-datatypes ((List!29545 0))(
  ( (Nil!29542) (Cons!29541 (h!30750 (_ BitVec 64)) (t!43109 List!29545)) )
))
(declare-fun arrayNoDuplicates!0 (array!86288 (_ BitVec 32) List!29545) Bool)

(assert (=> b!1296975 (= res!861957 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29542))))

(declare-fun mapIsEmpty!53513 () Bool)

(assert (=> mapIsEmpty!53513 mapRes!53513))

(declare-fun b!1296976 () Bool)

(assert (=> b!1296976 (= e!739937 tp_is_empty!34635)))

(declare-fun b!1296977 () Bool)

(declare-fun e!739933 () Bool)

(assert (=> b!1296977 (= e!739933 tp_is_empty!34635)))

(declare-fun b!1296978 () Bool)

(assert (=> b!1296978 (= e!739934 false)))

(declare-fun minValue!1387 () V!51283)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580538 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51283)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22410 0))(
  ( (tuple2!22411 (_1!11216 (_ BitVec 64)) (_2!11216 V!51283)) )
))
(declare-datatypes ((List!29546 0))(
  ( (Nil!29543) (Cons!29542 (h!30751 tuple2!22410) (t!43110 List!29546)) )
))
(declare-datatypes ((ListLongMap!20067 0))(
  ( (ListLongMap!20068 (toList!10049 List!29546)) )
))
(declare-fun contains!8167 (ListLongMap!20067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5078 (array!86288 array!86286 (_ BitVec 32) (_ BitVec 32) V!51283 V!51283 (_ BitVec 32) Int) ListLongMap!20067)

(assert (=> b!1296978 (= lt!580538 (contains!8167 (getCurrentListMap!5078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296979 () Bool)

(declare-fun res!861955 () Bool)

(assert (=> b!1296979 (=> (not res!861955) (not e!739934))))

(assert (=> b!1296979 (= res!861955 (and (= (size!42194 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42195 _keys!1741) (size!42194 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296980 () Bool)

(declare-fun res!861956 () Bool)

(assert (=> b!1296980 (=> (not res!861956) (not e!739934))))

(assert (=> b!1296980 (= res!861956 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42195 _keys!1741))))))

(declare-fun b!1296981 () Bool)

(declare-fun res!861953 () Bool)

(assert (=> b!1296981 (=> (not res!861953) (not e!739934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86288 (_ BitVec 32)) Bool)

(assert (=> b!1296981 (= res!861953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296982 () Bool)

(assert (=> b!1296982 (= e!739936 (and e!739933 mapRes!53513))))

(declare-fun condMapEmpty!53513 () Bool)

(declare-fun mapDefault!53513 () ValueCell!16419)

(assert (=> b!1296982 (= condMapEmpty!53513 (= (arr!41644 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16419)) mapDefault!53513)))))

(assert (= (and start!109506 res!861954) b!1296979))

(assert (= (and b!1296979 res!861955) b!1296981))

(assert (= (and b!1296981 res!861953) b!1296975))

(assert (= (and b!1296975 res!861957) b!1296980))

(assert (= (and b!1296980 res!861956) b!1296978))

(assert (= (and b!1296982 condMapEmpty!53513) mapIsEmpty!53513))

(assert (= (and b!1296982 (not condMapEmpty!53513)) mapNonEmpty!53513))

(get-info :version)

(assert (= (and mapNonEmpty!53513 ((_ is ValueCellFull!16419) mapValue!53513)) b!1296976))

(assert (= (and b!1296982 ((_ is ValueCellFull!16419) mapDefault!53513)) b!1296977))

(assert (= start!109506 b!1296982))

(declare-fun m!1188723 () Bool)

(assert (=> mapNonEmpty!53513 m!1188723))

(declare-fun m!1188725 () Bool)

(assert (=> b!1296981 m!1188725))

(declare-fun m!1188727 () Bool)

(assert (=> start!109506 m!1188727))

(declare-fun m!1188729 () Bool)

(assert (=> start!109506 m!1188729))

(declare-fun m!1188731 () Bool)

(assert (=> start!109506 m!1188731))

(declare-fun m!1188733 () Bool)

(assert (=> b!1296978 m!1188733))

(assert (=> b!1296978 m!1188733))

(declare-fun m!1188735 () Bool)

(assert (=> b!1296978 m!1188735))

(declare-fun m!1188737 () Bool)

(assert (=> b!1296975 m!1188737))

(check-sat (not b!1296975) (not mapNonEmpty!53513) (not b!1296981) (not b_next!28995) (not b!1296978) (not start!109506) tp_is_empty!34635 b_and!47085)
(check-sat b_and!47085 (not b_next!28995))
