; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96952 () Bool)

(assert start!96952)

(declare-fun res!735930 () Bool)

(declare-fun e!629583 () Bool)

(assert (=> start!96952 (=> (not res!735930) (not e!629583))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71465 0))(
  ( (array!71466 (arr!34392 (Array (_ BitVec 32) (_ BitVec 64))) (size!34928 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71465)

(assert (=> start!96952 (= res!735930 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34928 _keys!1208))))))

(assert (=> start!96952 e!629583))

(declare-fun array_inv!26488 (array!71465) Bool)

(assert (=> start!96952 (array_inv!26488 _keys!1208)))

(assert (=> start!96952 true))

(declare-datatypes ((V!41489 0))(
  ( (V!41490 (val!13692 Int)) )
))
(declare-datatypes ((ValueCell!12926 0))(
  ( (ValueCellFull!12926 (v!16323 V!41489)) (EmptyCell!12926) )
))
(declare-datatypes ((array!71467 0))(
  ( (array!71468 (arr!34393 (Array (_ BitVec 32) ValueCell!12926)) (size!34929 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71467)

(declare-fun e!629587 () Bool)

(declare-fun array_inv!26489 (array!71467) Bool)

(assert (=> start!96952 (and (array_inv!26489 _values!996) e!629587)))

(declare-fun b!1103033 () Bool)

(declare-fun e!629584 () Bool)

(declare-fun mapRes!42703 () Bool)

(assert (=> b!1103033 (= e!629587 (and e!629584 mapRes!42703))))

(declare-fun condMapEmpty!42703 () Bool)

(declare-fun mapDefault!42703 () ValueCell!12926)

