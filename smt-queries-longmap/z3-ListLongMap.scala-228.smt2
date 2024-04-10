; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4052 () Bool)

(assert start!4052)

(declare-fun b_free!957 () Bool)

(declare-fun b_next!957 () Bool)

(assert (=> start!4052 (= b_free!957 (not b_next!957))))

(declare-fun tp!4290 () Bool)

(declare-fun b_and!1767 () Bool)

(assert (=> start!4052 (= tp!4290 b_and!1767)))

(declare-fun b!29753 () Bool)

(declare-fun e!19187 () Bool)

(declare-fun e!19190 () Bool)

(declare-fun mapRes!1495 () Bool)

(assert (=> b!29753 (= e!19187 (and e!19190 mapRes!1495))))

(declare-fun condMapEmpty!1495 () Bool)

(declare-datatypes ((V!1573 0))(
  ( (V!1574 (val!682 Int)) )
))
(declare-datatypes ((ValueCell!456 0))(
  ( (ValueCellFull!456 (v!1771 V!1573)) (EmptyCell!456) )
))
(declare-datatypes ((array!1853 0))(
  ( (array!1854 (arr!880 (Array (_ BitVec 32) ValueCell!456)) (size!981 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1853)

(declare-fun mapDefault!1495 () ValueCell!456)

(assert (=> b!29753 (= condMapEmpty!1495 (= (arr!880 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!456)) mapDefault!1495)))))

(declare-fun b!29754 () Bool)

(declare-fun tp_is_empty!1311 () Bool)

(assert (=> b!29754 (= e!19190 tp_is_empty!1311)))

(declare-fun b!29755 () Bool)

(declare-fun e!19188 () Bool)

(assert (=> b!29755 (= e!19188 tp_is_empty!1311)))

(declare-fun mapIsEmpty!1495 () Bool)

(assert (=> mapIsEmpty!1495 mapRes!1495))

(declare-fun b!29756 () Bool)

(declare-fun res!17868 () Bool)

(declare-fun e!19189 () Bool)

(assert (=> b!29756 (=> (not res!17868) (not e!19189))))

(declare-datatypes ((array!1855 0))(
  ( (array!1856 (arr!881 (Array (_ BitVec 32) (_ BitVec 64))) (size!982 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1855)

(declare-datatypes ((List!728 0))(
  ( (Nil!725) (Cons!724 (h!1291 (_ BitVec 64)) (t!3421 List!728)) )
))
(declare-fun arrayNoDuplicates!0 (array!1855 (_ BitVec 32) List!728) Bool)

(assert (=> b!29756 (= res!17868 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!725))))

(declare-fun b!29757 () Bool)

(declare-fun res!17867 () Bool)

(assert (=> b!29757 (=> (not res!17867) (not e!19189))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29757 (= res!17867 (and (= (size!981 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!982 _keys!1833) (size!981 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29758 () Bool)

(declare-fun res!17864 () Bool)

(assert (=> b!29758 (=> (not res!17864) (not e!19189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1855 (_ BitVec 32)) Bool)

(assert (=> b!29758 (= res!17864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1495 () Bool)

(declare-fun tp!4291 () Bool)

(assert (=> mapNonEmpty!1495 (= mapRes!1495 (and tp!4291 e!19188))))

(declare-fun mapKey!1495 () (_ BitVec 32))

(declare-fun mapRest!1495 () (Array (_ BitVec 32) ValueCell!456))

(declare-fun mapValue!1495 () ValueCell!456)

(assert (=> mapNonEmpty!1495 (= (arr!880 _values!1501) (store mapRest!1495 mapKey!1495 mapValue!1495))))

(declare-fun res!17865 () Bool)

(assert (=> start!4052 (=> (not res!17865) (not e!19189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4052 (= res!17865 (validMask!0 mask!2294))))

(assert (=> start!4052 e!19189))

(assert (=> start!4052 true))

(assert (=> start!4052 tp!4290))

(declare-fun array_inv!613 (array!1853) Bool)

(assert (=> start!4052 (and (array_inv!613 _values!1501) e!19187)))

(declare-fun array_inv!614 (array!1855) Bool)

(assert (=> start!4052 (array_inv!614 _keys!1833)))

(assert (=> start!4052 tp_is_empty!1311))

(declare-fun b!29759 () Bool)

(assert (=> b!29759 (= e!19189 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11351 () Bool)

(declare-fun zeroValue!1443 () V!1573)

(declare-fun minValue!1443 () V!1573)

(declare-datatypes ((tuple2!1130 0))(
  ( (tuple2!1131 (_1!576 (_ BitVec 64)) (_2!576 V!1573)) )
))
(declare-datatypes ((List!729 0))(
  ( (Nil!726) (Cons!725 (h!1292 tuple2!1130) (t!3422 List!729)) )
))
(declare-datatypes ((ListLongMap!707 0))(
  ( (ListLongMap!708 (toList!369 List!729)) )
))
(declare-fun contains!309 (ListLongMap!707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!197 (array!1855 array!1853 (_ BitVec 32) (_ BitVec 32) V!1573 V!1573 (_ BitVec 32) Int) ListLongMap!707)

(assert (=> b!29759 (= lt!11351 (contains!309 (getCurrentListMap!197 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!29760 () Bool)

(declare-fun res!17866 () Bool)

(assert (=> b!29760 (=> (not res!17866) (not e!19189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29760 (= res!17866 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4052 res!17865) b!29757))

(assert (= (and b!29757 res!17867) b!29758))

(assert (= (and b!29758 res!17864) b!29756))

(assert (= (and b!29756 res!17868) b!29760))

(assert (= (and b!29760 res!17866) b!29759))

(assert (= (and b!29753 condMapEmpty!1495) mapIsEmpty!1495))

(assert (= (and b!29753 (not condMapEmpty!1495)) mapNonEmpty!1495))

(get-info :version)

(assert (= (and mapNonEmpty!1495 ((_ is ValueCellFull!456) mapValue!1495)) b!29755))

(assert (= (and b!29753 ((_ is ValueCellFull!456) mapDefault!1495)) b!29754))

(assert (= start!4052 b!29753))

(declare-fun m!23953 () Bool)

(assert (=> b!29756 m!23953))

(declare-fun m!23955 () Bool)

(assert (=> b!29759 m!23955))

(assert (=> b!29759 m!23955))

(declare-fun m!23957 () Bool)

(assert (=> b!29759 m!23957))

(declare-fun m!23959 () Bool)

(assert (=> b!29760 m!23959))

(declare-fun m!23961 () Bool)

(assert (=> start!4052 m!23961))

(declare-fun m!23963 () Bool)

(assert (=> start!4052 m!23963))

(declare-fun m!23965 () Bool)

(assert (=> start!4052 m!23965))

(declare-fun m!23967 () Bool)

(assert (=> mapNonEmpty!1495 m!23967))

(declare-fun m!23969 () Bool)

(assert (=> b!29758 m!23969))

(check-sat (not b!29760) (not b!29759) (not b!29756) (not b!29758) (not mapNonEmpty!1495) (not start!4052) (not b_next!957) b_and!1767 tp_is_empty!1311)
(check-sat b_and!1767 (not b_next!957))
