; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83560 () Bool)

(assert start!83560)

(declare-fun b_free!19547 () Bool)

(declare-fun b_next!19547 () Bool)

(assert (=> start!83560 (= b_free!19547 (not b_next!19547))))

(declare-fun tp!67929 () Bool)

(declare-fun b_and!31185 () Bool)

(assert (=> start!83560 (= tp!67929 b_and!31185)))

(declare-fun b!976464 () Bool)

(declare-fun e!550299 () Bool)

(declare-fun e!550298 () Bool)

(declare-fun mapRes!35686 () Bool)

(assert (=> b!976464 (= e!550299 (and e!550298 mapRes!35686))))

(declare-fun condMapEmpty!35686 () Bool)

(declare-datatypes ((V!34917 0))(
  ( (V!34918 (val!11276 Int)) )
))
(declare-datatypes ((ValueCell!10744 0))(
  ( (ValueCellFull!10744 (v!13835 V!34917)) (EmptyCell!10744) )
))
(declare-datatypes ((array!60929 0))(
  ( (array!60930 (arr!29328 (Array (_ BitVec 32) ValueCell!10744)) (size!29807 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60929)

(declare-fun mapDefault!35686 () ValueCell!10744)

