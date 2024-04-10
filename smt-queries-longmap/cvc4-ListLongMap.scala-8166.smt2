; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99866 () Bool)

(assert start!99866)

(declare-fun b_free!25445 () Bool)

(declare-fun b_next!25445 () Bool)

(assert (=> start!99866 (= b_free!25445 (not b_next!25445))))

(declare-fun tp!89049 () Bool)

(declare-fun b_and!41757 () Bool)

(assert (=> start!99866 (= tp!89049 b_and!41757)))

(declare-fun b!1188081 () Bool)

(declare-fun e!675539 () Bool)

(assert (=> b!1188081 (= e!675539 true)))

(declare-datatypes ((V!45093 0))(
  ( (V!45094 (val!15044 Int)) )
))
(declare-datatypes ((tuple2!19318 0))(
  ( (tuple2!19319 (_1!9670 (_ BitVec 64)) (_2!9670 V!45093)) )
))
(declare-datatypes ((List!26058 0))(
  ( (Nil!26055) (Cons!26054 (h!27263 tuple2!19318) (t!38495 List!26058)) )
))
(declare-datatypes ((ListLongMap!17287 0))(
  ( (ListLongMap!17288 (toList!8659 List!26058)) )
))
(declare-fun lt!540452 () ListLongMap!17287)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!540444 () ListLongMap!17287)

(declare-fun -!1689 (ListLongMap!17287 (_ BitVec 64)) ListLongMap!17287)

(assert (=> b!1188081 (= (-!1689 lt!540452 k!934) lt!540444)))

