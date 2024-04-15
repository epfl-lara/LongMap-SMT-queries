; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112660 () Bool)

(assert start!112660)

(declare-fun b_free!30997 () Bool)

(declare-fun b_next!30997 () Bool)

(assert (=> start!112660 (= b_free!30997 (not b_next!30997))))

(declare-fun tp!108633 () Bool)

(declare-fun b_and!49913 () Bool)

(assert (=> start!112660 (= tp!108633 b_and!49913)))

(declare-fun b!1336183 () Bool)

(declare-fun res!886746 () Bool)

(declare-fun e!760972 () Bool)

(assert (=> b!1336183 (=> (not res!886746) (not e!760972))))

(declare-datatypes ((array!90621 0))(
  ( (array!90622 (arr!43776 (Array (_ BitVec 32) (_ BitVec 64))) (size!44328 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90621)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336183 (= res!886746 (validKeyInArray!0 (select (arr!43776 _keys!1590) from!1980)))))

(declare-fun b!1336184 () Bool)

(declare-fun e!760968 () Bool)

(declare-fun e!760969 () Bool)

(declare-fun mapRes!57038 () Bool)

(assert (=> b!1336184 (= e!760968 (and e!760969 mapRes!57038))))

(declare-fun condMapEmpty!57038 () Bool)

(declare-datatypes ((V!54313 0))(
  ( (V!54314 (val!18528 Int)) )
))
(declare-datatypes ((ValueCell!17555 0))(
  ( (ValueCellFull!17555 (v!21167 V!54313)) (EmptyCell!17555) )
))
(declare-datatypes ((array!90623 0))(
  ( (array!90624 (arr!43777 (Array (_ BitVec 32) ValueCell!17555)) (size!44329 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90623)

(declare-fun mapDefault!57038 () ValueCell!17555)

(assert (=> b!1336184 (= condMapEmpty!57038 (= (arr!43777 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17555)) mapDefault!57038)))))

(declare-fun b!1336185 () Bool)

(declare-fun res!886750 () Bool)

(assert (=> b!1336185 (=> (not res!886750) (not e!760972))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336185 (= res!886750 (and (= (size!44329 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44328 _keys!1590) (size!44329 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336186 () Bool)

(declare-fun res!886745 () Bool)

(assert (=> b!1336186 (=> (not res!886745) (not e!760972))))

(assert (=> b!1336186 (= res!886745 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!886748 () Bool)

(assert (=> start!112660 (=> (not res!886748) (not e!760972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112660 (= res!886748 (validMask!0 mask!1998))))

(assert (=> start!112660 e!760972))

(declare-fun array_inv!33207 (array!90623) Bool)

(assert (=> start!112660 (and (array_inv!33207 _values!1320) e!760968)))

(assert (=> start!112660 true))

(declare-fun array_inv!33208 (array!90621) Bool)

(assert (=> start!112660 (array_inv!33208 _keys!1590)))

(assert (=> start!112660 tp!108633))

(declare-fun tp_is_empty!36907 () Bool)

(assert (=> start!112660 tp_is_empty!36907))

(declare-fun b!1336187 () Bool)

(declare-fun res!886747 () Bool)

(assert (=> b!1336187 (=> (not res!886747) (not e!760972))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336187 (= res!886747 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44328 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336188 () Bool)

(assert (=> b!1336188 (= e!760972 (not true))))

(declare-datatypes ((tuple2!23958 0))(
  ( (tuple2!23959 (_1!11990 (_ BitVec 64)) (_2!11990 V!54313)) )
))
(declare-datatypes ((List!31092 0))(
  ( (Nil!31089) (Cons!31088 (h!32297 tuple2!23958) (t!45362 List!31092)) )
))
(declare-datatypes ((ListLongMap!21615 0))(
  ( (ListLongMap!21616 (toList!10823 List!31092)) )
))
(declare-fun lt!592558 () ListLongMap!21615)

(declare-fun contains!8917 (ListLongMap!21615 (_ BitVec 64)) Bool)

(assert (=> b!1336188 (contains!8917 lt!592558 k0!1153)))

(declare-datatypes ((Unit!43717 0))(
  ( (Unit!43718) )
))
(declare-fun lt!592559 () Unit!43717)

(declare-fun minValue!1262 () V!54313)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!301 ((_ BitVec 64) (_ BitVec 64) V!54313 ListLongMap!21615) Unit!43717)

(assert (=> b!1336188 (= lt!592559 (lemmaInListMapAfterAddingDiffThenInBefore!301 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592558))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54313)

(declare-fun +!4756 (ListLongMap!21615 tuple2!23958) ListLongMap!21615)

(declare-fun getCurrentListMapNoExtraKeys!6399 (array!90621 array!90623 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21615)

(declare-fun get!22088 (ValueCell!17555 V!54313) V!54313)

(declare-fun dynLambda!3686 (Int (_ BitVec 64)) V!54313)

(assert (=> b!1336188 (= lt!592558 (+!4756 (getCurrentListMapNoExtraKeys!6399 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23959 (select (arr!43776 _keys!1590) from!1980) (get!22088 (select (arr!43777 _values!1320) from!1980) (dynLambda!3686 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336189 () Bool)

(declare-fun res!886744 () Bool)

(assert (=> b!1336189 (=> (not res!886744) (not e!760972))))

(assert (=> b!1336189 (= res!886744 (not (= (select (arr!43776 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!57038 () Bool)

(declare-fun tp!108632 () Bool)

(declare-fun e!760970 () Bool)

(assert (=> mapNonEmpty!57038 (= mapRes!57038 (and tp!108632 e!760970))))

(declare-fun mapRest!57038 () (Array (_ BitVec 32) ValueCell!17555))

(declare-fun mapKey!57038 () (_ BitVec 32))

(declare-fun mapValue!57038 () ValueCell!17555)

(assert (=> mapNonEmpty!57038 (= (arr!43777 _values!1320) (store mapRest!57038 mapKey!57038 mapValue!57038))))

(declare-fun mapIsEmpty!57038 () Bool)

(assert (=> mapIsEmpty!57038 mapRes!57038))

(declare-fun b!1336190 () Bool)

(declare-fun res!886752 () Bool)

(assert (=> b!1336190 (=> (not res!886752) (not e!760972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90621 (_ BitVec 32)) Bool)

(assert (=> b!1336190 (= res!886752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336191 () Bool)

(assert (=> b!1336191 (= e!760969 tp_is_empty!36907)))

(declare-fun b!1336192 () Bool)

(declare-fun res!886749 () Bool)

(assert (=> b!1336192 (=> (not res!886749) (not e!760972))))

(declare-datatypes ((List!31093 0))(
  ( (Nil!31090) (Cons!31089 (h!32298 (_ BitVec 64)) (t!45363 List!31093)) )
))
(declare-fun arrayNoDuplicates!0 (array!90621 (_ BitVec 32) List!31093) Bool)

(assert (=> b!1336192 (= res!886749 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31090))))

(declare-fun b!1336193 () Bool)

(declare-fun res!886751 () Bool)

(assert (=> b!1336193 (=> (not res!886751) (not e!760972))))

(declare-fun getCurrentListMap!5677 (array!90621 array!90623 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21615)

(assert (=> b!1336193 (= res!886751 (contains!8917 (getCurrentListMap!5677 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336194 () Bool)

(assert (=> b!1336194 (= e!760970 tp_is_empty!36907)))

(assert (= (and start!112660 res!886748) b!1336185))

(assert (= (and b!1336185 res!886750) b!1336190))

(assert (= (and b!1336190 res!886752) b!1336192))

(assert (= (and b!1336192 res!886749) b!1336187))

(assert (= (and b!1336187 res!886747) b!1336193))

(assert (= (and b!1336193 res!886751) b!1336189))

(assert (= (and b!1336189 res!886744) b!1336183))

(assert (= (and b!1336183 res!886746) b!1336186))

(assert (= (and b!1336186 res!886745) b!1336188))

(assert (= (and b!1336184 condMapEmpty!57038) mapIsEmpty!57038))

(assert (= (and b!1336184 (not condMapEmpty!57038)) mapNonEmpty!57038))

(get-info :version)

(assert (= (and mapNonEmpty!57038 ((_ is ValueCellFull!17555) mapValue!57038)) b!1336194))

(assert (= (and b!1336184 ((_ is ValueCellFull!17555) mapDefault!57038)) b!1336191))

(assert (= start!112660 b!1336184))

(declare-fun b_lambda!24145 () Bool)

(assert (=> (not b_lambda!24145) (not b!1336188)))

(declare-fun t!45361 () Bool)

(declare-fun tb!12073 () Bool)

(assert (=> (and start!112660 (= defaultEntry!1323 defaultEntry!1323) t!45361) tb!12073))

(declare-fun result!25227 () Bool)

(assert (=> tb!12073 (= result!25227 tp_is_empty!36907)))

(assert (=> b!1336188 t!45361))

(declare-fun b_and!49915 () Bool)

(assert (= b_and!49913 (and (=> t!45361 result!25227) b_and!49915)))

(declare-fun m!1223845 () Bool)

(assert (=> b!1336192 m!1223845))

(declare-fun m!1223847 () Bool)

(assert (=> mapNonEmpty!57038 m!1223847))

(declare-fun m!1223849 () Bool)

(assert (=> b!1336193 m!1223849))

(assert (=> b!1336193 m!1223849))

(declare-fun m!1223851 () Bool)

(assert (=> b!1336193 m!1223851))

(declare-fun m!1223853 () Bool)

(assert (=> b!1336183 m!1223853))

(assert (=> b!1336183 m!1223853))

(declare-fun m!1223855 () Bool)

(assert (=> b!1336183 m!1223855))

(declare-fun m!1223857 () Bool)

(assert (=> b!1336188 m!1223857))

(declare-fun m!1223859 () Bool)

(assert (=> b!1336188 m!1223859))

(declare-fun m!1223861 () Bool)

(assert (=> b!1336188 m!1223861))

(declare-fun m!1223863 () Bool)

(assert (=> b!1336188 m!1223863))

(assert (=> b!1336188 m!1223857))

(declare-fun m!1223865 () Bool)

(assert (=> b!1336188 m!1223865))

(assert (=> b!1336188 m!1223859))

(assert (=> b!1336188 m!1223863))

(assert (=> b!1336188 m!1223853))

(declare-fun m!1223867 () Bool)

(assert (=> b!1336188 m!1223867))

(declare-fun m!1223869 () Bool)

(assert (=> b!1336188 m!1223869))

(declare-fun m!1223871 () Bool)

(assert (=> b!1336190 m!1223871))

(declare-fun m!1223873 () Bool)

(assert (=> start!112660 m!1223873))

(declare-fun m!1223875 () Bool)

(assert (=> start!112660 m!1223875))

(declare-fun m!1223877 () Bool)

(assert (=> start!112660 m!1223877))

(assert (=> b!1336189 m!1223853))

(check-sat tp_is_empty!36907 (not b!1336192) b_and!49915 (not b!1336188) (not b!1336190) (not b_next!30997) (not b!1336183) (not b!1336193) (not start!112660) (not mapNonEmpty!57038) (not b_lambda!24145))
(check-sat b_and!49915 (not b_next!30997))
