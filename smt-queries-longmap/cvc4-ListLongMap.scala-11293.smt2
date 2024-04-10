; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131654 () Bool)

(assert start!131654)

(declare-fun b!1541912 () Bool)

(declare-fun e!857692 () Bool)

(declare-datatypes ((List!35856 0))(
  ( (Nil!35853) (Cons!35852 (h!37297 (_ BitVec 64)) (t!50550 List!35856)) )
))
(declare-fun contains!10025 (List!35856 (_ BitVec 64)) Bool)

(assert (=> b!1541912 (= e!857692 (contains!10025 Nil!35853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541913 () Bool)

(declare-fun e!857691 () Bool)

(declare-fun tp_is_empty!37655 () Bool)

(assert (=> b!1541913 (= e!857691 tp_is_empty!37655)))

(declare-fun b!1541914 () Bool)

(declare-fun res!1058230 () Bool)

(declare-fun e!857693 () Bool)

(assert (=> b!1541914 (=> (not res!1058230) (not e!857693))))

(declare-datatypes ((array!102542 0))(
  ( (array!102543 (arr!49474 (Array (_ BitVec 32) (_ BitVec 64))) (size!50024 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102542)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102542 (_ BitVec 32)) Bool)

(assert (=> b!1541914 (= res!1058230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058228 () Bool)

(assert (=> start!131654 (=> (not res!1058228) (not e!857693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131654 (= res!1058228 (validMask!0 mask!926))))

(assert (=> start!131654 e!857693))

(assert (=> start!131654 true))

(declare-datatypes ((V!58649 0))(
  ( (V!58650 (val!18905 Int)) )
))
(declare-datatypes ((ValueCell!17917 0))(
  ( (ValueCellFull!17917 (v!21705 V!58649)) (EmptyCell!17917) )
))
(declare-datatypes ((array!102544 0))(
  ( (array!102545 (arr!49475 (Array (_ BitVec 32) ValueCell!17917)) (size!50025 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102544)

(declare-fun e!857690 () Bool)

(declare-fun array_inv!38495 (array!102544) Bool)

(assert (=> start!131654 (and (array_inv!38495 _values!470) e!857690)))

(declare-fun array_inv!38496 (array!102542) Bool)

(assert (=> start!131654 (array_inv!38496 _keys!618)))

(declare-fun b!1541915 () Bool)

(declare-fun res!1058227 () Bool)

(assert (=> b!1541915 (=> (not res!1058227) (not e!857693))))

(assert (=> b!1541915 (= res!1058227 (and (bvsle #b00000000000000000000000000000000 (size!50024 _keys!618)) (bvslt (size!50024 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1541916 () Bool)

(declare-fun e!857694 () Bool)

(declare-fun mapRes!58183 () Bool)

(assert (=> b!1541916 (= e!857690 (and e!857694 mapRes!58183))))

(declare-fun condMapEmpty!58183 () Bool)

(declare-fun mapDefault!58183 () ValueCell!17917)

