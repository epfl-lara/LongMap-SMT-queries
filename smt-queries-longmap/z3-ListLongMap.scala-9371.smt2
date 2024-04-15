; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111662 () Bool)

(assert start!111662)

(declare-fun b_free!30319 () Bool)

(declare-fun b_next!30319 () Bool)

(assert (=> start!111662 (= b_free!30319 (not b_next!30319))))

(declare-fun tp!106433 () Bool)

(declare-fun b_and!48779 () Bool)

(assert (=> start!111662 (= tp!106433 b_and!48779)))

(declare-fun b!1322730 () Bool)

(declare-fun res!877981 () Bool)

(declare-fun e!754197 () Bool)

(assert (=> b!1322730 (=> (not res!877981) (not e!754197))))

(declare-datatypes ((array!89131 0))(
  ( (array!89132 (arr!43040 (Array (_ BitVec 32) (_ BitVec 64))) (size!43592 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89131)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322730 (= res!877981 (not (= (select (arr!43040 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322731 () Bool)

(declare-fun res!877979 () Bool)

(assert (=> b!1322731 (=> (not res!877979) (not e!754197))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89131 (_ BitVec 32)) Bool)

(assert (=> b!1322731 (= res!877979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322732 () Bool)

(declare-fun res!877982 () Bool)

(assert (=> b!1322732 (=> (not res!877982) (not e!754197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322732 (= res!877982 (validKeyInArray!0 (select (arr!43040 _keys!1609) from!2000)))))

(declare-fun b!1322733 () Bool)

(declare-fun res!877983 () Bool)

(assert (=> b!1322733 (=> (not res!877983) (not e!754197))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53289 0))(
  ( (V!53290 (val!18144 Int)) )
))
(declare-datatypes ((ValueCell!17171 0))(
  ( (ValueCellFull!17171 (v!20773 V!53289)) (EmptyCell!17171) )
))
(declare-datatypes ((array!89133 0))(
  ( (array!89134 (arr!43041 (Array (_ BitVec 32) ValueCell!17171)) (size!43593 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89133)

(assert (=> b!1322733 (= res!877983 (and (= (size!43593 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43592 _keys!1609) (size!43593 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322734 () Bool)

(declare-fun res!877980 () Bool)

(assert (=> b!1322734 (=> (not res!877980) (not e!754197))))

(declare-datatypes ((List!30589 0))(
  ( (Nil!30586) (Cons!30585 (h!31794 (_ BitVec 64)) (t!44449 List!30589)) )
))
(declare-fun arrayNoDuplicates!0 (array!89131 (_ BitVec 32) List!30589) Bool)

(assert (=> b!1322734 (= res!877980 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30586))))

(declare-fun mapIsEmpty!55856 () Bool)

(declare-fun mapRes!55856 () Bool)

(assert (=> mapIsEmpty!55856 mapRes!55856))

(declare-fun b!1322735 () Bool)

(declare-fun e!754198 () Bool)

(declare-fun tp_is_empty!36139 () Bool)

(assert (=> b!1322735 (= e!754198 tp_is_empty!36139)))

(declare-fun b!1322736 () Bool)

(declare-fun e!754199 () Bool)

(assert (=> b!1322736 (= e!754199 tp_is_empty!36139)))

(declare-fun b!1322737 () Bool)

(assert (=> b!1322737 (= e!754197 (not true))))

(declare-datatypes ((tuple2!23454 0))(
  ( (tuple2!23455 (_1!11738 (_ BitVec 64)) (_2!11738 V!53289)) )
))
(declare-datatypes ((List!30590 0))(
  ( (Nil!30587) (Cons!30586 (h!31795 tuple2!23454) (t!44450 List!30590)) )
))
(declare-datatypes ((ListLongMap!21111 0))(
  ( (ListLongMap!21112 (toList!10571 List!30590)) )
))
(declare-fun lt!588264 () ListLongMap!21111)

(declare-fun lt!588261 () tuple2!23454)

(declare-fun contains!8654 (ListLongMap!21111 (_ BitVec 64)) Bool)

(declare-fun +!4610 (ListLongMap!21111 tuple2!23454) ListLongMap!21111)

(assert (=> b!1322737 (contains!8654 (+!4610 lt!588264 lt!588261) k0!1164)))

(declare-datatypes ((Unit!43403 0))(
  ( (Unit!43404) )
))
(declare-fun lt!588260 () Unit!43403)

(declare-fun zeroValue!1279 () V!53289)

(declare-fun addStillContains!1134 (ListLongMap!21111 (_ BitVec 64) V!53289 (_ BitVec 64)) Unit!43403)

(assert (=> b!1322737 (= lt!588260 (addStillContains!1134 lt!588264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322737 (contains!8654 lt!588264 k0!1164)))

(declare-fun lt!588265 () V!53289)

(declare-fun lt!588267 () Unit!43403)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!175 ((_ BitVec 64) (_ BitVec 64) V!53289 ListLongMap!21111) Unit!43403)

(assert (=> b!1322737 (= lt!588267 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 (select (arr!43040 _keys!1609) from!2000) lt!588265 lt!588264))))

(declare-fun lt!588259 () ListLongMap!21111)

(assert (=> b!1322737 (contains!8654 lt!588259 k0!1164)))

(declare-fun lt!588266 () Unit!43403)

(assert (=> b!1322737 (= lt!588266 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588259))))

(declare-fun lt!588263 () ListLongMap!21111)

(assert (=> b!1322737 (contains!8654 lt!588263 k0!1164)))

(declare-fun minValue!1279 () V!53289)

(declare-fun lt!588262 () Unit!43403)

(assert (=> b!1322737 (= lt!588262 (lemmaInListMapAfterAddingDiffThenInBefore!175 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588263))))

(assert (=> b!1322737 (= lt!588263 (+!4610 lt!588259 lt!588261))))

(assert (=> b!1322737 (= lt!588261 (tuple2!23455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322737 (= lt!588259 (+!4610 lt!588264 (tuple2!23455 (select (arr!43040 _keys!1609) from!2000) lt!588265)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21675 (ValueCell!17171 V!53289) V!53289)

(declare-fun dynLambda!3540 (Int (_ BitVec 64)) V!53289)

(assert (=> b!1322737 (= lt!588265 (get!21675 (select (arr!43041 _values!1337) from!2000) (dynLambda!3540 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6243 (array!89131 array!89133 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21111)

(assert (=> b!1322737 (= lt!588264 (getCurrentListMapNoExtraKeys!6243 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322739 () Bool)

(declare-fun e!754201 () Bool)

(assert (=> b!1322739 (= e!754201 (and e!754199 mapRes!55856))))

(declare-fun condMapEmpty!55856 () Bool)

(declare-fun mapDefault!55856 () ValueCell!17171)

(assert (=> b!1322739 (= condMapEmpty!55856 (= (arr!43041 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17171)) mapDefault!55856)))))

(declare-fun mapNonEmpty!55856 () Bool)

(declare-fun tp!106434 () Bool)

(assert (=> mapNonEmpty!55856 (= mapRes!55856 (and tp!106434 e!754198))))

(declare-fun mapKey!55856 () (_ BitVec 32))

(declare-fun mapValue!55856 () ValueCell!17171)

(declare-fun mapRest!55856 () (Array (_ BitVec 32) ValueCell!17171))

(assert (=> mapNonEmpty!55856 (= (arr!43041 _values!1337) (store mapRest!55856 mapKey!55856 mapValue!55856))))

(declare-fun b!1322740 () Bool)

(declare-fun res!877978 () Bool)

(assert (=> b!1322740 (=> (not res!877978) (not e!754197))))

(assert (=> b!1322740 (= res!877978 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43592 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!877976 () Bool)

(assert (=> start!111662 (=> (not res!877976) (not e!754197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111662 (= res!877976 (validMask!0 mask!2019))))

(assert (=> start!111662 e!754197))

(declare-fun array_inv!32677 (array!89131) Bool)

(assert (=> start!111662 (array_inv!32677 _keys!1609)))

(assert (=> start!111662 true))

(assert (=> start!111662 tp_is_empty!36139))

(declare-fun array_inv!32678 (array!89133) Bool)

(assert (=> start!111662 (and (array_inv!32678 _values!1337) e!754201)))

(assert (=> start!111662 tp!106433))

(declare-fun b!1322738 () Bool)

(declare-fun res!877977 () Bool)

(assert (=> b!1322738 (=> (not res!877977) (not e!754197))))

(declare-fun getCurrentListMap!5454 (array!89131 array!89133 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21111)

(assert (=> b!1322738 (= res!877977 (contains!8654 (getCurrentListMap!5454 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111662 res!877976) b!1322733))

(assert (= (and b!1322733 res!877983) b!1322731))

(assert (= (and b!1322731 res!877979) b!1322734))

(assert (= (and b!1322734 res!877980) b!1322740))

(assert (= (and b!1322740 res!877978) b!1322738))

(assert (= (and b!1322738 res!877977) b!1322730))

(assert (= (and b!1322730 res!877981) b!1322732))

(assert (= (and b!1322732 res!877982) b!1322737))

(assert (= (and b!1322739 condMapEmpty!55856) mapIsEmpty!55856))

(assert (= (and b!1322739 (not condMapEmpty!55856)) mapNonEmpty!55856))

(get-info :version)

(assert (= (and mapNonEmpty!55856 ((_ is ValueCellFull!17171) mapValue!55856)) b!1322735))

(assert (= (and b!1322739 ((_ is ValueCellFull!17171) mapDefault!55856)) b!1322736))

(assert (= start!111662 b!1322739))

(declare-fun b_lambda!23635 () Bool)

(assert (=> (not b_lambda!23635) (not b!1322737)))

(declare-fun t!44448 () Bool)

(declare-fun tb!11663 () Bool)

(assert (=> (and start!111662 (= defaultEntry!1340 defaultEntry!1340) t!44448) tb!11663))

(declare-fun result!24389 () Bool)

(assert (=> tb!11663 (= result!24389 tp_is_empty!36139)))

(assert (=> b!1322737 t!44448))

(declare-fun b_and!48781 () Bool)

(assert (= b_and!48779 (and (=> t!44448 result!24389) b_and!48781)))

(declare-fun m!1210725 () Bool)

(assert (=> b!1322734 m!1210725))

(declare-fun m!1210727 () Bool)

(assert (=> b!1322738 m!1210727))

(assert (=> b!1322738 m!1210727))

(declare-fun m!1210729 () Bool)

(assert (=> b!1322738 m!1210729))

(declare-fun m!1210731 () Bool)

(assert (=> b!1322731 m!1210731))

(declare-fun m!1210733 () Bool)

(assert (=> b!1322730 m!1210733))

(declare-fun m!1210735 () Bool)

(assert (=> mapNonEmpty!55856 m!1210735))

(declare-fun m!1210737 () Bool)

(assert (=> b!1322737 m!1210737))

(declare-fun m!1210739 () Bool)

(assert (=> b!1322737 m!1210739))

(declare-fun m!1210741 () Bool)

(assert (=> b!1322737 m!1210741))

(declare-fun m!1210743 () Bool)

(assert (=> b!1322737 m!1210743))

(declare-fun m!1210745 () Bool)

(assert (=> b!1322737 m!1210745))

(declare-fun m!1210747 () Bool)

(assert (=> b!1322737 m!1210747))

(assert (=> b!1322737 m!1210747))

(assert (=> b!1322737 m!1210743))

(declare-fun m!1210749 () Bool)

(assert (=> b!1322737 m!1210749))

(assert (=> b!1322737 m!1210733))

(declare-fun m!1210751 () Bool)

(assert (=> b!1322737 m!1210751))

(declare-fun m!1210753 () Bool)

(assert (=> b!1322737 m!1210753))

(assert (=> b!1322737 m!1210733))

(declare-fun m!1210755 () Bool)

(assert (=> b!1322737 m!1210755))

(declare-fun m!1210757 () Bool)

(assert (=> b!1322737 m!1210757))

(declare-fun m!1210759 () Bool)

(assert (=> b!1322737 m!1210759))

(assert (=> b!1322737 m!1210753))

(declare-fun m!1210761 () Bool)

(assert (=> b!1322737 m!1210761))

(declare-fun m!1210763 () Bool)

(assert (=> b!1322737 m!1210763))

(declare-fun m!1210765 () Bool)

(assert (=> b!1322737 m!1210765))

(assert (=> b!1322732 m!1210733))

(assert (=> b!1322732 m!1210733))

(declare-fun m!1210767 () Bool)

(assert (=> b!1322732 m!1210767))

(declare-fun m!1210769 () Bool)

(assert (=> start!111662 m!1210769))

(declare-fun m!1210771 () Bool)

(assert (=> start!111662 m!1210771))

(declare-fun m!1210773 () Bool)

(assert (=> start!111662 m!1210773))

(check-sat (not b_lambda!23635) (not b!1322731) (not b!1322734) tp_is_empty!36139 (not mapNonEmpty!55856) b_and!48781 (not start!111662) (not b!1322732) (not b_next!30319) (not b!1322737) (not b!1322738))
(check-sat b_and!48781 (not b_next!30319))
