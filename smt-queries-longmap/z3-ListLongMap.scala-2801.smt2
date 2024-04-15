; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40680 () Bool)

(assert start!40680)

(declare-fun b_free!10705 () Bool)

(declare-fun b_next!10705 () Bool)

(assert (=> start!40680 (= b_free!10705 (not b_next!10705))))

(declare-fun tp!37934 () Bool)

(declare-fun b_and!18687 () Bool)

(assert (=> start!40680 (= tp!37934 b_and!18687)))

(declare-fun b!449794 () Bool)

(declare-fun e!263618 () Bool)

(declare-fun tp_is_empty!12043 () Bool)

(assert (=> b!449794 (= e!263618 tp_is_empty!12043)))

(declare-fun b!449795 () Bool)

(declare-fun e!263612 () Bool)

(declare-fun e!263616 () Bool)

(assert (=> b!449795 (= e!263612 e!263616)))

(declare-fun res!267698 () Bool)

(assert (=> b!449795 (=> (not res!267698) (not e!263616))))

(declare-datatypes ((array!27891 0))(
  ( (array!27892 (arr!13391 (Array (_ BitVec 32) (_ BitVec 64))) (size!13744 (_ BitVec 32))) )
))
(declare-fun lt!204275 () array!27891)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27891 (_ BitVec 32)) Bool)

(assert (=> b!449795 (= res!267698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204275 mask!1025))))

(declare-fun _keys!709 () array!27891)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449795 (= lt!204275 (array!27892 (store (arr!13391 _keys!709) i!563 k0!794) (size!13744 _keys!709)))))

(declare-fun mapNonEmpty!19698 () Bool)

(declare-fun mapRes!19698 () Bool)

(declare-fun tp!37935 () Bool)

(declare-fun e!263617 () Bool)

(assert (=> mapNonEmpty!19698 (= mapRes!19698 (and tp!37935 e!263617))))

(declare-datatypes ((V!17163 0))(
  ( (V!17164 (val!6066 Int)) )
))
(declare-datatypes ((ValueCell!5678 0))(
  ( (ValueCellFull!5678 (v!8315 V!17163)) (EmptyCell!5678) )
))
(declare-fun mapRest!19698 () (Array (_ BitVec 32) ValueCell!5678))

(declare-fun mapKey!19698 () (_ BitVec 32))

