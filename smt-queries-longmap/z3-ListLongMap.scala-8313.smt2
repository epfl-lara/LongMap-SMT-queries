; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101462 () Bool)

(assert start!101462)

(declare-fun b_free!26149 () Bool)

(declare-fun b_next!26149 () Bool)

(assert (=> start!101462 (= b_free!26149 (not b_next!26149))))

(declare-fun tp!91469 () Bool)

(declare-fun b_and!43417 () Bool)

(assert (=> start!101462 (= tp!91469 b_and!43417)))

(declare-fun b!1216839 () Bool)

(declare-fun res!807599 () Bool)

(declare-fun e!691029 () Bool)

(assert (=> b!1216839 (=> (not res!807599) (not e!691029))))

(declare-datatypes ((array!78521 0))(
  ( (array!78522 (arr!37889 (Array (_ BitVec 32) (_ BitVec 64))) (size!38426 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46265 0))(
  ( (V!46266 (val!15483 Int)) )
))
(declare-datatypes ((ValueCell!14717 0))(
  ( (ValueCellFull!14717 (v!18132 V!46265)) (EmptyCell!14717) )
))
(declare-datatypes ((array!78523 0))(
  ( (array!78524 (arr!37890 (Array (_ BitVec 32) ValueCell!14717)) (size!38427 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78523)

(assert (=> b!1216839 (= res!807599 (and (= (size!38427 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38426 _keys!1208) (size!38427 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216840 () Bool)

(declare-fun res!807596 () Bool)

(assert (=> b!1216840 (=> (not res!807596) (not e!691029))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216840 (= res!807596 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38426 _keys!1208))))))

(declare-fun b!1216841 () Bool)

(declare-fun e!691027 () Bool)

(declare-fun e!691031 () Bool)

(declare-fun mapRes!48154 () Bool)

(assert (=> b!1216841 (= e!691027 (and e!691031 mapRes!48154))))

(declare-fun condMapEmpty!48154 () Bool)

(declare-fun mapDefault!48154 () ValueCell!14717)

(assert (=> b!1216841 (= condMapEmpty!48154 (= (arr!37890 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14717)) mapDefault!48154)))))

(declare-fun mapNonEmpty!48154 () Bool)

(declare-fun tp!91468 () Bool)

(declare-fun e!691033 () Bool)

(assert (=> mapNonEmpty!48154 (= mapRes!48154 (and tp!91468 e!691033))))

(declare-fun mapValue!48154 () ValueCell!14717)

(declare-fun mapRest!48154 () (Array (_ BitVec 32) ValueCell!14717))

(declare-fun mapKey!48154 () (_ BitVec 32))

(assert (=> mapNonEmpty!48154 (= (arr!37890 _values!996) (store mapRest!48154 mapKey!48154 mapValue!48154))))

(declare-fun b!1216842 () Bool)

(declare-fun res!807602 () Bool)

(assert (=> b!1216842 (=> (not res!807602) (not e!691029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78521 (_ BitVec 32)) Bool)

(assert (=> b!1216842 (= res!807602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216843 () Bool)

(declare-fun tp_is_empty!30853 () Bool)

(assert (=> b!1216843 (= e!691031 tp_is_empty!30853)))

(declare-fun b!1216844 () Bool)

(declare-fun e!691028 () Bool)

(assert (=> b!1216844 (= e!691029 e!691028)))

(declare-fun res!807598 () Bool)

(assert (=> b!1216844 (=> (not res!807598) (not e!691028))))

(declare-fun lt!553127 () array!78521)

(assert (=> b!1216844 (= res!807598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553127 mask!1564))))

(assert (=> b!1216844 (= lt!553127 (array!78522 (store (arr!37889 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38426 _keys!1208)))))

(declare-fun b!1216846 () Bool)

(declare-fun res!807601 () Bool)

(assert (=> b!1216846 (=> (not res!807601) (not e!691029))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216846 (= res!807601 (validKeyInArray!0 k0!934))))

(declare-fun b!1216847 () Bool)

(declare-fun res!807594 () Bool)

(assert (=> b!1216847 (=> (not res!807594) (not e!691029))))

(assert (=> b!1216847 (= res!807594 (= (select (arr!37889 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48154 () Bool)

(assert (=> mapIsEmpty!48154 mapRes!48154))

(declare-fun b!1216848 () Bool)

(declare-fun res!807604 () Bool)

(assert (=> b!1216848 (=> (not res!807604) (not e!691028))))

(declare-datatypes ((List!26723 0))(
  ( (Nil!26720) (Cons!26719 (h!27937 (_ BitVec 64)) (t!39844 List!26723)) )
))
(declare-fun arrayNoDuplicates!0 (array!78521 (_ BitVec 32) List!26723) Bool)

(assert (=> b!1216848 (= res!807604 (arrayNoDuplicates!0 lt!553127 #b00000000000000000000000000000000 Nil!26720))))

(declare-fun b!1216849 () Bool)

(declare-fun res!807595 () Bool)

(assert (=> b!1216849 (=> (not res!807595) (not e!691029))))

(assert (=> b!1216849 (= res!807595 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26720))))

(declare-fun b!1216850 () Bool)

(declare-fun e!691032 () Bool)

(assert (=> b!1216850 (= e!691028 (not e!691032))))

(declare-fun res!807600 () Bool)

(assert (=> b!1216850 (=> res!807600 e!691032)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216850 (= res!807600 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216850 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40280 0))(
  ( (Unit!40281) )
))
(declare-fun lt!553126 () Unit!40280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78521 (_ BitVec 64) (_ BitVec 32)) Unit!40280)

(assert (=> b!1216850 (= lt!553126 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216845 () Bool)

(assert (=> b!1216845 (= e!691033 tp_is_empty!30853)))

(declare-fun res!807597 () Bool)

(assert (=> start!101462 (=> (not res!807597) (not e!691029))))

(assert (=> start!101462 (= res!807597 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38426 _keys!1208))))))

(assert (=> start!101462 e!691029))

(assert (=> start!101462 tp_is_empty!30853))

(declare-fun array_inv!28918 (array!78521) Bool)

(assert (=> start!101462 (array_inv!28918 _keys!1208)))

(assert (=> start!101462 true))

(assert (=> start!101462 tp!91469))

(declare-fun array_inv!28919 (array!78523) Bool)

(assert (=> start!101462 (and (array_inv!28919 _values!996) e!691027)))

(declare-fun b!1216851 () Bool)

(assert (=> b!1216851 (= e!691032 true)))

(declare-fun zeroValue!944 () V!46265)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46265)

(declare-datatypes ((tuple2!19918 0))(
  ( (tuple2!19919 (_1!9970 (_ BitVec 64)) (_2!9970 V!46265)) )
))
(declare-datatypes ((List!26724 0))(
  ( (Nil!26721) (Cons!26720 (h!27938 tuple2!19918) (t!39845 List!26724)) )
))
(declare-datatypes ((ListLongMap!17895 0))(
  ( (ListLongMap!17896 (toList!8963 List!26724)) )
))
(declare-fun lt!553128 () ListLongMap!17895)

(declare-fun getCurrentListMapNoExtraKeys!5420 (array!78521 array!78523 (_ BitVec 32) (_ BitVec 32) V!46265 V!46265 (_ BitVec 32) Int) ListLongMap!17895)

(declare-fun dynLambda!3332 (Int (_ BitVec 64)) V!46265)

(assert (=> b!1216851 (= lt!553128 (getCurrentListMapNoExtraKeys!5420 lt!553127 (array!78524 (store (arr!37890 _values!996) i!673 (ValueCellFull!14717 (dynLambda!3332 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38427 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553125 () ListLongMap!17895)

(assert (=> b!1216851 (= lt!553125 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216852 () Bool)

(declare-fun res!807603 () Bool)

(assert (=> b!1216852 (=> (not res!807603) (not e!691029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216852 (= res!807603 (validMask!0 mask!1564))))

(assert (= (and start!101462 res!807597) b!1216852))

(assert (= (and b!1216852 res!807603) b!1216839))

(assert (= (and b!1216839 res!807599) b!1216842))

(assert (= (and b!1216842 res!807602) b!1216849))

(assert (= (and b!1216849 res!807595) b!1216840))

(assert (= (and b!1216840 res!807596) b!1216846))

(assert (= (and b!1216846 res!807601) b!1216847))

(assert (= (and b!1216847 res!807594) b!1216844))

(assert (= (and b!1216844 res!807598) b!1216848))

(assert (= (and b!1216848 res!807604) b!1216850))

(assert (= (and b!1216850 (not res!807600)) b!1216851))

(assert (= (and b!1216841 condMapEmpty!48154) mapIsEmpty!48154))

(assert (= (and b!1216841 (not condMapEmpty!48154)) mapNonEmpty!48154))

(get-info :version)

(assert (= (and mapNonEmpty!48154 ((_ is ValueCellFull!14717) mapValue!48154)) b!1216845))

(assert (= (and b!1216841 ((_ is ValueCellFull!14717) mapDefault!48154)) b!1216843))

(assert (= start!101462 b!1216841))

(declare-fun b_lambda!21819 () Bool)

(assert (=> (not b_lambda!21819) (not b!1216851)))

(declare-fun t!39843 () Bool)

(declare-fun tb!10941 () Bool)

(assert (=> (and start!101462 (= defaultEntry!1004 defaultEntry!1004) t!39843) tb!10941))

(declare-fun result!22487 () Bool)

(assert (=> tb!10941 (= result!22487 tp_is_empty!30853)))

(assert (=> b!1216851 t!39843))

(declare-fun b_and!43419 () Bool)

(assert (= b_and!43417 (and (=> t!39843 result!22487) b_and!43419)))

(declare-fun m!1122087 () Bool)

(assert (=> b!1216847 m!1122087))

(declare-fun m!1122089 () Bool)

(assert (=> b!1216849 m!1122089))

(declare-fun m!1122091 () Bool)

(assert (=> mapNonEmpty!48154 m!1122091))

(declare-fun m!1122093 () Bool)

(assert (=> b!1216850 m!1122093))

(declare-fun m!1122095 () Bool)

(assert (=> b!1216850 m!1122095))

(declare-fun m!1122097 () Bool)

(assert (=> b!1216848 m!1122097))

(declare-fun m!1122099 () Bool)

(assert (=> b!1216844 m!1122099))

(declare-fun m!1122101 () Bool)

(assert (=> b!1216844 m!1122101))

(declare-fun m!1122103 () Bool)

(assert (=> b!1216842 m!1122103))

(declare-fun m!1122105 () Bool)

(assert (=> start!101462 m!1122105))

(declare-fun m!1122107 () Bool)

(assert (=> start!101462 m!1122107))

(declare-fun m!1122109 () Bool)

(assert (=> b!1216846 m!1122109))

(declare-fun m!1122111 () Bool)

(assert (=> b!1216852 m!1122111))

(declare-fun m!1122113 () Bool)

(assert (=> b!1216851 m!1122113))

(declare-fun m!1122115 () Bool)

(assert (=> b!1216851 m!1122115))

(declare-fun m!1122117 () Bool)

(assert (=> b!1216851 m!1122117))

(declare-fun m!1122119 () Bool)

(assert (=> b!1216851 m!1122119))

(check-sat (not mapNonEmpty!48154) (not b!1216842) (not b!1216850) (not start!101462) (not b!1216849) (not b!1216851) (not b!1216852) (not b!1216848) (not b_lambda!21819) (not b!1216846) tp_is_empty!30853 (not b_next!26149) b_and!43419 (not b!1216844))
(check-sat b_and!43419 (not b_next!26149))
