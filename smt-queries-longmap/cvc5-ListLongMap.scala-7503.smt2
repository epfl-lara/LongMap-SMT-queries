; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95098 () Bool)

(assert start!95098)

(declare-fun b_free!22195 () Bool)

(declare-fun b_next!22195 () Bool)

(assert (=> start!95098 (= b_free!22195 (not b_next!22195))))

(declare-fun tp!78067 () Bool)

(declare-fun b_and!35115 () Bool)

(assert (=> start!95098 (= tp!78067 b_and!35115)))

(declare-fun b!1075039 () Bool)

(declare-fun e!614353 () Bool)

(declare-fun e!614355 () Bool)

(declare-fun mapRes!40738 () Bool)

(assert (=> b!1075039 (= e!614353 (and e!614355 mapRes!40738))))

(declare-fun condMapEmpty!40738 () Bool)

(declare-datatypes ((V!39809 0))(
  ( (V!39810 (val!13053 Int)) )
))
(declare-datatypes ((ValueCell!12299 0))(
  ( (ValueCellFull!12299 (v!15676 V!39809)) (EmptyCell!12299) )
))
(declare-datatypes ((array!68979 0))(
  ( (array!68980 (arr!33177 (Array (_ BitVec 32) ValueCell!12299)) (size!33713 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68979)

(declare-fun mapDefault!40738 () ValueCell!12299)

