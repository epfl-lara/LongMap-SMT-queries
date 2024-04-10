; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100446 () Bool)

(assert start!100446)

(declare-fun b_free!25769 () Bool)

(declare-fun b_next!25769 () Bool)

(assert (=> start!100446 (= b_free!25769 (not b_next!25769))))

(declare-fun tp!90296 () Bool)

(declare-fun b_and!42425 () Bool)

(assert (=> start!100446 (= tp!90296 b_and!42425)))

(declare-fun b!1199320 () Bool)

(declare-fun res!798274 () Bool)

(declare-fun e!681192 () Bool)

(assert (=> b!1199320 (=> (not res!798274) (not e!681192))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199320 (= res!798274 (validKeyInArray!0 k!934))))

(declare-fun b!1199321 () Bool)

(declare-fun res!798275 () Bool)

(assert (=> b!1199321 (=> (not res!798275) (not e!681192))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199321 (= res!798275 (validMask!0 mask!1564))))

(declare-fun b!1199322 () Bool)

(declare-fun e!681188 () Bool)

(declare-fun e!681191 () Bool)

(declare-fun mapRes!47552 () Bool)

(assert (=> b!1199322 (= e!681188 (and e!681191 mapRes!47552))))

(declare-fun condMapEmpty!47552 () Bool)

(declare-datatypes ((V!45757 0))(
  ( (V!45758 (val!15293 Int)) )
))
(declare-datatypes ((ValueCell!14527 0))(
  ( (ValueCellFull!14527 (v!17931 V!45757)) (EmptyCell!14527) )
))
(declare-datatypes ((array!77723 0))(
  ( (array!77724 (arr!37506 (Array (_ BitVec 32) ValueCell!14527)) (size!38042 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77723)

(declare-fun mapDefault!47552 () ValueCell!14527)

