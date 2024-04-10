; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37316 () Bool)

(assert start!37316)

(declare-fun b_free!8443 () Bool)

(declare-fun b_next!8443 () Bool)

(assert (=> start!37316 (= b_free!8443 (not b_next!8443))))

(declare-fun tp!30044 () Bool)

(declare-fun b_and!15685 () Bool)

(assert (=> start!37316 (= tp!30044 b_and!15685)))

(declare-fun b!378420 () Bool)

(declare-fun e!230314 () Bool)

(assert (=> b!378420 (= e!230314 true)))

(declare-datatypes ((V!13227 0))(
  ( (V!13228 (val!4590 Int)) )
))
(declare-datatypes ((tuple2!6130 0))(
  ( (tuple2!6131 (_1!3076 (_ BitVec 64)) (_2!3076 V!13227)) )
))
(declare-datatypes ((List!5968 0))(
  ( (Nil!5965) (Cons!5964 (h!6820 tuple2!6130) (t!11118 List!5968)) )
))
(declare-datatypes ((ListLongMap!5043 0))(
  ( (ListLongMap!5044 (toList!2537 List!5968)) )
))
(declare-fun lt!176312 () ListLongMap!5043)

(declare-fun lt!176303 () ListLongMap!5043)

(declare-fun lt!176307 () tuple2!6130)

(declare-fun +!883 (ListLongMap!5043 tuple2!6130) ListLongMap!5043)

(assert (=> b!378420 (= lt!176312 (+!883 lt!176303 lt!176307))))

(declare-fun v!373 () V!13227)

(declare-fun k!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11666 0))(
  ( (Unit!11667) )
))
(declare-fun lt!176308 () Unit!11666)

(declare-fun lt!176301 () ListLongMap!5043)

(declare-fun minValue!472 () V!13227)

(declare-fun addCommutativeForDiffKeys!286 (ListLongMap!5043 (_ BitVec 64) V!13227 (_ BitVec 64) V!13227) Unit!11666)

