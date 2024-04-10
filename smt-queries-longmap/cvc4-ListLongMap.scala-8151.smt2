; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99776 () Bool)

(assert start!99776)

(declare-fun b_free!25355 () Bool)

(declare-fun b_next!25355 () Bool)

(assert (=> start!99776 (= b_free!25355 (not b_next!25355))))

(declare-fun tp!88778 () Bool)

(declare-fun b_and!41577 () Bool)

(assert (=> start!99776 (= tp!88778 b_and!41577)))

(declare-fun b!1185291 () Bool)

(declare-fun e!673921 () Bool)

(assert (=> b!1185291 (= e!673921 true)))

(declare-datatypes ((V!44973 0))(
  ( (V!44974 (val!14999 Int)) )
))
(declare-datatypes ((tuple2!19238 0))(
  ( (tuple2!19239 (_1!9630 (_ BitVec 64)) (_2!9630 V!44973)) )
))
(declare-datatypes ((List!25978 0))(
  ( (Nil!25975) (Cons!25974 (h!27183 tuple2!19238) (t!38325 List!25978)) )
))
(declare-datatypes ((ListLongMap!17207 0))(
  ( (ListLongMap!17208 (toList!8619 List!25978)) )
))
(declare-fun lt!537871 () ListLongMap!17207)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!537888 () ListLongMap!17207)

(declare-fun -!1654 (ListLongMap!17207 (_ BitVec 64)) ListLongMap!17207)

(assert (=> b!1185291 (= (-!1654 lt!537871 k!934) lt!537888)))

(declare-fun lt!537878 () V!44973)

