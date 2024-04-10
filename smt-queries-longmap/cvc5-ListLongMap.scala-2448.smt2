; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38506 () Bool)

(assert start!38506)

(declare-fun b!397763 () Bool)

(declare-fun e!240507 () Bool)

(declare-fun tp_is_empty!9925 () Bool)

(assert (=> b!397763 (= e!240507 tp_is_empty!9925)))

(declare-fun mapIsEmpty!16509 () Bool)

(declare-fun mapRes!16509 () Bool)

(assert (=> mapIsEmpty!16509 mapRes!16509))

(declare-fun b!397764 () Bool)

(declare-fun e!240509 () Bool)

(assert (=> b!397764 (= e!240509 tp_is_empty!9925)))

(declare-fun b!397765 () Bool)

(declare-fun e!240510 () Bool)

(assert (=> b!397765 (= e!240510 (and e!240507 mapRes!16509))))

(declare-fun condMapEmpty!16509 () Bool)

(declare-datatypes ((V!14339 0))(
  ( (V!14340 (val!5007 Int)) )
))
(declare-datatypes ((ValueCell!4619 0))(
  ( (ValueCellFull!4619 (v!7254 V!14339)) (EmptyCell!4619) )
))
(declare-datatypes ((array!23763 0))(
  ( (array!23764 (arr!11331 (Array (_ BitVec 32) ValueCell!4619)) (size!11683 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23763)

(declare-fun mapDefault!16509 () ValueCell!4619)

