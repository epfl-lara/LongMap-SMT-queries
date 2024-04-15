; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38666 () Bool)

(assert start!38666)

(declare-fun b_free!9217 () Bool)

(declare-fun b_next!9217 () Bool)

(assert (=> start!38666 (= b_free!9217 (not b_next!9217))))

(declare-fun tp!32775 () Bool)

(declare-fun b_and!16577 () Bool)

(assert (=> start!38666 (= tp!32775 b_and!16577)))

(declare-fun b!401721 () Bool)

(declare-fun res!231351 () Bool)

(declare-fun e!242107 () Bool)

(assert (=> b!401721 (=> (not res!231351) (not e!242107))))

(declare-datatypes ((array!24083 0))(
  ( (array!24084 (arr!11491 (Array (_ BitVec 32) (_ BitVec 64))) (size!11844 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24083)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401721 (= res!231351 (or (= (select (arr!11491 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11491 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16770 () Bool)

(declare-fun mapRes!16770 () Bool)

(declare-fun tp!32774 () Bool)

(declare-fun e!242109 () Bool)

(assert (=> mapNonEmpty!16770 (= mapRes!16770 (and tp!32774 e!242109))))

(declare-datatypes ((V!14571 0))(
  ( (V!14572 (val!5094 Int)) )
))
(declare-datatypes ((ValueCell!4706 0))(
  ( (ValueCellFull!4706 (v!7335 V!14571)) (EmptyCell!4706) )
))
(declare-datatypes ((array!24085 0))(
  ( (array!24086 (arr!11492 (Array (_ BitVec 32) ValueCell!4706)) (size!11845 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24085)

(declare-fun mapValue!16770 () ValueCell!4706)

(declare-fun mapKey!16770 () (_ BitVec 32))

(declare-fun mapRest!16770 () (Array (_ BitVec 32) ValueCell!4706))

(assert (=> mapNonEmpty!16770 (= (arr!11492 _values!549) (store mapRest!16770 mapKey!16770 mapValue!16770))))

(declare-fun b!401722 () Bool)

(declare-fun e!242108 () Bool)

(declare-datatypes ((tuple2!6746 0))(
  ( (tuple2!6747 (_1!3384 (_ BitVec 64)) (_2!3384 V!14571)) )
))
(declare-datatypes ((List!6650 0))(
  ( (Nil!6647) (Cons!6646 (h!7502 tuple2!6746) (t!11815 List!6650)) )
))
(declare-datatypes ((ListLongMap!5649 0))(
  ( (ListLongMap!5650 (toList!2840 List!6650)) )
))
(declare-fun call!28291 () ListLongMap!5649)

(declare-fun call!28290 () ListLongMap!5649)

(assert (=> b!401722 (= e!242108 (= call!28291 call!28290))))

(declare-fun b!401723 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14571)

(declare-fun +!1145 (ListLongMap!5649 tuple2!6746) ListLongMap!5649)

(assert (=> b!401723 (= e!242108 (= call!28290 (+!1145 call!28291 (tuple2!6747 k0!794 v!412))))))

(declare-fun b!401724 () Bool)

(declare-fun res!231355 () Bool)

(assert (=> b!401724 (=> (not res!231355) (not e!242107))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24083 (_ BitVec 32)) Bool)

(assert (=> b!401724 (= res!231355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401725 () Bool)

(declare-fun res!231357 () Bool)

(assert (=> b!401725 (=> (not res!231357) (not e!242107))))

(declare-datatypes ((List!6651 0))(
  ( (Nil!6648) (Cons!6647 (h!7503 (_ BitVec 64)) (t!11816 List!6651)) )
))
(declare-fun arrayNoDuplicates!0 (array!24083 (_ BitVec 32) List!6651) Bool)

(assert (=> b!401725 (= res!231357 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6648))))

(declare-fun b!401726 () Bool)

(declare-fun res!231359 () Bool)

(assert (=> b!401726 (=> (not res!231359) (not e!242107))))

(declare-fun arrayContainsKey!0 (array!24083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401726 (= res!231359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401727 () Bool)

(declare-fun e!242111 () Bool)

(declare-fun e!242106 () Bool)

(assert (=> b!401727 (= e!242111 (and e!242106 mapRes!16770))))

(declare-fun condMapEmpty!16770 () Bool)

(declare-fun mapDefault!16770 () ValueCell!4706)

(assert (=> b!401727 (= condMapEmpty!16770 (= (arr!11492 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4706)) mapDefault!16770)))))

(declare-fun b!401728 () Bool)

(declare-fun e!242112 () Bool)

(assert (=> b!401728 (= e!242112 (not true))))

(assert (=> b!401728 e!242108))

(declare-fun c!54711 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401728 (= c!54711 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14571)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14571)

(declare-datatypes ((Unit!12144 0))(
  ( (Unit!12145) )
))
(declare-fun lt!187642 () Unit!12144)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 (array!24083 array!24085 (_ BitVec 32) (_ BitVec 32) V!14571 V!14571 (_ BitVec 32) (_ BitVec 64) V!14571 (_ BitVec 32) Int) Unit!12144)

(assert (=> b!401728 (= lt!187642 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401729 () Bool)

(declare-fun res!231352 () Bool)

(assert (=> b!401729 (=> (not res!231352) (not e!242112))))

(assert (=> b!401729 (= res!231352 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11844 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401730 () Bool)

(declare-fun tp_is_empty!10099 () Bool)

(assert (=> b!401730 (= e!242106 tp_is_empty!10099)))

(declare-fun res!231349 () Bool)

(assert (=> start!38666 (=> (not res!231349) (not e!242107))))

(assert (=> start!38666 (= res!231349 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11844 _keys!709))))))

(assert (=> start!38666 e!242107))

(assert (=> start!38666 tp_is_empty!10099))

(assert (=> start!38666 tp!32775))

(assert (=> start!38666 true))

(declare-fun array_inv!8432 (array!24085) Bool)

(assert (=> start!38666 (and (array_inv!8432 _values!549) e!242111)))

(declare-fun array_inv!8433 (array!24083) Bool)

(assert (=> start!38666 (array_inv!8433 _keys!709)))

(declare-fun b!401731 () Bool)

(declare-fun res!231354 () Bool)

(assert (=> b!401731 (=> (not res!231354) (not e!242107))))

(assert (=> b!401731 (= res!231354 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11844 _keys!709))))))

(declare-fun mapIsEmpty!16770 () Bool)

(assert (=> mapIsEmpty!16770 mapRes!16770))

(declare-fun b!401732 () Bool)

(declare-fun res!231356 () Bool)

(assert (=> b!401732 (=> (not res!231356) (not e!242107))))

(assert (=> b!401732 (= res!231356 (and (= (size!11845 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11844 _keys!709) (size!11845 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401733 () Bool)

(assert (=> b!401733 (= e!242107 e!242112)))

(declare-fun res!231353 () Bool)

(assert (=> b!401733 (=> (not res!231353) (not e!242112))))

(declare-fun lt!187643 () array!24083)

(assert (=> b!401733 (= res!231353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187643 mask!1025))))

(assert (=> b!401733 (= lt!187643 (array!24084 (store (arr!11491 _keys!709) i!563 k0!794) (size!11844 _keys!709)))))

(declare-fun bm!28287 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1057 (array!24083 array!24085 (_ BitVec 32) (_ BitVec 32) V!14571 V!14571 (_ BitVec 32) Int) ListLongMap!5649)

(assert (=> bm!28287 (= call!28290 (getCurrentListMapNoExtraKeys!1057 (ite c!54711 lt!187643 _keys!709) (ite c!54711 (array!24086 (store (arr!11492 _values!549) i!563 (ValueCellFull!4706 v!412)) (size!11845 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401734 () Bool)

(declare-fun res!231360 () Bool)

(assert (=> b!401734 (=> (not res!231360) (not e!242112))))

(assert (=> b!401734 (= res!231360 (arrayNoDuplicates!0 lt!187643 #b00000000000000000000000000000000 Nil!6648))))

(declare-fun bm!28288 () Bool)

(assert (=> bm!28288 (= call!28291 (getCurrentListMapNoExtraKeys!1057 (ite c!54711 _keys!709 lt!187643) (ite c!54711 _values!549 (array!24086 (store (arr!11492 _values!549) i!563 (ValueCellFull!4706 v!412)) (size!11845 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401735 () Bool)

(declare-fun res!231358 () Bool)

(assert (=> b!401735 (=> (not res!231358) (not e!242107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401735 (= res!231358 (validMask!0 mask!1025))))

(declare-fun b!401736 () Bool)

(declare-fun res!231350 () Bool)

(assert (=> b!401736 (=> (not res!231350) (not e!242107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401736 (= res!231350 (validKeyInArray!0 k0!794))))

(declare-fun b!401737 () Bool)

(assert (=> b!401737 (= e!242109 tp_is_empty!10099)))

(assert (= (and start!38666 res!231349) b!401735))

(assert (= (and b!401735 res!231358) b!401732))

(assert (= (and b!401732 res!231356) b!401724))

(assert (= (and b!401724 res!231355) b!401725))

(assert (= (and b!401725 res!231357) b!401731))

(assert (= (and b!401731 res!231354) b!401736))

(assert (= (and b!401736 res!231350) b!401721))

(assert (= (and b!401721 res!231351) b!401726))

(assert (= (and b!401726 res!231359) b!401733))

(assert (= (and b!401733 res!231353) b!401734))

(assert (= (and b!401734 res!231360) b!401729))

(assert (= (and b!401729 res!231352) b!401728))

(assert (= (and b!401728 c!54711) b!401723))

(assert (= (and b!401728 (not c!54711)) b!401722))

(assert (= (or b!401723 b!401722) bm!28287))

(assert (= (or b!401723 b!401722) bm!28288))

(assert (= (and b!401727 condMapEmpty!16770) mapIsEmpty!16770))

(assert (= (and b!401727 (not condMapEmpty!16770)) mapNonEmpty!16770))

(get-info :version)

(assert (= (and mapNonEmpty!16770 ((_ is ValueCellFull!4706) mapValue!16770)) b!401737))

(assert (= (and b!401727 ((_ is ValueCellFull!4706) mapDefault!16770)) b!401730))

(assert (= start!38666 b!401727))

(declare-fun m!394941 () Bool)

(assert (=> b!401721 m!394941))

(declare-fun m!394943 () Bool)

(assert (=> bm!28288 m!394943))

(declare-fun m!394945 () Bool)

(assert (=> bm!28288 m!394945))

(declare-fun m!394947 () Bool)

(assert (=> b!401723 m!394947))

(declare-fun m!394949 () Bool)

(assert (=> b!401733 m!394949))

(declare-fun m!394951 () Bool)

(assert (=> b!401733 m!394951))

(assert (=> bm!28287 m!394943))

(declare-fun m!394953 () Bool)

(assert (=> bm!28287 m!394953))

(declare-fun m!394955 () Bool)

(assert (=> b!401724 m!394955))

(declare-fun m!394957 () Bool)

(assert (=> b!401736 m!394957))

(declare-fun m!394959 () Bool)

(assert (=> b!401728 m!394959))

(declare-fun m!394961 () Bool)

(assert (=> b!401734 m!394961))

(declare-fun m!394963 () Bool)

(assert (=> b!401735 m!394963))

(declare-fun m!394965 () Bool)

(assert (=> b!401726 m!394965))

(declare-fun m!394967 () Bool)

(assert (=> mapNonEmpty!16770 m!394967))

(declare-fun m!394969 () Bool)

(assert (=> b!401725 m!394969))

(declare-fun m!394971 () Bool)

(assert (=> start!38666 m!394971))

(declare-fun m!394973 () Bool)

(assert (=> start!38666 m!394973))

(check-sat (not b!401736) (not b!401726) (not b!401735) (not b!401725) (not mapNonEmpty!16770) (not start!38666) (not b!401723) b_and!16577 (not bm!28288) (not bm!28287) (not b!401724) (not b!401733) tp_is_empty!10099 (not b_next!9217) (not b!401734) (not b!401728))
(check-sat b_and!16577 (not b_next!9217))
