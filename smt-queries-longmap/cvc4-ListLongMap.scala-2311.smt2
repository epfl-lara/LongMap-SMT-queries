; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37332 () Bool)

(assert start!37332)

(declare-fun b_free!8459 () Bool)

(declare-fun b_next!8459 () Bool)

(assert (=> start!37332 (= b_free!8459 (not b_next!8459))))

(declare-fun tp!30092 () Bool)

(declare-fun b_and!15701 () Bool)

(assert (=> start!37332 (= tp!30092 b_and!15701)))

(declare-fun b!378780 () Bool)

(declare-fun res!214631 () Bool)

(declare-fun e!230510 () Bool)

(assert (=> b!378780 (=> (not res!214631) (not e!230510))))

(declare-datatypes ((array!22139 0))(
  ( (array!22140 (arr!10538 (Array (_ BitVec 32) (_ BitVec 64))) (size!10890 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22139)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22139 (_ BitVec 32)) Bool)

(assert (=> b!378780 (= res!214631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378781 () Bool)

(declare-fun e!230505 () Bool)

(assert (=> b!378781 (= e!230505 true)))

(declare-datatypes ((V!13247 0))(
  ( (V!13248 (val!4598 Int)) )
))
(declare-datatypes ((tuple2!6144 0))(
  ( (tuple2!6145 (_1!3083 (_ BitVec 64)) (_2!3083 V!13247)) )
))
(declare-datatypes ((List!5981 0))(
  ( (Nil!5978) (Cons!5977 (h!6833 tuple2!6144) (t!11131 List!5981)) )
))
(declare-datatypes ((ListLongMap!5057 0))(
  ( (ListLongMap!5058 (toList!2544 List!5981)) )
))
(declare-fun lt!176625 () ListLongMap!5057)

(declare-fun lt!176617 () ListLongMap!5057)

(declare-fun lt!176613 () tuple2!6144)

(declare-fun +!890 (ListLongMap!5057 tuple2!6144) ListLongMap!5057)

(assert (=> b!378781 (= lt!176625 (+!890 lt!176617 lt!176613))))

(declare-fun v!373 () V!13247)

(declare-fun lt!176619 () ListLongMap!5057)

(declare-datatypes ((Unit!11680 0))(
  ( (Unit!11681) )
))
(declare-fun lt!176622 () Unit!11680)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13247)

(declare-fun addCommutativeForDiffKeys!292 (ListLongMap!5057 (_ BitVec 64) V!13247 (_ BitVec 64) V!13247) Unit!11680)

(assert (=> b!378781 (= lt!176622 (addCommutativeForDiffKeys!292 lt!176619 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378782 () Bool)

(declare-fun res!214624 () Bool)

(assert (=> b!378782 (=> (not res!214624) (not e!230510))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378782 (= res!214624 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10890 _keys!658))))))

(declare-fun b!378783 () Bool)

(declare-fun e!230508 () Bool)

(assert (=> b!378783 (= e!230510 e!230508)))

(declare-fun res!214622 () Bool)

(assert (=> b!378783 (=> (not res!214622) (not e!230508))))

(declare-fun lt!176620 () array!22139)

(assert (=> b!378783 (= res!214622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176620 mask!970))))

(assert (=> b!378783 (= lt!176620 (array!22140 (store (arr!10538 _keys!658) i!548 k!778) (size!10890 _keys!658)))))

(declare-fun b!378784 () Bool)

(declare-fun res!214626 () Bool)

(assert (=> b!378784 (=> (not res!214626) (not e!230510))))

(declare-datatypes ((List!5982 0))(
  ( (Nil!5979) (Cons!5978 (h!6834 (_ BitVec 64)) (t!11132 List!5982)) )
))
(declare-fun arrayNoDuplicates!0 (array!22139 (_ BitVec 32) List!5982) Bool)

(assert (=> b!378784 (= res!214626 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5979))))

(declare-fun b!378785 () Bool)

(declare-fun e!230504 () Bool)

(declare-fun tp_is_empty!9107 () Bool)

(assert (=> b!378785 (= e!230504 tp_is_empty!9107)))

(declare-fun b!378786 () Bool)

(declare-fun e!230507 () Bool)

(assert (=> b!378786 (= e!230507 tp_is_empty!9107)))

(declare-fun res!214627 () Bool)

(assert (=> start!37332 (=> (not res!214627) (not e!230510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37332 (= res!214627 (validMask!0 mask!970))))

(assert (=> start!37332 e!230510))

(declare-datatypes ((ValueCell!4210 0))(
  ( (ValueCellFull!4210 (v!6795 V!13247)) (EmptyCell!4210) )
))
(declare-datatypes ((array!22141 0))(
  ( (array!22142 (arr!10539 (Array (_ BitVec 32) ValueCell!4210)) (size!10891 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22141)

(declare-fun e!230509 () Bool)

(declare-fun array_inv!7762 (array!22141) Bool)

(assert (=> start!37332 (and (array_inv!7762 _values!506) e!230509)))

(assert (=> start!37332 tp!30092))

(assert (=> start!37332 true))

(assert (=> start!37332 tp_is_empty!9107))

(declare-fun array_inv!7763 (array!22139) Bool)

(assert (=> start!37332 (array_inv!7763 _keys!658)))

(declare-fun b!378787 () Bool)

(declare-fun res!214623 () Bool)

(assert (=> b!378787 (=> (not res!214623) (not e!230510))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378787 (= res!214623 (and (= (size!10891 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10890 _keys!658) (size!10891 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378788 () Bool)

(declare-fun res!214625 () Bool)

(assert (=> b!378788 (=> (not res!214625) (not e!230510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378788 (= res!214625 (validKeyInArray!0 k!778))))

(declare-fun b!378789 () Bool)

(declare-fun mapRes!15225 () Bool)

(assert (=> b!378789 (= e!230509 (and e!230507 mapRes!15225))))

(declare-fun condMapEmpty!15225 () Bool)

(declare-fun mapDefault!15225 () ValueCell!4210)

