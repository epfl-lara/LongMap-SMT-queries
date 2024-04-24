; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38654 () Bool)

(assert start!38654)

(declare-fun b_free!9205 () Bool)

(declare-fun b_next!9205 () Bool)

(assert (=> start!38654 (= b_free!9205 (not b_next!9205))))

(declare-fun tp!32738 () Bool)

(declare-fun b_and!16605 () Bool)

(assert (=> start!38654 (= tp!32738 b_and!16605)))

(declare-fun b!401637 () Bool)

(declare-fun res!231269 () Bool)

(declare-fun e!242128 () Bool)

(assert (=> b!401637 (=> (not res!231269) (not e!242128))))

(declare-datatypes ((array!24058 0))(
  ( (array!24059 (arr!11478 (Array (_ BitVec 32) (_ BitVec 64))) (size!11830 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24058)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401637 (= res!231269 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401638 () Bool)

(declare-fun e!242122 () Bool)

(declare-fun tp_is_empty!10087 () Bool)

(assert (=> b!401638 (= e!242122 tp_is_empty!10087)))

(declare-fun b!401639 () Bool)

(declare-fun e!242127 () Bool)

(declare-datatypes ((V!14555 0))(
  ( (V!14556 (val!5088 Int)) )
))
(declare-fun v!412 () V!14555)

(declare-datatypes ((tuple2!6616 0))(
  ( (tuple2!6617 (_1!3319 (_ BitVec 64)) (_2!3319 V!14555)) )
))
(declare-datatypes ((List!6537 0))(
  ( (Nil!6534) (Cons!6533 (h!7389 tuple2!6616) (t!11703 List!6537)) )
))
(declare-datatypes ((ListLongMap!5531 0))(
  ( (ListLongMap!5532 (toList!2781 List!6537)) )
))
(declare-fun call!28267 () ListLongMap!5531)

(declare-fun call!28266 () ListLongMap!5531)

(declare-fun +!1126 (ListLongMap!5531 tuple2!6616) ListLongMap!5531)

(assert (=> b!401639 (= e!242127 (= call!28266 (+!1126 call!28267 (tuple2!6617 k0!794 v!412))))))

(declare-fun b!401640 () Bool)

(declare-fun res!231268 () Bool)

(assert (=> b!401640 (=> (not res!231268) (not e!242128))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401640 (= res!231268 (or (= (select (arr!11478 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11478 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401641 () Bool)

(declare-fun res!231259 () Bool)

(declare-fun e!242124 () Bool)

(assert (=> b!401641 (=> (not res!231259) (not e!242124))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401641 (= res!231259 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11830 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401642 () Bool)

(declare-fun res!231262 () Bool)

(assert (=> b!401642 (=> (not res!231262) (not e!242128))))

(assert (=> b!401642 (= res!231262 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11830 _keys!709))))))

(declare-fun b!401643 () Bool)

(assert (=> b!401643 (= e!242128 e!242124)))

(declare-fun res!231263 () Bool)

(assert (=> b!401643 (=> (not res!231263) (not e!242124))))

(declare-fun lt!187859 () array!24058)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24058 (_ BitVec 32)) Bool)

(assert (=> b!401643 (= res!231263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187859 mask!1025))))

(assert (=> b!401643 (= lt!187859 (array!24059 (store (arr!11478 _keys!709) i!563 k0!794) (size!11830 _keys!709)))))

(declare-fun res!231266 () Bool)

(assert (=> start!38654 (=> (not res!231266) (not e!242128))))

(assert (=> start!38654 (= res!231266 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11830 _keys!709))))))

(assert (=> start!38654 e!242128))

(assert (=> start!38654 tp_is_empty!10087))

(assert (=> start!38654 tp!32738))

(assert (=> start!38654 true))

(declare-datatypes ((ValueCell!4700 0))(
  ( (ValueCellFull!4700 (v!7336 V!14555)) (EmptyCell!4700) )
))
(declare-datatypes ((array!24060 0))(
  ( (array!24061 (arr!11479 (Array (_ BitVec 32) ValueCell!4700)) (size!11831 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24060)

(declare-fun e!242125 () Bool)

(declare-fun array_inv!8476 (array!24060) Bool)

(assert (=> start!38654 (and (array_inv!8476 _values!549) e!242125)))

(declare-fun array_inv!8477 (array!24058) Bool)

(assert (=> start!38654 (array_inv!8477 _keys!709)))

(declare-fun b!401644 () Bool)

(declare-fun res!231260 () Bool)

(assert (=> b!401644 (=> (not res!231260) (not e!242128))))

(declare-datatypes ((List!6538 0))(
  ( (Nil!6535) (Cons!6534 (h!7390 (_ BitVec 64)) (t!11704 List!6538)) )
))
(declare-fun arrayNoDuplicates!0 (array!24058 (_ BitVec 32) List!6538) Bool)

(assert (=> b!401644 (= res!231260 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6535))))

(declare-fun mapIsEmpty!16752 () Bool)

(declare-fun mapRes!16752 () Bool)

(assert (=> mapIsEmpty!16752 mapRes!16752))

(declare-fun b!401645 () Bool)

(declare-fun res!231270 () Bool)

(assert (=> b!401645 (=> (not res!231270) (not e!242124))))

(assert (=> b!401645 (= res!231270 (arrayNoDuplicates!0 lt!187859 #b00000000000000000000000000000000 Nil!6535))))

(declare-fun b!401646 () Bool)

(declare-fun e!242126 () Bool)

(assert (=> b!401646 (= e!242125 (and e!242126 mapRes!16752))))

(declare-fun condMapEmpty!16752 () Bool)

(declare-fun mapDefault!16752 () ValueCell!4700)

(assert (=> b!401646 (= condMapEmpty!16752 (= (arr!11479 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4700)) mapDefault!16752)))))

(declare-fun bm!28263 () Bool)

(declare-fun minValue!515 () V!14555)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14555)

(declare-fun c!54741 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1038 (array!24058 array!24060 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) Int) ListLongMap!5531)

(assert (=> bm!28263 (= call!28266 (getCurrentListMapNoExtraKeys!1038 (ite c!54741 lt!187859 _keys!709) (ite c!54741 (array!24061 (store (arr!11479 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11831 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401647 () Bool)

(declare-fun res!231261 () Bool)

(assert (=> b!401647 (=> (not res!231261) (not e!242128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401647 (= res!231261 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16752 () Bool)

(declare-fun tp!32739 () Bool)

(assert (=> mapNonEmpty!16752 (= mapRes!16752 (and tp!32739 e!242122))))

(declare-fun mapRest!16752 () (Array (_ BitVec 32) ValueCell!4700))

(declare-fun mapKey!16752 () (_ BitVec 32))

(declare-fun mapValue!16752 () ValueCell!4700)

(assert (=> mapNonEmpty!16752 (= (arr!11479 _values!549) (store mapRest!16752 mapKey!16752 mapValue!16752))))

(declare-fun bm!28264 () Bool)

(assert (=> bm!28264 (= call!28267 (getCurrentListMapNoExtraKeys!1038 (ite c!54741 _keys!709 lt!187859) (ite c!54741 _values!549 (array!24061 (store (arr!11479 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11831 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401648 () Bool)

(declare-fun res!231264 () Bool)

(assert (=> b!401648 (=> (not res!231264) (not e!242128))))

(assert (=> b!401648 (= res!231264 (and (= (size!11831 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11830 _keys!709) (size!11831 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401649 () Bool)

(declare-fun res!231265 () Bool)

(assert (=> b!401649 (=> (not res!231265) (not e!242128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401649 (= res!231265 (validKeyInArray!0 k0!794))))

(declare-fun b!401650 () Bool)

(assert (=> b!401650 (= e!242124 (not true))))

(assert (=> b!401650 e!242127))

(assert (=> b!401650 (= c!54741 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12141 0))(
  ( (Unit!12142) )
))
(declare-fun lt!187860 () Unit!12141)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 (array!24058 array!24060 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) (_ BitVec 64) V!14555 (_ BitVec 32) Int) Unit!12141)

(assert (=> b!401650 (= lt!187860 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401651 () Bool)

(assert (=> b!401651 (= e!242126 tp_is_empty!10087)))

(declare-fun b!401652 () Bool)

(assert (=> b!401652 (= e!242127 (= call!28267 call!28266))))

(declare-fun b!401653 () Bool)

(declare-fun res!231267 () Bool)

(assert (=> b!401653 (=> (not res!231267) (not e!242128))))

(assert (=> b!401653 (= res!231267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38654 res!231266) b!401647))

(assert (= (and b!401647 res!231261) b!401648))

(assert (= (and b!401648 res!231264) b!401653))

(assert (= (and b!401653 res!231267) b!401644))

(assert (= (and b!401644 res!231260) b!401642))

(assert (= (and b!401642 res!231262) b!401649))

(assert (= (and b!401649 res!231265) b!401640))

(assert (= (and b!401640 res!231268) b!401637))

(assert (= (and b!401637 res!231269) b!401643))

(assert (= (and b!401643 res!231263) b!401645))

(assert (= (and b!401645 res!231270) b!401641))

(assert (= (and b!401641 res!231259) b!401650))

(assert (= (and b!401650 c!54741) b!401639))

(assert (= (and b!401650 (not c!54741)) b!401652))

(assert (= (or b!401639 b!401652) bm!28263))

(assert (= (or b!401639 b!401652) bm!28264))

(assert (= (and b!401646 condMapEmpty!16752) mapIsEmpty!16752))

(assert (= (and b!401646 (not condMapEmpty!16752)) mapNonEmpty!16752))

(get-info :version)

(assert (= (and mapNonEmpty!16752 ((_ is ValueCellFull!4700) mapValue!16752)) b!401638))

(assert (= (and b!401646 ((_ is ValueCellFull!4700) mapDefault!16752)) b!401651))

(assert (= start!38654 b!401646))

(declare-fun m!395691 () Bool)

(assert (=> b!401653 m!395691))

(declare-fun m!395693 () Bool)

(assert (=> b!401647 m!395693))

(declare-fun m!395695 () Bool)

(assert (=> b!401643 m!395695))

(declare-fun m!395697 () Bool)

(assert (=> b!401643 m!395697))

(declare-fun m!395699 () Bool)

(assert (=> b!401637 m!395699))

(declare-fun m!395701 () Bool)

(assert (=> bm!28263 m!395701))

(declare-fun m!395703 () Bool)

(assert (=> bm!28263 m!395703))

(assert (=> bm!28264 m!395701))

(declare-fun m!395705 () Bool)

(assert (=> bm!28264 m!395705))

(declare-fun m!395707 () Bool)

(assert (=> start!38654 m!395707))

(declare-fun m!395709 () Bool)

(assert (=> start!38654 m!395709))

(declare-fun m!395711 () Bool)

(assert (=> b!401650 m!395711))

(declare-fun m!395713 () Bool)

(assert (=> b!401649 m!395713))

(declare-fun m!395715 () Bool)

(assert (=> b!401645 m!395715))

(declare-fun m!395717 () Bool)

(assert (=> b!401644 m!395717))

(declare-fun m!395719 () Bool)

(assert (=> b!401640 m!395719))

(declare-fun m!395721 () Bool)

(assert (=> mapNonEmpty!16752 m!395721))

(declare-fun m!395723 () Bool)

(assert (=> b!401639 m!395723))

(check-sat (not b!401647) b_and!16605 (not b!401649) (not bm!28264) (not b!401643) (not b_next!9205) (not mapNonEmpty!16752) (not b!401639) (not b!401653) (not b!401644) tp_is_empty!10087 (not b!401637) (not b!401645) (not bm!28263) (not b!401650) (not start!38654))
(check-sat b_and!16605 (not b_next!9205))
