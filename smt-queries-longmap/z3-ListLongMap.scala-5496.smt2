; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72928 () Bool)

(assert start!72928)

(declare-fun b!845348 () Bool)

(declare-fun res!574080 () Bool)

(declare-fun e!471901 () Bool)

(assert (=> b!845348 (=> (not res!574080) (not e!471901))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47897 0))(
  ( (array!47898 (arr!22975 (Array (_ BitVec 32) (_ BitVec 64))) (size!23416 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47897)

(declare-datatypes ((V!26129 0))(
  ( (V!26130 (val!7953 Int)) )
))
(declare-datatypes ((ValueCell!7466 0))(
  ( (ValueCellFull!7466 (v!10378 V!26129)) (EmptyCell!7466) )
))
(declare-datatypes ((array!47899 0))(
  ( (array!47900 (arr!22976 (Array (_ BitVec 32) ValueCell!7466)) (size!23417 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47899)

(assert (=> b!845348 (= res!574080 (and (= (size!23417 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23416 _keys!868) (size!23417 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845349 () Bool)

(declare-fun res!574081 () Bool)

(assert (=> b!845349 (=> (not res!574081) (not e!471901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47897 (_ BitVec 32)) Bool)

(assert (=> b!845349 (= res!574081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845350 () Bool)

(assert (=> b!845350 (= e!471901 false)))

(declare-fun lt!381644 () Bool)

(declare-datatypes ((List!16200 0))(
  ( (Nil!16197) (Cons!16196 (h!17333 (_ BitVec 64)) (t!22563 List!16200)) )
))
(declare-fun arrayNoDuplicates!0 (array!47897 (_ BitVec 32) List!16200) Bool)

(assert (=> b!845350 (= lt!381644 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16197))))

(declare-fun b!845351 () Bool)

(declare-fun res!574079 () Bool)

(assert (=> b!845351 (=> (not res!574079) (not e!471901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845351 (= res!574079 (validMask!0 mask!1196))))

(declare-fun res!574078 () Bool)

(assert (=> start!72928 (=> (not res!574078) (not e!471901))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72928 (= res!574078 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23416 _keys!868))))))

(assert (=> start!72928 e!471901))

(assert (=> start!72928 true))

(declare-fun array_inv!18312 (array!47897) Bool)

(assert (=> start!72928 (array_inv!18312 _keys!868)))

(declare-fun e!471904 () Bool)

(declare-fun array_inv!18313 (array!47899) Bool)

(assert (=> start!72928 (and (array_inv!18313 _values!688) e!471904)))

(declare-fun mapIsEmpty!25316 () Bool)

(declare-fun mapRes!25316 () Bool)

(assert (=> mapIsEmpty!25316 mapRes!25316))

(declare-fun b!845352 () Bool)

(declare-fun e!471903 () Bool)

(assert (=> b!845352 (= e!471904 (and e!471903 mapRes!25316))))

(declare-fun condMapEmpty!25316 () Bool)

(declare-fun mapDefault!25316 () ValueCell!7466)

(assert (=> b!845352 (= condMapEmpty!25316 (= (arr!22976 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7466)) mapDefault!25316)))))

(declare-fun b!845353 () Bool)

(declare-fun e!471900 () Bool)

(declare-fun tp_is_empty!15811 () Bool)

(assert (=> b!845353 (= e!471900 tp_is_empty!15811)))

(declare-fun b!845354 () Bool)

(assert (=> b!845354 (= e!471903 tp_is_empty!15811)))

(declare-fun mapNonEmpty!25316 () Bool)

(declare-fun tp!48635 () Bool)

(assert (=> mapNonEmpty!25316 (= mapRes!25316 (and tp!48635 e!471900))))

(declare-fun mapValue!25316 () ValueCell!7466)

(declare-fun mapRest!25316 () (Array (_ BitVec 32) ValueCell!7466))

(declare-fun mapKey!25316 () (_ BitVec 32))

(assert (=> mapNonEmpty!25316 (= (arr!22976 _values!688) (store mapRest!25316 mapKey!25316 mapValue!25316))))

(assert (= (and start!72928 res!574078) b!845351))

(assert (= (and b!845351 res!574079) b!845348))

(assert (= (and b!845348 res!574080) b!845349))

(assert (= (and b!845349 res!574081) b!845350))

(assert (= (and b!845352 condMapEmpty!25316) mapIsEmpty!25316))

(assert (= (and b!845352 (not condMapEmpty!25316)) mapNonEmpty!25316))

(get-info :version)

(assert (= (and mapNonEmpty!25316 ((_ is ValueCellFull!7466) mapValue!25316)) b!845353))

(assert (= (and b!845352 ((_ is ValueCellFull!7466) mapDefault!25316)) b!845354))

(assert (= start!72928 b!845352))

(declare-fun m!787985 () Bool)

(assert (=> mapNonEmpty!25316 m!787985))

(declare-fun m!787987 () Bool)

(assert (=> b!845349 m!787987))

(declare-fun m!787989 () Bool)

(assert (=> b!845350 m!787989))

(declare-fun m!787991 () Bool)

(assert (=> b!845351 m!787991))

(declare-fun m!787993 () Bool)

(assert (=> start!72928 m!787993))

(declare-fun m!787995 () Bool)

(assert (=> start!72928 m!787995))

(check-sat (not b!845349) (not b!845350) tp_is_empty!15811 (not start!72928) (not b!845351) (not mapNonEmpty!25316))
(check-sat)
