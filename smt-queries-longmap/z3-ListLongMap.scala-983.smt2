; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21218 () Bool)

(assert start!21218)

(declare-fun b_free!5649 () Bool)

(declare-fun b_next!5649 () Bool)

(assert (=> start!21218 (= b_free!5649 (not b_next!5649))))

(declare-fun tp!20021 () Bool)

(declare-fun b_and!12527 () Bool)

(assert (=> start!21218 (= tp!20021 b_and!12527)))

(declare-fun b!213799 () Bool)

(declare-fun res!104682 () Bool)

(declare-fun e!139017 () Bool)

(assert (=> b!213799 (=> (not res!104682) (not e!139017))))

(declare-datatypes ((array!10225 0))(
  ( (array!10226 (arr!4852 (Array (_ BitVec 32) (_ BitVec 64))) (size!5177 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10225)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10225 (_ BitVec 32)) Bool)

(assert (=> b!213799 (= res!104682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213800 () Bool)

(declare-fun e!139022 () Bool)

(declare-fun tp_is_empty!5511 () Bool)

(assert (=> b!213800 (= e!139022 tp_is_empty!5511)))

(declare-fun res!104680 () Bool)

(assert (=> start!21218 (=> (not res!104680) (not e!139017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21218 (= res!104680 (validMask!0 mask!1149))))

(assert (=> start!21218 e!139017))

(declare-datatypes ((V!6995 0))(
  ( (V!6996 (val!2800 Int)) )
))
(declare-datatypes ((ValueCell!2412 0))(
  ( (ValueCellFull!2412 (v!4814 V!6995)) (EmptyCell!2412) )
))
(declare-datatypes ((array!10227 0))(
  ( (array!10228 (arr!4853 (Array (_ BitVec 32) ValueCell!2412)) (size!5178 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10227)

(declare-fun e!139019 () Bool)

(declare-fun array_inv!3209 (array!10227) Bool)

(assert (=> start!21218 (and (array_inv!3209 _values!649) e!139019)))

(assert (=> start!21218 true))

(assert (=> start!21218 tp_is_empty!5511))

(declare-fun array_inv!3210 (array!10225) Bool)

(assert (=> start!21218 (array_inv!3210 _keys!825)))

(assert (=> start!21218 tp!20021))

(declare-fun b!213801 () Bool)

(declare-fun res!104681 () Bool)

(assert (=> b!213801 (=> (not res!104681) (not e!139017))))

(declare-datatypes ((List!3122 0))(
  ( (Nil!3119) (Cons!3118 (h!3760 (_ BitVec 64)) (t!8075 List!3122)) )
))
(declare-fun arrayNoDuplicates!0 (array!10225 (_ BitVec 32) List!3122) Bool)

(assert (=> b!213801 (= res!104681 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3119))))

(declare-fun b!213802 () Bool)

(declare-fun res!104683 () Bool)

(assert (=> b!213802 (=> (not res!104683) (not e!139017))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213802 (= res!104683 (validKeyInArray!0 k0!843))))

(declare-fun b!213803 () Bool)

(declare-fun mapRes!9368 () Bool)

(assert (=> b!213803 (= e!139019 (and e!139022 mapRes!9368))))

(declare-fun condMapEmpty!9368 () Bool)

(declare-fun mapDefault!9368 () ValueCell!2412)

(assert (=> b!213803 (= condMapEmpty!9368 (= (arr!4853 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2412)) mapDefault!9368)))))

(declare-fun b!213804 () Bool)

(declare-fun res!104686 () Bool)

(assert (=> b!213804 (=> (not res!104686) (not e!139017))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213804 (= res!104686 (and (= (size!5178 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5177 _keys!825) (size!5178 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9368 () Bool)

(assert (=> mapIsEmpty!9368 mapRes!9368))

(declare-fun b!213805 () Bool)

(declare-fun res!104685 () Bool)

(assert (=> b!213805 (=> (not res!104685) (not e!139017))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213805 (= res!104685 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5177 _keys!825))))))

(declare-fun b!213806 () Bool)

(declare-fun res!104684 () Bool)

(assert (=> b!213806 (=> (not res!104684) (not e!139017))))

(assert (=> b!213806 (= res!104684 (= (select (arr!4852 _keys!825) i!601) k0!843))))

(declare-fun b!213807 () Bool)

(declare-fun e!139021 () Bool)

(assert (=> b!213807 (= e!139021 tp_is_empty!5511)))

(declare-fun mapNonEmpty!9368 () Bool)

(declare-fun tp!20020 () Bool)

(assert (=> mapNonEmpty!9368 (= mapRes!9368 (and tp!20020 e!139021))))

(declare-fun mapRest!9368 () (Array (_ BitVec 32) ValueCell!2412))

(declare-fun mapValue!9368 () ValueCell!2412)

(declare-fun mapKey!9368 () (_ BitVec 32))

(assert (=> mapNonEmpty!9368 (= (arr!4853 _values!649) (store mapRest!9368 mapKey!9368 mapValue!9368))))

(declare-fun b!213808 () Bool)

(declare-fun e!139020 () Bool)

(assert (=> b!213808 (= e!139017 (not e!139020))))

(declare-fun res!104679 () Bool)

(assert (=> b!213808 (=> res!104679 e!139020)))

(declare-datatypes ((tuple2!4238 0))(
  ( (tuple2!4239 (_1!2130 (_ BitVec 64)) (_2!2130 V!6995)) )
))
(declare-datatypes ((List!3123 0))(
  ( (Nil!3120) (Cons!3119 (h!3761 tuple2!4238) (t!8076 List!3123)) )
))
(declare-datatypes ((ListLongMap!3151 0))(
  ( (ListLongMap!3152 (toList!1591 List!3123)) )
))
(declare-fun lt!110591 () ListLongMap!3151)

(declare-fun lt!110587 () ListLongMap!3151)

(declare-fun lt!110592 () Bool)

(assert (=> b!213808 (= res!104679 (or (and (not lt!110592) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110592) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110592) (not (= lt!110591 lt!110587))))))

(assert (=> b!213808 (= lt!110592 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110593 () ListLongMap!3151)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6995)

(declare-fun zeroValue!615 () V!6995)

(declare-fun getCurrentListMap!1119 (array!10225 array!10227 (_ BitVec 32) (_ BitVec 32) V!6995 V!6995 (_ BitVec 32) Int) ListLongMap!3151)

(assert (=> b!213808 (= lt!110593 (getCurrentListMap!1119 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110588 () array!10227)

(assert (=> b!213808 (= lt!110591 (getCurrentListMap!1119 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110595 () ListLongMap!3151)

(assert (=> b!213808 (and (= lt!110587 lt!110595) (= lt!110595 lt!110587))))

(declare-fun lt!110590 () ListLongMap!3151)

(declare-fun lt!110589 () tuple2!4238)

(declare-fun +!594 (ListLongMap!3151 tuple2!4238) ListLongMap!3151)

(assert (=> b!213808 (= lt!110595 (+!594 lt!110590 lt!110589))))

(declare-fun v!520 () V!6995)

(assert (=> b!213808 (= lt!110589 (tuple2!4239 k0!843 v!520))))

(declare-datatypes ((Unit!6482 0))(
  ( (Unit!6483) )
))
(declare-fun lt!110594 () Unit!6482)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!236 (array!10225 array!10227 (_ BitVec 32) (_ BitVec 32) V!6995 V!6995 (_ BitVec 32) (_ BitVec 64) V!6995 (_ BitVec 32) Int) Unit!6482)

(assert (=> b!213808 (= lt!110594 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!236 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!521 (array!10225 array!10227 (_ BitVec 32) (_ BitVec 32) V!6995 V!6995 (_ BitVec 32) Int) ListLongMap!3151)

(assert (=> b!213808 (= lt!110587 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213808 (= lt!110588 (array!10228 (store (arr!4853 _values!649) i!601 (ValueCellFull!2412 v!520)) (size!5178 _values!649)))))

(assert (=> b!213808 (= lt!110590 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213809 () Bool)

(assert (=> b!213809 (= e!139020 (= (+!594 lt!110593 lt!110589) lt!110591))))

(assert (= (and start!21218 res!104680) b!213804))

(assert (= (and b!213804 res!104686) b!213799))

(assert (= (and b!213799 res!104682) b!213801))

(assert (= (and b!213801 res!104681) b!213805))

(assert (= (and b!213805 res!104685) b!213802))

(assert (= (and b!213802 res!104683) b!213806))

(assert (= (and b!213806 res!104684) b!213808))

(assert (= (and b!213808 (not res!104679)) b!213809))

(assert (= (and b!213803 condMapEmpty!9368) mapIsEmpty!9368))

(assert (= (and b!213803 (not condMapEmpty!9368)) mapNonEmpty!9368))

(get-info :version)

(assert (= (and mapNonEmpty!9368 ((_ is ValueCellFull!2412) mapValue!9368)) b!213807))

(assert (= (and b!213803 ((_ is ValueCellFull!2412) mapDefault!9368)) b!213800))

(assert (= start!21218 b!213803))

(declare-fun m!241665 () Bool)

(assert (=> b!213799 m!241665))

(declare-fun m!241667 () Bool)

(assert (=> mapNonEmpty!9368 m!241667))

(declare-fun m!241669 () Bool)

(assert (=> b!213808 m!241669))

(declare-fun m!241671 () Bool)

(assert (=> b!213808 m!241671))

(declare-fun m!241673 () Bool)

(assert (=> b!213808 m!241673))

(declare-fun m!241675 () Bool)

(assert (=> b!213808 m!241675))

(declare-fun m!241677 () Bool)

(assert (=> b!213808 m!241677))

(declare-fun m!241679 () Bool)

(assert (=> b!213808 m!241679))

(declare-fun m!241681 () Bool)

(assert (=> b!213808 m!241681))

(declare-fun m!241683 () Bool)

(assert (=> b!213809 m!241683))

(declare-fun m!241685 () Bool)

(assert (=> b!213801 m!241685))

(declare-fun m!241687 () Bool)

(assert (=> b!213802 m!241687))

(declare-fun m!241689 () Bool)

(assert (=> start!21218 m!241689))

(declare-fun m!241691 () Bool)

(assert (=> start!21218 m!241691))

(declare-fun m!241693 () Bool)

(assert (=> start!21218 m!241693))

(declare-fun m!241695 () Bool)

(assert (=> b!213806 m!241695))

(check-sat (not b!213809) tp_is_empty!5511 (not b!213799) (not start!21218) (not b!213801) (not mapNonEmpty!9368) b_and!12527 (not b!213808) (not b!213802) (not b_next!5649))
(check-sat b_and!12527 (not b_next!5649))
(get-model)

(declare-fun b!213851 () Bool)

(declare-fun e!139047 () Bool)

(declare-fun e!139049 () Bool)

(assert (=> b!213851 (= e!139047 e!139049)))

(declare-fun lt!110630 () (_ BitVec 64))

(assert (=> b!213851 (= lt!110630 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110631 () Unit!6482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10225 (_ BitVec 64) (_ BitVec 32)) Unit!6482)

(assert (=> b!213851 (= lt!110631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110630 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213851 (arrayContainsKey!0 _keys!825 lt!110630 #b00000000000000000000000000000000)))

(declare-fun lt!110629 () Unit!6482)

(assert (=> b!213851 (= lt!110629 lt!110631)))

(declare-fun res!104715 () Bool)

(declare-datatypes ((SeekEntryResult!715 0))(
  ( (MissingZero!715 (index!5030 (_ BitVec 32))) (Found!715 (index!5031 (_ BitVec 32))) (Intermediate!715 (undefined!1527 Bool) (index!5032 (_ BitVec 32)) (x!22274 (_ BitVec 32))) (Undefined!715) (MissingVacant!715 (index!5033 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10225 (_ BitVec 32)) SeekEntryResult!715)

(assert (=> b!213851 (= res!104715 (= (seekEntryOrOpen!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!715 #b00000000000000000000000000000000)))))

(assert (=> b!213851 (=> (not res!104715) (not e!139049))))

(declare-fun b!213852 () Bool)

(declare-fun call!20263 () Bool)

(assert (=> b!213852 (= e!139049 call!20263)))

(declare-fun d!58233 () Bool)

(declare-fun res!104716 () Bool)

(declare-fun e!139048 () Bool)

(assert (=> d!58233 (=> res!104716 e!139048)))

(assert (=> d!58233 (= res!104716 (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!139048)))

(declare-fun b!213853 () Bool)

(assert (=> b!213853 (= e!139047 call!20263)))

(declare-fun bm!20260 () Bool)

(assert (=> bm!20260 (= call!20263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!213854 () Bool)

(assert (=> b!213854 (= e!139048 e!139047)))

(declare-fun c!35977 () Bool)

(assert (=> b!213854 (= c!35977 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58233 (not res!104716)) b!213854))

(assert (= (and b!213854 c!35977) b!213851))

(assert (= (and b!213854 (not c!35977)) b!213853))

(assert (= (and b!213851 res!104715) b!213852))

(assert (= (or b!213852 b!213853) bm!20260))

(declare-fun m!241729 () Bool)

(assert (=> b!213851 m!241729))

(declare-fun m!241731 () Bool)

(assert (=> b!213851 m!241731))

(declare-fun m!241733 () Bool)

(assert (=> b!213851 m!241733))

(assert (=> b!213851 m!241729))

(declare-fun m!241735 () Bool)

(assert (=> b!213851 m!241735))

(declare-fun m!241737 () Bool)

(assert (=> bm!20260 m!241737))

(assert (=> b!213854 m!241729))

(assert (=> b!213854 m!241729))

(declare-fun m!241739 () Bool)

(assert (=> b!213854 m!241739))

(assert (=> b!213799 d!58233))

(declare-fun bm!20275 () Bool)

(declare-fun call!20280 () ListLongMap!3151)

(declare-fun call!20279 () ListLongMap!3151)

(assert (=> bm!20275 (= call!20280 call!20279)))

(declare-fun b!213897 () Bool)

(declare-fun e!139078 () Bool)

(declare-fun call!20284 () Bool)

(assert (=> b!213897 (= e!139078 (not call!20284))))

(declare-fun b!213898 () Bool)

(declare-fun res!104742 () Bool)

(declare-fun e!139080 () Bool)

(assert (=> b!213898 (=> (not res!104742) (not e!139080))))

(declare-fun e!139083 () Bool)

(assert (=> b!213898 (= res!104742 e!139083)))

(declare-fun c!35992 () Bool)

(assert (=> b!213898 (= c!35992 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213899 () Bool)

(declare-fun e!139079 () Bool)

(assert (=> b!213899 (= e!139083 e!139079)))

(declare-fun res!104741 () Bool)

(declare-fun call!20281 () Bool)

(assert (=> b!213899 (= res!104741 call!20281)))

(assert (=> b!213899 (=> (not res!104741) (not e!139079))))

(declare-fun b!213900 () Bool)

(declare-fun lt!110694 () ListLongMap!3151)

(declare-fun apply!200 (ListLongMap!3151 (_ BitVec 64)) V!6995)

(assert (=> b!213900 (= e!139079 (= (apply!200 lt!110694 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213901 () Bool)

(assert (=> b!213901 (= e!139080 e!139078)))

(declare-fun c!35994 () Bool)

(assert (=> b!213901 (= c!35994 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213902 () Bool)

(declare-fun e!139086 () Bool)

(assert (=> b!213902 (= e!139078 e!139086)))

(declare-fun res!104736 () Bool)

(assert (=> b!213902 (= res!104736 call!20284)))

(assert (=> b!213902 (=> (not res!104736) (not e!139086))))

(declare-fun b!213903 () Bool)

(assert (=> b!213903 (= e!139086 (= (apply!200 lt!110694 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213904 () Bool)

(declare-fun e!139077 () Unit!6482)

(declare-fun lt!110680 () Unit!6482)

(assert (=> b!213904 (= e!139077 lt!110680)))

(declare-fun lt!110677 () ListLongMap!3151)

(assert (=> b!213904 (= lt!110677 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110678 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110681 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110681 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110696 () Unit!6482)

(declare-fun addStillContains!176 (ListLongMap!3151 (_ BitVec 64) V!6995 (_ BitVec 64)) Unit!6482)

(assert (=> b!213904 (= lt!110696 (addStillContains!176 lt!110677 lt!110678 zeroValue!615 lt!110681))))

(declare-fun contains!1422 (ListLongMap!3151 (_ BitVec 64)) Bool)

(assert (=> b!213904 (contains!1422 (+!594 lt!110677 (tuple2!4239 lt!110678 zeroValue!615)) lt!110681)))

(declare-fun lt!110682 () Unit!6482)

(assert (=> b!213904 (= lt!110682 lt!110696)))

(declare-fun lt!110679 () ListLongMap!3151)

(assert (=> b!213904 (= lt!110679 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110685 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110697 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110697 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110687 () Unit!6482)

(declare-fun addApplyDifferent!176 (ListLongMap!3151 (_ BitVec 64) V!6995 (_ BitVec 64)) Unit!6482)

(assert (=> b!213904 (= lt!110687 (addApplyDifferent!176 lt!110679 lt!110685 minValue!615 lt!110697))))

(assert (=> b!213904 (= (apply!200 (+!594 lt!110679 (tuple2!4239 lt!110685 minValue!615)) lt!110697) (apply!200 lt!110679 lt!110697))))

(declare-fun lt!110688 () Unit!6482)

(assert (=> b!213904 (= lt!110688 lt!110687)))

(declare-fun lt!110691 () ListLongMap!3151)

(assert (=> b!213904 (= lt!110691 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110684 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110692 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110692 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110693 () Unit!6482)

(assert (=> b!213904 (= lt!110693 (addApplyDifferent!176 lt!110691 lt!110684 zeroValue!615 lt!110692))))

(assert (=> b!213904 (= (apply!200 (+!594 lt!110691 (tuple2!4239 lt!110684 zeroValue!615)) lt!110692) (apply!200 lt!110691 lt!110692))))

(declare-fun lt!110695 () Unit!6482)

(assert (=> b!213904 (= lt!110695 lt!110693)))

(declare-fun lt!110686 () ListLongMap!3151)

(assert (=> b!213904 (= lt!110686 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110676 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110689 () (_ BitVec 64))

(assert (=> b!213904 (= lt!110689 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213904 (= lt!110680 (addApplyDifferent!176 lt!110686 lt!110676 minValue!615 lt!110689))))

(assert (=> b!213904 (= (apply!200 (+!594 lt!110686 (tuple2!4239 lt!110676 minValue!615)) lt!110689) (apply!200 lt!110686 lt!110689))))

(declare-fun b!213905 () Bool)

(declare-fun e!139081 () ListLongMap!3151)

(declare-fun e!139082 () ListLongMap!3151)

(assert (=> b!213905 (= e!139081 e!139082)))

(declare-fun c!35995 () Bool)

(assert (=> b!213905 (= c!35995 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213906 () Bool)

(declare-fun e!139085 () Bool)

(assert (=> b!213906 (= e!139085 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213907 () Bool)

(declare-fun Unit!6486 () Unit!6482)

(assert (=> b!213907 (= e!139077 Unit!6486)))

(declare-fun b!213908 () Bool)

(declare-fun e!139088 () ListLongMap!3151)

(declare-fun call!20282 () ListLongMap!3151)

(assert (=> b!213908 (= e!139088 call!20282)))

(declare-fun d!58235 () Bool)

(assert (=> d!58235 e!139080))

(declare-fun res!104737 () Bool)

(assert (=> d!58235 (=> (not res!104737) (not e!139080))))

(assert (=> d!58235 (= res!104737 (or (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))))

(declare-fun lt!110690 () ListLongMap!3151)

(assert (=> d!58235 (= lt!110694 lt!110690)))

(declare-fun lt!110683 () Unit!6482)

(assert (=> d!58235 (= lt!110683 e!139077)))

(declare-fun c!35990 () Bool)

(declare-fun e!139076 () Bool)

(assert (=> d!58235 (= c!35990 e!139076)))

(declare-fun res!104739 () Bool)

(assert (=> d!58235 (=> (not res!104739) (not e!139076))))

(assert (=> d!58235 (= res!104739 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58235 (= lt!110690 e!139081)))

(declare-fun c!35991 () Bool)

(assert (=> d!58235 (= c!35991 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58235 (validMask!0 mask!1149)))

(assert (=> d!58235 (= (getCurrentListMap!1119 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110694)))

(declare-fun b!213909 () Bool)

(declare-fun call!20278 () ListLongMap!3151)

(assert (=> b!213909 (= e!139082 call!20278)))

(declare-fun bm!20276 () Bool)

(assert (=> bm!20276 (= call!20279 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213910 () Bool)

(declare-fun e!139084 () Bool)

(declare-fun get!2592 (ValueCell!2412 V!6995) V!6995)

(declare-fun dynLambda!543 (Int (_ BitVec 64)) V!6995)

(assert (=> b!213910 (= e!139084 (= (apply!200 lt!110694 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)) (get!2592 (select (arr!4853 lt!110588) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5178 lt!110588)))))

(assert (=> b!213910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213911 () Bool)

(declare-fun e!139087 () Bool)

(assert (=> b!213911 (= e!139087 e!139084)))

(declare-fun res!104743 () Bool)

(assert (=> b!213911 (=> (not res!104743) (not e!139084))))

(assert (=> b!213911 (= res!104743 (contains!1422 lt!110694 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213912 () Bool)

(declare-fun res!104740 () Bool)

(assert (=> b!213912 (=> (not res!104740) (not e!139080))))

(assert (=> b!213912 (= res!104740 e!139087)))

(declare-fun res!104738 () Bool)

(assert (=> b!213912 (=> res!104738 e!139087)))

(assert (=> b!213912 (= res!104738 (not e!139085))))

(declare-fun res!104735 () Bool)

(assert (=> b!213912 (=> (not res!104735) (not e!139085))))

(assert (=> b!213912 (= res!104735 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun bm!20277 () Bool)

(assert (=> bm!20277 (= call!20281 (contains!1422 lt!110694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213913 () Bool)

(declare-fun call!20283 () ListLongMap!3151)

(assert (=> b!213913 (= e!139081 (+!594 call!20283 (tuple2!4239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213914 () Bool)

(assert (=> b!213914 (= e!139076 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213915 () Bool)

(assert (=> b!213915 (= e!139088 call!20278)))

(declare-fun bm!20278 () Bool)

(assert (=> bm!20278 (= call!20283 (+!594 (ite c!35991 call!20279 (ite c!35995 call!20280 call!20282)) (ite (or c!35991 c!35995) (tuple2!4239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20279 () Bool)

(assert (=> bm!20279 (= call!20278 call!20283)))

(declare-fun b!213916 () Bool)

(assert (=> b!213916 (= e!139083 (not call!20281))))

(declare-fun bm!20280 () Bool)

(assert (=> bm!20280 (= call!20284 (contains!1422 lt!110694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20281 () Bool)

(assert (=> bm!20281 (= call!20282 call!20280)))

(declare-fun b!213917 () Bool)

(declare-fun c!35993 () Bool)

(assert (=> b!213917 (= c!35993 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213917 (= e!139082 e!139088)))

(assert (= (and d!58235 c!35991) b!213913))

(assert (= (and d!58235 (not c!35991)) b!213905))

(assert (= (and b!213905 c!35995) b!213909))

(assert (= (and b!213905 (not c!35995)) b!213917))

(assert (= (and b!213917 c!35993) b!213915))

(assert (= (and b!213917 (not c!35993)) b!213908))

(assert (= (or b!213915 b!213908) bm!20281))

(assert (= (or b!213909 bm!20281) bm!20275))

(assert (= (or b!213909 b!213915) bm!20279))

(assert (= (or b!213913 bm!20275) bm!20276))

(assert (= (or b!213913 bm!20279) bm!20278))

(assert (= (and d!58235 res!104739) b!213914))

(assert (= (and d!58235 c!35990) b!213904))

(assert (= (and d!58235 (not c!35990)) b!213907))

(assert (= (and d!58235 res!104737) b!213912))

(assert (= (and b!213912 res!104735) b!213906))

(assert (= (and b!213912 (not res!104738)) b!213911))

(assert (= (and b!213911 res!104743) b!213910))

(assert (= (and b!213912 res!104740) b!213898))

(assert (= (and b!213898 c!35992) b!213899))

(assert (= (and b!213898 (not c!35992)) b!213916))

(assert (= (and b!213899 res!104741) b!213900))

(assert (= (or b!213899 b!213916) bm!20277))

(assert (= (and b!213898 res!104742) b!213901))

(assert (= (and b!213901 c!35994) b!213902))

(assert (= (and b!213901 (not c!35994)) b!213897))

(assert (= (and b!213902 res!104736) b!213903))

(assert (= (or b!213902 b!213897) bm!20280))

(declare-fun b_lambda!7803 () Bool)

(assert (=> (not b_lambda!7803) (not b!213910)))

(declare-fun t!8080 () Bool)

(declare-fun tb!2913 () Bool)

(assert (=> (and start!21218 (= defaultEntry!657 defaultEntry!657) t!8080) tb!2913))

(declare-fun result!5027 () Bool)

(assert (=> tb!2913 (= result!5027 tp_is_empty!5511)))

(assert (=> b!213910 t!8080))

(declare-fun b_and!12531 () Bool)

(assert (= b_and!12527 (and (=> t!8080 result!5027) b_and!12531)))

(declare-fun m!241741 () Bool)

(assert (=> b!213900 m!241741))

(assert (=> b!213910 m!241729))

(declare-fun m!241743 () Bool)

(assert (=> b!213910 m!241743))

(declare-fun m!241745 () Bool)

(assert (=> b!213910 m!241745))

(assert (=> b!213910 m!241729))

(declare-fun m!241747 () Bool)

(assert (=> b!213910 m!241747))

(assert (=> b!213910 m!241743))

(assert (=> b!213910 m!241745))

(declare-fun m!241749 () Bool)

(assert (=> b!213910 m!241749))

(declare-fun m!241751 () Bool)

(assert (=> b!213904 m!241751))

(declare-fun m!241753 () Bool)

(assert (=> b!213904 m!241753))

(assert (=> b!213904 m!241671))

(declare-fun m!241755 () Bool)

(assert (=> b!213904 m!241755))

(declare-fun m!241757 () Bool)

(assert (=> b!213904 m!241757))

(declare-fun m!241759 () Bool)

(assert (=> b!213904 m!241759))

(declare-fun m!241761 () Bool)

(assert (=> b!213904 m!241761))

(declare-fun m!241763 () Bool)

(assert (=> b!213904 m!241763))

(declare-fun m!241765 () Bool)

(assert (=> b!213904 m!241765))

(assert (=> b!213904 m!241759))

(assert (=> b!213904 m!241765))

(declare-fun m!241767 () Bool)

(assert (=> b!213904 m!241767))

(declare-fun m!241769 () Bool)

(assert (=> b!213904 m!241769))

(assert (=> b!213904 m!241751))

(declare-fun m!241771 () Bool)

(assert (=> b!213904 m!241771))

(assert (=> b!213904 m!241729))

(declare-fun m!241773 () Bool)

(assert (=> b!213904 m!241773))

(declare-fun m!241775 () Bool)

(assert (=> b!213904 m!241775))

(assert (=> b!213904 m!241757))

(declare-fun m!241777 () Bool)

(assert (=> b!213904 m!241777))

(declare-fun m!241779 () Bool)

(assert (=> b!213904 m!241779))

(declare-fun m!241781 () Bool)

(assert (=> bm!20277 m!241781))

(declare-fun m!241783 () Bool)

(assert (=> bm!20278 m!241783))

(declare-fun m!241785 () Bool)

(assert (=> b!213913 m!241785))

(assert (=> b!213906 m!241729))

(assert (=> b!213906 m!241729))

(assert (=> b!213906 m!241739))

(assert (=> bm!20276 m!241671))

(assert (=> b!213914 m!241729))

(assert (=> b!213914 m!241729))

(assert (=> b!213914 m!241739))

(declare-fun m!241787 () Bool)

(assert (=> bm!20280 m!241787))

(assert (=> d!58235 m!241689))

(assert (=> b!213911 m!241729))

(assert (=> b!213911 m!241729))

(declare-fun m!241789 () Bool)

(assert (=> b!213911 m!241789))

(declare-fun m!241791 () Bool)

(assert (=> b!213903 m!241791))

(assert (=> b!213808 d!58235))

(declare-fun b!213944 () Bool)

(declare-fun e!139107 () ListLongMap!3151)

(declare-fun call!20287 () ListLongMap!3151)

(assert (=> b!213944 (= e!139107 call!20287)))

(declare-fun b!213945 () Bool)

(declare-fun res!104753 () Bool)

(declare-fun e!139105 () Bool)

(assert (=> b!213945 (=> (not res!104753) (not e!139105))))

(declare-fun lt!110714 () ListLongMap!3151)

(assert (=> b!213945 (= res!104753 (not (contains!1422 lt!110714 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213946 () Bool)

(declare-fun e!139109 () Bool)

(assert (=> b!213946 (= e!139105 e!139109)))

(declare-fun c!36005 () Bool)

(declare-fun e!139108 () Bool)

(assert (=> b!213946 (= c!36005 e!139108)))

(declare-fun res!104754 () Bool)

(assert (=> b!213946 (=> (not res!104754) (not e!139108))))

(assert (=> b!213946 (= res!104754 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213947 () Bool)

(declare-fun lt!110717 () Unit!6482)

(declare-fun lt!110716 () Unit!6482)

(assert (=> b!213947 (= lt!110717 lt!110716)))

(declare-fun lt!110715 () V!6995)

(declare-fun lt!110713 () ListLongMap!3151)

(declare-fun lt!110718 () (_ BitVec 64))

(declare-fun lt!110712 () (_ BitVec 64))

(assert (=> b!213947 (not (contains!1422 (+!594 lt!110713 (tuple2!4239 lt!110718 lt!110715)) lt!110712))))

(declare-fun addStillNotContains!109 (ListLongMap!3151 (_ BitVec 64) V!6995 (_ BitVec 64)) Unit!6482)

(assert (=> b!213947 (= lt!110716 (addStillNotContains!109 lt!110713 lt!110718 lt!110715 lt!110712))))

(assert (=> b!213947 (= lt!110712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213947 (= lt!110715 (get!2592 (select (arr!4853 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213947 (= lt!110718 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213947 (= lt!110713 call!20287)))

(assert (=> b!213947 (= e!139107 (+!594 call!20287 (tuple2!4239 (select (arr!4852 _keys!825) #b00000000000000000000000000000000) (get!2592 (select (arr!4853 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213948 () Bool)

(declare-fun e!139103 () Bool)

(assert (=> b!213948 (= e!139109 e!139103)))

(declare-fun c!36006 () Bool)

(assert (=> b!213948 (= c!36006 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213949 () Bool)

(declare-fun isEmpty!501 (ListLongMap!3151) Bool)

(assert (=> b!213949 (= e!139103 (isEmpty!501 lt!110714))))

(declare-fun bm!20284 () Bool)

(assert (=> bm!20284 (= call!20287 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213950 () Bool)

(assert (=> b!213950 (= e!139108 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213950 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!58237 () Bool)

(assert (=> d!58237 e!139105))

(declare-fun res!104755 () Bool)

(assert (=> d!58237 (=> (not res!104755) (not e!139105))))

(assert (=> d!58237 (= res!104755 (not (contains!1422 lt!110714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!139106 () ListLongMap!3151)

(assert (=> d!58237 (= lt!110714 e!139106)))

(declare-fun c!36004 () Bool)

(assert (=> d!58237 (= c!36004 (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58237 (validMask!0 mask!1149)))

(assert (=> d!58237 (= (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110714)))

(declare-fun b!213951 () Bool)

(assert (=> b!213951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> b!213951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5178 _values!649)))))

(declare-fun e!139104 () Bool)

(assert (=> b!213951 (= e!139104 (= (apply!200 lt!110714 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)) (get!2592 (select (arr!4853 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213952 () Bool)

(assert (=> b!213952 (= e!139106 (ListLongMap!3152 Nil!3120))))

(declare-fun b!213953 () Bool)

(assert (=> b!213953 (= e!139109 e!139104)))

(assert (=> b!213953 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun res!104752 () Bool)

(assert (=> b!213953 (= res!104752 (contains!1422 lt!110714 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213953 (=> (not res!104752) (not e!139104))))

(declare-fun b!213954 () Bool)

(assert (=> b!213954 (= e!139103 (= lt!110714 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213955 () Bool)

(assert (=> b!213955 (= e!139106 e!139107)))

(declare-fun c!36007 () Bool)

(assert (=> b!213955 (= c!36007 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58237 c!36004) b!213952))

(assert (= (and d!58237 (not c!36004)) b!213955))

(assert (= (and b!213955 c!36007) b!213947))

(assert (= (and b!213955 (not c!36007)) b!213944))

(assert (= (or b!213947 b!213944) bm!20284))

(assert (= (and d!58237 res!104755) b!213945))

(assert (= (and b!213945 res!104753) b!213946))

(assert (= (and b!213946 res!104754) b!213950))

(assert (= (and b!213946 c!36005) b!213953))

(assert (= (and b!213946 (not c!36005)) b!213948))

(assert (= (and b!213953 res!104752) b!213951))

(assert (= (and b!213948 c!36006) b!213954))

(assert (= (and b!213948 (not c!36006)) b!213949))

(declare-fun b_lambda!7805 () Bool)

(assert (=> (not b_lambda!7805) (not b!213947)))

(assert (=> b!213947 t!8080))

(declare-fun b_and!12533 () Bool)

(assert (= b_and!12531 (and (=> t!8080 result!5027) b_and!12533)))

(declare-fun b_lambda!7807 () Bool)

(assert (=> (not b_lambda!7807) (not b!213951)))

(assert (=> b!213951 t!8080))

(declare-fun b_and!12535 () Bool)

(assert (= b_and!12533 (and (=> t!8080 result!5027) b_and!12535)))

(assert (=> b!213955 m!241729))

(assert (=> b!213955 m!241729))

(assert (=> b!213955 m!241739))

(declare-fun m!241793 () Bool)

(assert (=> d!58237 m!241793))

(assert (=> d!58237 m!241689))

(assert (=> b!213950 m!241729))

(assert (=> b!213950 m!241729))

(assert (=> b!213950 m!241739))

(declare-fun m!241795 () Bool)

(assert (=> b!213949 m!241795))

(declare-fun m!241797 () Bool)

(assert (=> b!213945 m!241797))

(assert (=> b!213953 m!241729))

(assert (=> b!213953 m!241729))

(declare-fun m!241799 () Bool)

(assert (=> b!213953 m!241799))

(declare-fun m!241801 () Bool)

(assert (=> b!213947 m!241801))

(declare-fun m!241803 () Bool)

(assert (=> b!213947 m!241803))

(declare-fun m!241805 () Bool)

(assert (=> b!213947 m!241805))

(declare-fun m!241807 () Bool)

(assert (=> b!213947 m!241807))

(assert (=> b!213947 m!241807))

(assert (=> b!213947 m!241745))

(declare-fun m!241809 () Bool)

(assert (=> b!213947 m!241809))

(assert (=> b!213947 m!241729))

(declare-fun m!241811 () Bool)

(assert (=> b!213947 m!241811))

(assert (=> b!213947 m!241745))

(assert (=> b!213947 m!241803))

(declare-fun m!241813 () Bool)

(assert (=> b!213954 m!241813))

(assert (=> bm!20284 m!241813))

(assert (=> b!213951 m!241807))

(assert (=> b!213951 m!241729))

(declare-fun m!241815 () Bool)

(assert (=> b!213951 m!241815))

(assert (=> b!213951 m!241745))

(assert (=> b!213951 m!241807))

(assert (=> b!213951 m!241745))

(assert (=> b!213951 m!241809))

(assert (=> b!213951 m!241729))

(assert (=> b!213808 d!58237))

(declare-fun d!58239 () Bool)

(declare-fun e!139112 () Bool)

(assert (=> d!58239 e!139112))

(declare-fun res!104761 () Bool)

(assert (=> d!58239 (=> (not res!104761) (not e!139112))))

(declare-fun lt!110729 () ListLongMap!3151)

(assert (=> d!58239 (= res!104761 (contains!1422 lt!110729 (_1!2130 lt!110589)))))

(declare-fun lt!110728 () List!3123)

(assert (=> d!58239 (= lt!110729 (ListLongMap!3152 lt!110728))))

(declare-fun lt!110727 () Unit!6482)

(declare-fun lt!110730 () Unit!6482)

(assert (=> d!58239 (= lt!110727 lt!110730)))

(declare-datatypes ((Option!264 0))(
  ( (Some!263 (v!4819 V!6995)) (None!262) )
))
(declare-fun getValueByKey!258 (List!3123 (_ BitVec 64)) Option!264)

(assert (=> d!58239 (= (getValueByKey!258 lt!110728 (_1!2130 lt!110589)) (Some!263 (_2!2130 lt!110589)))))

(declare-fun lemmaContainsTupThenGetReturnValue!145 (List!3123 (_ BitVec 64) V!6995) Unit!6482)

(assert (=> d!58239 (= lt!110730 (lemmaContainsTupThenGetReturnValue!145 lt!110728 (_1!2130 lt!110589) (_2!2130 lt!110589)))))

(declare-fun insertStrictlySorted!148 (List!3123 (_ BitVec 64) V!6995) List!3123)

(assert (=> d!58239 (= lt!110728 (insertStrictlySorted!148 (toList!1591 lt!110590) (_1!2130 lt!110589) (_2!2130 lt!110589)))))

(assert (=> d!58239 (= (+!594 lt!110590 lt!110589) lt!110729)))

(declare-fun b!213960 () Bool)

(declare-fun res!104760 () Bool)

(assert (=> b!213960 (=> (not res!104760) (not e!139112))))

(assert (=> b!213960 (= res!104760 (= (getValueByKey!258 (toList!1591 lt!110729) (_1!2130 lt!110589)) (Some!263 (_2!2130 lt!110589))))))

(declare-fun b!213961 () Bool)

(declare-fun contains!1423 (List!3123 tuple2!4238) Bool)

(assert (=> b!213961 (= e!139112 (contains!1423 (toList!1591 lt!110729) lt!110589))))

(assert (= (and d!58239 res!104761) b!213960))

(assert (= (and b!213960 res!104760) b!213961))

(declare-fun m!241817 () Bool)

(assert (=> d!58239 m!241817))

(declare-fun m!241819 () Bool)

(assert (=> d!58239 m!241819))

(declare-fun m!241821 () Bool)

(assert (=> d!58239 m!241821))

(declare-fun m!241823 () Bool)

(assert (=> d!58239 m!241823))

(declare-fun m!241825 () Bool)

(assert (=> b!213960 m!241825))

(declare-fun m!241827 () Bool)

(assert (=> b!213961 m!241827))

(assert (=> b!213808 d!58239))

(declare-fun b!213962 () Bool)

(declare-fun e!139117 () ListLongMap!3151)

(declare-fun call!20288 () ListLongMap!3151)

(assert (=> b!213962 (= e!139117 call!20288)))

(declare-fun b!213963 () Bool)

(declare-fun res!104763 () Bool)

(declare-fun e!139115 () Bool)

(assert (=> b!213963 (=> (not res!104763) (not e!139115))))

(declare-fun lt!110733 () ListLongMap!3151)

(assert (=> b!213963 (= res!104763 (not (contains!1422 lt!110733 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213964 () Bool)

(declare-fun e!139119 () Bool)

(assert (=> b!213964 (= e!139115 e!139119)))

(declare-fun c!36009 () Bool)

(declare-fun e!139118 () Bool)

(assert (=> b!213964 (= c!36009 e!139118)))

(declare-fun res!104764 () Bool)

(assert (=> b!213964 (=> (not res!104764) (not e!139118))))

(assert (=> b!213964 (= res!104764 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213965 () Bool)

(declare-fun lt!110736 () Unit!6482)

(declare-fun lt!110735 () Unit!6482)

(assert (=> b!213965 (= lt!110736 lt!110735)))

(declare-fun lt!110731 () (_ BitVec 64))

(declare-fun lt!110734 () V!6995)

(declare-fun lt!110737 () (_ BitVec 64))

(declare-fun lt!110732 () ListLongMap!3151)

(assert (=> b!213965 (not (contains!1422 (+!594 lt!110732 (tuple2!4239 lt!110737 lt!110734)) lt!110731))))

(assert (=> b!213965 (= lt!110735 (addStillNotContains!109 lt!110732 lt!110737 lt!110734 lt!110731))))

(assert (=> b!213965 (= lt!110731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213965 (= lt!110734 (get!2592 (select (arr!4853 lt!110588) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213965 (= lt!110737 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213965 (= lt!110732 call!20288)))

(assert (=> b!213965 (= e!139117 (+!594 call!20288 (tuple2!4239 (select (arr!4852 _keys!825) #b00000000000000000000000000000000) (get!2592 (select (arr!4853 lt!110588) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213966 () Bool)

(declare-fun e!139113 () Bool)

(assert (=> b!213966 (= e!139119 e!139113)))

(declare-fun c!36010 () Bool)

(assert (=> b!213966 (= c!36010 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213967 () Bool)

(assert (=> b!213967 (= e!139113 (isEmpty!501 lt!110733))))

(declare-fun bm!20285 () Bool)

(assert (=> bm!20285 (= call!20288 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213968 () Bool)

(assert (=> b!213968 (= e!139118 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213968 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!58241 () Bool)

(assert (=> d!58241 e!139115))

(declare-fun res!104765 () Bool)

(assert (=> d!58241 (=> (not res!104765) (not e!139115))))

(assert (=> d!58241 (= res!104765 (not (contains!1422 lt!110733 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!139116 () ListLongMap!3151)

(assert (=> d!58241 (= lt!110733 e!139116)))

(declare-fun c!36008 () Bool)

(assert (=> d!58241 (= c!36008 (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58241 (validMask!0 mask!1149)))

(assert (=> d!58241 (= (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110733)))

(declare-fun b!213969 () Bool)

(assert (=> b!213969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> b!213969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5178 lt!110588)))))

(declare-fun e!139114 () Bool)

(assert (=> b!213969 (= e!139114 (= (apply!200 lt!110733 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)) (get!2592 (select (arr!4853 lt!110588) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213970 () Bool)

(assert (=> b!213970 (= e!139116 (ListLongMap!3152 Nil!3120))))

(declare-fun b!213971 () Bool)

(assert (=> b!213971 (= e!139119 e!139114)))

(assert (=> b!213971 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun res!104762 () Bool)

(assert (=> b!213971 (= res!104762 (contains!1422 lt!110733 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213971 (=> (not res!104762) (not e!139114))))

(declare-fun b!213972 () Bool)

(assert (=> b!213972 (= e!139113 (= lt!110733 (getCurrentListMapNoExtraKeys!521 _keys!825 lt!110588 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213973 () Bool)

(assert (=> b!213973 (= e!139116 e!139117)))

(declare-fun c!36011 () Bool)

(assert (=> b!213973 (= c!36011 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58241 c!36008) b!213970))

(assert (= (and d!58241 (not c!36008)) b!213973))

(assert (= (and b!213973 c!36011) b!213965))

(assert (= (and b!213973 (not c!36011)) b!213962))

(assert (= (or b!213965 b!213962) bm!20285))

(assert (= (and d!58241 res!104765) b!213963))

(assert (= (and b!213963 res!104763) b!213964))

(assert (= (and b!213964 res!104764) b!213968))

(assert (= (and b!213964 c!36009) b!213971))

(assert (= (and b!213964 (not c!36009)) b!213966))

(assert (= (and b!213971 res!104762) b!213969))

(assert (= (and b!213966 c!36010) b!213972))

(assert (= (and b!213966 (not c!36010)) b!213967))

(declare-fun b_lambda!7809 () Bool)

(assert (=> (not b_lambda!7809) (not b!213965)))

(assert (=> b!213965 t!8080))

(declare-fun b_and!12537 () Bool)

(assert (= b_and!12535 (and (=> t!8080 result!5027) b_and!12537)))

(declare-fun b_lambda!7811 () Bool)

(assert (=> (not b_lambda!7811) (not b!213969)))

(assert (=> b!213969 t!8080))

(declare-fun b_and!12539 () Bool)

(assert (= b_and!12537 (and (=> t!8080 result!5027) b_and!12539)))

(assert (=> b!213973 m!241729))

(assert (=> b!213973 m!241729))

(assert (=> b!213973 m!241739))

(declare-fun m!241829 () Bool)

(assert (=> d!58241 m!241829))

(assert (=> d!58241 m!241689))

(assert (=> b!213968 m!241729))

(assert (=> b!213968 m!241729))

(assert (=> b!213968 m!241739))

(declare-fun m!241831 () Bool)

(assert (=> b!213967 m!241831))

(declare-fun m!241833 () Bool)

(assert (=> b!213963 m!241833))

(assert (=> b!213971 m!241729))

(assert (=> b!213971 m!241729))

(declare-fun m!241835 () Bool)

(assert (=> b!213971 m!241835))

(declare-fun m!241837 () Bool)

(assert (=> b!213965 m!241837))

(declare-fun m!241839 () Bool)

(assert (=> b!213965 m!241839))

(declare-fun m!241841 () Bool)

(assert (=> b!213965 m!241841))

(assert (=> b!213965 m!241743))

(assert (=> b!213965 m!241743))

(assert (=> b!213965 m!241745))

(assert (=> b!213965 m!241749))

(assert (=> b!213965 m!241729))

(declare-fun m!241843 () Bool)

(assert (=> b!213965 m!241843))

(assert (=> b!213965 m!241745))

(assert (=> b!213965 m!241839))

(declare-fun m!241845 () Bool)

(assert (=> b!213972 m!241845))

(assert (=> bm!20285 m!241845))

(assert (=> b!213969 m!241743))

(assert (=> b!213969 m!241729))

(declare-fun m!241847 () Bool)

(assert (=> b!213969 m!241847))

(assert (=> b!213969 m!241745))

(assert (=> b!213969 m!241743))

(assert (=> b!213969 m!241745))

(assert (=> b!213969 m!241749))

(assert (=> b!213969 m!241729))

(assert (=> b!213808 d!58241))

(declare-fun bm!20290 () Bool)

(declare-fun call!20294 () ListLongMap!3151)

(assert (=> bm!20290 (= call!20294 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun call!20293 () ListLongMap!3151)

(declare-fun bm!20291 () Bool)

(assert (=> bm!20291 (= call!20293 (getCurrentListMapNoExtraKeys!521 _keys!825 (array!10228 (store (arr!4853 _values!649) i!601 (ValueCellFull!2412 v!520)) (size!5178 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213980 () Bool)

(declare-fun e!139125 () Bool)

(assert (=> b!213980 (= e!139125 (= call!20293 (+!594 call!20294 (tuple2!4239 k0!843 v!520))))))

(declare-fun b!213981 () Bool)

(assert (=> b!213981 (= e!139125 (= call!20293 call!20294))))

(declare-fun d!58243 () Bool)

(declare-fun e!139124 () Bool)

(assert (=> d!58243 e!139124))

(declare-fun res!104768 () Bool)

(assert (=> d!58243 (=> (not res!104768) (not e!139124))))

(assert (=> d!58243 (= res!104768 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5178 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5178 _values!649))))))))

(declare-fun lt!110740 () Unit!6482)

(declare-fun choose!1084 (array!10225 array!10227 (_ BitVec 32) (_ BitVec 32) V!6995 V!6995 (_ BitVec 32) (_ BitVec 64) V!6995 (_ BitVec 32) Int) Unit!6482)

(assert (=> d!58243 (= lt!110740 (choose!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58243 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!236 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110740)))

(declare-fun b!213982 () Bool)

(assert (=> b!213982 (= e!139124 e!139125)))

(declare-fun c!36014 () Bool)

(assert (=> b!213982 (= c!36014 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58243 res!104768) b!213982))

(assert (= (and b!213982 c!36014) b!213980))

(assert (= (and b!213982 (not c!36014)) b!213981))

(assert (= (or b!213980 b!213981) bm!20291))

(assert (= (or b!213980 b!213981) bm!20290))

(assert (=> bm!20290 m!241681))

(assert (=> bm!20291 m!241673))

(declare-fun m!241849 () Bool)

(assert (=> bm!20291 m!241849))

(declare-fun m!241851 () Bool)

(assert (=> b!213980 m!241851))

(declare-fun m!241853 () Bool)

(assert (=> d!58243 m!241853))

(assert (=> b!213808 d!58243))

(declare-fun bm!20292 () Bool)

(declare-fun call!20297 () ListLongMap!3151)

(declare-fun call!20296 () ListLongMap!3151)

(assert (=> bm!20292 (= call!20297 call!20296)))

(declare-fun b!213983 () Bool)

(declare-fun e!139128 () Bool)

(declare-fun call!20301 () Bool)

(assert (=> b!213983 (= e!139128 (not call!20301))))

(declare-fun b!213984 () Bool)

(declare-fun res!104776 () Bool)

(declare-fun e!139130 () Bool)

(assert (=> b!213984 (=> (not res!104776) (not e!139130))))

(declare-fun e!139133 () Bool)

(assert (=> b!213984 (= res!104776 e!139133)))

(declare-fun c!36017 () Bool)

(assert (=> b!213984 (= c!36017 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213985 () Bool)

(declare-fun e!139129 () Bool)

(assert (=> b!213985 (= e!139133 e!139129)))

(declare-fun res!104775 () Bool)

(declare-fun call!20298 () Bool)

(assert (=> b!213985 (= res!104775 call!20298)))

(assert (=> b!213985 (=> (not res!104775) (not e!139129))))

(declare-fun b!213986 () Bool)

(declare-fun lt!110759 () ListLongMap!3151)

(assert (=> b!213986 (= e!139129 (= (apply!200 lt!110759 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213987 () Bool)

(assert (=> b!213987 (= e!139130 e!139128)))

(declare-fun c!36019 () Bool)

(assert (=> b!213987 (= c!36019 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213988 () Bool)

(declare-fun e!139136 () Bool)

(assert (=> b!213988 (= e!139128 e!139136)))

(declare-fun res!104770 () Bool)

(assert (=> b!213988 (= res!104770 call!20301)))

(assert (=> b!213988 (=> (not res!104770) (not e!139136))))

(declare-fun b!213989 () Bool)

(assert (=> b!213989 (= e!139136 (= (apply!200 lt!110759 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213990 () Bool)

(declare-fun e!139127 () Unit!6482)

(declare-fun lt!110745 () Unit!6482)

(assert (=> b!213990 (= e!139127 lt!110745)))

(declare-fun lt!110742 () ListLongMap!3151)

(assert (=> b!213990 (= lt!110742 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110743 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110746 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110746 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110761 () Unit!6482)

(assert (=> b!213990 (= lt!110761 (addStillContains!176 lt!110742 lt!110743 zeroValue!615 lt!110746))))

(assert (=> b!213990 (contains!1422 (+!594 lt!110742 (tuple2!4239 lt!110743 zeroValue!615)) lt!110746)))

(declare-fun lt!110747 () Unit!6482)

(assert (=> b!213990 (= lt!110747 lt!110761)))

(declare-fun lt!110744 () ListLongMap!3151)

(assert (=> b!213990 (= lt!110744 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110750 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110750 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110762 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110762 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110752 () Unit!6482)

(assert (=> b!213990 (= lt!110752 (addApplyDifferent!176 lt!110744 lt!110750 minValue!615 lt!110762))))

(assert (=> b!213990 (= (apply!200 (+!594 lt!110744 (tuple2!4239 lt!110750 minValue!615)) lt!110762) (apply!200 lt!110744 lt!110762))))

(declare-fun lt!110753 () Unit!6482)

(assert (=> b!213990 (= lt!110753 lt!110752)))

(declare-fun lt!110756 () ListLongMap!3151)

(assert (=> b!213990 (= lt!110756 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110749 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110749 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110757 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110757 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110758 () Unit!6482)

(assert (=> b!213990 (= lt!110758 (addApplyDifferent!176 lt!110756 lt!110749 zeroValue!615 lt!110757))))

(assert (=> b!213990 (= (apply!200 (+!594 lt!110756 (tuple2!4239 lt!110749 zeroValue!615)) lt!110757) (apply!200 lt!110756 lt!110757))))

(declare-fun lt!110760 () Unit!6482)

(assert (=> b!213990 (= lt!110760 lt!110758)))

(declare-fun lt!110751 () ListLongMap!3151)

(assert (=> b!213990 (= lt!110751 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110741 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110754 () (_ BitVec 64))

(assert (=> b!213990 (= lt!110754 (select (arr!4852 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213990 (= lt!110745 (addApplyDifferent!176 lt!110751 lt!110741 minValue!615 lt!110754))))

(assert (=> b!213990 (= (apply!200 (+!594 lt!110751 (tuple2!4239 lt!110741 minValue!615)) lt!110754) (apply!200 lt!110751 lt!110754))))

(declare-fun b!213991 () Bool)

(declare-fun e!139131 () ListLongMap!3151)

(declare-fun e!139132 () ListLongMap!3151)

(assert (=> b!213991 (= e!139131 e!139132)))

(declare-fun c!36020 () Bool)

(assert (=> b!213991 (= c!36020 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213992 () Bool)

(declare-fun e!139135 () Bool)

(assert (=> b!213992 (= e!139135 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213993 () Bool)

(declare-fun Unit!6487 () Unit!6482)

(assert (=> b!213993 (= e!139127 Unit!6487)))

(declare-fun b!213994 () Bool)

(declare-fun e!139138 () ListLongMap!3151)

(declare-fun call!20299 () ListLongMap!3151)

(assert (=> b!213994 (= e!139138 call!20299)))

(declare-fun d!58245 () Bool)

(assert (=> d!58245 e!139130))

(declare-fun res!104771 () Bool)

(assert (=> d!58245 (=> (not res!104771) (not e!139130))))

(assert (=> d!58245 (= res!104771 (or (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))))

(declare-fun lt!110755 () ListLongMap!3151)

(assert (=> d!58245 (= lt!110759 lt!110755)))

(declare-fun lt!110748 () Unit!6482)

(assert (=> d!58245 (= lt!110748 e!139127)))

(declare-fun c!36015 () Bool)

(declare-fun e!139126 () Bool)

(assert (=> d!58245 (= c!36015 e!139126)))

(declare-fun res!104773 () Bool)

(assert (=> d!58245 (=> (not res!104773) (not e!139126))))

(assert (=> d!58245 (= res!104773 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58245 (= lt!110755 e!139131)))

(declare-fun c!36016 () Bool)

(assert (=> d!58245 (= c!36016 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58245 (validMask!0 mask!1149)))

(assert (=> d!58245 (= (getCurrentListMap!1119 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110759)))

(declare-fun b!213995 () Bool)

(declare-fun call!20295 () ListLongMap!3151)

(assert (=> b!213995 (= e!139132 call!20295)))

(declare-fun bm!20293 () Bool)

(assert (=> bm!20293 (= call!20296 (getCurrentListMapNoExtraKeys!521 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun e!139134 () Bool)

(declare-fun b!213996 () Bool)

(assert (=> b!213996 (= e!139134 (= (apply!200 lt!110759 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)) (get!2592 (select (arr!4853 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5178 _values!649)))))

(assert (=> b!213996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213997 () Bool)

(declare-fun e!139137 () Bool)

(assert (=> b!213997 (= e!139137 e!139134)))

(declare-fun res!104777 () Bool)

(assert (=> b!213997 (=> (not res!104777) (not e!139134))))

(assert (=> b!213997 (= res!104777 (contains!1422 lt!110759 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun b!213998 () Bool)

(declare-fun res!104774 () Bool)

(assert (=> b!213998 (=> (not res!104774) (not e!139130))))

(assert (=> b!213998 (= res!104774 e!139137)))

(declare-fun res!104772 () Bool)

(assert (=> b!213998 (=> res!104772 e!139137)))

(assert (=> b!213998 (= res!104772 (not e!139135))))

(declare-fun res!104769 () Bool)

(assert (=> b!213998 (=> (not res!104769) (not e!139135))))

(assert (=> b!213998 (= res!104769 (bvslt #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(declare-fun bm!20294 () Bool)

(assert (=> bm!20294 (= call!20298 (contains!1422 lt!110759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213999 () Bool)

(declare-fun call!20300 () ListLongMap!3151)

(assert (=> b!213999 (= e!139131 (+!594 call!20300 (tuple2!4239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!214000 () Bool)

(assert (=> b!214000 (= e!139126 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214001 () Bool)

(assert (=> b!214001 (= e!139138 call!20295)))

(declare-fun bm!20295 () Bool)

(assert (=> bm!20295 (= call!20300 (+!594 (ite c!36016 call!20296 (ite c!36020 call!20297 call!20299)) (ite (or c!36016 c!36020) (tuple2!4239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20296 () Bool)

(assert (=> bm!20296 (= call!20295 call!20300)))

(declare-fun b!214002 () Bool)

(assert (=> b!214002 (= e!139133 (not call!20298))))

(declare-fun bm!20297 () Bool)

(assert (=> bm!20297 (= call!20301 (contains!1422 lt!110759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20298 () Bool)

(assert (=> bm!20298 (= call!20299 call!20297)))

(declare-fun b!214003 () Bool)

(declare-fun c!36018 () Bool)

(assert (=> b!214003 (= c!36018 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!214003 (= e!139132 e!139138)))

(assert (= (and d!58245 c!36016) b!213999))

(assert (= (and d!58245 (not c!36016)) b!213991))

(assert (= (and b!213991 c!36020) b!213995))

(assert (= (and b!213991 (not c!36020)) b!214003))

(assert (= (and b!214003 c!36018) b!214001))

(assert (= (and b!214003 (not c!36018)) b!213994))

(assert (= (or b!214001 b!213994) bm!20298))

(assert (= (or b!213995 bm!20298) bm!20292))

(assert (= (or b!213995 b!214001) bm!20296))

(assert (= (or b!213999 bm!20292) bm!20293))

(assert (= (or b!213999 bm!20296) bm!20295))

(assert (= (and d!58245 res!104773) b!214000))

(assert (= (and d!58245 c!36015) b!213990))

(assert (= (and d!58245 (not c!36015)) b!213993))

(assert (= (and d!58245 res!104771) b!213998))

(assert (= (and b!213998 res!104769) b!213992))

(assert (= (and b!213998 (not res!104772)) b!213997))

(assert (= (and b!213997 res!104777) b!213996))

(assert (= (and b!213998 res!104774) b!213984))

(assert (= (and b!213984 c!36017) b!213985))

(assert (= (and b!213984 (not c!36017)) b!214002))

(assert (= (and b!213985 res!104775) b!213986))

(assert (= (or b!213985 b!214002) bm!20294))

(assert (= (and b!213984 res!104776) b!213987))

(assert (= (and b!213987 c!36019) b!213988))

(assert (= (and b!213987 (not c!36019)) b!213983))

(assert (= (and b!213988 res!104770) b!213989))

(assert (= (or b!213988 b!213983) bm!20297))

(declare-fun b_lambda!7813 () Bool)

(assert (=> (not b_lambda!7813) (not b!213996)))

(assert (=> b!213996 t!8080))

(declare-fun b_and!12541 () Bool)

(assert (= b_and!12539 (and (=> t!8080 result!5027) b_and!12541)))

(declare-fun m!241855 () Bool)

(assert (=> b!213986 m!241855))

(assert (=> b!213996 m!241729))

(assert (=> b!213996 m!241807))

(assert (=> b!213996 m!241745))

(assert (=> b!213996 m!241729))

(declare-fun m!241857 () Bool)

(assert (=> b!213996 m!241857))

(assert (=> b!213996 m!241807))

(assert (=> b!213996 m!241745))

(assert (=> b!213996 m!241809))

(declare-fun m!241859 () Bool)

(assert (=> b!213990 m!241859))

(declare-fun m!241861 () Bool)

(assert (=> b!213990 m!241861))

(assert (=> b!213990 m!241681))

(declare-fun m!241863 () Bool)

(assert (=> b!213990 m!241863))

(declare-fun m!241865 () Bool)

(assert (=> b!213990 m!241865))

(declare-fun m!241867 () Bool)

(assert (=> b!213990 m!241867))

(declare-fun m!241869 () Bool)

(assert (=> b!213990 m!241869))

(declare-fun m!241871 () Bool)

(assert (=> b!213990 m!241871))

(declare-fun m!241873 () Bool)

(assert (=> b!213990 m!241873))

(assert (=> b!213990 m!241867))

(assert (=> b!213990 m!241873))

(declare-fun m!241875 () Bool)

(assert (=> b!213990 m!241875))

(declare-fun m!241877 () Bool)

(assert (=> b!213990 m!241877))

(assert (=> b!213990 m!241859))

(declare-fun m!241879 () Bool)

(assert (=> b!213990 m!241879))

(assert (=> b!213990 m!241729))

(declare-fun m!241881 () Bool)

(assert (=> b!213990 m!241881))

(declare-fun m!241883 () Bool)

(assert (=> b!213990 m!241883))

(assert (=> b!213990 m!241865))

(declare-fun m!241885 () Bool)

(assert (=> b!213990 m!241885))

(declare-fun m!241887 () Bool)

(assert (=> b!213990 m!241887))

(declare-fun m!241889 () Bool)

(assert (=> bm!20294 m!241889))

(declare-fun m!241891 () Bool)

(assert (=> bm!20295 m!241891))

(declare-fun m!241893 () Bool)

(assert (=> b!213999 m!241893))

(assert (=> b!213992 m!241729))

(assert (=> b!213992 m!241729))

(assert (=> b!213992 m!241739))

(assert (=> bm!20293 m!241681))

(assert (=> b!214000 m!241729))

(assert (=> b!214000 m!241729))

(assert (=> b!214000 m!241739))

(declare-fun m!241895 () Bool)

(assert (=> bm!20297 m!241895))

(assert (=> d!58245 m!241689))

(assert (=> b!213997 m!241729))

(assert (=> b!213997 m!241729))

(declare-fun m!241897 () Bool)

(assert (=> b!213997 m!241897))

(declare-fun m!241899 () Bool)

(assert (=> b!213989 m!241899))

(assert (=> b!213808 d!58245))

(declare-fun d!58247 () Bool)

(assert (=> d!58247 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21218 d!58247))

(declare-fun d!58249 () Bool)

(assert (=> d!58249 (= (array_inv!3209 _values!649) (bvsge (size!5178 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21218 d!58249))

(declare-fun d!58251 () Bool)

(assert (=> d!58251 (= (array_inv!3210 _keys!825) (bvsge (size!5177 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21218 d!58251))

(declare-fun d!58253 () Bool)

(assert (=> d!58253 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213802 d!58253))

(declare-fun d!58255 () Bool)

(declare-fun e!139139 () Bool)

(assert (=> d!58255 e!139139))

(declare-fun res!104779 () Bool)

(assert (=> d!58255 (=> (not res!104779) (not e!139139))))

(declare-fun lt!110765 () ListLongMap!3151)

(assert (=> d!58255 (= res!104779 (contains!1422 lt!110765 (_1!2130 lt!110589)))))

(declare-fun lt!110764 () List!3123)

(assert (=> d!58255 (= lt!110765 (ListLongMap!3152 lt!110764))))

(declare-fun lt!110763 () Unit!6482)

(declare-fun lt!110766 () Unit!6482)

(assert (=> d!58255 (= lt!110763 lt!110766)))

(assert (=> d!58255 (= (getValueByKey!258 lt!110764 (_1!2130 lt!110589)) (Some!263 (_2!2130 lt!110589)))))

(assert (=> d!58255 (= lt!110766 (lemmaContainsTupThenGetReturnValue!145 lt!110764 (_1!2130 lt!110589) (_2!2130 lt!110589)))))

(assert (=> d!58255 (= lt!110764 (insertStrictlySorted!148 (toList!1591 lt!110593) (_1!2130 lt!110589) (_2!2130 lt!110589)))))

(assert (=> d!58255 (= (+!594 lt!110593 lt!110589) lt!110765)))

(declare-fun b!214004 () Bool)

(declare-fun res!104778 () Bool)

(assert (=> b!214004 (=> (not res!104778) (not e!139139))))

(assert (=> b!214004 (= res!104778 (= (getValueByKey!258 (toList!1591 lt!110765) (_1!2130 lt!110589)) (Some!263 (_2!2130 lt!110589))))))

(declare-fun b!214005 () Bool)

(assert (=> b!214005 (= e!139139 (contains!1423 (toList!1591 lt!110765) lt!110589))))

(assert (= (and d!58255 res!104779) b!214004))

(assert (= (and b!214004 res!104778) b!214005))

(declare-fun m!241901 () Bool)

(assert (=> d!58255 m!241901))

(declare-fun m!241903 () Bool)

(assert (=> d!58255 m!241903))

(declare-fun m!241905 () Bool)

(assert (=> d!58255 m!241905))

(declare-fun m!241907 () Bool)

(assert (=> d!58255 m!241907))

(declare-fun m!241909 () Bool)

(assert (=> b!214004 m!241909))

(declare-fun m!241911 () Bool)

(assert (=> b!214005 m!241911))

(assert (=> b!213809 d!58255))

(declare-fun bm!20301 () Bool)

(declare-fun call!20304 () Bool)

(declare-fun c!36023 () Bool)

(assert (=> bm!20301 (= call!20304 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36023 (Cons!3118 (select (arr!4852 _keys!825) #b00000000000000000000000000000000) Nil!3119) Nil!3119)))))

(declare-fun b!214016 () Bool)

(declare-fun e!139149 () Bool)

(declare-fun contains!1424 (List!3122 (_ BitVec 64)) Bool)

(assert (=> b!214016 (= e!139149 (contains!1424 Nil!3119 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214017 () Bool)

(declare-fun e!139150 () Bool)

(assert (=> b!214017 (= e!139150 call!20304)))

(declare-fun d!58257 () Bool)

(declare-fun res!104786 () Bool)

(declare-fun e!139148 () Bool)

(assert (=> d!58257 (=> res!104786 e!139148)))

(assert (=> d!58257 (= res!104786 (bvsge #b00000000000000000000000000000000 (size!5177 _keys!825)))))

(assert (=> d!58257 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3119) e!139148)))

(declare-fun b!214018 () Bool)

(assert (=> b!214018 (= e!139150 call!20304)))

(declare-fun b!214019 () Bool)

(declare-fun e!139151 () Bool)

(assert (=> b!214019 (= e!139148 e!139151)))

(declare-fun res!104787 () Bool)

(assert (=> b!214019 (=> (not res!104787) (not e!139151))))

(assert (=> b!214019 (= res!104787 (not e!139149))))

(declare-fun res!104788 () Bool)

(assert (=> b!214019 (=> (not res!104788) (not e!139149))))

(assert (=> b!214019 (= res!104788 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214020 () Bool)

(assert (=> b!214020 (= e!139151 e!139150)))

(assert (=> b!214020 (= c!36023 (validKeyInArray!0 (select (arr!4852 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58257 (not res!104786)) b!214019))

(assert (= (and b!214019 res!104788) b!214016))

(assert (= (and b!214019 res!104787) b!214020))

(assert (= (and b!214020 c!36023) b!214018))

(assert (= (and b!214020 (not c!36023)) b!214017))

(assert (= (or b!214018 b!214017) bm!20301))

(assert (=> bm!20301 m!241729))

(declare-fun m!241913 () Bool)

(assert (=> bm!20301 m!241913))

(assert (=> b!214016 m!241729))

(assert (=> b!214016 m!241729))

(declare-fun m!241915 () Bool)

(assert (=> b!214016 m!241915))

(assert (=> b!214019 m!241729))

(assert (=> b!214019 m!241729))

(assert (=> b!214019 m!241739))

(assert (=> b!214020 m!241729))

(assert (=> b!214020 m!241729))

(assert (=> b!214020 m!241739))

(assert (=> b!213801 d!58257))

(declare-fun b!214028 () Bool)

(declare-fun e!139157 () Bool)

(assert (=> b!214028 (= e!139157 tp_is_empty!5511)))

(declare-fun mapIsEmpty!9374 () Bool)

(declare-fun mapRes!9374 () Bool)

(assert (=> mapIsEmpty!9374 mapRes!9374))

(declare-fun mapNonEmpty!9374 () Bool)

(declare-fun tp!20030 () Bool)

(declare-fun e!139156 () Bool)

(assert (=> mapNonEmpty!9374 (= mapRes!9374 (and tp!20030 e!139156))))

(declare-fun mapRest!9374 () (Array (_ BitVec 32) ValueCell!2412))

(declare-fun mapValue!9374 () ValueCell!2412)

(declare-fun mapKey!9374 () (_ BitVec 32))

(assert (=> mapNonEmpty!9374 (= mapRest!9368 (store mapRest!9374 mapKey!9374 mapValue!9374))))

(declare-fun condMapEmpty!9374 () Bool)

(declare-fun mapDefault!9374 () ValueCell!2412)

(assert (=> mapNonEmpty!9368 (= condMapEmpty!9374 (= mapRest!9368 ((as const (Array (_ BitVec 32) ValueCell!2412)) mapDefault!9374)))))

(assert (=> mapNonEmpty!9368 (= tp!20020 (and e!139157 mapRes!9374))))

(declare-fun b!214027 () Bool)

(assert (=> b!214027 (= e!139156 tp_is_empty!5511)))

(assert (= (and mapNonEmpty!9368 condMapEmpty!9374) mapIsEmpty!9374))

(assert (= (and mapNonEmpty!9368 (not condMapEmpty!9374)) mapNonEmpty!9374))

(assert (= (and mapNonEmpty!9374 ((_ is ValueCellFull!2412) mapValue!9374)) b!214027))

(assert (= (and mapNonEmpty!9368 ((_ is ValueCellFull!2412) mapDefault!9374)) b!214028))

(declare-fun m!241917 () Bool)

(assert (=> mapNonEmpty!9374 m!241917))

(declare-fun b_lambda!7815 () Bool)

(assert (= b_lambda!7811 (or (and start!21218 b_free!5649) b_lambda!7815)))

(declare-fun b_lambda!7817 () Bool)

(assert (= b_lambda!7813 (or (and start!21218 b_free!5649) b_lambda!7817)))

(declare-fun b_lambda!7819 () Bool)

(assert (= b_lambda!7803 (or (and start!21218 b_free!5649) b_lambda!7819)))

(declare-fun b_lambda!7821 () Bool)

(assert (= b_lambda!7809 (or (and start!21218 b_free!5649) b_lambda!7821)))

(declare-fun b_lambda!7823 () Bool)

(assert (= b_lambda!7805 (or (and start!21218 b_free!5649) b_lambda!7823)))

(declare-fun b_lambda!7825 () Bool)

(assert (= b_lambda!7807 (or (and start!21218 b_free!5649) b_lambda!7825)))

(check-sat (not bm!20293) (not b!213914) (not b!213997) (not b!213904) (not bm!20284) (not b!213986) (not bm!20291) (not b!214000) (not b!213992) (not bm!20294) (not b!213913) (not b!213968) (not b!213965) (not b!213961) (not d!58243) (not d!58239) (not b!213910) (not d!58241) (not b!213960) (not b!213969) (not b!213947) (not b!213990) (not b!213996) (not b!213854) (not b_lambda!7819) b_and!12541 (not b!213973) (not bm!20295) (not b!213900) (not b!213972) (not b_lambda!7821) tp_is_empty!5511 (not b!214005) (not b!213971) (not mapNonEmpty!9374) (not d!58245) (not b_lambda!7815) (not b!213851) (not d!58255) (not d!58237) (not b!214019) (not b!213980) (not bm!20290) (not b!213953) (not b!213989) (not b!213903) (not b!213999) (not bm!20278) (not b!213950) (not b!213954) (not b!213951) (not b!213906) (not b_lambda!7817) (not b!213963) (not b!214004) (not b!213945) (not bm!20276) (not bm!20280) (not b!214020) (not b!213949) (not b!213955) (not b_next!5649) (not b!213911) (not b!213967) (not bm!20297) (not bm!20301) (not bm!20277) (not bm!20285) (not bm!20260) (not d!58235) (not b!214016) (not b_lambda!7825) (not b_lambda!7823))
(check-sat b_and!12541 (not b_next!5649))
