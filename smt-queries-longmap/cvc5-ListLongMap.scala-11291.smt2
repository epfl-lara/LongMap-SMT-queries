; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131620 () Bool)

(assert start!131620)

(declare-fun b!1541689 () Bool)

(declare-fun e!857526 () Bool)

(declare-fun tp_is_empty!37639 () Bool)

(assert (=> b!1541689 (= e!857526 tp_is_empty!37639)))

(declare-fun mapIsEmpty!58153 () Bool)

(declare-fun mapRes!58153 () Bool)

(assert (=> mapIsEmpty!58153 mapRes!58153))

(declare-fun b!1541690 () Bool)

(declare-fun res!1058104 () Bool)

(declare-fun e!857529 () Bool)

(assert (=> b!1541690 (=> (not res!1058104) (not e!857529))))

(declare-datatypes ((array!102510 0))(
  ( (array!102511 (arr!49460 (Array (_ BitVec 32) (_ BitVec 64))) (size!50010 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102510)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58629 0))(
  ( (V!58630 (val!18897 Int)) )
))
(declare-datatypes ((ValueCell!17909 0))(
  ( (ValueCellFull!17909 (v!21697 V!58629)) (EmptyCell!17909) )
))
(declare-datatypes ((array!102512 0))(
  ( (array!102513 (arr!49461 (Array (_ BitVec 32) ValueCell!17909)) (size!50011 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102512)

(assert (=> b!1541690 (= res!1058104 (and (= (size!50011 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50010 _keys!618) (size!50011 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541691 () Bool)

(declare-fun res!1058103 () Bool)

(assert (=> b!1541691 (=> (not res!1058103) (not e!857529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102510 (_ BitVec 32)) Bool)

(assert (=> b!1541691 (= res!1058103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058102 () Bool)

(assert (=> start!131620 (=> (not res!1058102) (not e!857529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131620 (= res!1058102 (validMask!0 mask!926))))

(assert (=> start!131620 e!857529))

(assert (=> start!131620 true))

(declare-fun e!857528 () Bool)

(declare-fun array_inv!38483 (array!102512) Bool)

(assert (=> start!131620 (and (array_inv!38483 _values!470) e!857528)))

(declare-fun array_inv!38484 (array!102510) Bool)

(assert (=> start!131620 (array_inv!38484 _keys!618)))

(declare-fun b!1541692 () Bool)

(assert (=> b!1541692 (= e!857529 (and (bvsle #b00000000000000000000000000000000 (size!50010 _keys!618)) (bvsge (size!50010 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541693 () Bool)

(declare-fun e!857527 () Bool)

(assert (=> b!1541693 (= e!857527 tp_is_empty!37639)))

(declare-fun b!1541694 () Bool)

(assert (=> b!1541694 (= e!857528 (and e!857526 mapRes!58153))))

(declare-fun condMapEmpty!58153 () Bool)

(declare-fun mapDefault!58153 () ValueCell!17909)

