; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38678 () Bool)

(assert start!38678)

(declare-fun b_free!9229 () Bool)

(declare-fun b_next!9229 () Bool)

(assert (=> start!38678 (= b_free!9229 (not b_next!9229))))

(declare-fun tp!32811 () Bool)

(declare-fun b_and!16629 () Bool)

(assert (=> start!38678 (= tp!32811 b_and!16629)))

(declare-fun mapIsEmpty!16788 () Bool)

(declare-fun mapRes!16788 () Bool)

(assert (=> mapIsEmpty!16788 mapRes!16788))

(declare-fun b!402249 () Bool)

(declare-fun res!231694 () Bool)

(declare-fun e!242376 () Bool)

(assert (=> b!402249 (=> (not res!231694) (not e!242376))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24106 0))(
  ( (array!24107 (arr!11502 (Array (_ BitVec 32) (_ BitVec 64))) (size!11854 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24106)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402249 (= res!231694 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11854 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402250 () Bool)

(assert (=> b!402250 (= e!242376 (not true))))

(declare-fun e!242377 () Bool)

(assert (=> b!402250 e!242377))

(declare-fun c!54777 () Bool)

(assert (=> b!402250 (= c!54777 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14587 0))(
  ( (V!14588 (val!5100 Int)) )
))
(declare-fun minValue!515 () V!14587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12157 0))(
  ( (Unit!12158) )
))
(declare-fun lt!187931 () Unit!12157)

(declare-datatypes ((ValueCell!4712 0))(
  ( (ValueCellFull!4712 (v!7348 V!14587)) (EmptyCell!4712) )
))
(declare-datatypes ((array!24108 0))(
  ( (array!24109 (arr!11503 (Array (_ BitVec 32) ValueCell!4712)) (size!11855 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24108)

(declare-fun zeroValue!515 () V!14587)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14587)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!346 (array!24106 array!24108 (_ BitVec 32) (_ BitVec 32) V!14587 V!14587 (_ BitVec 32) (_ BitVec 64) V!14587 (_ BitVec 32) Int) Unit!12157)

(assert (=> b!402250 (= lt!187931 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402251 () Bool)

(declare-fun e!242380 () Bool)

(assert (=> b!402251 (= e!242380 e!242376)))

(declare-fun res!231695 () Bool)

(assert (=> b!402251 (=> (not res!231695) (not e!242376))))

(declare-fun lt!187932 () array!24106)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24106 (_ BitVec 32)) Bool)

(assert (=> b!402251 (= res!231695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187932 mask!1025))))

(assert (=> b!402251 (= lt!187932 (array!24107 (store (arr!11502 _keys!709) i!563 k0!794) (size!11854 _keys!709)))))

(declare-fun b!402252 () Bool)

(declare-fun e!242375 () Bool)

(declare-fun e!242374 () Bool)

(assert (=> b!402252 (= e!242375 (and e!242374 mapRes!16788))))

(declare-fun condMapEmpty!16788 () Bool)

(declare-fun mapDefault!16788 () ValueCell!4712)

(assert (=> b!402252 (= condMapEmpty!16788 (= (arr!11503 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4712)) mapDefault!16788)))))

(declare-fun b!402253 () Bool)

(declare-fun res!231702 () Bool)

(assert (=> b!402253 (=> (not res!231702) (not e!242380))))

