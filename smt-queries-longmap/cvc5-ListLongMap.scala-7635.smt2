; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96130 () Bool)

(assert start!96130)

(declare-fun b_free!22783 () Bool)

(declare-fun b_next!22783 () Bool)

(assert (=> start!96130 (= b_free!22783 (not b_next!22783))))

(declare-fun tp!80197 () Bool)

(declare-fun b_and!36241 () Bool)

(assert (=> start!96130 (= tp!80197 b_and!36241)))

(declare-fun b!1090975 () Bool)

(declare-fun e!623085 () Bool)

(declare-fun e!623090 () Bool)

(declare-fun mapRes!41932 () Bool)

(assert (=> b!1090975 (= e!623085 (and e!623090 mapRes!41932))))

(declare-fun condMapEmpty!41932 () Bool)

(declare-datatypes ((V!40841 0))(
  ( (V!40842 (val!13449 Int)) )
))
(declare-datatypes ((ValueCell!12683 0))(
  ( (ValueCellFull!12683 (v!16070 V!40841)) (EmptyCell!12683) )
))
(declare-datatypes ((array!70491 0))(
  ( (array!70492 (arr!33919 (Array (_ BitVec 32) ValueCell!12683)) (size!34455 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70491)

(declare-fun mapDefault!41932 () ValueCell!12683)

