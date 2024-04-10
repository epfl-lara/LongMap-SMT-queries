; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131822 () Bool)

(assert start!131822)

(declare-fun b!1543353 () Bool)

(declare-fun e!858893 () Bool)

(declare-fun tp_is_empty!37811 () Bool)

(assert (=> b!1543353 (= e!858893 tp_is_empty!37811)))

(declare-fun res!1058951 () Bool)

(declare-fun e!858890 () Bool)

(assert (=> start!131822 (=> (not res!1058951) (not e!858890))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131822 (= res!1058951 (validMask!0 mask!926))))

(assert (=> start!131822 e!858890))

(assert (=> start!131822 true))

(declare-datatypes ((V!58857 0))(
  ( (V!58858 (val!18983 Int)) )
))
(declare-datatypes ((ValueCell!17995 0))(
  ( (ValueCellFull!17995 (v!21784 V!58857)) (EmptyCell!17995) )
))
(declare-datatypes ((array!102846 0))(
  ( (array!102847 (arr!49625 (Array (_ BitVec 32) ValueCell!17995)) (size!50175 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102846)

(declare-fun e!858894 () Bool)

(declare-fun array_inv!38607 (array!102846) Bool)

(assert (=> start!131822 (and (array_inv!38607 _values!470) e!858894)))

(declare-datatypes ((array!102848 0))(
  ( (array!102849 (arr!49626 (Array (_ BitVec 32) (_ BitVec 64))) (size!50176 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102848)

(declare-fun array_inv!38608 (array!102848) Bool)

(assert (=> start!131822 (array_inv!38608 _keys!618)))

(declare-fun b!1543354 () Bool)

(declare-fun e!858891 () Bool)

(declare-fun mapRes!58420 () Bool)

(assert (=> b!1543354 (= e!858894 (and e!858891 mapRes!58420))))

(declare-fun condMapEmpty!58420 () Bool)

(declare-fun mapDefault!58420 () ValueCell!17995)

