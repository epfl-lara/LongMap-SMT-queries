; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37272 () Bool)

(assert start!37272)

(declare-fun b_free!8399 () Bool)

(declare-fun b_next!8399 () Bool)

(assert (=> start!37272 (= b_free!8399 (not b_next!8399))))

(declare-fun tp!29913 () Bool)

(declare-fun b_and!15641 () Bool)

(assert (=> start!37272 (= tp!29913 b_and!15641)))

(declare-fun b!377421 () Bool)

(declare-fun res!213541 () Bool)

(declare-fun e!229785 () Bool)

(assert (=> b!377421 (=> (not res!213541) (not e!229785))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377421 (= res!213541 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!15135 () Bool)

(declare-fun mapRes!15135 () Bool)

(assert (=> mapIsEmpty!15135 mapRes!15135))

(declare-fun b!377423 () Bool)

(declare-fun e!229784 () Bool)

(declare-fun e!229786 () Bool)

(assert (=> b!377423 (= e!229784 e!229786)))

(declare-fun res!213531 () Bool)

(assert (=> b!377423 (=> res!213531 e!229786)))

(assert (=> b!377423 (= res!213531 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13167 0))(
  ( (V!13168 (val!4568 Int)) )
))
(declare-datatypes ((tuple2!6090 0))(
  ( (tuple2!6091 (_1!3056 (_ BitVec 64)) (_2!3056 V!13167)) )
))
(declare-datatypes ((List!5931 0))(
  ( (Nil!5928) (Cons!5927 (h!6783 tuple2!6090) (t!11081 List!5931)) )
))
(declare-datatypes ((ListLongMap!5003 0))(
  ( (ListLongMap!5004 (toList!2517 List!5931)) )
))
(declare-fun lt!175479 () ListLongMap!5003)

(declare-fun lt!175486 () ListLongMap!5003)

(assert (=> b!377423 (= lt!175479 lt!175486)))

(declare-fun lt!175482 () ListLongMap!5003)

(declare-fun lt!175481 () tuple2!6090)

(declare-fun +!863 (ListLongMap!5003 tuple2!6090) ListLongMap!5003)

(assert (=> b!377423 (= lt!175486 (+!863 lt!175482 lt!175481))))

(declare-fun lt!175490 () ListLongMap!5003)

(declare-fun lt!175488 () ListLongMap!5003)

(assert (=> b!377423 (= lt!175490 lt!175488)))

(declare-fun lt!175487 () ListLongMap!5003)

(assert (=> b!377423 (= lt!175488 (+!863 lt!175487 lt!175481))))

(declare-fun lt!175480 () ListLongMap!5003)

(assert (=> b!377423 (= lt!175479 (+!863 lt!175480 lt!175481))))

(declare-fun zeroValue!472 () V!13167)

(assert (=> b!377423 (= lt!175481 (tuple2!6091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377424 () Bool)

(declare-fun res!213535 () Bool)

(assert (=> b!377424 (=> (not res!213535) (not e!229785))))

(declare-datatypes ((array!22023 0))(
  ( (array!22024 (arr!10480 (Array (_ BitVec 32) (_ BitVec 64))) (size!10832 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22023)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377424 (= res!213535 (or (= (select (arr!10480 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10480 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377425 () Bool)

(declare-fun e!229790 () Bool)

(assert (=> b!377425 (= e!229790 (not e!229784))))

(declare-fun res!213538 () Bool)

(assert (=> b!377425 (=> res!213538 e!229784)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377425 (= res!213538 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4180 0))(
  ( (ValueCellFull!4180 (v!6765 V!13167)) (EmptyCell!4180) )
))
(declare-datatypes ((array!22025 0))(
  ( (array!22026 (arr!10481 (Array (_ BitVec 32) ValueCell!4180)) (size!10833 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22025)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13167)

(declare-fun getCurrentListMap!1948 (array!22023 array!22025 (_ BitVec 32) (_ BitVec 32) V!13167 V!13167 (_ BitVec 32) Int) ListLongMap!5003)

(assert (=> b!377425 (= lt!175490 (getCurrentListMap!1948 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175483 () array!22023)

(declare-fun lt!175489 () array!22025)

(assert (=> b!377425 (= lt!175479 (getCurrentListMap!1948 lt!175483 lt!175489 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377425 (and (= lt!175480 lt!175482) (= lt!175482 lt!175480))))

(declare-fun lt!175484 () tuple2!6090)

(assert (=> b!377425 (= lt!175482 (+!863 lt!175487 lt!175484))))

(declare-fun v!373 () V!13167)

(assert (=> b!377425 (= lt!175484 (tuple2!6091 k!778 v!373))))

(declare-datatypes ((Unit!11630 0))(
  ( (Unit!11631) )
))
(declare-fun lt!175485 () Unit!11630)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!106 (array!22023 array!22025 (_ BitVec 32) (_ BitVec 32) V!13167 V!13167 (_ BitVec 32) (_ BitVec 64) V!13167 (_ BitVec 32) Int) Unit!11630)

(assert (=> b!377425 (= lt!175485 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!106 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!782 (array!22023 array!22025 (_ BitVec 32) (_ BitVec 32) V!13167 V!13167 (_ BitVec 32) Int) ListLongMap!5003)

(assert (=> b!377425 (= lt!175480 (getCurrentListMapNoExtraKeys!782 lt!175483 lt!175489 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377425 (= lt!175489 (array!22026 (store (arr!10481 _values!506) i!548 (ValueCellFull!4180 v!373)) (size!10833 _values!506)))))

(assert (=> b!377425 (= lt!175487 (getCurrentListMapNoExtraKeys!782 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377426 () Bool)

(declare-fun e!229788 () Bool)

(declare-fun e!229789 () Bool)

(assert (=> b!377426 (= e!229788 (and e!229789 mapRes!15135))))

(declare-fun condMapEmpty!15135 () Bool)

(declare-fun mapDefault!15135 () ValueCell!4180)

