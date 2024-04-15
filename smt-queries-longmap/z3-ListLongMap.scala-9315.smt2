; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111326 () Bool)

(assert start!111326)

(declare-fun res!874322 () Bool)

(declare-fun e!751677 () Bool)

(assert (=> start!111326 (=> (not res!874322) (not e!751677))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111326 (= res!874322 (validMask!0 mask!2019))))

(assert (=> start!111326 e!751677))

(assert (=> start!111326 true))

(declare-datatypes ((V!52841 0))(
  ( (V!52842 (val!17976 Int)) )
))
(declare-datatypes ((ValueCell!17003 0))(
  ( (ValueCellFull!17003 (v!20605 V!52841)) (EmptyCell!17003) )
))
(declare-datatypes ((array!88481 0))(
  ( (array!88482 (arr!42715 (Array (_ BitVec 32) ValueCell!17003)) (size!43267 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88481)

(declare-fun e!751679 () Bool)

(declare-fun array_inv!32441 (array!88481) Bool)

(assert (=> start!111326 (and (array_inv!32441 _values!1337) e!751679)))

(declare-datatypes ((array!88483 0))(
  ( (array!88484 (arr!42716 (Array (_ BitVec 32) (_ BitVec 64))) (size!43268 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88483)

(declare-fun array_inv!32442 (array!88483) Bool)

(assert (=> start!111326 (array_inv!32442 _keys!1609)))

(declare-fun b!1317305 () Bool)

(declare-fun e!751680 () Bool)

(declare-fun mapRes!55352 () Bool)

(assert (=> b!1317305 (= e!751679 (and e!751680 mapRes!55352))))

(declare-fun condMapEmpty!55352 () Bool)

(declare-fun mapDefault!55352 () ValueCell!17003)

(assert (=> b!1317305 (= condMapEmpty!55352 (= (arr!42715 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17003)) mapDefault!55352)))))

(declare-fun mapIsEmpty!55352 () Bool)

(assert (=> mapIsEmpty!55352 mapRes!55352))

(declare-fun b!1317306 () Bool)

(declare-fun res!874321 () Bool)

(assert (=> b!1317306 (=> (not res!874321) (not e!751677))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317306 (= res!874321 (and (= (size!43267 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43268 _keys!1609) (size!43267 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317307 () Bool)

(assert (=> b!1317307 (= e!751677 false)))

(declare-fun lt!586173 () Bool)

(declare-datatypes ((List!30366 0))(
  ( (Nil!30363) (Cons!30362 (h!31571 (_ BitVec 64)) (t!43966 List!30366)) )
))
(declare-fun arrayNoDuplicates!0 (array!88483 (_ BitVec 32) List!30366) Bool)

(assert (=> b!1317307 (= lt!586173 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30363))))

(declare-fun b!1317308 () Bool)

(declare-fun tp_is_empty!35803 () Bool)

(assert (=> b!1317308 (= e!751680 tp_is_empty!35803)))

(declare-fun b!1317309 () Bool)

(declare-fun res!874323 () Bool)

(assert (=> b!1317309 (=> (not res!874323) (not e!751677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88483 (_ BitVec 32)) Bool)

(assert (=> b!1317309 (= res!874323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55352 () Bool)

(declare-fun tp!105459 () Bool)

(declare-fun e!751681 () Bool)

(assert (=> mapNonEmpty!55352 (= mapRes!55352 (and tp!105459 e!751681))))

(declare-fun mapKey!55352 () (_ BitVec 32))

(declare-fun mapValue!55352 () ValueCell!17003)

(declare-fun mapRest!55352 () (Array (_ BitVec 32) ValueCell!17003))

(assert (=> mapNonEmpty!55352 (= (arr!42715 _values!1337) (store mapRest!55352 mapKey!55352 mapValue!55352))))

(declare-fun b!1317310 () Bool)

(assert (=> b!1317310 (= e!751681 tp_is_empty!35803)))

(assert (= (and start!111326 res!874322) b!1317306))

(assert (= (and b!1317306 res!874321) b!1317309))

(assert (= (and b!1317309 res!874323) b!1317307))

(assert (= (and b!1317305 condMapEmpty!55352) mapIsEmpty!55352))

(assert (= (and b!1317305 (not condMapEmpty!55352)) mapNonEmpty!55352))

(get-info :version)

(assert (= (and mapNonEmpty!55352 ((_ is ValueCellFull!17003) mapValue!55352)) b!1317310))

(assert (= (and b!1317305 ((_ is ValueCellFull!17003) mapDefault!55352)) b!1317308))

(assert (= start!111326 b!1317305))

(declare-fun m!1204743 () Bool)

(assert (=> start!111326 m!1204743))

(declare-fun m!1204745 () Bool)

(assert (=> start!111326 m!1204745))

(declare-fun m!1204747 () Bool)

(assert (=> start!111326 m!1204747))

(declare-fun m!1204749 () Bool)

(assert (=> b!1317307 m!1204749))

(declare-fun m!1204751 () Bool)

(assert (=> b!1317309 m!1204751))

(declare-fun m!1204753 () Bool)

(assert (=> mapNonEmpty!55352 m!1204753))

(check-sat (not b!1317307) (not start!111326) tp_is_empty!35803 (not b!1317309) (not mapNonEmpty!55352))
(check-sat)
