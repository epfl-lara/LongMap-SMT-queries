; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72574 () Bool)

(assert start!72574)

(declare-fun b!842492 () Bool)

(declare-fun res!572618 () Bool)

(declare-fun e!469926 () Bool)

(assert (=> b!842492 (=> (not res!572618) (not e!469926))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47524 0))(
  ( (array!47525 (arr!22793 (Array (_ BitVec 32) (_ BitVec 64))) (size!23233 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47524)

(declare-datatypes ((V!25881 0))(
  ( (V!25882 (val!7860 Int)) )
))
(declare-datatypes ((ValueCell!7373 0))(
  ( (ValueCellFull!7373 (v!10285 V!25881)) (EmptyCell!7373) )
))
(declare-datatypes ((array!47526 0))(
  ( (array!47527 (arr!22794 (Array (_ BitVec 32) ValueCell!7373)) (size!23234 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47526)

(assert (=> b!842492 (= res!572618 (and (= (size!23234 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23233 _keys!868) (size!23234 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842493 () Bool)

(declare-fun e!469923 () Bool)

(declare-fun e!469927 () Bool)

(declare-fun mapRes!25037 () Bool)

(assert (=> b!842493 (= e!469923 (and e!469927 mapRes!25037))))

(declare-fun condMapEmpty!25037 () Bool)

(declare-fun mapDefault!25037 () ValueCell!7373)

