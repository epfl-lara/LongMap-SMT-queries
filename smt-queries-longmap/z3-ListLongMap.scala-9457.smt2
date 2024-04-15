; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112350 () Bool)

(assert start!112350)

(declare-fun b_free!30745 () Bool)

(declare-fun b_next!30745 () Bool)

(assert (=> start!112350 (= b_free!30745 (not b_next!30745))))

(declare-fun tp!107873 () Bool)

(declare-fun b_and!49527 () Bool)

(assert (=> start!112350 (= tp!107873 b_and!49527)))

(declare-fun b!1331647 () Bool)

(declare-fun res!883689 () Bool)

(declare-fun e!758758 () Bool)

(assert (=> b!1331647 (=> (not res!883689) (not e!758758))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331647 (= res!883689 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331648 () Bool)

(declare-fun res!883688 () Bool)

(assert (=> b!1331648 (=> (not res!883688) (not e!758758))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90129 0))(
  ( (array!90130 (arr!43531 (Array (_ BitVec 32) (_ BitVec 64))) (size!44083 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90129)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331648 (= res!883688 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44083 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331649 () Bool)

(declare-fun res!883691 () Bool)

(assert (=> b!1331649 (=> (not res!883691) (not e!758758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331649 (= res!883691 (validKeyInArray!0 (select (arr!43531 _keys!1590) from!1980)))))

(declare-fun b!1331650 () Bool)

(declare-fun e!758755 () Bool)

(declare-fun tp_is_empty!36655 () Bool)

(assert (=> b!1331650 (= e!758755 tp_is_empty!36655)))

(declare-fun b!1331651 () Bool)

(assert (=> b!1331651 (= e!758758 (not true))))

(declare-datatypes ((V!53977 0))(
  ( (V!53978 (val!18402 Int)) )
))
(declare-datatypes ((tuple2!23778 0))(
  ( (tuple2!23779 (_1!11900 (_ BitVec 64)) (_2!11900 V!53977)) )
))
(declare-datatypes ((List!30916 0))(
  ( (Nil!30913) (Cons!30912 (h!32121 tuple2!23778) (t!45066 List!30916)) )
))
(declare-datatypes ((ListLongMap!21435 0))(
  ( (ListLongMap!21436 (toList!10733 List!30916)) )
))
(declare-fun lt!591484 () ListLongMap!21435)

(declare-fun minValue!1262 () V!53977)

(declare-fun contains!8825 (ListLongMap!21435 (_ BitVec 64)) Bool)

(declare-fun +!4712 (ListLongMap!21435 tuple2!23778) ListLongMap!21435)

(assert (=> b!1331651 (contains!8825 (+!4712 lt!591484 (tuple2!23779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43636 0))(
  ( (Unit!43637) )
))
(declare-fun lt!591479 () Unit!43636)

(declare-fun addStillContains!1166 (ListLongMap!21435 (_ BitVec 64) V!53977 (_ BitVec 64)) Unit!43636)

(assert (=> b!1331651 (= lt!591479 (addStillContains!1166 lt!591484 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331651 (contains!8825 lt!591484 k0!1153)))

(declare-fun lt!591480 () V!53977)

(declare-fun lt!591483 () Unit!43636)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!268 ((_ BitVec 64) (_ BitVec 64) V!53977 ListLongMap!21435) Unit!43636)

(assert (=> b!1331651 (= lt!591483 (lemmaInListMapAfterAddingDiffThenInBefore!268 k0!1153 (select (arr!43531 _keys!1590) from!1980) lt!591480 lt!591484))))

(declare-fun lt!591482 () ListLongMap!21435)

(assert (=> b!1331651 (contains!8825 lt!591482 k0!1153)))

(declare-fun lt!591481 () Unit!43636)

(assert (=> b!1331651 (= lt!591481 (lemmaInListMapAfterAddingDiffThenInBefore!268 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591482))))

(assert (=> b!1331651 (= lt!591482 (+!4712 lt!591484 (tuple2!23779 (select (arr!43531 _keys!1590) from!1980) lt!591480)))))

(declare-datatypes ((ValueCell!17429 0))(
  ( (ValueCellFull!17429 (v!21038 V!53977)) (EmptyCell!17429) )
))
(declare-datatypes ((array!90131 0))(
  ( (array!90132 (arr!43532 (Array (_ BitVec 32) ValueCell!17429)) (size!44084 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90131)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21957 (ValueCell!17429 V!53977) V!53977)

(declare-fun dynLambda!3642 (Int (_ BitVec 64)) V!53977)

(assert (=> b!1331651 (= lt!591480 (get!21957 (select (arr!43532 _values!1320) from!1980) (dynLambda!3642 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53977)

(declare-fun getCurrentListMapNoExtraKeys!6350 (array!90129 array!90131 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21435)

(assert (=> b!1331651 (= lt!591484 (getCurrentListMapNoExtraKeys!6350 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331652 () Bool)

(declare-fun res!883687 () Bool)

(assert (=> b!1331652 (=> (not res!883687) (not e!758758))))

(declare-datatypes ((List!30917 0))(
  ( (Nil!30914) (Cons!30913 (h!32122 (_ BitVec 64)) (t!45067 List!30917)) )
))
(declare-fun arrayNoDuplicates!0 (array!90129 (_ BitVec 32) List!30917) Bool)

(assert (=> b!1331652 (= res!883687 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30914))))

(declare-fun b!1331653 () Bool)

(declare-fun e!758754 () Bool)

(assert (=> b!1331653 (= e!758754 tp_is_empty!36655)))

(declare-fun b!1331655 () Bool)

(declare-fun res!883686 () Bool)

(assert (=> b!1331655 (=> (not res!883686) (not e!758758))))

(assert (=> b!1331655 (= res!883686 (and (= (size!44084 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44083 _keys!1590) (size!44084 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331656 () Bool)

(declare-fun res!883692 () Bool)

(assert (=> b!1331656 (=> (not res!883692) (not e!758758))))

(declare-fun getCurrentListMap!5593 (array!90129 array!90131 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21435)

(assert (=> b!1331656 (= res!883692 (contains!8825 (getCurrentListMap!5593 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331657 () Bool)

(declare-fun e!758756 () Bool)

(declare-fun mapRes!56656 () Bool)

(assert (=> b!1331657 (= e!758756 (and e!758754 mapRes!56656))))

(declare-fun condMapEmpty!56656 () Bool)

(declare-fun mapDefault!56656 () ValueCell!17429)

(assert (=> b!1331657 (= condMapEmpty!56656 (= (arr!43532 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17429)) mapDefault!56656)))))

(declare-fun mapIsEmpty!56656 () Bool)

(assert (=> mapIsEmpty!56656 mapRes!56656))

(declare-fun b!1331658 () Bool)

(declare-fun res!883693 () Bool)

(assert (=> b!1331658 (=> (not res!883693) (not e!758758))))

(assert (=> b!1331658 (= res!883693 (not (= (select (arr!43531 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56656 () Bool)

(declare-fun tp!107872 () Bool)

(assert (=> mapNonEmpty!56656 (= mapRes!56656 (and tp!107872 e!758755))))

(declare-fun mapRest!56656 () (Array (_ BitVec 32) ValueCell!17429))

(declare-fun mapKey!56656 () (_ BitVec 32))

(declare-fun mapValue!56656 () ValueCell!17429)

(assert (=> mapNonEmpty!56656 (= (arr!43532 _values!1320) (store mapRest!56656 mapKey!56656 mapValue!56656))))

(declare-fun b!1331654 () Bool)

(declare-fun res!883690 () Bool)

(assert (=> b!1331654 (=> (not res!883690) (not e!758758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90129 (_ BitVec 32)) Bool)

(assert (=> b!1331654 (= res!883690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!883685 () Bool)

(assert (=> start!112350 (=> (not res!883685) (not e!758758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112350 (= res!883685 (validMask!0 mask!1998))))

(assert (=> start!112350 e!758758))

(declare-fun array_inv!33015 (array!90131) Bool)

(assert (=> start!112350 (and (array_inv!33015 _values!1320) e!758756)))

(assert (=> start!112350 true))

(declare-fun array_inv!33016 (array!90129) Bool)

(assert (=> start!112350 (array_inv!33016 _keys!1590)))

(assert (=> start!112350 tp!107873))

(assert (=> start!112350 tp_is_empty!36655))

(assert (= (and start!112350 res!883685) b!1331655))

(assert (= (and b!1331655 res!883686) b!1331654))

(assert (= (and b!1331654 res!883690) b!1331652))

(assert (= (and b!1331652 res!883687) b!1331648))

(assert (= (and b!1331648 res!883688) b!1331656))

(assert (= (and b!1331656 res!883692) b!1331658))

(assert (= (and b!1331658 res!883693) b!1331649))

(assert (= (and b!1331649 res!883691) b!1331647))

(assert (= (and b!1331647 res!883689) b!1331651))

(assert (= (and b!1331657 condMapEmpty!56656) mapIsEmpty!56656))

(assert (= (and b!1331657 (not condMapEmpty!56656)) mapNonEmpty!56656))

(get-info :version)

(assert (= (and mapNonEmpty!56656 ((_ is ValueCellFull!17429) mapValue!56656)) b!1331650))

(assert (= (and b!1331657 ((_ is ValueCellFull!17429) mapDefault!56656)) b!1331653))

(assert (= start!112350 b!1331657))

(declare-fun b_lambda!23995 () Bool)

(assert (=> (not b_lambda!23995) (not b!1331651)))

(declare-fun t!45065 () Bool)

(declare-fun tb!11953 () Bool)

(assert (=> (and start!112350 (= defaultEntry!1323 defaultEntry!1323) t!45065) tb!11953))

(declare-fun result!24985 () Bool)

(assert (=> tb!11953 (= result!24985 tp_is_empty!36655)))

(assert (=> b!1331651 t!45065))

(declare-fun b_and!49529 () Bool)

(assert (= b_and!49527 (and (=> t!45065 result!24985) b_and!49529)))

(declare-fun m!1219899 () Bool)

(assert (=> b!1331652 m!1219899))

(declare-fun m!1219901 () Bool)

(assert (=> b!1331651 m!1219901))

(declare-fun m!1219903 () Bool)

(assert (=> b!1331651 m!1219903))

(declare-fun m!1219905 () Bool)

(assert (=> b!1331651 m!1219905))

(declare-fun m!1219907 () Bool)

(assert (=> b!1331651 m!1219907))

(assert (=> b!1331651 m!1219905))

(declare-fun m!1219909 () Bool)

(assert (=> b!1331651 m!1219909))

(declare-fun m!1219911 () Bool)

(assert (=> b!1331651 m!1219911))

(declare-fun m!1219913 () Bool)

(assert (=> b!1331651 m!1219913))

(assert (=> b!1331651 m!1219901))

(declare-fun m!1219915 () Bool)

(assert (=> b!1331651 m!1219915))

(declare-fun m!1219917 () Bool)

(assert (=> b!1331651 m!1219917))

(assert (=> b!1331651 m!1219907))

(declare-fun m!1219919 () Bool)

(assert (=> b!1331651 m!1219919))

(declare-fun m!1219921 () Bool)

(assert (=> b!1331651 m!1219921))

(declare-fun m!1219923 () Bool)

(assert (=> b!1331651 m!1219923))

(assert (=> b!1331651 m!1219921))

(declare-fun m!1219925 () Bool)

(assert (=> b!1331651 m!1219925))

(assert (=> b!1331649 m!1219921))

(assert (=> b!1331649 m!1219921))

(declare-fun m!1219927 () Bool)

(assert (=> b!1331649 m!1219927))

(declare-fun m!1219929 () Bool)

(assert (=> b!1331654 m!1219929))

(assert (=> b!1331658 m!1219921))

(declare-fun m!1219931 () Bool)

(assert (=> mapNonEmpty!56656 m!1219931))

(declare-fun m!1219933 () Bool)

(assert (=> start!112350 m!1219933))

(declare-fun m!1219935 () Bool)

(assert (=> start!112350 m!1219935))

(declare-fun m!1219937 () Bool)

(assert (=> start!112350 m!1219937))

(declare-fun m!1219939 () Bool)

(assert (=> b!1331656 m!1219939))

(assert (=> b!1331656 m!1219939))

(declare-fun m!1219941 () Bool)

(assert (=> b!1331656 m!1219941))

(check-sat (not mapNonEmpty!56656) (not b!1331654) b_and!49529 (not b!1331656) tp_is_empty!36655 (not start!112350) (not b!1331649) (not b_next!30745) (not b!1331652) (not b!1331651) (not b_lambda!23995))
(check-sat b_and!49529 (not b_next!30745))
