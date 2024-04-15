; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111338 () Bool)

(assert start!111338)

(declare-fun b!1317413 () Bool)

(declare-fun e!751768 () Bool)

(declare-fun tp_is_empty!35815 () Bool)

(assert (=> b!1317413 (= e!751768 tp_is_empty!35815)))

(declare-fun mapIsEmpty!55370 () Bool)

(declare-fun mapRes!55370 () Bool)

(assert (=> mapIsEmpty!55370 mapRes!55370))

(declare-fun b!1317414 () Bool)

(declare-fun e!751769 () Bool)

(assert (=> b!1317414 (= e!751769 tp_is_empty!35815)))

(declare-fun mapNonEmpty!55370 () Bool)

(declare-fun tp!105477 () Bool)

(assert (=> mapNonEmpty!55370 (= mapRes!55370 (and tp!105477 e!751769))))

(declare-datatypes ((V!52857 0))(
  ( (V!52858 (val!17982 Int)) )
))
(declare-datatypes ((ValueCell!17009 0))(
  ( (ValueCellFull!17009 (v!20611 V!52857)) (EmptyCell!17009) )
))
(declare-datatypes ((array!88503 0))(
  ( (array!88504 (arr!42726 (Array (_ BitVec 32) ValueCell!17009)) (size!43278 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88503)

(declare-fun mapKey!55370 () (_ BitVec 32))

(declare-fun mapValue!55370 () ValueCell!17009)

(declare-fun mapRest!55370 () (Array (_ BitVec 32) ValueCell!17009))

(assert (=> mapNonEmpty!55370 (= (arr!42726 _values!1337) (store mapRest!55370 mapKey!55370 mapValue!55370))))

(declare-fun res!874375 () Bool)

(declare-fun e!751770 () Bool)

(assert (=> start!111338 (=> (not res!874375) (not e!751770))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111338 (= res!874375 (validMask!0 mask!2019))))

(assert (=> start!111338 e!751770))

(assert (=> start!111338 true))

(declare-fun e!751771 () Bool)

(declare-fun array_inv!32447 (array!88503) Bool)

(assert (=> start!111338 (and (array_inv!32447 _values!1337) e!751771)))

(declare-datatypes ((array!88505 0))(
  ( (array!88506 (arr!42727 (Array (_ BitVec 32) (_ BitVec 64))) (size!43279 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88505)

(declare-fun array_inv!32448 (array!88505) Bool)

(assert (=> start!111338 (array_inv!32448 _keys!1609)))

(declare-fun b!1317415 () Bool)

(assert (=> b!1317415 (= e!751770 false)))

(declare-fun lt!586191 () Bool)

(declare-datatypes ((List!30370 0))(
  ( (Nil!30367) (Cons!30366 (h!31575 (_ BitVec 64)) (t!43970 List!30370)) )
))
(declare-fun arrayNoDuplicates!0 (array!88505 (_ BitVec 32) List!30370) Bool)

(assert (=> b!1317415 (= lt!586191 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30367))))

(declare-fun b!1317416 () Bool)

(declare-fun res!874376 () Bool)

(assert (=> b!1317416 (=> (not res!874376) (not e!751770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88505 (_ BitVec 32)) Bool)

(assert (=> b!1317416 (= res!874376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317417 () Bool)

(declare-fun res!874377 () Bool)

(assert (=> b!1317417 (=> (not res!874377) (not e!751770))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317417 (= res!874377 (and (= (size!43278 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43279 _keys!1609) (size!43278 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317418 () Bool)

(assert (=> b!1317418 (= e!751771 (and e!751768 mapRes!55370))))

(declare-fun condMapEmpty!55370 () Bool)

(declare-fun mapDefault!55370 () ValueCell!17009)

(assert (=> b!1317418 (= condMapEmpty!55370 (= (arr!42726 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17009)) mapDefault!55370)))))

(assert (= (and start!111338 res!874375) b!1317417))

(assert (= (and b!1317417 res!874377) b!1317416))

(assert (= (and b!1317416 res!874376) b!1317415))

(assert (= (and b!1317418 condMapEmpty!55370) mapIsEmpty!55370))

(assert (= (and b!1317418 (not condMapEmpty!55370)) mapNonEmpty!55370))

(get-info :version)

(assert (= (and mapNonEmpty!55370 ((_ is ValueCellFull!17009) mapValue!55370)) b!1317414))

(assert (= (and b!1317418 ((_ is ValueCellFull!17009) mapDefault!55370)) b!1317413))

(assert (= start!111338 b!1317418))

(declare-fun m!1204815 () Bool)

(assert (=> mapNonEmpty!55370 m!1204815))

(declare-fun m!1204817 () Bool)

(assert (=> start!111338 m!1204817))

(declare-fun m!1204819 () Bool)

(assert (=> start!111338 m!1204819))

(declare-fun m!1204821 () Bool)

(assert (=> start!111338 m!1204821))

(declare-fun m!1204823 () Bool)

(assert (=> b!1317415 m!1204823))

(declare-fun m!1204825 () Bool)

(assert (=> b!1317416 m!1204825))

(check-sat (not mapNonEmpty!55370) (not start!111338) (not b!1317415) (not b!1317416) tp_is_empty!35815)
(check-sat)
