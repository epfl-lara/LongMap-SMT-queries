; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43542 () Bool)

(assert start!43542)

(declare-fun b_free!12321 () Bool)

(declare-fun b_next!12321 () Bool)

(assert (=> start!43542 (= b_free!12321 (not b_next!12321))))

(declare-fun tp!43245 () Bool)

(declare-fun b_and!21081 () Bool)

(assert (=> start!43542 (= tp!43245 b_and!21081)))

(declare-fun mapNonEmpty!22459 () Bool)

(declare-fun mapRes!22459 () Bool)

(declare-fun tp!43246 () Bool)

(declare-fun e!283918 () Bool)

(assert (=> mapNonEmpty!22459 (= mapRes!22459 (and tp!43246 e!283918))))

(declare-fun mapKey!22459 () (_ BitVec 32))

(declare-datatypes ((V!19515 0))(
  ( (V!19516 (val!6964 Int)) )
))
(declare-datatypes ((ValueCell!6555 0))(
  ( (ValueCellFull!6555 (v!9257 V!19515)) (EmptyCell!6555) )
))
(declare-fun mapRest!22459 () (Array (_ BitVec 32) ValueCell!6555))

(declare-fun mapValue!22459 () ValueCell!6555)

(declare-datatypes ((array!31323 0))(
  ( (array!31324 (arr!15064 (Array (_ BitVec 32) ValueCell!6555)) (size!15422 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31323)

(assert (=> mapNonEmpty!22459 (= (arr!15064 _values!1516) (store mapRest!22459 mapKey!22459 mapValue!22459))))

(declare-fun b!482446 () Bool)

(declare-fun e!283915 () Bool)

(assert (=> b!482446 (= e!283915 (not true))))

(declare-fun lt!218724 () (_ BitVec 32))

(declare-datatypes ((array!31325 0))(
  ( (array!31326 (arr!15065 (Array (_ BitVec 32) (_ BitVec 64))) (size!15423 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31325)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31325 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482446 (= lt!218724 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283919 () Bool)

(assert (=> b!482446 e!283919))

(declare-fun c!57954 () Bool)

(assert (=> b!482446 (= c!57954 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19515)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((Unit!14142 0))(
  ( (Unit!14143) )
))
(declare-fun lt!218725 () Unit!14142)

(declare-fun zeroValue!1458 () V!19515)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!142 (array!31325 array!31323 (_ BitVec 32) (_ BitVec 32) V!19515 V!19515 (_ BitVec 64) Int) Unit!14142)

(assert (=> b!482446 (= lt!218725 (lemmaKeyInListMapIsInArray!142 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482447 () Bool)

(declare-fun e!283916 () Bool)

(declare-fun tp_is_empty!13833 () Bool)

(assert (=> b!482447 (= e!283916 tp_is_empty!13833)))

(declare-fun b!482448 () Bool)

(declare-fun res!287589 () Bool)

(assert (=> b!482448 (=> (not res!287589) (not e!283915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31325 (_ BitVec 32)) Bool)

(assert (=> b!482448 (= res!287589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482449 () Bool)

(declare-fun arrayContainsKey!0 (array!31325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482449 (= e!283919 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482450 () Bool)

(declare-fun res!287590 () Bool)

(assert (=> b!482450 (=> (not res!287590) (not e!283915))))

(declare-datatypes ((List!9221 0))(
  ( (Nil!9218) (Cons!9217 (h!10073 (_ BitVec 64)) (t!15435 List!9221)) )
))
(declare-fun arrayNoDuplicates!0 (array!31325 (_ BitVec 32) List!9221) Bool)

(assert (=> b!482450 (= res!287590 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9218))))

(declare-fun b!482451 () Bool)

(declare-fun res!287588 () Bool)

(assert (=> b!482451 (=> (not res!287588) (not e!283915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482451 (= res!287588 (validKeyInArray!0 k0!1332))))

(declare-fun b!482452 () Bool)

(declare-fun res!287593 () Bool)

(assert (=> b!482452 (=> (not res!287593) (not e!283915))))

(declare-datatypes ((tuple2!9142 0))(
  ( (tuple2!9143 (_1!4582 (_ BitVec 64)) (_2!4582 V!19515)) )
))
(declare-datatypes ((List!9222 0))(
  ( (Nil!9219) (Cons!9218 (h!10074 tuple2!9142) (t!15436 List!9222)) )
))
(declare-datatypes ((ListLongMap!8055 0))(
  ( (ListLongMap!8056 (toList!4043 List!9222)) )
))
(declare-fun contains!2657 (ListLongMap!8055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2362 (array!31325 array!31323 (_ BitVec 32) (_ BitVec 32) V!19515 V!19515 (_ BitVec 32) Int) ListLongMap!8055)

(assert (=> b!482452 (= res!287593 (contains!2657 (getCurrentListMap!2362 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482453 () Bool)

(declare-fun e!283917 () Bool)

(assert (=> b!482453 (= e!283917 (and e!283916 mapRes!22459))))

(declare-fun condMapEmpty!22459 () Bool)

(declare-fun mapDefault!22459 () ValueCell!6555)

(assert (=> b!482453 (= condMapEmpty!22459 (= (arr!15064 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6555)) mapDefault!22459)))))

(declare-fun res!287591 () Bool)

(assert (=> start!43542 (=> (not res!287591) (not e!283915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43542 (= res!287591 (validMask!0 mask!2352))))

(assert (=> start!43542 e!283915))

(assert (=> start!43542 true))

(assert (=> start!43542 tp_is_empty!13833))

(declare-fun array_inv!10868 (array!31323) Bool)

(assert (=> start!43542 (and (array_inv!10868 _values!1516) e!283917)))

(assert (=> start!43542 tp!43245))

(declare-fun array_inv!10869 (array!31325) Bool)

(assert (=> start!43542 (array_inv!10869 _keys!1874)))

(declare-fun b!482454 () Bool)

(declare-fun res!287592 () Bool)

(assert (=> b!482454 (=> (not res!287592) (not e!283915))))

(assert (=> b!482454 (= res!287592 (and (= (size!15422 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15423 _keys!1874) (size!15422 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482455 () Bool)

(assert (=> b!482455 (= e!283918 tp_is_empty!13833)))

(declare-fun mapIsEmpty!22459 () Bool)

(assert (=> mapIsEmpty!22459 mapRes!22459))

(declare-fun b!482456 () Bool)

(assert (=> b!482456 (= e!283919 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!43542 res!287591) b!482454))

(assert (= (and b!482454 res!287592) b!482448))

(assert (= (and b!482448 res!287589) b!482450))

(assert (= (and b!482450 res!287590) b!482452))

(assert (= (and b!482452 res!287593) b!482451))

(assert (= (and b!482451 res!287588) b!482446))

(assert (= (and b!482446 c!57954) b!482449))

(assert (= (and b!482446 (not c!57954)) b!482456))

(assert (= (and b!482453 condMapEmpty!22459) mapIsEmpty!22459))

(assert (= (and b!482453 (not condMapEmpty!22459)) mapNonEmpty!22459))

(get-info :version)

(assert (= (and mapNonEmpty!22459 ((_ is ValueCellFull!6555) mapValue!22459)) b!482455))

(assert (= (and b!482453 ((_ is ValueCellFull!6555) mapDefault!22459)) b!482447))

(assert (= start!43542 b!482453))

(declare-fun m!463691 () Bool)

(assert (=> b!482446 m!463691))

(declare-fun m!463693 () Bool)

(assert (=> b!482446 m!463693))

(declare-fun m!463695 () Bool)

(assert (=> b!482449 m!463695))

(declare-fun m!463697 () Bool)

(assert (=> b!482448 m!463697))

(declare-fun m!463699 () Bool)

(assert (=> start!43542 m!463699))

(declare-fun m!463701 () Bool)

(assert (=> start!43542 m!463701))

(declare-fun m!463703 () Bool)

(assert (=> start!43542 m!463703))

(declare-fun m!463705 () Bool)

(assert (=> b!482452 m!463705))

(assert (=> b!482452 m!463705))

(declare-fun m!463707 () Bool)

(assert (=> b!482452 m!463707))

(declare-fun m!463709 () Bool)

(assert (=> b!482450 m!463709))

(declare-fun m!463711 () Bool)

(assert (=> b!482451 m!463711))

(declare-fun m!463713 () Bool)

(assert (=> mapNonEmpty!22459 m!463713))

(check-sat (not mapNonEmpty!22459) (not start!43542) (not b_next!12321) (not b!482451) (not b!482449) (not b!482446) (not b!482450) (not b!482448) b_and!21081 (not b!482452) tp_is_empty!13833)
(check-sat b_and!21081 (not b_next!12321))
