; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37746 () Bool)

(assert start!37746)

(declare-fun b_free!8849 () Bool)

(declare-fun b_next!8849 () Bool)

(assert (=> start!37746 (= b_free!8849 (not b_next!8849))))

(declare-fun tp!31299 () Bool)

(declare-fun b_and!16091 () Bool)

(assert (=> start!37746 (= tp!31299 b_and!16091)))

(declare-fun mapIsEmpty!15846 () Bool)

(declare-fun mapRes!15846 () Bool)

(assert (=> mapIsEmpty!15846 mapRes!15846))

(declare-fun res!221243 () Bool)

(declare-fun e!234807 () Bool)

(assert (=> start!37746 (=> (not res!221243) (not e!234807))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37746 (= res!221243 (validMask!0 mask!970))))

(assert (=> start!37746 e!234807))

(declare-datatypes ((V!13799 0))(
  ( (V!13800 (val!4805 Int)) )
))
(declare-datatypes ((ValueCell!4417 0))(
  ( (ValueCellFull!4417 (v!7002 V!13799)) (EmptyCell!4417) )
))
(declare-datatypes ((array!22935 0))(
  ( (array!22936 (arr!10936 (Array (_ BitVec 32) ValueCell!4417)) (size!11288 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22935)

(declare-fun e!234809 () Bool)

(declare-fun array_inv!8048 (array!22935) Bool)

(assert (=> start!37746 (and (array_inv!8048 _values!506) e!234809)))

(assert (=> start!37746 tp!31299))

(assert (=> start!37746 true))

(declare-fun tp_is_empty!9521 () Bool)

(assert (=> start!37746 tp_is_empty!9521))

(declare-datatypes ((array!22937 0))(
  ( (array!22938 (arr!10937 (Array (_ BitVec 32) (_ BitVec 64))) (size!11289 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22937)

(declare-fun array_inv!8049 (array!22937) Bool)

(assert (=> start!37746 (array_inv!8049 _keys!658)))

(declare-fun b!387260 () Bool)

(declare-fun e!234811 () Bool)

(assert (=> b!387260 (= e!234811 false)))

(declare-fun lt!181997 () array!22937)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6460 0))(
  ( (tuple2!6461 (_1!3241 (_ BitVec 64)) (_2!3241 V!13799)) )
))
(declare-datatypes ((List!6310 0))(
  ( (Nil!6307) (Cons!6306 (h!7162 tuple2!6460) (t!11460 List!6310)) )
))
(declare-datatypes ((ListLongMap!5373 0))(
  ( (ListLongMap!5374 (toList!2702 List!6310)) )
))
(declare-fun lt!181996 () ListLongMap!5373)

(declare-fun zeroValue!472 () V!13799)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13799)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13799)

(declare-fun getCurrentListMapNoExtraKeys!931 (array!22937 array!22935 (_ BitVec 32) (_ BitVec 32) V!13799 V!13799 (_ BitVec 32) Int) ListLongMap!5373)

(assert (=> b!387260 (= lt!181996 (getCurrentListMapNoExtraKeys!931 lt!181997 (array!22936 (store (arr!10936 _values!506) i!548 (ValueCellFull!4417 v!373)) (size!11288 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181998 () ListLongMap!5373)

(assert (=> b!387260 (= lt!181998 (getCurrentListMapNoExtraKeys!931 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387261 () Bool)

(declare-fun res!221240 () Bool)

(assert (=> b!387261 (=> (not res!221240) (not e!234807))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387261 (= res!221240 (validKeyInArray!0 k!778))))

(declare-fun b!387262 () Bool)

(declare-fun e!234810 () Bool)

(assert (=> b!387262 (= e!234810 tp_is_empty!9521)))

(declare-fun b!387263 () Bool)

(declare-fun e!234812 () Bool)

(assert (=> b!387263 (= e!234812 tp_is_empty!9521)))

(declare-fun b!387264 () Bool)

(declare-fun res!221241 () Bool)

(assert (=> b!387264 (=> (not res!221241) (not e!234807))))

(declare-datatypes ((List!6311 0))(
  ( (Nil!6308) (Cons!6307 (h!7163 (_ BitVec 64)) (t!11461 List!6311)) )
))
(declare-fun arrayNoDuplicates!0 (array!22937 (_ BitVec 32) List!6311) Bool)

(assert (=> b!387264 (= res!221241 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6308))))

(declare-fun b!387265 () Bool)

(declare-fun res!221237 () Bool)

(assert (=> b!387265 (=> (not res!221237) (not e!234807))))

(assert (=> b!387265 (= res!221237 (and (= (size!11288 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11289 _keys!658) (size!11288 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387266 () Bool)

(declare-fun res!221244 () Bool)

(assert (=> b!387266 (=> (not res!221244) (not e!234807))))

(declare-fun arrayContainsKey!0 (array!22937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387266 (= res!221244 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387267 () Bool)

(assert (=> b!387267 (= e!234809 (and e!234810 mapRes!15846))))

(declare-fun condMapEmpty!15846 () Bool)

(declare-fun mapDefault!15846 () ValueCell!4417)

