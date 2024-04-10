; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40018 () Bool)

(assert start!40018)

(declare-fun b_free!10285 () Bool)

(declare-fun b_next!10285 () Bool)

(assert (=> start!40018 (= b_free!10285 (not b_next!10285))))

(declare-fun tp!36383 () Bool)

(declare-fun b_and!18229 () Bool)

(assert (=> start!40018 (= tp!36383 b_and!18229)))

(declare-fun b!436036 () Bool)

(declare-fun e!257540 () Bool)

(declare-fun e!257532 () Bool)

(declare-fun mapRes!18777 () Bool)

(assert (=> b!436036 (= e!257540 (and e!257532 mapRes!18777))))

(declare-fun condMapEmpty!18777 () Bool)

(declare-datatypes ((V!16355 0))(
  ( (V!16356 (val!5763 Int)) )
))
(declare-datatypes ((ValueCell!5375 0))(
  ( (ValueCellFull!5375 (v!8010 V!16355)) (EmptyCell!5375) )
))
(declare-datatypes ((array!26701 0))(
  ( (array!26702 (arr!12800 (Array (_ BitVec 32) ValueCell!5375)) (size!13152 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26701)

(declare-fun mapDefault!18777 () ValueCell!5375)

