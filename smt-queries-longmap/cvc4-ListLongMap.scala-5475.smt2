; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72638 () Bool)

(assert start!72638)

(declare-fun b!843164 () Bool)

(declare-fun e!470403 () Bool)

(declare-fun e!470405 () Bool)

(declare-fun mapRes!25133 () Bool)

(assert (=> b!843164 (= e!470403 (and e!470405 mapRes!25133))))

(declare-fun condMapEmpty!25133 () Bool)

(declare-datatypes ((V!25965 0))(
  ( (V!25966 (val!7892 Int)) )
))
(declare-datatypes ((ValueCell!7405 0))(
  ( (ValueCellFull!7405 (v!10317 V!25965)) (EmptyCell!7405) )
))
(declare-datatypes ((array!47638 0))(
  ( (array!47639 (arr!22850 (Array (_ BitVec 32) ValueCell!7405)) (size!23290 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47638)

(declare-fun mapDefault!25133 () ValueCell!7405)

