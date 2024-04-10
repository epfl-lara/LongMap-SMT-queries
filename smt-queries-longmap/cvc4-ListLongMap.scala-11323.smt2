; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131846 () Bool)

(assert start!131846)

(declare-fun b!1543569 () Bool)

(declare-fun res!1059060 () Bool)

(declare-fun e!859070 () Bool)

(assert (=> b!1543569 (=> (not res!1059060) (not e!859070))))

(declare-datatypes ((array!102894 0))(
  ( (array!102895 (arr!49649 (Array (_ BitVec 32) (_ BitVec 64))) (size!50199 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102894)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102894 (_ BitVec 32)) Bool)

(assert (=> b!1543569 (= res!1059060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58456 () Bool)

(declare-fun mapRes!58456 () Bool)

(assert (=> mapIsEmpty!58456 mapRes!58456))

(declare-fun res!1059059 () Bool)

(assert (=> start!131846 (=> (not res!1059059) (not e!859070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131846 (= res!1059059 (validMask!0 mask!926))))

(assert (=> start!131846 e!859070))

(assert (=> start!131846 true))

(declare-datatypes ((V!58889 0))(
  ( (V!58890 (val!18995 Int)) )
))
(declare-datatypes ((ValueCell!18007 0))(
  ( (ValueCellFull!18007 (v!21796 V!58889)) (EmptyCell!18007) )
))
(declare-datatypes ((array!102896 0))(
  ( (array!102897 (arr!49650 (Array (_ BitVec 32) ValueCell!18007)) (size!50200 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102896)

(declare-fun e!859071 () Bool)

(declare-fun array_inv!38625 (array!102896) Bool)

(assert (=> start!131846 (and (array_inv!38625 _values!470) e!859071)))

(declare-fun array_inv!38626 (array!102894) Bool)

(assert (=> start!131846 (array_inv!38626 _keys!618)))

(declare-fun b!1543570 () Bool)

(declare-fun e!859074 () Bool)

(declare-fun tp_is_empty!37835 () Bool)

(assert (=> b!1543570 (= e!859074 tp_is_empty!37835)))

(declare-fun b!1543571 () Bool)

(declare-fun e!859073 () Bool)

(assert (=> b!1543571 (= e!859073 tp_is_empty!37835)))

(declare-fun b!1543572 () Bool)

(declare-fun res!1059058 () Bool)

(assert (=> b!1543572 (=> (not res!1059058) (not e!859070))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543572 (= res!1059058 (and (= (size!50200 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50199 _keys!618) (size!50200 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543573 () Bool)

(assert (=> b!1543573 (= e!859071 (and e!859073 mapRes!58456))))

(declare-fun condMapEmpty!58456 () Bool)

(declare-fun mapDefault!58456 () ValueCell!18007)

