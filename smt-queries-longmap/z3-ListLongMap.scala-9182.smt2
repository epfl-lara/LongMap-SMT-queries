; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110440 () Bool)

(assert start!110440)

(declare-fun b!1306500 () Bool)

(declare-fun e!745393 () Bool)

(declare-fun e!745394 () Bool)

(declare-fun mapRes!54136 () Bool)

(assert (=> b!1306500 (= e!745393 (and e!745394 mapRes!54136))))

(declare-fun condMapEmpty!54136 () Bool)

(declare-datatypes ((V!51777 0))(
  ( (V!51778 (val!17577 Int)) )
))
(declare-datatypes ((ValueCell!16604 0))(
  ( (ValueCellFull!16604 (v!20203 V!51777)) (EmptyCell!16604) )
))
(declare-datatypes ((array!86937 0))(
  ( (array!86938 (arr!41949 (Array (_ BitVec 32) ValueCell!16604)) (size!42501 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86937)

(declare-fun mapDefault!54136 () ValueCell!16604)

(assert (=> b!1306500 (= condMapEmpty!54136 (= (arr!41949 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16604)) mapDefault!54136)))))

(declare-fun b!1306502 () Bool)

(declare-fun e!745392 () Bool)

(declare-fun tp_is_empty!35005 () Bool)

(assert (=> b!1306502 (= e!745392 tp_is_empty!35005)))

(declare-fun b!1306503 () Bool)

(assert (=> b!1306503 (= e!745394 tp_is_empty!35005)))

(declare-fun mapIsEmpty!54136 () Bool)

(assert (=> mapIsEmpty!54136 mapRes!54136))

(declare-fun mapNonEmpty!54136 () Bool)

(declare-fun tp!103217 () Bool)

(assert (=> mapNonEmpty!54136 (= mapRes!54136 (and tp!103217 e!745392))))

(declare-fun mapRest!54136 () (Array (_ BitVec 32) ValueCell!16604))

(declare-fun mapValue!54136 () ValueCell!16604)

(declare-fun mapKey!54136 () (_ BitVec 32))

(assert (=> mapNonEmpty!54136 (= (arr!41949 _values!1354) (store mapRest!54136 mapKey!54136 mapValue!54136))))

(declare-fun b!1306504 () Bool)

(declare-fun e!745390 () Bool)

(assert (=> b!1306504 (= e!745390 false)))

(declare-fun lt!584754 () Bool)

(declare-datatypes ((array!86939 0))(
  ( (array!86940 (arr!41950 (Array (_ BitVec 32) (_ BitVec 64))) (size!42502 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86939)

(declare-datatypes ((List!29841 0))(
  ( (Nil!29838) (Cons!29837 (h!31046 (_ BitVec 64)) (t!43439 List!29841)) )
))
(declare-fun arrayNoDuplicates!0 (array!86939 (_ BitVec 32) List!29841) Bool)

(assert (=> b!1306504 (= lt!584754 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29838))))

(declare-fun b!1306505 () Bool)

(declare-fun res!867348 () Bool)

(assert (=> b!1306505 (=> (not res!867348) (not e!745390))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306505 (= res!867348 (and (= (size!42501 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42502 _keys!1628) (size!42501 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306501 () Bool)

(declare-fun res!867349 () Bool)

(assert (=> b!1306501 (=> (not res!867349) (not e!745390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86939 (_ BitVec 32)) Bool)

(assert (=> b!1306501 (= res!867349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867347 () Bool)

(assert (=> start!110440 (=> (not res!867347) (not e!745390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110440 (= res!867347 (validMask!0 mask!2040))))

(assert (=> start!110440 e!745390))

(assert (=> start!110440 true))

(declare-fun array_inv!31903 (array!86937) Bool)

(assert (=> start!110440 (and (array_inv!31903 _values!1354) e!745393)))

(declare-fun array_inv!31904 (array!86939) Bool)

(assert (=> start!110440 (array_inv!31904 _keys!1628)))

(assert (= (and start!110440 res!867347) b!1306505))

(assert (= (and b!1306505 res!867348) b!1306501))

(assert (= (and b!1306501 res!867349) b!1306504))

(assert (= (and b!1306500 condMapEmpty!54136) mapIsEmpty!54136))

(assert (= (and b!1306500 (not condMapEmpty!54136)) mapNonEmpty!54136))

(get-info :version)

(assert (= (and mapNonEmpty!54136 ((_ is ValueCellFull!16604) mapValue!54136)) b!1306502))

(assert (= (and b!1306500 ((_ is ValueCellFull!16604) mapDefault!54136)) b!1306503))

(assert (= start!110440 b!1306500))

(declare-fun m!1197045 () Bool)

(assert (=> mapNonEmpty!54136 m!1197045))

(declare-fun m!1197047 () Bool)

(assert (=> b!1306504 m!1197047))

(declare-fun m!1197049 () Bool)

(assert (=> b!1306501 m!1197049))

(declare-fun m!1197051 () Bool)

(assert (=> start!110440 m!1197051))

(declare-fun m!1197053 () Bool)

(assert (=> start!110440 m!1197053))

(declare-fun m!1197055 () Bool)

(assert (=> start!110440 m!1197055))

(check-sat (not start!110440) tp_is_empty!35005 (not b!1306504) (not b!1306501) (not mapNonEmpty!54136))
(check-sat)
