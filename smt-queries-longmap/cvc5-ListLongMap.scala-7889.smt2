; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98078 () Bool)

(assert start!98078)

(declare-fun b_free!23779 () Bool)

(declare-fun b_next!23779 () Bool)

(assert (=> start!98078 (= b_free!23779 (not b_next!23779))))

(declare-fun tp!84040 () Bool)

(declare-fun b_and!38341 () Bool)

(assert (=> start!98078 (= tp!84040 b_and!38341)))

(declare-fun b!1126402 () Bool)

(declare-fun res!752695 () Bool)

(declare-fun e!641149 () Bool)

(assert (=> b!1126402 (=> (not res!752695) (not e!641149))))

(declare-datatypes ((array!73481 0))(
  ( (array!73482 (arr!35393 (Array (_ BitVec 32) (_ BitVec 64))) (size!35929 (_ BitVec 32))) )
))
(declare-fun lt!500215 () array!73481)

(declare-datatypes ((List!24645 0))(
  ( (Nil!24642) (Cons!24641 (h!25850 (_ BitVec 64)) (t!35416 List!24645)) )
))
(declare-fun arrayNoDuplicates!0 (array!73481 (_ BitVec 32) List!24645) Bool)

(assert (=> b!1126402 (= res!752695 (arrayNoDuplicates!0 lt!500215 #b00000000000000000000000000000000 Nil!24642))))

(declare-fun b!1126403 () Bool)

(declare-fun e!641150 () Bool)

(declare-fun tp_is_empty!28309 () Bool)

(assert (=> b!1126403 (= e!641150 tp_is_empty!28309)))

(declare-fun b!1126404 () Bool)

(declare-fun e!641157 () Bool)

(declare-fun mapRes!44281 () Bool)

(assert (=> b!1126404 (= e!641157 (and e!641150 mapRes!44281))))

(declare-fun condMapEmpty!44281 () Bool)

(declare-datatypes ((V!42873 0))(
  ( (V!42874 (val!14211 Int)) )
))
(declare-datatypes ((ValueCell!13445 0))(
  ( (ValueCellFull!13445 (v!16844 V!42873)) (EmptyCell!13445) )
))
(declare-datatypes ((array!73483 0))(
  ( (array!73484 (arr!35394 (Array (_ BitVec 32) ValueCell!13445)) (size!35930 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73483)

(declare-fun mapDefault!44281 () ValueCell!13445)

