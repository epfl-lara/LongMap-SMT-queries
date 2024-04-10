; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72580 () Bool)

(assert start!72580)

(declare-fun b!842555 () Bool)

(declare-fun e!469968 () Bool)

(declare-fun tp_is_empty!15631 () Bool)

(assert (=> b!842555 (= e!469968 tp_is_empty!15631)))

(declare-fun mapNonEmpty!25046 () Bool)

(declare-fun mapRes!25046 () Bool)

(declare-fun tp!48364 () Bool)

(assert (=> mapNonEmpty!25046 (= mapRes!25046 (and tp!48364 e!469968))))

(declare-datatypes ((V!25889 0))(
  ( (V!25890 (val!7863 Int)) )
))
(declare-datatypes ((ValueCell!7376 0))(
  ( (ValueCellFull!7376 (v!10288 V!25889)) (EmptyCell!7376) )
))
(declare-fun mapValue!25046 () ValueCell!7376)

(declare-fun mapKey!25046 () (_ BitVec 32))

(declare-fun mapRest!25046 () (Array (_ BitVec 32) ValueCell!7376))

(declare-datatypes ((array!47534 0))(
  ( (array!47535 (arr!22798 (Array (_ BitVec 32) ValueCell!7376)) (size!23238 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47534)

(assert (=> mapNonEmpty!25046 (= (arr!22798 _values!688) (store mapRest!25046 mapKey!25046 mapValue!25046))))

(declare-fun b!842556 () Bool)

(declare-fun e!469970 () Bool)

(declare-fun e!469972 () Bool)

(assert (=> b!842556 (= e!469970 (and e!469972 mapRes!25046))))

(declare-fun condMapEmpty!25046 () Bool)

(declare-fun mapDefault!25046 () ValueCell!7376)

