; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72624 () Bool)

(assert start!72624)

(declare-fun res!572920 () Bool)

(declare-fun e!470302 () Bool)

(assert (=> start!72624 (=> (not res!572920) (not e!470302))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47610 0))(
  ( (array!47611 (arr!22836 (Array (_ BitVec 32) (_ BitVec 64))) (size!23276 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47610)

(assert (=> start!72624 (= res!572920 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23276 _keys!868))))))

(assert (=> start!72624 e!470302))

(assert (=> start!72624 true))

(declare-fun array_inv!18168 (array!47610) Bool)

(assert (=> start!72624 (array_inv!18168 _keys!868)))

(declare-datatypes ((V!25947 0))(
  ( (V!25948 (val!7885 Int)) )
))
(declare-datatypes ((ValueCell!7398 0))(
  ( (ValueCellFull!7398 (v!10310 V!25947)) (EmptyCell!7398) )
))
(declare-datatypes ((array!47612 0))(
  ( (array!47613 (arr!22837 (Array (_ BitVec 32) ValueCell!7398)) (size!23277 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47612)

(declare-fun e!470298 () Bool)

(declare-fun array_inv!18169 (array!47612) Bool)

(assert (=> start!72624 (and (array_inv!18169 _values!688) e!470298)))

(declare-fun b!843017 () Bool)

(declare-fun e!470301 () Bool)

(declare-fun tp_is_empty!15675 () Bool)

(assert (=> b!843017 (= e!470301 tp_is_empty!15675)))

(declare-fun mapIsEmpty!25112 () Bool)

(declare-fun mapRes!25112 () Bool)

(assert (=> mapIsEmpty!25112 mapRes!25112))

(declare-fun b!843018 () Bool)

(declare-fun res!572918 () Bool)

(assert (=> b!843018 (=> (not res!572918) (not e!470302))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47610 (_ BitVec 32)) Bool)

(assert (=> b!843018 (= res!572918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843019 () Bool)

(declare-fun res!572919 () Bool)

(assert (=> b!843019 (=> (not res!572919) (not e!470302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843019 (= res!572919 (validMask!0 mask!1196))))

(declare-fun b!843020 () Bool)

(declare-fun e!470299 () Bool)

(assert (=> b!843020 (= e!470298 (and e!470299 mapRes!25112))))

(declare-fun condMapEmpty!25112 () Bool)

(declare-fun mapDefault!25112 () ValueCell!7398)

(assert (=> b!843020 (= condMapEmpty!25112 (= (arr!22837 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7398)) mapDefault!25112)))))

(declare-fun b!843021 () Bool)

(assert (=> b!843021 (= e!470302 false)))

(declare-fun lt!381079 () Bool)

(declare-datatypes ((List!16227 0))(
  ( (Nil!16224) (Cons!16223 (h!17354 (_ BitVec 64)) (t!22598 List!16227)) )
))
(declare-fun arrayNoDuplicates!0 (array!47610 (_ BitVec 32) List!16227) Bool)

(assert (=> b!843021 (= lt!381079 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16224))))

(declare-fun mapNonEmpty!25112 () Bool)

(declare-fun tp!48430 () Bool)

(assert (=> mapNonEmpty!25112 (= mapRes!25112 (and tp!48430 e!470301))))

(declare-fun mapKey!25112 () (_ BitVec 32))

(declare-fun mapValue!25112 () ValueCell!7398)

(declare-fun mapRest!25112 () (Array (_ BitVec 32) ValueCell!7398))

(assert (=> mapNonEmpty!25112 (= (arr!22837 _values!688) (store mapRest!25112 mapKey!25112 mapValue!25112))))

(declare-fun b!843022 () Bool)

(assert (=> b!843022 (= e!470299 tp_is_empty!15675)))

(declare-fun b!843023 () Bool)

(declare-fun res!572921 () Bool)

(assert (=> b!843023 (=> (not res!572921) (not e!470302))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843023 (= res!572921 (and (= (size!23277 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23276 _keys!868) (size!23277 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72624 res!572920) b!843019))

(assert (= (and b!843019 res!572919) b!843023))

(assert (= (and b!843023 res!572921) b!843018))

(assert (= (and b!843018 res!572918) b!843021))

(assert (= (and b!843020 condMapEmpty!25112) mapIsEmpty!25112))

(assert (= (and b!843020 (not condMapEmpty!25112)) mapNonEmpty!25112))

(get-info :version)

(assert (= (and mapNonEmpty!25112 ((_ is ValueCellFull!7398) mapValue!25112)) b!843017))

(assert (= (and b!843020 ((_ is ValueCellFull!7398) mapDefault!25112)) b!843022))

(assert (= start!72624 b!843020))

(declare-fun m!785877 () Bool)

(assert (=> b!843019 m!785877))

(declare-fun m!785879 () Bool)

(assert (=> start!72624 m!785879))

(declare-fun m!785881 () Bool)

(assert (=> start!72624 m!785881))

(declare-fun m!785883 () Bool)

(assert (=> b!843018 m!785883))

(declare-fun m!785885 () Bool)

(assert (=> mapNonEmpty!25112 m!785885))

(declare-fun m!785887 () Bool)

(assert (=> b!843021 m!785887))

(check-sat (not b!843018) (not start!72624) (not mapNonEmpty!25112) tp_is_empty!15675 (not b!843021) (not b!843019))
(check-sat)
