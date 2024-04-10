; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96200 () Bool)

(assert start!96200)

(declare-fun b_free!22853 () Bool)

(declare-fun b_next!22853 () Bool)

(assert (=> start!96200 (= b_free!22853 (not b_next!22853))))

(declare-fun tp!80407 () Bool)

(declare-fun b_and!36381 () Bool)

(assert (=> start!96200 (= tp!80407 b_and!36381)))

(declare-fun b!1092481 () Bool)

(declare-fun res!728978 () Bool)

(declare-fun e!623889 () Bool)

(assert (=> b!1092481 (=> (not res!728978) (not e!623889))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70629 0))(
  ( (array!70630 (arr!33988 (Array (_ BitVec 32) (_ BitVec 64))) (size!34524 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70629)

(assert (=> b!1092481 (= res!728978 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34524 _keys!1070))))))

(declare-fun b!1092482 () Bool)

(declare-fun e!623892 () Bool)

(declare-fun e!623890 () Bool)

(declare-fun mapRes!42037 () Bool)

(assert (=> b!1092482 (= e!623892 (and e!623890 mapRes!42037))))

(declare-fun condMapEmpty!42037 () Bool)

(declare-datatypes ((V!40933 0))(
  ( (V!40934 (val!13484 Int)) )
))
(declare-datatypes ((ValueCell!12718 0))(
  ( (ValueCellFull!12718 (v!16105 V!40933)) (EmptyCell!12718) )
))
(declare-datatypes ((array!70631 0))(
  ( (array!70632 (arr!33989 (Array (_ BitVec 32) ValueCell!12718)) (size!34525 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70631)

(declare-fun mapDefault!42037 () ValueCell!12718)