(declare-datatypes ((array!76567 0))(
  ( (array!76568 (arr!36933 (Array (_ BitVec 32) (_ BitVec 64))) (size!37469 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76567)

(declare-fun lt!537882 () ListLongMap!17207)

(declare-datatypes ((Unit!39261 0))(
  ( (Unit!39262) )
))
(declare-fun lt!537877 () Unit!39261)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!179 (ListLongMap!17207 (_ BitVec 64) V!44973 (_ BitVec 64)) Unit!39261)

(assert (=> b!1185291 (= lt!537877 (addRemoveCommutativeForDiffKeys!179 lt!537882 (select (arr!36933 _keys!1208) from!1455) lt!537878 k!934))))

(declare-fun lt!537872 () ListLongMap!17207)

(declare-fun lt!537887 () ListLongMap!17207)

(declare-fun lt!537885 () ListLongMap!17207)

(assert (=> b!1185291 (and (= lt!537872 lt!537871) (= lt!537887 lt!537885))))

(declare-fun lt!537870 () tuple2!19238)

(declare-fun +!3916 (ListLongMap!17207 tuple2!19238) ListLongMap!17207)

(assert (=> b!1185291 (= lt!537871 (+!3916 lt!537882 lt!537870))))

(assert (=> b!1185291 (not (= (select (arr!36933 _keys!1208) from!1455) k!934))))

(declare-fun lt!537883 () Unit!39261)

(declare-fun e!673926 () Unit!39261)

(assert (=> b!1185291 (= lt!537883 e!673926)))

(declare-fun c!117156 () Bool)

(assert (=> b!1185291 (= c!117156 (= (select (arr!36933 _keys!1208) from!1455) k!934))))

(declare-fun e!673919 () Bool)

(assert (=> b!1185291 e!673919))

(declare-fun res!787903 () Bool)

(assert (=> b!1185291 (=> (not res!787903) (not e!673919))))

(declare-fun lt!537886 () ListLongMap!17207)

(assert (=> b!1185291 (= res!787903 (= lt!537886 lt!537888))))

(assert (=> b!1185291 (= lt!537888 (+!3916 lt!537887 lt!537870))))

(assert (=> b!1185291 (= lt!537870 (tuple2!19239 (select (arr!36933 _keys!1208) from!1455) lt!537878))))

(declare-fun lt!537880 () V!44973)

(declare-datatypes ((ValueCell!14233 0))(
  ( (ValueCellFull!14233 (v!17637 V!44973)) (EmptyCell!14233) )
))
(declare-datatypes ((array!76569 0))(
  ( (array!76570 (arr!36934 (Array (_ BitVec 32) ValueCell!14233)) (size!37470 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76569)

(declare-fun get!18907 (ValueCell!14233 V!44973) V!44973)

(assert (=> b!1185291 (= lt!537878 (get!18907 (select (arr!36934 _values!996) from!1455) lt!537880))))

(declare-fun b!1185292 () Bool)

(declare-fun e!673928 () Bool)

(declare-fun e!673929 () Bool)

(assert (=> b!1185292 (= e!673928 (not e!673929))))

(declare-fun res!787891 () Bool)

(assert (=> b!1185292 (=> res!787891 e!673929)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185292 (= res!787891 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185292 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!537876 () Unit!39261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76567 (_ BitVec 64) (_ BitVec 32)) Unit!39261)

(assert (=> b!1185292 (= lt!537876 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185293 () Bool)

(declare-fun res!787897 () Bool)

(declare-fun e!673922 () Bool)

(assert (=> b!1185293 (=> (not res!787897) (not e!673922))))

(assert (=> b!1185293 (= res!787897 (= (select (arr!36933 _keys!1208) i!673) k!934))))

(declare-fun res!787898 () Bool)

(assert (=> start!99776 (=> (not res!787898) (not e!673922))))

(assert (=> start!99776 (= res!787898 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37469 _keys!1208))))))

(assert (=> start!99776 e!673922))

(declare-fun tp_is_empty!29885 () Bool)

(assert (=> start!99776 tp_is_empty!29885))

(declare-fun array_inv!28186 (array!76567) Bool)

(assert (=> start!99776 (array_inv!28186 _keys!1208)))

(assert (=> start!99776 true))

(assert (=> start!99776 tp!88778))

(declare-fun e!673923 () Bool)

(declare-fun array_inv!28187 (array!76569) Bool)

(assert (=> start!99776 (and (array_inv!28187 _values!996) e!673923)))

(declare-fun b!1185294 () Bool)

(declare-fun res!787893 () Bool)

(assert (=> b!1185294 (=> (not res!787893) (not e!673922))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76567 (_ BitVec 32)) Bool)

(assert (=> b!1185294 (= res!787893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185295 () Bool)

(declare-fun Unit!39263 () Unit!39261)

(assert (=> b!1185295 (= e!673926 Unit!39263)))

(declare-fun lt!537884 () Unit!39261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39261)

(assert (=> b!1185295 (= lt!537884 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185295 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537873 () Unit!39261)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76567 (_ BitVec 32) (_ BitVec 32)) Unit!39261)

(assert (=> b!1185295 (= lt!537873 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25979 0))(
  ( (Nil!25976) (Cons!25975 (h!27184 (_ BitVec 64)) (t!38326 List!25979)) )
))
(declare-fun arrayNoDuplicates!0 (array!76567 (_ BitVec 32) List!25979) Bool)

(assert (=> b!1185295 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25976)))

(declare-fun lt!537879 () Unit!39261)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76567 (_ BitVec 64) (_ BitVec 32) List!25979) Unit!39261)

(assert (=> b!1185295 (= lt!537879 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25976))))

(assert (=> b!1185295 false))

(declare-fun b!1185296 () Bool)

(declare-fun res!787895 () Bool)

(assert (=> b!1185296 (=> (not res!787895) (not e!673928))))

(declare-fun lt!537875 () array!76567)

(assert (=> b!1185296 (= res!787895 (arrayNoDuplicates!0 lt!537875 #b00000000000000000000000000000000 Nil!25976))))

(declare-fun b!1185297 () Bool)

(declare-fun res!787890 () Bool)

(assert (=> b!1185297 (=> (not res!787890) (not e!673922))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1185297 (= res!787890 (and (= (size!37470 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37469 _keys!1208) (size!37470 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46655 () Bool)

(declare-fun mapRes!46655 () Bool)

(declare-fun tp!88779 () Bool)

(declare-fun e!673927 () Bool)

(assert (=> mapNonEmpty!46655 (= mapRes!46655 (and tp!88779 e!673927))))

(declare-fun mapValue!46655 () ValueCell!14233)

(declare-fun mapRest!46655 () (Array (_ BitVec 32) ValueCell!14233))

(declare-fun mapKey!46655 () (_ BitVec 32))

(assert (=> mapNonEmpty!46655 (= (arr!36934 _values!996) (store mapRest!46655 mapKey!46655 mapValue!46655))))

(declare-fun b!1185298 () Bool)

(declare-fun e!673925 () Bool)

(assert (=> b!1185298 (= e!673925 tp_is_empty!29885)))

(declare-fun b!1185299 () Bool)

(declare-fun e!673924 () Bool)

(assert (=> b!1185299 (= e!673919 e!673924)))

(declare-fun res!787892 () Bool)

(assert (=> b!1185299 (=> res!787892 e!673924)))

(assert (=> b!1185299 (= res!787892 (not (= (select (arr!36933 _keys!1208) from!1455) k!934)))))

(declare-fun b!1185300 () Bool)

(assert (=> b!1185300 (= e!673923 (and e!673925 mapRes!46655))))

(declare-fun condMapEmpty!46655 () Bool)

(declare-fun mapDefault!46655 () ValueCell!14233)

