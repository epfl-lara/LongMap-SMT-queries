; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40070 () Bool)

(assert start!40070)

(declare-fun b_free!10351 () Bool)

(declare-fun b_next!10351 () Bool)

(assert (=> start!40070 (= b_free!10351 (not b_next!10351))))

(declare-fun tp!36581 () Bool)

(declare-fun b_and!18333 () Bool)

(assert (=> start!40070 (= tp!36581 b_and!18333)))

(declare-fun b!437731 () Bool)

(declare-fun res!258337 () Bool)

(declare-fun e!258300 () Bool)

(assert (=> b!437731 (=> (not res!258337) (not e!258300))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437731 (= res!258337 (validMask!0 mask!1025))))

(declare-fun b!437732 () Bool)

(declare-fun e!258301 () Bool)

(declare-fun e!258296 () Bool)

(assert (=> b!437732 (= e!258301 e!258296)))

(declare-fun res!258341 () Bool)

(assert (=> b!437732 (=> (not res!258341) (not e!258296))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437732 (= res!258341 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16443 0))(
  ( (V!16444 (val!5796 Int)) )
))
(declare-fun minValue!515 () V!16443)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16443)

(declare-datatypes ((ValueCell!5408 0))(
  ( (ValueCellFull!5408 (v!8044 V!16443)) (EmptyCell!5408) )
))
(declare-datatypes ((array!26830 0))(
  ( (array!26831 (arr!12864 (Array (_ BitVec 32) ValueCell!5408)) (size!13216 (_ BitVec 32))) )
))
(declare-fun lt!201774 () array!26830)

(declare-datatypes ((tuple2!7590 0))(
  ( (tuple2!7591 (_1!3806 (_ BitVec 64)) (_2!3806 V!16443)) )
))
(declare-datatypes ((List!7578 0))(
  ( (Nil!7575) (Cons!7574 (h!8430 tuple2!7590) (t!13326 List!7578)) )
))
(declare-datatypes ((ListLongMap!6505 0))(
  ( (ListLongMap!6506 (toList!3268 List!7578)) )
))
(declare-fun lt!201770 () ListLongMap!6505)

(declare-datatypes ((array!26832 0))(
  ( (array!26833 (arr!12865 (Array (_ BitVec 32) (_ BitVec 64))) (size!13217 (_ BitVec 32))) )
))
(declare-fun lt!201773 () array!26832)

(declare-fun getCurrentListMapNoExtraKeys!1501 (array!26832 array!26830 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) Int) ListLongMap!6505)

