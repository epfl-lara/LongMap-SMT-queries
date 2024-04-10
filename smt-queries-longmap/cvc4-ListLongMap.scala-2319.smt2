; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37380 () Bool)

(assert start!37380)

(declare-fun b_free!8507 () Bool)

(declare-fun b_next!8507 () Bool)

(assert (=> start!37380 (= b_free!8507 (not b_next!8507))))

(declare-fun tp!30237 () Bool)

(declare-fun b_and!15749 () Bool)

(assert (=> start!37380 (= tp!30237 b_and!15749)))

(declare-fun res!215484 () Bool)

(declare-fun e!231084 () Bool)

(assert (=> start!37380 (=> (not res!215484) (not e!231084))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37380 (= res!215484 (validMask!0 mask!970))))

(assert (=> start!37380 e!231084))

(declare-datatypes ((V!13311 0))(
  ( (V!13312 (val!4622 Int)) )
))
(declare-datatypes ((ValueCell!4234 0))(
  ( (ValueCellFull!4234 (v!6819 V!13311)) (EmptyCell!4234) )
))
(declare-datatypes ((array!22231 0))(
  ( (array!22232 (arr!10584 (Array (_ BitVec 32) ValueCell!4234)) (size!10936 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22231)

(declare-fun e!231085 () Bool)

(declare-fun array_inv!7792 (array!22231) Bool)

(assert (=> start!37380 (and (array_inv!7792 _values!506) e!231085)))

(assert (=> start!37380 tp!30237))

(assert (=> start!37380 true))

(declare-fun tp_is_empty!9155 () Bool)

(assert (=> start!37380 tp_is_empty!9155))

(declare-datatypes ((array!22233 0))(
  ( (array!22234 (arr!10585 (Array (_ BitVec 32) (_ BitVec 64))) (size!10937 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22233)

(declare-fun array_inv!7793 (array!22233) Bool)

(assert (=> start!37380 (array_inv!7793 _keys!658)))

(declare-fun b!379860 () Bool)

(declare-fun e!231083 () Bool)

(assert (=> b!379860 (= e!231083 true)))

(declare-datatypes ((tuple2!6190 0))(
  ( (tuple2!6191 (_1!3106 (_ BitVec 64)) (_2!3106 V!13311)) )
))
(declare-datatypes ((List!6025 0))(
  ( (Nil!6022) (Cons!6021 (h!6877 tuple2!6190) (t!11175 List!6025)) )
))
(declare-datatypes ((ListLongMap!5103 0))(
  ( (ListLongMap!5104 (toList!2567 List!6025)) )
))
(declare-fun lt!177558 () ListLongMap!5103)

(declare-fun lt!177554 () ListLongMap!5103)

(declare-fun lt!177550 () tuple2!6190)

(declare-fun +!913 (ListLongMap!5103 tuple2!6190) ListLongMap!5103)

(assert (=> b!379860 (= lt!177558 (+!913 lt!177554 lt!177550))))

(declare-fun v!373 () V!13311)

(declare-fun lt!177559 () ListLongMap!5103)

(declare-datatypes ((Unit!11720 0))(
  ( (Unit!11721) )
))
(declare-fun lt!177560 () Unit!11720)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13311)

(declare-fun addCommutativeForDiffKeys!310 (ListLongMap!5103 (_ BitVec 64) V!13311 (_ BitVec 64) V!13311) Unit!11720)

(assert (=> b!379860 (= lt!177560 (addCommutativeForDiffKeys!310 lt!177559 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379861 () Bool)

(declare-fun res!215488 () Bool)

(assert (=> b!379861 (=> (not res!215488) (not e!231084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22233 (_ BitVec 32)) Bool)

(assert (=> b!379861 (= res!215488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379862 () Bool)

(declare-fun res!215487 () Bool)

(declare-fun e!231086 () Bool)

(assert (=> b!379862 (=> (not res!215487) (not e!231086))))

(declare-fun lt!177549 () array!22233)

(declare-datatypes ((List!6026 0))(
  ( (Nil!6023) (Cons!6022 (h!6878 (_ BitVec 64)) (t!11176 List!6026)) )
))
(declare-fun arrayNoDuplicates!0 (array!22233 (_ BitVec 32) List!6026) Bool)

(assert (=> b!379862 (= res!215487 (arrayNoDuplicates!0 lt!177549 #b00000000000000000000000000000000 Nil!6023))))

(declare-fun b!379863 () Bool)

(declare-fun e!231081 () Bool)

(declare-fun mapRes!15297 () Bool)

(assert (=> b!379863 (= e!231085 (and e!231081 mapRes!15297))))

(declare-fun condMapEmpty!15297 () Bool)

(declare-fun mapDefault!15297 () ValueCell!4234)

