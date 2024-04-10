; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99796 () Bool)

(assert start!99796)

(declare-fun b_free!25375 () Bool)

(declare-fun b_next!25375 () Bool)

(assert (=> start!99796 (= b_free!25375 (not b_next!25375))))

(declare-fun tp!88839 () Bool)

(declare-fun b_and!41617 () Bool)

(assert (=> start!99796 (= tp!88839 b_and!41617)))

(declare-fun b!1185911 () Bool)

(declare-fun res!788347 () Bool)

(declare-fun e!674288 () Bool)

(assert (=> b!1185911 (=> (not res!788347) (not e!674288))))

(declare-datatypes ((array!76607 0))(
  ( (array!76608 (arr!36953 (Array (_ BitVec 32) (_ BitVec 64))) (size!37489 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76607)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1185911 (= res!788347 (= (select (arr!36953 _keys!1208) i!673) k!934))))

(declare-fun b!1185912 () Bool)

(declare-datatypes ((Unit!39298 0))(
  ( (Unit!39299) )
))
(declare-fun e!674279 () Unit!39298)

(declare-fun Unit!39300 () Unit!39298)

(assert (=> b!1185912 (= e!674279 Unit!39300)))

(declare-fun b!1185913 () Bool)

(declare-fun e!674282 () Bool)

(assert (=> b!1185913 (= e!674282 true)))

(declare-datatypes ((V!45001 0))(
  ( (V!45002 (val!15009 Int)) )
))
(declare-datatypes ((tuple2!19256 0))(
  ( (tuple2!19257 (_1!9639 (_ BitVec 64)) (_2!9639 V!45001)) )
))
(declare-datatypes ((List!25997 0))(
  ( (Nil!25994) (Cons!25993 (h!27202 tuple2!19256) (t!38364 List!25997)) )
))
(declare-datatypes ((ListLongMap!17225 0))(
  ( (ListLongMap!17226 (toList!8628 List!25997)) )
))
(declare-fun lt!538441 () ListLongMap!17225)

(declare-fun lt!538444 () ListLongMap!17225)

(declare-fun -!1661 (ListLongMap!17225 (_ BitVec 64)) ListLongMap!17225)

(assert (=> b!1185913 (= (-!1661 lt!538441 k!934) lt!538444)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538445 () Unit!39298)

(declare-fun lt!538452 () ListLongMap!17225)

(declare-fun lt!538449 () V!45001)

(declare-fun addRemoveCommutativeForDiffKeys!186 (ListLongMap!17225 (_ BitVec 64) V!45001 (_ BitVec 64)) Unit!39298)

(assert (=> b!1185913 (= lt!538445 (addRemoveCommutativeForDiffKeys!186 lt!538452 (select (arr!36953 _keys!1208) from!1455) lt!538449 k!934))))

(declare-fun lt!538440 () ListLongMap!17225)

(declare-fun lt!538455 () ListLongMap!17225)

(declare-fun lt!538447 () ListLongMap!17225)

(assert (=> b!1185913 (and (= lt!538455 lt!538441) (= lt!538447 lt!538440))))

(declare-fun lt!538443 () tuple2!19256)

(declare-fun +!3923 (ListLongMap!17225 tuple2!19256) ListLongMap!17225)

(assert (=> b!1185913 (= lt!538441 (+!3923 lt!538452 lt!538443))))

(assert (=> b!1185913 (not (= (select (arr!36953 _keys!1208) from!1455) k!934))))

(declare-fun lt!538457 () Unit!39298)

(assert (=> b!1185913 (= lt!538457 e!674279)))

(declare-fun c!117186 () Bool)

(assert (=> b!1185913 (= c!117186 (= (select (arr!36953 _keys!1208) from!1455) k!934))))

(declare-fun e!674283 () Bool)

(assert (=> b!1185913 e!674283))

(declare-fun res!788348 () Bool)

(assert (=> b!1185913 (=> (not res!788348) (not e!674283))))

(declare-fun lt!538458 () ListLongMap!17225)

(assert (=> b!1185913 (= res!788348 (= lt!538458 lt!538444))))

(assert (=> b!1185913 (= lt!538444 (+!3923 lt!538447 lt!538443))))

(assert (=> b!1185913 (= lt!538443 (tuple2!19257 (select (arr!36953 _keys!1208) from!1455) lt!538449))))

(declare-fun lt!538450 () V!45001)

(declare-datatypes ((ValueCell!14243 0))(
  ( (ValueCellFull!14243 (v!17647 V!45001)) (EmptyCell!14243) )
))
(declare-datatypes ((array!76609 0))(
  ( (array!76610 (arr!36954 (Array (_ BitVec 32) ValueCell!14243)) (size!37490 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76609)

(declare-fun get!18922 (ValueCell!14243 V!45001) V!45001)

(assert (=> b!1185913 (= lt!538449 (get!18922 (select (arr!36954 _values!996) from!1455) lt!538450))))

(declare-fun mapIsEmpty!46685 () Bool)

(declare-fun mapRes!46685 () Bool)

(assert (=> mapIsEmpty!46685 mapRes!46685))

(declare-fun b!1185914 () Bool)

(declare-fun e!674281 () Bool)

(assert (=> b!1185914 (= e!674288 e!674281)))

(declare-fun res!788340 () Bool)

(assert (=> b!1185914 (=> (not res!788340) (not e!674281))))

(declare-fun lt!538442 () array!76607)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76607 (_ BitVec 32)) Bool)

(assert (=> b!1185914 (= res!788340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538442 mask!1564))))

(assert (=> b!1185914 (= lt!538442 (array!76608 (store (arr!36953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37489 _keys!1208)))))

(declare-fun b!1185915 () Bool)

(declare-fun res!788349 () Bool)

(assert (=> b!1185915 (=> (not res!788349) (not e!674288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185915 (= res!788349 (validKeyInArray!0 k!934))))

(declare-fun b!1185916 () Bool)

(declare-fun res!788346 () Bool)

(assert (=> b!1185916 (=> (not res!788346) (not e!674288))))

(declare-datatypes ((List!25998 0))(
  ( (Nil!25995) (Cons!25994 (h!27203 (_ BitVec 64)) (t!38365 List!25998)) )
))
(declare-fun arrayNoDuplicates!0 (array!76607 (_ BitVec 32) List!25998) Bool)

(assert (=> b!1185916 (= res!788346 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25995))))

(declare-fun res!788343 () Bool)

(assert (=> start!99796 (=> (not res!788343) (not e!674288))))

(assert (=> start!99796 (= res!788343 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37489 _keys!1208))))))

(assert (=> start!99796 e!674288))

(declare-fun tp_is_empty!29905 () Bool)

(assert (=> start!99796 tp_is_empty!29905))

(declare-fun array_inv!28200 (array!76607) Bool)

(assert (=> start!99796 (array_inv!28200 _keys!1208)))

(assert (=> start!99796 true))

(assert (=> start!99796 tp!88839))

(declare-fun e!674286 () Bool)

(declare-fun array_inv!28201 (array!76609) Bool)

(assert (=> start!99796 (and (array_inv!28201 _values!996) e!674286)))

(declare-fun b!1185917 () Bool)

(declare-fun e!674284 () Bool)

(assert (=> b!1185917 (= e!674284 e!674282)))

(declare-fun res!788350 () Bool)

(assert (=> b!1185917 (=> res!788350 e!674282)))

(assert (=> b!1185917 (= res!788350 (not (validKeyInArray!0 (select (arr!36953 _keys!1208) from!1455))))))

(assert (=> b!1185917 (= lt!538440 lt!538447)))

(assert (=> b!1185917 (= lt!538447 (-!1661 lt!538452 k!934))))

(declare-fun zeroValue!944 () V!45001)

(declare-fun lt!538451 () array!76609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45001)

(declare-fun getCurrentListMapNoExtraKeys!5073 (array!76607 array!76609 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) Int) ListLongMap!17225)

(assert (=> b!1185917 (= lt!538440 (getCurrentListMapNoExtraKeys!5073 lt!538442 lt!538451 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185917 (= lt!538452 (getCurrentListMapNoExtraKeys!5073 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538454 () Unit!39298)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!876 (array!76607 array!76609 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39298)

(assert (=> b!1185917 (= lt!538454 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!876 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185918 () Bool)

(declare-fun res!788353 () Bool)

(assert (=> b!1185918 (=> (not res!788353) (not e!674281))))

(assert (=> b!1185918 (= res!788353 (arrayNoDuplicates!0 lt!538442 #b00000000000000000000000000000000 Nil!25995))))

(declare-fun b!1185919 () Bool)

(declare-fun e!674290 () Bool)

(assert (=> b!1185919 (= e!674281 (not e!674290))))

(declare-fun res!788339 () Bool)

(assert (=> b!1185919 (=> res!788339 e!674290)))

(assert (=> b!1185919 (= res!788339 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185919 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538453 () Unit!39298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76607 (_ BitVec 64) (_ BitVec 32)) Unit!39298)

(assert (=> b!1185919 (= lt!538453 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185920 () Bool)

(declare-fun res!788344 () Bool)

(assert (=> b!1185920 (=> (not res!788344) (not e!674288))))

(assert (=> b!1185920 (= res!788344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185921 () Bool)

(declare-fun res!788345 () Bool)

(assert (=> b!1185921 (=> (not res!788345) (not e!674288))))

(assert (=> b!1185921 (= res!788345 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37489 _keys!1208))))))

(declare-fun b!1185922 () Bool)

(declare-fun e!674285 () Bool)

(assert (=> b!1185922 (= e!674283 e!674285)))

(declare-fun res!788341 () Bool)

(assert (=> b!1185922 (=> res!788341 e!674285)))

(assert (=> b!1185922 (= res!788341 (not (= (select (arr!36953 _keys!1208) from!1455) k!934)))))

(declare-fun b!1185923 () Bool)

(assert (=> b!1185923 (= e!674285 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185924 () Bool)

(declare-fun e!674287 () Bool)

(assert (=> b!1185924 (= e!674287 tp_is_empty!29905)))

(declare-fun b!1185925 () Bool)

(declare-fun res!788351 () Bool)

(assert (=> b!1185925 (=> (not res!788351) (not e!674288))))

(assert (=> b!1185925 (= res!788351 (and (= (size!37490 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37489 _keys!1208) (size!37490 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185926 () Bool)

(declare-fun Unit!39301 () Unit!39298)

(assert (=> b!1185926 (= e!674279 Unit!39301)))

(declare-fun lt!538446 () Unit!39298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39298)

(assert (=> b!1185926 (= lt!538446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185926 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538448 () Unit!39298)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76607 (_ BitVec 32) (_ BitVec 32)) Unit!39298)

(assert (=> b!1185926 (= lt!538448 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185926 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25995)))

(declare-fun lt!538456 () Unit!39298)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76607 (_ BitVec 64) (_ BitVec 32) List!25998) Unit!39298)

(assert (=> b!1185926 (= lt!538456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25995))))

(assert (=> b!1185926 false))

(declare-fun mapNonEmpty!46685 () Bool)

(declare-fun tp!88838 () Bool)

(declare-fun e!674289 () Bool)

(assert (=> mapNonEmpty!46685 (= mapRes!46685 (and tp!88838 e!674289))))

(declare-fun mapValue!46685 () ValueCell!14243)

(declare-fun mapRest!46685 () (Array (_ BitVec 32) ValueCell!14243))

(declare-fun mapKey!46685 () (_ BitVec 32))

(assert (=> mapNonEmpty!46685 (= (arr!36954 _values!996) (store mapRest!46685 mapKey!46685 mapValue!46685))))

(declare-fun b!1185927 () Bool)

(assert (=> b!1185927 (= e!674286 (and e!674287 mapRes!46685))))

(declare-fun condMapEmpty!46685 () Bool)

(declare-fun mapDefault!46685 () ValueCell!14243)

