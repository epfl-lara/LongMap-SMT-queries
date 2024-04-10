; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43226 () Bool)

(assert start!43226)

(declare-fun b!479020 () Bool)

(declare-fun e!281763 () Bool)

(declare-fun e!281761 () Bool)

(declare-fun mapRes!22117 () Bool)

(assert (=> b!479020 (= e!281763 (and e!281761 mapRes!22117))))

(declare-fun condMapEmpty!22117 () Bool)

(declare-datatypes ((V!19225 0))(
  ( (V!19226 (val!6855 Int)) )
))
(declare-datatypes ((ValueCell!6446 0))(
  ( (ValueCellFull!6446 (v!9144 V!19225)) (EmptyCell!6446) )
))
(declare-datatypes ((array!30905 0))(
  ( (array!30906 (arr!14860 (Array (_ BitVec 32) ValueCell!6446)) (size!15218 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30905)

(declare-fun mapDefault!22117 () ValueCell!6446)

