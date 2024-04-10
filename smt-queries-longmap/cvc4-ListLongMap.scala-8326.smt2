; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101334 () Bool)

(assert start!101334)

(declare-fun b_free!26231 () Bool)

(declare-fun b_next!26231 () Bool)

(assert (=> start!101334 (= b_free!26231 (not b_next!26231))))

(declare-fun tp!91717 () Bool)

(declare-fun b_and!43597 () Bool)

(assert (=> start!101334 (= tp!91717 b_and!43597)))

(declare-fun b!1217631 () Bool)

(declare-fun res!808639 () Bool)

(declare-fun e!691290 () Bool)

(assert (=> b!1217631 (=> (not res!808639) (not e!691290))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217631 (= res!808639 (validMask!0 mask!1564))))

(declare-fun b!1217632 () Bool)

(declare-fun res!808636 () Bool)

(assert (=> b!1217632 (=> (not res!808636) (not e!691290))))

(declare-datatypes ((array!78643 0))(
  ( (array!78644 (arr!37955 (Array (_ BitVec 32) (_ BitVec 64))) (size!38491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78643)

(declare-datatypes ((List!26768 0))(
  ( (Nil!26765) (Cons!26764 (h!27973 (_ BitVec 64)) (t!39979 List!26768)) )
))
(declare-fun arrayNoDuplicates!0 (array!78643 (_ BitVec 32) List!26768) Bool)

(assert (=> b!1217632 (= res!808636 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26765))))

(declare-fun mapNonEmpty!48280 () Bool)

(declare-fun mapRes!48280 () Bool)

(declare-fun tp!91718 () Bool)

(declare-fun e!691292 () Bool)

(assert (=> mapNonEmpty!48280 (= mapRes!48280 (and tp!91718 e!691292))))

(declare-fun mapKey!48280 () (_ BitVec 32))

(declare-datatypes ((V!46373 0))(
  ( (V!46374 (val!15524 Int)) )
))
(declare-datatypes ((ValueCell!14758 0))(
  ( (ValueCellFull!14758 (v!18178 V!46373)) (EmptyCell!14758) )
))
(declare-fun mapValue!48280 () ValueCell!14758)

(declare-datatypes ((array!78645 0))(
  ( (array!78646 (arr!37956 (Array (_ BitVec 32) ValueCell!14758)) (size!38492 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78645)

(declare-fun mapRest!48280 () (Array (_ BitVec 32) ValueCell!14758))

(assert (=> mapNonEmpty!48280 (= (arr!37956 _values!996) (store mapRest!48280 mapKey!48280 mapValue!48280))))

(declare-fun b!1217633 () Bool)

(declare-fun tp_is_empty!30935 () Bool)

(assert (=> b!1217633 (= e!691292 tp_is_empty!30935)))

(declare-fun b!1217634 () Bool)

(declare-fun res!808640 () Bool)

(assert (=> b!1217634 (=> (not res!808640) (not e!691290))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1217634 (= res!808640 (= (select (arr!37955 _keys!1208) i!673) k!934))))

(declare-fun b!1217635 () Bool)

(declare-fun res!808632 () Bool)

(assert (=> b!1217635 (=> (not res!808632) (not e!691290))))

(assert (=> b!1217635 (= res!808632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208))))))

(declare-fun b!1217636 () Bool)

(declare-fun e!691288 () Bool)

(assert (=> b!1217636 (= e!691288 tp_is_empty!30935)))

(declare-fun b!1217637 () Bool)

(declare-fun e!691285 () Bool)

(declare-fun e!691289 () Bool)

(assert (=> b!1217637 (= e!691285 e!691289)))

(declare-fun res!808642 () Bool)

(assert (=> b!1217637 (=> res!808642 e!691289)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1217637 (= res!808642 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46373)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19964 0))(
  ( (tuple2!19965 (_1!9993 (_ BitVec 64)) (_2!9993 V!46373)) )
))
(declare-datatypes ((List!26769 0))(
  ( (Nil!26766) (Cons!26765 (h!27974 tuple2!19964) (t!39980 List!26769)) )
))
(declare-datatypes ((ListLongMap!17933 0))(
  ( (ListLongMap!17934 (toList!8982 List!26769)) )
))
(declare-fun lt!553463 () ListLongMap!17933)

(declare-fun lt!553462 () array!78643)

(declare-fun lt!553461 () array!78645)

(declare-fun minValue!944 () V!46373)

(declare-fun getCurrentListMapNoExtraKeys!5409 (array!78643 array!78645 (_ BitVec 32) (_ BitVec 32) V!46373 V!46373 (_ BitVec 32) Int) ListLongMap!17933)

(assert (=> b!1217637 (= lt!553463 (getCurrentListMapNoExtraKeys!5409 lt!553462 lt!553461 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553460 () V!46373)

(assert (=> b!1217637 (= lt!553461 (array!78646 (store (arr!37956 _values!996) i!673 (ValueCellFull!14758 lt!553460)) (size!38492 _values!996)))))

(declare-fun dynLambda!3295 (Int (_ BitVec 64)) V!46373)

(assert (=> b!1217637 (= lt!553460 (dynLambda!3295 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553458 () ListLongMap!17933)

(assert (=> b!1217637 (= lt!553458 (getCurrentListMapNoExtraKeys!5409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217638 () Bool)

(declare-fun e!691286 () Bool)

(declare-fun arrayContainsKey!0 (array!78643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217638 (= e!691286 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217640 () Bool)

(declare-fun e!691284 () Bool)

(assert (=> b!1217640 (= e!691290 e!691284)))

(declare-fun res!808634 () Bool)

(assert (=> b!1217640 (=> (not res!808634) (not e!691284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78643 (_ BitVec 32)) Bool)

(assert (=> b!1217640 (= res!808634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553462 mask!1564))))

(assert (=> b!1217640 (= lt!553462 (array!78644 (store (arr!37955 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38491 _keys!1208)))))

(declare-fun b!1217641 () Bool)

(declare-fun res!808637 () Bool)

(assert (=> b!1217641 (=> (not res!808637) (not e!691290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217641 (= res!808637 (validKeyInArray!0 k!934))))

(declare-fun b!1217642 () Bool)

(declare-fun res!808644 () Bool)

(assert (=> b!1217642 (=> (not res!808644) (not e!691284))))

(assert (=> b!1217642 (= res!808644 (arrayNoDuplicates!0 lt!553462 #b00000000000000000000000000000000 Nil!26765))))

(declare-fun b!1217643 () Bool)

(declare-fun res!808643 () Bool)

(assert (=> b!1217643 (=> (not res!808643) (not e!691290))))

(assert (=> b!1217643 (= res!808643 (and (= (size!38492 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38491 _keys!1208) (size!38492 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217644 () Bool)

(declare-fun e!691283 () Bool)

(assert (=> b!1217644 (= e!691289 e!691283)))

(declare-fun res!808633 () Bool)

(assert (=> b!1217644 (=> res!808633 e!691283)))

(assert (=> b!1217644 (= res!808633 (not (validKeyInArray!0 (select (arr!37955 _keys!1208) from!1455))))))

(declare-fun lt!553465 () ListLongMap!17933)

(declare-fun lt!553459 () ListLongMap!17933)

(assert (=> b!1217644 (= lt!553465 lt!553459)))

(declare-fun lt!553464 () ListLongMap!17933)

(declare-fun -!1898 (ListLongMap!17933 (_ BitVec 64)) ListLongMap!17933)

(assert (=> b!1217644 (= lt!553459 (-!1898 lt!553464 k!934))))

(assert (=> b!1217644 (= lt!553465 (getCurrentListMapNoExtraKeys!5409 lt!553462 lt!553461 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217644 (= lt!553464 (getCurrentListMapNoExtraKeys!5409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40368 0))(
  ( (Unit!40369) )
))
(declare-fun lt!553466 () Unit!40368)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1105 (array!78643 array!78645 (_ BitVec 32) (_ BitVec 32) V!46373 V!46373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40368)

(assert (=> b!1217644 (= lt!553466 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1105 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48280 () Bool)

(assert (=> mapIsEmpty!48280 mapRes!48280))

(declare-fun b!1217645 () Bool)

(assert (=> b!1217645 (= e!691284 (not e!691285))))

(declare-fun res!808641 () Bool)

(assert (=> b!1217645 (=> res!808641 e!691285)))

(assert (=> b!1217645 (= res!808641 (bvsgt from!1455 i!673))))

(assert (=> b!1217645 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!553467 () Unit!40368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78643 (_ BitVec 64) (_ BitVec 32)) Unit!40368)

(assert (=> b!1217645 (= lt!553467 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217646 () Bool)

(declare-fun e!691287 () Bool)

(assert (=> b!1217646 (= e!691287 (and e!691288 mapRes!48280))))

(declare-fun condMapEmpty!48280 () Bool)

(declare-fun mapDefault!48280 () ValueCell!14758)

