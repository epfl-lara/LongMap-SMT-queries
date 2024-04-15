; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113532 () Bool)

(assert start!113532)

(declare-fun b_free!31525 () Bool)

(declare-fun b_next!31525 () Bool)

(assert (=> start!113532 (= b_free!31525 (not b_next!31525))))

(declare-fun tp!110385 () Bool)

(declare-fun b_and!50821 () Bool)

(assert (=> start!113532 (= tp!110385 b_and!50821)))

(declare-fun b!1347547 () Bool)

(declare-fun e!766705 () Bool)

(declare-fun tp_is_empty!37525 () Bool)

(assert (=> b!1347547 (= e!766705 tp_is_empty!37525)))

(declare-fun b!1347548 () Bool)

(declare-fun e!766707 () Bool)

(assert (=> b!1347548 (= e!766707 tp_is_empty!37525)))

(declare-fun b!1347549 () Bool)

(declare-fun res!894114 () Bool)

(declare-fun e!766706 () Bool)

(assert (=> b!1347549 (=> (not res!894114) (not e!766706))))

(declare-datatypes ((array!91827 0))(
  ( (array!91828 (arr!44369 (Array (_ BitVec 32) (_ BitVec 64))) (size!44921 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91827)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91827 (_ BitVec 32)) Bool)

(assert (=> b!1347549 (= res!894114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347550 () Bool)

(declare-fun res!894112 () Bool)

(assert (=> b!1347550 (=> (not res!894112) (not e!766706))))

(declare-datatypes ((V!55137 0))(
  ( (V!55138 (val!18837 Int)) )
))
(declare-fun minValue!1245 () V!55137)

(declare-fun zeroValue!1245 () V!55137)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17864 0))(
  ( (ValueCellFull!17864 (v!21487 V!55137)) (EmptyCell!17864) )
))
(declare-datatypes ((array!91829 0))(
  ( (array!91830 (arr!44370 (Array (_ BitVec 32) ValueCell!17864)) (size!44922 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91829)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24356 0))(
  ( (tuple2!24357 (_1!12189 (_ BitVec 64)) (_2!12189 V!55137)) )
))
(declare-datatypes ((List!31490 0))(
  ( (Nil!31487) (Cons!31486 (h!32695 tuple2!24356) (t!46086 List!31490)) )
))
(declare-datatypes ((ListLongMap!22013 0))(
  ( (ListLongMap!22014 (toList!11022 List!31490)) )
))
(declare-fun contains!9127 (ListLongMap!22013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5858 (array!91827 array!91829 (_ BitVec 32) (_ BitVec 32) V!55137 V!55137 (_ BitVec 32) Int) ListLongMap!22013)

(assert (=> b!1347550 (= res!894112 (contains!9127 (getCurrentListMap!5858 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347551 () Bool)

(declare-fun res!894117 () Bool)

(assert (=> b!1347551 (=> (not res!894117) (not e!766706))))

(assert (=> b!1347551 (= res!894117 (and (= (size!44922 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44921 _keys!1571) (size!44922 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347552 () Bool)

(declare-fun e!766709 () Bool)

(declare-fun mapRes!57998 () Bool)

(assert (=> b!1347552 (= e!766709 (and e!766705 mapRes!57998))))

(declare-fun condMapEmpty!57998 () Bool)

(declare-fun mapDefault!57998 () ValueCell!17864)

(assert (=> b!1347552 (= condMapEmpty!57998 (= (arr!44370 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17864)) mapDefault!57998)))))

(declare-fun b!1347553 () Bool)

(declare-fun res!894118 () Bool)

(assert (=> b!1347553 (=> (not res!894118) (not e!766706))))

(assert (=> b!1347553 (= res!894118 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!894113 () Bool)

(assert (=> start!113532 (=> (not res!894113) (not e!766706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113532 (= res!894113 (validMask!0 mask!1977))))

(assert (=> start!113532 e!766706))

(assert (=> start!113532 tp_is_empty!37525))

(assert (=> start!113532 true))

(declare-fun array_inv!33623 (array!91827) Bool)

(assert (=> start!113532 (array_inv!33623 _keys!1571)))

(declare-fun array_inv!33624 (array!91829) Bool)

(assert (=> start!113532 (and (array_inv!33624 _values!1303) e!766709)))

(assert (=> start!113532 tp!110385))

(declare-fun mapNonEmpty!57998 () Bool)

(declare-fun tp!110384 () Bool)

(assert (=> mapNonEmpty!57998 (= mapRes!57998 (and tp!110384 e!766707))))

(declare-fun mapRest!57998 () (Array (_ BitVec 32) ValueCell!17864))

(declare-fun mapKey!57998 () (_ BitVec 32))

(declare-fun mapValue!57998 () ValueCell!17864)

(assert (=> mapNonEmpty!57998 (= (arr!44370 _values!1303) (store mapRest!57998 mapKey!57998 mapValue!57998))))

(declare-fun b!1347554 () Bool)

(declare-fun res!894116 () Bool)

(assert (=> b!1347554 (=> (not res!894116) (not e!766706))))

(assert (=> b!1347554 (= res!894116 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44921 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347555 () Bool)

(declare-fun res!894119 () Bool)

(assert (=> b!1347555 (=> (not res!894119) (not e!766706))))

(assert (=> b!1347555 (= res!894119 (not (= (select (arr!44369 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57998 () Bool)

(assert (=> mapIsEmpty!57998 mapRes!57998))

(declare-fun b!1347556 () Bool)

(assert (=> b!1347556 (= e!766706 (not true))))

(declare-fun lt!595648 () ListLongMap!22013)

(assert (=> b!1347556 (contains!9127 lt!595648 k0!1142)))

(declare-datatypes ((Unit!43983 0))(
  ( (Unit!43984) )
))
(declare-fun lt!595647 () Unit!43983)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!402 ((_ BitVec 64) (_ BitVec 64) V!55137 ListLongMap!22013) Unit!43983)

(assert (=> b!1347556 (= lt!595647 (lemmaInListMapAfterAddingDiffThenInBefore!402 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595648))))

(declare-fun +!4869 (ListLongMap!22013 tuple2!24356) ListLongMap!22013)

(declare-fun getCurrentListMapNoExtraKeys!6517 (array!91827 array!91829 (_ BitVec 32) (_ BitVec 32) V!55137 V!55137 (_ BitVec 32) Int) ListLongMap!22013)

(declare-fun get!22420 (ValueCell!17864 V!55137) V!55137)

(declare-fun dynLambda!3799 (Int (_ BitVec 64)) V!55137)

(assert (=> b!1347556 (= lt!595648 (+!4869 (getCurrentListMapNoExtraKeys!6517 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24357 (select (arr!44369 _keys!1571) from!1960) (get!22420 (select (arr!44370 _values!1303) from!1960) (dynLambda!3799 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347557 () Bool)

(declare-fun res!894115 () Bool)

(assert (=> b!1347557 (=> (not res!894115) (not e!766706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347557 (= res!894115 (validKeyInArray!0 (select (arr!44369 _keys!1571) from!1960)))))

(declare-fun b!1347558 () Bool)

(declare-fun res!894120 () Bool)

(assert (=> b!1347558 (=> (not res!894120) (not e!766706))))

(declare-datatypes ((List!31491 0))(
  ( (Nil!31488) (Cons!31487 (h!32696 (_ BitVec 64)) (t!46087 List!31491)) )
))
(declare-fun arrayNoDuplicates!0 (array!91827 (_ BitVec 32) List!31491) Bool)

(assert (=> b!1347558 (= res!894120 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31488))))

(assert (= (and start!113532 res!894113) b!1347551))

(assert (= (and b!1347551 res!894117) b!1347549))

(assert (= (and b!1347549 res!894114) b!1347558))

(assert (= (and b!1347558 res!894120) b!1347554))

(assert (= (and b!1347554 res!894116) b!1347550))

(assert (= (and b!1347550 res!894112) b!1347555))

(assert (= (and b!1347555 res!894119) b!1347557))

(assert (= (and b!1347557 res!894115) b!1347553))

(assert (= (and b!1347553 res!894118) b!1347556))

(assert (= (and b!1347552 condMapEmpty!57998) mapIsEmpty!57998))

(assert (= (and b!1347552 (not condMapEmpty!57998)) mapNonEmpty!57998))

(get-info :version)

(assert (= (and mapNonEmpty!57998 ((_ is ValueCellFull!17864) mapValue!57998)) b!1347548))

(assert (= (and b!1347552 ((_ is ValueCellFull!17864) mapDefault!57998)) b!1347547))

(assert (= start!113532 b!1347552))

(declare-fun b_lambda!24589 () Bool)

(assert (=> (not b_lambda!24589) (not b!1347556)))

(declare-fun t!46085 () Bool)

(declare-fun tb!12399 () Bool)

(assert (=> (and start!113532 (= defaultEntry!1306 defaultEntry!1306) t!46085) tb!12399))

(declare-fun result!25899 () Bool)

(assert (=> tb!12399 (= result!25899 tp_is_empty!37525)))

(assert (=> b!1347556 t!46085))

(declare-fun b_and!50823 () Bool)

(assert (= b_and!50821 (and (=> t!46085 result!25899) b_and!50823)))

(declare-fun m!1234169 () Bool)

(assert (=> mapNonEmpty!57998 m!1234169))

(declare-fun m!1234171 () Bool)

(assert (=> b!1347556 m!1234171))

(declare-fun m!1234173 () Bool)

(assert (=> b!1347556 m!1234173))

(declare-fun m!1234175 () Bool)

(assert (=> b!1347556 m!1234175))

(declare-fun m!1234177 () Bool)

(assert (=> b!1347556 m!1234177))

(declare-fun m!1234179 () Bool)

(assert (=> b!1347556 m!1234179))

(assert (=> b!1347556 m!1234173))

(declare-fun m!1234181 () Bool)

(assert (=> b!1347556 m!1234181))

(assert (=> b!1347556 m!1234175))

(assert (=> b!1347556 m!1234177))

(declare-fun m!1234183 () Bool)

(assert (=> b!1347556 m!1234183))

(declare-fun m!1234185 () Bool)

(assert (=> b!1347556 m!1234185))

(assert (=> b!1347557 m!1234185))

(assert (=> b!1347557 m!1234185))

(declare-fun m!1234187 () Bool)

(assert (=> b!1347557 m!1234187))

(declare-fun m!1234189 () Bool)

(assert (=> b!1347558 m!1234189))

(assert (=> b!1347555 m!1234185))

(declare-fun m!1234191 () Bool)

(assert (=> start!113532 m!1234191))

(declare-fun m!1234193 () Bool)

(assert (=> start!113532 m!1234193))

(declare-fun m!1234195 () Bool)

(assert (=> start!113532 m!1234195))

(declare-fun m!1234197 () Bool)

(assert (=> b!1347549 m!1234197))

(declare-fun m!1234199 () Bool)

(assert (=> b!1347550 m!1234199))

(assert (=> b!1347550 m!1234199))

(declare-fun m!1234201 () Bool)

(assert (=> b!1347550 m!1234201))

(check-sat (not start!113532) (not b_lambda!24589) b_and!50823 (not b!1347558) (not b!1347550) (not b_next!31525) (not b!1347556) (not b!1347557) (not mapNonEmpty!57998) tp_is_empty!37525 (not b!1347549))
(check-sat b_and!50823 (not b_next!31525))
