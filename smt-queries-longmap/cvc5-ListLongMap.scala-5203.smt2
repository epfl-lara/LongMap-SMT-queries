; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70232 () Bool)

(assert start!70232)

(declare-fun b_free!12625 () Bool)

(declare-fun b_next!12625 () Bool)

(assert (=> start!70232 (= b_free!12625 (not b_next!12625))))

(declare-fun tp!44595 () Bool)

(declare-fun b_and!21413 () Bool)

(assert (=> start!70232 (= tp!44595 b_and!21413)))

(declare-fun b!815943 () Bool)

(declare-fun e!452536 () Bool)

(declare-fun e!452535 () Bool)

(assert (=> b!815943 (= e!452536 (not e!452535))))

(declare-fun res!557129 () Bool)

(assert (=> b!815943 (=> res!557129 e!452535)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815943 (= res!557129 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24115 0))(
  ( (V!24116 (val!7215 Int)) )
))
(declare-datatypes ((tuple2!9470 0))(
  ( (tuple2!9471 (_1!4746 (_ BitVec 64)) (_2!4746 V!24115)) )
))
(declare-datatypes ((List!15301 0))(
  ( (Nil!15298) (Cons!15297 (h!16426 tuple2!9470) (t!21622 List!15301)) )
))
(declare-datatypes ((ListLongMap!8293 0))(
  ( (ListLongMap!8294 (toList!4162 List!15301)) )
))
(declare-fun lt!365357 () ListLongMap!8293)

(declare-fun lt!365356 () ListLongMap!8293)

(assert (=> b!815943 (= lt!365357 lt!365356)))

(declare-fun zeroValueBefore!34 () V!24115)

(declare-datatypes ((array!44870 0))(
  ( (array!44871 (arr!21493 (Array (_ BitVec 32) (_ BitVec 64))) (size!21914 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44870)

(declare-fun zeroValueAfter!34 () V!24115)

(declare-fun minValue!754 () V!24115)

(declare-datatypes ((ValueCell!6752 0))(
  ( (ValueCellFull!6752 (v!9642 V!24115)) (EmptyCell!6752) )
))
(declare-datatypes ((array!44872 0))(
  ( (array!44873 (arr!21494 (Array (_ BitVec 32) ValueCell!6752)) (size!21915 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44872)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27816 0))(
  ( (Unit!27817) )
))
(declare-fun lt!365358 () Unit!27816)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!319 (array!44870 array!44872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 V!24115 V!24115 (_ BitVec 32) Int) Unit!27816)

(assert (=> b!815943 (= lt!365358 (lemmaNoChangeToArrayThenSameMapNoExtras!319 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2209 (array!44870 array!44872 (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 (_ BitVec 32) Int) ListLongMap!8293)

(assert (=> b!815943 (= lt!365356 (getCurrentListMapNoExtraKeys!2209 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815943 (= lt!365357 (getCurrentListMapNoExtraKeys!2209 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23089 () Bool)

(declare-fun mapRes!23089 () Bool)

(declare-fun tp!44596 () Bool)

(declare-fun e!452539 () Bool)

(assert (=> mapNonEmpty!23089 (= mapRes!23089 (and tp!44596 e!452539))))

(declare-fun mapValue!23089 () ValueCell!6752)

(declare-fun mapKey!23089 () (_ BitVec 32))

(declare-fun mapRest!23089 () (Array (_ BitVec 32) ValueCell!6752))

(assert (=> mapNonEmpty!23089 (= (arr!21494 _values!788) (store mapRest!23089 mapKey!23089 mapValue!23089))))

(declare-fun b!815944 () Bool)

(declare-fun e!452538 () Bool)

(declare-fun tp_is_empty!14335 () Bool)

(assert (=> b!815944 (= e!452538 tp_is_empty!14335)))

(declare-fun b!815945 () Bool)

(declare-fun e!452540 () Bool)

(assert (=> b!815945 (= e!452540 (and e!452538 mapRes!23089))))

(declare-fun condMapEmpty!23089 () Bool)

(declare-fun mapDefault!23089 () ValueCell!6752)

