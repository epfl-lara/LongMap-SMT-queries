; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37398 () Bool)

(assert start!37398)

(declare-fun b_free!8539 () Bool)

(declare-fun b_next!8539 () Bool)

(assert (=> start!37398 (= b_free!8539 (not b_next!8539))))

(declare-fun tp!30333 () Bool)

(declare-fun b_and!15755 () Bool)

(assert (=> start!37398 (= tp!30333 b_and!15755)))

(declare-fun b!380309 () Bool)

(declare-fun e!231296 () Bool)

(declare-fun e!231291 () Bool)

(assert (=> b!380309 (= e!231296 (not e!231291))))

(declare-fun res!215934 () Bool)

(assert (=> b!380309 (=> res!215934 e!231291)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380309 (= res!215934 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13355 0))(
  ( (V!13356 (val!4638 Int)) )
))
(declare-datatypes ((ValueCell!4250 0))(
  ( (ValueCellFull!4250 (v!6829 V!13355)) (EmptyCell!4250) )
))
(declare-datatypes ((array!22273 0))(
  ( (array!22274 (arr!10605 (Array (_ BitVec 32) ValueCell!4250)) (size!10958 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22273)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6192 0))(
  ( (tuple2!6193 (_1!3107 (_ BitVec 64)) (_2!3107 V!13355)) )
))
(declare-datatypes ((List!6020 0))(
  ( (Nil!6017) (Cons!6016 (h!6872 tuple2!6192) (t!11161 List!6020)) )
))
(declare-datatypes ((ListLongMap!5095 0))(
  ( (ListLongMap!5096 (toList!2563 List!6020)) )
))
(declare-fun lt!177940 () ListLongMap!5095)

(declare-fun zeroValue!472 () V!13355)

(declare-datatypes ((array!22275 0))(
  ( (array!22276 (arr!10606 (Array (_ BitVec 32) (_ BitVec 64))) (size!10959 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22275)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13355)

(declare-fun getCurrentListMap!1957 (array!22275 array!22273 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5095)

(assert (=> b!380309 (= lt!177940 (getCurrentListMap!1957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177943 () array!22275)

(declare-fun lt!177942 () ListLongMap!5095)

(declare-fun lt!177939 () array!22273)

(assert (=> b!380309 (= lt!177942 (getCurrentListMap!1957 lt!177943 lt!177939 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177944 () ListLongMap!5095)

(declare-fun lt!177951 () ListLongMap!5095)

(assert (=> b!380309 (and (= lt!177944 lt!177951) (= lt!177951 lt!177944))))

(declare-fun lt!177950 () ListLongMap!5095)

(declare-fun lt!177947 () tuple2!6192)

(declare-fun +!931 (ListLongMap!5095 tuple2!6192) ListLongMap!5095)

(assert (=> b!380309 (= lt!177951 (+!931 lt!177950 lt!177947))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13355)

(assert (=> b!380309 (= lt!177947 (tuple2!6193 k0!778 v!373))))

(declare-datatypes ((Unit!11720 0))(
  ( (Unit!11721) )
))
(declare-fun lt!177949 () Unit!11720)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 (array!22275 array!22273 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) (_ BitVec 64) V!13355 (_ BitVec 32) Int) Unit!11720)

(assert (=> b!380309 (= lt!177949 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!822 (array!22275 array!22273 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5095)

(assert (=> b!380309 (= lt!177944 (getCurrentListMapNoExtraKeys!822 lt!177943 lt!177939 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380309 (= lt!177939 (array!22274 (store (arr!10605 _values!506) i!548 (ValueCellFull!4250 v!373)) (size!10958 _values!506)))))

(assert (=> b!380309 (= lt!177950 (getCurrentListMapNoExtraKeys!822 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380310 () Bool)

(declare-fun res!215938 () Bool)

(declare-fun e!231293 () Bool)

(assert (=> b!380310 (=> (not res!215938) (not e!231293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22275 (_ BitVec 32)) Bool)

(assert (=> b!380310 (= res!215938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380311 () Bool)

(declare-fun res!215937 () Bool)

(assert (=> b!380311 (=> (not res!215937) (not e!231296))))

(declare-datatypes ((List!6021 0))(
  ( (Nil!6018) (Cons!6017 (h!6873 (_ BitVec 64)) (t!11162 List!6021)) )
))
(declare-fun arrayNoDuplicates!0 (array!22275 (_ BitVec 32) List!6021) Bool)

(assert (=> b!380311 (= res!215937 (arrayNoDuplicates!0 lt!177943 #b00000000000000000000000000000000 Nil!6018))))

(declare-fun b!380312 () Bool)

(declare-fun res!215936 () Bool)

(assert (=> b!380312 (=> (not res!215936) (not e!231293))))

(declare-fun arrayContainsKey!0 (array!22275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380312 (= res!215936 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380313 () Bool)

(declare-fun res!215940 () Bool)

(assert (=> b!380313 (=> (not res!215940) (not e!231293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380313 (= res!215940 (validKeyInArray!0 k0!778))))

(declare-fun b!380314 () Bool)

(declare-fun e!231295 () Bool)

(assert (=> b!380314 (= e!231295 true)))

(declare-fun lt!177945 () ListLongMap!5095)

(declare-fun lt!177948 () ListLongMap!5095)

(assert (=> b!380314 (= lt!177945 (+!931 lt!177948 lt!177947))))

(declare-fun lt!177941 () Unit!11720)

(declare-fun addCommutativeForDiffKeys!321 (ListLongMap!5095 (_ BitVec 64) V!13355 (_ BitVec 64) V!13355) Unit!11720)

(assert (=> b!380314 (= lt!177941 (addCommutativeForDiffKeys!321 lt!177950 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15345 () Bool)

(declare-fun mapRes!15345 () Bool)

(declare-fun tp!30332 () Bool)

(declare-fun e!231289 () Bool)

(assert (=> mapNonEmpty!15345 (= mapRes!15345 (and tp!30332 e!231289))))

(declare-fun mapValue!15345 () ValueCell!4250)

(declare-fun mapRest!15345 () (Array (_ BitVec 32) ValueCell!4250))

(declare-fun mapKey!15345 () (_ BitVec 32))

(assert (=> mapNonEmpty!15345 (= (arr!10605 _values!506) (store mapRest!15345 mapKey!15345 mapValue!15345))))

(declare-fun b!380315 () Bool)

(declare-fun tp_is_empty!9187 () Bool)

(assert (=> b!380315 (= e!231289 tp_is_empty!9187)))

(declare-fun b!380316 () Bool)

(declare-fun res!215935 () Bool)

(assert (=> b!380316 (=> (not res!215935) (not e!231293))))

(assert (=> b!380316 (= res!215935 (or (= (select (arr!10606 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10606 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380317 () Bool)

(declare-fun e!231294 () Bool)

(declare-fun e!231292 () Bool)

(assert (=> b!380317 (= e!231294 (and e!231292 mapRes!15345))))

(declare-fun condMapEmpty!15345 () Bool)

(declare-fun mapDefault!15345 () ValueCell!4250)

(assert (=> b!380317 (= condMapEmpty!15345 (= (arr!10605 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4250)) mapDefault!15345)))))

(declare-fun b!380318 () Bool)

(assert (=> b!380318 (= e!231292 tp_is_empty!9187)))

(declare-fun mapIsEmpty!15345 () Bool)

(assert (=> mapIsEmpty!15345 mapRes!15345))

(declare-fun b!380320 () Bool)

(declare-fun res!215939 () Bool)

(assert (=> b!380320 (=> (not res!215939) (not e!231293))))

(assert (=> b!380320 (= res!215939 (and (= (size!10958 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10959 _keys!658) (size!10958 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380321 () Bool)

(declare-fun res!215942 () Bool)

(assert (=> b!380321 (=> (not res!215942) (not e!231293))))

(assert (=> b!380321 (= res!215942 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10959 _keys!658))))))

(declare-fun b!380322 () Bool)

(assert (=> b!380322 (= e!231291 e!231295)))

(declare-fun res!215931 () Bool)

(assert (=> b!380322 (=> res!215931 e!231295)))

(assert (=> b!380322 (= res!215931 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380322 (= lt!177940 lt!177948)))

(declare-fun lt!177946 () tuple2!6192)

(assert (=> b!380322 (= lt!177948 (+!931 lt!177950 lt!177946))))

(assert (=> b!380322 (= lt!177942 lt!177945)))

(assert (=> b!380322 (= lt!177945 (+!931 lt!177951 lt!177946))))

(assert (=> b!380322 (= lt!177942 (+!931 lt!177944 lt!177946))))

(assert (=> b!380322 (= lt!177946 (tuple2!6193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380323 () Bool)

(assert (=> b!380323 (= e!231293 e!231296)))

(declare-fun res!215933 () Bool)

(assert (=> b!380323 (=> (not res!215933) (not e!231296))))

(assert (=> b!380323 (= res!215933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177943 mask!970))))

(assert (=> b!380323 (= lt!177943 (array!22276 (store (arr!10606 _keys!658) i!548 k0!778) (size!10959 _keys!658)))))

(declare-fun res!215932 () Bool)

(assert (=> start!37398 (=> (not res!215932) (not e!231293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37398 (= res!215932 (validMask!0 mask!970))))

(assert (=> start!37398 e!231293))

(declare-fun array_inv!7810 (array!22273) Bool)

(assert (=> start!37398 (and (array_inv!7810 _values!506) e!231294)))

(assert (=> start!37398 tp!30333))

(assert (=> start!37398 true))

(assert (=> start!37398 tp_is_empty!9187))

(declare-fun array_inv!7811 (array!22275) Bool)

(assert (=> start!37398 (array_inv!7811 _keys!658)))

(declare-fun b!380319 () Bool)

(declare-fun res!215941 () Bool)

(assert (=> b!380319 (=> (not res!215941) (not e!231293))))

(assert (=> b!380319 (= res!215941 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6018))))

(assert (= (and start!37398 res!215932) b!380320))

(assert (= (and b!380320 res!215939) b!380310))

(assert (= (and b!380310 res!215938) b!380319))

(assert (= (and b!380319 res!215941) b!380321))

(assert (= (and b!380321 res!215942) b!380313))

(assert (= (and b!380313 res!215940) b!380316))

(assert (= (and b!380316 res!215935) b!380312))

(assert (= (and b!380312 res!215936) b!380323))

(assert (= (and b!380323 res!215933) b!380311))

(assert (= (and b!380311 res!215937) b!380309))

(assert (= (and b!380309 (not res!215934)) b!380322))

(assert (= (and b!380322 (not res!215931)) b!380314))

(assert (= (and b!380317 condMapEmpty!15345) mapIsEmpty!15345))

(assert (= (and b!380317 (not condMapEmpty!15345)) mapNonEmpty!15345))

(get-info :version)

(assert (= (and mapNonEmpty!15345 ((_ is ValueCellFull!4250) mapValue!15345)) b!380315))

(assert (= (and b!380317 ((_ is ValueCellFull!4250) mapDefault!15345)) b!380318))

(assert (= start!37398 b!380317))

(declare-fun m!376811 () Bool)

(assert (=> b!380309 m!376811))

(declare-fun m!376813 () Bool)

(assert (=> b!380309 m!376813))

(declare-fun m!376815 () Bool)

(assert (=> b!380309 m!376815))

(declare-fun m!376817 () Bool)

(assert (=> b!380309 m!376817))

(declare-fun m!376819 () Bool)

(assert (=> b!380309 m!376819))

(declare-fun m!376821 () Bool)

(assert (=> b!380309 m!376821))

(declare-fun m!376823 () Bool)

(assert (=> b!380309 m!376823))

(declare-fun m!376825 () Bool)

(assert (=> b!380313 m!376825))

(declare-fun m!376827 () Bool)

(assert (=> b!380311 m!376827))

(declare-fun m!376829 () Bool)

(assert (=> b!380323 m!376829))

(declare-fun m!376831 () Bool)

(assert (=> b!380323 m!376831))

(declare-fun m!376833 () Bool)

(assert (=> mapNonEmpty!15345 m!376833))

(declare-fun m!376835 () Bool)

(assert (=> b!380319 m!376835))

(declare-fun m!376837 () Bool)

(assert (=> b!380312 m!376837))

(declare-fun m!376839 () Bool)

(assert (=> b!380310 m!376839))

(declare-fun m!376841 () Bool)

(assert (=> b!380322 m!376841))

(declare-fun m!376843 () Bool)

(assert (=> b!380322 m!376843))

(declare-fun m!376845 () Bool)

(assert (=> b!380322 m!376845))

(declare-fun m!376847 () Bool)

(assert (=> b!380316 m!376847))

(declare-fun m!376849 () Bool)

(assert (=> b!380314 m!376849))

(declare-fun m!376851 () Bool)

(assert (=> b!380314 m!376851))

(declare-fun m!376853 () Bool)

(assert (=> start!37398 m!376853))

(declare-fun m!376855 () Bool)

(assert (=> start!37398 m!376855))

(declare-fun m!376857 () Bool)

(assert (=> start!37398 m!376857))

(check-sat (not b!380309) (not b!380319) (not b!380314) (not b!380323) (not b!380313) b_and!15755 tp_is_empty!9187 (not b!380312) (not mapNonEmpty!15345) (not b_next!8539) (not start!37398) (not b!380310) (not b!380311) (not b!380322))
(check-sat b_and!15755 (not b_next!8539))
