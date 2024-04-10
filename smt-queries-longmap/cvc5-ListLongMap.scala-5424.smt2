; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72328 () Bool)

(assert start!72328)

(declare-fun b!837965 () Bool)

(declare-fun res!569847 () Bool)

(declare-fun e!467758 () Bool)

(assert (=> b!837965 (=> (not res!569847) (not e!467758))))

(declare-datatypes ((array!47052 0))(
  ( (array!47053 (arr!22557 (Array (_ BitVec 32) (_ BitVec 64))) (size!22997 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47052)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47052 (_ BitVec 32)) Bool)

(assert (=> b!837965 (= res!569847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837966 () Bool)

(declare-fun res!569846 () Bool)

(assert (=> b!837966 (=> (not res!569846) (not e!467758))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25553 0))(
  ( (V!25554 (val!7737 Int)) )
))
(declare-datatypes ((ValueCell!7250 0))(
  ( (ValueCellFull!7250 (v!10162 V!25553)) (EmptyCell!7250) )
))
(declare-datatypes ((array!47054 0))(
  ( (array!47055 (arr!22558 (Array (_ BitVec 32) ValueCell!7250)) (size!22998 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47054)

(assert (=> b!837966 (= res!569846 (and (= (size!22998 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22997 _keys!868) (size!22998 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24668 () Bool)

(declare-fun mapRes!24668 () Bool)

(declare-fun tp!47662 () Bool)

(declare-fun e!467755 () Bool)

(assert (=> mapNonEmpty!24668 (= mapRes!24668 (and tp!47662 e!467755))))

(declare-fun mapRest!24668 () (Array (_ BitVec 32) ValueCell!7250))

(declare-fun mapKey!24668 () (_ BitVec 32))

(declare-fun mapValue!24668 () ValueCell!7250)

(assert (=> mapNonEmpty!24668 (= (arr!22558 _values!688) (store mapRest!24668 mapKey!24668 mapValue!24668))))

(declare-fun b!837967 () Bool)

(declare-fun e!467757 () Bool)

(declare-fun e!467756 () Bool)

(assert (=> b!837967 (= e!467757 (and e!467756 mapRes!24668))))

(declare-fun condMapEmpty!24668 () Bool)

(declare-fun mapDefault!24668 () ValueCell!7250)

