; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7324 () Bool)

(assert start!7324)

(declare-fun b!47070 () Bool)

(declare-fun e!30080 () Bool)

(declare-fun tp_is_empty!2005 () Bool)

(assert (=> b!47070 (= e!30080 tp_is_empty!2005)))

(declare-fun b!47071 () Bool)

(declare-fun e!30083 () Bool)

(declare-fun mapRes!2036 () Bool)

(assert (=> b!47071 (= e!30083 (and e!30080 mapRes!2036))))

(declare-fun condMapEmpty!2036 () Bool)

(declare-datatypes ((V!2407 0))(
  ( (V!2408 (val!1041 Int)) )
))
(declare-datatypes ((ValueCell!713 0))(
  ( (ValueCellFull!713 (v!2101 V!2407)) (EmptyCell!713) )
))
(declare-datatypes ((array!3071 0))(
  ( (array!3072 (arr!1475 (Array (_ BitVec 32) ValueCell!713)) (size!1697 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3071)

(declare-fun mapDefault!2036 () ValueCell!713)

