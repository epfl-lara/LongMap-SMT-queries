; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40200 () Bool)

(assert start!40200)

(declare-fun b_free!10467 () Bool)

(declare-fun b_next!10467 () Bool)

(assert (=> start!40200 (= b_free!10467 (not b_next!10467))))

(declare-fun tp!36929 () Bool)

(declare-fun b_and!18435 () Bool)

(assert (=> start!40200 (= tp!36929 b_and!18435)))

(declare-fun b!440564 () Bool)

(declare-fun res!260601 () Bool)

(declare-fun e!259545 () Bool)

(assert (=> b!440564 (=> (not res!260601) (not e!259545))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440564 (= res!260601 (validKeyInArray!0 k0!794))))

(declare-fun b!440565 () Bool)

(declare-fun e!259546 () Bool)

(declare-fun tp_is_empty!11619 () Bool)

(assert (=> b!440565 (= e!259546 tp_is_empty!11619)))

(declare-fun b!440566 () Bool)

(declare-fun res!260603 () Bool)

(assert (=> b!440566 (=> (not res!260603) (not e!259545))))

(declare-datatypes ((array!27051 0))(
  ( (array!27052 (arr!12975 (Array (_ BitVec 32) (_ BitVec 64))) (size!13327 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27051)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440566 (= res!260603 (or (= (select (arr!12975 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12975 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19050 () Bool)

(declare-fun mapRes!19050 () Bool)

(assert (=> mapIsEmpty!19050 mapRes!19050))

(declare-fun b!440567 () Bool)

(declare-fun res!260604 () Bool)

(assert (=> b!440567 (=> (not res!260604) (not e!259545))))

(assert (=> b!440567 (= res!260604 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13327 _keys!709))))))

(declare-fun b!440568 () Bool)

(declare-fun e!259548 () Bool)

(assert (=> b!440568 (= e!259548 (not true))))

(declare-datatypes ((V!16597 0))(
  ( (V!16598 (val!5854 Int)) )
))
(declare-datatypes ((ValueCell!5466 0))(
  ( (ValueCellFull!5466 (v!8101 V!16597)) (EmptyCell!5466) )
))
(declare-datatypes ((array!27053 0))(
  ( (array!27054 (arr!12976 (Array (_ BitVec 32) ValueCell!5466)) (size!13328 (_ BitVec 32))) )
))
(declare-fun lt!202625 () array!27053)

(declare-fun minValue!515 () V!16597)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun _values!549 () array!27053)

(declare-fun zeroValue!515 () V!16597)

(declare-fun lt!202624 () array!27051)

(declare-fun v!412 () V!16597)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7782 0))(
  ( (tuple2!7783 (_1!3902 (_ BitVec 64)) (_2!3902 V!16597)) )
))
(declare-datatypes ((List!7779 0))(
  ( (Nil!7776) (Cons!7775 (h!8631 tuple2!7782) (t!13535 List!7779)) )
))
(declare-datatypes ((ListLongMap!6695 0))(
  ( (ListLongMap!6696 (toList!3363 List!7779)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1552 (array!27051 array!27053 (_ BitVec 32) (_ BitVec 32) V!16597 V!16597 (_ BitVec 32) Int) ListLongMap!6695)

(declare-fun +!1500 (ListLongMap!6695 tuple2!7782) ListLongMap!6695)

(assert (=> b!440568 (= (getCurrentListMapNoExtraKeys!1552 lt!202624 lt!202625 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1500 (getCurrentListMapNoExtraKeys!1552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7783 k0!794 v!412)))))

(declare-datatypes ((Unit!13104 0))(
  ( (Unit!13105) )
))
(declare-fun lt!202622 () Unit!13104)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!669 (array!27051 array!27053 (_ BitVec 32) (_ BitVec 32) V!16597 V!16597 (_ BitVec 32) (_ BitVec 64) V!16597 (_ BitVec 32) Int) Unit!13104)

(assert (=> b!440568 (= lt!202622 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!669 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440569 () Bool)

(declare-fun res!260598 () Bool)

(assert (=> b!440569 (=> (not res!260598) (not e!259545))))

(declare-datatypes ((List!7780 0))(
  ( (Nil!7777) (Cons!7776 (h!8632 (_ BitVec 64)) (t!13536 List!7780)) )
))
(declare-fun arrayNoDuplicates!0 (array!27051 (_ BitVec 32) List!7780) Bool)

(assert (=> b!440569 (= res!260598 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7777))))

(declare-fun b!440570 () Bool)

(declare-fun res!260608 () Bool)

(assert (=> b!440570 (=> (not res!260608) (not e!259545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440570 (= res!260608 (validMask!0 mask!1025))))

(declare-fun b!440571 () Bool)

(declare-fun res!260602 () Bool)

(assert (=> b!440571 (=> (not res!260602) (not e!259545))))

(assert (=> b!440571 (= res!260602 (and (= (size!13328 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13327 _keys!709) (size!13328 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!260609 () Bool)

(assert (=> start!40200 (=> (not res!260609) (not e!259545))))

(assert (=> start!40200 (= res!260609 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13327 _keys!709))))))

(assert (=> start!40200 e!259545))

(assert (=> start!40200 tp_is_empty!11619))

(assert (=> start!40200 tp!36929))

(assert (=> start!40200 true))

(declare-fun e!259550 () Bool)

(declare-fun array_inv!9418 (array!27053) Bool)

(assert (=> start!40200 (and (array_inv!9418 _values!549) e!259550)))

(declare-fun array_inv!9419 (array!27051) Bool)

(assert (=> start!40200 (array_inv!9419 _keys!709)))

(declare-fun b!440572 () Bool)

(declare-fun e!259551 () Bool)

(assert (=> b!440572 (= e!259551 e!259548)))

(declare-fun res!260607 () Bool)

(assert (=> b!440572 (=> (not res!260607) (not e!259548))))

(assert (=> b!440572 (= res!260607 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202621 () ListLongMap!6695)

(assert (=> b!440572 (= lt!202621 (getCurrentListMapNoExtraKeys!1552 lt!202624 lt!202625 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440572 (= lt!202625 (array!27054 (store (arr!12976 _values!549) i!563 (ValueCellFull!5466 v!412)) (size!13328 _values!549)))))

(declare-fun lt!202623 () ListLongMap!6695)

(assert (=> b!440572 (= lt!202623 (getCurrentListMapNoExtraKeys!1552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440573 () Bool)

(declare-fun e!259549 () Bool)

(assert (=> b!440573 (= e!259550 (and e!259549 mapRes!19050))))

(declare-fun condMapEmpty!19050 () Bool)

(declare-fun mapDefault!19050 () ValueCell!5466)

(assert (=> b!440573 (= condMapEmpty!19050 (= (arr!12976 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5466)) mapDefault!19050)))))

(declare-fun b!440574 () Bool)

(declare-fun res!260600 () Bool)

(assert (=> b!440574 (=> (not res!260600) (not e!259551))))

(assert (=> b!440574 (= res!260600 (arrayNoDuplicates!0 lt!202624 #b00000000000000000000000000000000 Nil!7777))))

(declare-fun b!440575 () Bool)

(declare-fun res!260605 () Bool)

(assert (=> b!440575 (=> (not res!260605) (not e!259545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27051 (_ BitVec 32)) Bool)

(assert (=> b!440575 (= res!260605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440576 () Bool)

(declare-fun res!260610 () Bool)

(assert (=> b!440576 (=> (not res!260610) (not e!259545))))

(declare-fun arrayContainsKey!0 (array!27051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440576 (= res!260610 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440577 () Bool)

(assert (=> b!440577 (= e!259549 tp_is_empty!11619)))

(declare-fun mapNonEmpty!19050 () Bool)

(declare-fun tp!36930 () Bool)

(assert (=> mapNonEmpty!19050 (= mapRes!19050 (and tp!36930 e!259546))))

(declare-fun mapRest!19050 () (Array (_ BitVec 32) ValueCell!5466))

(declare-fun mapKey!19050 () (_ BitVec 32))

(declare-fun mapValue!19050 () ValueCell!5466)

(assert (=> mapNonEmpty!19050 (= (arr!12976 _values!549) (store mapRest!19050 mapKey!19050 mapValue!19050))))

(declare-fun b!440578 () Bool)

(declare-fun res!260599 () Bool)

(assert (=> b!440578 (=> (not res!260599) (not e!259551))))

(assert (=> b!440578 (= res!260599 (bvsle from!863 i!563))))

(declare-fun b!440579 () Bool)

(assert (=> b!440579 (= e!259545 e!259551)))

(declare-fun res!260606 () Bool)

(assert (=> b!440579 (=> (not res!260606) (not e!259551))))

(assert (=> b!440579 (= res!260606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202624 mask!1025))))

(assert (=> b!440579 (= lt!202624 (array!27052 (store (arr!12975 _keys!709) i!563 k0!794) (size!13327 _keys!709)))))

(assert (= (and start!40200 res!260609) b!440570))

(assert (= (and b!440570 res!260608) b!440571))

(assert (= (and b!440571 res!260602) b!440575))

(assert (= (and b!440575 res!260605) b!440569))

(assert (= (and b!440569 res!260598) b!440567))

(assert (= (and b!440567 res!260604) b!440564))

(assert (= (and b!440564 res!260601) b!440566))

(assert (= (and b!440566 res!260603) b!440576))

(assert (= (and b!440576 res!260610) b!440579))

(assert (= (and b!440579 res!260606) b!440574))

(assert (= (and b!440574 res!260600) b!440578))

(assert (= (and b!440578 res!260599) b!440572))

(assert (= (and b!440572 res!260607) b!440568))

(assert (= (and b!440573 condMapEmpty!19050) mapIsEmpty!19050))

(assert (= (and b!440573 (not condMapEmpty!19050)) mapNonEmpty!19050))

(get-info :version)

(assert (= (and mapNonEmpty!19050 ((_ is ValueCellFull!5466) mapValue!19050)) b!440565))

(assert (= (and b!440573 ((_ is ValueCellFull!5466) mapDefault!19050)) b!440577))

(assert (= start!40200 b!440573))

(declare-fun m!427583 () Bool)

(assert (=> b!440570 m!427583))

(declare-fun m!427585 () Bool)

(assert (=> start!40200 m!427585))

(declare-fun m!427587 () Bool)

(assert (=> start!40200 m!427587))

(declare-fun m!427589 () Bool)

(assert (=> b!440566 m!427589))

(declare-fun m!427591 () Bool)

(assert (=> b!440576 m!427591))

(declare-fun m!427593 () Bool)

(assert (=> b!440575 m!427593))

(declare-fun m!427595 () Bool)

(assert (=> b!440568 m!427595))

(declare-fun m!427597 () Bool)

(assert (=> b!440568 m!427597))

(assert (=> b!440568 m!427597))

(declare-fun m!427599 () Bool)

(assert (=> b!440568 m!427599))

(declare-fun m!427601 () Bool)

(assert (=> b!440568 m!427601))

(declare-fun m!427603 () Bool)

(assert (=> b!440579 m!427603))

(declare-fun m!427605 () Bool)

(assert (=> b!440579 m!427605))

(declare-fun m!427607 () Bool)

(assert (=> b!440574 m!427607))

(declare-fun m!427609 () Bool)

(assert (=> mapNonEmpty!19050 m!427609))

(declare-fun m!427611 () Bool)

(assert (=> b!440572 m!427611))

(declare-fun m!427613 () Bool)

(assert (=> b!440572 m!427613))

(declare-fun m!427615 () Bool)

(assert (=> b!440572 m!427615))

(declare-fun m!427617 () Bool)

(assert (=> b!440564 m!427617))

(declare-fun m!427619 () Bool)

(assert (=> b!440569 m!427619))

(check-sat b_and!18435 (not b!440569) (not b_next!10467) (not b!440576) (not b!440575) (not b!440579) tp_is_empty!11619 (not b!440564) (not b!440570) (not b!440572) (not b!440568) (not mapNonEmpty!19050) (not start!40200) (not b!440574))
(check-sat b_and!18435 (not b_next!10467))
