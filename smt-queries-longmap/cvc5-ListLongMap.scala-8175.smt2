; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99916 () Bool)

(assert start!99916)

(declare-fun b_free!25495 () Bool)

(declare-fun b_next!25495 () Bool)

(assert (=> start!99916 (= b_free!25495 (not b_next!25495))))

(declare-fun tp!89199 () Bool)

(declare-fun b_and!41857 () Bool)

(assert (=> start!99916 (= tp!89199 b_and!41857)))

(declare-fun b!1189306 () Bool)

(declare-fun res!790855 () Bool)

(declare-fun e!676183 () Bool)

(assert (=> b!1189306 (=> (not res!790855) (not e!676183))))

(declare-datatypes ((array!76845 0))(
  ( (array!76846 (arr!37072 (Array (_ BitVec 32) (_ BitVec 64))) (size!37608 (_ BitVec 32))) )
))
(declare-fun lt!541018 () array!76845)

(declare-datatypes ((List!26098 0))(
  ( (Nil!26095) (Cons!26094 (h!27303 (_ BitVec 64)) (t!38585 List!26098)) )
))
(declare-fun arrayNoDuplicates!0 (array!76845 (_ BitVec 32) List!26098) Bool)

(assert (=> b!1189306 (= res!790855 (arrayNoDuplicates!0 lt!541018 #b00000000000000000000000000000000 Nil!26095))))

(declare-fun res!790854 () Bool)

(declare-fun e!676185 () Bool)

(assert (=> start!99916 (=> (not res!790854) (not e!676185))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76845)

(assert (=> start!99916 (= res!790854 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37608 _keys!1208))))))

(assert (=> start!99916 e!676185))

(declare-fun tp_is_empty!30025 () Bool)

(assert (=> start!99916 tp_is_empty!30025))

(declare-fun array_inv!28276 (array!76845) Bool)

(assert (=> start!99916 (array_inv!28276 _keys!1208)))

(assert (=> start!99916 true))

(assert (=> start!99916 tp!89199))

(declare-datatypes ((V!45161 0))(
  ( (V!45162 (val!15069 Int)) )
))
(declare-datatypes ((ValueCell!14303 0))(
  ( (ValueCellFull!14303 (v!17707 V!45161)) (EmptyCell!14303) )
))
(declare-datatypes ((array!76847 0))(
  ( (array!76848 (arr!37073 (Array (_ BitVec 32) ValueCell!14303)) (size!37609 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76847)

(declare-fun e!676179 () Bool)

(declare-fun array_inv!28277 (array!76847) Bool)

(assert (=> start!99916 (and (array_inv!28277 _values!996) e!676179)))

(declare-fun b!1189307 () Bool)

(declare-fun res!790847 () Bool)

(assert (=> b!1189307 (=> (not res!790847) (not e!676185))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1189307 (= res!790847 (= (select (arr!37072 _keys!1208) i!673) k!934))))

(declare-fun b!1189308 () Bool)

(declare-fun res!790852 () Bool)

(assert (=> b!1189308 (=> (not res!790852) (not e!676185))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76845 (_ BitVec 32)) Bool)

(assert (=> b!1189308 (= res!790852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189309 () Bool)

(declare-fun e!676184 () Bool)

(assert (=> b!1189309 (= e!676184 tp_is_empty!30025)))

(declare-fun b!1189310 () Bool)

(declare-fun res!790848 () Bool)

(assert (=> b!1189310 (=> (not res!790848) (not e!676185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189310 (= res!790848 (validMask!0 mask!1564))))

(declare-fun b!1189311 () Bool)

(assert (=> b!1189311 (= e!676185 e!676183)))

(declare-fun res!790850 () Bool)

(assert (=> b!1189311 (=> (not res!790850) (not e!676183))))

(assert (=> b!1189311 (= res!790850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541018 mask!1564))))

(assert (=> b!1189311 (= lt!541018 (array!76846 (store (arr!37072 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37608 _keys!1208)))))

(declare-fun b!1189312 () Bool)

(declare-fun e!676186 () Bool)

(assert (=> b!1189312 (= e!676186 tp_is_empty!30025)))

(declare-fun b!1189313 () Bool)

(declare-fun res!790846 () Bool)

(assert (=> b!1189313 (=> (not res!790846) (not e!676185))))

(assert (=> b!1189313 (= res!790846 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37608 _keys!1208))))))

(declare-fun b!1189314 () Bool)

(declare-fun e!676181 () Bool)

(assert (=> b!1189314 (= e!676181 true)))

(declare-fun zeroValue!944 () V!45161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541016 () array!76847)

(declare-fun minValue!944 () V!45161)

(declare-datatypes ((tuple2!19354 0))(
  ( (tuple2!19355 (_1!9688 (_ BitVec 64)) (_2!9688 V!45161)) )
))
(declare-datatypes ((List!26099 0))(
  ( (Nil!26096) (Cons!26095 (h!27304 tuple2!19354) (t!38586 List!26099)) )
))
(declare-datatypes ((ListLongMap!17323 0))(
  ( (ListLongMap!17324 (toList!8677 List!26099)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5118 (array!76845 array!76847 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) Int) ListLongMap!17323)

(declare-fun -!1706 (ListLongMap!17323 (_ BitVec 64)) ListLongMap!17323)

(assert (=> b!1189314 (= (getCurrentListMapNoExtraKeys!5118 lt!541018 lt!541016 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1706 (getCurrentListMapNoExtraKeys!5118 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39452 0))(
  ( (Unit!39453) )
))
(declare-fun lt!541017 () Unit!39452)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 (array!76845 array!76847 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39452)

(assert (=> b!1189314 (= lt!541017 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189315 () Bool)

(declare-fun res!790851 () Bool)

(assert (=> b!1189315 (=> (not res!790851) (not e!676185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189315 (= res!790851 (validKeyInArray!0 k!934))))

(declare-fun b!1189316 () Bool)

(declare-fun res!790853 () Bool)

(assert (=> b!1189316 (=> (not res!790853) (not e!676185))))

(assert (=> b!1189316 (= res!790853 (and (= (size!37609 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37608 _keys!1208) (size!37609 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46865 () Bool)

(declare-fun mapRes!46865 () Bool)

(declare-fun tp!89198 () Bool)

(assert (=> mapNonEmpty!46865 (= mapRes!46865 (and tp!89198 e!676184))))

(declare-fun mapValue!46865 () ValueCell!14303)

(declare-fun mapKey!46865 () (_ BitVec 32))

(declare-fun mapRest!46865 () (Array (_ BitVec 32) ValueCell!14303))

(assert (=> mapNonEmpty!46865 (= (arr!37073 _values!996) (store mapRest!46865 mapKey!46865 mapValue!46865))))

(declare-fun b!1189317 () Bool)

(assert (=> b!1189317 (= e!676179 (and e!676186 mapRes!46865))))

(declare-fun condMapEmpty!46865 () Bool)

(declare-fun mapDefault!46865 () ValueCell!14303)

