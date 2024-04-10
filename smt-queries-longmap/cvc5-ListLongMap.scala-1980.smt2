; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34764 () Bool)

(assert start!34764)

(declare-fun b_free!7549 () Bool)

(declare-fun b_next!7549 () Bool)

(assert (=> start!34764 (= b_free!7549 (not b_next!7549))))

(declare-fun tp!26214 () Bool)

(declare-fun b_and!14771 () Bool)

(assert (=> start!34764 (= tp!26214 b_and!14771)))

(declare-fun b!347611 () Bool)

(declare-fun e!212996 () Bool)

(declare-fun e!212991 () Bool)

(declare-fun mapRes!12711 () Bool)

(assert (=> b!347611 (= e!212996 (and e!212991 mapRes!12711))))

(declare-fun condMapEmpty!12711 () Bool)

(declare-datatypes ((V!10979 0))(
  ( (V!10980 (val!3795 Int)) )
))
(declare-datatypes ((ValueCell!3407 0))(
  ( (ValueCellFull!3407 (v!5978 V!10979)) (EmptyCell!3407) )
))
(declare-datatypes ((array!18595 0))(
  ( (array!18596 (arr!8807 (Array (_ BitVec 32) ValueCell!3407)) (size!9159 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18595)

(declare-fun mapDefault!12711 () ValueCell!3407)

