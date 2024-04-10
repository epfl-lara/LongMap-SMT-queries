; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72744 () Bool)

(assert start!72744)

(declare-fun b!844277 () Bool)

(declare-fun e!471200 () Bool)

(declare-fun tp_is_empty!15795 () Bool)

(assert (=> b!844277 (= e!471200 tp_is_empty!15795)))

(declare-fun b!844278 () Bool)

(declare-fun e!471198 () Bool)

(assert (=> b!844278 (= e!471198 false)))

(declare-fun lt!381259 () Bool)

(declare-datatypes ((array!47826 0))(
  ( (array!47827 (arr!22944 (Array (_ BitVec 32) (_ BitVec 64))) (size!23384 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47826)

(declare-datatypes ((List!16266 0))(
  ( (Nil!16263) (Cons!16262 (h!17393 (_ BitVec 64)) (t!22637 List!16266)) )
))
(declare-fun arrayNoDuplicates!0 (array!47826 (_ BitVec 32) List!16266) Bool)

(assert (=> b!844278 (= lt!381259 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16263))))

(declare-fun res!573640 () Bool)

(assert (=> start!72744 (=> (not res!573640) (not e!471198))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72744 (= res!573640 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23384 _keys!868))))))

(assert (=> start!72744 e!471198))

(assert (=> start!72744 true))

(declare-fun array_inv!18248 (array!47826) Bool)

(assert (=> start!72744 (array_inv!18248 _keys!868)))

(declare-datatypes ((V!26107 0))(
  ( (V!26108 (val!7945 Int)) )
))
(declare-datatypes ((ValueCell!7458 0))(
  ( (ValueCellFull!7458 (v!10370 V!26107)) (EmptyCell!7458) )
))
(declare-datatypes ((array!47828 0))(
  ( (array!47829 (arr!22945 (Array (_ BitVec 32) ValueCell!7458)) (size!23385 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47828)

(declare-fun e!471201 () Bool)

(declare-fun array_inv!18249 (array!47828) Bool)

(assert (=> start!72744 (and (array_inv!18249 _values!688) e!471201)))

(declare-fun mapNonEmpty!25292 () Bool)

(declare-fun mapRes!25292 () Bool)

(declare-fun tp!48610 () Bool)

(assert (=> mapNonEmpty!25292 (= mapRes!25292 (and tp!48610 e!471200))))

(declare-fun mapValue!25292 () ValueCell!7458)

(declare-fun mapRest!25292 () (Array (_ BitVec 32) ValueCell!7458))

(declare-fun mapKey!25292 () (_ BitVec 32))

(assert (=> mapNonEmpty!25292 (= (arr!22945 _values!688) (store mapRest!25292 mapKey!25292 mapValue!25292))))

(declare-fun b!844279 () Bool)

(declare-fun e!471199 () Bool)

(assert (=> b!844279 (= e!471201 (and e!471199 mapRes!25292))))

(declare-fun condMapEmpty!25292 () Bool)

(declare-fun mapDefault!25292 () ValueCell!7458)

(assert (=> b!844279 (= condMapEmpty!25292 (= (arr!22945 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7458)) mapDefault!25292)))))

(declare-fun b!844280 () Bool)

(declare-fun res!573638 () Bool)

(assert (=> b!844280 (=> (not res!573638) (not e!471198))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47826 (_ BitVec 32)) Bool)

(assert (=> b!844280 (= res!573638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844281 () Bool)

(assert (=> b!844281 (= e!471199 tp_is_empty!15795)))

(declare-fun b!844282 () Bool)

(declare-fun res!573639 () Bool)

(assert (=> b!844282 (=> (not res!573639) (not e!471198))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844282 (= res!573639 (and (= (size!23385 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23384 _keys!868) (size!23385 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25292 () Bool)

(assert (=> mapIsEmpty!25292 mapRes!25292))

(declare-fun b!844283 () Bool)

(declare-fun res!573641 () Bool)

(assert (=> b!844283 (=> (not res!573641) (not e!471198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844283 (= res!573641 (validMask!0 mask!1196))))

(assert (= (and start!72744 res!573640) b!844283))

(assert (= (and b!844283 res!573641) b!844282))

(assert (= (and b!844282 res!573639) b!844280))

(assert (= (and b!844280 res!573638) b!844278))

(assert (= (and b!844279 condMapEmpty!25292) mapIsEmpty!25292))

(assert (= (and b!844279 (not condMapEmpty!25292)) mapNonEmpty!25292))

(get-info :version)

(assert (= (and mapNonEmpty!25292 ((_ is ValueCellFull!7458) mapValue!25292)) b!844277))

(assert (= (and b!844279 ((_ is ValueCellFull!7458) mapDefault!25292)) b!844281))

(assert (= start!72744 b!844279))

(declare-fun m!786597 () Bool)

(assert (=> b!844280 m!786597))

(declare-fun m!786599 () Bool)

(assert (=> start!72744 m!786599))

(declare-fun m!786601 () Bool)

(assert (=> start!72744 m!786601))

(declare-fun m!786603 () Bool)

(assert (=> b!844278 m!786603))

(declare-fun m!786605 () Bool)

(assert (=> b!844283 m!786605))

(declare-fun m!786607 () Bool)

(assert (=> mapNonEmpty!25292 m!786607))

(check-sat (not b!844283) (not b!844278) (not start!72744) (not mapNonEmpty!25292) (not b!844280) tp_is_empty!15795)
(check-sat)
