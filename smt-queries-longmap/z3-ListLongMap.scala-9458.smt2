; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112358 () Bool)

(assert start!112358)

(declare-fun b_free!30753 () Bool)

(declare-fun b_next!30753 () Bool)

(assert (=> start!112358 (= b_free!30753 (not b_next!30753))))

(declare-fun tp!107896 () Bool)

(declare-fun b_and!49561 () Bool)

(assert (=> start!112358 (= tp!107896 b_and!49561)))

(declare-fun mapIsEmpty!56668 () Bool)

(declare-fun mapRes!56668 () Bool)

(assert (=> mapIsEmpty!56668 mapRes!56668))

(declare-fun b!1331869 () Bool)

(declare-fun res!883827 () Bool)

(declare-fun e!758850 () Bool)

(assert (=> b!1331869 (=> (not res!883827) (not e!758850))))

(declare-datatypes ((array!90206 0))(
  ( (array!90207 (arr!43569 (Array (_ BitVec 32) (_ BitVec 64))) (size!44119 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90206)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90206 (_ BitVec 32)) Bool)

(assert (=> b!1331869 (= res!883827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331870 () Bool)

(declare-fun res!883828 () Bool)

(assert (=> b!1331870 (=> (not res!883828) (not e!758850))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331870 (= res!883828 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44119 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331871 () Bool)

(declare-fun res!883824 () Bool)

(assert (=> b!1331871 (=> (not res!883824) (not e!758850))))

(assert (=> b!1331871 (= res!883824 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331872 () Bool)

(declare-fun e!758851 () Bool)

(declare-fun tp_is_empty!36663 () Bool)

(assert (=> b!1331872 (= e!758851 tp_is_empty!36663)))

(declare-fun b!1331873 () Bool)

(assert (=> b!1331873 (= e!758850 (not true))))

(declare-datatypes ((V!53987 0))(
  ( (V!53988 (val!18406 Int)) )
))
(declare-datatypes ((tuple2!23714 0))(
  ( (tuple2!23715 (_1!11868 (_ BitVec 64)) (_2!11868 V!53987)) )
))
(declare-datatypes ((List!30862 0))(
  ( (Nil!30859) (Cons!30858 (h!32067 tuple2!23714) (t!45028 List!30862)) )
))
(declare-datatypes ((ListLongMap!21371 0))(
  ( (ListLongMap!21372 (toList!10701 List!30862)) )
))
(declare-fun lt!591738 () ListLongMap!21371)

(declare-fun minValue!1262 () V!53987)

(declare-fun contains!8865 (ListLongMap!21371 (_ BitVec 64)) Bool)

(declare-fun +!4695 (ListLongMap!21371 tuple2!23714) ListLongMap!21371)

(assert (=> b!1331873 (contains!8865 (+!4695 lt!591738 (tuple2!23715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43839 0))(
  ( (Unit!43840) )
))
(declare-fun lt!591742 () Unit!43839)

(declare-fun addStillContains!1174 (ListLongMap!21371 (_ BitVec 64) V!53987 (_ BitVec 64)) Unit!43839)

(assert (=> b!1331873 (= lt!591742 (addStillContains!1174 lt!591738 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331873 (contains!8865 lt!591738 k0!1153)))

(declare-fun lt!591741 () V!53987)

(declare-fun lt!591737 () Unit!43839)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!282 ((_ BitVec 64) (_ BitVec 64) V!53987 ListLongMap!21371) Unit!43839)

(assert (=> b!1331873 (= lt!591737 (lemmaInListMapAfterAddingDiffThenInBefore!282 k0!1153 (select (arr!43569 _keys!1590) from!1980) lt!591741 lt!591738))))

(declare-fun lt!591739 () ListLongMap!21371)

(assert (=> b!1331873 (contains!8865 lt!591739 k0!1153)))

(declare-fun lt!591740 () Unit!43839)

(assert (=> b!1331873 (= lt!591740 (lemmaInListMapAfterAddingDiffThenInBefore!282 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591739))))

(assert (=> b!1331873 (= lt!591739 (+!4695 lt!591738 (tuple2!23715 (select (arr!43569 _keys!1590) from!1980) lt!591741)))))

(declare-datatypes ((ValueCell!17433 0))(
  ( (ValueCellFull!17433 (v!21043 V!53987)) (EmptyCell!17433) )
))
(declare-datatypes ((array!90208 0))(
  ( (array!90209 (arr!43570 (Array (_ BitVec 32) ValueCell!17433)) (size!44120 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90208)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21975 (ValueCell!17433 V!53987) V!53987)

(declare-fun dynLambda!3634 (Int (_ BitVec 64)) V!53987)

(assert (=> b!1331873 (= lt!591741 (get!21975 (select (arr!43570 _values!1320) from!1980) (dynLambda!3634 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53987)

(declare-fun getCurrentListMapNoExtraKeys!6333 (array!90206 array!90208 (_ BitVec 32) (_ BitVec 32) V!53987 V!53987 (_ BitVec 32) Int) ListLongMap!21371)

(assert (=> b!1331873 (= lt!591738 (getCurrentListMapNoExtraKeys!6333 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!883823 () Bool)

(assert (=> start!112358 (=> (not res!883823) (not e!758850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112358 (= res!883823 (validMask!0 mask!1998))))

(assert (=> start!112358 e!758850))

(declare-fun e!758848 () Bool)

(declare-fun array_inv!32863 (array!90208) Bool)

(assert (=> start!112358 (and (array_inv!32863 _values!1320) e!758848)))

(assert (=> start!112358 true))

(declare-fun array_inv!32864 (array!90206) Bool)

(assert (=> start!112358 (array_inv!32864 _keys!1590)))

(assert (=> start!112358 tp!107896))

(assert (=> start!112358 tp_is_empty!36663))

(declare-fun b!1331874 () Bool)

(declare-fun e!758849 () Bool)

(assert (=> b!1331874 (= e!758849 tp_is_empty!36663)))

(declare-fun b!1331875 () Bool)

(declare-fun res!883822 () Bool)

(assert (=> b!1331875 (=> (not res!883822) (not e!758850))))

(declare-fun getCurrentListMap!5684 (array!90206 array!90208 (_ BitVec 32) (_ BitVec 32) V!53987 V!53987 (_ BitVec 32) Int) ListLongMap!21371)

(assert (=> b!1331875 (= res!883822 (contains!8865 (getCurrentListMap!5684 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331876 () Bool)

(declare-fun res!883825 () Bool)

(assert (=> b!1331876 (=> (not res!883825) (not e!758850))))

(declare-datatypes ((List!30863 0))(
  ( (Nil!30860) (Cons!30859 (h!32068 (_ BitVec 64)) (t!45029 List!30863)) )
))
(declare-fun arrayNoDuplicates!0 (array!90206 (_ BitVec 32) List!30863) Bool)

(assert (=> b!1331876 (= res!883825 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30860))))

(declare-fun b!1331877 () Bool)

(declare-fun res!883829 () Bool)

(assert (=> b!1331877 (=> (not res!883829) (not e!758850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331877 (= res!883829 (validKeyInArray!0 (select (arr!43569 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56668 () Bool)

(declare-fun tp!107895 () Bool)

(assert (=> mapNonEmpty!56668 (= mapRes!56668 (and tp!107895 e!758851))))

(declare-fun mapRest!56668 () (Array (_ BitVec 32) ValueCell!17433))

(declare-fun mapValue!56668 () ValueCell!17433)

(declare-fun mapKey!56668 () (_ BitVec 32))

(assert (=> mapNonEmpty!56668 (= (arr!43570 _values!1320) (store mapRest!56668 mapKey!56668 mapValue!56668))))

(declare-fun b!1331878 () Bool)

(declare-fun res!883830 () Bool)

(assert (=> b!1331878 (=> (not res!883830) (not e!758850))))

(assert (=> b!1331878 (= res!883830 (not (= (select (arr!43569 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331879 () Bool)

(declare-fun res!883826 () Bool)

(assert (=> b!1331879 (=> (not res!883826) (not e!758850))))

(assert (=> b!1331879 (= res!883826 (and (= (size!44120 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44119 _keys!1590) (size!44120 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331880 () Bool)

(assert (=> b!1331880 (= e!758848 (and e!758849 mapRes!56668))))

(declare-fun condMapEmpty!56668 () Bool)

(declare-fun mapDefault!56668 () ValueCell!17433)

(assert (=> b!1331880 (= condMapEmpty!56668 (= (arr!43570 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17433)) mapDefault!56668)))))

(assert (= (and start!112358 res!883823) b!1331879))

(assert (= (and b!1331879 res!883826) b!1331869))

(assert (= (and b!1331869 res!883827) b!1331876))

(assert (= (and b!1331876 res!883825) b!1331870))

(assert (= (and b!1331870 res!883828) b!1331875))

(assert (= (and b!1331875 res!883822) b!1331878))

(assert (= (and b!1331878 res!883830) b!1331877))

(assert (= (and b!1331877 res!883829) b!1331871))

(assert (= (and b!1331871 res!883824) b!1331873))

(assert (= (and b!1331880 condMapEmpty!56668) mapIsEmpty!56668))

(assert (= (and b!1331880 (not condMapEmpty!56668)) mapNonEmpty!56668))

(get-info :version)

(assert (= (and mapNonEmpty!56668 ((_ is ValueCellFull!17433) mapValue!56668)) b!1331872))

(assert (= (and b!1331880 ((_ is ValueCellFull!17433) mapDefault!56668)) b!1331874))

(assert (= start!112358 b!1331880))

(declare-fun b_lambda!24013 () Bool)

(assert (=> (not b_lambda!24013) (not b!1331873)))

(declare-fun t!45027 () Bool)

(declare-fun tb!11969 () Bool)

(assert (=> (and start!112358 (= defaultEntry!1323 defaultEntry!1323) t!45027) tb!11969))

(declare-fun result!25009 () Bool)

(assert (=> tb!11969 (= result!25009 tp_is_empty!36663)))

(assert (=> b!1331873 t!45027))

(declare-fun b_and!49563 () Bool)

(assert (= b_and!49561 (and (=> t!45027 result!25009) b_and!49563)))

(declare-fun m!1220591 () Bool)

(assert (=> start!112358 m!1220591))

(declare-fun m!1220593 () Bool)

(assert (=> start!112358 m!1220593))

(declare-fun m!1220595 () Bool)

(assert (=> start!112358 m!1220595))

(declare-fun m!1220597 () Bool)

(assert (=> b!1331873 m!1220597))

(declare-fun m!1220599 () Bool)

(assert (=> b!1331873 m!1220599))

(declare-fun m!1220601 () Bool)

(assert (=> b!1331873 m!1220601))

(declare-fun m!1220603 () Bool)

(assert (=> b!1331873 m!1220603))

(assert (=> b!1331873 m!1220601))

(declare-fun m!1220605 () Bool)

(assert (=> b!1331873 m!1220605))

(assert (=> b!1331873 m!1220597))

(declare-fun m!1220607 () Bool)

(assert (=> b!1331873 m!1220607))

(declare-fun m!1220609 () Bool)

(assert (=> b!1331873 m!1220609))

(declare-fun m!1220611 () Bool)

(assert (=> b!1331873 m!1220611))

(declare-fun m!1220613 () Bool)

(assert (=> b!1331873 m!1220613))

(assert (=> b!1331873 m!1220603))

(declare-fun m!1220615 () Bool)

(assert (=> b!1331873 m!1220615))

(declare-fun m!1220617 () Bool)

(assert (=> b!1331873 m!1220617))

(declare-fun m!1220619 () Bool)

(assert (=> b!1331873 m!1220619))

(assert (=> b!1331873 m!1220615))

(declare-fun m!1220621 () Bool)

(assert (=> b!1331873 m!1220621))

(assert (=> b!1331878 m!1220615))

(assert (=> b!1331877 m!1220615))

(assert (=> b!1331877 m!1220615))

(declare-fun m!1220623 () Bool)

(assert (=> b!1331877 m!1220623))

(declare-fun m!1220625 () Bool)

(assert (=> mapNonEmpty!56668 m!1220625))

(declare-fun m!1220627 () Bool)

(assert (=> b!1331875 m!1220627))

(assert (=> b!1331875 m!1220627))

(declare-fun m!1220629 () Bool)

(assert (=> b!1331875 m!1220629))

(declare-fun m!1220631 () Bool)

(assert (=> b!1331869 m!1220631))

(declare-fun m!1220633 () Bool)

(assert (=> b!1331876 m!1220633))

(check-sat (not b!1331875) (not b!1331869) (not b!1331873) (not mapNonEmpty!56668) (not b_next!30753) tp_is_empty!36663 (not b!1331876) (not start!112358) (not b_lambda!24013) b_and!49563 (not b!1331877))
(check-sat b_and!49563 (not b_next!30753))
