; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70060 () Bool)

(assert start!70060)

(declare-fun b_free!12481 () Bool)

(declare-fun b_next!12481 () Bool)

(assert (=> start!70060 (= b_free!12481 (not b_next!12481))))

(declare-fun tp!44157 () Bool)

(declare-fun b_and!21253 () Bool)

(assert (=> start!70060 (= tp!44157 b_and!21253)))

(declare-fun res!556146 () Bool)

(declare-fun e!451291 () Bool)

(assert (=> start!70060 (=> (not res!556146) (not e!451291))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70060 (= res!556146 (validMask!0 mask!1312))))

(assert (=> start!70060 e!451291))

(declare-fun tp_is_empty!14191 () Bool)

(assert (=> start!70060 tp_is_empty!14191))

(declare-datatypes ((array!44586 0))(
  ( (array!44587 (arr!21353 (Array (_ BitVec 32) (_ BitVec 64))) (size!21774 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44586)

(declare-fun array_inv!17091 (array!44586) Bool)

(assert (=> start!70060 (array_inv!17091 _keys!976)))

(assert (=> start!70060 true))

(declare-datatypes ((V!23923 0))(
  ( (V!23924 (val!7143 Int)) )
))
(declare-datatypes ((ValueCell!6680 0))(
  ( (ValueCellFull!6680 (v!9570 V!23923)) (EmptyCell!6680) )
))
(declare-datatypes ((array!44588 0))(
  ( (array!44589 (arr!21354 (Array (_ BitVec 32) ValueCell!6680)) (size!21775 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44588)

(declare-fun e!451290 () Bool)

(declare-fun array_inv!17092 (array!44588) Bool)

(assert (=> start!70060 (and (array_inv!17092 _values!788) e!451290)))

(assert (=> start!70060 tp!44157))

(declare-fun mapNonEmpty!22867 () Bool)

(declare-fun mapRes!22867 () Bool)

(declare-fun tp!44158 () Bool)

(declare-fun e!451293 () Bool)

(assert (=> mapNonEmpty!22867 (= mapRes!22867 (and tp!44158 e!451293))))

(declare-fun mapRest!22867 () (Array (_ BitVec 32) ValueCell!6680))

(declare-fun mapValue!22867 () ValueCell!6680)

(declare-fun mapKey!22867 () (_ BitVec 32))

(assert (=> mapNonEmpty!22867 (= (arr!21354 _values!788) (store mapRest!22867 mapKey!22867 mapValue!22867))))

(declare-fun mapIsEmpty!22867 () Bool)

(assert (=> mapIsEmpty!22867 mapRes!22867))

(declare-fun b!814205 () Bool)

(declare-fun res!556143 () Bool)

(assert (=> b!814205 (=> (not res!556143) (not e!451291))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!814205 (= res!556143 (and (= (size!21775 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21774 _keys!976) (size!21775 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814206 () Bool)

(declare-fun e!451292 () Bool)

(assert (=> b!814206 (= e!451292 tp_is_empty!14191)))

(declare-fun b!814207 () Bool)

(declare-fun res!556145 () Bool)

(assert (=> b!814207 (=> (not res!556145) (not e!451291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44586 (_ BitVec 32)) Bool)

(assert (=> b!814207 (= res!556145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814208 () Bool)

(assert (=> b!814208 (= e!451291 (not true))))

(declare-datatypes ((tuple2!9362 0))(
  ( (tuple2!9363 (_1!4692 (_ BitVec 64)) (_2!4692 V!23923)) )
))
(declare-datatypes ((List!15193 0))(
  ( (Nil!15190) (Cons!15189 (h!16318 tuple2!9362) (t!21510 List!15193)) )
))
(declare-datatypes ((ListLongMap!8185 0))(
  ( (ListLongMap!8186 (toList!4108 List!15193)) )
))
(declare-fun lt!364518 () ListLongMap!8185)

(declare-fun lt!364517 () ListLongMap!8185)

(assert (=> b!814208 (= lt!364518 lt!364517)))

(declare-fun zeroValueBefore!34 () V!23923)

(declare-fun zeroValueAfter!34 () V!23923)

(declare-fun minValue!754 () V!23923)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27714 0))(
  ( (Unit!27715) )
))
(declare-fun lt!364516 () Unit!27714)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!268 (array!44586 array!44588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 V!23923 V!23923 (_ BitVec 32) Int) Unit!27714)

(assert (=> b!814208 (= lt!364516 (lemmaNoChangeToArrayThenSameMapNoExtras!268 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2158 (array!44586 array!44588 (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 (_ BitVec 32) Int) ListLongMap!8185)

(assert (=> b!814208 (= lt!364517 (getCurrentListMapNoExtraKeys!2158 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814208 (= lt!364518 (getCurrentListMapNoExtraKeys!2158 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814209 () Bool)

(assert (=> b!814209 (= e!451293 tp_is_empty!14191)))

(declare-fun b!814210 () Bool)

(declare-fun res!556144 () Bool)

(assert (=> b!814210 (=> (not res!556144) (not e!451291))))

(declare-datatypes ((List!15194 0))(
  ( (Nil!15191) (Cons!15190 (h!16319 (_ BitVec 64)) (t!21511 List!15194)) )
))
(declare-fun arrayNoDuplicates!0 (array!44586 (_ BitVec 32) List!15194) Bool)

(assert (=> b!814210 (= res!556144 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15191))))

(declare-fun b!814211 () Bool)

(assert (=> b!814211 (= e!451290 (and e!451292 mapRes!22867))))

(declare-fun condMapEmpty!22867 () Bool)

(declare-fun mapDefault!22867 () ValueCell!6680)

