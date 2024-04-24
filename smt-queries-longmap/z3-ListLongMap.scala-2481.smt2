; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38690 () Bool)

(assert start!38690)

(declare-fun b_free!9241 () Bool)

(declare-fun b_next!9241 () Bool)

(assert (=> start!38690 (= b_free!9241 (not b_next!9241))))

(declare-fun tp!32847 () Bool)

(declare-fun b_and!16641 () Bool)

(assert (=> start!38690 (= tp!32847 b_and!16641)))

(declare-fun mapIsEmpty!16806 () Bool)

(declare-fun mapRes!16806 () Bool)

(assert (=> mapIsEmpty!16806 mapRes!16806))

(declare-fun b!402555 () Bool)

(declare-fun e!242502 () Bool)

(declare-fun tp_is_empty!10123 () Bool)

(assert (=> b!402555 (= e!242502 tp_is_empty!10123)))

(declare-fun b!402556 () Bool)

(declare-fun res!231916 () Bool)

(declare-fun e!242504 () Bool)

(assert (=> b!402556 (=> (not res!231916) (not e!242504))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24130 0))(
  ( (array!24131 (arr!11514 (Array (_ BitVec 32) (_ BitVec 64))) (size!11866 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24130)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402556 (= res!231916 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11866 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402557 () Bool)

(declare-fun res!231913 () Bool)

(declare-fun e!242501 () Bool)

(assert (=> b!402557 (=> (not res!231913) (not e!242501))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402557 (= res!231913 (validKeyInArray!0 k0!794))))

(declare-fun b!402558 () Bool)

(declare-fun res!231910 () Bool)

(assert (=> b!402558 (=> (not res!231910) (not e!242501))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402558 (= res!231910 (validMask!0 mask!1025))))

(declare-datatypes ((V!14603 0))(
  ( (V!14604 (val!5106 Int)) )
))
(declare-fun minValue!515 () V!14603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4718 0))(
  ( (ValueCellFull!4718 (v!7354 V!14603)) (EmptyCell!4718) )
))
(declare-datatypes ((array!24132 0))(
  ( (array!24133 (arr!11515 (Array (_ BitVec 32) ValueCell!4718)) (size!11867 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24132)

(declare-fun lt!187968 () array!24130)

(declare-fun bm!28371 () Bool)

(declare-fun zeroValue!515 () V!14603)

(declare-fun c!54795 () Bool)

(declare-datatypes ((tuple2!6648 0))(
  ( (tuple2!6649 (_1!3335 (_ BitVec 64)) (_2!3335 V!14603)) )
))
(declare-datatypes ((List!6570 0))(
  ( (Nil!6567) (Cons!6566 (h!7422 tuple2!6648) (t!11736 List!6570)) )
))
(declare-datatypes ((ListLongMap!5563 0))(
  ( (ListLongMap!5564 (toList!2797 List!6570)) )
))
(declare-fun call!28375 () ListLongMap!5563)

(declare-fun v!412 () V!14603)

(declare-fun getCurrentListMapNoExtraKeys!1051 (array!24130 array!24132 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) Int) ListLongMap!5563)

(assert (=> bm!28371 (= call!28375 (getCurrentListMapNoExtraKeys!1051 (ite c!54795 lt!187968 _keys!709) (ite c!54795 (array!24133 (store (arr!11515 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11867 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402559 () Bool)

(declare-fun res!231914 () Bool)

(assert (=> b!402559 (=> (not res!231914) (not e!242501))))

(assert (=> b!402559 (= res!231914 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11866 _keys!709))))))

(declare-fun b!402560 () Bool)

(declare-fun e!242506 () Bool)

(declare-fun call!28374 () ListLongMap!5563)

(assert (=> b!402560 (= e!242506 (= call!28374 call!28375))))

(declare-fun b!402561 () Bool)

(declare-fun res!231915 () Bool)

(assert (=> b!402561 (=> (not res!231915) (not e!242501))))

(declare-datatypes ((List!6571 0))(
  ( (Nil!6568) (Cons!6567 (h!7423 (_ BitVec 64)) (t!11737 List!6571)) )
))
(declare-fun arrayNoDuplicates!0 (array!24130 (_ BitVec 32) List!6571) Bool)

(assert (=> b!402561 (= res!231915 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!402563 () Bool)

(assert (=> b!402563 (= e!242501 e!242504)))

(declare-fun res!231917 () Bool)

(assert (=> b!402563 (=> (not res!231917) (not e!242504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24130 (_ BitVec 32)) Bool)

(assert (=> b!402563 (= res!231917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187968 mask!1025))))

(assert (=> b!402563 (= lt!187968 (array!24131 (store (arr!11514 _keys!709) i!563 k0!794) (size!11866 _keys!709)))))

(declare-fun b!402564 () Bool)

(declare-fun res!231911 () Bool)

(assert (=> b!402564 (=> (not res!231911) (not e!242501))))

(declare-fun arrayContainsKey!0 (array!24130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402564 (= res!231911 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402565 () Bool)

(declare-fun res!231918 () Bool)

(assert (=> b!402565 (=> (not res!231918) (not e!242504))))

(assert (=> b!402565 (= res!231918 (arrayNoDuplicates!0 lt!187968 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!402566 () Bool)

(declare-fun e!242503 () Bool)

(assert (=> b!402566 (= e!242503 tp_is_empty!10123)))

(declare-fun b!402567 () Bool)

(declare-fun e!242500 () Bool)

(assert (=> b!402567 (= e!242500 (and e!242502 mapRes!16806))))

(declare-fun condMapEmpty!16806 () Bool)

(declare-fun mapDefault!16806 () ValueCell!4718)

(assert (=> b!402567 (= condMapEmpty!16806 (= (arr!11515 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4718)) mapDefault!16806)))))

(declare-fun res!231907 () Bool)

(assert (=> start!38690 (=> (not res!231907) (not e!242501))))

(assert (=> start!38690 (= res!231907 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11866 _keys!709))))))

(assert (=> start!38690 e!242501))

(assert (=> start!38690 tp_is_empty!10123))

(assert (=> start!38690 tp!32847))

(assert (=> start!38690 true))

(declare-fun array_inv!8500 (array!24132) Bool)

(assert (=> start!38690 (and (array_inv!8500 _values!549) e!242500)))

(declare-fun array_inv!8501 (array!24130) Bool)

(assert (=> start!38690 (array_inv!8501 _keys!709)))

(declare-fun b!402562 () Bool)

(declare-fun res!231912 () Bool)

(assert (=> b!402562 (=> (not res!231912) (not e!242501))))

(assert (=> b!402562 (= res!231912 (and (= (size!11867 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11866 _keys!709) (size!11867 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16806 () Bool)

(declare-fun tp!32846 () Bool)

(assert (=> mapNonEmpty!16806 (= mapRes!16806 (and tp!32846 e!242503))))

(declare-fun mapValue!16806 () ValueCell!4718)

(declare-fun mapRest!16806 () (Array (_ BitVec 32) ValueCell!4718))

(declare-fun mapKey!16806 () (_ BitVec 32))

(assert (=> mapNonEmpty!16806 (= (arr!11515 _values!549) (store mapRest!16806 mapKey!16806 mapValue!16806))))

(declare-fun b!402568 () Bool)

(assert (=> b!402568 (= e!242504 (not true))))

(assert (=> b!402568 e!242506))

(assert (=> b!402568 (= c!54795 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12167 0))(
  ( (Unit!12168) )
))
(declare-fun lt!187967 () Unit!12167)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 (array!24130 array!24132 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) (_ BitVec 64) V!14603 (_ BitVec 32) Int) Unit!12167)

(assert (=> b!402568 (= lt!187967 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28372 () Bool)

(assert (=> bm!28372 (= call!28374 (getCurrentListMapNoExtraKeys!1051 (ite c!54795 _keys!709 lt!187968) (ite c!54795 _values!549 (array!24133 (store (arr!11515 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11867 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402569 () Bool)

(declare-fun res!231909 () Bool)

(assert (=> b!402569 (=> (not res!231909) (not e!242501))))

(assert (=> b!402569 (= res!231909 (or (= (select (arr!11514 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11514 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402570 () Bool)

(declare-fun res!231908 () Bool)

(assert (=> b!402570 (=> (not res!231908) (not e!242501))))

(assert (=> b!402570 (= res!231908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402571 () Bool)

(declare-fun +!1139 (ListLongMap!5563 tuple2!6648) ListLongMap!5563)

(assert (=> b!402571 (= e!242506 (= call!28375 (+!1139 call!28374 (tuple2!6649 k0!794 v!412))))))

(assert (= (and start!38690 res!231907) b!402558))

(assert (= (and b!402558 res!231910) b!402562))

(assert (= (and b!402562 res!231912) b!402570))

(assert (= (and b!402570 res!231908) b!402561))

(assert (= (and b!402561 res!231915) b!402559))

(assert (= (and b!402559 res!231914) b!402557))

(assert (= (and b!402557 res!231913) b!402569))

(assert (= (and b!402569 res!231909) b!402564))

(assert (= (and b!402564 res!231911) b!402563))

(assert (= (and b!402563 res!231917) b!402565))

(assert (= (and b!402565 res!231918) b!402556))

(assert (= (and b!402556 res!231916) b!402568))

(assert (= (and b!402568 c!54795) b!402571))

(assert (= (and b!402568 (not c!54795)) b!402560))

(assert (= (or b!402571 b!402560) bm!28371))

(assert (= (or b!402571 b!402560) bm!28372))

(assert (= (and b!402567 condMapEmpty!16806) mapIsEmpty!16806))

(assert (= (and b!402567 (not condMapEmpty!16806)) mapNonEmpty!16806))

(get-info :version)

(assert (= (and mapNonEmpty!16806 ((_ is ValueCellFull!4718) mapValue!16806)) b!402566))

(assert (= (and b!402567 ((_ is ValueCellFull!4718) mapDefault!16806)) b!402555))

(assert (= start!38690 b!402567))

(declare-fun m!396303 () Bool)

(assert (=> b!402565 m!396303))

(declare-fun m!396305 () Bool)

(assert (=> b!402570 m!396305))

(declare-fun m!396307 () Bool)

(assert (=> mapNonEmpty!16806 m!396307))

(declare-fun m!396309 () Bool)

(assert (=> b!402563 m!396309))

(declare-fun m!396311 () Bool)

(assert (=> b!402563 m!396311))

(declare-fun m!396313 () Bool)

(assert (=> bm!28372 m!396313))

(declare-fun m!396315 () Bool)

(assert (=> bm!28372 m!396315))

(declare-fun m!396317 () Bool)

(assert (=> start!38690 m!396317))

(declare-fun m!396319 () Bool)

(assert (=> start!38690 m!396319))

(assert (=> bm!28371 m!396313))

(declare-fun m!396321 () Bool)

(assert (=> bm!28371 m!396321))

(declare-fun m!396323 () Bool)

(assert (=> b!402568 m!396323))

(declare-fun m!396325 () Bool)

(assert (=> b!402571 m!396325))

(declare-fun m!396327 () Bool)

(assert (=> b!402561 m!396327))

(declare-fun m!396329 () Bool)

(assert (=> b!402558 m!396329))

(declare-fun m!396331 () Bool)

(assert (=> b!402557 m!396331))

(declare-fun m!396333 () Bool)

(assert (=> b!402564 m!396333))

(declare-fun m!396335 () Bool)

(assert (=> b!402569 m!396335))

(check-sat (not b!402561) (not start!38690) (not b_next!9241) tp_is_empty!10123 (not b!402565) (not b!402564) (not bm!28371) (not b!402568) (not b!402563) (not b!402570) b_and!16641 (not bm!28372) (not b!402558) (not mapNonEmpty!16806) (not b!402571) (not b!402557))
(check-sat b_and!16641 (not b_next!9241))
