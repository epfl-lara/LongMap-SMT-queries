; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38684 () Bool)

(assert start!38684)

(declare-fun b_free!9235 () Bool)

(declare-fun b_next!9235 () Bool)

(assert (=> start!38684 (= b_free!9235 (not b_next!9235))))

(declare-fun tp!32828 () Bool)

(declare-fun b_and!16635 () Bool)

(assert (=> start!38684 (= tp!32828 b_and!16635)))

(declare-fun b!402402 () Bool)

(declare-fun res!231809 () Bool)

(declare-fun e!242441 () Bool)

(assert (=> b!402402 (=> (not res!231809) (not e!242441))))

(declare-datatypes ((array!24118 0))(
  ( (array!24119 (arr!11508 (Array (_ BitVec 32) (_ BitVec 64))) (size!11860 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24118)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402402 (= res!231809 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11860 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16797 () Bool)

(declare-fun mapRes!16797 () Bool)

(assert (=> mapIsEmpty!16797 mapRes!16797))

(declare-fun b!402403 () Bool)

(declare-fun e!242442 () Bool)

(declare-datatypes ((V!14595 0))(
  ( (V!14596 (val!5103 Int)) )
))
(declare-datatypes ((tuple2!6642 0))(
  ( (tuple2!6643 (_1!3332 (_ BitVec 64)) (_2!3332 V!14595)) )
))
(declare-datatypes ((List!6564 0))(
  ( (Nil!6561) (Cons!6560 (h!7416 tuple2!6642) (t!11730 List!6564)) )
))
(declare-datatypes ((ListLongMap!5557 0))(
  ( (ListLongMap!5558 (toList!2794 List!6564)) )
))
(declare-fun call!28357 () ListLongMap!5557)

(declare-fun call!28356 () ListLongMap!5557)

(assert (=> b!402403 (= e!242442 (= call!28357 call!28356))))

(declare-fun b!402404 () Bool)

(declare-fun res!231803 () Bool)

(declare-fun e!242440 () Bool)

(assert (=> b!402404 (=> (not res!231803) (not e!242440))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402404 (= res!231803 (validKeyInArray!0 k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54786 () Bool)

(declare-datatypes ((ValueCell!4715 0))(
  ( (ValueCellFull!4715 (v!7351 V!14595)) (EmptyCell!4715) )
))
(declare-datatypes ((array!24120 0))(
  ( (array!24121 (arr!11509 (Array (_ BitVec 32) ValueCell!4715)) (size!11861 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24120)

(declare-fun zeroValue!515 () V!14595)

(declare-fun lt!187949 () array!24118)

(declare-fun v!412 () V!14595)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!14595)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28353 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1048 (array!24118 array!24120 (_ BitVec 32) (_ BitVec 32) V!14595 V!14595 (_ BitVec 32) Int) ListLongMap!5557)

(assert (=> bm!28353 (= call!28356 (getCurrentListMapNoExtraKeys!1048 (ite c!54786 lt!187949 _keys!709) (ite c!54786 (array!24121 (store (arr!11509 _values!549) i!563 (ValueCellFull!4715 v!412)) (size!11861 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402405 () Bool)

(declare-fun res!231801 () Bool)

(assert (=> b!402405 (=> (not res!231801) (not e!242440))))

(declare-fun arrayContainsKey!0 (array!24118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402405 (= res!231801 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28354 () Bool)

(assert (=> bm!28354 (= call!28357 (getCurrentListMapNoExtraKeys!1048 (ite c!54786 _keys!709 lt!187949) (ite c!54786 _values!549 (array!24121 (store (arr!11509 _values!549) i!563 (ValueCellFull!4715 v!412)) (size!11861 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402406 () Bool)

(declare-fun e!242443 () Bool)

(declare-fun e!242437 () Bool)

(assert (=> b!402406 (= e!242443 (and e!242437 mapRes!16797))))

(declare-fun condMapEmpty!16797 () Bool)

(declare-fun mapDefault!16797 () ValueCell!4715)

(assert (=> b!402406 (= condMapEmpty!16797 (= (arr!11509 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4715)) mapDefault!16797)))))

(declare-fun b!402407 () Bool)

(declare-fun res!231808 () Bool)

(assert (=> b!402407 (=> (not res!231808) (not e!242440))))

(assert (=> b!402407 (= res!231808 (and (= (size!11861 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11860 _keys!709) (size!11861 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402408 () Bool)

(declare-fun tp_is_empty!10117 () Bool)

(assert (=> b!402408 (= e!242437 tp_is_empty!10117)))

(declare-fun b!402409 () Bool)

(declare-fun res!231802 () Bool)

(assert (=> b!402409 (=> (not res!231802) (not e!242440))))

(assert (=> b!402409 (= res!231802 (or (= (select (arr!11508 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11508 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402410 () Bool)

(declare-fun res!231806 () Bool)

(assert (=> b!402410 (=> (not res!231806) (not e!242440))))

(assert (=> b!402410 (= res!231806 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11860 _keys!709))))))

(declare-fun b!402411 () Bool)

(assert (=> b!402411 (= e!242441 (not true))))

(assert (=> b!402411 e!242442))

(assert (=> b!402411 (= c!54786 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12161 0))(
  ( (Unit!12162) )
))
(declare-fun lt!187950 () Unit!12161)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!348 (array!24118 array!24120 (_ BitVec 32) (_ BitVec 32) V!14595 V!14595 (_ BitVec 32) (_ BitVec 64) V!14595 (_ BitVec 32) Int) Unit!12161)

(assert (=> b!402411 (= lt!187950 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402412 () Bool)

(declare-fun res!231805 () Bool)

(assert (=> b!402412 (=> (not res!231805) (not e!242440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402412 (= res!231805 (validMask!0 mask!1025))))

(declare-fun b!402413 () Bool)

(declare-fun res!231800 () Bool)

(assert (=> b!402413 (=> (not res!231800) (not e!242440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24118 (_ BitVec 32)) Bool)

(assert (=> b!402413 (= res!231800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402414 () Bool)

(assert (=> b!402414 (= e!242440 e!242441)))

(declare-fun res!231799 () Bool)

(assert (=> b!402414 (=> (not res!231799) (not e!242441))))

(assert (=> b!402414 (= res!231799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187949 mask!1025))))

(assert (=> b!402414 (= lt!187949 (array!24119 (store (arr!11508 _keys!709) i!563 k0!794) (size!11860 _keys!709)))))

(declare-fun b!402415 () Bool)

(declare-fun res!231810 () Bool)

(assert (=> b!402415 (=> (not res!231810) (not e!242441))))

(declare-datatypes ((List!6565 0))(
  ( (Nil!6562) (Cons!6561 (h!7417 (_ BitVec 64)) (t!11731 List!6565)) )
))
(declare-fun arrayNoDuplicates!0 (array!24118 (_ BitVec 32) List!6565) Bool)

(assert (=> b!402415 (= res!231810 (arrayNoDuplicates!0 lt!187949 #b00000000000000000000000000000000 Nil!6562))))

(declare-fun mapNonEmpty!16797 () Bool)

(declare-fun tp!32829 () Bool)

(declare-fun e!242438 () Bool)

(assert (=> mapNonEmpty!16797 (= mapRes!16797 (and tp!32829 e!242438))))

(declare-fun mapRest!16797 () (Array (_ BitVec 32) ValueCell!4715))

(declare-fun mapKey!16797 () (_ BitVec 32))

(declare-fun mapValue!16797 () ValueCell!4715)

(assert (=> mapNonEmpty!16797 (= (arr!11509 _values!549) (store mapRest!16797 mapKey!16797 mapValue!16797))))

(declare-fun b!402416 () Bool)

(declare-fun +!1136 (ListLongMap!5557 tuple2!6642) ListLongMap!5557)

(assert (=> b!402416 (= e!242442 (= call!28356 (+!1136 call!28357 (tuple2!6643 k0!794 v!412))))))

(declare-fun b!402417 () Bool)

(assert (=> b!402417 (= e!242438 tp_is_empty!10117)))

(declare-fun res!231804 () Bool)

(assert (=> start!38684 (=> (not res!231804) (not e!242440))))

(assert (=> start!38684 (= res!231804 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11860 _keys!709))))))

(assert (=> start!38684 e!242440))

(assert (=> start!38684 tp_is_empty!10117))

(assert (=> start!38684 tp!32828))

(assert (=> start!38684 true))

(declare-fun array_inv!8496 (array!24120) Bool)

(assert (=> start!38684 (and (array_inv!8496 _values!549) e!242443)))

(declare-fun array_inv!8497 (array!24118) Bool)

(assert (=> start!38684 (array_inv!8497 _keys!709)))

(declare-fun b!402418 () Bool)

(declare-fun res!231807 () Bool)

(assert (=> b!402418 (=> (not res!231807) (not e!242440))))

(assert (=> b!402418 (= res!231807 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6562))))

(assert (= (and start!38684 res!231804) b!402412))

(assert (= (and b!402412 res!231805) b!402407))

(assert (= (and b!402407 res!231808) b!402413))

(assert (= (and b!402413 res!231800) b!402418))

(assert (= (and b!402418 res!231807) b!402410))

(assert (= (and b!402410 res!231806) b!402404))

(assert (= (and b!402404 res!231803) b!402409))

(assert (= (and b!402409 res!231802) b!402405))

(assert (= (and b!402405 res!231801) b!402414))

(assert (= (and b!402414 res!231799) b!402415))

(assert (= (and b!402415 res!231810) b!402402))

(assert (= (and b!402402 res!231809) b!402411))

(assert (= (and b!402411 c!54786) b!402416))

(assert (= (and b!402411 (not c!54786)) b!402403))

(assert (= (or b!402416 b!402403) bm!28353))

(assert (= (or b!402416 b!402403) bm!28354))

(assert (= (and b!402406 condMapEmpty!16797) mapIsEmpty!16797))

(assert (= (and b!402406 (not condMapEmpty!16797)) mapNonEmpty!16797))

(get-info :version)

(assert (= (and mapNonEmpty!16797 ((_ is ValueCellFull!4715) mapValue!16797)) b!402417))

(assert (= (and b!402406 ((_ is ValueCellFull!4715) mapDefault!16797)) b!402408))

(assert (= start!38684 b!402406))

(declare-fun m!396201 () Bool)

(assert (=> b!402413 m!396201))

(declare-fun m!396203 () Bool)

(assert (=> b!402416 m!396203))

(declare-fun m!396205 () Bool)

(assert (=> b!402409 m!396205))

(declare-fun m!396207 () Bool)

(assert (=> mapNonEmpty!16797 m!396207))

(declare-fun m!396209 () Bool)

(assert (=> bm!28353 m!396209))

(declare-fun m!396211 () Bool)

(assert (=> bm!28353 m!396211))

(declare-fun m!396213 () Bool)

(assert (=> b!402404 m!396213))

(declare-fun m!396215 () Bool)

(assert (=> b!402414 m!396215))

(declare-fun m!396217 () Bool)

(assert (=> b!402414 m!396217))

(declare-fun m!396219 () Bool)

(assert (=> b!402415 m!396219))

(declare-fun m!396221 () Bool)

(assert (=> b!402411 m!396221))

(declare-fun m!396223 () Bool)

(assert (=> b!402418 m!396223))

(assert (=> bm!28354 m!396209))

(declare-fun m!396225 () Bool)

(assert (=> bm!28354 m!396225))

(declare-fun m!396227 () Bool)

(assert (=> start!38684 m!396227))

(declare-fun m!396229 () Bool)

(assert (=> start!38684 m!396229))

(declare-fun m!396231 () Bool)

(assert (=> b!402405 m!396231))

(declare-fun m!396233 () Bool)

(assert (=> b!402412 m!396233))

(check-sat (not bm!28354) (not bm!28353) (not b!402415) (not b!402418) (not b!402414) (not start!38684) (not b!402405) b_and!16635 (not mapNonEmpty!16797) (not b_next!9235) (not b!402416) (not b!402404) (not b!402413) tp_is_empty!10117 (not b!402412) (not b!402411))
(check-sat b_and!16635 (not b_next!9235))
