; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38740 () Bool)

(assert start!38740)

(declare-fun b_free!9277 () Bool)

(declare-fun b_next!9277 () Bool)

(assert (=> start!38740 (= b_free!9277 (not b_next!9277))))

(declare-fun tp!32955 () Bool)

(declare-fun b_and!16663 () Bool)

(assert (=> start!38740 (= tp!32955 b_and!16663)))

(declare-fun b!403522 () Bool)

(declare-fun res!232564 () Bool)

(declare-fun e!242912 () Bool)

(assert (=> b!403522 (=> (not res!232564) (not e!242912))))

(declare-datatypes ((array!24217 0))(
  ( (array!24218 (arr!11558 (Array (_ BitVec 32) (_ BitVec 64))) (size!11910 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24217)

(declare-datatypes ((V!14651 0))(
  ( (V!14652 (val!5124 Int)) )
))
(declare-datatypes ((ValueCell!4736 0))(
  ( (ValueCellFull!4736 (v!7371 V!14651)) (EmptyCell!4736) )
))
(declare-datatypes ((array!24219 0))(
  ( (array!24220 (arr!11559 (Array (_ BitVec 32) ValueCell!4736)) (size!11911 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24219)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!403522 (= res!232564 (and (= (size!11911 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11910 _keys!709) (size!11911 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403523 () Bool)

(declare-fun res!232565 () Bool)

(declare-fun e!242910 () Bool)

(assert (=> b!403523 (=> (not res!232565) (not e!242910))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403523 (= res!232565 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11910 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403524 () Bool)

(assert (=> b!403524 (= e!242912 e!242910)))

(declare-fun res!232562 () Bool)

(assert (=> b!403524 (=> (not res!232562) (not e!242910))))

(declare-fun lt!188056 () array!24217)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24217 (_ BitVec 32)) Bool)

(assert (=> b!403524 (= res!232562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188056 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!403524 (= lt!188056 (array!24218 (store (arr!11558 _keys!709) i!563 k!794) (size!11910 _keys!709)))))

(declare-datatypes ((tuple2!6810 0))(
  ( (tuple2!6811 (_1!3416 (_ BitVec 64)) (_2!3416 V!14651)) )
))
(declare-datatypes ((List!6728 0))(
  ( (Nil!6725) (Cons!6724 (h!7580 tuple2!6810) (t!11902 List!6728)) )
))
(declare-datatypes ((ListLongMap!5723 0))(
  ( (ListLongMap!5724 (toList!2877 List!6728)) )
))
(declare-fun call!28496 () ListLongMap!5723)

(declare-fun call!28495 () ListLongMap!5723)

(declare-fun b!403525 () Bool)

(declare-fun e!242916 () Bool)

(declare-fun v!412 () V!14651)

(declare-fun +!1151 (ListLongMap!5723 tuple2!6810) ListLongMap!5723)

(assert (=> b!403525 (= e!242916 (= call!28495 (+!1151 call!28496 (tuple2!6811 k!794 v!412))))))

(declare-fun b!403526 () Bool)

(declare-fun e!242911 () Bool)

(declare-fun tp_is_empty!10159 () Bool)

(assert (=> b!403526 (= e!242911 tp_is_empty!10159)))

(declare-fun b!403527 () Bool)

(declare-fun res!232566 () Bool)

(assert (=> b!403527 (=> (not res!232566) (not e!242910))))

(declare-datatypes ((List!6729 0))(
  ( (Nil!6726) (Cons!6725 (h!7581 (_ BitVec 64)) (t!11903 List!6729)) )
))
(declare-fun arrayNoDuplicates!0 (array!24217 (_ BitVec 32) List!6729) Bool)

(assert (=> b!403527 (= res!232566 (arrayNoDuplicates!0 lt!188056 #b00000000000000000000000000000000 Nil!6726))))

(declare-fun minValue!515 () V!14651)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28492 () Bool)

(declare-fun zeroValue!515 () V!14651)

(declare-fun c!54872 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1086 (array!24217 array!24219 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) Int) ListLongMap!5723)

(assert (=> bm!28492 (= call!28496 (getCurrentListMapNoExtraKeys!1086 (ite c!54872 _keys!709 lt!188056) (ite c!54872 _values!549 (array!24220 (store (arr!11559 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11911 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16860 () Bool)

(declare-fun mapRes!16860 () Bool)

(declare-fun tp!32954 () Bool)

(declare-fun e!242914 () Bool)

(assert (=> mapNonEmpty!16860 (= mapRes!16860 (and tp!32954 e!242914))))

(declare-fun mapRest!16860 () (Array (_ BitVec 32) ValueCell!4736))

(declare-fun mapKey!16860 () (_ BitVec 32))

(declare-fun mapValue!16860 () ValueCell!4736)

(assert (=> mapNonEmpty!16860 (= (arr!11559 _values!549) (store mapRest!16860 mapKey!16860 mapValue!16860))))

(declare-fun bm!28493 () Bool)

(assert (=> bm!28493 (= call!28495 (getCurrentListMapNoExtraKeys!1086 (ite c!54872 lt!188056 _keys!709) (ite c!54872 (array!24220 (store (arr!11559 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11911 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403529 () Bool)

(assert (=> b!403529 (= e!242914 tp_is_empty!10159)))

(declare-fun b!403530 () Bool)

(assert (=> b!403530 (= e!242910 (not true))))

(assert (=> b!403530 e!242916))

(assert (=> b!403530 (= c!54872 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12206 0))(
  ( (Unit!12207) )
))
(declare-fun lt!188057 () Unit!12206)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!361 (array!24217 array!24219 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) (_ BitVec 64) V!14651 (_ BitVec 32) Int) Unit!12206)

(assert (=> b!403530 (= lt!188057 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!361 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403531 () Bool)

(declare-fun res!232561 () Bool)

(assert (=> b!403531 (=> (not res!232561) (not e!242912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403531 (= res!232561 (validMask!0 mask!1025))))

(declare-fun b!403532 () Bool)

(declare-fun res!232567 () Bool)

(assert (=> b!403532 (=> (not res!232567) (not e!242912))))

(assert (=> b!403532 (= res!232567 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11910 _keys!709))))))

(declare-fun b!403533 () Bool)

(declare-fun res!232568 () Bool)

(assert (=> b!403533 (=> (not res!232568) (not e!242912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403533 (= res!232568 (validKeyInArray!0 k!794))))

(declare-fun b!403534 () Bool)

(declare-fun res!232558 () Bool)

(assert (=> b!403534 (=> (not res!232558) (not e!242912))))

(assert (=> b!403534 (= res!232558 (or (= (select (arr!11558 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11558 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403535 () Bool)

(assert (=> b!403535 (= e!242916 (= call!28496 call!28495))))

(declare-fun mapIsEmpty!16860 () Bool)

(assert (=> mapIsEmpty!16860 mapRes!16860))

(declare-fun b!403536 () Bool)

(declare-fun res!232560 () Bool)

(assert (=> b!403536 (=> (not res!232560) (not e!242912))))

(declare-fun arrayContainsKey!0 (array!24217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403536 (= res!232560 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!232559 () Bool)

(assert (=> start!38740 (=> (not res!232559) (not e!242912))))

(assert (=> start!38740 (= res!232559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11910 _keys!709))))))

(assert (=> start!38740 e!242912))

(assert (=> start!38740 tp_is_empty!10159))

(assert (=> start!38740 tp!32955))

(assert (=> start!38740 true))

(declare-fun e!242913 () Bool)

(declare-fun array_inv!8454 (array!24219) Bool)

(assert (=> start!38740 (and (array_inv!8454 _values!549) e!242913)))

(declare-fun array_inv!8455 (array!24217) Bool)

(assert (=> start!38740 (array_inv!8455 _keys!709)))

(declare-fun b!403528 () Bool)

(declare-fun res!232563 () Bool)

(assert (=> b!403528 (=> (not res!232563) (not e!242912))))

(assert (=> b!403528 (= res!232563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403537 () Bool)

(declare-fun res!232569 () Bool)

(assert (=> b!403537 (=> (not res!232569) (not e!242912))))

(assert (=> b!403537 (= res!232569 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6726))))

(declare-fun b!403538 () Bool)

(assert (=> b!403538 (= e!242913 (and e!242911 mapRes!16860))))

(declare-fun condMapEmpty!16860 () Bool)

(declare-fun mapDefault!16860 () ValueCell!4736)

