; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111550 () Bool)

(assert start!111550)

(declare-fun b!1318674 () Bool)

(declare-fun e!752553 () Bool)

(declare-fun e!752555 () Bool)

(declare-fun mapRes!55352 () Bool)

(assert (=> b!1318674 (= e!752553 (and e!752555 mapRes!55352))))

(declare-fun condMapEmpty!55352 () Bool)

(declare-datatypes ((V!52841 0))(
  ( (V!52842 (val!17976 Int)) )
))
(declare-datatypes ((ValueCell!17003 0))(
  ( (ValueCellFull!17003 (v!20601 V!52841)) (EmptyCell!17003) )
))
(declare-datatypes ((array!88629 0))(
  ( (array!88630 (arr!42784 (Array (_ BitVec 32) ValueCell!17003)) (size!43335 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88629)

(declare-fun mapDefault!55352 () ValueCell!17003)

(assert (=> b!1318674 (= condMapEmpty!55352 (= (arr!42784 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17003)) mapDefault!55352)))))

(declare-fun b!1318675 () Bool)

(declare-fun res!874870 () Bool)

(declare-fun e!752554 () Bool)

(assert (=> b!1318675 (=> (not res!874870) (not e!752554))))

(declare-datatypes ((array!88631 0))(
  ( (array!88632 (arr!42785 (Array (_ BitVec 32) (_ BitVec 64))) (size!43336 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88631)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318675 (= res!874870 (and (= (size!43335 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43336 _keys!1609) (size!43335 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55352 () Bool)

(declare-fun tp!105458 () Bool)

(declare-fun e!752556 () Bool)

(assert (=> mapNonEmpty!55352 (= mapRes!55352 (and tp!105458 e!752556))))

(declare-fun mapKey!55352 () (_ BitVec 32))

(declare-fun mapValue!55352 () ValueCell!17003)

(declare-fun mapRest!55352 () (Array (_ BitVec 32) ValueCell!17003))

(assert (=> mapNonEmpty!55352 (= (arr!42784 _values!1337) (store mapRest!55352 mapKey!55352 mapValue!55352))))

(declare-fun mapIsEmpty!55352 () Bool)

(assert (=> mapIsEmpty!55352 mapRes!55352))

(declare-fun res!874869 () Bool)

(assert (=> start!111550 (=> (not res!874869) (not e!752554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111550 (= res!874869 (validMask!0 mask!2019))))

(assert (=> start!111550 e!752554))

(assert (=> start!111550 true))

(declare-fun array_inv!32587 (array!88629) Bool)

(assert (=> start!111550 (and (array_inv!32587 _values!1337) e!752553)))

(declare-fun array_inv!32588 (array!88631) Bool)

(assert (=> start!111550 (array_inv!32588 _keys!1609)))

(declare-fun b!1318676 () Bool)

(assert (=> b!1318676 (= e!752554 false)))

(declare-fun lt!586835 () Bool)

(declare-datatypes ((List!30336 0))(
  ( (Nil!30333) (Cons!30332 (h!31550 (_ BitVec 64)) (t!43936 List!30336)) )
))
(declare-fun arrayNoDuplicates!0 (array!88631 (_ BitVec 32) List!30336) Bool)

(assert (=> b!1318676 (= lt!586835 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30333))))

(declare-fun b!1318677 () Bool)

(declare-fun res!874868 () Bool)

(assert (=> b!1318677 (=> (not res!874868) (not e!752554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88631 (_ BitVec 32)) Bool)

(assert (=> b!1318677 (= res!874868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318678 () Bool)

(declare-fun tp_is_empty!35803 () Bool)

(assert (=> b!1318678 (= e!752556 tp_is_empty!35803)))

(declare-fun b!1318679 () Bool)

(assert (=> b!1318679 (= e!752555 tp_is_empty!35803)))

(assert (= (and start!111550 res!874869) b!1318675))

(assert (= (and b!1318675 res!874870) b!1318677))

(assert (= (and b!1318677 res!874868) b!1318676))

(assert (= (and b!1318674 condMapEmpty!55352) mapIsEmpty!55352))

(assert (= (and b!1318674 (not condMapEmpty!55352)) mapNonEmpty!55352))

(get-info :version)

(assert (= (and mapNonEmpty!55352 ((_ is ValueCellFull!17003) mapValue!55352)) b!1318678))

(assert (= (and b!1318674 ((_ is ValueCellFull!17003) mapDefault!55352)) b!1318679))

(assert (= start!111550 b!1318674))

(declare-fun m!1206857 () Bool)

(assert (=> mapNonEmpty!55352 m!1206857))

(declare-fun m!1206859 () Bool)

(assert (=> start!111550 m!1206859))

(declare-fun m!1206861 () Bool)

(assert (=> start!111550 m!1206861))

(declare-fun m!1206863 () Bool)

(assert (=> start!111550 m!1206863))

(declare-fun m!1206865 () Bool)

(assert (=> b!1318676 m!1206865))

(declare-fun m!1206867 () Bool)

(assert (=> b!1318677 m!1206867))

(check-sat (not mapNonEmpty!55352) (not start!111550) tp_is_empty!35803 (not b!1318677) (not b!1318676))
(check-sat)
