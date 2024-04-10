; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133346 () Bool)

(assert start!133346)

(declare-fun b!1559216 () Bool)

(declare-fun e!868742 () Bool)

(declare-fun tp_is_empty!38467 () Bool)

(assert (=> b!1559216 (= e!868742 tp_is_empty!38467)))

(declare-fun b!1559217 () Bool)

(declare-fun e!868743 () Bool)

(declare-fun mapRes!59064 () Bool)

(assert (=> b!1559217 (= e!868743 (and e!868742 mapRes!59064))))

(declare-fun condMapEmpty!59064 () Bool)

(declare-datatypes ((V!59497 0))(
  ( (V!59498 (val!19317 Int)) )
))
(declare-datatypes ((ValueCell!18203 0))(
  ( (ValueCellFull!18203 (v!22068 V!59497)) (EmptyCell!18203) )
))
(declare-datatypes ((array!103656 0))(
  ( (array!103657 (arr!50024 (Array (_ BitVec 32) ValueCell!18203)) (size!50574 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103656)

(declare-fun mapDefault!59064 () ValueCell!18203)

