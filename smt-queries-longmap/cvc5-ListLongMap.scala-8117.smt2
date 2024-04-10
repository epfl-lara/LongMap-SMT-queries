; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99568 () Bool)

(assert start!99568)

(declare-fun b_free!25147 () Bool)

(declare-fun b_next!25147 () Bool)

(assert (=> start!99568 (= b_free!25147 (not b_next!25147))))

(declare-fun tp!88155 () Bool)

(declare-fun b_and!41161 () Bool)

(assert (=> start!99568 (= tp!88155 b_and!41161)))

(declare-fun b!1178620 () Bool)

(declare-fun res!783000 () Bool)

(declare-fun e!670051 () Bool)

(assert (=> b!1178620 (=> (not res!783000) (not e!670051))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178620 (= res!783000 (validKeyInArray!0 k!934))))

(declare-fun b!1178621 () Bool)

(declare-fun e!670052 () Bool)

(assert (=> b!1178621 (= e!670051 e!670052)))

(declare-fun res!782997 () Bool)

(assert (=> b!1178621 (=> (not res!782997) (not e!670052))))

(declare-datatypes ((array!76157 0))(
  ( (array!76158 (arr!36728 (Array (_ BitVec 32) (_ BitVec 64))) (size!37264 (_ BitVec 32))) )
))
(declare-fun lt!532474 () array!76157)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76157 (_ BitVec 32)) Bool)

(assert (=> b!1178621 (= res!782997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532474 mask!1564))))

(declare-fun _keys!1208 () array!76157)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178621 (= lt!532474 (array!76158 (store (arr!36728 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37264 _keys!1208)))))

(declare-fun b!1178622 () Bool)

(declare-fun res!782995 () Bool)

(assert (=> b!1178622 (=> (not res!782995) (not e!670051))))

(assert (=> b!1178622 (= res!782995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178623 () Bool)

(declare-fun res!782991 () Bool)

(assert (=> b!1178623 (=> (not res!782991) (not e!670051))))

(assert (=> b!1178623 (= res!782991 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37264 _keys!1208))))))

(declare-fun b!1178624 () Bool)

(declare-datatypes ((Unit!38934 0))(
  ( (Unit!38935) )
))
(declare-fun e!670046 () Unit!38934)

(declare-fun Unit!38936 () Unit!38934)

(assert (=> b!1178624 (= e!670046 Unit!38936)))

(declare-fun e!670047 () Bool)

(declare-fun b!1178625 () Bool)

