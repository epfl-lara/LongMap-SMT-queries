; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38732 () Bool)

(assert start!38732)

(declare-fun b_free!9283 () Bool)

(declare-fun b_next!9283 () Bool)

(assert (=> start!38732 (= b_free!9283 (not b_next!9283))))

(declare-fun tp!32972 () Bool)

(declare-fun b_and!16643 () Bool)

(assert (=> start!38732 (= tp!32972 b_and!16643)))

(declare-datatypes ((V!14659 0))(
  ( (V!14660 (val!5127 Int)) )
))
(declare-fun minValue!515 () V!14659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4739 0))(
  ( (ValueCellFull!4739 (v!7368 V!14659)) (EmptyCell!4739) )
))
(declare-datatypes ((array!24211 0))(
  ( (array!24212 (arr!11555 (Array (_ BitVec 32) ValueCell!4739)) (size!11908 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24211)

(declare-fun zeroValue!515 () V!14659)

(declare-fun c!54810 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24213 0))(
  ( (array!24214 (arr!11556 (Array (_ BitVec 32) (_ BitVec 64))) (size!11909 (_ BitVec 32))) )
))
(declare-fun lt!187841 () array!24213)

(declare-fun _keys!709 () array!24213)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!28485 () Bool)

(declare-datatypes ((tuple2!6802 0))(
  ( (tuple2!6803 (_1!3412 (_ BitVec 64)) (_2!3412 V!14659)) )
))
(declare-datatypes ((List!6705 0))(
  ( (Nil!6702) (Cons!6701 (h!7557 tuple2!6802) (t!11870 List!6705)) )
))
(declare-datatypes ((ListLongMap!5705 0))(
  ( (ListLongMap!5706 (toList!2868 List!6705)) )
))
(declare-fun call!28489 () ListLongMap!5705)

(declare-fun v!412 () V!14659)

(declare-fun getCurrentListMapNoExtraKeys!1083 (array!24213 array!24211 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) Int) ListLongMap!5705)

