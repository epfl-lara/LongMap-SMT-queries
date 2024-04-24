; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111532 () Bool)

(assert start!111532)

(declare-fun b!1318512 () Bool)

(declare-fun e!752421 () Bool)

(declare-fun tp_is_empty!35785 () Bool)

(assert (=> b!1318512 (= e!752421 tp_is_empty!35785)))

(declare-fun b!1318513 () Bool)

(declare-fun res!874787 () Bool)

(declare-fun e!752419 () Bool)

(assert (=> b!1318513 (=> (not res!874787) (not e!752419))))

(declare-datatypes ((array!88593 0))(
  ( (array!88594 (arr!42766 (Array (_ BitVec 32) (_ BitVec 64))) (size!43317 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88593)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88593 (_ BitVec 32)) Bool)

(assert (=> b!1318513 (= res!874787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318514 () Bool)

(declare-fun e!752422 () Bool)

(assert (=> b!1318514 (= e!752422 tp_is_empty!35785)))

(declare-fun res!874788 () Bool)

(assert (=> start!111532 (=> (not res!874788) (not e!752419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111532 (= res!874788 (validMask!0 mask!2019))))

(assert (=> start!111532 e!752419))

(assert (=> start!111532 true))

(declare-datatypes ((V!52817 0))(
  ( (V!52818 (val!17967 Int)) )
))
(declare-datatypes ((ValueCell!16994 0))(
  ( (ValueCellFull!16994 (v!20592 V!52817)) (EmptyCell!16994) )
))
(declare-datatypes ((array!88595 0))(
  ( (array!88596 (arr!42767 (Array (_ BitVec 32) ValueCell!16994)) (size!43318 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88595)

(declare-fun e!752420 () Bool)

(declare-fun array_inv!32573 (array!88595) Bool)

(assert (=> start!111532 (and (array_inv!32573 _values!1337) e!752420)))

(declare-fun array_inv!32574 (array!88593) Bool)

(assert (=> start!111532 (array_inv!32574 _keys!1609)))

(declare-fun b!1318515 () Bool)

(declare-fun res!874789 () Bool)

(assert (=> b!1318515 (=> (not res!874789) (not e!752419))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318515 (= res!874789 (and (= (size!43318 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43317 _keys!1609) (size!43318 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318516 () Bool)

(declare-fun mapRes!55325 () Bool)

(assert (=> b!1318516 (= e!752420 (and e!752422 mapRes!55325))))

(declare-fun condMapEmpty!55325 () Bool)

(declare-fun mapDefault!55325 () ValueCell!16994)

(assert (=> b!1318516 (= condMapEmpty!55325 (= (arr!42767 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16994)) mapDefault!55325)))))

(declare-fun mapIsEmpty!55325 () Bool)

(assert (=> mapIsEmpty!55325 mapRes!55325))

(declare-fun b!1318517 () Bool)

(assert (=> b!1318517 (= e!752419 false)))

(declare-fun lt!586808 () Bool)

(declare-datatypes ((List!30330 0))(
  ( (Nil!30327) (Cons!30326 (h!31544 (_ BitVec 64)) (t!43930 List!30330)) )
))
(declare-fun arrayNoDuplicates!0 (array!88593 (_ BitVec 32) List!30330) Bool)

(assert (=> b!1318517 (= lt!586808 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30327))))

(declare-fun mapNonEmpty!55325 () Bool)

(declare-fun tp!105431 () Bool)

(assert (=> mapNonEmpty!55325 (= mapRes!55325 (and tp!105431 e!752421))))

(declare-fun mapValue!55325 () ValueCell!16994)

(declare-fun mapRest!55325 () (Array (_ BitVec 32) ValueCell!16994))

(declare-fun mapKey!55325 () (_ BitVec 32))

(assert (=> mapNonEmpty!55325 (= (arr!42767 _values!1337) (store mapRest!55325 mapKey!55325 mapValue!55325))))

(assert (= (and start!111532 res!874788) b!1318515))

(assert (= (and b!1318515 res!874789) b!1318513))

(assert (= (and b!1318513 res!874787) b!1318517))

(assert (= (and b!1318516 condMapEmpty!55325) mapIsEmpty!55325))

(assert (= (and b!1318516 (not condMapEmpty!55325)) mapNonEmpty!55325))

(get-info :version)

(assert (= (and mapNonEmpty!55325 ((_ is ValueCellFull!16994) mapValue!55325)) b!1318512))

(assert (= (and b!1318516 ((_ is ValueCellFull!16994) mapDefault!55325)) b!1318514))

(assert (= start!111532 b!1318516))

(declare-fun m!1206749 () Bool)

(assert (=> b!1318513 m!1206749))

(declare-fun m!1206751 () Bool)

(assert (=> start!111532 m!1206751))

(declare-fun m!1206753 () Bool)

(assert (=> start!111532 m!1206753))

(declare-fun m!1206755 () Bool)

(assert (=> start!111532 m!1206755))

(declare-fun m!1206757 () Bool)

(assert (=> b!1318517 m!1206757))

(declare-fun m!1206759 () Bool)

(assert (=> mapNonEmpty!55325 m!1206759))

(check-sat (not b!1318513) (not start!111532) tp_is_empty!35785 (not b!1318517) (not mapNonEmpty!55325))
(check-sat)
