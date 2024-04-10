; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41456 () Bool)

(assert start!41456)

(declare-fun b_free!11135 () Bool)

(declare-fun b_next!11135 () Bool)

(assert (=> start!41456 (= b_free!11135 (not b_next!11135))))

(declare-fun tp!39400 () Bool)

(declare-fun b_and!19471 () Bool)

(assert (=> start!41456 (= tp!39400 b_and!19471)))

(declare-fun mapIsEmpty!20518 () Bool)

(declare-fun mapRes!20518 () Bool)

(assert (=> mapIsEmpty!20518 mapRes!20518))

(declare-fun b!463191 () Bool)

(declare-fun res!276977 () Bool)

(declare-fun e!270410 () Bool)

(assert (=> b!463191 (=> (not res!276977) (not e!270410))))

(declare-datatypes ((array!28921 0))(
  ( (array!28922 (arr!13893 (Array (_ BitVec 32) (_ BitVec 64))) (size!14245 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28921)

(declare-datatypes ((List!8378 0))(
  ( (Nil!8375) (Cons!8374 (h!9230 (_ BitVec 64)) (t!14322 List!8378)) )
))
(declare-fun arrayNoDuplicates!0 (array!28921 (_ BitVec 32) List!8378) Bool)

(assert (=> b!463191 (= res!276977 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8375))))

(declare-fun mapNonEmpty!20518 () Bool)

(declare-fun tp!39399 () Bool)

(declare-fun e!270413 () Bool)

(assert (=> mapNonEmpty!20518 (= mapRes!20518 (and tp!39399 e!270413))))

(declare-datatypes ((V!17855 0))(
  ( (V!17856 (val!6326 Int)) )
))
(declare-datatypes ((ValueCell!5938 0))(
  ( (ValueCellFull!5938 (v!8613 V!17855)) (EmptyCell!5938) )
))
(declare-datatypes ((array!28923 0))(
  ( (array!28924 (arr!13894 (Array (_ BitVec 32) ValueCell!5938)) (size!14246 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28923)

(declare-fun mapValue!20518 () ValueCell!5938)

(declare-fun mapRest!20518 () (Array (_ BitVec 32) ValueCell!5938))

(declare-fun mapKey!20518 () (_ BitVec 32))

(assert (=> mapNonEmpty!20518 (= (arr!13894 _values!833) (store mapRest!20518 mapKey!20518 mapValue!20518))))

(declare-fun b!463192 () Bool)

(declare-fun res!276975 () Bool)

(assert (=> b!463192 (=> (not res!276975) (not e!270410))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28921 (_ BitVec 32)) Bool)

(assert (=> b!463192 (= res!276975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276974 () Bool)

(assert (=> start!41456 (=> (not res!276974) (not e!270410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41456 (= res!276974 (validMask!0 mask!1365))))

(assert (=> start!41456 e!270410))

(declare-fun tp_is_empty!12563 () Bool)

(assert (=> start!41456 tp_is_empty!12563))

(assert (=> start!41456 tp!39400))

(assert (=> start!41456 true))

(declare-fun array_inv!10044 (array!28921) Bool)

(assert (=> start!41456 (array_inv!10044 _keys!1025)))

(declare-fun e!270411 () Bool)

(declare-fun array_inv!10045 (array!28923) Bool)

(assert (=> start!41456 (and (array_inv!10045 _values!833) e!270411)))

(declare-fun b!463193 () Bool)

(declare-fun e!270414 () Bool)

(assert (=> b!463193 (= e!270414 tp_is_empty!12563)))

(declare-fun b!463194 () Bool)

(assert (=> b!463194 (= e!270413 tp_is_empty!12563)))

(declare-fun b!463195 () Bool)

(declare-fun res!276976 () Bool)

(assert (=> b!463195 (=> (not res!276976) (not e!270410))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463195 (= res!276976 (and (= (size!14246 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14245 _keys!1025) (size!14246 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463196 () Bool)

(assert (=> b!463196 (= e!270411 (and e!270414 mapRes!20518))))

(declare-fun condMapEmpty!20518 () Bool)

(declare-fun mapDefault!20518 () ValueCell!5938)

