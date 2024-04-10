; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99686 () Bool)

(assert start!99686)

(declare-fun b_free!25265 () Bool)

(declare-fun b_next!25265 () Bool)

(assert (=> start!99686 (= b_free!25265 (not b_next!25265))))

(declare-fun tp!88509 () Bool)

(declare-fun b_and!41397 () Bool)

(assert (=> start!99686 (= tp!88509 b_and!41397)))

(declare-fun b!1182501 () Bool)

(declare-fun e!672305 () Bool)

(declare-fun e!672303 () Bool)

(assert (=> b!1182501 (= e!672305 e!672303)))

(declare-fun res!785872 () Bool)

(assert (=> b!1182501 (=> res!785872 e!672303)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182501 (= res!785872 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44853 0))(
  ( (V!44854 (val!14954 Int)) )
))
(declare-fun zeroValue!944 () V!44853)

(declare-datatypes ((tuple2!19166 0))(
  ( (tuple2!19167 (_1!9594 (_ BitVec 64)) (_2!9594 V!44853)) )
))
(declare-datatypes ((List!25907 0))(
  ( (Nil!25904) (Cons!25903 (h!27112 tuple2!19166) (t!38164 List!25907)) )
))
(declare-datatypes ((ListLongMap!17135 0))(
  ( (ListLongMap!17136 (toList!8583 List!25907)) )
))
(declare-fun lt!535309 () ListLongMap!17135)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76393 0))(
  ( (array!76394 (arr!36846 (Array (_ BitVec 32) (_ BitVec 64))) (size!37382 (_ BitVec 32))) )
))
(declare-fun lt!535314 () array!76393)

(declare-datatypes ((ValueCell!14188 0))(
  ( (ValueCellFull!14188 (v!17592 V!44853)) (EmptyCell!14188) )
))
(declare-datatypes ((array!76395 0))(
  ( (array!76396 (arr!36847 (Array (_ BitVec 32) ValueCell!14188)) (size!37383 (_ BitVec 32))) )
))
(declare-fun lt!535318 () array!76395)

(declare-fun minValue!944 () V!44853)

(declare-fun getCurrentListMapNoExtraKeys!5034 (array!76393 array!76395 (_ BitVec 32) (_ BitVec 32) V!44853 V!44853 (_ BitVec 32) Int) ListLongMap!17135)