(declare-datatypes ((array!27893 0))(
  ( (array!27894 (arr!13392 (Array (_ BitVec 32) ValueCell!5678)) (size!13745 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27893)

(declare-fun mapValue!19698 () ValueCell!5678)

(assert (=> mapNonEmpty!19698 (= (arr!13392 _values!549) (store mapRest!19698 mapKey!19698 mapValue!19698))))

(declare-fun b!449796 () Bool)

(declare-fun res!267701 () Bool)

(assert (=> b!449796 (=> (not res!267701) (not e!263612))))

(assert (=> b!449796 (= res!267701 (or (= (select (arr!13391 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13391 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449797 () Bool)

(declare-fun res!267699 () Bool)

(assert (=> b!449797 (=> (not res!267699) (not e!263616))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449797 (= res!267699 (bvsle from!863 i!563))))

(declare-datatypes ((tuple2!7976 0))(
  ( (tuple2!7977 (_1!3999 (_ BitVec 64)) (_2!3999 V!17163)) )
))
(declare-datatypes ((List!8041 0))(
  ( (Nil!8038) (Cons!8037 (h!8893 tuple2!7976) (t!13794 List!8041)) )
))
(declare-datatypes ((ListLongMap!6879 0))(
  ( (ListLongMap!6880 (toList!3455 List!8041)) )
))
(declare-fun call!29682 () ListLongMap!6879)

(declare-fun b!449798 () Bool)

(declare-fun e!263615 () Bool)

(declare-fun v!412 () V!17163)

(declare-fun call!29683 () ListLongMap!6879)

(declare-fun +!1562 (ListLongMap!6879 tuple2!7976) ListLongMap!6879)

(assert (=> b!449798 (= e!263615 (= call!29683 (+!1562 call!29682 (tuple2!7977 k0!794 v!412))))))

(declare-fun b!449799 () Bool)

(assert (=> b!449799 (= e!263615 (= call!29682 call!29683))))

(declare-fun b!449800 () Bool)

(declare-fun res!267692 () Bool)

(assert (=> b!449800 (=> (not res!267692) (not e!263612))))

(assert (=> b!449800 (= res!267692 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13744 _keys!709))))))

(declare-fun b!449801 () Bool)

(declare-fun res!267697 () Bool)

(assert (=> b!449801 (=> (not res!267697) (not e!263612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449801 (= res!267697 (validKeyInArray!0 k0!794))))

(declare-fun b!449802 () Bool)

(declare-fun res!267702 () Bool)

(assert (=> b!449802 (=> (not res!267702) (not e!263612))))

(declare-fun arrayContainsKey!0 (array!27891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449802 (= res!267702 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449803 () Bool)

(assert (=> b!449803 (= e!263617 tp_is_empty!12043)))

(declare-fun minValue!515 () V!17163)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204272 () array!27893)

(declare-fun bm!29679 () Bool)

(declare-fun zeroValue!515 () V!17163)

(declare-fun c!55893 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1653 (array!27891 array!27893 (_ BitVec 32) (_ BitVec 32) V!17163 V!17163 (_ BitVec 32) Int) ListLongMap!6879)

(assert (=> bm!29679 (= call!29683 (getCurrentListMapNoExtraKeys!1653 (ite c!55893 lt!204275 _keys!709) (ite c!55893 lt!204272 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19698 () Bool)

(assert (=> mapIsEmpty!19698 mapRes!19698))

(declare-fun b!449804 () Bool)

(declare-fun res!267690 () Bool)

(assert (=> b!449804 (=> (not res!267690) (not e!263612))))

(assert (=> b!449804 (= res!267690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449805 () Bool)

(declare-fun res!267695 () Bool)

(assert (=> b!449805 (=> (not res!267695) (not e!263616))))

(declare-datatypes ((List!8042 0))(
  ( (Nil!8039) (Cons!8038 (h!8894 (_ BitVec 64)) (t!13795 List!8042)) )
))
(declare-fun arrayNoDuplicates!0 (array!27891 (_ BitVec 32) List!8042) Bool)

(assert (=> b!449805 (= res!267695 (arrayNoDuplicates!0 lt!204275 #b00000000000000000000000000000000 Nil!8039))))

(declare-fun b!449806 () Bool)

(declare-fun e!263614 () Bool)

(assert (=> b!449806 (= e!263614 (and e!263618 mapRes!19698))))

(declare-fun condMapEmpty!19698 () Bool)

(declare-fun mapDefault!19698 () ValueCell!5678)

(assert (=> b!449806 (= condMapEmpty!19698 (= (arr!13392 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5678)) mapDefault!19698)))))

(declare-fun b!449807 () Bool)

(declare-fun res!267696 () Bool)

(assert (=> b!449807 (=> (not res!267696) (not e!263612))))

(assert (=> b!449807 (= res!267696 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8039))))

(declare-fun bm!29680 () Bool)

(assert (=> bm!29680 (= call!29682 (getCurrentListMapNoExtraKeys!1653 (ite c!55893 _keys!709 lt!204275) (ite c!55893 _values!549 lt!204272) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449808 () Bool)

(declare-fun e!263611 () Bool)

(assert (=> b!449808 (= e!263616 e!263611)))

(declare-fun res!267691 () Bool)

(assert (=> b!449808 (=> (not res!267691) (not e!263611))))

(assert (=> b!449808 (= res!267691 (= from!863 i!563))))

(declare-fun lt!204274 () ListLongMap!6879)

(assert (=> b!449808 (= lt!204274 (getCurrentListMapNoExtraKeys!1653 lt!204275 lt!204272 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449808 (= lt!204272 (array!27894 (store (arr!13392 _values!549) i!563 (ValueCellFull!5678 v!412)) (size!13745 _values!549)))))

(declare-fun lt!204276 () ListLongMap!6879)

(assert (=> b!449808 (= lt!204276 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449809 () Bool)

(declare-fun res!267693 () Bool)

(assert (=> b!449809 (=> (not res!267693) (not e!263612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449809 (= res!267693 (validMask!0 mask!1025))))

(declare-fun res!267694 () Bool)

(assert (=> start!40680 (=> (not res!267694) (not e!263612))))

(assert (=> start!40680 (= res!267694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13744 _keys!709))))))

(assert (=> start!40680 e!263612))

(assert (=> start!40680 tp_is_empty!12043))

(assert (=> start!40680 tp!37934))

(assert (=> start!40680 true))

(declare-fun array_inv!9760 (array!27893) Bool)

(assert (=> start!40680 (and (array_inv!9760 _values!549) e!263614)))

(declare-fun array_inv!9761 (array!27891) Bool)

(assert (=> start!40680 (array_inv!9761 _keys!709)))

(declare-fun b!449810 () Bool)

(assert (=> b!449810 (= e!263611 (not true))))

(assert (=> b!449810 e!263615))

(assert (=> b!449810 (= c!55893 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13141 0))(
  ( (Unit!13142) )
))
(declare-fun lt!204273 () Unit!13141)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 (array!27891 array!27893 (_ BitVec 32) (_ BitVec 32) V!17163 V!17163 (_ BitVec 32) (_ BitVec 64) V!17163 (_ BitVec 32) Int) Unit!13141)

(assert (=> b!449810 (= lt!204273 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449811 () Bool)

(declare-fun res!267700 () Bool)

(assert (=> b!449811 (=> (not res!267700) (not e!263612))))

(assert (=> b!449811 (= res!267700 (and (= (size!13745 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13744 _keys!709) (size!13745 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40680 res!267694) b!449809))

(assert (= (and b!449809 res!267693) b!449811))

(assert (= (and b!449811 res!267700) b!449804))

(assert (= (and b!449804 res!267690) b!449807))

(assert (= (and b!449807 res!267696) b!449800))

(assert (= (and b!449800 res!267692) b!449801))

(assert (= (and b!449801 res!267697) b!449796))

(assert (= (and b!449796 res!267701) b!449802))

(assert (= (and b!449802 res!267702) b!449795))

(assert (= (and b!449795 res!267698) b!449805))

(assert (= (and b!449805 res!267695) b!449797))

(assert (= (and b!449797 res!267699) b!449808))

(assert (= (and b!449808 res!267691) b!449810))

(assert (= (and b!449810 c!55893) b!449798))

(assert (= (and b!449810 (not c!55893)) b!449799))

(assert (= (or b!449798 b!449799) bm!29679))

(assert (= (or b!449798 b!449799) bm!29680))

(assert (= (and b!449806 condMapEmpty!19698) mapIsEmpty!19698))

(assert (= (and b!449806 (not condMapEmpty!19698)) mapNonEmpty!19698))

(get-info :version)

(assert (= (and mapNonEmpty!19698 ((_ is ValueCellFull!5678) mapValue!19698)) b!449803))

(assert (= (and b!449806 ((_ is ValueCellFull!5678) mapDefault!19698)) b!449794))

(assert (= start!40680 b!449806))

(declare-fun m!433345 () Bool)

(assert (=> bm!29679 m!433345))

(declare-fun m!433347 () Bool)

(assert (=> bm!29680 m!433347))

(declare-fun m!433349 () Bool)

(assert (=> b!449801 m!433349))

(declare-fun m!433351 () Bool)

(assert (=> b!449807 m!433351))

(declare-fun m!433353 () Bool)

(assert (=> b!449810 m!433353))

(declare-fun m!433355 () Bool)

(assert (=> b!449808 m!433355))

(declare-fun m!433357 () Bool)

(assert (=> b!449808 m!433357))

(declare-fun m!433359 () Bool)

(assert (=> b!449808 m!433359))

(declare-fun m!433361 () Bool)

(assert (=> mapNonEmpty!19698 m!433361))

(declare-fun m!433363 () Bool)

(assert (=> b!449809 m!433363))

(declare-fun m!433365 () Bool)

(assert (=> start!40680 m!433365))

(declare-fun m!433367 () Bool)

(assert (=> start!40680 m!433367))

(declare-fun m!433369 () Bool)

(assert (=> b!449802 m!433369))

(declare-fun m!433371 () Bool)

(assert (=> b!449796 m!433371))

(declare-fun m!433373 () Bool)

(assert (=> b!449795 m!433373))

(declare-fun m!433375 () Bool)

(assert (=> b!449795 m!433375))

(declare-fun m!433377 () Bool)

(assert (=> b!449804 m!433377))

(declare-fun m!433379 () Bool)

(assert (=> b!449798 m!433379))

(declare-fun m!433381 () Bool)

(assert (=> b!449805 m!433381))

(check-sat (not b!449809) (not b_next!10705) tp_is_empty!12043 (not b!449798) (not start!40680) (not b!449804) (not b!449801) (not bm!29679) (not b!449795) (not bm!29680) (not b!449805) (not b!449810) (not b!449808) (not b!449802) (not b!449807) b_and!18687 (not mapNonEmpty!19698))
(check-sat b_and!18687 (not b_next!10705))
