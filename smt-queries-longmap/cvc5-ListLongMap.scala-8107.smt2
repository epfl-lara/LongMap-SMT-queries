; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99508 () Bool)

(assert start!99508)

(declare-fun b_free!25087 () Bool)

(declare-fun b_next!25087 () Bool)

(assert (=> start!99508 (= b_free!25087 (not b_next!25087))))

(declare-fun tp!87975 () Bool)

(declare-fun b_and!41041 () Bool)

(assert (=> start!99508 (= tp!87975 b_and!41041)))

(declare-fun b!1176670 () Bool)

(declare-fun e!668879 () Bool)

(assert (=> b!1176670 (= e!668879 true)))

(declare-fun e!668874 () Bool)

(assert (=> b!1176670 e!668874))

(declare-fun res!781547 () Bool)

(assert (=> b!1176670 (=> (not res!781547) (not e!668874))))

(declare-datatypes ((array!76041 0))(
  ( (array!76042 (arr!36670 (Array (_ BitVec 32) (_ BitVec 64))) (size!37206 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76041)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176670 (= res!781547 (not (= (select (arr!36670 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38846 0))(
  ( (Unit!38847) )
))
(declare-fun lt!531125 () Unit!38846)

(declare-fun e!668880 () Unit!38846)

(assert (=> b!1176670 (= lt!531125 e!668880)))

(declare-fun c!116754 () Bool)

(assert (=> b!1176670 (= c!116754 (= (select (arr!36670 _keys!1208) from!1455) k!934))))

(declare-fun e!668882 () Bool)

(assert (=> b!1176670 e!668882))

(declare-fun res!781561 () Bool)

(assert (=> b!1176670 (=> (not res!781561) (not e!668882))))

(declare-datatypes ((V!44617 0))(
  ( (V!44618 (val!14865 Int)) )
))
(declare-datatypes ((tuple2!19010 0))(
  ( (tuple2!19011 (_1!9516 (_ BitVec 64)) (_2!9516 V!44617)) )
))
(declare-datatypes ((List!25748 0))(
  ( (Nil!25745) (Cons!25744 (h!26953 tuple2!19010) (t!37827 List!25748)) )
))
(declare-datatypes ((ListLongMap!16979 0))(
  ( (ListLongMap!16980 (toList!8505 List!25748)) )
))
(declare-fun lt!531131 () ListLongMap!16979)

(declare-fun lt!531138 () tuple2!19010)

(declare-fun lt!531127 () ListLongMap!16979)

(declare-fun +!3821 (ListLongMap!16979 tuple2!19010) ListLongMap!16979)

(assert (=> b!1176670 (= res!781561 (= lt!531131 (+!3821 lt!531127 lt!531138)))))

(declare-fun lt!531136 () V!44617)

(declare-datatypes ((ValueCell!14099 0))(
  ( (ValueCellFull!14099 (v!17503 V!44617)) (EmptyCell!14099) )
))
(declare-datatypes ((array!76043 0))(
  ( (array!76044 (arr!36671 (Array (_ BitVec 32) ValueCell!14099)) (size!37207 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76043)

(declare-fun get!18731 (ValueCell!14099 V!44617) V!44617)

(assert (=> b!1176670 (= lt!531138 (tuple2!19011 (select (arr!36670 _keys!1208) from!1455) (get!18731 (select (arr!36671 _values!996) from!1455) lt!531136)))))

(declare-fun b!1176671 () Bool)

(declare-fun res!781554 () Bool)

(declare-fun e!668873 () Bool)

(assert (=> b!1176671 (=> (not res!781554) (not e!668873))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176671 (= res!781554 (= (select (arr!36670 _keys!1208) i!673) k!934))))

(declare-fun b!1176673 () Bool)

(declare-fun e!668878 () Bool)

(declare-fun tp_is_empty!29617 () Bool)

(assert (=> b!1176673 (= e!668878 tp_is_empty!29617)))

(declare-fun b!1176674 () Bool)

(declare-fun e!668883 () Bool)

(assert (=> b!1176674 (= e!668882 e!668883)))

(declare-fun res!781555 () Bool)

(assert (=> b!1176674 (=> res!781555 e!668883)))

(assert (=> b!1176674 (= res!781555 (not (= (select (arr!36670 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176675 () Bool)

(declare-fun arrayContainsKey!0 (array!76041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176675 (= e!668883 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176676 () Bool)

(declare-fun lt!531132 () ListLongMap!16979)

(declare-fun lt!531124 () ListLongMap!16979)

(assert (=> b!1176676 (= e!668874 (= lt!531132 (+!3821 lt!531124 lt!531138)))))

(declare-fun b!1176677 () Bool)

(declare-fun e!668876 () Bool)

(assert (=> b!1176677 (= e!668873 e!668876)))

(declare-fun res!781546 () Bool)

(assert (=> b!1176677 (=> (not res!781546) (not e!668876))))

(declare-fun lt!531126 () array!76041)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76041 (_ BitVec 32)) Bool)

(assert (=> b!1176677 (= res!781546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531126 mask!1564))))

(assert (=> b!1176677 (= lt!531126 (array!76042 (store (arr!36670 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37206 _keys!1208)))))

(declare-fun b!1176678 () Bool)

(declare-fun res!781553 () Bool)

(assert (=> b!1176678 (=> (not res!781553) (not e!668873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176678 (= res!781553 (validMask!0 mask!1564))))

(declare-fun b!1176679 () Bool)

(declare-fun res!781551 () Bool)

(assert (=> b!1176679 (=> (not res!781551) (not e!668873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176679 (= res!781551 (validKeyInArray!0 k!934))))

(declare-fun b!1176680 () Bool)

(declare-fun e!668877 () Bool)

(assert (=> b!1176680 (= e!668877 e!668879)))

(declare-fun res!781558 () Bool)

(assert (=> b!1176680 (=> res!781558 e!668879)))

(assert (=> b!1176680 (= res!781558 (not (validKeyInArray!0 (select (arr!36670 _keys!1208) from!1455))))))

(declare-fun lt!531130 () ListLongMap!16979)

(assert (=> b!1176680 (= lt!531130 lt!531127)))

(declare-fun -!1557 (ListLongMap!16979 (_ BitVec 64)) ListLongMap!16979)

(assert (=> b!1176680 (= lt!531127 (-!1557 lt!531124 k!934))))

(declare-fun zeroValue!944 () V!44617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44617)

(declare-fun lt!531128 () array!76043)

(declare-fun getCurrentListMapNoExtraKeys!4964 (array!76041 array!76043 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) Int) ListLongMap!16979)

(assert (=> b!1176680 (= lt!531130 (getCurrentListMapNoExtraKeys!4964 lt!531126 lt!531128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176680 (= lt!531124 (getCurrentListMapNoExtraKeys!4964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531129 () Unit!38846)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!784 (array!76041 array!76043 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38846)

(assert (=> b!1176680 (= lt!531129 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176681 () Bool)

(declare-fun Unit!38848 () Unit!38846)

(assert (=> b!1176681 (= e!668880 Unit!38848)))

(declare-fun lt!531137 () Unit!38846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38846)

(assert (=> b!1176681 (= lt!531137 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176681 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531135 () Unit!38846)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76041 (_ BitVec 32) (_ BitVec 32)) Unit!38846)

(assert (=> b!1176681 (= lt!531135 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25749 0))(
  ( (Nil!25746) (Cons!25745 (h!26954 (_ BitVec 64)) (t!37828 List!25749)) )
))
(declare-fun arrayNoDuplicates!0 (array!76041 (_ BitVec 32) List!25749) Bool)

(assert (=> b!1176681 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25746)))

(declare-fun lt!531134 () Unit!38846)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76041 (_ BitVec 64) (_ BitVec 32) List!25749) Unit!38846)

(assert (=> b!1176681 (= lt!531134 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25746))))

(assert (=> b!1176681 false))

(declare-fun b!1176682 () Bool)

(declare-fun res!781560 () Bool)

(assert (=> b!1176682 (=> (not res!781560) (not e!668873))))

(assert (=> b!1176682 (= res!781560 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37206 _keys!1208))))))

(declare-fun b!1176683 () Bool)

(declare-fun e!668881 () Bool)

(assert (=> b!1176683 (= e!668881 e!668877)))

(declare-fun res!781556 () Bool)

(assert (=> b!1176683 (=> res!781556 e!668877)))

(assert (=> b!1176683 (= res!781556 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176683 (= lt!531131 (getCurrentListMapNoExtraKeys!4964 lt!531126 lt!531128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176683 (= lt!531128 (array!76044 (store (arr!36671 _values!996) i!673 (ValueCellFull!14099 lt!531136)) (size!37207 _values!996)))))

(declare-fun dynLambda!2929 (Int (_ BitVec 64)) V!44617)

(assert (=> b!1176683 (= lt!531136 (dynLambda!2929 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1176683 (= lt!531132 (getCurrentListMapNoExtraKeys!4964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176684 () Bool)

(declare-fun res!781557 () Bool)

(assert (=> b!1176684 (=> (not res!781557) (not e!668873))))

(assert (=> b!1176684 (= res!781557 (and (= (size!37207 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37206 _keys!1208) (size!37207 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176672 () Bool)

(assert (=> b!1176672 (= e!668876 (not e!668881))))

(declare-fun res!781550 () Bool)

(assert (=> b!1176672 (=> res!781550 e!668881)))

(assert (=> b!1176672 (= res!781550 (bvsgt from!1455 i!673))))

(assert (=> b!1176672 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531133 () Unit!38846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76041 (_ BitVec 64) (_ BitVec 32)) Unit!38846)

(assert (=> b!1176672 (= lt!531133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!781552 () Bool)

(assert (=> start!99508 (=> (not res!781552) (not e!668873))))

(assert (=> start!99508 (= res!781552 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37206 _keys!1208))))))

(assert (=> start!99508 e!668873))

(assert (=> start!99508 tp_is_empty!29617))

(declare-fun array_inv!28004 (array!76041) Bool)

(assert (=> start!99508 (array_inv!28004 _keys!1208)))

(assert (=> start!99508 true))

(assert (=> start!99508 tp!87975))

(declare-fun e!668875 () Bool)

(declare-fun array_inv!28005 (array!76043) Bool)

(assert (=> start!99508 (and (array_inv!28005 _values!996) e!668875)))

(declare-fun b!1176685 () Bool)

(declare-fun res!781559 () Bool)

(assert (=> b!1176685 (=> (not res!781559) (not e!668873))))

(assert (=> b!1176685 (= res!781559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176686 () Bool)

(declare-fun e!668884 () Bool)

(assert (=> b!1176686 (= e!668884 tp_is_empty!29617)))

(declare-fun b!1176687 () Bool)

(declare-fun Unit!38849 () Unit!38846)

(assert (=> b!1176687 (= e!668880 Unit!38849)))

(declare-fun b!1176688 () Bool)

(declare-fun res!781548 () Bool)

(assert (=> b!1176688 (=> (not res!781548) (not e!668873))))

(assert (=> b!1176688 (= res!781548 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25746))))

(declare-fun mapNonEmpty!46253 () Bool)

(declare-fun mapRes!46253 () Bool)

(declare-fun tp!87974 () Bool)

(assert (=> mapNonEmpty!46253 (= mapRes!46253 (and tp!87974 e!668878))))

(declare-fun mapRest!46253 () (Array (_ BitVec 32) ValueCell!14099))

(declare-fun mapKey!46253 () (_ BitVec 32))

(declare-fun mapValue!46253 () ValueCell!14099)

(assert (=> mapNonEmpty!46253 (= (arr!36671 _values!996) (store mapRest!46253 mapKey!46253 mapValue!46253))))

(declare-fun b!1176689 () Bool)

(declare-fun res!781549 () Bool)

(assert (=> b!1176689 (=> (not res!781549) (not e!668876))))

(assert (=> b!1176689 (= res!781549 (arrayNoDuplicates!0 lt!531126 #b00000000000000000000000000000000 Nil!25746))))

(declare-fun mapIsEmpty!46253 () Bool)

(assert (=> mapIsEmpty!46253 mapRes!46253))

(declare-fun b!1176690 () Bool)

(assert (=> b!1176690 (= e!668875 (and e!668884 mapRes!46253))))

(declare-fun condMapEmpty!46253 () Bool)

(declare-fun mapDefault!46253 () ValueCell!14099)

