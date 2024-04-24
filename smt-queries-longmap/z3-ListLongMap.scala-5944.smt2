; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77648 () Bool)

(assert start!77648)

(declare-fun res!609590 () Bool)

(declare-fun e!506366 () Bool)

(assert (=> start!77648 (=> (not res!609590) (not e!506366))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77648 (= res!609590 (validMask!0 mask!1756))))

(assert (=> start!77648 e!506366))

(assert (=> start!77648 true))

(declare-datatypes ((V!29623 0))(
  ( (V!29624 (val!9297 Int)) )
))
(declare-datatypes ((ValueCell!8765 0))(
  ( (ValueCellFull!8765 (v!11799 V!29623)) (EmptyCell!8765) )
))
(declare-datatypes ((array!53081 0))(
  ( (array!53082 (arr!25496 (Array (_ BitVec 32) ValueCell!8765)) (size!25956 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53081)

(declare-fun e!506370 () Bool)

(declare-fun array_inv!20048 (array!53081) Bool)

(assert (=> start!77648 (and (array_inv!20048 _values!1152) e!506370)))

(declare-datatypes ((array!53083 0))(
  ( (array!53084 (arr!25497 (Array (_ BitVec 32) (_ BitVec 64))) (size!25957 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53083)

(declare-fun array_inv!20049 (array!53083) Bool)

(assert (=> start!77648 (array_inv!20049 _keys!1386)))

(declare-fun b!903805 () Bool)

(declare-fun e!506369 () Bool)

(declare-fun tp_is_empty!18493 () Bool)

(assert (=> b!903805 (= e!506369 tp_is_empty!18493)))

(declare-fun mapIsEmpty!29449 () Bool)

(declare-fun mapRes!29449 () Bool)

(assert (=> mapIsEmpty!29449 mapRes!29449))

(declare-fun b!903806 () Bool)

(declare-fun e!506367 () Bool)

(assert (=> b!903806 (= e!506367 tp_is_empty!18493)))

(declare-fun b!903807 () Bool)

(assert (=> b!903807 (= e!506366 false)))

(declare-fun lt!408295 () Bool)

(declare-datatypes ((List!17856 0))(
  ( (Nil!17853) (Cons!17852 (h!19004 (_ BitVec 64)) (t!25231 List!17856)) )
))
(declare-fun arrayNoDuplicates!0 (array!53083 (_ BitVec 32) List!17856) Bool)

(assert (=> b!903807 (= lt!408295 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17853))))

(declare-fun b!903808 () Bool)

(declare-fun res!609592 () Bool)

(assert (=> b!903808 (=> (not res!609592) (not e!506366))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903808 (= res!609592 (and (= (size!25956 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25957 _keys!1386) (size!25956 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903809 () Bool)

(declare-fun res!609591 () Bool)

(assert (=> b!903809 (=> (not res!609591) (not e!506366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53083 (_ BitVec 32)) Bool)

(assert (=> b!903809 (= res!609591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29449 () Bool)

(declare-fun tp!56509 () Bool)

(assert (=> mapNonEmpty!29449 (= mapRes!29449 (and tp!56509 e!506367))))

(declare-fun mapValue!29449 () ValueCell!8765)

(declare-fun mapRest!29449 () (Array (_ BitVec 32) ValueCell!8765))

(declare-fun mapKey!29449 () (_ BitVec 32))

(assert (=> mapNonEmpty!29449 (= (arr!25496 _values!1152) (store mapRest!29449 mapKey!29449 mapValue!29449))))

(declare-fun b!903810 () Bool)

(assert (=> b!903810 (= e!506370 (and e!506369 mapRes!29449))))

(declare-fun condMapEmpty!29449 () Bool)

(declare-fun mapDefault!29449 () ValueCell!8765)

(assert (=> b!903810 (= condMapEmpty!29449 (= (arr!25496 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8765)) mapDefault!29449)))))

(assert (= (and start!77648 res!609590) b!903808))

(assert (= (and b!903808 res!609592) b!903809))

(assert (= (and b!903809 res!609591) b!903807))

(assert (= (and b!903810 condMapEmpty!29449) mapIsEmpty!29449))

(assert (= (and b!903810 (not condMapEmpty!29449)) mapNonEmpty!29449))

(get-info :version)

(assert (= (and mapNonEmpty!29449 ((_ is ValueCellFull!8765) mapValue!29449)) b!903806))

(assert (= (and b!903810 ((_ is ValueCellFull!8765) mapDefault!29449)) b!903805))

(assert (= start!77648 b!903810))

(declare-fun m!840041 () Bool)

(assert (=> start!77648 m!840041))

(declare-fun m!840043 () Bool)

(assert (=> start!77648 m!840043))

(declare-fun m!840045 () Bool)

(assert (=> start!77648 m!840045))

(declare-fun m!840047 () Bool)

(assert (=> b!903807 m!840047))

(declare-fun m!840049 () Bool)

(assert (=> b!903809 m!840049))

(declare-fun m!840051 () Bool)

(assert (=> mapNonEmpty!29449 m!840051))

(check-sat tp_is_empty!18493 (not b!903809) (not start!77648) (not b!903807) (not mapNonEmpty!29449))
(check-sat)
