; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43218 () Bool)

(assert start!43218)

(declare-fun b!479015 () Bool)

(declare-fun res!285781 () Bool)

(declare-fun e!281767 () Bool)

(assert (=> b!479015 (=> (not res!285781) (not e!281767))))

(declare-datatypes ((array!30902 0))(
  ( (array!30903 (arr!14858 (Array (_ BitVec 32) (_ BitVec 64))) (size!15216 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30902)

(declare-datatypes ((List!8991 0))(
  ( (Nil!8988) (Cons!8987 (h!9843 (_ BitVec 64)) (t!15189 List!8991)) )
))
(declare-fun arrayNoDuplicates!0 (array!30902 (_ BitVec 32) List!8991) Bool)

(assert (=> b!479015 (= res!285781 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8988))))

(declare-fun mapIsEmpty!22126 () Bool)

(declare-fun mapRes!22126 () Bool)

(assert (=> mapIsEmpty!22126 mapRes!22126))

(declare-fun res!285780 () Bool)

(assert (=> start!43218 (=> (not res!285780) (not e!281767))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43218 (= res!285780 (validMask!0 mask!2352))))

(assert (=> start!43218 e!281767))

(assert (=> start!43218 true))

(declare-datatypes ((V!19233 0))(
  ( (V!19234 (val!6858 Int)) )
))
(declare-datatypes ((ValueCell!6449 0))(
  ( (ValueCellFull!6449 (v!9148 V!19233)) (EmptyCell!6449) )
))
(declare-datatypes ((array!30904 0))(
  ( (array!30905 (arr!14859 (Array (_ BitVec 32) ValueCell!6449)) (size!15217 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30904)

(declare-fun e!281768 () Bool)

(declare-fun array_inv!10798 (array!30904) Bool)

(assert (=> start!43218 (and (array_inv!10798 _values!1516) e!281768)))

(declare-fun array_inv!10799 (array!30902) Bool)

(assert (=> start!43218 (array_inv!10799 _keys!1874)))

(declare-fun b!479016 () Bool)

(declare-fun res!285782 () Bool)

(assert (=> b!479016 (=> (not res!285782) (not e!281767))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479016 (= res!285782 (and (= (size!15217 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15216 _keys!1874) (size!15217 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479017 () Bool)

(declare-fun res!285779 () Bool)

(assert (=> b!479017 (=> (not res!285779) (not e!281767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30902 (_ BitVec 32)) Bool)

(assert (=> b!479017 (= res!285779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479018 () Bool)

(declare-fun e!281766 () Bool)

(assert (=> b!479018 (= e!281768 (and e!281766 mapRes!22126))))

(declare-fun condMapEmpty!22126 () Bool)

(declare-fun mapDefault!22126 () ValueCell!6449)

(assert (=> b!479018 (= condMapEmpty!22126 (= (arr!14859 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6449)) mapDefault!22126)))))

(declare-fun b!479019 () Bool)

(assert (=> b!479019 (= e!281767 (bvsgt #b00000000000000000000000000000000 (size!15216 _keys!1874)))))

(declare-fun mapNonEmpty!22126 () Bool)

(declare-fun tp!42601 () Bool)

(declare-fun e!281765 () Bool)

(assert (=> mapNonEmpty!22126 (= mapRes!22126 (and tp!42601 e!281765))))

(declare-fun mapKey!22126 () (_ BitVec 32))

(declare-fun mapRest!22126 () (Array (_ BitVec 32) ValueCell!6449))

(declare-fun mapValue!22126 () ValueCell!6449)

(assert (=> mapNonEmpty!22126 (= (arr!14859 _values!1516) (store mapRest!22126 mapKey!22126 mapValue!22126))))

(declare-fun b!479020 () Bool)

(declare-fun tp_is_empty!13621 () Bool)

(assert (=> b!479020 (= e!281765 tp_is_empty!13621)))

(declare-fun b!479021 () Bool)

(assert (=> b!479021 (= e!281766 tp_is_empty!13621)))

(assert (= (and start!43218 res!285780) b!479016))

(assert (= (and b!479016 res!285782) b!479017))

(assert (= (and b!479017 res!285779) b!479015))

(assert (= (and b!479015 res!285781) b!479019))

(assert (= (and b!479018 condMapEmpty!22126) mapIsEmpty!22126))

(assert (= (and b!479018 (not condMapEmpty!22126)) mapNonEmpty!22126))

(get-info :version)

(assert (= (and mapNonEmpty!22126 ((_ is ValueCellFull!6449) mapValue!22126)) b!479020))

(assert (= (and b!479018 ((_ is ValueCellFull!6449) mapDefault!22126)) b!479021))

(assert (= start!43218 b!479018))

(declare-fun m!461311 () Bool)

(assert (=> b!479015 m!461311))

(declare-fun m!461313 () Bool)

(assert (=> start!43218 m!461313))

(declare-fun m!461315 () Bool)

(assert (=> start!43218 m!461315))

(declare-fun m!461317 () Bool)

(assert (=> start!43218 m!461317))

(declare-fun m!461319 () Bool)

(assert (=> b!479017 m!461319))

(declare-fun m!461321 () Bool)

(assert (=> mapNonEmpty!22126 m!461321))

(check-sat (not b!479017) (not mapNonEmpty!22126) (not b!479015) (not start!43218) tp_is_empty!13621)
(check-sat)
(get-model)

(declare-fun b!479072 () Bool)

(declare-fun e!281806 () Bool)

(declare-fun call!30830 () Bool)

(assert (=> b!479072 (= e!281806 call!30830)))

(declare-fun b!479073 () Bool)

(declare-fun e!281807 () Bool)

(assert (=> b!479073 (= e!281807 call!30830)))

(declare-fun b!479074 () Bool)

(declare-fun e!281808 () Bool)

(assert (=> b!479074 (= e!281808 e!281807)))

(declare-fun c!57646 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479074 (= c!57646 (validKeyInArray!0 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76681 () Bool)

(declare-fun res!285811 () Bool)

(assert (=> d!76681 (=> res!285811 e!281808)))

(assert (=> d!76681 (= res!285811 (bvsge #b00000000000000000000000000000000 (size!15216 _keys!1874)))))

(assert (=> d!76681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281808)))

(declare-fun b!479075 () Bool)

(assert (=> b!479075 (= e!281807 e!281806)))

(declare-fun lt!217833 () (_ BitVec 64))

(assert (=> b!479075 (= lt!217833 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14037 0))(
  ( (Unit!14038) )
))
(declare-fun lt!217834 () Unit!14037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30902 (_ BitVec 64) (_ BitVec 32)) Unit!14037)

(assert (=> b!479075 (= lt!217834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217833 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479075 (arrayContainsKey!0 _keys!1874 lt!217833 #b00000000000000000000000000000000)))

(declare-fun lt!217832 () Unit!14037)

(assert (=> b!479075 (= lt!217832 lt!217834)))

(declare-fun res!285812 () Bool)

(declare-datatypes ((SeekEntryResult!3516 0))(
  ( (MissingZero!3516 (index!16243 (_ BitVec 32))) (Found!3516 (index!16244 (_ BitVec 32))) (Intermediate!3516 (undefined!4328 Bool) (index!16245 (_ BitVec 32)) (x!44937 (_ BitVec 32))) (Undefined!3516) (MissingVacant!3516 (index!16246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30902 (_ BitVec 32)) SeekEntryResult!3516)

(assert (=> b!479075 (= res!285812 (= (seekEntryOrOpen!0 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3516 #b00000000000000000000000000000000)))))

(assert (=> b!479075 (=> (not res!285812) (not e!281806))))

(declare-fun bm!30827 () Bool)

(assert (=> bm!30827 (= call!30830 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76681 (not res!285811)) b!479074))

(assert (= (and b!479074 c!57646) b!479075))

(assert (= (and b!479074 (not c!57646)) b!479073))

(assert (= (and b!479075 res!285812) b!479072))

(assert (= (or b!479072 b!479073) bm!30827))

(declare-fun m!461347 () Bool)

(assert (=> b!479074 m!461347))

(assert (=> b!479074 m!461347))

(declare-fun m!461349 () Bool)

(assert (=> b!479074 m!461349))

(assert (=> b!479075 m!461347))

(declare-fun m!461351 () Bool)

(assert (=> b!479075 m!461351))

(declare-fun m!461353 () Bool)

(assert (=> b!479075 m!461353))

(assert (=> b!479075 m!461347))

(declare-fun m!461355 () Bool)

(assert (=> b!479075 m!461355))

(declare-fun m!461357 () Bool)

(assert (=> bm!30827 m!461357))

(assert (=> b!479017 d!76681))

(declare-fun d!76683 () Bool)

(assert (=> d!76683 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43218 d!76683))

(declare-fun d!76685 () Bool)

(assert (=> d!76685 (= (array_inv!10798 _values!1516) (bvsge (size!15217 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43218 d!76685))

(declare-fun d!76687 () Bool)

(assert (=> d!76687 (= (array_inv!10799 _keys!1874) (bvsge (size!15216 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43218 d!76687))

(declare-fun b!479086 () Bool)

(declare-fun e!281818 () Bool)

(declare-fun e!281819 () Bool)

(assert (=> b!479086 (= e!281818 e!281819)))

(declare-fun res!285820 () Bool)

(assert (=> b!479086 (=> (not res!285820) (not e!281819))))

(declare-fun e!281817 () Bool)

(assert (=> b!479086 (= res!285820 (not e!281817))))

(declare-fun res!285819 () Bool)

(assert (=> b!479086 (=> (not res!285819) (not e!281817))))

(assert (=> b!479086 (= res!285819 (validKeyInArray!0 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30830 () Bool)

(declare-fun call!30833 () Bool)

(declare-fun c!57649 () Bool)

(assert (=> bm!30830 (= call!30833 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57649 (Cons!8987 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000) Nil!8988) Nil!8988)))))

(declare-fun b!479088 () Bool)

(declare-fun e!281820 () Bool)

(assert (=> b!479088 (= e!281819 e!281820)))

(assert (=> b!479088 (= c!57649 (validKeyInArray!0 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479089 () Bool)

(declare-fun contains!2564 (List!8991 (_ BitVec 64)) Bool)

(assert (=> b!479089 (= e!281817 (contains!2564 Nil!8988 (select (arr!14858 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479090 () Bool)

(assert (=> b!479090 (= e!281820 call!30833)))

(declare-fun b!479087 () Bool)

(assert (=> b!479087 (= e!281820 call!30833)))

(declare-fun d!76689 () Bool)

(declare-fun res!285821 () Bool)

(assert (=> d!76689 (=> res!285821 e!281818)))

(assert (=> d!76689 (= res!285821 (bvsge #b00000000000000000000000000000000 (size!15216 _keys!1874)))))

(assert (=> d!76689 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8988) e!281818)))

(assert (= (and d!76689 (not res!285821)) b!479086))

(assert (= (and b!479086 res!285819) b!479089))

(assert (= (and b!479086 res!285820) b!479088))

(assert (= (and b!479088 c!57649) b!479087))

(assert (= (and b!479088 (not c!57649)) b!479090))

(assert (= (or b!479087 b!479090) bm!30830))

(assert (=> b!479086 m!461347))

(assert (=> b!479086 m!461347))

(assert (=> b!479086 m!461349))

(assert (=> bm!30830 m!461347))

(declare-fun m!461359 () Bool)

(assert (=> bm!30830 m!461359))

(assert (=> b!479088 m!461347))

(assert (=> b!479088 m!461347))

(assert (=> b!479088 m!461349))

(assert (=> b!479089 m!461347))

(assert (=> b!479089 m!461347))

(declare-fun m!461361 () Bool)

(assert (=> b!479089 m!461361))

(assert (=> b!479015 d!76689))

(declare-fun mapNonEmpty!22135 () Bool)

(declare-fun mapRes!22135 () Bool)

(declare-fun tp!42610 () Bool)

(declare-fun e!281825 () Bool)

(assert (=> mapNonEmpty!22135 (= mapRes!22135 (and tp!42610 e!281825))))

(declare-fun mapKey!22135 () (_ BitVec 32))

(declare-fun mapValue!22135 () ValueCell!6449)

(declare-fun mapRest!22135 () (Array (_ BitVec 32) ValueCell!6449))

(assert (=> mapNonEmpty!22135 (= mapRest!22126 (store mapRest!22135 mapKey!22135 mapValue!22135))))

(declare-fun condMapEmpty!22135 () Bool)

(declare-fun mapDefault!22135 () ValueCell!6449)

(assert (=> mapNonEmpty!22126 (= condMapEmpty!22135 (= mapRest!22126 ((as const (Array (_ BitVec 32) ValueCell!6449)) mapDefault!22135)))))

(declare-fun e!281826 () Bool)

(assert (=> mapNonEmpty!22126 (= tp!42601 (and e!281826 mapRes!22135))))

(declare-fun mapIsEmpty!22135 () Bool)

(assert (=> mapIsEmpty!22135 mapRes!22135))

(declare-fun b!479098 () Bool)

(assert (=> b!479098 (= e!281826 tp_is_empty!13621)))

(declare-fun b!479097 () Bool)

(assert (=> b!479097 (= e!281825 tp_is_empty!13621)))

(assert (= (and mapNonEmpty!22126 condMapEmpty!22135) mapIsEmpty!22135))

(assert (= (and mapNonEmpty!22126 (not condMapEmpty!22135)) mapNonEmpty!22135))

(assert (= (and mapNonEmpty!22135 ((_ is ValueCellFull!6449) mapValue!22135)) b!479097))

(assert (= (and mapNonEmpty!22126 ((_ is ValueCellFull!6449) mapDefault!22135)) b!479098))

(declare-fun m!461363 () Bool)

(assert (=> mapNonEmpty!22135 m!461363))

(check-sat (not mapNonEmpty!22135) (not b!479089) (not b!479088) (not b!479075) tp_is_empty!13621 (not b!479074) (not b!479086) (not bm!30830) (not bm!30827))
(check-sat)
