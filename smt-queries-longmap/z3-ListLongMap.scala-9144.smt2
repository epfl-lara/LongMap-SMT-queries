; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109908 () Bool)

(assert start!109908)

(declare-fun b_free!29137 () Bool)

(declare-fun b_next!29137 () Bool)

(assert (=> start!109908 (= b_free!29137 (not b_next!29137))))

(declare-fun tp!102535 () Bool)

(declare-fun b_and!47235 () Bool)

(assert (=> start!109908 (= tp!102535 b_and!47235)))

(declare-fun b!1300489 () Bool)

(declare-fun e!742032 () Bool)

(declare-fun e!742034 () Bool)

(declare-fun mapRes!53732 () Bool)

(assert (=> b!1300489 (= e!742032 (and e!742034 mapRes!53732))))

(declare-fun condMapEmpty!53732 () Bool)

(declare-datatypes ((V!51473 0))(
  ( (V!51474 (val!17463 Int)) )
))
(declare-datatypes ((ValueCell!16490 0))(
  ( (ValueCellFull!16490 (v!20063 V!51473)) (EmptyCell!16490) )
))
(declare-datatypes ((array!86601 0))(
  ( (array!86602 (arr!41795 (Array (_ BitVec 32) ValueCell!16490)) (size!42346 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86601)

(declare-fun mapDefault!53732 () ValueCell!16490)

(assert (=> b!1300489 (= condMapEmpty!53732 (= (arr!41795 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16490)) mapDefault!53732)))))

(declare-fun b!1300490 () Bool)

(declare-fun res!863897 () Bool)

(declare-fun e!742031 () Bool)

(assert (=> b!1300490 (=> (not res!863897) (not e!742031))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86603 0))(
  ( (array!86604 (arr!41796 (Array (_ BitVec 32) (_ BitVec 64))) (size!42347 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86603)

(assert (=> b!1300490 (= res!863897 (and (= (size!42346 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42347 _keys!1741) (size!42346 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300491 () Bool)

(declare-fun res!863898 () Bool)

(assert (=> b!1300491 (=> (not res!863898) (not e!742031))))

(declare-datatypes ((List!29688 0))(
  ( (Nil!29685) (Cons!29684 (h!30902 (_ BitVec 64)) (t!43248 List!29688)) )
))
(declare-fun arrayNoDuplicates!0 (array!86603 (_ BitVec 32) List!29688) Bool)

(assert (=> b!1300491 (= res!863898 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29685))))

(declare-fun b!1300492 () Bool)

(assert (=> b!1300492 (= e!742031 false)))

(declare-fun minValue!1387 () V!51473)

(declare-fun zeroValue!1387 () V!51473)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581441 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22528 0))(
  ( (tuple2!22529 (_1!11275 (_ BitVec 64)) (_2!11275 V!51473)) )
))
(declare-datatypes ((List!29689 0))(
  ( (Nil!29686) (Cons!29685 (h!30903 tuple2!22528) (t!43249 List!29689)) )
))
(declare-datatypes ((ListLongMap!20193 0))(
  ( (ListLongMap!20194 (toList!10112 List!29689)) )
))
(declare-fun contains!8244 (ListLongMap!20193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5131 (array!86603 array!86601 (_ BitVec 32) (_ BitVec 32) V!51473 V!51473 (_ BitVec 32) Int) ListLongMap!20193)

(assert (=> b!1300492 (= lt!581441 (contains!8244 (getCurrentListMap!5131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300494 () Bool)

(declare-fun res!863895 () Bool)

(assert (=> b!1300494 (=> (not res!863895) (not e!742031))))

(assert (=> b!1300494 (= res!863895 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42347 _keys!1741))))))

(declare-fun mapIsEmpty!53732 () Bool)

(assert (=> mapIsEmpty!53732 mapRes!53732))

(declare-fun b!1300495 () Bool)

(declare-fun e!742030 () Bool)

(declare-fun tp_is_empty!34777 () Bool)

(assert (=> b!1300495 (= e!742030 tp_is_empty!34777)))

(declare-fun b!1300493 () Bool)

(assert (=> b!1300493 (= e!742034 tp_is_empty!34777)))

(declare-fun res!863899 () Bool)

(assert (=> start!109908 (=> (not res!863899) (not e!742031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109908 (= res!863899 (validMask!0 mask!2175))))

(assert (=> start!109908 e!742031))

(assert (=> start!109908 tp_is_empty!34777))

(assert (=> start!109908 true))

(declare-fun array_inv!31865 (array!86601) Bool)

(assert (=> start!109908 (and (array_inv!31865 _values!1445) e!742032)))

(declare-fun array_inv!31866 (array!86603) Bool)

(assert (=> start!109908 (array_inv!31866 _keys!1741)))

(assert (=> start!109908 tp!102535))

(declare-fun b!1300496 () Bool)

(declare-fun res!863896 () Bool)

(assert (=> b!1300496 (=> (not res!863896) (not e!742031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86603 (_ BitVec 32)) Bool)

(assert (=> b!1300496 (= res!863896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53732 () Bool)

(declare-fun tp!102536 () Bool)

(assert (=> mapNonEmpty!53732 (= mapRes!53732 (and tp!102536 e!742030))))

(declare-fun mapKey!53732 () (_ BitVec 32))

(declare-fun mapRest!53732 () (Array (_ BitVec 32) ValueCell!16490))

(declare-fun mapValue!53732 () ValueCell!16490)

(assert (=> mapNonEmpty!53732 (= (arr!41795 _values!1445) (store mapRest!53732 mapKey!53732 mapValue!53732))))

(assert (= (and start!109908 res!863899) b!1300490))

(assert (= (and b!1300490 res!863897) b!1300496))

(assert (= (and b!1300496 res!863896) b!1300491))

(assert (= (and b!1300491 res!863898) b!1300494))

(assert (= (and b!1300494 res!863895) b!1300492))

(assert (= (and b!1300489 condMapEmpty!53732) mapIsEmpty!53732))

(assert (= (and b!1300489 (not condMapEmpty!53732)) mapNonEmpty!53732))

(get-info :version)

(assert (= (and mapNonEmpty!53732 ((_ is ValueCellFull!16490) mapValue!53732)) b!1300495))

(assert (= (and b!1300489 ((_ is ValueCellFull!16490) mapDefault!53732)) b!1300493))

(assert (= start!109908 b!1300489))

(declare-fun m!1192037 () Bool)

(assert (=> b!1300496 m!1192037))

(declare-fun m!1192039 () Bool)

(assert (=> b!1300492 m!1192039))

(assert (=> b!1300492 m!1192039))

(declare-fun m!1192041 () Bool)

(assert (=> b!1300492 m!1192041))

(declare-fun m!1192043 () Bool)

(assert (=> b!1300491 m!1192043))

(declare-fun m!1192045 () Bool)

(assert (=> mapNonEmpty!53732 m!1192045))

(declare-fun m!1192047 () Bool)

(assert (=> start!109908 m!1192047))

(declare-fun m!1192049 () Bool)

(assert (=> start!109908 m!1192049))

(declare-fun m!1192051 () Bool)

(assert (=> start!109908 m!1192051))

(check-sat (not b!1300496) (not mapNonEmpty!53732) (not b!1300492) (not b!1300491) tp_is_empty!34777 b_and!47235 (not start!109908) (not b_next!29137))
(check-sat b_and!47235 (not b_next!29137))
