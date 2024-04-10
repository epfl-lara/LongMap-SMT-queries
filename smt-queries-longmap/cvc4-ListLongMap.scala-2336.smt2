; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37482 () Bool)

(assert start!37482)

(declare-fun b_free!8609 () Bool)

(declare-fun b_next!8609 () Bool)

(assert (=> start!37482 (= b_free!8609 (not b_next!8609))))

(declare-fun tp!30542 () Bool)

(declare-fun b_and!15851 () Bool)

(assert (=> start!37482 (= tp!30542 b_and!15851)))

(declare-fun b!382066 () Bool)

(declare-fun e!232219 () Bool)

(assert (=> b!382066 (= e!232219 true)))

(declare-datatypes ((V!13447 0))(
  ( (V!13448 (val!4673 Int)) )
))
(declare-datatypes ((tuple2!6280 0))(
  ( (tuple2!6281 (_1!3151 (_ BitVec 64)) (_2!3151 V!13447)) )
))
(declare-datatypes ((List!6110 0))(
  ( (Nil!6107) (Cons!6106 (h!6962 tuple2!6280) (t!11260 List!6110)) )
))
(declare-datatypes ((ListLongMap!5193 0))(
  ( (ListLongMap!5194 (toList!2612 List!6110)) )
))
(declare-fun lt!179184 () ListLongMap!5193)

(declare-fun lt!179187 () ListLongMap!5193)

(assert (=> b!382066 (= lt!179184 lt!179187)))

(declare-fun mapIsEmpty!15450 () Bool)

(declare-fun mapRes!15450 () Bool)

(assert (=> mapIsEmpty!15450 mapRes!15450))

(declare-fun b!382067 () Bool)

(declare-fun e!232217 () Bool)

(assert (=> b!382067 (= e!232217 (not e!232219))))

(declare-fun res!217238 () Bool)

(assert (=> b!382067 (=> res!217238 e!232219)))

(declare-fun lt!179189 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382067 (= res!217238 (or (and (not lt!179189) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179189) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179189)))))

(assert (=> b!382067 (= lt!179189 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179183 () ListLongMap!5193)

(declare-datatypes ((ValueCell!4285 0))(
  ( (ValueCellFull!4285 (v!6870 V!13447)) (EmptyCell!4285) )
))
(declare-datatypes ((array!22423 0))(
  ( (array!22424 (arr!10680 (Array (_ BitVec 32) ValueCell!4285)) (size!11032 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22423)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13447)

(declare-datatypes ((array!22425 0))(
  ( (array!22426 (arr!10681 (Array (_ BitVec 32) (_ BitVec 64))) (size!11033 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22425)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13447)

(declare-fun getCurrentListMap!2019 (array!22425 array!22423 (_ BitVec 32) (_ BitVec 32) V!13447 V!13447 (_ BitVec 32) Int) ListLongMap!5193)

(assert (=> b!382067 (= lt!179183 (getCurrentListMap!2019 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179188 () array!22425)

(declare-fun lt!179190 () array!22423)

(assert (=> b!382067 (= lt!179184 (getCurrentListMap!2019 lt!179188 lt!179190 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179186 () ListLongMap!5193)

(assert (=> b!382067 (and (= lt!179187 lt!179186) (= lt!179186 lt!179187))))

(declare-fun v!373 () V!13447)

(declare-fun lt!179182 () ListLongMap!5193)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!949 (ListLongMap!5193 tuple2!6280) ListLongMap!5193)

(assert (=> b!382067 (= lt!179186 (+!949 lt!179182 (tuple2!6281 k!778 v!373)))))

(declare-datatypes ((Unit!11792 0))(
  ( (Unit!11793) )
))
(declare-fun lt!179185 () Unit!11792)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!177 (array!22425 array!22423 (_ BitVec 32) (_ BitVec 32) V!13447 V!13447 (_ BitVec 32) (_ BitVec 64) V!13447 (_ BitVec 32) Int) Unit!11792)

(assert (=> b!382067 (= lt!179185 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!177 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!853 (array!22425 array!22423 (_ BitVec 32) (_ BitVec 32) V!13447 V!13447 (_ BitVec 32) Int) ListLongMap!5193)

(assert (=> b!382067 (= lt!179187 (getCurrentListMapNoExtraKeys!853 lt!179188 lt!179190 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382067 (= lt!179190 (array!22424 (store (arr!10680 _values!506) i!548 (ValueCellFull!4285 v!373)) (size!11032 _values!506)))))

(assert (=> b!382067 (= lt!179182 (getCurrentListMapNoExtraKeys!853 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382068 () Bool)

(declare-fun res!217240 () Bool)

(declare-fun e!232218 () Bool)

(assert (=> b!382068 (=> (not res!217240) (not e!232218))))

(declare-datatypes ((List!6111 0))(
  ( (Nil!6108) (Cons!6107 (h!6963 (_ BitVec 64)) (t!11261 List!6111)) )
))
(declare-fun arrayNoDuplicates!0 (array!22425 (_ BitVec 32) List!6111) Bool)

(assert (=> b!382068 (= res!217240 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6108))))

(declare-fun b!382069 () Bool)

(declare-fun res!217241 () Bool)

(assert (=> b!382069 (=> (not res!217241) (not e!232218))))

(assert (=> b!382069 (= res!217241 (or (= (select (arr!10681 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10681 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382070 () Bool)

(declare-fun res!217231 () Bool)

(assert (=> b!382070 (=> (not res!217231) (not e!232218))))

(assert (=> b!382070 (= res!217231 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11033 _keys!658))))))

(declare-fun res!217234 () Bool)

(assert (=> start!37482 (=> (not res!217234) (not e!232218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37482 (= res!217234 (validMask!0 mask!970))))

(assert (=> start!37482 e!232218))

(declare-fun e!232216 () Bool)

(declare-fun array_inv!7864 (array!22423) Bool)

(assert (=> start!37482 (and (array_inv!7864 _values!506) e!232216)))

(assert (=> start!37482 tp!30542))

(assert (=> start!37482 true))

(declare-fun tp_is_empty!9257 () Bool)

(assert (=> start!37482 tp_is_empty!9257))

(declare-fun array_inv!7865 (array!22425) Bool)

(assert (=> start!37482 (array_inv!7865 _keys!658)))

(declare-fun b!382071 () Bool)

(declare-fun res!217237 () Bool)

(assert (=> b!382071 (=> (not res!217237) (not e!232218))))

(assert (=> b!382071 (= res!217237 (and (= (size!11032 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11033 _keys!658) (size!11032 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382072 () Bool)

(declare-fun e!232214 () Bool)

(assert (=> b!382072 (= e!232216 (and e!232214 mapRes!15450))))

(declare-fun condMapEmpty!15450 () Bool)

(declare-fun mapDefault!15450 () ValueCell!4285)

