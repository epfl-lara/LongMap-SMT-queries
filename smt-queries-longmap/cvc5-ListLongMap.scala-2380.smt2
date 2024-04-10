; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37742 () Bool)

(assert start!37742)

(declare-fun b_free!8845 () Bool)

(declare-fun b_next!8845 () Bool)

(assert (=> start!37742 (= b_free!8845 (not b_next!8845))))

(declare-fun tp!31286 () Bool)

(declare-fun b_and!16087 () Bool)

(assert (=> start!37742 (= tp!31286 b_and!16087)))

(declare-fun b!387182 () Bool)

(declare-fun e!234772 () Bool)

(declare-fun tp_is_empty!9517 () Bool)

(assert (=> b!387182 (= e!234772 tp_is_empty!9517)))

(declare-fun b!387183 () Bool)

(declare-fun res!221183 () Bool)

(declare-fun e!234775 () Bool)

(assert (=> b!387183 (=> (not res!221183) (not e!234775))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22927 0))(
  ( (array!22928 (arr!10932 (Array (_ BitVec 32) (_ BitVec 64))) (size!11284 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22927)

(assert (=> b!387183 (= res!221183 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11284 _keys!658))))))

(declare-fun b!387184 () Bool)

(declare-fun res!221185 () Bool)

(declare-fun e!234774 () Bool)

(assert (=> b!387184 (=> (not res!221185) (not e!234774))))

(declare-fun lt!181980 () array!22927)

(declare-datatypes ((List!6306 0))(
  ( (Nil!6303) (Cons!6302 (h!7158 (_ BitVec 64)) (t!11456 List!6306)) )
))
(declare-fun arrayNoDuplicates!0 (array!22927 (_ BitVec 32) List!6306) Bool)

(assert (=> b!387184 (= res!221185 (arrayNoDuplicates!0 lt!181980 #b00000000000000000000000000000000 Nil!6303))))

(declare-fun b!387185 () Bool)

(declare-fun res!221178 () Bool)

(assert (=> b!387185 (=> (not res!221178) (not e!234775))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387185 (= res!221178 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!221177 () Bool)

(assert (=> start!37742 (=> (not res!221177) (not e!234775))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37742 (= res!221177 (validMask!0 mask!970))))

(assert (=> start!37742 e!234775))

(declare-datatypes ((V!13795 0))(
  ( (V!13796 (val!4803 Int)) )
))
(declare-datatypes ((ValueCell!4415 0))(
  ( (ValueCellFull!4415 (v!7000 V!13795)) (EmptyCell!4415) )
))
(declare-datatypes ((array!22929 0))(
  ( (array!22930 (arr!10933 (Array (_ BitVec 32) ValueCell!4415)) (size!11285 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22929)

(declare-fun e!234771 () Bool)

(declare-fun array_inv!8044 (array!22929) Bool)

(assert (=> start!37742 (and (array_inv!8044 _values!506) e!234771)))

(assert (=> start!37742 tp!31286))

(assert (=> start!37742 true))

(assert (=> start!37742 tp_is_empty!9517))

(declare-fun array_inv!8045 (array!22927) Bool)

(assert (=> start!37742 (array_inv!8045 _keys!658)))

(declare-fun b!387186 () Bool)

(declare-fun res!221179 () Bool)

(assert (=> b!387186 (=> (not res!221179) (not e!234775))))

(assert (=> b!387186 (= res!221179 (or (= (select (arr!10932 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10932 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387187 () Bool)

(declare-fun res!221186 () Bool)

(assert (=> b!387187 (=> (not res!221186) (not e!234775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387187 (= res!221186 (validKeyInArray!0 k!778))))

(declare-fun b!387188 () Bool)

(declare-fun res!221182 () Bool)

(assert (=> b!387188 (=> (not res!221182) (not e!234775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22927 (_ BitVec 32)) Bool)

(assert (=> b!387188 (= res!221182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15840 () Bool)

(declare-fun mapRes!15840 () Bool)

(declare-fun tp!31287 () Bool)

(declare-fun e!234773 () Bool)

(assert (=> mapNonEmpty!15840 (= mapRes!15840 (and tp!31287 e!234773))))

(declare-fun mapRest!15840 () (Array (_ BitVec 32) ValueCell!4415))

(declare-fun mapValue!15840 () ValueCell!4415)

(declare-fun mapKey!15840 () (_ BitVec 32))

(assert (=> mapNonEmpty!15840 (= (arr!10933 _values!506) (store mapRest!15840 mapKey!15840 mapValue!15840))))

(declare-fun mapIsEmpty!15840 () Bool)

(assert (=> mapIsEmpty!15840 mapRes!15840))

(declare-fun b!387189 () Bool)

(assert (=> b!387189 (= e!234774 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6456 0))(
  ( (tuple2!6457 (_1!3239 (_ BitVec 64)) (_2!3239 V!13795)) )
))
(declare-datatypes ((List!6307 0))(
  ( (Nil!6304) (Cons!6303 (h!7159 tuple2!6456) (t!11457 List!6307)) )
))
(declare-datatypes ((ListLongMap!5369 0))(
  ( (ListLongMap!5370 (toList!2700 List!6307)) )
))
(declare-fun lt!181979 () ListLongMap!5369)

(declare-fun zeroValue!472 () V!13795)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13795)

(declare-fun minValue!472 () V!13795)

(declare-fun getCurrentListMapNoExtraKeys!929 (array!22927 array!22929 (_ BitVec 32) (_ BitVec 32) V!13795 V!13795 (_ BitVec 32) Int) ListLongMap!5369)

(assert (=> b!387189 (= lt!181979 (getCurrentListMapNoExtraKeys!929 lt!181980 (array!22930 (store (arr!10933 _values!506) i!548 (ValueCellFull!4415 v!373)) (size!11285 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181978 () ListLongMap!5369)

(assert (=> b!387189 (= lt!181978 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387190 () Bool)

(assert (=> b!387190 (= e!234775 e!234774)))

(declare-fun res!221184 () Bool)

(assert (=> b!387190 (=> (not res!221184) (not e!234774))))

(assert (=> b!387190 (= res!221184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181980 mask!970))))

(assert (=> b!387190 (= lt!181980 (array!22928 (store (arr!10932 _keys!658) i!548 k!778) (size!11284 _keys!658)))))

(declare-fun b!387191 () Bool)

(declare-fun res!221180 () Bool)

(assert (=> b!387191 (=> (not res!221180) (not e!234775))))

(assert (=> b!387191 (= res!221180 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6303))))

(declare-fun b!387192 () Bool)

(assert (=> b!387192 (= e!234773 tp_is_empty!9517)))

(declare-fun b!387193 () Bool)

(assert (=> b!387193 (= e!234771 (and e!234772 mapRes!15840))))

(declare-fun condMapEmpty!15840 () Bool)

(declare-fun mapDefault!15840 () ValueCell!4415)

