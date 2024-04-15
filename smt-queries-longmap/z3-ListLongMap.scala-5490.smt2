; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72706 () Bool)

(assert start!72706)

(declare-fun b!843828 () Bool)

(declare-fun e!470904 () Bool)

(declare-fun tp_is_empty!15775 () Bool)

(assert (=> b!843828 (= e!470904 tp_is_empty!15775)))

(declare-fun b!843829 () Bool)

(declare-fun e!470900 () Bool)

(assert (=> b!843829 (= e!470900 tp_is_empty!15775)))

(declare-fun b!843830 () Bool)

(declare-fun e!470902 () Bool)

(assert (=> b!843830 (= e!470902 false)))

(declare-fun lt!380993 () Bool)

(declare-datatypes ((array!47787 0))(
  ( (array!47788 (arr!22925 (Array (_ BitVec 32) (_ BitVec 64))) (size!23367 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47787)

(declare-datatypes ((List!16278 0))(
  ( (Nil!16275) (Cons!16274 (h!17405 (_ BitVec 64)) (t!22640 List!16278)) )
))
(declare-fun arrayNoDuplicates!0 (array!47787 (_ BitVec 32) List!16278) Bool)

(assert (=> b!843830 (= lt!380993 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16275))))

(declare-fun b!843831 () Bool)

(declare-fun e!470903 () Bool)

(declare-fun mapRes!25262 () Bool)

(assert (=> b!843831 (= e!470903 (and e!470900 mapRes!25262))))

(declare-fun condMapEmpty!25262 () Bool)

(declare-datatypes ((V!26081 0))(
  ( (V!26082 (val!7935 Int)) )
))
(declare-datatypes ((ValueCell!7448 0))(
  ( (ValueCellFull!7448 (v!10354 V!26081)) (EmptyCell!7448) )
))
(declare-datatypes ((array!47789 0))(
  ( (array!47790 (arr!22926 (Array (_ BitVec 32) ValueCell!7448)) (size!23368 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47789)

(declare-fun mapDefault!25262 () ValueCell!7448)

(assert (=> b!843831 (= condMapEmpty!25262 (= (arr!22926 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7448)) mapDefault!25262)))))

(declare-fun mapIsEmpty!25262 () Bool)

(assert (=> mapIsEmpty!25262 mapRes!25262))

(declare-fun b!843832 () Bool)

(declare-fun res!573408 () Bool)

(assert (=> b!843832 (=> (not res!573408) (not e!470902))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47787 (_ BitVec 32)) Bool)

(assert (=> b!843832 (= res!573408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573409 () Bool)

(assert (=> start!72706 (=> (not res!573409) (not e!470902))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72706 (= res!573409 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23367 _keys!868))))))

(assert (=> start!72706 e!470902))

(assert (=> start!72706 true))

(declare-fun array_inv!18306 (array!47787) Bool)

(assert (=> start!72706 (array_inv!18306 _keys!868)))

(declare-fun array_inv!18307 (array!47789) Bool)

(assert (=> start!72706 (and (array_inv!18307 _values!688) e!470903)))

(declare-fun mapNonEmpty!25262 () Bool)

(declare-fun tp!48581 () Bool)

(assert (=> mapNonEmpty!25262 (= mapRes!25262 (and tp!48581 e!470904))))

(declare-fun mapRest!25262 () (Array (_ BitVec 32) ValueCell!7448))

(declare-fun mapKey!25262 () (_ BitVec 32))

(declare-fun mapValue!25262 () ValueCell!7448)

(assert (=> mapNonEmpty!25262 (= (arr!22926 _values!688) (store mapRest!25262 mapKey!25262 mapValue!25262))))

(declare-fun b!843833 () Bool)

(declare-fun res!573410 () Bool)

(assert (=> b!843833 (=> (not res!573410) (not e!470902))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843833 (= res!573410 (and (= (size!23368 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23367 _keys!868) (size!23368 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843834 () Bool)

(declare-fun res!573411 () Bool)

(assert (=> b!843834 (=> (not res!573411) (not e!470902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843834 (= res!573411 (validMask!0 mask!1196))))

(assert (= (and start!72706 res!573409) b!843834))

(assert (= (and b!843834 res!573411) b!843833))

(assert (= (and b!843833 res!573410) b!843832))

(assert (= (and b!843832 res!573408) b!843830))

(assert (= (and b!843831 condMapEmpty!25262) mapIsEmpty!25262))

(assert (= (and b!843831 (not condMapEmpty!25262)) mapNonEmpty!25262))

(get-info :version)

(assert (= (and mapNonEmpty!25262 ((_ is ValueCellFull!7448) mapValue!25262)) b!843828))

(assert (= (and b!843831 ((_ is ValueCellFull!7448) mapDefault!25262)) b!843829))

(assert (= start!72706 b!843831))

(declare-fun m!785723 () Bool)

(assert (=> b!843830 m!785723))

(declare-fun m!785725 () Bool)

(assert (=> start!72706 m!785725))

(declare-fun m!785727 () Bool)

(assert (=> start!72706 m!785727))

(declare-fun m!785729 () Bool)

(assert (=> b!843834 m!785729))

(declare-fun m!785731 () Bool)

(assert (=> b!843832 m!785731))

(declare-fun m!785733 () Bool)

(assert (=> mapNonEmpty!25262 m!785733))

(check-sat (not b!843834) (not b!843830) (not b!843832) (not start!72706) tp_is_empty!15775 (not mapNonEmpty!25262))
(check-sat)
