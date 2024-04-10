; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131722 () Bool)

(assert start!131722)

(declare-fun res!1058502 () Bool)

(declare-fun e!858141 () Bool)

(assert (=> start!131722 (=> (not res!1058502) (not e!858141))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131722 (= res!1058502 (validMask!0 mask!926))))

(assert (=> start!131722 e!858141))

(assert (=> start!131722 true))

(declare-datatypes ((V!58725 0))(
  ( (V!58726 (val!18933 Int)) )
))
(declare-datatypes ((ValueCell!17945 0))(
  ( (ValueCellFull!17945 (v!21734 V!58725)) (EmptyCell!17945) )
))
(declare-datatypes ((array!102652 0))(
  ( (array!102653 (arr!49528 (Array (_ BitVec 32) ValueCell!17945)) (size!50078 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102652)

(declare-fun e!858144 () Bool)

(declare-fun array_inv!38537 (array!102652) Bool)

(assert (=> start!131722 (and (array_inv!38537 _values!470) e!858144)))

(declare-datatypes ((array!102654 0))(
  ( (array!102655 (arr!49529 (Array (_ BitVec 32) (_ BitVec 64))) (size!50079 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102654)

(declare-fun array_inv!38538 (array!102654) Bool)

(assert (=> start!131722 (array_inv!38538 _keys!618)))

(declare-fun b!1542453 () Bool)

(declare-fun res!1058500 () Bool)

(assert (=> b!1542453 (=> (not res!1058500) (not e!858141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102654 (_ BitVec 32)) Bool)

(assert (=> b!1542453 (= res!1058500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542454 () Bool)

(declare-fun res!1058501 () Bool)

(assert (=> b!1542454 (=> (not res!1058501) (not e!858141))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542454 (= res!1058501 (and (= (size!50078 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50079 _keys!618) (size!50078 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542455 () Bool)

(declare-fun e!858140 () Bool)

(declare-fun mapRes!58270 () Bool)

(assert (=> b!1542455 (= e!858144 (and e!858140 mapRes!58270))))

(declare-fun condMapEmpty!58270 () Bool)

(declare-fun mapDefault!58270 () ValueCell!17945)

