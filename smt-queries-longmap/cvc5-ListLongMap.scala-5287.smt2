; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70892 () Bool)

(assert start!70892)

(declare-fun b_free!13129 () Bool)

(declare-fun b_next!13129 () Bool)

(assert (=> start!70892 (= b_free!13129 (not b_next!13129))))

(declare-fun tp!46135 () Bool)

(declare-fun b_and!22013 () Bool)

(assert (=> start!70892 (= tp!46135 b_and!22013)))

(declare-fun b!823403 () Bool)

(declare-fun e!457959 () Bool)

(declare-fun tp_is_empty!14839 () Bool)

(assert (=> b!823403 (= e!457959 tp_is_empty!14839)))

(declare-fun b!823404 () Bool)

(declare-fun e!457962 () Bool)

(declare-fun e!457960 () Bool)

(assert (=> b!823404 (= e!457962 (not e!457960))))

(declare-fun res!561521 () Bool)

(assert (=> b!823404 (=> res!561521 e!457960)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823404 (= res!561521 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24787 0))(
  ( (V!24788 (val!7467 Int)) )
))
(declare-datatypes ((tuple2!9874 0))(
  ( (tuple2!9875 (_1!4948 (_ BitVec 64)) (_2!4948 V!24787)) )
))
(declare-datatypes ((List!15687 0))(
  ( (Nil!15684) (Cons!15683 (h!16812 tuple2!9874) (t!22026 List!15687)) )
))
(declare-datatypes ((ListLongMap!8697 0))(
  ( (ListLongMap!8698 (toList!4364 List!15687)) )
))
(declare-fun lt!371251 () ListLongMap!8697)

(declare-fun lt!371243 () ListLongMap!8697)

(assert (=> b!823404 (= lt!371251 lt!371243)))

(declare-datatypes ((Unit!28194 0))(
  ( (Unit!28195) )
))
(declare-fun lt!371249 () Unit!28194)

(declare-fun zeroValueBefore!34 () V!24787)

(declare-datatypes ((array!45868 0))(
  ( (array!45869 (arr!21983 (Array (_ BitVec 32) (_ BitVec 64))) (size!22404 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45868)

(declare-fun zeroValueAfter!34 () V!24787)

(declare-fun minValue!754 () V!24787)

(declare-datatypes ((ValueCell!7004 0))(
  ( (ValueCellFull!7004 (v!9899 V!24787)) (EmptyCell!7004) )
))
(declare-datatypes ((array!45870 0))(
  ( (array!45871 (arr!21984 (Array (_ BitVec 32) ValueCell!7004)) (size!22405 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45870)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!489 (array!45868 array!45870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 V!24787 V!24787 (_ BitVec 32) Int) Unit!28194)

(assert (=> b!823404 (= lt!371249 (lemmaNoChangeToArrayThenSameMapNoExtras!489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2379 (array!45868 array!45870 (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 (_ BitVec 32) Int) ListLongMap!8697)

(assert (=> b!823404 (= lt!371243 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823404 (= lt!371251 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823406 () Bool)

(declare-fun res!561520 () Bool)

(assert (=> b!823406 (=> (not res!561520) (not e!457962))))

(assert (=> b!823406 (= res!561520 (and (= (size!22405 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22404 _keys!976) (size!22405 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23872 () Bool)

(declare-fun mapRes!23872 () Bool)

(assert (=> mapIsEmpty!23872 mapRes!23872))

(declare-fun b!823407 () Bool)

(declare-fun e!457964 () Bool)

(assert (=> b!823407 (= e!457964 (and e!457959 mapRes!23872))))

(declare-fun condMapEmpty!23872 () Bool)

(declare-fun mapDefault!23872 () ValueCell!7004)

