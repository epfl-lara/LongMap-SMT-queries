; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111296 () Bool)

(assert start!111296)

(declare-fun res!874187 () Bool)

(declare-fun e!751456 () Bool)

(assert (=> start!111296 (=> (not res!874187) (not e!751456))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111296 (= res!874187 (validMask!0 mask!2019))))

(assert (=> start!111296 e!751456))

(assert (=> start!111296 true))

(declare-datatypes ((V!52801 0))(
  ( (V!52802 (val!17961 Int)) )
))
(declare-datatypes ((ValueCell!16988 0))(
  ( (ValueCellFull!16988 (v!20590 V!52801)) (EmptyCell!16988) )
))
(declare-datatypes ((array!88423 0))(
  ( (array!88424 (arr!42686 (Array (_ BitVec 32) ValueCell!16988)) (size!43238 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88423)

(declare-fun e!751455 () Bool)

(declare-fun array_inv!32419 (array!88423) Bool)

(assert (=> start!111296 (and (array_inv!32419 _values!1337) e!751455)))

(declare-datatypes ((array!88425 0))(
  ( (array!88426 (arr!42687 (Array (_ BitVec 32) (_ BitVec 64))) (size!43239 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88425)

(declare-fun array_inv!32420 (array!88425) Bool)

(assert (=> start!111296 (array_inv!32420 _keys!1609)))

(declare-fun b!1317035 () Bool)

(declare-fun e!751453 () Bool)

(declare-fun tp_is_empty!35773 () Bool)

(assert (=> b!1317035 (= e!751453 tp_is_empty!35773)))

(declare-fun b!1317036 () Bool)

(declare-fun e!751452 () Bool)

(assert (=> b!1317036 (= e!751452 tp_is_empty!35773)))

(declare-fun mapNonEmpty!55307 () Bool)

(declare-fun mapRes!55307 () Bool)

(declare-fun tp!105414 () Bool)

(assert (=> mapNonEmpty!55307 (= mapRes!55307 (and tp!105414 e!751452))))

(declare-fun mapRest!55307 () (Array (_ BitVec 32) ValueCell!16988))

(declare-fun mapKey!55307 () (_ BitVec 32))

(declare-fun mapValue!55307 () ValueCell!16988)

(assert (=> mapNonEmpty!55307 (= (arr!42686 _values!1337) (store mapRest!55307 mapKey!55307 mapValue!55307))))

(declare-fun b!1317037 () Bool)

(assert (=> b!1317037 (= e!751455 (and e!751453 mapRes!55307))))

(declare-fun condMapEmpty!55307 () Bool)

(declare-fun mapDefault!55307 () ValueCell!16988)

(assert (=> b!1317037 (= condMapEmpty!55307 (= (arr!42686 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16988)) mapDefault!55307)))))

(declare-fun mapIsEmpty!55307 () Bool)

(assert (=> mapIsEmpty!55307 mapRes!55307))

(declare-fun b!1317038 () Bool)

(declare-fun res!874188 () Bool)

(assert (=> b!1317038 (=> (not res!874188) (not e!751456))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317038 (= res!874188 (and (= (size!43238 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43239 _keys!1609) (size!43238 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317039 () Bool)

(assert (=> b!1317039 (= e!751456 false)))

(declare-fun lt!586128 () Bool)

(declare-datatypes ((List!30355 0))(
  ( (Nil!30352) (Cons!30351 (h!31560 (_ BitVec 64)) (t!43955 List!30355)) )
))
(declare-fun arrayNoDuplicates!0 (array!88425 (_ BitVec 32) List!30355) Bool)

(assert (=> b!1317039 (= lt!586128 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30352))))

(declare-fun b!1317040 () Bool)

(declare-fun res!874186 () Bool)

(assert (=> b!1317040 (=> (not res!874186) (not e!751456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88425 (_ BitVec 32)) Bool)

(assert (=> b!1317040 (= res!874186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111296 res!874187) b!1317038))

(assert (= (and b!1317038 res!874188) b!1317040))

(assert (= (and b!1317040 res!874186) b!1317039))

(assert (= (and b!1317037 condMapEmpty!55307) mapIsEmpty!55307))

(assert (= (and b!1317037 (not condMapEmpty!55307)) mapNonEmpty!55307))

(get-info :version)

(assert (= (and mapNonEmpty!55307 ((_ is ValueCellFull!16988) mapValue!55307)) b!1317036))

(assert (= (and b!1317037 ((_ is ValueCellFull!16988) mapDefault!55307)) b!1317035))

(assert (= start!111296 b!1317037))

(declare-fun m!1204563 () Bool)

(assert (=> start!111296 m!1204563))

(declare-fun m!1204565 () Bool)

(assert (=> start!111296 m!1204565))

(declare-fun m!1204567 () Bool)

(assert (=> start!111296 m!1204567))

(declare-fun m!1204569 () Bool)

(assert (=> mapNonEmpty!55307 m!1204569))

(declare-fun m!1204571 () Bool)

(assert (=> b!1317039 m!1204571))

(declare-fun m!1204573 () Bool)

(assert (=> b!1317040 m!1204573))

(check-sat (not mapNonEmpty!55307) tp_is_empty!35773 (not b!1317040) (not start!111296) (not b!1317039))
(check-sat)
