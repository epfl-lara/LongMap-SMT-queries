; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96460 () Bool)

(assert start!96460)

(declare-fun b_free!23039 () Bool)

(declare-fun b_next!23039 () Bool)

(assert (=> start!96460 (= b_free!23039 (not b_next!23039))))

(declare-fun tp!81043 () Bool)

(declare-fun b_and!36741 () Bool)

(assert (=> start!96460 (= tp!81043 b_and!36741)))

(declare-fun res!732051 () Bool)

(declare-fun e!626047 () Bool)

(assert (=> start!96460 (=> (not res!732051) (not e!626047))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96460 (= res!732051 (validMask!0 mask!1414))))

(assert (=> start!96460 e!626047))

(assert (=> start!96460 tp!81043))

(assert (=> start!96460 true))

(declare-fun tp_is_empty!27089 () Bool)

(assert (=> start!96460 tp_is_empty!27089))

(declare-datatypes ((array!71091 0))(
  ( (array!71092 (arr!34217 (Array (_ BitVec 32) (_ BitVec 64))) (size!34753 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71091)

(declare-fun array_inv!26362 (array!71091) Bool)

(assert (=> start!96460 (array_inv!26362 _keys!1070)))

(declare-datatypes ((V!41245 0))(
  ( (V!41246 (val!13601 Int)) )
))
(declare-datatypes ((ValueCell!12835 0))(
  ( (ValueCellFull!12835 (v!16222 V!41245)) (EmptyCell!12835) )
))
(declare-datatypes ((array!71093 0))(
  ( (array!71094 (arr!34218 (Array (_ BitVec 32) ValueCell!12835)) (size!34754 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71093)

(declare-fun e!626042 () Bool)

(declare-fun array_inv!26363 (array!71093) Bool)

(assert (=> start!96460 (and (array_inv!26363 _values!874) e!626042)))

(declare-fun b!1096826 () Bool)

(declare-fun res!732049 () Bool)

(assert (=> b!1096826 (=> (not res!732049) (not e!626047))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096826 (= res!732049 (validKeyInArray!0 k!904))))

(declare-fun b!1096827 () Bool)

(declare-fun e!626043 () Bool)

(declare-fun mapRes!42394 () Bool)

(assert (=> b!1096827 (= e!626042 (and e!626043 mapRes!42394))))

(declare-fun condMapEmpty!42394 () Bool)

(declare-fun mapDefault!42394 () ValueCell!12835)

