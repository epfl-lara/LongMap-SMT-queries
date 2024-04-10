; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37402 () Bool)

(assert start!37402)

(declare-fun b_free!8529 () Bool)

(declare-fun b_next!8529 () Bool)

(assert (=> start!37402 (= b_free!8529 (not b_next!8529))))

(declare-fun tp!30303 () Bool)

(declare-fun b_and!15771 () Bool)

(assert (=> start!37402 (= tp!30303 b_and!15771)))

(declare-fun b!380355 () Bool)

(declare-fun res!215886 () Bool)

(declare-fun e!231348 () Bool)

(assert (=> b!380355 (=> (not res!215886) (not e!231348))))

(declare-datatypes ((array!22273 0))(
  ( (array!22274 (arr!10605 (Array (_ BitVec 32) (_ BitVec 64))) (size!10957 (_ BitVec 32))) )
))
(declare-fun lt!177983 () array!22273)

(declare-datatypes ((List!6045 0))(
  ( (Nil!6042) (Cons!6041 (h!6897 (_ BitVec 64)) (t!11195 List!6045)) )
))
(declare-fun arrayNoDuplicates!0 (array!22273 (_ BitVec 32) List!6045) Bool)

(assert (=> b!380355 (= res!215886 (arrayNoDuplicates!0 lt!177983 #b00000000000000000000000000000000 Nil!6042))))

(declare-fun b!380356 () Bool)

(declare-fun e!231347 () Bool)

(assert (=> b!380356 (= e!231347 true)))

(declare-datatypes ((V!13341 0))(
  ( (V!13342 (val!4633 Int)) )
))
(declare-datatypes ((tuple2!6210 0))(
  ( (tuple2!6211 (_1!3116 (_ BitVec 64)) (_2!3116 V!13341)) )
))
(declare-datatypes ((List!6046 0))(
  ( (Nil!6043) (Cons!6042 (h!6898 tuple2!6210) (t!11196 List!6046)) )
))
(declare-datatypes ((ListLongMap!5123 0))(
  ( (ListLongMap!5124 (toList!2577 List!6046)) )
))
(declare-fun lt!177981 () ListLongMap!5123)

(declare-fun lt!177987 () ListLongMap!5123)

(declare-fun lt!177978 () tuple2!6210)

(declare-fun +!923 (ListLongMap!5123 tuple2!6210) ListLongMap!5123)

(assert (=> b!380356 (= lt!177981 (+!923 lt!177987 lt!177978))))

(declare-fun v!373 () V!13341)

(declare-datatypes ((Unit!11740 0))(
  ( (Unit!11741) )
))
(declare-fun lt!177984 () Unit!11740)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!177982 () ListLongMap!5123)

(declare-fun minValue!472 () V!13341)

(declare-fun addCommutativeForDiffKeys!320 (ListLongMap!5123 (_ BitVec 64) V!13341 (_ BitVec 64) V!13341) Unit!11740)

(assert (=> b!380356 (= lt!177984 (addCommutativeForDiffKeys!320 lt!177982 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380357 () Bool)

(declare-fun e!231344 () Bool)

(assert (=> b!380357 (= e!231344 e!231347)))

(declare-fun res!215885 () Bool)

(assert (=> b!380357 (=> res!215885 e!231347)))

(assert (=> b!380357 (= res!215885 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177986 () ListLongMap!5123)

(assert (=> b!380357 (= lt!177986 lt!177987)))

(declare-fun lt!177979 () tuple2!6210)

(assert (=> b!380357 (= lt!177987 (+!923 lt!177982 lt!177979))))

(declare-fun lt!177989 () ListLongMap!5123)

(assert (=> b!380357 (= lt!177989 lt!177981)))

(declare-fun lt!177990 () ListLongMap!5123)

(assert (=> b!380357 (= lt!177981 (+!923 lt!177990 lt!177979))))

(declare-fun lt!177988 () ListLongMap!5123)

(assert (=> b!380357 (= lt!177989 (+!923 lt!177988 lt!177979))))

(assert (=> b!380357 (= lt!177979 (tuple2!6211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380358 () Bool)

(declare-fun res!215883 () Bool)

(declare-fun e!231345 () Bool)

(assert (=> b!380358 (=> (not res!215883) (not e!231345))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22273)

(assert (=> b!380358 (= res!215883 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10957 _keys!658))))))

(declare-fun res!215881 () Bool)

(assert (=> start!37402 (=> (not res!215881) (not e!231345))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37402 (= res!215881 (validMask!0 mask!970))))

(assert (=> start!37402 e!231345))

(declare-datatypes ((ValueCell!4245 0))(
  ( (ValueCellFull!4245 (v!6830 V!13341)) (EmptyCell!4245) )
))
(declare-datatypes ((array!22275 0))(
  ( (array!22276 (arr!10606 (Array (_ BitVec 32) ValueCell!4245)) (size!10958 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22275)

(declare-fun e!231349 () Bool)

(declare-fun array_inv!7808 (array!22275) Bool)

(assert (=> start!37402 (and (array_inv!7808 _values!506) e!231349)))

(assert (=> start!37402 tp!30303))

(assert (=> start!37402 true))

(declare-fun tp_is_empty!9177 () Bool)

(assert (=> start!37402 tp_is_empty!9177))

(declare-fun array_inv!7809 (array!22273) Bool)

(assert (=> start!37402 (array_inv!7809 _keys!658)))

(declare-fun mapIsEmpty!15330 () Bool)

(declare-fun mapRes!15330 () Bool)

(assert (=> mapIsEmpty!15330 mapRes!15330))

(declare-fun b!380359 () Bool)

(declare-fun res!215880 () Bool)

(assert (=> b!380359 (=> (not res!215880) (not e!231345))))

(assert (=> b!380359 (= res!215880 (or (= (select (arr!10605 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10605 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380360 () Bool)

(declare-fun res!215891 () Bool)

(assert (=> b!380360 (=> (not res!215891) (not e!231345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380360 (= res!215891 (validKeyInArray!0 k0!778))))

(declare-fun b!380361 () Bool)

(declare-fun e!231350 () Bool)

(assert (=> b!380361 (= e!231349 (and e!231350 mapRes!15330))))

(declare-fun condMapEmpty!15330 () Bool)

(declare-fun mapDefault!15330 () ValueCell!4245)

(assert (=> b!380361 (= condMapEmpty!15330 (= (arr!10606 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4245)) mapDefault!15330)))))

(declare-fun b!380362 () Bool)

(declare-fun res!215889 () Bool)

(assert (=> b!380362 (=> (not res!215889) (not e!231345))))

(assert (=> b!380362 (= res!215889 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6042))))

(declare-fun b!380363 () Bool)

(declare-fun res!215887 () Bool)

(assert (=> b!380363 (=> (not res!215887) (not e!231345))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380363 (= res!215887 (and (= (size!10958 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10957 _keys!658) (size!10958 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15330 () Bool)

(declare-fun tp!30302 () Bool)

(declare-fun e!231346 () Bool)

(assert (=> mapNonEmpty!15330 (= mapRes!15330 (and tp!30302 e!231346))))

(declare-fun mapValue!15330 () ValueCell!4245)

(declare-fun mapKey!15330 () (_ BitVec 32))

(declare-fun mapRest!15330 () (Array (_ BitVec 32) ValueCell!4245))

(assert (=> mapNonEmpty!15330 (= (arr!10606 _values!506) (store mapRest!15330 mapKey!15330 mapValue!15330))))

(declare-fun b!380364 () Bool)

(assert (=> b!380364 (= e!231346 tp_is_empty!9177)))

(declare-fun b!380365 () Bool)

(assert (=> b!380365 (= e!231345 e!231348)))

(declare-fun res!215890 () Bool)

(assert (=> b!380365 (=> (not res!215890) (not e!231348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22273 (_ BitVec 32)) Bool)

(assert (=> b!380365 (= res!215890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177983 mask!970))))

(assert (=> b!380365 (= lt!177983 (array!22274 (store (arr!10605 _keys!658) i!548 k0!778) (size!10957 _keys!658)))))

(declare-fun b!380366 () Bool)

(assert (=> b!380366 (= e!231350 tp_is_empty!9177)))

(declare-fun b!380367 () Bool)

(assert (=> b!380367 (= e!231348 (not e!231344))))

(declare-fun res!215882 () Bool)

(assert (=> b!380367 (=> res!215882 e!231344)))

(assert (=> b!380367 (= res!215882 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13341)

(declare-fun getCurrentListMap!1993 (array!22273 array!22275 (_ BitVec 32) (_ BitVec 32) V!13341 V!13341 (_ BitVec 32) Int) ListLongMap!5123)

(assert (=> b!380367 (= lt!177986 (getCurrentListMap!1993 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177985 () array!22275)

(assert (=> b!380367 (= lt!177989 (getCurrentListMap!1993 lt!177983 lt!177985 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380367 (and (= lt!177988 lt!177990) (= lt!177990 lt!177988))))

(assert (=> b!380367 (= lt!177990 (+!923 lt!177982 lt!177978))))

(assert (=> b!380367 (= lt!177978 (tuple2!6211 k0!778 v!373))))

(declare-fun lt!177980 () Unit!11740)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!151 (array!22273 array!22275 (_ BitVec 32) (_ BitVec 32) V!13341 V!13341 (_ BitVec 32) (_ BitVec 64) V!13341 (_ BitVec 32) Int) Unit!11740)

(assert (=> b!380367 (= lt!177980 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!151 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!827 (array!22273 array!22275 (_ BitVec 32) (_ BitVec 32) V!13341 V!13341 (_ BitVec 32) Int) ListLongMap!5123)

(assert (=> b!380367 (= lt!177988 (getCurrentListMapNoExtraKeys!827 lt!177983 lt!177985 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380367 (= lt!177985 (array!22276 (store (arr!10606 _values!506) i!548 (ValueCellFull!4245 v!373)) (size!10958 _values!506)))))

(assert (=> b!380367 (= lt!177982 (getCurrentListMapNoExtraKeys!827 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380368 () Bool)

(declare-fun res!215888 () Bool)

(assert (=> b!380368 (=> (not res!215888) (not e!231345))))

(declare-fun arrayContainsKey!0 (array!22273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380368 (= res!215888 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380369 () Bool)

(declare-fun res!215884 () Bool)

(assert (=> b!380369 (=> (not res!215884) (not e!231345))))

(assert (=> b!380369 (= res!215884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37402 res!215881) b!380363))

(assert (= (and b!380363 res!215887) b!380369))

(assert (= (and b!380369 res!215884) b!380362))

(assert (= (and b!380362 res!215889) b!380358))

(assert (= (and b!380358 res!215883) b!380360))

(assert (= (and b!380360 res!215891) b!380359))

(assert (= (and b!380359 res!215880) b!380368))

(assert (= (and b!380368 res!215888) b!380365))

(assert (= (and b!380365 res!215890) b!380355))

(assert (= (and b!380355 res!215886) b!380367))

(assert (= (and b!380367 (not res!215882)) b!380357))

(assert (= (and b!380357 (not res!215885)) b!380356))

(assert (= (and b!380361 condMapEmpty!15330) mapIsEmpty!15330))

(assert (= (and b!380361 (not condMapEmpty!15330)) mapNonEmpty!15330))

(get-info :version)

(assert (= (and mapNonEmpty!15330 ((_ is ValueCellFull!4245) mapValue!15330)) b!380364))

(assert (= (and b!380361 ((_ is ValueCellFull!4245) mapDefault!15330)) b!380366))

(assert (= start!37402 b!380361))

(declare-fun m!377295 () Bool)

(assert (=> b!380369 m!377295))

(declare-fun m!377297 () Bool)

(assert (=> b!380360 m!377297))

(declare-fun m!377299 () Bool)

(assert (=> b!380362 m!377299))

(declare-fun m!377301 () Bool)

(assert (=> b!380356 m!377301))

(declare-fun m!377303 () Bool)

(assert (=> b!380356 m!377303))

(declare-fun m!377305 () Bool)

(assert (=> b!380365 m!377305))

(declare-fun m!377307 () Bool)

(assert (=> b!380365 m!377307))

(declare-fun m!377309 () Bool)

(assert (=> b!380355 m!377309))

(declare-fun m!377311 () Bool)

(assert (=> b!380359 m!377311))

(declare-fun m!377313 () Bool)

(assert (=> mapNonEmpty!15330 m!377313))

(declare-fun m!377315 () Bool)

(assert (=> start!37402 m!377315))

(declare-fun m!377317 () Bool)

(assert (=> start!37402 m!377317))

(declare-fun m!377319 () Bool)

(assert (=> start!37402 m!377319))

(declare-fun m!377321 () Bool)

(assert (=> b!380367 m!377321))

(declare-fun m!377323 () Bool)

(assert (=> b!380367 m!377323))

(declare-fun m!377325 () Bool)

(assert (=> b!380367 m!377325))

(declare-fun m!377327 () Bool)

(assert (=> b!380367 m!377327))

(declare-fun m!377329 () Bool)

(assert (=> b!380367 m!377329))

(declare-fun m!377331 () Bool)

(assert (=> b!380367 m!377331))

(declare-fun m!377333 () Bool)

(assert (=> b!380367 m!377333))

(declare-fun m!377335 () Bool)

(assert (=> b!380357 m!377335))

(declare-fun m!377337 () Bool)

(assert (=> b!380357 m!377337))

(declare-fun m!377339 () Bool)

(assert (=> b!380357 m!377339))

(declare-fun m!377341 () Bool)

(assert (=> b!380368 m!377341))

(check-sat (not b!380367) b_and!15771 (not b!380362) (not b!380357) (not b!380360) (not b!380365) (not b!380356) tp_is_empty!9177 (not b!380368) (not b!380369) (not b!380355) (not start!37402) (not mapNonEmpty!15330) (not b_next!8529))
(check-sat b_and!15771 (not b_next!8529))
