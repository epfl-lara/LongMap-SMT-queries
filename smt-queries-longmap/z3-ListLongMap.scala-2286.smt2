; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37180 () Bool)

(assert start!37180)

(declare-fun b_free!8307 () Bool)

(declare-fun b_next!8307 () Bool)

(assert (=> start!37180 (= b_free!8307 (not b_next!8307))))

(declare-fun tp!29636 () Bool)

(declare-fun b_and!15549 () Bool)

(assert (=> start!37180 (= tp!29636 b_and!15549)))

(declare-fun mapIsEmpty!14997 () Bool)

(declare-fun mapRes!14997 () Bool)

(assert (=> mapIsEmpty!14997 mapRes!14997))

(declare-fun b!375342 () Bool)

(declare-fun e!228683 () Bool)

(declare-fun tp_is_empty!8955 () Bool)

(assert (=> b!375342 (= e!228683 tp_is_empty!8955)))

(declare-fun b!375344 () Bool)

(declare-fun e!228680 () Bool)

(declare-fun e!228684 () Bool)

(assert (=> b!375344 (= e!228680 e!228684)))

(declare-fun res!211869 () Bool)

(assert (=> b!375344 (=> res!211869 e!228684)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!375344 (= res!211869 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13045 0))(
  ( (V!13046 (val!4522 Int)) )
))
(declare-datatypes ((tuple2!6018 0))(
  ( (tuple2!6019 (_1!3020 (_ BitVec 64)) (_2!3020 V!13045)) )
))
(declare-datatypes ((List!5860 0))(
  ( (Nil!5857) (Cons!5856 (h!6712 tuple2!6018) (t!11010 List!5860)) )
))
(declare-datatypes ((ListLongMap!4931 0))(
  ( (ListLongMap!4932 (toList!2481 List!5860)) )
))
(declare-fun lt!173641 () ListLongMap!4931)

(declare-fun lt!173644 () ListLongMap!4931)

(assert (=> b!375344 (= lt!173641 lt!173644)))

(declare-fun lt!173642 () ListLongMap!4931)

(declare-fun lt!173643 () tuple2!6018)

(declare-fun +!827 (ListLongMap!4931 tuple2!6018) ListLongMap!4931)

(assert (=> b!375344 (= lt!173644 (+!827 lt!173642 lt!173643))))

(declare-fun v!373 () V!13045)

(declare-datatypes ((Unit!11560 0))(
  ( (Unit!11561) )
))
(declare-fun lt!173649 () Unit!11560)

(declare-fun lt!173637 () ListLongMap!4931)

(declare-fun zeroValue!472 () V!13045)

(declare-fun addCommutativeForDiffKeys!247 (ListLongMap!4931 (_ BitVec 64) V!13045 (_ BitVec 64) V!13045) Unit!11560)

