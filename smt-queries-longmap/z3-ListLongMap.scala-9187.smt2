; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110472 () Bool)

(assert start!110472)

(declare-fun mapIsEmpty!54184 () Bool)

(declare-fun mapRes!54184 () Bool)

(assert (=> mapIsEmpty!54184 mapRes!54184))

(declare-fun b!1306858 () Bool)

(declare-fun res!867521 () Bool)

(declare-fun e!745664 () Bool)

(assert (=> b!1306858 (=> (not res!867521) (not e!745664))))

(declare-datatypes ((array!87084 0))(
  ( (array!87085 (arr!42022 (Array (_ BitVec 32) (_ BitVec 64))) (size!42572 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87084)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87084 (_ BitVec 32)) Bool)

(assert (=> b!1306858 (= res!867521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54184 () Bool)

(declare-fun tp!103264 () Bool)

(declare-fun e!745667 () Bool)

(assert (=> mapNonEmpty!54184 (= mapRes!54184 (and tp!103264 e!745667))))

(declare-fun mapKey!54184 () (_ BitVec 32))

(declare-datatypes ((V!51819 0))(
  ( (V!51820 (val!17593 Int)) )
))
(declare-datatypes ((ValueCell!16620 0))(
  ( (ValueCellFull!16620 (v!20220 V!51819)) (EmptyCell!16620) )
))
(declare-datatypes ((array!87086 0))(
  ( (array!87087 (arr!42023 (Array (_ BitVec 32) ValueCell!16620)) (size!42573 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87086)

(declare-fun mapRest!54184 () (Array (_ BitVec 32) ValueCell!16620))

(declare-fun mapValue!54184 () ValueCell!16620)

(assert (=> mapNonEmpty!54184 (= (arr!42023 _values!1354) (store mapRest!54184 mapKey!54184 mapValue!54184))))

(declare-fun b!1306860 () Bool)

(assert (=> b!1306860 (= e!745664 false)))

(declare-fun lt!584988 () Bool)

(declare-datatypes ((List!29801 0))(
  ( (Nil!29798) (Cons!29797 (h!31006 (_ BitVec 64)) (t!43407 List!29801)) )
))
(declare-fun arrayNoDuplicates!0 (array!87084 (_ BitVec 32) List!29801) Bool)

(assert (=> b!1306860 (= lt!584988 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29798))))

(declare-fun b!1306861 () Bool)

(declare-fun e!745663 () Bool)

(declare-fun tp_is_empty!35037 () Bool)

(assert (=> b!1306861 (= e!745663 tp_is_empty!35037)))

(declare-fun b!1306862 () Bool)

(assert (=> b!1306862 (= e!745667 tp_is_empty!35037)))

(declare-fun b!1306863 () Bool)

(declare-fun res!867522 () Bool)

(assert (=> b!1306863 (=> (not res!867522) (not e!745664))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306863 (= res!867522 (and (= (size!42573 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42572 _keys!1628) (size!42573 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306859 () Bool)

(declare-fun e!745665 () Bool)

(assert (=> b!1306859 (= e!745665 (and e!745663 mapRes!54184))))

(declare-fun condMapEmpty!54184 () Bool)

(declare-fun mapDefault!54184 () ValueCell!16620)

(assert (=> b!1306859 (= condMapEmpty!54184 (= (arr!42023 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16620)) mapDefault!54184)))))

(declare-fun res!867520 () Bool)

(assert (=> start!110472 (=> (not res!867520) (not e!745664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110472 (= res!867520 (validMask!0 mask!2040))))

(assert (=> start!110472 e!745664))

(assert (=> start!110472 true))

(declare-fun array_inv!31769 (array!87086) Bool)

(assert (=> start!110472 (and (array_inv!31769 _values!1354) e!745665)))

(declare-fun array_inv!31770 (array!87084) Bool)

(assert (=> start!110472 (array_inv!31770 _keys!1628)))

(assert (= (and start!110472 res!867520) b!1306863))

(assert (= (and b!1306863 res!867522) b!1306858))

(assert (= (and b!1306858 res!867521) b!1306860))

(assert (= (and b!1306859 condMapEmpty!54184) mapIsEmpty!54184))

(assert (= (and b!1306859 (not condMapEmpty!54184)) mapNonEmpty!54184))

(get-info :version)

(assert (= (and mapNonEmpty!54184 ((_ is ValueCellFull!16620) mapValue!54184)) b!1306862))

(assert (= (and b!1306859 ((_ is ValueCellFull!16620) mapDefault!54184)) b!1306861))

(assert (= start!110472 b!1306859))

(declare-fun m!1197753 () Bool)

(assert (=> b!1306858 m!1197753))

(declare-fun m!1197755 () Bool)

(assert (=> mapNonEmpty!54184 m!1197755))

(declare-fun m!1197757 () Bool)

(assert (=> b!1306860 m!1197757))

(declare-fun m!1197759 () Bool)

(assert (=> start!110472 m!1197759))

(declare-fun m!1197761 () Bool)

(assert (=> start!110472 m!1197761))

(declare-fun m!1197763 () Bool)

(assert (=> start!110472 m!1197763))

(check-sat (not mapNonEmpty!54184) (not b!1306860) (not start!110472) tp_is_empty!35037 (not b!1306858))
(check-sat)
