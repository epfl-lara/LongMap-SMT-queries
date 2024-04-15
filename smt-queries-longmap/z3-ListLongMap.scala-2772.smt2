; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40470 () Bool)

(assert start!40470)

(declare-fun b_free!10555 () Bool)

(declare-fun b_next!10555 () Bool)

(assert (=> start!40470 (= b_free!10555 (not b_next!10555))))

(declare-fun tp!37443 () Bool)

(declare-fun b_and!18513 () Bool)

(assert (=> start!40470 (= tp!37443 b_and!18513)))

(declare-fun b!445638 () Bool)

(declare-fun res!264513 () Bool)

(declare-fun e!261854 () Bool)

(assert (=> b!445638 (=> (not res!264513) (not e!261854))))

(declare-datatypes ((array!27549 0))(
  ( (array!27550 (arr!13222 (Array (_ BitVec 32) (_ BitVec 64))) (size!13575 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27549)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445638 (= res!264513 (or (= (select (arr!13222 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13222 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!16931 0))(
  ( (V!16932 (val!5979 Int)) )
))
(declare-fun minValue!515 () V!16931)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5591 0))(
  ( (ValueCellFull!5591 (v!8224 V!16931)) (EmptyCell!5591) )
))
(declare-datatypes ((array!27551 0))(
  ( (array!27552 (arr!13223 (Array (_ BitVec 32) ValueCell!5591)) (size!13576 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27551)

(declare-fun bm!29593 () Bool)

(declare-fun zeroValue!515 () V!16931)

(declare-fun lt!203455 () array!27549)

(declare-fun c!55807 () Bool)

(declare-datatypes ((tuple2!7864 0))(
  ( (tuple2!7865 (_1!3943 (_ BitVec 64)) (_2!3943 V!16931)) )
))
(declare-datatypes ((List!7913 0))(
  ( (Nil!7910) (Cons!7909 (h!8765 tuple2!7864) (t!13662 List!7913)) )
))
(declare-datatypes ((ListLongMap!6767 0))(
  ( (ListLongMap!6768 (toList!3399 List!7913)) )
))
(declare-fun call!29596 () ListLongMap!6767)

(declare-fun v!412 () V!16931)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1598 (array!27549 array!27551 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) Int) ListLongMap!6767)

(assert (=> bm!29593 (= call!29596 (getCurrentListMapNoExtraKeys!1598 (ite c!55807 _keys!709 lt!203455) (ite c!55807 _values!549 (array!27552 (store (arr!13223 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13576 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445639 () Bool)

(declare-fun e!261849 () Bool)

(assert (=> b!445639 (= e!261849 (not (bvslt i!563 (size!13576 _values!549))))))

(declare-fun e!261851 () Bool)

(assert (=> b!445639 e!261851))

(assert (=> b!445639 (= c!55807 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13129 0))(
  ( (Unit!13130) )
))
(declare-fun lt!203456 () Unit!13129)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 (array!27549 array!27551 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) (_ BitVec 64) V!16931 (_ BitVec 32) Int) Unit!13129)

(assert (=> b!445639 (= lt!203456 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!693 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29597 () ListLongMap!6767)

(declare-fun b!445640 () Bool)

(declare-fun +!1554 (ListLongMap!6767 tuple2!7864) ListLongMap!6767)

(assert (=> b!445640 (= e!261851 (= call!29597 (+!1554 call!29596 (tuple2!7865 k0!794 v!412))))))

(declare-fun b!445641 () Bool)

(declare-fun res!264517 () Bool)

(assert (=> b!445641 (=> (not res!264517) (not e!261854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27549 (_ BitVec 32)) Bool)

(assert (=> b!445641 (= res!264517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19431 () Bool)

(declare-fun mapRes!19431 () Bool)

(assert (=> mapIsEmpty!19431 mapRes!19431))

(declare-fun b!445642 () Bool)

(declare-fun res!264511 () Bool)

(assert (=> b!445642 (=> (not res!264511) (not e!261854))))

(assert (=> b!445642 (= res!264511 (and (= (size!13576 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13575 _keys!709) (size!13576 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445643 () Bool)

(declare-fun e!261850 () Bool)

(declare-fun tp_is_empty!11869 () Bool)

(assert (=> b!445643 (= e!261850 tp_is_empty!11869)))

(declare-fun b!445644 () Bool)

(declare-fun res!264509 () Bool)

(assert (=> b!445644 (=> (not res!264509) (not e!261854))))

(declare-datatypes ((List!7914 0))(
  ( (Nil!7911) (Cons!7910 (h!8766 (_ BitVec 64)) (t!13663 List!7914)) )
))
(declare-fun arrayNoDuplicates!0 (array!27549 (_ BitVec 32) List!7914) Bool)

(assert (=> b!445644 (= res!264509 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7911))))

(declare-fun b!445645 () Bool)

(declare-fun res!264512 () Bool)

(assert (=> b!445645 (=> (not res!264512) (not e!261854))))

(declare-fun arrayContainsKey!0 (array!27549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445645 (= res!264512 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!264514 () Bool)

(assert (=> start!40470 (=> (not res!264514) (not e!261854))))

(assert (=> start!40470 (= res!264514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13575 _keys!709))))))

(assert (=> start!40470 e!261854))

(assert (=> start!40470 tp_is_empty!11869))

(assert (=> start!40470 tp!37443))

(assert (=> start!40470 true))

(declare-fun e!261852 () Bool)

(declare-fun array_inv!9638 (array!27551) Bool)

(assert (=> start!40470 (and (array_inv!9638 _values!549) e!261852)))

(declare-fun array_inv!9639 (array!27549) Bool)

(assert (=> start!40470 (array_inv!9639 _keys!709)))

(declare-fun mapNonEmpty!19431 () Bool)

(declare-fun tp!37442 () Bool)

(declare-fun e!261848 () Bool)

(assert (=> mapNonEmpty!19431 (= mapRes!19431 (and tp!37442 e!261848))))

(declare-fun mapValue!19431 () ValueCell!5591)

(declare-fun mapRest!19431 () (Array (_ BitVec 32) ValueCell!5591))

(declare-fun mapKey!19431 () (_ BitVec 32))

(assert (=> mapNonEmpty!19431 (= (arr!13223 _values!549) (store mapRest!19431 mapKey!19431 mapValue!19431))))

(declare-fun b!445646 () Bool)

(declare-fun res!264515 () Bool)

(assert (=> b!445646 (=> (not res!264515) (not e!261854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445646 (= res!264515 (validKeyInArray!0 k0!794))))

(declare-fun b!445647 () Bool)

(declare-fun res!264519 () Bool)

(assert (=> b!445647 (=> (not res!264519) (not e!261849))))

(assert (=> b!445647 (= res!264519 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13575 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445648 () Bool)

(assert (=> b!445648 (= e!261848 tp_is_empty!11869)))

(declare-fun b!445649 () Bool)

(assert (=> b!445649 (= e!261852 (and e!261850 mapRes!19431))))

(declare-fun condMapEmpty!19431 () Bool)

(declare-fun mapDefault!19431 () ValueCell!5591)

(assert (=> b!445649 (= condMapEmpty!19431 (= (arr!13223 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5591)) mapDefault!19431)))))

(declare-fun bm!29594 () Bool)

(assert (=> bm!29594 (= call!29597 (getCurrentListMapNoExtraKeys!1598 (ite c!55807 lt!203455 _keys!709) (ite c!55807 (array!27552 (store (arr!13223 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13576 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445650 () Bool)

(assert (=> b!445650 (= e!261851 (= call!29596 call!29597))))

(declare-fun b!445651 () Bool)

(declare-fun res!264510 () Bool)

(assert (=> b!445651 (=> (not res!264510) (not e!261854))))

(assert (=> b!445651 (= res!264510 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13575 _keys!709))))))

(declare-fun b!445652 () Bool)

(declare-fun res!264520 () Bool)

(assert (=> b!445652 (=> (not res!264520) (not e!261849))))

(assert (=> b!445652 (= res!264520 (arrayNoDuplicates!0 lt!203455 #b00000000000000000000000000000000 Nil!7911))))

(declare-fun b!445653 () Bool)

(assert (=> b!445653 (= e!261854 e!261849)))

(declare-fun res!264516 () Bool)

(assert (=> b!445653 (=> (not res!264516) (not e!261849))))

(assert (=> b!445653 (= res!264516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203455 mask!1025))))

(assert (=> b!445653 (= lt!203455 (array!27550 (store (arr!13222 _keys!709) i!563 k0!794) (size!13575 _keys!709)))))

(declare-fun b!445654 () Bool)

(declare-fun res!264518 () Bool)

(assert (=> b!445654 (=> (not res!264518) (not e!261854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445654 (= res!264518 (validMask!0 mask!1025))))

(assert (= (and start!40470 res!264514) b!445654))

(assert (= (and b!445654 res!264518) b!445642))

(assert (= (and b!445642 res!264511) b!445641))

(assert (= (and b!445641 res!264517) b!445644))

(assert (= (and b!445644 res!264509) b!445651))

(assert (= (and b!445651 res!264510) b!445646))

(assert (= (and b!445646 res!264515) b!445638))

(assert (= (and b!445638 res!264513) b!445645))

(assert (= (and b!445645 res!264512) b!445653))

(assert (= (and b!445653 res!264516) b!445652))

(assert (= (and b!445652 res!264520) b!445647))

(assert (= (and b!445647 res!264519) b!445639))

(assert (= (and b!445639 c!55807) b!445640))

(assert (= (and b!445639 (not c!55807)) b!445650))

(assert (= (or b!445640 b!445650) bm!29594))

(assert (= (or b!445640 b!445650) bm!29593))

(assert (= (and b!445649 condMapEmpty!19431) mapIsEmpty!19431))

(assert (= (and b!445649 (not condMapEmpty!19431)) mapNonEmpty!19431))

(get-info :version)

(assert (= (and mapNonEmpty!19431 ((_ is ValueCellFull!5591) mapValue!19431)) b!445648))

(assert (= (and b!445649 ((_ is ValueCellFull!5591) mapDefault!19431)) b!445643))

(assert (= start!40470 b!445649))

(declare-fun m!430507 () Bool)

(assert (=> start!40470 m!430507))

(declare-fun m!430509 () Bool)

(assert (=> start!40470 m!430509))

(declare-fun m!430511 () Bool)

(assert (=> b!445644 m!430511))

(declare-fun m!430513 () Bool)

(assert (=> mapNonEmpty!19431 m!430513))

(declare-fun m!430515 () Bool)

(assert (=> bm!29593 m!430515))

(declare-fun m!430517 () Bool)

(assert (=> bm!29593 m!430517))

(declare-fun m!430519 () Bool)

(assert (=> b!445654 m!430519))

(declare-fun m!430521 () Bool)

(assert (=> b!445639 m!430521))

(declare-fun m!430523 () Bool)

(assert (=> b!445638 m!430523))

(declare-fun m!430525 () Bool)

(assert (=> b!445641 m!430525))

(declare-fun m!430527 () Bool)

(assert (=> b!445646 m!430527))

(assert (=> bm!29594 m!430515))

(declare-fun m!430529 () Bool)

(assert (=> bm!29594 m!430529))

(declare-fun m!430531 () Bool)

(assert (=> b!445652 m!430531))

(declare-fun m!430533 () Bool)

(assert (=> b!445640 m!430533))

(declare-fun m!430535 () Bool)

(assert (=> b!445653 m!430535))

(declare-fun m!430537 () Bool)

(assert (=> b!445653 m!430537))

(declare-fun m!430539 () Bool)

(assert (=> b!445645 m!430539))

(check-sat (not b!445646) tp_is_empty!11869 (not b!445644) (not b!445652) (not mapNonEmpty!19431) b_and!18513 (not b!445645) (not bm!29593) (not b!445639) (not b!445640) (not b!445641) (not bm!29594) (not b!445654) (not start!40470) (not b!445653) (not b_next!10555))
(check-sat b_and!18513 (not b_next!10555))
