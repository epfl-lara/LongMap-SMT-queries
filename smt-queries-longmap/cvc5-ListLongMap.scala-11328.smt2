; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131872 () Bool)

(assert start!131872)

(declare-fun mapNonEmpty!58495 () Bool)

(declare-fun mapRes!58495 () Bool)

(declare-fun tp!111022 () Bool)

(declare-fun e!859268 () Bool)

(assert (=> mapNonEmpty!58495 (= mapRes!58495 (and tp!111022 e!859268))))

(declare-datatypes ((V!58925 0))(
  ( (V!58926 (val!19008 Int)) )
))
(declare-datatypes ((ValueCell!18020 0))(
  ( (ValueCellFull!18020 (v!21809 V!58925)) (EmptyCell!18020) )
))
(declare-fun mapValue!58495 () ValueCell!18020)

(declare-fun mapKey!58495 () (_ BitVec 32))

(declare-datatypes ((array!102940 0))(
  ( (array!102941 (arr!49672 (Array (_ BitVec 32) ValueCell!18020)) (size!50222 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102940)

(declare-fun mapRest!58495 () (Array (_ BitVec 32) ValueCell!18020))

(assert (=> mapNonEmpty!58495 (= (arr!49672 _values!470) (store mapRest!58495 mapKey!58495 mapValue!58495))))

(declare-fun b!1543803 () Bool)

(declare-fun e!859265 () Bool)

(declare-fun e!859266 () Bool)

(assert (=> b!1543803 (= e!859265 (and e!859266 mapRes!58495))))

(declare-fun condMapEmpty!58495 () Bool)

(declare-fun mapDefault!58495 () ValueCell!18020)

