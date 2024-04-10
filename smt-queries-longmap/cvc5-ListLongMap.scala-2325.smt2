; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37412 () Bool)

(assert start!37412)

(declare-fun b_free!8539 () Bool)

(declare-fun b_next!8539 () Bool)

(assert (=> start!37412 (= b_free!8539 (not b_next!8539))))

(declare-fun tp!30333 () Bool)

(declare-fun b_and!15781 () Bool)

(assert (=> start!37412 (= tp!30333 b_and!15781)))

(declare-fun mapIsEmpty!15345 () Bool)

(declare-fun mapRes!15345 () Bool)

(assert (=> mapIsEmpty!15345 mapRes!15345))

(declare-fun b!380580 () Bool)

(declare-fun e!231464 () Bool)

(declare-fun tp_is_empty!9187 () Bool)

(assert (=> b!380580 (= e!231464 tp_is_empty!9187)))

(declare-fun b!380581 () Bool)

(declare-fun res!216067 () Bool)

(declare-fun e!231463 () Bool)

(assert (=> b!380581 (=> (not res!216067) (not e!231463))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22293 0))(
  ( (array!22294 (arr!10615 (Array (_ BitVec 32) (_ BitVec 64))) (size!10967 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22293)

(assert (=> b!380581 (= res!216067 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10967 _keys!658))))))

(declare-fun b!380582 () Bool)

(declare-fun res!216061 () Bool)

(assert (=> b!380582 (=> (not res!216061) (not e!231463))))

