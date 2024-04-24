; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83890 () Bool)

(assert start!83890)

(declare-fun mapIsEmpty!35816 () Bool)

(declare-fun mapRes!35816 () Bool)

(assert (=> mapIsEmpty!35816 mapRes!35816))

(declare-fun b!978511 () Bool)

(declare-fun res!654610 () Bool)

(declare-fun e!551746 () Bool)

(assert (=> b!978511 (=> (not res!654610) (not e!551746))))

(declare-datatypes ((array!61108 0))(
  ( (array!61109 (arr!29407 (Array (_ BitVec 32) (_ BitVec 64))) (size!29887 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61108)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61108 (_ BitVec 32)) Bool)

(assert (=> b!978511 (= res!654610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978512 () Bool)

(declare-fun e!551745 () Bool)

(declare-fun e!551747 () Bool)

(assert (=> b!978512 (= e!551745 (and e!551747 mapRes!35816))))

(declare-fun condMapEmpty!35816 () Bool)

(declare-datatypes ((V!35017 0))(
  ( (V!35018 (val!11313 Int)) )
))
(declare-datatypes ((ValueCell!10781 0))(
  ( (ValueCellFull!10781 (v!13872 V!35017)) (EmptyCell!10781) )
))
(declare-datatypes ((array!61110 0))(
  ( (array!61111 (arr!29408 (Array (_ BitVec 32) ValueCell!10781)) (size!29888 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61110)

(declare-fun mapDefault!35816 () ValueCell!10781)

(assert (=> b!978512 (= condMapEmpty!35816 (= (arr!29408 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10781)) mapDefault!35816)))))

(declare-fun b!978513 () Bool)

(declare-fun tp_is_empty!22525 () Bool)

(assert (=> b!978513 (= e!551747 tp_is_empty!22525)))

(declare-fun mapNonEmpty!35816 () Bool)

(declare-fun tp!68069 () Bool)

(declare-fun e!551748 () Bool)

(assert (=> mapNonEmpty!35816 (= mapRes!35816 (and tp!68069 e!551748))))

(declare-fun mapKey!35816 () (_ BitVec 32))

(declare-fun mapValue!35816 () ValueCell!10781)

(declare-fun mapRest!35816 () (Array (_ BitVec 32) ValueCell!10781))

(assert (=> mapNonEmpty!35816 (= (arr!29408 _values!1278) (store mapRest!35816 mapKey!35816 mapValue!35816))))

(declare-fun b!978514 () Bool)

(assert (=> b!978514 (= e!551748 tp_is_empty!22525)))

(declare-fun res!654609 () Bool)

(assert (=> start!83890 (=> (not res!654609) (not e!551746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83890 (= res!654609 (validMask!0 mask!1948))))

(assert (=> start!83890 e!551746))

(assert (=> start!83890 true))

(declare-fun array_inv!22781 (array!61110) Bool)

(assert (=> start!83890 (and (array_inv!22781 _values!1278) e!551745)))

(declare-fun array_inv!22782 (array!61108) Bool)

(assert (=> start!83890 (array_inv!22782 _keys!1544)))

(declare-fun b!978515 () Bool)

(assert (=> b!978515 (= e!551746 false)))

(declare-fun lt!433857 () Bool)

(declare-datatypes ((List!20375 0))(
  ( (Nil!20372) (Cons!20371 (h!21539 (_ BitVec 64)) (t!28882 List!20375)) )
))
(declare-fun arrayNoDuplicates!0 (array!61108 (_ BitVec 32) List!20375) Bool)

(assert (=> b!978515 (= lt!433857 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20372))))

(declare-fun b!978516 () Bool)

(declare-fun res!654608 () Bool)

(assert (=> b!978516 (=> (not res!654608) (not e!551746))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978516 (= res!654608 (and (= (size!29888 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29887 _keys!1544) (size!29888 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83890 res!654609) b!978516))

(assert (= (and b!978516 res!654608) b!978511))

(assert (= (and b!978511 res!654610) b!978515))

(assert (= (and b!978512 condMapEmpty!35816) mapIsEmpty!35816))

(assert (= (and b!978512 (not condMapEmpty!35816)) mapNonEmpty!35816))

(get-info :version)

(assert (= (and mapNonEmpty!35816 ((_ is ValueCellFull!10781) mapValue!35816)) b!978514))

(assert (= (and b!978512 ((_ is ValueCellFull!10781) mapDefault!35816)) b!978513))

(assert (= start!83890 b!978512))

(declare-fun m!906113 () Bool)

(assert (=> b!978511 m!906113))

(declare-fun m!906115 () Bool)

(assert (=> mapNonEmpty!35816 m!906115))

(declare-fun m!906117 () Bool)

(assert (=> start!83890 m!906117))

(declare-fun m!906119 () Bool)

(assert (=> start!83890 m!906119))

(declare-fun m!906121 () Bool)

(assert (=> start!83890 m!906121))

(declare-fun m!906123 () Bool)

(assert (=> b!978515 m!906123))

(check-sat (not mapNonEmpty!35816) (not b!978515) tp_is_empty!22525 (not start!83890) (not b!978511))
(check-sat)
