; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37544 () Bool)

(assert start!37544)

(declare-fun b_free!8671 () Bool)

(declare-fun b_next!8671 () Bool)

(assert (=> start!37544 (= b_free!8671 (not b_next!8671))))

(declare-fun tp!30729 () Bool)

(declare-fun b_and!15913 () Bool)

(assert (=> start!37544 (= tp!30729 b_and!15913)))

(declare-fun b!383368 () Bool)

(declare-fun res!218255 () Bool)

(declare-fun e!232866 () Bool)

(assert (=> b!383368 (=> (not res!218255) (not e!232866))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383368 (= res!218255 (validKeyInArray!0 k!778))))

(declare-fun b!383369 () Bool)

(declare-fun e!232870 () Bool)

(assert (=> b!383369 (= e!232866 e!232870)))

(declare-fun res!218261 () Bool)

(assert (=> b!383369 (=> (not res!218261) (not e!232870))))

(declare-datatypes ((array!22545 0))(
  ( (array!22546 (arr!10741 (Array (_ BitVec 32) (_ BitVec 64))) (size!11093 (_ BitVec 32))) )
))
(declare-fun lt!180068 () array!22545)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22545 (_ BitVec 32)) Bool)

(assert (=> b!383369 (= res!218261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180068 mask!970))))

(declare-fun _keys!658 () array!22545)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383369 (= lt!180068 (array!22546 (store (arr!10741 _keys!658) i!548 k!778) (size!11093 _keys!658)))))

(declare-fun b!383370 () Bool)

(declare-fun res!218256 () Bool)

(assert (=> b!383370 (=> (not res!218256) (not e!232866))))

(assert (=> b!383370 (= res!218256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383371 () Bool)

(declare-fun e!232869 () Bool)

(declare-fun tp_is_empty!9319 () Bool)

(assert (=> b!383371 (= e!232869 tp_is_empty!9319)))

(declare-fun b!383372 () Bool)

(declare-fun res!218264 () Bool)

(assert (=> b!383372 (=> (not res!218264) (not e!232870))))

(declare-datatypes ((List!6162 0))(
  ( (Nil!6159) (Cons!6158 (h!7014 (_ BitVec 64)) (t!11312 List!6162)) )
))
(declare-fun arrayNoDuplicates!0 (array!22545 (_ BitVec 32) List!6162) Bool)

(assert (=> b!383372 (= res!218264 (arrayNoDuplicates!0 lt!180068 #b00000000000000000000000000000000 Nil!6159))))

(declare-fun b!383373 () Bool)

(declare-fun e!232871 () Bool)

(declare-fun mapRes!15543 () Bool)

(assert (=> b!383373 (= e!232871 (and e!232869 mapRes!15543))))

(declare-fun condMapEmpty!15543 () Bool)

(declare-datatypes ((V!13531 0))(
  ( (V!13532 (val!4704 Int)) )
))
(declare-datatypes ((ValueCell!4316 0))(
  ( (ValueCellFull!4316 (v!6901 V!13531)) (EmptyCell!4316) )
))
(declare-datatypes ((array!22547 0))(
  ( (array!22548 (arr!10742 (Array (_ BitVec 32) ValueCell!4316)) (size!11094 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22547)

(declare-fun mapDefault!15543 () ValueCell!4316)

