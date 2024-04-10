; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83694 () Bool)

(assert start!83694)

(declare-fun b!977356 () Bool)

(declare-fun e!550956 () Bool)

(assert (=> b!977356 (= e!550956 false)))

(declare-fun lt!433454 () Bool)

(declare-datatypes ((array!61029 0))(
  ( (array!61030 (arr!29372 (Array (_ BitVec 32) (_ BitVec 64))) (size!29851 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61029)

(declare-datatypes ((List!20373 0))(
  ( (Nil!20370) (Cons!20369 (h!21531 (_ BitVec 64)) (t!28888 List!20373)) )
))
(declare-fun arrayNoDuplicates!0 (array!61029 (_ BitVec 32) List!20373) Bool)

(assert (=> b!977356 (= lt!433454 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20370))))

(declare-fun res!654140 () Bool)

(assert (=> start!83694 (=> (not res!654140) (not e!550956))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83694 (= res!654140 (validMask!0 mask!1948))))

(assert (=> start!83694 e!550956))

(assert (=> start!83694 true))

(declare-datatypes ((V!34979 0))(
  ( (V!34980 (val!11299 Int)) )
))
(declare-datatypes ((ValueCell!10767 0))(
  ( (ValueCellFull!10767 (v!13861 V!34979)) (EmptyCell!10767) )
))
(declare-datatypes ((array!61031 0))(
  ( (array!61032 (arr!29373 (Array (_ BitVec 32) ValueCell!10767)) (size!29852 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61031)

(declare-fun e!550952 () Bool)

(declare-fun array_inv!22707 (array!61031) Bool)

(assert (=> start!83694 (and (array_inv!22707 _values!1278) e!550952)))

(declare-fun array_inv!22708 (array!61029) Bool)

(assert (=> start!83694 (array_inv!22708 _keys!1544)))

(declare-fun b!977357 () Bool)

(declare-fun e!550955 () Bool)

(declare-fun mapRes!35774 () Bool)

(assert (=> b!977357 (= e!550952 (and e!550955 mapRes!35774))))

(declare-fun condMapEmpty!35774 () Bool)

(declare-fun mapDefault!35774 () ValueCell!10767)

(assert (=> b!977357 (= condMapEmpty!35774 (= (arr!29373 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10767)) mapDefault!35774)))))

(declare-fun b!977358 () Bool)

(declare-fun res!654139 () Bool)

(assert (=> b!977358 (=> (not res!654139) (not e!550956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61029 (_ BitVec 32)) Bool)

(assert (=> b!977358 (= res!654139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977359 () Bool)

(declare-fun e!550953 () Bool)

(declare-fun tp_is_empty!22497 () Bool)

(assert (=> b!977359 (= e!550953 tp_is_empty!22497)))

(declare-fun b!977360 () Bool)

(declare-fun res!654138 () Bool)

(assert (=> b!977360 (=> (not res!654138) (not e!550956))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977360 (= res!654138 (and (= (size!29852 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29851 _keys!1544) (size!29852 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35774 () Bool)

(assert (=> mapIsEmpty!35774 mapRes!35774))

(declare-fun b!977361 () Bool)

(assert (=> b!977361 (= e!550955 tp_is_empty!22497)))

(declare-fun mapNonEmpty!35774 () Bool)

(declare-fun tp!68026 () Bool)

(assert (=> mapNonEmpty!35774 (= mapRes!35774 (and tp!68026 e!550953))))

(declare-fun mapValue!35774 () ValueCell!10767)

(declare-fun mapKey!35774 () (_ BitVec 32))

(declare-fun mapRest!35774 () (Array (_ BitVec 32) ValueCell!10767))

(assert (=> mapNonEmpty!35774 (= (arr!29373 _values!1278) (store mapRest!35774 mapKey!35774 mapValue!35774))))

(assert (= (and start!83694 res!654140) b!977360))

(assert (= (and b!977360 res!654138) b!977358))

(assert (= (and b!977358 res!654139) b!977356))

(assert (= (and b!977357 condMapEmpty!35774) mapIsEmpty!35774))

(assert (= (and b!977357 (not condMapEmpty!35774)) mapNonEmpty!35774))

(get-info :version)

(assert (= (and mapNonEmpty!35774 ((_ is ValueCellFull!10767) mapValue!35774)) b!977359))

(assert (= (and b!977357 ((_ is ValueCellFull!10767) mapDefault!35774)) b!977361))

(assert (= start!83694 b!977357))

(declare-fun m!904651 () Bool)

(assert (=> b!977356 m!904651))

(declare-fun m!904653 () Bool)

(assert (=> start!83694 m!904653))

(declare-fun m!904655 () Bool)

(assert (=> start!83694 m!904655))

(declare-fun m!904657 () Bool)

(assert (=> start!83694 m!904657))

(declare-fun m!904659 () Bool)

(assert (=> b!977358 m!904659))

(declare-fun m!904661 () Bool)

(assert (=> mapNonEmpty!35774 m!904661))

(check-sat (not b!977356) (not start!83694) (not b!977358) (not mapNonEmpty!35774) tp_is_empty!22497)
(check-sat)
