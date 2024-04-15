; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72688 () Bool)

(assert start!72688)

(declare-fun b!843639 () Bool)

(declare-fun res!573302 () Bool)

(declare-fun e!470769 () Bool)

(assert (=> b!843639 (=> (not res!573302) (not e!470769))))

(declare-datatypes ((array!47753 0))(
  ( (array!47754 (arr!22908 (Array (_ BitVec 32) (_ BitVec 64))) (size!23350 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47753)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47753 (_ BitVec 32)) Bool)

(assert (=> b!843639 (= res!573302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25235 () Bool)

(declare-fun mapRes!25235 () Bool)

(declare-fun tp!48554 () Bool)

(declare-fun e!470767 () Bool)

(assert (=> mapNonEmpty!25235 (= mapRes!25235 (and tp!48554 e!470767))))

(declare-datatypes ((V!26057 0))(
  ( (V!26058 (val!7926 Int)) )
))
(declare-datatypes ((ValueCell!7439 0))(
  ( (ValueCellFull!7439 (v!10345 V!26057)) (EmptyCell!7439) )
))
(declare-fun mapValue!25235 () ValueCell!7439)

(declare-fun mapKey!25235 () (_ BitVec 32))

(declare-datatypes ((array!47755 0))(
  ( (array!47756 (arr!22909 (Array (_ BitVec 32) ValueCell!7439)) (size!23351 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47755)

(declare-fun mapRest!25235 () (Array (_ BitVec 32) ValueCell!7439))

(assert (=> mapNonEmpty!25235 (= (arr!22909 _values!688) (store mapRest!25235 mapKey!25235 mapValue!25235))))

(declare-fun b!843640 () Bool)

(declare-fun res!573300 () Bool)

(assert (=> b!843640 (=> (not res!573300) (not e!470769))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843640 (= res!573300 (and (= (size!23351 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23350 _keys!868) (size!23351 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843642 () Bool)

(declare-fun e!470768 () Bool)

(declare-fun tp_is_empty!15757 () Bool)

(assert (=> b!843642 (= e!470768 tp_is_empty!15757)))

(declare-fun b!843643 () Bool)

(assert (=> b!843643 (= e!470767 tp_is_empty!15757)))

(declare-fun b!843644 () Bool)

(declare-fun res!573303 () Bool)

(assert (=> b!843644 (=> (not res!573303) (not e!470769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843644 (= res!573303 (validMask!0 mask!1196))))

(declare-fun res!573301 () Bool)

(assert (=> start!72688 (=> (not res!573301) (not e!470769))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72688 (= res!573301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23350 _keys!868))))))

(assert (=> start!72688 e!470769))

(assert (=> start!72688 true))

(declare-fun array_inv!18296 (array!47753) Bool)

(assert (=> start!72688 (array_inv!18296 _keys!868)))

(declare-fun e!470765 () Bool)

(declare-fun array_inv!18297 (array!47755) Bool)

(assert (=> start!72688 (and (array_inv!18297 _values!688) e!470765)))

(declare-fun b!843641 () Bool)

(assert (=> b!843641 (= e!470769 false)))

(declare-fun lt!380966 () Bool)

(declare-datatypes ((List!16271 0))(
  ( (Nil!16268) (Cons!16267 (h!17398 (_ BitVec 64)) (t!22633 List!16271)) )
))
(declare-fun arrayNoDuplicates!0 (array!47753 (_ BitVec 32) List!16271) Bool)

(assert (=> b!843641 (= lt!380966 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16268))))

(declare-fun mapIsEmpty!25235 () Bool)

(assert (=> mapIsEmpty!25235 mapRes!25235))

(declare-fun b!843645 () Bool)

(assert (=> b!843645 (= e!470765 (and e!470768 mapRes!25235))))

(declare-fun condMapEmpty!25235 () Bool)

(declare-fun mapDefault!25235 () ValueCell!7439)

(assert (=> b!843645 (= condMapEmpty!25235 (= (arr!22909 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7439)) mapDefault!25235)))))

(assert (= (and start!72688 res!573301) b!843644))

(assert (= (and b!843644 res!573303) b!843640))

(assert (= (and b!843640 res!573300) b!843639))

(assert (= (and b!843639 res!573302) b!843641))

(assert (= (and b!843645 condMapEmpty!25235) mapIsEmpty!25235))

(assert (= (and b!843645 (not condMapEmpty!25235)) mapNonEmpty!25235))

(get-info :version)

(assert (= (and mapNonEmpty!25235 ((_ is ValueCellFull!7439) mapValue!25235)) b!843643))

(assert (= (and b!843645 ((_ is ValueCellFull!7439) mapDefault!25235)) b!843642))

(assert (= start!72688 b!843645))

(declare-fun m!785615 () Bool)

(assert (=> b!843644 m!785615))

(declare-fun m!785617 () Bool)

(assert (=> mapNonEmpty!25235 m!785617))

(declare-fun m!785619 () Bool)

(assert (=> b!843639 m!785619))

(declare-fun m!785621 () Bool)

(assert (=> start!72688 m!785621))

(declare-fun m!785623 () Bool)

(assert (=> start!72688 m!785623))

(declare-fun m!785625 () Bool)

(assert (=> b!843641 m!785625))

(check-sat (not start!72688) (not b!843641) (not b!843639) tp_is_empty!15757 (not b!843644) (not mapNonEmpty!25235))
(check-sat)
