; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97030 () Bool)

(assert start!97030)

(declare-fun b!1103648 () Bool)

(declare-fun res!736290 () Bool)

(declare-fun e!630017 () Bool)

(assert (=> b!1103648 (=> (not res!736290) (not e!630017))))

(declare-datatypes ((array!71561 0))(
  ( (array!71562 (arr!34437 (Array (_ BitVec 32) (_ BitVec 64))) (size!34973 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71561)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41553 0))(
  ( (V!41554 (val!13716 Int)) )
))
(declare-datatypes ((ValueCell!12950 0))(
  ( (ValueCellFull!12950 (v!16348 V!41553)) (EmptyCell!12950) )
))
(declare-datatypes ((array!71563 0))(
  ( (array!71564 (arr!34438 (Array (_ BitVec 32) ValueCell!12950)) (size!34974 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71563)

(assert (=> b!1103648 (= res!736290 (and (= (size!34974 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34973 _keys!1208) (size!34974 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!736288 () Bool)

(assert (=> start!97030 (=> (not res!736288) (not e!630017))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97030 (= res!736288 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34973 _keys!1208))))))

(assert (=> start!97030 e!630017))

(declare-fun array_inv!26518 (array!71561) Bool)

(assert (=> start!97030 (array_inv!26518 _keys!1208)))

(assert (=> start!97030 true))

(declare-fun e!630018 () Bool)

(declare-fun array_inv!26519 (array!71563) Bool)

(assert (=> start!97030 (and (array_inv!26519 _values!996) e!630018)))

(declare-fun mapNonEmpty!42784 () Bool)

(declare-fun mapRes!42784 () Bool)

(declare-fun tp!81704 () Bool)

(declare-fun e!630021 () Bool)

(assert (=> mapNonEmpty!42784 (= mapRes!42784 (and tp!81704 e!630021))))

(declare-fun mapValue!42784 () ValueCell!12950)

(declare-fun mapKey!42784 () (_ BitVec 32))

(declare-fun mapRest!42784 () (Array (_ BitVec 32) ValueCell!12950))

(assert (=> mapNonEmpty!42784 (= (arr!34438 _values!996) (store mapRest!42784 mapKey!42784 mapValue!42784))))

(declare-fun b!1103649 () Bool)

(declare-fun e!630020 () Bool)

(assert (=> b!1103649 (= e!630018 (and e!630020 mapRes!42784))))

(declare-fun condMapEmpty!42784 () Bool)

(declare-fun mapDefault!42784 () ValueCell!12950)

