; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97982 () Bool)

(assert start!97982)

(declare-fun b_free!23683 () Bool)

(declare-fun b_next!23683 () Bool)

(assert (=> start!97982 (= b_free!23683 (not b_next!23683))))

(declare-fun tp!83753 () Bool)

(declare-fun b_and!38149 () Bool)

(assert (=> start!97982 (= tp!83753 b_and!38149)))

(declare-fun b!1123534 () Bool)

(declare-fun res!750651 () Bool)

(declare-fun e!639621 () Bool)

(assert (=> b!1123534 (=> (not res!750651) (not e!639621))))

(declare-datatypes ((array!73295 0))(
  ( (array!73296 (arr!35300 (Array (_ BitVec 32) (_ BitVec 64))) (size!35836 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73295)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42745 0))(
  ( (V!42746 (val!14163 Int)) )
))
(declare-datatypes ((ValueCell!13397 0))(
  ( (ValueCellFull!13397 (v!16796 V!42745)) (EmptyCell!13397) )
))
(declare-datatypes ((array!73297 0))(
  ( (array!73298 (arr!35301 (Array (_ BitVec 32) ValueCell!13397)) (size!35837 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73297)

(assert (=> b!1123534 (= res!750651 (and (= (size!35837 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35836 _keys!1208) (size!35837 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123535 () Bool)

(declare-fun e!639622 () Bool)

(declare-fun e!639627 () Bool)

(declare-fun mapRes!44137 () Bool)

(assert (=> b!1123535 (= e!639622 (and e!639627 mapRes!44137))))

(declare-fun condMapEmpty!44137 () Bool)

(declare-fun mapDefault!44137 () ValueCell!13397)

