; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36960 () Bool)

(assert start!36960)

(declare-fun b_free!8101 () Bool)

(declare-fun b_next!8101 () Bool)

(assert (=> start!36960 (= b_free!8101 (not b_next!8101))))

(declare-fun tp!29018 () Bool)

(declare-fun b_and!15317 () Bool)

(assert (=> start!36960 (= tp!29018 b_and!15317)))

(declare-fun b!370738 () Bool)

(declare-fun e!226348 () Bool)

(declare-fun e!226349 () Bool)

(declare-fun mapRes!14688 () Bool)

(assert (=> b!370738 (= e!226348 (and e!226349 mapRes!14688))))

(declare-fun condMapEmpty!14688 () Bool)

(declare-datatypes ((V!12771 0))(
  ( (V!12772 (val!4419 Int)) )
))
(declare-datatypes ((ValueCell!4031 0))(
  ( (ValueCellFull!4031 (v!6610 V!12771)) (EmptyCell!4031) )
))
(declare-datatypes ((array!21423 0))(
  ( (array!21424 (arr!10180 (Array (_ BitVec 32) ValueCell!4031)) (size!10533 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21423)

(declare-fun mapDefault!14688 () ValueCell!4031)

(assert (=> b!370738 (= condMapEmpty!14688 (= (arr!10180 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4031)) mapDefault!14688)))))

(declare-fun b!370739 () Bool)

(declare-fun e!226346 () Bool)

(assert (=> b!370739 (= e!226346 (not true))))

(declare-datatypes ((tuple2!5832 0))(
  ( (tuple2!5833 (_1!2927 (_ BitVec 64)) (_2!2927 V!12771)) )
))
(declare-datatypes ((List!5665 0))(
  ( (Nil!5662) (Cons!5661 (h!6517 tuple2!5832) (t!10806 List!5665)) )
))
(declare-datatypes ((ListLongMap!4735 0))(
  ( (ListLongMap!4736 (toList!2383 List!5665)) )
))
(declare-fun lt!169886 () ListLongMap!4735)

(declare-fun lt!169889 () ListLongMap!4735)

(assert (=> b!370739 (and (= lt!169886 lt!169889) (= lt!169889 lt!169886))))

(declare-fun v!373 () V!12771)

(declare-fun lt!169887 () ListLongMap!4735)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!751 (ListLongMap!4735 tuple2!5832) ListLongMap!4735)

(assert (=> b!370739 (= lt!169889 (+!751 lt!169887 (tuple2!5833 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11378 0))(
  ( (Unit!11379) )
))
(declare-fun lt!169890 () Unit!11378)

(declare-fun zeroValue!472 () V!12771)

(declare-datatypes ((array!21425 0))(
  ( (array!21426 (arr!10181 (Array (_ BitVec 32) (_ BitVec 64))) (size!10534 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21425)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12771)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!2 (array!21425 array!21423 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) (_ BitVec 64) V!12771 (_ BitVec 32) Int) Unit!11378)

(assert (=> b!370739 (= lt!169890 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!2 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169888 () array!21425)

(declare-fun getCurrentListMapNoExtraKeys!674 (array!21425 array!21423 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) Int) ListLongMap!4735)

(assert (=> b!370739 (= lt!169886 (getCurrentListMapNoExtraKeys!674 lt!169888 (array!21424 (store (arr!10180 _values!506) i!548 (ValueCellFull!4031 v!373)) (size!10533 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370739 (= lt!169887 (getCurrentListMapNoExtraKeys!674 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370740 () Bool)

(declare-fun e!226345 () Bool)

(assert (=> b!370740 (= e!226345 e!226346)))

(declare-fun res!208331 () Bool)

(assert (=> b!370740 (=> (not res!208331) (not e!226346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21425 (_ BitVec 32)) Bool)

(assert (=> b!370740 (= res!208331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169888 mask!970))))

(assert (=> b!370740 (= lt!169888 (array!21426 (store (arr!10181 _keys!658) i!548 k0!778) (size!10534 _keys!658)))))

(declare-fun b!370741 () Bool)

(declare-fun res!208340 () Bool)

(assert (=> b!370741 (=> (not res!208340) (not e!226345))))

(assert (=> b!370741 (= res!208340 (and (= (size!10533 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10534 _keys!658) (size!10533 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14688 () Bool)

(declare-fun tp!29019 () Bool)

(declare-fun e!226344 () Bool)

(assert (=> mapNonEmpty!14688 (= mapRes!14688 (and tp!29019 e!226344))))

(declare-fun mapKey!14688 () (_ BitVec 32))

(declare-fun mapValue!14688 () ValueCell!4031)

(declare-fun mapRest!14688 () (Array (_ BitVec 32) ValueCell!4031))

(assert (=> mapNonEmpty!14688 (= (arr!10180 _values!506) (store mapRest!14688 mapKey!14688 mapValue!14688))))

(declare-fun b!370742 () Bool)

(declare-fun res!208337 () Bool)

(assert (=> b!370742 (=> (not res!208337) (not e!226345))))

(assert (=> b!370742 (= res!208337 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10534 _keys!658))))))

(declare-fun b!370743 () Bool)

(declare-fun res!208335 () Bool)

(assert (=> b!370743 (=> (not res!208335) (not e!226345))))

(declare-fun arrayContainsKey!0 (array!21425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370743 (= res!208335 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370744 () Bool)

(declare-fun res!208336 () Bool)

(assert (=> b!370744 (=> (not res!208336) (not e!226346))))

(declare-datatypes ((List!5666 0))(
  ( (Nil!5663) (Cons!5662 (h!6518 (_ BitVec 64)) (t!10807 List!5666)) )
))
(declare-fun arrayNoDuplicates!0 (array!21425 (_ BitVec 32) List!5666) Bool)

(assert (=> b!370744 (= res!208336 (arrayNoDuplicates!0 lt!169888 #b00000000000000000000000000000000 Nil!5663))))

(declare-fun b!370745 () Bool)

(declare-fun tp_is_empty!8749 () Bool)

(assert (=> b!370745 (= e!226349 tp_is_empty!8749)))

(declare-fun b!370746 () Bool)

(assert (=> b!370746 (= e!226344 tp_is_empty!8749)))

(declare-fun mapIsEmpty!14688 () Bool)

(assert (=> mapIsEmpty!14688 mapRes!14688))

(declare-fun res!208334 () Bool)

(assert (=> start!36960 (=> (not res!208334) (not e!226345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36960 (= res!208334 (validMask!0 mask!970))))

(assert (=> start!36960 e!226345))

(declare-fun array_inv!7528 (array!21423) Bool)

(assert (=> start!36960 (and (array_inv!7528 _values!506) e!226348)))

(assert (=> start!36960 tp!29018))

(assert (=> start!36960 true))

(assert (=> start!36960 tp_is_empty!8749))

(declare-fun array_inv!7529 (array!21425) Bool)

(assert (=> start!36960 (array_inv!7529 _keys!658)))

(declare-fun b!370747 () Bool)

(declare-fun res!208332 () Bool)

(assert (=> b!370747 (=> (not res!208332) (not e!226345))))

(assert (=> b!370747 (= res!208332 (or (= (select (arr!10181 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10181 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370748 () Bool)

(declare-fun res!208338 () Bool)

(assert (=> b!370748 (=> (not res!208338) (not e!226345))))

(assert (=> b!370748 (= res!208338 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5663))))

(declare-fun b!370749 () Bool)

(declare-fun res!208333 () Bool)

(assert (=> b!370749 (=> (not res!208333) (not e!226345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370749 (= res!208333 (validKeyInArray!0 k0!778))))

(declare-fun b!370750 () Bool)

(declare-fun res!208339 () Bool)

(assert (=> b!370750 (=> (not res!208339) (not e!226345))))

(assert (=> b!370750 (= res!208339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36960 res!208334) b!370741))

(assert (= (and b!370741 res!208340) b!370750))

(assert (= (and b!370750 res!208339) b!370748))

(assert (= (and b!370748 res!208338) b!370742))

(assert (= (and b!370742 res!208337) b!370749))

(assert (= (and b!370749 res!208333) b!370747))

(assert (= (and b!370747 res!208332) b!370743))

(assert (= (and b!370743 res!208335) b!370740))

(assert (= (and b!370740 res!208331) b!370744))

(assert (= (and b!370744 res!208336) b!370739))

(assert (= (and b!370738 condMapEmpty!14688) mapIsEmpty!14688))

(assert (= (and b!370738 (not condMapEmpty!14688)) mapNonEmpty!14688))

(get-info :version)

(assert (= (and mapNonEmpty!14688 ((_ is ValueCellFull!4031) mapValue!14688)) b!370746))

(assert (= (and b!370738 ((_ is ValueCellFull!4031) mapDefault!14688)) b!370745))

(assert (= start!36960 b!370738))

(declare-fun m!366311 () Bool)

(assert (=> b!370739 m!366311))

(declare-fun m!366313 () Bool)

(assert (=> b!370739 m!366313))

(declare-fun m!366315 () Bool)

(assert (=> b!370739 m!366315))

(declare-fun m!366317 () Bool)

(assert (=> b!370739 m!366317))

(declare-fun m!366319 () Bool)

(assert (=> b!370739 m!366319))

(declare-fun m!366321 () Bool)

(assert (=> start!36960 m!366321))

(declare-fun m!366323 () Bool)

(assert (=> start!36960 m!366323))

(declare-fun m!366325 () Bool)

(assert (=> start!36960 m!366325))

(declare-fun m!366327 () Bool)

(assert (=> b!370749 m!366327))

(declare-fun m!366329 () Bool)

(assert (=> b!370740 m!366329))

(declare-fun m!366331 () Bool)

(assert (=> b!370740 m!366331))

(declare-fun m!366333 () Bool)

(assert (=> b!370750 m!366333))

(declare-fun m!366335 () Bool)

(assert (=> b!370748 m!366335))

(declare-fun m!366337 () Bool)

(assert (=> b!370747 m!366337))

(declare-fun m!366339 () Bool)

(assert (=> b!370743 m!366339))

(declare-fun m!366341 () Bool)

(assert (=> b!370744 m!366341))

(declare-fun m!366343 () Bool)

(assert (=> mapNonEmpty!14688 m!366343))

(check-sat (not start!36960) (not b!370749) b_and!15317 (not b!370744) (not b_next!8101) (not b!370743) (not b!370748) (not b!370750) (not mapNonEmpty!14688) (not b!370740) (not b!370739) tp_is_empty!8749)
(check-sat b_and!15317 (not b_next!8101))
