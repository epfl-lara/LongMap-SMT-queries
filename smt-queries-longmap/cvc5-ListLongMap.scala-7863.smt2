; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97922 () Bool)

(assert start!97922)

(declare-fun b_free!23623 () Bool)

(declare-fun b_next!23623 () Bool)

(assert (=> start!97922 (= b_free!23623 (not b_next!23623))))

(declare-fun tp!83573 () Bool)

(declare-fun b_and!38029 () Bool)

(assert (=> start!97922 (= tp!83573 b_and!38029)))

(declare-fun b!1121852 () Bool)

(declare-fun res!749470 () Bool)

(declare-fun e!638731 () Bool)

(assert (=> b!1121852 (=> (not res!749470) (not e!638731))))

(declare-datatypes ((array!73187 0))(
  ( (array!73188 (arr!35246 (Array (_ BitVec 32) (_ BitVec 64))) (size!35782 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73187)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42665 0))(
  ( (V!42666 (val!14133 Int)) )
))
(declare-datatypes ((ValueCell!13367 0))(
  ( (ValueCellFull!13367 (v!16766 V!42665)) (EmptyCell!13367) )
))
(declare-datatypes ((array!73189 0))(
  ( (array!73190 (arr!35247 (Array (_ BitVec 32) ValueCell!13367)) (size!35783 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73189)

(assert (=> b!1121852 (= res!749470 (and (= (size!35783 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35782 _keys!1208) (size!35783 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121853 () Bool)

(declare-fun e!638733 () Bool)

(declare-fun e!638729 () Bool)

(declare-fun mapRes!44047 () Bool)

(assert (=> b!1121853 (= e!638733 (and e!638729 mapRes!44047))))

(declare-fun condMapEmpty!44047 () Bool)

(declare-fun mapDefault!44047 () ValueCell!13367)

