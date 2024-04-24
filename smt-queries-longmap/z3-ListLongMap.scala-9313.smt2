; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111538 () Bool)

(assert start!111538)

(declare-fun b!1318566 () Bool)

(declare-fun e!752463 () Bool)

(declare-fun e!752466 () Bool)

(declare-fun mapRes!55334 () Bool)

(assert (=> b!1318566 (= e!752463 (and e!752466 mapRes!55334))))

(declare-fun condMapEmpty!55334 () Bool)

(declare-datatypes ((V!52825 0))(
  ( (V!52826 (val!17970 Int)) )
))
(declare-datatypes ((ValueCell!16997 0))(
  ( (ValueCellFull!16997 (v!20595 V!52825)) (EmptyCell!16997) )
))
(declare-datatypes ((array!88605 0))(
  ( (array!88606 (arr!42772 (Array (_ BitVec 32) ValueCell!16997)) (size!43323 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88605)

(declare-fun mapDefault!55334 () ValueCell!16997)

(assert (=> b!1318566 (= condMapEmpty!55334 (= (arr!42772 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16997)) mapDefault!55334)))))

(declare-fun b!1318567 () Bool)

(declare-fun res!874816 () Bool)

(declare-fun e!752465 () Bool)

(assert (=> b!1318567 (=> (not res!874816) (not e!752465))))

(declare-datatypes ((array!88607 0))(
  ( (array!88608 (arr!42773 (Array (_ BitVec 32) (_ BitVec 64))) (size!43324 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88607)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88607 (_ BitVec 32)) Bool)

(assert (=> b!1318567 (= res!874816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318568 () Bool)

(declare-fun res!874815 () Bool)

(assert (=> b!1318568 (=> (not res!874815) (not e!752465))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318568 (= res!874815 (and (= (size!43323 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43324 _keys!1609) (size!43323 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874814 () Bool)

(assert (=> start!111538 (=> (not res!874814) (not e!752465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111538 (= res!874814 (validMask!0 mask!2019))))

(assert (=> start!111538 e!752465))

(assert (=> start!111538 true))

(declare-fun array_inv!32579 (array!88605) Bool)

(assert (=> start!111538 (and (array_inv!32579 _values!1337) e!752463)))

(declare-fun array_inv!32580 (array!88607) Bool)

(assert (=> start!111538 (array_inv!32580 _keys!1609)))

(declare-fun mapIsEmpty!55334 () Bool)

(assert (=> mapIsEmpty!55334 mapRes!55334))

(declare-fun b!1318569 () Bool)

(assert (=> b!1318569 (= e!752465 false)))

(declare-fun lt!586817 () Bool)

(declare-datatypes ((List!30333 0))(
  ( (Nil!30330) (Cons!30329 (h!31547 (_ BitVec 64)) (t!43933 List!30333)) )
))
(declare-fun arrayNoDuplicates!0 (array!88607 (_ BitVec 32) List!30333) Bool)

(assert (=> b!1318569 (= lt!586817 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30330))))

(declare-fun b!1318570 () Bool)

(declare-fun e!752467 () Bool)

(declare-fun tp_is_empty!35791 () Bool)

(assert (=> b!1318570 (= e!752467 tp_is_empty!35791)))

(declare-fun b!1318571 () Bool)

(assert (=> b!1318571 (= e!752466 tp_is_empty!35791)))

(declare-fun mapNonEmpty!55334 () Bool)

(declare-fun tp!105440 () Bool)

(assert (=> mapNonEmpty!55334 (= mapRes!55334 (and tp!105440 e!752467))))

(declare-fun mapKey!55334 () (_ BitVec 32))

(declare-fun mapRest!55334 () (Array (_ BitVec 32) ValueCell!16997))

(declare-fun mapValue!55334 () ValueCell!16997)

(assert (=> mapNonEmpty!55334 (= (arr!42772 _values!1337) (store mapRest!55334 mapKey!55334 mapValue!55334))))

(assert (= (and start!111538 res!874814) b!1318568))

(assert (= (and b!1318568 res!874815) b!1318567))

(assert (= (and b!1318567 res!874816) b!1318569))

(assert (= (and b!1318566 condMapEmpty!55334) mapIsEmpty!55334))

(assert (= (and b!1318566 (not condMapEmpty!55334)) mapNonEmpty!55334))

(get-info :version)

(assert (= (and mapNonEmpty!55334 ((_ is ValueCellFull!16997) mapValue!55334)) b!1318570))

(assert (= (and b!1318566 ((_ is ValueCellFull!16997) mapDefault!55334)) b!1318571))

(assert (= start!111538 b!1318566))

(declare-fun m!1206785 () Bool)

(assert (=> b!1318567 m!1206785))

(declare-fun m!1206787 () Bool)

(assert (=> start!111538 m!1206787))

(declare-fun m!1206789 () Bool)

(assert (=> start!111538 m!1206789))

(declare-fun m!1206791 () Bool)

(assert (=> start!111538 m!1206791))

(declare-fun m!1206793 () Bool)

(assert (=> b!1318569 m!1206793))

(declare-fun m!1206795 () Bool)

(assert (=> mapNonEmpty!55334 m!1206795))

(check-sat tp_is_empty!35791 (not mapNonEmpty!55334) (not start!111538) (not b!1318569) (not b!1318567))
(check-sat)
