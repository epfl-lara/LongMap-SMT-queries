; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109578 () Bool)

(assert start!109578)

(declare-fun b_free!29067 () Bool)

(declare-fun b_next!29067 () Bool)

(assert (=> start!109578 (= b_free!29067 (not b_next!29067))))

(declare-fun tp!102319 () Bool)

(declare-fun b_and!47157 () Bool)

(assert (=> start!109578 (= tp!102319 b_and!47157)))

(declare-fun b!1297867 () Bool)

(declare-fun res!862522 () Bool)

(declare-fun e!740473 () Bool)

(assert (=> b!1297867 (=> (not res!862522) (not e!740473))))

(declare-datatypes ((V!51379 0))(
  ( (V!51380 (val!17428 Int)) )
))
(declare-fun minValue!1387 () V!51379)

(declare-fun zeroValue!1387 () V!51379)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86422 0))(
  ( (array!86423 (arr!41712 (Array (_ BitVec 32) (_ BitVec 64))) (size!42262 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86422)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16455 0))(
  ( (ValueCellFull!16455 (v!20031 V!51379)) (EmptyCell!16455) )
))
(declare-datatypes ((array!86424 0))(
  ( (array!86425 (arr!41713 (Array (_ BitVec 32) ValueCell!16455)) (size!42263 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86424)

(declare-datatypes ((tuple2!22464 0))(
  ( (tuple2!22465 (_1!11243 (_ BitVec 64)) (_2!11243 V!51379)) )
))
(declare-datatypes ((List!29597 0))(
  ( (Nil!29594) (Cons!29593 (h!30802 tuple2!22464) (t!43161 List!29597)) )
))
(declare-datatypes ((ListLongMap!20121 0))(
  ( (ListLongMap!20122 (toList!10076 List!29597)) )
))
(declare-fun contains!8194 (ListLongMap!20121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5105 (array!86422 array!86424 (_ BitVec 32) (_ BitVec 32) V!51379 V!51379 (_ BitVec 32) Int) ListLongMap!20121)

(assert (=> b!1297867 (= res!862522 (contains!8194 (getCurrentListMap!5105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297868 () Bool)

(declare-fun e!740476 () Bool)

(declare-fun tp_is_empty!34707 () Bool)

(assert (=> b!1297868 (= e!740476 tp_is_empty!34707)))

(declare-fun b!1297869 () Bool)

(assert (=> b!1297869 (= e!740473 (not true))))

(assert (=> b!1297869 (contains!8194 (getCurrentListMap!5105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42965 0))(
  ( (Unit!42966) )
))
(declare-fun lt!580646 () Unit!42965)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!35 (array!86422 array!86424 (_ BitVec 32) (_ BitVec 32) V!51379 V!51379 (_ BitVec 64) (_ BitVec 32) Int) Unit!42965)

(assert (=> b!1297869 (= lt!580646 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!35 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297870 () Bool)

(declare-fun res!862524 () Bool)

(assert (=> b!1297870 (=> (not res!862524) (not e!740473))))

(assert (=> b!1297870 (= res!862524 (and (= (size!42263 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42262 _keys!1741) (size!42263 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297871 () Bool)

(declare-fun e!740474 () Bool)

(assert (=> b!1297871 (= e!740474 tp_is_empty!34707)))

(declare-fun b!1297872 () Bool)

(declare-fun res!862527 () Bool)

(assert (=> b!1297872 (=> (not res!862527) (not e!740473))))

(declare-datatypes ((List!29598 0))(
  ( (Nil!29595) (Cons!29594 (h!30803 (_ BitVec 64)) (t!43162 List!29598)) )
))
(declare-fun arrayNoDuplicates!0 (array!86422 (_ BitVec 32) List!29598) Bool)

(assert (=> b!1297872 (= res!862527 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29595))))

(declare-fun b!1297873 () Bool)

(declare-fun res!862526 () Bool)

(assert (=> b!1297873 (=> (not res!862526) (not e!740473))))

(assert (=> b!1297873 (= res!862526 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42262 _keys!1741)) (not (= (select (arr!41712 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53621 () Bool)

(declare-fun mapRes!53621 () Bool)

(assert (=> mapIsEmpty!53621 mapRes!53621))

(declare-fun b!1297874 () Bool)

(declare-fun res!862525 () Bool)

(assert (=> b!1297874 (=> (not res!862525) (not e!740473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86422 (_ BitVec 32)) Bool)

(assert (=> b!1297874 (= res!862525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297875 () Bool)

(declare-fun res!862521 () Bool)

(assert (=> b!1297875 (=> (not res!862521) (not e!740473))))

(assert (=> b!1297875 (= res!862521 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42262 _keys!1741))))))

(declare-fun b!1297876 () Bool)

(declare-fun e!740475 () Bool)

(assert (=> b!1297876 (= e!740475 (and e!740476 mapRes!53621))))

(declare-fun condMapEmpty!53621 () Bool)

(declare-fun mapDefault!53621 () ValueCell!16455)

(assert (=> b!1297876 (= condMapEmpty!53621 (= (arr!41713 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16455)) mapDefault!53621)))))

(declare-fun mapNonEmpty!53621 () Bool)

(declare-fun tp!102320 () Bool)

(assert (=> mapNonEmpty!53621 (= mapRes!53621 (and tp!102320 e!740474))))

(declare-fun mapValue!53621 () ValueCell!16455)

(declare-fun mapRest!53621 () (Array (_ BitVec 32) ValueCell!16455))

(declare-fun mapKey!53621 () (_ BitVec 32))

(assert (=> mapNonEmpty!53621 (= (arr!41713 _values!1445) (store mapRest!53621 mapKey!53621 mapValue!53621))))

(declare-fun res!862523 () Bool)

(assert (=> start!109578 (=> (not res!862523) (not e!740473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109578 (= res!862523 (validMask!0 mask!2175))))

(assert (=> start!109578 e!740473))

(assert (=> start!109578 tp_is_empty!34707))

(assert (=> start!109578 true))

(declare-fun array_inv!31573 (array!86424) Bool)

(assert (=> start!109578 (and (array_inv!31573 _values!1445) e!740475)))

(declare-fun array_inv!31574 (array!86422) Bool)

(assert (=> start!109578 (array_inv!31574 _keys!1741)))

(assert (=> start!109578 tp!102319))

(assert (= (and start!109578 res!862523) b!1297870))

(assert (= (and b!1297870 res!862524) b!1297874))

(assert (= (and b!1297874 res!862525) b!1297872))

(assert (= (and b!1297872 res!862527) b!1297875))

(assert (= (and b!1297875 res!862521) b!1297867))

(assert (= (and b!1297867 res!862522) b!1297873))

(assert (= (and b!1297873 res!862526) b!1297869))

(assert (= (and b!1297876 condMapEmpty!53621) mapIsEmpty!53621))

(assert (= (and b!1297876 (not condMapEmpty!53621)) mapNonEmpty!53621))

(get-info :version)

(assert (= (and mapNonEmpty!53621 ((_ is ValueCellFull!16455) mapValue!53621)) b!1297871))

(assert (= (and b!1297876 ((_ is ValueCellFull!16455) mapDefault!53621)) b!1297868))

(assert (= start!109578 b!1297876))

(declare-fun m!1189331 () Bool)

(assert (=> b!1297874 m!1189331))

(declare-fun m!1189333 () Bool)

(assert (=> b!1297867 m!1189333))

(assert (=> b!1297867 m!1189333))

(declare-fun m!1189335 () Bool)

(assert (=> b!1297867 m!1189335))

(declare-fun m!1189337 () Bool)

(assert (=> mapNonEmpty!53621 m!1189337))

(declare-fun m!1189339 () Bool)

(assert (=> b!1297869 m!1189339))

(assert (=> b!1297869 m!1189339))

(declare-fun m!1189341 () Bool)

(assert (=> b!1297869 m!1189341))

(declare-fun m!1189343 () Bool)

(assert (=> b!1297869 m!1189343))

(declare-fun m!1189345 () Bool)

(assert (=> b!1297873 m!1189345))

(declare-fun m!1189347 () Bool)

(assert (=> start!109578 m!1189347))

(declare-fun m!1189349 () Bool)

(assert (=> start!109578 m!1189349))

(declare-fun m!1189351 () Bool)

(assert (=> start!109578 m!1189351))

(declare-fun m!1189353 () Bool)

(assert (=> b!1297872 m!1189353))

(check-sat (not start!109578) (not b!1297872) (not b!1297874) tp_is_empty!34707 b_and!47157 (not b_next!29067) (not b!1297869) (not mapNonEmpty!53621) (not b!1297867))
(check-sat b_and!47157 (not b_next!29067))
