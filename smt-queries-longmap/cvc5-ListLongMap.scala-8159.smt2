; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99820 () Bool)

(assert start!99820)

(declare-fun b_free!25399 () Bool)

(declare-fun b_next!25399 () Bool)

(assert (=> start!99820 (= b_free!25399 (not b_next!25399))))

(declare-fun tp!88911 () Bool)

(declare-fun b_and!41665 () Bool)

(assert (=> start!99820 (= tp!88911 b_and!41665)))

(declare-fun b!1186655 () Bool)

(declare-fun e!674713 () Bool)

(declare-fun tp_is_empty!29929 () Bool)

(assert (=> b!1186655 (= e!674713 tp_is_empty!29929)))

(declare-fun res!788880 () Bool)

(declare-fun e!674715 () Bool)

(assert (=> start!99820 (=> (not res!788880) (not e!674715))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76653 0))(
  ( (array!76654 (arr!36976 (Array (_ BitVec 32) (_ BitVec 64))) (size!37512 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76653)

(assert (=> start!99820 (= res!788880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37512 _keys!1208))))))

(assert (=> start!99820 e!674715))

(assert (=> start!99820 tp_is_empty!29929))

(declare-fun array_inv!28216 (array!76653) Bool)

(assert (=> start!99820 (array_inv!28216 _keys!1208)))

(assert (=> start!99820 true))

(assert (=> start!99820 tp!88911))

(declare-datatypes ((V!45033 0))(
  ( (V!45034 (val!15021 Int)) )
))
(declare-datatypes ((ValueCell!14255 0))(
  ( (ValueCellFull!14255 (v!17659 V!45033)) (EmptyCell!14255) )
))
(declare-datatypes ((array!76655 0))(
  ( (array!76656 (arr!36977 (Array (_ BitVec 32) ValueCell!14255)) (size!37513 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76655)

(declare-fun e!674712 () Bool)

(declare-fun array_inv!28217 (array!76655) Bool)

(assert (=> start!99820 (and (array_inv!28217 _values!996) e!674712)))

(declare-fun mapNonEmpty!46721 () Bool)

(declare-fun mapRes!46721 () Bool)

(declare-fun tp!88910 () Bool)

(declare-fun e!674716 () Bool)

(assert (=> mapNonEmpty!46721 (= mapRes!46721 (and tp!88910 e!674716))))

(declare-fun mapValue!46721 () ValueCell!14255)

(declare-fun mapRest!46721 () (Array (_ BitVec 32) ValueCell!14255))

(declare-fun mapKey!46721 () (_ BitVec 32))

(assert (=> mapNonEmpty!46721 (= (arr!36977 _values!996) (store mapRest!46721 mapKey!46721 mapValue!46721))))

(declare-fun b!1186656 () Bool)

(declare-datatypes ((Unit!39335 0))(
  ( (Unit!39336) )
))
(declare-fun e!674720 () Unit!39335)

(declare-fun Unit!39337 () Unit!39335)

(assert (=> b!1186656 (= e!674720 Unit!39337)))

(declare-fun lt!539137 () Unit!39335)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39335)

(assert (=> b!1186656 (= lt!539137 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186656 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539136 () Unit!39335)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76653 (_ BitVec 32) (_ BitVec 32)) Unit!39335)

(assert (=> b!1186656 (= lt!539136 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26016 0))(
  ( (Nil!26013) (Cons!26012 (h!27221 (_ BitVec 64)) (t!38407 List!26016)) )
))
(declare-fun arrayNoDuplicates!0 (array!76653 (_ BitVec 32) List!26016) Bool)

(assert (=> b!1186656 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26013)))

(declare-fun lt!539131 () Unit!39335)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76653 (_ BitVec 64) (_ BitVec 32) List!26016) Unit!39335)

(assert (=> b!1186656 (= lt!539131 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26013))))

(assert (=> b!1186656 false))

(declare-fun b!1186657 () Bool)

(declare-fun Unit!39338 () Unit!39335)

(assert (=> b!1186657 (= e!674720 Unit!39338)))

(declare-fun b!1186658 () Bool)

(declare-fun e!674717 () Bool)

(declare-fun e!674721 () Bool)

(assert (=> b!1186658 (= e!674717 e!674721)))

(declare-fun res!788887 () Bool)

