; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133672 () Bool)

(assert start!133672)

(declare-fun b!1562904 () Bool)

(declare-fun e!871002 () Bool)

(declare-fun tp_is_empty!38755 () Bool)

(assert (=> b!1562904 (= e!871002 tp_is_empty!38755)))

(declare-fun mapIsEmpty!59508 () Bool)

(declare-fun mapRes!59508 () Bool)

(assert (=> mapIsEmpty!59508 mapRes!59508))

(declare-fun b!1562905 () Bool)

(declare-fun e!871003 () Bool)

(declare-fun e!870999 () Bool)

(assert (=> b!1562905 (= e!871003 (and e!870999 mapRes!59508))))

(declare-fun condMapEmpty!59508 () Bool)

(declare-datatypes ((V!59881 0))(
  ( (V!59882 (val!19461 Int)) )
))
(declare-datatypes ((ValueCell!18347 0))(
  ( (ValueCellFull!18347 (v!22213 V!59881)) (EmptyCell!18347) )
))
(declare-datatypes ((array!104216 0))(
  ( (array!104217 (arr!50300 (Array (_ BitVec 32) ValueCell!18347)) (size!50850 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104216)

(declare-fun mapDefault!59508 () ValueCell!18347)

