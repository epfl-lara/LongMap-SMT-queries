; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83704 () Bool)

(assert start!83704)

(declare-fun res!654155 () Bool)

(declare-fun e!551017 () Bool)

(assert (=> start!83704 (=> (not res!654155) (not e!551017))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83704 (= res!654155 (validMask!0 mask!1948))))

(assert (=> start!83704 e!551017))

(assert (=> start!83704 true))

(declare-datatypes ((V!35017 0))(
  ( (V!35018 (val!11313 Int)) )
))
(declare-datatypes ((ValueCell!10781 0))(
  ( (ValueCellFull!10781 (v!13874 V!35017)) (EmptyCell!10781) )
))
(declare-datatypes ((array!61016 0))(
  ( (array!61017 (arr!29366 (Array (_ BitVec 32) ValueCell!10781)) (size!29847 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61016)

(declare-fun e!551018 () Bool)

(declare-fun array_inv!22741 (array!61016) Bool)

(assert (=> start!83704 (and (array_inv!22741 _values!1278) e!551018)))

(declare-datatypes ((array!61018 0))(
  ( (array!61019 (arr!29367 (Array (_ BitVec 32) (_ BitVec 64))) (size!29848 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61018)

(declare-fun array_inv!22742 (array!61018) Bool)

(assert (=> start!83704 (array_inv!22742 _keys!1544)))

(declare-fun b!977369 () Bool)

(declare-fun e!551015 () Bool)

(declare-fun mapRes!35816 () Bool)

(assert (=> b!977369 (= e!551018 (and e!551015 mapRes!35816))))

(declare-fun condMapEmpty!35816 () Bool)

(declare-fun mapDefault!35816 () ValueCell!10781)

(assert (=> b!977369 (= condMapEmpty!35816 (= (arr!29366 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10781)) mapDefault!35816)))))

(declare-fun b!977370 () Bool)

(declare-fun res!654156 () Bool)

(assert (=> b!977370 (=> (not res!654156) (not e!551017))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977370 (= res!654156 (and (= (size!29847 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29848 _keys!1544) (size!29847 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977371 () Bool)

(assert (=> b!977371 (= e!551017 false)))

(declare-fun lt!433260 () Bool)

(declare-datatypes ((List!20396 0))(
  ( (Nil!20393) (Cons!20392 (h!21554 (_ BitVec 64)) (t!28902 List!20396)) )
))
(declare-fun arrayNoDuplicates!0 (array!61018 (_ BitVec 32) List!20396) Bool)

(assert (=> b!977371 (= lt!433260 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20393))))

(declare-fun mapIsEmpty!35816 () Bool)

(assert (=> mapIsEmpty!35816 mapRes!35816))

(declare-fun b!977372 () Bool)

(declare-fun e!551014 () Bool)

(declare-fun tp_is_empty!22525 () Bool)

(assert (=> b!977372 (= e!551014 tp_is_empty!22525)))

(declare-fun b!977373 () Bool)

(declare-fun res!654154 () Bool)

(assert (=> b!977373 (=> (not res!654154) (not e!551017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61018 (_ BitVec 32)) Bool)

(assert (=> b!977373 (= res!654154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35816 () Bool)

(declare-fun tp!68069 () Bool)

(assert (=> mapNonEmpty!35816 (= mapRes!35816 (and tp!68069 e!551014))))

(declare-fun mapKey!35816 () (_ BitVec 32))

(declare-fun mapRest!35816 () (Array (_ BitVec 32) ValueCell!10781))

(declare-fun mapValue!35816 () ValueCell!10781)

(assert (=> mapNonEmpty!35816 (= (arr!29366 _values!1278) (store mapRest!35816 mapKey!35816 mapValue!35816))))

(declare-fun b!977374 () Bool)

(assert (=> b!977374 (= e!551015 tp_is_empty!22525)))

(assert (= (and start!83704 res!654155) b!977370))

(assert (= (and b!977370 res!654156) b!977373))

(assert (= (and b!977373 res!654154) b!977371))

(assert (= (and b!977369 condMapEmpty!35816) mapIsEmpty!35816))

(assert (= (and b!977369 (not condMapEmpty!35816)) mapNonEmpty!35816))

(get-info :version)

(assert (= (and mapNonEmpty!35816 ((_ is ValueCellFull!10781) mapValue!35816)) b!977372))

(assert (= (and b!977369 ((_ is ValueCellFull!10781) mapDefault!35816)) b!977374))

(assert (= start!83704 b!977369))

(declare-fun m!904061 () Bool)

(assert (=> start!83704 m!904061))

(declare-fun m!904063 () Bool)

(assert (=> start!83704 m!904063))

(declare-fun m!904065 () Bool)

(assert (=> start!83704 m!904065))

(declare-fun m!904067 () Bool)

(assert (=> b!977371 m!904067))

(declare-fun m!904069 () Bool)

(assert (=> b!977373 m!904069))

(declare-fun m!904071 () Bool)

(assert (=> mapNonEmpty!35816 m!904071))

(check-sat (not b!977373) (not mapNonEmpty!35816) (not b!977371) tp_is_empty!22525 (not start!83704))
(check-sat)
