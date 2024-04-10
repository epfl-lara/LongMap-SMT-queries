; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108852 () Bool)

(assert start!108852)

(declare-fun b_free!28365 () Bool)

(declare-fun b_next!28365 () Bool)

(assert (=> start!108852 (= b_free!28365 (not b_next!28365))))

(declare-fun tp!100210 () Bool)

(declare-fun b_and!46431 () Bool)

(assert (=> start!108852 (= tp!100210 b_and!46431)))

(declare-fun b!1285511 () Bool)

(declare-fun res!853978 () Bool)

(declare-fun e!734298 () Bool)

(assert (=> b!1285511 (=> (not res!853978) (not e!734298))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85066 0))(
  ( (array!85067 (arr!41035 (Array (_ BitVec 32) (_ BitVec 64))) (size!41585 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85066)

(assert (=> b!1285511 (= res!853978 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41585 _keys!1741))))))

(declare-fun b!1285512 () Bool)

(declare-fun res!853977 () Bool)

(assert (=> b!1285512 (=> (not res!853977) (not e!734298))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50443 0))(
  ( (V!50444 (val!17077 Int)) )
))
(declare-datatypes ((ValueCell!16104 0))(
  ( (ValueCellFull!16104 (v!19679 V!50443)) (EmptyCell!16104) )
))
(declare-datatypes ((array!85068 0))(
  ( (array!85069 (arr!41036 (Array (_ BitVec 32) ValueCell!16104)) (size!41586 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85068)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285512 (= res!853977 (and (= (size!41586 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41585 _keys!1741) (size!41586 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285513 () Bool)

(assert (=> b!1285513 (= e!734298 false)))

(declare-fun minValue!1387 () V!50443)

(declare-fun zeroValue!1387 () V!50443)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576925 () Bool)

(declare-datatypes ((tuple2!21890 0))(
  ( (tuple2!21891 (_1!10956 (_ BitVec 64)) (_2!10956 V!50443)) )
))
(declare-datatypes ((List!29080 0))(
  ( (Nil!29077) (Cons!29076 (h!30285 tuple2!21890) (t!42624 List!29080)) )
))
(declare-datatypes ((ListLongMap!19547 0))(
  ( (ListLongMap!19548 (toList!9789 List!29080)) )
))
(declare-fun contains!7906 (ListLongMap!19547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4867 (array!85066 array!85068 (_ BitVec 32) (_ BitVec 32) V!50443 V!50443 (_ BitVec 32) Int) ListLongMap!19547)

(assert (=> b!1285513 (= lt!576925 (contains!7906 (getCurrentListMap!4867 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285514 () Bool)

(declare-fun e!734300 () Bool)

(declare-fun tp_is_empty!34005 () Bool)

(assert (=> b!1285514 (= e!734300 tp_is_empty!34005)))

(declare-fun b!1285515 () Bool)

(declare-fun e!734297 () Bool)

(assert (=> b!1285515 (= e!734297 tp_is_empty!34005)))

(declare-fun mapNonEmpty!52565 () Bool)

(declare-fun mapRes!52565 () Bool)

(declare-fun tp!100211 () Bool)

(assert (=> mapNonEmpty!52565 (= mapRes!52565 (and tp!100211 e!734300))))

(declare-fun mapValue!52565 () ValueCell!16104)

(declare-fun mapKey!52565 () (_ BitVec 32))

(declare-fun mapRest!52565 () (Array (_ BitVec 32) ValueCell!16104))

(assert (=> mapNonEmpty!52565 (= (arr!41036 _values!1445) (store mapRest!52565 mapKey!52565 mapValue!52565))))

(declare-fun b!1285516 () Bool)

(declare-fun res!853980 () Bool)

(assert (=> b!1285516 (=> (not res!853980) (not e!734298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85066 (_ BitVec 32)) Bool)

(assert (=> b!1285516 (= res!853980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285517 () Bool)

(declare-fun e!734296 () Bool)

(assert (=> b!1285517 (= e!734296 (and e!734297 mapRes!52565))))

(declare-fun condMapEmpty!52565 () Bool)

(declare-fun mapDefault!52565 () ValueCell!16104)

(assert (=> b!1285517 (= condMapEmpty!52565 (= (arr!41036 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16104)) mapDefault!52565)))))

(declare-fun res!853976 () Bool)

(assert (=> start!108852 (=> (not res!853976) (not e!734298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108852 (= res!853976 (validMask!0 mask!2175))))

(assert (=> start!108852 e!734298))

(assert (=> start!108852 tp_is_empty!34005))

(assert (=> start!108852 true))

(declare-fun array_inv!31119 (array!85068) Bool)

(assert (=> start!108852 (and (array_inv!31119 _values!1445) e!734296)))

(declare-fun array_inv!31120 (array!85066) Bool)

(assert (=> start!108852 (array_inv!31120 _keys!1741)))

(assert (=> start!108852 tp!100210))

(declare-fun b!1285518 () Bool)

(declare-fun res!853979 () Bool)

(assert (=> b!1285518 (=> (not res!853979) (not e!734298))))

(declare-datatypes ((List!29081 0))(
  ( (Nil!29078) (Cons!29077 (h!30286 (_ BitVec 64)) (t!42625 List!29081)) )
))
(declare-fun arrayNoDuplicates!0 (array!85066 (_ BitVec 32) List!29081) Bool)

(assert (=> b!1285518 (= res!853979 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29078))))

(declare-fun mapIsEmpty!52565 () Bool)

(assert (=> mapIsEmpty!52565 mapRes!52565))

(assert (= (and start!108852 res!853976) b!1285512))

(assert (= (and b!1285512 res!853977) b!1285516))

(assert (= (and b!1285516 res!853980) b!1285518))

(assert (= (and b!1285518 res!853979) b!1285511))

(assert (= (and b!1285511 res!853978) b!1285513))

(assert (= (and b!1285517 condMapEmpty!52565) mapIsEmpty!52565))

(assert (= (and b!1285517 (not condMapEmpty!52565)) mapNonEmpty!52565))

(get-info :version)

(assert (= (and mapNonEmpty!52565 ((_ is ValueCellFull!16104) mapValue!52565)) b!1285514))

(assert (= (and b!1285517 ((_ is ValueCellFull!16104) mapDefault!52565)) b!1285515))

(assert (= start!108852 b!1285517))

(declare-fun m!1178845 () Bool)

(assert (=> b!1285513 m!1178845))

(assert (=> b!1285513 m!1178845))

(declare-fun m!1178847 () Bool)

(assert (=> b!1285513 m!1178847))

(declare-fun m!1178849 () Bool)

(assert (=> start!108852 m!1178849))

(declare-fun m!1178851 () Bool)

(assert (=> start!108852 m!1178851))

(declare-fun m!1178853 () Bool)

(assert (=> start!108852 m!1178853))

(declare-fun m!1178855 () Bool)

(assert (=> b!1285518 m!1178855))

(declare-fun m!1178857 () Bool)

(assert (=> mapNonEmpty!52565 m!1178857))

(declare-fun m!1178859 () Bool)

(assert (=> b!1285516 m!1178859))

(check-sat (not b!1285513) (not b_next!28365) (not start!108852) (not mapNonEmpty!52565) b_and!46431 (not b!1285518) tp_is_empty!34005 (not b!1285516))
(check-sat b_and!46431 (not b_next!28365))
