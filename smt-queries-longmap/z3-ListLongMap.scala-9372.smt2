; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111668 () Bool)

(assert start!111668)

(declare-fun b_free!30325 () Bool)

(declare-fun b_next!30325 () Bool)

(assert (=> start!111668 (= b_free!30325 (not b_next!30325))))

(declare-fun tp!106451 () Bool)

(declare-fun b_and!48791 () Bool)

(assert (=> start!111668 (= tp!106451 b_and!48791)))

(declare-fun b!1322835 () Bool)

(declare-fun res!878048 () Bool)

(declare-fun e!754245 () Bool)

(assert (=> b!1322835 (=> (not res!878048) (not e!754245))))

(declare-datatypes ((array!89143 0))(
  ( (array!89144 (arr!43046 (Array (_ BitVec 32) (_ BitVec 64))) (size!43598 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89143)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53297 0))(
  ( (V!53298 (val!18147 Int)) )
))
(declare-fun zeroValue!1279 () V!53297)

(declare-datatypes ((ValueCell!17174 0))(
  ( (ValueCellFull!17174 (v!20776 V!53297)) (EmptyCell!17174) )
))
(declare-datatypes ((array!89145 0))(
  ( (array!89146 (arr!43047 (Array (_ BitVec 32) ValueCell!17174)) (size!43599 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89145)

(declare-fun minValue!1279 () V!53297)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23458 0))(
  ( (tuple2!23459 (_1!11740 (_ BitVec 64)) (_2!11740 V!53297)) )
))
(declare-datatypes ((List!30593 0))(
  ( (Nil!30590) (Cons!30589 (h!31798 tuple2!23458) (t!44459 List!30593)) )
))
(declare-datatypes ((ListLongMap!21115 0))(
  ( (ListLongMap!21116 (toList!10573 List!30593)) )
))
(declare-fun contains!8656 (ListLongMap!21115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5456 (array!89143 array!89145 (_ BitVec 32) (_ BitVec 32) V!53297 V!53297 (_ BitVec 32) Int) ListLongMap!21115)

(assert (=> b!1322835 (= res!878048 (contains!8656 (getCurrentListMap!5456 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322836 () Bool)

(declare-fun e!754243 () Bool)

(declare-fun e!754244 () Bool)

(declare-fun mapRes!55865 () Bool)

(assert (=> b!1322836 (= e!754243 (and e!754244 mapRes!55865))))

(declare-fun condMapEmpty!55865 () Bool)

(declare-fun mapDefault!55865 () ValueCell!17174)

(assert (=> b!1322836 (= condMapEmpty!55865 (= (arr!43047 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17174)) mapDefault!55865)))))

(declare-fun b!1322837 () Bool)

(declare-fun res!878052 () Bool)

(assert (=> b!1322837 (=> (not res!878052) (not e!754245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322837 (= res!878052 (validKeyInArray!0 (select (arr!43046 _keys!1609) from!2000)))))

(declare-fun b!1322838 () Bool)

(declare-fun e!754246 () Bool)

(declare-fun tp_is_empty!36145 () Bool)

(assert (=> b!1322838 (= e!754246 tp_is_empty!36145)))

(declare-fun mapIsEmpty!55865 () Bool)

(assert (=> mapIsEmpty!55865 mapRes!55865))

(declare-fun mapNonEmpty!55865 () Bool)

(declare-fun tp!106452 () Bool)

(assert (=> mapNonEmpty!55865 (= mapRes!55865 (and tp!106452 e!754246))))

(declare-fun mapKey!55865 () (_ BitVec 32))

(declare-fun mapValue!55865 () ValueCell!17174)

(declare-fun mapRest!55865 () (Array (_ BitVec 32) ValueCell!17174))

(assert (=> mapNonEmpty!55865 (= (arr!43047 _values!1337) (store mapRest!55865 mapKey!55865 mapValue!55865))))

(declare-fun b!1322839 () Bool)

(declare-fun res!878051 () Bool)

(assert (=> b!1322839 (=> (not res!878051) (not e!754245))))

(assert (=> b!1322839 (= res!878051 (not (= (select (arr!43046 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322841 () Bool)

(declare-fun res!878049 () Bool)

(assert (=> b!1322841 (=> (not res!878049) (not e!754245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89143 (_ BitVec 32)) Bool)

(assert (=> b!1322841 (= res!878049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322842 () Bool)

(assert (=> b!1322842 (= e!754245 (not true))))

(declare-fun lt!588348 () ListLongMap!21115)

(declare-fun +!4612 (ListLongMap!21115 tuple2!23458) ListLongMap!21115)

(assert (=> b!1322842 (contains!8656 (+!4612 lt!588348 (tuple2!23459 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43407 0))(
  ( (Unit!43408) )
))
(declare-fun lt!588350 () Unit!43407)

(declare-fun addStillContains!1136 (ListLongMap!21115 (_ BitVec 64) V!53297 (_ BitVec 64)) Unit!43407)

(assert (=> b!1322842 (= lt!588350 (addStillContains!1136 lt!588348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1322842 (contains!8656 lt!588348 k0!1164)))

(declare-fun lt!588353 () ListLongMap!21115)

(declare-fun lt!588345 () tuple2!23458)

(assert (=> b!1322842 (= lt!588348 (+!4612 lt!588353 lt!588345))))

(declare-fun lt!588344 () Unit!43407)

(assert (=> b!1322842 (= lt!588344 (addStillContains!1136 lt!588353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322842 (contains!8656 lt!588353 k0!1164)))

(declare-fun lt!588349 () Unit!43407)

(declare-fun lt!588346 () V!53297)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!177 ((_ BitVec 64) (_ BitVec 64) V!53297 ListLongMap!21115) Unit!43407)

(assert (=> b!1322842 (= lt!588349 (lemmaInListMapAfterAddingDiffThenInBefore!177 k0!1164 (select (arr!43046 _keys!1609) from!2000) lt!588346 lt!588353))))

(declare-fun lt!588351 () ListLongMap!21115)

(assert (=> b!1322842 (contains!8656 lt!588351 k0!1164)))

(declare-fun lt!588354 () Unit!43407)

(assert (=> b!1322842 (= lt!588354 (lemmaInListMapAfterAddingDiffThenInBefore!177 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588351))))

(declare-fun lt!588347 () ListLongMap!21115)

(assert (=> b!1322842 (contains!8656 lt!588347 k0!1164)))

(declare-fun lt!588352 () Unit!43407)

(assert (=> b!1322842 (= lt!588352 (lemmaInListMapAfterAddingDiffThenInBefore!177 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588347))))

(assert (=> b!1322842 (= lt!588347 (+!4612 lt!588351 lt!588345))))

(assert (=> b!1322842 (= lt!588345 (tuple2!23459 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322842 (= lt!588351 (+!4612 lt!588353 (tuple2!23459 (select (arr!43046 _keys!1609) from!2000) lt!588346)))))

(declare-fun get!21679 (ValueCell!17174 V!53297) V!53297)

(declare-fun dynLambda!3542 (Int (_ BitVec 64)) V!53297)

(assert (=> b!1322842 (= lt!588346 (get!21679 (select (arr!43047 _values!1337) from!2000) (dynLambda!3542 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6245 (array!89143 array!89145 (_ BitVec 32) (_ BitVec 32) V!53297 V!53297 (_ BitVec 32) Int) ListLongMap!21115)

(assert (=> b!1322842 (= lt!588353 (getCurrentListMapNoExtraKeys!6245 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322843 () Bool)

(declare-fun res!878050 () Bool)

(assert (=> b!1322843 (=> (not res!878050) (not e!754245))))

(assert (=> b!1322843 (= res!878050 (and (= (size!43599 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43598 _keys!1609) (size!43599 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322844 () Bool)

(assert (=> b!1322844 (= e!754244 tp_is_empty!36145)))

(declare-fun b!1322845 () Bool)

(declare-fun res!878053 () Bool)

(assert (=> b!1322845 (=> (not res!878053) (not e!754245))))

(declare-datatypes ((List!30594 0))(
  ( (Nil!30591) (Cons!30590 (h!31799 (_ BitVec 64)) (t!44460 List!30594)) )
))
(declare-fun arrayNoDuplicates!0 (array!89143 (_ BitVec 32) List!30594) Bool)

(assert (=> b!1322845 (= res!878053 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30591))))

(declare-fun b!1322840 () Bool)

(declare-fun res!878054 () Bool)

(assert (=> b!1322840 (=> (not res!878054) (not e!754245))))

(assert (=> b!1322840 (= res!878054 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43598 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878055 () Bool)

(assert (=> start!111668 (=> (not res!878055) (not e!754245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111668 (= res!878055 (validMask!0 mask!2019))))

(assert (=> start!111668 e!754245))

(declare-fun array_inv!32681 (array!89143) Bool)

(assert (=> start!111668 (array_inv!32681 _keys!1609)))

(assert (=> start!111668 true))

(assert (=> start!111668 tp_is_empty!36145))

(declare-fun array_inv!32682 (array!89145) Bool)

(assert (=> start!111668 (and (array_inv!32682 _values!1337) e!754243)))

(assert (=> start!111668 tp!106451))

(assert (= (and start!111668 res!878055) b!1322843))

(assert (= (and b!1322843 res!878050) b!1322841))

(assert (= (and b!1322841 res!878049) b!1322845))

(assert (= (and b!1322845 res!878053) b!1322840))

(assert (= (and b!1322840 res!878054) b!1322835))

(assert (= (and b!1322835 res!878048) b!1322839))

(assert (= (and b!1322839 res!878051) b!1322837))

(assert (= (and b!1322837 res!878052) b!1322842))

(assert (= (and b!1322836 condMapEmpty!55865) mapIsEmpty!55865))

(assert (= (and b!1322836 (not condMapEmpty!55865)) mapNonEmpty!55865))

(get-info :version)

(assert (= (and mapNonEmpty!55865 ((_ is ValueCellFull!17174) mapValue!55865)) b!1322838))

(assert (= (and b!1322836 ((_ is ValueCellFull!17174) mapDefault!55865)) b!1322844))

(assert (= start!111668 b!1322836))

(declare-fun b_lambda!23641 () Bool)

(assert (=> (not b_lambda!23641) (not b!1322842)))

(declare-fun t!44458 () Bool)

(declare-fun tb!11669 () Bool)

(assert (=> (and start!111668 (= defaultEntry!1340 defaultEntry!1340) t!44458) tb!11669))

(declare-fun result!24401 () Bool)

(assert (=> tb!11669 (= result!24401 tp_is_empty!36145)))

(assert (=> b!1322842 t!44458))

(declare-fun b_and!48793 () Bool)

(assert (= b_and!48791 (and (=> t!44458 result!24401) b_and!48793)))

(declare-fun m!1210875 () Bool)

(assert (=> b!1322841 m!1210875))

(declare-fun m!1210877 () Bool)

(assert (=> start!111668 m!1210877))

(declare-fun m!1210879 () Bool)

(assert (=> start!111668 m!1210879))

(declare-fun m!1210881 () Bool)

(assert (=> start!111668 m!1210881))

(declare-fun m!1210883 () Bool)

(assert (=> b!1322839 m!1210883))

(declare-fun m!1210885 () Bool)

(assert (=> b!1322835 m!1210885))

(assert (=> b!1322835 m!1210885))

(declare-fun m!1210887 () Bool)

(assert (=> b!1322835 m!1210887))

(assert (=> b!1322837 m!1210883))

(assert (=> b!1322837 m!1210883))

(declare-fun m!1210889 () Bool)

(assert (=> b!1322837 m!1210889))

(declare-fun m!1210891 () Bool)

(assert (=> b!1322842 m!1210891))

(declare-fun m!1210893 () Bool)

(assert (=> b!1322842 m!1210893))

(declare-fun m!1210895 () Bool)

(assert (=> b!1322842 m!1210895))

(declare-fun m!1210897 () Bool)

(assert (=> b!1322842 m!1210897))

(declare-fun m!1210899 () Bool)

(assert (=> b!1322842 m!1210899))

(declare-fun m!1210901 () Bool)

(assert (=> b!1322842 m!1210901))

(assert (=> b!1322842 m!1210897))

(declare-fun m!1210903 () Bool)

(assert (=> b!1322842 m!1210903))

(declare-fun m!1210905 () Bool)

(assert (=> b!1322842 m!1210905))

(assert (=> b!1322842 m!1210883))

(declare-fun m!1210907 () Bool)

(assert (=> b!1322842 m!1210907))

(declare-fun m!1210909 () Bool)

(assert (=> b!1322842 m!1210909))

(declare-fun m!1210911 () Bool)

(assert (=> b!1322842 m!1210911))

(declare-fun m!1210913 () Bool)

(assert (=> b!1322842 m!1210913))

(declare-fun m!1210915 () Bool)

(assert (=> b!1322842 m!1210915))

(declare-fun m!1210917 () Bool)

(assert (=> b!1322842 m!1210917))

(declare-fun m!1210919 () Bool)

(assert (=> b!1322842 m!1210919))

(declare-fun m!1210921 () Bool)

(assert (=> b!1322842 m!1210921))

(assert (=> b!1322842 m!1210899))

(assert (=> b!1322842 m!1210915))

(declare-fun m!1210923 () Bool)

(assert (=> b!1322842 m!1210923))

(assert (=> b!1322842 m!1210883))

(declare-fun m!1210925 () Bool)

(assert (=> b!1322842 m!1210925))

(declare-fun m!1210927 () Bool)

(assert (=> mapNonEmpty!55865 m!1210927))

(declare-fun m!1210929 () Bool)

(assert (=> b!1322845 m!1210929))

(check-sat (not b!1322835) (not b_next!30325) (not start!111668) (not mapNonEmpty!55865) tp_is_empty!36145 (not b!1322842) (not b!1322841) b_and!48793 (not b_lambda!23641) (not b!1322845) (not b!1322837))
(check-sat b_and!48793 (not b_next!30325))
