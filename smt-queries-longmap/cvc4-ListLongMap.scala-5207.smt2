; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70278 () Bool)

(assert start!70278)

(declare-fun b_free!12653 () Bool)

(declare-fun b_next!12653 () Bool)

(assert (=> start!70278 (= b_free!12653 (not b_next!12653))))

(declare-fun tp!44683 () Bool)

(declare-fun b_and!21453 () Bool)

(assert (=> start!70278 (= tp!44683 b_and!21453)))

(declare-fun mapIsEmpty!23134 () Bool)

(declare-fun mapRes!23134 () Bool)

(assert (=> mapIsEmpty!23134 mapRes!23134))

(declare-fun mapNonEmpty!23134 () Bool)

(declare-fun tp!44682 () Bool)

(declare-fun e!452902 () Bool)

(assert (=> mapNonEmpty!23134 (= mapRes!23134 (and tp!44682 e!452902))))

(declare-datatypes ((V!24151 0))(
  ( (V!24152 (val!7229 Int)) )
))
(declare-datatypes ((ValueCell!6766 0))(
  ( (ValueCellFull!6766 (v!9657 V!24151)) (EmptyCell!6766) )
))
(declare-fun mapRest!23134 () (Array (_ BitVec 32) ValueCell!6766))

(declare-fun mapValue!23134 () ValueCell!6766)

(declare-datatypes ((array!44928 0))(
  ( (array!44929 (arr!21521 (Array (_ BitVec 32) ValueCell!6766)) (size!21942 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44928)

(declare-fun mapKey!23134 () (_ BitVec 32))

(assert (=> mapNonEmpty!23134 (= (arr!21521 _values!788) (store mapRest!23134 mapKey!23134 mapValue!23134))))

(declare-fun b!816463 () Bool)

(declare-fun res!557419 () Bool)

(declare-fun e!452898 () Bool)

(assert (=> b!816463 (=> (not res!557419) (not e!452898))))

(declare-datatypes ((array!44930 0))(
  ( (array!44931 (arr!21522 (Array (_ BitVec 32) (_ BitVec 64))) (size!21943 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44930)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816463 (= res!557419 (and (= (size!21942 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21943 _keys!976) (size!21942 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816464 () Bool)

(declare-fun e!452897 () Bool)

(assert (=> b!816464 (= e!452898 (not e!452897))))

(declare-fun res!557418 () Bool)

(assert (=> b!816464 (=> res!557418 e!452897)))

(assert (=> b!816464 (= res!557418 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9498 0))(
  ( (tuple2!9499 (_1!4760 (_ BitVec 64)) (_2!4760 V!24151)) )
))
(declare-datatypes ((List!15327 0))(
  ( (Nil!15324) (Cons!15323 (h!16452 tuple2!9498) (t!21650 List!15327)) )
))
(declare-datatypes ((ListLongMap!8321 0))(
  ( (ListLongMap!8322 (toList!4176 List!15327)) )
))
(declare-fun lt!365688 () ListLongMap!8321)

(declare-fun lt!365692 () ListLongMap!8321)

(assert (=> b!816464 (= lt!365688 lt!365692)))

(declare-fun zeroValueBefore!34 () V!24151)

(declare-fun zeroValueAfter!34 () V!24151)

(declare-fun minValue!754 () V!24151)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27840 0))(
  ( (Unit!27841) )
))
(declare-fun lt!365689 () Unit!27840)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!330 (array!44930 array!44928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24151 V!24151 V!24151 V!24151 (_ BitVec 32) Int) Unit!27840)

(assert (=> b!816464 (= lt!365689 (lemmaNoChangeToArrayThenSameMapNoExtras!330 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2220 (array!44930 array!44928 (_ BitVec 32) (_ BitVec 32) V!24151 V!24151 (_ BitVec 32) Int) ListLongMap!8321)

(assert (=> b!816464 (= lt!365692 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816464 (= lt!365688 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816465 () Bool)

(assert (=> b!816465 (= e!452897 true)))

(declare-fun lt!365691 () ListLongMap!8321)

(declare-fun getCurrentListMap!2401 (array!44930 array!44928 (_ BitVec 32) (_ BitVec 32) V!24151 V!24151 (_ BitVec 32) Int) ListLongMap!8321)

(assert (=> b!816465 (= lt!365691 (getCurrentListMap!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365690 () ListLongMap!8321)

(declare-fun +!1807 (ListLongMap!8321 tuple2!9498) ListLongMap!8321)

(assert (=> b!816465 (= lt!365690 (+!1807 (getCurrentListMap!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun res!557417 () Bool)

(assert (=> start!70278 (=> (not res!557417) (not e!452898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70278 (= res!557417 (validMask!0 mask!1312))))

(assert (=> start!70278 e!452898))

(declare-fun tp_is_empty!14363 () Bool)

(assert (=> start!70278 tp_is_empty!14363))

(declare-fun array_inv!17221 (array!44930) Bool)

(assert (=> start!70278 (array_inv!17221 _keys!976)))

(assert (=> start!70278 true))

(declare-fun e!452899 () Bool)

(declare-fun array_inv!17222 (array!44928) Bool)

(assert (=> start!70278 (and (array_inv!17222 _values!788) e!452899)))

(assert (=> start!70278 tp!44683))

(declare-fun b!816466 () Bool)

(declare-fun res!557421 () Bool)

(assert (=> b!816466 (=> (not res!557421) (not e!452898))))

(declare-datatypes ((List!15328 0))(
  ( (Nil!15325) (Cons!15324 (h!16453 (_ BitVec 64)) (t!21651 List!15328)) )
))
(declare-fun arrayNoDuplicates!0 (array!44930 (_ BitVec 32) List!15328) Bool)

(assert (=> b!816466 (= res!557421 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15325))))

(declare-fun b!816467 () Bool)

(declare-fun e!452900 () Bool)

(assert (=> b!816467 (= e!452899 (and e!452900 mapRes!23134))))

(declare-fun condMapEmpty!23134 () Bool)

(declare-fun mapDefault!23134 () ValueCell!6766)

