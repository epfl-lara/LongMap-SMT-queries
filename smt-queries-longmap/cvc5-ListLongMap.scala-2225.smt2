; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36812 () Bool)

(assert start!36812)

(declare-fun b_free!7939 () Bool)

(declare-fun b_next!7939 () Bool)

(assert (=> start!36812 (= b_free!7939 (not b_next!7939))))

(declare-fun tp!28533 () Bool)

(declare-fun b_and!15181 () Bool)

(assert (=> start!36812 (= tp!28533 b_and!15181)))

(declare-fun b!367850 () Bool)

(declare-fun e!225061 () Bool)

(declare-fun tp_is_empty!8587 () Bool)

(assert (=> b!367850 (= e!225061 tp_is_empty!8587)))

(declare-fun b!367851 () Bool)

(declare-fun e!225060 () Bool)

(declare-fun e!225064 () Bool)

(declare-fun mapRes!14445 () Bool)

(assert (=> b!367851 (= e!225060 (and e!225064 mapRes!14445))))

(declare-fun condMapEmpty!14445 () Bool)

(declare-datatypes ((V!12555 0))(
  ( (V!12556 (val!4338 Int)) )
))
(declare-datatypes ((ValueCell!3950 0))(
  ( (ValueCellFull!3950 (v!6535 V!12555)) (EmptyCell!3950) )
))
(declare-datatypes ((array!21133 0))(
  ( (array!21134 (arr!10035 (Array (_ BitVec 32) ValueCell!3950)) (size!10387 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21133)

(declare-fun mapDefault!14445 () ValueCell!3950)

