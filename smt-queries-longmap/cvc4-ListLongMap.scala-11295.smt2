; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131678 () Bool)

(assert start!131678)

(declare-fun res!1058303 () Bool)

(declare-fun e!857813 () Bool)

(assert (=> start!131678 (=> (not res!1058303) (not e!857813))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131678 (= res!1058303 (validMask!0 mask!926))))

(assert (=> start!131678 e!857813))

(assert (=> start!131678 true))

(declare-datatypes ((V!58665 0))(
  ( (V!58666 (val!18911 Int)) )
))
(declare-datatypes ((ValueCell!17923 0))(
  ( (ValueCellFull!17923 (v!21712 V!58665)) (EmptyCell!17923) )
))
(declare-datatypes ((array!102566 0))(
  ( (array!102567 (arr!49485 (Array (_ BitVec 32) ValueCell!17923)) (size!50035 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102566)

(declare-fun e!857814 () Bool)

(declare-fun array_inv!38501 (array!102566) Bool)

(assert (=> start!131678 (and (array_inv!38501 _values!470) e!857814)))

(declare-datatypes ((array!102568 0))(
  ( (array!102569 (arr!49486 (Array (_ BitVec 32) (_ BitVec 64))) (size!50036 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102568)

(declare-fun array_inv!38502 (array!102568) Bool)

(assert (=> start!131678 (array_inv!38502 _keys!618)))

(declare-fun b!1542057 () Bool)

(declare-fun e!857810 () Bool)

(declare-fun mapRes!58204 () Bool)

(assert (=> b!1542057 (= e!857814 (and e!857810 mapRes!58204))))

(declare-fun condMapEmpty!58204 () Bool)

(declare-fun mapDefault!58204 () ValueCell!17923)

