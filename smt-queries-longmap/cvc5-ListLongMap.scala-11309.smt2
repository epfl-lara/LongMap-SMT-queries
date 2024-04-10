; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131758 () Bool)

(assert start!131758)

(declare-fun mapIsEmpty!58324 () Bool)

(declare-fun mapRes!58324 () Bool)

(assert (=> mapIsEmpty!58324 mapRes!58324))

(declare-fun b!1542777 () Bool)

(declare-fun e!858413 () Bool)

(declare-fun tp_is_empty!37747 () Bool)

(assert (=> b!1542777 (= e!858413 tp_is_empty!37747)))

(declare-fun b!1542778 () Bool)

(declare-fun res!1058663 () Bool)

(declare-fun e!858410 () Bool)

(assert (=> b!1542778 (=> (not res!1058663) (not e!858410))))

(declare-datatypes ((array!102722 0))(
  ( (array!102723 (arr!49563 (Array (_ BitVec 32) (_ BitVec 64))) (size!50113 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102722)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58773 0))(
  ( (V!58774 (val!18951 Int)) )
))
(declare-datatypes ((ValueCell!17963 0))(
  ( (ValueCellFull!17963 (v!21752 V!58773)) (EmptyCell!17963) )
))
(declare-datatypes ((array!102724 0))(
  ( (array!102725 (arr!49564 (Array (_ BitVec 32) ValueCell!17963)) (size!50114 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102724)

(assert (=> b!1542778 (= res!1058663 (and (= (size!50114 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50113 _keys!618) (size!50114 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542779 () Bool)

(declare-fun e!858412 () Bool)

(assert (=> b!1542779 (= e!858412 tp_is_empty!37747)))

(declare-fun b!1542780 () Bool)

(declare-fun e!858411 () Bool)

(assert (=> b!1542780 (= e!858411 (and e!858412 mapRes!58324))))

(declare-fun condMapEmpty!58324 () Bool)

(declare-fun mapDefault!58324 () ValueCell!17963)

