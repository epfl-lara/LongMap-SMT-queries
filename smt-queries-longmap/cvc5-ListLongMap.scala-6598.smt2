; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83472 () Bool)

(assert start!83472)

(declare-fun b_free!19459 () Bool)

(declare-fun b_next!19459 () Bool)

(assert (=> start!83472 (= b_free!19459 (not b_next!19459))))

(declare-fun tp!67665 () Bool)

(declare-fun b_and!31061 () Bool)

(assert (=> start!83472 (= tp!67665 b_and!31061)))

(declare-fun b!975037 () Bool)

(declare-fun e!549550 () Bool)

(declare-fun e!549549 () Bool)

(declare-fun mapRes!35554 () Bool)

(assert (=> b!975037 (= e!549550 (and e!549549 mapRes!35554))))

(declare-fun condMapEmpty!35554 () Bool)

(declare-datatypes ((V!34801 0))(
  ( (V!34802 (val!11232 Int)) )
))
(declare-datatypes ((ValueCell!10700 0))(
  ( (ValueCellFull!10700 (v!13791 V!34801)) (EmptyCell!10700) )
))
(declare-datatypes ((array!60761 0))(
  ( (array!60762 (arr!29244 (Array (_ BitVec 32) ValueCell!10700)) (size!29723 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60761)

(declare-fun mapDefault!35554 () ValueCell!10700)

