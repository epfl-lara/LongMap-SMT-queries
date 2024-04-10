; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36632 () Bool)

(assert start!36632)

(declare-fun b!365618 () Bool)

(declare-fun e!223908 () Bool)

(declare-fun tp_is_empty!8467 () Bool)

(assert (=> b!365618 (= e!223908 tp_is_empty!8467)))

(declare-fun b!365619 () Bool)

(declare-fun e!223906 () Bool)

(declare-fun e!223904 () Bool)

(declare-fun mapRes!14253 () Bool)

(assert (=> b!365619 (= e!223906 (and e!223904 mapRes!14253))))

(declare-fun condMapEmpty!14253 () Bool)

(declare-datatypes ((V!12395 0))(
  ( (V!12396 (val!4278 Int)) )
))
(declare-datatypes ((ValueCell!3890 0))(
  ( (ValueCellFull!3890 (v!6474 V!12395)) (EmptyCell!3890) )
))
(declare-datatypes ((array!20893 0))(
  ( (array!20894 (arr!9919 (Array (_ BitVec 32) ValueCell!3890)) (size!10271 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20893)

(declare-fun mapDefault!14253 () ValueCell!3890)

