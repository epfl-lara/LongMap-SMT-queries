; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96964 () Bool)

(assert start!96964)

(declare-fun mapIsEmpty!42721 () Bool)

(declare-fun mapRes!42721 () Bool)

(assert (=> mapIsEmpty!42721 mapRes!42721))

(declare-fun b!1103127 () Bool)

(declare-fun res!735970 () Bool)

(declare-fun e!629674 () Bool)

(assert (=> b!1103127 (=> (not res!735970) (not e!629674))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103127 (= res!735970 (validMask!0 mask!1564))))

(declare-fun b!1103128 () Bool)

(declare-fun e!629676 () Bool)

(declare-fun tp_is_empty!27283 () Bool)

(assert (=> b!1103128 (= e!629676 tp_is_empty!27283)))

(declare-fun b!1103129 () Bool)

(declare-fun e!629673 () Bool)

(declare-fun e!629677 () Bool)

(assert (=> b!1103129 (= e!629673 (and e!629677 mapRes!42721))))

(declare-fun condMapEmpty!42721 () Bool)

(declare-datatypes ((V!41505 0))(
  ( (V!41506 (val!13698 Int)) )
))
(declare-datatypes ((ValueCell!12932 0))(
  ( (ValueCellFull!12932 (v!16329 V!41505)) (EmptyCell!12932) )
))
(declare-datatypes ((array!71487 0))(
  ( (array!71488 (arr!34403 (Array (_ BitVec 32) ValueCell!12932)) (size!34939 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71487)

(declare-fun mapDefault!42721 () ValueCell!12932)

