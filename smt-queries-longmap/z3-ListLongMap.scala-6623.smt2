; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83692 () Bool)

(assert start!83692)

(declare-fun b!977261 () Bool)

(declare-fun res!654101 () Bool)

(declare-fun e!550925 () Bool)

(assert (=> b!977261 (=> (not res!654101) (not e!550925))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35001 0))(
  ( (V!35002 (val!11307 Int)) )
))
(declare-datatypes ((ValueCell!10775 0))(
  ( (ValueCellFull!10775 (v!13868 V!35001)) (EmptyCell!10775) )
))
(declare-datatypes ((array!60992 0))(
  ( (array!60993 (arr!29354 (Array (_ BitVec 32) ValueCell!10775)) (size!29835 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60992)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!60994 0))(
  ( (array!60995 (arr!29355 (Array (_ BitVec 32) (_ BitVec 64))) (size!29836 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60994)

(assert (=> b!977261 (= res!654101 (and (= (size!29835 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29836 _keys!1544) (size!29835 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977262 () Bool)

(declare-fun res!654102 () Bool)

(assert (=> b!977262 (=> (not res!654102) (not e!550925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60994 (_ BitVec 32)) Bool)

(assert (=> b!977262 (= res!654102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!654100 () Bool)

(assert (=> start!83692 (=> (not res!654100) (not e!550925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83692 (= res!654100 (validMask!0 mask!1948))))

(assert (=> start!83692 e!550925))

(assert (=> start!83692 true))

(declare-fun e!550927 () Bool)

(declare-fun array_inv!22731 (array!60992) Bool)

(assert (=> start!83692 (and (array_inv!22731 _values!1278) e!550927)))

(declare-fun array_inv!22732 (array!60994) Bool)

(assert (=> start!83692 (array_inv!22732 _keys!1544)))

(declare-fun mapNonEmpty!35798 () Bool)

(declare-fun mapRes!35798 () Bool)

(declare-fun tp!68051 () Bool)

(declare-fun e!550926 () Bool)

(assert (=> mapNonEmpty!35798 (= mapRes!35798 (and tp!68051 e!550926))))

(declare-fun mapKey!35798 () (_ BitVec 32))

(declare-fun mapValue!35798 () ValueCell!10775)

(declare-fun mapRest!35798 () (Array (_ BitVec 32) ValueCell!10775))

(assert (=> mapNonEmpty!35798 (= (arr!29354 _values!1278) (store mapRest!35798 mapKey!35798 mapValue!35798))))

(declare-fun b!977263 () Bool)

(declare-fun tp_is_empty!22513 () Bool)

(assert (=> b!977263 (= e!550926 tp_is_empty!22513)))

(declare-fun b!977264 () Bool)

(declare-fun e!550928 () Bool)

(assert (=> b!977264 (= e!550927 (and e!550928 mapRes!35798))))

(declare-fun condMapEmpty!35798 () Bool)

(declare-fun mapDefault!35798 () ValueCell!10775)

(assert (=> b!977264 (= condMapEmpty!35798 (= (arr!29354 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10775)) mapDefault!35798)))))

(declare-fun mapIsEmpty!35798 () Bool)

(assert (=> mapIsEmpty!35798 mapRes!35798))

(declare-fun b!977265 () Bool)

(assert (=> b!977265 (= e!550928 tp_is_empty!22513)))

(declare-fun b!977266 () Bool)

(assert (=> b!977266 (= e!550925 false)))

(declare-fun lt!433242 () Bool)

(declare-datatypes ((List!20390 0))(
  ( (Nil!20387) (Cons!20386 (h!21548 (_ BitVec 64)) (t!28896 List!20390)) )
))
(declare-fun arrayNoDuplicates!0 (array!60994 (_ BitVec 32) List!20390) Bool)

(assert (=> b!977266 (= lt!433242 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20387))))

(assert (= (and start!83692 res!654100) b!977261))

(assert (= (and b!977261 res!654101) b!977262))

(assert (= (and b!977262 res!654102) b!977266))

(assert (= (and b!977264 condMapEmpty!35798) mapIsEmpty!35798))

(assert (= (and b!977264 (not condMapEmpty!35798)) mapNonEmpty!35798))

(get-info :version)

(assert (= (and mapNonEmpty!35798 ((_ is ValueCellFull!10775) mapValue!35798)) b!977263))

(assert (= (and b!977264 ((_ is ValueCellFull!10775) mapDefault!35798)) b!977265))

(assert (= start!83692 b!977264))

(declare-fun m!903989 () Bool)

(assert (=> b!977262 m!903989))

(declare-fun m!903991 () Bool)

(assert (=> start!83692 m!903991))

(declare-fun m!903993 () Bool)

(assert (=> start!83692 m!903993))

(declare-fun m!903995 () Bool)

(assert (=> start!83692 m!903995))

(declare-fun m!903997 () Bool)

(assert (=> mapNonEmpty!35798 m!903997))

(declare-fun m!903999 () Bool)

(assert (=> b!977266 m!903999))

(check-sat (not mapNonEmpty!35798) tp_is_empty!22513 (not start!83692) (not b!977266) (not b!977262))
(check-sat)
