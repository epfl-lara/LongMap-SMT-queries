; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39166 () Bool)

(assert start!39166)

(declare-fun b_free!9433 () Bool)

(declare-fun b_next!9433 () Bool)

(assert (=> start!39166 (= b_free!9433 (not b_next!9433))))

(declare-fun tp!33828 () Bool)

(declare-fun b_and!16819 () Bool)

(assert (=> start!39166 (= tp!33828 b_and!16819)))

(declare-fun b!412347 () Bool)

(declare-fun res!239424 () Bool)

(declare-fun e!246772 () Bool)

(assert (=> b!412347 (=> (not res!239424) (not e!246772))))

(declare-datatypes ((array!25031 0))(
  ( (array!25032 (arr!11965 (Array (_ BitVec 32) (_ BitVec 64))) (size!12317 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25031)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412347 (= res!239424 (or (= (select (arr!11965 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11965 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412348 () Bool)

(declare-fun e!246770 () Bool)

(assert (=> b!412348 (= e!246772 e!246770)))

(declare-fun res!239420 () Bool)

(assert (=> b!412348 (=> (not res!239420) (not e!246770))))

(declare-fun lt!189463 () array!25031)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25031 (_ BitVec 32)) Bool)

(assert (=> b!412348 (= res!239420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189463 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!412348 (= lt!189463 (array!25032 (store (arr!11965 _keys!709) i!563 k!794) (size!12317 _keys!709)))))

(declare-fun mapIsEmpty!17499 () Bool)

(declare-fun mapRes!17499 () Bool)

(assert (=> mapIsEmpty!17499 mapRes!17499))

(declare-fun b!412349 () Bool)

(declare-fun e!246773 () Bool)

(declare-fun tp_is_empty!10585 () Bool)

(assert (=> b!412349 (= e!246773 tp_is_empty!10585)))

(declare-fun b!412350 () Bool)

(declare-fun res!239418 () Bool)

(assert (=> b!412350 (=> (not res!239418) (not e!246772))))

(declare-datatypes ((List!6950 0))(
  ( (Nil!6947) (Cons!6946 (h!7802 (_ BitVec 64)) (t!12124 List!6950)) )
))
(declare-fun arrayNoDuplicates!0 (array!25031 (_ BitVec 32) List!6950) Bool)

(assert (=> b!412350 (= res!239418 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6947))))

(declare-fun b!412351 () Bool)

(declare-fun res!239421 () Bool)

(assert (=> b!412351 (=> (not res!239421) (not e!246772))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15219 0))(
  ( (V!15220 (val!5337 Int)) )
))
(declare-datatypes ((ValueCell!4949 0))(
  ( (ValueCellFull!4949 (v!7584 V!15219)) (EmptyCell!4949) )
))
(declare-datatypes ((array!25033 0))(
  ( (array!25034 (arr!11966 (Array (_ BitVec 32) ValueCell!4949)) (size!12318 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25033)

(assert (=> b!412351 (= res!239421 (and (= (size!12318 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12317 _keys!709) (size!12318 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17499 () Bool)

(declare-fun tp!33827 () Bool)

(declare-fun e!246769 () Bool)

(assert (=> mapNonEmpty!17499 (= mapRes!17499 (and tp!33827 e!246769))))

(declare-fun mapValue!17499 () ValueCell!4949)

(declare-fun mapKey!17499 () (_ BitVec 32))

(declare-fun mapRest!17499 () (Array (_ BitVec 32) ValueCell!4949))

(assert (=> mapNonEmpty!17499 (= (arr!11966 _values!549) (store mapRest!17499 mapKey!17499 mapValue!17499))))

(declare-fun b!412352 () Bool)

(declare-fun res!239425 () Bool)

(assert (=> b!412352 (=> (not res!239425) (not e!246772))))

(declare-fun arrayContainsKey!0 (array!25031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412352 (= res!239425 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412353 () Bool)

(declare-fun res!239426 () Bool)

(assert (=> b!412353 (=> (not res!239426) (not e!246772))))

(assert (=> b!412353 (= res!239426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412354 () Bool)

(declare-fun res!239416 () Bool)

(assert (=> b!412354 (=> (not res!239416) (not e!246772))))

(assert (=> b!412354 (= res!239416 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12317 _keys!709))))))

(declare-fun b!412355 () Bool)

(declare-fun res!239423 () Bool)

(assert (=> b!412355 (=> (not res!239423) (not e!246772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412355 (= res!239423 (validKeyInArray!0 k!794))))

(declare-fun b!412356 () Bool)

(declare-fun res!239417 () Bool)

(assert (=> b!412356 (=> (not res!239417) (not e!246772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412356 (= res!239417 (validMask!0 mask!1025))))

(declare-fun b!412357 () Bool)

(assert (=> b!412357 (= e!246770 false)))

(declare-fun minValue!515 () V!15219)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15219)

(declare-fun v!412 () V!15219)

(declare-datatypes ((tuple2!6924 0))(
  ( (tuple2!6925 (_1!3473 (_ BitVec 64)) (_2!3473 V!15219)) )
))
(declare-datatypes ((List!6951 0))(
  ( (Nil!6948) (Cons!6947 (h!7803 tuple2!6924) (t!12125 List!6951)) )
))
(declare-datatypes ((ListLongMap!5837 0))(
  ( (ListLongMap!5838 (toList!2934 List!6951)) )
))
(declare-fun lt!189462 () ListLongMap!5837)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1142 (array!25031 array!25033 (_ BitVec 32) (_ BitVec 32) V!15219 V!15219 (_ BitVec 32) Int) ListLongMap!5837)

(assert (=> b!412357 (= lt!189462 (getCurrentListMapNoExtraKeys!1142 lt!189463 (array!25034 (store (arr!11966 _values!549) i!563 (ValueCellFull!4949 v!412)) (size!12318 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189464 () ListLongMap!5837)

(assert (=> b!412357 (= lt!189464 (getCurrentListMapNoExtraKeys!1142 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412358 () Bool)

(assert (=> b!412358 (= e!246769 tp_is_empty!10585)))

(declare-fun b!412359 () Bool)

(declare-fun res!239422 () Bool)

(assert (=> b!412359 (=> (not res!239422) (not e!246770))))

(assert (=> b!412359 (= res!239422 (arrayNoDuplicates!0 lt!189463 #b00000000000000000000000000000000 Nil!6947))))

(declare-fun b!412360 () Bool)

(declare-fun e!246774 () Bool)

(assert (=> b!412360 (= e!246774 (and e!246773 mapRes!17499))))

(declare-fun condMapEmpty!17499 () Bool)

(declare-fun mapDefault!17499 () ValueCell!4949)

