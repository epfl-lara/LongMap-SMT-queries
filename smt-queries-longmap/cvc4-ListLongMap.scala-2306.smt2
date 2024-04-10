; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37302 () Bool)

(assert start!37302)

(declare-fun b_free!8429 () Bool)

(declare-fun b_next!8429 () Bool)

(assert (=> start!37302 (= b_free!8429 (not b_next!8429))))

(declare-fun tp!30003 () Bool)

(declare-fun b_and!15671 () Bool)

(assert (=> start!37302 (= tp!30003 b_and!15671)))

(declare-fun b!378096 () Bool)

(declare-fun res!214080 () Bool)

(declare-fun e!230149 () Bool)

(assert (=> b!378096 (=> (not res!214080) (not e!230149))))

(declare-datatypes ((array!22081 0))(
  ( (array!22082 (arr!10509 (Array (_ BitVec 32) (_ BitVec 64))) (size!10861 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22081)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378096 (= res!214080 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378097 () Bool)

(declare-fun res!214076 () Bool)

(assert (=> b!378097 (=> (not res!214076) (not e!230149))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378097 (= res!214076 (or (= (select (arr!10509 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10509 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378098 () Bool)

(declare-fun e!230150 () Bool)

(declare-fun e!230144 () Bool)

(assert (=> b!378098 (= e!230150 e!230144)))

(declare-fun res!214079 () Bool)

(assert (=> b!378098 (=> res!214079 e!230144)))

(assert (=> b!378098 (= res!214079 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13207 0))(
  ( (V!13208 (val!4583 Int)) )
))
(declare-datatypes ((tuple2!6118 0))(
  ( (tuple2!6119 (_1!3070 (_ BitVec 64)) (_2!3070 V!13207)) )
))
(declare-datatypes ((List!5956 0))(
  ( (Nil!5953) (Cons!5952 (h!6808 tuple2!6118) (t!11106 List!5956)) )
))
(declare-datatypes ((ListLongMap!5031 0))(
  ( (ListLongMap!5032 (toList!2531 List!5956)) )
))
(declare-fun lt!176065 () ListLongMap!5031)

(declare-fun lt!176066 () ListLongMap!5031)

(assert (=> b!378098 (= lt!176065 lt!176066)))

(declare-fun lt!176076 () ListLongMap!5031)

(declare-fun lt!176068 () tuple2!6118)

(declare-fun +!877 (ListLongMap!5031 tuple2!6118) ListLongMap!5031)

(assert (=> b!378098 (= lt!176066 (+!877 lt!176076 lt!176068))))

(declare-fun lt!176064 () ListLongMap!5031)

(declare-fun lt!176067 () ListLongMap!5031)

(assert (=> b!378098 (= lt!176064 lt!176067)))

(declare-fun lt!176069 () ListLongMap!5031)

(assert (=> b!378098 (= lt!176067 (+!877 lt!176069 lt!176068))))

(declare-fun lt!176070 () ListLongMap!5031)

(assert (=> b!378098 (= lt!176065 (+!877 lt!176070 lt!176068))))

(declare-fun zeroValue!472 () V!13207)

(assert (=> b!378098 (= lt!176068 (tuple2!6119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378099 () Bool)

(declare-fun res!214072 () Bool)

(assert (=> b!378099 (=> (not res!214072) (not e!230149))))

(assert (=> b!378099 (= res!214072 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10861 _keys!658))))))

(declare-fun b!378100 () Bool)

(declare-fun res!214077 () Bool)

(declare-fun e!230147 () Bool)

(assert (=> b!378100 (=> (not res!214077) (not e!230147))))

(declare-fun lt!176075 () array!22081)

(declare-datatypes ((List!5957 0))(
  ( (Nil!5954) (Cons!5953 (h!6809 (_ BitVec 64)) (t!11107 List!5957)) )
))
(declare-fun arrayNoDuplicates!0 (array!22081 (_ BitVec 32) List!5957) Bool)

(assert (=> b!378100 (= res!214077 (arrayNoDuplicates!0 lt!176075 #b00000000000000000000000000000000 Nil!5954))))

(declare-fun b!378101 () Bool)

(declare-fun res!214074 () Bool)

(assert (=> b!378101 (=> (not res!214074) (not e!230149))))

(declare-datatypes ((ValueCell!4195 0))(
  ( (ValueCellFull!4195 (v!6780 V!13207)) (EmptyCell!4195) )
))
(declare-datatypes ((array!22083 0))(
  ( (array!22084 (arr!10510 (Array (_ BitVec 32) ValueCell!4195)) (size!10862 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22083)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378101 (= res!214074 (and (= (size!10862 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10861 _keys!658) (size!10862 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!214082 () Bool)

(assert (=> start!37302 (=> (not res!214082) (not e!230149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37302 (= res!214082 (validMask!0 mask!970))))

(assert (=> start!37302 e!230149))

(declare-fun e!230146 () Bool)

(declare-fun array_inv!7742 (array!22083) Bool)

(assert (=> start!37302 (and (array_inv!7742 _values!506) e!230146)))

(assert (=> start!37302 tp!30003))

(assert (=> start!37302 true))

(declare-fun tp_is_empty!9077 () Bool)

(assert (=> start!37302 tp_is_empty!9077))

(declare-fun array_inv!7743 (array!22081) Bool)

(assert (=> start!37302 (array_inv!7743 _keys!658)))

(declare-fun mapIsEmpty!15180 () Bool)

(declare-fun mapRes!15180 () Bool)

(assert (=> mapIsEmpty!15180 mapRes!15180))

(declare-fun b!378102 () Bool)

(declare-fun e!230148 () Bool)

(assert (=> b!378102 (= e!230148 tp_is_empty!9077)))

(declare-fun b!378103 () Bool)

(assert (=> b!378103 (= e!230144 true)))

(declare-fun lt!176074 () tuple2!6118)

(assert (=> b!378103 (= lt!176066 (+!877 lt!176067 lt!176074))))

(declare-fun v!373 () V!13207)

(declare-datatypes ((Unit!11654 0))(
  ( (Unit!11655) )
))
(declare-fun lt!176072 () Unit!11654)

(declare-fun addCommutativeForDiffKeys!283 (ListLongMap!5031 (_ BitVec 64) V!13207 (_ BitVec 64) V!13207) Unit!11654)

(assert (=> b!378103 (= lt!176072 (addCommutativeForDiffKeys!283 lt!176069 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378104 () Bool)

(assert (=> b!378104 (= e!230147 (not e!230150))))

(declare-fun res!214081 () Bool)

(assert (=> b!378104 (=> res!214081 e!230150)))

(assert (=> b!378104 (= res!214081 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13207)

(declare-fun getCurrentListMap!1958 (array!22081 array!22083 (_ BitVec 32) (_ BitVec 32) V!13207 V!13207 (_ BitVec 32) Int) ListLongMap!5031)

(assert (=> b!378104 (= lt!176064 (getCurrentListMap!1958 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176071 () array!22083)

(assert (=> b!378104 (= lt!176065 (getCurrentListMap!1958 lt!176075 lt!176071 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378104 (and (= lt!176070 lt!176076) (= lt!176076 lt!176070))))

(assert (=> b!378104 (= lt!176076 (+!877 lt!176069 lt!176074))))

(assert (=> b!378104 (= lt!176074 (tuple2!6119 k!778 v!373))))

(declare-fun lt!176073 () Unit!11654)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 (array!22081 array!22083 (_ BitVec 32) (_ BitVec 32) V!13207 V!13207 (_ BitVec 32) (_ BitVec 64) V!13207 (_ BitVec 32) Int) Unit!11654)

(assert (=> b!378104 (= lt!176073 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!792 (array!22081 array!22083 (_ BitVec 32) (_ BitVec 32) V!13207 V!13207 (_ BitVec 32) Int) ListLongMap!5031)

(assert (=> b!378104 (= lt!176070 (getCurrentListMapNoExtraKeys!792 lt!176075 lt!176071 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378104 (= lt!176071 (array!22084 (store (arr!10510 _values!506) i!548 (ValueCellFull!4195 v!373)) (size!10862 _values!506)))))

(assert (=> b!378104 (= lt!176069 (getCurrentListMapNoExtraKeys!792 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378105 () Bool)

(declare-fun res!214073 () Bool)

(assert (=> b!378105 (=> (not res!214073) (not e!230149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22081 (_ BitVec 32)) Bool)

(assert (=> b!378105 (= res!214073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378106 () Bool)

(declare-fun res!214078 () Bool)

(assert (=> b!378106 (=> (not res!214078) (not e!230149))))

(assert (=> b!378106 (= res!214078 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5954))))

(declare-fun mapNonEmpty!15180 () Bool)

(declare-fun tp!30002 () Bool)

(assert (=> mapNonEmpty!15180 (= mapRes!15180 (and tp!30002 e!230148))))

(declare-fun mapRest!15180 () (Array (_ BitVec 32) ValueCell!4195))

(declare-fun mapValue!15180 () ValueCell!4195)

(declare-fun mapKey!15180 () (_ BitVec 32))

(assert (=> mapNonEmpty!15180 (= (arr!10510 _values!506) (store mapRest!15180 mapKey!15180 mapValue!15180))))

(declare-fun b!378107 () Bool)

(declare-fun res!214071 () Bool)

(assert (=> b!378107 (=> (not res!214071) (not e!230149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378107 (= res!214071 (validKeyInArray!0 k!778))))

(declare-fun b!378108 () Bool)

(declare-fun e!230143 () Bool)

(assert (=> b!378108 (= e!230146 (and e!230143 mapRes!15180))))

(declare-fun condMapEmpty!15180 () Bool)

(declare-fun mapDefault!15180 () ValueCell!4195)

