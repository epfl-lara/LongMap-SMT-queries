; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77962 () Bool)

(assert start!77962)

(declare-fun b_free!16505 () Bool)

(declare-fun b_next!16505 () Bool)

(assert (=> start!77962 (= b_free!16505 (not b_next!16505))))

(declare-fun tp!57782 () Bool)

(declare-fun b_and!27075 () Bool)

(assert (=> start!77962 (= tp!57782 b_and!27075)))

(declare-fun b!910190 () Bool)

(declare-fun e!510299 () Bool)

(declare-fun e!510301 () Bool)

(declare-fun mapRes!30103 () Bool)

(assert (=> b!910190 (= e!510299 (and e!510301 mapRes!30103))))

(declare-fun condMapEmpty!30103 () Bool)

(declare-datatypes ((V!30195 0))(
  ( (V!30196 (val!9512 Int)) )
))
(declare-datatypes ((ValueCell!8980 0))(
  ( (ValueCellFull!8980 (v!12020 V!30195)) (EmptyCell!8980) )
))
(declare-datatypes ((array!53866 0))(
  ( (array!53867 (arr!25890 (Array (_ BitVec 32) ValueCell!8980)) (size!26349 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53866)

(declare-fun mapDefault!30103 () ValueCell!8980)

