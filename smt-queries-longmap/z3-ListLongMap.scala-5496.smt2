; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72742 () Bool)

(assert start!72742)

(declare-fun b!844206 () Bool)

(declare-fun e!471170 () Bool)

(declare-fun tp_is_empty!15811 () Bool)

(assert (=> b!844206 (= e!471170 tp_is_empty!15811)))

(declare-fun res!573627 () Bool)

(declare-fun e!471171 () Bool)

(assert (=> start!72742 (=> (not res!573627) (not e!471171))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47851 0))(
  ( (array!47852 (arr!22957 (Array (_ BitVec 32) (_ BitVec 64))) (size!23399 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47851)

(assert (=> start!72742 (= res!573627 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23399 _keys!868))))))

(assert (=> start!72742 e!471171))

(assert (=> start!72742 true))

(declare-fun array_inv!18324 (array!47851) Bool)

(assert (=> start!72742 (array_inv!18324 _keys!868)))

(declare-datatypes ((V!26129 0))(
  ( (V!26130 (val!7953 Int)) )
))
(declare-datatypes ((ValueCell!7466 0))(
  ( (ValueCellFull!7466 (v!10372 V!26129)) (EmptyCell!7466) )
))
(declare-datatypes ((array!47853 0))(
  ( (array!47854 (arr!22958 (Array (_ BitVec 32) ValueCell!7466)) (size!23400 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47853)

(declare-fun e!471172 () Bool)

(declare-fun array_inv!18325 (array!47853) Bool)

(assert (=> start!72742 (and (array_inv!18325 _values!688) e!471172)))

(declare-fun b!844207 () Bool)

(declare-fun e!471173 () Bool)

(assert (=> b!844207 (= e!471173 tp_is_empty!15811)))

(declare-fun b!844208 () Bool)

(assert (=> b!844208 (= e!471171 false)))

(declare-fun lt!381047 () Bool)

(declare-datatypes ((List!16287 0))(
  ( (Nil!16284) (Cons!16283 (h!17414 (_ BitVec 64)) (t!22649 List!16287)) )
))
(declare-fun arrayNoDuplicates!0 (array!47851 (_ BitVec 32) List!16287) Bool)

(assert (=> b!844208 (= lt!381047 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16284))))

(declare-fun b!844209 () Bool)

(declare-fun res!573625 () Bool)

(assert (=> b!844209 (=> (not res!573625) (not e!471171))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47851 (_ BitVec 32)) Bool)

(assert (=> b!844209 (= res!573625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844210 () Bool)

(declare-fun mapRes!25316 () Bool)

(assert (=> b!844210 (= e!471172 (and e!471173 mapRes!25316))))

(declare-fun condMapEmpty!25316 () Bool)

(declare-fun mapDefault!25316 () ValueCell!7466)

(assert (=> b!844210 (= condMapEmpty!25316 (= (arr!22958 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7466)) mapDefault!25316)))))

(declare-fun b!844211 () Bool)

(declare-fun res!573626 () Bool)

(assert (=> b!844211 (=> (not res!573626) (not e!471171))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844211 (= res!573626 (and (= (size!23400 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23399 _keys!868) (size!23400 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25316 () Bool)

(declare-fun tp!48635 () Bool)

(assert (=> mapNonEmpty!25316 (= mapRes!25316 (and tp!48635 e!471170))))

(declare-fun mapRest!25316 () (Array (_ BitVec 32) ValueCell!7466))

(declare-fun mapValue!25316 () ValueCell!7466)

(declare-fun mapKey!25316 () (_ BitVec 32))

(assert (=> mapNonEmpty!25316 (= (arr!22958 _values!688) (store mapRest!25316 mapKey!25316 mapValue!25316))))

(declare-fun mapIsEmpty!25316 () Bool)

(assert (=> mapIsEmpty!25316 mapRes!25316))

(declare-fun b!844212 () Bool)

(declare-fun res!573624 () Bool)

(assert (=> b!844212 (=> (not res!573624) (not e!471171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844212 (= res!573624 (validMask!0 mask!1196))))

(assert (= (and start!72742 res!573627) b!844212))

(assert (= (and b!844212 res!573624) b!844211))

(assert (= (and b!844211 res!573626) b!844209))

(assert (= (and b!844209 res!573625) b!844208))

(assert (= (and b!844210 condMapEmpty!25316) mapIsEmpty!25316))

(assert (= (and b!844210 (not condMapEmpty!25316)) mapNonEmpty!25316))

(get-info :version)

(assert (= (and mapNonEmpty!25316 ((_ is ValueCellFull!7466) mapValue!25316)) b!844206))

(assert (= (and b!844210 ((_ is ValueCellFull!7466) mapDefault!25316)) b!844207))

(assert (= start!72742 b!844210))

(declare-fun m!785939 () Bool)

(assert (=> b!844212 m!785939))

(declare-fun m!785941 () Bool)

(assert (=> b!844209 m!785941))

(declare-fun m!785943 () Bool)

(assert (=> mapNonEmpty!25316 m!785943))

(declare-fun m!785945 () Bool)

(assert (=> b!844208 m!785945))

(declare-fun m!785947 () Bool)

(assert (=> start!72742 m!785947))

(declare-fun m!785949 () Bool)

(assert (=> start!72742 m!785949))

(check-sat (not mapNonEmpty!25316) (not start!72742) (not b!844209) (not b!844212) tp_is_empty!15811 (not b!844208))
(check-sat)
