; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110664 () Bool)

(assert start!110664)

(declare-fun b!1307869 () Bool)

(declare-fun e!746267 () Bool)

(declare-fun tp_is_empty!35005 () Bool)

(assert (=> b!1307869 (= e!746267 tp_is_empty!35005)))

(declare-fun b!1307870 () Bool)

(declare-fun e!746270 () Bool)

(assert (=> b!1307870 (= e!746270 tp_is_empty!35005)))

(declare-fun b!1307871 () Bool)

(declare-fun res!867895 () Bool)

(declare-fun e!746266 () Bool)

(assert (=> b!1307871 (=> (not res!867895) (not e!746266))))

(declare-datatypes ((array!87081 0))(
  ( (array!87082 (arr!42016 (Array (_ BitVec 32) (_ BitVec 64))) (size!42567 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87081)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87081 (_ BitVec 32)) Bool)

(assert (=> b!1307871 (= res!867895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54136 () Bool)

(declare-fun mapRes!54136 () Bool)

(declare-fun tp!103216 () Bool)

(assert (=> mapNonEmpty!54136 (= mapRes!54136 (and tp!103216 e!746267))))

(declare-datatypes ((V!51777 0))(
  ( (V!51778 (val!17577 Int)) )
))
(declare-datatypes ((ValueCell!16604 0))(
  ( (ValueCellFull!16604 (v!20199 V!51777)) (EmptyCell!16604) )
))
(declare-fun mapValue!54136 () ValueCell!16604)

(declare-fun mapKey!54136 () (_ BitVec 32))

(declare-datatypes ((array!87083 0))(
  ( (array!87084 (arr!42017 (Array (_ BitVec 32) ValueCell!16604)) (size!42568 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87083)

(declare-fun mapRest!54136 () (Array (_ BitVec 32) ValueCell!16604))

(assert (=> mapNonEmpty!54136 (= (arr!42017 _values!1354) (store mapRest!54136 mapKey!54136 mapValue!54136))))

(declare-fun b!1307872 () Bool)

(declare-fun res!867894 () Bool)

(assert (=> b!1307872 (=> (not res!867894) (not e!746266))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307872 (= res!867894 (and (= (size!42568 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42567 _keys!1628) (size!42568 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307873 () Bool)

(assert (=> b!1307873 (= e!746266 false)))

(declare-fun lt!585416 () Bool)

(declare-datatypes ((List!29839 0))(
  ( (Nil!29836) (Cons!29835 (h!31053 (_ BitVec 64)) (t!43437 List!29839)) )
))
(declare-fun arrayNoDuplicates!0 (array!87081 (_ BitVec 32) List!29839) Bool)

(assert (=> b!1307873 (= lt!585416 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29836))))

(declare-fun res!867896 () Bool)

(assert (=> start!110664 (=> (not res!867896) (not e!746266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110664 (= res!867896 (validMask!0 mask!2040))))

(assert (=> start!110664 e!746266))

(assert (=> start!110664 true))

(declare-fun e!746269 () Bool)

(declare-fun array_inv!32021 (array!87083) Bool)

(assert (=> start!110664 (and (array_inv!32021 _values!1354) e!746269)))

(declare-fun array_inv!32022 (array!87081) Bool)

(assert (=> start!110664 (array_inv!32022 _keys!1628)))

(declare-fun mapIsEmpty!54136 () Bool)

(assert (=> mapIsEmpty!54136 mapRes!54136))

(declare-fun b!1307874 () Bool)

(assert (=> b!1307874 (= e!746269 (and e!746270 mapRes!54136))))

(declare-fun condMapEmpty!54136 () Bool)

(declare-fun mapDefault!54136 () ValueCell!16604)

(assert (=> b!1307874 (= condMapEmpty!54136 (= (arr!42017 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16604)) mapDefault!54136)))))

(assert (= (and start!110664 res!867896) b!1307872))

(assert (= (and b!1307872 res!867894) b!1307871))

(assert (= (and b!1307871 res!867895) b!1307873))

(assert (= (and b!1307874 condMapEmpty!54136) mapIsEmpty!54136))

(assert (= (and b!1307874 (not condMapEmpty!54136)) mapNonEmpty!54136))

(get-info :version)

(assert (= (and mapNonEmpty!54136 ((_ is ValueCellFull!16604) mapValue!54136)) b!1307869))

(assert (= (and b!1307874 ((_ is ValueCellFull!16604) mapDefault!54136)) b!1307870))

(assert (= start!110664 b!1307874))

(declare-fun m!1199159 () Bool)

(assert (=> b!1307871 m!1199159))

(declare-fun m!1199161 () Bool)

(assert (=> mapNonEmpty!54136 m!1199161))

(declare-fun m!1199163 () Bool)

(assert (=> b!1307873 m!1199163))

(declare-fun m!1199165 () Bool)

(assert (=> start!110664 m!1199165))

(declare-fun m!1199167 () Bool)

(assert (=> start!110664 m!1199167))

(declare-fun m!1199169 () Bool)

(assert (=> start!110664 m!1199169))

(check-sat tp_is_empty!35005 (not b!1307873) (not mapNonEmpty!54136) (not start!110664) (not b!1307871))
(check-sat)
