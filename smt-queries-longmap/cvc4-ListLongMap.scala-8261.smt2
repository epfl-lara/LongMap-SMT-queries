; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100518 () Bool)

(assert start!100518)

(declare-fun b_free!25841 () Bool)

(declare-fun b_next!25841 () Bool)

(assert (=> start!100518 (= b_free!25841 (not b_next!25841))))

(declare-fun tp!90512 () Bool)

(declare-fun b_and!42569 () Bool)

(assert (=> start!100518 (= tp!90512 b_and!42569)))

(declare-fun b!1201053 () Bool)

(declare-fun e!682053 () Bool)

(declare-datatypes ((V!45853 0))(
  ( (V!45854 (val!15329 Int)) )
))
(declare-datatypes ((tuple2!19630 0))(
  ( (tuple2!19631 (_1!9826 (_ BitVec 64)) (_2!9826 V!45853)) )
))
(declare-datatypes ((List!26448 0))(
  ( (Nil!26445) (Cons!26444 (h!27653 tuple2!19630) (t!39269 List!26448)) )
))
(declare-datatypes ((ListLongMap!17599 0))(
  ( (ListLongMap!17600 (toList!8815 List!26448)) )
))
(declare-fun call!57352 () ListLongMap!17599)

(declare-fun call!57353 () ListLongMap!17599)

(assert (=> b!1201053 (= e!682053 (= call!57352 call!57353))))

(declare-fun b!1201054 () Bool)

(declare-fun e!682050 () Bool)

(declare-fun e!682049 () Bool)

(assert (=> b!1201054 (= e!682050 (not e!682049))))

(declare-fun res!799540 () Bool)

(assert (=> b!1201054 (=> res!799540 e!682049)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201054 (= res!799540 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77863 0))(
  ( (array!77864 (arr!37576 (Array (_ BitVec 32) (_ BitVec 64))) (size!38112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77863)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201054 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39818 0))(
  ( (Unit!39819) )
))
(declare-fun lt!544276 () Unit!39818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77863 (_ BitVec 64) (_ BitVec 32)) Unit!39818)

(assert (=> b!1201054 (= lt!544276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1201055 () Bool)

(declare-fun e!682051 () Bool)

(assert (=> b!1201055 (= e!682049 e!682051)))

(declare-fun res!799541 () Bool)

(assert (=> b!1201055 (=> res!799541 e!682051)))

(assert (=> b!1201055 (= res!799541 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45853)

(declare-datatypes ((ValueCell!14563 0))(
  ( (ValueCellFull!14563 (v!17967 V!45853)) (EmptyCell!14563) )
))
(declare-datatypes ((array!77865 0))(
  ( (array!77866 (arr!37577 (Array (_ BitVec 32) ValueCell!14563)) (size!38113 (_ BitVec 32))) )
))
(declare-fun lt!544277 () array!77865)

(declare-fun lt!544274 () array!77863)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!544273 () ListLongMap!17599)

(declare-fun minValue!944 () V!45853)

(declare-fun getCurrentListMapNoExtraKeys!5254 (array!77863 array!77865 (_ BitVec 32) (_ BitVec 32) V!45853 V!45853 (_ BitVec 32) Int) ListLongMap!17599)

(assert (=> b!1201055 (= lt!544273 (getCurrentListMapNoExtraKeys!5254 lt!544274 lt!544277 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77865)

(declare-fun dynLambda!3171 (Int (_ BitVec 64)) V!45853)

(assert (=> b!1201055 (= lt!544277 (array!77866 (store (arr!37577 _values!996) i!673 (ValueCellFull!14563 (dynLambda!3171 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38113 _values!996)))))

(declare-fun lt!544275 () ListLongMap!17599)

(assert (=> b!1201055 (= lt!544275 (getCurrentListMapNoExtraKeys!5254 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201056 () Bool)

(declare-fun res!799536 () Bool)

(declare-fun e!682055 () Bool)

(assert (=> b!1201056 (=> (not res!799536) (not e!682055))))

(declare-datatypes ((List!26449 0))(
  ( (Nil!26446) (Cons!26445 (h!27654 (_ BitVec 64)) (t!39270 List!26449)) )
))
(declare-fun arrayNoDuplicates!0 (array!77863 (_ BitVec 32) List!26449) Bool)

(assert (=> b!1201056 (= res!799536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26446))))

(declare-fun b!1201057 () Bool)

(assert (=> b!1201057 (= e!682055 e!682050)))

(declare-fun res!799539 () Bool)

(assert (=> b!1201057 (=> (not res!799539) (not e!682050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77863 (_ BitVec 32)) Bool)

(assert (=> b!1201057 (= res!799539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544274 mask!1564))))

(assert (=> b!1201057 (= lt!544274 (array!77864 (store (arr!37576 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38112 _keys!1208)))))

(declare-fun b!1201058 () Bool)

(declare-fun e!682057 () Bool)

(declare-fun e!682052 () Bool)

(declare-fun mapRes!47660 () Bool)

(assert (=> b!1201058 (= e!682057 (and e!682052 mapRes!47660))))

(declare-fun condMapEmpty!47660 () Bool)

(declare-fun mapDefault!47660 () ValueCell!14563)

