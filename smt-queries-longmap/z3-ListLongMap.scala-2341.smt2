; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37494 () Bool)

(assert start!37494)

(declare-fun b_free!8635 () Bool)

(declare-fun b_next!8635 () Bool)

(assert (=> start!37494 (= b_free!8635 (not b_next!8635))))

(declare-fun tp!30621 () Bool)

(declare-fun b_and!15851 () Bool)

(assert (=> start!37494 (= tp!30621 b_and!15851)))

(declare-fun b!382341 () Bool)

(declare-fun res!217539 () Bool)

(declare-fun e!232317 () Bool)

(assert (=> b!382341 (=> (not res!217539) (not e!232317))))

(declare-datatypes ((array!22461 0))(
  ( (array!22462 (arr!10699 (Array (_ BitVec 32) (_ BitVec 64))) (size!11052 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22461)

(declare-datatypes ((List!6102 0))(
  ( (Nil!6099) (Cons!6098 (h!6954 (_ BitVec 64)) (t!11243 List!6102)) )
))
(declare-fun arrayNoDuplicates!0 (array!22461 (_ BitVec 32) List!6102) Bool)

(assert (=> b!382341 (= res!217539 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun res!217540 () Bool)

(assert (=> start!37494 (=> (not res!217540) (not e!232317))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37494 (= res!217540 (validMask!0 mask!970))))

(assert (=> start!37494 e!232317))

(declare-datatypes ((V!13483 0))(
  ( (V!13484 (val!4686 Int)) )
))
(declare-datatypes ((ValueCell!4298 0))(
  ( (ValueCellFull!4298 (v!6877 V!13483)) (EmptyCell!4298) )
))
(declare-datatypes ((array!22463 0))(
  ( (array!22464 (arr!10700 (Array (_ BitVec 32) ValueCell!4298)) (size!11053 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22463)

(declare-fun e!232318 () Bool)

(declare-fun array_inv!7878 (array!22463) Bool)

(assert (=> start!37494 (and (array_inv!7878 _values!506) e!232318)))

(assert (=> start!37494 tp!30621))

(assert (=> start!37494 true))

(declare-fun tp_is_empty!9283 () Bool)

(assert (=> start!37494 tp_is_empty!9283))

(declare-fun array_inv!7879 (array!22461) Bool)

(assert (=> start!37494 (array_inv!7879 _keys!658)))

(declare-fun b!382342 () Bool)

(declare-fun e!232316 () Bool)

(assert (=> b!382342 (= e!232316 tp_is_empty!9283)))

(declare-fun b!382343 () Bool)

(declare-fun res!217541 () Bool)

(assert (=> b!382343 (=> (not res!217541) (not e!232317))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382343 (= res!217541 (or (= (select (arr!10699 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10699 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382344 () Bool)

(declare-fun res!217531 () Bool)

(assert (=> b!382344 (=> (not res!217531) (not e!232317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22461 (_ BitVec 32)) Bool)

(assert (=> b!382344 (= res!217531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382345 () Bool)

(declare-fun res!217538 () Bool)

(assert (=> b!382345 (=> (not res!217538) (not e!232317))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382345 (= res!217538 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382346 () Bool)

(declare-fun res!217532 () Bool)

(assert (=> b!382346 (=> (not res!217532) (not e!232317))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382346 (= res!217532 (and (= (size!11053 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11052 _keys!658) (size!11053 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382347 () Bool)

(declare-fun mapRes!15489 () Bool)

(assert (=> b!382347 (= e!232318 (and e!232316 mapRes!15489))))

(declare-fun condMapEmpty!15489 () Bool)

(declare-fun mapDefault!15489 () ValueCell!4298)

(assert (=> b!382347 (= condMapEmpty!15489 (= (arr!10700 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4298)) mapDefault!15489)))))

(declare-fun b!382348 () Bool)

(declare-fun res!217536 () Bool)

(declare-fun e!232319 () Bool)

(assert (=> b!382348 (=> (not res!217536) (not e!232319))))

(declare-fun lt!179302 () array!22461)

(assert (=> b!382348 (= res!217536 (arrayNoDuplicates!0 lt!179302 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun b!382349 () Bool)

(declare-fun e!232313 () Bool)

(assert (=> b!382349 (= e!232313 true)))

(declare-datatypes ((tuple2!6276 0))(
  ( (tuple2!6277 (_1!3149 (_ BitVec 64)) (_2!3149 V!13483)) )
))
(declare-datatypes ((List!6103 0))(
  ( (Nil!6100) (Cons!6099 (h!6955 tuple2!6276) (t!11244 List!6103)) )
))
(declare-datatypes ((ListLongMap!5179 0))(
  ( (ListLongMap!5180 (toList!2605 List!6103)) )
))
(declare-fun lt!179305 () ListLongMap!5179)

(declare-fun lt!179304 () ListLongMap!5179)

(assert (=> b!382349 (= lt!179305 lt!179304)))

(declare-fun b!382350 () Bool)

(declare-fun res!217535 () Bool)

(assert (=> b!382350 (=> (not res!217535) (not e!232317))))

(assert (=> b!382350 (= res!217535 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11052 _keys!658))))))

(declare-fun b!382351 () Bool)

(assert (=> b!382351 (= e!232317 e!232319)))

(declare-fun res!217533 () Bool)

(assert (=> b!382351 (=> (not res!217533) (not e!232319))))

(assert (=> b!382351 (= res!217533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179302 mask!970))))

(assert (=> b!382351 (= lt!179302 (array!22462 (store (arr!10699 _keys!658) i!548 k0!778) (size!11052 _keys!658)))))

(declare-fun mapNonEmpty!15489 () Bool)

(declare-fun tp!30620 () Bool)

(declare-fun e!232314 () Bool)

(assert (=> mapNonEmpty!15489 (= mapRes!15489 (and tp!30620 e!232314))))

(declare-fun mapValue!15489 () ValueCell!4298)

(declare-fun mapKey!15489 () (_ BitVec 32))

(declare-fun mapRest!15489 () (Array (_ BitVec 32) ValueCell!4298))

(assert (=> mapNonEmpty!15489 (= (arr!10700 _values!506) (store mapRest!15489 mapKey!15489 mapValue!15489))))

(declare-fun b!382352 () Bool)

(declare-fun res!217537 () Bool)

(assert (=> b!382352 (=> (not res!217537) (not e!232317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382352 (= res!217537 (validKeyInArray!0 k0!778))))

(declare-fun b!382353 () Bool)

(assert (=> b!382353 (= e!232314 tp_is_empty!9283)))

(declare-fun mapIsEmpty!15489 () Bool)

(assert (=> mapIsEmpty!15489 mapRes!15489))

(declare-fun b!382354 () Bool)

(assert (=> b!382354 (= e!232319 (not e!232313))))

(declare-fun res!217534 () Bool)

(assert (=> b!382354 (=> res!217534 e!232313)))

(declare-fun lt!179307 () Bool)

(assert (=> b!382354 (= res!217534 (or (and (not lt!179307) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179307) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179307)))))

(assert (=> b!382354 (= lt!179307 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13483)

(declare-fun lt!179299 () ListLongMap!5179)

(declare-fun minValue!472 () V!13483)

(declare-fun getCurrentListMap!1991 (array!22461 array!22463 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) Int) ListLongMap!5179)

(assert (=> b!382354 (= lt!179299 (getCurrentListMap!1991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179306 () array!22463)

(assert (=> b!382354 (= lt!179305 (getCurrentListMap!1991 lt!179302 lt!179306 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179300 () ListLongMap!5179)

(assert (=> b!382354 (and (= lt!179304 lt!179300) (= lt!179300 lt!179304))))

(declare-fun v!373 () V!13483)

(declare-fun lt!179303 () ListLongMap!5179)

(declare-fun +!965 (ListLongMap!5179 tuple2!6276) ListLongMap!5179)

(assert (=> b!382354 (= lt!179300 (+!965 lt!179303 (tuple2!6277 k0!778 v!373)))))

(declare-datatypes ((Unit!11788 0))(
  ( (Unit!11789) )
))
(declare-fun lt!179301 () Unit!11788)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 (array!22461 array!22463 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) (_ BitVec 64) V!13483 (_ BitVec 32) Int) Unit!11788)

(assert (=> b!382354 (= lt!179301 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!184 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!856 (array!22461 array!22463 (_ BitVec 32) (_ BitVec 32) V!13483 V!13483 (_ BitVec 32) Int) ListLongMap!5179)

(assert (=> b!382354 (= lt!179304 (getCurrentListMapNoExtraKeys!856 lt!179302 lt!179306 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382354 (= lt!179306 (array!22464 (store (arr!10700 _values!506) i!548 (ValueCellFull!4298 v!373)) (size!11053 _values!506)))))

(assert (=> b!382354 (= lt!179303 (getCurrentListMapNoExtraKeys!856 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37494 res!217540) b!382346))

(assert (= (and b!382346 res!217532) b!382344))

(assert (= (and b!382344 res!217531) b!382341))

(assert (= (and b!382341 res!217539) b!382350))

(assert (= (and b!382350 res!217535) b!382352))

(assert (= (and b!382352 res!217537) b!382343))

(assert (= (and b!382343 res!217541) b!382345))

(assert (= (and b!382345 res!217538) b!382351))

(assert (= (and b!382351 res!217533) b!382348))

(assert (= (and b!382348 res!217536) b!382354))

(assert (= (and b!382354 (not res!217534)) b!382349))

(assert (= (and b!382347 condMapEmpty!15489) mapIsEmpty!15489))

(assert (= (and b!382347 (not condMapEmpty!15489)) mapNonEmpty!15489))

(get-info :version)

(assert (= (and mapNonEmpty!15489 ((_ is ValueCellFull!4298) mapValue!15489)) b!382353))

(assert (= (and b!382347 ((_ is ValueCellFull!4298) mapDefault!15489)) b!382342))

(assert (= start!37494 b!382347))

(declare-fun m!378695 () Bool)

(assert (=> mapNonEmpty!15489 m!378695))

(declare-fun m!378697 () Bool)

(assert (=> b!382352 m!378697))

(declare-fun m!378699 () Bool)

(assert (=> b!382351 m!378699))

(declare-fun m!378701 () Bool)

(assert (=> b!382351 m!378701))

(declare-fun m!378703 () Bool)

(assert (=> b!382348 m!378703))

(declare-fun m!378705 () Bool)

(assert (=> start!37494 m!378705))

(declare-fun m!378707 () Bool)

(assert (=> start!37494 m!378707))

(declare-fun m!378709 () Bool)

(assert (=> start!37494 m!378709))

(declare-fun m!378711 () Bool)

(assert (=> b!382344 m!378711))

(declare-fun m!378713 () Bool)

(assert (=> b!382341 m!378713))

(declare-fun m!378715 () Bool)

(assert (=> b!382343 m!378715))

(declare-fun m!378717 () Bool)

(assert (=> b!382354 m!378717))

(declare-fun m!378719 () Bool)

(assert (=> b!382354 m!378719))

(declare-fun m!378721 () Bool)

(assert (=> b!382354 m!378721))

(declare-fun m!378723 () Bool)

(assert (=> b!382354 m!378723))

(declare-fun m!378725 () Bool)

(assert (=> b!382354 m!378725))

(declare-fun m!378727 () Bool)

(assert (=> b!382354 m!378727))

(declare-fun m!378729 () Bool)

(assert (=> b!382354 m!378729))

(declare-fun m!378731 () Bool)

(assert (=> b!382345 m!378731))

(check-sat tp_is_empty!9283 b_and!15851 (not mapNonEmpty!15489) (not start!37494) (not b!382345) (not b!382344) (not b!382352) (not b!382354) (not b!382348) (not b!382341) (not b_next!8635) (not b!382351))
(check-sat b_and!15851 (not b_next!8635))
