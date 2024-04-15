; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72196 () Bool)

(assert start!72196)

(declare-fun b!836742 () Bool)

(declare-fun res!569173 () Bool)

(declare-fun e!466906 () Bool)

(assert (=> b!836742 (=> (not res!569173) (not e!466906))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836742 (= res!569173 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24533 () Bool)

(declare-fun mapRes!24533 () Bool)

(assert (=> mapIsEmpty!24533 mapRes!24533))

(declare-fun b!836744 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!46857 0))(
  ( (array!46858 (arr!22463 (Array (_ BitVec 32) (_ BitVec 64))) (size!22905 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46857)

(declare-datatypes ((V!25441 0))(
  ( (V!25442 (val!7695 Int)) )
))
(declare-datatypes ((ValueCell!7208 0))(
  ( (ValueCellFull!7208 (v!10113 V!25441)) (EmptyCell!7208) )
))
(declare-datatypes ((array!46859 0))(
  ( (array!46860 (arr!22464 (Array (_ BitVec 32) ValueCell!7208)) (size!22906 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46859)

(assert (=> b!836744 (= e!466906 (and (= (size!22906 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22905 _keys!868) (size!22906 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (= (size!22905 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)) (bvsgt #b00000000000000000000000000000000 (size!22905 _keys!868))))))

(declare-fun mapNonEmpty!24533 () Bool)

(declare-fun tp!47528 () Bool)

(declare-fun e!466902 () Bool)

(assert (=> mapNonEmpty!24533 (= mapRes!24533 (and tp!47528 e!466902))))

(declare-fun mapValue!24533 () ValueCell!7208)

(declare-fun mapKey!24533 () (_ BitVec 32))

(declare-fun mapRest!24533 () (Array (_ BitVec 32) ValueCell!7208))

(assert (=> mapNonEmpty!24533 (= (arr!22464 _values!688) (store mapRest!24533 mapKey!24533 mapValue!24533))))

(declare-fun b!836745 () Bool)

(declare-fun e!466904 () Bool)

(declare-fun e!466903 () Bool)

(assert (=> b!836745 (= e!466904 (and e!466903 mapRes!24533))))

(declare-fun condMapEmpty!24533 () Bool)

(declare-fun mapDefault!24533 () ValueCell!7208)

(assert (=> b!836745 (= condMapEmpty!24533 (= (arr!22464 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7208)) mapDefault!24533)))))

(declare-fun b!836746 () Bool)

(declare-fun tp_is_empty!15295 () Bool)

(assert (=> b!836746 (= e!466902 tp_is_empty!15295)))

(declare-fun res!569172 () Bool)

(assert (=> start!72196 (=> (not res!569172) (not e!466906))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72196 (= res!569172 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22905 _keys!868))))))

(assert (=> start!72196 e!466906))

(assert (=> start!72196 true))

(declare-fun array_inv!17974 (array!46857) Bool)

(assert (=> start!72196 (array_inv!17974 _keys!868)))

(declare-fun array_inv!17975 (array!46859) Bool)

(assert (=> start!72196 (and (array_inv!17975 _values!688) e!466904)))

(declare-fun b!836743 () Bool)

(assert (=> b!836743 (= e!466903 tp_is_empty!15295)))

(assert (= (and start!72196 res!569172) b!836742))

(assert (= (and b!836742 res!569173) b!836744))

(assert (= (and b!836745 condMapEmpty!24533) mapIsEmpty!24533))

(assert (= (and b!836745 (not condMapEmpty!24533)) mapNonEmpty!24533))

(get-info :version)

(assert (= (and mapNonEmpty!24533 ((_ is ValueCellFull!7208) mapValue!24533)) b!836746))

(assert (= (and b!836745 ((_ is ValueCellFull!7208) mapDefault!24533)) b!836743))

(assert (= start!72196 b!836745))

(declare-fun m!781283 () Bool)

(assert (=> b!836742 m!781283))

(declare-fun m!781285 () Bool)

(assert (=> mapNonEmpty!24533 m!781285))

(declare-fun m!781287 () Bool)

(assert (=> start!72196 m!781287))

(declare-fun m!781289 () Bool)

(assert (=> start!72196 m!781289))

(check-sat (not b!836742) (not start!72196) (not mapNonEmpty!24533) tp_is_empty!15295)
(check-sat)
