; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36568 () Bool)

(assert start!36568)

(declare-fun b!365242 () Bool)

(declare-fun e!223622 () Bool)

(declare-fun tp_is_empty!8441 () Bool)

(assert (=> b!365242 (= e!223622 tp_is_empty!8441)))

(declare-fun mapNonEmpty!14202 () Bool)

(declare-fun mapRes!14202 () Bool)

(declare-fun tp!28278 () Bool)

(assert (=> mapNonEmpty!14202 (= mapRes!14202 (and tp!28278 e!223622))))

(declare-datatypes ((V!12359 0))(
  ( (V!12360 (val!4265 Int)) )
))
(declare-datatypes ((ValueCell!3877 0))(
  ( (ValueCellFull!3877 (v!6460 V!12359)) (EmptyCell!3877) )
))
(declare-datatypes ((array!20839 0))(
  ( (array!20840 (arr!9896 (Array (_ BitVec 32) ValueCell!3877)) (size!10248 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20839)

(declare-fun mapKey!14202 () (_ BitVec 32))

(declare-fun mapRest!14202 () (Array (_ BitVec 32) ValueCell!3877))

(declare-fun mapValue!14202 () ValueCell!3877)

(assert (=> mapNonEmpty!14202 (= (arr!9896 _values!506) (store mapRest!14202 mapKey!14202 mapValue!14202))))

(declare-fun b!365243 () Bool)

(declare-fun e!223621 () Bool)

(declare-fun e!223624 () Bool)

(assert (=> b!365243 (= e!223621 (and e!223624 mapRes!14202))))

(declare-fun condMapEmpty!14202 () Bool)

(declare-fun mapDefault!14202 () ValueCell!3877)

