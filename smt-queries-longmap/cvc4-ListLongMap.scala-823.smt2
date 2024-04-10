; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20038 () Bool)

(assert start!20038)

(declare-fun b!196233 () Bool)

(declare-fun e!129209 () Bool)

(declare-fun tp_is_empty!4553 () Bool)

(assert (=> b!196233 (= e!129209 tp_is_empty!4553)))

(declare-fun b!196234 () Bool)

(declare-fun e!129207 () Bool)

(declare-fun mapRes!7898 () Bool)

(assert (=> b!196234 (= e!129207 (and e!129209 mapRes!7898))))

(declare-fun condMapEmpty!7898 () Bool)

(declare-datatypes ((V!5717 0))(
  ( (V!5718 (val!2321 Int)) )
))
(declare-datatypes ((ValueCell!1933 0))(
  ( (ValueCellFull!1933 (v!4291 V!5717)) (EmptyCell!1933) )
))
(declare-datatypes ((array!8369 0))(
  ( (array!8370 (arr!3935 (Array (_ BitVec 32) ValueCell!1933)) (size!4260 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8369)

(declare-fun mapDefault!7898 () ValueCell!1933)

