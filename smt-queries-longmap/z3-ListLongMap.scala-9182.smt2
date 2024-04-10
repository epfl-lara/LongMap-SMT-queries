; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110442 () Bool)

(assert start!110442)

(declare-fun mapIsEmpty!54139 () Bool)

(declare-fun mapRes!54139 () Bool)

(assert (=> mapIsEmpty!54139 mapRes!54139))

(declare-fun b!1306588 () Bool)

(declare-fun res!867387 () Bool)

(declare-fun e!745441 () Bool)

(assert (=> b!1306588 (=> (not res!867387) (not e!745441))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51779 0))(
  ( (V!51780 (val!17578 Int)) )
))
(declare-datatypes ((ValueCell!16605 0))(
  ( (ValueCellFull!16605 (v!20205 V!51779)) (EmptyCell!16605) )
))
(declare-datatypes ((array!87030 0))(
  ( (array!87031 (arr!41995 (Array (_ BitVec 32) ValueCell!16605)) (size!42545 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87030)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!87032 0))(
  ( (array!87033 (arr!41996 (Array (_ BitVec 32) (_ BitVec 64))) (size!42546 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87032)

(assert (=> b!1306588 (= res!867387 (and (= (size!42545 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42546 _keys!1628) (size!42545 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54139 () Bool)

(declare-fun tp!103219 () Bool)

(declare-fun e!745442 () Bool)

(assert (=> mapNonEmpty!54139 (= mapRes!54139 (and tp!103219 e!745442))))

(declare-fun mapRest!54139 () (Array (_ BitVec 32) ValueCell!16605))

(declare-fun mapValue!54139 () ValueCell!16605)

(declare-fun mapKey!54139 () (_ BitVec 32))

(assert (=> mapNonEmpty!54139 (= (arr!41995 _values!1354) (store mapRest!54139 mapKey!54139 mapValue!54139))))

(declare-fun b!1306589 () Bool)

(declare-fun e!745439 () Bool)

(declare-fun e!745440 () Bool)

(assert (=> b!1306589 (= e!745439 (and e!745440 mapRes!54139))))

(declare-fun condMapEmpty!54139 () Bool)

(declare-fun mapDefault!54139 () ValueCell!16605)

(assert (=> b!1306589 (= condMapEmpty!54139 (= (arr!41995 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16605)) mapDefault!54139)))))

(declare-fun b!1306590 () Bool)

(declare-fun res!867385 () Bool)

(assert (=> b!1306590 (=> (not res!867385) (not e!745441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87032 (_ BitVec 32)) Bool)

(assert (=> b!1306590 (= res!867385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306591 () Bool)

(declare-fun tp_is_empty!35007 () Bool)

(assert (=> b!1306591 (= e!745442 tp_is_empty!35007)))

(declare-fun res!867386 () Bool)

(assert (=> start!110442 (=> (not res!867386) (not e!745441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110442 (= res!867386 (validMask!0 mask!2040))))

(assert (=> start!110442 e!745441))

(assert (=> start!110442 true))

(declare-fun array_inv!31749 (array!87030) Bool)

(assert (=> start!110442 (and (array_inv!31749 _values!1354) e!745439)))

(declare-fun array_inv!31750 (array!87032) Bool)

(assert (=> start!110442 (array_inv!31750 _keys!1628)))

(declare-fun b!1306592 () Bool)

(assert (=> b!1306592 (= e!745440 tp_is_empty!35007)))

(declare-fun b!1306593 () Bool)

(assert (=> b!1306593 (= e!745441 false)))

(declare-fun lt!584943 () Bool)

(declare-datatypes ((List!29793 0))(
  ( (Nil!29790) (Cons!29789 (h!30998 (_ BitVec 64)) (t!43399 List!29793)) )
))
(declare-fun arrayNoDuplicates!0 (array!87032 (_ BitVec 32) List!29793) Bool)

(assert (=> b!1306593 (= lt!584943 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29790))))

(assert (= (and start!110442 res!867386) b!1306588))

(assert (= (and b!1306588 res!867387) b!1306590))

(assert (= (and b!1306590 res!867385) b!1306593))

(assert (= (and b!1306589 condMapEmpty!54139) mapIsEmpty!54139))

(assert (= (and b!1306589 (not condMapEmpty!54139)) mapNonEmpty!54139))

(get-info :version)

(assert (= (and mapNonEmpty!54139 ((_ is ValueCellFull!16605) mapValue!54139)) b!1306591))

(assert (= (and b!1306589 ((_ is ValueCellFull!16605) mapDefault!54139)) b!1306592))

(assert (= start!110442 b!1306589))

(declare-fun m!1197573 () Bool)

(assert (=> mapNonEmpty!54139 m!1197573))

(declare-fun m!1197575 () Bool)

(assert (=> b!1306590 m!1197575))

(declare-fun m!1197577 () Bool)

(assert (=> start!110442 m!1197577))

(declare-fun m!1197579 () Bool)

(assert (=> start!110442 m!1197579))

(declare-fun m!1197581 () Bool)

(assert (=> start!110442 m!1197581))

(declare-fun m!1197583 () Bool)

(assert (=> b!1306593 m!1197583))

(check-sat (not start!110442) (not mapNonEmpty!54139) (not b!1306593) tp_is_empty!35007 (not b!1306590))
(check-sat)
