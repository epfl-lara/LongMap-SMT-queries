; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72628 () Bool)

(assert start!72628)

(declare-fun b!843059 () Bool)

(declare-fun res!572943 () Bool)

(declare-fun e!470328 () Bool)

(assert (=> b!843059 (=> (not res!572943) (not e!470328))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47618 0))(
  ( (array!47619 (arr!22840 (Array (_ BitVec 32) (_ BitVec 64))) (size!23280 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47618)

(declare-datatypes ((V!25953 0))(
  ( (V!25954 (val!7887 Int)) )
))
(declare-datatypes ((ValueCell!7400 0))(
  ( (ValueCellFull!7400 (v!10312 V!25953)) (EmptyCell!7400) )
))
(declare-datatypes ((array!47620 0))(
  ( (array!47621 (arr!22841 (Array (_ BitVec 32) ValueCell!7400)) (size!23281 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47620)

(assert (=> b!843059 (= res!572943 (and (= (size!23281 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23280 _keys!868) (size!23281 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25118 () Bool)

(declare-fun mapRes!25118 () Bool)

(declare-fun tp!48436 () Bool)

(declare-fun e!470330 () Bool)

(assert (=> mapNonEmpty!25118 (= mapRes!25118 (and tp!48436 e!470330))))

(declare-fun mapKey!25118 () (_ BitVec 32))

(declare-fun mapValue!25118 () ValueCell!7400)

(declare-fun mapRest!25118 () (Array (_ BitVec 32) ValueCell!7400))

(assert (=> mapNonEmpty!25118 (= (arr!22841 _values!688) (store mapRest!25118 mapKey!25118 mapValue!25118))))

(declare-fun mapIsEmpty!25118 () Bool)

(assert (=> mapIsEmpty!25118 mapRes!25118))

(declare-fun b!843061 () Bool)

(declare-fun res!572944 () Bool)

(assert (=> b!843061 (=> (not res!572944) (not e!470328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843061 (= res!572944 (validMask!0 mask!1196))))

(declare-fun b!843062 () Bool)

(declare-fun e!470329 () Bool)

(declare-fun tp_is_empty!15679 () Bool)

(assert (=> b!843062 (= e!470329 tp_is_empty!15679)))

(declare-fun b!843063 () Bool)

(declare-fun e!470331 () Bool)

(assert (=> b!843063 (= e!470331 (and e!470329 mapRes!25118))))

(declare-fun condMapEmpty!25118 () Bool)

(declare-fun mapDefault!25118 () ValueCell!7400)

