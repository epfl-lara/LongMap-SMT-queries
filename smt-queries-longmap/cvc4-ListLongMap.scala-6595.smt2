; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83458 () Bool)

(assert start!83458)

(declare-fun b_free!19445 () Bool)

(declare-fun b_next!19445 () Bool)

(assert (=> start!83458 (= b_free!19445 (not b_next!19445))))

(declare-fun tp!67622 () Bool)

(declare-fun b_and!31047 () Bool)

(assert (=> start!83458 (= tp!67622 b_and!31047)))

(declare-fun b!974827 () Bool)

(declare-fun e!549441 () Bool)

(declare-fun e!549444 () Bool)

(declare-fun mapRes!35533 () Bool)

(assert (=> b!974827 (= e!549441 (and e!549444 mapRes!35533))))

(declare-fun condMapEmpty!35533 () Bool)

(declare-datatypes ((V!34781 0))(
  ( (V!34782 (val!11225 Int)) )
))
(declare-datatypes ((ValueCell!10693 0))(
  ( (ValueCellFull!10693 (v!13784 V!34781)) (EmptyCell!10693) )
))
(declare-datatypes ((array!60737 0))(
  ( (array!60738 (arr!29232 (Array (_ BitVec 32) ValueCell!10693)) (size!29711 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60737)

(declare-fun mapDefault!35533 () ValueCell!10693)

