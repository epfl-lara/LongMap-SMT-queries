; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99850 () Bool)

(assert start!99850)

(declare-fun b_free!25429 () Bool)

(declare-fun b_next!25429 () Bool)

(assert (=> start!99850 (= b_free!25429 (not b_next!25429))))

(declare-fun tp!89000 () Bool)

(declare-fun b_and!41725 () Bool)

(assert (=> start!99850 (= tp!89000 b_and!41725)))

(declare-fun b!1187585 () Bool)

(declare-fun e!675262 () Bool)

(declare-fun e!675258 () Bool)

(assert (=> b!1187585 (= e!675262 (not e!675258))))

(declare-fun res!789558 () Bool)

(assert (=> b!1187585 (=> res!789558 e!675258)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187585 (= res!789558 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76713 0))(
  ( (array!76714 (arr!37006 (Array (_ BitVec 32) (_ BitVec 64))) (size!37542 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76713)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187585 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39384 0))(
  ( (Unit!39385) )
))
(declare-fun lt!539995 () Unit!39384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76713 (_ BitVec 64) (_ BitVec 32)) Unit!39384)

(assert (=> b!1187585 (= lt!539995 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187586 () Bool)

(declare-fun res!789562 () Bool)

(declare-fun e!675252 () Bool)

(assert (=> b!1187586 (=> (not res!789562) (not e!675252))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45073 0))(
  ( (V!45074 (val!15036 Int)) )
))
(declare-datatypes ((ValueCell!14270 0))(
  ( (ValueCellFull!14270 (v!17674 V!45073)) (EmptyCell!14270) )
))
(declare-datatypes ((array!76715 0))(
  ( (array!76716 (arr!37007 (Array (_ BitVec 32) ValueCell!14270)) (size!37543 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76715)

(assert (=> b!1187586 (= res!789562 (and (= (size!37543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37542 _keys!1208) (size!37543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187587 () Bool)

(declare-fun e!675261 () Bool)

(assert (=> b!1187587 (= e!675261 true)))

(declare-datatypes ((tuple2!19304 0))(
  ( (tuple2!19305 (_1!9663 (_ BitVec 64)) (_2!9663 V!45073)) )
))
(declare-datatypes ((List!26043 0))(
  ( (Nil!26040) (Cons!26039 (h!27248 tuple2!19304) (t!38464 List!26043)) )
))
(declare-datatypes ((ListLongMap!17273 0))(
  ( (ListLongMap!17274 (toList!8652 List!26043)) )
))
(declare-fun lt!539997 () ListLongMap!17273)

(declare-fun lt!539984 () ListLongMap!17273)

(declare-fun -!1683 (ListLongMap!17273 (_ BitVec 64)) ListLongMap!17273)

(assert (=> b!1187587 (= (-!1683 lt!539997 k!934) lt!539984)))

(declare-fun lt!539989 () Unit!39384)

(declare-fun lt!539982 () ListLongMap!17273)

(declare-fun lt!539987 () V!45073)

(declare-fun addRemoveCommutativeForDiffKeys!202 (ListLongMap!17273 (_ BitVec 64) V!45073 (_ BitVec 64)) Unit!39384)

(assert (=> b!1187587 (= lt!539989 (addRemoveCommutativeForDiffKeys!202 lt!539982 (select (arr!37006 _keys!1208) from!1455) lt!539987 k!934))))

(declare-fun lt!539994 () ListLongMap!17273)

(declare-fun lt!539981 () ListLongMap!17273)

(declare-fun lt!539993 () ListLongMap!17273)

(assert (=> b!1187587 (and (= lt!539994 lt!539997) (= lt!539981 lt!539993))))

(declare-fun lt!539996 () tuple2!19304)

(declare-fun +!3939 (ListLongMap!17273 tuple2!19304) ListLongMap!17273)

(assert (=> b!1187587 (= lt!539997 (+!3939 lt!539982 lt!539996))))

(assert (=> b!1187587 (not (= (select (arr!37006 _keys!1208) from!1455) k!934))))

(declare-fun lt!539988 () Unit!39384)

(declare-fun e!675255 () Unit!39384)

(assert (=> b!1187587 (= lt!539988 e!675255)))

(declare-fun c!117267 () Bool)

(assert (=> b!1187587 (= c!117267 (= (select (arr!37006 _keys!1208) from!1455) k!934))))

(declare-fun e!675253 () Bool)

(assert (=> b!1187587 e!675253))

(declare-fun res!789563 () Bool)

(assert (=> b!1187587 (=> (not res!789563) (not e!675253))))

(declare-fun lt!539991 () ListLongMap!17273)

(assert (=> b!1187587 (= res!789563 (= lt!539991 lt!539984))))

(assert (=> b!1187587 (= lt!539984 (+!3939 lt!539981 lt!539996))))

(assert (=> b!1187587 (= lt!539996 (tuple2!19305 (select (arr!37006 _keys!1208) from!1455) lt!539987))))

(declare-fun lt!539992 () V!45073)

(declare-fun get!18956 (ValueCell!14270 V!45073) V!45073)

(assert (=> b!1187587 (= lt!539987 (get!18956 (select (arr!37007 _values!996) from!1455) lt!539992))))

(declare-fun b!1187588 () Bool)

(assert (=> b!1187588 (= e!675252 e!675262)))

(declare-fun res!789567 () Bool)

(assert (=> b!1187588 (=> (not res!789567) (not e!675262))))

(declare-fun lt!539985 () array!76713)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76713 (_ BitVec 32)) Bool)

(assert (=> b!1187588 (= res!789567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539985 mask!1564))))

(assert (=> b!1187588 (= lt!539985 (array!76714 (store (arr!37006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37542 _keys!1208)))))

(declare-fun mapNonEmpty!46766 () Bool)

(declare-fun mapRes!46766 () Bool)

(declare-fun tp!89001 () Bool)

(declare-fun e!675260 () Bool)

(assert (=> mapNonEmpty!46766 (= mapRes!46766 (and tp!89001 e!675260))))

(declare-fun mapValue!46766 () ValueCell!14270)

(declare-fun mapKey!46766 () (_ BitVec 32))

(declare-fun mapRest!46766 () (Array (_ BitVec 32) ValueCell!14270))

(assert (=> mapNonEmpty!46766 (= (arr!37007 _values!996) (store mapRest!46766 mapKey!46766 mapValue!46766))))

(declare-fun b!1187589 () Bool)

(declare-fun Unit!39386 () Unit!39384)

(assert (=> b!1187589 (= e!675255 Unit!39386)))

(declare-fun lt!539979 () Unit!39384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39384)

(assert (=> b!1187589 (= lt!539979 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187589 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539983 () Unit!39384)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76713 (_ BitVec 32) (_ BitVec 32)) Unit!39384)

(assert (=> b!1187589 (= lt!539983 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26044 0))(
  ( (Nil!26041) (Cons!26040 (h!27249 (_ BitVec 64)) (t!38465 List!26044)) )
))
(declare-fun arrayNoDuplicates!0 (array!76713 (_ BitVec 32) List!26044) Bool)

(assert (=> b!1187589 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26041)))

(declare-fun lt!539990 () Unit!39384)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76713 (_ BitVec 64) (_ BitVec 32) List!26044) Unit!39384)

(assert (=> b!1187589 (= lt!539990 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26041))))

(assert (=> b!1187589 false))

(declare-fun b!1187590 () Bool)

(declare-fun Unit!39387 () Unit!39384)

(assert (=> b!1187590 (= e!675255 Unit!39387)))

(declare-fun mapIsEmpty!46766 () Bool)

(assert (=> mapIsEmpty!46766 mapRes!46766))

(declare-fun b!1187592 () Bool)

(declare-fun res!789557 () Bool)

(assert (=> b!1187592 (=> (not res!789557) (not e!675252))))

(assert (=> b!1187592 (= res!789557 (= (select (arr!37006 _keys!1208) i!673) k!934))))

(declare-fun b!1187593 () Bool)

(declare-fun tp_is_empty!29959 () Bool)

(assert (=> b!1187593 (= e!675260 tp_is_empty!29959)))

(declare-fun b!1187594 () Bool)

(declare-fun e!675259 () Bool)

(assert (=> b!1187594 (= e!675259 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187595 () Bool)

(declare-fun e!675254 () Bool)

(assert (=> b!1187595 (= e!675254 tp_is_empty!29959)))

(declare-fun b!1187596 () Bool)

(declare-fun e!675257 () Bool)

(assert (=> b!1187596 (= e!675257 (and e!675254 mapRes!46766))))

(declare-fun condMapEmpty!46766 () Bool)

(declare-fun mapDefault!46766 () ValueCell!14270)