(assert (=> b!437732 (= lt!201770 (getCurrentListMapNoExtraKeys!1501 lt!201773 lt!201774 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26830)

(declare-fun v!412 () V!16443)

(assert (=> b!437732 (= lt!201774 (array!26831 (store (arr!12864 _values!549) i!563 (ValueCellFull!5408 v!412)) (size!13216 _values!549)))))

(declare-fun _keys!709 () array!26832)

(declare-fun lt!201771 () ListLongMap!6505)

(assert (=> b!437732 (= lt!201771 (getCurrentListMapNoExtraKeys!1501 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437733 () Bool)

(declare-fun res!258340 () Bool)

(assert (=> b!437733 (=> (not res!258340) (not e!258300))))

(declare-datatypes ((List!7579 0))(
  ( (Nil!7576) (Cons!7575 (h!8431 (_ BitVec 64)) (t!13327 List!7579)) )
))
(declare-fun arrayNoDuplicates!0 (array!26832 (_ BitVec 32) List!7579) Bool)

(assert (=> b!437733 (= res!258340 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7576))))

(declare-fun b!437734 () Bool)

(declare-fun res!258342 () Bool)

(assert (=> b!437734 (=> (not res!258342) (not e!258300))))

(assert (=> b!437734 (= res!258342 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13217 _keys!709))))))

(declare-fun b!437735 () Bool)

(declare-fun res!258339 () Bool)

(assert (=> b!437735 (=> (not res!258339) (not e!258301))))

(assert (=> b!437735 (= res!258339 (arrayNoDuplicates!0 lt!201773 #b00000000000000000000000000000000 Nil!7576))))

(declare-fun mapIsEmpty!18876 () Bool)

(declare-fun mapRes!18876 () Bool)

(assert (=> mapIsEmpty!18876 mapRes!18876))

(declare-fun b!437736 () Bool)

(declare-fun res!258345 () Bool)

(assert (=> b!437736 (=> (not res!258345) (not e!258300))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437736 (= res!258345 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437737 () Bool)

(declare-fun e!258295 () Bool)

(declare-fun tp_is_empty!11503 () Bool)

(assert (=> b!437737 (= e!258295 tp_is_empty!11503)))

(declare-fun b!437738 () Bool)

(declare-fun res!258338 () Bool)

(assert (=> b!437738 (=> (not res!258338) (not e!258300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26832 (_ BitVec 32)) Bool)

(assert (=> b!437738 (= res!258338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437739 () Bool)

(declare-fun res!258335 () Bool)

(assert (=> b!437739 (=> (not res!258335) (not e!258301))))

(assert (=> b!437739 (= res!258335 (bvsle from!863 i!563))))

(declare-fun res!258344 () Bool)

(assert (=> start!40070 (=> (not res!258344) (not e!258300))))

(assert (=> start!40070 (= res!258344 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13217 _keys!709))))))

(assert (=> start!40070 e!258300))

(assert (=> start!40070 tp_is_empty!11503))

(assert (=> start!40070 tp!36581))

(assert (=> start!40070 true))

(declare-fun e!258299 () Bool)

(declare-fun array_inv!9408 (array!26830) Bool)

(assert (=> start!40070 (and (array_inv!9408 _values!549) e!258299)))

(declare-fun array_inv!9409 (array!26832) Bool)

(assert (=> start!40070 (array_inv!9409 _keys!709)))

(declare-fun b!437740 () Bool)

(declare-fun res!258333 () Bool)

(assert (=> b!437740 (=> (not res!258333) (not e!258300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437740 (= res!258333 (validKeyInArray!0 k0!794))))

(declare-fun b!437741 () Bool)

(declare-fun res!258343 () Bool)

(assert (=> b!437741 (=> (not res!258343) (not e!258300))))

(assert (=> b!437741 (= res!258343 (or (= (select (arr!12865 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12865 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437742 () Bool)

(assert (=> b!437742 (= e!258300 e!258301)))

(declare-fun res!258334 () Bool)

(assert (=> b!437742 (=> (not res!258334) (not e!258301))))

(assert (=> b!437742 (= res!258334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201773 mask!1025))))

(assert (=> b!437742 (= lt!201773 (array!26833 (store (arr!12865 _keys!709) i!563 k0!794) (size!13217 _keys!709)))))

(declare-fun b!437743 () Bool)

(declare-fun e!258297 () Bool)

(assert (=> b!437743 (= e!258297 tp_is_empty!11503)))

(declare-fun b!437744 () Bool)

(assert (=> b!437744 (= e!258296 (not true))))

(declare-fun +!1467 (ListLongMap!6505 tuple2!7590) ListLongMap!6505)

(assert (=> b!437744 (= (getCurrentListMapNoExtraKeys!1501 lt!201773 lt!201774 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1467 (getCurrentListMapNoExtraKeys!1501 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7591 k0!794 v!412)))))

(declare-datatypes ((Unit!13009 0))(
  ( (Unit!13010) )
))
(declare-fun lt!201772 () Unit!13009)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!627 (array!26832 array!26830 (_ BitVec 32) (_ BitVec 32) V!16443 V!16443 (_ BitVec 32) (_ BitVec 64) V!16443 (_ BitVec 32) Int) Unit!13009)

(assert (=> b!437744 (= lt!201772 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!627 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437745 () Bool)

(assert (=> b!437745 (= e!258299 (and e!258295 mapRes!18876))))

(declare-fun condMapEmpty!18876 () Bool)

(declare-fun mapDefault!18876 () ValueCell!5408)

(assert (=> b!437745 (= condMapEmpty!18876 (= (arr!12864 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5408)) mapDefault!18876)))))

(declare-fun mapNonEmpty!18876 () Bool)

(declare-fun tp!36582 () Bool)

(assert (=> mapNonEmpty!18876 (= mapRes!18876 (and tp!36582 e!258297))))

(declare-fun mapKey!18876 () (_ BitVec 32))

(declare-fun mapValue!18876 () ValueCell!5408)

(declare-fun mapRest!18876 () (Array (_ BitVec 32) ValueCell!5408))

(assert (=> mapNonEmpty!18876 (= (arr!12864 _values!549) (store mapRest!18876 mapKey!18876 mapValue!18876))))

(declare-fun b!437746 () Bool)

(declare-fun res!258336 () Bool)

(assert (=> b!437746 (=> (not res!258336) (not e!258300))))

(assert (=> b!437746 (= res!258336 (and (= (size!13216 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13217 _keys!709) (size!13216 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40070 res!258344) b!437731))

(assert (= (and b!437731 res!258337) b!437746))

(assert (= (and b!437746 res!258336) b!437738))

(assert (= (and b!437738 res!258338) b!437733))

(assert (= (and b!437733 res!258340) b!437734))

(assert (= (and b!437734 res!258342) b!437740))

(assert (= (and b!437740 res!258333) b!437741))

(assert (= (and b!437741 res!258343) b!437736))

(assert (= (and b!437736 res!258345) b!437742))

(assert (= (and b!437742 res!258334) b!437735))

(assert (= (and b!437735 res!258339) b!437739))

(assert (= (and b!437739 res!258335) b!437732))

(assert (= (and b!437732 res!258341) b!437744))

(assert (= (and b!437745 condMapEmpty!18876) mapIsEmpty!18876))

(assert (= (and b!437745 (not condMapEmpty!18876)) mapNonEmpty!18876))

(get-info :version)

(assert (= (and mapNonEmpty!18876 ((_ is ValueCellFull!5408) mapValue!18876)) b!437743))

(assert (= (and b!437745 ((_ is ValueCellFull!5408) mapDefault!18876)) b!437737))

(assert (= start!40070 b!437745))

(declare-fun m!425597 () Bool)

(assert (=> b!437738 m!425597))

(declare-fun m!425599 () Bool)

(assert (=> b!437744 m!425599))

(declare-fun m!425601 () Bool)

(assert (=> b!437744 m!425601))

(assert (=> b!437744 m!425601))

(declare-fun m!425603 () Bool)

(assert (=> b!437744 m!425603))

(declare-fun m!425605 () Bool)

(assert (=> b!437744 m!425605))

(declare-fun m!425607 () Bool)

(assert (=> b!437740 m!425607))

(declare-fun m!425609 () Bool)

(assert (=> b!437733 m!425609))

(declare-fun m!425611 () Bool)

(assert (=> b!437731 m!425611))

(declare-fun m!425613 () Bool)

(assert (=> b!437736 m!425613))

(declare-fun m!425615 () Bool)

(assert (=> b!437741 m!425615))

(declare-fun m!425617 () Bool)

(assert (=> b!437735 m!425617))

(declare-fun m!425619 () Bool)

(assert (=> b!437742 m!425619))

(declare-fun m!425621 () Bool)

(assert (=> b!437742 m!425621))

(declare-fun m!425623 () Bool)

(assert (=> start!40070 m!425623))

(declare-fun m!425625 () Bool)

(assert (=> start!40070 m!425625))

(declare-fun m!425627 () Bool)

(assert (=> b!437732 m!425627))

(declare-fun m!425629 () Bool)

(assert (=> b!437732 m!425629))

(declare-fun m!425631 () Bool)

(assert (=> b!437732 m!425631))

(declare-fun m!425633 () Bool)

(assert (=> mapNonEmpty!18876 m!425633))

(check-sat (not start!40070) (not b!437740) (not b!437732) (not b!437735) tp_is_empty!11503 (not b!437744) (not b!437742) (not b!437736) (not b_next!10351) (not b!437733) (not b!437731) (not b!437738) (not mapNonEmpty!18876) b_and!18333)
(check-sat b_and!18333 (not b_next!10351))
