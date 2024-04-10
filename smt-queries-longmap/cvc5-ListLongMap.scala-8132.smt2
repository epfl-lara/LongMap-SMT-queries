; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99658 () Bool)

(assert start!99658)

(declare-fun b_free!25237 () Bool)

(declare-fun b_next!25237 () Bool)

(assert (=> start!99658 (= b_free!25237 (not b_next!25237))))

(declare-fun tp!88425 () Bool)

(declare-fun b_and!41341 () Bool)

(assert (=> start!99658 (= tp!88425 b_and!41341)))

(declare-fun b!1181633 () Bool)

(declare-datatypes ((Unit!39078 0))(
  ( (Unit!39079) )
))
(declare-fun e!671805 () Unit!39078)

(declare-fun Unit!39080 () Unit!39078)

(assert (=> b!1181633 (= e!671805 Unit!39080)))

(declare-fun b!1181634 () Bool)

(declare-fun res!785248 () Bool)

(declare-fun e!671799 () Bool)

(assert (=> b!1181634 (=> (not res!785248) (not e!671799))))

(declare-datatypes ((array!76337 0))(
  ( (array!76338 (arr!36818 (Array (_ BitVec 32) (_ BitVec 64))) (size!37354 (_ BitVec 32))) )
))
(declare-fun lt!534523 () array!76337)

(declare-datatypes ((List!25880 0))(
  ( (Nil!25877) (Cons!25876 (h!27085 (_ BitVec 64)) (t!38109 List!25880)) )
))
(declare-fun arrayNoDuplicates!0 (array!76337 (_ BitVec 32) List!25880) Bool)

(assert (=> b!1181634 (= res!785248 (arrayNoDuplicates!0 lt!534523 #b00000000000000000000000000000000 Nil!25877))))

(declare-fun b!1181635 () Bool)

(declare-fun res!785239 () Bool)

(declare-fun e!671796 () Bool)

(assert (=> b!1181635 (=> (not res!785239) (not e!671796))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181635 (= res!785239 (validKeyInArray!0 k!934))))

(declare-fun b!1181636 () Bool)

(declare-fun e!671797 () Bool)

(declare-fun e!671795 () Bool)

(assert (=> b!1181636 (= e!671797 e!671795)))

(declare-fun res!785241 () Bool)

(assert (=> b!1181636 (=> res!785241 e!671795)))

(declare-fun _keys!1208 () array!76337)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181636 (= res!785241 (not (validKeyInArray!0 (select (arr!36818 _keys!1208) from!1455))))))

(declare-datatypes ((V!44817 0))(
  ( (V!44818 (val!14940 Int)) )
))
(declare-datatypes ((tuple2!19140 0))(
  ( (tuple2!19141 (_1!9581 (_ BitVec 64)) (_2!9581 V!44817)) )
))
(declare-datatypes ((List!25881 0))(
  ( (Nil!25878) (Cons!25877 (h!27086 tuple2!19140) (t!38110 List!25881)) )
))
(declare-datatypes ((ListLongMap!17109 0))(
  ( (ListLongMap!17110 (toList!8570 List!25881)) )
))
(declare-fun lt!534508 () ListLongMap!17109)

(declare-fun lt!534509 () ListLongMap!17109)

(assert (=> b!1181636 (= lt!534508 lt!534509)))

(declare-fun lt!534514 () ListLongMap!17109)

(declare-fun -!1609 (ListLongMap!17109 (_ BitVec 64)) ListLongMap!17109)

(assert (=> b!1181636 (= lt!534509 (-!1609 lt!534514 k!934))))

(declare-fun zeroValue!944 () V!44817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14174 0))(
  ( (ValueCellFull!14174 (v!17578 V!44817)) (EmptyCell!14174) )
))
(declare-datatypes ((array!76339 0))(
  ( (array!76340 (arr!36819 (Array (_ BitVec 32) ValueCell!14174)) (size!37355 (_ BitVec 32))) )
))
(declare-fun lt!534517 () array!76339)

(declare-fun minValue!944 () V!44817)

(declare-fun getCurrentListMapNoExtraKeys!5023 (array!76337 array!76339 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) Int) ListLongMap!17109)

