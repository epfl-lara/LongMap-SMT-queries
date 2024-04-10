; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99960 () Bool)

(assert start!99960)

(declare-fun b_free!25539 () Bool)

(declare-fun b_next!25539 () Bool)

(assert (=> start!99960 (= b_free!25539 (not b_next!25539))))

(declare-fun tp!89331 () Bool)

(declare-fun b_and!41945 () Bool)

(assert (=> start!99960 (= tp!89331 b_and!41945)))

(declare-fun mapIsEmpty!46931 () Bool)

(declare-fun mapRes!46931 () Bool)

(assert (=> mapIsEmpty!46931 mapRes!46931))

(declare-fun mapNonEmpty!46931 () Bool)

(declare-fun tp!89330 () Bool)

(declare-fun e!676713 () Bool)

(assert (=> mapNonEmpty!46931 (= mapRes!46931 (and tp!89330 e!676713))))

(declare-fun mapKey!46931 () (_ BitVec 32))

(declare-datatypes ((V!45219 0))(
  ( (V!45220 (val!15091 Int)) )
))
(declare-datatypes ((ValueCell!14325 0))(
  ( (ValueCellFull!14325 (v!17729 V!45219)) (EmptyCell!14325) )
))
(declare-datatypes ((array!76929 0))(
  ( (array!76930 (arr!37114 (Array (_ BitVec 32) ValueCell!14325)) (size!37650 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76929)

(declare-fun mapRest!46931 () (Array (_ BitVec 32) ValueCell!14325))

(declare-fun mapValue!46931 () ValueCell!14325)

(assert (=> mapNonEmpty!46931 (= (arr!37114 _values!996) (store mapRest!46931 mapKey!46931 mapValue!46931))))

(declare-fun b!1190340 () Bool)

(declare-fun e!676712 () Bool)

(declare-fun e!676710 () Bool)

(assert (=> b!1190340 (= e!676712 (and e!676710 mapRes!46931))))

(declare-fun condMapEmpty!46931 () Bool)

(declare-fun mapDefault!46931 () ValueCell!14325)

(assert (=> b!1190340 (= condMapEmpty!46931 (= (arr!37114 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14325)) mapDefault!46931)))))

(declare-fun b!1190341 () Bool)

(declare-fun res!791639 () Bool)

(declare-fun e!676708 () Bool)

(assert (=> b!1190341 (=> (not res!791639) (not e!676708))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190341 (= res!791639 (validKeyInArray!0 k0!934))))

(declare-fun b!1190342 () Bool)

(declare-fun res!791642 () Bool)

(assert (=> b!1190342 (=> (not res!791642) (not e!676708))))

(declare-datatypes ((array!76931 0))(
  ( (array!76932 (arr!37115 (Array (_ BitVec 32) (_ BitVec 64))) (size!37651 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76931)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190342 (= res!791642 (= (select (arr!37115 _keys!1208) i!673) k0!934))))

(declare-fun b!1190343 () Bool)

(declare-fun e!676711 () Bool)

(assert (=> b!1190343 (= e!676711 true)))

(declare-fun zeroValue!944 () V!45219)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541413 () array!76931)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541416 () array!76929)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45219)

(declare-datatypes ((tuple2!19384 0))(
  ( (tuple2!19385 (_1!9703 (_ BitVec 64)) (_2!9703 V!45219)) )
))
(declare-datatypes ((List!26130 0))(
  ( (Nil!26127) (Cons!26126 (h!27335 tuple2!19384) (t!38661 List!26130)) )
))
(declare-datatypes ((ListLongMap!17353 0))(
  ( (ListLongMap!17354 (toList!8692 List!26130)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5133 (array!76931 array!76929 (_ BitVec 32) (_ BitVec 32) V!45219 V!45219 (_ BitVec 32) Int) ListLongMap!17353)

(declare-fun -!1719 (ListLongMap!17353 (_ BitVec 64)) ListLongMap!17353)

(assert (=> b!1190343 (= (getCurrentListMapNoExtraKeys!5133 lt!541413 lt!541416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1719 (getCurrentListMapNoExtraKeys!5133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39480 0))(
  ( (Unit!39481) )
))
(declare-fun lt!541412 () Unit!39480)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 (array!76931 array!76929 (_ BitVec 32) (_ BitVec 32) V!45219 V!45219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39480)

(assert (=> b!1190343 (= lt!541412 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190344 () Bool)

(declare-fun res!791647 () Bool)

(assert (=> b!1190344 (=> (not res!791647) (not e!676708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190344 (= res!791647 (validMask!0 mask!1564))))

(declare-fun b!1190346 () Bool)

(declare-fun res!791644 () Bool)

(assert (=> b!1190346 (=> (not res!791644) (not e!676708))))

(declare-datatypes ((List!26131 0))(
  ( (Nil!26128) (Cons!26127 (h!27336 (_ BitVec 64)) (t!38662 List!26131)) )
))
(declare-fun arrayNoDuplicates!0 (array!76931 (_ BitVec 32) List!26131) Bool)

(assert (=> b!1190346 (= res!791644 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26128))))

(declare-fun b!1190347 () Bool)

(declare-fun res!791645 () Bool)

(assert (=> b!1190347 (=> (not res!791645) (not e!676708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76931 (_ BitVec 32)) Bool)

(assert (=> b!1190347 (= res!791645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190348 () Bool)

(declare-fun tp_is_empty!30069 () Bool)

(assert (=> b!1190348 (= e!676713 tp_is_empty!30069)))

(declare-fun b!1190349 () Bool)

(declare-fun res!791646 () Bool)

(assert (=> b!1190349 (=> (not res!791646) (not e!676708))))

(assert (=> b!1190349 (= res!791646 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37651 _keys!1208))))))

(declare-fun b!1190350 () Bool)

(declare-fun e!676709 () Bool)

(assert (=> b!1190350 (= e!676709 e!676711)))

(declare-fun res!791636 () Bool)

(assert (=> b!1190350 (=> res!791636 e!676711)))

(assert (=> b!1190350 (= res!791636 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541415 () ListLongMap!17353)

(assert (=> b!1190350 (= lt!541415 (getCurrentListMapNoExtraKeys!5133 lt!541413 lt!541416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3074 (Int (_ BitVec 64)) V!45219)

(assert (=> b!1190350 (= lt!541416 (array!76930 (store (arr!37114 _values!996) i!673 (ValueCellFull!14325 (dynLambda!3074 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37650 _values!996)))))

(declare-fun lt!541414 () ListLongMap!17353)

(assert (=> b!1190350 (= lt!541414 (getCurrentListMapNoExtraKeys!5133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190351 () Bool)

(declare-fun res!791637 () Bool)

(declare-fun e!676707 () Bool)

(assert (=> b!1190351 (=> (not res!791637) (not e!676707))))

(assert (=> b!1190351 (= res!791637 (arrayNoDuplicates!0 lt!541413 #b00000000000000000000000000000000 Nil!26128))))

(declare-fun b!1190352 () Bool)

(assert (=> b!1190352 (= e!676707 (not e!676709))))

(declare-fun res!791638 () Bool)

(assert (=> b!1190352 (=> res!791638 e!676709)))

(assert (=> b!1190352 (= res!791638 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190352 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541411 () Unit!39480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76931 (_ BitVec 64) (_ BitVec 32)) Unit!39480)

(assert (=> b!1190352 (= lt!541411 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190353 () Bool)

(declare-fun res!791641 () Bool)

(assert (=> b!1190353 (=> (not res!791641) (not e!676708))))

(assert (=> b!1190353 (= res!791641 (and (= (size!37650 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37651 _keys!1208) (size!37650 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190354 () Bool)

(assert (=> b!1190354 (= e!676708 e!676707)))

(declare-fun res!791643 () Bool)

(assert (=> b!1190354 (=> (not res!791643) (not e!676707))))

(assert (=> b!1190354 (= res!791643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541413 mask!1564))))

(assert (=> b!1190354 (= lt!541413 (array!76932 (store (arr!37115 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37651 _keys!1208)))))

(declare-fun b!1190345 () Bool)

(assert (=> b!1190345 (= e!676710 tp_is_empty!30069)))

(declare-fun res!791640 () Bool)

(assert (=> start!99960 (=> (not res!791640) (not e!676708))))

(assert (=> start!99960 (= res!791640 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37651 _keys!1208))))))

(assert (=> start!99960 e!676708))

(assert (=> start!99960 tp_is_empty!30069))

(declare-fun array_inv!28304 (array!76931) Bool)

(assert (=> start!99960 (array_inv!28304 _keys!1208)))

(assert (=> start!99960 true))

(assert (=> start!99960 tp!89331))

(declare-fun array_inv!28305 (array!76929) Bool)

(assert (=> start!99960 (and (array_inv!28305 _values!996) e!676712)))

(assert (= (and start!99960 res!791640) b!1190344))

(assert (= (and b!1190344 res!791647) b!1190353))

(assert (= (and b!1190353 res!791641) b!1190347))

(assert (= (and b!1190347 res!791645) b!1190346))

(assert (= (and b!1190346 res!791644) b!1190349))

(assert (= (and b!1190349 res!791646) b!1190341))

(assert (= (and b!1190341 res!791639) b!1190342))

(assert (= (and b!1190342 res!791642) b!1190354))

(assert (= (and b!1190354 res!791643) b!1190351))

(assert (= (and b!1190351 res!791637) b!1190352))

(assert (= (and b!1190352 (not res!791638)) b!1190350))

(assert (= (and b!1190350 (not res!791636)) b!1190343))

(assert (= (and b!1190340 condMapEmpty!46931) mapIsEmpty!46931))

(assert (= (and b!1190340 (not condMapEmpty!46931)) mapNonEmpty!46931))

(get-info :version)

(assert (= (and mapNonEmpty!46931 ((_ is ValueCellFull!14325) mapValue!46931)) b!1190348))

(assert (= (and b!1190340 ((_ is ValueCellFull!14325) mapDefault!46931)) b!1190345))

(assert (= start!99960 b!1190340))

(declare-fun b_lambda!20683 () Bool)

(assert (=> (not b_lambda!20683) (not b!1190350)))

(declare-fun t!38660 () Bool)

(declare-fun tb!10351 () Bool)

(assert (=> (and start!99960 (= defaultEntry!1004 defaultEntry!1004) t!38660) tb!10351))

(declare-fun result!21269 () Bool)

(assert (=> tb!10351 (= result!21269 tp_is_empty!30069)))

(assert (=> b!1190350 t!38660))

(declare-fun b_and!41947 () Bool)

(assert (= b_and!41945 (and (=> t!38660 result!21269) b_and!41947)))

(declare-fun m!1098921 () Bool)

(assert (=> b!1190341 m!1098921))

(declare-fun m!1098923 () Bool)

(assert (=> b!1190342 m!1098923))

(declare-fun m!1098925 () Bool)

(assert (=> start!99960 m!1098925))

(declare-fun m!1098927 () Bool)

(assert (=> start!99960 m!1098927))

(declare-fun m!1098929 () Bool)

(assert (=> b!1190344 m!1098929))

(declare-fun m!1098931 () Bool)

(assert (=> b!1190346 m!1098931))

(declare-fun m!1098933 () Bool)

(assert (=> b!1190354 m!1098933))

(declare-fun m!1098935 () Bool)

(assert (=> b!1190354 m!1098935))

(declare-fun m!1098937 () Bool)

(assert (=> b!1190352 m!1098937))

(declare-fun m!1098939 () Bool)

(assert (=> b!1190352 m!1098939))

(declare-fun m!1098941 () Bool)

(assert (=> b!1190347 m!1098941))

(declare-fun m!1098943 () Bool)

(assert (=> b!1190350 m!1098943))

(declare-fun m!1098945 () Bool)

(assert (=> b!1190350 m!1098945))

(declare-fun m!1098947 () Bool)

(assert (=> b!1190350 m!1098947))

(declare-fun m!1098949 () Bool)

(assert (=> b!1190350 m!1098949))

(declare-fun m!1098951 () Bool)

(assert (=> b!1190343 m!1098951))

(declare-fun m!1098953 () Bool)

(assert (=> b!1190343 m!1098953))

(assert (=> b!1190343 m!1098953))

(declare-fun m!1098955 () Bool)

(assert (=> b!1190343 m!1098955))

(declare-fun m!1098957 () Bool)

(assert (=> b!1190343 m!1098957))

(declare-fun m!1098959 () Bool)

(assert (=> b!1190351 m!1098959))

(declare-fun m!1098961 () Bool)

(assert (=> mapNonEmpty!46931 m!1098961))

(check-sat (not b!1190350) (not b_lambda!20683) (not b!1190347) (not b!1190341) (not b!1190352) (not b!1190354) (not b_next!25539) (not b!1190351) (not b!1190346) tp_is_empty!30069 (not start!99960) (not mapNonEmpty!46931) (not b!1190344) b_and!41947 (not b!1190343))
(check-sat b_and!41947 (not b_next!25539))
