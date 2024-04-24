; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40178 () Bool)

(assert start!40178)

(declare-fun b_free!10459 () Bool)

(declare-fun b_next!10459 () Bool)

(assert (=> start!40178 (= b_free!10459 (not b_next!10459))))

(declare-fun tp!36905 () Bool)

(declare-fun b_and!18441 () Bool)

(assert (=> start!40178 (= tp!36905 b_and!18441)))

(declare-fun b!440323 () Bool)

(declare-fun res!260448 () Bool)

(declare-fun e!259435 () Bool)

(assert (=> b!440323 (=> (not res!260448) (not e!259435))))

(declare-datatypes ((array!27042 0))(
  ( (array!27043 (arr!12970 (Array (_ BitVec 32) (_ BitVec 64))) (size!13322 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27042)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440323 (= res!260448 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19038 () Bool)

(declare-fun mapRes!19038 () Bool)

(assert (=> mapIsEmpty!19038 mapRes!19038))

(declare-fun b!440324 () Bool)

(declare-fun e!259432 () Bool)

(declare-fun tp_is_empty!11611 () Bool)

(assert (=> b!440324 (= e!259432 tp_is_empty!11611)))

(declare-fun b!440325 () Bool)

(declare-fun e!259429 () Bool)

(assert (=> b!440325 (= e!259435 e!259429)))

(declare-fun res!260445 () Bool)

(assert (=> b!440325 (=> (not res!260445) (not e!259429))))

(declare-fun lt!202583 () array!27042)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27042 (_ BitVec 32)) Bool)

(assert (=> b!440325 (= res!260445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202583 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440325 (= lt!202583 (array!27043 (store (arr!12970 _keys!709) i!563 k0!794) (size!13322 _keys!709)))))

(declare-fun mapNonEmpty!19038 () Bool)

(declare-fun tp!36906 () Bool)

(declare-fun e!259433 () Bool)

(assert (=> mapNonEmpty!19038 (= mapRes!19038 (and tp!36906 e!259433))))

(declare-datatypes ((V!16587 0))(
  ( (V!16588 (val!5850 Int)) )
))
(declare-datatypes ((ValueCell!5462 0))(
  ( (ValueCellFull!5462 (v!8098 V!16587)) (EmptyCell!5462) )
))
(declare-fun mapRest!19038 () (Array (_ BitVec 32) ValueCell!5462))

(declare-datatypes ((array!27044 0))(
  ( (array!27045 (arr!12971 (Array (_ BitVec 32) ValueCell!5462)) (size!13323 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27044)

(declare-fun mapKey!19038 () (_ BitVec 32))

(declare-fun mapValue!19038 () ValueCell!5462)

(assert (=> mapNonEmpty!19038 (= (arr!12971 _values!549) (store mapRest!19038 mapKey!19038 mapValue!19038))))

(declare-fun b!440327 () Bool)

(assert (=> b!440327 (= e!259433 tp_is_empty!11611)))

(declare-fun b!440328 () Bool)

(declare-fun res!260447 () Bool)

(assert (=> b!440328 (=> (not res!260447) (not e!259435))))

(assert (=> b!440328 (= res!260447 (or (= (select (arr!12970 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12970 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440329 () Bool)

(declare-fun res!260444 () Bool)

(assert (=> b!440329 (=> (not res!260444) (not e!259435))))

(declare-datatypes ((List!7668 0))(
  ( (Nil!7665) (Cons!7664 (h!8520 (_ BitVec 64)) (t!13416 List!7668)) )
))
(declare-fun arrayNoDuplicates!0 (array!27042 (_ BitVec 32) List!7668) Bool)

(assert (=> b!440329 (= res!260444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7665))))

(declare-fun b!440330 () Bool)

(declare-fun res!260441 () Bool)

(assert (=> b!440330 (=> (not res!260441) (not e!259435))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440330 (= res!260441 (and (= (size!13323 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13322 _keys!709) (size!13323 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440331 () Bool)

(declare-fun res!260443 () Bool)

(assert (=> b!440331 (=> (not res!260443) (not e!259435))))

(assert (=> b!440331 (= res!260443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440332 () Bool)

(declare-fun res!260439 () Bool)

(assert (=> b!440332 (=> (not res!260439) (not e!259429))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440332 (= res!260439 (bvsle from!863 i!563))))

(declare-fun b!440333 () Bool)

(declare-fun e!259434 () Bool)

(assert (=> b!440333 (= e!259429 e!259434)))

(declare-fun res!260442 () Bool)

(assert (=> b!440333 (=> (not res!260442) (not e!259434))))

(assert (=> b!440333 (= res!260442 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16587)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7680 0))(
  ( (tuple2!7681 (_1!3851 (_ BitVec 64)) (_2!3851 V!16587)) )
))
(declare-datatypes ((List!7669 0))(
  ( (Nil!7666) (Cons!7665 (h!8521 tuple2!7680) (t!13417 List!7669)) )
))
(declare-datatypes ((ListLongMap!6595 0))(
  ( (ListLongMap!6596 (toList!3313 List!7669)) )
))
(declare-fun lt!202581 () ListLongMap!6595)

(declare-fun zeroValue!515 () V!16587)

(declare-fun lt!202584 () array!27044)

(declare-fun getCurrentListMapNoExtraKeys!1546 (array!27042 array!27044 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) Int) ListLongMap!6595)

(assert (=> b!440333 (= lt!202581 (getCurrentListMapNoExtraKeys!1546 lt!202583 lt!202584 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16587)

(assert (=> b!440333 (= lt!202584 (array!27045 (store (arr!12971 _values!549) i!563 (ValueCellFull!5462 v!412)) (size!13323 _values!549)))))

(declare-fun lt!202582 () ListLongMap!6595)

(assert (=> b!440333 (= lt!202582 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440334 () Bool)

(declare-fun res!260446 () Bool)

(assert (=> b!440334 (=> (not res!260446) (not e!259435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440334 (= res!260446 (validMask!0 mask!1025))))

(declare-fun b!440335 () Bool)

(assert (=> b!440335 (= e!259434 (not true))))

(declare-fun +!1506 (ListLongMap!6595 tuple2!7680) ListLongMap!6595)

(assert (=> b!440335 (= (getCurrentListMapNoExtraKeys!1546 lt!202583 lt!202584 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1506 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7681 k0!794 v!412)))))

(declare-datatypes ((Unit!13087 0))(
  ( (Unit!13088) )
))
(declare-fun lt!202580 () Unit!13087)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!666 (array!27042 array!27044 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) (_ BitVec 64) V!16587 (_ BitVec 32) Int) Unit!13087)

(assert (=> b!440335 (= lt!202580 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!666 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440336 () Bool)

(declare-fun res!260449 () Bool)

(assert (=> b!440336 (=> (not res!260449) (not e!259435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440336 (= res!260449 (validKeyInArray!0 k0!794))))

(declare-fun b!440337 () Bool)

(declare-fun res!260450 () Bool)

(assert (=> b!440337 (=> (not res!260450) (not e!259435))))

(assert (=> b!440337 (= res!260450 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13322 _keys!709))))))

(declare-fun b!440338 () Bool)

(declare-fun e!259430 () Bool)

(assert (=> b!440338 (= e!259430 (and e!259432 mapRes!19038))))

(declare-fun condMapEmpty!19038 () Bool)

(declare-fun mapDefault!19038 () ValueCell!5462)

(assert (=> b!440338 (= condMapEmpty!19038 (= (arr!12971 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5462)) mapDefault!19038)))))

(declare-fun b!440326 () Bool)

(declare-fun res!260451 () Bool)

(assert (=> b!440326 (=> (not res!260451) (not e!259429))))

(assert (=> b!440326 (= res!260451 (arrayNoDuplicates!0 lt!202583 #b00000000000000000000000000000000 Nil!7665))))

(declare-fun res!260440 () Bool)

(assert (=> start!40178 (=> (not res!260440) (not e!259435))))

(assert (=> start!40178 (= res!260440 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13322 _keys!709))))))

(assert (=> start!40178 e!259435))

(assert (=> start!40178 tp_is_empty!11611))

(assert (=> start!40178 tp!36905))

(assert (=> start!40178 true))

(declare-fun array_inv!9484 (array!27044) Bool)

(assert (=> start!40178 (and (array_inv!9484 _values!549) e!259430)))

(declare-fun array_inv!9485 (array!27042) Bool)

(assert (=> start!40178 (array_inv!9485 _keys!709)))

(assert (= (and start!40178 res!260440) b!440334))

(assert (= (and b!440334 res!260446) b!440330))

(assert (= (and b!440330 res!260441) b!440331))

(assert (= (and b!440331 res!260443) b!440329))

(assert (= (and b!440329 res!260444) b!440337))

(assert (= (and b!440337 res!260450) b!440336))

(assert (= (and b!440336 res!260449) b!440328))

(assert (= (and b!440328 res!260447) b!440323))

(assert (= (and b!440323 res!260448) b!440325))

(assert (= (and b!440325 res!260445) b!440326))

(assert (= (and b!440326 res!260451) b!440332))

(assert (= (and b!440332 res!260439) b!440333))

(assert (= (and b!440333 res!260442) b!440335))

(assert (= (and b!440338 condMapEmpty!19038) mapIsEmpty!19038))

(assert (= (and b!440338 (not condMapEmpty!19038)) mapNonEmpty!19038))

(get-info :version)

(assert (= (and mapNonEmpty!19038 ((_ is ValueCellFull!5462) mapValue!19038)) b!440327))

(assert (= (and b!440338 ((_ is ValueCellFull!5462) mapDefault!19038)) b!440324))

(assert (= start!40178 b!440338))

(declare-fun m!427649 () Bool)

(assert (=> b!440336 m!427649))

(declare-fun m!427651 () Bool)

(assert (=> b!440331 m!427651))

(declare-fun m!427653 () Bool)

(assert (=> b!440334 m!427653))

(declare-fun m!427655 () Bool)

(assert (=> mapNonEmpty!19038 m!427655))

(declare-fun m!427657 () Bool)

(assert (=> b!440329 m!427657))

(declare-fun m!427659 () Bool)

(assert (=> start!40178 m!427659))

(declare-fun m!427661 () Bool)

(assert (=> start!40178 m!427661))

(declare-fun m!427663 () Bool)

(assert (=> b!440323 m!427663))

(declare-fun m!427665 () Bool)

(assert (=> b!440328 m!427665))

(declare-fun m!427667 () Bool)

(assert (=> b!440333 m!427667))

(declare-fun m!427669 () Bool)

(assert (=> b!440333 m!427669))

(declare-fun m!427671 () Bool)

(assert (=> b!440333 m!427671))

(declare-fun m!427673 () Bool)

(assert (=> b!440326 m!427673))

(declare-fun m!427675 () Bool)

(assert (=> b!440325 m!427675))

(declare-fun m!427677 () Bool)

(assert (=> b!440325 m!427677))

(declare-fun m!427679 () Bool)

(assert (=> b!440335 m!427679))

(declare-fun m!427681 () Bool)

(assert (=> b!440335 m!427681))

(assert (=> b!440335 m!427681))

(declare-fun m!427683 () Bool)

(assert (=> b!440335 m!427683))

(declare-fun m!427685 () Bool)

(assert (=> b!440335 m!427685))

(check-sat (not b!440334) b_and!18441 (not b_next!10459) (not b!440335) (not b!440333) (not mapNonEmpty!19038) (not start!40178) tp_is_empty!11611 (not b!440329) (not b!440336) (not b!440331) (not b!440323) (not b!440325) (not b!440326))
(check-sat b_and!18441 (not b_next!10459))
