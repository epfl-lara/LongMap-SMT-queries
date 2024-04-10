; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37230 () Bool)

(assert start!37230)

(declare-fun b_free!8357 () Bool)

(declare-fun b_next!8357 () Bool)

(assert (=> start!37230 (= b_free!8357 (not b_next!8357))))

(declare-fun tp!29787 () Bool)

(declare-fun b_and!15599 () Bool)

(assert (=> start!37230 (= tp!29787 b_and!15599)))

(declare-fun mapIsEmpty!15072 () Bool)

(declare-fun mapRes!15072 () Bool)

(assert (=> mapIsEmpty!15072 mapRes!15072))

(declare-fun b!376476 () Bool)

(declare-fun res!212782 () Bool)

(declare-fun e!229283 () Bool)

(assert (=> b!376476 (=> (not res!212782) (not e!229283))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376476 (= res!212782 (validKeyInArray!0 k!778))))

(declare-fun b!376477 () Bool)

(declare-fun res!212776 () Bool)

(declare-fun e!229282 () Bool)

(assert (=> b!376477 (=> (not res!212776) (not e!229282))))

(declare-datatypes ((array!21939 0))(
  ( (array!21940 (arr!10438 (Array (_ BitVec 32) (_ BitVec 64))) (size!10790 (_ BitVec 32))) )
))
(declare-fun lt!174671 () array!21939)

(declare-datatypes ((List!5896 0))(
  ( (Nil!5893) (Cons!5892 (h!6748 (_ BitVec 64)) (t!11046 List!5896)) )
))
(declare-fun arrayNoDuplicates!0 (array!21939 (_ BitVec 32) List!5896) Bool)

