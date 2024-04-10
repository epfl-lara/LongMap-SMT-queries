; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111640 () Bool)

(assert start!111640)

(declare-fun b_free!30297 () Bool)

(declare-fun b_next!30297 () Bool)

(assert (=> start!111640 (= b_free!30297 (not b_next!30297))))

(declare-fun tp!106366 () Bool)

(declare-fun b_and!48753 () Bool)

(assert (=> start!111640 (= tp!106366 b_and!48753)))

(declare-fun b!1322415 () Bool)

(declare-fun res!877741 () Bool)

(declare-fun e!754069 () Bool)

(assert (=> b!1322415 (=> (not res!877741) (not e!754069))))

(declare-datatypes ((array!89156 0))(
  ( (array!89157 (arr!43052 (Array (_ BitVec 32) (_ BitVec 64))) (size!43602 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89156)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53259 0))(
  ( (V!53260 (val!18133 Int)) )
))
(declare-fun zeroValue!1279 () V!53259)

(declare-fun minValue!1279 () V!53259)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17160 0))(
  ( (ValueCellFull!17160 (v!20763 V!53259)) (EmptyCell!17160) )
))
(declare-datatypes ((array!89158 0))(
  ( (array!89159 (arr!43053 (Array (_ BitVec 32) ValueCell!17160)) (size!43603 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89158)

(declare-datatypes ((tuple2!23362 0))(
  ( (tuple2!23363 (_1!11692 (_ BitVec 64)) (_2!11692 V!53259)) )
))
(declare-datatypes ((List!30509 0))(
  ( (Nil!30506) (Cons!30505 (h!31714 tuple2!23362) (t!44355 List!30509)) )
))
(declare-datatypes ((ListLongMap!21019 0))(
  ( (ListLongMap!21020 (toList!10525 List!30509)) )
))
(declare-fun contains!8680 (ListLongMap!21019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5526 (array!89156 array!89158 (_ BitVec 32) (_ BitVec 32) V!53259 V!53259 (_ BitVec 32) Int) ListLongMap!21019)

(assert (=> b!1322415 (= res!877741 (contains!8680 (getCurrentListMap!5526 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322416 () Bool)

(declare-fun e!754066 () Bool)

(declare-fun e!754068 () Bool)

(declare-fun mapRes!55823 () Bool)

(assert (=> b!1322416 (= e!754066 (and e!754068 mapRes!55823))))

(declare-fun condMapEmpty!55823 () Bool)

(declare-fun mapDefault!55823 () ValueCell!17160)

(assert (=> b!1322416 (= condMapEmpty!55823 (= (arr!43053 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17160)) mapDefault!55823)))))

(declare-fun mapIsEmpty!55823 () Bool)

(assert (=> mapIsEmpty!55823 mapRes!55823))

(declare-fun mapNonEmpty!55823 () Bool)

(declare-fun tp!106367 () Bool)

(declare-fun e!754067 () Bool)

(assert (=> mapNonEmpty!55823 (= mapRes!55823 (and tp!106367 e!754067))))

(declare-fun mapRest!55823 () (Array (_ BitVec 32) ValueCell!17160))

(declare-fun mapKey!55823 () (_ BitVec 32))

(declare-fun mapValue!55823 () ValueCell!17160)

(assert (=> mapNonEmpty!55823 (= (arr!43053 _values!1337) (store mapRest!55823 mapKey!55823 mapValue!55823))))

(declare-fun b!1322417 () Bool)

(declare-fun res!877742 () Bool)

(assert (=> b!1322417 (=> (not res!877742) (not e!754069))))

(assert (=> b!1322417 (= res!877742 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43602 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!877745 () Bool)

(assert (=> start!111640 (=> (not res!877745) (not e!754069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111640 (= res!877745 (validMask!0 mask!2019))))

(assert (=> start!111640 e!754069))

(declare-fun array_inv!32505 (array!89156) Bool)

(assert (=> start!111640 (array_inv!32505 _keys!1609)))

(assert (=> start!111640 true))

(declare-fun tp_is_empty!36117 () Bool)

(assert (=> start!111640 tp_is_empty!36117))

(declare-fun array_inv!32506 (array!89158) Bool)

(assert (=> start!111640 (and (array_inv!32506 _values!1337) e!754066)))

(assert (=> start!111640 tp!106366))

(declare-fun b!1322418 () Bool)

(assert (=> b!1322418 (= e!754067 tp_is_empty!36117)))

(declare-fun b!1322419 () Bool)

(declare-fun res!877746 () Bool)

(assert (=> b!1322419 (=> (not res!877746) (not e!754069))))

(declare-datatypes ((List!30510 0))(
  ( (Nil!30507) (Cons!30506 (h!31715 (_ BitVec 64)) (t!44356 List!30510)) )
))
(declare-fun arrayNoDuplicates!0 (array!89156 (_ BitVec 32) List!30510) Bool)

(assert (=> b!1322419 (= res!877746 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30507))))

(declare-fun b!1322420 () Bool)

(declare-fun res!877744 () Bool)

(assert (=> b!1322420 (=> (not res!877744) (not e!754069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89156 (_ BitVec 32)) Bool)

(assert (=> b!1322420 (= res!877744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322421 () Bool)

(declare-fun res!877747 () Bool)

(assert (=> b!1322421 (=> (not res!877747) (not e!754069))))

(assert (=> b!1322421 (= res!877747 (and (= (size!43603 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43602 _keys!1609) (size!43603 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322422 () Bool)

(assert (=> b!1322422 (= e!754068 tp_is_empty!36117)))

(declare-fun b!1322423 () Bool)

(declare-fun res!877748 () Bool)

(assert (=> b!1322423 (=> (not res!877748) (not e!754069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322423 (= res!877748 (validKeyInArray!0 (select (arr!43052 _keys!1609) from!2000)))))

(declare-fun b!1322424 () Bool)

(assert (=> b!1322424 (= e!754069 (not true))))

(declare-fun lt!588149 () ListLongMap!21019)

(declare-fun lt!588151 () tuple2!23362)

(declare-fun +!4579 (ListLongMap!21019 tuple2!23362) ListLongMap!21019)

(assert (=> b!1322424 (contains!8680 (+!4579 lt!588149 lt!588151) k0!1164)))

(declare-datatypes ((Unit!43578 0))(
  ( (Unit!43579) )
))
(declare-fun lt!588148 () Unit!43578)

(declare-fun addStillContains!1128 (ListLongMap!21019 (_ BitVec 64) V!53259 (_ BitVec 64)) Unit!43578)

(assert (=> b!1322424 (= lt!588148 (addStillContains!1128 lt!588149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322424 (contains!8680 lt!588149 k0!1164)))

(declare-fun lt!588154 () Unit!43578)

(declare-fun lt!588155 () V!53259)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!175 ((_ BitVec 64) (_ BitVec 64) V!53259 ListLongMap!21019) Unit!43578)

(assert (=> b!1322424 (= lt!588154 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 (select (arr!43052 _keys!1609) from!2000) lt!588155 lt!588149))))

(declare-fun lt!588150 () ListLongMap!21019)

(assert (=> b!1322424 (contains!8680 lt!588150 k0!1164)))

(declare-fun lt!588156 () Unit!43578)

(assert (=> b!1322424 (= lt!588156 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588150))))

(declare-fun lt!588153 () ListLongMap!21019)

(assert (=> b!1322424 (contains!8680 lt!588153 k0!1164)))

(declare-fun lt!588152 () Unit!43578)

(assert (=> b!1322424 (= lt!588152 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588153))))

(assert (=> b!1322424 (= lt!588153 (+!4579 lt!588150 lt!588151))))

(assert (=> b!1322424 (= lt!588151 (tuple2!23363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322424 (= lt!588150 (+!4579 lt!588149 (tuple2!23363 (select (arr!43052 _keys!1609) from!2000) lt!588155)))))

(declare-fun get!21669 (ValueCell!17160 V!53259) V!53259)

(declare-fun dynLambda!3518 (Int (_ BitVec 64)) V!53259)

(assert (=> b!1322424 (= lt!588155 (get!21669 (select (arr!43053 _values!1337) from!2000) (dynLambda!3518 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6214 (array!89156 array!89158 (_ BitVec 32) (_ BitVec 32) V!53259 V!53259 (_ BitVec 32) Int) ListLongMap!21019)

(assert (=> b!1322424 (= lt!588149 (getCurrentListMapNoExtraKeys!6214 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322425 () Bool)

(declare-fun res!877743 () Bool)

(assert (=> b!1322425 (=> (not res!877743) (not e!754069))))

(assert (=> b!1322425 (= res!877743 (not (= (select (arr!43052 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111640 res!877745) b!1322421))

(assert (= (and b!1322421 res!877747) b!1322420))

(assert (= (and b!1322420 res!877744) b!1322419))

(assert (= (and b!1322419 res!877746) b!1322417))

(assert (= (and b!1322417 res!877742) b!1322415))

(assert (= (and b!1322415 res!877741) b!1322425))

(assert (= (and b!1322425 res!877743) b!1322423))

(assert (= (and b!1322423 res!877748) b!1322424))

(assert (= (and b!1322416 condMapEmpty!55823) mapIsEmpty!55823))

(assert (= (and b!1322416 (not condMapEmpty!55823)) mapNonEmpty!55823))

(get-info :version)

(assert (= (and mapNonEmpty!55823 ((_ is ValueCellFull!17160) mapValue!55823)) b!1322418))

(assert (= (and b!1322416 ((_ is ValueCellFull!17160) mapDefault!55823)) b!1322422))

(assert (= start!111640 b!1322416))

(declare-fun b_lambda!23623 () Bool)

(assert (=> (not b_lambda!23623) (not b!1322424)))

(declare-fun t!44354 () Bool)

(declare-fun tb!11649 () Bool)

(assert (=> (and start!111640 (= defaultEntry!1340 defaultEntry!1340) t!44354) tb!11649))

(declare-fun result!24353 () Bool)

(assert (=> tb!11649 (= result!24353 tp_is_empty!36117)))

(assert (=> b!1322424 t!44354))

(declare-fun b_and!48755 () Bool)

(assert (= b_and!48753 (and (=> t!44354 result!24353) b_and!48755)))

(declare-fun m!1210691 () Bool)

(assert (=> start!111640 m!1210691))

(declare-fun m!1210693 () Bool)

(assert (=> start!111640 m!1210693))

(declare-fun m!1210695 () Bool)

(assert (=> start!111640 m!1210695))

(declare-fun m!1210697 () Bool)

(assert (=> mapNonEmpty!55823 m!1210697))

(declare-fun m!1210699 () Bool)

(assert (=> b!1322419 m!1210699))

(declare-fun m!1210701 () Bool)

(assert (=> b!1322415 m!1210701))

(assert (=> b!1322415 m!1210701))

(declare-fun m!1210703 () Bool)

(assert (=> b!1322415 m!1210703))

(declare-fun m!1210705 () Bool)

(assert (=> b!1322423 m!1210705))

(assert (=> b!1322423 m!1210705))

(declare-fun m!1210707 () Bool)

(assert (=> b!1322423 m!1210707))

(assert (=> b!1322424 m!1210705))

(declare-fun m!1210709 () Bool)

(assert (=> b!1322424 m!1210709))

(declare-fun m!1210711 () Bool)

(assert (=> b!1322424 m!1210711))

(declare-fun m!1210713 () Bool)

(assert (=> b!1322424 m!1210713))

(declare-fun m!1210715 () Bool)

(assert (=> b!1322424 m!1210715))

(declare-fun m!1210717 () Bool)

(assert (=> b!1322424 m!1210717))

(declare-fun m!1210719 () Bool)

(assert (=> b!1322424 m!1210719))

(declare-fun m!1210721 () Bool)

(assert (=> b!1322424 m!1210721))

(declare-fun m!1210723 () Bool)

(assert (=> b!1322424 m!1210723))

(declare-fun m!1210725 () Bool)

(assert (=> b!1322424 m!1210725))

(assert (=> b!1322424 m!1210723))

(declare-fun m!1210727 () Bool)

(assert (=> b!1322424 m!1210727))

(declare-fun m!1210729 () Bool)

(assert (=> b!1322424 m!1210729))

(assert (=> b!1322424 m!1210727))

(declare-fun m!1210731 () Bool)

(assert (=> b!1322424 m!1210731))

(declare-fun m!1210733 () Bool)

(assert (=> b!1322424 m!1210733))

(declare-fun m!1210735 () Bool)

(assert (=> b!1322424 m!1210735))

(assert (=> b!1322424 m!1210719))

(declare-fun m!1210737 () Bool)

(assert (=> b!1322424 m!1210737))

(assert (=> b!1322424 m!1210705))

(declare-fun m!1210739 () Bool)

(assert (=> b!1322420 m!1210739))

(assert (=> b!1322425 m!1210705))

(check-sat (not b!1322424) (not b_lambda!23623) (not b!1322415) tp_is_empty!36117 (not b!1322420) (not b_next!30297) b_and!48755 (not start!111640) (not b!1322419) (not mapNonEmpty!55823) (not b!1322423))
(check-sat b_and!48755 (not b_next!30297))
