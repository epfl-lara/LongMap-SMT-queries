; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131834 () Bool)

(assert start!131834)

(declare-fun b!1543461 () Bool)

(declare-fun e!858981 () Bool)

(assert (=> b!1543461 (= e!858981 false)))

(declare-fun lt!665987 () Bool)

(declare-datatypes ((array!102870 0))(
  ( (array!102871 (arr!49637 (Array (_ BitVec 32) (_ BitVec 64))) (size!50187 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102870)

(declare-datatypes ((List!35923 0))(
  ( (Nil!35920) (Cons!35919 (h!37364 (_ BitVec 64)) (t!50617 List!35923)) )
))
(declare-fun arrayNoDuplicates!0 (array!102870 (_ BitVec 32) List!35923) Bool)

(assert (=> b!1543461 (= lt!665987 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35920))))

(declare-fun b!1543462 () Bool)

(declare-fun e!858980 () Bool)

(declare-fun tp_is_empty!37823 () Bool)

(assert (=> b!1543462 (= e!858980 tp_is_empty!37823)))

(declare-fun mapIsEmpty!58438 () Bool)

(declare-fun mapRes!58438 () Bool)

(assert (=> mapIsEmpty!58438 mapRes!58438))

(declare-fun b!1543463 () Bool)

(declare-fun res!1059005 () Bool)

(assert (=> b!1543463 (=> (not res!1059005) (not e!858981))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102870 (_ BitVec 32)) Bool)

(assert (=> b!1543463 (= res!1059005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059006 () Bool)

(assert (=> start!131834 (=> (not res!1059006) (not e!858981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131834 (= res!1059006 (validMask!0 mask!926))))

(assert (=> start!131834 e!858981))

(assert (=> start!131834 true))

(declare-datatypes ((V!58873 0))(
  ( (V!58874 (val!18989 Int)) )
))
(declare-datatypes ((ValueCell!18001 0))(
  ( (ValueCellFull!18001 (v!21790 V!58873)) (EmptyCell!18001) )
))
(declare-datatypes ((array!102872 0))(
  ( (array!102873 (arr!49638 (Array (_ BitVec 32) ValueCell!18001)) (size!50188 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102872)

(declare-fun e!858982 () Bool)

(declare-fun array_inv!38615 (array!102872) Bool)

(assert (=> start!131834 (and (array_inv!38615 _values!470) e!858982)))

(declare-fun array_inv!38616 (array!102870) Bool)

(assert (=> start!131834 (array_inv!38616 _keys!618)))

(declare-fun b!1543464 () Bool)

(declare-fun e!858984 () Bool)

(assert (=> b!1543464 (= e!858982 (and e!858984 mapRes!58438))))

(declare-fun condMapEmpty!58438 () Bool)

(declare-fun mapDefault!58438 () ValueCell!18001)