(assert (=> b!380582 (= res!216061 (or (= (select (arr!10615 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10615 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380583 () Bool)

(declare-fun e!231467 () Bool)

(assert (=> b!380583 (= e!231463 e!231467)))

(declare-fun res!216068 () Bool)

(assert (=> b!380583 (=> (not res!216068) (not e!231467))))

(declare-fun lt!178182 () array!22293)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22293 (_ BitVec 32)) Bool)

(assert (=> b!380583 (= res!216068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178182 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!380583 (= lt!178182 (array!22294 (store (arr!10615 _keys!658) i!548 k!778) (size!10967 _keys!658)))))

(declare-fun b!380584 () Bool)

(declare-fun res!216070 () Bool)

(assert (=> b!380584 (=> (not res!216070) (not e!231463))))

(declare-fun arrayContainsKey!0 (array!22293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380584 (= res!216070 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380585 () Bool)

(declare-fun res!216065 () Bool)

(assert (=> b!380585 (=> (not res!216065) (not e!231463))))

(declare-datatypes ((List!6053 0))(
  ( (Nil!6050) (Cons!6049 (h!6905 (_ BitVec 64)) (t!11203 List!6053)) )
))
(declare-fun arrayNoDuplicates!0 (array!22293 (_ BitVec 32) List!6053) Bool)

(assert (=> b!380585 (= res!216065 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6050))))

(declare-fun b!380586 () Bool)

(declare-fun res!216071 () Bool)

(assert (=> b!380586 (=> (not res!216071) (not e!231463))))

(assert (=> b!380586 (= res!216071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380587 () Bool)

(declare-fun e!231470 () Bool)

(assert (=> b!380587 (= e!231470 true)))

(declare-datatypes ((V!13355 0))(
  ( (V!13356 (val!4638 Int)) )
))
(declare-datatypes ((tuple2!6218 0))(
  ( (tuple2!6219 (_1!3120 (_ BitVec 64)) (_2!3120 V!13355)) )
))
(declare-datatypes ((List!6054 0))(
  ( (Nil!6051) (Cons!6050 (h!6906 tuple2!6218) (t!11204 List!6054)) )
))
(declare-datatypes ((ListLongMap!5131 0))(
  ( (ListLongMap!5132 (toList!2581 List!6054)) )
))
(declare-fun lt!178177 () ListLongMap!5131)

(declare-fun lt!178178 () ListLongMap!5131)

(declare-fun lt!178179 () tuple2!6218)

(declare-fun +!927 (ListLongMap!5131 tuple2!6218) ListLongMap!5131)

(assert (=> b!380587 (= lt!178177 (+!927 lt!178178 lt!178179))))

(declare-fun v!373 () V!13355)

(declare-datatypes ((Unit!11748 0))(
  ( (Unit!11749) )
))
(declare-fun lt!178185 () Unit!11748)

(declare-fun lt!178175 () ListLongMap!5131)

(declare-fun minValue!472 () V!13355)

(declare-fun addCommutativeForDiffKeys!324 (ListLongMap!5131 (_ BitVec 64) V!13355 (_ BitVec 64) V!13355) Unit!11748)

(assert (=> b!380587 (= lt!178185 (addCommutativeForDiffKeys!324 lt!178175 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380588 () Bool)

(declare-fun e!231468 () Bool)

(assert (=> b!380588 (= e!231468 tp_is_empty!9187)))

(declare-fun res!216060 () Bool)

(assert (=> start!37412 (=> (not res!216060) (not e!231463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37412 (= res!216060 (validMask!0 mask!970))))

(assert (=> start!37412 e!231463))

(declare-datatypes ((ValueCell!4250 0))(
  ( (ValueCellFull!4250 (v!6835 V!13355)) (EmptyCell!4250) )
))
(declare-datatypes ((array!22295 0))(
  ( (array!22296 (arr!10616 (Array (_ BitVec 32) ValueCell!4250)) (size!10968 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22295)

(declare-fun e!231469 () Bool)

(declare-fun array_inv!7814 (array!22295) Bool)

(assert (=> start!37412 (and (array_inv!7814 _values!506) e!231469)))

(assert (=> start!37412 tp!30333))

(assert (=> start!37412 true))

(assert (=> start!37412 tp_is_empty!9187))

(declare-fun array_inv!7815 (array!22293) Bool)

(assert (=> start!37412 (array_inv!7815 _keys!658)))

(declare-fun b!380589 () Bool)

(declare-fun e!231465 () Bool)

(assert (=> b!380589 (= e!231467 (not e!231465))))

(declare-fun res!216066 () Bool)

(assert (=> b!380589 (=> res!216066 e!231465)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380589 (= res!216066 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13355)

(declare-fun lt!178183 () ListLongMap!5131)

(declare-fun getCurrentListMap!1997 (array!22293 array!22295 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!380589 (= lt!178183 (getCurrentListMap!1997 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178184 () ListLongMap!5131)

(declare-fun lt!178180 () array!22295)

(assert (=> b!380589 (= lt!178184 (getCurrentListMap!1997 lt!178182 lt!178180 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178174 () ListLongMap!5131)

(declare-fun lt!178176 () ListLongMap!5131)

(assert (=> b!380589 (and (= lt!178174 lt!178176) (= lt!178176 lt!178174))))

(assert (=> b!380589 (= lt!178176 (+!927 lt!178175 lt!178179))))

(assert (=> b!380589 (= lt!178179 (tuple2!6219 k!778 v!373))))

(declare-fun lt!178181 () Unit!11748)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!155 (array!22293 array!22295 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) (_ BitVec 64) V!13355 (_ BitVec 32) Int) Unit!11748)

(assert (=> b!380589 (= lt!178181 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!155 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!831 (array!22293 array!22295 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!380589 (= lt!178174 (getCurrentListMapNoExtraKeys!831 lt!178182 lt!178180 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380589 (= lt!178180 (array!22296 (store (arr!10616 _values!506) i!548 (ValueCellFull!4250 v!373)) (size!10968 _values!506)))))

(assert (=> b!380589 (= lt!178175 (getCurrentListMapNoExtraKeys!831 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380590 () Bool)

(declare-fun res!216069 () Bool)

(assert (=> b!380590 (=> (not res!216069) (not e!231463))))

(assert (=> b!380590 (= res!216069 (and (= (size!10968 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10967 _keys!658) (size!10968 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380591 () Bool)

(declare-fun res!216064 () Bool)

(assert (=> b!380591 (=> (not res!216064) (not e!231467))))

(assert (=> b!380591 (= res!216064 (arrayNoDuplicates!0 lt!178182 #b00000000000000000000000000000000 Nil!6050))))

(declare-fun b!380592 () Bool)

(assert (=> b!380592 (= e!231469 (and e!231468 mapRes!15345))))

(declare-fun condMapEmpty!15345 () Bool)

(declare-fun mapDefault!15345 () ValueCell!4250)

