; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72566 () Bool)

(assert start!72566)

(declare-fun b!842408 () Bool)

(declare-fun res!572573 () Bool)

(declare-fun e!469865 () Bool)

(assert (=> b!842408 (=> (not res!572573) (not e!469865))))

(declare-datatypes ((array!47508 0))(
  ( (array!47509 (arr!22785 (Array (_ BitVec 32) (_ BitVec 64))) (size!23225 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47508)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47508 (_ BitVec 32)) Bool)

(assert (=> b!842408 (= res!572573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572572 () Bool)

(assert (=> start!72566 (=> (not res!572572) (not e!469865))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72566 (= res!572572 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23225 _keys!868))))))

(assert (=> start!72566 e!469865))

(assert (=> start!72566 true))

(declare-fun array_inv!18132 (array!47508) Bool)

(assert (=> start!72566 (array_inv!18132 _keys!868)))

(declare-datatypes ((V!25869 0))(
  ( (V!25870 (val!7856 Int)) )
))
(declare-datatypes ((ValueCell!7369 0))(
  ( (ValueCellFull!7369 (v!10281 V!25869)) (EmptyCell!7369) )
))
(declare-datatypes ((array!47510 0))(
  ( (array!47511 (arr!22786 (Array (_ BitVec 32) ValueCell!7369)) (size!23226 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47510)

(declare-fun e!469866 () Bool)

(declare-fun array_inv!18133 (array!47510) Bool)

(assert (=> start!72566 (and (array_inv!18133 _values!688) e!469866)))

(declare-fun b!842409 () Bool)

(declare-fun res!572570 () Bool)

(assert (=> b!842409 (=> (not res!572570) (not e!469865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842409 (= res!572570 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25025 () Bool)

(declare-fun mapRes!25025 () Bool)

(declare-fun tp!48343 () Bool)

(declare-fun e!469867 () Bool)

(assert (=> mapNonEmpty!25025 (= mapRes!25025 (and tp!48343 e!469867))))

(declare-fun mapKey!25025 () (_ BitVec 32))

(declare-fun mapRest!25025 () (Array (_ BitVec 32) ValueCell!7369))

(declare-fun mapValue!25025 () ValueCell!7369)

(assert (=> mapNonEmpty!25025 (= (arr!22786 _values!688) (store mapRest!25025 mapKey!25025 mapValue!25025))))

(declare-fun b!842410 () Bool)

(declare-fun e!469863 () Bool)

(declare-fun tp_is_empty!15617 () Bool)

(assert (=> b!842410 (= e!469863 tp_is_empty!15617)))

(declare-fun b!842411 () Bool)

(assert (=> b!842411 (= e!469866 (and e!469863 mapRes!25025))))

(declare-fun condMapEmpty!25025 () Bool)

(declare-fun mapDefault!25025 () ValueCell!7369)

