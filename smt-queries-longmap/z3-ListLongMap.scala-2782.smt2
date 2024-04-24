; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40566 () Bool)

(assert start!40566)

(declare-fun b_free!10591 () Bool)

(declare-fun b_next!10591 () Bool)

(assert (=> start!40566 (= b_free!10591 (not b_next!10591))))

(declare-fun tp!37593 () Bool)

(declare-fun b_and!18613 () Bool)

(assert (=> start!40566 (= tp!37593 b_and!18613)))

(declare-fun mapNonEmpty!19527 () Bool)

(declare-fun mapRes!19527 () Bool)

(declare-fun tp!37592 () Bool)

(declare-fun e!262708 () Bool)

(assert (=> mapNonEmpty!19527 (= mapRes!19527 (and tp!37592 e!262708))))

(declare-datatypes ((V!17011 0))(
  ( (V!17012 (val!6009 Int)) )
))
(declare-datatypes ((ValueCell!5621 0))(
  ( (ValueCellFull!5621 (v!8265 V!17011)) (EmptyCell!5621) )
))
(declare-datatypes ((array!27666 0))(
  ( (array!27667 (arr!13278 (Array (_ BitVec 32) ValueCell!5621)) (size!13630 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27666)

(declare-fun mapValue!19527 () ValueCell!5621)

(declare-fun mapRest!19527 () (Array (_ BitVec 32) ValueCell!5621))

(declare-fun mapKey!19527 () (_ BitVec 32))

(assert (=> mapNonEmpty!19527 (= (arr!13278 _values!549) (store mapRest!19527 mapKey!19527 mapValue!19527))))

(declare-fun b!447418 () Bool)

(declare-fun e!262705 () Bool)

(assert (=> b!447418 (= e!262705 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17011)

(declare-datatypes ((tuple2!7788 0))(
  ( (tuple2!7789 (_1!3905 (_ BitVec 64)) (_2!3905 V!17011)) )
))
(declare-datatypes ((List!7859 0))(
  ( (Nil!7856) (Cons!7855 (h!8711 tuple2!7788) (t!13613 List!7859)) )
))
(declare-datatypes ((ListLongMap!6703 0))(
  ( (ListLongMap!6704 (toList!3367 List!7859)) )
))
(declare-fun lt!203991 () ListLongMap!6703)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17011)

(declare-datatypes ((array!27668 0))(
  ( (array!27669 (arr!13279 (Array (_ BitVec 32) (_ BitVec 64))) (size!13631 (_ BitVec 32))) )
))
(declare-fun lt!203992 () array!27668)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1597 (array!27668 array!27666 (_ BitVec 32) (_ BitVec 32) V!17011 V!17011 (_ BitVec 32) Int) ListLongMap!6703)

(assert (=> b!447418 (= lt!203991 (getCurrentListMapNoExtraKeys!1597 lt!203992 (array!27667 (store (arr!13278 _values!549) i!563 (ValueCellFull!5621 v!412)) (size!13630 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203990 () ListLongMap!6703)

(declare-fun _keys!709 () array!27668)

(assert (=> b!447418 (= lt!203990 (getCurrentListMapNoExtraKeys!1597 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447419 () Bool)

(declare-fun tp_is_empty!11929 () Bool)

(assert (=> b!447419 (= e!262708 tp_is_empty!11929)))

(declare-fun mapIsEmpty!19527 () Bool)

(assert (=> mapIsEmpty!19527 mapRes!19527))

(declare-fun b!447420 () Bool)

(declare-fun res!265758 () Bool)

(assert (=> b!447420 (=> (not res!265758) (not e!262705))))

(assert (=> b!447420 (= res!265758 (bvsle from!863 i!563))))

(declare-fun res!265755 () Bool)

(declare-fun e!262710 () Bool)

(assert (=> start!40566 (=> (not res!265755) (not e!262710))))

(assert (=> start!40566 (= res!265755 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13631 _keys!709))))))

(assert (=> start!40566 e!262710))

(assert (=> start!40566 tp_is_empty!11929))

(assert (=> start!40566 tp!37593))

(assert (=> start!40566 true))

(declare-fun e!262707 () Bool)

(declare-fun array_inv!9704 (array!27666) Bool)

(assert (=> start!40566 (and (array_inv!9704 _values!549) e!262707)))

(declare-fun array_inv!9705 (array!27668) Bool)

(assert (=> start!40566 (array_inv!9705 _keys!709)))

(declare-fun b!447421 () Bool)

(declare-fun res!265761 () Bool)

(assert (=> b!447421 (=> (not res!265761) (not e!262710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27668 (_ BitVec 32)) Bool)

(assert (=> b!447421 (= res!265761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447422 () Bool)

(declare-fun res!265756 () Bool)

(assert (=> b!447422 (=> (not res!265756) (not e!262710))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447422 (= res!265756 (validKeyInArray!0 k0!794))))

(declare-fun b!447423 () Bool)

(declare-fun res!265754 () Bool)

(assert (=> b!447423 (=> (not res!265754) (not e!262710))))

(assert (=> b!447423 (= res!265754 (or (= (select (arr!13279 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13279 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447424 () Bool)

(assert (=> b!447424 (= e!262710 e!262705)))

(declare-fun res!265760 () Bool)

(assert (=> b!447424 (=> (not res!265760) (not e!262705))))

(assert (=> b!447424 (= res!265760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203992 mask!1025))))

(assert (=> b!447424 (= lt!203992 (array!27669 (store (arr!13279 _keys!709) i!563 k0!794) (size!13631 _keys!709)))))

(declare-fun b!447425 () Bool)

(declare-fun res!265763 () Bool)

(assert (=> b!447425 (=> (not res!265763) (not e!262710))))

(assert (=> b!447425 (= res!265763 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13631 _keys!709))))))

(declare-fun b!447426 () Bool)

(declare-fun e!262709 () Bool)

(assert (=> b!447426 (= e!262707 (and e!262709 mapRes!19527))))

(declare-fun condMapEmpty!19527 () Bool)

(declare-fun mapDefault!19527 () ValueCell!5621)

(assert (=> b!447426 (= condMapEmpty!19527 (= (arr!13278 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5621)) mapDefault!19527)))))

(declare-fun b!447427 () Bool)

(declare-fun res!265759 () Bool)

(assert (=> b!447427 (=> (not res!265759) (not e!262710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447427 (= res!265759 (validMask!0 mask!1025))))

(declare-fun b!447428 () Bool)

(declare-fun res!265757 () Bool)

(assert (=> b!447428 (=> (not res!265757) (not e!262710))))

(assert (=> b!447428 (= res!265757 (and (= (size!13630 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13631 _keys!709) (size!13630 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447429 () Bool)

(declare-fun res!265753 () Bool)

(assert (=> b!447429 (=> (not res!265753) (not e!262710))))

(declare-fun arrayContainsKey!0 (array!27668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447429 (= res!265753 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447430 () Bool)

(declare-fun res!265762 () Bool)

(assert (=> b!447430 (=> (not res!265762) (not e!262705))))

(declare-datatypes ((List!7860 0))(
  ( (Nil!7857) (Cons!7856 (h!8712 (_ BitVec 64)) (t!13614 List!7860)) )
))
(declare-fun arrayNoDuplicates!0 (array!27668 (_ BitVec 32) List!7860) Bool)

(assert (=> b!447430 (= res!265762 (arrayNoDuplicates!0 lt!203992 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun b!447431 () Bool)

(declare-fun res!265764 () Bool)

(assert (=> b!447431 (=> (not res!265764) (not e!262710))))

(assert (=> b!447431 (= res!265764 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun b!447432 () Bool)

(assert (=> b!447432 (= e!262709 tp_is_empty!11929)))

(assert (= (and start!40566 res!265755) b!447427))

(assert (= (and b!447427 res!265759) b!447428))

(assert (= (and b!447428 res!265757) b!447421))

(assert (= (and b!447421 res!265761) b!447431))

(assert (= (and b!447431 res!265764) b!447425))

(assert (= (and b!447425 res!265763) b!447422))

(assert (= (and b!447422 res!265756) b!447423))

(assert (= (and b!447423 res!265754) b!447429))

(assert (= (and b!447429 res!265753) b!447424))

(assert (= (and b!447424 res!265760) b!447430))

(assert (= (and b!447430 res!265762) b!447420))

(assert (= (and b!447420 res!265758) b!447418))

(assert (= (and b!447426 condMapEmpty!19527) mapIsEmpty!19527))

(assert (= (and b!447426 (not condMapEmpty!19527)) mapNonEmpty!19527))

(get-info :version)

(assert (= (and mapNonEmpty!19527 ((_ is ValueCellFull!5621) mapValue!19527)) b!447419))

(assert (= (and b!447426 ((_ is ValueCellFull!5621) mapDefault!19527)) b!447432))

(assert (= start!40566 b!447426))

(declare-fun m!432561 () Bool)

(assert (=> b!447423 m!432561))

(declare-fun m!432563 () Bool)

(assert (=> b!447418 m!432563))

(declare-fun m!432565 () Bool)

(assert (=> b!447418 m!432565))

(declare-fun m!432567 () Bool)

(assert (=> b!447418 m!432567))

(declare-fun m!432569 () Bool)

(assert (=> b!447424 m!432569))

(declare-fun m!432571 () Bool)

(assert (=> b!447424 m!432571))

(declare-fun m!432573 () Bool)

(assert (=> b!447429 m!432573))

(declare-fun m!432575 () Bool)

(assert (=> mapNonEmpty!19527 m!432575))

(declare-fun m!432577 () Bool)

(assert (=> b!447422 m!432577))

(declare-fun m!432579 () Bool)

(assert (=> b!447421 m!432579))

(declare-fun m!432581 () Bool)

(assert (=> b!447427 m!432581))

(declare-fun m!432583 () Bool)

(assert (=> start!40566 m!432583))

(declare-fun m!432585 () Bool)

(assert (=> start!40566 m!432585))

(declare-fun m!432587 () Bool)

(assert (=> b!447431 m!432587))

(declare-fun m!432589 () Bool)

(assert (=> b!447430 m!432589))

(check-sat (not b!447424) b_and!18613 (not mapNonEmpty!19527) (not b!447421) (not b!447427) (not b!447431) (not start!40566) (not b!447422) tp_is_empty!11929 (not b_next!10591) (not b!447418) (not b!447430) (not b!447429))
(check-sat b_and!18613 (not b_next!10591))
