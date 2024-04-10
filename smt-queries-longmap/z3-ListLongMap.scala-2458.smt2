; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38568 () Bool)

(assert start!38568)

(declare-fun b_free!9105 () Bool)

(declare-fun b_next!9105 () Bool)

(assert (=> start!38568 (= b_free!9105 (not b_next!9105))))

(declare-fun tp!32438 () Bool)

(declare-fun b_and!16491 () Bool)

(assert (=> start!38568 (= tp!32438 b_and!16491)))

(declare-fun b!399136 () Bool)

(declare-fun res!229473 () Bool)

(declare-fun e!241108 () Bool)

(assert (=> b!399136 (=> (not res!229473) (not e!241108))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23885 0))(
  ( (array!23886 (arr!11392 (Array (_ BitVec 32) (_ BitVec 64))) (size!11744 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23885)

(assert (=> b!399136 (= res!229473 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11744 _keys!709))))))

(declare-fun b!399137 () Bool)

(declare-fun e!241105 () Bool)

(declare-datatypes ((V!14421 0))(
  ( (V!14422 (val!5038 Int)) )
))
(declare-datatypes ((tuple2!6666 0))(
  ( (tuple2!6667 (_1!3344 (_ BitVec 64)) (_2!3344 V!14421)) )
))
(declare-datatypes ((List!6593 0))(
  ( (Nil!6590) (Cons!6589 (h!7445 tuple2!6666) (t!11767 List!6593)) )
))
(declare-datatypes ((ListLongMap!5579 0))(
  ( (ListLongMap!5580 (toList!2805 List!6593)) )
))
(declare-fun call!27980 () ListLongMap!5579)

(declare-fun call!27979 () ListLongMap!5579)

(assert (=> b!399137 (= e!241105 (= call!27980 call!27979))))

(declare-fun b!399138 () Bool)

(declare-fun e!241109 () Bool)

(assert (=> b!399138 (= e!241108 e!241109)))

(declare-fun res!229462 () Bool)

(assert (=> b!399138 (=> (not res!229462) (not e!241109))))

(declare-fun lt!187541 () array!23885)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23885 (_ BitVec 32)) Bool)

(assert (=> b!399138 (= res!229462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187541 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!399138 (= lt!187541 (array!23886 (store (arr!11392 _keys!709) i!563 k0!794) (size!11744 _keys!709)))))

(declare-fun res!229464 () Bool)

(assert (=> start!38568 (=> (not res!229464) (not e!241108))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38568 (= res!229464 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11744 _keys!709))))))

(assert (=> start!38568 e!241108))

(declare-fun tp_is_empty!9987 () Bool)

(assert (=> start!38568 tp_is_empty!9987))

(assert (=> start!38568 tp!32438))

(assert (=> start!38568 true))

