; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100554 () Bool)

(assert start!100554)

(declare-fun b_free!25877 () Bool)

(declare-fun b_next!25877 () Bool)

(assert (=> start!100554 (= b_free!25877 (not b_next!25877))))

(declare-fun tp!90620 () Bool)

(declare-fun b_and!42641 () Bool)

(assert (=> start!100554 (= tp!90620 b_and!42641)))

(declare-fun b!1202369 () Bool)

(declare-fun res!800279 () Bool)

(declare-fun e!682777 () Bool)

(assert (=> b!1202369 (=> (not res!800279) (not e!682777))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202369 (= res!800279 (validKeyInArray!0 k!934))))

(declare-fun b!1202370 () Bool)

(declare-fun e!682764 () Bool)

(assert (=> b!1202370 (= e!682777 e!682764)))

(declare-fun res!800283 () Bool)

(assert (=> b!1202370 (=> (not res!800283) (not e!682764))))

(declare-datatypes ((array!77935 0))(
  ( (array!77936 (arr!37612 (Array (_ BitVec 32) (_ BitVec 64))) (size!38148 (_ BitVec 32))) )
))
(declare-fun lt!544961 () array!77935)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77935 (_ BitVec 32)) Bool)

(assert (=> b!1202370 (= res!800283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544961 mask!1564))))

(declare-fun _keys!1208 () array!77935)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202370 (= lt!544961 (array!77936 (store (arr!37612 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38148 _keys!1208)))))

(declare-fun bm!57721 () Bool)

(declare-datatypes ((V!45901 0))(
  ( (V!45902 (val!15347 Int)) )
))
(declare-datatypes ((tuple2!19666 0))(
  ( (tuple2!19667 (_1!9844 (_ BitVec 64)) (_2!9844 V!45901)) )
))
(declare-datatypes ((List!26479 0))(
  ( (Nil!26476) (Cons!26475 (h!27684 tuple2!19666) (t!39336 List!26479)) )
))
(declare-datatypes ((ListLongMap!17635 0))(
  ( (ListLongMap!17636 (toList!8833 List!26479)) )
))
(declare-fun call!57731 () ListLongMap!17635)

(declare-fun call!57725 () ListLongMap!17635)

(assert (=> bm!57721 (= call!57731 call!57725)))

(declare-fun b!1202371 () Bool)

(declare-fun e!682768 () Bool)

(declare-fun e!682766 () Bool)

(declare-fun mapRes!47714 () Bool)

(assert (=> b!1202371 (= e!682768 (and e!682766 mapRes!47714))))

(declare-fun condMapEmpty!47714 () Bool)

(declare-datatypes ((ValueCell!14581 0))(
  ( (ValueCellFull!14581 (v!17985 V!45901)) (EmptyCell!14581) )
))
(declare-datatypes ((array!77937 0))(
  ( (array!77938 (arr!37613 (Array (_ BitVec 32) ValueCell!14581)) (size!38149 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77937)

(declare-fun mapDefault!47714 () ValueCell!14581)

