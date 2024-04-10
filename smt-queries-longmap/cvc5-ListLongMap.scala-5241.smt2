; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70526 () Bool)

(assert start!70526)

(declare-fun b_free!12853 () Bool)

(declare-fun b_next!12853 () Bool)

(assert (=> start!70526 (= b_free!12853 (not b_next!12853))))

(declare-fun tp!45291 () Bool)

(declare-fun b_and!21683 () Bool)

(assert (=> start!70526 (= tp!45291 b_and!21683)))

(declare-fun b!819275 () Bool)

(declare-fun e!454958 () Bool)

(declare-fun tp_is_empty!14563 () Bool)

(assert (=> b!819275 (= e!454958 tp_is_empty!14563)))

(declare-fun b!819276 () Bool)

(declare-fun e!454955 () Bool)

(declare-fun e!454952 () Bool)

(assert (=> b!819276 (= e!454955 (not e!454952))))

(declare-fun res!559083 () Bool)

(assert (=> b!819276 (=> res!559083 e!454952)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819276 (= res!559083 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24419 0))(
  ( (V!24420 (val!7329 Int)) )
))
(declare-datatypes ((tuple2!9642 0))(
  ( (tuple2!9643 (_1!4832 (_ BitVec 64)) (_2!4832 V!24419)) )
))
(declare-datatypes ((List!15471 0))(
  ( (Nil!15468) (Cons!15467 (h!16596 tuple2!9642) (t!21800 List!15471)) )
))
(declare-datatypes ((ListLongMap!8465 0))(
  ( (ListLongMap!8466 (toList!4248 List!15471)) )
))
(declare-fun lt!367589 () ListLongMap!8465)

(declare-fun lt!367583 () ListLongMap!8465)

(assert (=> b!819276 (= lt!367589 lt!367583)))

(declare-datatypes ((Unit!27973 0))(
  ( (Unit!27974) )
))
(declare-fun lt!367587 () Unit!27973)

(declare-fun zeroValueBefore!34 () V!24419)

(declare-datatypes ((array!45322 0))(
  ( (array!45323 (arr!21715 (Array (_ BitVec 32) (_ BitVec 64))) (size!22136 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45322)

(declare-fun zeroValueAfter!34 () V!24419)

(declare-fun minValue!754 () V!24419)

(declare-datatypes ((ValueCell!6866 0))(
  ( (ValueCellFull!6866 (v!9758 V!24419)) (EmptyCell!6866) )
))
(declare-datatypes ((array!45324 0))(
  ( (array!45325 (arr!21716 (Array (_ BitVec 32) ValueCell!6866)) (size!22137 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45324)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!391 (array!45322 array!45324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 V!24419 V!24419 (_ BitVec 32) Int) Unit!27973)

(assert (=> b!819276 (= lt!367587 (lemmaNoChangeToArrayThenSameMapNoExtras!391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2281 (array!45322 array!45324 (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 (_ BitVec 32) Int) ListLongMap!8465)

(assert (=> b!819276 (= lt!367583 (getCurrentListMapNoExtraKeys!2281 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819276 (= lt!367589 (getCurrentListMapNoExtraKeys!2281 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819277 () Bool)

(declare-fun e!454956 () Bool)

(declare-fun mapRes!23443 () Bool)

(assert (=> b!819277 (= e!454956 (and e!454958 mapRes!23443))))

(declare-fun condMapEmpty!23443 () Bool)

(declare-fun mapDefault!23443 () ValueCell!6866)

