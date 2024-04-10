; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100544 () Bool)

(assert start!100544)

(declare-fun b_free!25867 () Bool)

(declare-fun b_next!25867 () Bool)

(assert (=> start!100544 (= b_free!25867 (not b_next!25867))))

(declare-fun tp!90591 () Bool)

(declare-fun b_and!42621 () Bool)

(assert (=> start!100544 (= tp!90591 b_and!42621)))

(declare-fun b!1201984 () Bool)

(declare-fun e!682566 () Bool)

(declare-fun e!682567 () Bool)

(assert (=> b!1201984 (= e!682566 (not e!682567))))

(declare-fun res!800079 () Bool)

(assert (=> b!1201984 (=> res!800079 e!682567)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201984 (= res!800079 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77915 0))(
  ( (array!77916 (arr!37602 (Array (_ BitVec 32) (_ BitVec 64))) (size!38138 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77915)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201984 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39850 0))(
  ( (Unit!39851) )
))
(declare-fun lt!544754 () Unit!39850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77915 (_ BitVec 64) (_ BitVec 32)) Unit!39850)

(assert (=> b!1201984 (= lt!544754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1201985 () Bool)

(declare-fun e!682565 () Unit!39850)

(declare-fun lt!544758 () Unit!39850)

(assert (=> b!1201985 (= e!682565 lt!544758)))

(declare-fun call!57608 () Unit!39850)

(assert (=> b!1201985 (= lt!544758 call!57608)))

(declare-fun call!57611 () Bool)

(assert (=> b!1201985 call!57611))

(declare-fun b!1201986 () Bool)

(declare-fun e!682559 () Bool)

(assert (=> b!1201986 (= e!682559 e!682566)))

(declare-fun res!800074 () Bool)

(assert (=> b!1201986 (=> (not res!800074) (not e!682566))))

(declare-fun lt!544759 () array!77915)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77915 (_ BitVec 32)) Bool)

(assert (=> b!1201986 (= res!800074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544759 mask!1564))))

(assert (=> b!1201986 (= lt!544759 (array!77916 (store (arr!37602 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38138 _keys!1208)))))

(declare-datatypes ((V!45889 0))(
  ( (V!45890 (val!15342 Int)) )
))
(declare-fun zeroValue!944 () V!45889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14576 0))(
  ( (ValueCellFull!14576 (v!17980 V!45889)) (EmptyCell!14576) )
))
(declare-datatypes ((array!77917 0))(
  ( (array!77918 (arr!37603 (Array (_ BitVec 32) ValueCell!14576)) (size!38139 (_ BitVec 32))) )
))
(declare-fun lt!544756 () array!77917)

(declare-datatypes ((tuple2!19656 0))(
  ( (tuple2!19657 (_1!9839 (_ BitVec 64)) (_2!9839 V!45889)) )
))
(declare-datatypes ((List!26471 0))(
  ( (Nil!26468) (Cons!26467 (h!27676 tuple2!19656) (t!39318 List!26471)) )
))
(declare-datatypes ((ListLongMap!17625 0))(
  ( (ListLongMap!17626 (toList!8828 List!26471)) )
))
(declare-fun call!57610 () ListLongMap!17625)

(declare-fun bm!57601 () Bool)

(declare-fun minValue!944 () V!45889)

(declare-fun getCurrentListMapNoExtraKeys!5266 (array!77915 array!77917 (_ BitVec 32) (_ BitVec 32) V!45889 V!45889 (_ BitVec 32) Int) ListLongMap!17625)

(assert (=> bm!57601 (= call!57610 (getCurrentListMapNoExtraKeys!5266 lt!544759 lt!544756 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201987 () Bool)

(declare-fun e!682561 () Bool)

(declare-fun e!682563 () Bool)

(declare-fun mapRes!47699 () Bool)

(assert (=> b!1201987 (= e!682561 (and e!682563 mapRes!47699))))

(declare-fun condMapEmpty!47699 () Bool)

(declare-fun _values!996 () array!77917)

(declare-fun mapDefault!47699 () ValueCell!14576)

