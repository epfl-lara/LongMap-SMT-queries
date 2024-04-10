; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3772 () Bool)

(assert start!3772)

(declare-fun mapNonEmpty!1156 () Bool)

(declare-fun mapRes!1156 () Bool)

(declare-fun tp!3676 () Bool)

(declare-fun e!17144 () Bool)

(assert (=> mapNonEmpty!1156 (= mapRes!1156 (and tp!3676 e!17144))))

(declare-datatypes ((V!1283 0))(
  ( (V!1284 (val!573 Int)) )
))
(declare-datatypes ((ValueCell!347 0))(
  ( (ValueCellFull!347 (v!1659 V!1283)) (EmptyCell!347) )
))
(declare-datatypes ((array!1431 0))(
  ( (array!1432 (arr!673 (Array (_ BitVec 32) ValueCell!347)) (size!774 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1431)

(declare-fun mapRest!1156 () (Array (_ BitVec 32) ValueCell!347))

(declare-fun mapKey!1156 () (_ BitVec 32))

(declare-fun mapValue!1156 () ValueCell!347)

(assert (=> mapNonEmpty!1156 (= (arr!673 _values!1501) (store mapRest!1156 mapKey!1156 mapValue!1156))))

(declare-fun b!26342 () Bool)

(declare-fun e!17141 () Bool)

(declare-fun e!17140 () Bool)

(assert (=> b!26342 (= e!17141 (and e!17140 mapRes!1156))))

(declare-fun condMapEmpty!1156 () Bool)

(declare-fun mapDefault!1156 () ValueCell!347)

