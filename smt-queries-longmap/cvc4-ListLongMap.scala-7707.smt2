; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96802 () Bool)

(assert start!96802)

(declare-fun b_free!23171 () Bool)

(declare-fun b_next!23171 () Bool)

(assert (=> start!96802 (= b_free!23171 (not b_next!23171))))

(declare-fun tp!81463 () Bool)

(declare-fun b_and!37117 () Bool)

(assert (=> start!96802 (= tp!81463 b_and!37117)))

(declare-fun res!734839 () Bool)

(declare-fun e!628543 () Bool)

(assert (=> start!96802 (=> (not res!734839) (not e!628543))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96802 (= res!734839 (validMask!0 mask!1414))))

(assert (=> start!96802 e!628543))

(assert (=> start!96802 tp!81463))

(assert (=> start!96802 true))

(declare-fun tp_is_empty!27221 () Bool)

(assert (=> start!96802 tp_is_empty!27221))

(declare-datatypes ((array!71361 0))(
  ( (array!71362 (arr!34344 (Array (_ BitVec 32) (_ BitVec 64))) (size!34880 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71361)

(declare-fun array_inv!26452 (array!71361) Bool)

(assert (=> start!96802 (array_inv!26452 _keys!1070)))

(declare-datatypes ((V!41421 0))(
  ( (V!41422 (val!13667 Int)) )
))
(declare-datatypes ((ValueCell!12901 0))(
  ( (ValueCellFull!12901 (v!16296 V!41421)) (EmptyCell!12901) )
))
(declare-datatypes ((array!71363 0))(
  ( (array!71364 (arr!34345 (Array (_ BitVec 32) ValueCell!12901)) (size!34881 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71363)

(declare-fun e!628540 () Bool)

(declare-fun array_inv!26453 (array!71363) Bool)

(assert (=> start!96802 (and (array_inv!26453 _values!874) e!628540)))

(declare-fun b!1101221 () Bool)

(declare-fun e!628544 () Bool)

(assert (=> b!1101221 (= e!628543 e!628544)))

(declare-fun res!734836 () Bool)

(assert (=> b!1101221 (=> (not res!734836) (not e!628544))))

(declare-fun lt!493659 () array!71361)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71361 (_ BitVec 32)) Bool)

(assert (=> b!1101221 (= res!734836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493659 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101221 (= lt!493659 (array!71362 (store (arr!34344 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34880 _keys!1070)))))

(declare-fun b!1101222 () Bool)

(declare-fun e!628541 () Bool)

(assert (=> b!1101222 (= e!628541 tp_is_empty!27221)))

(declare-fun b!1101223 () Bool)

(declare-fun mapRes!42616 () Bool)

(assert (=> b!1101223 (= e!628540 (and e!628541 mapRes!42616))))

(declare-fun condMapEmpty!42616 () Bool)

(declare-fun mapDefault!42616 () ValueCell!12901)