(declare-datatypes ((ValueCell!4650 0))(
  ( (ValueCellFull!4650 (v!7285 V!14421)) (EmptyCell!4650) )
))
(declare-datatypes ((array!23887 0))(
  ( (array!23888 (arr!11393 (Array (_ BitVec 32) ValueCell!4650)) (size!11745 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23887)

(declare-fun e!241107 () Bool)

(declare-fun array_inv!8348 (array!23887) Bool)

(assert (=> start!38568 (and (array_inv!8348 _values!549) e!241107)))

(declare-fun array_inv!8349 (array!23885) Bool)

(assert (=> start!38568 (array_inv!8349 _keys!709)))

(declare-fun mapNonEmpty!16602 () Bool)

(declare-fun mapRes!16602 () Bool)

(declare-fun tp!32439 () Bool)

(declare-fun e!241104 () Bool)

(assert (=> mapNonEmpty!16602 (= mapRes!16602 (and tp!32439 e!241104))))

(declare-fun mapKey!16602 () (_ BitVec 32))

(declare-fun mapRest!16602 () (Array (_ BitVec 32) ValueCell!4650))

(declare-fun mapValue!16602 () ValueCell!4650)

(assert (=> mapNonEmpty!16602 (= (arr!11393 _values!549) (store mapRest!16602 mapKey!16602 mapValue!16602))))

(declare-fun b!399139 () Bool)

(declare-fun v!412 () V!14421)

(declare-fun +!1095 (ListLongMap!5579 tuple2!6666) ListLongMap!5579)

(assert (=> b!399139 (= e!241105 (= call!27980 (+!1095 call!27979 (tuple2!6667 k0!794 v!412))))))

(declare-fun b!399140 () Bool)

(declare-fun res!229467 () Bool)

(assert (=> b!399140 (=> (not res!229467) (not e!241109))))

(assert (=> b!399140 (= res!229467 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11744 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399141 () Bool)

(declare-fun res!229472 () Bool)

(assert (=> b!399141 (=> (not res!229472) (not e!241108))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!399141 (= res!229472 (and (= (size!11745 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11744 _keys!709) (size!11745 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!14421)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14421)

(declare-fun bm!27976 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1023 (array!23885 array!23887 (_ BitVec 32) (_ BitVec 32) V!14421 V!14421 (_ BitVec 32) Int) ListLongMap!5579)

(assert (=> bm!27976 (= call!27979 (getCurrentListMapNoExtraKeys!1023 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!27977 () Bool)

(assert (=> bm!27977 (= call!27980 (getCurrentListMapNoExtraKeys!1023 lt!187541 (array!23888 (store (arr!11393 _values!549) i!563 (ValueCellFull!4650 v!412)) (size!11745 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399142 () Bool)

(declare-fun res!229470 () Bool)

(assert (=> b!399142 (=> (not res!229470) (not e!241109))))

(declare-datatypes ((List!6594 0))(
  ( (Nil!6591) (Cons!6590 (h!7446 (_ BitVec 64)) (t!11768 List!6594)) )
))
(declare-fun arrayNoDuplicates!0 (array!23885 (_ BitVec 32) List!6594) Bool)

(assert (=> b!399142 (= res!229470 (arrayNoDuplicates!0 lt!187541 #b00000000000000000000000000000000 Nil!6591))))

(declare-fun b!399143 () Bool)

(declare-fun res!229468 () Bool)

(assert (=> b!399143 (=> (not res!229468) (not e!241108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399143 (= res!229468 (validKeyInArray!0 k0!794))))

(declare-fun b!399144 () Bool)

(declare-fun res!229466 () Bool)

(assert (=> b!399144 (=> (not res!229466) (not e!241108))))

(assert (=> b!399144 (= res!229466 (or (= (select (arr!11392 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11392 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399145 () Bool)

(declare-fun res!229463 () Bool)

(assert (=> b!399145 (=> (not res!229463) (not e!241108))))

(assert (=> b!399145 (= res!229463 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6591))))

(declare-fun b!399146 () Bool)

(declare-fun e!241106 () Bool)

(assert (=> b!399146 (= e!241106 tp_is_empty!9987)))

(declare-fun b!399147 () Bool)

(declare-fun res!229471 () Bool)

(assert (=> b!399147 (=> (not res!229471) (not e!241108))))

(assert (=> b!399147 (= res!229471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16602 () Bool)

(assert (=> mapIsEmpty!16602 mapRes!16602))

(declare-fun b!399148 () Bool)

(declare-fun res!229465 () Bool)

(assert (=> b!399148 (=> (not res!229465) (not e!241108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399148 (= res!229465 (validMask!0 mask!1025))))

(declare-fun b!399149 () Bool)

(declare-fun res!229469 () Bool)

(assert (=> b!399149 (=> (not res!229469) (not e!241108))))

(declare-fun arrayContainsKey!0 (array!23885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399149 (= res!229469 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399150 () Bool)

(assert (=> b!399150 (= e!241104 tp_is_empty!9987)))

(declare-fun b!399151 () Bool)

(assert (=> b!399151 (= e!241107 (and e!241106 mapRes!16602))))

(declare-fun condMapEmpty!16602 () Bool)

(declare-fun mapDefault!16602 () ValueCell!4650)

(assert (=> b!399151 (= condMapEmpty!16602 (= (arr!11393 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4650)) mapDefault!16602)))))

(declare-fun b!399152 () Bool)

(assert (=> b!399152 (= e!241109 (not true))))

(assert (=> b!399152 e!241105))

(declare-fun c!54614 () Bool)

(assert (=> b!399152 (= c!54614 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12096 0))(
  ( (Unit!12097) )
))
(declare-fun lt!187540 () Unit!12096)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!306 (array!23885 array!23887 (_ BitVec 32) (_ BitVec 32) V!14421 V!14421 (_ BitVec 32) (_ BitVec 64) V!14421 (_ BitVec 32) Int) Unit!12096)

(assert (=> b!399152 (= lt!187540 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!306 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38568 res!229464) b!399148))

(assert (= (and b!399148 res!229465) b!399141))

(assert (= (and b!399141 res!229472) b!399147))

(assert (= (and b!399147 res!229471) b!399145))

(assert (= (and b!399145 res!229463) b!399136))

(assert (= (and b!399136 res!229473) b!399143))

(assert (= (and b!399143 res!229468) b!399144))

(assert (= (and b!399144 res!229466) b!399149))

(assert (= (and b!399149 res!229469) b!399138))

(assert (= (and b!399138 res!229462) b!399142))

(assert (= (and b!399142 res!229470) b!399140))

(assert (= (and b!399140 res!229467) b!399152))

(assert (= (and b!399152 c!54614) b!399139))

(assert (= (and b!399152 (not c!54614)) b!399137))

(assert (= (or b!399139 b!399137) bm!27977))

(assert (= (or b!399139 b!399137) bm!27976))

(assert (= (and b!399151 condMapEmpty!16602) mapIsEmpty!16602))

(assert (= (and b!399151 (not condMapEmpty!16602)) mapNonEmpty!16602))

(get-info :version)

(assert (= (and mapNonEmpty!16602 ((_ is ValueCellFull!4650) mapValue!16602)) b!399150))

(assert (= (and b!399151 ((_ is ValueCellFull!4650) mapDefault!16602)) b!399146))

(assert (= start!38568 b!399151))

(declare-fun m!393761 () Bool)

(assert (=> bm!27977 m!393761))

(declare-fun m!393763 () Bool)

(assert (=> bm!27977 m!393763))

(declare-fun m!393765 () Bool)

(assert (=> b!399145 m!393765))

(declare-fun m!393767 () Bool)

(assert (=> mapNonEmpty!16602 m!393767))

(declare-fun m!393769 () Bool)

(assert (=> b!399148 m!393769))

(declare-fun m!393771 () Bool)

(assert (=> start!38568 m!393771))

(declare-fun m!393773 () Bool)

(assert (=> start!38568 m!393773))

(declare-fun m!393775 () Bool)

(assert (=> b!399139 m!393775))

(declare-fun m!393777 () Bool)

(assert (=> b!399142 m!393777))

(declare-fun m!393779 () Bool)

(assert (=> b!399143 m!393779))

(declare-fun m!393781 () Bool)

(assert (=> b!399152 m!393781))

(declare-fun m!393783 () Bool)

(assert (=> bm!27976 m!393783))

(declare-fun m!393785 () Bool)

(assert (=> b!399138 m!393785))

(declare-fun m!393787 () Bool)

(assert (=> b!399138 m!393787))

(declare-fun m!393789 () Bool)

(assert (=> b!399147 m!393789))

(declare-fun m!393791 () Bool)

(assert (=> b!399149 m!393791))

(declare-fun m!393793 () Bool)

(assert (=> b!399144 m!393793))

(check-sat (not start!38568) b_and!16491 tp_is_empty!9987 (not b!399139) (not b!399152) (not b!399145) (not b!399147) (not b!399138) (not bm!27976) (not mapNonEmpty!16602) (not b!399149) (not b_next!9105) (not b!399148) (not bm!27977) (not b!399142) (not b!399143))
(check-sat b_and!16491 (not b_next!9105))
