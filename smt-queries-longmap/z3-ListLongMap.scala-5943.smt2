; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77642 () Bool)

(assert start!77642)

(declare-fun res!609564 () Bool)

(declare-fun e!506324 () Bool)

(assert (=> start!77642 (=> (not res!609564) (not e!506324))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77642 (= res!609564 (validMask!0 mask!1756))))

(assert (=> start!77642 e!506324))

(assert (=> start!77642 true))

(declare-datatypes ((V!29615 0))(
  ( (V!29616 (val!9294 Int)) )
))
(declare-datatypes ((ValueCell!8762 0))(
  ( (ValueCellFull!8762 (v!11796 V!29615)) (EmptyCell!8762) )
))
(declare-datatypes ((array!53071 0))(
  ( (array!53072 (arr!25491 (Array (_ BitVec 32) ValueCell!8762)) (size!25951 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53071)

(declare-fun e!506325 () Bool)

(declare-fun array_inv!20044 (array!53071) Bool)

(assert (=> start!77642 (and (array_inv!20044 _values!1152) e!506325)))

(declare-datatypes ((array!53073 0))(
  ( (array!53074 (arr!25492 (Array (_ BitVec 32) (_ BitVec 64))) (size!25952 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53073)

(declare-fun array_inv!20045 (array!53073) Bool)

(assert (=> start!77642 (array_inv!20045 _keys!1386)))

(declare-fun b!903751 () Bool)

(assert (=> b!903751 (= e!506324 false)))

(declare-fun lt!408286 () Bool)

(declare-datatypes ((List!17855 0))(
  ( (Nil!17852) (Cons!17851 (h!19003 (_ BitVec 64)) (t!25230 List!17855)) )
))
(declare-fun arrayNoDuplicates!0 (array!53073 (_ BitVec 32) List!17855) Bool)

(assert (=> b!903751 (= lt!408286 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17852))))

(declare-fun b!903752 () Bool)

(declare-fun e!506322 () Bool)

(declare-fun tp_is_empty!18487 () Bool)

(assert (=> b!903752 (= e!506322 tp_is_empty!18487)))

(declare-fun b!903753 () Bool)

(declare-fun mapRes!29440 () Bool)

(assert (=> b!903753 (= e!506325 (and e!506322 mapRes!29440))))

(declare-fun condMapEmpty!29440 () Bool)

(declare-fun mapDefault!29440 () ValueCell!8762)

(assert (=> b!903753 (= condMapEmpty!29440 (= (arr!25491 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8762)) mapDefault!29440)))))

(declare-fun b!903754 () Bool)

(declare-fun res!609563 () Bool)

(assert (=> b!903754 (=> (not res!609563) (not e!506324))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903754 (= res!609563 (and (= (size!25951 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25952 _keys!1386) (size!25951 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903755 () Bool)

(declare-fun res!609565 () Bool)

(assert (=> b!903755 (=> (not res!609565) (not e!506324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53073 (_ BitVec 32)) Bool)

(assert (=> b!903755 (= res!609565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29440 () Bool)

(assert (=> mapIsEmpty!29440 mapRes!29440))

(declare-fun mapNonEmpty!29440 () Bool)

(declare-fun tp!56500 () Bool)

(declare-fun e!506321 () Bool)

(assert (=> mapNonEmpty!29440 (= mapRes!29440 (and tp!56500 e!506321))))

(declare-fun mapKey!29440 () (_ BitVec 32))

(declare-fun mapValue!29440 () ValueCell!8762)

(declare-fun mapRest!29440 () (Array (_ BitVec 32) ValueCell!8762))

(assert (=> mapNonEmpty!29440 (= (arr!25491 _values!1152) (store mapRest!29440 mapKey!29440 mapValue!29440))))

(declare-fun b!903756 () Bool)

(assert (=> b!903756 (= e!506321 tp_is_empty!18487)))

(assert (= (and start!77642 res!609564) b!903754))

(assert (= (and b!903754 res!609563) b!903755))

(assert (= (and b!903755 res!609565) b!903751))

(assert (= (and b!903753 condMapEmpty!29440) mapIsEmpty!29440))

(assert (= (and b!903753 (not condMapEmpty!29440)) mapNonEmpty!29440))

(get-info :version)

(assert (= (and mapNonEmpty!29440 ((_ is ValueCellFull!8762) mapValue!29440)) b!903756))

(assert (= (and b!903753 ((_ is ValueCellFull!8762) mapDefault!29440)) b!903752))

(assert (= start!77642 b!903753))

(declare-fun m!840005 () Bool)

(assert (=> start!77642 m!840005))

(declare-fun m!840007 () Bool)

(assert (=> start!77642 m!840007))

(declare-fun m!840009 () Bool)

(assert (=> start!77642 m!840009))

(declare-fun m!840011 () Bool)

(assert (=> b!903751 m!840011))

(declare-fun m!840013 () Bool)

(assert (=> b!903755 m!840013))

(declare-fun m!840015 () Bool)

(assert (=> mapNonEmpty!29440 m!840015))

(check-sat (not b!903751) tp_is_empty!18487 (not start!77642) (not b!903755) (not mapNonEmpty!29440))
(check-sat)
