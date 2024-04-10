; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37446 () Bool)

(assert start!37446)

(declare-fun b_free!8573 () Bool)

(declare-fun b_next!8573 () Bool)

(assert (=> start!37446 (= b_free!8573 (not b_next!8573))))

(declare-fun tp!30435 () Bool)

(declare-fun b_and!15815 () Bool)

(assert (=> start!37446 (= tp!30435 b_and!15815)))

(declare-fun res!216638 () Bool)

(declare-fun e!231836 () Bool)

(assert (=> start!37446 (=> (not res!216638) (not e!231836))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37446 (= res!216638 (validMask!0 mask!970))))

(assert (=> start!37446 e!231836))

(declare-datatypes ((V!13399 0))(
  ( (V!13400 (val!4655 Int)) )
))
(declare-datatypes ((ValueCell!4267 0))(
  ( (ValueCellFull!4267 (v!6852 V!13399)) (EmptyCell!4267) )
))
(declare-datatypes ((array!22357 0))(
  ( (array!22358 (arr!10647 (Array (_ BitVec 32) ValueCell!4267)) (size!10999 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22357)

(declare-fun e!231837 () Bool)

(declare-fun array_inv!7840 (array!22357) Bool)

(assert (=> start!37446 (and (array_inv!7840 _values!506) e!231837)))

(assert (=> start!37446 tp!30435))

(assert (=> start!37446 true))

(declare-fun tp_is_empty!9221 () Bool)

(assert (=> start!37446 tp_is_empty!9221))

(declare-datatypes ((array!22359 0))(
  ( (array!22360 (arr!10648 (Array (_ BitVec 32) (_ BitVec 64))) (size!11000 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22359)

(declare-fun array_inv!7841 (array!22359) Bool)

(assert (=> start!37446 (array_inv!7841 _keys!658)))

(declare-fun b!381310 () Bool)

(declare-fun e!231838 () Bool)

(assert (=> b!381310 (= e!231838 tp_is_empty!9221)))

(declare-fun b!381311 () Bool)

(declare-fun res!216642 () Bool)

(assert (=> b!381311 (=> (not res!216642) (not e!231836))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381311 (= res!216642 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15396 () Bool)

(declare-fun mapRes!15396 () Bool)

(declare-fun tp!30434 () Bool)

(assert (=> mapNonEmpty!15396 (= mapRes!15396 (and tp!30434 e!231838))))

(declare-fun mapValue!15396 () ValueCell!4267)

(declare-fun mapKey!15396 () (_ BitVec 32))

(declare-fun mapRest!15396 () (Array (_ BitVec 32) ValueCell!4267))

(assert (=> mapNonEmpty!15396 (= (arr!10647 _values!506) (store mapRest!15396 mapKey!15396 mapValue!15396))))

(declare-fun b!381312 () Bool)

(declare-fun e!231841 () Bool)

(assert (=> b!381312 (= e!231841 true)))

(declare-datatypes ((tuple2!6250 0))(
  ( (tuple2!6251 (_1!3136 (_ BitVec 64)) (_2!3136 V!13399)) )
))
(declare-datatypes ((List!6083 0))(
  ( (Nil!6080) (Cons!6079 (h!6935 tuple2!6250) (t!11233 List!6083)) )
))
(declare-datatypes ((ListLongMap!5163 0))(
  ( (ListLongMap!5164 (toList!2597 List!6083)) )
))
(declare-fun lt!178698 () ListLongMap!5163)

(declare-fun lt!178702 () ListLongMap!5163)

(assert (=> b!381312 (= lt!178698 lt!178702)))

(declare-fun b!381313 () Bool)

(declare-fun res!216645 () Bool)

(assert (=> b!381313 (=> (not res!216645) (not e!231836))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381313 (= res!216645 (or (= (select (arr!10648 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10648 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381314 () Bool)

(declare-fun res!216647 () Bool)

(assert (=> b!381314 (=> (not res!216647) (not e!231836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22359 (_ BitVec 32)) Bool)

(assert (=> b!381314 (= res!216647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381315 () Bool)

(declare-fun e!231840 () Bool)

(assert (=> b!381315 (= e!231837 (and e!231840 mapRes!15396))))

(declare-fun condMapEmpty!15396 () Bool)

(declare-fun mapDefault!15396 () ValueCell!4267)

