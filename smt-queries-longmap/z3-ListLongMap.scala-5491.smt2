; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72898 () Bool)

(assert start!72898)

(declare-fun b!845033 () Bool)

(declare-fun res!573900 () Bool)

(declare-fun e!471678 () Bool)

(assert (=> b!845033 (=> (not res!573900) (not e!471678))))

(declare-datatypes ((array!47837 0))(
  ( (array!47838 (arr!22945 (Array (_ BitVec 32) (_ BitVec 64))) (size!23386 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47837)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47837 (_ BitVec 32)) Bool)

(assert (=> b!845033 (= res!573900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845034 () Bool)

(declare-fun res!573899 () Bool)

(assert (=> b!845034 (=> (not res!573899) (not e!471678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845034 (= res!573899 (validMask!0 mask!1196))))

(declare-fun b!845035 () Bool)

(assert (=> b!845035 (= e!471678 false)))

(declare-fun lt!381599 () Bool)

(declare-datatypes ((List!16190 0))(
  ( (Nil!16187) (Cons!16186 (h!17323 (_ BitVec 64)) (t!22553 List!16190)) )
))
(declare-fun arrayNoDuplicates!0 (array!47837 (_ BitVec 32) List!16190) Bool)

(assert (=> b!845035 (= lt!381599 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16187))))

(declare-fun res!573901 () Bool)

(assert (=> start!72898 (=> (not res!573901) (not e!471678))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72898 (= res!573901 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23386 _keys!868))))))

(assert (=> start!72898 e!471678))

(assert (=> start!72898 true))

(declare-fun array_inv!18296 (array!47837) Bool)

(assert (=> start!72898 (array_inv!18296 _keys!868)))

(declare-datatypes ((V!26089 0))(
  ( (V!26090 (val!7938 Int)) )
))
(declare-datatypes ((ValueCell!7451 0))(
  ( (ValueCellFull!7451 (v!10363 V!26089)) (EmptyCell!7451) )
))
(declare-datatypes ((array!47839 0))(
  ( (array!47840 (arr!22946 (Array (_ BitVec 32) ValueCell!7451)) (size!23387 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47839)

(declare-fun e!471675 () Bool)

(declare-fun array_inv!18297 (array!47839) Bool)

(assert (=> start!72898 (and (array_inv!18297 _values!688) e!471675)))

(declare-fun b!845036 () Bool)

(declare-fun e!471679 () Bool)

(declare-fun tp_is_empty!15781 () Bool)

(assert (=> b!845036 (= e!471679 tp_is_empty!15781)))

(declare-fun b!845037 () Bool)

(declare-fun e!471676 () Bool)

(assert (=> b!845037 (= e!471676 tp_is_empty!15781)))

(declare-fun mapNonEmpty!25271 () Bool)

(declare-fun mapRes!25271 () Bool)

(declare-fun tp!48590 () Bool)

(assert (=> mapNonEmpty!25271 (= mapRes!25271 (and tp!48590 e!471679))))

(declare-fun mapRest!25271 () (Array (_ BitVec 32) ValueCell!7451))

(declare-fun mapValue!25271 () ValueCell!7451)

(declare-fun mapKey!25271 () (_ BitVec 32))

(assert (=> mapNonEmpty!25271 (= (arr!22946 _values!688) (store mapRest!25271 mapKey!25271 mapValue!25271))))

(declare-fun b!845038 () Bool)

(assert (=> b!845038 (= e!471675 (and e!471676 mapRes!25271))))

(declare-fun condMapEmpty!25271 () Bool)

(declare-fun mapDefault!25271 () ValueCell!7451)

(assert (=> b!845038 (= condMapEmpty!25271 (= (arr!22946 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7451)) mapDefault!25271)))))

(declare-fun b!845039 () Bool)

(declare-fun res!573898 () Bool)

(assert (=> b!845039 (=> (not res!573898) (not e!471678))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845039 (= res!573898 (and (= (size!23387 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23386 _keys!868) (size!23387 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25271 () Bool)

(assert (=> mapIsEmpty!25271 mapRes!25271))

(assert (= (and start!72898 res!573901) b!845034))

(assert (= (and b!845034 res!573899) b!845039))

(assert (= (and b!845039 res!573898) b!845033))

(assert (= (and b!845033 res!573900) b!845035))

(assert (= (and b!845038 condMapEmpty!25271) mapIsEmpty!25271))

(assert (= (and b!845038 (not condMapEmpty!25271)) mapNonEmpty!25271))

(get-info :version)

(assert (= (and mapNonEmpty!25271 ((_ is ValueCellFull!7451) mapValue!25271)) b!845036))

(assert (= (and b!845038 ((_ is ValueCellFull!7451) mapDefault!25271)) b!845037))

(assert (= start!72898 b!845038))

(declare-fun m!787805 () Bool)

(assert (=> b!845035 m!787805))

(declare-fun m!787807 () Bool)

(assert (=> b!845033 m!787807))

(declare-fun m!787809 () Bool)

(assert (=> b!845034 m!787809))

(declare-fun m!787811 () Bool)

(assert (=> start!72898 m!787811))

(declare-fun m!787813 () Bool)

(assert (=> start!72898 m!787813))

(declare-fun m!787815 () Bool)

(assert (=> mapNonEmpty!25271 m!787815))

(check-sat (not start!72898) (not b!845035) (not mapNonEmpty!25271) (not b!845033) tp_is_empty!15781 (not b!845034))
(check-sat)
