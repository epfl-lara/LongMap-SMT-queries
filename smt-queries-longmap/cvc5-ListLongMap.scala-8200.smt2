; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100066 () Bool)

(assert start!100066)

(declare-fun b_free!25645 () Bool)

(declare-fun b_next!25645 () Bool)

(assert (=> start!100066 (= b_free!25645 (not b_next!25645))))

(declare-fun tp!89649 () Bool)

(declare-fun b_and!42157 () Bool)

(assert (=> start!100066 (= tp!89649 b_and!42157)))

(declare-fun mapIsEmpty!47090 () Bool)

(declare-fun mapRes!47090 () Bool)

(assert (=> mapIsEmpty!47090 mapRes!47090))

(declare-fun b!1192831 () Bool)

(declare-fun res!793547 () Bool)

(declare-fun e!677985 () Bool)

(assert (=> b!1192831 (=> (not res!793547) (not e!677985))))

(declare-datatypes ((array!77133 0))(
  ( (array!77134 (arr!37216 (Array (_ BitVec 32) (_ BitVec 64))) (size!37752 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77133)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77133 (_ BitVec 32)) Bool)

(assert (=> b!1192831 (= res!793547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192832 () Bool)

(declare-fun res!793555 () Bool)

(assert (=> b!1192832 (=> (not res!793555) (not e!677985))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192832 (= res!793555 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37752 _keys!1208))))))

(declare-fun b!1192833 () Bool)

(declare-fun res!793554 () Bool)

(assert (=> b!1192833 (=> (not res!793554) (not e!677985))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192833 (= res!793554 (validKeyInArray!0 k!934))))

(declare-fun b!1192834 () Bool)

(declare-fun e!677980 () Bool)

(declare-fun tp_is_empty!30175 () Bool)

(assert (=> b!1192834 (= e!677980 tp_is_empty!30175)))

(declare-fun b!1192835 () Bool)

(declare-fun e!677979 () Bool)

(declare-fun e!677983 () Bool)

(assert (=> b!1192835 (= e!677979 (not e!677983))))

(declare-fun res!793545 () Bool)

(assert (=> b!1192835 (=> res!793545 e!677983)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192835 (= res!793545 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192835 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39572 0))(
  ( (Unit!39573) )
))
(declare-fun lt!542369 () Unit!39572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77133 (_ BitVec 64) (_ BitVec 32)) Unit!39572)

(assert (=> b!1192835 (= lt!542369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192836 () Bool)

(declare-fun res!793551 () Bool)

(assert (=> b!1192836 (=> (not res!793551) (not e!677985))))

(declare-datatypes ((List!26211 0))(
  ( (Nil!26208) (Cons!26207 (h!27416 (_ BitVec 64)) (t!38848 List!26211)) )
))
(declare-fun arrayNoDuplicates!0 (array!77133 (_ BitVec 32) List!26211) Bool)

(assert (=> b!1192836 (= res!793551 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26208))))

(declare-fun b!1192837 () Bool)

(declare-fun res!793548 () Bool)

(assert (=> b!1192837 (=> (not res!793548) (not e!677979))))

(declare-fun lt!542367 () array!77133)

(assert (=> b!1192837 (= res!793548 (arrayNoDuplicates!0 lt!542367 #b00000000000000000000000000000000 Nil!26208))))

(declare-fun b!1192838 () Bool)

(declare-fun res!793544 () Bool)

(assert (=> b!1192838 (=> (not res!793544) (not e!677985))))

(assert (=> b!1192838 (= res!793544 (= (select (arr!37216 _keys!1208) i!673) k!934))))

(declare-fun b!1192839 () Bool)

(declare-fun e!677984 () Bool)

(assert (=> b!1192839 (= e!677983 e!677984)))

(declare-fun res!793552 () Bool)

(assert (=> b!1192839 (=> res!793552 e!677984)))

(assert (=> b!1192839 (= res!793552 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45361 0))(
  ( (V!45362 (val!15144 Int)) )
))
(declare-fun zeroValue!944 () V!45361)

(declare-datatypes ((tuple2!19468 0))(
  ( (tuple2!19469 (_1!9745 (_ BitVec 64)) (_2!9745 V!45361)) )
))
(declare-datatypes ((List!26212 0))(
  ( (Nil!26209) (Cons!26208 (h!27417 tuple2!19468) (t!38849 List!26212)) )
))
(declare-datatypes ((ListLongMap!17437 0))(
  ( (ListLongMap!17438 (toList!8734 List!26212)) )
))
(declare-fun lt!542370 () ListLongMap!17437)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14378 0))(
  ( (ValueCellFull!14378 (v!17782 V!45361)) (EmptyCell!14378) )
))
(declare-datatypes ((array!77135 0))(
  ( (array!77136 (arr!37217 (Array (_ BitVec 32) ValueCell!14378)) (size!37753 (_ BitVec 32))) )
))
(declare-fun lt!542366 () array!77135)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45361)

(declare-fun getCurrentListMapNoExtraKeys!5175 (array!77133 array!77135 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) Int) ListLongMap!17437)

