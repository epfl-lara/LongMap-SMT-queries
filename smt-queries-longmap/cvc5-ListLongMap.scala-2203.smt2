; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36608 () Bool)

(assert start!36608)

(declare-fun b!365449 () Bool)

(declare-fun e!223782 () Bool)

(declare-fun e!223780 () Bool)

(declare-fun mapRes!14232 () Bool)

(assert (=> b!365449 (= e!223782 (and e!223780 mapRes!14232))))

(declare-fun condMapEmpty!14232 () Bool)

(declare-datatypes ((V!12379 0))(
  ( (V!12380 (val!4272 Int)) )
))
(declare-datatypes ((ValueCell!3884 0))(
  ( (ValueCellFull!3884 (v!6467 V!12379)) (EmptyCell!3884) )
))
(declare-datatypes ((array!20869 0))(
  ( (array!20870 (arr!9908 (Array (_ BitVec 32) ValueCell!3884)) (size!10260 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20869)

(declare-fun mapDefault!14232 () ValueCell!3884)

