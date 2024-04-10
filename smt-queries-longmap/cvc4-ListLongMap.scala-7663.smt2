; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96302 () Bool)

(assert start!96302)

(declare-fun b!1094415 () Bool)

(declare-fun res!730351 () Bool)

(declare-fun e!624809 () Bool)

(assert (=> b!1094415 (=> (not res!730351) (not e!624809))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70829 0))(
  ( (array!70830 (arr!34088 (Array (_ BitVec 32) (_ BitVec 64))) (size!34624 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70829)

(assert (=> b!1094415 (= res!730351 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34624 _keys!1070))))))

(declare-fun b!1094416 () Bool)

(declare-fun res!730359 () Bool)

(assert (=> b!1094416 (=> (not res!730359) (not e!624809))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1094416 (= res!730359 (= (select (arr!34088 _keys!1070) i!650) k!904))))

(declare-fun b!1094417 () Bool)

(declare-fun res!730354 () Bool)

(assert (=> b!1094417 (=> (not res!730354) (not e!624809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094417 (= res!730354 (validKeyInArray!0 k!904))))

(declare-fun b!1094418 () Bool)

(declare-fun e!624808 () Bool)

(declare-fun e!624810 () Bool)

(declare-fun mapRes!42190 () Bool)

(assert (=> b!1094418 (= e!624808 (and e!624810 mapRes!42190))))

(declare-fun condMapEmpty!42190 () Bool)

(declare-datatypes ((V!41069 0))(
  ( (V!41070 (val!13535 Int)) )
))
(declare-datatypes ((ValueCell!12769 0))(
  ( (ValueCellFull!12769 (v!16156 V!41069)) (EmptyCell!12769) )
))
(declare-datatypes ((array!70831 0))(
  ( (array!70832 (arr!34089 (Array (_ BitVec 32) ValueCell!12769)) (size!34625 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70831)

(declare-fun mapDefault!42190 () ValueCell!12769)

