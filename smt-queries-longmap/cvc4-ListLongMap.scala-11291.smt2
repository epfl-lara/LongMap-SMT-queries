; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131624 () Bool)

(assert start!131624)

(declare-fun b!1541725 () Bool)

(declare-fun e!857559 () Bool)

(declare-fun tp_is_empty!37643 () Bool)

(assert (=> b!1541725 (= e!857559 tp_is_empty!37643)))

(declare-fun b!1541726 () Bool)

(declare-fun res!1058122 () Bool)

(declare-fun e!857556 () Bool)

(assert (=> b!1541726 (=> (not res!1058122) (not e!857556))))

(declare-datatypes ((array!102518 0))(
  ( (array!102519 (arr!49464 (Array (_ BitVec 32) (_ BitVec 64))) (size!50014 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102518)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58633 0))(
  ( (V!58634 (val!18899 Int)) )
))
(declare-datatypes ((ValueCell!17911 0))(
  ( (ValueCellFull!17911 (v!21699 V!58633)) (EmptyCell!17911) )
))
(declare-datatypes ((array!102520 0))(
  ( (array!102521 (arr!49465 (Array (_ BitVec 32) ValueCell!17911)) (size!50015 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102520)

(assert (=> b!1541726 (= res!1058122 (and (= (size!50015 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50014 _keys!618) (size!50015 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58159 () Bool)

(declare-fun mapRes!58159 () Bool)

(assert (=> mapIsEmpty!58159 mapRes!58159))

(declare-fun res!1058121 () Bool)

(assert (=> start!131624 (=> (not res!1058121) (not e!857556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131624 (= res!1058121 (validMask!0 mask!926))))

(assert (=> start!131624 e!857556))

(assert (=> start!131624 true))

(declare-fun e!857560 () Bool)

(declare-fun array_inv!38487 (array!102520) Bool)

(assert (=> start!131624 (and (array_inv!38487 _values!470) e!857560)))

(declare-fun array_inv!38488 (array!102518) Bool)

(assert (=> start!131624 (array_inv!38488 _keys!618)))

(declare-fun b!1541727 () Bool)

(declare-fun res!1058120 () Bool)

(assert (=> b!1541727 (=> (not res!1058120) (not e!857556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102518 (_ BitVec 32)) Bool)

(assert (=> b!1541727 (= res!1058120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541728 () Bool)

(assert (=> b!1541728 (= e!857560 (and e!857559 mapRes!58159))))

(declare-fun condMapEmpty!58159 () Bool)

(declare-fun mapDefault!58159 () ValueCell!17911)