(assert (=> b!402253 (= res!231702 (and (= (size!11855 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11854 _keys!709) (size!11855 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402254 () Bool)

(declare-fun res!231698 () Bool)

(assert (=> b!402254 (=> (not res!231698) (not e!242380))))

(assert (=> b!402254 (= res!231698 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11854 _keys!709))))))

(declare-fun b!402255 () Bool)

(declare-fun res!231700 () Bool)

(assert (=> b!402255 (=> (not res!231700) (not e!242380))))

(assert (=> b!402255 (= res!231700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!231701 () Bool)

(assert (=> start!38678 (=> (not res!231701) (not e!242380))))

(assert (=> start!38678 (= res!231701 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11854 _keys!709))))))

(assert (=> start!38678 e!242380))

(declare-fun tp_is_empty!10111 () Bool)

(assert (=> start!38678 tp_is_empty!10111))

(assert (=> start!38678 tp!32811))

(assert (=> start!38678 true))

(declare-fun array_inv!8492 (array!24108) Bool)

(assert (=> start!38678 (and (array_inv!8492 _values!549) e!242375)))

(declare-fun array_inv!8493 (array!24106) Bool)

(assert (=> start!38678 (array_inv!8493 _keys!709)))

(declare-fun b!402256 () Bool)

(declare-fun res!231691 () Bool)

(assert (=> b!402256 (=> (not res!231691) (not e!242380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402256 (= res!231691 (validMask!0 mask!1025))))

(declare-fun b!402257 () Bool)

(declare-fun res!231692 () Bool)

(assert (=> b!402257 (=> (not res!231692) (not e!242380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402257 (= res!231692 (validKeyInArray!0 k0!794))))

(declare-fun b!402258 () Bool)

(declare-fun e!242378 () Bool)

(assert (=> b!402258 (= e!242378 tp_is_empty!10111)))

(declare-datatypes ((tuple2!6638 0))(
  ( (tuple2!6639 (_1!3330 (_ BitVec 64)) (_2!3330 V!14587)) )
))
(declare-datatypes ((List!6559 0))(
  ( (Nil!6556) (Cons!6555 (h!7411 tuple2!6638) (t!11725 List!6559)) )
))
(declare-datatypes ((ListLongMap!5553 0))(
  ( (ListLongMap!5554 (toList!2792 List!6559)) )
))
(declare-fun call!28339 () ListLongMap!5553)

(declare-fun b!402259 () Bool)

(declare-fun call!28338 () ListLongMap!5553)

(declare-fun +!1134 (ListLongMap!5553 tuple2!6638) ListLongMap!5553)

(assert (=> b!402259 (= e!242377 (= call!28338 (+!1134 call!28339 (tuple2!6639 k0!794 v!412))))))

(declare-fun bm!28335 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1047 (array!24106 array!24108 (_ BitVec 32) (_ BitVec 32) V!14587 V!14587 (_ BitVec 32) Int) ListLongMap!5553)

(assert (=> bm!28335 (= call!28339 (getCurrentListMapNoExtraKeys!1047 (ite c!54777 _keys!709 lt!187932) (ite c!54777 _values!549 (array!24109 (store (arr!11503 _values!549) i!563 (ValueCellFull!4712 v!412)) (size!11855 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28336 () Bool)

(assert (=> bm!28336 (= call!28338 (getCurrentListMapNoExtraKeys!1047 (ite c!54777 lt!187932 _keys!709) (ite c!54777 (array!24109 (store (arr!11503 _values!549) i!563 (ValueCellFull!4712 v!412)) (size!11855 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402260 () Bool)

(assert (=> b!402260 (= e!242377 (= call!28339 call!28338))))

(declare-fun b!402261 () Bool)

(assert (=> b!402261 (= e!242374 tp_is_empty!10111)))

(declare-fun b!402262 () Bool)

(declare-fun res!231696 () Bool)

(assert (=> b!402262 (=> (not res!231696) (not e!242380))))

(assert (=> b!402262 (= res!231696 (or (= (select (arr!11502 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11502 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402263 () Bool)

(declare-fun res!231699 () Bool)

(assert (=> b!402263 (=> (not res!231699) (not e!242376))))

(declare-datatypes ((List!6560 0))(
  ( (Nil!6557) (Cons!6556 (h!7412 (_ BitVec 64)) (t!11726 List!6560)) )
))
(declare-fun arrayNoDuplicates!0 (array!24106 (_ BitVec 32) List!6560) Bool)

(assert (=> b!402263 (= res!231699 (arrayNoDuplicates!0 lt!187932 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun b!402264 () Bool)

(declare-fun res!231693 () Bool)

(assert (=> b!402264 (=> (not res!231693) (not e!242380))))

(declare-fun arrayContainsKey!0 (array!24106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402264 (= res!231693 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402265 () Bool)

(declare-fun res!231697 () Bool)

(assert (=> b!402265 (=> (not res!231697) (not e!242380))))

(assert (=> b!402265 (= res!231697 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun mapNonEmpty!16788 () Bool)

(declare-fun tp!32810 () Bool)

(assert (=> mapNonEmpty!16788 (= mapRes!16788 (and tp!32810 e!242378))))

(declare-fun mapRest!16788 () (Array (_ BitVec 32) ValueCell!4712))

(declare-fun mapValue!16788 () ValueCell!4712)

(declare-fun mapKey!16788 () (_ BitVec 32))

(assert (=> mapNonEmpty!16788 (= (arr!11503 _values!549) (store mapRest!16788 mapKey!16788 mapValue!16788))))

(assert (= (and start!38678 res!231701) b!402256))

(assert (= (and b!402256 res!231691) b!402253))

(assert (= (and b!402253 res!231702) b!402255))

(assert (= (and b!402255 res!231700) b!402265))

(assert (= (and b!402265 res!231697) b!402254))

(assert (= (and b!402254 res!231698) b!402257))

(assert (= (and b!402257 res!231692) b!402262))

(assert (= (and b!402262 res!231696) b!402264))

(assert (= (and b!402264 res!231693) b!402251))

(assert (= (and b!402251 res!231695) b!402263))

(assert (= (and b!402263 res!231699) b!402249))

(assert (= (and b!402249 res!231694) b!402250))

(assert (= (and b!402250 c!54777) b!402259))

(assert (= (and b!402250 (not c!54777)) b!402260))

(assert (= (or b!402259 b!402260) bm!28336))

(assert (= (or b!402259 b!402260) bm!28335))

(assert (= (and b!402252 condMapEmpty!16788) mapIsEmpty!16788))

(assert (= (and b!402252 (not condMapEmpty!16788)) mapNonEmpty!16788))

(get-info :version)

(assert (= (and mapNonEmpty!16788 ((_ is ValueCellFull!4712) mapValue!16788)) b!402258))

(assert (= (and b!402252 ((_ is ValueCellFull!4712) mapDefault!16788)) b!402261))

(assert (= start!38678 b!402252))

(declare-fun m!396099 () Bool)

(assert (=> b!402262 m!396099))

(declare-fun m!396101 () Bool)

(assert (=> bm!28335 m!396101))

(declare-fun m!396103 () Bool)

(assert (=> bm!28335 m!396103))

(declare-fun m!396105 () Bool)

(assert (=> b!402251 m!396105))

(declare-fun m!396107 () Bool)

(assert (=> b!402251 m!396107))

(declare-fun m!396109 () Bool)

(assert (=> b!402263 m!396109))

(declare-fun m!396111 () Bool)

(assert (=> b!402255 m!396111))

(declare-fun m!396113 () Bool)

(assert (=> mapNonEmpty!16788 m!396113))

(declare-fun m!396115 () Bool)

(assert (=> b!402265 m!396115))

(declare-fun m!396117 () Bool)

(assert (=> b!402250 m!396117))

(declare-fun m!396119 () Bool)

(assert (=> start!38678 m!396119))

(declare-fun m!396121 () Bool)

(assert (=> start!38678 m!396121))

(declare-fun m!396123 () Bool)

(assert (=> b!402264 m!396123))

(declare-fun m!396125 () Bool)

(assert (=> b!402256 m!396125))

(assert (=> bm!28336 m!396101))

(declare-fun m!396127 () Bool)

(assert (=> bm!28336 m!396127))

(declare-fun m!396129 () Bool)

(assert (=> b!402257 m!396129))

(declare-fun m!396131 () Bool)

(assert (=> b!402259 m!396131))

(check-sat b_and!16629 tp_is_empty!10111 (not bm!28335) (not b!402257) (not b!402264) (not b!402250) (not mapNonEmpty!16788) (not b!402265) (not b!402263) (not b!402259) (not b_next!9229) (not bm!28336) (not start!38678) (not b!402251) (not b!402255) (not b!402256))
(check-sat b_and!16629 (not b_next!9229))
