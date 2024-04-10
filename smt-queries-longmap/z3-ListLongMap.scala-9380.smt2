; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111718 () Bool)

(assert start!111718)

(declare-fun b_free!30375 () Bool)

(declare-fun b_next!30375 () Bool)

(assert (=> start!111718 (= b_free!30375 (not b_next!30375))))

(declare-fun tp!106601 () Bool)

(declare-fun b_and!48909 () Bool)

(assert (=> start!111718 (= tp!106601 b_and!48909)))

(declare-fun b!1323780 () Bool)

(declare-fun e!754654 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1323780 (= e!754654 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!53363 0))(
  ( (V!53364 (val!18172 Int)) )
))
(declare-datatypes ((tuple2!23428 0))(
  ( (tuple2!23429 (_1!11725 (_ BitVec 64)) (_2!11725 V!53363)) )
))
(declare-datatypes ((List!30569 0))(
  ( (Nil!30566) (Cons!30565 (h!31774 tuple2!23428) (t!44493 List!30569)) )
))
(declare-datatypes ((ListLongMap!21085 0))(
  ( (ListLongMap!21086 (toList!10558 List!30569)) )
))
(declare-fun lt!589363 () ListLongMap!21085)

(declare-fun minValue!1279 () V!53363)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8713 (ListLongMap!21085 (_ BitVec 64)) Bool)

(declare-fun +!4609 (ListLongMap!21085 tuple2!23428) ListLongMap!21085)

