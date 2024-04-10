; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131840 () Bool)

(assert start!131840)

(declare-fun b!1543515 () Bool)

(declare-fun e!859029 () Bool)

(declare-fun tp_is_empty!37829 () Bool)

(assert (=> b!1543515 (= e!859029 tp_is_empty!37829)))

(declare-fun b!1543516 () Bool)

(declare-fun res!1059031 () Bool)

(declare-fun e!859025 () Bool)

(assert (=> b!1543516 (=> (not res!1059031) (not e!859025))))

(declare-datatypes ((array!102882 0))(
  ( (array!102883 (arr!49643 (Array (_ BitVec 32) (_ BitVec 64))) (size!50193 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102882)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58881 0))(
  ( (V!58882 (val!18992 Int)) )
))
(declare-datatypes ((ValueCell!18004 0))(
  ( (ValueCellFull!18004 (v!21793 V!58881)) (EmptyCell!18004) )
))
(declare-datatypes ((array!102884 0))(
  ( (array!102885 (arr!49644 (Array (_ BitVec 32) ValueCell!18004)) (size!50194 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102884)

(assert (=> b!1543516 (= res!1059031 (and (= (size!50194 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50193 _keys!618) (size!50194 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58447 () Bool)

(declare-fun mapRes!58447 () Bool)

(assert (=> mapIsEmpty!58447 mapRes!58447))

(declare-fun b!1543517 () Bool)

(declare-fun res!1059032 () Bool)

(assert (=> b!1543517 (=> (not res!1059032) (not e!859025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102882 (_ BitVec 32)) Bool)

(assert (=> b!1543517 (= res!1059032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059033 () Bool)

(assert (=> start!131840 (=> (not res!1059033) (not e!859025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131840 (= res!1059033 (validMask!0 mask!926))))

(assert (=> start!131840 e!859025))

(assert (=> start!131840 true))

(declare-fun e!859028 () Bool)

(declare-fun array_inv!38621 (array!102884) Bool)

(assert (=> start!131840 (and (array_inv!38621 _values!470) e!859028)))

(declare-fun array_inv!38622 (array!102882) Bool)

(assert (=> start!131840 (array_inv!38622 _keys!618)))

(declare-fun b!1543518 () Bool)

(declare-fun e!859026 () Bool)

(assert (=> b!1543518 (= e!859026 tp_is_empty!37829)))

(declare-fun b!1543519 () Bool)

(assert (=> b!1543519 (= e!859028 (and e!859029 mapRes!58447))))

(declare-fun condMapEmpty!58447 () Bool)

(declare-fun mapDefault!58447 () ValueCell!18004)

