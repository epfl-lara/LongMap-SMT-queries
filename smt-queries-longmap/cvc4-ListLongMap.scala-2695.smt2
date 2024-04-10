; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39992 () Bool)

(assert start!39992)

(declare-fun b_free!10259 () Bool)

(declare-fun b_next!10259 () Bool)

(assert (=> start!39992 (= b_free!10259 (not b_next!10259))))

(declare-fun tp!36305 () Bool)

(declare-fun b_and!18177 () Bool)

(assert (=> start!39992 (= tp!36305 b_and!18177)))

(declare-fun b!435230 () Bool)

(declare-fun e!257146 () Bool)

(declare-fun e!257142 () Bool)

(declare-fun mapRes!18738 () Bool)

(assert (=> b!435230 (= e!257146 (and e!257142 mapRes!18738))))

(declare-fun condMapEmpty!18738 () Bool)

(declare-datatypes ((V!16319 0))(
  ( (V!16320 (val!5750 Int)) )
))
(declare-datatypes ((ValueCell!5362 0))(
  ( (ValueCellFull!5362 (v!7997 V!16319)) (EmptyCell!5362) )
))
(declare-datatypes ((array!26653 0))(
  ( (array!26654 (arr!12776 (Array (_ BitVec 32) ValueCell!5362)) (size!13128 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26653)

(declare-fun mapDefault!18738 () ValueCell!5362)

