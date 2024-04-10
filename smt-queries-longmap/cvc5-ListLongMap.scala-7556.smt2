; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95656 () Bool)

(assert start!95656)

(declare-fun b_free!22309 () Bool)

(declare-fun b_next!22309 () Bool)

(assert (=> start!95656 (= b_free!22309 (not b_next!22309))))

(declare-fun tp!78776 () Bool)

(declare-fun b_and!35293 () Bool)

(assert (=> start!95656 (= tp!78776 b_and!35293)))

(declare-fun mapIsEmpty!41221 () Bool)

(declare-fun mapRes!41221 () Bool)

(assert (=> mapIsEmpty!41221 mapRes!41221))

(declare-fun b!1081083 () Bool)

(declare-fun e!617958 () Bool)

(declare-fun e!617961 () Bool)

(assert (=> b!1081083 (= e!617958 (and e!617961 mapRes!41221))))

(declare-fun condMapEmpty!41221 () Bool)

(declare-datatypes ((V!40209 0))(
  ( (V!40210 (val!13212 Int)) )
))
(declare-datatypes ((ValueCell!12446 0))(
  ( (ValueCellFull!12446 (v!15833 V!40209)) (EmptyCell!12446) )
))
(declare-datatypes ((array!69571 0))(
  ( (array!69572 (arr!33459 (Array (_ BitVec 32) ValueCell!12446)) (size!33995 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69571)

(declare-fun mapDefault!41221 () ValueCell!12446)