(assert (=> bm!28485 (= call!28489 (getCurrentListMapNoExtraKeys!1083 (ite c!54810 lt!187841 _keys!709) (ite c!54810 (array!24212 (store (arr!11555 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11908 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403404 () Bool)

(declare-fun res!232540 () Bool)

(declare-fun e!242805 () Bool)

(assert (=> b!403404 (=> (not res!232540) (not e!242805))))

(declare-datatypes ((List!6706 0))(
  ( (Nil!6703) (Cons!6702 (h!7558 (_ BitVec 64)) (t!11871 List!6706)) )
))
(declare-fun arrayNoDuplicates!0 (array!24213 (_ BitVec 32) List!6706) Bool)

(assert (=> b!403404 (= res!232540 (arrayNoDuplicates!0 lt!187841 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun bm!28486 () Bool)

(declare-fun call!28488 () ListLongMap!5705)

(assert (=> bm!28486 (= call!28488 (getCurrentListMapNoExtraKeys!1083 (ite c!54810 _keys!709 lt!187841) (ite c!54810 _values!549 (array!24212 (store (arr!11555 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11908 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403405 () Bool)

(declare-fun res!232544 () Bool)

(declare-fun e!242804 () Bool)

(assert (=> b!403405 (=> (not res!232544) (not e!242804))))

(assert (=> b!403405 (= res!232544 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun b!403406 () Bool)

(declare-fun res!232547 () Bool)

(assert (=> b!403406 (=> (not res!232547) (not e!242804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24213 (_ BitVec 32)) Bool)

(assert (=> b!403406 (= res!232547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16869 () Bool)

(declare-fun mapRes!16869 () Bool)

(assert (=> mapIsEmpty!16869 mapRes!16869))

(declare-fun res!232548 () Bool)

(assert (=> start!38732 (=> (not res!232548) (not e!242804))))

(assert (=> start!38732 (= res!232548 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11909 _keys!709))))))

(assert (=> start!38732 e!242804))

(declare-fun tp_is_empty!10165 () Bool)

(assert (=> start!38732 tp_is_empty!10165))

(assert (=> start!38732 tp!32972))

(assert (=> start!38732 true))

(declare-fun e!242803 () Bool)

(declare-fun array_inv!8476 (array!24211) Bool)

(assert (=> start!38732 (and (array_inv!8476 _values!549) e!242803)))

(declare-fun array_inv!8477 (array!24213) Bool)

(assert (=> start!38732 (array_inv!8477 _keys!709)))

(declare-fun b!403407 () Bool)

(declare-fun e!242799 () Bool)

(assert (=> b!403407 (= e!242799 tp_is_empty!10165)))

(declare-fun b!403408 () Bool)

(assert (=> b!403408 (= e!242803 (and e!242799 mapRes!16869))))

(declare-fun condMapEmpty!16869 () Bool)

(declare-fun mapDefault!16869 () ValueCell!4739)

(assert (=> b!403408 (= condMapEmpty!16869 (= (arr!11555 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4739)) mapDefault!16869)))))

(declare-fun b!403409 () Bool)

(assert (=> b!403409 (= e!242805 (not true))))

(declare-fun e!242802 () Bool)

(assert (=> b!403409 e!242802))

(assert (=> b!403409 (= c!54810 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12180 0))(
  ( (Unit!12181) )
))
(declare-fun lt!187840 () Unit!12180)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!353 (array!24213 array!24211 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) (_ BitVec 64) V!14659 (_ BitVec 32) Int) Unit!12180)

(assert (=> b!403409 (= lt!187840 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16869 () Bool)

(declare-fun tp!32973 () Bool)

(declare-fun e!242800 () Bool)

(assert (=> mapNonEmpty!16869 (= mapRes!16869 (and tp!32973 e!242800))))

(declare-fun mapRest!16869 () (Array (_ BitVec 32) ValueCell!4739))

(declare-fun mapValue!16869 () ValueCell!4739)

(declare-fun mapKey!16869 () (_ BitVec 32))

(assert (=> mapNonEmpty!16869 (= (arr!11555 _values!549) (store mapRest!16869 mapKey!16869 mapValue!16869))))

(declare-fun b!403410 () Bool)

(declare-fun res!232538 () Bool)

(assert (=> b!403410 (=> (not res!232538) (not e!242804))))

(assert (=> b!403410 (= res!232538 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11909 _keys!709))))))

(declare-fun b!403411 () Bool)

(declare-fun res!232537 () Bool)

(assert (=> b!403411 (=> (not res!232537) (not e!242804))))

(assert (=> b!403411 (= res!232537 (and (= (size!11908 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11909 _keys!709) (size!11908 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403412 () Bool)

(assert (=> b!403412 (= e!242804 e!242805)))

(declare-fun res!232539 () Bool)

(assert (=> b!403412 (=> (not res!232539) (not e!242805))))

(assert (=> b!403412 (= res!232539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187841 mask!1025))))

(assert (=> b!403412 (= lt!187841 (array!24214 (store (arr!11556 _keys!709) i!563 k0!794) (size!11909 _keys!709)))))

(declare-fun b!403413 () Bool)

(declare-fun res!232542 () Bool)

(assert (=> b!403413 (=> (not res!232542) (not e!242804))))

(assert (=> b!403413 (= res!232542 (or (= (select (arr!11556 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11556 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403414 () Bool)

(declare-fun res!232545 () Bool)

(assert (=> b!403414 (=> (not res!232545) (not e!242804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403414 (= res!232545 (validKeyInArray!0 k0!794))))

(declare-fun b!403415 () Bool)

(assert (=> b!403415 (= e!242800 tp_is_empty!10165)))

(declare-fun b!403416 () Bool)

(declare-fun res!232541 () Bool)

(assert (=> b!403416 (=> (not res!232541) (not e!242804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403416 (= res!232541 (validMask!0 mask!1025))))

(declare-fun b!403417 () Bool)

(declare-fun +!1170 (ListLongMap!5705 tuple2!6802) ListLongMap!5705)

(assert (=> b!403417 (= e!242802 (= call!28489 (+!1170 call!28488 (tuple2!6803 k0!794 v!412))))))

(declare-fun b!403418 () Bool)

(declare-fun res!232546 () Bool)

(assert (=> b!403418 (=> (not res!232546) (not e!242804))))

(declare-fun arrayContainsKey!0 (array!24213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403418 (= res!232546 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403419 () Bool)

(assert (=> b!403419 (= e!242802 (= call!28488 call!28489))))

(declare-fun b!403420 () Bool)

(declare-fun res!232543 () Bool)

(assert (=> b!403420 (=> (not res!232543) (not e!242805))))

(assert (=> b!403420 (= res!232543 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11909 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38732 res!232548) b!403416))

(assert (= (and b!403416 res!232541) b!403411))

(assert (= (and b!403411 res!232537) b!403406))

(assert (= (and b!403406 res!232547) b!403405))

(assert (= (and b!403405 res!232544) b!403410))

(assert (= (and b!403410 res!232538) b!403414))

(assert (= (and b!403414 res!232545) b!403413))

(assert (= (and b!403413 res!232542) b!403418))

(assert (= (and b!403418 res!232546) b!403412))

(assert (= (and b!403412 res!232539) b!403404))

(assert (= (and b!403404 res!232540) b!403420))

(assert (= (and b!403420 res!232543) b!403409))

(assert (= (and b!403409 c!54810) b!403417))

(assert (= (and b!403409 (not c!54810)) b!403419))

(assert (= (or b!403417 b!403419) bm!28485))

(assert (= (or b!403417 b!403419) bm!28486))

(assert (= (and b!403408 condMapEmpty!16869) mapIsEmpty!16869))

(assert (= (and b!403408 (not condMapEmpty!16869)) mapNonEmpty!16869))

(get-info :version)

(assert (= (and mapNonEmpty!16869 ((_ is ValueCellFull!4739) mapValue!16869)) b!403415))

(assert (= (and b!403408 ((_ is ValueCellFull!4739) mapDefault!16869)) b!403407))

(assert (= start!38732 b!403408))

(declare-fun m!396063 () Bool)

(assert (=> b!403404 m!396063))

(declare-fun m!396065 () Bool)

(assert (=> bm!28486 m!396065))

(declare-fun m!396067 () Bool)

(assert (=> bm!28486 m!396067))

(declare-fun m!396069 () Bool)

(assert (=> start!38732 m!396069))

(declare-fun m!396071 () Bool)

(assert (=> start!38732 m!396071))

(declare-fun m!396073 () Bool)

(assert (=> b!403418 m!396073))

(declare-fun m!396075 () Bool)

(assert (=> b!403405 m!396075))

(declare-fun m!396077 () Bool)

(assert (=> b!403413 m!396077))

(declare-fun m!396079 () Bool)

(assert (=> b!403406 m!396079))

(declare-fun m!396081 () Bool)

(assert (=> b!403416 m!396081))

(assert (=> bm!28485 m!396065))

(declare-fun m!396083 () Bool)

(assert (=> bm!28485 m!396083))

(declare-fun m!396085 () Bool)

(assert (=> b!403417 m!396085))

(declare-fun m!396087 () Bool)

(assert (=> b!403409 m!396087))

(declare-fun m!396089 () Bool)

(assert (=> b!403412 m!396089))

(declare-fun m!396091 () Bool)

(assert (=> b!403412 m!396091))

(declare-fun m!396093 () Bool)

(assert (=> mapNonEmpty!16869 m!396093))

(declare-fun m!396095 () Bool)

(assert (=> b!403414 m!396095))

(check-sat (not b!403418) b_and!16643 (not b!403414) (not b!403406) (not b!403417) (not b!403404) (not bm!28485) (not b!403405) (not b!403412) (not b!403416) (not b!403409) tp_is_empty!10165 (not b_next!9283) (not start!38732) (not mapNonEmpty!16869) (not bm!28486))
(check-sat b_and!16643 (not b_next!9283))
