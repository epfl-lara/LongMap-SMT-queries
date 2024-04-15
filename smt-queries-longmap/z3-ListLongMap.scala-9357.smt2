; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111578 () Bool)

(assert start!111578)

(declare-fun b_free!30235 () Bool)

(declare-fun b_next!30235 () Bool)

(assert (=> start!111578 (= b_free!30235 (not b_next!30235))))

(declare-fun tp!106181 () Bool)

(declare-fun b_and!48611 () Bool)

(assert (=> start!111578 (= tp!106181 b_and!48611)))

(declare-fun b!1321260 () Bool)

(declare-fun e!753570 () Bool)

(declare-fun e!753569 () Bool)

(declare-fun mapRes!55730 () Bool)

(assert (=> b!1321260 (= e!753570 (and e!753569 mapRes!55730))))

(declare-fun condMapEmpty!55730 () Bool)

(declare-datatypes ((V!53177 0))(
  ( (V!53178 (val!18102 Int)) )
))
(declare-datatypes ((ValueCell!17129 0))(
  ( (ValueCellFull!17129 (v!20731 V!53177)) (EmptyCell!17129) )
))
(declare-datatypes ((array!88963 0))(
  ( (array!88964 (arr!42956 (Array (_ BitVec 32) ValueCell!17129)) (size!43508 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88963)

(declare-fun mapDefault!55730 () ValueCell!17129)

(assert (=> b!1321260 (= condMapEmpty!55730 (= (arr!42956 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17129)) mapDefault!55730)))))

(declare-fun mapNonEmpty!55730 () Bool)

(declare-fun tp!106182 () Bool)

(declare-fun e!753571 () Bool)

(assert (=> mapNonEmpty!55730 (= mapRes!55730 (and tp!106182 e!753571))))

(declare-fun mapRest!55730 () (Array (_ BitVec 32) ValueCell!17129))

(declare-fun mapKey!55730 () (_ BitVec 32))

(declare-fun mapValue!55730 () ValueCell!17129)

(assert (=> mapNonEmpty!55730 (= (arr!42956 _values!1337) (store mapRest!55730 mapKey!55730 mapValue!55730))))

(declare-fun b!1321261 () Bool)

(declare-fun tp_is_empty!36055 () Bool)

(assert (=> b!1321261 (= e!753569 tp_is_empty!36055)))

(declare-fun b!1321262 () Bool)

(declare-fun e!753568 () Bool)

(assert (=> b!1321262 (= e!753568 (not true))))

(declare-datatypes ((tuple2!23394 0))(
  ( (tuple2!23395 (_1!11708 (_ BitVec 64)) (_2!11708 V!53177)) )
))
(declare-datatypes ((List!30527 0))(
  ( (Nil!30524) (Cons!30523 (h!31732 tuple2!23394) (t!44303 List!30527)) )
))
(declare-datatypes ((ListLongMap!21051 0))(
  ( (ListLongMap!21052 (toList!10541 List!30527)) )
))
(declare-fun lt!587217 () ListLongMap!21051)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8624 (ListLongMap!21051 (_ BitVec 64)) Bool)

(assert (=> b!1321262 (contains!8624 lt!587217 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43351 0))(
  ( (Unit!43352) )
))
(declare-fun lt!587213 () Unit!43351)

(declare-fun lt!587212 () V!53177)

(declare-datatypes ((array!88965 0))(
  ( (array!88966 (arr!42957 (Array (_ BitVec 32) (_ BitVec 64))) (size!43509 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88965)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!149 ((_ BitVec 64) (_ BitVec 64) V!53177 ListLongMap!21051) Unit!43351)

(assert (=> b!1321262 (= lt!587213 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 (select (arr!42957 _keys!1609) from!2000) lt!587212 lt!587217))))

(declare-fun lt!587214 () ListLongMap!21051)

(assert (=> b!1321262 (contains!8624 lt!587214 k0!1164)))

(declare-fun zeroValue!1279 () V!53177)

(declare-fun lt!587215 () Unit!43351)

(assert (=> b!1321262 (= lt!587215 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587214))))

(declare-fun lt!587216 () ListLongMap!21051)

(assert (=> b!1321262 (contains!8624 lt!587216 k0!1164)))

(declare-fun lt!587211 () Unit!43351)

(declare-fun minValue!1279 () V!53177)

(assert (=> b!1321262 (= lt!587211 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587216))))

(declare-fun +!4584 (ListLongMap!21051 tuple2!23394) ListLongMap!21051)

(assert (=> b!1321262 (= lt!587216 (+!4584 lt!587214 (tuple2!23395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321262 (= lt!587214 (+!4584 lt!587217 (tuple2!23395 (select (arr!42957 _keys!1609) from!2000) lt!587212)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21621 (ValueCell!17129 V!53177) V!53177)

(declare-fun dynLambda!3514 (Int (_ BitVec 64)) V!53177)

(assert (=> b!1321262 (= lt!587212 (get!21621 (select (arr!42956 _values!1337) from!2000) (dynLambda!3514 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6217 (array!88965 array!88963 (_ BitVec 32) (_ BitVec 32) V!53177 V!53177 (_ BitVec 32) Int) ListLongMap!21051)

(assert (=> b!1321262 (= lt!587217 (getCurrentListMapNoExtraKeys!6217 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321263 () Bool)

(declare-fun res!876973 () Bool)

(assert (=> b!1321263 (=> (not res!876973) (not e!753568))))

(assert (=> b!1321263 (= res!876973 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43509 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321264 () Bool)

(declare-fun res!876975 () Bool)

(assert (=> b!1321264 (=> (not res!876975) (not e!753568))))

(declare-datatypes ((List!30528 0))(
  ( (Nil!30525) (Cons!30524 (h!31733 (_ BitVec 64)) (t!44304 List!30528)) )
))
(declare-fun arrayNoDuplicates!0 (array!88965 (_ BitVec 32) List!30528) Bool)

(assert (=> b!1321264 (= res!876975 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30525))))

(declare-fun mapIsEmpty!55730 () Bool)

(assert (=> mapIsEmpty!55730 mapRes!55730))

(declare-fun b!1321265 () Bool)

(declare-fun res!876968 () Bool)

(assert (=> b!1321265 (=> (not res!876968) (not e!753568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88965 (_ BitVec 32)) Bool)

(assert (=> b!1321265 (= res!876968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321266 () Bool)

(declare-fun res!876974 () Bool)

(assert (=> b!1321266 (=> (not res!876974) (not e!753568))))

(declare-fun getCurrentListMap!5426 (array!88965 array!88963 (_ BitVec 32) (_ BitVec 32) V!53177 V!53177 (_ BitVec 32) Int) ListLongMap!21051)

(assert (=> b!1321266 (= res!876974 (contains!8624 (getCurrentListMap!5426 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321268 () Bool)

(declare-fun res!876969 () Bool)

(assert (=> b!1321268 (=> (not res!876969) (not e!753568))))

(assert (=> b!1321268 (= res!876969 (not (= (select (arr!42957 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321269 () Bool)

(assert (=> b!1321269 (= e!753571 tp_is_empty!36055)))

(declare-fun b!1321270 () Bool)

(declare-fun res!876972 () Bool)

(assert (=> b!1321270 (=> (not res!876972) (not e!753568))))

(assert (=> b!1321270 (= res!876972 (and (= (size!43508 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43509 _keys!1609) (size!43508 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321267 () Bool)

(declare-fun res!876971 () Bool)

(assert (=> b!1321267 (=> (not res!876971) (not e!753568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321267 (= res!876971 (validKeyInArray!0 (select (arr!42957 _keys!1609) from!2000)))))

(declare-fun res!876970 () Bool)

(assert (=> start!111578 (=> (not res!876970) (not e!753568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111578 (= res!876970 (validMask!0 mask!2019))))

(assert (=> start!111578 e!753568))

(declare-fun array_inv!32617 (array!88965) Bool)

(assert (=> start!111578 (array_inv!32617 _keys!1609)))

(assert (=> start!111578 true))

(assert (=> start!111578 tp_is_empty!36055))

(declare-fun array_inv!32618 (array!88963) Bool)

(assert (=> start!111578 (and (array_inv!32618 _values!1337) e!753570)))

(assert (=> start!111578 tp!106181))

(assert (= (and start!111578 res!876970) b!1321270))

(assert (= (and b!1321270 res!876972) b!1321265))

(assert (= (and b!1321265 res!876968) b!1321264))

(assert (= (and b!1321264 res!876975) b!1321263))

(assert (= (and b!1321263 res!876973) b!1321266))

(assert (= (and b!1321266 res!876974) b!1321268))

(assert (= (and b!1321268 res!876969) b!1321267))

(assert (= (and b!1321267 res!876971) b!1321262))

(assert (= (and b!1321260 condMapEmpty!55730) mapIsEmpty!55730))

(assert (= (and b!1321260 (not condMapEmpty!55730)) mapNonEmpty!55730))

(get-info :version)

(assert (= (and mapNonEmpty!55730 ((_ is ValueCellFull!17129) mapValue!55730)) b!1321269))

(assert (= (and b!1321260 ((_ is ValueCellFull!17129) mapDefault!55730)) b!1321261))

(assert (= start!111578 b!1321260))

(declare-fun b_lambda!23551 () Bool)

(assert (=> (not b_lambda!23551) (not b!1321262)))

(declare-fun t!44302 () Bool)

(declare-fun tb!11579 () Bool)

(assert (=> (and start!111578 (= defaultEntry!1340 defaultEntry!1340) t!44302) tb!11579))

(declare-fun result!24221 () Bool)

(assert (=> tb!11579 (= result!24221 tp_is_empty!36055)))

(assert (=> b!1321262 t!44302))

(declare-fun b_and!48613 () Bool)

(assert (= b_and!48611 (and (=> t!44302 result!24221) b_and!48613)))

(declare-fun m!1208715 () Bool)

(assert (=> b!1321268 m!1208715))

(declare-fun m!1208717 () Bool)

(assert (=> b!1321262 m!1208717))

(declare-fun m!1208719 () Bool)

(assert (=> b!1321262 m!1208719))

(declare-fun m!1208721 () Bool)

(assert (=> b!1321262 m!1208721))

(declare-fun m!1208723 () Bool)

(assert (=> b!1321262 m!1208723))

(assert (=> b!1321262 m!1208715))

(declare-fun m!1208725 () Bool)

(assert (=> b!1321262 m!1208725))

(declare-fun m!1208727 () Bool)

(assert (=> b!1321262 m!1208727))

(declare-fun m!1208729 () Bool)

(assert (=> b!1321262 m!1208729))

(assert (=> b!1321262 m!1208729))

(declare-fun m!1208731 () Bool)

(assert (=> b!1321262 m!1208731))

(declare-fun m!1208733 () Bool)

(assert (=> b!1321262 m!1208733))

(assert (=> b!1321262 m!1208715))

(assert (=> b!1321262 m!1208731))

(declare-fun m!1208735 () Bool)

(assert (=> b!1321262 m!1208735))

(declare-fun m!1208737 () Bool)

(assert (=> b!1321262 m!1208737))

(declare-fun m!1208739 () Bool)

(assert (=> b!1321262 m!1208739))

(declare-fun m!1208741 () Bool)

(assert (=> b!1321266 m!1208741))

(assert (=> b!1321266 m!1208741))

(declare-fun m!1208743 () Bool)

(assert (=> b!1321266 m!1208743))

(declare-fun m!1208745 () Bool)

(assert (=> b!1321265 m!1208745))

(declare-fun m!1208747 () Bool)

(assert (=> b!1321264 m!1208747))

(assert (=> b!1321267 m!1208715))

(assert (=> b!1321267 m!1208715))

(declare-fun m!1208749 () Bool)

(assert (=> b!1321267 m!1208749))

(declare-fun m!1208751 () Bool)

(assert (=> mapNonEmpty!55730 m!1208751))

(declare-fun m!1208753 () Bool)

(assert (=> start!111578 m!1208753))

(declare-fun m!1208755 () Bool)

(assert (=> start!111578 m!1208755))

(declare-fun m!1208757 () Bool)

(assert (=> start!111578 m!1208757))

(check-sat (not b_lambda!23551) (not start!111578) (not b!1321262) (not b_next!30235) (not mapNonEmpty!55730) tp_is_empty!36055 b_and!48613 (not b!1321267) (not b!1321266) (not b!1321265) (not b!1321264))
(check-sat b_and!48613 (not b_next!30235))
