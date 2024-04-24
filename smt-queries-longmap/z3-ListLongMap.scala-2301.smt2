; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37254 () Bool)

(assert start!37254)

(declare-fun b_free!8395 () Bool)

(declare-fun b_next!8395 () Bool)

(assert (=> start!37254 (= b_free!8395 (not b_next!8395))))

(declare-fun tp!29901 () Bool)

(declare-fun b_and!15651 () Bool)

(assert (=> start!37254 (= tp!29901 b_and!15651)))

(declare-fun b!377282 () Bool)

(declare-fun res!213461 () Bool)

(declare-fun e!229710 () Bool)

(assert (=> b!377282 (=> (not res!213461) (not e!229710))))

(declare-datatypes ((array!22002 0))(
  ( (array!22003 (arr!10469 (Array (_ BitVec 32) (_ BitVec 64))) (size!10821 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22002)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22002 (_ BitVec 32)) Bool)

(assert (=> b!377282 (= res!213461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377283 () Bool)

(declare-fun e!229708 () Bool)

(declare-fun e!229704 () Bool)

(assert (=> b!377283 (= e!229708 (not e!229704))))

(declare-fun res!213458 () Bool)

(assert (=> b!377283 (=> res!213458 e!229704)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377283 (= res!213458 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13163 0))(
  ( (V!13164 (val!4566 Int)) )
))
(declare-datatypes ((ValueCell!4178 0))(
  ( (ValueCellFull!4178 (v!6764 V!13163)) (EmptyCell!4178) )
))
(declare-datatypes ((array!22004 0))(
  ( (array!22005 (arr!10470 (Array (_ BitVec 32) ValueCell!4178)) (size!10822 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22004)

(declare-fun zeroValue!472 () V!13163)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5992 0))(
  ( (tuple2!5993 (_1!3007 (_ BitVec 64)) (_2!3007 V!13163)) )
))
(declare-datatypes ((List!5832 0))(
  ( (Nil!5829) (Cons!5828 (h!6684 tuple2!5992) (t!10974 List!5832)) )
))
(declare-datatypes ((ListLongMap!4907 0))(
  ( (ListLongMap!4908 (toList!2469 List!5832)) )
))
(declare-fun lt!175424 () ListLongMap!4907)

(declare-fun minValue!472 () V!13163)

(declare-fun getCurrentListMap!1915 (array!22002 array!22004 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4907)

(assert (=> b!377283 (= lt!175424 (getCurrentListMap!1915 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175423 () array!22004)

(declare-fun lt!175429 () ListLongMap!4907)

(declare-fun lt!175430 () array!22002)

(assert (=> b!377283 (= lt!175429 (getCurrentListMap!1915 lt!175430 lt!175423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175431 () ListLongMap!4907)

(declare-fun lt!175428 () ListLongMap!4907)

(assert (=> b!377283 (and (= lt!175431 lt!175428) (= lt!175428 lt!175431))))

(declare-fun lt!175427 () ListLongMap!4907)

(declare-fun lt!175421 () tuple2!5992)

(declare-fun +!865 (ListLongMap!4907 tuple2!5992) ListLongMap!4907)

(assert (=> b!377283 (= lt!175428 (+!865 lt!175427 lt!175421))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13163)

(assert (=> b!377283 (= lt!175421 (tuple2!5993 k0!778 v!373))))

(declare-datatypes ((Unit!11615 0))(
  ( (Unit!11616) )
))
(declare-fun lt!175425 () Unit!11615)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!102 (array!22002 array!22004 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) (_ BitVec 64) V!13163 (_ BitVec 32) Int) Unit!11615)

(assert (=> b!377283 (= lt!175425 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!102 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!762 (array!22002 array!22004 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4907)

(assert (=> b!377283 (= lt!175431 (getCurrentListMapNoExtraKeys!762 lt!175430 lt!175423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377283 (= lt!175423 (array!22005 (store (arr!10470 _values!506) i!548 (ValueCellFull!4178 v!373)) (size!10822 _values!506)))))

(assert (=> b!377283 (= lt!175427 (getCurrentListMapNoExtraKeys!762 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377284 () Bool)

(assert (=> b!377284 (= e!229710 e!229708)))

(declare-fun res!213464 () Bool)

(assert (=> b!377284 (=> (not res!213464) (not e!229708))))

(assert (=> b!377284 (= res!213464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175430 mask!970))))

(assert (=> b!377284 (= lt!175430 (array!22003 (store (arr!10469 _keys!658) i!548 k0!778) (size!10821 _keys!658)))))

(declare-fun b!377285 () Bool)

(declare-fun res!213460 () Bool)

(assert (=> b!377285 (=> (not res!213460) (not e!229710))))

(assert (=> b!377285 (= res!213460 (and (= (size!10822 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10821 _keys!658) (size!10822 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377286 () Bool)

(declare-fun e!229705 () Bool)

(declare-fun tp_is_empty!9043 () Bool)

(assert (=> b!377286 (= e!229705 tp_is_empty!9043)))

(declare-fun mapNonEmpty!15129 () Bool)

(declare-fun mapRes!15129 () Bool)

(declare-fun tp!29900 () Bool)

(assert (=> mapNonEmpty!15129 (= mapRes!15129 (and tp!29900 e!229705))))

(declare-fun mapRest!15129 () (Array (_ BitVec 32) ValueCell!4178))

(declare-fun mapKey!15129 () (_ BitVec 32))

(declare-fun mapValue!15129 () ValueCell!4178)

(assert (=> mapNonEmpty!15129 (= (arr!10470 _values!506) (store mapRest!15129 mapKey!15129 mapValue!15129))))

(declare-fun res!213459 () Bool)

(assert (=> start!37254 (=> (not res!213459) (not e!229710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37254 (= res!213459 (validMask!0 mask!970))))

(assert (=> start!37254 e!229710))

(declare-fun e!229703 () Bool)

(declare-fun array_inv!7766 (array!22004) Bool)

(assert (=> start!37254 (and (array_inv!7766 _values!506) e!229703)))

(assert (=> start!37254 tp!29901))

(assert (=> start!37254 true))

(assert (=> start!37254 tp_is_empty!9043))

(declare-fun array_inv!7767 (array!22002) Bool)

(assert (=> start!37254 (array_inv!7767 _keys!658)))

(declare-fun b!377287 () Bool)

(declare-fun res!213467 () Bool)

(assert (=> b!377287 (=> (not res!213467) (not e!229710))))

(assert (=> b!377287 (= res!213467 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10821 _keys!658))))))

(declare-fun b!377288 () Bool)

(declare-fun res!213463 () Bool)

(assert (=> b!377288 (=> (not res!213463) (not e!229710))))

(declare-datatypes ((List!5833 0))(
  ( (Nil!5830) (Cons!5829 (h!6685 (_ BitVec 64)) (t!10975 List!5833)) )
))
(declare-fun arrayNoDuplicates!0 (array!22002 (_ BitVec 32) List!5833) Bool)

(assert (=> b!377288 (= res!213463 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5830))))

(declare-fun mapIsEmpty!15129 () Bool)

(assert (=> mapIsEmpty!15129 mapRes!15129))

(declare-fun b!377289 () Bool)

(declare-fun res!213457 () Bool)

(assert (=> b!377289 (=> (not res!213457) (not e!229710))))

(declare-fun arrayContainsKey!0 (array!22002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377289 (= res!213457 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377290 () Bool)

(declare-fun res!213462 () Bool)

(assert (=> b!377290 (=> (not res!213462) (not e!229710))))

(assert (=> b!377290 (= res!213462 (or (= (select (arr!10469 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10469 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377291 () Bool)

(declare-fun e!229706 () Bool)

(assert (=> b!377291 (= e!229706 tp_is_empty!9043)))

(declare-fun b!377292 () Bool)

(declare-fun e!229707 () Bool)

(assert (=> b!377292 (= e!229707 true)))

(declare-fun lt!175432 () ListLongMap!4907)

(declare-fun lt!175426 () ListLongMap!4907)

(assert (=> b!377292 (= lt!175432 (+!865 lt!175426 lt!175421))))

(declare-fun lt!175422 () Unit!11615)

(declare-fun addCommutativeForDiffKeys!284 (ListLongMap!4907 (_ BitVec 64) V!13163 (_ BitVec 64) V!13163) Unit!11615)

(assert (=> b!377292 (= lt!175422 (addCommutativeForDiffKeys!284 lt!175427 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377293 () Bool)

(assert (=> b!377293 (= e!229703 (and e!229706 mapRes!15129))))

(declare-fun condMapEmpty!15129 () Bool)

(declare-fun mapDefault!15129 () ValueCell!4178)

(assert (=> b!377293 (= condMapEmpty!15129 (= (arr!10470 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4178)) mapDefault!15129)))))

(declare-fun b!377294 () Bool)

(declare-fun res!213465 () Bool)

(assert (=> b!377294 (=> (not res!213465) (not e!229710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377294 (= res!213465 (validKeyInArray!0 k0!778))))

(declare-fun b!377295 () Bool)

(declare-fun res!213466 () Bool)

(assert (=> b!377295 (=> (not res!213466) (not e!229708))))

(assert (=> b!377295 (= res!213466 (arrayNoDuplicates!0 lt!175430 #b00000000000000000000000000000000 Nil!5830))))

(declare-fun b!377296 () Bool)

(assert (=> b!377296 (= e!229704 e!229707)))

(declare-fun res!213456 () Bool)

(assert (=> b!377296 (=> res!213456 e!229707)))

(assert (=> b!377296 (= res!213456 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377296 (= lt!175429 lt!175432)))

(declare-fun lt!175420 () tuple2!5992)

(assert (=> b!377296 (= lt!175432 (+!865 lt!175428 lt!175420))))

(assert (=> b!377296 (= lt!175424 lt!175426)))

(assert (=> b!377296 (= lt!175426 (+!865 lt!175427 lt!175420))))

(assert (=> b!377296 (= lt!175429 (+!865 lt!175431 lt!175420))))

(assert (=> b!377296 (= lt!175420 (tuple2!5993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37254 res!213459) b!377285))

(assert (= (and b!377285 res!213460) b!377282))

(assert (= (and b!377282 res!213461) b!377288))

(assert (= (and b!377288 res!213463) b!377287))

(assert (= (and b!377287 res!213467) b!377294))

(assert (= (and b!377294 res!213465) b!377290))

(assert (= (and b!377290 res!213462) b!377289))

(assert (= (and b!377289 res!213457) b!377284))

(assert (= (and b!377284 res!213464) b!377295))

(assert (= (and b!377295 res!213466) b!377283))

(assert (= (and b!377283 (not res!213458)) b!377296))

(assert (= (and b!377296 (not res!213456)) b!377292))

(assert (= (and b!377293 condMapEmpty!15129) mapIsEmpty!15129))

(assert (= (and b!377293 (not condMapEmpty!15129)) mapNonEmpty!15129))

(get-info :version)

(assert (= (and mapNonEmpty!15129 ((_ is ValueCellFull!4178) mapValue!15129)) b!377286))

(assert (= (and b!377293 ((_ is ValueCellFull!4178) mapDefault!15129)) b!377291))

(assert (= start!37254 b!377293))

(declare-fun m!374321 () Bool)

(assert (=> b!377294 m!374321))

(declare-fun m!374323 () Bool)

(assert (=> b!377284 m!374323))

(declare-fun m!374325 () Bool)

(assert (=> b!377284 m!374325))

(declare-fun m!374327 () Bool)

(assert (=> start!37254 m!374327))

(declare-fun m!374329 () Bool)

(assert (=> start!37254 m!374329))

(declare-fun m!374331 () Bool)

(assert (=> start!37254 m!374331))

(declare-fun m!374333 () Bool)

(assert (=> b!377289 m!374333))

(declare-fun m!374335 () Bool)

(assert (=> b!377295 m!374335))

(declare-fun m!374337 () Bool)

(assert (=> b!377296 m!374337))

(declare-fun m!374339 () Bool)

(assert (=> b!377296 m!374339))

(declare-fun m!374341 () Bool)

(assert (=> b!377296 m!374341))

(declare-fun m!374343 () Bool)

(assert (=> b!377292 m!374343))

(declare-fun m!374345 () Bool)

(assert (=> b!377292 m!374345))

(declare-fun m!374347 () Bool)

(assert (=> b!377288 m!374347))

(declare-fun m!374349 () Bool)

(assert (=> b!377283 m!374349))

(declare-fun m!374351 () Bool)

(assert (=> b!377283 m!374351))

(declare-fun m!374353 () Bool)

(assert (=> b!377283 m!374353))

(declare-fun m!374355 () Bool)

(assert (=> b!377283 m!374355))

(declare-fun m!374357 () Bool)

(assert (=> b!377283 m!374357))

(declare-fun m!374359 () Bool)

(assert (=> b!377283 m!374359))

(declare-fun m!374361 () Bool)

(assert (=> b!377283 m!374361))

(declare-fun m!374363 () Bool)

(assert (=> b!377290 m!374363))

(declare-fun m!374365 () Bool)

(assert (=> mapNonEmpty!15129 m!374365))

(declare-fun m!374367 () Bool)

(assert (=> b!377282 m!374367))

(check-sat (not b!377282) (not b!377289) (not b_next!8395) (not b!377296) (not b!377294) (not start!37254) (not b!377295) (not b!377288) (not b!377284) b_and!15651 tp_is_empty!9043 (not b!377292) (not b!377283) (not mapNonEmpty!15129))
(check-sat b_and!15651 (not b_next!8395))
