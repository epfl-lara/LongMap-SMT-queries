; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70176 () Bool)

(assert start!70176)

(declare-fun b_free!12583 () Bool)

(declare-fun b_next!12583 () Bool)

(assert (=> start!70176 (= b_free!12583 (not b_next!12583))))

(declare-fun tp!44466 () Bool)

(declare-fun b_and!21363 () Bool)

(assert (=> start!70176 (= tp!44466 b_and!21363)))

(declare-fun b!815361 () Bool)

(declare-fun res!556787 () Bool)

(declare-fun e!452113 () Bool)

(assert (=> b!815361 (=> (not res!556787) (not e!452113))))

(declare-datatypes ((array!44786 0))(
  ( (array!44787 (arr!21452 (Array (_ BitVec 32) (_ BitVec 64))) (size!21873 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44786)

(declare-datatypes ((List!15266 0))(
  ( (Nil!15263) (Cons!15262 (h!16391 (_ BitVec 64)) (t!21585 List!15266)) )
))
(declare-fun arrayNoDuplicates!0 (array!44786 (_ BitVec 32) List!15266) Bool)

(assert (=> b!815361 (= res!556787 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15263))))

(declare-fun b!815362 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815362 (= e!452113 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21873 _keys!976)))))))

(declare-datatypes ((V!24059 0))(
  ( (V!24060 (val!7194 Int)) )
))
(declare-datatypes ((tuple2!9434 0))(
  ( (tuple2!9435 (_1!4728 (_ BitVec 64)) (_2!4728 V!24059)) )
))
(declare-datatypes ((List!15267 0))(
  ( (Nil!15264) (Cons!15263 (h!16392 tuple2!9434) (t!21586 List!15267)) )
))
(declare-datatypes ((ListLongMap!8257 0))(
  ( (ListLongMap!8258 (toList!4144 List!15267)) )
))
(declare-fun lt!365016 () ListLongMap!8257)

(declare-fun lt!365015 () ListLongMap!8257)

(assert (=> b!815362 (= lt!365016 lt!365015)))

(declare-fun zeroValueBefore!34 () V!24059)

(declare-datatypes ((Unit!27786 0))(
  ( (Unit!27787) )
))
(declare-fun lt!365017 () Unit!27786)

(declare-fun minValue!754 () V!24059)

(declare-datatypes ((ValueCell!6731 0))(
  ( (ValueCellFull!6731 (v!9621 V!24059)) (EmptyCell!6731) )
))
(declare-datatypes ((array!44788 0))(
  ( (array!44789 (arr!21453 (Array (_ BitVec 32) ValueCell!6731)) (size!21874 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44788)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!304 (array!44786 array!44788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 V!24059 V!24059 (_ BitVec 32) Int) Unit!27786)

(assert (=> b!815362 (= lt!365017 (lemmaNoChangeToArrayThenSameMapNoExtras!304 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2194 (array!44786 array!44788 (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 (_ BitVec 32) Int) ListLongMap!8257)

(assert (=> b!815362 (= lt!365015 (getCurrentListMapNoExtraKeys!2194 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815362 (= lt!365016 (getCurrentListMapNoExtraKeys!2194 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815363 () Bool)

(declare-fun res!556788 () Bool)

(assert (=> b!815363 (=> (not res!556788) (not e!452113))))

(assert (=> b!815363 (= res!556788 (and (= (size!21874 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21873 _keys!976) (size!21874 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556789 () Bool)

(assert (=> start!70176 (=> (not res!556789) (not e!452113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70176 (= res!556789 (validMask!0 mask!1312))))

(assert (=> start!70176 e!452113))

(declare-fun tp_is_empty!14293 () Bool)

(assert (=> start!70176 tp_is_empty!14293))

(declare-fun array_inv!17165 (array!44786) Bool)

(assert (=> start!70176 (array_inv!17165 _keys!976)))

(assert (=> start!70176 true))

(declare-fun e!452109 () Bool)

(declare-fun array_inv!17166 (array!44788) Bool)

(assert (=> start!70176 (and (array_inv!17166 _values!788) e!452109)))

(assert (=> start!70176 tp!44466))

(declare-fun mapIsEmpty!23023 () Bool)

(declare-fun mapRes!23023 () Bool)

(assert (=> mapIsEmpty!23023 mapRes!23023))

(declare-fun mapNonEmpty!23023 () Bool)

(declare-fun tp!44467 () Bool)

(declare-fun e!452112 () Bool)

(assert (=> mapNonEmpty!23023 (= mapRes!23023 (and tp!44467 e!452112))))

(declare-fun mapKey!23023 () (_ BitVec 32))

(declare-fun mapRest!23023 () (Array (_ BitVec 32) ValueCell!6731))

(declare-fun mapValue!23023 () ValueCell!6731)

(assert (=> mapNonEmpty!23023 (= (arr!21453 _values!788) (store mapRest!23023 mapKey!23023 mapValue!23023))))

(declare-fun b!815364 () Bool)

(assert (=> b!815364 (= e!452112 tp_is_empty!14293)))

(declare-fun b!815365 () Bool)

(declare-fun res!556786 () Bool)

(assert (=> b!815365 (=> (not res!556786) (not e!452113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44786 (_ BitVec 32)) Bool)

(assert (=> b!815365 (= res!556786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815366 () Bool)

(declare-fun e!452111 () Bool)

(assert (=> b!815366 (= e!452111 tp_is_empty!14293)))

(declare-fun b!815367 () Bool)

(assert (=> b!815367 (= e!452109 (and e!452111 mapRes!23023))))

(declare-fun condMapEmpty!23023 () Bool)

(declare-fun mapDefault!23023 () ValueCell!6731)