(declare-datatypes ((array!76745 0))(
  ( (array!76746 (arr!37022 (Array (_ BitVec 32) (_ BitVec 64))) (size!37558 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76745)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39413 0))(
  ( (Unit!39414) )
))
(declare-fun lt!540440 () Unit!39413)

(declare-fun lt!540437 () V!45093)

(declare-fun lt!540453 () ListLongMap!17287)

(declare-fun addRemoveCommutativeForDiffKeys!208 (ListLongMap!17287 (_ BitVec 64) V!45093 (_ BitVec 64)) Unit!39413)

(assert (=> b!1188081 (= lt!540440 (addRemoveCommutativeForDiffKeys!208 lt!540453 (select (arr!37022 _keys!1208) from!1455) lt!540437 k!934))))

(declare-fun lt!540446 () ListLongMap!17287)

(declare-fun lt!540448 () ListLongMap!17287)

(declare-fun lt!540451 () ListLongMap!17287)

(assert (=> b!1188081 (and (= lt!540446 lt!540452) (= lt!540448 lt!540451))))

(declare-fun lt!540439 () tuple2!19318)

(declare-fun +!3945 (ListLongMap!17287 tuple2!19318) ListLongMap!17287)

(assert (=> b!1188081 (= lt!540452 (+!3945 lt!540453 lt!540439))))

(assert (=> b!1188081 (not (= (select (arr!37022 _keys!1208) from!1455) k!934))))

(declare-fun lt!540447 () Unit!39413)

(declare-fun e!675544 () Unit!39413)

(assert (=> b!1188081 (= lt!540447 e!675544)))

(declare-fun c!117291 () Bool)

(assert (=> b!1188081 (= c!117291 (= (select (arr!37022 _keys!1208) from!1455) k!934))))

(declare-fun e!675547 () Bool)

(assert (=> b!1188081 e!675547))

(declare-fun res!789914 () Bool)

(assert (=> b!1188081 (=> (not res!789914) (not e!675547))))

(declare-fun lt!540441 () ListLongMap!17287)

(assert (=> b!1188081 (= res!789914 (= lt!540441 lt!540444))))

(assert (=> b!1188081 (= lt!540444 (+!3945 lt!540448 lt!540439))))

(assert (=> b!1188081 (= lt!540439 (tuple2!19319 (select (arr!37022 _keys!1208) from!1455) lt!540437))))

(declare-datatypes ((ValueCell!14278 0))(
  ( (ValueCellFull!14278 (v!17682 V!45093)) (EmptyCell!14278) )
))
(declare-datatypes ((array!76747 0))(
  ( (array!76748 (arr!37023 (Array (_ BitVec 32) ValueCell!14278)) (size!37559 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76747)

(declare-fun lt!540445 () V!45093)

(declare-fun get!18966 (ValueCell!14278 V!45093) V!45093)

(assert (=> b!1188081 (= lt!540437 (get!18966 (select (arr!37023 _values!996) from!1455) lt!540445))))

(declare-fun b!1188082 () Bool)

(declare-fun res!789925 () Bool)

(declare-fun e!675540 () Bool)

(assert (=> b!1188082 (=> (not res!789925) (not e!675540))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188082 (= res!789925 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37558 _keys!1208))))))

(declare-fun b!1188083 () Bool)

(declare-fun res!789920 () Bool)

(assert (=> b!1188083 (=> (not res!789920) (not e!675540))))

(declare-datatypes ((List!26059 0))(
  ( (Nil!26056) (Cons!26055 (h!27264 (_ BitVec 64)) (t!38496 List!26059)) )
))
(declare-fun arrayNoDuplicates!0 (array!76745 (_ BitVec 32) List!26059) Bool)

(assert (=> b!1188083 (= res!789920 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26056))))

(declare-fun b!1188084 () Bool)

(declare-fun e!675545 () Bool)

(declare-fun e!675542 () Bool)

(assert (=> b!1188084 (= e!675545 (not e!675542))))

(declare-fun res!789922 () Bool)

(assert (=> b!1188084 (=> res!789922 e!675542)))

(assert (=> b!1188084 (= res!789922 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188084 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!540443 () Unit!39413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76745 (_ BitVec 64) (_ BitVec 32)) Unit!39413)

(assert (=> b!1188084 (= lt!540443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!789916 () Bool)

(assert (=> start!99866 (=> (not res!789916) (not e!675540))))

(assert (=> start!99866 (= res!789916 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37558 _keys!1208))))))

(assert (=> start!99866 e!675540))

(declare-fun tp_is_empty!29975 () Bool)

(assert (=> start!99866 tp_is_empty!29975))

(declare-fun array_inv!28246 (array!76745) Bool)

(assert (=> start!99866 (array_inv!28246 _keys!1208)))

(assert (=> start!99866 true))

(assert (=> start!99866 tp!89049))

(declare-fun e!675549 () Bool)

(declare-fun array_inv!28247 (array!76747) Bool)

(assert (=> start!99866 (and (array_inv!28247 _values!996) e!675549)))

(declare-fun b!1188085 () Bool)

(declare-fun res!789915 () Bool)

(assert (=> b!1188085 (=> (not res!789915) (not e!675540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188085 (= res!789915 (validKeyInArray!0 k!934))))

(declare-fun b!1188086 () Bool)

(declare-fun res!789924 () Bool)

(assert (=> b!1188086 (=> (not res!789924) (not e!675540))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1188086 (= res!789924 (and (= (size!37559 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37558 _keys!1208) (size!37559 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188087 () Bool)

(declare-fun res!789917 () Bool)

(assert (=> b!1188087 (=> (not res!789917) (not e!675545))))

(declare-fun lt!540450 () array!76745)

(assert (=> b!1188087 (= res!789917 (arrayNoDuplicates!0 lt!540450 #b00000000000000000000000000000000 Nil!26056))))

(declare-fun b!1188088 () Bool)

(declare-fun e!675546 () Bool)

(assert (=> b!1188088 (= e!675542 e!675546)))

(declare-fun res!789926 () Bool)

(assert (=> b!1188088 (=> res!789926 e!675546)))

(assert (=> b!1188088 (= res!789926 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45093)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540442 () array!76747)

(declare-fun minValue!944 () V!45093)

(declare-fun getCurrentListMapNoExtraKeys!5100 (array!76745 array!76747 (_ BitVec 32) (_ BitVec 32) V!45093 V!45093 (_ BitVec 32) Int) ListLongMap!17287)

(assert (=> b!1188088 (= lt!540441 (getCurrentListMapNoExtraKeys!5100 lt!540450 lt!540442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1188088 (= lt!540442 (array!76748 (store (arr!37023 _values!996) i!673 (ValueCellFull!14278 lt!540445)) (size!37559 _values!996)))))

(declare-fun dynLambda!3046 (Int (_ BitVec 64)) V!45093)

(assert (=> b!1188088 (= lt!540445 (dynLambda!3046 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1188088 (= lt!540446 (getCurrentListMapNoExtraKeys!5100 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188089 () Bool)

(declare-fun e!675541 () Bool)

(assert (=> b!1188089 (= e!675547 e!675541)))

(declare-fun res!789927 () Bool)

(assert (=> b!1188089 (=> res!789927 e!675541)))

(assert (=> b!1188089 (= res!789927 (not (= (select (arr!37022 _keys!1208) from!1455) k!934)))))

(declare-fun b!1188090 () Bool)

(declare-fun e!675548 () Bool)

(assert (=> b!1188090 (= e!675548 tp_is_empty!29975)))

(declare-fun b!1188091 () Bool)

(assert (=> b!1188091 (= e!675541 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1188092 () Bool)

(declare-fun res!789918 () Bool)

(assert (=> b!1188092 (=> (not res!789918) (not e!675540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76745 (_ BitVec 32)) Bool)

(assert (=> b!1188092 (= res!789918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188093 () Bool)

(declare-fun e!675543 () Bool)

(declare-fun mapRes!46790 () Bool)

(assert (=> b!1188093 (= e!675549 (and e!675543 mapRes!46790))))

(declare-fun condMapEmpty!46790 () Bool)

(declare-fun mapDefault!46790 () ValueCell!14278)

