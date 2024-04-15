; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111644 () Bool)

(assert start!111644)

(declare-fun b_free!30301 () Bool)

(declare-fun b_next!30301 () Bool)

(assert (=> start!111644 (= b_free!30301 (not b_next!30301))))

(declare-fun tp!106380 () Bool)

(declare-fun b_and!48743 () Bool)

(assert (=> start!111644 (= tp!106380 b_and!48743)))

(declare-fun b!1322415 () Bool)

(declare-fun e!754066 () Bool)

(declare-fun tp_is_empty!36121 () Bool)

(assert (=> b!1322415 (= e!754066 tp_is_empty!36121)))

(declare-fun b!1322416 () Bool)

(declare-fun e!754064 () Bool)

(declare-fun e!754062 () Bool)

(declare-fun mapRes!55829 () Bool)

(assert (=> b!1322416 (= e!754064 (and e!754062 mapRes!55829))))

(declare-fun condMapEmpty!55829 () Bool)

(declare-datatypes ((V!53265 0))(
  ( (V!53266 (val!18135 Int)) )
))
(declare-datatypes ((ValueCell!17162 0))(
  ( (ValueCellFull!17162 (v!20764 V!53265)) (EmptyCell!17162) )
))
(declare-datatypes ((array!89095 0))(
  ( (array!89096 (arr!43022 (Array (_ BitVec 32) ValueCell!17162)) (size!43574 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89095)

(declare-fun mapDefault!55829 () ValueCell!17162)

(assert (=> b!1322416 (= condMapEmpty!55829 (= (arr!43022 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17162)) mapDefault!55829)))))

(declare-fun mapNonEmpty!55829 () Bool)

(declare-fun tp!106379 () Bool)

(assert (=> mapNonEmpty!55829 (= mapRes!55829 (and tp!106379 e!754066))))

(declare-fun mapValue!55829 () ValueCell!17162)

(declare-fun mapRest!55829 () (Array (_ BitVec 32) ValueCell!17162))

(declare-fun mapKey!55829 () (_ BitVec 32))

(assert (=> mapNonEmpty!55829 (= (arr!43022 _values!1337) (store mapRest!55829 mapKey!55829 mapValue!55829))))

(declare-fun b!1322417 () Bool)

(declare-fun e!754063 () Bool)

(assert (=> b!1322417 (= e!754063 (not true))))

(declare-datatypes ((tuple2!23444 0))(
  ( (tuple2!23445 (_1!11733 (_ BitVec 64)) (_2!11733 V!53265)) )
))
(declare-datatypes ((List!30578 0))(
  ( (Nil!30575) (Cons!30574 (h!31783 tuple2!23444) (t!44420 List!30578)) )
))
(declare-datatypes ((ListLongMap!21101 0))(
  ( (ListLongMap!21102 (toList!10566 List!30578)) )
))
(declare-fun lt!588017 () ListLongMap!21101)

(declare-fun lt!588016 () tuple2!23444)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8649 (ListLongMap!21101 (_ BitVec 64)) Bool)

(declare-fun +!4606 (ListLongMap!21101 tuple2!23444) ListLongMap!21101)

(assert (=> b!1322417 (contains!8649 (+!4606 lt!588017 lt!588016) k0!1164)))

(declare-fun zeroValue!1279 () V!53265)

(declare-datatypes ((Unit!43395 0))(
  ( (Unit!43396) )
))
(declare-fun lt!588019 () Unit!43395)

(declare-fun addStillContains!1130 (ListLongMap!21101 (_ BitVec 64) V!53265 (_ BitVec 64)) Unit!43395)

(assert (=> b!1322417 (= lt!588019 (addStillContains!1130 lt!588017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322417 (contains!8649 lt!588017 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588018 () Unit!43395)

(declare-fun lt!588023 () V!53265)

(declare-datatypes ((array!89097 0))(
  ( (array!89098 (arr!43023 (Array (_ BitVec 32) (_ BitVec 64))) (size!43575 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89097)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!171 ((_ BitVec 64) (_ BitVec 64) V!53265 ListLongMap!21101) Unit!43395)

(assert (=> b!1322417 (= lt!588018 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 (select (arr!43023 _keys!1609) from!2000) lt!588023 lt!588017))))

(declare-fun lt!588024 () ListLongMap!21101)

(assert (=> b!1322417 (contains!8649 lt!588024 k0!1164)))

(declare-fun lt!588021 () Unit!43395)

(assert (=> b!1322417 (= lt!588021 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588024))))

(declare-fun lt!588020 () ListLongMap!21101)

(assert (=> b!1322417 (contains!8649 lt!588020 k0!1164)))

(declare-fun lt!588022 () Unit!43395)

(declare-fun minValue!1279 () V!53265)

(assert (=> b!1322417 (= lt!588022 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588020))))

(assert (=> b!1322417 (= lt!588020 (+!4606 lt!588024 lt!588016))))

(assert (=> b!1322417 (= lt!588016 (tuple2!23445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322417 (= lt!588024 (+!4606 lt!588017 (tuple2!23445 (select (arr!43023 _keys!1609) from!2000) lt!588023)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21665 (ValueCell!17162 V!53265) V!53265)

(declare-fun dynLambda!3536 (Int (_ BitVec 64)) V!53265)

(assert (=> b!1322417 (= lt!588023 (get!21665 (select (arr!43022 _values!1337) from!2000) (dynLambda!3536 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6239 (array!89097 array!89095 (_ BitVec 32) (_ BitVec 32) V!53265 V!53265 (_ BitVec 32) Int) ListLongMap!21101)

(assert (=> b!1322417 (= lt!588017 (getCurrentListMapNoExtraKeys!6239 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!877764 () Bool)

(assert (=> start!111644 (=> (not res!877764) (not e!754063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111644 (= res!877764 (validMask!0 mask!2019))))

(assert (=> start!111644 e!754063))

(declare-fun array_inv!32665 (array!89097) Bool)

(assert (=> start!111644 (array_inv!32665 _keys!1609)))

(assert (=> start!111644 true))

(assert (=> start!111644 tp_is_empty!36121))

(declare-fun array_inv!32666 (array!89095) Bool)

(assert (=> start!111644 (and (array_inv!32666 _values!1337) e!754064)))

(assert (=> start!111644 tp!106380))

(declare-fun b!1322418 () Bool)

(declare-fun res!877767 () Bool)

(assert (=> b!1322418 (=> (not res!877767) (not e!754063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322418 (= res!877767 (validKeyInArray!0 (select (arr!43023 _keys!1609) from!2000)))))

(declare-fun b!1322419 () Bool)

(declare-fun res!877762 () Bool)

(assert (=> b!1322419 (=> (not res!877762) (not e!754063))))

(assert (=> b!1322419 (= res!877762 (not (= (select (arr!43023 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322420 () Bool)

(declare-fun res!877761 () Bool)

(assert (=> b!1322420 (=> (not res!877761) (not e!754063))))

(assert (=> b!1322420 (= res!877761 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43575 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55829 () Bool)

(assert (=> mapIsEmpty!55829 mapRes!55829))

(declare-fun b!1322421 () Bool)

(declare-fun res!877760 () Bool)

(assert (=> b!1322421 (=> (not res!877760) (not e!754063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89097 (_ BitVec 32)) Bool)

(assert (=> b!1322421 (= res!877760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322422 () Bool)

(declare-fun res!877763 () Bool)

(assert (=> b!1322422 (=> (not res!877763) (not e!754063))))

(declare-datatypes ((List!30579 0))(
  ( (Nil!30576) (Cons!30575 (h!31784 (_ BitVec 64)) (t!44421 List!30579)) )
))
(declare-fun arrayNoDuplicates!0 (array!89097 (_ BitVec 32) List!30579) Bool)

(assert (=> b!1322422 (= res!877763 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30576))))

(declare-fun b!1322423 () Bool)

(declare-fun res!877766 () Bool)

(assert (=> b!1322423 (=> (not res!877766) (not e!754063))))

(declare-fun getCurrentListMap!5449 (array!89097 array!89095 (_ BitVec 32) (_ BitVec 32) V!53265 V!53265 (_ BitVec 32) Int) ListLongMap!21101)

(assert (=> b!1322423 (= res!877766 (contains!8649 (getCurrentListMap!5449 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322424 () Bool)

(assert (=> b!1322424 (= e!754062 tp_is_empty!36121)))

(declare-fun b!1322425 () Bool)

(declare-fun res!877765 () Bool)

(assert (=> b!1322425 (=> (not res!877765) (not e!754063))))

(assert (=> b!1322425 (= res!877765 (and (= (size!43574 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43575 _keys!1609) (size!43574 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111644 res!877764) b!1322425))

(assert (= (and b!1322425 res!877765) b!1322421))

(assert (= (and b!1322421 res!877760) b!1322422))

(assert (= (and b!1322422 res!877763) b!1322420))

(assert (= (and b!1322420 res!877761) b!1322423))

(assert (= (and b!1322423 res!877766) b!1322419))

(assert (= (and b!1322419 res!877762) b!1322418))

(assert (= (and b!1322418 res!877767) b!1322417))

(assert (= (and b!1322416 condMapEmpty!55829) mapIsEmpty!55829))

(assert (= (and b!1322416 (not condMapEmpty!55829)) mapNonEmpty!55829))

(get-info :version)

(assert (= (and mapNonEmpty!55829 ((_ is ValueCellFull!17162) mapValue!55829)) b!1322415))

(assert (= (and b!1322416 ((_ is ValueCellFull!17162) mapDefault!55829)) b!1322424))

(assert (= start!111644 b!1322416))

(declare-fun b_lambda!23617 () Bool)

(assert (=> (not b_lambda!23617) (not b!1322417)))

(declare-fun t!44419 () Bool)

(declare-fun tb!11645 () Bool)

(assert (=> (and start!111644 (= defaultEntry!1340 defaultEntry!1340) t!44419) tb!11645))

(declare-fun result!24353 () Bool)

(assert (=> tb!11645 (= result!24353 tp_is_empty!36121)))

(assert (=> b!1322417 t!44419))

(declare-fun b_and!48745 () Bool)

(assert (= b_and!48743 (and (=> t!44419 result!24353) b_and!48745)))

(declare-fun m!1210275 () Bool)

(assert (=> start!111644 m!1210275))

(declare-fun m!1210277 () Bool)

(assert (=> start!111644 m!1210277))

(declare-fun m!1210279 () Bool)

(assert (=> start!111644 m!1210279))

(declare-fun m!1210281 () Bool)

(assert (=> b!1322421 m!1210281))

(declare-fun m!1210283 () Bool)

(assert (=> b!1322418 m!1210283))

(assert (=> b!1322418 m!1210283))

(declare-fun m!1210285 () Bool)

(assert (=> b!1322418 m!1210285))

(declare-fun m!1210287 () Bool)

(assert (=> b!1322417 m!1210287))

(declare-fun m!1210289 () Bool)

(assert (=> b!1322417 m!1210289))

(declare-fun m!1210291 () Bool)

(assert (=> b!1322417 m!1210291))

(declare-fun m!1210293 () Bool)

(assert (=> b!1322417 m!1210293))

(declare-fun m!1210295 () Bool)

(assert (=> b!1322417 m!1210295))

(declare-fun m!1210297 () Bool)

(assert (=> b!1322417 m!1210297))

(declare-fun m!1210299 () Bool)

(assert (=> b!1322417 m!1210299))

(declare-fun m!1210301 () Bool)

(assert (=> b!1322417 m!1210301))

(assert (=> b!1322417 m!1210301))

(assert (=> b!1322417 m!1210293))

(declare-fun m!1210303 () Bool)

(assert (=> b!1322417 m!1210303))

(assert (=> b!1322417 m!1210283))

(declare-fun m!1210305 () Bool)

(assert (=> b!1322417 m!1210305))

(assert (=> b!1322417 m!1210283))

(declare-fun m!1210307 () Bool)

(assert (=> b!1322417 m!1210307))

(declare-fun m!1210309 () Bool)

(assert (=> b!1322417 m!1210309))

(declare-fun m!1210311 () Bool)

(assert (=> b!1322417 m!1210311))

(declare-fun m!1210313 () Bool)

(assert (=> b!1322417 m!1210313))

(assert (=> b!1322417 m!1210309))

(declare-fun m!1210315 () Bool)

(assert (=> b!1322417 m!1210315))

(declare-fun m!1210317 () Bool)

(assert (=> mapNonEmpty!55829 m!1210317))

(declare-fun m!1210319 () Bool)

(assert (=> b!1322422 m!1210319))

(assert (=> b!1322419 m!1210283))

(declare-fun m!1210321 () Bool)

(assert (=> b!1322423 m!1210321))

(assert (=> b!1322423 m!1210321))

(declare-fun m!1210323 () Bool)

(assert (=> b!1322423 m!1210323))

(check-sat (not b_lambda!23617) (not b!1322417) (not start!111644) (not mapNonEmpty!55829) tp_is_empty!36121 (not b!1322421) (not b!1322423) (not b!1322418) b_and!48745 (not b_next!30301) (not b!1322422))
(check-sat b_and!48745 (not b_next!30301))
