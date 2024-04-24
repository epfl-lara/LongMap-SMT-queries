; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72826 () Bool)

(assert start!72826)

(declare-fun b!844277 () Bool)

(declare-fun e!471136 () Bool)

(assert (=> b!844277 (= e!471136 false)))

(declare-fun lt!381491 () Bool)

(declare-datatypes ((array!47699 0))(
  ( (array!47700 (arr!22876 (Array (_ BitVec 32) (_ BitVec 64))) (size!23317 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47699)

(declare-datatypes ((List!16163 0))(
  ( (Nil!16160) (Cons!16159 (h!17296 (_ BitVec 64)) (t!22526 List!16163)) )
))
(declare-fun arrayNoDuplicates!0 (array!47699 (_ BitVec 32) List!16163) Bool)

(assert (=> b!844277 (= lt!381491 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16160))))

(declare-fun b!844278 () Bool)

(declare-fun e!471139 () Bool)

(declare-fun tp_is_empty!15709 () Bool)

(assert (=> b!844278 (= e!471139 tp_is_empty!15709)))

(declare-fun b!844279 () Bool)

(declare-fun res!573466 () Bool)

(assert (=> b!844279 (=> (not res!573466) (not e!471136))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25993 0))(
  ( (V!25994 (val!7902 Int)) )
))
(declare-datatypes ((ValueCell!7415 0))(
  ( (ValueCellFull!7415 (v!10327 V!25993)) (EmptyCell!7415) )
))
(declare-datatypes ((array!47701 0))(
  ( (array!47702 (arr!22877 (Array (_ BitVec 32) ValueCell!7415)) (size!23318 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47701)

(assert (=> b!844279 (= res!573466 (and (= (size!23318 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23317 _keys!868) (size!23318 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844280 () Bool)

(declare-fun res!573468 () Bool)

(assert (=> b!844280 (=> (not res!573468) (not e!471136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47699 (_ BitVec 32)) Bool)

(assert (=> b!844280 (= res!573468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844281 () Bool)

(declare-fun e!471138 () Bool)

(declare-fun e!471135 () Bool)

(declare-fun mapRes!25163 () Bool)

(assert (=> b!844281 (= e!471138 (and e!471135 mapRes!25163))))

(declare-fun condMapEmpty!25163 () Bool)

(declare-fun mapDefault!25163 () ValueCell!7415)

(assert (=> b!844281 (= condMapEmpty!25163 (= (arr!22877 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7415)) mapDefault!25163)))))

(declare-fun mapIsEmpty!25163 () Bool)

(assert (=> mapIsEmpty!25163 mapRes!25163))

(declare-fun b!844282 () Bool)

(assert (=> b!844282 (= e!471135 tp_is_empty!15709)))

(declare-fun res!573467 () Bool)

(assert (=> start!72826 (=> (not res!573467) (not e!471136))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72826 (= res!573467 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23317 _keys!868))))))

(assert (=> start!72826 e!471136))

(assert (=> start!72826 true))

(declare-fun array_inv!18248 (array!47699) Bool)

(assert (=> start!72826 (array_inv!18248 _keys!868)))

(declare-fun array_inv!18249 (array!47701) Bool)

(assert (=> start!72826 (and (array_inv!18249 _values!688) e!471138)))

(declare-fun mapNonEmpty!25163 () Bool)

(declare-fun tp!48482 () Bool)

(assert (=> mapNonEmpty!25163 (= mapRes!25163 (and tp!48482 e!471139))))

(declare-fun mapValue!25163 () ValueCell!7415)

(declare-fun mapKey!25163 () (_ BitVec 32))

(declare-fun mapRest!25163 () (Array (_ BitVec 32) ValueCell!7415))

(assert (=> mapNonEmpty!25163 (= (arr!22877 _values!688) (store mapRest!25163 mapKey!25163 mapValue!25163))))

(declare-fun b!844283 () Bool)

(declare-fun res!573469 () Bool)

(assert (=> b!844283 (=> (not res!573469) (not e!471136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844283 (= res!573469 (validMask!0 mask!1196))))

(assert (= (and start!72826 res!573467) b!844283))

(assert (= (and b!844283 res!573469) b!844279))

(assert (= (and b!844279 res!573466) b!844280))

(assert (= (and b!844280 res!573468) b!844277))

(assert (= (and b!844281 condMapEmpty!25163) mapIsEmpty!25163))

(assert (= (and b!844281 (not condMapEmpty!25163)) mapNonEmpty!25163))

(get-info :version)

(assert (= (and mapNonEmpty!25163 ((_ is ValueCellFull!7415) mapValue!25163)) b!844278))

(assert (= (and b!844281 ((_ is ValueCellFull!7415) mapDefault!25163)) b!844282))

(assert (= start!72826 b!844281))

(declare-fun m!787373 () Bool)

(assert (=> b!844280 m!787373))

(declare-fun m!787375 () Bool)

(assert (=> mapNonEmpty!25163 m!787375))

(declare-fun m!787377 () Bool)

(assert (=> b!844277 m!787377))

(declare-fun m!787379 () Bool)

(assert (=> b!844283 m!787379))

(declare-fun m!787381 () Bool)

(assert (=> start!72826 m!787381))

(declare-fun m!787383 () Bool)

(assert (=> start!72826 m!787383))

(check-sat (not start!72826) (not b!844283) tp_is_empty!15709 (not b!844280) (not mapNonEmpty!25163) (not b!844277))
(check-sat)
