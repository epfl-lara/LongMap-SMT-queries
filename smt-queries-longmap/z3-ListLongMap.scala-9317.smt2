; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111562 () Bool)

(assert start!111562)

(declare-fun b!1318782 () Bool)

(declare-fun res!874923 () Bool)

(declare-fun e!752645 () Bool)

(assert (=> b!1318782 (=> (not res!874923) (not e!752645))))

(declare-datatypes ((array!88653 0))(
  ( (array!88654 (arr!42796 (Array (_ BitVec 32) (_ BitVec 64))) (size!43347 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88653)

(declare-datatypes ((V!52857 0))(
  ( (V!52858 (val!17982 Int)) )
))
(declare-datatypes ((ValueCell!17009 0))(
  ( (ValueCellFull!17009 (v!20607 V!52857)) (EmptyCell!17009) )
))
(declare-datatypes ((array!88655 0))(
  ( (array!88656 (arr!42797 (Array (_ BitVec 32) ValueCell!17009)) (size!43348 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88655)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318782 (= res!874923 (and (= (size!43348 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43347 _keys!1609) (size!43348 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874922 () Bool)

(assert (=> start!111562 (=> (not res!874922) (not e!752645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111562 (= res!874922 (validMask!0 mask!2019))))

(assert (=> start!111562 e!752645))

(assert (=> start!111562 true))

(declare-fun e!752644 () Bool)

(declare-fun array_inv!32595 (array!88655) Bool)

(assert (=> start!111562 (and (array_inv!32595 _values!1337) e!752644)))

(declare-fun array_inv!32596 (array!88653) Bool)

(assert (=> start!111562 (array_inv!32596 _keys!1609)))

(declare-fun b!1318783 () Bool)

(declare-fun res!874924 () Bool)

(assert (=> b!1318783 (=> (not res!874924) (not e!752645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88653 (_ BitVec 32)) Bool)

(assert (=> b!1318783 (= res!874924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55370 () Bool)

(declare-fun mapRes!55370 () Bool)

(declare-fun tp!105476 () Bool)

(declare-fun e!752646 () Bool)

(assert (=> mapNonEmpty!55370 (= mapRes!55370 (and tp!105476 e!752646))))

(declare-fun mapRest!55370 () (Array (_ BitVec 32) ValueCell!17009))

(declare-fun mapKey!55370 () (_ BitVec 32))

(declare-fun mapValue!55370 () ValueCell!17009)

(assert (=> mapNonEmpty!55370 (= (arr!42797 _values!1337) (store mapRest!55370 mapKey!55370 mapValue!55370))))

(declare-fun b!1318784 () Bool)

(declare-fun e!752643 () Bool)

(assert (=> b!1318784 (= e!752644 (and e!752643 mapRes!55370))))

(declare-fun condMapEmpty!55370 () Bool)

(declare-fun mapDefault!55370 () ValueCell!17009)

(assert (=> b!1318784 (= condMapEmpty!55370 (= (arr!42797 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17009)) mapDefault!55370)))))

(declare-fun mapIsEmpty!55370 () Bool)

(assert (=> mapIsEmpty!55370 mapRes!55370))

(declare-fun b!1318785 () Bool)

(declare-fun tp_is_empty!35815 () Bool)

(assert (=> b!1318785 (= e!752643 tp_is_empty!35815)))

(declare-fun b!1318786 () Bool)

(assert (=> b!1318786 (= e!752645 false)))

(declare-fun lt!586853 () Bool)

(declare-datatypes ((List!30339 0))(
  ( (Nil!30336) (Cons!30335 (h!31553 (_ BitVec 64)) (t!43939 List!30339)) )
))
(declare-fun arrayNoDuplicates!0 (array!88653 (_ BitVec 32) List!30339) Bool)

(assert (=> b!1318786 (= lt!586853 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30336))))

(declare-fun b!1318787 () Bool)

(assert (=> b!1318787 (= e!752646 tp_is_empty!35815)))

(assert (= (and start!111562 res!874922) b!1318782))

(assert (= (and b!1318782 res!874923) b!1318783))

(assert (= (and b!1318783 res!874924) b!1318786))

(assert (= (and b!1318784 condMapEmpty!55370) mapIsEmpty!55370))

(assert (= (and b!1318784 (not condMapEmpty!55370)) mapNonEmpty!55370))

(get-info :version)

(assert (= (and mapNonEmpty!55370 ((_ is ValueCellFull!17009) mapValue!55370)) b!1318787))

(assert (= (and b!1318784 ((_ is ValueCellFull!17009) mapDefault!55370)) b!1318785))

(assert (= start!111562 b!1318784))

(declare-fun m!1206929 () Bool)

(assert (=> start!111562 m!1206929))

(declare-fun m!1206931 () Bool)

(assert (=> start!111562 m!1206931))

(declare-fun m!1206933 () Bool)

(assert (=> start!111562 m!1206933))

(declare-fun m!1206935 () Bool)

(assert (=> b!1318783 m!1206935))

(declare-fun m!1206937 () Bool)

(assert (=> mapNonEmpty!55370 m!1206937))

(declare-fun m!1206939 () Bool)

(assert (=> b!1318786 m!1206939))

(check-sat tp_is_empty!35815 (not b!1318786) (not b!1318783) (not mapNonEmpty!55370) (not start!111562))
(check-sat)
