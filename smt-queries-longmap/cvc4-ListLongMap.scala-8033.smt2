; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99042 () Bool)

(assert start!99042)

(declare-fun b_free!24647 () Bool)

(declare-fun b_next!24647 () Bool)

(assert (=> start!99042 (= b_free!24647 (not b_next!24647))))

(declare-fun tp!86652 () Bool)

(declare-fun b_and!40143 () Bool)

(assert (=> start!99042 (= tp!86652 b_and!40143)))

(declare-fun b!1164358 () Bool)

(declare-fun res!772128 () Bool)

(declare-fun e!662026 () Bool)

(assert (=> b!1164358 (=> (not res!772128) (not e!662026))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164358 (= res!772128 (validKeyInArray!0 k!934))))

(declare-fun b!1164359 () Bool)

(declare-fun res!772121 () Bool)

(assert (=> b!1164359 (=> (not res!772121) (not e!662026))))

(declare-datatypes ((array!75189 0))(
  ( (array!75190 (arr!36245 (Array (_ BitVec 32) (_ BitVec 64))) (size!36781 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75189)

(declare-datatypes ((List!25410 0))(
  ( (Nil!25407) (Cons!25406 (h!26615 (_ BitVec 64)) (t!37049 List!25410)) )
))
(declare-fun arrayNoDuplicates!0 (array!75189 (_ BitVec 32) List!25410) Bool)

(assert (=> b!1164359 (= res!772121 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25407))))

(declare-fun b!1164360 () Bool)

(declare-fun res!772125 () Bool)

(assert (=> b!1164360 (=> (not res!772125) (not e!662026))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164360 (= res!772125 (= (select (arr!36245 _keys!1208) i!673) k!934))))

(declare-fun b!1164361 () Bool)

(declare-fun res!772126 () Bool)

(assert (=> b!1164361 (=> (not res!772126) (not e!662026))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75189 (_ BitVec 32)) Bool)

(assert (=> b!1164361 (= res!772126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45590 () Bool)

(declare-fun mapRes!45590 () Bool)

(assert (=> mapIsEmpty!45590 mapRes!45590))

(declare-fun b!1164362 () Bool)

(declare-fun res!772123 () Bool)

(assert (=> b!1164362 (=> (not res!772123) (not e!662026))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44029 0))(
  ( (V!44030 (val!14645 Int)) )
))
(declare-datatypes ((ValueCell!13879 0))(
  ( (ValueCellFull!13879 (v!17282 V!44029)) (EmptyCell!13879) )
))
(declare-datatypes ((array!75191 0))(
  ( (array!75192 (arr!36246 (Array (_ BitVec 32) ValueCell!13879)) (size!36782 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75191)

(assert (=> b!1164362 (= res!772123 (and (= (size!36782 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36781 _keys!1208) (size!36782 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164363 () Bool)

(declare-fun e!662025 () Bool)

(assert (=> b!1164363 (= e!662025 true)))

(declare-fun zeroValue!944 () V!44029)

(declare-fun lt!524616 () array!75189)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18678 0))(
  ( (tuple2!18679 (_1!9350 (_ BitVec 64)) (_2!9350 V!44029)) )
))
(declare-datatypes ((List!25411 0))(
  ( (Nil!25408) (Cons!25407 (h!26616 tuple2!18678) (t!37050 List!25411)) )
))
(declare-datatypes ((ListLongMap!16647 0))(
  ( (ListLongMap!16648 (toList!8339 List!25411)) )
))
(declare-fun lt!524619 () ListLongMap!16647)

(declare-fun minValue!944 () V!44029)

(declare-fun getCurrentListMapNoExtraKeys!4803 (array!75189 array!75191 (_ BitVec 32) (_ BitVec 32) V!44029 V!44029 (_ BitVec 32) Int) ListLongMap!16647)

(declare-fun dynLambda!2793 (Int (_ BitVec 64)) V!44029)

(assert (=> b!1164363 (= lt!524619 (getCurrentListMapNoExtraKeys!4803 lt!524616 (array!75192 (store (arr!36246 _values!996) i!673 (ValueCellFull!13879 (dynLambda!2793 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36782 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524618 () ListLongMap!16647)

(assert (=> b!1164363 (= lt!524618 (getCurrentListMapNoExtraKeys!4803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164365 () Bool)

(declare-fun e!662024 () Bool)

(assert (=> b!1164365 (= e!662024 (not e!662025))))

(declare-fun res!772120 () Bool)

(assert (=> b!1164365 (=> res!772120 e!662025)))

(assert (=> b!1164365 (= res!772120 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164365 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38432 0))(
  ( (Unit!38433) )
))
(declare-fun lt!524617 () Unit!38432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75189 (_ BitVec 64) (_ BitVec 32)) Unit!38432)

(assert (=> b!1164365 (= lt!524617 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1164366 () Bool)

(declare-fun res!772130 () Bool)

(assert (=> b!1164366 (=> (not res!772130) (not e!662024))))

(assert (=> b!1164366 (= res!772130 (arrayNoDuplicates!0 lt!524616 #b00000000000000000000000000000000 Nil!25407))))

(declare-fun b!1164367 () Bool)

(declare-fun e!662022 () Bool)

(declare-fun tp_is_empty!29177 () Bool)

(assert (=> b!1164367 (= e!662022 tp_is_empty!29177)))

(declare-fun b!1164368 () Bool)

(declare-fun res!772122 () Bool)

(assert (=> b!1164368 (=> (not res!772122) (not e!662026))))

(assert (=> b!1164368 (= res!772122 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36781 _keys!1208))))))

(declare-fun b!1164369 () Bool)

(declare-fun e!662023 () Bool)

(assert (=> b!1164369 (= e!662023 tp_is_empty!29177)))

(declare-fun b!1164370 () Bool)

(assert (=> b!1164370 (= e!662026 e!662024)))

(declare-fun res!772127 () Bool)

(assert (=> b!1164370 (=> (not res!772127) (not e!662024))))

(assert (=> b!1164370 (= res!772127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524616 mask!1564))))

(assert (=> b!1164370 (= lt!524616 (array!75190 (store (arr!36245 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36781 _keys!1208)))))

(declare-fun b!1164364 () Bool)

(declare-fun res!772129 () Bool)

(assert (=> b!1164364 (=> (not res!772129) (not e!662026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164364 (= res!772129 (validMask!0 mask!1564))))

(declare-fun res!772124 () Bool)

(assert (=> start!99042 (=> (not res!772124) (not e!662026))))

(assert (=> start!99042 (= res!772124 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36781 _keys!1208))))))

(assert (=> start!99042 e!662026))

(assert (=> start!99042 tp_is_empty!29177))

(declare-fun array_inv!27730 (array!75189) Bool)

(assert (=> start!99042 (array_inv!27730 _keys!1208)))

(assert (=> start!99042 true))

(assert (=> start!99042 tp!86652))

(declare-fun e!662027 () Bool)

(declare-fun array_inv!27731 (array!75191) Bool)

(assert (=> start!99042 (and (array_inv!27731 _values!996) e!662027)))

(declare-fun b!1164371 () Bool)

(assert (=> b!1164371 (= e!662027 (and e!662023 mapRes!45590))))

(declare-fun condMapEmpty!45590 () Bool)

(declare-fun mapDefault!45590 () ValueCell!13879)

