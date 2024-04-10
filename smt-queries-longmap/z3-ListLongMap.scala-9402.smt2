; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111908 () Bool)

(assert start!111908)

(declare-fun b_free!30507 () Bool)

(declare-fun b_next!30507 () Bool)

(assert (=> start!111908 (= b_free!30507 (not b_next!30507))))

(declare-fun tp!107001 () Bool)

(declare-fun b_and!49109 () Bool)

(assert (=> start!111908 (= tp!107001 b_and!49109)))

(declare-fun b!1326154 () Bool)

(declare-fun e!755900 () Bool)

(declare-fun tp_is_empty!36327 () Bool)

(assert (=> b!1326154 (= e!755900 tp_is_empty!36327)))

(declare-fun b!1326155 () Bool)

(declare-fun e!755899 () Bool)

(assert (=> b!1326155 (= e!755899 (not true))))

(declare-datatypes ((V!53539 0))(
  ( (V!53540 (val!18238 Int)) )
))
(declare-datatypes ((tuple2!23528 0))(
  ( (tuple2!23529 (_1!11775 (_ BitVec 64)) (_2!11775 V!53539)) )
))
(declare-datatypes ((List!30665 0))(
  ( (Nil!30662) (Cons!30661 (h!31870 tuple2!23528) (t!44643 List!30665)) )
))
(declare-datatypes ((ListLongMap!21185 0))(
  ( (ListLongMap!21186 (toList!10608 List!30665)) )
))
(declare-fun lt!589950 () ListLongMap!21185)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8765 (ListLongMap!21185 (_ BitVec 64)) Bool)

(assert (=> b!1326155 (contains!8765 lt!589950 k0!1164)))

(declare-datatypes ((Unit!43690 0))(
  ( (Unit!43691) )
))
(declare-fun lt!589953 () Unit!43690)

(declare-fun zeroValue!1279 () V!53539)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!223 ((_ BitVec 64) (_ BitVec 64) V!53539 ListLongMap!21185) Unit!43690)

(assert (=> b!1326155 (= lt!589953 (lemmaInListMapAfterAddingDiffThenInBefore!223 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589950))))

(declare-fun lt!589952 () ListLongMap!21185)

(assert (=> b!1326155 (contains!8765 lt!589952 k0!1164)))

(declare-fun minValue!1279 () V!53539)

(declare-fun lt!589951 () Unit!43690)

(assert (=> b!1326155 (= lt!589951 (lemmaInListMapAfterAddingDiffThenInBefore!223 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589952))))

(declare-fun +!4631 (ListLongMap!21185 tuple2!23528) ListLongMap!21185)

