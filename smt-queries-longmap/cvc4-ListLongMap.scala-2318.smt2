; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37374 () Bool)

(assert start!37374)

(declare-fun b_free!8501 () Bool)

(declare-fun b_next!8501 () Bool)

(assert (=> start!37374 (= b_free!8501 (not b_next!8501))))

(declare-fun tp!30218 () Bool)

(declare-fun b_and!15743 () Bool)

(assert (=> start!37374 (= tp!30218 b_and!15743)))

(declare-fun b!379725 () Bool)

(declare-fun res!215386 () Bool)

(declare-fun e!231014 () Bool)

(assert (=> b!379725 (=> (not res!215386) (not e!231014))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379725 (= res!215386 (validKeyInArray!0 k!778))))

(declare-fun b!379726 () Bool)

(declare-fun res!215376 () Bool)

(assert (=> b!379726 (=> (not res!215376) (not e!231014))))

(declare-datatypes ((array!22219 0))(
  ( (array!22220 (arr!10578 (Array (_ BitVec 32) (_ BitVec 64))) (size!10930 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22219)

(declare-datatypes ((List!6019 0))(
  ( (Nil!6016) (Cons!6015 (h!6871 (_ BitVec 64)) (t!11169 List!6019)) )
))
(declare-fun arrayNoDuplicates!0 (array!22219 (_ BitVec 32) List!6019) Bool)

(assert (=> b!379726 (= res!215376 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6016))))

(declare-fun b!379727 () Bool)

(declare-fun res!215378 () Bool)

(declare-fun e!231011 () Bool)

(assert (=> b!379727 (=> (not res!215378) (not e!231011))))

(declare-fun lt!177433 () array!22219)

(assert (=> b!379727 (= res!215378 (arrayNoDuplicates!0 lt!177433 #b00000000000000000000000000000000 Nil!6016))))

(declare-fun b!379728 () Bool)

(declare-fun e!231009 () Bool)

(declare-fun e!231012 () Bool)

(assert (=> b!379728 (= e!231009 e!231012)))

(declare-fun res!215379 () Bool)

(assert (=> b!379728 (=> res!215379 e!231012)))

(assert (=> b!379728 (= res!215379 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13303 0))(
  ( (V!13304 (val!4619 Int)) )
))
(declare-datatypes ((tuple2!6184 0))(
  ( (tuple2!6185 (_1!3103 (_ BitVec 64)) (_2!3103 V!13303)) )
))
(declare-datatypes ((List!6020 0))(
  ( (Nil!6017) (Cons!6016 (h!6872 tuple2!6184) (t!11170 List!6020)) )
))
(declare-datatypes ((ListLongMap!5097 0))(
  ( (ListLongMap!5098 (toList!2564 List!6020)) )
))
(declare-fun lt!177435 () ListLongMap!5097)

(declare-fun lt!177441 () ListLongMap!5097)

(assert (=> b!379728 (= lt!177435 lt!177441)))

(declare-fun lt!177438 () ListLongMap!5097)

(declare-fun lt!177434 () tuple2!6184)

(declare-fun +!910 (ListLongMap!5097 tuple2!6184) ListLongMap!5097)

(assert (=> b!379728 (= lt!177441 (+!910 lt!177438 lt!177434))))

(declare-fun lt!177436 () ListLongMap!5097)

(declare-fun lt!177444 () ListLongMap!5097)

(assert (=> b!379728 (= lt!177436 lt!177444)))

(declare-fun lt!177442 () ListLongMap!5097)

(assert (=> b!379728 (= lt!177444 (+!910 lt!177442 lt!177434))))

(declare-fun lt!177432 () ListLongMap!5097)

(assert (=> b!379728 (= lt!177436 (+!910 lt!177432 lt!177434))))

(declare-fun minValue!472 () V!13303)

(assert (=> b!379728 (= lt!177434 (tuple2!6185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379729 () Bool)

(declare-fun res!215387 () Bool)

(assert (=> b!379729 (=> (not res!215387) (not e!231014))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22219 (_ BitVec 32)) Bool)

(assert (=> b!379729 (= res!215387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379730 () Bool)

(assert (=> b!379730 (= e!231012 true)))

(declare-fun lt!177443 () tuple2!6184)

(assert (=> b!379730 (= lt!177444 (+!910 lt!177441 lt!177443))))

(declare-fun v!373 () V!13303)

(declare-datatypes ((Unit!11714 0))(
  ( (Unit!11715) )
))
(declare-fun lt!177440 () Unit!11714)

(declare-fun addCommutativeForDiffKeys!307 (ListLongMap!5097 (_ BitVec 64) V!13303 (_ BitVec 64) V!13303) Unit!11714)

(assert (=> b!379730 (= lt!177440 (addCommutativeForDiffKeys!307 lt!177438 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15288 () Bool)

(declare-fun mapRes!15288 () Bool)

(assert (=> mapIsEmpty!15288 mapRes!15288))

(declare-fun b!379731 () Bool)

(declare-fun res!215380 () Bool)

(assert (=> b!379731 (=> (not res!215380) (not e!231014))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4231 0))(
  ( (ValueCellFull!4231 (v!6816 V!13303)) (EmptyCell!4231) )
))
(declare-datatypes ((array!22221 0))(
  ( (array!22222 (arr!10579 (Array (_ BitVec 32) ValueCell!4231)) (size!10931 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22221)

(assert (=> b!379731 (= res!215380 (and (= (size!10931 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10930 _keys!658) (size!10931 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379732 () Bool)

(declare-fun res!215385 () Bool)

(assert (=> b!379732 (=> (not res!215385) (not e!231014))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379732 (= res!215385 (or (= (select (arr!10578 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10578 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379733 () Bool)

(declare-fun e!231007 () Bool)

(declare-fun tp_is_empty!9149 () Bool)

(assert (=> b!379733 (= e!231007 tp_is_empty!9149)))

(declare-fun b!379734 () Bool)

(declare-fun res!215384 () Bool)

(assert (=> b!379734 (=> (not res!215384) (not e!231014))))

(declare-fun arrayContainsKey!0 (array!22219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379734 (= res!215384 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379735 () Bool)

(declare-fun e!231013 () Bool)

(assert (=> b!379735 (= e!231013 (and e!231007 mapRes!15288))))

(declare-fun condMapEmpty!15288 () Bool)

(declare-fun mapDefault!15288 () ValueCell!4231)

