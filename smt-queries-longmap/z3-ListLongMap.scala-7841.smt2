; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98026 () Bool)

(assert start!98026)

(declare-fun b_free!23491 () Bool)

(declare-fun b_next!23491 () Bool)

(assert (=> start!98026 (= b_free!23491 (not b_next!23491))))

(declare-fun tp!83177 () Bool)

(declare-fun b_and!37775 () Bool)

(assert (=> start!98026 (= tp!83177 b_and!37775)))

(declare-fun b!1120053 () Bool)

(declare-fun e!638052 () Bool)

(assert (=> b!1120053 (= e!638052 true)))

(declare-datatypes ((V!42489 0))(
  ( (V!42490 (val!14067 Int)) )
))
(declare-fun zeroValue!944 () V!42489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72979 0))(
  ( (array!72980 (arr!35136 (Array (_ BitVec 32) (_ BitVec 64))) (size!35673 (_ BitVec 32))) )
))
(declare-fun lt!498074 () array!72979)

(declare-fun minValue!944 () V!42489)

(declare-datatypes ((tuple2!17664 0))(
  ( (tuple2!17665 (_1!8843 (_ BitVec 64)) (_2!8843 V!42489)) )
))
(declare-datatypes ((List!24453 0))(
  ( (Nil!24450) (Cons!24449 (h!25667 tuple2!17664) (t!34928 List!24453)) )
))
(declare-datatypes ((ListLongMap!15641 0))(
  ( (ListLongMap!15642 (toList!7836 List!24453)) )
))
(declare-fun lt!498073 () ListLongMap!15641)

