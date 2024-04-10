; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111604 () Bool)

(assert start!111604)

(declare-fun b_free!30261 () Bool)

(declare-fun b_next!30261 () Bool)

(assert (=> start!111604 (= b_free!30261 (not b_next!30261))))

(declare-fun tp!106258 () Bool)

(declare-fun b_and!48681 () Bool)

(assert (=> start!111604 (= tp!106258 b_and!48681)))

(declare-fun b!1321785 () Bool)

(declare-fun res!877313 () Bool)

(declare-fun e!753799 () Bool)

(assert (=> b!1321785 (=> (not res!877313) (not e!753799))))

(declare-datatypes ((array!89086 0))(
  ( (array!89087 (arr!43017 (Array (_ BitVec 32) (_ BitVec 64))) (size!43567 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89086)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53211 0))(
  ( (V!53212 (val!18115 Int)) )
))
(declare-datatypes ((ValueCell!17142 0))(
  ( (ValueCellFull!17142 (v!20745 V!53211)) (EmptyCell!17142) )
))
(declare-datatypes ((array!89088 0))(
  ( (array!89089 (arr!43018 (Array (_ BitVec 32) ValueCell!17142)) (size!43568 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89088)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321785 (= res!877313 (and (= (size!43568 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43567 _keys!1609) (size!43568 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321786 () Bool)

(declare-fun e!753795 () Bool)

(declare-fun e!753796 () Bool)

(declare-fun mapRes!55769 () Bool)

(assert (=> b!1321786 (= e!753795 (and e!753796 mapRes!55769))))

(declare-fun condMapEmpty!55769 () Bool)

(declare-fun mapDefault!55769 () ValueCell!17142)

(assert (=> b!1321786 (= condMapEmpty!55769 (= (arr!43018 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17142)) mapDefault!55769)))))

(declare-fun b!1321787 () Bool)

(declare-fun res!877311 () Bool)

(assert (=> b!1321787 (=> (not res!877311) (not e!753799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89086 (_ BitVec 32)) Bool)

(assert (=> b!1321787 (= res!877311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55769 () Bool)

(declare-fun tp!106259 () Bool)

(declare-fun e!753797 () Bool)

(assert (=> mapNonEmpty!55769 (= mapRes!55769 (and tp!106259 e!753797))))

(declare-fun mapValue!55769 () ValueCell!17142)

(declare-fun mapRest!55769 () (Array (_ BitVec 32) ValueCell!17142))

(declare-fun mapKey!55769 () (_ BitVec 32))

(assert (=> mapNonEmpty!55769 (= (arr!43018 _values!1337) (store mapRest!55769 mapKey!55769 mapValue!55769))))

(declare-fun b!1321788 () Bool)

(declare-fun res!877315 () Bool)

(assert (=> b!1321788 (=> (not res!877315) (not e!753799))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321788 (= res!877315 (validKeyInArray!0 (select (arr!43017 _keys!1609) from!2000)))))

(declare-fun b!1321789 () Bool)

(declare-fun tp_is_empty!36081 () Bool)

(assert (=> b!1321789 (= e!753797 tp_is_empty!36081)))

(declare-fun b!1321790 () Bool)

(declare-fun res!877309 () Bool)

(assert (=> b!1321790 (=> (not res!877309) (not e!753799))))

(declare-datatypes ((List!30481 0))(
  ( (Nil!30478) (Cons!30477 (h!31686 (_ BitVec 64)) (t!44291 List!30481)) )
))
(declare-fun arrayNoDuplicates!0 (array!89086 (_ BitVec 32) List!30481) Bool)

(assert (=> b!1321790 (= res!877309 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30478))))

(declare-fun b!1321791 () Bool)

(declare-fun res!877316 () Bool)

(assert (=> b!1321791 (=> (not res!877316) (not e!753799))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321791 (= res!877316 (not (= (select (arr!43017 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321792 () Bool)

(declare-fun res!877314 () Bool)

(assert (=> b!1321792 (=> (not res!877314) (not e!753799))))

(declare-fun zeroValue!1279 () V!53211)

(declare-fun minValue!1279 () V!53211)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23332 0))(
  ( (tuple2!23333 (_1!11677 (_ BitVec 64)) (_2!11677 V!53211)) )
))
(declare-datatypes ((List!30482 0))(
  ( (Nil!30479) (Cons!30478 (h!31687 tuple2!23332) (t!44292 List!30482)) )
))
(declare-datatypes ((ListLongMap!20989 0))(
  ( (ListLongMap!20990 (toList!10510 List!30482)) )
))
(declare-fun contains!8665 (ListLongMap!20989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5511 (array!89086 array!89088 (_ BitVec 32) (_ BitVec 32) V!53211 V!53211 (_ BitVec 32) Int) ListLongMap!20989)

(assert (=> b!1321792 (= res!877314 (contains!8665 (getCurrentListMap!5511 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321793 () Bool)

(assert (=> b!1321793 (= e!753799 (not true))))

(declare-fun lt!587672 () ListLongMap!20989)

(assert (=> b!1321793 (contains!8665 lt!587672 k0!1164)))

(declare-fun lt!587676 () V!53211)

(declare-datatypes ((Unit!43552 0))(
  ( (Unit!43553) )
))
(declare-fun lt!587673 () Unit!43552)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!162 ((_ BitVec 64) (_ BitVec 64) V!53211 ListLongMap!20989) Unit!43552)

(assert (=> b!1321793 (= lt!587673 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 (select (arr!43017 _keys!1609) from!2000) lt!587676 lt!587672))))

(declare-fun lt!587675 () ListLongMap!20989)

(assert (=> b!1321793 (contains!8665 lt!587675 k0!1164)))

(declare-fun lt!587674 () Unit!43552)

(assert (=> b!1321793 (= lt!587674 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587675))))

(declare-fun lt!587670 () ListLongMap!20989)

(assert (=> b!1321793 (contains!8665 lt!587670 k0!1164)))

(declare-fun lt!587671 () Unit!43552)

(assert (=> b!1321793 (= lt!587671 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587670))))

(declare-fun +!4566 (ListLongMap!20989 tuple2!23332) ListLongMap!20989)

(assert (=> b!1321793 (= lt!587670 (+!4566 lt!587675 (tuple2!23333 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321793 (= lt!587675 (+!4566 lt!587672 (tuple2!23333 (select (arr!43017 _keys!1609) from!2000) lt!587676)))))

(declare-fun get!21644 (ValueCell!17142 V!53211) V!53211)

(declare-fun dynLambda!3505 (Int (_ BitVec 64)) V!53211)

(assert (=> b!1321793 (= lt!587676 (get!21644 (select (arr!43018 _values!1337) from!2000) (dynLambda!3505 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6201 (array!89086 array!89088 (_ BitVec 32) (_ BitVec 32) V!53211 V!53211 (_ BitVec 32) Int) ListLongMap!20989)

(assert (=> b!1321793 (= lt!587672 (getCurrentListMapNoExtraKeys!6201 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321794 () Bool)

(declare-fun res!877312 () Bool)

(assert (=> b!1321794 (=> (not res!877312) (not e!753799))))

(assert (=> b!1321794 (= res!877312 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43567 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!877310 () Bool)

(assert (=> start!111604 (=> (not res!877310) (not e!753799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111604 (= res!877310 (validMask!0 mask!2019))))

(assert (=> start!111604 e!753799))

(declare-fun array_inv!32477 (array!89086) Bool)

(assert (=> start!111604 (array_inv!32477 _keys!1609)))

(assert (=> start!111604 true))

(assert (=> start!111604 tp_is_empty!36081))

(declare-fun array_inv!32478 (array!89088) Bool)

(assert (=> start!111604 (and (array_inv!32478 _values!1337) e!753795)))

(assert (=> start!111604 tp!106258))

(declare-fun b!1321795 () Bool)

(assert (=> b!1321795 (= e!753796 tp_is_empty!36081)))

(declare-fun mapIsEmpty!55769 () Bool)

(assert (=> mapIsEmpty!55769 mapRes!55769))

(assert (= (and start!111604 res!877310) b!1321785))

(assert (= (and b!1321785 res!877313) b!1321787))

(assert (= (and b!1321787 res!877311) b!1321790))

(assert (= (and b!1321790 res!877309) b!1321794))

(assert (= (and b!1321794 res!877312) b!1321792))

(assert (= (and b!1321792 res!877314) b!1321791))

(assert (= (and b!1321791 res!877316) b!1321788))

(assert (= (and b!1321788 res!877315) b!1321793))

(assert (= (and b!1321786 condMapEmpty!55769) mapIsEmpty!55769))

(assert (= (and b!1321786 (not condMapEmpty!55769)) mapNonEmpty!55769))

(get-info :version)

(assert (= (and mapNonEmpty!55769 ((_ is ValueCellFull!17142) mapValue!55769)) b!1321789))

(assert (= (and b!1321786 ((_ is ValueCellFull!17142) mapDefault!55769)) b!1321795))

(assert (= start!111604 b!1321786))

(declare-fun b_lambda!23587 () Bool)

(assert (=> (not b_lambda!23587) (not b!1321793)))

(declare-fun t!44290 () Bool)

(declare-fun tb!11613 () Bool)

(assert (=> (and start!111604 (= defaultEntry!1340 defaultEntry!1340) t!44290) tb!11613))

(declare-fun result!24281 () Bool)

(assert (=> tb!11613 (= result!24281 tp_is_empty!36081)))

(assert (=> b!1321793 t!44290))

(declare-fun b_and!48683 () Bool)

(assert (= b_and!48681 (and (=> t!44290 result!24281) b_and!48683)))

(declare-fun m!1209803 () Bool)

(assert (=> b!1321793 m!1209803))

(declare-fun m!1209805 () Bool)

(assert (=> b!1321793 m!1209805))

(declare-fun m!1209807 () Bool)

(assert (=> b!1321793 m!1209807))

(declare-fun m!1209809 () Bool)

(assert (=> b!1321793 m!1209809))

(declare-fun m!1209811 () Bool)

(assert (=> b!1321793 m!1209811))

(declare-fun m!1209813 () Bool)

(assert (=> b!1321793 m!1209813))

(declare-fun m!1209815 () Bool)

(assert (=> b!1321793 m!1209815))

(declare-fun m!1209817 () Bool)

(assert (=> b!1321793 m!1209817))

(assert (=> b!1321793 m!1209807))

(declare-fun m!1209819 () Bool)

(assert (=> b!1321793 m!1209819))

(assert (=> b!1321793 m!1209815))

(declare-fun m!1209821 () Bool)

(assert (=> b!1321793 m!1209821))

(assert (=> b!1321793 m!1209813))

(declare-fun m!1209823 () Bool)

(assert (=> b!1321793 m!1209823))

(declare-fun m!1209825 () Bool)

(assert (=> b!1321793 m!1209825))

(declare-fun m!1209827 () Bool)

(assert (=> b!1321793 m!1209827))

(assert (=> b!1321788 m!1209807))

(assert (=> b!1321788 m!1209807))

(declare-fun m!1209829 () Bool)

(assert (=> b!1321788 m!1209829))

(declare-fun m!1209831 () Bool)

(assert (=> b!1321787 m!1209831))

(declare-fun m!1209833 () Bool)

(assert (=> b!1321790 m!1209833))

(declare-fun m!1209835 () Bool)

(assert (=> b!1321792 m!1209835))

(assert (=> b!1321792 m!1209835))

(declare-fun m!1209837 () Bool)

(assert (=> b!1321792 m!1209837))

(assert (=> b!1321791 m!1209807))

(declare-fun m!1209839 () Bool)

(assert (=> mapNonEmpty!55769 m!1209839))

(declare-fun m!1209841 () Bool)

(assert (=> start!111604 m!1209841))

(declare-fun m!1209843 () Bool)

(assert (=> start!111604 m!1209843))

(declare-fun m!1209845 () Bool)

(assert (=> start!111604 m!1209845))

(check-sat (not b!1321788) b_and!48683 (not start!111604) (not b!1321792) (not b_lambda!23587) (not b!1321787) (not mapNonEmpty!55769) (not b!1321790) (not b!1321793) tp_is_empty!36081 (not b_next!30261))
(check-sat b_and!48683 (not b_next!30261))
