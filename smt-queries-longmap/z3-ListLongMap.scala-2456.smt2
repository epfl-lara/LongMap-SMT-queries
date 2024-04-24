; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38540 () Bool)

(assert start!38540)

(declare-fun b_free!9091 () Bool)

(declare-fun b_next!9091 () Bool)

(assert (=> start!38540 (= b_free!9091 (not b_next!9091))))

(declare-fun tp!32397 () Bool)

(declare-fun b_and!16491 () Bool)

(assert (=> start!38540 (= tp!32397 b_and!16491)))

(declare-fun mapIsEmpty!16581 () Bool)

(declare-fun mapRes!16581 () Bool)

(assert (=> mapIsEmpty!16581 mapRes!16581))

(declare-fun b!398730 () Bool)

(declare-fun res!229217 () Bool)

(declare-fun e!240929 () Bool)

(assert (=> b!398730 (=> (not res!229217) (not e!240929))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23836 0))(
  ( (array!23837 (arr!11367 (Array (_ BitVec 32) (_ BitVec 64))) (size!11719 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23836)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!398730 (= res!229217 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11719 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398731 () Bool)

(declare-fun res!229213 () Bool)

(declare-fun e!240926 () Bool)

(assert (=> b!398731 (=> (not res!229213) (not e!240926))))

(assert (=> b!398731 (= res!229213 (or (= (select (arr!11367 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11367 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398732 () Bool)

(declare-fun res!229209 () Bool)

(assert (=> b!398732 (=> (not res!229209) (not e!240926))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398732 (= res!229209 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!229218 () Bool)

(assert (=> start!38540 (=> (not res!229218) (not e!240926))))

(assert (=> start!38540 (= res!229218 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11719 _keys!709))))))

(assert (=> start!38540 e!240926))

(declare-fun tp_is_empty!9973 () Bool)

(assert (=> start!38540 tp_is_empty!9973))

(assert (=> start!38540 tp!32397))

(assert (=> start!38540 true))

(declare-datatypes ((V!14403 0))(
  ( (V!14404 (val!5031 Int)) )
))
(declare-datatypes ((ValueCell!4643 0))(
  ( (ValueCellFull!4643 (v!7279 V!14403)) (EmptyCell!4643) )
))
(declare-datatypes ((array!23838 0))(
  ( (array!23839 (arr!11368 (Array (_ BitVec 32) ValueCell!4643)) (size!11720 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23838)

(declare-fun e!240930 () Bool)

(declare-fun array_inv!8394 (array!23838) Bool)

(assert (=> start!38540 (and (array_inv!8394 _values!549) e!240930)))

(declare-fun array_inv!8395 (array!23836) Bool)

(assert (=> start!38540 (array_inv!8395 _keys!709)))

(declare-fun b!398733 () Bool)

(declare-fun res!229212 () Bool)

(assert (=> b!398733 (=> (not res!229212) (not e!240926))))

(assert (=> b!398733 (= res!229212 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11719 _keys!709))))))

(declare-fun b!398734 () Bool)

(declare-fun res!229208 () Bool)

(assert (=> b!398734 (=> (not res!229208) (not e!240926))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398734 (= res!229208 (validMask!0 mask!1025))))

(declare-datatypes ((tuple2!6520 0))(
  ( (tuple2!6521 (_1!3271 (_ BitVec 64)) (_2!3271 V!14403)) )
))
(declare-datatypes ((List!6440 0))(
  ( (Nil!6437) (Cons!6436 (h!7292 tuple2!6520) (t!11606 List!6440)) )
))
(declare-datatypes ((ListLongMap!5435 0))(
  ( (ListLongMap!5436 (toList!2733 List!6440)) )
))
(declare-fun call!27924 () ListLongMap!5435)

(declare-fun b!398735 () Bool)

(declare-fun call!27925 () ListLongMap!5435)

(declare-fun v!412 () V!14403)

(declare-fun e!240927 () Bool)

(declare-fun +!1084 (ListLongMap!5435 tuple2!6520) ListLongMap!5435)

(assert (=> b!398735 (= e!240927 (= call!27924 (+!1084 call!27925 (tuple2!6521 k0!794 v!412))))))

(declare-fun b!398736 () Bool)

(declare-fun res!229207 () Bool)

(assert (=> b!398736 (=> (not res!229207) (not e!240926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398736 (= res!229207 (validKeyInArray!0 k0!794))))

(declare-fun b!398737 () Bool)

(declare-fun res!229216 () Bool)

(assert (=> b!398737 (=> (not res!229216) (not e!240926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23836 (_ BitVec 32)) Bool)

(assert (=> b!398737 (= res!229216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398738 () Bool)

(declare-fun e!240931 () Bool)

(assert (=> b!398738 (= e!240931 tp_is_empty!9973)))

(declare-fun b!398739 () Bool)

(assert (=> b!398739 (= e!240930 (and e!240931 mapRes!16581))))

(declare-fun condMapEmpty!16581 () Bool)

(declare-fun mapDefault!16581 () ValueCell!4643)

(assert (=> b!398739 (= condMapEmpty!16581 (= (arr!11368 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4643)) mapDefault!16581)))))

(declare-fun minValue!515 () V!14403)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27921 () Bool)

(declare-fun zeroValue!515 () V!14403)

(declare-fun c!54570 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!187517 () array!23836)

(declare-fun getCurrentListMapNoExtraKeys!993 (array!23836 array!23838 (_ BitVec 32) (_ BitVec 32) V!14403 V!14403 (_ BitVec 32) Int) ListLongMap!5435)

(assert (=> bm!27921 (= call!27925 (getCurrentListMapNoExtraKeys!993 (ite c!54570 _keys!709 lt!187517) (ite c!54570 _values!549 (array!23839 (store (arr!11368 _values!549) i!563 (ValueCellFull!4643 v!412)) (size!11720 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398740 () Bool)

(assert (=> b!398740 (= e!240926 e!240929)))

(declare-fun res!229214 () Bool)

(assert (=> b!398740 (=> (not res!229214) (not e!240929))))

(assert (=> b!398740 (= res!229214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187517 mask!1025))))

(assert (=> b!398740 (= lt!187517 (array!23837 (store (arr!11367 _keys!709) i!563 k0!794) (size!11719 _keys!709)))))

(declare-fun b!398741 () Bool)

(declare-fun res!229211 () Bool)

(assert (=> b!398741 (=> (not res!229211) (not e!240929))))

(declare-datatypes ((List!6441 0))(
  ( (Nil!6438) (Cons!6437 (h!7293 (_ BitVec 64)) (t!11607 List!6441)) )
))
(declare-fun arrayNoDuplicates!0 (array!23836 (_ BitVec 32) List!6441) Bool)

(assert (=> b!398741 (= res!229211 (arrayNoDuplicates!0 lt!187517 #b00000000000000000000000000000000 Nil!6438))))

(declare-fun b!398742 () Bool)

(declare-fun res!229215 () Bool)

(assert (=> b!398742 (=> (not res!229215) (not e!240926))))

(assert (=> b!398742 (= res!229215 (and (= (size!11720 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11719 _keys!709) (size!11720 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398743 () Bool)

(declare-fun e!240928 () Bool)

(assert (=> b!398743 (= e!240928 tp_is_empty!9973)))

(declare-fun b!398744 () Bool)

(assert (=> b!398744 (= e!240929 (not true))))

(assert (=> b!398744 e!240927))

(assert (=> b!398744 (= c!54570 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12055 0))(
  ( (Unit!12056) )
))
(declare-fun lt!187518 () Unit!12055)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!295 (array!23836 array!23838 (_ BitVec 32) (_ BitVec 32) V!14403 V!14403 (_ BitVec 32) (_ BitVec 64) V!14403 (_ BitVec 32) Int) Unit!12055)

(assert (=> b!398744 (= lt!187518 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!295 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398745 () Bool)

(assert (=> b!398745 (= e!240927 (= call!27925 call!27924))))

(declare-fun bm!27922 () Bool)

(assert (=> bm!27922 (= call!27924 (getCurrentListMapNoExtraKeys!993 (ite c!54570 lt!187517 _keys!709) (ite c!54570 (array!23839 (store (arr!11368 _values!549) i!563 (ValueCellFull!4643 v!412)) (size!11720 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16581 () Bool)

(declare-fun tp!32396 () Bool)

(assert (=> mapNonEmpty!16581 (= mapRes!16581 (and tp!32396 e!240928))))

(declare-fun mapRest!16581 () (Array (_ BitVec 32) ValueCell!4643))

(declare-fun mapValue!16581 () ValueCell!4643)

(declare-fun mapKey!16581 () (_ BitVec 32))

(assert (=> mapNonEmpty!16581 (= (arr!11368 _values!549) (store mapRest!16581 mapKey!16581 mapValue!16581))))

(declare-fun b!398746 () Bool)

(declare-fun res!229210 () Bool)

(assert (=> b!398746 (=> (not res!229210) (not e!240926))))

(assert (=> b!398746 (= res!229210 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6438))))

(assert (= (and start!38540 res!229218) b!398734))

(assert (= (and b!398734 res!229208) b!398742))

(assert (= (and b!398742 res!229215) b!398737))

(assert (= (and b!398737 res!229216) b!398746))

(assert (= (and b!398746 res!229210) b!398733))

(assert (= (and b!398733 res!229212) b!398736))

(assert (= (and b!398736 res!229207) b!398731))

(assert (= (and b!398731 res!229213) b!398732))

(assert (= (and b!398732 res!229209) b!398740))

(assert (= (and b!398740 res!229214) b!398741))

(assert (= (and b!398741 res!229211) b!398730))

(assert (= (and b!398730 res!229217) b!398744))

(assert (= (and b!398744 c!54570) b!398735))

(assert (= (and b!398744 (not c!54570)) b!398745))

(assert (= (or b!398735 b!398745) bm!27922))

(assert (= (or b!398735 b!398745) bm!27921))

(assert (= (and b!398739 condMapEmpty!16581) mapIsEmpty!16581))

(assert (= (and b!398739 (not condMapEmpty!16581)) mapNonEmpty!16581))

(get-info :version)

(assert (= (and mapNonEmpty!16581 ((_ is ValueCellFull!4643) mapValue!16581)) b!398743))

(assert (= (and b!398739 ((_ is ValueCellFull!4643) mapDefault!16581)) b!398738))

(assert (= start!38540 b!398739))

(declare-fun m!393753 () Bool)

(assert (=> b!398746 m!393753))

(declare-fun m!393755 () Bool)

(assert (=> b!398731 m!393755))

(declare-fun m!393757 () Bool)

(assert (=> b!398740 m!393757))

(declare-fun m!393759 () Bool)

(assert (=> b!398740 m!393759))

(declare-fun m!393761 () Bool)

(assert (=> b!398744 m!393761))

(declare-fun m!393763 () Bool)

(assert (=> b!398732 m!393763))

(declare-fun m!393765 () Bool)

(assert (=> bm!27922 m!393765))

(declare-fun m!393767 () Bool)

(assert (=> bm!27922 m!393767))

(declare-fun m!393769 () Bool)

(assert (=> b!398734 m!393769))

(declare-fun m!393771 () Bool)

(assert (=> b!398735 m!393771))

(declare-fun m!393773 () Bool)

(assert (=> start!38540 m!393773))

(declare-fun m!393775 () Bool)

(assert (=> start!38540 m!393775))

(declare-fun m!393777 () Bool)

(assert (=> b!398736 m!393777))

(assert (=> bm!27921 m!393765))

(declare-fun m!393779 () Bool)

(assert (=> bm!27921 m!393779))

(declare-fun m!393781 () Bool)

(assert (=> b!398741 m!393781))

(declare-fun m!393783 () Bool)

(assert (=> mapNonEmpty!16581 m!393783))

(declare-fun m!393785 () Bool)

(assert (=> b!398737 m!393785))

(check-sat b_and!16491 (not b_next!9091) (not start!38540) (not b!398746) (not b!398735) (not b!398741) (not b!398732) (not b!398744) (not b!398736) (not bm!27921) tp_is_empty!9973 (not b!398737) (not b!398734) (not b!398740) (not mapNonEmpty!16581) (not bm!27922))
(check-sat b_and!16491 (not b_next!9091))
