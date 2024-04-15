; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110476 () Bool)

(assert start!110476)

(declare-fun b!1306824 () Bool)

(declare-fun res!867511 () Bool)

(declare-fun e!745662 () Bool)

(assert (=> b!1306824 (=> (not res!867511) (not e!745662))))

(declare-datatypes ((array!87001 0))(
  ( (array!87002 (arr!41981 (Array (_ BitVec 32) (_ BitVec 64))) (size!42533 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87001)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87001 (_ BitVec 32)) Bool)

(assert (=> b!1306824 (= res!867511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54190 () Bool)

(declare-fun mapRes!54190 () Bool)

(declare-fun tp!103271 () Bool)

(declare-fun e!745660 () Bool)

(assert (=> mapNonEmpty!54190 (= mapRes!54190 (and tp!103271 e!745660))))

(declare-datatypes ((V!51825 0))(
  ( (V!51826 (val!17595 Int)) )
))
(declare-datatypes ((ValueCell!16622 0))(
  ( (ValueCellFull!16622 (v!20221 V!51825)) (EmptyCell!16622) )
))
(declare-fun mapRest!54190 () (Array (_ BitVec 32) ValueCell!16622))

(declare-fun mapKey!54190 () (_ BitVec 32))

(declare-fun mapValue!54190 () ValueCell!16622)

(declare-datatypes ((array!87003 0))(
  ( (array!87004 (arr!41982 (Array (_ BitVec 32) ValueCell!16622)) (size!42534 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87003)

(assert (=> mapNonEmpty!54190 (= (arr!41982 _values!1354) (store mapRest!54190 mapKey!54190 mapValue!54190))))

(declare-fun mapIsEmpty!54190 () Bool)

(assert (=> mapIsEmpty!54190 mapRes!54190))

(declare-fun b!1306826 () Bool)

(declare-fun e!745664 () Bool)

(declare-fun tp_is_empty!35041 () Bool)

(assert (=> b!1306826 (= e!745664 tp_is_empty!35041)))

(declare-fun b!1306827 () Bool)

(assert (=> b!1306827 (= e!745662 false)))

(declare-fun lt!584808 () Bool)

(declare-datatypes ((List!29853 0))(
  ( (Nil!29850) (Cons!29849 (h!31058 (_ BitVec 64)) (t!43451 List!29853)) )
))
(declare-fun arrayNoDuplicates!0 (array!87001 (_ BitVec 32) List!29853) Bool)

(assert (=> b!1306827 (= lt!584808 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29850))))

(declare-fun b!1306825 () Bool)

(declare-fun e!745661 () Bool)

(assert (=> b!1306825 (= e!745661 (and e!745664 mapRes!54190))))

(declare-fun condMapEmpty!54190 () Bool)

(declare-fun mapDefault!54190 () ValueCell!16622)

(assert (=> b!1306825 (= condMapEmpty!54190 (= (arr!41982 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16622)) mapDefault!54190)))))

(declare-fun res!867510 () Bool)

(assert (=> start!110476 (=> (not res!867510) (not e!745662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110476 (= res!867510 (validMask!0 mask!2040))))

(assert (=> start!110476 e!745662))

(assert (=> start!110476 true))

(declare-fun array_inv!31927 (array!87003) Bool)

(assert (=> start!110476 (and (array_inv!31927 _values!1354) e!745661)))

(declare-fun array_inv!31928 (array!87001) Bool)

(assert (=> start!110476 (array_inv!31928 _keys!1628)))

(declare-fun b!1306828 () Bool)

(declare-fun res!867509 () Bool)

(assert (=> b!1306828 (=> (not res!867509) (not e!745662))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306828 (= res!867509 (and (= (size!42534 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42533 _keys!1628) (size!42534 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306829 () Bool)

(assert (=> b!1306829 (= e!745660 tp_is_empty!35041)))

(assert (= (and start!110476 res!867510) b!1306828))

(assert (= (and b!1306828 res!867509) b!1306824))

(assert (= (and b!1306824 res!867511) b!1306827))

(assert (= (and b!1306825 condMapEmpty!54190) mapIsEmpty!54190))

(assert (= (and b!1306825 (not condMapEmpty!54190)) mapNonEmpty!54190))

(get-info :version)

(assert (= (and mapNonEmpty!54190 ((_ is ValueCellFull!16622) mapValue!54190)) b!1306829))

(assert (= (and b!1306825 ((_ is ValueCellFull!16622) mapDefault!54190)) b!1306826))

(assert (= start!110476 b!1306825))

(declare-fun m!1197261 () Bool)

(assert (=> b!1306824 m!1197261))

(declare-fun m!1197263 () Bool)

(assert (=> mapNonEmpty!54190 m!1197263))

(declare-fun m!1197265 () Bool)

(assert (=> b!1306827 m!1197265))

(declare-fun m!1197267 () Bool)

(assert (=> start!110476 m!1197267))

(declare-fun m!1197269 () Bool)

(assert (=> start!110476 m!1197269))

(declare-fun m!1197271 () Bool)

(assert (=> start!110476 m!1197271))

(check-sat tp_is_empty!35041 (not b!1306827) (not start!110476) (not mapNonEmpty!54190) (not b!1306824))
(check-sat)