(declare-datatypes ((ValueCell!13301 0))(
  ( (ValueCellFull!13301 (v!16696 V!42489)) (EmptyCell!13301) )
))
(declare-datatypes ((array!72981 0))(
  ( (array!72982 (arr!35137 (Array (_ BitVec 32) ValueCell!13301)) (size!35674 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72981)

(declare-fun getCurrentListMapNoExtraKeys!4366 (array!72979 array!72981 (_ BitVec 32) (_ BitVec 32) V!42489 V!42489 (_ BitVec 32) Int) ListLongMap!15641)

(declare-fun dynLambda!2455 (Int (_ BitVec 64)) V!42489)

(assert (=> b!1120053 (= lt!498073 (getCurrentListMapNoExtraKeys!4366 lt!498074 (array!72982 (store (arr!35137 _values!996) i!673 (ValueCellFull!13301 (dynLambda!2455 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35674 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!72979)

(declare-fun lt!498075 () ListLongMap!15641)

(assert (=> b!1120053 (= lt!498075 (getCurrentListMapNoExtraKeys!4366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!747747 () Bool)

(declare-fun e!638048 () Bool)

(assert (=> start!98026 (=> (not res!747747) (not e!638048))))

(assert (=> start!98026 (= res!747747 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35673 _keys!1208))))))

(assert (=> start!98026 e!638048))

(declare-fun tp_is_empty!28021 () Bool)

(assert (=> start!98026 tp_is_empty!28021))

(declare-fun array_inv!27054 (array!72979) Bool)

(assert (=> start!98026 (array_inv!27054 _keys!1208)))

(assert (=> start!98026 true))

(assert (=> start!98026 tp!83177))

(declare-fun e!638049 () Bool)

(declare-fun array_inv!27055 (array!72981) Bool)

(assert (=> start!98026 (and (array_inv!27055 _values!996) e!638049)))

(declare-fun b!1120054 () Bool)

(declare-fun res!747741 () Bool)

(assert (=> b!1120054 (=> (not res!747741) (not e!638048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72979 (_ BitVec 32)) Bool)

(assert (=> b!1120054 (= res!747741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120055 () Bool)

(declare-fun res!747745 () Bool)

(assert (=> b!1120055 (=> (not res!747745) (not e!638048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120055 (= res!747745 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43849 () Bool)

(declare-fun mapRes!43849 () Bool)

(assert (=> mapIsEmpty!43849 mapRes!43849))

(declare-fun b!1120056 () Bool)

(declare-fun e!638047 () Bool)

(assert (=> b!1120056 (= e!638049 (and e!638047 mapRes!43849))))

(declare-fun condMapEmpty!43849 () Bool)

(declare-fun mapDefault!43849 () ValueCell!13301)

(assert (=> b!1120056 (= condMapEmpty!43849 (= (arr!35137 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13301)) mapDefault!43849)))))

(declare-fun mapNonEmpty!43849 () Bool)

(declare-fun tp!83176 () Bool)

(declare-fun e!638046 () Bool)

(assert (=> mapNonEmpty!43849 (= mapRes!43849 (and tp!83176 e!638046))))

(declare-fun mapValue!43849 () ValueCell!13301)

(declare-fun mapKey!43849 () (_ BitVec 32))

(declare-fun mapRest!43849 () (Array (_ BitVec 32) ValueCell!13301))

(assert (=> mapNonEmpty!43849 (= (arr!35137 _values!996) (store mapRest!43849 mapKey!43849 mapValue!43849))))

(declare-fun b!1120057 () Bool)

(declare-fun res!747739 () Bool)

(assert (=> b!1120057 (=> (not res!747739) (not e!638048))))

(assert (=> b!1120057 (= res!747739 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35673 _keys!1208))))))

(declare-fun b!1120058 () Bool)

(declare-fun res!747744 () Bool)

(assert (=> b!1120058 (=> (not res!747744) (not e!638048))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1120058 (= res!747744 (= (select (arr!35136 _keys!1208) i!673) k0!934))))

(declare-fun b!1120059 () Bool)

(declare-fun res!747743 () Bool)

(assert (=> b!1120059 (=> (not res!747743) (not e!638048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120059 (= res!747743 (validKeyInArray!0 k0!934))))

(declare-fun b!1120060 () Bool)

(declare-fun res!747746 () Bool)

(assert (=> b!1120060 (=> (not res!747746) (not e!638048))))

(assert (=> b!1120060 (= res!747746 (and (= (size!35674 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35673 _keys!1208) (size!35674 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120061 () Bool)

(declare-fun res!747748 () Bool)

(assert (=> b!1120061 (=> (not res!747748) (not e!638048))))

(declare-datatypes ((List!24454 0))(
  ( (Nil!24451) (Cons!24450 (h!25668 (_ BitVec 64)) (t!34929 List!24454)) )
))
(declare-fun arrayNoDuplicates!0 (array!72979 (_ BitVec 32) List!24454) Bool)

(assert (=> b!1120061 (= res!747748 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24451))))

(declare-fun b!1120062 () Bool)

(assert (=> b!1120062 (= e!638046 tp_is_empty!28021)))

(declare-fun b!1120063 () Bool)

(declare-fun e!638050 () Bool)

(assert (=> b!1120063 (= e!638048 e!638050)))

(declare-fun res!747738 () Bool)

(assert (=> b!1120063 (=> (not res!747738) (not e!638050))))

(assert (=> b!1120063 (= res!747738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498074 mask!1564))))

(assert (=> b!1120063 (= lt!498074 (array!72980 (store (arr!35136 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35673 _keys!1208)))))

(declare-fun b!1120064 () Bool)

(assert (=> b!1120064 (= e!638047 tp_is_empty!28021)))

(declare-fun b!1120065 () Bool)

(declare-fun res!747740 () Bool)

(assert (=> b!1120065 (=> (not res!747740) (not e!638050))))

(assert (=> b!1120065 (= res!747740 (arrayNoDuplicates!0 lt!498074 #b00000000000000000000000000000000 Nil!24451))))

(declare-fun b!1120066 () Bool)

(assert (=> b!1120066 (= e!638050 (not e!638052))))

(declare-fun res!747742 () Bool)

(assert (=> b!1120066 (=> res!747742 e!638052)))

(assert (=> b!1120066 (= res!747742 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120066 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36697 0))(
  ( (Unit!36698) )
))
(declare-fun lt!498076 () Unit!36697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72979 (_ BitVec 64) (_ BitVec 32)) Unit!36697)

(assert (=> b!1120066 (= lt!498076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98026 res!747747) b!1120055))

(assert (= (and b!1120055 res!747745) b!1120060))

(assert (= (and b!1120060 res!747746) b!1120054))

(assert (= (and b!1120054 res!747741) b!1120061))

(assert (= (and b!1120061 res!747748) b!1120057))

(assert (= (and b!1120057 res!747739) b!1120059))

(assert (= (and b!1120059 res!747743) b!1120058))

(assert (= (and b!1120058 res!747744) b!1120063))

(assert (= (and b!1120063 res!747738) b!1120065))

(assert (= (and b!1120065 res!747740) b!1120066))

(assert (= (and b!1120066 (not res!747742)) b!1120053))

(assert (= (and b!1120056 condMapEmpty!43849) mapIsEmpty!43849))

(assert (= (and b!1120056 (not condMapEmpty!43849)) mapNonEmpty!43849))

(get-info :version)

(assert (= (and mapNonEmpty!43849 ((_ is ValueCellFull!13301) mapValue!43849)) b!1120062))

(assert (= (and b!1120056 ((_ is ValueCellFull!13301) mapDefault!43849)) b!1120064))

(assert (= start!98026 b!1120056))

(declare-fun b_lambda!18471 () Bool)

(assert (=> (not b_lambda!18471) (not b!1120053)))

(declare-fun t!34927 () Bool)

(declare-fun tb!8295 () Bool)

(assert (=> (and start!98026 (= defaultEntry!1004 defaultEntry!1004) t!34927) tb!8295))

(declare-fun result!17159 () Bool)

(assert (=> tb!8295 (= result!17159 tp_is_empty!28021)))

(assert (=> b!1120053 t!34927))

(declare-fun b_and!37777 () Bool)

(assert (= b_and!37775 (and (=> t!34927 result!17159) b_and!37777)))

(declare-fun m!1035843 () Bool)

(assert (=> b!1120065 m!1035843))

(declare-fun m!1035845 () Bool)

(assert (=> b!1120061 m!1035845))

(declare-fun m!1035847 () Bool)

(assert (=> start!98026 m!1035847))

(declare-fun m!1035849 () Bool)

(assert (=> start!98026 m!1035849))

(declare-fun m!1035851 () Bool)

(assert (=> b!1120055 m!1035851))

(declare-fun m!1035853 () Bool)

(assert (=> b!1120066 m!1035853))

(declare-fun m!1035855 () Bool)

(assert (=> b!1120066 m!1035855))

(declare-fun m!1035857 () Bool)

(assert (=> b!1120058 m!1035857))

(declare-fun m!1035859 () Bool)

(assert (=> mapNonEmpty!43849 m!1035859))

(declare-fun m!1035861 () Bool)

(assert (=> b!1120053 m!1035861))

(declare-fun m!1035863 () Bool)

(assert (=> b!1120053 m!1035863))

(declare-fun m!1035865 () Bool)

(assert (=> b!1120053 m!1035865))

(declare-fun m!1035867 () Bool)

(assert (=> b!1120053 m!1035867))

(declare-fun m!1035869 () Bool)

(assert (=> b!1120063 m!1035869))

(declare-fun m!1035871 () Bool)

(assert (=> b!1120063 m!1035871))

(declare-fun m!1035873 () Bool)

(assert (=> b!1120059 m!1035873))

(declare-fun m!1035875 () Bool)

(assert (=> b!1120054 m!1035875))

(check-sat b_and!37777 (not b!1120066) (not start!98026) tp_is_empty!28021 (not b!1120063) (not mapNonEmpty!43849) (not b!1120054) (not b!1120055) (not b!1120061) (not b_next!23491) (not b!1120053) (not b_lambda!18471) (not b!1120059) (not b!1120065))
(check-sat b_and!37777 (not b_next!23491))
