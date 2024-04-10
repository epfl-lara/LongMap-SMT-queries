; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98742 () Bool)

(assert start!98742)

(declare-fun b_free!24347 () Bool)

(declare-fun b_next!24347 () Bool)

(assert (=> start!98742 (= b_free!24347 (not b_next!24347))))

(declare-fun tp!85751 () Bool)

(declare-fun b_and!39543 () Bool)

(assert (=> start!98742 (= tp!85751 b_and!39543)))

(declare-fun b!1150974 () Bool)

(declare-datatypes ((Unit!37856 0))(
  ( (Unit!37857) )
))
(declare-fun e!654645 () Unit!37856)

(declare-fun Unit!37858 () Unit!37856)

(assert (=> b!1150974 (= e!654645 Unit!37858)))

(declare-datatypes ((array!74601 0))(
  ( (array!74602 (arr!35951 (Array (_ BitVec 32) (_ BitVec 64))) (size!36487 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74601)

(declare-fun b!1150975 () Bool)

(declare-fun e!654635 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150975 (= e!654635 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150976 () Bool)

(declare-fun e!654648 () Bool)

(declare-fun e!654637 () Bool)

(declare-fun mapRes!45140 () Bool)

(assert (=> b!1150976 (= e!654648 (and e!654637 mapRes!45140))))

(declare-fun condMapEmpty!45140 () Bool)

(declare-datatypes ((V!43629 0))(
  ( (V!43630 (val!14495 Int)) )
))
(declare-datatypes ((ValueCell!13729 0))(
  ( (ValueCellFull!13729 (v!17132 V!43629)) (EmptyCell!13729) )
))
(declare-datatypes ((array!74603 0))(
  ( (array!74604 (arr!35952 (Array (_ BitVec 32) ValueCell!13729)) (size!36488 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74603)

(declare-fun mapDefault!45140 () ValueCell!13729)

