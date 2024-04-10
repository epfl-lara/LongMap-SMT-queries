; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99724 () Bool)

(assert start!99724)

(declare-fun b_free!25303 () Bool)

(declare-fun b_next!25303 () Bool)

(assert (=> start!99724 (= b_free!25303 (not b_next!25303))))

(declare-fun tp!88623 () Bool)

(declare-fun b_and!41473 () Bool)

(assert (=> start!99724 (= tp!88623 b_and!41473)))

(declare-fun b!1183679 () Bool)

(declare-fun e!672993 () Bool)

(assert (=> b!1183679 (= e!672993 true)))

(declare-datatypes ((V!44905 0))(
  ( (V!44906 (val!14973 Int)) )
))
(declare-datatypes ((tuple2!19196 0))(
  ( (tuple2!19197 (_1!9609 (_ BitVec 64)) (_2!9609 V!44905)) )
))
(declare-datatypes ((List!25935 0))(
  ( (Nil!25932) (Cons!25931 (h!27140 tuple2!19196) (t!38230 List!25935)) )
))
(declare-datatypes ((ListLongMap!17165 0))(
  ( (ListLongMap!17166 (toList!8598 List!25935)) )
))
(declare-fun lt!536393 () ListLongMap!17165)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!536391 () ListLongMap!17165)

(declare-fun -!1633 (ListLongMap!17165 (_ BitVec 64)) ListLongMap!17165)

(assert (=> b!1183679 (= (-!1633 lt!536393 k!934) lt!536391)))

