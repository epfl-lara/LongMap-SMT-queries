; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3678 () Bool)

(assert start!3678)

(declare-fun mapIsEmpty!1066 () Bool)

(declare-fun mapRes!1066 () Bool)

(assert (=> mapIsEmpty!1066 mapRes!1066))

(declare-fun b!25768 () Bool)

(declare-fun e!16672 () Bool)

(declare-fun e!16670 () Bool)

(assert (=> b!25768 (= e!16672 (and e!16670 mapRes!1066))))

(declare-fun condMapEmpty!1066 () Bool)

(declare-datatypes ((V!1215 0))(
  ( (V!1216 (val!548 Int)) )
))
(declare-datatypes ((ValueCell!322 0))(
  ( (ValueCellFull!322 (v!1633 V!1215)) (EmptyCell!322) )
))
(declare-datatypes ((array!1327 0))(
  ( (array!1328 (arr!626 (Array (_ BitVec 32) ValueCell!322)) (size!727 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1327)

(declare-fun mapDefault!1066 () ValueCell!322)

