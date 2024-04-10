; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133778 () Bool)

(assert start!133778)

(declare-fun b!1564241 () Bool)

(declare-fun e!871837 () Bool)

(declare-fun e!871840 () Bool)

(declare-fun mapRes!59655 () Bool)

(assert (=> b!1564241 (= e!871837 (and e!871840 mapRes!59655))))

(declare-fun condMapEmpty!59655 () Bool)

(declare-datatypes ((V!60009 0))(
  ( (V!60010 (val!19509 Int)) )
))
(declare-datatypes ((ValueCell!18395 0))(
  ( (ValueCellFull!18395 (v!22261 V!60009)) (EmptyCell!18395) )
))
(declare-datatypes ((array!104396 0))(
  ( (array!104397 (arr!50389 (Array (_ BitVec 32) ValueCell!18395)) (size!50939 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104396)

(declare-fun mapDefault!59655 () ValueCell!18395)

