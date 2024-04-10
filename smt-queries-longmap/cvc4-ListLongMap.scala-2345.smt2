; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37536 () Bool)

(assert start!37536)

(declare-fun b_free!8663 () Bool)

(declare-fun b_next!8663 () Bool)

(assert (=> start!37536 (= b_free!8663 (not b_next!8663))))

(declare-fun tp!30704 () Bool)

(declare-fun b_and!15905 () Bool)

(assert (=> start!37536 (= tp!30704 b_and!15905)))

(declare-fun b!383200 () Bool)

(declare-fun res!218131 () Bool)

(declare-fun e!232781 () Bool)

(assert (=> b!383200 (=> (not res!218131) (not e!232781))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13519 0))(
  ( (V!13520 (val!4700 Int)) )
))
(declare-datatypes ((ValueCell!4312 0))(
  ( (ValueCellFull!4312 (v!6897 V!13519)) (EmptyCell!4312) )
))
(declare-datatypes ((array!22529 0))(
  ( (array!22530 (arr!10733 (Array (_ BitVec 32) ValueCell!4312)) (size!11085 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22529)

(declare-datatypes ((array!22531 0))(
  ( (array!22532 (arr!10734 (Array (_ BitVec 32) (_ BitVec 64))) (size!11086 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22531)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383200 (= res!218131 (and (= (size!11085 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11086 _keys!658) (size!11085 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383201 () Bool)

(declare-fun res!218127 () Bool)

(assert (=> b!383201 (=> (not res!218127) (not e!232781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22531 (_ BitVec 32)) Bool)

(assert (=> b!383201 (= res!218127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15531 () Bool)

(declare-fun mapRes!15531 () Bool)

(declare-fun tp!30705 () Bool)

(declare-fun e!232782 () Bool)

(assert (=> mapNonEmpty!15531 (= mapRes!15531 (and tp!30705 e!232782))))

(declare-fun mapRest!15531 () (Array (_ BitVec 32) ValueCell!4312))

(declare-fun mapValue!15531 () ValueCell!4312)

(declare-fun mapKey!15531 () (_ BitVec 32))

(assert (=> mapNonEmpty!15531 (= (arr!10733 _values!506) (store mapRest!15531 mapKey!15531 mapValue!15531))))

(declare-fun b!383202 () Bool)

(declare-fun e!232783 () Bool)

(declare-fun tp_is_empty!9311 () Bool)

(assert (=> b!383202 (= e!232783 tp_is_empty!9311)))

(declare-fun b!383203 () Bool)

(assert (=> b!383203 (= e!232782 tp_is_empty!9311)))

(declare-fun b!383204 () Bool)

(declare-fun res!218126 () Bool)

(assert (=> b!383204 (=> (not res!218126) (not e!232781))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383204 (= res!218126 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15531 () Bool)

(assert (=> mapIsEmpty!15531 mapRes!15531))

(declare-fun b!383206 () Bool)

(declare-fun res!218125 () Bool)

(declare-fun e!232787 () Bool)

(assert (=> b!383206 (=> (not res!218125) (not e!232787))))

(declare-fun lt!179929 () array!22531)

(declare-datatypes ((List!6155 0))(
  ( (Nil!6152) (Cons!6151 (h!7007 (_ BitVec 64)) (t!11305 List!6155)) )
))
(declare-fun arrayNoDuplicates!0 (array!22531 (_ BitVec 32) List!6155) Bool)

(assert (=> b!383206 (= res!218125 (arrayNoDuplicates!0 lt!179929 #b00000000000000000000000000000000 Nil!6152))))

(declare-fun b!383207 () Bool)

(declare-fun res!218128 () Bool)

(assert (=> b!383207 (=> (not res!218128) (not e!232781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383207 (= res!218128 (validKeyInArray!0 k!778))))

(declare-fun b!383208 () Bool)

(declare-fun e!232786 () Bool)

(assert (=> b!383208 (= e!232786 (and e!232783 mapRes!15531))))

(declare-fun condMapEmpty!15531 () Bool)

(declare-fun mapDefault!15531 () ValueCell!4312)

