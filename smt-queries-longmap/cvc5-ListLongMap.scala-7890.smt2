; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98084 () Bool)

(assert start!98084)

(declare-fun b_free!23785 () Bool)

(declare-fun b_next!23785 () Bool)

(assert (=> start!98084 (= b_free!23785 (not b_next!23785))))

(declare-fun tp!84059 () Bool)

(declare-fun b_and!38353 () Bool)

(assert (=> start!98084 (= tp!84059 b_and!38353)))

(declare-fun b!1126570 () Bool)

(declare-fun res!752813 () Bool)

(declare-fun e!641240 () Bool)

(assert (=> b!1126570 (=> (not res!752813) (not e!641240))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73493 0))(
  ( (array!73494 (arr!35399 (Array (_ BitVec 32) (_ BitVec 64))) (size!35935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73493)

(assert (=> b!1126570 (= res!752813 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35935 _keys!1208))))))

(declare-fun b!1126571 () Bool)

(declare-fun res!752814 () Bool)

(assert (=> b!1126571 (=> (not res!752814) (not e!641240))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1126571 (= res!752814 (= (select (arr!35399 _keys!1208) i!673) k!934))))

(declare-fun b!1126572 () Bool)

(declare-fun res!752817 () Bool)

(assert (=> b!1126572 (=> (not res!752817) (not e!641240))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42881 0))(
  ( (V!42882 (val!14214 Int)) )
))
(declare-datatypes ((ValueCell!13448 0))(
  ( (ValueCellFull!13448 (v!16847 V!42881)) (EmptyCell!13448) )
))
(declare-datatypes ((array!73495 0))(
  ( (array!73496 (arr!35400 (Array (_ BitVec 32) ValueCell!13448)) (size!35936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73495)

(assert (=> b!1126572 (= res!752817 (and (= (size!35936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35935 _keys!1208) (size!35936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126573 () Bool)

(declare-fun e!641247 () Bool)

(declare-fun e!641245 () Bool)

(declare-fun mapRes!44290 () Bool)

(assert (=> b!1126573 (= e!641247 (and e!641245 mapRes!44290))))

(declare-fun condMapEmpty!44290 () Bool)

(declare-fun mapDefault!44290 () ValueCell!13448)

