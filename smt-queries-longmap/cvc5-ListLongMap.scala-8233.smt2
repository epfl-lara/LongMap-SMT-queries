; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100306 () Bool)

(assert start!100306)

(declare-fun b_free!25693 () Bool)

(declare-fun b_next!25693 () Bool)

(assert (=> start!100306 (= b_free!25693 (not b_next!25693))))

(declare-fun tp!90026 () Bool)

(declare-fun b_and!42253 () Bool)

(assert (=> start!100306 (= tp!90026 b_and!42253)))

(declare-fun b!1196913 () Bool)

(declare-fun res!796565 () Bool)

(declare-fun e!679997 () Bool)

(assert (=> b!1196913 (=> (not res!796565) (not e!679997))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!77525 0))(
  ( (array!77526 (arr!37409 (Array (_ BitVec 32) (_ BitVec 64))) (size!37945 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77525)

(assert (=> b!1196913 (= res!796565 (= (select (arr!37409 _keys!1208) i!673) k!934))))

(declare-fun b!1196914 () Bool)

(declare-fun res!796562 () Bool)

(assert (=> b!1196914 (=> (not res!796562) (not e!679997))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77525 (_ BitVec 32)) Bool)

(assert (=> b!1196914 (= res!796562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47396 () Bool)

(declare-fun mapRes!47396 () Bool)

(assert (=> mapIsEmpty!47396 mapRes!47396))

(declare-fun b!1196916 () Bool)

(declare-fun e!679992 () Bool)

(declare-fun e!679995 () Bool)

(assert (=> b!1196916 (= e!679992 (not e!679995))))

(declare-fun res!796559 () Bool)

(assert (=> b!1196916 (=> res!796559 e!679995)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1196916 (= res!796559 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37945 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196916 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39688 0))(
  ( (Unit!39689) )
))
(declare-fun lt!543165 () Unit!39688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77525 (_ BitVec 64) (_ BitVec 32)) Unit!39688)

(assert (=> b!1196916 (= lt!543165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196917 () Bool)

(declare-fun res!796567 () Bool)

(assert (=> b!1196917 (=> (not res!796567) (not e!679997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196917 (= res!796567 (validMask!0 mask!1564))))

(declare-fun b!1196918 () Bool)

(declare-fun e!679993 () Bool)

(declare-fun tp_is_empty!30373 () Bool)

(assert (=> b!1196918 (= e!679993 tp_is_empty!30373)))

(declare-datatypes ((V!45625 0))(
  ( (V!45626 (val!15243 Int)) )
))
(declare-fun zeroValue!944 () V!45625)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14477 0))(
  ( (ValueCellFull!14477 (v!17881 V!45625)) (EmptyCell!14477) )
))
(declare-datatypes ((array!77527 0))(
  ( (array!77528 (arr!37410 (Array (_ BitVec 32) ValueCell!14477)) (size!37946 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77527)

(declare-fun bm!57197 () Bool)

(declare-fun minValue!944 () V!45625)

(declare-datatypes ((tuple2!19508 0))(
  ( (tuple2!19509 (_1!9765 (_ BitVec 64)) (_2!9765 V!45625)) )
))
(declare-datatypes ((List!26318 0))(
  ( (Nil!26315) (Cons!26314 (h!27523 tuple2!19508) (t!39003 List!26318)) )
))
(declare-datatypes ((ListLongMap!17477 0))(
  ( (ListLongMap!17478 (toList!8754 List!26318)) )
))
(declare-fun call!57201 () ListLongMap!17477)

(declare-fun getCurrentListMapNoExtraKeys!5194 (array!77525 array!77527 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) Int) ListLongMap!17477)

(assert (=> bm!57197 (= call!57201 (getCurrentListMapNoExtraKeys!5194 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196919 () Bool)

(declare-fun res!796560 () Bool)

(assert (=> b!1196919 (=> (not res!796560) (not e!679997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196919 (= res!796560 (validKeyInArray!0 k!934))))

(declare-fun b!1196920 () Bool)

(declare-fun res!796557 () Bool)

(assert (=> b!1196920 (=> (not res!796557) (not e!679997))))

(assert (=> b!1196920 (= res!796557 (and (= (size!37946 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37945 _keys!1208) (size!37946 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196921 () Bool)

(declare-fun e!679996 () Bool)

(declare-fun call!57200 () ListLongMap!17477)

(assert (=> b!1196921 (= e!679996 (= call!57200 call!57201))))

(declare-fun b!1196922 () Bool)

(assert (=> b!1196922 (= e!679995 true)))

(assert (=> b!1196922 e!679996))

(declare-fun c!117354 () Bool)

(assert (=> b!1196922 (= c!117354 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!543164 () Unit!39688)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!982 (array!77525 array!77527 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39688)

(assert (=> b!1196922 (= lt!543164 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!982 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196923 () Bool)

(assert (=> b!1196923 (= e!679997 e!679992)))

(declare-fun res!796564 () Bool)

(assert (=> b!1196923 (=> (not res!796564) (not e!679992))))

(declare-fun lt!543163 () array!77525)

(assert (=> b!1196923 (= res!796564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543163 mask!1564))))

(assert (=> b!1196923 (= lt!543163 (array!77526 (store (arr!37409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37945 _keys!1208)))))

(declare-fun mapNonEmpty!47396 () Bool)

(declare-fun tp!90027 () Bool)

(declare-fun e!679994 () Bool)

(assert (=> mapNonEmpty!47396 (= mapRes!47396 (and tp!90027 e!679994))))

(declare-fun mapKey!47396 () (_ BitVec 32))

(declare-fun mapValue!47396 () ValueCell!14477)

(declare-fun mapRest!47396 () (Array (_ BitVec 32) ValueCell!14477))

(assert (=> mapNonEmpty!47396 (= (arr!37410 _values!996) (store mapRest!47396 mapKey!47396 mapValue!47396))))

(declare-fun b!1196924 () Bool)

(declare-fun e!679999 () Bool)

(assert (=> b!1196924 (= e!679999 (and e!679993 mapRes!47396))))

(declare-fun condMapEmpty!47396 () Bool)

(declare-fun mapDefault!47396 () ValueCell!14477)