(assert (=> b!378420 (= lt!176308 (addCommutativeForDiffKeys!286 lt!176301 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378421 () Bool)

(declare-fun e!230317 () Bool)

(assert (=> b!378421 (= e!230317 e!230314)))

(declare-fun res!214341 () Bool)

(assert (=> b!378421 (=> res!214341 e!230314)))

(assert (=> b!378421 (= res!214341 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176305 () ListLongMap!5043)

(assert (=> b!378421 (= lt!176305 lt!176303)))

(declare-fun lt!176310 () tuple2!6130)

(assert (=> b!378421 (= lt!176303 (+!883 lt!176301 lt!176310))))

(declare-fun lt!176309 () ListLongMap!5043)

(assert (=> b!378421 (= lt!176309 lt!176312)))

(declare-fun lt!176311 () ListLongMap!5043)

(assert (=> b!378421 (= lt!176312 (+!883 lt!176311 lt!176310))))

(declare-fun lt!176302 () ListLongMap!5043)

(assert (=> b!378421 (= lt!176309 (+!883 lt!176302 lt!176310))))

(assert (=> b!378421 (= lt!176310 (tuple2!6131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15201 () Bool)

(declare-fun mapRes!15201 () Bool)

(declare-fun tp!30045 () Bool)

(declare-fun e!230311 () Bool)

(assert (=> mapNonEmpty!15201 (= mapRes!15201 (and tp!30045 e!230311))))

(declare-datatypes ((ValueCell!4202 0))(
  ( (ValueCellFull!4202 (v!6787 V!13227)) (EmptyCell!4202) )
))
(declare-datatypes ((array!22107 0))(
  ( (array!22108 (arr!10522 (Array (_ BitVec 32) ValueCell!4202)) (size!10874 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22107)

(declare-fun mapValue!15201 () ValueCell!4202)

(declare-fun mapKey!15201 () (_ BitVec 32))

(declare-fun mapRest!15201 () (Array (_ BitVec 32) ValueCell!4202))

(assert (=> mapNonEmpty!15201 (= (arr!10522 _values!506) (store mapRest!15201 mapKey!15201 mapValue!15201))))

(declare-fun b!378422 () Bool)

(declare-fun res!214338 () Bool)

(declare-fun e!230318 () Bool)

(assert (=> b!378422 (=> (not res!214338) (not e!230318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378422 (= res!214338 (validKeyInArray!0 k!778))))

(declare-fun b!378423 () Bool)

(declare-fun res!214335 () Bool)

(assert (=> b!378423 (=> (not res!214335) (not e!230318))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22109 0))(
  ( (array!22110 (arr!10523 (Array (_ BitVec 32) (_ BitVec 64))) (size!10875 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22109)

(assert (=> b!378423 (= res!214335 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10875 _keys!658))))))

(declare-fun b!378424 () Bool)

(declare-fun tp_is_empty!9091 () Bool)

(assert (=> b!378424 (= e!230311 tp_is_empty!9091)))

(declare-fun b!378425 () Bool)

(declare-fun res!214340 () Bool)

(declare-fun e!230313 () Bool)

(assert (=> b!378425 (=> (not res!214340) (not e!230313))))

(declare-fun lt!176313 () array!22109)

(declare-datatypes ((List!5969 0))(
  ( (Nil!5966) (Cons!5965 (h!6821 (_ BitVec 64)) (t!11119 List!5969)) )
))
(declare-fun arrayNoDuplicates!0 (array!22109 (_ BitVec 32) List!5969) Bool)

(assert (=> b!378425 (= res!214340 (arrayNoDuplicates!0 lt!176313 #b00000000000000000000000000000000 Nil!5966))))

(declare-fun b!378426 () Bool)

(declare-fun res!214336 () Bool)

(assert (=> b!378426 (=> (not res!214336) (not e!230318))))

(declare-fun arrayContainsKey!0 (array!22109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378426 (= res!214336 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378427 () Bool)

(assert (=> b!378427 (= e!230313 (not e!230317))))

(declare-fun res!214334 () Bool)

(assert (=> b!378427 (=> res!214334 e!230317)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378427 (= res!214334 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13227)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1963 (array!22109 array!22107 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!5043)

(assert (=> b!378427 (= lt!176305 (getCurrentListMap!1963 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176304 () array!22107)

(assert (=> b!378427 (= lt!176309 (getCurrentListMap!1963 lt!176313 lt!176304 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378427 (and (= lt!176302 lt!176311) (= lt!176311 lt!176302))))

(assert (=> b!378427 (= lt!176311 (+!883 lt!176301 lt!176307))))

(assert (=> b!378427 (= lt!176307 (tuple2!6131 k!778 v!373))))

(declare-fun lt!176306 () Unit!11666)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!121 (array!22109 array!22107 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) (_ BitVec 64) V!13227 (_ BitVec 32) Int) Unit!11666)

(assert (=> b!378427 (= lt!176306 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!121 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!797 (array!22109 array!22107 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!5043)

(assert (=> b!378427 (= lt!176302 (getCurrentListMapNoExtraKeys!797 lt!176313 lt!176304 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378427 (= lt!176304 (array!22108 (store (arr!10522 _values!506) i!548 (ValueCellFull!4202 v!373)) (size!10874 _values!506)))))

(assert (=> b!378427 (= lt!176301 (getCurrentListMapNoExtraKeys!797 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378428 () Bool)

(declare-fun res!214332 () Bool)

(assert (=> b!378428 (=> (not res!214332) (not e!230318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22109 (_ BitVec 32)) Bool)

(assert (=> b!378428 (= res!214332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15201 () Bool)

(assert (=> mapIsEmpty!15201 mapRes!15201))

(declare-fun b!378429 () Bool)

(declare-fun e!230316 () Bool)

(assert (=> b!378429 (= e!230316 tp_is_empty!9091)))

(declare-fun b!378430 () Bool)

(declare-fun res!214339 () Bool)

(assert (=> b!378430 (=> (not res!214339) (not e!230318))))

(assert (=> b!378430 (= res!214339 (and (= (size!10874 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10875 _keys!658) (size!10874 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378431 () Bool)

(declare-fun res!214342 () Bool)

(assert (=> b!378431 (=> (not res!214342) (not e!230318))))

(assert (=> b!378431 (= res!214342 (or (= (select (arr!10523 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10523 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!214343 () Bool)

(assert (=> start!37316 (=> (not res!214343) (not e!230318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37316 (= res!214343 (validMask!0 mask!970))))

(assert (=> start!37316 e!230318))

(declare-fun e!230315 () Bool)

(declare-fun array_inv!7750 (array!22107) Bool)

(assert (=> start!37316 (and (array_inv!7750 _values!506) e!230315)))

(assert (=> start!37316 tp!30044))

(assert (=> start!37316 true))

(assert (=> start!37316 tp_is_empty!9091))

(declare-fun array_inv!7751 (array!22109) Bool)

(assert (=> start!37316 (array_inv!7751 _keys!658)))

(declare-fun b!378432 () Bool)

(assert (=> b!378432 (= e!230315 (and e!230316 mapRes!15201))))

(declare-fun condMapEmpty!15201 () Bool)

(declare-fun mapDefault!15201 () ValueCell!4202)

