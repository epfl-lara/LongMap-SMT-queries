; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38630 () Bool)

(assert start!38630)

(declare-fun b_free!9181 () Bool)

(declare-fun b_next!9181 () Bool)

(assert (=> start!38630 (= b_free!9181 (not b_next!9181))))

(declare-fun tp!32667 () Bool)

(declare-fun b_and!16541 () Bool)

(assert (=> start!38630 (= tp!32667 b_and!16541)))

(declare-fun b!400803 () Bool)

(declare-fun res!230703 () Bool)

(declare-fun e!241728 () Bool)

(assert (=> b!400803 (=> (not res!230703) (not e!241728))))

(declare-datatypes ((array!24013 0))(
  ( (array!24014 (arr!11456 (Array (_ BitVec 32) (_ BitVec 64))) (size!11809 (_ BitVec 32))) )
))
(declare-fun lt!187535 () array!24013)

(declare-datatypes ((List!6618 0))(
  ( (Nil!6615) (Cons!6614 (h!7470 (_ BitVec 64)) (t!11783 List!6618)) )
))
(declare-fun arrayNoDuplicates!0 (array!24013 (_ BitVec 32) List!6618) Bool)

(assert (=> b!400803 (= res!230703 (arrayNoDuplicates!0 lt!187535 #b00000000000000000000000000000000 Nil!6615))))

(declare-fun mapIsEmpty!16716 () Bool)

(declare-fun mapRes!16716 () Bool)

(assert (=> mapIsEmpty!16716 mapRes!16716))

(declare-fun b!400804 () Bool)

(declare-fun res!230701 () Bool)

(declare-fun e!241734 () Bool)

(assert (=> b!400804 (=> (not res!230701) (not e!241734))))

(declare-fun _keys!709 () array!24013)

(assert (=> b!400804 (= res!230701 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6615))))

(declare-fun b!400805 () Bool)

(declare-fun e!241732 () Bool)

(declare-datatypes ((V!14523 0))(
  ( (V!14524 (val!5076 Int)) )
))
(declare-datatypes ((tuple2!6712 0))(
  ( (tuple2!6713 (_1!3367 (_ BitVec 64)) (_2!3367 V!14523)) )
))
(declare-datatypes ((List!6619 0))(
  ( (Nil!6616) (Cons!6615 (h!7471 tuple2!6712) (t!11784 List!6619)) )
))
(declare-datatypes ((ListLongMap!5615 0))(
  ( (ListLongMap!5616 (toList!2823 List!6619)) )
))
(declare-fun call!28182 () ListLongMap!5615)

(declare-fun call!28183 () ListLongMap!5615)

(assert (=> b!400805 (= e!241732 (= call!28182 call!28183))))

(declare-fun b!400806 () Bool)

(declare-fun res!230709 () Bool)

(assert (=> b!400806 (=> (not res!230709) (not e!241734))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400806 (= res!230709 (or (= (select (arr!11456 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11456 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400807 () Bool)

(declare-fun res!230711 () Bool)

(assert (=> b!400807 (=> (not res!230711) (not e!241728))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400807 (= res!230711 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11809 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400808 () Bool)

(declare-fun res!230708 () Bool)

(assert (=> b!400808 (=> (not res!230708) (not e!241734))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400808 (= res!230708 (validKeyInArray!0 k0!794))))

(declare-fun minValue!515 () V!14523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4688 0))(
  ( (ValueCellFull!4688 (v!7317 V!14523)) (EmptyCell!4688) )
))
(declare-datatypes ((array!24015 0))(
  ( (array!24016 (arr!11457 (Array (_ BitVec 32) ValueCell!4688)) (size!11810 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24015)

(declare-fun zeroValue!515 () V!14523)

(declare-fun c!54657 () Bool)

(declare-fun v!412 () V!14523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28179 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1041 (array!24013 array!24015 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) Int) ListLongMap!5615)

(assert (=> bm!28179 (= call!28183 (getCurrentListMapNoExtraKeys!1041 (ite c!54657 lt!187535 _keys!709) (ite c!54657 (array!24016 (store (arr!11457 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11810 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400809 () Bool)

(assert (=> b!400809 (= e!241734 e!241728)))

(declare-fun res!230712 () Bool)

(assert (=> b!400809 (=> (not res!230712) (not e!241728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24013 (_ BitVec 32)) Bool)

(assert (=> b!400809 (= res!230712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187535 mask!1025))))

(assert (=> b!400809 (= lt!187535 (array!24014 (store (arr!11456 _keys!709) i!563 k0!794) (size!11809 _keys!709)))))

(declare-fun b!400810 () Bool)

(declare-fun res!230710 () Bool)

(assert (=> b!400810 (=> (not res!230710) (not e!241734))))

(assert (=> b!400810 (= res!230710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230704 () Bool)

(assert (=> start!38630 (=> (not res!230704) (not e!241734))))

(assert (=> start!38630 (= res!230704 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11809 _keys!709))))))

(assert (=> start!38630 e!241734))

(declare-fun tp_is_empty!10063 () Bool)

(assert (=> start!38630 tp_is_empty!10063))

(assert (=> start!38630 tp!32667))

(assert (=> start!38630 true))

(declare-fun e!241729 () Bool)

(declare-fun array_inv!8402 (array!24015) Bool)

(assert (=> start!38630 (and (array_inv!8402 _values!549) e!241729)))

(declare-fun array_inv!8403 (array!24013) Bool)

(assert (=> start!38630 (array_inv!8403 _keys!709)))

(declare-fun b!400811 () Bool)

(declare-fun e!241730 () Bool)

(assert (=> b!400811 (= e!241730 tp_is_empty!10063)))

(declare-fun b!400812 () Bool)

(declare-fun +!1130 (ListLongMap!5615 tuple2!6712) ListLongMap!5615)

(assert (=> b!400812 (= e!241732 (= call!28183 (+!1130 call!28182 (tuple2!6713 k0!794 v!412))))))

(declare-fun b!400813 () Bool)

(assert (=> b!400813 (= e!241729 (and e!241730 mapRes!16716))))

(declare-fun condMapEmpty!16716 () Bool)

(declare-fun mapDefault!16716 () ValueCell!4688)

(assert (=> b!400813 (= condMapEmpty!16716 (= (arr!11457 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4688)) mapDefault!16716)))))

(declare-fun b!400814 () Bool)

(assert (=> b!400814 (= e!241728 (not true))))

(assert (=> b!400814 e!241732))

(assert (=> b!400814 (= c!54657 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12118 0))(
  ( (Unit!12119) )
))
(declare-fun lt!187534 () Unit!12118)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!322 (array!24013 array!24015 (_ BitVec 32) (_ BitVec 32) V!14523 V!14523 (_ BitVec 32) (_ BitVec 64) V!14523 (_ BitVec 32) Int) Unit!12118)

(assert (=> b!400814 (= lt!187534 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!322 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28180 () Bool)

(assert (=> bm!28180 (= call!28182 (getCurrentListMapNoExtraKeys!1041 (ite c!54657 _keys!709 lt!187535) (ite c!54657 _values!549 (array!24016 (store (arr!11457 _values!549) i!563 (ValueCellFull!4688 v!412)) (size!11810 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400815 () Bool)

(declare-fun e!241733 () Bool)

(assert (=> b!400815 (= e!241733 tp_is_empty!10063)))

(declare-fun mapNonEmpty!16716 () Bool)

(declare-fun tp!32666 () Bool)

(assert (=> mapNonEmpty!16716 (= mapRes!16716 (and tp!32666 e!241733))))

(declare-fun mapRest!16716 () (Array (_ BitVec 32) ValueCell!4688))

(declare-fun mapKey!16716 () (_ BitVec 32))

(declare-fun mapValue!16716 () ValueCell!4688)

(assert (=> mapNonEmpty!16716 (= (arr!11457 _values!549) (store mapRest!16716 mapKey!16716 mapValue!16716))))

(declare-fun b!400816 () Bool)

(declare-fun res!230702 () Bool)

(assert (=> b!400816 (=> (not res!230702) (not e!241734))))

(assert (=> b!400816 (= res!230702 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11809 _keys!709))))))

(declare-fun b!400817 () Bool)

(declare-fun res!230705 () Bool)

(assert (=> b!400817 (=> (not res!230705) (not e!241734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400817 (= res!230705 (validMask!0 mask!1025))))

(declare-fun b!400818 () Bool)

(declare-fun res!230707 () Bool)

(assert (=> b!400818 (=> (not res!230707) (not e!241734))))

(assert (=> b!400818 (= res!230707 (and (= (size!11810 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11809 _keys!709) (size!11810 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400819 () Bool)

(declare-fun res!230706 () Bool)

(assert (=> b!400819 (=> (not res!230706) (not e!241734))))

(declare-fun arrayContainsKey!0 (array!24013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400819 (= res!230706 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38630 res!230704) b!400817))

(assert (= (and b!400817 res!230705) b!400818))

(assert (= (and b!400818 res!230707) b!400810))

(assert (= (and b!400810 res!230710) b!400804))

(assert (= (and b!400804 res!230701) b!400816))

(assert (= (and b!400816 res!230702) b!400808))

(assert (= (and b!400808 res!230708) b!400806))

(assert (= (and b!400806 res!230709) b!400819))

(assert (= (and b!400819 res!230706) b!400809))

(assert (= (and b!400809 res!230712) b!400803))

(assert (= (and b!400803 res!230703) b!400807))

(assert (= (and b!400807 res!230711) b!400814))

(assert (= (and b!400814 c!54657) b!400812))

(assert (= (and b!400814 (not c!54657)) b!400805))

(assert (= (or b!400812 b!400805) bm!28179))

(assert (= (or b!400812 b!400805) bm!28180))

(assert (= (and b!400813 condMapEmpty!16716) mapIsEmpty!16716))

(assert (= (and b!400813 (not condMapEmpty!16716)) mapNonEmpty!16716))

(get-info :version)

(assert (= (and mapNonEmpty!16716 ((_ is ValueCellFull!4688) mapValue!16716)) b!400815))

(assert (= (and b!400813 ((_ is ValueCellFull!4688) mapDefault!16716)) b!400811))

(assert (= start!38630 b!400813))

(declare-fun m!394329 () Bool)

(assert (=> b!400804 m!394329))

(declare-fun m!394331 () Bool)

(assert (=> b!400809 m!394331))

(declare-fun m!394333 () Bool)

(assert (=> b!400809 m!394333))

(declare-fun m!394335 () Bool)

(assert (=> b!400819 m!394335))

(declare-fun m!394337 () Bool)

(assert (=> mapNonEmpty!16716 m!394337))

(declare-fun m!394339 () Bool)

(assert (=> b!400812 m!394339))

(declare-fun m!394341 () Bool)

(assert (=> b!400806 m!394341))

(declare-fun m!394343 () Bool)

(assert (=> b!400810 m!394343))

(declare-fun m!394345 () Bool)

(assert (=> bm!28179 m!394345))

(declare-fun m!394347 () Bool)

(assert (=> bm!28179 m!394347))

(declare-fun m!394349 () Bool)

(assert (=> b!400808 m!394349))

(assert (=> bm!28180 m!394345))

(declare-fun m!394351 () Bool)

(assert (=> bm!28180 m!394351))

(declare-fun m!394353 () Bool)

(assert (=> b!400817 m!394353))

(declare-fun m!394355 () Bool)

(assert (=> b!400814 m!394355))

(declare-fun m!394357 () Bool)

(assert (=> start!38630 m!394357))

(declare-fun m!394359 () Bool)

(assert (=> start!38630 m!394359))

(declare-fun m!394361 () Bool)

(assert (=> b!400803 m!394361))

(check-sat (not bm!28180) (not b!400819) (not mapNonEmpty!16716) tp_is_empty!10063 (not b!400812) (not b!400817) (not b!400810) (not b!400809) (not b!400808) (not b!400803) (not b_next!9181) (not bm!28179) b_and!16541 (not start!38630) (not b!400814) (not b!400804))
(check-sat b_and!16541 (not b_next!9181))
