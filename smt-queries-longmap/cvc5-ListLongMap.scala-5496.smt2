; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72760 () Bool)

(assert start!72760)

(declare-fun mapIsEmpty!25316 () Bool)

(declare-fun mapRes!25316 () Bool)

(assert (=> mapIsEmpty!25316 mapRes!25316))

(declare-fun b!844445 () Bool)

(declare-fun e!471319 () Bool)

(declare-fun tp_is_empty!15811 () Bool)

(assert (=> b!844445 (= e!471319 tp_is_empty!15811)))

(declare-fun mapNonEmpty!25316 () Bool)

(declare-fun tp!48634 () Bool)

(declare-fun e!471320 () Bool)

(assert (=> mapNonEmpty!25316 (= mapRes!25316 (and tp!48634 e!471320))))

(declare-fun mapKey!25316 () (_ BitVec 32))

(declare-datatypes ((V!26129 0))(
  ( (V!26130 (val!7953 Int)) )
))
(declare-datatypes ((ValueCell!7466 0))(
  ( (ValueCellFull!7466 (v!10378 V!26129)) (EmptyCell!7466) )
))
(declare-fun mapValue!25316 () ValueCell!7466)

(declare-fun mapRest!25316 () (Array (_ BitVec 32) ValueCell!7466))

(declare-datatypes ((array!47854 0))(
  ( (array!47855 (arr!22958 (Array (_ BitVec 32) ValueCell!7466)) (size!23398 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47854)

(assert (=> mapNonEmpty!25316 (= (arr!22958 _values!688) (store mapRest!25316 mapKey!25316 mapValue!25316))))

(declare-fun b!844446 () Bool)

(declare-fun res!573736 () Bool)

(declare-fun e!471321 () Bool)

(assert (=> b!844446 (=> (not res!573736) (not e!471321))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47856 0))(
  ( (array!47857 (arr!22959 (Array (_ BitVec 32) (_ BitVec 64))) (size!23399 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47856)

(assert (=> b!844446 (= res!573736 (and (= (size!23398 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23399 _keys!868) (size!23398 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844447 () Bool)

(assert (=> b!844447 (= e!471321 false)))

(declare-fun lt!381283 () Bool)

(declare-datatypes ((List!16272 0))(
  ( (Nil!16269) (Cons!16268 (h!17399 (_ BitVec 64)) (t!22643 List!16272)) )
))
(declare-fun arrayNoDuplicates!0 (array!47856 (_ BitVec 32) List!16272) Bool)

(assert (=> b!844447 (= lt!381283 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16269))))

(declare-fun b!844448 () Bool)

(assert (=> b!844448 (= e!471320 tp_is_empty!15811)))

(declare-fun b!844449 () Bool)

(declare-fun e!471322 () Bool)

(assert (=> b!844449 (= e!471322 (and e!471319 mapRes!25316))))

(declare-fun condMapEmpty!25316 () Bool)

(declare-fun mapDefault!25316 () ValueCell!7466)