(assert (=> b!1181636 (= lt!534508 (getCurrentListMapNoExtraKeys!5023 lt!534523 lt!534517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76339)

(assert (=> b!1181636 (= lt!534514 (getCurrentListMapNoExtraKeys!5023 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!534521 () Unit!39078)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!836 (array!76337 array!76339 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39078)

(assert (=> b!1181636 (= lt!534521 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!836 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181637 () Bool)

(declare-fun e!671803 () Bool)

(declare-fun arrayContainsKey!0 (array!76337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181637 (= e!671803 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181638 () Bool)

(assert (=> b!1181638 (= e!671796 e!671799)))

(declare-fun res!785246 () Bool)

(assert (=> b!1181638 (=> (not res!785246) (not e!671799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76337 (_ BitVec 32)) Bool)

(assert (=> b!1181638 (= res!785246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534523 mask!1564))))

(assert (=> b!1181638 (= lt!534523 (array!76338 (store (arr!36818 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37354 _keys!1208)))))

(declare-fun b!1181639 () Bool)

(declare-fun res!785234 () Bool)

(assert (=> b!1181639 (=> (not res!785234) (not e!671796))))

(assert (=> b!1181639 (= res!785234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!785238 () Bool)

(assert (=> start!99658 (=> (not res!785238) (not e!671796))))

(assert (=> start!99658 (= res!785238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37354 _keys!1208))))))

(assert (=> start!99658 e!671796))

(declare-fun tp_is_empty!29767 () Bool)

(assert (=> start!99658 tp_is_empty!29767))

(declare-fun array_inv!28110 (array!76337) Bool)

(assert (=> start!99658 (array_inv!28110 _keys!1208)))

(assert (=> start!99658 true))

(assert (=> start!99658 tp!88425))

(declare-fun e!671800 () Bool)

(declare-fun array_inv!28111 (array!76339) Bool)

(assert (=> start!99658 (and (array_inv!28111 _values!996) e!671800)))

(declare-fun b!1181640 () Bool)

(declare-fun e!671801 () Bool)

(assert (=> b!1181640 (= e!671801 tp_is_empty!29767)))

(declare-fun b!1181641 () Bool)

(declare-fun e!671802 () Bool)

(assert (=> b!1181641 (= e!671802 e!671803)))

(declare-fun res!785237 () Bool)

(assert (=> b!1181641 (=> res!785237 e!671803)))

(assert (=> b!1181641 (= res!785237 (not (= (select (arr!36818 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181642 () Bool)

(declare-fun res!785242 () Bool)

(assert (=> b!1181642 (=> (not res!785242) (not e!671796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181642 (= res!785242 (validMask!0 mask!1564))))

(declare-fun b!1181643 () Bool)

(declare-fun Unit!39081 () Unit!39078)

(assert (=> b!1181643 (= e!671805 Unit!39081)))

(declare-fun lt!534512 () Unit!39078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39078)

(assert (=> b!1181643 (= lt!534512 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181643 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534510 () Unit!39078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76337 (_ BitVec 32) (_ BitVec 32)) Unit!39078)

(assert (=> b!1181643 (= lt!534510 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181643 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25877)))

(declare-fun lt!534520 () Unit!39078)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76337 (_ BitVec 64) (_ BitVec 32) List!25880) Unit!39078)

(assert (=> b!1181643 (= lt!534520 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25877))))

(assert (=> b!1181643 false))

(declare-fun b!1181644 () Bool)

(declare-fun res!785240 () Bool)

(assert (=> b!1181644 (=> (not res!785240) (not e!671796))))

(assert (=> b!1181644 (= res!785240 (= (select (arr!36818 _keys!1208) i!673) k!934))))

(declare-fun b!1181645 () Bool)

(declare-fun res!785244 () Bool)

(assert (=> b!1181645 (=> (not res!785244) (not e!671796))))

(assert (=> b!1181645 (= res!785244 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37354 _keys!1208))))))

(declare-fun mapIsEmpty!46478 () Bool)

(declare-fun mapRes!46478 () Bool)

(assert (=> mapIsEmpty!46478 mapRes!46478))

(declare-fun b!1181646 () Bool)

(declare-fun e!671798 () Bool)

(assert (=> b!1181646 (= e!671798 e!671797)))

(declare-fun res!785245 () Bool)

(assert (=> b!1181646 (=> res!785245 e!671797)))

(assert (=> b!1181646 (= res!785245 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!534522 () ListLongMap!17109)

(assert (=> b!1181646 (= lt!534522 (getCurrentListMapNoExtraKeys!5023 lt!534523 lt!534517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534507 () V!44817)

(assert (=> b!1181646 (= lt!534517 (array!76340 (store (arr!36819 _values!996) i!673 (ValueCellFull!14174 lt!534507)) (size!37355 _values!996)))))

(declare-fun dynLambda!2978 (Int (_ BitVec 64)) V!44817)

(assert (=> b!1181646 (= lt!534507 (dynLambda!2978 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534511 () ListLongMap!17109)

(assert (=> b!1181646 (= lt!534511 (getCurrentListMapNoExtraKeys!5023 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181647 () Bool)

(declare-fun e!671806 () Bool)

(assert (=> b!1181647 (= e!671806 tp_is_empty!29767)))

(declare-fun b!1181648 () Bool)

(declare-fun res!785236 () Bool)

(assert (=> b!1181648 (=> (not res!785236) (not e!671796))))

(assert (=> b!1181648 (= res!785236 (and (= (size!37355 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37354 _keys!1208) (size!37355 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181649 () Bool)

(assert (=> b!1181649 (= e!671799 (not e!671798))))

(declare-fun res!785243 () Bool)

(assert (=> b!1181649 (=> res!785243 e!671798)))

(assert (=> b!1181649 (= res!785243 (bvsgt from!1455 i!673))))

(assert (=> b!1181649 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534525 () Unit!39078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76337 (_ BitVec 64) (_ BitVec 32)) Unit!39078)

(assert (=> b!1181649 (= lt!534525 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181650 () Bool)

(assert (=> b!1181650 (= e!671800 (and e!671801 mapRes!46478))))

(declare-fun condMapEmpty!46478 () Bool)

(declare-fun mapDefault!46478 () ValueCell!14174)

