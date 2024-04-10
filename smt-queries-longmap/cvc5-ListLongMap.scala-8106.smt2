; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99502 () Bool)

(assert start!99502)

(declare-fun b_free!25081 () Bool)

(declare-fun b_next!25081 () Bool)

(assert (=> start!99502 (= b_free!25081 (not b_next!25081))))

(declare-fun tp!87956 () Bool)

(declare-fun b_and!41029 () Bool)

(assert (=> start!99502 (= tp!87956 b_and!41029)))

(declare-fun b!1176475 () Bool)

(declare-fun e!668763 () Bool)

(assert (=> b!1176475 (= e!668763 true)))

(declare-fun e!668760 () Bool)

(assert (=> b!1176475 e!668760))

(declare-fun res!781413 () Bool)

(assert (=> b!1176475 (=> (not res!781413) (not e!668760))))

(declare-datatypes ((array!76029 0))(
  ( (array!76030 (arr!36664 (Array (_ BitVec 32) (_ BitVec 64))) (size!37200 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76029)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176475 (= res!781413 (not (= (select (arr!36664 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38835 0))(
  ( (Unit!38836) )
))
(declare-fun lt!530989 () Unit!38835)

(declare-fun e!668758 () Unit!38835)

(assert (=> b!1176475 (= lt!530989 e!668758)))

(declare-fun c!116745 () Bool)

(assert (=> b!1176475 (= c!116745 (= (select (arr!36664 _keys!1208) from!1455) k!934))))

(declare-fun e!668767 () Bool)

(assert (=> b!1176475 e!668767))

(declare-fun res!781407 () Bool)

(assert (=> b!1176475 (=> (not res!781407) (not e!668767))))

(declare-datatypes ((V!44609 0))(
  ( (V!44610 (val!14862 Int)) )
))
(declare-datatypes ((tuple2!19004 0))(
  ( (tuple2!19005 (_1!9513 (_ BitVec 64)) (_2!9513 V!44609)) )
))
(declare-datatypes ((List!25742 0))(
  ( (Nil!25739) (Cons!25738 (h!26947 tuple2!19004) (t!37815 List!25742)) )
))
(declare-datatypes ((ListLongMap!16973 0))(
  ( (ListLongMap!16974 (toList!8502 List!25742)) )
))
(declare-fun lt!530997 () ListLongMap!16973)

(declare-fun lt!530991 () ListLongMap!16973)

(declare-fun lt!530994 () tuple2!19004)

(declare-fun +!3818 (ListLongMap!16973 tuple2!19004) ListLongMap!16973)

(assert (=> b!1176475 (= res!781407 (= lt!530991 (+!3818 lt!530997 lt!530994)))))

(declare-fun lt!530993 () V!44609)

(declare-datatypes ((ValueCell!14096 0))(
  ( (ValueCellFull!14096 (v!17500 V!44609)) (EmptyCell!14096) )
))
(declare-datatypes ((array!76031 0))(
  ( (array!76032 (arr!36665 (Array (_ BitVec 32) ValueCell!14096)) (size!37201 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76031)

(declare-fun get!18726 (ValueCell!14096 V!44609) V!44609)

(assert (=> b!1176475 (= lt!530994 (tuple2!19005 (select (arr!36664 _keys!1208) from!1455) (get!18726 (select (arr!36665 _values!996) from!1455) lt!530993)))))

(declare-fun b!1176476 () Bool)

(declare-fun res!781402 () Bool)

(declare-fun e!668757 () Bool)

(assert (=> b!1176476 (=> (not res!781402) (not e!668757))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176476 (= res!781402 (validMask!0 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!668762 () Bool)

(declare-fun b!1176477 () Bool)

(declare-fun arrayContainsKey!0 (array!76029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176477 (= e!668762 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46244 () Bool)

(declare-fun mapRes!46244 () Bool)

(assert (=> mapIsEmpty!46244 mapRes!46244))

(declare-fun b!1176478 () Bool)

(declare-fun e!668756 () Bool)

(assert (=> b!1176478 (= e!668757 e!668756)))

(declare-fun res!781408 () Bool)

(assert (=> b!1176478 (=> (not res!781408) (not e!668756))))

(declare-fun lt!531003 () array!76029)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76029 (_ BitVec 32)) Bool)

(assert (=> b!1176478 (= res!781408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531003 mask!1564))))

(assert (=> b!1176478 (= lt!531003 (array!76030 (store (arr!36664 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37200 _keys!1208)))))

(declare-fun b!1176479 () Bool)

(declare-fun e!668766 () Bool)

(assert (=> b!1176479 (= e!668756 (not e!668766))))

(declare-fun res!781409 () Bool)

(assert (=> b!1176479 (=> res!781409 e!668766)))

(assert (=> b!1176479 (= res!781409 (bvsgt from!1455 i!673))))

(assert (=> b!1176479 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!530999 () Unit!38835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76029 (_ BitVec 64) (_ BitVec 32)) Unit!38835)

(assert (=> b!1176479 (= lt!530999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176480 () Bool)

(declare-fun res!781417 () Bool)

(assert (=> b!1176480 (=> (not res!781417) (not e!668757))))

(assert (=> b!1176480 (= res!781417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176481 () Bool)

(declare-fun e!668755 () Bool)

(declare-fun tp_is_empty!29611 () Bool)

(assert (=> b!1176481 (= e!668755 tp_is_empty!29611)))

(declare-fun b!1176482 () Bool)

(declare-fun e!668759 () Bool)

(assert (=> b!1176482 (= e!668759 tp_is_empty!29611)))

(declare-fun b!1176483 () Bool)

(declare-fun res!781414 () Bool)

(assert (=> b!1176483 (=> (not res!781414) (not e!668757))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1176483 (= res!781414 (and (= (size!37201 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37200 _keys!1208) (size!37201 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!781405 () Bool)

(assert (=> start!99502 (=> (not res!781405) (not e!668757))))

(assert (=> start!99502 (= res!781405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37200 _keys!1208))))))

(assert (=> start!99502 e!668757))

(assert (=> start!99502 tp_is_empty!29611))

(declare-fun array_inv!28000 (array!76029) Bool)

(assert (=> start!99502 (array_inv!28000 _keys!1208)))

(assert (=> start!99502 true))

(assert (=> start!99502 tp!87956))

(declare-fun e!668761 () Bool)

(declare-fun array_inv!28001 (array!76031) Bool)

(assert (=> start!99502 (and (array_inv!28001 _values!996) e!668761)))

(declare-fun b!1176484 () Bool)

(assert (=> b!1176484 (= e!668767 e!668762)))

(declare-fun res!781411 () Bool)

(assert (=> b!1176484 (=> res!781411 e!668762)))

(assert (=> b!1176484 (= res!781411 (not (= (select (arr!36664 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176485 () Bool)

(declare-fun res!781412 () Bool)

(assert (=> b!1176485 (=> (not res!781412) (not e!668757))))

(declare-datatypes ((List!25743 0))(
  ( (Nil!25740) (Cons!25739 (h!26948 (_ BitVec 64)) (t!37816 List!25743)) )
))
(declare-fun arrayNoDuplicates!0 (array!76029 (_ BitVec 32) List!25743) Bool)

(assert (=> b!1176485 (= res!781412 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25740))))

(declare-fun b!1176486 () Bool)

(declare-fun res!781404 () Bool)

(assert (=> b!1176486 (=> (not res!781404) (not e!668757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176486 (= res!781404 (validKeyInArray!0 k!934))))

(declare-fun b!1176487 () Bool)

(declare-fun res!781416 () Bool)

(assert (=> b!1176487 (=> (not res!781416) (not e!668756))))

(assert (=> b!1176487 (= res!781416 (arrayNoDuplicates!0 lt!531003 #b00000000000000000000000000000000 Nil!25740))))

(declare-fun mapNonEmpty!46244 () Bool)

(declare-fun tp!87957 () Bool)

(assert (=> mapNonEmpty!46244 (= mapRes!46244 (and tp!87957 e!668755))))

(declare-fun mapRest!46244 () (Array (_ BitVec 32) ValueCell!14096))

(declare-fun mapValue!46244 () ValueCell!14096)

(declare-fun mapKey!46244 () (_ BitVec 32))

(assert (=> mapNonEmpty!46244 (= (arr!36665 _values!996) (store mapRest!46244 mapKey!46244 mapValue!46244))))

(declare-fun b!1176488 () Bool)

(declare-fun Unit!38837 () Unit!38835)

(assert (=> b!1176488 (= e!668758 Unit!38837)))

(declare-fun lt!530990 () Unit!38835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76029 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38835)

(assert (=> b!1176488 (= lt!530990 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176488 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530992 () Unit!38835)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76029 (_ BitVec 32) (_ BitVec 32)) Unit!38835)

(assert (=> b!1176488 (= lt!530992 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176488 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25740)))

(declare-fun lt!531001 () Unit!38835)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76029 (_ BitVec 64) (_ BitVec 32) List!25743) Unit!38835)

(assert (=> b!1176488 (= lt!531001 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25740))))

(assert (=> b!1176488 false))

(declare-fun b!1176489 () Bool)

(declare-fun e!668765 () Bool)

(assert (=> b!1176489 (= e!668766 e!668765)))

(declare-fun res!781410 () Bool)

(assert (=> b!1176489 (=> res!781410 e!668765)))

(assert (=> b!1176489 (= res!781410 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44609)

(declare-fun lt!530996 () array!76031)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44609)

(declare-fun getCurrentListMapNoExtraKeys!4961 (array!76029 array!76031 (_ BitVec 32) (_ BitVec 32) V!44609 V!44609 (_ BitVec 32) Int) ListLongMap!16973)

(assert (=> b!1176489 (= lt!530991 (getCurrentListMapNoExtraKeys!4961 lt!531003 lt!530996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176489 (= lt!530996 (array!76032 (store (arr!36665 _values!996) i!673 (ValueCellFull!14096 lt!530993)) (size!37201 _values!996)))))

(declare-fun dynLambda!2926 (Int (_ BitVec 64)) V!44609)

(assert (=> b!1176489 (= lt!530993 (dynLambda!2926 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530995 () ListLongMap!16973)

(assert (=> b!1176489 (= lt!530995 (getCurrentListMapNoExtraKeys!4961 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176490 () Bool)

(declare-fun Unit!38838 () Unit!38835)

(assert (=> b!1176490 (= e!668758 Unit!38838)))

(declare-fun b!1176491 () Bool)

(assert (=> b!1176491 (= e!668761 (and e!668759 mapRes!46244))))

(declare-fun condMapEmpty!46244 () Bool)

(declare-fun mapDefault!46244 () ValueCell!14096)

