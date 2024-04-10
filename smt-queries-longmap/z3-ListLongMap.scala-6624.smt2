; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83718 () Bool)

(assert start!83718)

(declare-fun b!977572 () Bool)

(declare-fun res!654246 () Bool)

(declare-fun e!551134 () Bool)

(assert (=> b!977572 (=> (not res!654246) (not e!551134))))

(declare-datatypes ((array!61069 0))(
  ( (array!61070 (arr!29392 (Array (_ BitVec 32) (_ BitVec 64))) (size!29871 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61069)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61069 (_ BitVec 32)) Bool)

(assert (=> b!977572 (= res!654246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977573 () Bool)

(declare-fun e!551132 () Bool)

(declare-fun tp_is_empty!22521 () Bool)

(assert (=> b!977573 (= e!551132 tp_is_empty!22521)))

(declare-fun res!654247 () Bool)

(assert (=> start!83718 (=> (not res!654247) (not e!551134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83718 (= res!654247 (validMask!0 mask!1948))))

(assert (=> start!83718 e!551134))

(assert (=> start!83718 true))

(declare-datatypes ((V!35011 0))(
  ( (V!35012 (val!11311 Int)) )
))
(declare-datatypes ((ValueCell!10779 0))(
  ( (ValueCellFull!10779 (v!13873 V!35011)) (EmptyCell!10779) )
))
(declare-datatypes ((array!61071 0))(
  ( (array!61072 (arr!29393 (Array (_ BitVec 32) ValueCell!10779)) (size!29872 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61071)

(declare-fun e!551135 () Bool)

(declare-fun array_inv!22723 (array!61071) Bool)

(assert (=> start!83718 (and (array_inv!22723 _values!1278) e!551135)))

(declare-fun array_inv!22724 (array!61069) Bool)

(assert (=> start!83718 (array_inv!22724 _keys!1544)))

(declare-fun b!977574 () Bool)

(declare-fun e!551136 () Bool)

(assert (=> b!977574 (= e!551136 tp_is_empty!22521)))

(declare-fun b!977575 () Bool)

(declare-fun mapRes!35810 () Bool)

(assert (=> b!977575 (= e!551135 (and e!551136 mapRes!35810))))

(declare-fun condMapEmpty!35810 () Bool)

(declare-fun mapDefault!35810 () ValueCell!10779)

(assert (=> b!977575 (= condMapEmpty!35810 (= (arr!29393 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10779)) mapDefault!35810)))))

(declare-fun mapIsEmpty!35810 () Bool)

(assert (=> mapIsEmpty!35810 mapRes!35810))

(declare-fun b!977576 () Bool)

(declare-fun res!654248 () Bool)

(assert (=> b!977576 (=> (not res!654248) (not e!551134))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977576 (= res!654248 (and (= (size!29872 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29871 _keys!1544) (size!29872 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35810 () Bool)

(declare-fun tp!68062 () Bool)

(assert (=> mapNonEmpty!35810 (= mapRes!35810 (and tp!68062 e!551132))))

(declare-fun mapRest!35810 () (Array (_ BitVec 32) ValueCell!10779))

(declare-fun mapValue!35810 () ValueCell!10779)

(declare-fun mapKey!35810 () (_ BitVec 32))

(assert (=> mapNonEmpty!35810 (= (arr!29393 _values!1278) (store mapRest!35810 mapKey!35810 mapValue!35810))))

(declare-fun b!977577 () Bool)

(assert (=> b!977577 (= e!551134 false)))

(declare-fun lt!433490 () Bool)

(declare-datatypes ((List!20379 0))(
  ( (Nil!20376) (Cons!20375 (h!21537 (_ BitVec 64)) (t!28894 List!20379)) )
))
(declare-fun arrayNoDuplicates!0 (array!61069 (_ BitVec 32) List!20379) Bool)

(assert (=> b!977577 (= lt!433490 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20376))))

(assert (= (and start!83718 res!654247) b!977576))

(assert (= (and b!977576 res!654248) b!977572))

(assert (= (and b!977572 res!654246) b!977577))

(assert (= (and b!977575 condMapEmpty!35810) mapIsEmpty!35810))

(assert (= (and b!977575 (not condMapEmpty!35810)) mapNonEmpty!35810))

(get-info :version)

(assert (= (and mapNonEmpty!35810 ((_ is ValueCellFull!10779) mapValue!35810)) b!977573))

(assert (= (and b!977575 ((_ is ValueCellFull!10779) mapDefault!35810)) b!977574))

(assert (= start!83718 b!977575))

(declare-fun m!904795 () Bool)

(assert (=> b!977572 m!904795))

(declare-fun m!904797 () Bool)

(assert (=> start!83718 m!904797))

(declare-fun m!904799 () Bool)

(assert (=> start!83718 m!904799))

(declare-fun m!904801 () Bool)

(assert (=> start!83718 m!904801))

(declare-fun m!904803 () Bool)

(assert (=> mapNonEmpty!35810 m!904803))

(declare-fun m!904805 () Bool)

(assert (=> b!977577 m!904805))

(check-sat (not b!977577) (not start!83718) (not mapNonEmpty!35810) tp_is_empty!22521 (not b!977572))
(check-sat)
