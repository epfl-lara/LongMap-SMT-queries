; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110458 () Bool)

(assert start!110458)

(declare-fun res!867429 () Bool)

(declare-fun e!745525 () Bool)

(assert (=> start!110458 (=> (not res!867429) (not e!745525))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110458 (= res!867429 (validMask!0 mask!2040))))

(assert (=> start!110458 e!745525))

(assert (=> start!110458 true))

(declare-datatypes ((V!51801 0))(
  ( (V!51802 (val!17586 Int)) )
))
(declare-datatypes ((ValueCell!16613 0))(
  ( (ValueCellFull!16613 (v!20212 V!51801)) (EmptyCell!16613) )
))
(declare-datatypes ((array!86969 0))(
  ( (array!86970 (arr!41965 (Array (_ BitVec 32) ValueCell!16613)) (size!42517 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86969)

(declare-fun e!745527 () Bool)

(declare-fun array_inv!31915 (array!86969) Bool)

(assert (=> start!110458 (and (array_inv!31915 _values!1354) e!745527)))

(declare-datatypes ((array!86971 0))(
  ( (array!86972 (arr!41966 (Array (_ BitVec 32) (_ BitVec 64))) (size!42518 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86971)

(declare-fun array_inv!31916 (array!86971) Bool)

(assert (=> start!110458 (array_inv!31916 _keys!1628)))

(declare-fun b!1306662 () Bool)

(declare-fun res!867428 () Bool)

(assert (=> b!1306662 (=> (not res!867428) (not e!745525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86971 (_ BitVec 32)) Bool)

(assert (=> b!1306662 (= res!867428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54163 () Bool)

(declare-fun mapRes!54163 () Bool)

(assert (=> mapIsEmpty!54163 mapRes!54163))

(declare-fun b!1306663 () Bool)

(declare-fun e!745529 () Bool)

(declare-fun tp_is_empty!35023 () Bool)

(assert (=> b!1306663 (= e!745529 tp_is_empty!35023)))

(declare-fun mapNonEmpty!54163 () Bool)

(declare-fun tp!103244 () Bool)

(assert (=> mapNonEmpty!54163 (= mapRes!54163 (and tp!103244 e!745529))))

(declare-fun mapRest!54163 () (Array (_ BitVec 32) ValueCell!16613))

(declare-fun mapValue!54163 () ValueCell!16613)

(declare-fun mapKey!54163 () (_ BitVec 32))

(assert (=> mapNonEmpty!54163 (= (arr!41965 _values!1354) (store mapRest!54163 mapKey!54163 mapValue!54163))))

(declare-fun b!1306664 () Bool)

(assert (=> b!1306664 (= e!745525 false)))

(declare-fun lt!584781 () Bool)

(declare-datatypes ((List!29847 0))(
  ( (Nil!29844) (Cons!29843 (h!31052 (_ BitVec 64)) (t!43445 List!29847)) )
))
(declare-fun arrayNoDuplicates!0 (array!86971 (_ BitVec 32) List!29847) Bool)

(assert (=> b!1306664 (= lt!584781 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29844))))

(declare-fun b!1306665 () Bool)

(declare-fun e!745528 () Bool)

(assert (=> b!1306665 (= e!745528 tp_is_empty!35023)))

(declare-fun b!1306666 () Bool)

(declare-fun res!867430 () Bool)

(assert (=> b!1306666 (=> (not res!867430) (not e!745525))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306666 (= res!867430 (and (= (size!42517 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42518 _keys!1628) (size!42517 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306667 () Bool)

(assert (=> b!1306667 (= e!745527 (and e!745528 mapRes!54163))))

(declare-fun condMapEmpty!54163 () Bool)

(declare-fun mapDefault!54163 () ValueCell!16613)

(assert (=> b!1306667 (= condMapEmpty!54163 (= (arr!41965 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16613)) mapDefault!54163)))))

(assert (= (and start!110458 res!867429) b!1306666))

(assert (= (and b!1306666 res!867430) b!1306662))

(assert (= (and b!1306662 res!867428) b!1306664))

(assert (= (and b!1306667 condMapEmpty!54163) mapIsEmpty!54163))

(assert (= (and b!1306667 (not condMapEmpty!54163)) mapNonEmpty!54163))

(get-info :version)

(assert (= (and mapNonEmpty!54163 ((_ is ValueCellFull!16613) mapValue!54163)) b!1306663))

(assert (= (and b!1306667 ((_ is ValueCellFull!16613) mapDefault!54163)) b!1306665))

(assert (= start!110458 b!1306667))

(declare-fun m!1197153 () Bool)

(assert (=> start!110458 m!1197153))

(declare-fun m!1197155 () Bool)

(assert (=> start!110458 m!1197155))

(declare-fun m!1197157 () Bool)

(assert (=> start!110458 m!1197157))

(declare-fun m!1197159 () Bool)

(assert (=> b!1306662 m!1197159))

(declare-fun m!1197161 () Bool)

(assert (=> mapNonEmpty!54163 m!1197161))

(declare-fun m!1197163 () Bool)

(assert (=> b!1306664 m!1197163))

(check-sat (not b!1306664) (not mapNonEmpty!54163) (not start!110458) (not b!1306662) tp_is_empty!35023)
(check-sat)
