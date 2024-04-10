; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38656 () Bool)

(assert start!38656)

(declare-fun b_free!9193 () Bool)

(declare-fun b_next!9193 () Bool)

(assert (=> start!38656 (= b_free!9193 (not b_next!9193))))

(declare-fun tp!32703 () Bool)

(declare-fun b_and!16579 () Bool)

(assert (=> start!38656 (= tp!32703 b_and!16579)))

(declare-fun b!401380 () Bool)

(declare-fun res!231051 () Bool)

(declare-fun e!242030 () Bool)

(assert (=> b!401380 (=> (not res!231051) (not e!242030))))

(declare-datatypes ((array!24057 0))(
  ( (array!24058 (arr!11478 (Array (_ BitVec 32) (_ BitVec 64))) (size!11830 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24057)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401380 (= res!231051 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16734 () Bool)

(declare-fun mapRes!16734 () Bool)

(assert (=> mapIsEmpty!16734 mapRes!16734))

(declare-fun b!401381 () Bool)

(declare-fun res!231057 () Bool)

(assert (=> b!401381 (=> (not res!231057) (not e!242030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401381 (= res!231057 (validKeyInArray!0 k!794))))

(declare-fun b!401382 () Bool)

(declare-fun res!231053 () Bool)

(declare-fun e!242034 () Bool)

(assert (=> b!401382 (=> (not res!231053) (not e!242034))))

(declare-fun lt!187804 () array!24057)

(declare-datatypes ((List!6666 0))(
  ( (Nil!6663) (Cons!6662 (h!7518 (_ BitVec 64)) (t!11840 List!6666)) )
))
(declare-fun arrayNoDuplicates!0 (array!24057 (_ BitVec 32) List!6666) Bool)

(assert (=> b!401382 (= res!231053 (arrayNoDuplicates!0 lt!187804 #b00000000000000000000000000000000 Nil!6663))))

(declare-fun b!401383 () Bool)

(declare-fun res!231054 () Bool)

(assert (=> b!401383 (=> (not res!231054) (not e!242030))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24057 (_ BitVec 32)) Bool)

(assert (=> b!401383 (= res!231054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401384 () Bool)

(declare-fun res!231047 () Bool)

(assert (=> b!401384 (=> (not res!231047) (not e!242030))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401384 (= res!231047 (or (= (select (arr!11478 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11478 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401385 () Bool)

(declare-fun res!231055 () Bool)

(assert (=> b!401385 (=> (not res!231055) (not e!242030))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14539 0))(
  ( (V!14540 (val!5082 Int)) )
))
(declare-datatypes ((ValueCell!4694 0))(
  ( (ValueCellFull!4694 (v!7329 V!14539)) (EmptyCell!4694) )
))
(declare-datatypes ((array!24059 0))(
  ( (array!24060 (arr!11479 (Array (_ BitVec 32) ValueCell!4694)) (size!11831 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24059)

(assert (=> b!401385 (= res!231055 (and (= (size!11831 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11830 _keys!709) (size!11831 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401386 () Bool)

(assert (=> b!401386 (= e!242034 (not true))))

(declare-fun e!242029 () Bool)

(assert (=> b!401386 e!242029))

(declare-fun c!54746 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401386 (= c!54746 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14539)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14539)

(declare-fun v!412 () V!14539)

(declare-datatypes ((Unit!12156 0))(
  ( (Unit!12157) )
))
(declare-fun lt!187805 () Unit!12156)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!336 (array!24057 array!24059 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) (_ BitVec 64) V!14539 (_ BitVec 32) Int) Unit!12156)

(assert (=> b!401386 (= lt!187805 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16734 () Bool)

(declare-fun tp!32702 () Bool)

(declare-fun e!242031 () Bool)

(assert (=> mapNonEmpty!16734 (= mapRes!16734 (and tp!32702 e!242031))))

(declare-fun mapKey!16734 () (_ BitVec 32))

(declare-fun mapRest!16734 () (Array (_ BitVec 32) ValueCell!4694))

(declare-fun mapValue!16734 () ValueCell!4694)

(assert (=> mapNonEmpty!16734 (= (arr!11479 _values!549) (store mapRest!16734 mapKey!16734 mapValue!16734))))

(declare-fun res!231046 () Bool)

(assert (=> start!38656 (=> (not res!231046) (not e!242030))))

(assert (=> start!38656 (= res!231046 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11830 _keys!709))))))

(assert (=> start!38656 e!242030))

(declare-fun tp_is_empty!10075 () Bool)

(assert (=> start!38656 tp_is_empty!10075))

(assert (=> start!38656 tp!32703))

(assert (=> start!38656 true))

(declare-fun e!242033 () Bool)

(declare-fun array_inv!8400 (array!24059) Bool)

(assert (=> start!38656 (and (array_inv!8400 _values!549) e!242033)))

(declare-fun array_inv!8401 (array!24057) Bool)

(assert (=> start!38656 (array_inv!8401 _keys!709)))

(declare-fun b!401387 () Bool)

(declare-fun res!231056 () Bool)

(assert (=> b!401387 (=> (not res!231056) (not e!242030))))

(assert (=> b!401387 (= res!231056 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11830 _keys!709))))))

(declare-fun b!401388 () Bool)

(declare-datatypes ((tuple2!6742 0))(
  ( (tuple2!6743 (_1!3382 (_ BitVec 64)) (_2!3382 V!14539)) )
))
(declare-datatypes ((List!6667 0))(
  ( (Nil!6664) (Cons!6663 (h!7519 tuple2!6742) (t!11841 List!6667)) )
))
(declare-datatypes ((ListLongMap!5655 0))(
  ( (ListLongMap!5656 (toList!2843 List!6667)) )
))
(declare-fun call!28244 () ListLongMap!5655)

(declare-fun call!28243 () ListLongMap!5655)

(assert (=> b!401388 (= e!242029 (= call!28244 call!28243))))

(declare-fun b!401389 () Bool)

(declare-fun res!231048 () Bool)

(assert (=> b!401389 (=> (not res!231048) (not e!242034))))

(assert (=> b!401389 (= res!231048 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11830 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401390 () Bool)

(declare-fun res!231049 () Bool)

(assert (=> b!401390 (=> (not res!231049) (not e!242030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401390 (= res!231049 (validMask!0 mask!1025))))

(declare-fun bm!28240 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1055 (array!24057 array!24059 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) Int) ListLongMap!5655)

(assert (=> bm!28240 (= call!28243 (getCurrentListMapNoExtraKeys!1055 (ite c!54746 lt!187804 _keys!709) (ite c!54746 (array!24060 (store (arr!11479 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11831 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401391 () Bool)

(declare-fun e!242028 () Bool)

(assert (=> b!401391 (= e!242028 tp_is_empty!10075)))

(declare-fun b!401392 () Bool)

(declare-fun +!1127 (ListLongMap!5655 tuple2!6742) ListLongMap!5655)

(assert (=> b!401392 (= e!242029 (= call!28243 (+!1127 call!28244 (tuple2!6743 k!794 v!412))))))

(declare-fun b!401393 () Bool)

(assert (=> b!401393 (= e!242030 e!242034)))

(declare-fun res!231052 () Bool)

(assert (=> b!401393 (=> (not res!231052) (not e!242034))))

(assert (=> b!401393 (= res!231052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187804 mask!1025))))

(assert (=> b!401393 (= lt!187804 (array!24058 (store (arr!11478 _keys!709) i!563 k!794) (size!11830 _keys!709)))))

(declare-fun b!401394 () Bool)

(declare-fun res!231050 () Bool)

(assert (=> b!401394 (=> (not res!231050) (not e!242030))))

(assert (=> b!401394 (= res!231050 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6663))))

(declare-fun bm!28241 () Bool)

(assert (=> bm!28241 (= call!28244 (getCurrentListMapNoExtraKeys!1055 (ite c!54746 _keys!709 lt!187804) (ite c!54746 _values!549 (array!24060 (store (arr!11479 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11831 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401395 () Bool)

(assert (=> b!401395 (= e!242031 tp_is_empty!10075)))

(declare-fun b!401396 () Bool)

(assert (=> b!401396 (= e!242033 (and e!242028 mapRes!16734))))

(declare-fun condMapEmpty!16734 () Bool)

(declare-fun mapDefault!16734 () ValueCell!4694)