(assert (=> b!375344 (= lt!173649 (addCommutativeForDiffKeys!247 lt!173637 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173646 () ListLongMap!4931)

(declare-fun lt!173640 () tuple2!6018)

(assert (=> b!375344 (= lt!173646 (+!827 lt!173641 lt!173640))))

(declare-fun lt!173636 () ListLongMap!4931)

(declare-fun lt!173638 () tuple2!6018)

(assert (=> b!375344 (= lt!173641 (+!827 lt!173636 lt!173638))))

(declare-fun lt!173647 () ListLongMap!4931)

(declare-fun lt!173648 () ListLongMap!4931)

(assert (=> b!375344 (= lt!173647 lt!173648)))

(assert (=> b!375344 (= lt!173648 (+!827 lt!173642 lt!173640))))

(assert (=> b!375344 (= lt!173642 (+!827 lt!173637 lt!173638))))

(declare-fun lt!173633 () ListLongMap!4931)

(assert (=> b!375344 (= lt!173646 (+!827 (+!827 lt!173633 lt!173638) lt!173640))))

(declare-fun minValue!472 () V!13045)

(assert (=> b!375344 (= lt!173640 (tuple2!6019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375344 (= lt!173638 (tuple2!6019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375345 () Bool)

(declare-fun e!228679 () Bool)

(declare-fun e!228686 () Bool)

(assert (=> b!375345 (= e!228679 (and e!228686 mapRes!14997))))

(declare-fun condMapEmpty!14997 () Bool)

(declare-datatypes ((ValueCell!4134 0))(
  ( (ValueCellFull!4134 (v!6719 V!13045)) (EmptyCell!4134) )
))
(declare-datatypes ((array!21845 0))(
  ( (array!21846 (arr!10391 (Array (_ BitVec 32) ValueCell!4134)) (size!10743 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21845)

(declare-fun mapDefault!14997 () ValueCell!4134)

(assert (=> b!375345 (= condMapEmpty!14997 (= (arr!10391 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4134)) mapDefault!14997)))))

(declare-fun b!375346 () Bool)

(assert (=> b!375346 (= e!228686 tp_is_empty!8955)))

(declare-fun b!375347 () Bool)

(declare-fun res!211870 () Bool)

(declare-fun e!228681 () Bool)

(assert (=> b!375347 (=> (not res!211870) (not e!228681))))

(declare-datatypes ((array!21847 0))(
  ( (array!21848 (arr!10392 (Array (_ BitVec 32) (_ BitVec 64))) (size!10744 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21847)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375347 (= res!211870 (or (= (select (arr!10392 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10392 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14997 () Bool)

(declare-fun tp!29637 () Bool)

(assert (=> mapNonEmpty!14997 (= mapRes!14997 (and tp!29637 e!228683))))

(declare-fun mapRest!14997 () (Array (_ BitVec 32) ValueCell!4134))

(declare-fun mapKey!14997 () (_ BitVec 32))

(declare-fun mapValue!14997 () ValueCell!4134)

(assert (=> mapNonEmpty!14997 (= (arr!10391 _values!506) (store mapRest!14997 mapKey!14997 mapValue!14997))))

(declare-fun b!375348 () Bool)

(declare-fun res!211868 () Bool)

(assert (=> b!375348 (=> (not res!211868) (not e!228681))))

(assert (=> b!375348 (= res!211868 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10744 _keys!658))))))

(declare-fun b!375349 () Bool)

(assert (=> b!375349 (= e!228684 true)))

(assert (=> b!375349 (= (+!827 lt!173644 lt!173640) (+!827 lt!173648 lt!173643))))

(declare-fun lt!173639 () Unit!11560)

(assert (=> b!375349 (= lt!173639 (addCommutativeForDiffKeys!247 lt!173642 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375350 () Bool)

(declare-fun res!211872 () Bool)

(assert (=> b!375350 (=> (not res!211872) (not e!228681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375350 (= res!211872 (validKeyInArray!0 k0!778))))

(declare-fun b!375351 () Bool)

(declare-fun res!211873 () Bool)

(assert (=> b!375351 (=> (not res!211873) (not e!228681))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21847 (_ BitVec 32)) Bool)

(assert (=> b!375351 (= res!211873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375352 () Bool)

(declare-fun e!228685 () Bool)

(assert (=> b!375352 (= e!228685 (not e!228680))))

(declare-fun res!211875 () Bool)

(assert (=> b!375352 (=> res!211875 e!228680)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375352 (= res!211875 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1916 (array!21847 array!21845 (_ BitVec 32) (_ BitVec 32) V!13045 V!13045 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!375352 (= lt!173647 (getCurrentListMap!1916 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173635 () array!21845)

(declare-fun lt!173634 () array!21847)

(assert (=> b!375352 (= lt!173646 (getCurrentListMap!1916 lt!173634 lt!173635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375352 (and (= lt!173633 lt!173636) (= lt!173636 lt!173633))))

(assert (=> b!375352 (= lt!173636 (+!827 lt!173637 lt!173643))))

(assert (=> b!375352 (= lt!173643 (tuple2!6019 k0!778 v!373))))

(declare-fun lt!173645 () Unit!11560)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 (array!21847 array!21845 (_ BitVec 32) (_ BitVec 32) V!13045 V!13045 (_ BitVec 32) (_ BitVec 64) V!13045 (_ BitVec 32) Int) Unit!11560)

(assert (=> b!375352 (= lt!173645 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!750 (array!21847 array!21845 (_ BitVec 32) (_ BitVec 32) V!13045 V!13045 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!375352 (= lt!173633 (getCurrentListMapNoExtraKeys!750 lt!173634 lt!173635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375352 (= lt!173635 (array!21846 (store (arr!10391 _values!506) i!548 (ValueCellFull!4134 v!373)) (size!10743 _values!506)))))

(assert (=> b!375352 (= lt!173637 (getCurrentListMapNoExtraKeys!750 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375343 () Bool)

(declare-fun res!211877 () Bool)

(assert (=> b!375343 (=> (not res!211877) (not e!228681))))

(declare-fun arrayContainsKey!0 (array!21847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375343 (= res!211877 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!211874 () Bool)

(assert (=> start!37180 (=> (not res!211874) (not e!228681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37180 (= res!211874 (validMask!0 mask!970))))

(assert (=> start!37180 e!228681))

(declare-fun array_inv!7662 (array!21845) Bool)

(assert (=> start!37180 (and (array_inv!7662 _values!506) e!228679)))

(assert (=> start!37180 tp!29636))

(assert (=> start!37180 true))

(assert (=> start!37180 tp_is_empty!8955))

(declare-fun array_inv!7663 (array!21847) Bool)

(assert (=> start!37180 (array_inv!7663 _keys!658)))

(declare-fun b!375353 () Bool)

(declare-fun res!211876 () Bool)

(assert (=> b!375353 (=> (not res!211876) (not e!228681))))

(declare-datatypes ((List!5861 0))(
  ( (Nil!5858) (Cons!5857 (h!6713 (_ BitVec 64)) (t!11011 List!5861)) )
))
(declare-fun arrayNoDuplicates!0 (array!21847 (_ BitVec 32) List!5861) Bool)

(assert (=> b!375353 (= res!211876 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5858))))

(declare-fun b!375354 () Bool)

(declare-fun res!211871 () Bool)

(assert (=> b!375354 (=> (not res!211871) (not e!228685))))

(assert (=> b!375354 (= res!211871 (arrayNoDuplicates!0 lt!173634 #b00000000000000000000000000000000 Nil!5858))))

(declare-fun b!375355 () Bool)

(declare-fun res!211867 () Bool)

(assert (=> b!375355 (=> (not res!211867) (not e!228681))))

(assert (=> b!375355 (= res!211867 (and (= (size!10743 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10744 _keys!658) (size!10743 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375356 () Bool)

(assert (=> b!375356 (= e!228681 e!228685)))

(declare-fun res!211866 () Bool)

(assert (=> b!375356 (=> (not res!211866) (not e!228685))))

(assert (=> b!375356 (= res!211866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173634 mask!970))))

(assert (=> b!375356 (= lt!173634 (array!21848 (store (arr!10392 _keys!658) i!548 k0!778) (size!10744 _keys!658)))))

(assert (= (and start!37180 res!211874) b!375355))

(assert (= (and b!375355 res!211867) b!375351))

(assert (= (and b!375351 res!211873) b!375353))

(assert (= (and b!375353 res!211876) b!375348))

(assert (= (and b!375348 res!211868) b!375350))

(assert (= (and b!375350 res!211872) b!375347))

(assert (= (and b!375347 res!211870) b!375343))

(assert (= (and b!375343 res!211877) b!375356))

(assert (= (and b!375356 res!211866) b!375354))

(assert (= (and b!375354 res!211871) b!375352))

(assert (= (and b!375352 (not res!211875)) b!375344))

(assert (= (and b!375344 (not res!211869)) b!375349))

(assert (= (and b!375345 condMapEmpty!14997) mapIsEmpty!14997))

(assert (= (and b!375345 (not condMapEmpty!14997)) mapNonEmpty!14997))

(get-info :version)

(assert (= (and mapNonEmpty!14997 ((_ is ValueCellFull!4134) mapValue!14997)) b!375342))

(assert (= (and b!375345 ((_ is ValueCellFull!4134) mapDefault!14997)) b!375346))

(assert (= start!37180 b!375345))

(declare-fun m!371895 () Bool)

(assert (=> b!375353 m!371895))

(declare-fun m!371897 () Bool)

(assert (=> b!375349 m!371897))

(declare-fun m!371899 () Bool)

(assert (=> b!375349 m!371899))

(declare-fun m!371901 () Bool)

(assert (=> b!375349 m!371901))

(declare-fun m!371903 () Bool)

(assert (=> start!37180 m!371903))

(declare-fun m!371905 () Bool)

(assert (=> start!37180 m!371905))

(declare-fun m!371907 () Bool)

(assert (=> start!37180 m!371907))

(declare-fun m!371909 () Bool)

(assert (=> b!375356 m!371909))

(declare-fun m!371911 () Bool)

(assert (=> b!375356 m!371911))

(declare-fun m!371913 () Bool)

(assert (=> b!375347 m!371913))

(declare-fun m!371915 () Bool)

(assert (=> b!375351 m!371915))

(declare-fun m!371917 () Bool)

(assert (=> b!375352 m!371917))

(declare-fun m!371919 () Bool)

(assert (=> b!375352 m!371919))

(declare-fun m!371921 () Bool)

(assert (=> b!375352 m!371921))

(declare-fun m!371923 () Bool)

(assert (=> b!375352 m!371923))

(declare-fun m!371925 () Bool)

(assert (=> b!375352 m!371925))

(declare-fun m!371927 () Bool)

(assert (=> b!375352 m!371927))

(declare-fun m!371929 () Bool)

(assert (=> b!375352 m!371929))

(declare-fun m!371931 () Bool)

(assert (=> b!375344 m!371931))

(declare-fun m!371933 () Bool)

(assert (=> b!375344 m!371933))

(declare-fun m!371935 () Bool)

(assert (=> b!375344 m!371935))

(declare-fun m!371937 () Bool)

(assert (=> b!375344 m!371937))

(declare-fun m!371939 () Bool)

(assert (=> b!375344 m!371939))

(declare-fun m!371941 () Bool)

(assert (=> b!375344 m!371941))

(declare-fun m!371943 () Bool)

(assert (=> b!375344 m!371943))

(declare-fun m!371945 () Bool)

(assert (=> b!375344 m!371945))

(assert (=> b!375344 m!371943))

(declare-fun m!371947 () Bool)

(assert (=> b!375354 m!371947))

(declare-fun m!371949 () Bool)

(assert (=> b!375343 m!371949))

(declare-fun m!371951 () Bool)

(assert (=> b!375350 m!371951))

(declare-fun m!371953 () Bool)

(assert (=> mapNonEmpty!14997 m!371953))

(check-sat (not mapNonEmpty!14997) (not b!375343) (not b!375356) (not b_next!8307) (not b!375349) (not b!375353) (not b!375354) (not b!375351) b_and!15549 (not b!375350) (not b!375344) tp_is_empty!8955 (not b!375352) (not start!37180))
(check-sat b_and!15549 (not b_next!8307))
