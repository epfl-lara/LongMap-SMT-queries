; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71148 () Bool)

(assert start!71148)

(declare-fun b_free!13315 () Bool)

(declare-fun b_next!13315 () Bool)

(assert (=> start!71148 (= b_free!13315 (not b_next!13315))))

(declare-fun tp!46704 () Bool)

(declare-fun b_and!22241 () Bool)

(assert (=> start!71148 (= tp!46704 b_and!22241)))

(declare-fun b!826394 () Bool)

(declare-fun e!460167 () Bool)

(assert (=> b!826394 (= e!460167 true)))

(declare-datatypes ((V!25035 0))(
  ( (V!25036 (val!7560 Int)) )
))
(declare-datatypes ((tuple2!10014 0))(
  ( (tuple2!10015 (_1!5018 (_ BitVec 64)) (_2!5018 V!25035)) )
))
(declare-datatypes ((List!15813 0))(
  ( (Nil!15810) (Cons!15809 (h!16938 tuple2!10014) (t!22160 List!15813)) )
))
(declare-datatypes ((ListLongMap!8837 0))(
  ( (ListLongMap!8838 (toList!4434 List!15813)) )
))
(declare-fun lt!373901 () ListLongMap!8837)

(declare-fun lt!373906 () ListLongMap!8837)

(declare-fun lt!373900 () tuple2!10014)

(declare-fun lt!373904 () tuple2!10014)

(declare-fun +!1941 (ListLongMap!8837 tuple2!10014) ListLongMap!8837)

(assert (=> b!826394 (= lt!373901 (+!1941 (+!1941 lt!373906 lt!373904) lt!373900))))

(declare-fun lt!373905 () ListLongMap!8837)

(declare-fun lt!373909 () ListLongMap!8837)

(declare-fun lt!373903 () ListLongMap!8837)

(assert (=> b!826394 (and (= lt!373905 lt!373909) (= lt!373903 lt!373909) (= lt!373903 lt!373905))))

(declare-fun lt!373907 () ListLongMap!8837)

(assert (=> b!826394 (= lt!373909 (+!1941 lt!373907 lt!373904))))

(declare-fun lt!373912 () ListLongMap!8837)

(assert (=> b!826394 (= lt!373905 (+!1941 lt!373912 lt!373904))))

(declare-fun zeroValueBefore!34 () V!25035)

(declare-fun zeroValueAfter!34 () V!25035)

(declare-datatypes ((Unit!28331 0))(
  ( (Unit!28332) )
))
(declare-fun lt!373908 () Unit!28331)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!224 (ListLongMap!8837 (_ BitVec 64) V!25035 V!25035) Unit!28331)

