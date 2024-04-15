; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109582 () Bool)

(assert start!109582)

(declare-fun b_free!29071 () Bool)

(declare-fun b_next!29071 () Bool)

(assert (=> start!109582 (= b_free!29071 (not b_next!29071))))

(declare-fun tp!102333 () Bool)

(declare-fun b_and!47143 () Bool)

(assert (=> start!109582 (= tp!102333 b_and!47143)))

(declare-fun b!1297863 () Bool)

(declare-fun e!740478 () Bool)

(declare-fun tp_is_empty!34711 () Bool)

(assert (=> b!1297863 (= e!740478 tp_is_empty!34711)))

(declare-fun b!1297864 () Bool)

(declare-fun res!862539 () Bool)

(declare-fun e!740477 () Bool)

(assert (=> b!1297864 (=> (not res!862539) (not e!740477))))

(declare-datatypes ((array!86323 0))(
  ( (array!86324 (arr!41663 (Array (_ BitVec 32) (_ BitVec 64))) (size!42215 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86323)

(declare-datatypes ((List!29640 0))(
  ( (Nil!29637) (Cons!29636 (h!30845 (_ BitVec 64)) (t!43196 List!29640)) )
))
(declare-fun arrayNoDuplicates!0 (array!86323 (_ BitVec 32) List!29640) Bool)

(assert (=> b!1297864 (= res!862539 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29637))))

(declare-fun b!1297865 () Bool)

(declare-fun e!740476 () Bool)

(assert (=> b!1297865 (= e!740476 tp_is_empty!34711)))

(declare-fun b!1297866 () Bool)

(declare-fun res!862541 () Bool)

(assert (=> b!1297866 (=> (not res!862541) (not e!740477))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1297866 (= res!862541 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42215 _keys!1741)) (not (= (select (arr!41663 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53627 () Bool)

(declare-fun mapRes!53627 () Bool)

(assert (=> mapIsEmpty!53627 mapRes!53627))

(declare-fun b!1297867 () Bool)

(assert (=> b!1297867 (= e!740477 (not true))))

(declare-datatypes ((V!51385 0))(
  ( (V!51386 (val!17430 Int)) )
))
(declare-fun minValue!1387 () V!51385)

(declare-fun zeroValue!1387 () V!51385)

(declare-datatypes ((ValueCell!16457 0))(
  ( (ValueCellFull!16457 (v!20032 V!51385)) (EmptyCell!16457) )
))
(declare-datatypes ((array!86325 0))(
  ( (array!86326 (arr!41664 (Array (_ BitVec 32) ValueCell!16457)) (size!42216 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86325)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22516 0))(
  ( (tuple2!22517 (_1!11269 (_ BitVec 64)) (_2!11269 V!51385)) )
))
(declare-datatypes ((List!29641 0))(
  ( (Nil!29638) (Cons!29637 (h!30846 tuple2!22516) (t!43197 List!29641)) )
))
(declare-datatypes ((ListLongMap!20173 0))(
  ( (ListLongMap!20174 (toList!10102 List!29641)) )
))
(declare-fun contains!8150 (ListLongMap!20173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5018 (array!86323 array!86325 (_ BitVec 32) (_ BitVec 32) V!51385 V!51385 (_ BitVec 32) Int) ListLongMap!20173)

(assert (=> b!1297867 (contains!8150 (getCurrentListMap!5018 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42812 0))(
  ( (Unit!42813) )
))
(declare-fun lt!580474 () Unit!42812)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 (array!86323 array!86325 (_ BitVec 32) (_ BitVec 32) V!51385 V!51385 (_ BitVec 64) (_ BitVec 32) Int) Unit!42812)

(assert (=> b!1297867 (= lt!580474 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!31 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297868 () Bool)

(declare-fun e!740474 () Bool)

(assert (=> b!1297868 (= e!740474 (and e!740478 mapRes!53627))))

(declare-fun condMapEmpty!53627 () Bool)

(declare-fun mapDefault!53627 () ValueCell!16457)

(assert (=> b!1297868 (= condMapEmpty!53627 (= (arr!41664 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16457)) mapDefault!53627)))))

(declare-fun res!862537 () Bool)

(assert (=> start!109582 (=> (not res!862537) (not e!740477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109582 (= res!862537 (validMask!0 mask!2175))))

(assert (=> start!109582 e!740477))

(assert (=> start!109582 tp_is_empty!34711))

(assert (=> start!109582 true))

(declare-fun array_inv!31695 (array!86325) Bool)

(assert (=> start!109582 (and (array_inv!31695 _values!1445) e!740474)))

(declare-fun array_inv!31696 (array!86323) Bool)

(assert (=> start!109582 (array_inv!31696 _keys!1741)))

(assert (=> start!109582 tp!102333))

(declare-fun b!1297869 () Bool)

(declare-fun res!862536 () Bool)

(assert (=> b!1297869 (=> (not res!862536) (not e!740477))))

(assert (=> b!1297869 (= res!862536 (and (= (size!42216 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42215 _keys!1741) (size!42216 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297870 () Bool)

(declare-fun res!862540 () Bool)

(assert (=> b!1297870 (=> (not res!862540) (not e!740477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86323 (_ BitVec 32)) Bool)

(assert (=> b!1297870 (= res!862540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297871 () Bool)

(declare-fun res!862538 () Bool)

(assert (=> b!1297871 (=> (not res!862538) (not e!740477))))

(assert (=> b!1297871 (= res!862538 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42215 _keys!1741))))))

(declare-fun b!1297872 () Bool)

(declare-fun res!862542 () Bool)

(assert (=> b!1297872 (=> (not res!862542) (not e!740477))))

(assert (=> b!1297872 (= res!862542 (contains!8150 (getCurrentListMap!5018 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53627 () Bool)

(declare-fun tp!102332 () Bool)

(assert (=> mapNonEmpty!53627 (= mapRes!53627 (and tp!102332 e!740476))))

(declare-fun mapKey!53627 () (_ BitVec 32))

(declare-fun mapValue!53627 () ValueCell!16457)

(declare-fun mapRest!53627 () (Array (_ BitVec 32) ValueCell!16457))

(assert (=> mapNonEmpty!53627 (= (arr!41664 _values!1445) (store mapRest!53627 mapKey!53627 mapValue!53627))))

(assert (= (and start!109582 res!862537) b!1297869))

(assert (= (and b!1297869 res!862536) b!1297870))

(assert (= (and b!1297870 res!862540) b!1297864))

(assert (= (and b!1297864 res!862539) b!1297871))

(assert (= (and b!1297871 res!862538) b!1297872))

(assert (= (and b!1297872 res!862542) b!1297866))

(assert (= (and b!1297866 res!862541) b!1297867))

(assert (= (and b!1297868 condMapEmpty!53627) mapIsEmpty!53627))

(assert (= (and b!1297868 (not condMapEmpty!53627)) mapNonEmpty!53627))

(get-info :version)

(assert (= (and mapNonEmpty!53627 ((_ is ValueCellFull!16457) mapValue!53627)) b!1297865))

(assert (= (and b!1297868 ((_ is ValueCellFull!16457) mapDefault!53627)) b!1297863))

(assert (= start!109582 b!1297868))

(declare-fun m!1188879 () Bool)

(assert (=> start!109582 m!1188879))

(declare-fun m!1188881 () Bool)

(assert (=> start!109582 m!1188881))

(declare-fun m!1188883 () Bool)

(assert (=> start!109582 m!1188883))

(declare-fun m!1188885 () Bool)

(assert (=> b!1297864 m!1188885))

(declare-fun m!1188887 () Bool)

(assert (=> b!1297867 m!1188887))

(assert (=> b!1297867 m!1188887))

(declare-fun m!1188889 () Bool)

(assert (=> b!1297867 m!1188889))

(declare-fun m!1188891 () Bool)

(assert (=> b!1297867 m!1188891))

(declare-fun m!1188893 () Bool)

(assert (=> b!1297872 m!1188893))

(assert (=> b!1297872 m!1188893))

(declare-fun m!1188895 () Bool)

(assert (=> b!1297872 m!1188895))

(declare-fun m!1188897 () Bool)

(assert (=> mapNonEmpty!53627 m!1188897))

(declare-fun m!1188899 () Bool)

(assert (=> b!1297870 m!1188899))

(declare-fun m!1188901 () Bool)

(assert (=> b!1297866 m!1188901))

(check-sat (not mapNonEmpty!53627) (not b!1297870) tp_is_empty!34711 (not b_next!29071) (not b!1297867) (not start!109582) (not b!1297872) (not b!1297864) b_and!47143)
(check-sat b_and!47143 (not b_next!29071))
