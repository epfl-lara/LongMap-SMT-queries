; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83088 () Bool)

(assert start!83088)

(declare-fun mapIsEmpty!34978 () Bool)

(declare-fun mapRes!34978 () Bool)

(assert (=> mapIsEmpty!34978 mapRes!34978))

(declare-fun b!969236 () Bool)

(declare-fun e!546408 () Bool)

(declare-fun tp_is_empty!21979 () Bool)

(assert (=> b!969236 (= e!546408 tp_is_empty!21979)))

(declare-fun b!969237 () Bool)

(declare-fun e!546409 () Bool)

(assert (=> b!969237 (= e!546409 (and e!546408 mapRes!34978))))

(declare-fun condMapEmpty!34978 () Bool)

(declare-datatypes ((V!34289 0))(
  ( (V!34290 (val!11040 Int)) )
))
(declare-datatypes ((ValueCell!10508 0))(
  ( (ValueCellFull!10508 (v!13599 V!34289)) (EmptyCell!10508) )
))
(declare-datatypes ((array!60027 0))(
  ( (array!60028 (arr!28877 (Array (_ BitVec 32) ValueCell!10508)) (size!29356 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60027)

(declare-fun mapDefault!34978 () ValueCell!10508)