(assert (=> b!1192839 (= lt!542370 (getCurrentListMapNoExtraKeys!5175 lt!542367 lt!542366 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77135)

(declare-fun dynLambda!3106 (Int (_ BitVec 64)) V!45361)

(assert (=> b!1192839 (= lt!542366 (array!77136 (store (arr!37217 _values!996) i!673 (ValueCellFull!14378 (dynLambda!3106 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37753 _values!996)))))

(declare-fun lt!542368 () ListLongMap!17437)

(assert (=> b!1192839 (= lt!542368 (getCurrentListMapNoExtraKeys!5175 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47090 () Bool)

(declare-fun tp!89648 () Bool)

(assert (=> mapNonEmpty!47090 (= mapRes!47090 (and tp!89648 e!677980))))

(declare-fun mapValue!47090 () ValueCell!14378)

(declare-fun mapRest!47090 () (Array (_ BitVec 32) ValueCell!14378))

(declare-fun mapKey!47090 () (_ BitVec 32))

(assert (=> mapNonEmpty!47090 (= (arr!37217 _values!996) (store mapRest!47090 mapKey!47090 mapValue!47090))))

(declare-fun b!1192840 () Bool)

(assert (=> b!1192840 (= e!677985 e!677979)))

(declare-fun res!793550 () Bool)

(assert (=> b!1192840 (=> (not res!793550) (not e!677979))))

(assert (=> b!1192840 (= res!793550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542367 mask!1564))))

(assert (=> b!1192840 (= lt!542367 (array!77134 (store (arr!37216 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37752 _keys!1208)))))

(declare-fun res!793546 () Bool)

(assert (=> start!100066 (=> (not res!793546) (not e!677985))))

(assert (=> start!100066 (= res!793546 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37752 _keys!1208))))))

(assert (=> start!100066 e!677985))

(assert (=> start!100066 tp_is_empty!30175))

(declare-fun array_inv!28376 (array!77133) Bool)

(assert (=> start!100066 (array_inv!28376 _keys!1208)))

(assert (=> start!100066 true))

(assert (=> start!100066 tp!89649))

(declare-fun e!677981 () Bool)

(declare-fun array_inv!28377 (array!77135) Bool)

(assert (=> start!100066 (and (array_inv!28377 _values!996) e!677981)))

(declare-fun b!1192841 () Bool)

(declare-fun res!793553 () Bool)

(assert (=> b!1192841 (=> (not res!793553) (not e!677985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192841 (= res!793553 (validMask!0 mask!1564))))

(declare-fun b!1192842 () Bool)

(declare-fun res!793549 () Bool)

(assert (=> b!1192842 (=> (not res!793549) (not e!677985))))

(assert (=> b!1192842 (= res!793549 (and (= (size!37753 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37752 _keys!1208) (size!37753 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192843 () Bool)

(assert (=> b!1192843 (= e!677984 true)))

(declare-fun -!1759 (ListLongMap!17437 (_ BitVec 64)) ListLongMap!17437)

(assert (=> b!1192843 (= (getCurrentListMapNoExtraKeys!5175 lt!542367 lt!542366 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1759 (getCurrentListMapNoExtraKeys!5175 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!542365 () Unit!39572)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!968 (array!77133 array!77135 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39572)

(assert (=> b!1192843 (= lt!542365 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!968 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192844 () Bool)

(declare-fun e!677982 () Bool)

(assert (=> b!1192844 (= e!677982 tp_is_empty!30175)))

(declare-fun b!1192845 () Bool)

(assert (=> b!1192845 (= e!677981 (and e!677982 mapRes!47090))))

(declare-fun condMapEmpty!47090 () Bool)

(declare-fun mapDefault!47090 () ValueCell!14378)

