; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112514 () Bool)

(assert start!112514)

(declare-fun b_free!30685 () Bool)

(declare-fun b_next!30685 () Bool)

(assert (=> start!112514 (= b_free!30685 (not b_next!30685))))

(declare-fun tp!107691 () Bool)

(declare-fun b_and!49427 () Bool)

(assert (=> start!112514 (= tp!107691 b_and!49427)))

(declare-fun b!1331877 () Bool)

(declare-fun e!759182 () Bool)

(declare-fun tp_is_empty!36595 () Bool)

(assert (=> b!1331877 (= e!759182 tp_is_empty!36595)))

(declare-fun b!1331878 () Bool)

(declare-fun res!883429 () Bool)

(declare-fun e!759180 () Bool)

(assert (=> b!1331878 (=> (not res!883429) (not e!759180))))

(declare-datatypes ((V!53897 0))(
  ( (V!53898 (val!18372 Int)) )
))
(declare-datatypes ((ValueCell!17399 0))(
  ( (ValueCellFull!17399 (v!21004 V!53897)) (EmptyCell!17399) )
))
(declare-datatypes ((array!90183 0))(
  ( (array!90184 (arr!43553 (Array (_ BitVec 32) ValueCell!17399)) (size!44104 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90183)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90185 0))(
  ( (array!90186 (arr!43554 (Array (_ BitVec 32) (_ BitVec 64))) (size!44105 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90185)

(assert (=> b!1331878 (= res!883429 (and (= (size!44104 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44105 _keys!1590) (size!44104 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331879 () Bool)

(declare-fun res!883430 () Bool)

(assert (=> b!1331879 (=> (not res!883430) (not e!759180))))

(declare-datatypes ((List!30861 0))(
  ( (Nil!30858) (Cons!30857 (h!32075 (_ BitVec 64)) (t!44951 List!30861)) )
))
(declare-fun arrayNoDuplicates!0 (array!90185 (_ BitVec 32) List!30861) Bool)

(assert (=> b!1331879 (= res!883430 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30858))))

(declare-fun b!1331880 () Bool)

(declare-fun res!883425 () Bool)

(assert (=> b!1331880 (=> (not res!883425) (not e!759180))))

(assert (=> b!1331880 (= res!883425 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331881 () Bool)

(declare-fun e!759184 () Bool)

(assert (=> b!1331881 (= e!759184 tp_is_empty!36595)))

(declare-fun res!883427 () Bool)

(assert (=> start!112514 (=> (not res!883427) (not e!759180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112514 (= res!883427 (validMask!0 mask!1998))))

(assert (=> start!112514 e!759180))

(declare-fun e!759181 () Bool)

(declare-fun array_inv!33137 (array!90183) Bool)

(assert (=> start!112514 (and (array_inv!33137 _values!1320) e!759181)))

(assert (=> start!112514 true))

(declare-fun array_inv!33138 (array!90185) Bool)

(assert (=> start!112514 (array_inv!33138 _keys!1590)))

(assert (=> start!112514 tp!107691))

(assert (=> start!112514 tp_is_empty!36595))

(declare-fun b!1331876 () Bool)

(declare-fun res!883428 () Bool)

(assert (=> b!1331876 (=> (not res!883428) (not e!759180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90185 (_ BitVec 32)) Bool)

(assert (=> b!1331876 (= res!883428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331882 () Bool)

(declare-fun mapRes!56566 () Bool)

(assert (=> b!1331882 (= e!759181 (and e!759184 mapRes!56566))))

(declare-fun condMapEmpty!56566 () Bool)

(declare-fun mapDefault!56566 () ValueCell!17399)

(assert (=> b!1331882 (= condMapEmpty!56566 (= (arr!43553 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17399)) mapDefault!56566)))))

(declare-fun mapNonEmpty!56566 () Bool)

(declare-fun tp!107692 () Bool)

(assert (=> mapNonEmpty!56566 (= mapRes!56566 (and tp!107692 e!759182))))

(declare-fun mapKey!56566 () (_ BitVec 32))

(declare-fun mapValue!56566 () ValueCell!17399)

(declare-fun mapRest!56566 () (Array (_ BitVec 32) ValueCell!17399))

(assert (=> mapNonEmpty!56566 (= (arr!43553 _values!1320) (store mapRest!56566 mapKey!56566 mapValue!56566))))

(declare-fun b!1331883 () Bool)

(declare-fun res!883426 () Bool)

(assert (=> b!1331883 (=> (not res!883426) (not e!759180))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53897)

(declare-fun zeroValue!1262 () V!53897)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23694 0))(
  ( (tuple2!23695 (_1!11858 (_ BitVec 64)) (_2!11858 V!53897)) )
))
(declare-datatypes ((List!30862 0))(
  ( (Nil!30859) (Cons!30858 (h!32076 tuple2!23694) (t!44952 List!30862)) )
))
(declare-datatypes ((ListLongMap!21359 0))(
  ( (ListLongMap!21360 (toList!10695 List!30862)) )
))
(declare-fun contains!8871 (ListLongMap!21359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5666 (array!90185 array!90183 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21359)

(assert (=> b!1331883 (= res!883426 (contains!8871 (getCurrentListMap!5666 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56566 () Bool)

(assert (=> mapIsEmpty!56566 mapRes!56566))

(declare-fun b!1331884 () Bool)

(declare-fun res!883422 () Bool)

(assert (=> b!1331884 (=> (not res!883422) (not e!759180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331884 (= res!883422 (validKeyInArray!0 (select (arr!43554 _keys!1590) from!1980)))))

(declare-fun b!1331885 () Bool)

(declare-fun res!883423 () Bool)

(assert (=> b!1331885 (=> (not res!883423) (not e!759180))))

(assert (=> b!1331885 (= res!883423 (not (= (select (arr!43554 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331886 () Bool)

(declare-fun res!883424 () Bool)

(assert (=> b!1331886 (=> (not res!883424) (not e!759180))))

(assert (=> b!1331886 (= res!883424 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44105 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331887 () Bool)

(assert (=> b!1331887 (= e!759180 (not true))))

(declare-fun lt!591673 () ListLongMap!21359)

(assert (=> b!1331887 (contains!8871 lt!591673 k0!1153)))

(declare-fun lt!591675 () V!53897)

(declare-datatypes ((Unit!43730 0))(
  ( (Unit!43731) )
))
(declare-fun lt!591671 () Unit!43730)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!253 ((_ BitVec 64) (_ BitVec 64) V!53897 ListLongMap!21359) Unit!43730)

(assert (=> b!1331887 (= lt!591671 (lemmaInListMapAfterAddingDiffThenInBefore!253 k0!1153 (select (arr!43554 _keys!1590) from!1980) lt!591675 lt!591673))))

(declare-fun lt!591672 () ListLongMap!21359)

(assert (=> b!1331887 (contains!8871 lt!591672 k0!1153)))

(declare-fun lt!591674 () Unit!43730)

(assert (=> b!1331887 (= lt!591674 (lemmaInListMapAfterAddingDiffThenInBefore!253 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591672))))

(declare-fun +!4710 (ListLongMap!21359 tuple2!23694) ListLongMap!21359)

(assert (=> b!1331887 (= lt!591672 (+!4710 lt!591673 (tuple2!23695 (select (arr!43554 _keys!1590) from!1980) lt!591675)))))

(declare-fun get!21971 (ValueCell!17399 V!53897) V!53897)

(declare-fun dynLambda!3664 (Int (_ BitVec 64)) V!53897)

(assert (=> b!1331887 (= lt!591675 (get!21971 (select (arr!43553 _values!1320) from!1980) (dynLambda!3664 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6354 (array!90185 array!90183 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21359)

(assert (=> b!1331887 (= lt!591673 (getCurrentListMapNoExtraKeys!6354 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(assert (= (and start!112514 res!883427) b!1331878))

(assert (= (and b!1331878 res!883429) b!1331876))

(assert (= (and b!1331876 res!883428) b!1331879))

(assert (= (and b!1331879 res!883430) b!1331886))

(assert (= (and b!1331886 res!883424) b!1331883))

(assert (= (and b!1331883 res!883426) b!1331885))

(assert (= (and b!1331885 res!883423) b!1331884))

(assert (= (and b!1331884 res!883422) b!1331880))

(assert (= (and b!1331880 res!883425) b!1331887))

(assert (= (and b!1331882 condMapEmpty!56566) mapIsEmpty!56566))

(assert (= (and b!1331882 (not condMapEmpty!56566)) mapNonEmpty!56566))

(get-info :version)

(assert (= (and mapNonEmpty!56566 ((_ is ValueCellFull!17399) mapValue!56566)) b!1331877))

(assert (= (and b!1331882 ((_ is ValueCellFull!17399) mapDefault!56566)) b!1331881))

(assert (= start!112514 b!1331882))

(declare-fun b_lambda!23939 () Bool)

(assert (=> (not b_lambda!23939) (not b!1331887)))

(declare-fun t!44950 () Bool)

(declare-fun tb!11893 () Bool)

(assert (=> (and start!112514 (= defaultEntry!1323 defaultEntry!1323) t!44950) tb!11893))

(declare-fun result!24865 () Bool)

(assert (=> tb!11893 (= result!24865 tp_is_empty!36595)))

(assert (=> b!1331887 t!44950))

(declare-fun b_and!49429 () Bool)

(assert (= b_and!49427 (and (=> t!44950 result!24865) b_and!49429)))

(declare-fun m!1220837 () Bool)

(assert (=> b!1331883 m!1220837))

(assert (=> b!1331883 m!1220837))

(declare-fun m!1220839 () Bool)

(assert (=> b!1331883 m!1220839))

(declare-fun m!1220841 () Bool)

(assert (=> b!1331876 m!1220841))

(declare-fun m!1220843 () Bool)

(assert (=> b!1331885 m!1220843))

(assert (=> b!1331884 m!1220843))

(assert (=> b!1331884 m!1220843))

(declare-fun m!1220845 () Bool)

(assert (=> b!1331884 m!1220845))

(declare-fun m!1220847 () Bool)

(assert (=> start!112514 m!1220847))

(declare-fun m!1220849 () Bool)

(assert (=> start!112514 m!1220849))

(declare-fun m!1220851 () Bool)

(assert (=> start!112514 m!1220851))

(declare-fun m!1220853 () Bool)

(assert (=> b!1331879 m!1220853))

(declare-fun m!1220855 () Bool)

(assert (=> b!1331887 m!1220855))

(declare-fun m!1220857 () Bool)

(assert (=> b!1331887 m!1220857))

(assert (=> b!1331887 m!1220855))

(declare-fun m!1220859 () Bool)

(assert (=> b!1331887 m!1220859))

(declare-fun m!1220861 () Bool)

(assert (=> b!1331887 m!1220861))

(assert (=> b!1331887 m!1220843))

(declare-fun m!1220863 () Bool)

(assert (=> b!1331887 m!1220863))

(declare-fun m!1220865 () Bool)

(assert (=> b!1331887 m!1220865))

(assert (=> b!1331887 m!1220857))

(declare-fun m!1220867 () Bool)

(assert (=> b!1331887 m!1220867))

(assert (=> b!1331887 m!1220843))

(declare-fun m!1220869 () Bool)

(assert (=> b!1331887 m!1220869))

(declare-fun m!1220871 () Bool)

(assert (=> b!1331887 m!1220871))

(declare-fun m!1220873 () Bool)

(assert (=> mapNonEmpty!56566 m!1220873))

(check-sat (not start!112514) (not b_next!30685) (not mapNonEmpty!56566) b_and!49429 (not b!1331879) tp_is_empty!36595 (not b!1331876) (not b!1331883) (not b_lambda!23939) (not b!1331887) (not b!1331884))
(check-sat b_and!49429 (not b_next!30685))
