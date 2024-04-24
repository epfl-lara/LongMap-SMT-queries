; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39218 () Bool)

(assert start!39218)

(declare-fun b_free!9499 () Bool)

(declare-fun b_next!9499 () Bool)

(assert (=> start!39218 (= b_free!9499 (not b_next!9499))))

(declare-fun tp!34025 () Bool)

(declare-fun b_and!16899 () Bool)

(assert (=> start!39218 (= tp!34025 b_and!16899)))

(declare-fun b!413978 () Bool)

(declare-fun res!240667 () Bool)

(declare-fun e!247465 () Bool)

(assert (=> b!413978 (=> (not res!240667) (not e!247465))))

(declare-datatypes ((array!25164 0))(
  ( (array!25165 (arr!12031 (Array (_ BitVec 32) (_ BitVec 64))) (size!12383 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25164)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413978 (= res!240667 (or (= (select (arr!12031 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12031 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!15307 0))(
  ( (V!15308 (val!5370 Int)) )
))
(declare-datatypes ((tuple2!6854 0))(
  ( (tuple2!6855 (_1!3438 (_ BitVec 64)) (_2!3438 V!15307)) )
))
(declare-datatypes ((List!6874 0))(
  ( (Nil!6871) (Cons!6870 (h!7726 tuple2!6854) (t!12040 List!6874)) )
))
(declare-datatypes ((ListLongMap!5769 0))(
  ( (ListLongMap!5770 (toList!2900 List!6874)) )
))
(declare-fun call!28662 () ListLongMap!5769)

(declare-fun b!413979 () Bool)

(declare-fun call!28663 () ListLongMap!5769)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!247461 () Bool)

(declare-fun v!412 () V!15307)

(declare-fun +!1177 (ListLongMap!5769 tuple2!6854) ListLongMap!5769)

(assert (=> b!413979 (= e!247461 (= call!28663 (+!1177 call!28662 (tuple2!6855 k0!794 v!412))))))

(declare-fun b!413980 () Bool)

(declare-fun res!240676 () Bool)

(declare-fun e!247466 () Bool)

(assert (=> b!413980 (=> (not res!240676) (not e!247466))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!413980 (= res!240676 (bvsle from!863 i!563))))

(declare-fun minValue!515 () V!15307)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4982 0))(
  ( (ValueCellFull!4982 (v!7618 V!15307)) (EmptyCell!4982) )
))
(declare-datatypes ((array!25166 0))(
  ( (array!25167 (arr!12032 (Array (_ BitVec 32) ValueCell!4982)) (size!12384 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25166)

(declare-fun c!54939 () Bool)

(declare-fun bm!28659 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189910 () array!25166)

(declare-fun zeroValue!515 () V!15307)

(declare-fun lt!189909 () array!25164)

(declare-fun getCurrentListMapNoExtraKeys!1150 (array!25164 array!25166 (_ BitVec 32) (_ BitVec 32) V!15307 V!15307 (_ BitVec 32) Int) ListLongMap!5769)

(assert (=> bm!28659 (= call!28663 (getCurrentListMapNoExtraKeys!1150 (ite c!54939 lt!189909 _keys!709) (ite c!54939 lt!189910 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413981 () Bool)

(assert (=> b!413981 (= e!247461 (= call!28662 call!28663))))

(declare-fun b!413982 () Bool)

(declare-fun res!240678 () Bool)

(assert (=> b!413982 (=> (not res!240678) (not e!247465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413982 (= res!240678 (validMask!0 mask!1025))))

(declare-fun b!413983 () Bool)

(declare-fun e!247467 () Bool)

(declare-fun tp_is_empty!10651 () Bool)

(assert (=> b!413983 (= e!247467 tp_is_empty!10651)))

(declare-fun b!413985 () Bool)

(declare-fun res!240668 () Bool)

(assert (=> b!413985 (=> (not res!240668) (not e!247465))))

(assert (=> b!413985 (= res!240668 (and (= (size!12384 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12383 _keys!709) (size!12384 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413986 () Bool)

(declare-fun res!240672 () Bool)

(assert (=> b!413986 (=> (not res!240672) (not e!247466))))

(declare-datatypes ((List!6875 0))(
  ( (Nil!6872) (Cons!6871 (h!7727 (_ BitVec 64)) (t!12041 List!6875)) )
))
(declare-fun arrayNoDuplicates!0 (array!25164 (_ BitVec 32) List!6875) Bool)

(assert (=> b!413986 (= res!240672 (arrayNoDuplicates!0 lt!189909 #b00000000000000000000000000000000 Nil!6872))))

(declare-fun b!413987 () Bool)

(assert (=> b!413987 (= e!247465 e!247466)))

(declare-fun res!240671 () Bool)

(assert (=> b!413987 (=> (not res!240671) (not e!247466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25164 (_ BitVec 32)) Bool)

(assert (=> b!413987 (= res!240671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189909 mask!1025))))

(assert (=> b!413987 (= lt!189909 (array!25165 (store (arr!12031 _keys!709) i!563 k0!794) (size!12383 _keys!709)))))

(declare-fun b!413988 () Bool)

(declare-fun e!247468 () Bool)

(assert (=> b!413988 (= e!247468 (not true))))

(assert (=> b!413988 e!247461))

(assert (=> b!413988 (= c!54939 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12243 0))(
  ( (Unit!12244) )
))
(declare-fun lt!189911 () Unit!12243)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!389 (array!25164 array!25166 (_ BitVec 32) (_ BitVec 32) V!15307 V!15307 (_ BitVec 32) (_ BitVec 64) V!15307 (_ BitVec 32) Int) Unit!12243)

(assert (=> b!413988 (= lt!189911 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413989 () Bool)

(declare-fun res!240674 () Bool)

(assert (=> b!413989 (=> (not res!240674) (not e!247465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413989 (= res!240674 (validKeyInArray!0 k0!794))))

(declare-fun b!413990 () Bool)

(declare-fun res!240666 () Bool)

(assert (=> b!413990 (=> (not res!240666) (not e!247465))))

(assert (=> b!413990 (= res!240666 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12383 _keys!709))))))

(declare-fun b!413991 () Bool)

(assert (=> b!413991 (= e!247466 e!247468)))

(declare-fun res!240675 () Bool)

(assert (=> b!413991 (=> (not res!240675) (not e!247468))))

(assert (=> b!413991 (= res!240675 (= from!863 i!563))))

(declare-fun lt!189908 () ListLongMap!5769)

(assert (=> b!413991 (= lt!189908 (getCurrentListMapNoExtraKeys!1150 lt!189909 lt!189910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413991 (= lt!189910 (array!25167 (store (arr!12032 _values!549) i!563 (ValueCellFull!4982 v!412)) (size!12384 _values!549)))))

(declare-fun lt!189912 () ListLongMap!5769)

(assert (=> b!413991 (= lt!189912 (getCurrentListMapNoExtraKeys!1150 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413992 () Bool)

(declare-fun res!240673 () Bool)

(assert (=> b!413992 (=> (not res!240673) (not e!247465))))

(declare-fun arrayContainsKey!0 (array!25164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413992 (= res!240673 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413993 () Bool)

(declare-fun e!247463 () Bool)

(declare-fun e!247462 () Bool)

(declare-fun mapRes!17598 () Bool)

(assert (=> b!413993 (= e!247463 (and e!247462 mapRes!17598))))

(declare-fun condMapEmpty!17598 () Bool)

(declare-fun mapDefault!17598 () ValueCell!4982)

(assert (=> b!413993 (= condMapEmpty!17598 (= (arr!12032 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4982)) mapDefault!17598)))))

(declare-fun mapNonEmpty!17598 () Bool)

(declare-fun tp!34026 () Bool)

(assert (=> mapNonEmpty!17598 (= mapRes!17598 (and tp!34026 e!247467))))

(declare-fun mapRest!17598 () (Array (_ BitVec 32) ValueCell!4982))

(declare-fun mapValue!17598 () ValueCell!4982)

(declare-fun mapKey!17598 () (_ BitVec 32))

(assert (=> mapNonEmpty!17598 (= (arr!12032 _values!549) (store mapRest!17598 mapKey!17598 mapValue!17598))))

(declare-fun b!413994 () Bool)

(declare-fun res!240677 () Bool)

(assert (=> b!413994 (=> (not res!240677) (not e!247465))))

(assert (=> b!413994 (= res!240677 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6872))))

(declare-fun b!413995 () Bool)

(assert (=> b!413995 (= e!247462 tp_is_empty!10651)))

(declare-fun res!240670 () Bool)

(assert (=> start!39218 (=> (not res!240670) (not e!247465))))

(assert (=> start!39218 (= res!240670 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12383 _keys!709))))))

(assert (=> start!39218 e!247465))

(assert (=> start!39218 tp_is_empty!10651))

(assert (=> start!39218 tp!34025))

(assert (=> start!39218 true))

(declare-fun array_inv!8858 (array!25166) Bool)

(assert (=> start!39218 (and (array_inv!8858 _values!549) e!247463)))

(declare-fun array_inv!8859 (array!25164) Bool)

(assert (=> start!39218 (array_inv!8859 _keys!709)))

(declare-fun b!413984 () Bool)

(declare-fun res!240669 () Bool)

(assert (=> b!413984 (=> (not res!240669) (not e!247465))))

(assert (=> b!413984 (= res!240669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28660 () Bool)

(assert (=> bm!28660 (= call!28662 (getCurrentListMapNoExtraKeys!1150 (ite c!54939 _keys!709 lt!189909) (ite c!54939 _values!549 lt!189910) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17598 () Bool)

(assert (=> mapIsEmpty!17598 mapRes!17598))

(assert (= (and start!39218 res!240670) b!413982))

(assert (= (and b!413982 res!240678) b!413985))

(assert (= (and b!413985 res!240668) b!413984))

(assert (= (and b!413984 res!240669) b!413994))

(assert (= (and b!413994 res!240677) b!413990))

(assert (= (and b!413990 res!240666) b!413989))

(assert (= (and b!413989 res!240674) b!413978))

(assert (= (and b!413978 res!240667) b!413992))

(assert (= (and b!413992 res!240673) b!413987))

(assert (= (and b!413987 res!240671) b!413986))

(assert (= (and b!413986 res!240672) b!413980))

(assert (= (and b!413980 res!240676) b!413991))

(assert (= (and b!413991 res!240675) b!413988))

(assert (= (and b!413988 c!54939) b!413979))

(assert (= (and b!413988 (not c!54939)) b!413981))

(assert (= (or b!413979 b!413981) bm!28659))

(assert (= (or b!413979 b!413981) bm!28660))

(assert (= (and b!413993 condMapEmpty!17598) mapIsEmpty!17598))

(assert (= (and b!413993 (not condMapEmpty!17598)) mapNonEmpty!17598))

(get-info :version)

(assert (= (and mapNonEmpty!17598 ((_ is ValueCellFull!4982) mapValue!17598)) b!413983))

(assert (= (and b!413993 ((_ is ValueCellFull!4982) mapDefault!17598)) b!413995))

(assert (= start!39218 b!413993))

(declare-fun m!403581 () Bool)

(assert (=> bm!28660 m!403581))

(declare-fun m!403583 () Bool)

(assert (=> mapNonEmpty!17598 m!403583))

(declare-fun m!403585 () Bool)

(assert (=> b!413986 m!403585))

(declare-fun m!403587 () Bool)

(assert (=> b!413989 m!403587))

(declare-fun m!403589 () Bool)

(assert (=> b!413978 m!403589))

(declare-fun m!403591 () Bool)

(assert (=> b!413982 m!403591))

(declare-fun m!403593 () Bool)

(assert (=> start!39218 m!403593))

(declare-fun m!403595 () Bool)

(assert (=> start!39218 m!403595))

(declare-fun m!403597 () Bool)

(assert (=> b!413988 m!403597))

(declare-fun m!403599 () Bool)

(assert (=> bm!28659 m!403599))

(declare-fun m!403601 () Bool)

(assert (=> b!413979 m!403601))

(declare-fun m!403603 () Bool)

(assert (=> b!413987 m!403603))

(declare-fun m!403605 () Bool)

(assert (=> b!413987 m!403605))

(declare-fun m!403607 () Bool)

(assert (=> b!413991 m!403607))

(declare-fun m!403609 () Bool)

(assert (=> b!413991 m!403609))

(declare-fun m!403611 () Bool)

(assert (=> b!413991 m!403611))

(declare-fun m!403613 () Bool)

(assert (=> b!413992 m!403613))

(declare-fun m!403615 () Bool)

(assert (=> b!413994 m!403615))

(declare-fun m!403617 () Bool)

(assert (=> b!413984 m!403617))

(check-sat (not b!413988) b_and!16899 (not b!413992) (not b!413979) (not mapNonEmpty!17598) (not bm!28660) tp_is_empty!10651 (not start!39218) (not b!413982) (not b_next!9499) (not b!413994) (not bm!28659) (not b!413987) (not b!413986) (not b!413991) (not b!413984) (not b!413989))
(check-sat b_and!16899 (not b_next!9499))
