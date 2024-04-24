; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111832 () Bool)

(assert start!111832)

(declare-fun b_free!30265 () Bool)

(declare-fun b_next!30265 () Bool)

(assert (=> start!111832 (= b_free!30265 (not b_next!30265))))

(declare-fun tp!106271 () Bool)

(declare-fun b_and!48691 () Bool)

(assert (=> start!111832 (= tp!106271 b_and!48691)))

(declare-fun b!1323154 () Bool)

(declare-fun e!754669 () Bool)

(declare-fun tp_is_empty!36085 () Bool)

(assert (=> b!1323154 (= e!754669 tp_is_empty!36085)))

(declare-fun b!1323155 () Bool)

(declare-fun res!877877 () Bool)

(declare-fun e!754668 () Bool)

(assert (=> b!1323155 (=> (not res!877877) (not e!754668))))

(declare-datatypes ((array!89175 0))(
  ( (array!89176 (arr!43057 (Array (_ BitVec 32) (_ BitVec 64))) (size!43608 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89175)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89175 (_ BitVec 32)) Bool)

(assert (=> b!1323155 (= res!877877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323156 () Bool)

(assert (=> b!1323156 (= e!754668 (not true))))

(declare-datatypes ((V!53217 0))(
  ( (V!53218 (val!18117 Int)) )
))
(declare-datatypes ((tuple2!23378 0))(
  ( (tuple2!23379 (_1!11700 (_ BitVec 64)) (_2!11700 V!53217)) )
))
(declare-datatypes ((List!30528 0))(
  ( (Nil!30525) (Cons!30524 (h!31742 tuple2!23378) (t!44334 List!30528)) )
))
(declare-datatypes ((ListLongMap!21043 0))(
  ( (ListLongMap!21044 (toList!10537 List!30528)) )
))
(declare-fun lt!588193 () ListLongMap!21043)

(declare-fun lt!588197 () tuple2!23378)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8704 (ListLongMap!21043 (_ BitVec 64)) Bool)

(declare-fun +!4613 (ListLongMap!21043 tuple2!23378) ListLongMap!21043)

(assert (=> b!1323156 (contains!8704 (+!4613 lt!588193 lt!588197) k0!1164)))

(declare-fun zeroValue!1279 () V!53217)

(declare-datatypes ((Unit!43513 0))(
  ( (Unit!43514) )
))
(declare-fun lt!588196 () Unit!43513)

(declare-fun addStillContains!1125 (ListLongMap!21043 (_ BitVec 64) V!53217 (_ BitVec 64)) Unit!43513)

(assert (=> b!1323156 (= lt!588196 (addStillContains!1125 lt!588193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323156 (contains!8704 lt!588193 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588192 () V!53217)

(declare-fun lt!588194 () Unit!43513)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!168 ((_ BitVec 64) (_ BitVec 64) V!53217 ListLongMap!21043) Unit!43513)

(assert (=> b!1323156 (= lt!588194 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 (select (arr!43057 _keys!1609) from!2000) lt!588192 lt!588193))))

(declare-fun lt!588195 () ListLongMap!21043)

(assert (=> b!1323156 (contains!8704 lt!588195 k0!1164)))

(declare-fun lt!588200 () Unit!43513)

(assert (=> b!1323156 (= lt!588200 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588195))))

(declare-fun lt!588199 () ListLongMap!21043)

(assert (=> b!1323156 (contains!8704 lt!588199 k0!1164)))

(declare-fun lt!588198 () Unit!43513)

(declare-fun minValue!1279 () V!53217)

(assert (=> b!1323156 (= lt!588198 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588199))))

(assert (=> b!1323156 (= lt!588199 (+!4613 lt!588195 lt!588197))))

(assert (=> b!1323156 (= lt!588197 (tuple2!23379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323156 (= lt!588195 (+!4613 lt!588193 (tuple2!23379 (select (arr!43057 _keys!1609) from!2000) lt!588192)))))

(declare-datatypes ((ValueCell!17144 0))(
  ( (ValueCellFull!17144 (v!20742 V!53217)) (EmptyCell!17144) )
))
(declare-datatypes ((array!89177 0))(
  ( (array!89178 (arr!43058 (Array (_ BitVec 32) ValueCell!17144)) (size!43609 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89177)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21696 (ValueCell!17144 V!53217) V!53217)

(declare-fun dynLambda!3567 (Int (_ BitVec 64)) V!53217)

(assert (=> b!1323156 (= lt!588192 (get!21696 (select (arr!43058 _values!1337) from!2000) (dynLambda!3567 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6252 (array!89175 array!89177 (_ BitVec 32) (_ BitVec 32) V!53217 V!53217 (_ BitVec 32) Int) ListLongMap!21043)

(assert (=> b!1323156 (= lt!588193 (getCurrentListMapNoExtraKeys!6252 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323157 () Bool)

(declare-fun res!877876 () Bool)

(assert (=> b!1323157 (=> (not res!877876) (not e!754668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323157 (= res!877876 (validKeyInArray!0 (select (arr!43057 _keys!1609) from!2000)))))

(declare-fun b!1323158 () Bool)

(declare-fun res!877880 () Bool)

(assert (=> b!1323158 (=> (not res!877880) (not e!754668))))

(assert (=> b!1323158 (= res!877880 (and (= (size!43609 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43608 _keys!1609) (size!43609 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323160 () Bool)

(declare-fun res!877878 () Bool)

(assert (=> b!1323160 (=> (not res!877878) (not e!754668))))

(declare-fun getCurrentListMap!5528 (array!89175 array!89177 (_ BitVec 32) (_ BitVec 32) V!53217 V!53217 (_ BitVec 32) Int) ListLongMap!21043)

(assert (=> b!1323160 (= res!877878 (contains!8704 (getCurrentListMap!5528 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55775 () Bool)

(declare-fun mapRes!55775 () Bool)

(assert (=> mapIsEmpty!55775 mapRes!55775))

(declare-fun b!1323161 () Bool)

(declare-fun e!754672 () Bool)

(declare-fun e!754670 () Bool)

(assert (=> b!1323161 (= e!754672 (and e!754670 mapRes!55775))))

(declare-fun condMapEmpty!55775 () Bool)

(declare-fun mapDefault!55775 () ValueCell!17144)

(assert (=> b!1323161 (= condMapEmpty!55775 (= (arr!43058 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17144)) mapDefault!55775)))))

(declare-fun b!1323162 () Bool)

(declare-fun res!877882 () Bool)

(assert (=> b!1323162 (=> (not res!877882) (not e!754668))))

(assert (=> b!1323162 (= res!877882 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43608 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323163 () Bool)

(declare-fun res!877881 () Bool)

(assert (=> b!1323163 (=> (not res!877881) (not e!754668))))

(assert (=> b!1323163 (= res!877881 (not (= (select (arr!43057 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55775 () Bool)

(declare-fun tp!106270 () Bool)

(assert (=> mapNonEmpty!55775 (= mapRes!55775 (and tp!106270 e!754669))))

(declare-fun mapValue!55775 () ValueCell!17144)

(declare-fun mapKey!55775 () (_ BitVec 32))

(declare-fun mapRest!55775 () (Array (_ BitVec 32) ValueCell!17144))

(assert (=> mapNonEmpty!55775 (= (arr!43058 _values!1337) (store mapRest!55775 mapKey!55775 mapValue!55775))))

(declare-fun b!1323164 () Bool)

(assert (=> b!1323164 (= e!754670 tp_is_empty!36085)))

(declare-fun b!1323159 () Bool)

(declare-fun res!877875 () Bool)

(assert (=> b!1323159 (=> (not res!877875) (not e!754668))))

(declare-datatypes ((List!30529 0))(
  ( (Nil!30526) (Cons!30525 (h!31743 (_ BitVec 64)) (t!44335 List!30529)) )
))
(declare-fun arrayNoDuplicates!0 (array!89175 (_ BitVec 32) List!30529) Bool)

(assert (=> b!1323159 (= res!877875 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30526))))

(declare-fun res!877879 () Bool)

(assert (=> start!111832 (=> (not res!877879) (not e!754668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111832 (= res!877879 (validMask!0 mask!2019))))

(assert (=> start!111832 e!754668))

(declare-fun array_inv!32779 (array!89175) Bool)

(assert (=> start!111832 (array_inv!32779 _keys!1609)))

(assert (=> start!111832 true))

(assert (=> start!111832 tp_is_empty!36085))

(declare-fun array_inv!32780 (array!89177) Bool)

(assert (=> start!111832 (and (array_inv!32780 _values!1337) e!754672)))

(assert (=> start!111832 tp!106271))

(assert (= (and start!111832 res!877879) b!1323158))

(assert (= (and b!1323158 res!877880) b!1323155))

(assert (= (and b!1323155 res!877877) b!1323159))

(assert (= (and b!1323159 res!877875) b!1323162))

(assert (= (and b!1323162 res!877882) b!1323160))

(assert (= (and b!1323160 res!877878) b!1323163))

(assert (= (and b!1323163 res!877881) b!1323157))

(assert (= (and b!1323157 res!877876) b!1323156))

(assert (= (and b!1323161 condMapEmpty!55775) mapIsEmpty!55775))

(assert (= (and b!1323161 (not condMapEmpty!55775)) mapNonEmpty!55775))

(get-info :version)

(assert (= (and mapNonEmpty!55775 ((_ is ValueCellFull!17144) mapValue!55775)) b!1323154))

(assert (= (and b!1323161 ((_ is ValueCellFull!17144) mapDefault!55775)) b!1323164))

(assert (= start!111832 b!1323161))

(declare-fun b_lambda!23585 () Bool)

(assert (=> (not b_lambda!23585) (not b!1323156)))

(declare-fun t!44333 () Bool)

(declare-fun tb!11609 () Bool)

(assert (=> (and start!111832 (= defaultEntry!1340 defaultEntry!1340) t!44333) tb!11609))

(declare-fun result!24281 () Bool)

(assert (=> tb!11609 (= result!24281 tp_is_empty!36085)))

(assert (=> b!1323156 t!44333))

(declare-fun b_and!48693 () Bool)

(assert (= b_and!48691 (and (=> t!44333 result!24281) b_and!48693)))

(declare-fun m!1211489 () Bool)

(assert (=> b!1323160 m!1211489))

(assert (=> b!1323160 m!1211489))

(declare-fun m!1211491 () Bool)

(assert (=> b!1323160 m!1211491))

(declare-fun m!1211493 () Bool)

(assert (=> start!111832 m!1211493))

(declare-fun m!1211495 () Bool)

(assert (=> start!111832 m!1211495))

(declare-fun m!1211497 () Bool)

(assert (=> start!111832 m!1211497))

(declare-fun m!1211499 () Bool)

(assert (=> b!1323157 m!1211499))

(assert (=> b!1323157 m!1211499))

(declare-fun m!1211501 () Bool)

(assert (=> b!1323157 m!1211501))

(assert (=> b!1323163 m!1211499))

(declare-fun m!1211503 () Bool)

(assert (=> b!1323155 m!1211503))

(declare-fun m!1211505 () Bool)

(assert (=> b!1323156 m!1211505))

(declare-fun m!1211507 () Bool)

(assert (=> b!1323156 m!1211507))

(declare-fun m!1211509 () Bool)

(assert (=> b!1323156 m!1211509))

(declare-fun m!1211511 () Bool)

(assert (=> b!1323156 m!1211511))

(declare-fun m!1211513 () Bool)

(assert (=> b!1323156 m!1211513))

(declare-fun m!1211515 () Bool)

(assert (=> b!1323156 m!1211515))

(declare-fun m!1211517 () Bool)

(assert (=> b!1323156 m!1211517))

(assert (=> b!1323156 m!1211499))

(declare-fun m!1211519 () Bool)

(assert (=> b!1323156 m!1211519))

(declare-fun m!1211521 () Bool)

(assert (=> b!1323156 m!1211521))

(declare-fun m!1211523 () Bool)

(assert (=> b!1323156 m!1211523))

(declare-fun m!1211525 () Bool)

(assert (=> b!1323156 m!1211525))

(declare-fun m!1211527 () Bool)

(assert (=> b!1323156 m!1211527))

(assert (=> b!1323156 m!1211525))

(declare-fun m!1211529 () Bool)

(assert (=> b!1323156 m!1211529))

(assert (=> b!1323156 m!1211523))

(assert (=> b!1323156 m!1211515))

(declare-fun m!1211531 () Bool)

(assert (=> b!1323156 m!1211531))

(declare-fun m!1211533 () Bool)

(assert (=> b!1323156 m!1211533))

(assert (=> b!1323156 m!1211499))

(declare-fun m!1211535 () Bool)

(assert (=> mapNonEmpty!55775 m!1211535))

(declare-fun m!1211537 () Bool)

(assert (=> b!1323159 m!1211537))

(check-sat (not b!1323157) (not b!1323159) tp_is_empty!36085 (not b_lambda!23585) b_and!48693 (not b!1323160) (not b_next!30265) (not mapNonEmpty!55775) (not b!1323155) (not b!1323156) (not start!111832))
(check-sat b_and!48693 (not b_next!30265))
