; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83550 () Bool)

(assert start!83550)

(declare-fun b_free!19537 () Bool)

(declare-fun b_next!19537 () Bool)

(assert (=> start!83550 (= b_free!19537 (not b_next!19537))))

(declare-fun tp!67898 () Bool)

(declare-fun b_and!31169 () Bool)

(assert (=> start!83550 (= tp!67898 b_and!31169)))

(declare-fun b!976293 () Bool)

(declare-fun e!550199 () Bool)

(declare-fun e!550198 () Bool)

(declare-fun mapRes!35671 () Bool)

(assert (=> b!976293 (= e!550199 (and e!550198 mapRes!35671))))

(declare-fun condMapEmpty!35671 () Bool)

(declare-datatypes ((V!34905 0))(
  ( (V!34906 (val!11271 Int)) )
))
(declare-datatypes ((ValueCell!10739 0))(
  ( (ValueCellFull!10739 (v!13830 V!34905)) (EmptyCell!10739) )
))
(declare-datatypes ((array!60911 0))(
  ( (array!60912 (arr!29319 (Array (_ BitVec 32) ValueCell!10739)) (size!29798 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60911)

(declare-fun mapDefault!35671 () ValueCell!10739)

