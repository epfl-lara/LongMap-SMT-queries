; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37806 () Bool)

(assert start!37806)

(declare-fun b_free!8909 () Bool)

(declare-fun b_next!8909 () Bool)

(assert (=> start!37806 (= b_free!8909 (not b_next!8909))))

(declare-fun tp!31479 () Bool)

(declare-fun b_and!16151 () Bool)

(assert (=> start!37806 (= tp!31479 b_and!16151)))

(declare-fun b!388438 () Bool)

(declare-fun e!235356 () Bool)

(declare-fun e!235358 () Bool)

(assert (=> b!388438 (= e!235356 (not e!235358))))

(declare-fun res!222153 () Bool)

(assert (=> b!388438 (=> res!222153 e!235358)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388438 (= res!222153 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13879 0))(
  ( (V!13880 (val!4835 Int)) )
))
(declare-datatypes ((ValueCell!4447 0))(
  ( (ValueCellFull!4447 (v!7032 V!13879)) (EmptyCell!4447) )
))
(declare-datatypes ((array!23053 0))(
  ( (array!23054 (arr!10995 (Array (_ BitVec 32) ValueCell!4447)) (size!11347 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23053)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6500 0))(
  ( (tuple2!6501 (_1!3261 (_ BitVec 64)) (_2!3261 V!13879)) )
))
(declare-datatypes ((List!6354 0))(
  ( (Nil!6351) (Cons!6350 (h!7206 tuple2!6500) (t!11504 List!6354)) )
))
(declare-datatypes ((ListLongMap!5413 0))(
  ( (ListLongMap!5414 (toList!2722 List!6354)) )
))
(declare-fun lt!182366 () ListLongMap!5413)

(declare-fun zeroValue!472 () V!13879)

(declare-datatypes ((array!23055 0))(
  ( (array!23056 (arr!10996 (Array (_ BitVec 32) (_ BitVec 64))) (size!11348 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23055)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13879)

(declare-fun getCurrentListMap!2071 (array!23055 array!23053 (_ BitVec 32) (_ BitVec 32) V!13879 V!13879 (_ BitVec 32) Int) ListLongMap!5413)

(assert (=> b!388438 (= lt!182366 (getCurrentListMap!2071 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182364 () ListLongMap!5413)

(declare-fun lt!182365 () array!23055)

(declare-fun lt!182367 () array!23053)

(assert (=> b!388438 (= lt!182364 (getCurrentListMap!2071 lt!182365 lt!182367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182361 () ListLongMap!5413)

(declare-fun lt!182360 () ListLongMap!5413)

(assert (=> b!388438 (and (= lt!182361 lt!182360) (= lt!182360 lt!182361))))

(declare-fun v!373 () V!13879)

(declare-fun lt!182363 () ListLongMap!5413)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!1017 (ListLongMap!5413 tuple2!6500) ListLongMap!5413)

(assert (=> b!388438 (= lt!182360 (+!1017 lt!182363 (tuple2!6501 k!778 v!373)))))

(declare-datatypes ((Unit!11908 0))(
  ( (Unit!11909) )
))
(declare-fun lt!182362 () Unit!11908)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!235 (array!23055 array!23053 (_ BitVec 32) (_ BitVec 32) V!13879 V!13879 (_ BitVec 32) (_ BitVec 64) V!13879 (_ BitVec 32) Int) Unit!11908)

(assert (=> b!388438 (= lt!182362 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!235 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!951 (array!23055 array!23053 (_ BitVec 32) (_ BitVec 32) V!13879 V!13879 (_ BitVec 32) Int) ListLongMap!5413)

(assert (=> b!388438 (= lt!182361 (getCurrentListMapNoExtraKeys!951 lt!182365 lt!182367 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388438 (= lt!182367 (array!23054 (store (arr!10995 _values!506) i!548 (ValueCellFull!4447 v!373)) (size!11347 _values!506)))))

(assert (=> b!388438 (= lt!182363 (getCurrentListMapNoExtraKeys!951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!222149 () Bool)

(declare-fun e!235359 () Bool)

(assert (=> start!37806 (=> (not res!222149) (not e!235359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37806 (= res!222149 (validMask!0 mask!970))))

(assert (=> start!37806 e!235359))

(declare-fun e!235360 () Bool)

(declare-fun array_inv!8082 (array!23053) Bool)

(assert (=> start!37806 (and (array_inv!8082 _values!506) e!235360)))

(assert (=> start!37806 tp!31479))

(assert (=> start!37806 true))

(declare-fun tp_is_empty!9581 () Bool)

(assert (=> start!37806 tp_is_empty!9581))

(declare-fun array_inv!8083 (array!23055) Bool)

(assert (=> start!37806 (array_inv!8083 _keys!658)))

(declare-fun b!388439 () Bool)

(declare-fun e!235361 () Bool)

(declare-fun mapRes!15936 () Bool)

(assert (=> b!388439 (= e!235360 (and e!235361 mapRes!15936))))

(declare-fun condMapEmpty!15936 () Bool)

(declare-fun mapDefault!15936 () ValueCell!4447)

