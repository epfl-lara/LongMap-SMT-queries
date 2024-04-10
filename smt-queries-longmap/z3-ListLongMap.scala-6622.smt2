; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83706 () Bool)

(assert start!83706)

(declare-fun res!654193 () Bool)

(declare-fun e!551046 () Bool)

(assert (=> start!83706 (=> (not res!654193) (not e!551046))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83706 (= res!654193 (validMask!0 mask!1948))))

(assert (=> start!83706 e!551046))

(assert (=> start!83706 true))

(declare-datatypes ((V!34995 0))(
  ( (V!34996 (val!11305 Int)) )
))
(declare-datatypes ((ValueCell!10773 0))(
  ( (ValueCellFull!10773 (v!13867 V!34995)) (EmptyCell!10773) )
))
(declare-datatypes ((array!61051 0))(
  ( (array!61052 (arr!29383 (Array (_ BitVec 32) ValueCell!10773)) (size!29862 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61051)

(declare-fun e!551044 () Bool)

(declare-fun array_inv!22717 (array!61051) Bool)

(assert (=> start!83706 (and (array_inv!22717 _values!1278) e!551044)))

(declare-datatypes ((array!61053 0))(
  ( (array!61054 (arr!29384 (Array (_ BitVec 32) (_ BitVec 64))) (size!29863 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61053)

(declare-fun array_inv!22718 (array!61053) Bool)

(assert (=> start!83706 (array_inv!22718 _keys!1544)))

(declare-fun b!977464 () Bool)

(assert (=> b!977464 (= e!551046 false)))

(declare-fun lt!433472 () Bool)

(declare-datatypes ((List!20376 0))(
  ( (Nil!20373) (Cons!20372 (h!21534 (_ BitVec 64)) (t!28891 List!20376)) )
))
(declare-fun arrayNoDuplicates!0 (array!61053 (_ BitVec 32) List!20376) Bool)

(assert (=> b!977464 (= lt!433472 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20373))))

(declare-fun b!977465 () Bool)

(declare-fun e!551045 () Bool)

(declare-fun mapRes!35792 () Bool)

(assert (=> b!977465 (= e!551044 (and e!551045 mapRes!35792))))

(declare-fun condMapEmpty!35792 () Bool)

(declare-fun mapDefault!35792 () ValueCell!10773)

(assert (=> b!977465 (= condMapEmpty!35792 (= (arr!29383 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10773)) mapDefault!35792)))))

(declare-fun b!977466 () Bool)

(declare-fun res!654192 () Bool)

(assert (=> b!977466 (=> (not res!654192) (not e!551046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61053 (_ BitVec 32)) Bool)

(assert (=> b!977466 (= res!654192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977467 () Bool)

(declare-fun e!551042 () Bool)

(declare-fun tp_is_empty!22509 () Bool)

(assert (=> b!977467 (= e!551042 tp_is_empty!22509)))

(declare-fun mapIsEmpty!35792 () Bool)

(assert (=> mapIsEmpty!35792 mapRes!35792))

(declare-fun b!977468 () Bool)

(assert (=> b!977468 (= e!551045 tp_is_empty!22509)))

(declare-fun mapNonEmpty!35792 () Bool)

(declare-fun tp!68044 () Bool)

(assert (=> mapNonEmpty!35792 (= mapRes!35792 (and tp!68044 e!551042))))

(declare-fun mapRest!35792 () (Array (_ BitVec 32) ValueCell!10773))

(declare-fun mapKey!35792 () (_ BitVec 32))

(declare-fun mapValue!35792 () ValueCell!10773)

(assert (=> mapNonEmpty!35792 (= (arr!29383 _values!1278) (store mapRest!35792 mapKey!35792 mapValue!35792))))

(declare-fun b!977469 () Bool)

(declare-fun res!654194 () Bool)

(assert (=> b!977469 (=> (not res!654194) (not e!551046))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977469 (= res!654194 (and (= (size!29862 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29863 _keys!1544) (size!29862 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83706 res!654193) b!977469))

(assert (= (and b!977469 res!654194) b!977466))

(assert (= (and b!977466 res!654192) b!977464))

(assert (= (and b!977465 condMapEmpty!35792) mapIsEmpty!35792))

(assert (= (and b!977465 (not condMapEmpty!35792)) mapNonEmpty!35792))

(get-info :version)

(assert (= (and mapNonEmpty!35792 ((_ is ValueCellFull!10773) mapValue!35792)) b!977467))

(assert (= (and b!977465 ((_ is ValueCellFull!10773) mapDefault!35792)) b!977468))

(assert (= start!83706 b!977465))

(declare-fun m!904723 () Bool)

(assert (=> start!83706 m!904723))

(declare-fun m!904725 () Bool)

(assert (=> start!83706 m!904725))

(declare-fun m!904727 () Bool)

(assert (=> start!83706 m!904727))

(declare-fun m!904729 () Bool)

(assert (=> b!977464 m!904729))

(declare-fun m!904731 () Bool)

(assert (=> b!977466 m!904731))

(declare-fun m!904733 () Bool)

(assert (=> mapNonEmpty!35792 m!904733))

(check-sat tp_is_empty!22509 (not b!977464) (not start!83706) (not b!977466) (not mapNonEmpty!35792))
(check-sat)
