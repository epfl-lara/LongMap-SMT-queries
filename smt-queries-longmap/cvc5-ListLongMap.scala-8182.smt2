; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99958 () Bool)

(assert start!99958)

(declare-fun b_free!25537 () Bool)

(declare-fun b_next!25537 () Bool)

(assert (=> start!99958 (= b_free!25537 (not b_next!25537))))

(declare-fun tp!89324 () Bool)

(declare-fun b_and!41941 () Bool)

(assert (=> start!99958 (= tp!89324 b_and!41941)))

(declare-fun b!1190293 () Bool)

(declare-fun e!676685 () Bool)

(declare-fun tp_is_empty!30067 () Bool)

(assert (=> b!1190293 (= e!676685 tp_is_empty!30067)))

(declare-fun b!1190294 () Bool)

(declare-fun e!676690 () Bool)

(assert (=> b!1190294 (= e!676690 true)))

(declare-datatypes ((V!45217 0))(
  ( (V!45218 (val!15090 Int)) )
))
(declare-fun zeroValue!944 () V!45217)

(declare-datatypes ((array!76925 0))(
  ( (array!76926 (arr!37112 (Array (_ BitVec 32) (_ BitVec 64))) (size!37648 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76925)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541397 () array!76925)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14324 0))(
  ( (ValueCellFull!14324 (v!17728 V!45217)) (EmptyCell!14324) )
))
(declare-datatypes ((array!76927 0))(
  ( (array!76928 (arr!37113 (Array (_ BitVec 32) ValueCell!14324)) (size!37649 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76927)

(declare-fun minValue!944 () V!45217)

(declare-fun lt!541395 () array!76927)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19382 0))(
  ( (tuple2!19383 (_1!9702 (_ BitVec 64)) (_2!9702 V!45217)) )
))
(declare-datatypes ((List!26128 0))(
  ( (Nil!26125) (Cons!26124 (h!27333 tuple2!19382) (t!38657 List!26128)) )
))
(declare-datatypes ((ListLongMap!17351 0))(
  ( (ListLongMap!17352 (toList!8691 List!26128)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5132 (array!76925 array!76927 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) Int) ListLongMap!17351)

(declare-fun -!1718 (ListLongMap!17351 (_ BitVec 64)) ListLongMap!17351)

(assert (=> b!1190294 (= (getCurrentListMapNoExtraKeys!5132 lt!541397 lt!541395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1718 (getCurrentListMapNoExtraKeys!5132 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39478 0))(
  ( (Unit!39479) )
))
(declare-fun lt!541394 () Unit!39478)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!927 (array!76925 array!76927 (_ BitVec 32) (_ BitVec 32) V!45217 V!45217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39478)

(assert (=> b!1190294 (= lt!541394 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!927 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190295 () Bool)

(declare-fun res!791603 () Bool)

(declare-fun e!676687 () Bool)

(assert (=> b!1190295 (=> (not res!791603) (not e!676687))))

(assert (=> b!1190295 (= res!791603 (= (select (arr!37112 _keys!1208) i!673) k!934))))

(declare-fun res!791605 () Bool)

(assert (=> start!99958 (=> (not res!791605) (not e!676687))))

(assert (=> start!99958 (= res!791605 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37648 _keys!1208))))))

(assert (=> start!99958 e!676687))

(assert (=> start!99958 tp_is_empty!30067))

(declare-fun array_inv!28302 (array!76925) Bool)

(assert (=> start!99958 (array_inv!28302 _keys!1208)))

(assert (=> start!99958 true))

(assert (=> start!99958 tp!89324))

(declare-fun e!676689 () Bool)

(declare-fun array_inv!28303 (array!76927) Bool)

(assert (=> start!99958 (and (array_inv!28303 _values!996) e!676689)))

(declare-fun mapNonEmpty!46928 () Bool)

(declare-fun mapRes!46928 () Bool)

(declare-fun tp!89325 () Bool)

(declare-fun e!676683 () Bool)

(assert (=> mapNonEmpty!46928 (= mapRes!46928 (and tp!89325 e!676683))))

(declare-fun mapValue!46928 () ValueCell!14324)

(declare-fun mapKey!46928 () (_ BitVec 32))

(declare-fun mapRest!46928 () (Array (_ BitVec 32) ValueCell!14324))

(assert (=> mapNonEmpty!46928 (= (arr!37113 _values!996) (store mapRest!46928 mapKey!46928 mapValue!46928))))

(declare-fun b!1190296 () Bool)

(declare-fun res!791607 () Bool)

(declare-fun e!676688 () Bool)

(assert (=> b!1190296 (=> (not res!791607) (not e!676688))))

(declare-datatypes ((List!26129 0))(
  ( (Nil!26126) (Cons!26125 (h!27334 (_ BitVec 64)) (t!38658 List!26129)) )
))
(declare-fun arrayNoDuplicates!0 (array!76925 (_ BitVec 32) List!26129) Bool)

(assert (=> b!1190296 (= res!791607 (arrayNoDuplicates!0 lt!541397 #b00000000000000000000000000000000 Nil!26126))))

(declare-fun b!1190297 () Bool)

(declare-fun res!791600 () Bool)

(assert (=> b!1190297 (=> (not res!791600) (not e!676687))))

(assert (=> b!1190297 (= res!791600 (and (= (size!37649 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37648 _keys!1208) (size!37649 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190298 () Bool)

(declare-fun res!791609 () Bool)

(assert (=> b!1190298 (=> (not res!791609) (not e!676687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190298 (= res!791609 (validMask!0 mask!1564))))

(declare-fun b!1190299 () Bool)

(declare-fun res!791601 () Bool)

(assert (=> b!1190299 (=> (not res!791601) (not e!676687))))

(assert (=> b!1190299 (= res!791601 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37648 _keys!1208))))))

(declare-fun mapIsEmpty!46928 () Bool)

(assert (=> mapIsEmpty!46928 mapRes!46928))

(declare-fun b!1190300 () Bool)

(declare-fun res!791604 () Bool)

(assert (=> b!1190300 (=> (not res!791604) (not e!676687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190300 (= res!791604 (validKeyInArray!0 k!934))))

(declare-fun b!1190301 () Bool)

(declare-fun e!676686 () Bool)

(assert (=> b!1190301 (= e!676686 e!676690)))

(declare-fun res!791608 () Bool)

(assert (=> b!1190301 (=> res!791608 e!676690)))

(assert (=> b!1190301 (= res!791608 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541398 () ListLongMap!17351)

(assert (=> b!1190301 (= lt!541398 (getCurrentListMapNoExtraKeys!5132 lt!541397 lt!541395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3073 (Int (_ BitVec 64)) V!45217)

(assert (=> b!1190301 (= lt!541395 (array!76928 (store (arr!37113 _values!996) i!673 (ValueCellFull!14324 (dynLambda!3073 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37649 _values!996)))))

(declare-fun lt!541396 () ListLongMap!17351)

(assert (=> b!1190301 (= lt!541396 (getCurrentListMapNoExtraKeys!5132 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190302 () Bool)

(assert (=> b!1190302 (= e!676688 (not e!676686))))

(declare-fun res!791610 () Bool)

(assert (=> b!1190302 (=> res!791610 e!676686)))

(assert (=> b!1190302 (= res!791610 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190302 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541393 () Unit!39478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76925 (_ BitVec 64) (_ BitVec 32)) Unit!39478)

(assert (=> b!1190302 (= lt!541393 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190303 () Bool)

(declare-fun res!791606 () Bool)

(assert (=> b!1190303 (=> (not res!791606) (not e!676687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76925 (_ BitVec 32)) Bool)

(assert (=> b!1190303 (= res!791606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190304 () Bool)

(assert (=> b!1190304 (= e!676689 (and e!676685 mapRes!46928))))

(declare-fun condMapEmpty!46928 () Bool)

(declare-fun mapDefault!46928 () ValueCell!14324)

