; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99048 () Bool)

(assert start!99048)

(declare-fun b_free!24653 () Bool)

(declare-fun b_next!24653 () Bool)

(assert (=> start!99048 (= b_free!24653 (not b_next!24653))))

(declare-fun tp!86670 () Bool)

(declare-fun b_and!40155 () Bool)

(assert (=> start!99048 (= tp!86670 b_and!40155)))

(declare-fun b!1164490 () Bool)

(declare-fun res!772226 () Bool)

(declare-fun e!662085 () Bool)

(assert (=> b!1164490 (=> (not res!772226) (not e!662085))))

(declare-datatypes ((array!75201 0))(
  ( (array!75202 (arr!36251 (Array (_ BitVec 32) (_ BitVec 64))) (size!36787 (_ BitVec 32))) )
))
(declare-fun lt!524654 () array!75201)

(declare-datatypes ((List!25415 0))(
  ( (Nil!25412) (Cons!25411 (h!26620 (_ BitVec 64)) (t!37060 List!25415)) )
))
(declare-fun arrayNoDuplicates!0 (array!75201 (_ BitVec 32) List!25415) Bool)

(assert (=> b!1164490 (= res!772226 (arrayNoDuplicates!0 lt!524654 #b00000000000000000000000000000000 Nil!25412))))

(declare-fun b!1164491 () Bool)

(declare-fun e!662090 () Bool)

(assert (=> b!1164491 (= e!662090 true)))

(declare-datatypes ((V!44037 0))(
  ( (V!44038 (val!14648 Int)) )
))
(declare-fun zeroValue!944 () V!44037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13882 0))(
  ( (ValueCellFull!13882 (v!17285 V!44037)) (EmptyCell!13882) )
))
(declare-datatypes ((array!75203 0))(
  ( (array!75204 (arr!36252 (Array (_ BitVec 32) ValueCell!13882)) (size!36788 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75203)

(declare-datatypes ((tuple2!18682 0))(
  ( (tuple2!18683 (_1!9352 (_ BitVec 64)) (_2!9352 V!44037)) )
))
(declare-datatypes ((List!25416 0))(
  ( (Nil!25413) (Cons!25412 (h!26621 tuple2!18682) (t!37061 List!25416)) )
))
(declare-datatypes ((ListLongMap!16651 0))(
  ( (ListLongMap!16652 (toList!8341 List!25416)) )
))
(declare-fun lt!524653 () ListLongMap!16651)

(declare-fun minValue!944 () V!44037)

(declare-fun getCurrentListMapNoExtraKeys!4805 (array!75201 array!75203 (_ BitVec 32) (_ BitVec 32) V!44037 V!44037 (_ BitVec 32) Int) ListLongMap!16651)

(declare-fun dynLambda!2795 (Int (_ BitVec 64)) V!44037)

(assert (=> b!1164491 (= lt!524653 (getCurrentListMapNoExtraKeys!4805 lt!524654 (array!75204 (store (arr!36252 _values!996) i!673 (ValueCellFull!13882 (dynLambda!2795 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36788 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75201)

(declare-fun lt!524652 () ListLongMap!16651)

(assert (=> b!1164491 (= lt!524652 (getCurrentListMapNoExtraKeys!4805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164492 () Bool)

(declare-fun res!772221 () Bool)

(declare-fun e!662088 () Bool)

(assert (=> b!1164492 (=> (not res!772221) (not e!662088))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164492 (= res!772221 (validKeyInArray!0 k!934))))

(declare-fun b!1164493 () Bool)

(declare-fun e!662089 () Bool)

(declare-fun tp_is_empty!29183 () Bool)

(assert (=> b!1164493 (= e!662089 tp_is_empty!29183)))

(declare-fun b!1164494 () Bool)

(declare-fun res!772224 () Bool)

(assert (=> b!1164494 (=> (not res!772224) (not e!662088))))

(assert (=> b!1164494 (= res!772224 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25412))))

(declare-fun b!1164495 () Bool)

(declare-fun res!772227 () Bool)

(assert (=> b!1164495 (=> (not res!772227) (not e!662088))))

(assert (=> b!1164495 (= res!772227 (and (= (size!36788 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36787 _keys!1208) (size!36788 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164496 () Bool)

(declare-fun e!662087 () Bool)

(declare-fun e!662086 () Bool)

(declare-fun mapRes!45599 () Bool)

(assert (=> b!1164496 (= e!662087 (and e!662086 mapRes!45599))))

(declare-fun condMapEmpty!45599 () Bool)

(declare-fun mapDefault!45599 () ValueCell!13882)

