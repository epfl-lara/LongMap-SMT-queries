; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113332 () Bool)

(assert start!113332)

(declare-fun b_free!31159 () Bool)

(declare-fun b_next!31159 () Bool)

(assert (=> start!113332 (= b_free!31159 (not b_next!31159))))

(declare-fun tp!109281 () Bool)

(declare-fun b_and!50227 () Bool)

(assert (=> start!113332 (= tp!109281 b_and!50227)))

(declare-fun b!1342214 () Bool)

(declare-fun e!764513 () Bool)

(declare-fun e!764515 () Bool)

(declare-fun mapRes!57445 () Bool)

(assert (=> b!1342214 (= e!764513 (and e!764515 mapRes!57445))))

(declare-fun condMapEmpty!57445 () Bool)

(declare-datatypes ((V!54649 0))(
  ( (V!54650 (val!18654 Int)) )
))
(declare-datatypes ((ValueCell!17681 0))(
  ( (ValueCellFull!17681 (v!21297 V!54649)) (EmptyCell!17681) )
))
(declare-datatypes ((array!91291 0))(
  ( (array!91292 (arr!44097 (Array (_ BitVec 32) ValueCell!17681)) (size!44648 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91291)

(declare-fun mapDefault!57445 () ValueCell!17681)

(assert (=> b!1342214 (= condMapEmpty!57445 (= (arr!44097 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17681)) mapDefault!57445)))))

(declare-fun mapIsEmpty!57445 () Bool)

(assert (=> mapIsEmpty!57445 mapRes!57445))

(declare-fun b!1342215 () Bool)

(declare-fun e!764516 () Bool)

(declare-fun tp_is_empty!37159 () Bool)

(assert (=> b!1342215 (= e!764516 tp_is_empty!37159)))

(declare-fun b!1342216 () Bool)

(declare-fun res!890062 () Bool)

(declare-fun e!764512 () Bool)

(assert (=> b!1342216 (=> (not res!890062) (not e!764512))))

(declare-datatypes ((array!91293 0))(
  ( (array!91294 (arr!44098 (Array (_ BitVec 32) (_ BitVec 64))) (size!44649 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91293)

(declare-datatypes ((List!31226 0))(
  ( (Nil!31223) (Cons!31222 (h!32440 (_ BitVec 64)) (t!45588 List!31226)) )
))
(declare-fun arrayNoDuplicates!0 (array!91293 (_ BitVec 32) List!31226) Bool)

(assert (=> b!1342216 (= res!890062 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31223))))

(declare-fun b!1342217 () Bool)

(declare-fun res!890061 () Bool)

(assert (=> b!1342217 (=> (not res!890061) (not e!764512))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342217 (= res!890061 (not (= (select (arr!44098 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342218 () Bool)

(declare-fun res!890066 () Bool)

(assert (=> b!1342218 (=> (not res!890066) (not e!764512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342218 (= res!890066 (validKeyInArray!0 (select (arr!44098 _keys!1571) from!1960)))))

(declare-fun b!1342219 () Bool)

(declare-fun res!890067 () Bool)

(assert (=> b!1342219 (=> (not res!890067) (not e!764512))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342219 (= res!890067 (and (= (size!44648 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44649 _keys!1571) (size!44648 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342220 () Bool)

(assert (=> b!1342220 (= e!764512 (not true))))

(declare-datatypes ((tuple2!24072 0))(
  ( (tuple2!24073 (_1!12047 (_ BitVec 64)) (_2!12047 V!54649)) )
))
(declare-datatypes ((List!31227 0))(
  ( (Nil!31224) (Cons!31223 (h!32441 tuple2!24072) (t!45589 List!31227)) )
))
(declare-datatypes ((ListLongMap!21737 0))(
  ( (ListLongMap!21738 (toList!10884 List!31227)) )
))
(declare-fun lt!594538 () ListLongMap!21737)

(declare-fun contains!9072 (ListLongMap!21737 (_ BitVec 64)) Bool)

(assert (=> b!1342220 (contains!9072 lt!594538 k0!1142)))

(declare-fun zeroValue!1245 () V!54649)

(declare-datatypes ((Unit!43944 0))(
  ( (Unit!43945) )
))
(declare-fun lt!594539 () Unit!43944)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!328 ((_ BitVec 64) (_ BitVec 64) V!54649 ListLongMap!21737) Unit!43944)

(assert (=> b!1342220 (= lt!594539 (lemmaInListMapAfterAddingDiffThenInBefore!328 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594538))))

(declare-fun minValue!1245 () V!54649)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4802 (ListLongMap!21737 tuple2!24072) ListLongMap!21737)

(declare-fun getCurrentListMapNoExtraKeys!6451 (array!91293 array!91291 (_ BitVec 32) (_ BitVec 32) V!54649 V!54649 (_ BitVec 32) Int) ListLongMap!21737)

(declare-fun get!22264 (ValueCell!17681 V!54649) V!54649)

(declare-fun dynLambda!3756 (Int (_ BitVec 64)) V!54649)

(assert (=> b!1342220 (= lt!594538 (+!4802 (getCurrentListMapNoExtraKeys!6451 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24073 (select (arr!44098 _keys!1571) from!1960) (get!22264 (select (arr!44097 _values!1303) from!1960) (dynLambda!3756 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342221 () Bool)

(declare-fun res!890068 () Bool)

(assert (=> b!1342221 (=> (not res!890068) (not e!764512))))

(declare-fun getCurrentListMap!5835 (array!91293 array!91291 (_ BitVec 32) (_ BitVec 32) V!54649 V!54649 (_ BitVec 32) Int) ListLongMap!21737)

(assert (=> b!1342221 (= res!890068 (contains!9072 (getCurrentListMap!5835 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!890064 () Bool)

(assert (=> start!113332 (=> (not res!890064) (not e!764512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113332 (= res!890064 (validMask!0 mask!1977))))

(assert (=> start!113332 e!764512))

(assert (=> start!113332 tp_is_empty!37159))

(assert (=> start!113332 true))

(declare-fun array_inv!33509 (array!91293) Bool)

(assert (=> start!113332 (array_inv!33509 _keys!1571)))

(declare-fun array_inv!33510 (array!91291) Bool)

(assert (=> start!113332 (and (array_inv!33510 _values!1303) e!764513)))

(assert (=> start!113332 tp!109281))

(declare-fun b!1342222 () Bool)

(assert (=> b!1342222 (= e!764515 tp_is_empty!37159)))

(declare-fun mapNonEmpty!57445 () Bool)

(declare-fun tp!109282 () Bool)

(assert (=> mapNonEmpty!57445 (= mapRes!57445 (and tp!109282 e!764516))))

(declare-fun mapRest!57445 () (Array (_ BitVec 32) ValueCell!17681))

(declare-fun mapValue!57445 () ValueCell!17681)

(declare-fun mapKey!57445 () (_ BitVec 32))

(assert (=> mapNonEmpty!57445 (= (arr!44097 _values!1303) (store mapRest!57445 mapKey!57445 mapValue!57445))))

(declare-fun b!1342223 () Bool)

(declare-fun res!890063 () Bool)

(assert (=> b!1342223 (=> (not res!890063) (not e!764512))))

(assert (=> b!1342223 (= res!890063 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44649 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342224 () Bool)

(declare-fun res!890069 () Bool)

(assert (=> b!1342224 (=> (not res!890069) (not e!764512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91293 (_ BitVec 32)) Bool)

(assert (=> b!1342224 (= res!890069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342225 () Bool)

(declare-fun res!890065 () Bool)

(assert (=> b!1342225 (=> (not res!890065) (not e!764512))))

(assert (=> b!1342225 (= res!890065 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113332 res!890064) b!1342219))

(assert (= (and b!1342219 res!890067) b!1342224))

(assert (= (and b!1342224 res!890069) b!1342216))

(assert (= (and b!1342216 res!890062) b!1342223))

(assert (= (and b!1342223 res!890063) b!1342221))

(assert (= (and b!1342221 res!890068) b!1342217))

(assert (= (and b!1342217 res!890061) b!1342218))

(assert (= (and b!1342218 res!890066) b!1342225))

(assert (= (and b!1342225 res!890065) b!1342220))

(assert (= (and b!1342214 condMapEmpty!57445) mapIsEmpty!57445))

(assert (= (and b!1342214 (not condMapEmpty!57445)) mapNonEmpty!57445))

(get-info :version)

(assert (= (and mapNonEmpty!57445 ((_ is ValueCellFull!17681) mapValue!57445)) b!1342215))

(assert (= (and b!1342214 ((_ is ValueCellFull!17681) mapDefault!57445)) b!1342222))

(assert (= start!113332 b!1342214))

(declare-fun b_lambda!24329 () Bool)

(assert (=> (not b_lambda!24329) (not b!1342220)))

(declare-fun t!45587 () Bool)

(declare-fun tb!12165 () Bool)

(assert (=> (and start!113332 (= defaultEntry!1306 defaultEntry!1306) t!45587) tb!12165))

(declare-fun result!25429 () Bool)

(assert (=> tb!12165 (= result!25429 tp_is_empty!37159)))

(assert (=> b!1342220 t!45587))

(declare-fun b_and!50229 () Bool)

(assert (= b_and!50227 (and (=> t!45587 result!25429) b_and!50229)))

(declare-fun m!1230219 () Bool)

(assert (=> b!1342216 m!1230219))

(declare-fun m!1230221 () Bool)

(assert (=> b!1342221 m!1230221))

(assert (=> b!1342221 m!1230221))

(declare-fun m!1230223 () Bool)

(assert (=> b!1342221 m!1230223))

(declare-fun m!1230225 () Bool)

(assert (=> b!1342224 m!1230225))

(declare-fun m!1230227 () Bool)

(assert (=> b!1342217 m!1230227))

(declare-fun m!1230229 () Bool)

(assert (=> start!113332 m!1230229))

(declare-fun m!1230231 () Bool)

(assert (=> start!113332 m!1230231))

(declare-fun m!1230233 () Bool)

(assert (=> start!113332 m!1230233))

(declare-fun m!1230235 () Bool)

(assert (=> b!1342220 m!1230235))

(declare-fun m!1230237 () Bool)

(assert (=> b!1342220 m!1230237))

(declare-fun m!1230239 () Bool)

(assert (=> b!1342220 m!1230239))

(declare-fun m!1230241 () Bool)

(assert (=> b!1342220 m!1230241))

(assert (=> b!1342220 m!1230235))

(declare-fun m!1230243 () Bool)

(assert (=> b!1342220 m!1230243))

(assert (=> b!1342220 m!1230237))

(declare-fun m!1230245 () Bool)

(assert (=> b!1342220 m!1230245))

(assert (=> b!1342220 m!1230239))

(declare-fun m!1230247 () Bool)

(assert (=> b!1342220 m!1230247))

(assert (=> b!1342220 m!1230227))

(declare-fun m!1230249 () Bool)

(assert (=> mapNonEmpty!57445 m!1230249))

(assert (=> b!1342218 m!1230227))

(assert (=> b!1342218 m!1230227))

(declare-fun m!1230251 () Bool)

(assert (=> b!1342218 m!1230251))

(check-sat (not b!1342224) (not b!1342216) (not b!1342218) (not b!1342220) (not mapNonEmpty!57445) (not start!113332) b_and!50229 tp_is_empty!37159 (not b_lambda!24329) (not b_next!31159) (not b!1342221))
(check-sat b_and!50229 (not b_next!31159))
