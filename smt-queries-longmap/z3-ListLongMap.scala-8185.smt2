; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100212 () Bool)

(assert start!100212)

(declare-fun b_free!25555 () Bool)

(declare-fun b_next!25555 () Bool)

(assert (=> start!100212 (= b_free!25555 (not b_next!25555))))

(declare-fun tp!89378 () Bool)

(declare-fun b_and!41979 () Bool)

(assert (=> start!100212 (= tp!89378 b_and!41979)))

(declare-fun b!1192005 () Bool)

(declare-fun res!792438 () Bool)

(declare-fun e!677733 () Bool)

(assert (=> b!1192005 (=> (not res!792438) (not e!677733))))

(declare-datatypes ((array!77005 0))(
  ( (array!77006 (arr!37146 (Array (_ BitVec 32) (_ BitVec 64))) (size!37683 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77005)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77005 (_ BitVec 32)) Bool)

(assert (=> b!1192005 (= res!792438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192006 () Bool)

(declare-fun res!792442 () Bool)

(assert (=> b!1192006 (=> (not res!792442) (not e!677733))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45241 0))(
  ( (V!45242 (val!15099 Int)) )
))
(declare-datatypes ((ValueCell!14333 0))(
  ( (ValueCellFull!14333 (v!17733 V!45241)) (EmptyCell!14333) )
))
(declare-datatypes ((array!77007 0))(
  ( (array!77008 (arr!37147 (Array (_ BitVec 32) ValueCell!14333)) (size!37684 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77007)

(assert (=> b!1192006 (= res!792442 (and (= (size!37684 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37683 _keys!1208) (size!37684 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46955 () Bool)

(declare-fun mapRes!46955 () Bool)

(declare-fun tp!89379 () Bool)

(declare-fun e!677732 () Bool)

(assert (=> mapNonEmpty!46955 (= mapRes!46955 (and tp!89379 e!677732))))

(declare-fun mapRest!46955 () (Array (_ BitVec 32) ValueCell!14333))

(declare-fun mapKey!46955 () (_ BitVec 32))

(declare-fun mapValue!46955 () ValueCell!14333)

(assert (=> mapNonEmpty!46955 (= (arr!37147 _values!996) (store mapRest!46955 mapKey!46955 mapValue!46955))))

(declare-fun res!792434 () Bool)

(assert (=> start!100212 (=> (not res!792434) (not e!677733))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100212 (= res!792434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37683 _keys!1208))))))

(assert (=> start!100212 e!677733))

(declare-fun tp_is_empty!30085 () Bool)

(assert (=> start!100212 tp_is_empty!30085))

(declare-fun array_inv!28392 (array!77005) Bool)

(assert (=> start!100212 (array_inv!28392 _keys!1208)))

(assert (=> start!100212 true))

(assert (=> start!100212 tp!89378))

(declare-fun e!677737 () Bool)

(declare-fun array_inv!28393 (array!77007) Bool)

(assert (=> start!100212 (and (array_inv!28393 _values!996) e!677737)))

(declare-fun b!1192007 () Bool)

(declare-fun res!792439 () Bool)

(assert (=> b!1192007 (=> (not res!792439) (not e!677733))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192007 (= res!792439 (= (select (arr!37146 _keys!1208) i!673) k0!934))))

(declare-fun b!1192008 () Bool)

(declare-fun e!677734 () Bool)

(assert (=> b!1192008 (= e!677733 e!677734)))

(declare-fun res!792443 () Bool)

(assert (=> b!1192008 (=> (not res!792443) (not e!677734))))

(declare-fun lt!542044 () array!77005)

(assert (=> b!1192008 (= res!792443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542044 mask!1564))))

(assert (=> b!1192008 (= lt!542044 (array!77006 (store (arr!37146 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37683 _keys!1208)))))

(declare-fun b!1192009 () Bool)

(declare-fun e!677735 () Bool)

(assert (=> b!1192009 (= e!677735 tp_is_empty!30085)))

(declare-fun b!1192010 () Bool)

(declare-fun res!792433 () Bool)

(assert (=> b!1192010 (=> (not res!792433) (not e!677733))))

(assert (=> b!1192010 (= res!792433 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37683 _keys!1208))))))

(declare-fun b!1192011 () Bool)

(declare-fun res!792436 () Bool)

(assert (=> b!1192011 (=> (not res!792436) (not e!677733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192011 (= res!792436 (validKeyInArray!0 k0!934))))

(declare-fun b!1192012 () Bool)

(declare-fun e!677731 () Bool)

(declare-fun e!677738 () Bool)

(assert (=> b!1192012 (= e!677731 e!677738)))

(declare-fun res!792432 () Bool)

(assert (=> b!1192012 (=> res!792432 e!677738)))

(assert (=> b!1192012 (= res!792432 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19430 0))(
  ( (tuple2!19431 (_1!9726 (_ BitVec 64)) (_2!9726 V!45241)) )
))
(declare-datatypes ((List!26173 0))(
  ( (Nil!26170) (Cons!26169 (h!27387 tuple2!19430) (t!38712 List!26173)) )
))
(declare-datatypes ((ListLongMap!17407 0))(
  ( (ListLongMap!17408 (toList!8719 List!26173)) )
))
(declare-fun lt!542039 () ListLongMap!17407)

(declare-fun minValue!944 () V!45241)

(declare-fun lt!542041 () array!77007)

(declare-fun zeroValue!944 () V!45241)

(declare-fun getCurrentListMapNoExtraKeys!5187 (array!77005 array!77007 (_ BitVec 32) (_ BitVec 32) V!45241 V!45241 (_ BitVec 32) Int) ListLongMap!17407)

(assert (=> b!1192012 (= lt!542039 (getCurrentListMapNoExtraKeys!5187 lt!542044 lt!542041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3142 (Int (_ BitVec 64)) V!45241)

(assert (=> b!1192012 (= lt!542041 (array!77008 (store (arr!37147 _values!996) i!673 (ValueCellFull!14333 (dynLambda!3142 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37684 _values!996)))))

(declare-fun lt!542042 () ListLongMap!17407)

(assert (=> b!1192012 (= lt!542042 (getCurrentListMapNoExtraKeys!5187 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192013 () Bool)

(assert (=> b!1192013 (= e!677738 true)))

(declare-fun -!1730 (ListLongMap!17407 (_ BitVec 64)) ListLongMap!17407)

(assert (=> b!1192013 (= (getCurrentListMapNoExtraKeys!5187 lt!542044 lt!542041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1730 (getCurrentListMapNoExtraKeys!5187 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39483 0))(
  ( (Unit!39484) )
))
(declare-fun lt!542043 () Unit!39483)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 (array!77005 array!77007 (_ BitVec 32) (_ BitVec 32) V!45241 V!45241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39483)

(assert (=> b!1192013 (= lt!542043 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!945 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46955 () Bool)

(assert (=> mapIsEmpty!46955 mapRes!46955))

(declare-fun b!1192014 () Bool)

(assert (=> b!1192014 (= e!677734 (not e!677731))))

(declare-fun res!792435 () Bool)

(assert (=> b!1192014 (=> res!792435 e!677731)))

(assert (=> b!1192014 (= res!792435 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192014 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542040 () Unit!39483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77005 (_ BitVec 64) (_ BitVec 32)) Unit!39483)

(assert (=> b!1192014 (= lt!542040 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192015 () Bool)

(declare-fun res!792441 () Bool)

(assert (=> b!1192015 (=> (not res!792441) (not e!677733))))

(declare-datatypes ((List!26174 0))(
  ( (Nil!26171) (Cons!26170 (h!27388 (_ BitVec 64)) (t!38713 List!26174)) )
))
(declare-fun arrayNoDuplicates!0 (array!77005 (_ BitVec 32) List!26174) Bool)

(assert (=> b!1192015 (= res!792441 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26171))))

(declare-fun b!1192016 () Bool)

(assert (=> b!1192016 (= e!677737 (and e!677735 mapRes!46955))))

(declare-fun condMapEmpty!46955 () Bool)

(declare-fun mapDefault!46955 () ValueCell!14333)

(assert (=> b!1192016 (= condMapEmpty!46955 (= (arr!37147 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14333)) mapDefault!46955)))))

(declare-fun b!1192017 () Bool)

(declare-fun res!792440 () Bool)

(assert (=> b!1192017 (=> (not res!792440) (not e!677733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192017 (= res!792440 (validMask!0 mask!1564))))

(declare-fun b!1192018 () Bool)

(declare-fun res!792437 () Bool)

(assert (=> b!1192018 (=> (not res!792437) (not e!677734))))

(assert (=> b!1192018 (= res!792437 (arrayNoDuplicates!0 lt!542044 #b00000000000000000000000000000000 Nil!26171))))

(declare-fun b!1192019 () Bool)

(assert (=> b!1192019 (= e!677732 tp_is_empty!30085)))

(assert (= (and start!100212 res!792434) b!1192017))

(assert (= (and b!1192017 res!792440) b!1192006))

(assert (= (and b!1192006 res!792442) b!1192005))

(assert (= (and b!1192005 res!792438) b!1192015))

(assert (= (and b!1192015 res!792441) b!1192010))

(assert (= (and b!1192010 res!792433) b!1192011))

(assert (= (and b!1192011 res!792436) b!1192007))

(assert (= (and b!1192007 res!792439) b!1192008))

(assert (= (and b!1192008 res!792443) b!1192018))

(assert (= (and b!1192018 res!792437) b!1192014))

(assert (= (and b!1192014 (not res!792435)) b!1192012))

(assert (= (and b!1192012 (not res!792432)) b!1192013))

(assert (= (and b!1192016 condMapEmpty!46955) mapIsEmpty!46955))

(assert (= (and b!1192016 (not condMapEmpty!46955)) mapNonEmpty!46955))

(get-info :version)

(assert (= (and mapNonEmpty!46955 ((_ is ValueCellFull!14333) mapValue!46955)) b!1192019))

(assert (= (and b!1192016 ((_ is ValueCellFull!14333) mapDefault!46955)) b!1192009))

(assert (= start!100212 b!1192016))

(declare-fun b_lambda!20693 () Bool)

(assert (=> (not b_lambda!20693) (not b!1192012)))

(declare-fun t!38711 () Bool)

(declare-fun tb!10359 () Bool)

(assert (=> (and start!100212 (= defaultEntry!1004 defaultEntry!1004) t!38711) tb!10359))

(declare-fun result!21293 () Bool)

(assert (=> tb!10359 (= result!21293 tp_is_empty!30085)))

(assert (=> b!1192012 t!38711))

(declare-fun b_and!41981 () Bool)

(assert (= b_and!41979 (and (=> t!38711 result!21293) b_and!41981)))

(declare-fun m!1100829 () Bool)

(assert (=> b!1192015 m!1100829))

(declare-fun m!1100831 () Bool)

(assert (=> b!1192005 m!1100831))

(declare-fun m!1100833 () Bool)

(assert (=> b!1192017 m!1100833))

(declare-fun m!1100835 () Bool)

(assert (=> b!1192018 m!1100835))

(declare-fun m!1100837 () Bool)

(assert (=> b!1192007 m!1100837))

(declare-fun m!1100839 () Bool)

(assert (=> start!100212 m!1100839))

(declare-fun m!1100841 () Bool)

(assert (=> start!100212 m!1100841))

(declare-fun m!1100843 () Bool)

(assert (=> b!1192011 m!1100843))

(declare-fun m!1100845 () Bool)

(assert (=> b!1192008 m!1100845))

(declare-fun m!1100847 () Bool)

(assert (=> b!1192008 m!1100847))

(declare-fun m!1100849 () Bool)

(assert (=> b!1192014 m!1100849))

(declare-fun m!1100851 () Bool)

(assert (=> b!1192014 m!1100851))

(declare-fun m!1100853 () Bool)

(assert (=> b!1192012 m!1100853))

(declare-fun m!1100855 () Bool)

(assert (=> b!1192012 m!1100855))

(declare-fun m!1100857 () Bool)

(assert (=> b!1192012 m!1100857))

(declare-fun m!1100859 () Bool)

(assert (=> b!1192012 m!1100859))

(declare-fun m!1100861 () Bool)

(assert (=> b!1192013 m!1100861))

(declare-fun m!1100863 () Bool)

(assert (=> b!1192013 m!1100863))

(assert (=> b!1192013 m!1100863))

(declare-fun m!1100865 () Bool)

(assert (=> b!1192013 m!1100865))

(declare-fun m!1100867 () Bool)

(assert (=> b!1192013 m!1100867))

(declare-fun m!1100869 () Bool)

(assert (=> mapNonEmpty!46955 m!1100869))

(check-sat tp_is_empty!30085 b_and!41981 (not b_lambda!20693) (not b_next!25555) (not b!1192008) (not start!100212) (not b!1192013) (not b!1192017) (not mapNonEmpty!46955) (not b!1192014) (not b!1192015) (not b!1192011) (not b!1192005) (not b!1192012) (not b!1192018))
(check-sat b_and!41981 (not b_next!25555))
