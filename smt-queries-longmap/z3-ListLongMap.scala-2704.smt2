; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40044 () Bool)

(assert start!40044)

(declare-fun b_free!10311 () Bool)

(declare-fun b_next!10311 () Bool)

(assert (=> start!40044 (= b_free!10311 (not b_next!10311))))

(declare-fun tp!36462 () Bool)

(declare-fun b_and!18279 () Bool)

(assert (=> start!40044 (= tp!36462 b_and!18279)))

(declare-fun b!436820 () Bool)

(declare-fun res!257563 () Bool)

(declare-fun e!257912 () Bool)

(assert (=> b!436820 (=> (not res!257563) (not e!257912))))

(declare-datatypes ((array!26749 0))(
  ( (array!26750 (arr!12824 (Array (_ BitVec 32) (_ BitVec 64))) (size!13176 (_ BitVec 32))) )
))
(declare-fun lt!201454 () array!26749)

(declare-datatypes ((List!7654 0))(
  ( (Nil!7651) (Cons!7650 (h!8506 (_ BitVec 64)) (t!13410 List!7654)) )
))
(declare-fun arrayNoDuplicates!0 (array!26749 (_ BitVec 32) List!7654) Bool)

(assert (=> b!436820 (= res!257563 (arrayNoDuplicates!0 lt!201454 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun mapIsEmpty!18816 () Bool)

(declare-fun mapRes!18816 () Bool)

(assert (=> mapIsEmpty!18816 mapRes!18816))

(declare-fun b!436821 () Bool)

(declare-fun res!257564 () Bool)

(declare-fun e!257913 () Bool)

(assert (=> b!436821 (=> (not res!257564) (not e!257913))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!26749)

(assert (=> b!436821 (= res!257564 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13176 _keys!709))))))

(declare-fun b!436822 () Bool)

(declare-fun e!257908 () Bool)

(assert (=> b!436822 (= e!257908 (not true))))

(declare-datatypes ((V!16389 0))(
  ( (V!16390 (val!5776 Int)) )
))
(declare-fun minValue!515 () V!16389)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5388 0))(
  ( (ValueCellFull!5388 (v!8023 V!16389)) (EmptyCell!5388) )
))
(declare-datatypes ((array!26751 0))(
  ( (array!26752 (arr!12825 (Array (_ BitVec 32) ValueCell!5388)) (size!13177 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26751)

(declare-fun zeroValue!515 () V!16389)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201452 () array!26751)

(declare-fun v!412 () V!16389)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7656 0))(
  ( (tuple2!7657 (_1!3839 (_ BitVec 64)) (_2!3839 V!16389)) )
))
(declare-datatypes ((List!7655 0))(
  ( (Nil!7652) (Cons!7651 (h!8507 tuple2!7656) (t!13411 List!7655)) )
))
(declare-datatypes ((ListLongMap!6569 0))(
  ( (ListLongMap!6570 (toList!3300 List!7655)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1489 (array!26749 array!26751 (_ BitVec 32) (_ BitVec 32) V!16389 V!16389 (_ BitVec 32) Int) ListLongMap!6569)

(declare-fun +!1447 (ListLongMap!6569 tuple2!7656) ListLongMap!6569)

(assert (=> b!436822 (= (getCurrentListMapNoExtraKeys!1489 lt!201454 lt!201452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1447 (getCurrentListMapNoExtraKeys!1489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7657 k0!794 v!412)))))

(declare-datatypes ((Unit!12998 0))(
  ( (Unit!12999) )
))
(declare-fun lt!201453 () Unit!12998)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!616 (array!26749 array!26751 (_ BitVec 32) (_ BitVec 32) V!16389 V!16389 (_ BitVec 32) (_ BitVec 64) V!16389 (_ BitVec 32) Int) Unit!12998)

(assert (=> b!436822 (= lt!201453 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!616 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436823 () Bool)

(declare-fun res!257558 () Bool)

(assert (=> b!436823 (=> (not res!257558) (not e!257913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436823 (= res!257558 (validKeyInArray!0 k0!794))))

(declare-fun res!257562 () Bool)

(assert (=> start!40044 (=> (not res!257562) (not e!257913))))

(assert (=> start!40044 (= res!257562 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13176 _keys!709))))))

(assert (=> start!40044 e!257913))

(declare-fun tp_is_empty!11463 () Bool)

(assert (=> start!40044 tp_is_empty!11463))

(assert (=> start!40044 tp!36462))

(assert (=> start!40044 true))

(declare-fun e!257907 () Bool)

(declare-fun array_inv!9316 (array!26751) Bool)

(assert (=> start!40044 (and (array_inv!9316 _values!549) e!257907)))

(declare-fun array_inv!9317 (array!26749) Bool)

(assert (=> start!40044 (array_inv!9317 _keys!709)))

(declare-fun b!436824 () Bool)

(declare-fun e!257910 () Bool)

(assert (=> b!436824 (= e!257907 (and e!257910 mapRes!18816))))

(declare-fun condMapEmpty!18816 () Bool)

(declare-fun mapDefault!18816 () ValueCell!5388)

(assert (=> b!436824 (= condMapEmpty!18816 (= (arr!12825 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5388)) mapDefault!18816)))))

(declare-fun b!436825 () Bool)

(declare-fun res!257559 () Bool)

(assert (=> b!436825 (=> (not res!257559) (not e!257913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26749 (_ BitVec 32)) Bool)

(assert (=> b!436825 (= res!257559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436826 () Bool)

(assert (=> b!436826 (= e!257913 e!257912)))

(declare-fun res!257565 () Bool)

(assert (=> b!436826 (=> (not res!257565) (not e!257912))))

(assert (=> b!436826 (= res!257565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201454 mask!1025))))

(assert (=> b!436826 (= lt!201454 (array!26750 (store (arr!12824 _keys!709) i!563 k0!794) (size!13176 _keys!709)))))

(declare-fun b!436827 () Bool)

(assert (=> b!436827 (= e!257910 tp_is_empty!11463)))

(declare-fun b!436828 () Bool)

(declare-fun res!257560 () Bool)

(assert (=> b!436828 (=> (not res!257560) (not e!257913))))

(assert (=> b!436828 (= res!257560 (and (= (size!13177 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13176 _keys!709) (size!13177 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18816 () Bool)

(declare-fun tp!36461 () Bool)

(declare-fun e!257909 () Bool)

(assert (=> mapNonEmpty!18816 (= mapRes!18816 (and tp!36461 e!257909))))

(declare-fun mapRest!18816 () (Array (_ BitVec 32) ValueCell!5388))

(declare-fun mapKey!18816 () (_ BitVec 32))

(declare-fun mapValue!18816 () ValueCell!5388)

(assert (=> mapNonEmpty!18816 (= (arr!12825 _values!549) (store mapRest!18816 mapKey!18816 mapValue!18816))))

(declare-fun b!436829 () Bool)

(declare-fun res!257561 () Bool)

(assert (=> b!436829 (=> (not res!257561) (not e!257912))))

(assert (=> b!436829 (= res!257561 (bvsle from!863 i!563))))

(declare-fun b!436830 () Bool)

(declare-fun res!257557 () Bool)

(assert (=> b!436830 (=> (not res!257557) (not e!257913))))

(assert (=> b!436830 (= res!257557 (or (= (select (arr!12824 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12824 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436831 () Bool)

(assert (=> b!436831 (= e!257909 tp_is_empty!11463)))

(declare-fun b!436832 () Bool)

(declare-fun res!257556 () Bool)

(assert (=> b!436832 (=> (not res!257556) (not e!257913))))

(assert (=> b!436832 (= res!257556 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun b!436833 () Bool)

(assert (=> b!436833 (= e!257912 e!257908)))

(declare-fun res!257566 () Bool)

(assert (=> b!436833 (=> (not res!257566) (not e!257908))))

(assert (=> b!436833 (= res!257566 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201451 () ListLongMap!6569)

(assert (=> b!436833 (= lt!201451 (getCurrentListMapNoExtraKeys!1489 lt!201454 lt!201452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436833 (= lt!201452 (array!26752 (store (arr!12825 _values!549) i!563 (ValueCellFull!5388 v!412)) (size!13177 _values!549)))))

(declare-fun lt!201455 () ListLongMap!6569)

(assert (=> b!436833 (= lt!201455 (getCurrentListMapNoExtraKeys!1489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436834 () Bool)

(declare-fun res!257567 () Bool)

(assert (=> b!436834 (=> (not res!257567) (not e!257913))))

(declare-fun arrayContainsKey!0 (array!26749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436834 (= res!257567 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436835 () Bool)

(declare-fun res!257568 () Bool)

(assert (=> b!436835 (=> (not res!257568) (not e!257913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436835 (= res!257568 (validMask!0 mask!1025))))

(assert (= (and start!40044 res!257562) b!436835))

(assert (= (and b!436835 res!257568) b!436828))

(assert (= (and b!436828 res!257560) b!436825))

(assert (= (and b!436825 res!257559) b!436832))

(assert (= (and b!436832 res!257556) b!436821))

(assert (= (and b!436821 res!257564) b!436823))

(assert (= (and b!436823 res!257558) b!436830))

(assert (= (and b!436830 res!257557) b!436834))

(assert (= (and b!436834 res!257567) b!436826))

(assert (= (and b!436826 res!257565) b!436820))

(assert (= (and b!436820 res!257563) b!436829))

(assert (= (and b!436829 res!257561) b!436833))

(assert (= (and b!436833 res!257566) b!436822))

(assert (= (and b!436824 condMapEmpty!18816) mapIsEmpty!18816))

(assert (= (and b!436824 (not condMapEmpty!18816)) mapNonEmpty!18816))

(get-info :version)

(assert (= (and mapNonEmpty!18816 ((_ is ValueCellFull!5388) mapValue!18816)) b!436831))

(assert (= (and b!436824 ((_ is ValueCellFull!5388) mapDefault!18816)) b!436827))

(assert (= start!40044 b!436824))

(declare-fun m!424619 () Bool)

(assert (=> b!436830 m!424619))

(declare-fun m!424621 () Bool)

(assert (=> b!436820 m!424621))

(declare-fun m!424623 () Bool)

(assert (=> b!436825 m!424623))

(declare-fun m!424625 () Bool)

(assert (=> b!436835 m!424625))

(declare-fun m!424627 () Bool)

(assert (=> b!436834 m!424627))

(declare-fun m!424629 () Bool)

(assert (=> mapNonEmpty!18816 m!424629))

(declare-fun m!424631 () Bool)

(assert (=> b!436832 m!424631))

(declare-fun m!424633 () Bool)

(assert (=> b!436833 m!424633))

(declare-fun m!424635 () Bool)

(assert (=> b!436833 m!424635))

(declare-fun m!424637 () Bool)

(assert (=> b!436833 m!424637))

(declare-fun m!424639 () Bool)

(assert (=> b!436823 m!424639))

(declare-fun m!424641 () Bool)

(assert (=> b!436826 m!424641))

(declare-fun m!424643 () Bool)

(assert (=> b!436826 m!424643))

(declare-fun m!424645 () Bool)

(assert (=> start!40044 m!424645))

(declare-fun m!424647 () Bool)

(assert (=> start!40044 m!424647))

(declare-fun m!424649 () Bool)

(assert (=> b!436822 m!424649))

(declare-fun m!424651 () Bool)

(assert (=> b!436822 m!424651))

(assert (=> b!436822 m!424651))

(declare-fun m!424653 () Bool)

(assert (=> b!436822 m!424653))

(declare-fun m!424655 () Bool)

(assert (=> b!436822 m!424655))

(check-sat (not b!436820) (not b!436835) tp_is_empty!11463 b_and!18279 (not b_next!10311) (not start!40044) (not b!436832) (not b!436822) (not b!436834) (not b!436823) (not b!436826) (not b!436833) (not b!436825) (not mapNonEmpty!18816))
(check-sat b_and!18279 (not b_next!10311))
