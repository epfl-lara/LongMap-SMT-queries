; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100516 () Bool)

(assert start!100516)

(declare-fun b_free!25839 () Bool)

(declare-fun b_next!25839 () Bool)

(assert (=> start!100516 (= b_free!25839 (not b_next!25839))))

(declare-fun tp!90506 () Bool)

(declare-fun b_and!42565 () Bool)

(assert (=> start!100516 (= tp!90506 b_and!42565)))

(declare-datatypes ((V!45851 0))(
  ( (V!45852 (val!15328 Int)) )
))
(declare-fun zeroValue!944 () V!45851)

(declare-datatypes ((tuple2!19628 0))(
  ( (tuple2!19629 (_1!9825 (_ BitVec 64)) (_2!9825 V!45851)) )
))
(declare-datatypes ((List!26446 0))(
  ( (Nil!26443) (Cons!26442 (h!27651 tuple2!19628) (t!39265 List!26446)) )
))
(declare-datatypes ((ListLongMap!17597 0))(
  ( (ListLongMap!17598 (toList!8814 List!26446)) )
))
(declare-fun call!57347 () ListLongMap!17597)

(declare-datatypes ((array!77859 0))(
  ( (array!77860 (arr!37574 (Array (_ BitVec 32) (_ BitVec 64))) (size!38110 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77859)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14562 0))(
  ( (ValueCellFull!14562 (v!17966 V!45851)) (EmptyCell!14562) )
))
(declare-datatypes ((array!77861 0))(
  ( (array!77862 (arr!37575 (Array (_ BitVec 32) ValueCell!14562)) (size!38111 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77861)

(declare-fun bm!57343 () Bool)

(declare-fun minValue!944 () V!45851)

(declare-fun getCurrentListMapNoExtraKeys!5253 (array!77859 array!77861 (_ BitVec 32) (_ BitVec 32) V!45851 V!45851 (_ BitVec 32) Int) ListLongMap!17597)

(assert (=> bm!57343 (= call!57347 (getCurrentListMapNoExtraKeys!5253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200997 () Bool)

(declare-fun e!682022 () Bool)

(declare-fun e!682026 () Bool)

(assert (=> b!1200997 (= e!682022 e!682026)))

(declare-fun res!799497 () Bool)

(assert (=> b!1200997 (=> res!799497 e!682026)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200997 (= res!799497 (not (= from!1455 i!673)))))

(declare-fun lt!544255 () array!77859)

(declare-fun lt!544252 () ListLongMap!17597)

(declare-fun lt!544253 () array!77861)

(assert (=> b!1200997 (= lt!544252 (getCurrentListMapNoExtraKeys!5253 lt!544255 lt!544253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3170 (Int (_ BitVec 64)) V!45851)

(assert (=> b!1200997 (= lt!544253 (array!77862 (store (arr!37575 _values!996) i!673 (ValueCellFull!14562 (dynLambda!3170 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38111 _values!996)))))

(declare-fun lt!544254 () ListLongMap!17597)

(assert (=> b!1200997 (= lt!544254 (getCurrentListMapNoExtraKeys!5253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200998 () Bool)

(declare-fun res!799494 () Bool)

(declare-fun e!682021 () Bool)

(assert (=> b!1200998 (=> (not res!799494) (not e!682021))))

(declare-datatypes ((List!26447 0))(
  ( (Nil!26444) (Cons!26443 (h!27652 (_ BitVec 64)) (t!39266 List!26447)) )
))
(declare-fun arrayNoDuplicates!0 (array!77859 (_ BitVec 32) List!26447) Bool)

(assert (=> b!1200998 (= res!799494 (arrayNoDuplicates!0 lt!544255 #b00000000000000000000000000000000 Nil!26444))))

(declare-fun b!1200999 () Bool)

(declare-fun res!799500 () Bool)

(declare-fun e!682024 () Bool)

(assert (=> b!1200999 (=> (not res!799500) (not e!682024))))

(assert (=> b!1200999 (= res!799500 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38110 _keys!1208))))))

(declare-fun b!1201000 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!682023 () Bool)

(declare-fun call!57346 () ListLongMap!17597)

(declare-fun -!1788 (ListLongMap!17597 (_ BitVec 64)) ListLongMap!17597)

(assert (=> b!1201000 (= e!682023 (= call!57346 (-!1788 call!57347 k0!934)))))

(declare-fun b!1201001 () Bool)

(assert (=> b!1201001 (= e!682023 (= call!57346 call!57347))))

(declare-fun b!1201002 () Bool)

(declare-fun res!799503 () Bool)

(assert (=> b!1201002 (=> (not res!799503) (not e!682024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201002 (= res!799503 (validKeyInArray!0 k0!934))))

(declare-fun b!1201003 () Bool)

(declare-fun res!799498 () Bool)

(assert (=> b!1201003 (=> (not res!799498) (not e!682024))))

(assert (=> b!1201003 (= res!799498 (and (= (size!38111 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38110 _keys!1208) (size!38111 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201004 () Bool)

(declare-fun e!682018 () Bool)

(declare-fun e!682025 () Bool)

(declare-fun mapRes!47657 () Bool)

(assert (=> b!1201004 (= e!682018 (and e!682025 mapRes!47657))))

(declare-fun condMapEmpty!47657 () Bool)

(declare-fun mapDefault!47657 () ValueCell!14562)

(assert (=> b!1201004 (= condMapEmpty!47657 (= (arr!37575 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14562)) mapDefault!47657)))))

(declare-fun b!1201005 () Bool)

(declare-fun res!799499 () Bool)

(assert (=> b!1201005 (=> (not res!799499) (not e!682024))))

(assert (=> b!1201005 (= res!799499 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26444))))

(declare-fun b!1201006 () Bool)

(declare-fun res!799506 () Bool)

(assert (=> b!1201006 (=> (not res!799506) (not e!682024))))

(assert (=> b!1201006 (= res!799506 (= (select (arr!37574 _keys!1208) i!673) k0!934))))

(declare-fun b!1201007 () Bool)

(declare-fun e!682020 () Bool)

(assert (=> b!1201007 (= e!682020 true)))

(declare-fun lt!544257 () Bool)

(declare-fun contains!6873 (ListLongMap!17597 (_ BitVec 64)) Bool)

(assert (=> b!1201007 (= lt!544257 (contains!6873 (getCurrentListMapNoExtraKeys!5253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1201008 () Bool)

(assert (=> b!1201008 (= e!682021 (not e!682022))))

(declare-fun res!799495 () Bool)

(assert (=> b!1201008 (=> res!799495 e!682022)))

(assert (=> b!1201008 (= res!799495 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201008 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39816 0))(
  ( (Unit!39817) )
))
(declare-fun lt!544256 () Unit!39816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77859 (_ BitVec 64) (_ BitVec 32)) Unit!39816)

(assert (=> b!1201008 (= lt!544256 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47657 () Bool)

(assert (=> mapIsEmpty!47657 mapRes!47657))

(declare-fun b!1201009 () Bool)

(assert (=> b!1201009 (= e!682026 e!682020)))

(declare-fun res!799502 () Bool)

(assert (=> b!1201009 (=> res!799502 e!682020)))

(assert (=> b!1201009 (= res!799502 (not (= (select (arr!37574 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201009 e!682023))

(declare-fun c!117470 () Bool)

(assert (=> b!1201009 (= c!117470 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544258 () Unit!39816)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 (array!77859 array!77861 (_ BitVec 32) (_ BitVec 32) V!45851 V!45851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39816)

(assert (=> b!1201009 (= lt!544258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57344 () Bool)

(assert (=> bm!57344 (= call!57346 (getCurrentListMapNoExtraKeys!5253 lt!544255 lt!544253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201010 () Bool)

(declare-fun e!682019 () Bool)

(declare-fun tp_is_empty!30543 () Bool)

(assert (=> b!1201010 (= e!682019 tp_is_empty!30543)))

(declare-fun res!799496 () Bool)

(assert (=> start!100516 (=> (not res!799496) (not e!682024))))

(assert (=> start!100516 (= res!799496 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38110 _keys!1208))))))

(assert (=> start!100516 e!682024))

(assert (=> start!100516 tp_is_empty!30543))

(declare-fun array_inv!28636 (array!77859) Bool)

(assert (=> start!100516 (array_inv!28636 _keys!1208)))

(assert (=> start!100516 true))

(assert (=> start!100516 tp!90506))

(declare-fun array_inv!28637 (array!77861) Bool)

(assert (=> start!100516 (and (array_inv!28637 _values!996) e!682018)))

(declare-fun mapNonEmpty!47657 () Bool)

(declare-fun tp!90507 () Bool)

(assert (=> mapNonEmpty!47657 (= mapRes!47657 (and tp!90507 e!682019))))

(declare-fun mapKey!47657 () (_ BitVec 32))

(declare-fun mapRest!47657 () (Array (_ BitVec 32) ValueCell!14562))

(declare-fun mapValue!47657 () ValueCell!14562)

(assert (=> mapNonEmpty!47657 (= (arr!37575 _values!996) (store mapRest!47657 mapKey!47657 mapValue!47657))))

(declare-fun b!1201011 () Bool)

(declare-fun res!799505 () Bool)

(assert (=> b!1201011 (=> (not res!799505) (not e!682024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201011 (= res!799505 (validMask!0 mask!1564))))

(declare-fun b!1201012 () Bool)

(declare-fun res!799504 () Bool)

(assert (=> b!1201012 (=> (not res!799504) (not e!682024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77859 (_ BitVec 32)) Bool)

(assert (=> b!1201012 (= res!799504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201013 () Bool)

(assert (=> b!1201013 (= e!682025 tp_is_empty!30543)))

(declare-fun b!1201014 () Bool)

(assert (=> b!1201014 (= e!682024 e!682021)))

(declare-fun res!799501 () Bool)

(assert (=> b!1201014 (=> (not res!799501) (not e!682021))))

(assert (=> b!1201014 (= res!799501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544255 mask!1564))))

(assert (=> b!1201014 (= lt!544255 (array!77860 (store (arr!37574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38110 _keys!1208)))))

(assert (= (and start!100516 res!799496) b!1201011))

(assert (= (and b!1201011 res!799505) b!1201003))

(assert (= (and b!1201003 res!799498) b!1201012))

(assert (= (and b!1201012 res!799504) b!1201005))

(assert (= (and b!1201005 res!799499) b!1200999))

(assert (= (and b!1200999 res!799500) b!1201002))

(assert (= (and b!1201002 res!799503) b!1201006))

(assert (= (and b!1201006 res!799506) b!1201014))

(assert (= (and b!1201014 res!799501) b!1200998))

(assert (= (and b!1200998 res!799494) b!1201008))

(assert (= (and b!1201008 (not res!799495)) b!1200997))

(assert (= (and b!1200997 (not res!799497)) b!1201009))

(assert (= (and b!1201009 c!117470) b!1201000))

(assert (= (and b!1201009 (not c!117470)) b!1201001))

(assert (= (or b!1201000 b!1201001) bm!57344))

(assert (= (or b!1201000 b!1201001) bm!57343))

(assert (= (and b!1201009 (not res!799502)) b!1201007))

(assert (= (and b!1201004 condMapEmpty!47657) mapIsEmpty!47657))

(assert (= (and b!1201004 (not condMapEmpty!47657)) mapNonEmpty!47657))

(get-info :version)

(assert (= (and mapNonEmpty!47657 ((_ is ValueCellFull!14562) mapValue!47657)) b!1201010))

(assert (= (and b!1201004 ((_ is ValueCellFull!14562) mapDefault!47657)) b!1201013))

(assert (= start!100516 b!1201004))

(declare-fun b_lambda!21035 () Bool)

(assert (=> (not b_lambda!21035) (not b!1200997)))

(declare-fun t!39264 () Bool)

(declare-fun tb!10639 () Bool)

(assert (=> (and start!100516 (= defaultEntry!1004 defaultEntry!1004) t!39264) tb!10639))

(declare-fun result!21855 () Bool)

(assert (=> tb!10639 (= result!21855 tp_is_empty!30543)))

(assert (=> b!1200997 t!39264))

(declare-fun b_and!42567 () Bool)

(assert (= b_and!42565 (and (=> t!39264 result!21855) b_and!42567)))

(declare-fun m!1107201 () Bool)

(assert (=> b!1201012 m!1107201))

(declare-fun m!1107203 () Bool)

(assert (=> b!1201014 m!1107203))

(declare-fun m!1107205 () Bool)

(assert (=> b!1201014 m!1107205))

(declare-fun m!1107207 () Bool)

(assert (=> mapNonEmpty!47657 m!1107207))

(declare-fun m!1107209 () Bool)

(assert (=> b!1201008 m!1107209))

(declare-fun m!1107211 () Bool)

(assert (=> b!1201008 m!1107211))

(declare-fun m!1107213 () Bool)

(assert (=> b!1201009 m!1107213))

(declare-fun m!1107215 () Bool)

(assert (=> b!1201009 m!1107215))

(declare-fun m!1107217 () Bool)

(assert (=> b!1200998 m!1107217))

(declare-fun m!1107219 () Bool)

(assert (=> bm!57344 m!1107219))

(declare-fun m!1107221 () Bool)

(assert (=> bm!57343 m!1107221))

(declare-fun m!1107223 () Bool)

(assert (=> b!1200997 m!1107223))

(declare-fun m!1107225 () Bool)

(assert (=> b!1200997 m!1107225))

(declare-fun m!1107227 () Bool)

(assert (=> b!1200997 m!1107227))

(declare-fun m!1107229 () Bool)

(assert (=> b!1200997 m!1107229))

(declare-fun m!1107231 () Bool)

(assert (=> b!1201002 m!1107231))

(declare-fun m!1107233 () Bool)

(assert (=> b!1201000 m!1107233))

(declare-fun m!1107235 () Bool)

(assert (=> b!1201011 m!1107235))

(declare-fun m!1107237 () Bool)

(assert (=> b!1201005 m!1107237))

(assert (=> b!1201007 m!1107221))

(assert (=> b!1201007 m!1107221))

(declare-fun m!1107239 () Bool)

(assert (=> b!1201007 m!1107239))

(declare-fun m!1107241 () Bool)

(assert (=> start!100516 m!1107241))

(declare-fun m!1107243 () Bool)

(assert (=> start!100516 m!1107243))

(declare-fun m!1107245 () Bool)

(assert (=> b!1201006 m!1107245))

(check-sat (not b!1201014) tp_is_empty!30543 (not start!100516) (not b!1200997) (not b!1200998) (not b!1201005) (not b_next!25839) (not b_lambda!21035) (not b!1201009) b_and!42567 (not b!1201000) (not b!1201007) (not b!1201008) (not b!1201012) (not b!1201002) (not bm!57343) (not mapNonEmpty!47657) (not b!1201011) (not bm!57344))
(check-sat b_and!42567 (not b_next!25839))
