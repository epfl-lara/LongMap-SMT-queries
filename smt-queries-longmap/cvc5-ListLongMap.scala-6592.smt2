; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83436 () Bool)

(assert start!83436)

(declare-fun b_free!19429 () Bool)

(declare-fun b_next!19429 () Bool)

(assert (=> start!83436 (= b_free!19429 (not b_next!19429))))

(declare-fun tp!67565 () Bool)

(declare-fun b_and!31031 () Bool)

(assert (=> start!83436 (= tp!67565 b_and!31031)))

(declare-fun b!974526 () Bool)

(declare-fun e!549270 () Bool)

(declare-fun e!549269 () Bool)

(declare-fun mapRes!35500 () Bool)

(assert (=> b!974526 (= e!549270 (and e!549269 mapRes!35500))))

(declare-fun condMapEmpty!35500 () Bool)

(declare-datatypes ((V!34753 0))(
  ( (V!34754 (val!11214 Int)) )
))
(declare-datatypes ((ValueCell!10682 0))(
  ( (ValueCellFull!10682 (v!13773 V!34753)) (EmptyCell!10682) )
))
(declare-datatypes ((array!60695 0))(
  ( (array!60696 (arr!29211 (Array (_ BitVec 32) ValueCell!10682)) (size!29690 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60695)

(declare-fun mapDefault!35500 () ValueCell!10682)

