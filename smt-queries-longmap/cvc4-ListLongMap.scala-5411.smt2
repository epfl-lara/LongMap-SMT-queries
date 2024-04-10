; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72224 () Bool)

(assert start!72224)

(declare-fun b!837072 () Bool)

(declare-fun e!467126 () Bool)

(declare-fun tp_is_empty!15305 () Bool)

(assert (=> b!837072 (= e!467126 tp_is_empty!15305)))

(declare-fun b!837073 () Bool)

(declare-fun res!569330 () Bool)

(declare-fun e!467127 () Bool)

(assert (=> b!837073 (=> (not res!569330) (not e!467127))))

(declare-datatypes ((array!46908 0))(
  ( (array!46909 (arr!22488 (Array (_ BitVec 32) (_ BitVec 64))) (size!22928 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46908)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46908 (_ BitVec 32)) Bool)

(assert (=> b!837073 (= res!569330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837074 () Bool)

(declare-fun e!467128 () Bool)

(assert (=> b!837074 (= e!467128 tp_is_empty!15305)))

(declare-fun b!837075 () Bool)

(declare-fun e!467125 () Bool)

(declare-fun mapRes!24548 () Bool)

(assert (=> b!837075 (= e!467125 (and e!467128 mapRes!24548))))

(declare-fun condMapEmpty!24548 () Bool)

(declare-datatypes ((V!25453 0))(
  ( (V!25454 (val!7700 Int)) )
))
(declare-datatypes ((ValueCell!7213 0))(
  ( (ValueCellFull!7213 (v!10124 V!25453)) (EmptyCell!7213) )
))
(declare-datatypes ((array!46910 0))(
  ( (array!46911 (arr!22489 (Array (_ BitVec 32) ValueCell!7213)) (size!22929 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46910)

(declare-fun mapDefault!24548 () ValueCell!7213)

