; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36684 () Bool)

(assert start!36684)

(declare-fun b!366199 () Bool)

(declare-fun e!224231 () Bool)

(declare-fun tp_is_empty!8507 () Bool)

(assert (=> b!366199 (= e!224231 tp_is_empty!8507)))

(declare-fun b!366200 () Bool)

(declare-fun res!204813 () Bool)

(declare-fun e!224232 () Bool)

(assert (=> b!366200 (=> (not res!204813) (not e!224232))))

(declare-datatypes ((array!20967 0))(
  ( (array!20968 (arr!9955 (Array (_ BitVec 32) (_ BitVec 64))) (size!10307 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20967)

(declare-datatypes ((List!5545 0))(
  ( (Nil!5542) (Cons!5541 (h!6397 (_ BitVec 64)) (t!10695 List!5545)) )
))
(declare-fun arrayNoDuplicates!0 (array!20967 (_ BitVec 32) List!5545) Bool)

(assert (=> b!366200 (= res!204813 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5542))))

(declare-fun mapIsEmpty!14316 () Bool)

(declare-fun mapRes!14316 () Bool)

(assert (=> mapIsEmpty!14316 mapRes!14316))

(declare-fun b!366201 () Bool)

(declare-fun res!204811 () Bool)

(assert (=> b!366201 (=> (not res!204811) (not e!224232))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366201 (= res!204811 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!204812 () Bool)

(assert (=> start!36684 (=> (not res!204812) (not e!224232))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36684 (= res!204812 (validMask!0 mask!970))))

(assert (=> start!36684 e!224232))

(assert (=> start!36684 true))

(declare-datatypes ((V!12447 0))(
  ( (V!12448 (val!4298 Int)) )
))
(declare-datatypes ((ValueCell!3910 0))(
  ( (ValueCellFull!3910 (v!6494 V!12447)) (EmptyCell!3910) )
))
(declare-datatypes ((array!20969 0))(
  ( (array!20970 (arr!9956 (Array (_ BitVec 32) ValueCell!3910)) (size!10308 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20969)

(declare-fun e!224233 () Bool)

(declare-fun array_inv!7362 (array!20969) Bool)

(assert (=> start!36684 (and (array_inv!7362 _values!506) e!224233)))

(declare-fun array_inv!7363 (array!20967) Bool)

(assert (=> start!36684 (array_inv!7363 _keys!658)))

(declare-fun b!366202 () Bool)

(declare-fun res!204810 () Bool)

(assert (=> b!366202 (=> (not res!204810) (not e!224232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20967 (_ BitVec 32)) Bool)

(assert (=> b!366202 (= res!204810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14316 () Bool)

(declare-fun tp!28392 () Bool)

(assert (=> mapNonEmpty!14316 (= mapRes!14316 (and tp!28392 e!224231))))

(declare-fun mapKey!14316 () (_ BitVec 32))

(declare-fun mapValue!14316 () ValueCell!3910)

(declare-fun mapRest!14316 () (Array (_ BitVec 32) ValueCell!3910))

(assert (=> mapNonEmpty!14316 (= (arr!9956 _values!506) (store mapRest!14316 mapKey!14316 mapValue!14316))))

(declare-fun b!366203 () Bool)

(declare-fun e!224234 () Bool)

(assert (=> b!366203 (= e!224234 tp_is_empty!8507)))

(declare-fun b!366204 () Bool)

(declare-fun res!204807 () Bool)

(assert (=> b!366204 (=> (not res!204807) (not e!224232))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366204 (= res!204807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20968 (store (arr!9955 _keys!658) i!548 k!778) (size!10307 _keys!658)) mask!970))))

(declare-fun b!366205 () Bool)

(declare-fun res!204809 () Bool)

(assert (=> b!366205 (=> (not res!204809) (not e!224232))))

(assert (=> b!366205 (= res!204809 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10307 _keys!658))))))

(declare-fun b!366206 () Bool)

(declare-fun res!204805 () Bool)

(assert (=> b!366206 (=> (not res!204805) (not e!224232))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366206 (= res!204805 (and (= (size!10308 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10307 _keys!658) (size!10308 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366207 () Bool)

(assert (=> b!366207 (= e!224233 (and e!224234 mapRes!14316))))

(declare-fun condMapEmpty!14316 () Bool)

(declare-fun mapDefault!14316 () ValueCell!3910)

