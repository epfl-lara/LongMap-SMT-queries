; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37278 () Bool)

(assert start!37278)

(declare-fun b_free!8405 () Bool)

(declare-fun b_next!8405 () Bool)

(assert (=> start!37278 (= b_free!8405 (not b_next!8405))))

(declare-fun tp!29931 () Bool)

(declare-fun b_and!15647 () Bool)

(assert (=> start!37278 (= tp!29931 b_and!15647)))

(declare-fun mapNonEmpty!15144 () Bool)

(declare-fun mapRes!15144 () Bool)

(declare-fun tp!29930 () Bool)

(declare-fun e!229859 () Bool)

(assert (=> mapNonEmpty!15144 (= mapRes!15144 (and tp!29930 e!229859))))

(declare-datatypes ((V!13175 0))(
  ( (V!13176 (val!4571 Int)) )
))
(declare-datatypes ((ValueCell!4183 0))(
  ( (ValueCellFull!4183 (v!6768 V!13175)) (EmptyCell!4183) )
))
(declare-datatypes ((array!22035 0))(
  ( (array!22036 (arr!10486 (Array (_ BitVec 32) ValueCell!4183)) (size!10838 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22035)

(declare-fun mapRest!15144 () (Array (_ BitVec 32) ValueCell!4183))

(declare-fun mapValue!15144 () ValueCell!4183)

(declare-fun mapKey!15144 () (_ BitVec 32))

(assert (=> mapNonEmpty!15144 (= (arr!10486 _values!506) (store mapRest!15144 mapKey!15144 mapValue!15144))))

(declare-fun b!377556 () Bool)

(declare-fun e!229860 () Bool)

(declare-fun e!229861 () Bool)

(assert (=> b!377556 (= e!229860 e!229861)))

(declare-fun res!213647 () Bool)

(assert (=> b!377556 (=> (not res!213647) (not e!229861))))

(declare-datatypes ((array!22037 0))(
  ( (array!22038 (arr!10487 (Array (_ BitVec 32) (_ BitVec 64))) (size!10839 (_ BitVec 32))) )
))
(declare-fun lt!175604 () array!22037)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22037 (_ BitVec 32)) Bool)

(assert (=> b!377556 (= res!213647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175604 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22037)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377556 (= lt!175604 (array!22038 (store (arr!10487 _keys!658) i!548 k!778) (size!10839 _keys!658)))))

(declare-fun b!377557 () Bool)

(declare-fun e!229857 () Bool)

(assert (=> b!377557 (= e!229857 true)))

(declare-datatypes ((tuple2!6096 0))(
  ( (tuple2!6097 (_1!3059 (_ BitVec 64)) (_2!3059 V!13175)) )
))
(declare-datatypes ((List!5936 0))(
  ( (Nil!5933) (Cons!5932 (h!6788 tuple2!6096) (t!11086 List!5936)) )
))
(declare-datatypes ((ListLongMap!5009 0))(
  ( (ListLongMap!5010 (toList!2520 List!5936)) )
))
(declare-fun lt!175601 () ListLongMap!5009)

(declare-fun lt!175607 () ListLongMap!5009)

(declare-fun lt!175606 () tuple2!6096)

(declare-fun +!866 (ListLongMap!5009 tuple2!6096) ListLongMap!5009)

(assert (=> b!377557 (= lt!175601 (+!866 lt!175607 lt!175606))))

(declare-fun v!373 () V!13175)

(declare-fun zeroValue!472 () V!13175)

(declare-fun lt!175602 () ListLongMap!5009)

(declare-datatypes ((Unit!11634 0))(
  ( (Unit!11635) )
))
(declare-fun lt!175598 () Unit!11634)

(declare-fun addCommutativeForDiffKeys!274 (ListLongMap!5009 (_ BitVec 64) V!13175 (_ BitVec 64) V!13175) Unit!11634)

(assert (=> b!377557 (= lt!175598 (addCommutativeForDiffKeys!274 lt!175602 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377558 () Bool)

(declare-fun tp_is_empty!9053 () Bool)

(assert (=> b!377558 (= e!229859 tp_is_empty!9053)))

(declare-fun b!377559 () Bool)

(declare-fun e!229856 () Bool)

(declare-fun e!229855 () Bool)

(assert (=> b!377559 (= e!229856 (and e!229855 mapRes!15144))))

(declare-fun condMapEmpty!15144 () Bool)

(declare-fun mapDefault!15144 () ValueCell!4183)

