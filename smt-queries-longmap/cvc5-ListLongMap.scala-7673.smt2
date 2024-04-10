; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96384 () Bool)

(assert start!96384)

(declare-fun b_free!22963 () Bool)

(declare-fun b_next!22963 () Bool)

(assert (=> start!96384 (= b_free!22963 (not b_next!22963))))

(declare-fun tp!80816 () Bool)

(declare-fun b_and!36589 () Bool)

(assert (=> start!96384 (= tp!80816 b_and!36589)))

(declare-fun b!1095383 () Bool)

(declare-fun res!731018 () Bool)

(declare-fun e!625362 () Bool)

(assert (=> b!1095383 (=> (not res!731018) (not e!625362))))

(declare-datatypes ((array!70939 0))(
  ( (array!70940 (arr!34141 (Array (_ BitVec 32) (_ BitVec 64))) (size!34677 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70939)

(declare-datatypes ((List!23840 0))(
  ( (Nil!23837) (Cons!23836 (h!25045 (_ BitVec 64)) (t!33849 List!23840)) )
))
(declare-fun arrayNoDuplicates!0 (array!70939 (_ BitVec 32) List!23840) Bool)

(assert (=> b!1095383 (= res!731018 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23837))))

(declare-fun b!1095384 () Bool)

(declare-fun e!625363 () Bool)

(declare-fun tp_is_empty!27013 () Bool)

(assert (=> b!1095384 (= e!625363 tp_is_empty!27013)))

(declare-fun b!1095385 () Bool)

(declare-fun e!625359 () Bool)

(declare-fun e!625360 () Bool)

(declare-fun mapRes!42280 () Bool)

(assert (=> b!1095385 (= e!625359 (and e!625360 mapRes!42280))))

(declare-fun condMapEmpty!42280 () Bool)

(declare-datatypes ((V!41145 0))(
  ( (V!41146 (val!13563 Int)) )
))
(declare-datatypes ((ValueCell!12797 0))(
  ( (ValueCellFull!12797 (v!16184 V!41145)) (EmptyCell!12797) )
))
(declare-datatypes ((array!70941 0))(
  ( (array!70942 (arr!34142 (Array (_ BitVec 32) ValueCell!12797)) (size!34678 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70941)

(declare-fun mapDefault!42280 () ValueCell!12797)

