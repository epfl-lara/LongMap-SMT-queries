; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131686 () Bool)

(assert start!131686)

(declare-fun mapIsEmpty!58216 () Bool)

(declare-fun mapRes!58216 () Bool)

(assert (=> mapIsEmpty!58216 mapRes!58216))

(declare-fun b!1542129 () Bool)

(declare-fun e!857873 () Bool)

(declare-fun tp_is_empty!37675 () Bool)

(assert (=> b!1542129 (= e!857873 tp_is_empty!37675)))

(declare-fun res!1058339 () Bool)

(declare-fun e!857872 () Bool)

(assert (=> start!131686 (=> (not res!1058339) (not e!857872))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131686 (= res!1058339 (validMask!0 mask!926))))

(assert (=> start!131686 e!857872))

(assert (=> start!131686 true))

(declare-datatypes ((V!58677 0))(
  ( (V!58678 (val!18915 Int)) )
))
(declare-datatypes ((ValueCell!17927 0))(
  ( (ValueCellFull!17927 (v!21716 V!58677)) (EmptyCell!17927) )
))
(declare-datatypes ((array!102582 0))(
  ( (array!102583 (arr!49493 (Array (_ BitVec 32) ValueCell!17927)) (size!50043 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102582)

(declare-fun e!857874 () Bool)

(declare-fun array_inv!38507 (array!102582) Bool)

(assert (=> start!131686 (and (array_inv!38507 _values!470) e!857874)))

(declare-datatypes ((array!102584 0))(
  ( (array!102585 (arr!49494 (Array (_ BitVec 32) (_ BitVec 64))) (size!50044 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102584)

(declare-fun array_inv!38508 (array!102584) Bool)

(assert (=> start!131686 (array_inv!38508 _keys!618)))

(declare-fun b!1542130 () Bool)

(declare-fun res!1058338 () Bool)

(assert (=> b!1542130 (=> (not res!1058338) (not e!857872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102584 (_ BitVec 32)) Bool)

(assert (=> b!1542130 (= res!1058338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58216 () Bool)

(declare-fun tp!110743 () Bool)

(assert (=> mapNonEmpty!58216 (= mapRes!58216 (and tp!110743 e!857873))))

(declare-fun mapValue!58216 () ValueCell!17927)

(declare-fun mapRest!58216 () (Array (_ BitVec 32) ValueCell!17927))

(declare-fun mapKey!58216 () (_ BitVec 32))

(assert (=> mapNonEmpty!58216 (= (arr!49493 _values!470) (store mapRest!58216 mapKey!58216 mapValue!58216))))

(declare-fun b!1542131 () Bool)

(declare-fun e!857871 () Bool)

(assert (=> b!1542131 (= e!857874 (and e!857871 mapRes!58216))))

(declare-fun condMapEmpty!58216 () Bool)

(declare-fun mapDefault!58216 () ValueCell!17927)

