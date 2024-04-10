; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111316 () Bool)

(assert start!111316)

(declare-fun b!1317285 () Bool)

(declare-fun res!874307 () Bool)

(declare-fun e!751635 () Bool)

(assert (=> b!1317285 (=> (not res!874307) (not e!751635))))

(declare-datatypes ((array!88544 0))(
  ( (array!88545 (arr!42746 (Array (_ BitVec 32) (_ BitVec 64))) (size!43296 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88544)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88544 (_ BitVec 32)) Bool)

(assert (=> b!1317285 (= res!874307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317286 () Bool)

(declare-fun e!751636 () Bool)

(declare-fun tp_is_empty!35793 () Bool)

(assert (=> b!1317286 (= e!751636 tp_is_empty!35793)))

(declare-fun b!1317287 () Bool)

(assert (=> b!1317287 (= e!751635 false)))

(declare-fun lt!586344 () Bool)

(declare-datatypes ((List!30300 0))(
  ( (Nil!30297) (Cons!30296 (h!31505 (_ BitVec 64)) (t!43908 List!30300)) )
))
(declare-fun arrayNoDuplicates!0 (array!88544 (_ BitVec 32) List!30300) Bool)

(assert (=> b!1317287 (= lt!586344 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30297))))

(declare-fun b!1317288 () Bool)

(declare-fun e!751637 () Bool)

(assert (=> b!1317288 (= e!751637 tp_is_empty!35793)))

(declare-fun mapNonEmpty!55337 () Bool)

(declare-fun mapRes!55337 () Bool)

(declare-fun tp!105443 () Bool)

(assert (=> mapNonEmpty!55337 (= mapRes!55337 (and tp!105443 e!751637))))

(declare-fun mapKey!55337 () (_ BitVec 32))

(declare-datatypes ((V!52827 0))(
  ( (V!52828 (val!17971 Int)) )
))
(declare-datatypes ((ValueCell!16998 0))(
  ( (ValueCellFull!16998 (v!20601 V!52827)) (EmptyCell!16998) )
))
(declare-datatypes ((array!88546 0))(
  ( (array!88547 (arr!42747 (Array (_ BitVec 32) ValueCell!16998)) (size!43297 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88546)

(declare-fun mapValue!55337 () ValueCell!16998)

(declare-fun mapRest!55337 () (Array (_ BitVec 32) ValueCell!16998))

(assert (=> mapNonEmpty!55337 (= (arr!42747 _values!1337) (store mapRest!55337 mapKey!55337 mapValue!55337))))

(declare-fun mapIsEmpty!55337 () Bool)

(assert (=> mapIsEmpty!55337 mapRes!55337))

(declare-fun res!874305 () Bool)

(assert (=> start!111316 (=> (not res!874305) (not e!751635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111316 (= res!874305 (validMask!0 mask!2019))))

(assert (=> start!111316 e!751635))

(assert (=> start!111316 true))

(declare-fun e!751639 () Bool)

(declare-fun array_inv!32285 (array!88546) Bool)

(assert (=> start!111316 (and (array_inv!32285 _values!1337) e!751639)))

(declare-fun array_inv!32286 (array!88544) Bool)

(assert (=> start!111316 (array_inv!32286 _keys!1609)))

(declare-fun b!1317289 () Bool)

(declare-fun res!874306 () Bool)

(assert (=> b!1317289 (=> (not res!874306) (not e!751635))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317289 (= res!874306 (and (= (size!43297 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43296 _keys!1609) (size!43297 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317290 () Bool)

(assert (=> b!1317290 (= e!751639 (and e!751636 mapRes!55337))))

(declare-fun condMapEmpty!55337 () Bool)

(declare-fun mapDefault!55337 () ValueCell!16998)

(assert (=> b!1317290 (= condMapEmpty!55337 (= (arr!42747 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16998)) mapDefault!55337)))))

(assert (= (and start!111316 res!874305) b!1317289))

(assert (= (and b!1317289 res!874306) b!1317285))

(assert (= (and b!1317285 res!874307) b!1317287))

(assert (= (and b!1317290 condMapEmpty!55337) mapIsEmpty!55337))

(assert (= (and b!1317290 (not condMapEmpty!55337)) mapNonEmpty!55337))

(get-info :version)

(assert (= (and mapNonEmpty!55337 ((_ is ValueCellFull!16998) mapValue!55337)) b!1317288))

(assert (= (and b!1317290 ((_ is ValueCellFull!16998) mapDefault!55337)) b!1317286))

(assert (= start!111316 b!1317290))

(declare-fun m!1205199 () Bool)

(assert (=> b!1317285 m!1205199))

(declare-fun m!1205201 () Bool)

(assert (=> b!1317287 m!1205201))

(declare-fun m!1205203 () Bool)

(assert (=> mapNonEmpty!55337 m!1205203))

(declare-fun m!1205205 () Bool)

(assert (=> start!111316 m!1205205))

(declare-fun m!1205207 () Bool)

(assert (=> start!111316 m!1205207))

(declare-fun m!1205209 () Bool)

(assert (=> start!111316 m!1205209))

(check-sat (not b!1317285) tp_is_empty!35793 (not mapNonEmpty!55337) (not b!1317287) (not start!111316))
(check-sat)
