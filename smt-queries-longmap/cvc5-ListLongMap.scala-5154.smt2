; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69888 () Bool)

(assert start!69888)

(declare-fun res!555235 () Bool)

(declare-fun e!450090 () Bool)

(assert (=> start!69888 (=> (not res!555235) (not e!450090))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69888 (= res!555235 (validMask!0 mask!1312))))

(assert (=> start!69888 e!450090))

(declare-datatypes ((array!44304 0))(
  ( (array!44305 (arr!21214 (Array (_ BitVec 32) (_ BitVec 64))) (size!21635 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44304)

(declare-fun array_inv!16995 (array!44304) Bool)

(assert (=> start!69888 (array_inv!16995 _keys!976)))

(assert (=> start!69888 true))

(declare-datatypes ((V!23723 0))(
  ( (V!23724 (val!7068 Int)) )
))
(declare-datatypes ((ValueCell!6605 0))(
  ( (ValueCellFull!6605 (v!9495 V!23723)) (EmptyCell!6605) )
))
(declare-datatypes ((array!44306 0))(
  ( (array!44307 (arr!21215 (Array (_ BitVec 32) ValueCell!6605)) (size!21636 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44306)

(declare-fun e!450093 () Bool)

(declare-fun array_inv!16996 (array!44306) Bool)

(assert (=> start!69888 (and (array_inv!16996 _values!788) e!450093)))

(declare-fun b!812556 () Bool)

(declare-fun e!450092 () Bool)

(declare-fun mapRes!22636 () Bool)

(assert (=> b!812556 (= e!450093 (and e!450092 mapRes!22636))))

(declare-fun condMapEmpty!22636 () Bool)

(declare-fun mapDefault!22636 () ValueCell!6605)

