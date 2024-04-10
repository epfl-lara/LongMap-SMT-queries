; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38712 () Bool)

(assert start!38712)

(declare-fun b_free!9249 () Bool)

(declare-fun b_next!9249 () Bool)

(assert (=> start!38712 (= b_free!9249 (not b_next!9249))))

(declare-fun tp!32871 () Bool)

(declare-fun b_and!16635 () Bool)

(assert (=> start!38712 (= tp!32871 b_and!16635)))

(declare-fun mapNonEmpty!16818 () Bool)

(declare-fun mapRes!16818 () Bool)

(declare-fun tp!32870 () Bool)

(declare-fun e!242619 () Bool)

(assert (=> mapNonEmpty!16818 (= mapRes!16818 (and tp!32870 e!242619))))

(declare-datatypes ((V!14613 0))(
  ( (V!14614 (val!5110 Int)) )
))
(declare-datatypes ((ValueCell!4722 0))(
  ( (ValueCellFull!4722 (v!7357 V!14613)) (EmptyCell!4722) )
))
(declare-datatypes ((array!24167 0))(
  ( (array!24168 (arr!11533 (Array (_ BitVec 32) ValueCell!4722)) (size!11885 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24167)

(declare-fun mapRest!16818 () (Array (_ BitVec 32) ValueCell!4722))

(declare-fun mapValue!16818 () ValueCell!4722)

(declare-fun mapKey!16818 () (_ BitVec 32))

(assert (=> mapNonEmpty!16818 (= (arr!11533 _values!549) (store mapRest!16818 mapKey!16818 mapValue!16818))))

(declare-fun b!402808 () Bool)

(declare-fun e!242617 () Bool)

(declare-fun e!242622 () Bool)

(assert (=> b!402808 (= e!242617 (and e!242622 mapRes!16818))))

(declare-fun condMapEmpty!16818 () Bool)

(declare-fun mapDefault!16818 () ValueCell!4722)

(assert (=> b!402808 (= condMapEmpty!16818 (= (arr!11533 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4722)) mapDefault!16818)))))

(declare-fun b!402809 () Bool)

(declare-fun res!232064 () Bool)

(declare-fun e!242616 () Bool)

(assert (=> b!402809 (=> (not res!232064) (not e!242616))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24169 0))(
  ( (array!24170 (arr!11534 (Array (_ BitVec 32) (_ BitVec 64))) (size!11886 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24169)

(assert (=> b!402809 (= res!232064 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11886 _keys!709))))))

(declare-fun b!402810 () Bool)

(declare-fun res!232059 () Bool)

(assert (=> b!402810 (=> (not res!232059) (not e!242616))))

(assert (=> b!402810 (= res!232059 (or (= (select (arr!11534 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11534 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402811 () Bool)

(declare-fun res!232058 () Bool)

(assert (=> b!402811 (=> (not res!232058) (not e!242616))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402811 (= res!232058 (validMask!0 mask!1025))))

(declare-fun b!402812 () Bool)

(declare-fun res!232062 () Bool)

(assert (=> b!402812 (=> (not res!232062) (not e!242616))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402812 (= res!232062 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402813 () Bool)

(declare-fun res!232056 () Bool)

(assert (=> b!402813 (=> (not res!232056) (not e!242616))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!402813 (= res!232056 (and (= (size!11885 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11886 _keys!709) (size!11885 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402814 () Bool)

(declare-fun res!232061 () Bool)

(assert (=> b!402814 (=> (not res!232061) (not e!242616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402814 (= res!232061 (validKeyInArray!0 k0!794))))

(declare-fun b!402815 () Bool)

(declare-fun e!242620 () Bool)

(declare-datatypes ((tuple2!6788 0))(
  ( (tuple2!6789 (_1!3405 (_ BitVec 64)) (_2!3405 V!14613)) )
))
(declare-datatypes ((List!6710 0))(
  ( (Nil!6707) (Cons!6706 (h!7562 tuple2!6788) (t!11884 List!6710)) )
))
(declare-datatypes ((ListLongMap!5701 0))(
  ( (ListLongMap!5702 (toList!2866 List!6710)) )
))
(declare-fun call!28412 () ListLongMap!5701)

(declare-fun call!28411 () ListLongMap!5701)

(assert (=> b!402815 (= e!242620 (= call!28412 call!28411))))

(declare-fun mapIsEmpty!16818 () Bool)

(assert (=> mapIsEmpty!16818 mapRes!16818))

(declare-fun b!402816 () Bool)

(declare-fun res!232057 () Bool)

(assert (=> b!402816 (=> (not res!232057) (not e!242616))))

(declare-datatypes ((List!6711 0))(
  ( (Nil!6708) (Cons!6707 (h!7563 (_ BitVec 64)) (t!11885 List!6711)) )
))
(declare-fun arrayNoDuplicates!0 (array!24169 (_ BitVec 32) List!6711) Bool)

(assert (=> b!402816 (= res!232057 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6708))))

(declare-fun b!402817 () Bool)

(declare-fun res!232054 () Bool)

(declare-fun e!242621 () Bool)

(assert (=> b!402817 (=> (not res!232054) (not e!242621))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402817 (= res!232054 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11886 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!14613)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14613)

(declare-fun lt!187973 () array!24169)

(declare-fun c!54830 () Bool)

(declare-fun v!412 () V!14613)

(declare-fun bm!28408 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1076 (array!24169 array!24167 (_ BitVec 32) (_ BitVec 32) V!14613 V!14613 (_ BitVec 32) Int) ListLongMap!5701)

(assert (=> bm!28408 (= call!28411 (getCurrentListMapNoExtraKeys!1076 (ite c!54830 lt!187973 _keys!709) (ite c!54830 (array!24168 (store (arr!11533 _values!549) i!563 (ValueCellFull!4722 v!412)) (size!11885 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!232065 () Bool)

(assert (=> start!38712 (=> (not res!232065) (not e!242616))))

(assert (=> start!38712 (= res!232065 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11886 _keys!709))))))

(assert (=> start!38712 e!242616))

(declare-fun tp_is_empty!10131 () Bool)

(assert (=> start!38712 tp_is_empty!10131))

(assert (=> start!38712 tp!32871))

(assert (=> start!38712 true))

(declare-fun array_inv!8438 (array!24167) Bool)

(assert (=> start!38712 (and (array_inv!8438 _values!549) e!242617)))

(declare-fun array_inv!8439 (array!24169) Bool)

(assert (=> start!38712 (array_inv!8439 _keys!709)))

(declare-fun b!402818 () Bool)

(assert (=> b!402818 (= e!242621 (not true))))

(assert (=> b!402818 e!242620))

(assert (=> b!402818 (= c!54830 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12194 0))(
  ( (Unit!12195) )
))
(declare-fun lt!187972 () Unit!12194)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!355 (array!24169 array!24167 (_ BitVec 32) (_ BitVec 32) V!14613 V!14613 (_ BitVec 32) (_ BitVec 64) V!14613 (_ BitVec 32) Int) Unit!12194)

(assert (=> b!402818 (= lt!187972 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!355 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402819 () Bool)

(assert (=> b!402819 (= e!242619 tp_is_empty!10131)))

(declare-fun b!402820 () Bool)

(declare-fun res!232055 () Bool)

(assert (=> b!402820 (=> (not res!232055) (not e!242621))))

(assert (=> b!402820 (= res!232055 (arrayNoDuplicates!0 lt!187973 #b00000000000000000000000000000000 Nil!6708))))

(declare-fun b!402821 () Bool)

(assert (=> b!402821 (= e!242616 e!242621)))

(declare-fun res!232063 () Bool)

(assert (=> b!402821 (=> (not res!232063) (not e!242621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24169 (_ BitVec 32)) Bool)

(assert (=> b!402821 (= res!232063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187973 mask!1025))))

(assert (=> b!402821 (= lt!187973 (array!24170 (store (arr!11534 _keys!709) i!563 k0!794) (size!11886 _keys!709)))))

(declare-fun b!402822 () Bool)

(assert (=> b!402822 (= e!242622 tp_is_empty!10131)))

(declare-fun bm!28409 () Bool)

(assert (=> bm!28409 (= call!28412 (getCurrentListMapNoExtraKeys!1076 (ite c!54830 _keys!709 lt!187973) (ite c!54830 _values!549 (array!24168 (store (arr!11533 _values!549) i!563 (ValueCellFull!4722 v!412)) (size!11885 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402823 () Bool)

(declare-fun +!1142 (ListLongMap!5701 tuple2!6788) ListLongMap!5701)

(assert (=> b!402823 (= e!242620 (= call!28411 (+!1142 call!28412 (tuple2!6789 k0!794 v!412))))))

(declare-fun b!402824 () Bool)

(declare-fun res!232060 () Bool)

(assert (=> b!402824 (=> (not res!232060) (not e!242616))))

(assert (=> b!402824 (= res!232060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38712 res!232065) b!402811))

(assert (= (and b!402811 res!232058) b!402813))

(assert (= (and b!402813 res!232056) b!402824))

(assert (= (and b!402824 res!232060) b!402816))

(assert (= (and b!402816 res!232057) b!402809))

(assert (= (and b!402809 res!232064) b!402814))

(assert (= (and b!402814 res!232061) b!402810))

(assert (= (and b!402810 res!232059) b!402812))

(assert (= (and b!402812 res!232062) b!402821))

(assert (= (and b!402821 res!232063) b!402820))

(assert (= (and b!402820 res!232055) b!402817))

(assert (= (and b!402817 res!232054) b!402818))

(assert (= (and b!402818 c!54830) b!402823))

(assert (= (and b!402818 (not c!54830)) b!402815))

(assert (= (or b!402823 b!402815) bm!28408))

(assert (= (or b!402823 b!402815) bm!28409))

(assert (= (and b!402808 condMapEmpty!16818) mapIsEmpty!16818))

(assert (= (and b!402808 (not condMapEmpty!16818)) mapNonEmpty!16818))

(get-info :version)

(assert (= (and mapNonEmpty!16818 ((_ is ValueCellFull!4722) mapValue!16818)) b!402819))

(assert (= (and b!402808 ((_ is ValueCellFull!4722) mapDefault!16818)) b!402822))

(assert (= start!38712 b!402808))

(declare-fun m!396209 () Bool)

(assert (=> b!402823 m!396209))

(declare-fun m!396211 () Bool)

(assert (=> b!402821 m!396211))

(declare-fun m!396213 () Bool)

(assert (=> b!402821 m!396213))

(declare-fun m!396215 () Bool)

(assert (=> mapNonEmpty!16818 m!396215))

(declare-fun m!396217 () Bool)

(assert (=> b!402818 m!396217))

(declare-fun m!396219 () Bool)

(assert (=> start!38712 m!396219))

(declare-fun m!396221 () Bool)

(assert (=> start!38712 m!396221))

(declare-fun m!396223 () Bool)

(assert (=> bm!28408 m!396223))

(declare-fun m!396225 () Bool)

(assert (=> bm!28408 m!396225))

(declare-fun m!396227 () Bool)

(assert (=> b!402811 m!396227))

(declare-fun m!396229 () Bool)

(assert (=> b!402816 m!396229))

(declare-fun m!396231 () Bool)

(assert (=> b!402824 m!396231))

(declare-fun m!396233 () Bool)

(assert (=> b!402812 m!396233))

(declare-fun m!396235 () Bool)

(assert (=> b!402814 m!396235))

(declare-fun m!396237 () Bool)

(assert (=> b!402820 m!396237))

(declare-fun m!396239 () Bool)

(assert (=> b!402810 m!396239))

(assert (=> bm!28409 m!396223))

(declare-fun m!396241 () Bool)

(assert (=> bm!28409 m!396241))

(check-sat (not bm!28408) (not b!402821) (not b!402816) (not b!402811) (not b!402823) (not start!38712) (not bm!28409) (not b!402820) (not b_next!9249) (not b!402812) (not b!402818) b_and!16635 (not b!402814) (not b!402824) (not mapNonEmpty!16818) tp_is_empty!10131)
(check-sat b_and!16635 (not b_next!9249))