(assert (=> b!1323780 (contains!8713 (+!4609 lt!589363 (tuple2!23429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43638 0))(
  ( (Unit!43639) )
))
(declare-fun lt!589361 () Unit!43638)

(declare-fun addStillContains!1158 (ListLongMap!21085 (_ BitVec 64) V!53363 (_ BitVec 64)) Unit!43638)

(assert (=> b!1323780 (= lt!589361 (addStillContains!1158 lt!589363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323780 (contains!8713 lt!589363 k0!1164)))

(declare-fun lt!589360 () ListLongMap!21085)

(declare-fun lt!589362 () tuple2!23428)

(assert (=> b!1323780 (= lt!589363 (+!4609 lt!589360 lt!589362))))

(declare-fun zeroValue!1279 () V!53363)

(declare-fun lt!589364 () Unit!43638)

(assert (=> b!1323780 (= lt!589364 (addStillContains!1158 lt!589360 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323780 (contains!8713 lt!589360 k0!1164)))

(declare-datatypes ((array!89306 0))(
  ( (array!89307 (arr!43127 (Array (_ BitVec 32) (_ BitVec 64))) (size!43677 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89306)

(declare-fun lt!589355 () V!53363)

(declare-fun lt!589356 () Unit!43638)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!205 ((_ BitVec 64) (_ BitVec 64) V!53363 ListLongMap!21085) Unit!43638)

(assert (=> b!1323780 (= lt!589356 (lemmaInListMapAfterAddingDiffThenInBefore!205 k0!1164 (select (arr!43127 _keys!1609) from!2000) lt!589355 lt!589360))))

(declare-fun lt!589357 () ListLongMap!21085)

(assert (=> b!1323780 (contains!8713 lt!589357 k0!1164)))

(declare-fun lt!589359 () Unit!43638)

(assert (=> b!1323780 (= lt!589359 (lemmaInListMapAfterAddingDiffThenInBefore!205 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589357))))

(declare-fun lt!589365 () ListLongMap!21085)

(assert (=> b!1323780 (contains!8713 lt!589365 k0!1164)))

(declare-fun lt!589358 () Unit!43638)

(assert (=> b!1323780 (= lt!589358 (lemmaInListMapAfterAddingDiffThenInBefore!205 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589365))))

(assert (=> b!1323780 (= lt!589365 (+!4609 lt!589357 lt!589362))))

(assert (=> b!1323780 (= lt!589362 (tuple2!23429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323780 (= lt!589357 (+!4609 lt!589360 (tuple2!23429 (select (arr!43127 _keys!1609) from!2000) lt!589355)))))

(declare-datatypes ((ValueCell!17199 0))(
  ( (ValueCellFull!17199 (v!20802 V!53363)) (EmptyCell!17199) )
))
(declare-datatypes ((array!89308 0))(
  ( (array!89309 (arr!43128 (Array (_ BitVec 32) ValueCell!17199)) (size!43678 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89308)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21725 (ValueCell!17199 V!53363) V!53363)

(declare-fun dynLambda!3548 (Int (_ BitVec 64)) V!53363)

(assert (=> b!1323780 (= lt!589355 (get!21725 (select (arr!43128 _values!1337) from!2000) (dynLambda!3548 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6244 (array!89306 array!89308 (_ BitVec 32) (_ BitVec 32) V!53363 V!53363 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1323780 (= lt!589360 (getCurrentListMapNoExtraKeys!6244 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323781 () Bool)

(declare-fun e!754652 () Bool)

(declare-fun tp_is_empty!36195 () Bool)

(assert (=> b!1323781 (= e!754652 tp_is_empty!36195)))

(declare-fun b!1323782 () Bool)

(declare-fun res!878678 () Bool)

(assert (=> b!1323782 (=> (not res!878678) (not e!754654))))

(assert (=> b!1323782 (= res!878678 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43677 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323783 () Bool)

(declare-fun res!878677 () Bool)

(assert (=> b!1323783 (=> (not res!878677) (not e!754654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89306 (_ BitVec 32)) Bool)

(assert (=> b!1323783 (= res!878677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323784 () Bool)

(declare-fun res!878679 () Bool)

(assert (=> b!1323784 (=> (not res!878679) (not e!754654))))

(assert (=> b!1323784 (= res!878679 (and (= (size!43678 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43677 _keys!1609) (size!43678 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323785 () Bool)

(declare-fun res!878681 () Bool)

(assert (=> b!1323785 (=> (not res!878681) (not e!754654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323785 (= res!878681 (validKeyInArray!0 (select (arr!43127 _keys!1609) from!2000)))))

(declare-fun b!1323786 () Bool)

(declare-fun e!754651 () Bool)

(assert (=> b!1323786 (= e!754651 tp_is_empty!36195)))

(declare-fun mapIsEmpty!55940 () Bool)

(declare-fun mapRes!55940 () Bool)

(assert (=> mapIsEmpty!55940 mapRes!55940))

(declare-fun res!878683 () Bool)

(assert (=> start!111718 (=> (not res!878683) (not e!754654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111718 (= res!878683 (validMask!0 mask!2019))))

(assert (=> start!111718 e!754654))

(declare-fun array_inv!32555 (array!89306) Bool)

(assert (=> start!111718 (array_inv!32555 _keys!1609)))

(assert (=> start!111718 true))

(assert (=> start!111718 tp_is_empty!36195))

(declare-fun e!754650 () Bool)

(declare-fun array_inv!32556 (array!89308) Bool)

(assert (=> start!111718 (and (array_inv!32556 _values!1337) e!754650)))

(assert (=> start!111718 tp!106601))

(declare-fun mapNonEmpty!55940 () Bool)

(declare-fun tp!106600 () Bool)

(assert (=> mapNonEmpty!55940 (= mapRes!55940 (and tp!106600 e!754651))))

(declare-fun mapKey!55940 () (_ BitVec 32))

(declare-fun mapValue!55940 () ValueCell!17199)

(declare-fun mapRest!55940 () (Array (_ BitVec 32) ValueCell!17199))

(assert (=> mapNonEmpty!55940 (= (arr!43128 _values!1337) (store mapRest!55940 mapKey!55940 mapValue!55940))))

(declare-fun b!1323787 () Bool)

(declare-fun res!878684 () Bool)

(assert (=> b!1323787 (=> (not res!878684) (not e!754654))))

(declare-fun getCurrentListMap!5554 (array!89306 array!89308 (_ BitVec 32) (_ BitVec 32) V!53363 V!53363 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1323787 (= res!878684 (contains!8713 (getCurrentListMap!5554 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323788 () Bool)

(declare-fun res!878680 () Bool)

(assert (=> b!1323788 (=> (not res!878680) (not e!754654))))

(assert (=> b!1323788 (= res!878680 (not (= (select (arr!43127 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323789 () Bool)

(declare-fun res!878682 () Bool)

(assert (=> b!1323789 (=> (not res!878682) (not e!754654))))

(declare-datatypes ((List!30570 0))(
  ( (Nil!30567) (Cons!30566 (h!31775 (_ BitVec 64)) (t!44494 List!30570)) )
))
(declare-fun arrayNoDuplicates!0 (array!89306 (_ BitVec 32) List!30570) Bool)

(assert (=> b!1323789 (= res!878682 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30567))))

(declare-fun b!1323790 () Bool)

(assert (=> b!1323790 (= e!754650 (and e!754652 mapRes!55940))))

(declare-fun condMapEmpty!55940 () Bool)

(declare-fun mapDefault!55940 () ValueCell!17199)

(assert (=> b!1323790 (= condMapEmpty!55940 (= (arr!43128 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17199)) mapDefault!55940)))))

(assert (= (and start!111718 res!878683) b!1323784))

(assert (= (and b!1323784 res!878679) b!1323783))

(assert (= (and b!1323783 res!878677) b!1323789))

(assert (= (and b!1323789 res!878682) b!1323782))

(assert (= (and b!1323782 res!878678) b!1323787))

(assert (= (and b!1323787 res!878684) b!1323788))

(assert (= (and b!1323788 res!878680) b!1323785))

(assert (= (and b!1323785 res!878681) b!1323780))

(assert (= (and b!1323790 condMapEmpty!55940) mapIsEmpty!55940))

(assert (= (and b!1323790 (not condMapEmpty!55940)) mapNonEmpty!55940))

(get-info :version)

(assert (= (and mapNonEmpty!55940 ((_ is ValueCellFull!17199) mapValue!55940)) b!1323786))

(assert (= (and b!1323790 ((_ is ValueCellFull!17199) mapDefault!55940)) b!1323781))

(assert (= start!111718 b!1323790))

(declare-fun b_lambda!23701 () Bool)

(assert (=> (not b_lambda!23701) (not b!1323780)))

(declare-fun t!44492 () Bool)

(declare-fun tb!11727 () Bool)

(assert (=> (and start!111718 (= defaultEntry!1340 defaultEntry!1340) t!44492) tb!11727))

(declare-fun result!24509 () Bool)

(assert (=> tb!11727 (= result!24509 tp_is_empty!36195)))

(assert (=> b!1323780 t!44492))

(declare-fun b_and!48911 () Bool)

(assert (= b_and!48909 (and (=> t!44492 result!24509) b_and!48911)))

(declare-fun m!1212791 () Bool)

(assert (=> start!111718 m!1212791))

(declare-fun m!1212793 () Bool)

(assert (=> start!111718 m!1212793))

(declare-fun m!1212795 () Bool)

(assert (=> start!111718 m!1212795))

(declare-fun m!1212797 () Bool)

(assert (=> b!1323789 m!1212797))

(declare-fun m!1212799 () Bool)

(assert (=> mapNonEmpty!55940 m!1212799))

(declare-fun m!1212801 () Bool)

(assert (=> b!1323783 m!1212801))

(declare-fun m!1212803 () Bool)

(assert (=> b!1323787 m!1212803))

(assert (=> b!1323787 m!1212803))

(declare-fun m!1212805 () Bool)

(assert (=> b!1323787 m!1212805))

(declare-fun m!1212807 () Bool)

(assert (=> b!1323780 m!1212807))

(declare-fun m!1212809 () Bool)

(assert (=> b!1323780 m!1212809))

(declare-fun m!1212811 () Bool)

(assert (=> b!1323780 m!1212811))

(declare-fun m!1212813 () Bool)

(assert (=> b!1323780 m!1212813))

(declare-fun m!1212815 () Bool)

(assert (=> b!1323780 m!1212815))

(declare-fun m!1212817 () Bool)

(assert (=> b!1323780 m!1212817))

(declare-fun m!1212819 () Bool)

(assert (=> b!1323780 m!1212819))

(declare-fun m!1212821 () Bool)

(assert (=> b!1323780 m!1212821))

(declare-fun m!1212823 () Bool)

(assert (=> b!1323780 m!1212823))

(declare-fun m!1212825 () Bool)

(assert (=> b!1323780 m!1212825))

(declare-fun m!1212827 () Bool)

(assert (=> b!1323780 m!1212827))

(declare-fun m!1212829 () Bool)

(assert (=> b!1323780 m!1212829))

(declare-fun m!1212831 () Bool)

(assert (=> b!1323780 m!1212831))

(declare-fun m!1212833 () Bool)

(assert (=> b!1323780 m!1212833))

(assert (=> b!1323780 m!1212819))

(declare-fun m!1212835 () Bool)

(assert (=> b!1323780 m!1212835))

(assert (=> b!1323780 m!1212809))

(declare-fun m!1212837 () Bool)

(assert (=> b!1323780 m!1212837))

(assert (=> b!1323780 m!1212833))

(declare-fun m!1212839 () Bool)

(assert (=> b!1323780 m!1212839))

(declare-fun m!1212841 () Bool)

(assert (=> b!1323780 m!1212841))

(declare-fun m!1212843 () Bool)

(assert (=> b!1323780 m!1212843))

(assert (=> b!1323780 m!1212829))

(assert (=> b!1323785 m!1212809))

(assert (=> b!1323785 m!1212809))

(declare-fun m!1212845 () Bool)

(assert (=> b!1323785 m!1212845))

(assert (=> b!1323788 m!1212809))

(check-sat tp_is_empty!36195 (not mapNonEmpty!55940) (not b_next!30375) (not b!1323780) (not start!111718) (not b!1323785) (not b_lambda!23701) (not b!1323787) (not b!1323789) (not b!1323783) b_and!48911)
(check-sat b_and!48911 (not b_next!30375))