(assert (=> b!1182501 (= lt!535309 (getCurrentListMapNoExtraKeys!5034 lt!535314 lt!535318 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535316 () V!44853)

(declare-fun _values!996 () array!76395)

(assert (=> b!1182501 (= lt!535318 (array!76396 (store (arr!36847 _values!996) i!673 (ValueCellFull!14188 lt!535316)) (size!37383 _values!996)))))

(declare-fun dynLambda!2989 (Int (_ BitVec 64)) V!44853)

(assert (=> b!1182501 (= lt!535316 (dynLambda!2989 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76393)

(declare-fun lt!535322 () ListLongMap!17135)

(assert (=> b!1182501 (= lt!535322 (getCurrentListMapNoExtraKeys!5034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182502 () Bool)

(declare-fun e!672299 () Bool)

(declare-fun e!672306 () Bool)

(assert (=> b!1182502 (= e!672299 e!672306)))

(declare-fun res!785877 () Bool)

(assert (=> b!1182502 (=> (not res!785877) (not e!672306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76393 (_ BitVec 32)) Bool)

(assert (=> b!1182502 (= res!785877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535314 mask!1564))))

(assert (=> b!1182502 (= lt!535314 (array!76394 (store (arr!36846 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37382 _keys!1208)))))

(declare-fun mapNonEmpty!46520 () Bool)

(declare-fun mapRes!46520 () Bool)

(declare-fun tp!88508 () Bool)

(declare-fun e!672301 () Bool)

(assert (=> mapNonEmpty!46520 (= mapRes!46520 (and tp!88508 e!672301))))

(declare-fun mapRest!46520 () (Array (_ BitVec 32) ValueCell!14188))

(declare-fun mapValue!46520 () ValueCell!14188)

(declare-fun mapKey!46520 () (_ BitVec 32))

(assert (=> mapNonEmpty!46520 (= (arr!36847 _values!996) (store mapRest!46520 mapKey!46520 mapValue!46520))))

(declare-fun b!1182503 () Bool)

(declare-fun tp_is_empty!29795 () Bool)

(assert (=> b!1182503 (= e!672301 tp_is_empty!29795)))

(declare-fun b!1182504 () Bool)

(declare-fun e!672300 () Bool)

(assert (=> b!1182504 (= e!672300 true)))

(declare-fun lt!535307 () ListLongMap!17135)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!535315 () ListLongMap!17135)

(declare-fun -!1621 (ListLongMap!17135 (_ BitVec 64)) ListLongMap!17135)

(assert (=> b!1182504 (= (-!1621 lt!535307 k!934) lt!535315)))

(declare-datatypes ((Unit!39125 0))(
  ( (Unit!39126) )
))
(declare-fun lt!535320 () Unit!39125)

(declare-fun lt!535306 () V!44853)

(declare-fun lt!535310 () ListLongMap!17135)

(declare-fun addRemoveCommutativeForDiffKeys!150 (ListLongMap!17135 (_ BitVec 64) V!44853 (_ BitVec 64)) Unit!39125)

(assert (=> b!1182504 (= lt!535320 (addRemoveCommutativeForDiffKeys!150 lt!535310 (select (arr!36846 _keys!1208) from!1455) lt!535306 k!934))))

(declare-fun lt!535312 () ListLongMap!17135)

(declare-fun lt!535305 () ListLongMap!17135)

(assert (=> b!1182504 (and (= lt!535322 lt!535307) (= lt!535305 lt!535312))))

(declare-fun lt!535323 () tuple2!19166)

(declare-fun +!3887 (ListLongMap!17135 tuple2!19166) ListLongMap!17135)

(assert (=> b!1182504 (= lt!535307 (+!3887 lt!535310 lt!535323))))

(assert (=> b!1182504 (not (= (select (arr!36846 _keys!1208) from!1455) k!934))))

(declare-fun lt!535321 () Unit!39125)

(declare-fun e!672302 () Unit!39125)

(assert (=> b!1182504 (= lt!535321 e!672302)))

(declare-fun c!117021 () Bool)

(assert (=> b!1182504 (= c!117021 (= (select (arr!36846 _keys!1208) from!1455) k!934))))

(declare-fun e!672309 () Bool)

(assert (=> b!1182504 e!672309))

(declare-fun res!785869 () Bool)

(assert (=> b!1182504 (=> (not res!785869) (not e!672309))))

(assert (=> b!1182504 (= res!785869 (= lt!535309 lt!535315))))

(assert (=> b!1182504 (= lt!535315 (+!3887 lt!535305 lt!535323))))

(assert (=> b!1182504 (= lt!535323 (tuple2!19167 (select (arr!36846 _keys!1208) from!1455) lt!535306))))

(declare-fun get!18848 (ValueCell!14188 V!44853) V!44853)

(assert (=> b!1182504 (= lt!535306 (get!18848 (select (arr!36847 _values!996) from!1455) lt!535316))))

(declare-fun b!1182505 () Bool)

(declare-fun e!672304 () Bool)

(assert (=> b!1182505 (= e!672309 e!672304)))

(declare-fun res!785868 () Bool)

(assert (=> b!1182505 (=> res!785868 e!672304)))

(assert (=> b!1182505 (= res!785868 (not (= (select (arr!36846 _keys!1208) from!1455) k!934)))))

(declare-fun b!1182506 () Bool)

(declare-fun res!785874 () Bool)

(assert (=> b!1182506 (=> (not res!785874) (not e!672306))))

(declare-datatypes ((List!25908 0))(
  ( (Nil!25905) (Cons!25904 (h!27113 (_ BitVec 64)) (t!38165 List!25908)) )
))
(declare-fun arrayNoDuplicates!0 (array!76393 (_ BitVec 32) List!25908) Bool)

(assert (=> b!1182506 (= res!785874 (arrayNoDuplicates!0 lt!535314 #b00000000000000000000000000000000 Nil!25905))))

(declare-fun b!1182507 () Bool)

(declare-fun res!785867 () Bool)

(assert (=> b!1182507 (=> (not res!785867) (not e!672299))))

(assert (=> b!1182507 (= res!785867 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25905))))

(declare-fun b!1182509 () Bool)

(declare-fun res!785878 () Bool)

(assert (=> b!1182509 (=> (not res!785878) (not e!672299))))

(assert (=> b!1182509 (= res!785878 (= (select (arr!36846 _keys!1208) i!673) k!934))))

(declare-fun b!1182510 () Bool)

(declare-fun res!785864 () Bool)

(assert (=> b!1182510 (=> (not res!785864) (not e!672299))))

(assert (=> b!1182510 (= res!785864 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37382 _keys!1208))))))

(declare-fun b!1182511 () Bool)

(declare-fun Unit!39127 () Unit!39125)

(assert (=> b!1182511 (= e!672302 Unit!39127)))

(declare-fun b!1182512 () Bool)

(declare-fun Unit!39128 () Unit!39125)

(assert (=> b!1182512 (= e!672302 Unit!39128)))

(declare-fun lt!535319 () Unit!39125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76393 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39125)

(assert (=> b!1182512 (= lt!535319 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182512 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535317 () Unit!39125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76393 (_ BitVec 32) (_ BitVec 32)) Unit!39125)

(assert (=> b!1182512 (= lt!535317 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182512 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25905)))

(declare-fun lt!535313 () Unit!39125)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76393 (_ BitVec 64) (_ BitVec 32) List!25908) Unit!39125)

(assert (=> b!1182512 (= lt!535313 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25905))))

(assert (=> b!1182512 false))

(declare-fun b!1182513 () Bool)

(declare-fun res!785875 () Bool)

(assert (=> b!1182513 (=> (not res!785875) (not e!672299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182513 (= res!785875 (validKeyInArray!0 k!934))))

(declare-fun b!1182514 () Bool)

(declare-fun e!672308 () Bool)

(declare-fun e!672310 () Bool)

(assert (=> b!1182514 (= e!672308 (and e!672310 mapRes!46520))))

(declare-fun condMapEmpty!46520 () Bool)

(declare-fun mapDefault!46520 () ValueCell!14188)

