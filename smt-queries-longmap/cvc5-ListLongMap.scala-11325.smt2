; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131854 () Bool)

(assert start!131854)

(declare-fun b!1543641 () Bool)

(declare-fun e!859132 () Bool)

(declare-fun tp_is_empty!37843 () Bool)

(assert (=> b!1543641 (= e!859132 tp_is_empty!37843)))

(declare-fun b!1543642 () Bool)

(declare-fun e!859131 () Bool)

(declare-fun mapRes!58468 () Bool)

(assert (=> b!1543642 (= e!859131 (and e!859132 mapRes!58468))))

(declare-fun condMapEmpty!58468 () Bool)

(declare-datatypes ((V!58901 0))(
  ( (V!58902 (val!18999 Int)) )
))
(declare-datatypes ((ValueCell!18011 0))(
  ( (ValueCellFull!18011 (v!21800 V!58901)) (EmptyCell!18011) )
))
(declare-datatypes ((array!102908 0))(
  ( (array!102909 (arr!49656 (Array (_ BitVec 32) ValueCell!18011)) (size!50206 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102908)

(declare-fun mapDefault!58468 () ValueCell!18011)

