; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70064 () Bool)

(assert start!70064)

(declare-fun b_free!12485 () Bool)

(declare-fun b_next!12485 () Bool)

(assert (=> start!70064 (= b_free!12485 (not b_next!12485))))

(declare-fun tp!44169 () Bool)

(declare-fun b_and!21257 () Bool)

(assert (=> start!70064 (= tp!44169 b_and!21257)))

(declare-fun b!814247 () Bool)

(declare-fun res!556168 () Bool)

(declare-fun e!451319 () Bool)

(assert (=> b!814247 (=> (not res!556168) (not e!451319))))

(declare-datatypes ((array!44594 0))(
  ( (array!44595 (arr!21357 (Array (_ BitVec 32) (_ BitVec 64))) (size!21778 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44594)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23927 0))(
  ( (V!23928 (val!7145 Int)) )
))
(declare-datatypes ((ValueCell!6682 0))(
  ( (ValueCellFull!6682 (v!9572 V!23927)) (EmptyCell!6682) )
))
(declare-datatypes ((array!44596 0))(
  ( (array!44597 (arr!21358 (Array (_ BitVec 32) ValueCell!6682)) (size!21779 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44596)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814247 (= res!556168 (and (= (size!21779 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21778 _keys!976) (size!21779 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814248 () Bool)

(declare-fun res!556169 () Bool)

(assert (=> b!814248 (=> (not res!556169) (not e!451319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44594 (_ BitVec 32)) Bool)

(assert (=> b!814248 (= res!556169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814250 () Bool)

(assert (=> b!814250 (= e!451319 (not true))))

(declare-datatypes ((tuple2!9366 0))(
  ( (tuple2!9367 (_1!4694 (_ BitVec 64)) (_2!4694 V!23927)) )
))
(declare-datatypes ((List!15197 0))(
  ( (Nil!15194) (Cons!15193 (h!16322 tuple2!9366) (t!21514 List!15197)) )
))
(declare-datatypes ((ListLongMap!8189 0))(
  ( (ListLongMap!8190 (toList!4110 List!15197)) )
))
(declare-fun lt!364536 () ListLongMap!8189)

(declare-fun lt!364535 () ListLongMap!8189)

(assert (=> b!814250 (= lt!364536 lt!364535)))

(declare-fun zeroValueBefore!34 () V!23927)

(declare-datatypes ((Unit!27718 0))(
  ( (Unit!27719) )
))
(declare-fun lt!364534 () Unit!27718)

(declare-fun zeroValueAfter!34 () V!23927)

(declare-fun minValue!754 () V!23927)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!270 (array!44594 array!44596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23927 V!23927 V!23927 V!23927 (_ BitVec 32) Int) Unit!27718)

(assert (=> b!814250 (= lt!364534 (lemmaNoChangeToArrayThenSameMapNoExtras!270 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2160 (array!44594 array!44596 (_ BitVec 32) (_ BitVec 32) V!23927 V!23927 (_ BitVec 32) Int) ListLongMap!8189)

(assert (=> b!814250 (= lt!364535 (getCurrentListMapNoExtraKeys!2160 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814250 (= lt!364536 (getCurrentListMapNoExtraKeys!2160 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22873 () Bool)

(declare-fun mapRes!22873 () Bool)

(assert (=> mapIsEmpty!22873 mapRes!22873))

(declare-fun mapNonEmpty!22873 () Bool)

(declare-fun tp!44170 () Bool)

(declare-fun e!451322 () Bool)

(assert (=> mapNonEmpty!22873 (= mapRes!22873 (and tp!44170 e!451322))))

(declare-fun mapRest!22873 () (Array (_ BitVec 32) ValueCell!6682))

(declare-fun mapKey!22873 () (_ BitVec 32))

(declare-fun mapValue!22873 () ValueCell!6682)

(assert (=> mapNonEmpty!22873 (= (arr!21358 _values!788) (store mapRest!22873 mapKey!22873 mapValue!22873))))

(declare-fun b!814251 () Bool)

(declare-fun e!451320 () Bool)

(declare-fun tp_is_empty!14195 () Bool)

(assert (=> b!814251 (= e!451320 tp_is_empty!14195)))

(declare-fun b!814252 () Bool)

(declare-fun res!556170 () Bool)

(assert (=> b!814252 (=> (not res!556170) (not e!451319))))

(declare-datatypes ((List!15198 0))(
  ( (Nil!15195) (Cons!15194 (h!16323 (_ BitVec 64)) (t!21515 List!15198)) )
))
(declare-fun arrayNoDuplicates!0 (array!44594 (_ BitVec 32) List!15198) Bool)

(assert (=> b!814252 (= res!556170 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15195))))

(declare-fun b!814253 () Bool)

(assert (=> b!814253 (= e!451322 tp_is_empty!14195)))

(declare-fun b!814249 () Bool)

(declare-fun e!451321 () Bool)

(assert (=> b!814249 (= e!451321 (and e!451320 mapRes!22873))))

(declare-fun condMapEmpty!22873 () Bool)

(declare-fun mapDefault!22873 () ValueCell!6682)

