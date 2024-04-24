; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72844 () Bool)

(assert start!72844)

(declare-fun b!844466 () Bool)

(declare-fun res!573574 () Bool)

(declare-fun e!471270 () Bool)

(assert (=> b!844466 (=> (not res!573574) (not e!471270))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844466 (= res!573574 (validMask!0 mask!1196))))

(declare-fun res!573577 () Bool)

(assert (=> start!72844 (=> (not res!573577) (not e!471270))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47735 0))(
  ( (array!47736 (arr!22894 (Array (_ BitVec 32) (_ BitVec 64))) (size!23335 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47735)

(assert (=> start!72844 (= res!573577 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23335 _keys!868))))))

(assert (=> start!72844 e!471270))

(assert (=> start!72844 true))

(declare-fun array_inv!18260 (array!47735) Bool)

(assert (=> start!72844 (array_inv!18260 _keys!868)))

(declare-datatypes ((V!26017 0))(
  ( (V!26018 (val!7911 Int)) )
))
(declare-datatypes ((ValueCell!7424 0))(
  ( (ValueCellFull!7424 (v!10336 V!26017)) (EmptyCell!7424) )
))
(declare-datatypes ((array!47737 0))(
  ( (array!47738 (arr!22895 (Array (_ BitVec 32) ValueCell!7424)) (size!23336 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47737)

(declare-fun e!471273 () Bool)

(declare-fun array_inv!18261 (array!47737) Bool)

(assert (=> start!72844 (and (array_inv!18261 _values!688) e!471273)))

(declare-fun b!844467 () Bool)

(declare-fun res!573576 () Bool)

(assert (=> b!844467 (=> (not res!573576) (not e!471270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47735 (_ BitVec 32)) Bool)

(assert (=> b!844467 (= res!573576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844468 () Bool)

(declare-fun e!471274 () Bool)

(declare-fun tp_is_empty!15727 () Bool)

(assert (=> b!844468 (= e!471274 tp_is_empty!15727)))

(declare-fun b!844469 () Bool)

(declare-fun e!471272 () Bool)

(declare-fun mapRes!25190 () Bool)

(assert (=> b!844469 (= e!471273 (and e!471272 mapRes!25190))))

(declare-fun condMapEmpty!25190 () Bool)

(declare-fun mapDefault!25190 () ValueCell!7424)

(assert (=> b!844469 (= condMapEmpty!25190 (= (arr!22895 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7424)) mapDefault!25190)))))

(declare-fun mapIsEmpty!25190 () Bool)

(assert (=> mapIsEmpty!25190 mapRes!25190))

(declare-fun b!844470 () Bool)

(assert (=> b!844470 (= e!471272 tp_is_empty!15727)))

(declare-fun b!844471 () Bool)

(assert (=> b!844471 (= e!471270 false)))

(declare-fun lt!381518 () Bool)

(declare-datatypes ((List!16171 0))(
  ( (Nil!16168) (Cons!16167 (h!17304 (_ BitVec 64)) (t!22534 List!16171)) )
))
(declare-fun arrayNoDuplicates!0 (array!47735 (_ BitVec 32) List!16171) Bool)

(assert (=> b!844471 (= lt!381518 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16168))))

(declare-fun mapNonEmpty!25190 () Bool)

(declare-fun tp!48509 () Bool)

(assert (=> mapNonEmpty!25190 (= mapRes!25190 (and tp!48509 e!471274))))

(declare-fun mapValue!25190 () ValueCell!7424)

(declare-fun mapRest!25190 () (Array (_ BitVec 32) ValueCell!7424))

(declare-fun mapKey!25190 () (_ BitVec 32))

(assert (=> mapNonEmpty!25190 (= (arr!22895 _values!688) (store mapRest!25190 mapKey!25190 mapValue!25190))))

(declare-fun b!844472 () Bool)

(declare-fun res!573575 () Bool)

(assert (=> b!844472 (=> (not res!573575) (not e!471270))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844472 (= res!573575 (and (= (size!23336 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23335 _keys!868) (size!23336 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72844 res!573577) b!844466))

(assert (= (and b!844466 res!573574) b!844472))

(assert (= (and b!844472 res!573575) b!844467))

(assert (= (and b!844467 res!573576) b!844471))

(assert (= (and b!844469 condMapEmpty!25190) mapIsEmpty!25190))

(assert (= (and b!844469 (not condMapEmpty!25190)) mapNonEmpty!25190))

(get-info :version)

(assert (= (and mapNonEmpty!25190 ((_ is ValueCellFull!7424) mapValue!25190)) b!844468))

(assert (= (and b!844469 ((_ is ValueCellFull!7424) mapDefault!25190)) b!844470))

(assert (= start!72844 b!844469))

(declare-fun m!787481 () Bool)

(assert (=> start!72844 m!787481))

(declare-fun m!787483 () Bool)

(assert (=> start!72844 m!787483))

(declare-fun m!787485 () Bool)

(assert (=> b!844471 m!787485))

(declare-fun m!787487 () Bool)

(assert (=> b!844466 m!787487))

(declare-fun m!787489 () Bool)

(assert (=> mapNonEmpty!25190 m!787489))

(declare-fun m!787491 () Bool)

(assert (=> b!844467 m!787491))

(check-sat (not mapNonEmpty!25190) tp_is_empty!15727 (not start!72844) (not b!844467) (not b!844471) (not b!844466))
(check-sat)
