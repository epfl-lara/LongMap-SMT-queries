; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111544 () Bool)

(assert start!111544)

(declare-fun b!1318620 () Bool)

(declare-fun e!752509 () Bool)

(declare-fun e!752508 () Bool)

(declare-fun mapRes!55343 () Bool)

(assert (=> b!1318620 (= e!752509 (and e!752508 mapRes!55343))))

(declare-fun condMapEmpty!55343 () Bool)

(declare-datatypes ((V!52833 0))(
  ( (V!52834 (val!17973 Int)) )
))
(declare-datatypes ((ValueCell!17000 0))(
  ( (ValueCellFull!17000 (v!20598 V!52833)) (EmptyCell!17000) )
))
(declare-datatypes ((array!88617 0))(
  ( (array!88618 (arr!42778 (Array (_ BitVec 32) ValueCell!17000)) (size!43329 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88617)

(declare-fun mapDefault!55343 () ValueCell!17000)

(assert (=> b!1318620 (= condMapEmpty!55343 (= (arr!42778 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17000)) mapDefault!55343)))))

(declare-fun res!874843 () Bool)

(declare-fun e!752511 () Bool)

(assert (=> start!111544 (=> (not res!874843) (not e!752511))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111544 (= res!874843 (validMask!0 mask!2019))))

(assert (=> start!111544 e!752511))

(assert (=> start!111544 true))

(declare-fun array_inv!32581 (array!88617) Bool)

(assert (=> start!111544 (and (array_inv!32581 _values!1337) e!752509)))

(declare-datatypes ((array!88619 0))(
  ( (array!88620 (arr!42779 (Array (_ BitVec 32) (_ BitVec 64))) (size!43330 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88619)

(declare-fun array_inv!32582 (array!88619) Bool)

(assert (=> start!111544 (array_inv!32582 _keys!1609)))

(declare-fun b!1318621 () Bool)

(declare-fun tp_is_empty!35797 () Bool)

(assert (=> b!1318621 (= e!752508 tp_is_empty!35797)))

(declare-fun b!1318622 () Bool)

(declare-fun e!752510 () Bool)

(assert (=> b!1318622 (= e!752510 tp_is_empty!35797)))

(declare-fun b!1318623 () Bool)

(assert (=> b!1318623 (= e!752511 false)))

(declare-fun lt!586826 () Bool)

(declare-datatypes ((List!30334 0))(
  ( (Nil!30331) (Cons!30330 (h!31548 (_ BitVec 64)) (t!43934 List!30334)) )
))
(declare-fun arrayNoDuplicates!0 (array!88619 (_ BitVec 32) List!30334) Bool)

(assert (=> b!1318623 (= lt!586826 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30331))))

(declare-fun mapNonEmpty!55343 () Bool)

(declare-fun tp!105449 () Bool)

(assert (=> mapNonEmpty!55343 (= mapRes!55343 (and tp!105449 e!752510))))

(declare-fun mapKey!55343 () (_ BitVec 32))

(declare-fun mapValue!55343 () ValueCell!17000)

(declare-fun mapRest!55343 () (Array (_ BitVec 32) ValueCell!17000))

(assert (=> mapNonEmpty!55343 (= (arr!42778 _values!1337) (store mapRest!55343 mapKey!55343 mapValue!55343))))

(declare-fun b!1318624 () Bool)

(declare-fun res!874842 () Bool)

(assert (=> b!1318624 (=> (not res!874842) (not e!752511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88619 (_ BitVec 32)) Bool)

(assert (=> b!1318624 (= res!874842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55343 () Bool)

(assert (=> mapIsEmpty!55343 mapRes!55343))

(declare-fun b!1318625 () Bool)

(declare-fun res!874841 () Bool)

(assert (=> b!1318625 (=> (not res!874841) (not e!752511))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318625 (= res!874841 (and (= (size!43329 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43330 _keys!1609) (size!43329 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111544 res!874843) b!1318625))

(assert (= (and b!1318625 res!874841) b!1318624))

(assert (= (and b!1318624 res!874842) b!1318623))

(assert (= (and b!1318620 condMapEmpty!55343) mapIsEmpty!55343))

(assert (= (and b!1318620 (not condMapEmpty!55343)) mapNonEmpty!55343))

(get-info :version)

(assert (= (and mapNonEmpty!55343 ((_ is ValueCellFull!17000) mapValue!55343)) b!1318622))

(assert (= (and b!1318620 ((_ is ValueCellFull!17000) mapDefault!55343)) b!1318621))

(assert (= start!111544 b!1318620))

(declare-fun m!1206821 () Bool)

(assert (=> start!111544 m!1206821))

(declare-fun m!1206823 () Bool)

(assert (=> start!111544 m!1206823))

(declare-fun m!1206825 () Bool)

(assert (=> start!111544 m!1206825))

(declare-fun m!1206827 () Bool)

(assert (=> b!1318623 m!1206827))

(declare-fun m!1206829 () Bool)

(assert (=> mapNonEmpty!55343 m!1206829))

(declare-fun m!1206831 () Bool)

(assert (=> b!1318624 m!1206831))

(check-sat (not mapNonEmpty!55343) (not b!1318623) (not start!111544) tp_is_empty!35797 (not b!1318624))
(check-sat)
