; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83712 () Bool)

(assert start!83712)

(declare-fun b!977518 () Bool)

(declare-fun res!654220 () Bool)

(declare-fun e!551090 () Bool)

(assert (=> b!977518 (=> (not res!654220) (not e!551090))))

(declare-datatypes ((array!61061 0))(
  ( (array!61062 (arr!29388 (Array (_ BitVec 32) (_ BitVec 64))) (size!29867 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61061)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61061 (_ BitVec 32)) Bool)

(assert (=> b!977518 (= res!654220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977519 () Bool)

(declare-fun res!654219 () Bool)

(assert (=> b!977519 (=> (not res!654219) (not e!551090))))

(declare-datatypes ((V!35003 0))(
  ( (V!35004 (val!11308 Int)) )
))
(declare-datatypes ((ValueCell!10776 0))(
  ( (ValueCellFull!10776 (v!13870 V!35003)) (EmptyCell!10776) )
))
(declare-datatypes ((array!61063 0))(
  ( (array!61064 (arr!29389 (Array (_ BitVec 32) ValueCell!10776)) (size!29868 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61063)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977519 (= res!654219 (and (= (size!29868 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29867 _keys!1544) (size!29868 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977520 () Bool)

(declare-fun e!551087 () Bool)

(declare-fun tp_is_empty!22515 () Bool)

(assert (=> b!977520 (= e!551087 tp_is_empty!22515)))

(declare-fun mapNonEmpty!35801 () Bool)

(declare-fun mapRes!35801 () Bool)

(declare-fun tp!68053 () Bool)

(assert (=> mapNonEmpty!35801 (= mapRes!35801 (and tp!68053 e!551087))))

(declare-fun mapRest!35801 () (Array (_ BitVec 32) ValueCell!10776))

(declare-fun mapValue!35801 () ValueCell!10776)

(declare-fun mapKey!35801 () (_ BitVec 32))

(assert (=> mapNonEmpty!35801 (= (arr!29389 _values!1278) (store mapRest!35801 mapKey!35801 mapValue!35801))))

(declare-fun b!977521 () Bool)

(declare-fun e!551088 () Bool)

(declare-fun e!551091 () Bool)

(assert (=> b!977521 (= e!551088 (and e!551091 mapRes!35801))))

(declare-fun condMapEmpty!35801 () Bool)

(declare-fun mapDefault!35801 () ValueCell!10776)

(assert (=> b!977521 (= condMapEmpty!35801 (= (arr!29389 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10776)) mapDefault!35801)))))

(declare-fun b!977522 () Bool)

(assert (=> b!977522 (= e!551091 tp_is_empty!22515)))

(declare-fun mapIsEmpty!35801 () Bool)

(assert (=> mapIsEmpty!35801 mapRes!35801))

(declare-fun b!977523 () Bool)

(assert (=> b!977523 (= e!551090 false)))

(declare-fun lt!433481 () Bool)

(declare-datatypes ((List!20378 0))(
  ( (Nil!20375) (Cons!20374 (h!21536 (_ BitVec 64)) (t!28893 List!20378)) )
))
(declare-fun arrayNoDuplicates!0 (array!61061 (_ BitVec 32) List!20378) Bool)

(assert (=> b!977523 (= lt!433481 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20375))))

(declare-fun res!654221 () Bool)

(assert (=> start!83712 (=> (not res!654221) (not e!551090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83712 (= res!654221 (validMask!0 mask!1948))))

(assert (=> start!83712 e!551090))

(assert (=> start!83712 true))

(declare-fun array_inv!22721 (array!61063) Bool)

(assert (=> start!83712 (and (array_inv!22721 _values!1278) e!551088)))

(declare-fun array_inv!22722 (array!61061) Bool)

(assert (=> start!83712 (array_inv!22722 _keys!1544)))

(assert (= (and start!83712 res!654221) b!977519))

(assert (= (and b!977519 res!654219) b!977518))

(assert (= (and b!977518 res!654220) b!977523))

(assert (= (and b!977521 condMapEmpty!35801) mapIsEmpty!35801))

(assert (= (and b!977521 (not condMapEmpty!35801)) mapNonEmpty!35801))

(get-info :version)

(assert (= (and mapNonEmpty!35801 ((_ is ValueCellFull!10776) mapValue!35801)) b!977520))

(assert (= (and b!977521 ((_ is ValueCellFull!10776) mapDefault!35801)) b!977522))

(assert (= start!83712 b!977521))

(declare-fun m!904759 () Bool)

(assert (=> b!977518 m!904759))

(declare-fun m!904761 () Bool)

(assert (=> mapNonEmpty!35801 m!904761))

(declare-fun m!904763 () Bool)

(assert (=> b!977523 m!904763))

(declare-fun m!904765 () Bool)

(assert (=> start!83712 m!904765))

(declare-fun m!904767 () Bool)

(assert (=> start!83712 m!904767))

(declare-fun m!904769 () Bool)

(assert (=> start!83712 m!904769))

(check-sat tp_is_empty!22515 (not start!83712) (not mapNonEmpty!35801) (not b!977523) (not b!977518))
(check-sat)
