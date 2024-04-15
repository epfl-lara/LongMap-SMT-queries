; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39638 () Bool)

(assert start!39638)

(declare-fun b_free!9919 () Bool)

(declare-fun b_next!9919 () Bool)

(assert (=> start!39638 (= b_free!9919 (not b_next!9919))))

(declare-fun tp!35285 () Bool)

(declare-fun b_and!17549 () Bool)

(assert (=> start!39638 (= tp!35285 b_and!17549)))

(declare-fun b!425200 () Bool)

(declare-fun e!252406 () Bool)

(declare-fun e!252405 () Bool)

(assert (=> b!425200 (= e!252406 e!252405)))

(declare-fun res!248982 () Bool)

(assert (=> b!425200 (=> (not res!248982) (not e!252405))))

(declare-datatypes ((array!25971 0))(
  ( (array!25972 (arr!12435 (Array (_ BitVec 32) (_ BitVec 64))) (size!12788 (_ BitVec 32))) )
))
(declare-fun lt!194429 () array!25971)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25971 (_ BitVec 32)) Bool)

(assert (=> b!425200 (= res!248982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194429 mask!1025))))

(declare-fun _keys!709 () array!25971)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425200 (= lt!194429 (array!25972 (store (arr!12435 _keys!709) i!563 k0!794) (size!12788 _keys!709)))))

(declare-fun b!425201 () Bool)

(declare-fun res!248986 () Bool)

(assert (=> b!425201 (=> (not res!248986) (not e!252406))))

