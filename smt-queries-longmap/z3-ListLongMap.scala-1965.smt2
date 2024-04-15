; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34540 () Bool)

(assert start!34540)

(declare-fun b_free!7459 () Bool)

(declare-fun b_next!7459 () Bool)

(assert (=> start!34540 (= b_free!7459 (not b_next!7459))))

(declare-fun tp!25926 () Bool)

(declare-fun b_and!14643 () Bool)

(assert (=> start!34540 (= tp!25926 b_and!14643)))

(declare-fun b!345098 () Bool)

(declare-fun res!190940 () Bool)

(declare-fun e!211504 () Bool)

(assert (=> b!345098 (=> (not res!190940) (not e!211504))))

(declare-datatypes ((array!18393 0))(
  ( (array!18394 (arr!8712 (Array (_ BitVec 32) (_ BitVec 64))) (size!9065 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18393)

(declare-datatypes ((List!5003 0))(
  ( (Nil!5000) (Cons!4999 (h!5855 (_ BitVec 64)) (t!10112 List!5003)) )
))
(declare-fun arrayNoDuplicates!0 (array!18393 (_ BitVec 32) List!5003) Bool)

(assert (=> b!345098 (= res!190940 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5000))))

(declare-fun b!345099 () Bool)

(declare-fun res!190943 () Bool)

(assert (=> b!345099 (=> (not res!190943) (not e!211504))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345099 (= res!190943 (validKeyInArray!0 k0!1348))))

(declare-fun b!345100 () Bool)

(declare-fun res!190945 () Bool)

(assert (=> b!345100 (=> (not res!190945) (not e!211504))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18393 (_ BitVec 32)) Bool)

(assert (=> b!345100 (= res!190945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345101 () Bool)

(declare-fun res!190942 () Bool)

(assert (=> b!345101 (=> (not res!190942) (not e!211504))))

(declare-datatypes ((V!10859 0))(
  ( (V!10860 (val!3750 Int)) )
))
(declare-fun zeroValue!1467 () V!10859)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3362 0))(
  ( (ValueCellFull!3362 (v!5921 V!10859)) (EmptyCell!3362) )
))
(declare-datatypes ((array!18395 0))(
  ( (array!18396 (arr!8713 (Array (_ BitVec 32) ValueCell!3362)) (size!9066 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18395)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10859)

(declare-datatypes ((tuple2!5386 0))(
  ( (tuple2!5387 (_1!2704 (_ BitVec 64)) (_2!2704 V!10859)) )
))
(declare-datatypes ((List!5004 0))(
  ( (Nil!5001) (Cons!5000 (h!5856 tuple2!5386) (t!10113 List!5004)) )
))
(declare-datatypes ((ListLongMap!4289 0))(
  ( (ListLongMap!4290 (toList!2160 List!5004)) )
))
(declare-fun contains!2230 (ListLongMap!4289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1666 (array!18393 array!18395 (_ BitVec 32) (_ BitVec 32) V!10859 V!10859 (_ BitVec 32) Int) ListLongMap!4289)

(assert (=> b!345101 (= res!190942 (not (contains!2230 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345102 () Bool)

(declare-fun e!211502 () Bool)

(declare-fun e!211506 () Bool)

(declare-fun mapRes!12558 () Bool)

(assert (=> b!345102 (= e!211502 (and e!211506 mapRes!12558))))

(declare-fun condMapEmpty!12558 () Bool)

(declare-fun mapDefault!12558 () ValueCell!3362)

(assert (=> b!345102 (= condMapEmpty!12558 (= (arr!8713 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3362)) mapDefault!12558)))))

(declare-fun mapIsEmpty!12558 () Bool)

(assert (=> mapIsEmpty!12558 mapRes!12558))

(declare-fun res!190946 () Bool)

(assert (=> start!34540 (=> (not res!190946) (not e!211504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34540 (= res!190946 (validMask!0 mask!2385))))

(assert (=> start!34540 e!211504))

(assert (=> start!34540 true))

(declare-fun tp_is_empty!7411 () Bool)

(assert (=> start!34540 tp_is_empty!7411))

(assert (=> start!34540 tp!25926))

(declare-fun array_inv!6476 (array!18395) Bool)

(assert (=> start!34540 (and (array_inv!6476 _values!1525) e!211502)))

(declare-fun array_inv!6477 (array!18393) Bool)

(assert (=> start!34540 (array_inv!6477 _keys!1895)))

(declare-fun b!345103 () Bool)

(assert (=> b!345103 (= e!211506 tp_is_empty!7411)))

(declare-fun mapNonEmpty!12558 () Bool)

(declare-fun tp!25925 () Bool)

(declare-fun e!211505 () Bool)

(assert (=> mapNonEmpty!12558 (= mapRes!12558 (and tp!25925 e!211505))))

(declare-fun mapValue!12558 () ValueCell!3362)

(declare-fun mapRest!12558 () (Array (_ BitVec 32) ValueCell!3362))

(declare-fun mapKey!12558 () (_ BitVec 32))

(assert (=> mapNonEmpty!12558 (= (arr!8713 _values!1525) (store mapRest!12558 mapKey!12558 mapValue!12558))))

(declare-fun b!345104 () Bool)

(declare-fun e!211507 () Bool)

(declare-datatypes ((SeekEntryResult!3354 0))(
  ( (MissingZero!3354 (index!15595 (_ BitVec 32))) (Found!3354 (index!15596 (_ BitVec 32))) (Intermediate!3354 (undefined!4166 Bool) (index!15597 (_ BitVec 32)) (x!34401 (_ BitVec 32))) (Undefined!3354) (MissingVacant!3354 (index!15598 (_ BitVec 32))) )
))
(declare-fun lt!162624 () SeekEntryResult!3354)

(declare-fun arrayContainsKey!0 (array!18393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345104 (= e!211507 (not (arrayContainsKey!0 _keys!1895 k0!1348 (index!15596 lt!162624))))))

(declare-fun b!345105 () Bool)

(assert (=> b!345105 (= e!211504 e!211507)))

(declare-fun res!190941 () Bool)

(assert (=> b!345105 (=> (not res!190941) (not e!211507))))

(get-info :version)

(assert (=> b!345105 (= res!190941 (and ((_ is Found!3354) lt!162624) (= (select (arr!8712 _keys!1895) (index!15596 lt!162624)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18393 (_ BitVec 32)) SeekEntryResult!3354)

(assert (=> b!345105 (= lt!162624 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345106 () Bool)

(declare-fun res!190944 () Bool)

(assert (=> b!345106 (=> (not res!190944) (not e!211504))))

(assert (=> b!345106 (= res!190944 (and (= (size!9066 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9065 _keys!1895) (size!9066 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345107 () Bool)

(assert (=> b!345107 (= e!211505 tp_is_empty!7411)))

(assert (= (and start!34540 res!190946) b!345106))

(assert (= (and b!345106 res!190944) b!345100))

(assert (= (and b!345100 res!190945) b!345098))

(assert (= (and b!345098 res!190940) b!345099))

(assert (= (and b!345099 res!190943) b!345101))

(assert (= (and b!345101 res!190942) b!345105))

(assert (= (and b!345105 res!190941) b!345104))

(assert (= (and b!345102 condMapEmpty!12558) mapIsEmpty!12558))

(assert (= (and b!345102 (not condMapEmpty!12558)) mapNonEmpty!12558))

(assert (= (and mapNonEmpty!12558 ((_ is ValueCellFull!3362) mapValue!12558)) b!345107))

(assert (= (and b!345102 ((_ is ValueCellFull!3362) mapDefault!12558)) b!345103))

(assert (= start!34540 b!345102))

(declare-fun m!346027 () Bool)

(assert (=> b!345100 m!346027))

(declare-fun m!346029 () Bool)

(assert (=> mapNonEmpty!12558 m!346029))

(declare-fun m!346031 () Bool)

(assert (=> b!345101 m!346031))

(assert (=> b!345101 m!346031))

(declare-fun m!346033 () Bool)

(assert (=> b!345101 m!346033))

(declare-fun m!346035 () Bool)

(assert (=> b!345104 m!346035))

(declare-fun m!346037 () Bool)

(assert (=> start!34540 m!346037))

(declare-fun m!346039 () Bool)

(assert (=> start!34540 m!346039))

(declare-fun m!346041 () Bool)

(assert (=> start!34540 m!346041))

(declare-fun m!346043 () Bool)

(assert (=> b!345098 m!346043))

(declare-fun m!346045 () Bool)

(assert (=> b!345105 m!346045))

(declare-fun m!346047 () Bool)

(assert (=> b!345105 m!346047))

(declare-fun m!346049 () Bool)

(assert (=> b!345099 m!346049))

(check-sat tp_is_empty!7411 (not b!345105) (not b!345099) (not b!345101) (not b_next!7459) (not b!345098) b_and!14643 (not b!345104) (not mapNonEmpty!12558) (not start!34540) (not b!345100))
(check-sat b_and!14643 (not b_next!7459))
(get-model)

(declare-fun b!345178 () Bool)

(declare-fun e!211555 () Bool)

(declare-fun call!26678 () Bool)

(assert (=> b!345178 (= e!211555 call!26678)))

(declare-fun b!345179 () Bool)

(declare-fun e!211552 () Bool)

(assert (=> b!345179 (= e!211552 e!211555)))

(declare-fun c!52922 () Bool)

(assert (=> b!345179 (= c!52922 (validKeyInArray!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70933 () Bool)

(declare-fun res!190996 () Bool)

(declare-fun e!211553 () Bool)

(assert (=> d!70933 (=> res!190996 e!211553)))

(assert (=> d!70933 (= res!190996 (bvsge #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(assert (=> d!70933 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5000) e!211553)))

(declare-fun b!345180 () Bool)

(assert (=> b!345180 (= e!211555 call!26678)))

(declare-fun b!345181 () Bool)

(declare-fun e!211554 () Bool)

(declare-fun contains!2232 (List!5003 (_ BitVec 64)) Bool)

(assert (=> b!345181 (= e!211554 (contains!2232 Nil!5000 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345182 () Bool)

(assert (=> b!345182 (= e!211553 e!211552)))

(declare-fun res!190997 () Bool)

(assert (=> b!345182 (=> (not res!190997) (not e!211552))))

(assert (=> b!345182 (= res!190997 (not e!211554))))

(declare-fun res!190995 () Bool)

(assert (=> b!345182 (=> (not res!190995) (not e!211554))))

(assert (=> b!345182 (= res!190995 (validKeyInArray!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26675 () Bool)

(assert (=> bm!26675 (= call!26678 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52922 (Cons!4999 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000) Nil!5000) Nil!5000)))))

(assert (= (and d!70933 (not res!190996)) b!345182))

(assert (= (and b!345182 res!190995) b!345181))

(assert (= (and b!345182 res!190997) b!345179))

(assert (= (and b!345179 c!52922) b!345180))

(assert (= (and b!345179 (not c!52922)) b!345178))

(assert (= (or b!345180 b!345178) bm!26675))

(declare-fun m!346099 () Bool)

(assert (=> b!345179 m!346099))

(assert (=> b!345179 m!346099))

(declare-fun m!346101 () Bool)

(assert (=> b!345179 m!346101))

(assert (=> b!345181 m!346099))

(assert (=> b!345181 m!346099))

(declare-fun m!346103 () Bool)

(assert (=> b!345181 m!346103))

(assert (=> b!345182 m!346099))

(assert (=> b!345182 m!346099))

(assert (=> b!345182 m!346101))

(assert (=> bm!26675 m!346099))

(declare-fun m!346105 () Bool)

(assert (=> bm!26675 m!346105))

(assert (=> b!345098 d!70933))

(declare-fun d!70935 () Bool)

(declare-fun e!211560 () Bool)

(assert (=> d!70935 e!211560))

(declare-fun res!191000 () Bool)

(assert (=> d!70935 (=> res!191000 e!211560)))

(declare-fun lt!162642 () Bool)

(assert (=> d!70935 (= res!191000 (not lt!162642))))

(declare-fun lt!162639 () Bool)

(assert (=> d!70935 (= lt!162642 lt!162639)))

(declare-datatypes ((Unit!10710 0))(
  ( (Unit!10711) )
))
(declare-fun lt!162641 () Unit!10710)

(declare-fun e!211561 () Unit!10710)

(assert (=> d!70935 (= lt!162641 e!211561)))

(declare-fun c!52925 () Bool)

(assert (=> d!70935 (= c!52925 lt!162639)))

(declare-fun containsKey!329 (List!5004 (_ BitVec 64)) Bool)

(assert (=> d!70935 (= lt!162639 (containsKey!329 (toList!2160 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70935 (= (contains!2230 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162642)))

(declare-fun b!345189 () Bool)

(declare-fun lt!162640 () Unit!10710)

(assert (=> b!345189 (= e!211561 lt!162640)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!278 (List!5004 (_ BitVec 64)) Unit!10710)

(assert (=> b!345189 (= lt!162640 (lemmaContainsKeyImpliesGetValueByKeyDefined!278 (toList!2160 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!343 0))(
  ( (Some!342 (v!5924 V!10859)) (None!341) )
))
(declare-fun isDefined!279 (Option!343) Bool)

(declare-fun getValueByKey!337 (List!5004 (_ BitVec 64)) Option!343)

(assert (=> b!345189 (isDefined!279 (getValueByKey!337 (toList!2160 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345190 () Bool)

(declare-fun Unit!10712 () Unit!10710)

(assert (=> b!345190 (= e!211561 Unit!10712)))

(declare-fun b!345191 () Bool)

(assert (=> b!345191 (= e!211560 (isDefined!279 (getValueByKey!337 (toList!2160 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70935 c!52925) b!345189))

(assert (= (and d!70935 (not c!52925)) b!345190))

(assert (= (and d!70935 (not res!191000)) b!345191))

(declare-fun m!346107 () Bool)

(assert (=> d!70935 m!346107))

(declare-fun m!346109 () Bool)

(assert (=> b!345189 m!346109))

(declare-fun m!346111 () Bool)

(assert (=> b!345189 m!346111))

(assert (=> b!345189 m!346111))

(declare-fun m!346113 () Bool)

(assert (=> b!345189 m!346113))

(assert (=> b!345191 m!346111))

(assert (=> b!345191 m!346111))

(assert (=> b!345191 m!346113))

(assert (=> b!345101 d!70935))

(declare-fun d!70937 () Bool)

(declare-fun e!211596 () Bool)

(assert (=> d!70937 e!211596))

(declare-fun res!191022 () Bool)

(assert (=> d!70937 (=> (not res!191022) (not e!211596))))

(assert (=> d!70937 (= res!191022 (or (bvsge #b00000000000000000000000000000000 (size!9065 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9065 _keys!1895)))))))

(declare-fun lt!162691 () ListLongMap!4289)

(declare-fun lt!162702 () ListLongMap!4289)

(assert (=> d!70937 (= lt!162691 lt!162702)))

(declare-fun lt!162690 () Unit!10710)

(declare-fun e!211599 () Unit!10710)

(assert (=> d!70937 (= lt!162690 e!211599)))

(declare-fun c!52943 () Bool)

(declare-fun e!211591 () Bool)

(assert (=> d!70937 (= c!52943 e!211591)))

(declare-fun res!191020 () Bool)

(assert (=> d!70937 (=> (not res!191020) (not e!211591))))

(assert (=> d!70937 (= res!191020 (bvslt #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(declare-fun e!211589 () ListLongMap!4289)

(assert (=> d!70937 (= lt!162702 e!211589)))

(declare-fun c!52939 () Bool)

(assert (=> d!70937 (= c!52939 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70937 (validMask!0 mask!2385)))

(assert (=> d!70937 (= (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162691)))

(declare-fun b!345234 () Bool)

(declare-fun e!211598 () Bool)

(declare-fun call!26697 () Bool)

(assert (=> b!345234 (= e!211598 (not call!26697))))

(declare-fun bm!26690 () Bool)

(declare-fun call!26695 () ListLongMap!4289)

(declare-fun getCurrentListMapNoExtraKeys!597 (array!18393 array!18395 (_ BitVec 32) (_ BitVec 32) V!10859 V!10859 (_ BitVec 32) Int) ListLongMap!4289)

(assert (=> bm!26690 (= call!26695 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345235 () Bool)

(assert (=> b!345235 (= e!211591 (validKeyInArray!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26691 () Bool)

(declare-fun call!26694 () ListLongMap!4289)

(declare-fun call!26698 () ListLongMap!4289)

(assert (=> bm!26691 (= call!26694 call!26698)))

(declare-fun b!345236 () Bool)

(declare-fun e!211600 () Bool)

(declare-fun call!26693 () Bool)

(assert (=> b!345236 (= e!211600 (not call!26693))))

(declare-fun b!345237 () Bool)

(declare-fun Unit!10713 () Unit!10710)

(assert (=> b!345237 (= e!211599 Unit!10713)))

(declare-fun bm!26692 () Bool)

(declare-fun call!26699 () ListLongMap!4289)

(declare-fun call!26696 () ListLongMap!4289)

(assert (=> bm!26692 (= call!26699 call!26696)))

(declare-fun bm!26693 () Bool)

(assert (=> bm!26693 (= call!26697 (contains!2230 lt!162691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345238 () Bool)

(declare-fun e!211588 () ListLongMap!4289)

(assert (=> b!345238 (= e!211588 call!26694)))

(declare-fun b!345239 () Bool)

(declare-fun e!211593 () ListLongMap!4289)

(assert (=> b!345239 (= e!211593 call!26699)))

(declare-fun b!345240 () Bool)

(declare-fun e!211592 () Bool)

(declare-fun e!211590 () Bool)

(assert (=> b!345240 (= e!211592 e!211590)))

(declare-fun res!191023 () Bool)

(assert (=> b!345240 (=> (not res!191023) (not e!211590))))

(assert (=> b!345240 (= res!191023 (contains!2230 lt!162691 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345240 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(declare-fun bm!26694 () Bool)

(declare-fun c!52941 () Bool)

(declare-fun +!734 (ListLongMap!4289 tuple2!5386) ListLongMap!4289)

(assert (=> bm!26694 (= call!26696 (+!734 (ite c!52939 call!26695 (ite c!52941 call!26698 call!26694)) (ite (or c!52939 c!52941) (tuple2!5387 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26695 () Bool)

(assert (=> bm!26695 (= call!26693 (contains!2230 lt!162691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345241 () Bool)

(declare-fun lt!162687 () Unit!10710)

(assert (=> b!345241 (= e!211599 lt!162687)))

(declare-fun lt!162689 () ListLongMap!4289)

(assert (=> b!345241 (= lt!162689 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162703 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162703 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162701 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162701 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162700 () Unit!10710)

(declare-fun addStillContains!257 (ListLongMap!4289 (_ BitVec 64) V!10859 (_ BitVec 64)) Unit!10710)

(assert (=> b!345241 (= lt!162700 (addStillContains!257 lt!162689 lt!162703 zeroValue!1467 lt!162701))))

(assert (=> b!345241 (contains!2230 (+!734 lt!162689 (tuple2!5387 lt!162703 zeroValue!1467)) lt!162701)))

(declare-fun lt!162704 () Unit!10710)

(assert (=> b!345241 (= lt!162704 lt!162700)))

(declare-fun lt!162698 () ListLongMap!4289)

(assert (=> b!345241 (= lt!162698 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162695 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162695 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162692 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162692 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162699 () Unit!10710)

(declare-fun addApplyDifferent!257 (ListLongMap!4289 (_ BitVec 64) V!10859 (_ BitVec 64)) Unit!10710)

(assert (=> b!345241 (= lt!162699 (addApplyDifferent!257 lt!162698 lt!162695 minValue!1467 lt!162692))))

(declare-fun apply!281 (ListLongMap!4289 (_ BitVec 64)) V!10859)

(assert (=> b!345241 (= (apply!281 (+!734 lt!162698 (tuple2!5387 lt!162695 minValue!1467)) lt!162692) (apply!281 lt!162698 lt!162692))))

(declare-fun lt!162693 () Unit!10710)

(assert (=> b!345241 (= lt!162693 lt!162699)))

(declare-fun lt!162708 () ListLongMap!4289)

(assert (=> b!345241 (= lt!162708 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162688 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162694 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162694 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162696 () Unit!10710)

(assert (=> b!345241 (= lt!162696 (addApplyDifferent!257 lt!162708 lt!162688 zeroValue!1467 lt!162694))))

(assert (=> b!345241 (= (apply!281 (+!734 lt!162708 (tuple2!5387 lt!162688 zeroValue!1467)) lt!162694) (apply!281 lt!162708 lt!162694))))

(declare-fun lt!162706 () Unit!10710)

(assert (=> b!345241 (= lt!162706 lt!162696)))

(declare-fun lt!162707 () ListLongMap!4289)

(assert (=> b!345241 (= lt!162707 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162705 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162705 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162697 () (_ BitVec 64))

(assert (=> b!345241 (= lt!162697 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345241 (= lt!162687 (addApplyDifferent!257 lt!162707 lt!162705 minValue!1467 lt!162697))))

(assert (=> b!345241 (= (apply!281 (+!734 lt!162707 (tuple2!5387 lt!162705 minValue!1467)) lt!162697) (apply!281 lt!162707 lt!162697))))

(declare-fun b!345242 () Bool)

(assert (=> b!345242 (= e!211596 e!211600)))

(declare-fun c!52942 () Bool)

(assert (=> b!345242 (= c!52942 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345243 () Bool)

(declare-fun res!191025 () Bool)

(assert (=> b!345243 (=> (not res!191025) (not e!211596))))

(assert (=> b!345243 (= res!191025 e!211598)))

(declare-fun c!52940 () Bool)

(assert (=> b!345243 (= c!52940 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345244 () Bool)

(declare-fun e!211594 () Bool)

(assert (=> b!345244 (= e!211594 (= (apply!281 lt!162691 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345245 () Bool)

(assert (=> b!345245 (= e!211598 e!211594)))

(declare-fun res!191027 () Bool)

(assert (=> b!345245 (= res!191027 call!26697)))

(assert (=> b!345245 (=> (not res!191027) (not e!211594))))

(declare-fun b!345246 () Bool)

(declare-fun e!211595 () Bool)

(assert (=> b!345246 (= e!211595 (= (apply!281 lt!162691 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345247 () Bool)

(declare-fun get!4691 (ValueCell!3362 V!10859) V!10859)

(declare-fun dynLambda!615 (Int (_ BitVec 64)) V!10859)

(assert (=> b!345247 (= e!211590 (= (apply!281 lt!162691 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)) (get!4691 (select (arr!8713 _values!1525) #b00000000000000000000000000000000) (dynLambda!615 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9066 _values!1525)))))

(assert (=> b!345247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(declare-fun b!345248 () Bool)

(assert (=> b!345248 (= e!211600 e!211595)))

(declare-fun res!191019 () Bool)

(assert (=> b!345248 (= res!191019 call!26693)))

(assert (=> b!345248 (=> (not res!191019) (not e!211595))))

(declare-fun b!345249 () Bool)

(declare-fun e!211597 () Bool)

(assert (=> b!345249 (= e!211597 (validKeyInArray!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26696 () Bool)

(assert (=> bm!26696 (= call!26698 call!26695)))

(declare-fun b!345250 () Bool)

(assert (=> b!345250 (= e!211588 call!26699)))

(declare-fun b!345251 () Bool)

(declare-fun res!191021 () Bool)

(assert (=> b!345251 (=> (not res!191021) (not e!211596))))

(assert (=> b!345251 (= res!191021 e!211592)))

(declare-fun res!191024 () Bool)

(assert (=> b!345251 (=> res!191024 e!211592)))

(assert (=> b!345251 (= res!191024 (not e!211597))))

(declare-fun res!191026 () Bool)

(assert (=> b!345251 (=> (not res!191026) (not e!211597))))

(assert (=> b!345251 (= res!191026 (bvslt #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(declare-fun b!345252 () Bool)

(assert (=> b!345252 (= e!211589 (+!734 call!26696 (tuple2!5387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345253 () Bool)

(assert (=> b!345253 (= e!211589 e!211593)))

(assert (=> b!345253 (= c!52941 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345254 () Bool)

(declare-fun c!52938 () Bool)

(assert (=> b!345254 (= c!52938 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345254 (= e!211593 e!211588)))

(assert (= (and d!70937 c!52939) b!345252))

(assert (= (and d!70937 (not c!52939)) b!345253))

(assert (= (and b!345253 c!52941) b!345239))

(assert (= (and b!345253 (not c!52941)) b!345254))

(assert (= (and b!345254 c!52938) b!345250))

(assert (= (and b!345254 (not c!52938)) b!345238))

(assert (= (or b!345250 b!345238) bm!26691))

(assert (= (or b!345239 bm!26691) bm!26696))

(assert (= (or b!345239 b!345250) bm!26692))

(assert (= (or b!345252 bm!26696) bm!26690))

(assert (= (or b!345252 bm!26692) bm!26694))

(assert (= (and d!70937 res!191020) b!345235))

(assert (= (and d!70937 c!52943) b!345241))

(assert (= (and d!70937 (not c!52943)) b!345237))

(assert (= (and d!70937 res!191022) b!345251))

(assert (= (and b!345251 res!191026) b!345249))

(assert (= (and b!345251 (not res!191024)) b!345240))

(assert (= (and b!345240 res!191023) b!345247))

(assert (= (and b!345251 res!191021) b!345243))

(assert (= (and b!345243 c!52940) b!345245))

(assert (= (and b!345243 (not c!52940)) b!345234))

(assert (= (and b!345245 res!191027) b!345244))

(assert (= (or b!345245 b!345234) bm!26693))

(assert (= (and b!345243 res!191025) b!345242))

(assert (= (and b!345242 c!52942) b!345248))

(assert (= (and b!345242 (not c!52942)) b!345236))

(assert (= (and b!345248 res!191019) b!345246))

(assert (= (or b!345248 b!345236) bm!26695))

(declare-fun b_lambda!8445 () Bool)

(assert (=> (not b_lambda!8445) (not b!345247)))

(declare-fun t!10117 () Bool)

(declare-fun tb!3069 () Bool)

(assert (=> (and start!34540 (= defaultEntry!1528 defaultEntry!1528) t!10117) tb!3069))

(declare-fun result!5553 () Bool)

(assert (=> tb!3069 (= result!5553 tp_is_empty!7411)))

(assert (=> b!345247 t!10117))

(declare-fun b_and!14649 () Bool)

(assert (= b_and!14643 (and (=> t!10117 result!5553) b_and!14649)))

(declare-fun m!346115 () Bool)

(assert (=> bm!26694 m!346115))

(assert (=> b!345249 m!346099))

(assert (=> b!345249 m!346099))

(assert (=> b!345249 m!346101))

(declare-fun m!346117 () Bool)

(assert (=> b!345247 m!346117))

(assert (=> b!345247 m!346099))

(declare-fun m!346119 () Bool)

(assert (=> b!345247 m!346119))

(declare-fun m!346121 () Bool)

(assert (=> b!345247 m!346121))

(assert (=> b!345247 m!346117))

(assert (=> b!345247 m!346121))

(declare-fun m!346123 () Bool)

(assert (=> b!345247 m!346123))

(assert (=> b!345247 m!346099))

(declare-fun m!346125 () Bool)

(assert (=> bm!26693 m!346125))

(assert (=> b!345240 m!346099))

(assert (=> b!345240 m!346099))

(declare-fun m!346127 () Bool)

(assert (=> b!345240 m!346127))

(declare-fun m!346129 () Bool)

(assert (=> bm!26690 m!346129))

(declare-fun m!346131 () Bool)

(assert (=> b!345241 m!346131))

(declare-fun m!346133 () Bool)

(assert (=> b!345241 m!346133))

(declare-fun m!346135 () Bool)

(assert (=> b!345241 m!346135))

(declare-fun m!346137 () Bool)

(assert (=> b!345241 m!346137))

(declare-fun m!346139 () Bool)

(assert (=> b!345241 m!346139))

(declare-fun m!346141 () Bool)

(assert (=> b!345241 m!346141))

(declare-fun m!346143 () Bool)

(assert (=> b!345241 m!346143))

(declare-fun m!346145 () Bool)

(assert (=> b!345241 m!346145))

(assert (=> b!345241 m!346139))

(declare-fun m!346147 () Bool)

(assert (=> b!345241 m!346147))

(declare-fun m!346149 () Bool)

(assert (=> b!345241 m!346149))

(declare-fun m!346151 () Bool)

(assert (=> b!345241 m!346151))

(declare-fun m!346153 () Bool)

(assert (=> b!345241 m!346153))

(assert (=> b!345241 m!346135))

(assert (=> b!345241 m!346099))

(declare-fun m!346155 () Bool)

(assert (=> b!345241 m!346155))

(assert (=> b!345241 m!346151))

(assert (=> b!345241 m!346131))

(declare-fun m!346157 () Bool)

(assert (=> b!345241 m!346157))

(assert (=> b!345241 m!346129))

(declare-fun m!346159 () Bool)

(assert (=> b!345241 m!346159))

(assert (=> d!70937 m!346037))

(declare-fun m!346161 () Bool)

(assert (=> b!345252 m!346161))

(declare-fun m!346163 () Bool)

(assert (=> bm!26695 m!346163))

(declare-fun m!346165 () Bool)

(assert (=> b!345246 m!346165))

(declare-fun m!346167 () Bool)

(assert (=> b!345244 m!346167))

(assert (=> b!345235 m!346099))

(assert (=> b!345235 m!346099))

(assert (=> b!345235 m!346101))

(assert (=> b!345101 d!70937))

(declare-fun d!70939 () Bool)

(assert (=> d!70939 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34540 d!70939))

(declare-fun d!70941 () Bool)

(assert (=> d!70941 (= (array_inv!6476 _values!1525) (bvsge (size!9066 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34540 d!70941))

(declare-fun d!70943 () Bool)

(assert (=> d!70943 (= (array_inv!6477 _keys!1895) (bvsge (size!9065 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34540 d!70943))

(declare-fun e!211607 () SeekEntryResult!3354)

(declare-fun lt!162717 () SeekEntryResult!3354)

(declare-fun b!345269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18393 (_ BitVec 32)) SeekEntryResult!3354)

(assert (=> b!345269 (= e!211607 (seekKeyOrZeroReturnVacant!0 (x!34401 lt!162717) (index!15597 lt!162717) (index!15597 lt!162717) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345270 () Bool)

(declare-fun e!211609 () SeekEntryResult!3354)

(assert (=> b!345270 (= e!211609 Undefined!3354)))

(declare-fun d!70945 () Bool)

(declare-fun lt!162716 () SeekEntryResult!3354)

(assert (=> d!70945 (and (or ((_ is Undefined!3354) lt!162716) (not ((_ is Found!3354) lt!162716)) (and (bvsge (index!15596 lt!162716) #b00000000000000000000000000000000) (bvslt (index!15596 lt!162716) (size!9065 _keys!1895)))) (or ((_ is Undefined!3354) lt!162716) ((_ is Found!3354) lt!162716) (not ((_ is MissingZero!3354) lt!162716)) (and (bvsge (index!15595 lt!162716) #b00000000000000000000000000000000) (bvslt (index!15595 lt!162716) (size!9065 _keys!1895)))) (or ((_ is Undefined!3354) lt!162716) ((_ is Found!3354) lt!162716) ((_ is MissingZero!3354) lt!162716) (not ((_ is MissingVacant!3354) lt!162716)) (and (bvsge (index!15598 lt!162716) #b00000000000000000000000000000000) (bvslt (index!15598 lt!162716) (size!9065 _keys!1895)))) (or ((_ is Undefined!3354) lt!162716) (ite ((_ is Found!3354) lt!162716) (= (select (arr!8712 _keys!1895) (index!15596 lt!162716)) k0!1348) (ite ((_ is MissingZero!3354) lt!162716) (= (select (arr!8712 _keys!1895) (index!15595 lt!162716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3354) lt!162716) (= (select (arr!8712 _keys!1895) (index!15598 lt!162716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70945 (= lt!162716 e!211609)))

(declare-fun c!52951 () Bool)

(assert (=> d!70945 (= c!52951 (and ((_ is Intermediate!3354) lt!162717) (undefined!4166 lt!162717)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18393 (_ BitVec 32)) SeekEntryResult!3354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70945 (= lt!162717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70945 (validMask!0 mask!2385)))

(assert (=> d!70945 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162716)))

(declare-fun b!345271 () Bool)

(assert (=> b!345271 (= e!211607 (MissingZero!3354 (index!15597 lt!162717)))))

(declare-fun b!345272 () Bool)

(declare-fun e!211608 () SeekEntryResult!3354)

(assert (=> b!345272 (= e!211608 (Found!3354 (index!15597 lt!162717)))))

(declare-fun b!345273 () Bool)

(assert (=> b!345273 (= e!211609 e!211608)))

(declare-fun lt!162715 () (_ BitVec 64))

(assert (=> b!345273 (= lt!162715 (select (arr!8712 _keys!1895) (index!15597 lt!162717)))))

(declare-fun c!52950 () Bool)

(assert (=> b!345273 (= c!52950 (= lt!162715 k0!1348))))

(declare-fun b!345274 () Bool)

(declare-fun c!52952 () Bool)

(assert (=> b!345274 (= c!52952 (= lt!162715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345274 (= e!211608 e!211607)))

(assert (= (and d!70945 c!52951) b!345270))

(assert (= (and d!70945 (not c!52951)) b!345273))

(assert (= (and b!345273 c!52950) b!345272))

(assert (= (and b!345273 (not c!52950)) b!345274))

(assert (= (and b!345274 c!52952) b!345271))

(assert (= (and b!345274 (not c!52952)) b!345269))

(declare-fun m!346169 () Bool)

(assert (=> b!345269 m!346169))

(declare-fun m!346171 () Bool)

(assert (=> d!70945 m!346171))

(declare-fun m!346173 () Bool)

(assert (=> d!70945 m!346173))

(declare-fun m!346175 () Bool)

(assert (=> d!70945 m!346175))

(declare-fun m!346177 () Bool)

(assert (=> d!70945 m!346177))

(assert (=> d!70945 m!346171))

(declare-fun m!346179 () Bool)

(assert (=> d!70945 m!346179))

(assert (=> d!70945 m!346037))

(declare-fun m!346181 () Bool)

(assert (=> b!345273 m!346181))

(assert (=> b!345105 d!70945))

(declare-fun bm!26699 () Bool)

(declare-fun call!26702 () Bool)

(assert (=> bm!26699 (= call!26702 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345283 () Bool)

(declare-fun e!211618 () Bool)

(declare-fun e!211616 () Bool)

(assert (=> b!345283 (= e!211618 e!211616)))

(declare-fun lt!162725 () (_ BitVec 64))

(assert (=> b!345283 (= lt!162725 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162726 () Unit!10710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18393 (_ BitVec 64) (_ BitVec 32)) Unit!10710)

(assert (=> b!345283 (= lt!162726 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162725 #b00000000000000000000000000000000))))

(assert (=> b!345283 (arrayContainsKey!0 _keys!1895 lt!162725 #b00000000000000000000000000000000)))

(declare-fun lt!162724 () Unit!10710)

(assert (=> b!345283 (= lt!162724 lt!162726)))

(declare-fun res!191033 () Bool)

(assert (=> b!345283 (= res!191033 (= (seekEntryOrOpen!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3354 #b00000000000000000000000000000000)))))

(assert (=> b!345283 (=> (not res!191033) (not e!211616))))

(declare-fun b!345284 () Bool)

(assert (=> b!345284 (= e!211616 call!26702)))

(declare-fun d!70947 () Bool)

(declare-fun res!191032 () Bool)

(declare-fun e!211617 () Bool)

(assert (=> d!70947 (=> res!191032 e!211617)))

(assert (=> d!70947 (= res!191032 (bvsge #b00000000000000000000000000000000 (size!9065 _keys!1895)))))

(assert (=> d!70947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211617)))

(declare-fun b!345285 () Bool)

(assert (=> b!345285 (= e!211618 call!26702)))

(declare-fun b!345286 () Bool)

(assert (=> b!345286 (= e!211617 e!211618)))

(declare-fun c!52955 () Bool)

(assert (=> b!345286 (= c!52955 (validKeyInArray!0 (select (arr!8712 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70947 (not res!191032)) b!345286))

(assert (= (and b!345286 c!52955) b!345283))

(assert (= (and b!345286 (not c!52955)) b!345285))

(assert (= (and b!345283 res!191033) b!345284))

(assert (= (or b!345284 b!345285) bm!26699))

(declare-fun m!346183 () Bool)

(assert (=> bm!26699 m!346183))

(assert (=> b!345283 m!346099))

(declare-fun m!346185 () Bool)

(assert (=> b!345283 m!346185))

(declare-fun m!346187 () Bool)

(assert (=> b!345283 m!346187))

(assert (=> b!345283 m!346099))

(declare-fun m!346189 () Bool)

(assert (=> b!345283 m!346189))

(assert (=> b!345286 m!346099))

(assert (=> b!345286 m!346099))

(assert (=> b!345286 m!346101))

(assert (=> b!345100 d!70947))

(declare-fun d!70949 () Bool)

(declare-fun res!191038 () Bool)

(declare-fun e!211623 () Bool)

(assert (=> d!70949 (=> res!191038 e!211623)))

(assert (=> d!70949 (= res!191038 (= (select (arr!8712 _keys!1895) (index!15596 lt!162624)) k0!1348))))

(assert (=> d!70949 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15596 lt!162624)) e!211623)))

(declare-fun b!345291 () Bool)

(declare-fun e!211624 () Bool)

(assert (=> b!345291 (= e!211623 e!211624)))

(declare-fun res!191039 () Bool)

(assert (=> b!345291 (=> (not res!191039) (not e!211624))))

(assert (=> b!345291 (= res!191039 (bvslt (bvadd (index!15596 lt!162624) #b00000000000000000000000000000001) (size!9065 _keys!1895)))))

(declare-fun b!345292 () Bool)

(assert (=> b!345292 (= e!211624 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15596 lt!162624) #b00000000000000000000000000000001)))))

(assert (= (and d!70949 (not res!191038)) b!345291))

(assert (= (and b!345291 res!191039) b!345292))

(assert (=> d!70949 m!346045))

(declare-fun m!346191 () Bool)

(assert (=> b!345292 m!346191))

(assert (=> b!345104 d!70949))

(declare-fun d!70951 () Bool)

(assert (=> d!70951 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345099 d!70951))

(declare-fun b!345299 () Bool)

(declare-fun e!211629 () Bool)

(assert (=> b!345299 (= e!211629 tp_is_empty!7411)))

(declare-fun b!345300 () Bool)

(declare-fun e!211630 () Bool)

(assert (=> b!345300 (= e!211630 tp_is_empty!7411)))

(declare-fun mapNonEmpty!12567 () Bool)

(declare-fun mapRes!12567 () Bool)

(declare-fun tp!25941 () Bool)

(assert (=> mapNonEmpty!12567 (= mapRes!12567 (and tp!25941 e!211629))))

(declare-fun mapRest!12567 () (Array (_ BitVec 32) ValueCell!3362))

(declare-fun mapValue!12567 () ValueCell!3362)

(declare-fun mapKey!12567 () (_ BitVec 32))

(assert (=> mapNonEmpty!12567 (= mapRest!12558 (store mapRest!12567 mapKey!12567 mapValue!12567))))

(declare-fun condMapEmpty!12567 () Bool)

(declare-fun mapDefault!12567 () ValueCell!3362)

(assert (=> mapNonEmpty!12558 (= condMapEmpty!12567 (= mapRest!12558 ((as const (Array (_ BitVec 32) ValueCell!3362)) mapDefault!12567)))))

(assert (=> mapNonEmpty!12558 (= tp!25925 (and e!211630 mapRes!12567))))

(declare-fun mapIsEmpty!12567 () Bool)

(assert (=> mapIsEmpty!12567 mapRes!12567))

(assert (= (and mapNonEmpty!12558 condMapEmpty!12567) mapIsEmpty!12567))

(assert (= (and mapNonEmpty!12558 (not condMapEmpty!12567)) mapNonEmpty!12567))

(assert (= (and mapNonEmpty!12567 ((_ is ValueCellFull!3362) mapValue!12567)) b!345299))

(assert (= (and mapNonEmpty!12558 ((_ is ValueCellFull!3362) mapDefault!12567)) b!345300))

(declare-fun m!346193 () Bool)

(assert (=> mapNonEmpty!12567 m!346193))

(declare-fun b_lambda!8447 () Bool)

(assert (= b_lambda!8445 (or (and start!34540 b_free!7459) b_lambda!8447)))

(check-sat (not b!345241) (not bm!26690) (not b_lambda!8447) (not d!70937) (not b_next!7459) (not b!345244) (not d!70935) (not bm!26693) (not mapNonEmpty!12567) (not d!70945) tp_is_empty!7411 (not bm!26699) (not b!345182) (not bm!26675) (not b!345252) (not bm!26694) (not b!345286) (not b!345247) b_and!14649 (not b!345191) (not b!345249) (not b!345240) (not b!345179) (not b!345292) (not b!345181) (not b!345235) (not b!345283) (not bm!26695) (not b!345246) (not b!345189) (not b!345269))
(check-sat b_and!14649 (not b_next!7459))
