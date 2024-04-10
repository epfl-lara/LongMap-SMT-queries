; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38748 () Bool)

(assert start!38748)

(declare-fun b_free!9285 () Bool)

(declare-fun b_next!9285 () Bool)

(assert (=> start!38748 (= b_free!9285 (not b_next!9285))))

(declare-fun tp!32978 () Bool)

(declare-fun b_and!16671 () Bool)

(assert (=> start!38748 (= tp!32978 b_and!16671)))

(declare-fun b!403726 () Bool)

(declare-fun e!242997 () Bool)

(declare-fun tp_is_empty!10167 () Bool)

(assert (=> b!403726 (= e!242997 tp_is_empty!10167)))

(declare-fun res!232702 () Bool)

(declare-fun e!242994 () Bool)

(assert (=> start!38748 (=> (not res!232702) (not e!242994))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24233 0))(
  ( (array!24234 (arr!11566 (Array (_ BitVec 32) (_ BitVec 64))) (size!11918 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24233)

(assert (=> start!38748 (= res!232702 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11918 _keys!709))))))

(assert (=> start!38748 e!242994))

(assert (=> start!38748 tp_is_empty!10167))

(assert (=> start!38748 tp!32978))

(assert (=> start!38748 true))

(declare-datatypes ((V!14661 0))(
  ( (V!14662 (val!5128 Int)) )
))
(declare-datatypes ((ValueCell!4740 0))(
  ( (ValueCellFull!4740 (v!7375 V!14661)) (EmptyCell!4740) )
))
(declare-datatypes ((array!24235 0))(
  ( (array!24236 (arr!11567 (Array (_ BitVec 32) ValueCell!4740)) (size!11919 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24235)

(declare-fun e!242998 () Bool)

(declare-fun array_inv!8462 (array!24235) Bool)

(assert (=> start!38748 (and (array_inv!8462 _values!549) e!242998)))

(declare-fun array_inv!8463 (array!24233) Bool)

(assert (=> start!38748 (array_inv!8463 _keys!709)))

(declare-fun b!403727 () Bool)

(declare-fun mapRes!16872 () Bool)

(assert (=> b!403727 (= e!242998 (and e!242997 mapRes!16872))))

(declare-fun condMapEmpty!16872 () Bool)

(declare-fun mapDefault!16872 () ValueCell!4740)

(assert (=> b!403727 (= condMapEmpty!16872 (= (arr!11567 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4740)) mapDefault!16872)))))

(declare-fun b!403728 () Bool)

(declare-fun e!242995 () Bool)

(assert (=> b!403728 (= e!242994 e!242995)))

(declare-fun res!232711 () Bool)

(assert (=> b!403728 (=> (not res!232711) (not e!242995))))

(declare-fun lt!188081 () array!24233)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24233 (_ BitVec 32)) Bool)

