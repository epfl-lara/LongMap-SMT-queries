; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38230 () Bool)

(assert start!38230)

(declare-fun b_free!9067 () Bool)

(declare-fun b_next!9067 () Bool)

(assert (=> start!38230 (= b_free!9067 (not b_next!9067))))

(declare-fun tp!31989 () Bool)

(declare-fun b_and!16453 () Bool)

(assert (=> start!38230 (= tp!31989 b_and!16453)))

(declare-fun b!394365 () Bool)

(declare-fun e!238726 () Bool)

(declare-fun e!238729 () Bool)

(assert (=> b!394365 (= e!238726 e!238729)))

(declare-fun res!226025 () Bool)

(assert (=> b!394365 (=> (not res!226025) (not e!238729))))

(declare-datatypes ((array!23387 0))(
  ( (array!23388 (arr!11150 (Array (_ BitVec 32) (_ BitVec 64))) (size!11502 (_ BitVec 32))) )
))
(declare-fun lt!186859 () array!23387)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23387 (_ BitVec 32)) Bool)

(assert (=> b!394365 (= res!226025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186859 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23387)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394365 (= lt!186859 (array!23388 (store (arr!11150 _keys!658) i!548 k!778) (size!11502 _keys!658)))))

(declare-fun b!394366 () Bool)

(declare-fun e!238728 () Bool)

(assert (=> b!394366 (= e!238729 (not e!238728))))

(declare-fun res!226027 () Bool)

(assert (=> b!394366 (=> res!226027 e!238728)))

(declare-fun lt!186861 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394366 (= res!226027 (or (and (not lt!186861) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186861) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186861)))))

(assert (=> b!394366 (= lt!186861 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!14091 0))(
  ( (V!14092 (val!4914 Int)) )
))
(declare-datatypes ((ValueCell!4526 0))(
  ( (ValueCellFull!4526 (v!7159 V!14091)) (EmptyCell!4526) )
))
(declare-datatypes ((array!23389 0))(
  ( (array!23390 (arr!11151 (Array (_ BitVec 32) ValueCell!4526)) (size!11503 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23389)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6634 0))(
  ( (tuple2!6635 (_1!3328 (_ BitVec 64)) (_2!3328 V!14091)) )
))
(declare-datatypes ((List!6487 0))(
  ( (Nil!6484) (Cons!6483 (h!7339 tuple2!6634) (t!11661 List!6487)) )
))
(declare-datatypes ((ListLongMap!5547 0))(
  ( (ListLongMap!5548 (toList!2789 List!6487)) )
))
(declare-fun lt!186866 () ListLongMap!5547)

(declare-fun zeroValue!472 () V!14091)

(declare-fun minValue!472 () V!14091)

(declare-fun getCurrentListMap!2128 (array!23387 array!23389 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5547)

(assert (=> b!394366 (= lt!186866 (getCurrentListMap!2128 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186865 () array!23389)

(declare-fun lt!186862 () ListLongMap!5547)

(assert (=> b!394366 (= lt!186862 (getCurrentListMap!2128 lt!186859 lt!186865 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186867 () ListLongMap!5547)

(declare-fun lt!186858 () ListLongMap!5547)

(assert (=> b!394366 (and (= lt!186867 lt!186858) (= lt!186858 lt!186867))))

(declare-fun lt!186864 () ListLongMap!5547)

(declare-fun lt!186860 () tuple2!6634)

(declare-fun +!1082 (ListLongMap!5547 tuple2!6634) ListLongMap!5547)

(assert (=> b!394366 (= lt!186858 (+!1082 lt!186864 lt!186860))))

(declare-fun v!373 () V!14091)

(assert (=> b!394366 (= lt!186860 (tuple2!6635 k!778 v!373))))

(declare-datatypes ((Unit!12054 0))(
  ( (Unit!12055) )
))
(declare-fun lt!186863 () Unit!12054)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!292 (array!23387 array!23389 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) (_ BitVec 64) V!14091 (_ BitVec 32) Int) Unit!12054)

(assert (=> b!394366 (= lt!186863 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!292 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1008 (array!23387 array!23389 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5547)

(assert (=> b!394366 (= lt!186867 (getCurrentListMapNoExtraKeys!1008 lt!186859 lt!186865 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394366 (= lt!186865 (array!23390 (store (arr!11151 _values!506) i!548 (ValueCellFull!4526 v!373)) (size!11503 _values!506)))))

(assert (=> b!394366 (= lt!186864 (getCurrentListMapNoExtraKeys!1008 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!16209 () Bool)

(declare-fun mapRes!16209 () Bool)

(assert (=> mapIsEmpty!16209 mapRes!16209))

(declare-fun b!394367 () Bool)

(declare-fun res!226024 () Bool)

(assert (=> b!394367 (=> (not res!226024) (not e!238726))))

(assert (=> b!394367 (= res!226024 (or (= (select (arr!11150 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11150 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394368 () Bool)

(declare-fun res!226020 () Bool)

(assert (=> b!394368 (=> (not res!226020) (not e!238726))))

(assert (=> b!394368 (= res!226020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394369 () Bool)

(declare-fun e!238727 () Bool)

(assert (=> b!394369 (= e!238727 (bvslt i!548 (size!11503 _values!506)))))

(declare-fun b!394371 () Bool)

(assert (=> b!394371 (= e!238728 e!238727)))

(declare-fun res!226017 () Bool)

(assert (=> b!394371 (=> res!226017 e!238727)))

(assert (=> b!394371 (= res!226017 (not (= (+!1082 lt!186866 lt!186860) lt!186862)))))

(assert (=> b!394371 (= lt!186862 lt!186867)))

(declare-fun b!394372 () Bool)

(declare-fun e!238725 () Bool)

(declare-fun tp_is_empty!9739 () Bool)

(assert (=> b!394372 (= e!238725 tp_is_empty!9739)))

(declare-fun b!394373 () Bool)

(declare-fun res!226023 () Bool)

(assert (=> b!394373 (=> (not res!226023) (not e!238726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394373 (= res!226023 (validKeyInArray!0 k!778))))

(declare-fun b!394374 () Bool)

(declare-fun res!226019 () Bool)

(assert (=> b!394374 (=> (not res!226019) (not e!238726))))

(declare-fun arrayContainsKey!0 (array!23387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394374 (= res!226019 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!394375 () Bool)

(declare-fun res!226021 () Bool)

(assert (=> b!394375 (=> (not res!226021) (not e!238729))))

(declare-datatypes ((List!6488 0))(
  ( (Nil!6485) (Cons!6484 (h!7340 (_ BitVec 64)) (t!11662 List!6488)) )
))
(declare-fun arrayNoDuplicates!0 (array!23387 (_ BitVec 32) List!6488) Bool)

(assert (=> b!394375 (= res!226021 (arrayNoDuplicates!0 lt!186859 #b00000000000000000000000000000000 Nil!6485))))

(declare-fun b!394376 () Bool)

(declare-fun e!238724 () Bool)

(assert (=> b!394376 (= e!238724 (and e!238725 mapRes!16209))))

(declare-fun condMapEmpty!16209 () Bool)

(declare-fun mapDefault!16209 () ValueCell!4526)

