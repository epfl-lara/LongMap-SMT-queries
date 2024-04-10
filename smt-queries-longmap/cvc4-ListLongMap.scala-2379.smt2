; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37740 () Bool)

(assert start!37740)

(declare-fun b_free!8843 () Bool)

(declare-fun b_next!8843 () Bool)

(assert (=> start!37740 (= b_free!8843 (not b_next!8843))))

(declare-fun tp!31280 () Bool)

(declare-fun b_and!16085 () Bool)

(assert (=> start!37740 (= tp!31280 b_and!16085)))

(declare-fun b!387143 () Bool)

(declare-fun res!221149 () Bool)

(declare-fun e!234755 () Bool)

(assert (=> b!387143 (=> (not res!221149) (not e!234755))))

(declare-datatypes ((array!22923 0))(
  ( (array!22924 (arr!10930 (Array (_ BitVec 32) (_ BitVec 64))) (size!11282 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22923)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22923 (_ BitVec 32)) Bool)

(assert (=> b!387143 (= res!221149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15837 () Bool)

(declare-fun mapRes!15837 () Bool)

(declare-fun tp!31281 () Bool)

(declare-fun e!234754 () Bool)

(assert (=> mapNonEmpty!15837 (= mapRes!15837 (and tp!31281 e!234754))))

(declare-datatypes ((V!13791 0))(
  ( (V!13792 (val!4802 Int)) )
))
(declare-datatypes ((ValueCell!4414 0))(
  ( (ValueCellFull!4414 (v!6999 V!13791)) (EmptyCell!4414) )
))
(declare-fun mapValue!15837 () ValueCell!4414)

(declare-datatypes ((array!22925 0))(
  ( (array!22926 (arr!10931 (Array (_ BitVec 32) ValueCell!4414)) (size!11283 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22925)

(declare-fun mapKey!15837 () (_ BitVec 32))

(declare-fun mapRest!15837 () (Array (_ BitVec 32) ValueCell!4414))

(assert (=> mapNonEmpty!15837 (= (arr!10931 _values!506) (store mapRest!15837 mapKey!15837 mapValue!15837))))

(declare-fun b!387144 () Bool)

(declare-fun res!221150 () Bool)

(assert (=> b!387144 (=> (not res!221150) (not e!234755))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387144 (= res!221150 (or (= (select (arr!10930 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10930 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387145 () Bool)

(declare-fun res!221156 () Bool)

(assert (=> b!387145 (=> (not res!221156) (not e!234755))))

(assert (=> b!387145 (= res!221156 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11282 _keys!658))))))

(declare-fun b!387146 () Bool)

(declare-fun e!234753 () Bool)

(declare-fun tp_is_empty!9515 () Bool)

(assert (=> b!387146 (= e!234753 tp_is_empty!9515)))

(declare-fun res!221148 () Bool)

(assert (=> start!37740 (=> (not res!221148) (not e!234755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37740 (= res!221148 (validMask!0 mask!970))))

(assert (=> start!37740 e!234755))

(declare-fun e!234758 () Bool)

(declare-fun array_inv!8042 (array!22925) Bool)

(assert (=> start!37740 (and (array_inv!8042 _values!506) e!234758)))

(assert (=> start!37740 tp!31280))

(assert (=> start!37740 true))

(assert (=> start!37740 tp_is_empty!9515))

(declare-fun array_inv!8043 (array!22923) Bool)

(assert (=> start!37740 (array_inv!8043 _keys!658)))

(declare-fun b!387147 () Bool)

(declare-fun res!221152 () Bool)

(assert (=> b!387147 (=> (not res!221152) (not e!234755))))

(declare-datatypes ((List!6305 0))(
  ( (Nil!6302) (Cons!6301 (h!7157 (_ BitVec 64)) (t!11455 List!6305)) )
))
(declare-fun arrayNoDuplicates!0 (array!22923 (_ BitVec 32) List!6305) Bool)

(assert (=> b!387147 (= res!221152 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6302))))

(declare-fun b!387148 () Bool)

(assert (=> b!387148 (= e!234758 (and e!234753 mapRes!15837))))

(declare-fun condMapEmpty!15837 () Bool)

(declare-fun mapDefault!15837 () ValueCell!4414)

