; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72562 () Bool)

(assert start!72562)

(declare-fun b!842366 () Bool)

(declare-fun e!469833 () Bool)

(assert (=> b!842366 (= e!469833 false)))

(declare-fun lt!380986 () Bool)

(declare-datatypes ((array!47500 0))(
  ( (array!47501 (arr!22781 (Array (_ BitVec 32) (_ BitVec 64))) (size!23221 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47500)

(declare-datatypes ((List!16209 0))(
  ( (Nil!16206) (Cons!16205 (h!17336 (_ BitVec 64)) (t!22580 List!16209)) )
))
(declare-fun arrayNoDuplicates!0 (array!47500 (_ BitVec 32) List!16209) Bool)

(assert (=> b!842366 (= lt!380986 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16206))))

(declare-fun b!842367 () Bool)

(declare-fun res!572547 () Bool)

(assert (=> b!842367 (=> (not res!572547) (not e!469833))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25865 0))(
  ( (V!25866 (val!7854 Int)) )
))
(declare-datatypes ((ValueCell!7367 0))(
  ( (ValueCellFull!7367 (v!10279 V!25865)) (EmptyCell!7367) )
))
(declare-datatypes ((array!47502 0))(
  ( (array!47503 (arr!22782 (Array (_ BitVec 32) ValueCell!7367)) (size!23222 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47502)

(assert (=> b!842367 (= res!572547 (and (= (size!23222 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23221 _keys!868) (size!23222 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842368 () Bool)

(declare-fun res!572549 () Bool)

(assert (=> b!842368 (=> (not res!572549) (not e!469833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842368 (= res!572549 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25019 () Bool)

(declare-fun mapRes!25019 () Bool)

(assert (=> mapIsEmpty!25019 mapRes!25019))

(declare-fun b!842369 () Bool)

(declare-fun e!469836 () Bool)

(declare-fun tp_is_empty!15613 () Bool)

(assert (=> b!842369 (= e!469836 tp_is_empty!15613)))

(declare-fun b!842370 () Bool)

(declare-fun e!469837 () Bool)

(assert (=> b!842370 (= e!469837 tp_is_empty!15613)))

(declare-fun res!572548 () Bool)

(assert (=> start!72562 (=> (not res!572548) (not e!469833))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72562 (= res!572548 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23221 _keys!868))))))

(assert (=> start!72562 e!469833))

(assert (=> start!72562 true))

(declare-fun array_inv!18128 (array!47500) Bool)

(assert (=> start!72562 (array_inv!18128 _keys!868)))

(declare-fun e!469834 () Bool)

(declare-fun array_inv!18129 (array!47502) Bool)

(assert (=> start!72562 (and (array_inv!18129 _values!688) e!469834)))

(declare-fun b!842371 () Bool)

(assert (=> b!842371 (= e!469834 (and e!469836 mapRes!25019))))

(declare-fun condMapEmpty!25019 () Bool)

(declare-fun mapDefault!25019 () ValueCell!7367)