(assert (=> b!826394 (= lt!373908 (addSameAsAddTwiceSameKeyDiffValues!224 lt!373912 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460166 () Bool)

(assert (=> b!826394 e!460166))

(declare-fun res!563328 () Bool)

(assert (=> b!826394 (=> (not res!563328) (not e!460166))))

(declare-fun lt!373910 () ListLongMap!8837)

(assert (=> b!826394 (= res!563328 (= lt!373910 lt!373907))))

(declare-fun lt!373911 () tuple2!10014)

(assert (=> b!826394 (= lt!373907 (+!1941 lt!373912 lt!373911))))

(assert (=> b!826394 (= lt!373912 (+!1941 lt!373906 lt!373900))))

(assert (=> b!826394 (= lt!373904 (tuple2!10015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460169 () Bool)

(assert (=> b!826394 e!460169))

(declare-fun res!563329 () Bool)

(assert (=> b!826394 (=> (not res!563329) (not e!460169))))

(assert (=> b!826394 (= res!563329 (= lt!373910 (+!1941 (+!1941 lt!373906 lt!373911) lt!373900)))))

(declare-fun minValue!754 () V!25035)

(assert (=> b!826394 (= lt!373900 (tuple2!10015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826394 (= lt!373911 (tuple2!10015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46230 0))(
  ( (array!46231 (arr!22160 (Array (_ BitVec 32) (_ BitVec 64))) (size!22581 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46230)

(declare-datatypes ((ValueCell!7097 0))(
  ( (ValueCellFull!7097 (v!9994 V!25035)) (EmptyCell!7097) )
))
(declare-datatypes ((array!46232 0))(
  ( (array!46233 (arr!22161 (Array (_ BitVec 32) ValueCell!7097)) (size!22582 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46232)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2564 (array!46230 array!46232 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8837)

(assert (=> b!826394 (= lt!373903 (getCurrentListMap!2564 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826394 (= lt!373910 (getCurrentListMap!2564 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563327 () Bool)

(declare-fun e!460168 () Bool)

(assert (=> start!71148 (=> (not res!563327) (not e!460168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71148 (= res!563327 (validMask!0 mask!1312))))

(assert (=> start!71148 e!460168))

(declare-fun tp_is_empty!15025 () Bool)

(assert (=> start!71148 tp_is_empty!15025))

(declare-fun array_inv!17663 (array!46230) Bool)

(assert (=> start!71148 (array_inv!17663 _keys!976)))

(assert (=> start!71148 true))

(declare-fun e!460171 () Bool)

(declare-fun array_inv!17664 (array!46232) Bool)

(assert (=> start!71148 (and (array_inv!17664 _values!788) e!460171)))

(assert (=> start!71148 tp!46704))

(declare-fun b!826395 () Bool)

(declare-fun e!460170 () Bool)

(assert (=> b!826395 (= e!460170 tp_is_empty!15025)))

(declare-fun b!826396 () Bool)

(assert (=> b!826396 (= e!460168 (not e!460167))))

(declare-fun res!563325 () Bool)

(assert (=> b!826396 (=> res!563325 e!460167)))

(assert (=> b!826396 (= res!563325 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373902 () ListLongMap!8837)

(assert (=> b!826396 (= lt!373906 lt!373902)))

(declare-fun lt!373899 () Unit!28331)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!551 (array!46230 array!46232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 V!25035 V!25035 (_ BitVec 32) Int) Unit!28331)

(assert (=> b!826396 (= lt!373899 (lemmaNoChangeToArrayThenSameMapNoExtras!551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2441 (array!46230 array!46232 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8837)

(assert (=> b!826396 (= lt!373902 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826396 (= lt!373906 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24163 () Bool)

(declare-fun mapRes!24163 () Bool)

(assert (=> mapIsEmpty!24163 mapRes!24163))

(declare-fun b!826397 () Bool)

(assert (=> b!826397 (= e!460166 (= lt!373903 (+!1941 (+!1941 lt!373902 lt!373900) lt!373904)))))

(declare-fun b!826398 () Bool)

(assert (=> b!826398 (= e!460169 (= lt!373903 (+!1941 (+!1941 lt!373902 (tuple2!10015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373900)))))

(declare-fun b!826399 () Bool)

(declare-fun res!563331 () Bool)

(assert (=> b!826399 (=> (not res!563331) (not e!460168))))

(assert (=> b!826399 (= res!563331 (and (= (size!22582 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22581 _keys!976) (size!22582 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826400 () Bool)

(declare-fun e!460164 () Bool)

(assert (=> b!826400 (= e!460164 tp_is_empty!15025)))

(declare-fun b!826401 () Bool)

(declare-fun res!563330 () Bool)

(assert (=> b!826401 (=> (not res!563330) (not e!460168))))

(declare-datatypes ((List!15814 0))(
  ( (Nil!15811) (Cons!15810 (h!16939 (_ BitVec 64)) (t!22161 List!15814)) )
))
(declare-fun arrayNoDuplicates!0 (array!46230 (_ BitVec 32) List!15814) Bool)

(assert (=> b!826401 (= res!563330 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15811))))

(declare-fun b!826402 () Bool)

(assert (=> b!826402 (= e!460171 (and e!460170 mapRes!24163))))

(declare-fun condMapEmpty!24163 () Bool)

(declare-fun mapDefault!24163 () ValueCell!7097)

