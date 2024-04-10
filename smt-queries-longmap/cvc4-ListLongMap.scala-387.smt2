; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7322 () Bool)

(assert start!7322)

(declare-fun b!47058 () Bool)

(declare-fun e!30068 () Bool)

(declare-fun tp_is_empty!2003 () Bool)

(assert (=> b!47058 (= e!30068 tp_is_empty!2003)))

(declare-fun b!47059 () Bool)

(declare-fun e!30064 () Bool)

(assert (=> b!47059 (= e!30064 tp_is_empty!2003)))

(declare-fun b!47060 () Bool)

(declare-fun e!30067 () Bool)

(declare-fun mapRes!2033 () Bool)

(assert (=> b!47060 (= e!30067 (and e!30064 mapRes!2033))))

(declare-fun condMapEmpty!2033 () Bool)

(declare-datatypes ((V!2403 0))(
  ( (V!2404 (val!1040 Int)) )
))
(declare-datatypes ((ValueCell!712 0))(
  ( (ValueCellFull!712 (v!2100 V!2403)) (EmptyCell!712) )
))
(declare-datatypes ((array!3069 0))(
  ( (array!3070 (arr!1474 (Array (_ BitVec 32) ValueCell!712)) (size!1696 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3069)

(declare-fun mapDefault!2033 () ValueCell!712)