(declare-fun arrayContainsKey!0 (array!76157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178625 (= e!670047 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178626 () Bool)

(declare-fun e!670050 () Bool)

(assert (=> b!1178626 (= e!670050 e!670047)))

(declare-fun res!782994 () Bool)

(assert (=> b!1178626 (=> res!782994 e!670047)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178626 (= res!782994 (not (= (select (arr!36728 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178627 () Bool)

(declare-fun e!670042 () Bool)

(declare-fun tp_is_empty!29677 () Bool)

(assert (=> b!1178627 (= e!670042 tp_is_empty!29677)))

(declare-fun res!782993 () Bool)

(assert (=> start!99568 (=> (not res!782993) (not e!670051))))

(assert (=> start!99568 (= res!782993 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37264 _keys!1208))))))

(assert (=> start!99568 e!670051))

(assert (=> start!99568 tp_is_empty!29677))

(declare-fun array_inv!28044 (array!76157) Bool)

(assert (=> start!99568 (array_inv!28044 _keys!1208)))

(assert (=> start!99568 true))

(assert (=> start!99568 tp!88155))

(declare-datatypes ((V!44697 0))(
  ( (V!44698 (val!14895 Int)) )
))
(declare-datatypes ((ValueCell!14129 0))(
  ( (ValueCellFull!14129 (v!17533 V!44697)) (EmptyCell!14129) )
))
(declare-datatypes ((array!76159 0))(
  ( (array!76160 (arr!36729 (Array (_ BitVec 32) ValueCell!14129)) (size!37265 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76159)

(declare-fun e!670054 () Bool)

(declare-fun array_inv!28045 (array!76159) Bool)

(assert (=> start!99568 (and (array_inv!28045 _values!996) e!670054)))

(declare-fun b!1178628 () Bool)

(declare-fun res!782987 () Bool)

(assert (=> b!1178628 (=> (not res!782987) (not e!670052))))

(declare-datatypes ((List!25798 0))(
  ( (Nil!25795) (Cons!25794 (h!27003 (_ BitVec 64)) (t!37937 List!25798)) )
))
(declare-fun arrayNoDuplicates!0 (array!76157 (_ BitVec 32) List!25798) Bool)

(assert (=> b!1178628 (= res!782987 (arrayNoDuplicates!0 lt!532474 #b00000000000000000000000000000000 Nil!25795))))

(declare-datatypes ((tuple2!19060 0))(
  ( (tuple2!19061 (_1!9541 (_ BitVec 64)) (_2!9541 V!44697)) )
))
(declare-datatypes ((List!25799 0))(
  ( (Nil!25796) (Cons!25795 (h!27004 tuple2!19060) (t!37938 List!25799)) )
))
(declare-datatypes ((ListLongMap!17029 0))(
  ( (ListLongMap!17030 (toList!8530 List!25799)) )
))
(declare-fun lt!532486 () ListLongMap!17029)

(declare-fun lt!532482 () ListLongMap!17029)

(declare-fun b!1178629 () Bool)

(declare-fun lt!532475 () tuple2!19060)

(declare-fun e!670045 () Bool)

(declare-fun +!3844 (ListLongMap!17029 tuple2!19060) ListLongMap!17029)

(assert (=> b!1178629 (= e!670045 (= lt!532482 (+!3844 lt!532486 lt!532475)))))

(declare-fun b!1178630 () Bool)

(declare-fun e!670048 () Bool)

(declare-fun e!670044 () Bool)

(assert (=> b!1178630 (= e!670048 e!670044)))

(declare-fun res!782986 () Bool)

(assert (=> b!1178630 (=> res!782986 e!670044)))

(assert (=> b!1178630 (= res!782986 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!532477 () ListLongMap!17029)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532479 () array!76159)

(declare-fun minValue!944 () V!44697)

(declare-fun getCurrentListMapNoExtraKeys!4986 (array!76157 array!76159 (_ BitVec 32) (_ BitVec 32) V!44697 V!44697 (_ BitVec 32) Int) ListLongMap!17029)

(assert (=> b!1178630 (= lt!532477 (getCurrentListMapNoExtraKeys!4986 lt!532474 lt!532479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532485 () V!44697)

(assert (=> b!1178630 (= lt!532479 (array!76160 (store (arr!36729 _values!996) i!673 (ValueCellFull!14129 lt!532485)) (size!37265 _values!996)))))

(declare-fun dynLambda!2948 (Int (_ BitVec 64)) V!44697)

(assert (=> b!1178630 (= lt!532485 (dynLambda!2948 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178630 (= lt!532482 (getCurrentListMapNoExtraKeys!4986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178631 () Bool)

(declare-fun res!782998 () Bool)

(assert (=> b!1178631 (=> (not res!782998) (not e!670051))))

(assert (=> b!1178631 (= res!782998 (and (= (size!37265 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37264 _keys!1208) (size!37265 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178632 () Bool)

(declare-fun e!670049 () Bool)

(assert (=> b!1178632 (= e!670049 tp_is_empty!29677)))

(declare-fun b!1178633 () Bool)

(declare-fun e!670043 () Bool)

(assert (=> b!1178633 (= e!670043 true)))

(assert (=> b!1178633 e!670045))

(declare-fun res!782989 () Bool)

(assert (=> b!1178633 (=> (not res!782989) (not e!670045))))

(assert (=> b!1178633 (= res!782989 (not (= (select (arr!36728 _keys!1208) from!1455) k!934)))))

(declare-fun lt!532483 () Unit!38934)

(assert (=> b!1178633 (= lt!532483 e!670046)))

(declare-fun c!116844 () Bool)

(assert (=> b!1178633 (= c!116844 (= (select (arr!36728 _keys!1208) from!1455) k!934))))

(assert (=> b!1178633 e!670050))

(declare-fun res!783001 () Bool)

(assert (=> b!1178633 (=> (not res!783001) (not e!670050))))

(declare-fun lt!532481 () ListLongMap!17029)

(assert (=> b!1178633 (= res!783001 (= lt!532477 (+!3844 lt!532481 lt!532475)))))

(declare-fun get!18774 (ValueCell!14129 V!44697) V!44697)

(assert (=> b!1178633 (= lt!532475 (tuple2!19061 (select (arr!36728 _keys!1208) from!1455) (get!18774 (select (arr!36729 _values!996) from!1455) lt!532485)))))

(declare-fun mapIsEmpty!46343 () Bool)

(declare-fun mapRes!46343 () Bool)

(assert (=> mapIsEmpty!46343 mapRes!46343))

(declare-fun b!1178634 () Bool)

(assert (=> b!1178634 (= e!670052 (not e!670048))))

(declare-fun res!782990 () Bool)

(assert (=> b!1178634 (=> res!782990 e!670048)))

(assert (=> b!1178634 (= res!782990 (bvsgt from!1455 i!673))))

(assert (=> b!1178634 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!532488 () Unit!38934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76157 (_ BitVec 64) (_ BitVec 32)) Unit!38934)

(assert (=> b!1178634 (= lt!532488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46343 () Bool)

(declare-fun tp!88154 () Bool)

(assert (=> mapNonEmpty!46343 (= mapRes!46343 (and tp!88154 e!670042))))

(declare-fun mapRest!46343 () (Array (_ BitVec 32) ValueCell!14129))

(declare-fun mapKey!46343 () (_ BitVec 32))

(declare-fun mapValue!46343 () ValueCell!14129)

(assert (=> mapNonEmpty!46343 (= (arr!36729 _values!996) (store mapRest!46343 mapKey!46343 mapValue!46343))))

(declare-fun b!1178635 () Bool)

(declare-fun res!782996 () Bool)

(assert (=> b!1178635 (=> (not res!782996) (not e!670051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178635 (= res!782996 (validMask!0 mask!1564))))

(declare-fun b!1178636 () Bool)

(declare-fun res!782988 () Bool)

(assert (=> b!1178636 (=> (not res!782988) (not e!670051))))

(assert (=> b!1178636 (= res!782988 (= (select (arr!36728 _keys!1208) i!673) k!934))))

(declare-fun b!1178637 () Bool)

(declare-fun Unit!38937 () Unit!38934)

(assert (=> b!1178637 (= e!670046 Unit!38937)))

(declare-fun lt!532487 () Unit!38934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76157 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38934)

(assert (=> b!1178637 (= lt!532487 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178637 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532480 () Unit!38934)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76157 (_ BitVec 32) (_ BitVec 32)) Unit!38934)

(assert (=> b!1178637 (= lt!532480 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178637 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25795)))

(declare-fun lt!532484 () Unit!38934)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76157 (_ BitVec 64) (_ BitVec 32) List!25798) Unit!38934)

(assert (=> b!1178637 (= lt!532484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25795))))

(assert (=> b!1178637 false))

(declare-fun b!1178638 () Bool)

(assert (=> b!1178638 (= e!670054 (and e!670049 mapRes!46343))))

(declare-fun condMapEmpty!46343 () Bool)

(declare-fun mapDefault!46343 () ValueCell!14129)

