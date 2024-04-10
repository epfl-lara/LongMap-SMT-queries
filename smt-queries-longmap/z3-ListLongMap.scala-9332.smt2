; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111430 () Bool)

(assert start!111430)

(declare-fun b_free!30087 () Bool)

(declare-fun b_next!30087 () Bool)

(assert (=> start!111430 (= b_free!30087 (not b_next!30087))))

(declare-fun tp!105736 () Bool)

(declare-fun b_and!48333 () Bool)

(assert (=> start!111430 (= tp!105736 b_and!48333)))

(declare-fun b!1318740 () Bool)

(declare-fun res!875225 () Bool)

(declare-fun e!752492 () Bool)

(assert (=> b!1318740 (=> (not res!875225) (not e!752492))))

(declare-datatypes ((array!88758 0))(
  ( (array!88759 (arr!42853 (Array (_ BitVec 32) (_ BitVec 64))) (size!43403 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88758)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1318740 (= res!875225 (not (= (select (arr!42853 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!875222 () Bool)

(assert (=> start!111430 (=> (not res!875222) (not e!752492))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111430 (= res!875222 (validMask!0 mask!2019))))

(assert (=> start!111430 e!752492))

(declare-fun array_inv!32357 (array!88758) Bool)

(assert (=> start!111430 (array_inv!32357 _keys!1609)))

(assert (=> start!111430 true))

(declare-fun tp_is_empty!35907 () Bool)

(assert (=> start!111430 tp_is_empty!35907))

(declare-datatypes ((V!52979 0))(
  ( (V!52980 (val!18028 Int)) )
))
(declare-datatypes ((ValueCell!17055 0))(
  ( (ValueCellFull!17055 (v!20658 V!52979)) (EmptyCell!17055) )
))
(declare-datatypes ((array!88760 0))(
  ( (array!88761 (arr!42854 (Array (_ BitVec 32) ValueCell!17055)) (size!43404 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88760)

(declare-fun e!752494 () Bool)

(declare-fun array_inv!32358 (array!88760) Bool)

(assert (=> start!111430 (and (array_inv!32358 _values!1337) e!752494)))

(assert (=> start!111430 tp!105736))

(declare-fun mapIsEmpty!55508 () Bool)

(declare-fun mapRes!55508 () Bool)

(assert (=> mapIsEmpty!55508 mapRes!55508))

(declare-fun b!1318741 () Bool)

(declare-fun res!875226 () Bool)

(assert (=> b!1318741 (=> (not res!875226) (not e!752492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318741 (= res!875226 (validKeyInArray!0 (select (arr!42853 _keys!1609) from!2000)))))

(declare-fun b!1318742 () Bool)

(declare-fun e!752493 () Bool)

(assert (=> b!1318742 (= e!752493 tp_is_empty!35907)))

(declare-fun b!1318743 () Bool)

(declare-fun e!752491 () Bool)

(assert (=> b!1318743 (= e!752494 (and e!752491 mapRes!55508))))

(declare-fun condMapEmpty!55508 () Bool)

(declare-fun mapDefault!55508 () ValueCell!17055)

(assert (=> b!1318743 (= condMapEmpty!55508 (= (arr!42854 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17055)) mapDefault!55508)))))

(declare-fun mapNonEmpty!55508 () Bool)

(declare-fun tp!105737 () Bool)

(assert (=> mapNonEmpty!55508 (= mapRes!55508 (and tp!105737 e!752493))))

(declare-fun mapKey!55508 () (_ BitVec 32))

(declare-fun mapValue!55508 () ValueCell!17055)

(declare-fun mapRest!55508 () (Array (_ BitVec 32) ValueCell!17055))

(assert (=> mapNonEmpty!55508 (= (arr!42854 _values!1337) (store mapRest!55508 mapKey!55508 mapValue!55508))))

(declare-fun b!1318744 () Bool)

(declare-fun res!875228 () Bool)

(assert (=> b!1318744 (=> (not res!875228) (not e!752492))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52979)

(declare-fun minValue!1279 () V!52979)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23200 0))(
  ( (tuple2!23201 (_1!11611 (_ BitVec 64)) (_2!11611 V!52979)) )
))
(declare-datatypes ((List!30356 0))(
  ( (Nil!30353) (Cons!30352 (h!31561 tuple2!23200) (t!43992 List!30356)) )
))
(declare-datatypes ((ListLongMap!20857 0))(
  ( (ListLongMap!20858 (toList!10444 List!30356)) )
))
(declare-fun contains!8599 (ListLongMap!20857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5457 (array!88758 array!88760 (_ BitVec 32) (_ BitVec 32) V!52979 V!52979 (_ BitVec 32) Int) ListLongMap!20857)

(assert (=> b!1318744 (= res!875228 (contains!8599 (getCurrentListMap!5457 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318745 () Bool)

(declare-fun res!875221 () Bool)

(assert (=> b!1318745 (=> (not res!875221) (not e!752492))))

(declare-datatypes ((List!30357 0))(
  ( (Nil!30354) (Cons!30353 (h!31562 (_ BitVec 64)) (t!43993 List!30357)) )
))
(declare-fun arrayNoDuplicates!0 (array!88758 (_ BitVec 32) List!30357) Bool)

(assert (=> b!1318745 (= res!875221 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30354))))

(declare-fun b!1318746 () Bool)

(assert (=> b!1318746 (= e!752491 tp_is_empty!35907)))

(declare-fun b!1318747 () Bool)

(declare-fun res!875224 () Bool)

(assert (=> b!1318747 (=> (not res!875224) (not e!752492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88758 (_ BitVec 32)) Bool)

(assert (=> b!1318747 (= res!875224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318748 () Bool)

(assert (=> b!1318748 (= e!752492 (not true))))

(declare-fun lt!586520 () ListLongMap!20857)

(assert (=> b!1318748 (contains!8599 lt!586520 k0!1164)))

(declare-datatypes ((Unit!43430 0))(
  ( (Unit!43431) )
))
(declare-fun lt!586521 () Unit!43430)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!101 ((_ BitVec 64) (_ BitVec 64) V!52979 ListLongMap!20857) Unit!43430)

(assert (=> b!1318748 (= lt!586521 (lemmaInListMapAfterAddingDiffThenInBefore!101 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586520))))

(declare-fun +!4505 (ListLongMap!20857 tuple2!23200) ListLongMap!20857)

(declare-fun getCurrentListMapNoExtraKeys!6140 (array!88758 array!88760 (_ BitVec 32) (_ BitVec 32) V!52979 V!52979 (_ BitVec 32) Int) ListLongMap!20857)

(declare-fun get!21525 (ValueCell!17055 V!52979) V!52979)

(declare-fun dynLambda!3444 (Int (_ BitVec 64)) V!52979)

(assert (=> b!1318748 (= lt!586520 (+!4505 (+!4505 (getCurrentListMapNoExtraKeys!6140 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23201 (select (arr!42853 _keys!1609) from!2000) (get!21525 (select (arr!42854 _values!1337) from!2000) (dynLambda!3444 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318749 () Bool)

(declare-fun res!875227 () Bool)

(assert (=> b!1318749 (=> (not res!875227) (not e!752492))))

(assert (=> b!1318749 (= res!875227 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43403 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318750 () Bool)

(declare-fun res!875223 () Bool)

(assert (=> b!1318750 (=> (not res!875223) (not e!752492))))

(assert (=> b!1318750 (= res!875223 (and (= (size!43404 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43403 _keys!1609) (size!43404 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111430 res!875222) b!1318750))

(assert (= (and b!1318750 res!875223) b!1318747))

(assert (= (and b!1318747 res!875224) b!1318745))

(assert (= (and b!1318745 res!875221) b!1318749))

(assert (= (and b!1318749 res!875227) b!1318744))

(assert (= (and b!1318744 res!875228) b!1318740))

(assert (= (and b!1318740 res!875225) b!1318741))

(assert (= (and b!1318741 res!875226) b!1318748))

(assert (= (and b!1318743 condMapEmpty!55508) mapIsEmpty!55508))

(assert (= (and b!1318743 (not condMapEmpty!55508)) mapNonEmpty!55508))

(get-info :version)

(assert (= (and mapNonEmpty!55508 ((_ is ValueCellFull!17055) mapValue!55508)) b!1318742))

(assert (= (and b!1318743 ((_ is ValueCellFull!17055) mapDefault!55508)) b!1318746))

(assert (= start!111430 b!1318743))

(declare-fun b_lambda!23413 () Bool)

(assert (=> (not b_lambda!23413) (not b!1318748)))

(declare-fun t!43991 () Bool)

(declare-fun tb!11439 () Bool)

(assert (=> (and start!111430 (= defaultEntry!1340 defaultEntry!1340) t!43991) tb!11439))

(declare-fun result!23933 () Bool)

(assert (=> tb!11439 (= result!23933 tp_is_empty!35907)))

(assert (=> b!1318748 t!43991))

(declare-fun b_and!48335 () Bool)

(assert (= b_and!48333 (and (=> t!43991 result!23933) b_and!48335)))

(declare-fun m!1206315 () Bool)

(assert (=> mapNonEmpty!55508 m!1206315))

(declare-fun m!1206317 () Bool)

(assert (=> b!1318741 m!1206317))

(assert (=> b!1318741 m!1206317))

(declare-fun m!1206319 () Bool)

(assert (=> b!1318741 m!1206319))

(declare-fun m!1206321 () Bool)

(assert (=> b!1318744 m!1206321))

(assert (=> b!1318744 m!1206321))

(declare-fun m!1206323 () Bool)

(assert (=> b!1318744 m!1206323))

(declare-fun m!1206325 () Bool)

(assert (=> b!1318745 m!1206325))

(assert (=> b!1318740 m!1206317))

(declare-fun m!1206327 () Bool)

(assert (=> b!1318747 m!1206327))

(declare-fun m!1206329 () Bool)

(assert (=> b!1318748 m!1206329))

(declare-fun m!1206331 () Bool)

(assert (=> b!1318748 m!1206331))

(declare-fun m!1206333 () Bool)

(assert (=> b!1318748 m!1206333))

(declare-fun m!1206335 () Bool)

(assert (=> b!1318748 m!1206335))

(assert (=> b!1318748 m!1206331))

(declare-fun m!1206337 () Bool)

(assert (=> b!1318748 m!1206337))

(declare-fun m!1206339 () Bool)

(assert (=> b!1318748 m!1206339))

(assert (=> b!1318748 m!1206337))

(declare-fun m!1206341 () Bool)

(assert (=> b!1318748 m!1206341))

(assert (=> b!1318748 m!1206339))

(assert (=> b!1318748 m!1206335))

(declare-fun m!1206343 () Bool)

(assert (=> b!1318748 m!1206343))

(assert (=> b!1318748 m!1206317))

(declare-fun m!1206345 () Bool)

(assert (=> start!111430 m!1206345))

(declare-fun m!1206347 () Bool)

(assert (=> start!111430 m!1206347))

(declare-fun m!1206349 () Bool)

(assert (=> start!111430 m!1206349))

(check-sat (not b!1318744) (not b_lambda!23413) (not b!1318747) tp_is_empty!35907 b_and!48335 (not mapNonEmpty!55508) (not b!1318745) (not b!1318741) (not b!1318748) (not b_next!30087) (not start!111430))
(check-sat b_and!48335 (not b_next!30087))
