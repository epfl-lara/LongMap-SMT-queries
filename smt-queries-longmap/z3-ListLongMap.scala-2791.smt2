; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40620 () Bool)

(assert start!40620)

(declare-fun b_free!10645 () Bool)

(declare-fun b_next!10645 () Bool)

(assert (=> start!40620 (= b_free!10645 (not b_next!10645))))

(declare-fun tp!37755 () Bool)

(declare-fun b_and!18667 () Bool)

(assert (=> start!40620 (= tp!37755 b_and!18667)))

(declare-fun b!448633 () Bool)

(declare-fun res!266725 () Bool)

(declare-fun e!263196 () Bool)

(assert (=> b!448633 (=> (not res!266725) (not e!263196))))

(declare-datatypes ((array!27770 0))(
  ( (array!27771 (arr!13330 (Array (_ BitVec 32) (_ BitVec 64))) (size!13682 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27770)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27770 (_ BitVec 32)) Bool)

(assert (=> b!448633 (= res!266725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!266731 () Bool)

(assert (=> start!40620 (=> (not res!266731) (not e!263196))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40620 (= res!266731 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13682 _keys!709))))))

(assert (=> start!40620 e!263196))

(declare-fun tp_is_empty!11983 () Bool)

(assert (=> start!40620 tp_is_empty!11983))

(assert (=> start!40620 tp!37755))

(assert (=> start!40620 true))

(declare-datatypes ((V!17083 0))(
  ( (V!17084 (val!6036 Int)) )
))
(declare-datatypes ((ValueCell!5648 0))(
  ( (ValueCellFull!5648 (v!8292 V!17083)) (EmptyCell!5648) )
))
(declare-datatypes ((array!27772 0))(
  ( (array!27773 (arr!13331 (Array (_ BitVec 32) ValueCell!5648)) (size!13683 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27772)

(declare-fun e!263195 () Bool)

(declare-fun array_inv!9740 (array!27772) Bool)

(assert (=> start!40620 (and (array_inv!9740 _values!549) e!263195)))

(declare-fun array_inv!9741 (array!27770) Bool)

(assert (=> start!40620 (array_inv!9741 _keys!709)))

(declare-fun mapNonEmpty!19608 () Bool)

(declare-fun mapRes!19608 () Bool)

(declare-fun tp!37754 () Bool)

(declare-fun e!263191 () Bool)

(assert (=> mapNonEmpty!19608 (= mapRes!19608 (and tp!37754 e!263191))))

(declare-fun mapRest!19608 () (Array (_ BitVec 32) ValueCell!5648))

(declare-fun mapValue!19608 () ValueCell!5648)

(declare-fun mapKey!19608 () (_ BitVec 32))

(assert (=> mapNonEmpty!19608 (= (arr!13331 _values!549) (store mapRest!19608 mapKey!19608 mapValue!19608))))

(declare-fun b!448634 () Bool)

(declare-fun res!266736 () Bool)

(assert (=> b!448634 (=> (not res!266736) (not e!263196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448634 (= res!266736 (validMask!0 mask!1025))))

(declare-fun b!448635 () Bool)

(declare-fun e!263194 () Bool)

(assert (=> b!448635 (= e!263194 false)))

(declare-fun minValue!515 () V!17083)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17083)

(declare-fun lt!204233 () array!27770)

(declare-fun v!412 () V!17083)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7826 0))(
  ( (tuple2!7827 (_1!3924 (_ BitVec 64)) (_2!3924 V!17083)) )
))
(declare-datatypes ((List!7899 0))(
  ( (Nil!7896) (Cons!7895 (h!8751 tuple2!7826) (t!13653 List!7899)) )
))
(declare-datatypes ((ListLongMap!6741 0))(
  ( (ListLongMap!6742 (toList!3386 List!7899)) )
))
(declare-fun lt!204235 () ListLongMap!6741)

(declare-fun getCurrentListMapNoExtraKeys!1616 (array!27770 array!27772 (_ BitVec 32) (_ BitVec 32) V!17083 V!17083 (_ BitVec 32) Int) ListLongMap!6741)

(assert (=> b!448635 (= lt!204235 (getCurrentListMapNoExtraKeys!1616 lt!204233 (array!27773 (store (arr!13331 _values!549) i!563 (ValueCellFull!5648 v!412)) (size!13683 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204234 () ListLongMap!6741)

(assert (=> b!448635 (= lt!204234 (getCurrentListMapNoExtraKeys!1616 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448636 () Bool)

(assert (=> b!448636 (= e!263196 e!263194)))

(declare-fun res!266728 () Bool)

(assert (=> b!448636 (=> (not res!266728) (not e!263194))))

(assert (=> b!448636 (= res!266728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204233 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!448636 (= lt!204233 (array!27771 (store (arr!13330 _keys!709) i!563 k0!794) (size!13682 _keys!709)))))

(declare-fun mapIsEmpty!19608 () Bool)

(assert (=> mapIsEmpty!19608 mapRes!19608))

(declare-fun b!448637 () Bool)

(declare-fun res!266735 () Bool)

(assert (=> b!448637 (=> (not res!266735) (not e!263194))))

(assert (=> b!448637 (= res!266735 (bvsle from!863 i!563))))

(declare-fun b!448638 () Bool)

(declare-fun res!266729 () Bool)

(assert (=> b!448638 (=> (not res!266729) (not e!263196))))

(assert (=> b!448638 (= res!266729 (or (= (select (arr!13330 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13330 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448639 () Bool)

(declare-fun e!263192 () Bool)

(assert (=> b!448639 (= e!263192 tp_is_empty!11983)))

(declare-fun b!448640 () Bool)

(declare-fun res!266733 () Bool)

(assert (=> b!448640 (=> (not res!266733) (not e!263196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448640 (= res!266733 (validKeyInArray!0 k0!794))))

(declare-fun b!448641 () Bool)

(declare-fun res!266727 () Bool)

(assert (=> b!448641 (=> (not res!266727) (not e!263196))))

(assert (=> b!448641 (= res!266727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13682 _keys!709))))))

(declare-fun b!448642 () Bool)

(assert (=> b!448642 (= e!263191 tp_is_empty!11983)))

(declare-fun b!448643 () Bool)

(declare-fun res!266726 () Bool)

(assert (=> b!448643 (=> (not res!266726) (not e!263196))))

(declare-datatypes ((List!7900 0))(
  ( (Nil!7897) (Cons!7896 (h!8752 (_ BitVec 64)) (t!13654 List!7900)) )
))
(declare-fun arrayNoDuplicates!0 (array!27770 (_ BitVec 32) List!7900) Bool)

(assert (=> b!448643 (= res!266726 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7897))))

(declare-fun b!448644 () Bool)

(assert (=> b!448644 (= e!263195 (and e!263192 mapRes!19608))))

(declare-fun condMapEmpty!19608 () Bool)

(declare-fun mapDefault!19608 () ValueCell!5648)

(assert (=> b!448644 (= condMapEmpty!19608 (= (arr!13331 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5648)) mapDefault!19608)))))

(declare-fun b!448645 () Bool)

(declare-fun res!266734 () Bool)

(assert (=> b!448645 (=> (not res!266734) (not e!263196))))

(declare-fun arrayContainsKey!0 (array!27770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448645 (= res!266734 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448646 () Bool)

(declare-fun res!266730 () Bool)

(assert (=> b!448646 (=> (not res!266730) (not e!263196))))

(assert (=> b!448646 (= res!266730 (and (= (size!13683 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13682 _keys!709) (size!13683 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448647 () Bool)

(declare-fun res!266732 () Bool)

(assert (=> b!448647 (=> (not res!266732) (not e!263194))))

(assert (=> b!448647 (= res!266732 (arrayNoDuplicates!0 lt!204233 #b00000000000000000000000000000000 Nil!7897))))

(assert (= (and start!40620 res!266731) b!448634))

(assert (= (and b!448634 res!266736) b!448646))

(assert (= (and b!448646 res!266730) b!448633))

(assert (= (and b!448633 res!266725) b!448643))

(assert (= (and b!448643 res!266726) b!448641))

(assert (= (and b!448641 res!266727) b!448640))

(assert (= (and b!448640 res!266733) b!448638))

(assert (= (and b!448638 res!266729) b!448645))

(assert (= (and b!448645 res!266734) b!448636))

(assert (= (and b!448636 res!266728) b!448647))

(assert (= (and b!448647 res!266732) b!448637))

(assert (= (and b!448637 res!266735) b!448635))

(assert (= (and b!448644 condMapEmpty!19608) mapIsEmpty!19608))

(assert (= (and b!448644 (not condMapEmpty!19608)) mapNonEmpty!19608))

(get-info :version)

(assert (= (and mapNonEmpty!19608 ((_ is ValueCellFull!5648) mapValue!19608)) b!448642))

(assert (= (and b!448644 ((_ is ValueCellFull!5648) mapDefault!19608)) b!448639))

(assert (= start!40620 b!448644))

(declare-fun m!433371 () Bool)

(assert (=> b!448640 m!433371))

(declare-fun m!433373 () Bool)

(assert (=> b!448633 m!433373))

(declare-fun m!433375 () Bool)

(assert (=> b!448636 m!433375))

(declare-fun m!433377 () Bool)

(assert (=> b!448636 m!433377))

(declare-fun m!433379 () Bool)

(assert (=> b!448638 m!433379))

(declare-fun m!433381 () Bool)

(assert (=> mapNonEmpty!19608 m!433381))

(declare-fun m!433383 () Bool)

(assert (=> b!448643 m!433383))

(declare-fun m!433385 () Bool)

(assert (=> b!448645 m!433385))

(declare-fun m!433387 () Bool)

(assert (=> b!448647 m!433387))

(declare-fun m!433389 () Bool)

(assert (=> b!448635 m!433389))

(declare-fun m!433391 () Bool)

(assert (=> b!448635 m!433391))

(declare-fun m!433393 () Bool)

(assert (=> b!448635 m!433393))

(declare-fun m!433395 () Bool)

(assert (=> b!448634 m!433395))

(declare-fun m!433397 () Bool)

(assert (=> start!40620 m!433397))

(declare-fun m!433399 () Bool)

(assert (=> start!40620 m!433399))

(check-sat (not b!448634) (not start!40620) (not b!448636) (not b!448635) b_and!18667 (not b!448647) (not b_next!10645) (not b!448645) tp_is_empty!11983 (not b!448633) (not b!448640) (not b!448643) (not mapNonEmpty!19608))
(check-sat b_and!18667 (not b_next!10645))
