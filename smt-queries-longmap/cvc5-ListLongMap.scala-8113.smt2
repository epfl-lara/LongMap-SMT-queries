; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99544 () Bool)

(assert start!99544)

(declare-fun b_free!25123 () Bool)

(declare-fun b_next!25123 () Bool)

(assert (=> start!99544 (= b_free!25123 (not b_next!25123))))

(declare-fun tp!88083 () Bool)

(declare-fun b_and!41113 () Bool)

(assert (=> start!99544 (= tp!88083 b_and!41113)))

(declare-fun b!1177840 () Bool)

(declare-fun res!782411 () Bool)

(declare-fun e!669585 () Bool)

(assert (=> b!1177840 (=> (not res!782411) (not e!669585))))

(declare-datatypes ((array!76111 0))(
  ( (array!76112 (arr!36705 (Array (_ BitVec 32) (_ BitVec 64))) (size!37241 (_ BitVec 32))) )
))
(declare-fun lt!531937 () array!76111)

(declare-datatypes ((List!25779 0))(
  ( (Nil!25776) (Cons!25775 (h!26984 (_ BitVec 64)) (t!37894 List!25779)) )
))
(declare-fun arrayNoDuplicates!0 (array!76111 (_ BitVec 32) List!25779) Bool)

(assert (=> b!1177840 (= res!782411 (arrayNoDuplicates!0 lt!531937 #b00000000000000000000000000000000 Nil!25776))))

(declare-fun b!1177841 () Bool)

(declare-fun res!782414 () Bool)

(declare-fun e!669581 () Bool)

(assert (=> b!1177841 (=> (not res!782414) (not e!669581))))

(declare-fun _keys!1208 () array!76111)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76111 (_ BitVec 32)) Bool)

(assert (=> b!1177841 (= res!782414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177842 () Bool)

(declare-fun res!782423 () Bool)

(assert (=> b!1177842 (=> (not res!782423) (not e!669581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177842 (= res!782423 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46307 () Bool)

(declare-fun mapRes!46307 () Bool)

(assert (=> mapIsEmpty!46307 mapRes!46307))

(declare-fun b!1177843 () Bool)

(declare-fun e!669576 () Bool)

(declare-fun e!669583 () Bool)

(assert (=> b!1177843 (= e!669576 e!669583)))

(declare-fun res!782413 () Bool)

(assert (=> b!1177843 (=> res!782413 e!669583)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177843 (= res!782413 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44665 0))(
  ( (V!44666 (val!14883 Int)) )
))
(declare-fun zeroValue!944 () V!44665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19042 0))(
  ( (tuple2!19043 (_1!9532 (_ BitVec 64)) (_2!9532 V!44665)) )
))
(declare-datatypes ((List!25780 0))(
  ( (Nil!25777) (Cons!25776 (h!26985 tuple2!19042) (t!37895 List!25780)) )
))
(declare-datatypes ((ListLongMap!17011 0))(
  ( (ListLongMap!17012 (toList!8521 List!25780)) )
))
(declare-fun lt!531935 () ListLongMap!17011)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44665)

(declare-datatypes ((ValueCell!14117 0))(
  ( (ValueCellFull!14117 (v!17521 V!44665)) (EmptyCell!14117) )
))
(declare-datatypes ((array!76113 0))(
  ( (array!76114 (arr!36706 (Array (_ BitVec 32) ValueCell!14117)) (size!37242 (_ BitVec 32))) )
))
(declare-fun lt!531948 () array!76113)

(declare-fun getCurrentListMapNoExtraKeys!4978 (array!76111 array!76113 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) Int) ListLongMap!17011)

(assert (=> b!1177843 (= lt!531935 (getCurrentListMapNoExtraKeys!4978 lt!531937 lt!531948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531939 () V!44665)

(declare-fun _values!996 () array!76113)

(assert (=> b!1177843 (= lt!531948 (array!76114 (store (arr!36706 _values!996) i!673 (ValueCellFull!14117 lt!531939)) (size!37242 _values!996)))))

(declare-fun dynLambda!2940 (Int (_ BitVec 64)) V!44665)

(assert (=> b!1177843 (= lt!531939 (dynLambda!2940 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531946 () ListLongMap!17011)

(assert (=> b!1177843 (= lt!531946 (getCurrentListMapNoExtraKeys!4978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!782417 () Bool)

(assert (=> start!99544 (=> (not res!782417) (not e!669581))))

(assert (=> start!99544 (= res!782417 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37241 _keys!1208))))))

(assert (=> start!99544 e!669581))

(declare-fun tp_is_empty!29653 () Bool)

(assert (=> start!99544 tp_is_empty!29653))

(declare-fun array_inv!28030 (array!76111) Bool)

(assert (=> start!99544 (array_inv!28030 _keys!1208)))

(assert (=> start!99544 true))

(assert (=> start!99544 tp!88083))

(declare-fun e!669575 () Bool)

(declare-fun array_inv!28031 (array!76113) Bool)

(assert (=> start!99544 (and (array_inv!28031 _values!996) e!669575)))

(declare-fun b!1177844 () Bool)

(declare-fun res!782415 () Bool)

(assert (=> b!1177844 (=> (not res!782415) (not e!669581))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177844 (= res!782415 (validKeyInArray!0 k!934))))

(declare-fun b!1177845 () Bool)

(declare-fun e!669574 () Bool)

(assert (=> b!1177845 (= e!669574 tp_is_empty!29653)))

(declare-fun b!1177846 () Bool)

(declare-fun e!669582 () Bool)

(assert (=> b!1177846 (= e!669582 true)))

(declare-fun e!669579 () Bool)

(assert (=> b!1177846 e!669579))

(declare-fun res!782425 () Bool)

(assert (=> b!1177846 (=> (not res!782425) (not e!669579))))

(assert (=> b!1177846 (= res!782425 (not (= (select (arr!36705 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38900 0))(
  ( (Unit!38901) )
))
(declare-fun lt!531944 () Unit!38900)

(declare-fun e!669577 () Unit!38900)

(assert (=> b!1177846 (= lt!531944 e!669577)))

(declare-fun c!116808 () Bool)

(assert (=> b!1177846 (= c!116808 (= (select (arr!36705 _keys!1208) from!1455) k!934))))

(declare-fun e!669580 () Bool)

(assert (=> b!1177846 e!669580))

(declare-fun res!782418 () Bool)

(assert (=> b!1177846 (=> (not res!782418) (not e!669580))))

(declare-fun lt!531934 () tuple2!19042)

(declare-fun lt!531943 () ListLongMap!17011)

(declare-fun +!3836 (ListLongMap!17011 tuple2!19042) ListLongMap!17011)

(assert (=> b!1177846 (= res!782418 (= lt!531935 (+!3836 lt!531943 lt!531934)))))

(declare-fun get!18758 (ValueCell!14117 V!44665) V!44665)

(assert (=> b!1177846 (= lt!531934 (tuple2!19043 (select (arr!36705 _keys!1208) from!1455) (get!18758 (select (arr!36706 _values!996) from!1455) lt!531939)))))

(declare-fun mapNonEmpty!46307 () Bool)

(declare-fun tp!88082 () Bool)

(assert (=> mapNonEmpty!46307 (= mapRes!46307 (and tp!88082 e!669574))))

(declare-fun mapValue!46307 () ValueCell!14117)

(declare-fun mapKey!46307 () (_ BitVec 32))

(declare-fun mapRest!46307 () (Array (_ BitVec 32) ValueCell!14117))

(assert (=> mapNonEmpty!46307 (= (arr!36706 _values!996) (store mapRest!46307 mapKey!46307 mapValue!46307))))

(declare-fun b!1177847 () Bool)

(declare-fun e!669586 () Bool)

(assert (=> b!1177847 (= e!669586 tp_is_empty!29653)))

(declare-fun b!1177848 () Bool)

(declare-fun res!782416 () Bool)

(assert (=> b!1177848 (=> (not res!782416) (not e!669581))))

(assert (=> b!1177848 (= res!782416 (and (= (size!37242 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37241 _keys!1208) (size!37242 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177849 () Bool)

(declare-fun res!782424 () Bool)

(assert (=> b!1177849 (=> (not res!782424) (not e!669581))))

(assert (=> b!1177849 (= res!782424 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25776))))

(declare-fun b!1177850 () Bool)

(declare-fun res!782410 () Bool)

(assert (=> b!1177850 (=> (not res!782410) (not e!669581))))

(assert (=> b!1177850 (= res!782410 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37241 _keys!1208))))))

(declare-fun b!1177851 () Bool)

(assert (=> b!1177851 (= e!669583 e!669582)))

(declare-fun res!782412 () Bool)

(assert (=> b!1177851 (=> res!782412 e!669582)))

(assert (=> b!1177851 (= res!782412 (not (validKeyInArray!0 (select (arr!36705 _keys!1208) from!1455))))))

(declare-fun lt!531945 () ListLongMap!17011)

(assert (=> b!1177851 (= lt!531945 lt!531943)))

(declare-fun lt!531940 () ListLongMap!17011)

(declare-fun -!1570 (ListLongMap!17011 (_ BitVec 64)) ListLongMap!17011)

(assert (=> b!1177851 (= lt!531943 (-!1570 lt!531940 k!934))))

(assert (=> b!1177851 (= lt!531945 (getCurrentListMapNoExtraKeys!4978 lt!531937 lt!531948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177851 (= lt!531940 (getCurrentListMapNoExtraKeys!4978 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531938 () Unit!38900)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!797 (array!76111 array!76113 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38900)

(assert (=> b!1177851 (= lt!531938 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177852 () Bool)

(declare-fun res!782420 () Bool)

(assert (=> b!1177852 (=> (not res!782420) (not e!669581))))

(assert (=> b!1177852 (= res!782420 (= (select (arr!36705 _keys!1208) i!673) k!934))))

(declare-fun b!1177853 () Bool)

(assert (=> b!1177853 (= e!669579 (= lt!531946 (+!3836 lt!531940 lt!531934)))))

(declare-fun b!1177854 () Bool)

(declare-fun Unit!38902 () Unit!38900)

(assert (=> b!1177854 (= e!669577 Unit!38902)))

(declare-fun b!1177855 () Bool)

(declare-fun e!669578 () Bool)

(declare-fun arrayContainsKey!0 (array!76111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177855 (= e!669578 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177856 () Bool)

(assert (=> b!1177856 (= e!669585 (not e!669576))))

(declare-fun res!782421 () Bool)

(assert (=> b!1177856 (=> res!782421 e!669576)))

(assert (=> b!1177856 (= res!782421 (bvsgt from!1455 i!673))))

(assert (=> b!1177856 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531942 () Unit!38900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76111 (_ BitVec 64) (_ BitVec 32)) Unit!38900)

(assert (=> b!1177856 (= lt!531942 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177857 () Bool)

(assert (=> b!1177857 (= e!669581 e!669585)))

(declare-fun res!782422 () Bool)

(assert (=> b!1177857 (=> (not res!782422) (not e!669585))))

(assert (=> b!1177857 (= res!782422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531937 mask!1564))))

(assert (=> b!1177857 (= lt!531937 (array!76112 (store (arr!36705 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37241 _keys!1208)))))

(declare-fun b!1177858 () Bool)

(declare-fun Unit!38903 () Unit!38900)

(assert (=> b!1177858 (= e!669577 Unit!38903)))

(declare-fun lt!531947 () Unit!38900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38900)

(assert (=> b!1177858 (= lt!531947 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177858 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531941 () Unit!38900)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76111 (_ BitVec 32) (_ BitVec 32)) Unit!38900)

(assert (=> b!1177858 (= lt!531941 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177858 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25776)))

(declare-fun lt!531936 () Unit!38900)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76111 (_ BitVec 64) (_ BitVec 32) List!25779) Unit!38900)

(assert (=> b!1177858 (= lt!531936 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25776))))

(assert (=> b!1177858 false))

(declare-fun b!1177859 () Bool)

(assert (=> b!1177859 (= e!669575 (and e!669586 mapRes!46307))))

(declare-fun condMapEmpty!46307 () Bool)

(declare-fun mapDefault!46307 () ValueCell!14117)

