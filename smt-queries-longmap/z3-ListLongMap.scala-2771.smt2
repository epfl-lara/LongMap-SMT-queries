; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40480 () Bool)

(assert start!40480)

(declare-fun b_free!10551 () Bool)

(declare-fun b_next!10551 () Bool)

(assert (=> start!40480 (= b_free!10551 (not b_next!10551))))

(declare-fun tp!37431 () Bool)

(declare-fun b_and!18535 () Bool)

(assert (=> start!40480 (= tp!37431 b_and!18535)))

(declare-fun b!445807 () Bool)

(declare-fun res!264570 () Bool)

(declare-fun e!261984 () Bool)

(assert (=> b!445807 (=> (not res!264570) (not e!261984))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27537 0))(
  ( (array!27538 (arr!13216 (Array (_ BitVec 32) (_ BitVec 64))) (size!13568 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27537)

(assert (=> b!445807 (= res!264570 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13568 _keys!709))))))

(declare-datatypes ((V!16925 0))(
  ( (V!16926 (val!5977 Int)) )
))
(declare-fun minValue!515 () V!16925)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7852 0))(
  ( (tuple2!7853 (_1!3937 (_ BitVec 64)) (_2!3937 V!16925)) )
))
(declare-datatypes ((List!7903 0))(
  ( (Nil!7900) (Cons!7899 (h!8755 tuple2!7852) (t!13661 List!7903)) )
))
(declare-datatypes ((ListLongMap!6765 0))(
  ( (ListLongMap!6766 (toList!3398 List!7903)) )
))
(declare-fun call!29609 () ListLongMap!6765)

(declare-fun lt!203678 () array!27537)

