; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108680 () Bool)

(assert start!108680)

(declare-fun b_free!28193 () Bool)

(declare-fun b_next!28193 () Bool)

(assert (=> start!108680 (= b_free!28193 (not b_next!28193))))

(declare-fun tp!99694 () Bool)

(declare-fun b_and!46259 () Bool)

(assert (=> start!108680 (= tp!99694 b_and!46259)))

(declare-fun b!1282912 () Bool)

(declare-fun e!733009 () Bool)

(declare-fun e!733008 () Bool)

(declare-fun mapRes!52307 () Bool)

(assert (=> b!1282912 (= e!733009 (and e!733008 mapRes!52307))))

(declare-fun condMapEmpty!52307 () Bool)

(declare-datatypes ((V!50213 0))(
  ( (V!50214 (val!16991 Int)) )
))
(declare-datatypes ((ValueCell!16018 0))(
  ( (ValueCellFull!16018 (v!19593 V!50213)) (EmptyCell!16018) )
))
(declare-datatypes ((array!84734 0))(
  ( (array!84735 (arr!40869 (Array (_ BitVec 32) ValueCell!16018)) (size!41419 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84734)

(declare-fun mapDefault!52307 () ValueCell!16018)