(assert (=> b!376477 (= res!212776 (arrayNoDuplicates!0 lt!174671 #b00000000000000000000000000000000 Nil!5893))))

(declare-fun b!376478 () Bool)

(declare-fun e!229281 () Bool)

(declare-fun e!229284 () Bool)

(assert (=> b!376478 (= e!229281 e!229284)))

(declare-fun res!212779 () Bool)

(assert (=> b!376478 (=> res!212779 e!229284)))

(assert (=> b!376478 (= res!212779 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13111 0))(
  ( (V!13112 (val!4547 Int)) )
))
(declare-datatypes ((tuple2!6054 0))(
  ( (tuple2!6055 (_1!3038 (_ BitVec 64)) (_2!3038 V!13111)) )
))
(declare-datatypes ((List!5897 0))(
  ( (Nil!5894) (Cons!5893 (h!6749 tuple2!6054) (t!11047 List!5897)) )
))
(declare-datatypes ((ListLongMap!4967 0))(
  ( (ListLongMap!4968 (toList!2499 List!5897)) )
))
(declare-fun lt!174664 () ListLongMap!4967)

(declare-fun lt!174668 () ListLongMap!4967)

(assert (=> b!376478 (= lt!174664 lt!174668)))

(declare-fun lt!174667 () ListLongMap!4967)

(declare-fun lt!174670 () tuple2!6054)

(declare-fun +!845 (ListLongMap!4967 tuple2!6054) ListLongMap!4967)

(assert (=> b!376478 (= lt!174668 (+!845 lt!174667 lt!174670))))

(declare-fun lt!174672 () ListLongMap!4967)

(declare-fun lt!174665 () ListLongMap!4967)

(assert (=> b!376478 (= lt!174672 lt!174665)))

(declare-fun lt!174666 () ListLongMap!4967)

(assert (=> b!376478 (= lt!174665 (+!845 lt!174666 lt!174670))))

(declare-fun lt!174661 () ListLongMap!4967)

(assert (=> b!376478 (= lt!174664 (+!845 lt!174661 lt!174670))))

(declare-fun zeroValue!472 () V!13111)

(assert (=> b!376478 (= lt!174670 (tuple2!6055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376479 () Bool)

(declare-fun res!212785 () Bool)

(assert (=> b!376479 (=> (not res!212785) (not e!229283))))

(declare-fun _keys!658 () array!21939)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376479 (= res!212785 (or (= (select (arr!10438 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10438 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376480 () Bool)

(declare-fun res!212781 () Bool)

(assert (=> b!376480 (=> (not res!212781) (not e!229283))))

(declare-fun arrayContainsKey!0 (array!21939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376480 (= res!212781 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!212783 () Bool)

(assert (=> start!37230 (=> (not res!212783) (not e!229283))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37230 (= res!212783 (validMask!0 mask!970))))

(assert (=> start!37230 e!229283))

(declare-datatypes ((ValueCell!4159 0))(
  ( (ValueCellFull!4159 (v!6744 V!13111)) (EmptyCell!4159) )
))
(declare-datatypes ((array!21941 0))(
  ( (array!21942 (arr!10439 (Array (_ BitVec 32) ValueCell!4159)) (size!10791 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21941)

(declare-fun e!229279 () Bool)

(declare-fun array_inv!7694 (array!21941) Bool)

(assert (=> start!37230 (and (array_inv!7694 _values!506) e!229279)))

(assert (=> start!37230 tp!29787))

(assert (=> start!37230 true))

(declare-fun tp_is_empty!9005 () Bool)

(assert (=> start!37230 tp_is_empty!9005))

(declare-fun array_inv!7695 (array!21939) Bool)

(assert (=> start!37230 (array_inv!7695 _keys!658)))

(declare-fun b!376481 () Bool)

(assert (=> b!376481 (= e!229282 (not e!229281))))

(declare-fun res!212778 () Bool)

(assert (=> b!376481 (=> res!212778 e!229281)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376481 (= res!212778 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13111)

(declare-fun getCurrentListMap!1933 (array!21939 array!21941 (_ BitVec 32) (_ BitVec 32) V!13111 V!13111 (_ BitVec 32) Int) ListLongMap!4967)

(assert (=> b!376481 (= lt!174672 (getCurrentListMap!1933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174669 () array!21941)

(assert (=> b!376481 (= lt!174664 (getCurrentListMap!1933 lt!174671 lt!174669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376481 (and (= lt!174661 lt!174667) (= lt!174667 lt!174661))))

(declare-fun lt!174660 () tuple2!6054)

(assert (=> b!376481 (= lt!174667 (+!845 lt!174666 lt!174660))))

(declare-fun v!373 () V!13111)

(assert (=> b!376481 (= lt!174660 (tuple2!6055 k!778 v!373))))

(declare-datatypes ((Unit!11596 0))(
  ( (Unit!11597) )
))
(declare-fun lt!174662 () Unit!11596)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!91 (array!21939 array!21941 (_ BitVec 32) (_ BitVec 32) V!13111 V!13111 (_ BitVec 32) (_ BitVec 64) V!13111 (_ BitVec 32) Int) Unit!11596)

(assert (=> b!376481 (= lt!174662 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!91 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!767 (array!21939 array!21941 (_ BitVec 32) (_ BitVec 32) V!13111 V!13111 (_ BitVec 32) Int) ListLongMap!4967)

(assert (=> b!376481 (= lt!174661 (getCurrentListMapNoExtraKeys!767 lt!174671 lt!174669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376481 (= lt!174669 (array!21942 (store (arr!10439 _values!506) i!548 (ValueCellFull!4159 v!373)) (size!10791 _values!506)))))

(assert (=> b!376481 (= lt!174666 (getCurrentListMapNoExtraKeys!767 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376482 () Bool)

(declare-fun res!212780 () Bool)

(assert (=> b!376482 (=> (not res!212780) (not e!229283))))

(assert (=> b!376482 (= res!212780 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5893))))

(declare-fun b!376483 () Bool)

(declare-fun e!229280 () Bool)

(assert (=> b!376483 (= e!229279 (and e!229280 mapRes!15072))))

(declare-fun condMapEmpty!15072 () Bool)

(declare-fun mapDefault!15072 () ValueCell!4159)