(assert (=> b!1186658 (=> res!788887 e!674721)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186658 (= res!788887 (not (validKeyInArray!0 (select (arr!36976 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19276 0))(
  ( (tuple2!19277 (_1!9649 (_ BitVec 64)) (_2!9649 V!45033)) )
))
(declare-datatypes ((List!26017 0))(
  ( (Nil!26014) (Cons!26013 (h!27222 tuple2!19276) (t!38408 List!26017)) )
))
(declare-datatypes ((ListLongMap!17245 0))(
  ( (ListLongMap!17246 (toList!8638 List!26017)) )
))
(declare-fun lt!539138 () ListLongMap!17245)

(declare-fun lt!539139 () ListLongMap!17245)

(assert (=> b!1186658 (= lt!539138 lt!539139)))

(declare-fun lt!539126 () ListLongMap!17245)

(declare-fun -!1670 (ListLongMap!17245 (_ BitVec 64)) ListLongMap!17245)

(assert (=> b!1186658 (= lt!539139 (-!1670 lt!539126 k!934))))

(declare-fun zeroValue!944 () V!45033)

(declare-fun lt!539127 () array!76653)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45033)

(declare-fun lt!539130 () array!76655)

(declare-fun getCurrentListMapNoExtraKeys!5081 (array!76653 array!76655 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) Int) ListLongMap!17245)

(assert (=> b!1186658 (= lt!539138 (getCurrentListMapNoExtraKeys!5081 lt!539127 lt!539130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186658 (= lt!539126 (getCurrentListMapNoExtraKeys!5081 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539129 () Unit!39335)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!883 (array!76653 array!76655 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39335)

(assert (=> b!1186658 (= lt!539129 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!883 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186659 () Bool)

(declare-fun res!788889 () Bool)

(assert (=> b!1186659 (=> (not res!788889) (not e!674715))))

(assert (=> b!1186659 (= res!788889 (validKeyInArray!0 k!934))))

(declare-fun b!1186660 () Bool)

(declare-fun e!674714 () Bool)

(declare-fun e!674718 () Bool)

(assert (=> b!1186660 (= e!674714 (not e!674718))))

(declare-fun res!788892 () Bool)

(assert (=> b!1186660 (=> res!788892 e!674718)))

(assert (=> b!1186660 (= res!788892 (bvsgt from!1455 i!673))))

(assert (=> b!1186660 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!539124 () Unit!39335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76653 (_ BitVec 64) (_ BitVec 32)) Unit!39335)

(assert (=> b!1186660 (= lt!539124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186661 () Bool)

(assert (=> b!1186661 (= e!674715 e!674714)))

(declare-fun res!788882 () Bool)

(assert (=> b!1186661 (=> (not res!788882) (not e!674714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76653 (_ BitVec 32)) Bool)

(assert (=> b!1186661 (= res!788882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539127 mask!1564))))

(assert (=> b!1186661 (= lt!539127 (array!76654 (store (arr!36976 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37512 _keys!1208)))))

(declare-fun b!1186662 () Bool)

(declare-fun res!788886 () Bool)

(assert (=> b!1186662 (=> (not res!788886) (not e!674714))))

(assert (=> b!1186662 (= res!788886 (arrayNoDuplicates!0 lt!539127 #b00000000000000000000000000000000 Nil!26013))))

(declare-fun b!1186663 () Bool)

(declare-fun res!788888 () Bool)

(assert (=> b!1186663 (=> (not res!788888) (not e!674715))))

(assert (=> b!1186663 (= res!788888 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37512 _keys!1208))))))

(declare-fun b!1186664 () Bool)

(assert (=> b!1186664 (= e!674718 e!674717)))

(declare-fun res!788890 () Bool)

(assert (=> b!1186664 (=> res!788890 e!674717)))

(assert (=> b!1186664 (= res!788890 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!539128 () ListLongMap!17245)

(assert (=> b!1186664 (= lt!539128 (getCurrentListMapNoExtraKeys!5081 lt!539127 lt!539130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539140 () V!45033)

(assert (=> b!1186664 (= lt!539130 (array!76656 (store (arr!36977 _values!996) i!673 (ValueCellFull!14255 lt!539140)) (size!37513 _values!996)))))

(declare-fun dynLambda!3030 (Int (_ BitVec 64)) V!45033)

(assert (=> b!1186664 (= lt!539140 (dynLambda!3030 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539141 () ListLongMap!17245)

(assert (=> b!1186664 (= lt!539141 (getCurrentListMapNoExtraKeys!5081 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186665 () Bool)

(declare-fun res!788893 () Bool)

(assert (=> b!1186665 (=> (not res!788893) (not e!674715))))

(assert (=> b!1186665 (= res!788893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186666 () Bool)

(assert (=> b!1186666 (= e!674712 (and e!674713 mapRes!46721))))

(declare-fun condMapEmpty!46721 () Bool)

(declare-fun mapDefault!46721 () ValueCell!14255)

