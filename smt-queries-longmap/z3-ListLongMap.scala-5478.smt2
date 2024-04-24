; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72820 () Bool)

(assert start!72820)

(declare-fun b!844214 () Bool)

(declare-fun e!471093 () Bool)

(declare-fun tp_is_empty!15703 () Bool)

(assert (=> b!844214 (= e!471093 tp_is_empty!15703)))

(declare-fun mapIsEmpty!25154 () Bool)

(declare-fun mapRes!25154 () Bool)

(assert (=> mapIsEmpty!25154 mapRes!25154))

(declare-fun res!573431 () Bool)

(declare-fun e!471092 () Bool)

(assert (=> start!72820 (=> (not res!573431) (not e!471092))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47687 0))(
  ( (array!47688 (arr!22870 (Array (_ BitVec 32) (_ BitVec 64))) (size!23311 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47687)

(assert (=> start!72820 (= res!573431 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23311 _keys!868))))))

(assert (=> start!72820 e!471092))

(assert (=> start!72820 true))

(declare-fun array_inv!18242 (array!47687) Bool)

(assert (=> start!72820 (array_inv!18242 _keys!868)))

(declare-datatypes ((V!25985 0))(
  ( (V!25986 (val!7899 Int)) )
))
(declare-datatypes ((ValueCell!7412 0))(
  ( (ValueCellFull!7412 (v!10324 V!25985)) (EmptyCell!7412) )
))
(declare-datatypes ((array!47689 0))(
  ( (array!47690 (arr!22871 (Array (_ BitVec 32) ValueCell!7412)) (size!23312 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47689)

(declare-fun e!471094 () Bool)

(declare-fun array_inv!18243 (array!47689) Bool)

(assert (=> start!72820 (and (array_inv!18243 _values!688) e!471094)))

(declare-fun b!844215 () Bool)

(declare-fun res!573430 () Bool)

(assert (=> b!844215 (=> (not res!573430) (not e!471092))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!844215 (= res!573430 (and (= (size!23312 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23311 _keys!868) (size!23312 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844216 () Bool)

(declare-fun res!573433 () Bool)

(assert (=> b!844216 (=> (not res!573433) (not e!471092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47687 (_ BitVec 32)) Bool)

(assert (=> b!844216 (= res!573433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844217 () Bool)

(assert (=> b!844217 (= e!471092 false)))

(declare-fun lt!381482 () Bool)

(declare-datatypes ((List!16161 0))(
  ( (Nil!16158) (Cons!16157 (h!17294 (_ BitVec 64)) (t!22524 List!16161)) )
))
(declare-fun arrayNoDuplicates!0 (array!47687 (_ BitVec 32) List!16161) Bool)

(assert (=> b!844217 (= lt!381482 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16158))))

(declare-fun b!844218 () Bool)

(declare-fun e!471091 () Bool)

(assert (=> b!844218 (= e!471091 tp_is_empty!15703)))

(declare-fun b!844219 () Bool)

(declare-fun res!573432 () Bool)

(assert (=> b!844219 (=> (not res!573432) (not e!471092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844219 (= res!573432 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25154 () Bool)

(declare-fun tp!48473 () Bool)

(assert (=> mapNonEmpty!25154 (= mapRes!25154 (and tp!48473 e!471091))))

(declare-fun mapValue!25154 () ValueCell!7412)

(declare-fun mapKey!25154 () (_ BitVec 32))

(declare-fun mapRest!25154 () (Array (_ BitVec 32) ValueCell!7412))

(assert (=> mapNonEmpty!25154 (= (arr!22871 _values!688) (store mapRest!25154 mapKey!25154 mapValue!25154))))

(declare-fun b!844220 () Bool)

(assert (=> b!844220 (= e!471094 (and e!471093 mapRes!25154))))

(declare-fun condMapEmpty!25154 () Bool)

(declare-fun mapDefault!25154 () ValueCell!7412)

(assert (=> b!844220 (= condMapEmpty!25154 (= (arr!22871 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7412)) mapDefault!25154)))))

(assert (= (and start!72820 res!573431) b!844219))

(assert (= (and b!844219 res!573432) b!844215))

(assert (= (and b!844215 res!573430) b!844216))

(assert (= (and b!844216 res!573433) b!844217))

(assert (= (and b!844220 condMapEmpty!25154) mapIsEmpty!25154))

(assert (= (and b!844220 (not condMapEmpty!25154)) mapNonEmpty!25154))

(get-info :version)

(assert (= (and mapNonEmpty!25154 ((_ is ValueCellFull!7412) mapValue!25154)) b!844218))

(assert (= (and b!844220 ((_ is ValueCellFull!7412) mapDefault!25154)) b!844214))

(assert (= start!72820 b!844220))

(declare-fun m!787337 () Bool)

(assert (=> mapNonEmpty!25154 m!787337))

(declare-fun m!787339 () Bool)

(assert (=> b!844217 m!787339))

(declare-fun m!787341 () Bool)

(assert (=> b!844216 m!787341))

(declare-fun m!787343 () Bool)

(assert (=> start!72820 m!787343))

(declare-fun m!787345 () Bool)

(assert (=> start!72820 m!787345))

(declare-fun m!787347 () Bool)

(assert (=> b!844219 m!787347))

(check-sat (not mapNonEmpty!25154) (not b!844216) (not b!844219) tp_is_empty!15703 (not b!844217) (not start!72820))
(check-sat)
