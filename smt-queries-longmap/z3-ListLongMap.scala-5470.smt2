; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72586 () Bool)

(assert start!72586)

(declare-fun b!842568 () Bool)

(declare-fun e!470004 () Bool)

(assert (=> b!842568 (= e!470004 false)))

(declare-fun lt!380813 () Bool)

(declare-datatypes ((array!47559 0))(
  ( (array!47560 (arr!22811 (Array (_ BitVec 32) (_ BitVec 64))) (size!23253 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47559)

(declare-datatypes ((List!16235 0))(
  ( (Nil!16232) (Cons!16231 (h!17362 (_ BitVec 64)) (t!22597 List!16235)) )
))
(declare-fun arrayNoDuplicates!0 (array!47559 (_ BitVec 32) List!16235) Bool)

(assert (=> b!842568 (= lt!380813 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16232))))

(declare-fun b!842569 () Bool)

(declare-fun res!572691 () Bool)

(assert (=> b!842569 (=> (not res!572691) (not e!470004))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842569 (= res!572691 (validMask!0 mask!1196))))

(declare-fun b!842570 () Bool)

(declare-fun e!470002 () Bool)

(declare-fun tp_is_empty!15655 () Bool)

(assert (=> b!842570 (= e!470002 tp_is_empty!15655)))

(declare-fun b!842571 () Bool)

(declare-fun res!572690 () Bool)

(assert (=> b!842571 (=> (not res!572690) (not e!470004))))

(declare-datatypes ((V!25921 0))(
  ( (V!25922 (val!7875 Int)) )
))
(declare-datatypes ((ValueCell!7388 0))(
  ( (ValueCellFull!7388 (v!10294 V!25921)) (EmptyCell!7388) )
))
(declare-datatypes ((array!47561 0))(
  ( (array!47562 (arr!22812 (Array (_ BitVec 32) ValueCell!7388)) (size!23254 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47561)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842571 (= res!572690 (and (= (size!23254 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23253 _keys!868) (size!23254 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842572 () Bool)

(declare-fun res!572688 () Bool)

(assert (=> b!842572 (=> (not res!572688) (not e!470004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47559 (_ BitVec 32)) Bool)

(assert (=> b!842572 (= res!572688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25082 () Bool)

(declare-fun mapRes!25082 () Bool)

(declare-fun tp!48401 () Bool)

(declare-fun e!470000 () Bool)

(assert (=> mapNonEmpty!25082 (= mapRes!25082 (and tp!48401 e!470000))))

(declare-fun mapKey!25082 () (_ BitVec 32))

(declare-fun mapValue!25082 () ValueCell!7388)

(declare-fun mapRest!25082 () (Array (_ BitVec 32) ValueCell!7388))

(assert (=> mapNonEmpty!25082 (= (arr!22812 _values!688) (store mapRest!25082 mapKey!25082 mapValue!25082))))

(declare-fun res!572689 () Bool)

(assert (=> start!72586 (=> (not res!572689) (not e!470004))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72586 (= res!572689 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23253 _keys!868))))))

(assert (=> start!72586 e!470004))

(assert (=> start!72586 true))

(declare-fun array_inv!18218 (array!47559) Bool)

(assert (=> start!72586 (array_inv!18218 _keys!868)))

(declare-fun e!470001 () Bool)

(declare-fun array_inv!18219 (array!47561) Bool)

(assert (=> start!72586 (and (array_inv!18219 _values!688) e!470001)))

(declare-fun mapIsEmpty!25082 () Bool)

(assert (=> mapIsEmpty!25082 mapRes!25082))

(declare-fun b!842573 () Bool)

(assert (=> b!842573 (= e!470001 (and e!470002 mapRes!25082))))

(declare-fun condMapEmpty!25082 () Bool)

(declare-fun mapDefault!25082 () ValueCell!7388)

(assert (=> b!842573 (= condMapEmpty!25082 (= (arr!22812 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7388)) mapDefault!25082)))))

(declare-fun b!842574 () Bool)

(assert (=> b!842574 (= e!470000 tp_is_empty!15655)))

(assert (= (and start!72586 res!572689) b!842569))

(assert (= (and b!842569 res!572691) b!842571))

(assert (= (and b!842571 res!572690) b!842572))

(assert (= (and b!842572 res!572688) b!842568))

(assert (= (and b!842573 condMapEmpty!25082) mapIsEmpty!25082))

(assert (= (and b!842573 (not condMapEmpty!25082)) mapNonEmpty!25082))

(get-info :version)

(assert (= (and mapNonEmpty!25082 ((_ is ValueCellFull!7388) mapValue!25082)) b!842574))

(assert (= (and b!842573 ((_ is ValueCellFull!7388) mapDefault!25082)) b!842570))

(assert (= start!72586 b!842573))

(declare-fun m!785003 () Bool)

(assert (=> start!72586 m!785003))

(declare-fun m!785005 () Bool)

(assert (=> start!72586 m!785005))

(declare-fun m!785007 () Bool)

(assert (=> b!842572 m!785007))

(declare-fun m!785009 () Bool)

(assert (=> mapNonEmpty!25082 m!785009))

(declare-fun m!785011 () Bool)

(assert (=> b!842568 m!785011))

(declare-fun m!785013 () Bool)

(assert (=> b!842569 m!785013))

(check-sat (not b!842568) (not start!72586) (not b!842569) (not b!842572) tp_is_empty!15655 (not mapNonEmpty!25082))
(check-sat)
