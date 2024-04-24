; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83902 () Bool)

(assert start!83902)

(declare-fun mapIsEmpty!35834 () Bool)

(declare-fun mapRes!35834 () Bool)

(assert (=> mapIsEmpty!35834 mapRes!35834))

(declare-fun b!978619 () Bool)

(declare-fun e!551834 () Bool)

(declare-fun tp_is_empty!22537 () Bool)

(assert (=> b!978619 (= e!551834 tp_is_empty!22537)))

(declare-fun b!978620 () Bool)

(declare-fun e!551836 () Bool)

(assert (=> b!978620 (= e!551836 tp_is_empty!22537)))

(declare-fun b!978621 () Bool)

(declare-fun res!654664 () Bool)

(declare-fun e!551835 () Bool)

(assert (=> b!978621 (=> (not res!654664) (not e!551835))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35033 0))(
  ( (V!35034 (val!11319 Int)) )
))
(declare-datatypes ((ValueCell!10787 0))(
  ( (ValueCellFull!10787 (v!13878 V!35033)) (EmptyCell!10787) )
))
(declare-datatypes ((array!61128 0))(
  ( (array!61129 (arr!29417 (Array (_ BitVec 32) ValueCell!10787)) (size!29897 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61128)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61130 0))(
  ( (array!61131 (arr!29418 (Array (_ BitVec 32) (_ BitVec 64))) (size!29898 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61130)

(assert (=> b!978621 (= res!654664 (and (= (size!29897 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29898 _keys!1544) (size!29897 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35834 () Bool)

(declare-fun tp!68087 () Bool)

(assert (=> mapNonEmpty!35834 (= mapRes!35834 (and tp!68087 e!551834))))

(declare-fun mapKey!35834 () (_ BitVec 32))

(declare-fun mapValue!35834 () ValueCell!10787)

(declare-fun mapRest!35834 () (Array (_ BitVec 32) ValueCell!10787))

(assert (=> mapNonEmpty!35834 (= (arr!29417 _values!1278) (store mapRest!35834 mapKey!35834 mapValue!35834))))

(declare-fun b!978622 () Bool)

(declare-fun res!654662 () Bool)

(assert (=> b!978622 (=> (not res!654662) (not e!551835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61130 (_ BitVec 32)) Bool)

(assert (=> b!978622 (= res!654662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978623 () Bool)

(assert (=> b!978623 (= e!551835 false)))

(declare-fun lt!433875 () Bool)

(declare-datatypes ((List!20379 0))(
  ( (Nil!20376) (Cons!20375 (h!21543 (_ BitVec 64)) (t!28886 List!20379)) )
))
(declare-fun arrayNoDuplicates!0 (array!61130 (_ BitVec 32) List!20379) Bool)

(assert (=> b!978623 (= lt!433875 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20376))))

(declare-fun b!978624 () Bool)

(declare-fun e!551837 () Bool)

(assert (=> b!978624 (= e!551837 (and e!551836 mapRes!35834))))

(declare-fun condMapEmpty!35834 () Bool)

(declare-fun mapDefault!35834 () ValueCell!10787)

(assert (=> b!978624 (= condMapEmpty!35834 (= (arr!29417 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10787)) mapDefault!35834)))))

(declare-fun res!654663 () Bool)

(assert (=> start!83902 (=> (not res!654663) (not e!551835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83902 (= res!654663 (validMask!0 mask!1948))))

(assert (=> start!83902 e!551835))

(assert (=> start!83902 true))

(declare-fun array_inv!22787 (array!61128) Bool)

(assert (=> start!83902 (and (array_inv!22787 _values!1278) e!551837)))

(declare-fun array_inv!22788 (array!61130) Bool)

(assert (=> start!83902 (array_inv!22788 _keys!1544)))

(assert (= (and start!83902 res!654663) b!978621))

(assert (= (and b!978621 res!654664) b!978622))

(assert (= (and b!978622 res!654662) b!978623))

(assert (= (and b!978624 condMapEmpty!35834) mapIsEmpty!35834))

(assert (= (and b!978624 (not condMapEmpty!35834)) mapNonEmpty!35834))

(get-info :version)

(assert (= (and mapNonEmpty!35834 ((_ is ValueCellFull!10787) mapValue!35834)) b!978619))

(assert (= (and b!978624 ((_ is ValueCellFull!10787) mapDefault!35834)) b!978620))

(assert (= start!83902 b!978624))

(declare-fun m!906185 () Bool)

(assert (=> mapNonEmpty!35834 m!906185))

(declare-fun m!906187 () Bool)

(assert (=> b!978622 m!906187))

(declare-fun m!906189 () Bool)

(assert (=> b!978623 m!906189))

(declare-fun m!906191 () Bool)

(assert (=> start!83902 m!906191))

(declare-fun m!906193 () Bool)

(assert (=> start!83902 m!906193))

(declare-fun m!906195 () Bool)

(assert (=> start!83902 m!906195))

(check-sat (not b!978623) (not b!978622) tp_is_empty!22537 (not start!83902) (not mapNonEmpty!35834))
(check-sat)
