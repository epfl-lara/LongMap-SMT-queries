; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83878 () Bool)

(assert start!83878)

(declare-fun b!978403 () Bool)

(declare-fun res!654556 () Bool)

(declare-fun e!551654 () Bool)

(assert (=> b!978403 (=> (not res!654556) (not e!551654))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35001 0))(
  ( (V!35002 (val!11307 Int)) )
))
(declare-datatypes ((ValueCell!10775 0))(
  ( (ValueCellFull!10775 (v!13866 V!35001)) (EmptyCell!10775) )
))
(declare-datatypes ((array!61088 0))(
  ( (array!61089 (arr!29397 (Array (_ BitVec 32) ValueCell!10775)) (size!29877 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61088)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61090 0))(
  ( (array!61091 (arr!29398 (Array (_ BitVec 32) (_ BitVec 64))) (size!29878 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61090)

(assert (=> b!978403 (= res!654556 (and (= (size!29877 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29878 _keys!1544) (size!29877 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!654554 () Bool)

(assert (=> start!83878 (=> (not res!654554) (not e!551654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83878 (= res!654554 (validMask!0 mask!1948))))

(assert (=> start!83878 e!551654))

(assert (=> start!83878 true))

(declare-fun e!551658 () Bool)

(declare-fun array_inv!22775 (array!61088) Bool)

(assert (=> start!83878 (and (array_inv!22775 _values!1278) e!551658)))

(declare-fun array_inv!22776 (array!61090) Bool)

(assert (=> start!83878 (array_inv!22776 _keys!1544)))

(declare-fun b!978404 () Bool)

(declare-fun res!654555 () Bool)

(assert (=> b!978404 (=> (not res!654555) (not e!551654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61090 (_ BitVec 32)) Bool)

(assert (=> b!978404 (= res!654555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978405 () Bool)

(declare-fun e!551655 () Bool)

(declare-fun tp_is_empty!22513 () Bool)

(assert (=> b!978405 (= e!551655 tp_is_empty!22513)))

(declare-fun b!978406 () Bool)

(assert (=> b!978406 (= e!551654 false)))

(declare-fun lt!433839 () Bool)

(declare-datatypes ((List!20373 0))(
  ( (Nil!20370) (Cons!20369 (h!21537 (_ BitVec 64)) (t!28880 List!20373)) )
))
(declare-fun arrayNoDuplicates!0 (array!61090 (_ BitVec 32) List!20373) Bool)

(assert (=> b!978406 (= lt!433839 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20370))))

(declare-fun mapNonEmpty!35798 () Bool)

(declare-fun mapRes!35798 () Bool)

(declare-fun tp!68051 () Bool)

(declare-fun e!551657 () Bool)

(assert (=> mapNonEmpty!35798 (= mapRes!35798 (and tp!68051 e!551657))))

(declare-fun mapValue!35798 () ValueCell!10775)

(declare-fun mapRest!35798 () (Array (_ BitVec 32) ValueCell!10775))

(declare-fun mapKey!35798 () (_ BitVec 32))

(assert (=> mapNonEmpty!35798 (= (arr!29397 _values!1278) (store mapRest!35798 mapKey!35798 mapValue!35798))))

(declare-fun mapIsEmpty!35798 () Bool)

(assert (=> mapIsEmpty!35798 mapRes!35798))

(declare-fun b!978407 () Bool)

(assert (=> b!978407 (= e!551658 (and e!551655 mapRes!35798))))

(declare-fun condMapEmpty!35798 () Bool)

(declare-fun mapDefault!35798 () ValueCell!10775)

(assert (=> b!978407 (= condMapEmpty!35798 (= (arr!29397 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10775)) mapDefault!35798)))))

(declare-fun b!978408 () Bool)

(assert (=> b!978408 (= e!551657 tp_is_empty!22513)))

(assert (= (and start!83878 res!654554) b!978403))

(assert (= (and b!978403 res!654556) b!978404))

(assert (= (and b!978404 res!654555) b!978406))

(assert (= (and b!978407 condMapEmpty!35798) mapIsEmpty!35798))

(assert (= (and b!978407 (not condMapEmpty!35798)) mapNonEmpty!35798))

(get-info :version)

(assert (= (and mapNonEmpty!35798 ((_ is ValueCellFull!10775) mapValue!35798)) b!978408))

(assert (= (and b!978407 ((_ is ValueCellFull!10775) mapDefault!35798)) b!978405))

(assert (= start!83878 b!978407))

(declare-fun m!906041 () Bool)

(assert (=> start!83878 m!906041))

(declare-fun m!906043 () Bool)

(assert (=> start!83878 m!906043))

(declare-fun m!906045 () Bool)

(assert (=> start!83878 m!906045))

(declare-fun m!906047 () Bool)

(assert (=> b!978404 m!906047))

(declare-fun m!906049 () Bool)

(assert (=> b!978406 m!906049))

(declare-fun m!906051 () Bool)

(assert (=> mapNonEmpty!35798 m!906051))

(check-sat (not b!978404) tp_is_empty!22513 (not mapNonEmpty!35798) (not b!978406) (not start!83878))
(check-sat)
