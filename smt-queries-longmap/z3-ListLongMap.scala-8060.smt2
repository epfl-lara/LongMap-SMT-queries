; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99194 () Bool)

(assert start!99194)

(declare-fun b_free!24805 () Bool)

(declare-fun b_next!24805 () Bool)

(assert (=> start!99194 (= b_free!24805 (not b_next!24805))))

(declare-fun tp!87126 () Bool)

(declare-fun b_and!40437 () Bool)

(assert (=> start!99194 (= tp!87126 b_and!40437)))

(declare-fun b!1167847 () Bool)

(declare-fun e!663745 () Bool)

(assert (=> b!1167847 (= e!663745 true)))

(declare-datatypes ((V!44241 0))(
  ( (V!44242 (val!14724 Int)) )
))
(declare-fun zeroValue!944 () V!44241)

(declare-datatypes ((array!75418 0))(
  ( (array!75419 (arr!36360 (Array (_ BitVec 32) (_ BitVec 64))) (size!36898 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75418)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!525651 () array!75418)

(declare-datatypes ((ValueCell!13958 0))(
  ( (ValueCellFull!13958 (v!17360 V!44241)) (EmptyCell!13958) )
))
(declare-datatypes ((array!75420 0))(
  ( (array!75421 (arr!36361 (Array (_ BitVec 32) ValueCell!13958)) (size!36899 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75420)

(declare-fun minValue!944 () V!44241)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525649 () array!75420)

(declare-datatypes ((tuple2!18878 0))(
  ( (tuple2!18879 (_1!9450 (_ BitVec 64)) (_2!9450 V!44241)) )
))
(declare-datatypes ((List!25593 0))(
  ( (Nil!25590) (Cons!25589 (h!26798 tuple2!18878) (t!37381 List!25593)) )
))
(declare-datatypes ((ListLongMap!16847 0))(
  ( (ListLongMap!16848 (toList!8439 List!25593)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4915 (array!75418 array!75420 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) Int) ListLongMap!16847)

(declare-fun -!1448 (ListLongMap!16847 (_ BitVec 64)) ListLongMap!16847)

(assert (=> b!1167847 (= (getCurrentListMapNoExtraKeys!4915 lt!525651 lt!525649 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1448 (getCurrentListMapNoExtraKeys!4915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38367 0))(
  ( (Unit!38368) )
))
(declare-fun lt!525647 () Unit!38367)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 (array!75418 array!75420 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38367)

(assert (=> b!1167847 (= lt!525647 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167848 () Bool)

(declare-fun res!774802 () Bool)

(declare-fun e!663743 () Bool)

(assert (=> b!1167848 (=> (not res!774802) (not e!663743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167848 (= res!774802 (validKeyInArray!0 k0!934))))

(declare-fun res!774808 () Bool)

(assert (=> start!99194 (=> (not res!774808) (not e!663743))))

(assert (=> start!99194 (= res!774808 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36898 _keys!1208))))))

(assert (=> start!99194 e!663743))

(declare-fun tp_is_empty!29335 () Bool)

(assert (=> start!99194 tp_is_empty!29335))

(declare-fun array_inv!27900 (array!75418) Bool)

(assert (=> start!99194 (array_inv!27900 _keys!1208)))

(assert (=> start!99194 true))

(assert (=> start!99194 tp!87126))

(declare-fun e!663747 () Bool)

(declare-fun array_inv!27901 (array!75420) Bool)

(assert (=> start!99194 (and (array_inv!27901 _values!996) e!663747)))

(declare-fun b!1167849 () Bool)

(declare-fun e!663746 () Bool)

(assert (=> b!1167849 (= e!663746 e!663745)))

(declare-fun res!774807 () Bool)

(assert (=> b!1167849 (=> res!774807 e!663745)))

(assert (=> b!1167849 (= res!774807 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525650 () ListLongMap!16847)

(assert (=> b!1167849 (= lt!525650 (getCurrentListMapNoExtraKeys!4915 lt!525651 lt!525649 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2844 (Int (_ BitVec 64)) V!44241)

(assert (=> b!1167849 (= lt!525649 (array!75421 (store (arr!36361 _values!996) i!673 (ValueCellFull!13958 (dynLambda!2844 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36899 _values!996)))))

(declare-fun lt!525648 () ListLongMap!16847)

(assert (=> b!1167849 (= lt!525648 (getCurrentListMapNoExtraKeys!4915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167850 () Bool)

(declare-fun e!663740 () Bool)

(assert (=> b!1167850 (= e!663740 tp_is_empty!29335)))

(declare-fun b!1167851 () Bool)

(declare-fun res!774803 () Bool)

(assert (=> b!1167851 (=> (not res!774803) (not e!663743))))

(assert (=> b!1167851 (= res!774803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36898 _keys!1208))))))

(declare-fun b!1167852 () Bool)

(declare-fun res!774800 () Bool)

(assert (=> b!1167852 (=> (not res!774800) (not e!663743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75418 (_ BitVec 32)) Bool)

(assert (=> b!1167852 (= res!774800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167853 () Bool)

(declare-fun res!774799 () Bool)

(assert (=> b!1167853 (=> (not res!774799) (not e!663743))))

(declare-datatypes ((List!25594 0))(
  ( (Nil!25591) (Cons!25590 (h!26799 (_ BitVec 64)) (t!37382 List!25594)) )
))
(declare-fun arrayNoDuplicates!0 (array!75418 (_ BitVec 32) List!25594) Bool)

(assert (=> b!1167853 (= res!774799 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25591))))

(declare-fun b!1167854 () Bool)

(declare-fun e!663742 () Bool)

(assert (=> b!1167854 (= e!663742 (not e!663746))))

(declare-fun res!774801 () Bool)

(assert (=> b!1167854 (=> res!774801 e!663746)))

(assert (=> b!1167854 (= res!774801 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167854 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525646 () Unit!38367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75418 (_ BitVec 64) (_ BitVec 32)) Unit!38367)

(assert (=> b!1167854 (= lt!525646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167855 () Bool)

(declare-fun res!774809 () Bool)

(assert (=> b!1167855 (=> (not res!774809) (not e!663743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167855 (= res!774809 (validMask!0 mask!1564))))

(declare-fun b!1167856 () Bool)

(assert (=> b!1167856 (= e!663743 e!663742)))

(declare-fun res!774805 () Bool)

(assert (=> b!1167856 (=> (not res!774805) (not e!663742))))

(assert (=> b!1167856 (= res!774805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525651 mask!1564))))

(assert (=> b!1167856 (= lt!525651 (array!75419 (store (arr!36360 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36898 _keys!1208)))))

(declare-fun b!1167857 () Bool)

(declare-fun e!663744 () Bool)

(assert (=> b!1167857 (= e!663744 tp_is_empty!29335)))

(declare-fun b!1167858 () Bool)

(declare-fun res!774798 () Bool)

(assert (=> b!1167858 (=> (not res!774798) (not e!663743))))

(assert (=> b!1167858 (= res!774798 (= (select (arr!36360 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45827 () Bool)

(declare-fun mapRes!45827 () Bool)

(assert (=> mapIsEmpty!45827 mapRes!45827))

(declare-fun b!1167859 () Bool)

(assert (=> b!1167859 (= e!663747 (and e!663744 mapRes!45827))))

(declare-fun condMapEmpty!45827 () Bool)

(declare-fun mapDefault!45827 () ValueCell!13958)

(assert (=> b!1167859 (= condMapEmpty!45827 (= (arr!36361 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13958)) mapDefault!45827)))))

(declare-fun b!1167860 () Bool)

(declare-fun res!774806 () Bool)

(assert (=> b!1167860 (=> (not res!774806) (not e!663743))))

(assert (=> b!1167860 (= res!774806 (and (= (size!36899 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36898 _keys!1208) (size!36899 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167861 () Bool)

(declare-fun res!774804 () Bool)

(assert (=> b!1167861 (=> (not res!774804) (not e!663742))))

(assert (=> b!1167861 (= res!774804 (arrayNoDuplicates!0 lt!525651 #b00000000000000000000000000000000 Nil!25591))))

(declare-fun mapNonEmpty!45827 () Bool)

(declare-fun tp!87125 () Bool)

(assert (=> mapNonEmpty!45827 (= mapRes!45827 (and tp!87125 e!663740))))

(declare-fun mapRest!45827 () (Array (_ BitVec 32) ValueCell!13958))

(declare-fun mapValue!45827 () ValueCell!13958)

(declare-fun mapKey!45827 () (_ BitVec 32))

(assert (=> mapNonEmpty!45827 (= (arr!36361 _values!996) (store mapRest!45827 mapKey!45827 mapValue!45827))))

(assert (= (and start!99194 res!774808) b!1167855))

(assert (= (and b!1167855 res!774809) b!1167860))

(assert (= (and b!1167860 res!774806) b!1167852))

(assert (= (and b!1167852 res!774800) b!1167853))

(assert (= (and b!1167853 res!774799) b!1167851))

(assert (= (and b!1167851 res!774803) b!1167848))

(assert (= (and b!1167848 res!774802) b!1167858))

(assert (= (and b!1167858 res!774798) b!1167856))

(assert (= (and b!1167856 res!774805) b!1167861))

(assert (= (and b!1167861 res!774804) b!1167854))

(assert (= (and b!1167854 (not res!774801)) b!1167849))

(assert (= (and b!1167849 (not res!774807)) b!1167847))

(assert (= (and b!1167859 condMapEmpty!45827) mapIsEmpty!45827))

(assert (= (and b!1167859 (not condMapEmpty!45827)) mapNonEmpty!45827))

(get-info :version)

(assert (= (and mapNonEmpty!45827 ((_ is ValueCellFull!13958) mapValue!45827)) b!1167850))

(assert (= (and b!1167859 ((_ is ValueCellFull!13958) mapDefault!45827)) b!1167857))

(assert (= start!99194 b!1167859))

(declare-fun b_lambda!19893 () Bool)

(assert (=> (not b_lambda!19893) (not b!1167849)))

(declare-fun t!37380 () Bool)

(declare-fun tb!9609 () Bool)

(assert (=> (and start!99194 (= defaultEntry!1004 defaultEntry!1004) t!37380) tb!9609))

(declare-fun result!19791 () Bool)

(assert (=> tb!9609 (= result!19791 tp_is_empty!29335)))

(assert (=> b!1167849 t!37380))

(declare-fun b_and!40439 () Bool)

(assert (= b_and!40437 (and (=> t!37380 result!19791) b_and!40439)))

(declare-fun m!1075237 () Bool)

(assert (=> start!99194 m!1075237))

(declare-fun m!1075239 () Bool)

(assert (=> start!99194 m!1075239))

(declare-fun m!1075241 () Bool)

(assert (=> b!1167853 m!1075241))

(declare-fun m!1075243 () Bool)

(assert (=> b!1167856 m!1075243))

(declare-fun m!1075245 () Bool)

(assert (=> b!1167856 m!1075245))

(declare-fun m!1075247 () Bool)

(assert (=> b!1167855 m!1075247))

(declare-fun m!1075249 () Bool)

(assert (=> b!1167849 m!1075249))

(declare-fun m!1075251 () Bool)

(assert (=> b!1167849 m!1075251))

(declare-fun m!1075253 () Bool)

(assert (=> b!1167849 m!1075253))

(declare-fun m!1075255 () Bool)

(assert (=> b!1167849 m!1075255))

(declare-fun m!1075257 () Bool)

(assert (=> b!1167847 m!1075257))

(declare-fun m!1075259 () Bool)

(assert (=> b!1167847 m!1075259))

(assert (=> b!1167847 m!1075259))

(declare-fun m!1075261 () Bool)

(assert (=> b!1167847 m!1075261))

(declare-fun m!1075263 () Bool)

(assert (=> b!1167847 m!1075263))

(declare-fun m!1075265 () Bool)

(assert (=> b!1167858 m!1075265))

(declare-fun m!1075267 () Bool)

(assert (=> b!1167854 m!1075267))

(declare-fun m!1075269 () Bool)

(assert (=> b!1167854 m!1075269))

(declare-fun m!1075271 () Bool)

(assert (=> mapNonEmpty!45827 m!1075271))

(declare-fun m!1075273 () Bool)

(assert (=> b!1167848 m!1075273))

(declare-fun m!1075275 () Bool)

(assert (=> b!1167861 m!1075275))

(declare-fun m!1075277 () Bool)

(assert (=> b!1167852 m!1075277))

(check-sat (not b!1167861) (not start!99194) (not b!1167849) (not b!1167856) (not b_lambda!19893) tp_is_empty!29335 b_and!40439 (not b!1167848) (not b_next!24805) (not mapNonEmpty!45827) (not b!1167852) (not b!1167855) (not b!1167853) (not b!1167854) (not b!1167847))
(check-sat b_and!40439 (not b_next!24805))