(assert (=> b!1326155 (= lt!589952 (+!4631 lt!589950 (tuple2!23529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!89560 0))(
  ( (array!89561 (arr!43253 (Array (_ BitVec 32) (_ BitVec 64))) (size!43803 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89560)

(declare-datatypes ((ValueCell!17265 0))(
  ( (ValueCellFull!17265 (v!20871 V!53539)) (EmptyCell!17265) )
))
(declare-datatypes ((array!89562 0))(
  ( (array!89563 (arr!43254 (Array (_ BitVec 32) ValueCell!17265)) (size!43804 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89562)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6269 (array!89560 array!89562 (_ BitVec 32) (_ BitVec 32) V!53539 V!53539 (_ BitVec 32) Int) ListLongMap!21185)

(declare-fun get!21794 (ValueCell!17265 V!53539) V!53539)

(declare-fun dynLambda!3570 (Int (_ BitVec 64)) V!53539)

(assert (=> b!1326155 (= lt!589950 (+!4631 (getCurrentListMapNoExtraKeys!6269 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23529 (select (arr!43253 _keys!1609) from!2000) (get!21794 (select (arr!43254 _values!1337) from!2000) (dynLambda!3570 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326156 () Bool)

(declare-fun e!755902 () Bool)

(assert (=> b!1326156 (= e!755902 tp_is_empty!36327)))

(declare-fun mapNonEmpty!56142 () Bool)

(declare-fun mapRes!56142 () Bool)

(declare-fun tp!107000 () Bool)

(assert (=> mapNonEmpty!56142 (= mapRes!56142 (and tp!107000 e!755902))))

(declare-fun mapRest!56142 () (Array (_ BitVec 32) ValueCell!17265))

(declare-fun mapKey!56142 () (_ BitVec 32))

(declare-fun mapValue!56142 () ValueCell!17265)

(assert (=> mapNonEmpty!56142 (= (arr!43254 _values!1337) (store mapRest!56142 mapKey!56142 mapValue!56142))))

(declare-fun b!1326157 () Bool)

(declare-fun e!755898 () Bool)

(assert (=> b!1326157 (= e!755898 (and e!755900 mapRes!56142))))

(declare-fun condMapEmpty!56142 () Bool)

(declare-fun mapDefault!56142 () ValueCell!17265)

(assert (=> b!1326157 (= condMapEmpty!56142 (= (arr!43254 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17265)) mapDefault!56142)))))

(declare-fun b!1326158 () Bool)

(declare-fun res!880166 () Bool)

(assert (=> b!1326158 (=> (not res!880166) (not e!755899))))

(assert (=> b!1326158 (= res!880166 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43803 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326159 () Bool)

(declare-fun res!880162 () Bool)

(assert (=> b!1326159 (=> (not res!880162) (not e!755899))))

(assert (=> b!1326159 (= res!880162 (not (= (select (arr!43253 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326160 () Bool)

(declare-fun res!880165 () Bool)

(assert (=> b!1326160 (=> (not res!880165) (not e!755899))))

(declare-datatypes ((List!30666 0))(
  ( (Nil!30663) (Cons!30662 (h!31871 (_ BitVec 64)) (t!44644 List!30666)) )
))
(declare-fun arrayNoDuplicates!0 (array!89560 (_ BitVec 32) List!30666) Bool)

(assert (=> b!1326160 (= res!880165 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30663))))

(declare-fun b!1326161 () Bool)

(declare-fun res!880167 () Bool)

(assert (=> b!1326161 (=> (not res!880167) (not e!755899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326161 (= res!880167 (validKeyInArray!0 (select (arr!43253 _keys!1609) from!2000)))))

(declare-fun b!1326162 () Bool)

(declare-fun res!880163 () Bool)

(assert (=> b!1326162 (=> (not res!880163) (not e!755899))))

(declare-fun getCurrentListMap!5599 (array!89560 array!89562 (_ BitVec 32) (_ BitVec 32) V!53539 V!53539 (_ BitVec 32) Int) ListLongMap!21185)

(assert (=> b!1326162 (= res!880163 (contains!8765 (getCurrentListMap!5599 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56142 () Bool)

(assert (=> mapIsEmpty!56142 mapRes!56142))

(declare-fun b!1326163 () Bool)

(declare-fun res!880168 () Bool)

(assert (=> b!1326163 (=> (not res!880168) (not e!755899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89560 (_ BitVec 32)) Bool)

(assert (=> b!1326163 (= res!880168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!880164 () Bool)

(assert (=> start!111908 (=> (not res!880164) (not e!755899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111908 (= res!880164 (validMask!0 mask!2019))))

(assert (=> start!111908 e!755899))

(declare-fun array_inv!32651 (array!89560) Bool)

(assert (=> start!111908 (array_inv!32651 _keys!1609)))

(assert (=> start!111908 true))

(assert (=> start!111908 tp_is_empty!36327))

(declare-fun array_inv!32652 (array!89562) Bool)

(assert (=> start!111908 (and (array_inv!32652 _values!1337) e!755898)))

(assert (=> start!111908 tp!107001))

(declare-fun b!1326153 () Bool)

(declare-fun res!880161 () Bool)

(assert (=> b!1326153 (=> (not res!880161) (not e!755899))))

(assert (=> b!1326153 (= res!880161 (and (= (size!43804 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43803 _keys!1609) (size!43804 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111908 res!880164) b!1326153))

(assert (= (and b!1326153 res!880161) b!1326163))

(assert (= (and b!1326163 res!880168) b!1326160))

(assert (= (and b!1326160 res!880165) b!1326158))

(assert (= (and b!1326158 res!880166) b!1326162))

(assert (= (and b!1326162 res!880163) b!1326159))

(assert (= (and b!1326159 res!880162) b!1326161))

(assert (= (and b!1326161 res!880167) b!1326155))

(assert (= (and b!1326157 condMapEmpty!56142) mapIsEmpty!56142))

(assert (= (and b!1326157 (not condMapEmpty!56142)) mapNonEmpty!56142))

(get-info :version)

(assert (= (and mapNonEmpty!56142 ((_ is ValueCellFull!17265) mapValue!56142)) b!1326156))

(assert (= (and b!1326157 ((_ is ValueCellFull!17265) mapDefault!56142)) b!1326154))

(assert (= start!111908 b!1326157))

(declare-fun b_lambda!23785 () Bool)

(assert (=> (not b_lambda!23785) (not b!1326155)))

(declare-fun t!44642 () Bool)

(declare-fun tb!11781 () Bool)

(assert (=> (and start!111908 (= defaultEntry!1340 defaultEntry!1340) t!44642) tb!11781))

(declare-fun result!24619 () Bool)

(assert (=> tb!11781 (= result!24619 tp_is_empty!36327)))

(assert (=> b!1326155 t!44642))

(declare-fun b_and!49111 () Bool)

(assert (= b_and!49109 (and (=> t!44642 result!24619) b_and!49111)))

(declare-fun m!1215089 () Bool)

(assert (=> b!1326155 m!1215089))

(declare-fun m!1215091 () Bool)

(assert (=> b!1326155 m!1215091))

(declare-fun m!1215093 () Bool)

(assert (=> b!1326155 m!1215093))

(assert (=> b!1326155 m!1215089))

(declare-fun m!1215095 () Bool)

(assert (=> b!1326155 m!1215095))

(declare-fun m!1215097 () Bool)

(assert (=> b!1326155 m!1215097))

(declare-fun m!1215099 () Bool)

(assert (=> b!1326155 m!1215099))

(declare-fun m!1215101 () Bool)

(assert (=> b!1326155 m!1215101))

(declare-fun m!1215103 () Bool)

(assert (=> b!1326155 m!1215103))

(assert (=> b!1326155 m!1215101))

(assert (=> b!1326155 m!1215093))

(declare-fun m!1215105 () Bool)

(assert (=> b!1326155 m!1215105))

(declare-fun m!1215107 () Bool)

(assert (=> b!1326155 m!1215107))

(declare-fun m!1215109 () Bool)

(assert (=> b!1326155 m!1215109))

(declare-fun m!1215111 () Bool)

(assert (=> start!111908 m!1215111))

(declare-fun m!1215113 () Bool)

(assert (=> start!111908 m!1215113))

(declare-fun m!1215115 () Bool)

(assert (=> start!111908 m!1215115))

(declare-fun m!1215117 () Bool)

(assert (=> b!1326163 m!1215117))

(declare-fun m!1215119 () Bool)

(assert (=> b!1326160 m!1215119))

(declare-fun m!1215121 () Bool)

(assert (=> b!1326162 m!1215121))

(assert (=> b!1326162 m!1215121))

(declare-fun m!1215123 () Bool)

(assert (=> b!1326162 m!1215123))

(declare-fun m!1215125 () Bool)

(assert (=> mapNonEmpty!56142 m!1215125))

(assert (=> b!1326161 m!1215107))

(assert (=> b!1326161 m!1215107))

(declare-fun m!1215127 () Bool)

(assert (=> b!1326161 m!1215127))

(assert (=> b!1326159 m!1215107))

(check-sat (not start!111908) tp_is_empty!36327 b_and!49111 (not b!1326163) (not b!1326160) (not b_next!30507) (not mapNonEmpty!56142) (not b_lambda!23785) (not b!1326155) (not b!1326161) (not b!1326162))
(check-sat b_and!49111 (not b_next!30507))
