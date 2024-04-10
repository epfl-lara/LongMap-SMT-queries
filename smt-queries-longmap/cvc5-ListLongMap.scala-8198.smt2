; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100054 () Bool)

(assert start!100054)

(declare-fun b_free!25633 () Bool)

(declare-fun b_next!25633 () Bool)

(assert (=> start!100054 (= b_free!25633 (not b_next!25633))))

(declare-fun tp!89612 () Bool)

(declare-fun b_and!42133 () Bool)

(assert (=> start!100054 (= tp!89612 b_and!42133)))

(declare-fun b!1192549 () Bool)

(declare-fun res!793332 () Bool)

(declare-fun e!677842 () Bool)

(assert (=> b!1192549 (=> (not res!793332) (not e!677842))))

(declare-datatypes ((array!77111 0))(
  ( (array!77112 (arr!37205 (Array (_ BitVec 32) (_ BitVec 64))) (size!37741 (_ BitVec 32))) )
))
(declare-fun lt!542261 () array!77111)

(declare-datatypes ((List!26201 0))(
  ( (Nil!26198) (Cons!26197 (h!27406 (_ BitVec 64)) (t!38826 List!26201)) )
))
(declare-fun arrayNoDuplicates!0 (array!77111 (_ BitVec 32) List!26201) Bool)

(assert (=> b!1192549 (= res!793332 (arrayNoDuplicates!0 lt!542261 #b00000000000000000000000000000000 Nil!26198))))

(declare-fun b!1192550 () Bool)

(declare-fun res!793334 () Bool)

(declare-fun e!677835 () Bool)

(assert (=> b!1192550 (=> (not res!793334) (not e!677835))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192550 (= res!793334 (validMask!0 mask!1564))))

(declare-fun b!1192551 () Bool)

(declare-fun e!677838 () Bool)

(declare-fun e!677837 () Bool)

(assert (=> b!1192551 (= e!677838 e!677837)))

(declare-fun res!793330 () Bool)

(assert (=> b!1192551 (=> res!793330 e!677837)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192551 (= res!793330 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45345 0))(
  ( (V!45346 (val!15138 Int)) )
))
(declare-fun zeroValue!944 () V!45345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14372 0))(
  ( (ValueCellFull!14372 (v!17776 V!45345)) (EmptyCell!14372) )
))
(declare-datatypes ((array!77113 0))(
  ( (array!77114 (arr!37206 (Array (_ BitVec 32) ValueCell!14372)) (size!37742 (_ BitVec 32))) )
))
(declare-fun lt!542257 () array!77113)

(declare-datatypes ((tuple2!19458 0))(
  ( (tuple2!19459 (_1!9740 (_ BitVec 64)) (_2!9740 V!45345)) )
))
(declare-datatypes ((List!26202 0))(
  ( (Nil!26199) (Cons!26198 (h!27407 tuple2!19458) (t!38827 List!26202)) )
))
(declare-datatypes ((ListLongMap!17427 0))(
  ( (ListLongMap!17428 (toList!8729 List!26202)) )
))
(declare-fun lt!542259 () ListLongMap!17427)

(declare-fun minValue!944 () V!45345)

(declare-fun getCurrentListMapNoExtraKeys!5170 (array!77111 array!77113 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) Int) ListLongMap!17427)

(assert (=> b!1192551 (= lt!542259 (getCurrentListMapNoExtraKeys!5170 lt!542261 lt!542257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77113)

(declare-fun dynLambda!3101 (Int (_ BitVec 64)) V!45345)

(assert (=> b!1192551 (= lt!542257 (array!77114 (store (arr!37206 _values!996) i!673 (ValueCellFull!14372 (dynLambda!3101 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37742 _values!996)))))

(declare-fun _keys!1208 () array!77111)

(declare-fun lt!542262 () ListLongMap!17427)

(assert (=> b!1192551 (= lt!542262 (getCurrentListMapNoExtraKeys!5170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192552 () Bool)

(declare-fun res!793335 () Bool)

(assert (=> b!1192552 (=> (not res!793335) (not e!677835))))

(assert (=> b!1192552 (= res!793335 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26198))))

(declare-fun b!1192553 () Bool)

(assert (=> b!1192553 (= e!677837 true)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1754 (ListLongMap!17427 (_ BitVec 64)) ListLongMap!17427)

(assert (=> b!1192553 (= (getCurrentListMapNoExtraKeys!5170 lt!542261 lt!542257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1754 (getCurrentListMapNoExtraKeys!5170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39562 0))(
  ( (Unit!39563) )
))
(declare-fun lt!542258 () Unit!39562)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!963 (array!77111 array!77113 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39562)

(assert (=> b!1192553 (= lt!542258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!963 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47072 () Bool)

(declare-fun mapRes!47072 () Bool)

(declare-fun tp!89613 () Bool)

(declare-fun e!677839 () Bool)

(assert (=> mapNonEmpty!47072 (= mapRes!47072 (and tp!89613 e!677839))))

(declare-fun mapRest!47072 () (Array (_ BitVec 32) ValueCell!14372))

(declare-fun mapValue!47072 () ValueCell!14372)

(declare-fun mapKey!47072 () (_ BitVec 32))

(assert (=> mapNonEmpty!47072 (= (arr!37206 _values!996) (store mapRest!47072 mapKey!47072 mapValue!47072))))

(declare-fun b!1192554 () Bool)

(declare-fun e!677841 () Bool)

(declare-fun e!677836 () Bool)

(assert (=> b!1192554 (= e!677841 (and e!677836 mapRes!47072))))

(declare-fun condMapEmpty!47072 () Bool)

(declare-fun mapDefault!47072 () ValueCell!14372)

