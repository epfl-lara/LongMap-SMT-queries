; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99292 () Bool)

(assert start!99292)

(declare-fun b_free!24871 () Bool)

(declare-fun b_next!24871 () Bool)

(assert (=> start!99292 (= b_free!24871 (not b_next!24871))))

(declare-fun tp!87326 () Bool)

(declare-fun b_and!40609 () Bool)

(assert (=> start!99292 (= tp!87326 b_and!40609)))

(declare-fun b!1169842 () Bool)

(declare-fun e!664886 () Bool)

(declare-fun e!664883 () Bool)

(declare-fun mapRes!45929 () Bool)

(assert (=> b!1169842 (= e!664886 (and e!664883 mapRes!45929))))

(declare-fun condMapEmpty!45929 () Bool)

(declare-datatypes ((V!44329 0))(
  ( (V!44330 (val!14757 Int)) )
))
(declare-datatypes ((ValueCell!13991 0))(
  ( (ValueCellFull!13991 (v!17395 V!44329)) (EmptyCell!13991) )
))
(declare-datatypes ((array!75625 0))(
  ( (array!75626 (arr!36462 (Array (_ BitVec 32) ValueCell!13991)) (size!36998 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75625)

(declare-fun mapDefault!45929 () ValueCell!13991)