(assert (=> b!403728 (= res!232711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188081 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403728 (= lt!188081 (array!24234 (store (arr!11566 _keys!709) i!563 k0!794) (size!11918 _keys!709)))))

(declare-fun b!403729 () Bool)

(declare-fun res!232712 () Bool)

(assert (=> b!403729 (=> (not res!232712) (not e!242994))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!403729 (= res!232712 (and (= (size!11919 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11918 _keys!709) (size!11919 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403730 () Bool)

(declare-fun res!232713 () Bool)

(assert (=> b!403730 (=> (not res!232713) (not e!242994))))

(assert (=> b!403730 (= res!232713 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11918 _keys!709))))))

(declare-fun b!403731 () Bool)

(declare-fun res!232710 () Bool)

(assert (=> b!403731 (=> (not res!232710) (not e!242994))))

(declare-fun arrayContainsKey!0 (array!24233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403731 (= res!232710 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6818 0))(
  ( (tuple2!6819 (_1!3420 (_ BitVec 64)) (_2!3420 V!14661)) )
))
(declare-datatypes ((List!6736 0))(
  ( (Nil!6733) (Cons!6732 (h!7588 tuple2!6818) (t!11910 List!6736)) )
))
(declare-datatypes ((ListLongMap!5731 0))(
  ( (ListLongMap!5732 (toList!2881 List!6736)) )
))
(declare-fun call!28519 () ListLongMap!5731)

(declare-fun v!412 () V!14661)

(declare-fun call!28520 () ListLongMap!5731)

(declare-fun b!403732 () Bool)

(declare-fun e!242996 () Bool)

(declare-fun +!1155 (ListLongMap!5731 tuple2!6818) ListLongMap!5731)

(assert (=> b!403732 (= e!242996 (= call!28519 (+!1155 call!28520 (tuple2!6819 k0!794 v!412))))))

(declare-fun b!403733 () Bool)

(declare-fun res!232703 () Bool)

(assert (=> b!403733 (=> (not res!232703) (not e!242994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403733 (= res!232703 (validKeyInArray!0 k0!794))))

(declare-fun b!403734 () Bool)

(declare-fun res!232708 () Bool)

(assert (=> b!403734 (=> (not res!232708) (not e!242994))))

(assert (=> b!403734 (= res!232708 (or (= (select (arr!11566 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11566 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403735 () Bool)

(assert (=> b!403735 (= e!242995 (not true))))

(assert (=> b!403735 e!242996))

(declare-fun c!54884 () Bool)

(assert (=> b!403735 (= c!54884 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14661)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14661)

(declare-datatypes ((Unit!12212 0))(
  ( (Unit!12213) )
))
(declare-fun lt!188080 () Unit!12212)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 (array!24233 array!24235 (_ BitVec 32) (_ BitVec 32) V!14661 V!14661 (_ BitVec 32) (_ BitVec 64) V!14661 (_ BitVec 32) Int) Unit!12212)

(assert (=> b!403735 (= lt!188080 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403736 () Bool)

(declare-fun res!232707 () Bool)

(assert (=> b!403736 (=> (not res!232707) (not e!242994))))

(assert (=> b!403736 (= res!232707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16872 () Bool)

(declare-fun tp!32979 () Bool)

(declare-fun e!243000 () Bool)

(assert (=> mapNonEmpty!16872 (= mapRes!16872 (and tp!32979 e!243000))))

(declare-fun mapRest!16872 () (Array (_ BitVec 32) ValueCell!4740))

(declare-fun mapValue!16872 () ValueCell!4740)

(declare-fun mapKey!16872 () (_ BitVec 32))

(assert (=> mapNonEmpty!16872 (= (arr!11567 _values!549) (store mapRest!16872 mapKey!16872 mapValue!16872))))

(declare-fun b!403737 () Bool)

(assert (=> b!403737 (= e!243000 tp_is_empty!10167)))

(declare-fun b!403738 () Bool)

(declare-fun res!232709 () Bool)

(assert (=> b!403738 (=> (not res!232709) (not e!242994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403738 (= res!232709 (validMask!0 mask!1025))))

(declare-fun bm!28516 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1090 (array!24233 array!24235 (_ BitVec 32) (_ BitVec 32) V!14661 V!14661 (_ BitVec 32) Int) ListLongMap!5731)

(assert (=> bm!28516 (= call!28519 (getCurrentListMapNoExtraKeys!1090 (ite c!54884 lt!188081 _keys!709) (ite c!54884 (array!24236 (store (arr!11567 _values!549) i!563 (ValueCellFull!4740 v!412)) (size!11919 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403739 () Bool)

(declare-fun res!232706 () Bool)

(assert (=> b!403739 (=> (not res!232706) (not e!242995))))

(declare-datatypes ((List!6737 0))(
  ( (Nil!6734) (Cons!6733 (h!7589 (_ BitVec 64)) (t!11911 List!6737)) )
))
(declare-fun arrayNoDuplicates!0 (array!24233 (_ BitVec 32) List!6737) Bool)

(assert (=> b!403739 (= res!232706 (arrayNoDuplicates!0 lt!188081 #b00000000000000000000000000000000 Nil!6734))))

(declare-fun mapIsEmpty!16872 () Bool)

(assert (=> mapIsEmpty!16872 mapRes!16872))

(declare-fun b!403740 () Bool)

(declare-fun res!232705 () Bool)

(assert (=> b!403740 (=> (not res!232705) (not e!242995))))

(assert (=> b!403740 (= res!232705 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11918 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403741 () Bool)

(declare-fun res!232704 () Bool)

(assert (=> b!403741 (=> (not res!232704) (not e!242994))))

(assert (=> b!403741 (= res!232704 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6734))))

(declare-fun b!403742 () Bool)

(assert (=> b!403742 (= e!242996 (= call!28520 call!28519))))

(declare-fun bm!28517 () Bool)

(assert (=> bm!28517 (= call!28520 (getCurrentListMapNoExtraKeys!1090 (ite c!54884 _keys!709 lt!188081) (ite c!54884 _values!549 (array!24236 (store (arr!11567 _values!549) i!563 (ValueCellFull!4740 v!412)) (size!11919 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38748 res!232702) b!403738))

(assert (= (and b!403738 res!232709) b!403729))

(assert (= (and b!403729 res!232712) b!403736))

(assert (= (and b!403736 res!232707) b!403741))

(assert (= (and b!403741 res!232704) b!403730))

(assert (= (and b!403730 res!232713) b!403733))

(assert (= (and b!403733 res!232703) b!403734))

(assert (= (and b!403734 res!232708) b!403731))

(assert (= (and b!403731 res!232710) b!403728))

(assert (= (and b!403728 res!232711) b!403739))

(assert (= (and b!403739 res!232706) b!403740))

(assert (= (and b!403740 res!232705) b!403735))

(assert (= (and b!403735 c!54884) b!403732))

(assert (= (and b!403735 (not c!54884)) b!403742))

(assert (= (or b!403732 b!403742) bm!28516))

(assert (= (or b!403732 b!403742) bm!28517))

(assert (= (and b!403727 condMapEmpty!16872) mapIsEmpty!16872))

(assert (= (and b!403727 (not condMapEmpty!16872)) mapNonEmpty!16872))

(get-info :version)

(assert (= (and mapNonEmpty!16872 ((_ is ValueCellFull!4740) mapValue!16872)) b!403737))

(assert (= (and b!403727 ((_ is ValueCellFull!4740) mapDefault!16872)) b!403726))

(assert (= start!38748 b!403727))

(declare-fun m!396821 () Bool)

(assert (=> b!403733 m!396821))

(declare-fun m!396823 () Bool)

(assert (=> start!38748 m!396823))

(declare-fun m!396825 () Bool)

(assert (=> start!38748 m!396825))

(declare-fun m!396827 () Bool)

(assert (=> mapNonEmpty!16872 m!396827))

(declare-fun m!396829 () Bool)

(assert (=> b!403739 m!396829))

(declare-fun m!396831 () Bool)

(assert (=> b!403728 m!396831))

(declare-fun m!396833 () Bool)

(assert (=> b!403728 m!396833))

(declare-fun m!396835 () Bool)

(assert (=> b!403732 m!396835))

(declare-fun m!396837 () Bool)

(assert (=> b!403735 m!396837))

(declare-fun m!396839 () Bool)

(assert (=> b!403734 m!396839))

(declare-fun m!396841 () Bool)

(assert (=> b!403738 m!396841))

(declare-fun m!396843 () Bool)

(assert (=> b!403731 m!396843))

(declare-fun m!396845 () Bool)

(assert (=> b!403741 m!396845))

(declare-fun m!396847 () Bool)

(assert (=> b!403736 m!396847))

(declare-fun m!396849 () Bool)

(assert (=> bm!28516 m!396849))

(declare-fun m!396851 () Bool)

(assert (=> bm!28516 m!396851))

(assert (=> bm!28517 m!396849))

(declare-fun m!396853 () Bool)

(assert (=> bm!28517 m!396853))

(check-sat (not b!403738) (not b!403739) (not b!403731) (not b!403732) tp_is_empty!10167 (not b!403733) (not b!403735) (not b_next!9285) (not bm!28517) (not b!403736) (not bm!28516) (not start!38748) (not b!403728) b_and!16671 (not b!403741) (not mapNonEmpty!16872))
(check-sat b_and!16671 (not b_next!9285))
