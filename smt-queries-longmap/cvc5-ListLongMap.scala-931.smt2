; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20682 () Bool)

(assert start!20682)

(declare-fun b_free!5341 () Bool)

(declare-fun b_next!5341 () Bool)

(assert (=> start!20682 (= b_free!5341 (not b_next!5341))))

(declare-fun tp!19054 () Bool)

(declare-fun b_and!12087 () Bool)

(assert (=> start!20682 (= tp!19054 b_and!12087)))

(declare-fun b!206726 () Bool)

(declare-fun e!135073 () Bool)

(declare-fun tp_is_empty!5197 () Bool)

(assert (=> b!206726 (= e!135073 tp_is_empty!5197)))

(declare-fun b!206727 () Bool)

(declare-fun e!135074 () Bool)

(assert (=> b!206727 (= e!135074 tp_is_empty!5197)))

(declare-fun b!206728 () Bool)

(declare-fun e!135071 () Bool)

(declare-fun mapRes!8864 () Bool)

(assert (=> b!206728 (= e!135071 (and e!135073 mapRes!8864))))

(declare-fun condMapEmpty!8864 () Bool)

(declare-datatypes ((V!6577 0))(
  ( (V!6578 (val!2643 Int)) )
))
(declare-datatypes ((ValueCell!2255 0))(
  ( (ValueCellFull!2255 (v!4613 V!6577)) (EmptyCell!2255) )
))
(declare-datatypes ((array!9605 0))(
  ( (array!9606 (arr!4553 (Array (_ BitVec 32) ValueCell!2255)) (size!4878 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9605)

(declare-fun mapDefault!8864 () ValueCell!2255)

