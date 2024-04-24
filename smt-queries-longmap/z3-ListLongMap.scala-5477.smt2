; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72814 () Bool)

(assert start!72814)

(declare-fun b!844151 () Bool)

(declare-fun res!573397 () Bool)

(declare-fun e!471049 () Bool)

(assert (=> b!844151 (=> (not res!573397) (not e!471049))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47675 0))(
  ( (array!47676 (arr!22864 (Array (_ BitVec 32) (_ BitVec 64))) (size!23305 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47675)

(declare-datatypes ((V!25977 0))(
  ( (V!25978 (val!7896 Int)) )
))
(declare-datatypes ((ValueCell!7409 0))(
  ( (ValueCellFull!7409 (v!10321 V!25977)) (EmptyCell!7409) )
))
(declare-datatypes ((array!47677 0))(
  ( (array!47678 (arr!22865 (Array (_ BitVec 32) ValueCell!7409)) (size!23306 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47677)

(assert (=> b!844151 (= res!573397 (and (= (size!23306 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23305 _keys!868) (size!23306 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844152 () Bool)

(declare-fun res!573396 () Bool)

(assert (=> b!844152 (=> (not res!573396) (not e!471049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47675 (_ BitVec 32)) Bool)

(assert (=> b!844152 (= res!573396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573394 () Bool)

(assert (=> start!72814 (=> (not res!573394) (not e!471049))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72814 (= res!573394 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23305 _keys!868))))))

(assert (=> start!72814 e!471049))

(assert (=> start!72814 true))

(declare-fun array_inv!18238 (array!47675) Bool)

(assert (=> start!72814 (array_inv!18238 _keys!868)))

(declare-fun e!471046 () Bool)

(declare-fun array_inv!18239 (array!47677) Bool)

(assert (=> start!72814 (and (array_inv!18239 _values!688) e!471046)))

(declare-fun b!844153 () Bool)

(declare-fun e!471045 () Bool)

(declare-fun mapRes!25145 () Bool)

(assert (=> b!844153 (= e!471046 (and e!471045 mapRes!25145))))

(declare-fun condMapEmpty!25145 () Bool)

(declare-fun mapDefault!25145 () ValueCell!7409)

(assert (=> b!844153 (= condMapEmpty!25145 (= (arr!22865 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7409)) mapDefault!25145)))))

(declare-fun b!844154 () Bool)

(declare-fun res!573395 () Bool)

(assert (=> b!844154 (=> (not res!573395) (not e!471049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844154 (= res!573395 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25145 () Bool)

(assert (=> mapIsEmpty!25145 mapRes!25145))

(declare-fun b!844155 () Bool)

(declare-fun e!471048 () Bool)

(declare-fun tp_is_empty!15697 () Bool)

(assert (=> b!844155 (= e!471048 tp_is_empty!15697)))

(declare-fun b!844156 () Bool)

(assert (=> b!844156 (= e!471049 false)))

(declare-fun lt!381473 () Bool)

(declare-datatypes ((List!16160 0))(
  ( (Nil!16157) (Cons!16156 (h!17293 (_ BitVec 64)) (t!22523 List!16160)) )
))
(declare-fun arrayNoDuplicates!0 (array!47675 (_ BitVec 32) List!16160) Bool)

(assert (=> b!844156 (= lt!381473 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16157))))

(declare-fun mapNonEmpty!25145 () Bool)

(declare-fun tp!48464 () Bool)

(assert (=> mapNonEmpty!25145 (= mapRes!25145 (and tp!48464 e!471048))))

(declare-fun mapRest!25145 () (Array (_ BitVec 32) ValueCell!7409))

(declare-fun mapKey!25145 () (_ BitVec 32))

(declare-fun mapValue!25145 () ValueCell!7409)

(assert (=> mapNonEmpty!25145 (= (arr!22865 _values!688) (store mapRest!25145 mapKey!25145 mapValue!25145))))

(declare-fun b!844157 () Bool)

(assert (=> b!844157 (= e!471045 tp_is_empty!15697)))

(assert (= (and start!72814 res!573394) b!844154))

(assert (= (and b!844154 res!573395) b!844151))

(assert (= (and b!844151 res!573397) b!844152))

(assert (= (and b!844152 res!573396) b!844156))

(assert (= (and b!844153 condMapEmpty!25145) mapIsEmpty!25145))

(assert (= (and b!844153 (not condMapEmpty!25145)) mapNonEmpty!25145))

(get-info :version)

(assert (= (and mapNonEmpty!25145 ((_ is ValueCellFull!7409) mapValue!25145)) b!844155))

(assert (= (and b!844153 ((_ is ValueCellFull!7409) mapDefault!25145)) b!844157))

(assert (= start!72814 b!844153))

(declare-fun m!787301 () Bool)

(assert (=> b!844154 m!787301))

(declare-fun m!787303 () Bool)

(assert (=> start!72814 m!787303))

(declare-fun m!787305 () Bool)

(assert (=> start!72814 m!787305))

(declare-fun m!787307 () Bool)

(assert (=> b!844152 m!787307))

(declare-fun m!787309 () Bool)

(assert (=> mapNonEmpty!25145 m!787309))

(declare-fun m!787311 () Bool)

(assert (=> b!844156 m!787311))

(check-sat (not mapNonEmpty!25145) (not b!844156) tp_is_empty!15697 (not b!844152) (not start!72814) (not b!844154))
(check-sat)
