; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3896 () Bool)

(assert start!3896)

(declare-fun b_free!805 () Bool)

(declare-fun b_next!805 () Bool)

(assert (=> start!3896 (= b_free!805 (not b_next!805))))

(declare-fun tp!3835 () Bool)

(declare-fun b_and!1605 () Bool)

(assert (=> start!3896 (= tp!3835 b_and!1605)))

(declare-fun b!27384 () Bool)

(declare-fun e!17833 () Bool)

(declare-fun e!17832 () Bool)

(declare-fun mapRes!1267 () Bool)

(assert (=> b!27384 (= e!17833 (and e!17832 mapRes!1267))))

(declare-fun condMapEmpty!1267 () Bool)

(declare-datatypes ((V!1371 0))(
  ( (V!1372 (val!606 Int)) )
))
(declare-datatypes ((ValueCell!380 0))(
  ( (ValueCellFull!380 (v!1695 V!1371)) (EmptyCell!380) )
))
(declare-datatypes ((array!1541 0))(
  ( (array!1542 (arr!724 (Array (_ BitVec 32) ValueCell!380)) (size!825 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1541)

(declare-fun mapDefault!1267 () ValueCell!380)

(assert (=> b!27384 (= condMapEmpty!1267 (= (arr!724 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!380)) mapDefault!1267)))))

(declare-fun b!27385 () Bool)

(declare-fun res!16214 () Bool)

(declare-fun e!17834 () Bool)

(assert (=> b!27385 (=> (not res!16214) (not e!17834))))

(declare-datatypes ((array!1543 0))(
  ( (array!1544 (arr!725 (Array (_ BitVec 32) (_ BitVec 64))) (size!826 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1543)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27385 (= res!16214 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1267 () Bool)

(assert (=> mapIsEmpty!1267 mapRes!1267))

(declare-fun b!27386 () Bool)

(declare-fun tp_is_empty!1159 () Bool)

(assert (=> b!27386 (= e!17832 tp_is_empty!1159)))

(declare-fun b!27387 () Bool)

(declare-fun res!16216 () Bool)

(assert (=> b!27387 (=> (not res!16216) (not e!17834))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27387 (= res!16216 (and (= (size!825 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!826 _keys!1833) (size!825 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27388 () Bool)

(assert (=> b!27388 (= e!17834 false)))

(declare-fun lt!10638 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1543 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27388 (= lt!10638 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27389 () Bool)

(declare-fun e!17836 () Bool)

(assert (=> b!27389 (= e!17836 tp_is_empty!1159)))

(declare-fun b!27390 () Bool)

(declare-fun res!16215 () Bool)

(assert (=> b!27390 (=> (not res!16215) (not e!17834))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1371)

(declare-fun minValue!1443 () V!1371)

(declare-datatypes ((tuple2!1016 0))(
  ( (tuple2!1017 (_1!519 (_ BitVec 64)) (_2!519 V!1371)) )
))
(declare-datatypes ((List!609 0))(
  ( (Nil!606) (Cons!605 (h!1172 tuple2!1016) (t!3296 List!609)) )
))
(declare-datatypes ((ListLongMap!587 0))(
  ( (ListLongMap!588 (toList!309 List!609)) )
))
(declare-fun contains!251 (ListLongMap!587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!139 (array!1543 array!1541 (_ BitVec 32) (_ BitVec 32) V!1371 V!1371 (_ BitVec 32) Int) ListLongMap!587)

(assert (=> b!27390 (= res!16215 (not (contains!251 (getCurrentListMap!139 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27391 () Bool)

(declare-fun res!16217 () Bool)

(assert (=> b!27391 (=> (not res!16217) (not e!17834))))

(declare-datatypes ((List!610 0))(
  ( (Nil!607) (Cons!606 (h!1173 (_ BitVec 64)) (t!3297 List!610)) )
))
(declare-fun arrayNoDuplicates!0 (array!1543 (_ BitVec 32) List!610) Bool)

(assert (=> b!27391 (= res!16217 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!607))))

(declare-fun res!16212 () Bool)

(assert (=> start!3896 (=> (not res!16212) (not e!17834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3896 (= res!16212 (validMask!0 mask!2294))))

(assert (=> start!3896 e!17834))

(assert (=> start!3896 true))

(assert (=> start!3896 tp!3835))

(declare-fun array_inv!505 (array!1541) Bool)

(assert (=> start!3896 (and (array_inv!505 _values!1501) e!17833)))

(declare-fun array_inv!506 (array!1543) Bool)

(assert (=> start!3896 (array_inv!506 _keys!1833)))

(assert (=> start!3896 tp_is_empty!1159))

(declare-fun b!27392 () Bool)

(declare-fun res!16213 () Bool)

(assert (=> b!27392 (=> (not res!16213) (not e!17834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27392 (= res!16213 (validKeyInArray!0 k0!1304))))

(declare-fun b!27393 () Bool)

(declare-fun res!16211 () Bool)

(assert (=> b!27393 (=> (not res!16211) (not e!17834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1543 (_ BitVec 32)) Bool)

(assert (=> b!27393 (= res!16211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1267 () Bool)

(declare-fun tp!3834 () Bool)

(assert (=> mapNonEmpty!1267 (= mapRes!1267 (and tp!3834 e!17836))))

(declare-fun mapKey!1267 () (_ BitVec 32))

(declare-fun mapValue!1267 () ValueCell!380)

(declare-fun mapRest!1267 () (Array (_ BitVec 32) ValueCell!380))

(assert (=> mapNonEmpty!1267 (= (arr!724 _values!1501) (store mapRest!1267 mapKey!1267 mapValue!1267))))

(assert (= (and start!3896 res!16212) b!27387))

(assert (= (and b!27387 res!16216) b!27393))

(assert (= (and b!27393 res!16211) b!27391))

(assert (= (and b!27391 res!16217) b!27392))

(assert (= (and b!27392 res!16213) b!27390))

(assert (= (and b!27390 res!16215) b!27385))

(assert (= (and b!27385 res!16214) b!27388))

(assert (= (and b!27384 condMapEmpty!1267) mapIsEmpty!1267))

(assert (= (and b!27384 (not condMapEmpty!1267)) mapNonEmpty!1267))

(get-info :version)

(assert (= (and mapNonEmpty!1267 ((_ is ValueCellFull!380) mapValue!1267)) b!27389))

(assert (= (and b!27384 ((_ is ValueCellFull!380) mapDefault!1267)) b!27386))

(assert (= start!3896 b!27384))

(declare-fun m!21755 () Bool)

(assert (=> b!27392 m!21755))

(declare-fun m!21757 () Bool)

(assert (=> b!27385 m!21757))

(declare-fun m!21759 () Bool)

(assert (=> start!3896 m!21759))

(declare-fun m!21761 () Bool)

(assert (=> start!3896 m!21761))

(declare-fun m!21763 () Bool)

(assert (=> start!3896 m!21763))

(declare-fun m!21765 () Bool)

(assert (=> b!27390 m!21765))

(assert (=> b!27390 m!21765))

(declare-fun m!21767 () Bool)

(assert (=> b!27390 m!21767))

(declare-fun m!21769 () Bool)

(assert (=> b!27388 m!21769))

(declare-fun m!21771 () Bool)

(assert (=> b!27393 m!21771))

(declare-fun m!21773 () Bool)

(assert (=> b!27391 m!21773))

(declare-fun m!21775 () Bool)

(assert (=> mapNonEmpty!1267 m!21775))

(check-sat (not start!3896) tp_is_empty!1159 (not b!27385) (not b_next!805) b_and!1605 (not mapNonEmpty!1267) (not b!27392) (not b!27391) (not b!27388) (not b!27393) (not b!27390))
(check-sat b_and!1605 (not b_next!805))
