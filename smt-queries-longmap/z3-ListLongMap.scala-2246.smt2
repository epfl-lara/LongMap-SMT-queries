; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36940 () Bool)

(assert start!36940)

(declare-fun b_free!8067 () Bool)

(declare-fun b_next!8067 () Bool)

(assert (=> start!36940 (= b_free!8067 (not b_next!8067))))

(declare-fun tp!28916 () Bool)

(declare-fun b_and!15309 () Bool)

(assert (=> start!36940 (= tp!28916 b_and!15309)))

(declare-fun b!370346 () Bool)

(declare-fun res!207955 () Bool)

(declare-fun e!226217 () Bool)

(assert (=> b!370346 (=> (not res!207955) (not e!226217))))

(declare-datatypes ((array!21373 0))(
  ( (array!21374 (arr!10155 (Array (_ BitVec 32) (_ BitVec 64))) (size!10507 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21373)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370346 (= res!207955 (or (= (select (arr!10155 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10155 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370348 () Bool)

(declare-fun e!226214 () Bool)

(declare-fun tp_is_empty!8715 () Bool)

(assert (=> b!370348 (= e!226214 tp_is_empty!8715)))

(declare-fun b!370349 () Bool)

(declare-fun res!207957 () Bool)

(assert (=> b!370349 (=> (not res!207957) (not e!226217))))

(assert (=> b!370349 (= res!207957 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10507 _keys!658))))))

(declare-fun b!370350 () Bool)

(declare-fun res!207951 () Bool)

(assert (=> b!370350 (=> (not res!207951) (not e!226217))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370350 (= res!207951 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370351 () Bool)

(declare-fun e!226213 () Bool)

(assert (=> b!370351 (= e!226213 tp_is_empty!8715)))

(declare-fun b!370352 () Bool)

(declare-fun res!207952 () Bool)

(declare-fun e!226215 () Bool)

(assert (=> b!370352 (=> (not res!207952) (not e!226215))))

(declare-fun lt!169945 () array!21373)

(declare-datatypes ((List!5676 0))(
  ( (Nil!5673) (Cons!5672 (h!6528 (_ BitVec 64)) (t!10826 List!5676)) )
))
(declare-fun arrayNoDuplicates!0 (array!21373 (_ BitVec 32) List!5676) Bool)

(assert (=> b!370352 (= res!207952 (arrayNoDuplicates!0 lt!169945 #b00000000000000000000000000000000 Nil!5673))))

(declare-fun b!370353 () Bool)

(assert (=> b!370353 (= e!226217 e!226215)))

(declare-fun res!207956 () Bool)

(assert (=> b!370353 (=> (not res!207956) (not e!226215))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21373 (_ BitVec 32)) Bool)

(assert (=> b!370353 (= res!207956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169945 mask!970))))

(assert (=> b!370353 (= lt!169945 (array!21374 (store (arr!10155 _keys!658) i!548 k0!778) (size!10507 _keys!658)))))

(declare-fun mapNonEmpty!14637 () Bool)

(declare-fun mapRes!14637 () Bool)

(declare-fun tp!28917 () Bool)

(assert (=> mapNonEmpty!14637 (= mapRes!14637 (and tp!28917 e!226214))))

(declare-datatypes ((V!12725 0))(
  ( (V!12726 (val!4402 Int)) )
))
(declare-datatypes ((ValueCell!4014 0))(
  ( (ValueCellFull!4014 (v!6599 V!12725)) (EmptyCell!4014) )
))
(declare-datatypes ((array!21375 0))(
  ( (array!21376 (arr!10156 (Array (_ BitVec 32) ValueCell!4014)) (size!10508 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21375)

(declare-fun mapKey!14637 () (_ BitVec 32))

(declare-fun mapValue!14637 () ValueCell!4014)

(declare-fun mapRest!14637 () (Array (_ BitVec 32) ValueCell!4014))

(assert (=> mapNonEmpty!14637 (= (arr!10156 _values!506) (store mapRest!14637 mapKey!14637 mapValue!14637))))

(declare-fun b!370354 () Bool)

(declare-fun res!207959 () Bool)

(assert (=> b!370354 (=> (not res!207959) (not e!226217))))

(assert (=> b!370354 (= res!207959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370355 () Bool)

(declare-fun e!226212 () Bool)

(assert (=> b!370355 (= e!226212 (and e!226213 mapRes!14637))))

(declare-fun condMapEmpty!14637 () Bool)

(declare-fun mapDefault!14637 () ValueCell!4014)

(assert (=> b!370355 (= condMapEmpty!14637 (= (arr!10156 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4014)) mapDefault!14637)))))

(declare-fun b!370356 () Bool)

(declare-fun res!207950 () Bool)

(assert (=> b!370356 (=> (not res!207950) (not e!226217))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370356 (= res!207950 (and (= (size!10508 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10507 _keys!658) (size!10508 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14637 () Bool)

(assert (=> mapIsEmpty!14637 mapRes!14637))

(declare-fun b!370357 () Bool)

(assert (=> b!370357 (= e!226215 false)))

(declare-datatypes ((tuple2!5838 0))(
  ( (tuple2!5839 (_1!2930 (_ BitVec 64)) (_2!2930 V!12725)) )
))
(declare-datatypes ((List!5677 0))(
  ( (Nil!5674) (Cons!5673 (h!6529 tuple2!5838) (t!10827 List!5677)) )
))
(declare-datatypes ((ListLongMap!4751 0))(
  ( (ListLongMap!4752 (toList!2391 List!5677)) )
))
(declare-fun lt!169946 () ListLongMap!4751)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12725)

(declare-fun v!373 () V!12725)

(declare-fun minValue!472 () V!12725)

(declare-fun getCurrentListMapNoExtraKeys!668 (array!21373 array!21375 (_ BitVec 32) (_ BitVec 32) V!12725 V!12725 (_ BitVec 32) Int) ListLongMap!4751)

(assert (=> b!370357 (= lt!169946 (getCurrentListMapNoExtraKeys!668 lt!169945 (array!21376 (store (arr!10156 _values!506) i!548 (ValueCellFull!4014 v!373)) (size!10508 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169947 () ListLongMap!4751)

(assert (=> b!370357 (= lt!169947 (getCurrentListMapNoExtraKeys!668 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370358 () Bool)

(declare-fun res!207954 () Bool)

(assert (=> b!370358 (=> (not res!207954) (not e!226217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370358 (= res!207954 (validKeyInArray!0 k0!778))))

(declare-fun b!370347 () Bool)

(declare-fun res!207958 () Bool)

(assert (=> b!370347 (=> (not res!207958) (not e!226217))))

(assert (=> b!370347 (= res!207958 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5673))))

(declare-fun res!207953 () Bool)

(assert (=> start!36940 (=> (not res!207953) (not e!226217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36940 (= res!207953 (validMask!0 mask!970))))

(assert (=> start!36940 e!226217))

(declare-fun array_inv!7502 (array!21375) Bool)

(assert (=> start!36940 (and (array_inv!7502 _values!506) e!226212)))

(assert (=> start!36940 tp!28916))

(assert (=> start!36940 true))

(assert (=> start!36940 tp_is_empty!8715))

(declare-fun array_inv!7503 (array!21373) Bool)

(assert (=> start!36940 (array_inv!7503 _keys!658)))

(assert (= (and start!36940 res!207953) b!370356))

(assert (= (and b!370356 res!207950) b!370354))

(assert (= (and b!370354 res!207959) b!370347))

(assert (= (and b!370347 res!207958) b!370349))

(assert (= (and b!370349 res!207957) b!370358))

(assert (= (and b!370358 res!207954) b!370346))

(assert (= (and b!370346 res!207955) b!370350))

(assert (= (and b!370350 res!207951) b!370353))

(assert (= (and b!370353 res!207956) b!370352))

(assert (= (and b!370352 res!207952) b!370357))

(assert (= (and b!370355 condMapEmpty!14637) mapIsEmpty!14637))

(assert (= (and b!370355 (not condMapEmpty!14637)) mapNonEmpty!14637))

(get-info :version)

(assert (= (and mapNonEmpty!14637 ((_ is ValueCellFull!4014) mapValue!14637)) b!370348))

(assert (= (and b!370355 ((_ is ValueCellFull!4014) mapDefault!14637)) b!370351))

(assert (= start!36940 b!370355))

(declare-fun m!366513 () Bool)

(assert (=> mapNonEmpty!14637 m!366513))

(declare-fun m!366515 () Bool)

(assert (=> b!370353 m!366515))

(declare-fun m!366517 () Bool)

(assert (=> b!370353 m!366517))

(declare-fun m!366519 () Bool)

(assert (=> b!370358 m!366519))

(declare-fun m!366521 () Bool)

(assert (=> b!370346 m!366521))

(declare-fun m!366523 () Bool)

(assert (=> b!370352 m!366523))

(declare-fun m!366525 () Bool)

(assert (=> b!370354 m!366525))

(declare-fun m!366527 () Bool)

(assert (=> b!370357 m!366527))

(declare-fun m!366529 () Bool)

(assert (=> b!370357 m!366529))

(declare-fun m!366531 () Bool)

(assert (=> b!370357 m!366531))

(declare-fun m!366533 () Bool)

(assert (=> b!370347 m!366533))

(declare-fun m!366535 () Bool)

(assert (=> start!36940 m!366535))

(declare-fun m!366537 () Bool)

(assert (=> start!36940 m!366537))

(declare-fun m!366539 () Bool)

(assert (=> start!36940 m!366539))

(declare-fun m!366541 () Bool)

(assert (=> b!370350 m!366541))

(check-sat b_and!15309 (not b!370358) (not b_next!8067) (not mapNonEmpty!14637) (not b!370357) (not b!370354) (not b!370350) (not start!36940) (not b!370353) tp_is_empty!8715 (not b!370347) (not b!370352))
(check-sat b_and!15309 (not b_next!8067))
