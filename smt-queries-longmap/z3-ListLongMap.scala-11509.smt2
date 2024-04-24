; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134350 () Bool)

(assert start!134350)

(declare-fun b_free!32161 () Bool)

(declare-fun b_next!32161 () Bool)

(assert (=> start!134350 (= b_free!32161 (not b_next!32161))))

(declare-fun tp!113785 () Bool)

(declare-fun b_and!51765 () Bool)

(assert (=> start!134350 (= tp!113785 b_and!51765)))

(declare-fun res!1071121 () Bool)

(declare-fun e!874209 () Bool)

(assert (=> start!134350 (=> (not res!1071121) (not e!874209))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134350 (= res!1071121 (validMask!0 mask!947))))

(assert (=> start!134350 e!874209))

(assert (=> start!134350 tp!113785))

(declare-fun tp_is_empty!38935 () Bool)

(assert (=> start!134350 tp_is_empty!38935))

(assert (=> start!134350 true))

(declare-datatypes ((array!104678 0))(
  ( (array!104679 (arr!50519 (Array (_ BitVec 32) (_ BitVec 64))) (size!51070 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104678)

(declare-fun array_inv!39497 (array!104678) Bool)

(assert (=> start!134350 (array_inv!39497 _keys!637)))

(declare-datatypes ((V!60121 0))(
  ( (V!60122 (val!19551 Int)) )
))
(declare-datatypes ((ValueCell!18437 0))(
  ( (ValueCellFull!18437 (v!22299 V!60121)) (EmptyCell!18437) )
))
(declare-datatypes ((array!104680 0))(
  ( (array!104681 (arr!50520 (Array (_ BitVec 32) ValueCell!18437)) (size!51071 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104680)

(declare-fun e!874210 () Bool)

(declare-fun array_inv!39498 (array!104680) Bool)

(assert (=> start!134350 (and (array_inv!39498 _values!487) e!874210)))

(declare-fun mapIsEmpty!59794 () Bool)

(declare-fun mapRes!59794 () Bool)

(assert (=> mapIsEmpty!59794 mapRes!59794))

(declare-fun mapNonEmpty!59794 () Bool)

(declare-fun tp!113784 () Bool)

(declare-fun e!874208 () Bool)

(assert (=> mapNonEmpty!59794 (= mapRes!59794 (and tp!113784 e!874208))))

(declare-fun mapRest!59794 () (Array (_ BitVec 32) ValueCell!18437))

(declare-fun mapValue!59794 () ValueCell!18437)

(declare-fun mapKey!59794 () (_ BitVec 32))

(assert (=> mapNonEmpty!59794 (= (arr!50520 _values!487) (store mapRest!59794 mapKey!59794 mapValue!59794))))

(declare-fun b!1568131 () Bool)

(declare-fun e!874207 () Bool)

(assert (=> b!1568131 (= e!874207 tp_is_empty!38935)))

(declare-fun b!1568132 () Bool)

(declare-fun res!1071120 () Bool)

(assert (=> b!1568132 (=> (not res!1071120) (not e!874209))))

(declare-datatypes ((List!36642 0))(
  ( (Nil!36639) (Cons!36638 (h!38102 (_ BitVec 64)) (t!51509 List!36642)) )
))
(declare-fun arrayNoDuplicates!0 (array!104678 (_ BitVec 32) List!36642) Bool)

(assert (=> b!1568132 (= res!1071120 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36639))))

(declare-fun b!1568133 () Bool)

(declare-fun res!1071118 () Bool)

(assert (=> b!1568133 (=> (not res!1071118) (not e!874209))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568133 (= res!1071118 (validKeyInArray!0 (select (arr!50519 _keys!637) from!782)))))

(declare-fun b!1568134 () Bool)

(declare-fun res!1071123 () Bool)

(assert (=> b!1568134 (=> (not res!1071123) (not e!874209))))

(assert (=> b!1568134 (= res!1071123 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51070 _keys!637)) (bvslt from!782 (size!51070 _keys!637))))))

(declare-fun b!1568135 () Bool)

(declare-fun res!1071122 () Bool)

(assert (=> b!1568135 (=> (not res!1071122) (not e!874209))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1568135 (= res!1071122 (and (= (size!51071 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51070 _keys!637) (size!51071 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1568136 () Bool)

(declare-fun res!1071119 () Bool)

(assert (=> b!1568136 (=> (not res!1071119) (not e!874209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104678 (_ BitVec 32)) Bool)

(assert (=> b!1568136 (= res!1071119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1568137 () Bool)

(assert (=> b!1568137 (= e!874209 (not true))))

(declare-fun lt!673282 () Bool)

(declare-datatypes ((tuple2!25276 0))(
  ( (tuple2!25277 (_1!12649 (_ BitVec 64)) (_2!12649 V!60121)) )
))
(declare-datatypes ((List!36643 0))(
  ( (Nil!36640) (Cons!36639 (h!38103 tuple2!25276) (t!51510 List!36643)) )
))
(declare-datatypes ((ListLongMap!22719 0))(
  ( (ListLongMap!22720 (toList!11375 List!36643)) )
))
(declare-fun lt!673279 () ListLongMap!22719)

(declare-fun contains!10378 (ListLongMap!22719 (_ BitVec 64)) Bool)

(assert (=> b!1568137 (= lt!673282 (contains!10378 lt!673279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568137 (not (contains!10378 lt!673279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673280 () V!60121)

(declare-fun lt!673281 () ListLongMap!22719)

(declare-fun +!5113 (ListLongMap!22719 tuple2!25276) ListLongMap!22719)

(assert (=> b!1568137 (= lt!673279 (+!5113 lt!673281 (tuple2!25277 (select (arr!50519 _keys!637) from!782) lt!673280)))))

(declare-datatypes ((Unit!51921 0))(
  ( (Unit!51922) )
))
(declare-fun lt!673278 () Unit!51921)

(declare-fun addStillNotContains!564 (ListLongMap!22719 (_ BitVec 64) V!60121 (_ BitVec 64)) Unit!51921)

(assert (=> b!1568137 (= lt!673278 (addStillNotContains!564 lt!673281 (select (arr!50519 _keys!637) from!782) lt!673280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26383 (ValueCell!18437 V!60121) V!60121)

(declare-fun dynLambda!3911 (Int (_ BitVec 64)) V!60121)

(assert (=> b!1568137 (= lt!673280 (get!26383 (select (arr!50520 _values!487) from!782) (dynLambda!3911 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60121)

(declare-fun minValue!453 () V!60121)

(declare-fun getCurrentListMapNoExtraKeys!6758 (array!104678 array!104680 (_ BitVec 32) (_ BitVec 32) V!60121 V!60121 (_ BitVec 32) Int) ListLongMap!22719)

(assert (=> b!1568137 (= lt!673281 (getCurrentListMapNoExtraKeys!6758 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1568138 () Bool)

(assert (=> b!1568138 (= e!874208 tp_is_empty!38935)))

(declare-fun b!1568139 () Bool)

(assert (=> b!1568139 (= e!874210 (and e!874207 mapRes!59794))))

(declare-fun condMapEmpty!59794 () Bool)

(declare-fun mapDefault!59794 () ValueCell!18437)

(assert (=> b!1568139 (= condMapEmpty!59794 (= (arr!50520 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18437)) mapDefault!59794)))))

(assert (= (and start!134350 res!1071121) b!1568135))

(assert (= (and b!1568135 res!1071122) b!1568136))

(assert (= (and b!1568136 res!1071119) b!1568132))

(assert (= (and b!1568132 res!1071120) b!1568134))

(assert (= (and b!1568134 res!1071123) b!1568133))

(assert (= (and b!1568133 res!1071118) b!1568137))

(assert (= (and b!1568139 condMapEmpty!59794) mapIsEmpty!59794))

(assert (= (and b!1568139 (not condMapEmpty!59794)) mapNonEmpty!59794))

(get-info :version)

(assert (= (and mapNonEmpty!59794 ((_ is ValueCellFull!18437) mapValue!59794)) b!1568138))

(assert (= (and b!1568139 ((_ is ValueCellFull!18437) mapDefault!59794)) b!1568131))

(assert (= start!134350 b!1568139))

(declare-fun b_lambda!24969 () Bool)

(assert (=> (not b_lambda!24969) (not b!1568137)))

(declare-fun t!51508 () Bool)

(declare-fun tb!12621 () Bool)

(assert (=> (and start!134350 (= defaultEntry!495 defaultEntry!495) t!51508) tb!12621))

(declare-fun result!26541 () Bool)

(assert (=> tb!12621 (= result!26541 tp_is_empty!38935)))

(assert (=> b!1568137 t!51508))

(declare-fun b_and!51767 () Bool)

(assert (= b_and!51765 (and (=> t!51508 result!26541) b_and!51767)))

(declare-fun m!1442869 () Bool)

(assert (=> b!1568132 m!1442869))

(declare-fun m!1442871 () Bool)

(assert (=> b!1568137 m!1442871))

(declare-fun m!1442873 () Bool)

(assert (=> b!1568137 m!1442873))

(declare-fun m!1442875 () Bool)

(assert (=> b!1568137 m!1442875))

(declare-fun m!1442877 () Bool)

(assert (=> b!1568137 m!1442877))

(declare-fun m!1442879 () Bool)

(assert (=> b!1568137 m!1442879))

(declare-fun m!1442881 () Bool)

(assert (=> b!1568137 m!1442881))

(assert (=> b!1568137 m!1442871))

(assert (=> b!1568137 m!1442877))

(declare-fun m!1442883 () Bool)

(assert (=> b!1568137 m!1442883))

(declare-fun m!1442885 () Bool)

(assert (=> b!1568137 m!1442885))

(assert (=> b!1568137 m!1442873))

(declare-fun m!1442887 () Bool)

(assert (=> b!1568137 m!1442887))

(declare-fun m!1442889 () Bool)

(assert (=> b!1568136 m!1442889))

(declare-fun m!1442891 () Bool)

(assert (=> start!134350 m!1442891))

(declare-fun m!1442893 () Bool)

(assert (=> start!134350 m!1442893))

(declare-fun m!1442895 () Bool)

(assert (=> start!134350 m!1442895))

(declare-fun m!1442897 () Bool)

(assert (=> mapNonEmpty!59794 m!1442897))

(assert (=> b!1568133 m!1442877))

(assert (=> b!1568133 m!1442877))

(declare-fun m!1442899 () Bool)

(assert (=> b!1568133 m!1442899))

(check-sat tp_is_empty!38935 (not start!134350) (not b_lambda!24969) (not b!1568132) (not b!1568133) (not b!1568136) (not b!1568137) (not b_next!32161) b_and!51767 (not mapNonEmpty!59794))
(check-sat b_and!51767 (not b_next!32161))
