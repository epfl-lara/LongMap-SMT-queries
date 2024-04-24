; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109788 () Bool)

(assert start!109788)

(declare-fun b_free!29053 () Bool)

(declare-fun b_next!29053 () Bool)

(assert (=> start!109788 (= b_free!29053 (not b_next!29053))))

(declare-fun tp!102277 () Bool)

(declare-fun b_and!47145 () Bool)

(assert (=> start!109788 (= tp!102277 b_and!47145)))

(declare-fun b!1298976 () Bool)

(declare-fun e!741216 () Bool)

(assert (=> b!1298976 (= e!741216 false)))

(declare-datatypes ((V!51361 0))(
  ( (V!51362 (val!17421 Int)) )
))
(declare-fun minValue!1387 () V!51361)

(declare-fun zeroValue!1387 () V!51361)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581109 () Bool)

(declare-datatypes ((ValueCell!16448 0))(
  ( (ValueCellFull!16448 (v!20019 V!51361)) (EmptyCell!16448) )
))
(declare-datatypes ((array!86433 0))(
  ( (array!86434 (arr!41713 (Array (_ BitVec 32) ValueCell!16448)) (size!42264 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86433)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86435 0))(
  ( (array!86436 (arr!41714 (Array (_ BitVec 32) (_ BitVec 64))) (size!42265 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86435)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22464 0))(
  ( (tuple2!22465 (_1!11243 (_ BitVec 64)) (_2!11243 V!51361)) )
))
(declare-datatypes ((List!29625 0))(
  ( (Nil!29622) (Cons!29621 (h!30839 tuple2!22464) (t!43181 List!29625)) )
))
(declare-datatypes ((ListLongMap!20129 0))(
  ( (ListLongMap!20130 (toList!10080 List!29625)) )
))
(declare-fun contains!8210 (ListLongMap!20129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5099 (array!86435 array!86433 (_ BitVec 32) (_ BitVec 32) V!51361 V!51361 (_ BitVec 32) Int) ListLongMap!20129)

(assert (=> b!1298976 (= lt!581109 (contains!8210 (getCurrentListMap!5099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298977 () Bool)

(declare-fun e!741218 () Bool)

(declare-fun tp_is_empty!34693 () Bool)

(assert (=> b!1298977 (= e!741218 tp_is_empty!34693)))

(declare-fun b!1298978 () Bool)

(declare-fun res!862912 () Bool)

(assert (=> b!1298978 (=> (not res!862912) (not e!741216))))

(assert (=> b!1298978 (= res!862912 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42265 _keys!1741))))))

(declare-fun mapIsEmpty!53600 () Bool)

(declare-fun mapRes!53600 () Bool)

(assert (=> mapIsEmpty!53600 mapRes!53600))

(declare-fun b!1298979 () Bool)

(declare-fun res!862910 () Bool)

(assert (=> b!1298979 (=> (not res!862910) (not e!741216))))

(assert (=> b!1298979 (= res!862910 (and (= (size!42264 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42265 _keys!1741) (size!42264 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!862909 () Bool)

(assert (=> start!109788 (=> (not res!862909) (not e!741216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109788 (= res!862909 (validMask!0 mask!2175))))

(assert (=> start!109788 e!741216))

(assert (=> start!109788 tp_is_empty!34693))

(assert (=> start!109788 true))

(declare-fun e!741217 () Bool)

(declare-fun array_inv!31801 (array!86433) Bool)

(assert (=> start!109788 (and (array_inv!31801 _values!1445) e!741217)))

(declare-fun array_inv!31802 (array!86435) Bool)

(assert (=> start!109788 (array_inv!31802 _keys!1741)))

(assert (=> start!109788 tp!102277))

(declare-fun b!1298980 () Bool)

(declare-fun res!862911 () Bool)

(assert (=> b!1298980 (=> (not res!862911) (not e!741216))))

(declare-datatypes ((List!29626 0))(
  ( (Nil!29623) (Cons!29622 (h!30840 (_ BitVec 64)) (t!43182 List!29626)) )
))
(declare-fun arrayNoDuplicates!0 (array!86435 (_ BitVec 32) List!29626) Bool)

(assert (=> b!1298980 (= res!862911 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29623))))

(declare-fun b!1298981 () Bool)

(declare-fun e!741219 () Bool)

(assert (=> b!1298981 (= e!741217 (and e!741219 mapRes!53600))))

(declare-fun condMapEmpty!53600 () Bool)

(declare-fun mapDefault!53600 () ValueCell!16448)

(assert (=> b!1298981 (= condMapEmpty!53600 (= (arr!41713 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16448)) mapDefault!53600)))))

(declare-fun b!1298982 () Bool)

(assert (=> b!1298982 (= e!741219 tp_is_empty!34693)))

(declare-fun b!1298983 () Bool)

(declare-fun res!862908 () Bool)

(assert (=> b!1298983 (=> (not res!862908) (not e!741216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86435 (_ BitVec 32)) Bool)

(assert (=> b!1298983 (= res!862908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53600 () Bool)

(declare-fun tp!102278 () Bool)

(assert (=> mapNonEmpty!53600 (= mapRes!53600 (and tp!102278 e!741218))))

(declare-fun mapKey!53600 () (_ BitVec 32))

(declare-fun mapRest!53600 () (Array (_ BitVec 32) ValueCell!16448))

(declare-fun mapValue!53600 () ValueCell!16448)

(assert (=> mapNonEmpty!53600 (= (arr!41713 _values!1445) (store mapRest!53600 mapKey!53600 mapValue!53600))))

(assert (= (and start!109788 res!862909) b!1298979))

(assert (= (and b!1298979 res!862910) b!1298983))

(assert (= (and b!1298983 res!862908) b!1298980))

(assert (= (and b!1298980 res!862911) b!1298978))

(assert (= (and b!1298978 res!862912) b!1298976))

(assert (= (and b!1298981 condMapEmpty!53600) mapIsEmpty!53600))

(assert (= (and b!1298981 (not condMapEmpty!53600)) mapNonEmpty!53600))

(get-info :version)

(assert (= (and mapNonEmpty!53600 ((_ is ValueCellFull!16448) mapValue!53600)) b!1298977))

(assert (= (and b!1298981 ((_ is ValueCellFull!16448) mapDefault!53600)) b!1298982))

(assert (= start!109788 b!1298981))

(declare-fun m!1190805 () Bool)

(assert (=> b!1298976 m!1190805))

(assert (=> b!1298976 m!1190805))

(declare-fun m!1190807 () Bool)

(assert (=> b!1298976 m!1190807))

(declare-fun m!1190809 () Bool)

(assert (=> b!1298980 m!1190809))

(declare-fun m!1190811 () Bool)

(assert (=> b!1298983 m!1190811))

(declare-fun m!1190813 () Bool)

(assert (=> start!109788 m!1190813))

(declare-fun m!1190815 () Bool)

(assert (=> start!109788 m!1190815))

(declare-fun m!1190817 () Bool)

(assert (=> start!109788 m!1190817))

(declare-fun m!1190819 () Bool)

(assert (=> mapNonEmpty!53600 m!1190819))

(check-sat (not b!1298980) (not b_next!29053) (not b!1298976) b_and!47145 (not mapNonEmpty!53600) (not start!109788) tp_is_empty!34693 (not b!1298983))
(check-sat b_and!47145 (not b_next!29053))
