; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37350 () Bool)

(assert start!37350)

(declare-fun b_free!8477 () Bool)

(declare-fun b_next!8477 () Bool)

(assert (=> start!37350 (= b_free!8477 (not b_next!8477))))

(declare-fun tp!30146 () Bool)

(declare-fun b_and!15719 () Bool)

(assert (=> start!37350 (= tp!30146 b_and!15719)))

(declare-fun b!379185 () Bool)

(declare-fun res!214951 () Bool)

(declare-fun e!230725 () Bool)

(assert (=> b!379185 (=> (not res!214951) (not e!230725))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22173 0))(
  ( (array!22174 (arr!10555 (Array (_ BitVec 32) (_ BitVec 64))) (size!10907 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22173)

(assert (=> b!379185 (= res!214951 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10907 _keys!658))))))

(declare-fun b!379186 () Bool)

(declare-fun res!214949 () Bool)

(assert (=> b!379186 (=> (not res!214949) (not e!230725))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13271 0))(
  ( (V!13272 (val!4607 Int)) )
))
(declare-datatypes ((ValueCell!4219 0))(
  ( (ValueCellFull!4219 (v!6804 V!13271)) (EmptyCell!4219) )
))
(declare-datatypes ((array!22175 0))(
  ( (array!22176 (arr!10556 (Array (_ BitVec 32) ValueCell!4219)) (size!10908 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22175)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!379186 (= res!214949 (and (= (size!10908 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10907 _keys!658) (size!10908 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379187 () Bool)

(declare-fun e!230722 () Bool)

(declare-fun tp_is_empty!9125 () Bool)

(assert (=> b!379187 (= e!230722 tp_is_empty!9125)))

(declare-fun b!379188 () Bool)

(declare-fun e!230721 () Bool)

(declare-fun e!230723 () Bool)

(assert (=> b!379188 (= e!230721 e!230723)))

(declare-fun res!214950 () Bool)

(assert (=> b!379188 (=> res!214950 e!230723)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!379188 (= res!214950 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6162 0))(
  ( (tuple2!6163 (_1!3092 (_ BitVec 64)) (_2!3092 V!13271)) )
))
(declare-datatypes ((List!5998 0))(
  ( (Nil!5995) (Cons!5994 (h!6850 tuple2!6162) (t!11148 List!5998)) )
))
(declare-datatypes ((ListLongMap!5075 0))(
  ( (ListLongMap!5076 (toList!2553 List!5998)) )
))
(declare-fun lt!176971 () ListLongMap!5075)

(declare-fun lt!176969 () ListLongMap!5075)

(assert (=> b!379188 (= lt!176971 lt!176969)))

(declare-fun lt!176964 () ListLongMap!5075)

(declare-fun lt!176967 () tuple2!6162)

(declare-fun +!899 (ListLongMap!5075 tuple2!6162) ListLongMap!5075)

(assert (=> b!379188 (= lt!176969 (+!899 lt!176964 lt!176967))))

(declare-fun lt!176973 () ListLongMap!5075)

(declare-fun lt!176976 () ListLongMap!5075)

(assert (=> b!379188 (= lt!176973 lt!176976)))

(declare-fun lt!176966 () ListLongMap!5075)

(assert (=> b!379188 (= lt!176976 (+!899 lt!176966 lt!176967))))

(declare-fun lt!176975 () ListLongMap!5075)

(assert (=> b!379188 (= lt!176973 (+!899 lt!176975 lt!176967))))

(declare-fun minValue!472 () V!13271)

(assert (=> b!379188 (= lt!176967 (tuple2!6163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379189 () Bool)

(declare-fun res!214944 () Bool)

(assert (=> b!379189 (=> (not res!214944) (not e!230725))))

(declare-fun arrayContainsKey!0 (array!22173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379189 (= res!214944 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379190 () Bool)

(declare-fun res!214947 () Bool)

(assert (=> b!379190 (=> (not res!214947) (not e!230725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379190 (= res!214947 (validKeyInArray!0 k!778))))

(declare-fun b!379191 () Bool)

(declare-fun e!230724 () Bool)

(assert (=> b!379191 (= e!230725 e!230724)))

(declare-fun res!214945 () Bool)

(assert (=> b!379191 (=> (not res!214945) (not e!230724))))

(declare-fun lt!176965 () array!22173)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22173 (_ BitVec 32)) Bool)

(assert (=> b!379191 (= res!214945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176965 mask!970))))

(assert (=> b!379191 (= lt!176965 (array!22174 (store (arr!10555 _keys!658) i!548 k!778) (size!10907 _keys!658)))))

(declare-fun b!379192 () Bool)

(assert (=> b!379192 (= e!230724 (not e!230721))))

(declare-fun res!214952 () Bool)

(assert (=> b!379192 (=> res!214952 e!230721)))

(assert (=> b!379192 (= res!214952 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!13271)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1976 (array!22173 array!22175 (_ BitVec 32) (_ BitVec 32) V!13271 V!13271 (_ BitVec 32) Int) ListLongMap!5075)

(assert (=> b!379192 (= lt!176971 (getCurrentListMap!1976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176974 () array!22175)

(assert (=> b!379192 (= lt!176973 (getCurrentListMap!1976 lt!176965 lt!176974 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379192 (and (= lt!176975 lt!176966) (= lt!176966 lt!176975))))

(declare-fun lt!176970 () tuple2!6162)

(assert (=> b!379192 (= lt!176966 (+!899 lt!176964 lt!176970))))

(declare-fun v!373 () V!13271)

(assert (=> b!379192 (= lt!176970 (tuple2!6163 k!778 v!373))))

(declare-datatypes ((Unit!11696 0))(
  ( (Unit!11697) )
))
(declare-fun lt!176972 () Unit!11696)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!134 (array!22173 array!22175 (_ BitVec 32) (_ BitVec 32) V!13271 V!13271 (_ BitVec 32) (_ BitVec 64) V!13271 (_ BitVec 32) Int) Unit!11696)

(assert (=> b!379192 (= lt!176972 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!134 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!810 (array!22173 array!22175 (_ BitVec 32) (_ BitVec 32) V!13271 V!13271 (_ BitVec 32) Int) ListLongMap!5075)

(assert (=> b!379192 (= lt!176975 (getCurrentListMapNoExtraKeys!810 lt!176965 lt!176974 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379192 (= lt!176974 (array!22176 (store (arr!10556 _values!506) i!548 (ValueCellFull!4219 v!373)) (size!10908 _values!506)))))

(assert (=> b!379192 (= lt!176964 (getCurrentListMapNoExtraKeys!810 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379193 () Bool)

(declare-fun e!230720 () Bool)

(assert (=> b!379193 (= e!230720 tp_is_empty!9125)))

(declare-fun b!379195 () Bool)

(declare-fun res!214953 () Bool)

(assert (=> b!379195 (=> (not res!214953) (not e!230725))))

(declare-datatypes ((List!5999 0))(
  ( (Nil!5996) (Cons!5995 (h!6851 (_ BitVec 64)) (t!11149 List!5999)) )
))
(declare-fun arrayNoDuplicates!0 (array!22173 (_ BitVec 32) List!5999) Bool)

(assert (=> b!379195 (= res!214953 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5996))))

(declare-fun b!379196 () Bool)

(declare-fun res!214946 () Bool)

(assert (=> b!379196 (=> (not res!214946) (not e!230725))))

(assert (=> b!379196 (= res!214946 (or (= (select (arr!10555 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10555 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15252 () Bool)

(declare-fun mapRes!15252 () Bool)

(assert (=> mapIsEmpty!15252 mapRes!15252))

(declare-fun b!379197 () Bool)

(assert (=> b!379197 (= e!230723 true)))

(assert (=> b!379197 (= lt!176976 (+!899 lt!176969 lt!176970))))

(declare-fun lt!176968 () Unit!11696)

(declare-fun addCommutativeForDiffKeys!298 (ListLongMap!5075 (_ BitVec 64) V!13271 (_ BitVec 64) V!13271) Unit!11696)

(assert (=> b!379197 (= lt!176968 (addCommutativeForDiffKeys!298 lt!176964 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15252 () Bool)

(declare-fun tp!30147 () Bool)

(assert (=> mapNonEmpty!15252 (= mapRes!15252 (and tp!30147 e!230722))))

(declare-fun mapValue!15252 () ValueCell!4219)

(declare-fun mapKey!15252 () (_ BitVec 32))

(declare-fun mapRest!15252 () (Array (_ BitVec 32) ValueCell!4219))

(assert (=> mapNonEmpty!15252 (= (arr!10556 _values!506) (store mapRest!15252 mapKey!15252 mapValue!15252))))

(declare-fun b!379198 () Bool)

(declare-fun res!214948 () Bool)

(assert (=> b!379198 (=> (not res!214948) (not e!230725))))

(assert (=> b!379198 (= res!214948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379199 () Bool)

(declare-fun e!230719 () Bool)

(assert (=> b!379199 (= e!230719 (and e!230720 mapRes!15252))))

(declare-fun condMapEmpty!15252 () Bool)

(declare-fun mapDefault!15252 () ValueCell!4219)