(declare-datatypes ((array!76467 0))(
  ( (array!76468 (arr!36883 (Array (_ BitVec 32) (_ BitVec 64))) (size!37419 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76467)

(declare-fun lt!536402 () ListLongMap!17165)

(declare-datatypes ((Unit!39178 0))(
  ( (Unit!39179) )
))
(declare-fun lt!536397 () Unit!39178)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536388 () V!44905)

(declare-fun addRemoveCommutativeForDiffKeys!159 (ListLongMap!17165 (_ BitVec 64) V!44905 (_ BitVec 64)) Unit!39178)

(assert (=> b!1183679 (= lt!536397 (addRemoveCommutativeForDiffKeys!159 lt!536402 (select (arr!36883 _keys!1208) from!1455) lt!536388 k!934))))

(declare-fun lt!536405 () ListLongMap!17165)

(declare-fun lt!536401 () ListLongMap!17165)

(declare-fun lt!536390 () ListLongMap!17165)

(assert (=> b!1183679 (and (= lt!536401 lt!536393) (= lt!536390 lt!536405))))

(declare-fun lt!536396 () tuple2!19196)

(declare-fun +!3896 (ListLongMap!17165 tuple2!19196) ListLongMap!17165)

(assert (=> b!1183679 (= lt!536393 (+!3896 lt!536402 lt!536396))))

(assert (=> b!1183679 (not (= (select (arr!36883 _keys!1208) from!1455) k!934))))

(declare-fun lt!536394 () Unit!39178)

(declare-fun e!672992 () Unit!39178)

(assert (=> b!1183679 (= lt!536394 e!672992)))

(declare-fun c!117078 () Bool)

(assert (=> b!1183679 (= c!117078 (= (select (arr!36883 _keys!1208) from!1455) k!934))))

(declare-fun e!672989 () Bool)

(assert (=> b!1183679 e!672989))

(declare-fun res!786732 () Bool)

(assert (=> b!1183679 (=> (not res!786732) (not e!672989))))

(declare-fun lt!536404 () ListLongMap!17165)

(assert (=> b!1183679 (= res!786732 (= lt!536404 lt!536391))))

(assert (=> b!1183679 (= lt!536391 (+!3896 lt!536390 lt!536396))))

(assert (=> b!1183679 (= lt!536396 (tuple2!19197 (select (arr!36883 _keys!1208) from!1455) lt!536388))))

(declare-fun lt!536403 () V!44905)

(declare-datatypes ((ValueCell!14207 0))(
  ( (ValueCellFull!14207 (v!17611 V!44905)) (EmptyCell!14207) )
))
(declare-datatypes ((array!76469 0))(
  ( (array!76470 (arr!36884 (Array (_ BitVec 32) ValueCell!14207)) (size!37420 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76469)

(declare-fun get!18871 (ValueCell!14207 V!44905) V!44905)

(assert (=> b!1183679 (= lt!536388 (get!18871 (select (arr!36884 _values!996) from!1455) lt!536403))))

(declare-fun b!1183680 () Bool)

(declare-fun res!786725 () Bool)

(declare-fun e!672994 () Bool)

(assert (=> b!1183680 (=> (not res!786725) (not e!672994))))

(declare-fun lt!536399 () array!76467)

(declare-datatypes ((List!25936 0))(
  ( (Nil!25933) (Cons!25932 (h!27141 (_ BitVec 64)) (t!38231 List!25936)) )
))
(declare-fun arrayNoDuplicates!0 (array!76467 (_ BitVec 32) List!25936) Bool)

(assert (=> b!1183680 (= res!786725 (arrayNoDuplicates!0 lt!536399 #b00000000000000000000000000000000 Nil!25933))))

(declare-fun b!1183681 () Bool)

(declare-fun e!672986 () Bool)

(assert (=> b!1183681 (= e!672994 (not e!672986))))

(declare-fun res!786729 () Bool)

(assert (=> b!1183681 (=> res!786729 e!672986)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183681 (= res!786729 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183681 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!536398 () Unit!39178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76467 (_ BitVec 64) (_ BitVec 32)) Unit!39178)

(assert (=> b!1183681 (= lt!536398 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183682 () Bool)

(declare-fun res!786733 () Bool)

(declare-fun e!672990 () Bool)

(assert (=> b!1183682 (=> (not res!786733) (not e!672990))))

(assert (=> b!1183682 (= res!786733 (= (select (arr!36883 _keys!1208) i!673) k!934))))

(declare-fun b!1183683 () Bool)

(declare-fun e!672988 () Bool)

(declare-fun tp_is_empty!29833 () Bool)

(assert (=> b!1183683 (= e!672988 tp_is_empty!29833)))

(declare-fun b!1183684 () Bool)

(declare-fun res!786726 () Bool)

(assert (=> b!1183684 (=> (not res!786726) (not e!672990))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1183684 (= res!786726 (and (= (size!37420 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37419 _keys!1208) (size!37420 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183686 () Bool)

(declare-fun e!672985 () Bool)

(assert (=> b!1183686 (= e!672985 tp_is_empty!29833)))

(declare-fun b!1183687 () Bool)

(assert (=> b!1183687 (= e!672990 e!672994)))

(declare-fun res!786731 () Bool)

(assert (=> b!1183687 (=> (not res!786731) (not e!672994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76467 (_ BitVec 32)) Bool)

(assert (=> b!1183687 (= res!786731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536399 mask!1564))))

(assert (=> b!1183687 (= lt!536399 (array!76468 (store (arr!36883 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37419 _keys!1208)))))

(declare-fun b!1183688 () Bool)

(declare-fun res!786721 () Bool)

(assert (=> b!1183688 (=> (not res!786721) (not e!672990))))

(assert (=> b!1183688 (= res!786721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183689 () Bool)

(declare-fun res!786727 () Bool)

(assert (=> b!1183689 (=> (not res!786727) (not e!672990))))

(assert (=> b!1183689 (= res!786727 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25933))))

(declare-fun b!1183690 () Bool)

(declare-fun Unit!39180 () Unit!39178)

(assert (=> b!1183690 (= e!672992 Unit!39180)))

(declare-fun lt!536389 () Unit!39178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39178)

(assert (=> b!1183690 (= lt!536389 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183690 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536406 () Unit!39178)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76467 (_ BitVec 32) (_ BitVec 32)) Unit!39178)

(assert (=> b!1183690 (= lt!536406 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183690 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25933)))

(declare-fun lt!536392 () Unit!39178)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76467 (_ BitVec 64) (_ BitVec 32) List!25936) Unit!39178)

(assert (=> b!1183690 (= lt!536392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25933))))

(assert (=> b!1183690 false))

(declare-fun b!1183691 () Bool)

(declare-fun e!672987 () Bool)

(assert (=> b!1183691 (= e!672986 e!672987)))

(declare-fun res!786730 () Bool)

(assert (=> b!1183691 (=> res!786730 e!672987)))

(assert (=> b!1183691 (= res!786730 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44905)

(declare-fun lt!536400 () array!76469)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44905)

(declare-fun getCurrentListMapNoExtraKeys!5048 (array!76467 array!76469 (_ BitVec 32) (_ BitVec 32) V!44905 V!44905 (_ BitVec 32) Int) ListLongMap!17165)

(assert (=> b!1183691 (= lt!536404 (getCurrentListMapNoExtraKeys!5048 lt!536399 lt!536400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183691 (= lt!536400 (array!76470 (store (arr!36884 _values!996) i!673 (ValueCellFull!14207 lt!536403)) (size!37420 _values!996)))))

(declare-fun dynLambda!2999 (Int (_ BitVec 64)) V!44905)

(assert (=> b!1183691 (= lt!536403 (dynLambda!2999 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183691 (= lt!536401 (getCurrentListMapNoExtraKeys!5048 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183692 () Bool)

(declare-fun e!672984 () Bool)

(assert (=> b!1183692 (= e!672989 e!672984)))

(declare-fun res!786723 () Bool)

(assert (=> b!1183692 (=> res!786723 e!672984)))

(assert (=> b!1183692 (= res!786723 (not (= (select (arr!36883 _keys!1208) from!1455) k!934)))))

(declare-fun b!1183685 () Bool)

(declare-fun e!672991 () Bool)

(declare-fun mapRes!46577 () Bool)

(assert (=> b!1183685 (= e!672991 (and e!672985 mapRes!46577))))

(declare-fun condMapEmpty!46577 () Bool)

(declare-fun mapDefault!46577 () ValueCell!14207)