(declare-datatypes ((ValueCell!5589 0))(
  ( (ValueCellFull!5589 (v!8228 V!16925)) (EmptyCell!5589) )
))
(declare-datatypes ((array!27539 0))(
  ( (array!27540 (arr!13217 (Array (_ BitVec 32) ValueCell!5589)) (size!13569 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27539)

(declare-fun zeroValue!515 () V!16925)

(declare-fun bm!29606 () Bool)

(declare-fun v!412 () V!16925)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!55872 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1585 (array!27537 array!27539 (_ BitVec 32) (_ BitVec 32) V!16925 V!16925 (_ BitVec 32) Int) ListLongMap!6765)

(assert (=> bm!29606 (= call!29609 (getCurrentListMapNoExtraKeys!1585 (ite c!55872 lt!203678 _keys!709) (ite c!55872 (array!27540 (store (arr!13217 _values!549) i!563 (ValueCellFull!5589 v!412)) (size!13569 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445808 () Bool)

(declare-fun e!261985 () Bool)

(assert (=> b!445808 (= e!261984 e!261985)))

(declare-fun res!264577 () Bool)

(assert (=> b!445808 (=> (not res!264577) (not e!261985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27537 (_ BitVec 32)) Bool)

(assert (=> b!445808 (= res!264577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203678 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!445808 (= lt!203678 (array!27538 (store (arr!13216 _keys!709) i!563 k0!794) (size!13568 _keys!709)))))

(declare-fun b!445809 () Bool)

(declare-fun res!264568 () Bool)

(assert (=> b!445809 (=> (not res!264568) (not e!261984))))

(assert (=> b!445809 (= res!264568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19425 () Bool)

(declare-fun mapRes!19425 () Bool)

(assert (=> mapIsEmpty!19425 mapRes!19425))

(declare-fun b!445810 () Bool)

(declare-fun res!264566 () Bool)

(assert (=> b!445810 (=> (not res!264566) (not e!261984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445810 (= res!264566 (validKeyInArray!0 k0!794))))

(declare-fun b!445811 () Bool)

(declare-fun res!264572 () Bool)

(assert (=> b!445811 (=> (not res!264572) (not e!261985))))

(declare-datatypes ((List!7904 0))(
  ( (Nil!7901) (Cons!7900 (h!8756 (_ BitVec 64)) (t!13662 List!7904)) )
))
(declare-fun arrayNoDuplicates!0 (array!27537 (_ BitVec 32) List!7904) Bool)

(assert (=> b!445811 (= res!264572 (arrayNoDuplicates!0 lt!203678 #b00000000000000000000000000000000 Nil!7901))))

(declare-fun b!445813 () Bool)

(declare-fun e!261981 () Bool)

(declare-fun tp_is_empty!11865 () Bool)

(assert (=> b!445813 (= e!261981 tp_is_empty!11865)))

(declare-fun b!445814 () Bool)

(declare-fun e!261982 () Bool)

(assert (=> b!445814 (= e!261982 tp_is_empty!11865)))

(declare-fun b!445815 () Bool)

(declare-fun res!264575 () Bool)

(assert (=> b!445815 (=> (not res!264575) (not e!261984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445815 (= res!264575 (validMask!0 mask!1025))))

(declare-fun b!445816 () Bool)

(declare-fun res!264567 () Bool)

(assert (=> b!445816 (=> (not res!264567) (not e!261984))))

(assert (=> b!445816 (= res!264567 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7901))))

(declare-fun b!445817 () Bool)

(declare-fun e!261983 () Bool)

(assert (=> b!445817 (= e!261983 (and e!261981 mapRes!19425))))

(declare-fun condMapEmpty!19425 () Bool)

(declare-fun mapDefault!19425 () ValueCell!5589)

(assert (=> b!445817 (= condMapEmpty!19425 (= (arr!13217 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5589)) mapDefault!19425)))))

(declare-fun b!445818 () Bool)

(declare-fun e!261986 () Bool)

(declare-fun call!29610 () ListLongMap!6765)

(declare-fun +!1529 (ListLongMap!6765 tuple2!7852) ListLongMap!6765)

(assert (=> b!445818 (= e!261986 (= call!29609 (+!1529 call!29610 (tuple2!7853 k0!794 v!412))))))

(declare-fun b!445819 () Bool)

(assert (=> b!445819 (= e!261986 (= call!29610 call!29609))))

(declare-fun b!445820 () Bool)

(assert (=> b!445820 (= e!261985 (not true))))

(assert (=> b!445820 e!261986))

(assert (=> b!445820 (= c!55872 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13168 0))(
  ( (Unit!13169) )
))
(declare-fun lt!203677 () Unit!13168)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!700 (array!27537 array!27539 (_ BitVec 32) (_ BitVec 32) V!16925 V!16925 (_ BitVec 32) (_ BitVec 64) V!16925 (_ BitVec 32) Int) Unit!13168)

(assert (=> b!445820 (= lt!203677 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!700 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445821 () Bool)

(declare-fun res!264574 () Bool)

(assert (=> b!445821 (=> (not res!264574) (not e!261985))))

(assert (=> b!445821 (= res!264574 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13568 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!29607 () Bool)

(assert (=> bm!29607 (= call!29610 (getCurrentListMapNoExtraKeys!1585 (ite c!55872 _keys!709 lt!203678) (ite c!55872 _values!549 (array!27540 (store (arr!13217 _values!549) i!563 (ValueCellFull!5589 v!412)) (size!13569 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445822 () Bool)

(declare-fun res!264573 () Bool)

(assert (=> b!445822 (=> (not res!264573) (not e!261984))))

(assert (=> b!445822 (= res!264573 (or (= (select (arr!13216 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13216 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445812 () Bool)

(declare-fun res!264569 () Bool)

(assert (=> b!445812 (=> (not res!264569) (not e!261984))))

(assert (=> b!445812 (= res!264569 (and (= (size!13569 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13568 _keys!709) (size!13569 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!264571 () Bool)

(assert (=> start!40480 (=> (not res!264571) (not e!261984))))

(assert (=> start!40480 (= res!264571 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13568 _keys!709))))))

(assert (=> start!40480 e!261984))

(assert (=> start!40480 tp_is_empty!11865))

(assert (=> start!40480 tp!37431))

(assert (=> start!40480 true))

(declare-fun array_inv!9584 (array!27539) Bool)

(assert (=> start!40480 (and (array_inv!9584 _values!549) e!261983)))

(declare-fun array_inv!9585 (array!27537) Bool)

(assert (=> start!40480 (array_inv!9585 _keys!709)))

(declare-fun mapNonEmpty!19425 () Bool)

(declare-fun tp!37430 () Bool)

(assert (=> mapNonEmpty!19425 (= mapRes!19425 (and tp!37430 e!261982))))

(declare-fun mapRest!19425 () (Array (_ BitVec 32) ValueCell!5589))

(declare-fun mapValue!19425 () ValueCell!5589)

(declare-fun mapKey!19425 () (_ BitVec 32))

(assert (=> mapNonEmpty!19425 (= (arr!13217 _values!549) (store mapRest!19425 mapKey!19425 mapValue!19425))))

(declare-fun b!445823 () Bool)

(declare-fun res!264576 () Bool)

(assert (=> b!445823 (=> (not res!264576) (not e!261984))))

(declare-fun arrayContainsKey!0 (array!27537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445823 (= res!264576 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40480 res!264571) b!445815))

(assert (= (and b!445815 res!264575) b!445812))

(assert (= (and b!445812 res!264569) b!445809))

(assert (= (and b!445809 res!264568) b!445816))

(assert (= (and b!445816 res!264567) b!445807))

(assert (= (and b!445807 res!264570) b!445810))

(assert (= (and b!445810 res!264566) b!445822))

(assert (= (and b!445822 res!264573) b!445823))

(assert (= (and b!445823 res!264576) b!445808))

(assert (= (and b!445808 res!264577) b!445811))

(assert (= (and b!445811 res!264572) b!445821))

(assert (= (and b!445821 res!264574) b!445820))

(assert (= (and b!445820 c!55872) b!445818))

(assert (= (and b!445820 (not c!55872)) b!445819))

(assert (= (or b!445818 b!445819) bm!29606))

(assert (= (or b!445818 b!445819) bm!29607))

(assert (= (and b!445817 condMapEmpty!19425) mapIsEmpty!19425))

(assert (= (and b!445817 (not condMapEmpty!19425)) mapNonEmpty!19425))

(get-info :version)

(assert (= (and mapNonEmpty!19425 ((_ is ValueCellFull!5589) mapValue!19425)) b!445814))

(assert (= (and b!445817 ((_ is ValueCellFull!5589) mapDefault!19425)) b!445813))

(assert (= start!40480 b!445817))

(declare-fun m!431171 () Bool)

(assert (=> b!445809 m!431171))

(declare-fun m!431173 () Bool)

(assert (=> b!445815 m!431173))

(declare-fun m!431175 () Bool)

(assert (=> b!445811 m!431175))

(declare-fun m!431177 () Bool)

(assert (=> b!445818 m!431177))

(declare-fun m!431179 () Bool)

(assert (=> b!445808 m!431179))

(declare-fun m!431181 () Bool)

(assert (=> b!445808 m!431181))

(declare-fun m!431183 () Bool)

(assert (=> b!445816 m!431183))

(declare-fun m!431185 () Bool)

(assert (=> b!445822 m!431185))

(declare-fun m!431187 () Bool)

(assert (=> start!40480 m!431187))

(declare-fun m!431189 () Bool)

(assert (=> start!40480 m!431189))

(declare-fun m!431191 () Bool)

(assert (=> b!445823 m!431191))

(declare-fun m!431193 () Bool)

(assert (=> b!445820 m!431193))

(declare-fun m!431195 () Bool)

(assert (=> b!445810 m!431195))

(declare-fun m!431197 () Bool)

(assert (=> mapNonEmpty!19425 m!431197))

(declare-fun m!431199 () Bool)

(assert (=> bm!29607 m!431199))

(declare-fun m!431201 () Bool)

(assert (=> bm!29607 m!431201))

(assert (=> bm!29606 m!431199))

(declare-fun m!431203 () Bool)

(assert (=> bm!29606 m!431203))

(check-sat (not b_next!10551) (not b!445820) (not start!40480) (not mapNonEmpty!19425) (not b!445810) (not b!445811) (not bm!29607) (not b!445816) b_and!18535 (not b!445818) (not b!445808) (not b!445809) (not bm!29606) (not b!445823) (not b!445815) tp_is_empty!11865)
(check-sat b_and!18535 (not b_next!10551))
