; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39060 () Bool)

(assert start!39060)

(declare-fun b_free!9327 () Bool)

(declare-fun b_next!9327 () Bool)

(assert (=> start!39060 (= b_free!9327 (not b_next!9327))))

(declare-fun tp!33509 () Bool)

(declare-fun b_and!16713 () Bool)

(assert (=> start!39060 (= tp!33509 b_and!16713)))

(declare-fun res!237514 () Bool)

(declare-fun e!245819 () Bool)

(assert (=> start!39060 (=> (not res!237514) (not e!245819))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24829 0))(
  ( (array!24830 (arr!11864 (Array (_ BitVec 32) (_ BitVec 64))) (size!12216 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24829)

(assert (=> start!39060 (= res!237514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12216 _keys!709))))))

(assert (=> start!39060 e!245819))

(declare-fun tp_is_empty!10479 () Bool)

(assert (=> start!39060 tp_is_empty!10479))

(assert (=> start!39060 tp!33509))

(assert (=> start!39060 true))

(declare-datatypes ((V!15077 0))(
  ( (V!15078 (val!5284 Int)) )
))
(declare-datatypes ((ValueCell!4896 0))(
  ( (ValueCellFull!4896 (v!7531 V!15077)) (EmptyCell!4896) )
))
(declare-datatypes ((array!24831 0))(
  ( (array!24832 (arr!11865 (Array (_ BitVec 32) ValueCell!4896)) (size!12217 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24831)

(declare-fun e!245816 () Bool)

(declare-fun array_inv!8660 (array!24831) Bool)

(assert (=> start!39060 (and (array_inv!8660 _values!549) e!245816)))

(declare-fun array_inv!8661 (array!24829) Bool)

(assert (=> start!39060 (array_inv!8661 _keys!709)))

(declare-fun b!409962 () Bool)

(declare-fun res!237512 () Bool)

(assert (=> b!409962 (=> (not res!237512) (not e!245819))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409962 (= res!237512 (validMask!0 mask!1025))))

(declare-fun b!409963 () Bool)

(declare-fun res!237518 () Bool)

(assert (=> b!409963 (=> (not res!237518) (not e!245819))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409963 (= res!237518 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409964 () Bool)

(declare-fun res!237515 () Bool)

(assert (=> b!409964 (=> (not res!237515) (not e!245819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409964 (= res!237515 (validKeyInArray!0 k0!794))))

(declare-fun b!409965 () Bool)

(declare-fun e!245815 () Bool)

(assert (=> b!409965 (= e!245815 tp_is_empty!10479)))

(declare-fun b!409966 () Bool)

(declare-fun res!237508 () Bool)

(assert (=> b!409966 (=> (not res!237508) (not e!245819))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409966 (= res!237508 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12216 _keys!709))))))

(declare-fun b!409967 () Bool)

(declare-fun res!237517 () Bool)

(assert (=> b!409967 (=> (not res!237517) (not e!245819))))

(assert (=> b!409967 (= res!237517 (or (= (select (arr!11864 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11864 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409968 () Bool)

(declare-fun e!245820 () Bool)

(assert (=> b!409968 (= e!245820 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15077)

(declare-datatypes ((tuple2!6850 0))(
  ( (tuple2!6851 (_1!3436 (_ BitVec 64)) (_2!3436 V!15077)) )
))
(declare-datatypes ((List!6873 0))(
  ( (Nil!6870) (Cons!6869 (h!7725 tuple2!6850) (t!12047 List!6873)) )
))
(declare-datatypes ((ListLongMap!5763 0))(
  ( (ListLongMap!5764 (toList!2897 List!6873)) )
))
(declare-fun lt!189016 () ListLongMap!5763)

(declare-fun minValue!515 () V!15077)

(declare-fun getCurrentListMapNoExtraKeys!1105 (array!24829 array!24831 (_ BitVec 32) (_ BitVec 32) V!15077 V!15077 (_ BitVec 32) Int) ListLongMap!5763)

(assert (=> b!409968 (= lt!189016 (getCurrentListMapNoExtraKeys!1105 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409969 () Bool)

(declare-fun res!237511 () Bool)

(assert (=> b!409969 (=> (not res!237511) (not e!245819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24829 (_ BitVec 32)) Bool)

(assert (=> b!409969 (= res!237511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409970 () Bool)

(declare-fun res!237516 () Bool)

(assert (=> b!409970 (=> (not res!237516) (not e!245819))))

(declare-datatypes ((List!6874 0))(
  ( (Nil!6871) (Cons!6870 (h!7726 (_ BitVec 64)) (t!12048 List!6874)) )
))
(declare-fun arrayNoDuplicates!0 (array!24829 (_ BitVec 32) List!6874) Bool)

(assert (=> b!409970 (= res!237516 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6871))))

(declare-fun b!409971 () Bool)

(declare-fun res!237519 () Bool)

(assert (=> b!409971 (=> (not res!237519) (not e!245820))))

(assert (=> b!409971 (= res!237519 (bvsle from!863 i!563))))

(declare-fun b!409972 () Bool)

(assert (=> b!409972 (= e!245819 e!245820)))

(declare-fun res!237513 () Bool)

(assert (=> b!409972 (=> (not res!237513) (not e!245820))))

(declare-fun lt!189017 () array!24829)

(assert (=> b!409972 (= res!237513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189017 mask!1025))))

(assert (=> b!409972 (= lt!189017 (array!24830 (store (arr!11864 _keys!709) i!563 k0!794) (size!12216 _keys!709)))))

(declare-fun mapIsEmpty!17340 () Bool)

(declare-fun mapRes!17340 () Bool)

(assert (=> mapIsEmpty!17340 mapRes!17340))

(declare-fun mapNonEmpty!17340 () Bool)

(declare-fun tp!33510 () Bool)

(declare-fun e!245817 () Bool)

(assert (=> mapNonEmpty!17340 (= mapRes!17340 (and tp!33510 e!245817))))

(declare-fun mapValue!17340 () ValueCell!4896)

(declare-fun mapRest!17340 () (Array (_ BitVec 32) ValueCell!4896))

(declare-fun mapKey!17340 () (_ BitVec 32))

(assert (=> mapNonEmpty!17340 (= (arr!11865 _values!549) (store mapRest!17340 mapKey!17340 mapValue!17340))))

(declare-fun b!409973 () Bool)

(assert (=> b!409973 (= e!245817 tp_is_empty!10479)))

(declare-fun b!409974 () Bool)

(declare-fun res!237510 () Bool)

(assert (=> b!409974 (=> (not res!237510) (not e!245820))))

(assert (=> b!409974 (= res!237510 (arrayNoDuplicates!0 lt!189017 #b00000000000000000000000000000000 Nil!6871))))

(declare-fun b!409975 () Bool)

(declare-fun res!237509 () Bool)

(assert (=> b!409975 (=> (not res!237509) (not e!245819))))

(assert (=> b!409975 (= res!237509 (and (= (size!12217 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12216 _keys!709) (size!12217 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409976 () Bool)

(assert (=> b!409976 (= e!245816 (and e!245815 mapRes!17340))))

(declare-fun condMapEmpty!17340 () Bool)

(declare-fun mapDefault!17340 () ValueCell!4896)

(assert (=> b!409976 (= condMapEmpty!17340 (= (arr!11865 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4896)) mapDefault!17340)))))

(assert (= (and start!39060 res!237514) b!409962))

(assert (= (and b!409962 res!237512) b!409975))

(assert (= (and b!409975 res!237509) b!409969))

(assert (= (and b!409969 res!237511) b!409970))

(assert (= (and b!409970 res!237516) b!409966))

(assert (= (and b!409966 res!237508) b!409964))

(assert (= (and b!409964 res!237515) b!409967))

(assert (= (and b!409967 res!237517) b!409963))

(assert (= (and b!409963 res!237518) b!409972))

(assert (= (and b!409972 res!237513) b!409974))

(assert (= (and b!409974 res!237510) b!409971))

(assert (= (and b!409971 res!237519) b!409968))

(assert (= (and b!409976 condMapEmpty!17340) mapIsEmpty!17340))

(assert (= (and b!409976 (not condMapEmpty!17340)) mapNonEmpty!17340))

(get-info :version)

(assert (= (and mapNonEmpty!17340 ((_ is ValueCellFull!4896) mapValue!17340)) b!409973))

(assert (= (and b!409976 ((_ is ValueCellFull!4896) mapDefault!17340)) b!409965))

(assert (= start!39060 b!409976))

(declare-fun m!400647 () Bool)

(assert (=> b!409970 m!400647))

(declare-fun m!400649 () Bool)

(assert (=> mapNonEmpty!17340 m!400649))

(declare-fun m!400651 () Bool)

(assert (=> b!409972 m!400651))

(declare-fun m!400653 () Bool)

(assert (=> b!409972 m!400653))

(declare-fun m!400655 () Bool)

(assert (=> b!409964 m!400655))

(declare-fun m!400657 () Bool)

(assert (=> b!409968 m!400657))

(declare-fun m!400659 () Bool)

(assert (=> b!409962 m!400659))

(declare-fun m!400661 () Bool)

(assert (=> b!409967 m!400661))

(declare-fun m!400663 () Bool)

(assert (=> start!39060 m!400663))

(declare-fun m!400665 () Bool)

(assert (=> start!39060 m!400665))

(declare-fun m!400667 () Bool)

(assert (=> b!409969 m!400667))

(declare-fun m!400669 () Bool)

(assert (=> b!409963 m!400669))

(declare-fun m!400671 () Bool)

(assert (=> b!409974 m!400671))

(check-sat (not b_next!9327) tp_is_empty!10479 (not b!409962) (not b!409968) b_and!16713 (not mapNonEmpty!17340) (not b!409974) (not b!409963) (not b!409970) (not b!409969) (not b!409972) (not b!409964) (not start!39060))
(check-sat b_and!16713 (not b_next!9327))