(assert (=> b!425201 (= res!248986 (or (= (select (arr!12435 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12435 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425202 () Bool)

(declare-fun res!248984 () Bool)

(assert (=> b!425202 (=> (not res!248984) (not e!252406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425202 (= res!248984 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18228 () Bool)

(declare-fun mapRes!18228 () Bool)

(assert (=> mapIsEmpty!18228 mapRes!18228))

(declare-fun b!425204 () Bool)

(declare-fun res!248992 () Bool)

(assert (=> b!425204 (=> (not res!248992) (not e!252406))))

(assert (=> b!425204 (= res!248992 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12788 _keys!709))))))

(declare-fun b!425205 () Bool)

(declare-fun e!252407 () Bool)

(declare-fun e!252408 () Bool)

(assert (=> b!425205 (= e!252407 (and e!252408 mapRes!18228))))

(declare-fun condMapEmpty!18228 () Bool)

(declare-datatypes ((V!15867 0))(
  ( (V!15868 (val!5580 Int)) )
))
(declare-datatypes ((ValueCell!5192 0))(
  ( (ValueCellFull!5192 (v!7821 V!15867)) (EmptyCell!5192) )
))
(declare-datatypes ((array!25973 0))(
  ( (array!25974 (arr!12436 (Array (_ BitVec 32) ValueCell!5192)) (size!12789 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25973)

(declare-fun mapDefault!18228 () ValueCell!5192)

(assert (=> b!425205 (= condMapEmpty!18228 (= (arr!12436 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5192)) mapDefault!18228)))))

(declare-fun mapNonEmpty!18228 () Bool)

(declare-fun tp!35286 () Bool)

(declare-fun e!252402 () Bool)

(assert (=> mapNonEmpty!18228 (= mapRes!18228 (and tp!35286 e!252402))))

(declare-fun mapRest!18228 () (Array (_ BitVec 32) ValueCell!5192))

(declare-fun mapKey!18228 () (_ BitVec 32))

(declare-fun mapValue!18228 () ValueCell!5192)

(assert (=> mapNonEmpty!18228 (= (arr!12436 _values!549) (store mapRest!18228 mapKey!18228 mapValue!18228))))

(declare-fun b!425206 () Bool)

(declare-fun res!248991 () Bool)

(assert (=> b!425206 (=> (not res!248991) (not e!252406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425206 (= res!248991 (validKeyInArray!0 k0!794))))

(declare-fun b!425207 () Bool)

(declare-fun tp_is_empty!11071 () Bool)

(assert (=> b!425207 (= e!252402 tp_is_empty!11071)))

(declare-fun b!425208 () Bool)

(declare-fun res!248988 () Bool)

(assert (=> b!425208 (=> (not res!248988) (not e!252405))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425208 (= res!248988 (bvsle from!863 i!563))))

(declare-fun b!425209 () Bool)

(assert (=> b!425209 (= e!252408 tp_is_empty!11071)))

(declare-fun b!425210 () Bool)

(declare-fun res!248985 () Bool)

(assert (=> b!425210 (=> (not res!248985) (not e!252406))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!425210 (= res!248985 (and (= (size!12789 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12788 _keys!709) (size!12789 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425211 () Bool)

(declare-fun e!252404 () Bool)

(assert (=> b!425211 (= e!252405 e!252404)))

(declare-fun res!248993 () Bool)

(assert (=> b!425211 (=> (not res!248993) (not e!252404))))

(assert (=> b!425211 (= res!248993 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15867)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7322 0))(
  ( (tuple2!7323 (_1!3672 (_ BitVec 64)) (_2!3672 V!15867)) )
))
(declare-datatypes ((List!7321 0))(
  ( (Nil!7318) (Cons!7317 (h!8173 tuple2!7322) (t!12756 List!7321)) )
))
(declare-datatypes ((ListLongMap!6225 0))(
  ( (ListLongMap!6226 (toList!3128 List!7321)) )
))
(declare-fun lt!194426 () ListLongMap!6225)

(declare-fun zeroValue!515 () V!15867)

(declare-fun lt!194428 () array!25973)

(declare-fun getCurrentListMapNoExtraKeys!1336 (array!25971 array!25973 (_ BitVec 32) (_ BitVec 32) V!15867 V!15867 (_ BitVec 32) Int) ListLongMap!6225)

(assert (=> b!425211 (= lt!194426 (getCurrentListMapNoExtraKeys!1336 lt!194429 lt!194428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15867)

(assert (=> b!425211 (= lt!194428 (array!25974 (store (arr!12436 _values!549) i!563 (ValueCellFull!5192 v!412)) (size!12789 _values!549)))))

(declare-fun lt!194425 () ListLongMap!6225)

(assert (=> b!425211 (= lt!194425 (getCurrentListMapNoExtraKeys!1336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425212 () Bool)

(declare-fun res!248989 () Bool)

(assert (=> b!425212 (=> (not res!248989) (not e!252405))))

(declare-datatypes ((List!7322 0))(
  ( (Nil!7319) (Cons!7318 (h!8174 (_ BitVec 64)) (t!12757 List!7322)) )
))
(declare-fun arrayNoDuplicates!0 (array!25971 (_ BitVec 32) List!7322) Bool)

(assert (=> b!425212 (= res!248989 (arrayNoDuplicates!0 lt!194429 #b00000000000000000000000000000000 Nil!7319))))

(declare-fun b!425213 () Bool)

(declare-fun res!248987 () Bool)

(assert (=> b!425213 (=> (not res!248987) (not e!252406))))

(declare-fun arrayContainsKey!0 (array!25971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425213 (= res!248987 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425214 () Bool)

(assert (=> b!425214 (= e!252404 (not true))))

(declare-fun +!1310 (ListLongMap!6225 tuple2!7322) ListLongMap!6225)

(assert (=> b!425214 (= (getCurrentListMapNoExtraKeys!1336 lt!194429 lt!194428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1310 (getCurrentListMapNoExtraKeys!1336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7323 k0!794 v!412)))))

(declare-datatypes ((Unit!12466 0))(
  ( (Unit!12467) )
))
(declare-fun lt!194427 () Unit!12466)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!481 (array!25971 array!25973 (_ BitVec 32) (_ BitVec 32) V!15867 V!15867 (_ BitVec 32) (_ BitVec 64) V!15867 (_ BitVec 32) Int) Unit!12466)

(assert (=> b!425214 (= lt!194427 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!481 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425215 () Bool)

(declare-fun res!248990 () Bool)

(assert (=> b!425215 (=> (not res!248990) (not e!252406))))

(assert (=> b!425215 (= res!248990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425203 () Bool)

(declare-fun res!248994 () Bool)

(assert (=> b!425203 (=> (not res!248994) (not e!252406))))

(assert (=> b!425203 (= res!248994 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7319))))

(declare-fun res!248983 () Bool)

(assert (=> start!39638 (=> (not res!248983) (not e!252406))))

(assert (=> start!39638 (= res!248983 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12788 _keys!709))))))

(assert (=> start!39638 e!252406))

(assert (=> start!39638 tp_is_empty!11071))

(assert (=> start!39638 tp!35285))

(assert (=> start!39638 true))

(declare-fun array_inv!9094 (array!25973) Bool)

(assert (=> start!39638 (and (array_inv!9094 _values!549) e!252407)))

(declare-fun array_inv!9095 (array!25971) Bool)

(assert (=> start!39638 (array_inv!9095 _keys!709)))

(assert (= (and start!39638 res!248983) b!425202))

(assert (= (and b!425202 res!248984) b!425210))

(assert (= (and b!425210 res!248985) b!425215))

(assert (= (and b!425215 res!248990) b!425203))

(assert (= (and b!425203 res!248994) b!425204))

(assert (= (and b!425204 res!248992) b!425206))

(assert (= (and b!425206 res!248991) b!425201))

(assert (= (and b!425201 res!248986) b!425213))

(assert (= (and b!425213 res!248987) b!425200))

(assert (= (and b!425200 res!248982) b!425212))

(assert (= (and b!425212 res!248989) b!425208))

(assert (= (and b!425208 res!248988) b!425211))

(assert (= (and b!425211 res!248993) b!425214))

(assert (= (and b!425205 condMapEmpty!18228) mapIsEmpty!18228))

(assert (= (and b!425205 (not condMapEmpty!18228)) mapNonEmpty!18228))

(get-info :version)

(assert (= (and mapNonEmpty!18228 ((_ is ValueCellFull!5192) mapValue!18228)) b!425207))

(assert (= (and b!425205 ((_ is ValueCellFull!5192) mapDefault!18228)) b!425209))

(assert (= start!39638 b!425205))

(declare-fun m!413631 () Bool)

(assert (=> b!425200 m!413631))

(declare-fun m!413633 () Bool)

(assert (=> b!425200 m!413633))

(declare-fun m!413635 () Bool)

(assert (=> b!425212 m!413635))

(declare-fun m!413637 () Bool)

(assert (=> b!425211 m!413637))

(declare-fun m!413639 () Bool)

(assert (=> b!425211 m!413639))

(declare-fun m!413641 () Bool)

(assert (=> b!425211 m!413641))

(declare-fun m!413643 () Bool)

(assert (=> b!425215 m!413643))

(declare-fun m!413645 () Bool)

(assert (=> b!425202 m!413645))

(declare-fun m!413647 () Bool)

(assert (=> b!425213 m!413647))

(declare-fun m!413649 () Bool)

(assert (=> b!425201 m!413649))

(declare-fun m!413651 () Bool)

(assert (=> mapNonEmpty!18228 m!413651))

(declare-fun m!413653 () Bool)

(assert (=> b!425214 m!413653))

(declare-fun m!413655 () Bool)

(assert (=> b!425214 m!413655))

(assert (=> b!425214 m!413655))

(declare-fun m!413657 () Bool)

(assert (=> b!425214 m!413657))

(declare-fun m!413659 () Bool)

(assert (=> b!425214 m!413659))

(declare-fun m!413661 () Bool)

(assert (=> b!425206 m!413661))

(declare-fun m!413663 () Bool)

(assert (=> b!425203 m!413663))

(declare-fun m!413665 () Bool)

(assert (=> start!39638 m!413665))

(declare-fun m!413667 () Bool)

(assert (=> start!39638 m!413667))

(check-sat (not b!425203) (not b!425211) (not b!425215) (not b!425202) (not b!425200) b_and!17549 (not b!425213) (not start!39638) (not b!425212) (not b!425206) (not mapNonEmpty!18228) (not b_next!9919) (not b!425214) tp_is_empty!11071)
(check-sat b_and!17549 (not b_next!9919))
