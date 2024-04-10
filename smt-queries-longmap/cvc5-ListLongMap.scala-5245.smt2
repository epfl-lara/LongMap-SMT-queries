; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70570 () Bool)

(assert start!70570)

(declare-fun b_free!12877 () Bool)

(declare-fun b_next!12877 () Bool)

(assert (=> start!70570 (= b_free!12877 (not b_next!12877))))

(declare-fun tp!45367 () Bool)

(declare-fun b_and!21719 () Bool)

(assert (=> start!70570 (= tp!45367 b_and!21719)))

(declare-fun b!819791 () Bool)

(declare-fun res!559394 () Bool)

(declare-fun e!455327 () Bool)

(assert (=> b!819791 (=> (not res!559394) (not e!455327))))

(declare-datatypes ((array!45370 0))(
  ( (array!45371 (arr!21738 (Array (_ BitVec 32) (_ BitVec 64))) (size!22159 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45370)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24451 0))(
  ( (V!24452 (val!7341 Int)) )
))
(declare-datatypes ((ValueCell!6878 0))(
  ( (ValueCellFull!6878 (v!9771 V!24451)) (EmptyCell!6878) )
))
(declare-datatypes ((array!45372 0))(
  ( (array!45373 (arr!21739 (Array (_ BitVec 32) ValueCell!6878)) (size!22160 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45372)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819791 (= res!559394 (and (= (size!22160 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22159 _keys!976) (size!22160 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559389 () Bool)

(assert (=> start!70570 (=> (not res!559389) (not e!455327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70570 (= res!559389 (validMask!0 mask!1312))))

(assert (=> start!70570 e!455327))

(declare-fun tp_is_empty!14587 () Bool)

(assert (=> start!70570 tp_is_empty!14587))

(declare-fun array_inv!17375 (array!45370) Bool)

(assert (=> start!70570 (array_inv!17375 _keys!976)))

(assert (=> start!70570 true))

(declare-fun e!455325 () Bool)

(declare-fun array_inv!17376 (array!45372) Bool)

(assert (=> start!70570 (and (array_inv!17376 _values!788) e!455325)))

(assert (=> start!70570 tp!45367))

(declare-fun mapIsEmpty!23482 () Bool)

(declare-fun mapRes!23482 () Bool)

(assert (=> mapIsEmpty!23482 mapRes!23482))

(declare-fun b!819792 () Bool)

(declare-fun e!455330 () Bool)

(assert (=> b!819792 (= e!455330 tp_is_empty!14587)))

(declare-datatypes ((tuple2!9664 0))(
  ( (tuple2!9665 (_1!4843 (_ BitVec 64)) (_2!4843 V!24451)) )
))
(declare-datatypes ((List!15488 0))(
  ( (Nil!15485) (Cons!15484 (h!16613 tuple2!9664) (t!21819 List!15488)) )
))
(declare-datatypes ((ListLongMap!8487 0))(
  ( (ListLongMap!8488 (toList!4259 List!15488)) )
))
(declare-fun lt!368100 () ListLongMap!8487)

(declare-fun zeroValueAfter!34 () V!24451)

(declare-fun lt!368106 () ListLongMap!8487)

(declare-fun e!455326 () Bool)

(declare-fun b!819793 () Bool)

(declare-fun +!1854 (ListLongMap!8487 tuple2!9664) ListLongMap!8487)

(assert (=> b!819793 (= e!455326 (= lt!368100 (+!1854 lt!368106 (tuple2!9665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819794 () Bool)

(declare-fun res!559390 () Bool)

(assert (=> b!819794 (=> (not res!559390) (not e!455327))))

(declare-datatypes ((List!15489 0))(
  ( (Nil!15486) (Cons!15485 (h!16614 (_ BitVec 64)) (t!21820 List!15489)) )
))
(declare-fun arrayNoDuplicates!0 (array!45370 (_ BitVec 32) List!15489) Bool)

(assert (=> b!819794 (= res!559390 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15486))))

(declare-fun b!819795 () Bool)

(declare-fun e!455329 () Bool)

(assert (=> b!819795 (= e!455329 true)))

(declare-fun lt!368099 () tuple2!9664)

(declare-fun lt!368103 () tuple2!9664)

(declare-fun lt!368105 () ListLongMap!8487)

(assert (=> b!819795 (= lt!368105 (+!1854 (+!1854 lt!368106 lt!368103) lt!368099))))

(declare-fun lt!368104 () ListLongMap!8487)

(declare-fun lt!368098 () ListLongMap!8487)

(assert (=> b!819795 (= (+!1854 lt!368104 lt!368099) (+!1854 lt!368098 lt!368099))))

(declare-fun zeroValueBefore!34 () V!24451)

(declare-datatypes ((Unit!27997 0))(
  ( (Unit!27998) )
))
(declare-fun lt!368097 () Unit!27997)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!192 (ListLongMap!8487 (_ BitVec 64) V!24451 V!24451) Unit!27997)

(assert (=> b!819795 (= lt!368097 (addSameAsAddTwiceSameKeyDiffValues!192 lt!368104 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819795 (= lt!368099 (tuple2!9665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819795 e!455326))

(declare-fun res!559391 () Bool)

(assert (=> b!819795 (=> (not res!559391) (not e!455326))))

(declare-fun lt!368102 () ListLongMap!8487)

(assert (=> b!819795 (= res!559391 (= lt!368102 lt!368098))))

(assert (=> b!819795 (= lt!368098 (+!1854 lt!368104 lt!368103))))

(assert (=> b!819795 (= lt!368103 (tuple2!9665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24451)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2458 (array!45370 array!45372 (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 (_ BitVec 32) Int) ListLongMap!8487)

(assert (=> b!819795 (= lt!368100 (getCurrentListMap!2458 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819795 (= lt!368102 (getCurrentListMap!2458 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819796 () Bool)

(declare-fun e!455331 () Bool)

(assert (=> b!819796 (= e!455331 tp_is_empty!14587)))

(declare-fun b!819797 () Bool)

(assert (=> b!819797 (= e!455325 (and e!455330 mapRes!23482))))

(declare-fun condMapEmpty!23482 () Bool)

(declare-fun mapDefault!23482 () ValueCell!6878)

