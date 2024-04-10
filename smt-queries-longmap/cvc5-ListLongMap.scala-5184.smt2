; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70090 () Bool)

(assert start!70090)

(declare-fun b_free!12511 () Bool)

(declare-fun b_next!12511 () Bool)

(assert (=> start!70090 (= b_free!12511 (not b_next!12511))))

(declare-fun tp!44248 () Bool)

(declare-fun b_and!21283 () Bool)

(assert (=> start!70090 (= tp!44248 b_and!21283)))

(declare-fun b!814520 () Bool)

(declare-fun e!451514 () Bool)

(declare-fun tp_is_empty!14221 () Bool)

(assert (=> b!814520 (= e!451514 tp_is_empty!14221)))

(declare-fun mapIsEmpty!22912 () Bool)

(declare-fun mapRes!22912 () Bool)

(assert (=> mapIsEmpty!22912 mapRes!22912))

(declare-fun mapNonEmpty!22912 () Bool)

(declare-fun tp!44247 () Bool)

(assert (=> mapNonEmpty!22912 (= mapRes!22912 (and tp!44247 e!451514))))

(declare-fun mapKey!22912 () (_ BitVec 32))

(declare-datatypes ((V!23963 0))(
  ( (V!23964 (val!7158 Int)) )
))
(declare-datatypes ((ValueCell!6695 0))(
  ( (ValueCellFull!6695 (v!9585 V!23963)) (EmptyCell!6695) )
))
(declare-fun mapRest!22912 () (Array (_ BitVec 32) ValueCell!6695))

(declare-datatypes ((array!44644 0))(
  ( (array!44645 (arr!21382 (Array (_ BitVec 32) ValueCell!6695)) (size!21803 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44644)

(declare-fun mapValue!22912 () ValueCell!6695)

(assert (=> mapNonEmpty!22912 (= (arr!21382 _values!788) (store mapRest!22912 mapKey!22912 mapValue!22912))))

(declare-fun b!814521 () Bool)

(declare-fun e!451516 () Bool)

(assert (=> b!814521 (= e!451516 (not true))))

(declare-datatypes ((tuple2!9382 0))(
  ( (tuple2!9383 (_1!4702 (_ BitVec 64)) (_2!4702 V!23963)) )
))
(declare-datatypes ((List!15214 0))(
  ( (Nil!15211) (Cons!15210 (h!16339 tuple2!9382) (t!21531 List!15214)) )
))
(declare-datatypes ((ListLongMap!8205 0))(
  ( (ListLongMap!8206 (toList!4118 List!15214)) )
))
(declare-fun lt!364652 () ListLongMap!8205)

(declare-fun lt!364653 () ListLongMap!8205)

(assert (=> b!814521 (= lt!364652 lt!364653)))

(declare-fun zeroValueBefore!34 () V!23963)

(declare-datatypes ((array!44646 0))(
  ( (array!44647 (arr!21383 (Array (_ BitVec 32) (_ BitVec 64))) (size!21804 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44646)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23963)

(declare-fun minValue!754 () V!23963)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27734 0))(
  ( (Unit!27735) )
))
(declare-fun lt!364651 () Unit!27734)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!278 (array!44646 array!44644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 V!23963 V!23963 (_ BitVec 32) Int) Unit!27734)

(assert (=> b!814521 (= lt!364651 (lemmaNoChangeToArrayThenSameMapNoExtras!278 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2168 (array!44646 array!44644 (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 (_ BitVec 32) Int) ListLongMap!8205)

(assert (=> b!814521 (= lt!364653 (getCurrentListMapNoExtraKeys!2168 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814521 (= lt!364652 (getCurrentListMapNoExtraKeys!2168 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814522 () Bool)

(declare-fun res!556323 () Bool)

(assert (=> b!814522 (=> (not res!556323) (not e!451516))))

(assert (=> b!814522 (= res!556323 (and (= (size!21803 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21804 _keys!976) (size!21803 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814523 () Bool)

(declare-fun e!451515 () Bool)

(declare-fun e!451517 () Bool)

(assert (=> b!814523 (= e!451515 (and e!451517 mapRes!22912))))

(declare-fun condMapEmpty!22912 () Bool)

(declare-fun mapDefault!22912 () ValueCell!6695)

