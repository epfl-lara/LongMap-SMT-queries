; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110446 () Bool)

(assert start!110446)

(declare-fun mapIsEmpty!54145 () Bool)

(declare-fun mapRes!54145 () Bool)

(assert (=> mapIsEmpty!54145 mapRes!54145))

(declare-fun b!1306554 () Bool)

(declare-fun e!745438 () Bool)

(declare-fun e!745437 () Bool)

(assert (=> b!1306554 (= e!745438 (and e!745437 mapRes!54145))))

(declare-fun condMapEmpty!54145 () Bool)

(declare-datatypes ((V!51785 0))(
  ( (V!51786 (val!17580 Int)) )
))
(declare-datatypes ((ValueCell!16607 0))(
  ( (ValueCellFull!16607 (v!20206 V!51785)) (EmptyCell!16607) )
))
(declare-datatypes ((array!86947 0))(
  ( (array!86948 (arr!41954 (Array (_ BitVec 32) ValueCell!16607)) (size!42506 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86947)

(declare-fun mapDefault!54145 () ValueCell!16607)

(assert (=> b!1306554 (= condMapEmpty!54145 (= (arr!41954 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16607)) mapDefault!54145)))))

(declare-fun b!1306555 () Bool)

(declare-fun e!745435 () Bool)

(assert (=> b!1306555 (= e!745435 false)))

(declare-fun lt!584763 () Bool)

(declare-datatypes ((array!86949 0))(
  ( (array!86950 (arr!41955 (Array (_ BitVec 32) (_ BitVec 64))) (size!42507 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86949)

(declare-datatypes ((List!29843 0))(
  ( (Nil!29840) (Cons!29839 (h!31048 (_ BitVec 64)) (t!43441 List!29843)) )
))
(declare-fun arrayNoDuplicates!0 (array!86949 (_ BitVec 32) List!29843) Bool)

(assert (=> b!1306555 (= lt!584763 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29840))))

(declare-fun b!1306556 () Bool)

(declare-fun e!745436 () Bool)

(declare-fun tp_is_empty!35011 () Bool)

(assert (=> b!1306556 (= e!745436 tp_is_empty!35011)))

(declare-fun b!1306557 () Bool)

(declare-fun res!867376 () Bool)

(assert (=> b!1306557 (=> (not res!867376) (not e!745435))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306557 (= res!867376 (and (= (size!42506 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42507 _keys!1628) (size!42506 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306559 () Bool)

(assert (=> b!1306559 (= e!745437 tp_is_empty!35011)))

(declare-fun mapNonEmpty!54145 () Bool)

(declare-fun tp!103226 () Bool)

(assert (=> mapNonEmpty!54145 (= mapRes!54145 (and tp!103226 e!745436))))

(declare-fun mapKey!54145 () (_ BitVec 32))

(declare-fun mapValue!54145 () ValueCell!16607)

(declare-fun mapRest!54145 () (Array (_ BitVec 32) ValueCell!16607))

(assert (=> mapNonEmpty!54145 (= (arr!41954 _values!1354) (store mapRest!54145 mapKey!54145 mapValue!54145))))

(declare-fun b!1306558 () Bool)

(declare-fun res!867375 () Bool)

(assert (=> b!1306558 (=> (not res!867375) (not e!745435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86949 (_ BitVec 32)) Bool)

(assert (=> b!1306558 (= res!867375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867374 () Bool)

(assert (=> start!110446 (=> (not res!867374) (not e!745435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110446 (= res!867374 (validMask!0 mask!2040))))

(assert (=> start!110446 e!745435))

(assert (=> start!110446 true))

(declare-fun array_inv!31907 (array!86947) Bool)

(assert (=> start!110446 (and (array_inv!31907 _values!1354) e!745438)))

(declare-fun array_inv!31908 (array!86949) Bool)

(assert (=> start!110446 (array_inv!31908 _keys!1628)))

(assert (= (and start!110446 res!867374) b!1306557))

(assert (= (and b!1306557 res!867376) b!1306558))

(assert (= (and b!1306558 res!867375) b!1306555))

(assert (= (and b!1306554 condMapEmpty!54145) mapIsEmpty!54145))

(assert (= (and b!1306554 (not condMapEmpty!54145)) mapNonEmpty!54145))

(get-info :version)

(assert (= (and mapNonEmpty!54145 ((_ is ValueCellFull!16607) mapValue!54145)) b!1306556))

(assert (= (and b!1306554 ((_ is ValueCellFull!16607) mapDefault!54145)) b!1306559))

(assert (= start!110446 b!1306554))

(declare-fun m!1197081 () Bool)

(assert (=> b!1306555 m!1197081))

(declare-fun m!1197083 () Bool)

(assert (=> mapNonEmpty!54145 m!1197083))

(declare-fun m!1197085 () Bool)

(assert (=> b!1306558 m!1197085))

(declare-fun m!1197087 () Bool)

(assert (=> start!110446 m!1197087))

(declare-fun m!1197089 () Bool)

(assert (=> start!110446 m!1197089))

(declare-fun m!1197091 () Bool)

(assert (=> start!110446 m!1197091))

(check-sat (not mapNonEmpty!54145) (not b!1306558) (not start!110446) tp_is_empty!35011 (not b!1306555))
(check-sat)
