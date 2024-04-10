; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41518 () Bool)

(assert start!41518)

(declare-fun b_free!11185 () Bool)

(declare-fun b_next!11185 () Bool)

(assert (=> start!41518 (= b_free!11185 (not b_next!11185))))

(declare-fun tp!39552 () Bool)

(declare-fun b_and!19525 () Bool)

(assert (=> start!41518 (= tp!39552 b_and!19525)))

(declare-fun b!463789 () Bool)

(declare-fun e!270833 () Bool)

(declare-fun tp_is_empty!12613 () Bool)

(assert (=> b!463789 (= e!270833 tp_is_empty!12613)))

(declare-fun res!277302 () Bool)

(declare-fun e!270834 () Bool)

(assert (=> start!41518 (=> (not res!277302) (not e!270834))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41518 (= res!277302 (validMask!0 mask!1365))))

(assert (=> start!41518 e!270834))

(assert (=> start!41518 tp_is_empty!12613))

(assert (=> start!41518 tp!39552))

(assert (=> start!41518 true))

(declare-datatypes ((array!29015 0))(
  ( (array!29016 (arr!13939 (Array (_ BitVec 32) (_ BitVec 64))) (size!14291 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29015)

(declare-fun array_inv!10074 (array!29015) Bool)

(assert (=> start!41518 (array_inv!10074 _keys!1025)))

(declare-datatypes ((V!17923 0))(
  ( (V!17924 (val!6351 Int)) )
))
(declare-datatypes ((ValueCell!5963 0))(
  ( (ValueCellFull!5963 (v!8638 V!17923)) (EmptyCell!5963) )
))
(declare-datatypes ((array!29017 0))(
  ( (array!29018 (arr!13940 (Array (_ BitVec 32) ValueCell!5963)) (size!14292 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29017)

(declare-fun e!270835 () Bool)

(declare-fun array_inv!10075 (array!29017) Bool)

(assert (=> start!41518 (and (array_inv!10075 _values!833) e!270835)))

(declare-fun mapNonEmpty!20596 () Bool)

(declare-fun mapRes!20596 () Bool)

(declare-fun tp!39553 () Bool)

(declare-fun e!270837 () Bool)

(assert (=> mapNonEmpty!20596 (= mapRes!20596 (and tp!39553 e!270837))))

(declare-fun mapKey!20596 () (_ BitVec 32))

(declare-fun mapRest!20596 () (Array (_ BitVec 32) ValueCell!5963))

(declare-fun mapValue!20596 () ValueCell!5963)

(assert (=> mapNonEmpty!20596 (= (arr!13940 _values!833) (store mapRest!20596 mapKey!20596 mapValue!20596))))

(declare-fun b!463790 () Bool)

(declare-fun res!277301 () Bool)

(assert (=> b!463790 (=> (not res!277301) (not e!270834))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463790 (= res!277301 (and (= (size!14292 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14291 _keys!1025) (size!14292 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463791 () Bool)

(assert (=> b!463791 (= e!270834 false)))

(declare-fun zeroValue!794 () V!17923)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8318 0))(
  ( (tuple2!8319 (_1!4170 (_ BitVec 64)) (_2!4170 V!17923)) )
))
(declare-datatypes ((List!8412 0))(
  ( (Nil!8409) (Cons!8408 (h!9264 tuple2!8318) (t!14358 List!8412)) )
))
(declare-datatypes ((ListLongMap!7231 0))(
  ( (ListLongMap!7232 (toList!3631 List!8412)) )
))
(declare-fun lt!209480 () ListLongMap!7231)

(declare-fun minValueAfter!38 () V!17923)

(declare-fun getCurrentListMapNoExtraKeys!1811 (array!29015 array!29017 (_ BitVec 32) (_ BitVec 32) V!17923 V!17923 (_ BitVec 32) Int) ListLongMap!7231)

(assert (=> b!463791 (= lt!209480 (getCurrentListMapNoExtraKeys!1811 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17923)

(declare-fun lt!209479 () ListLongMap!7231)

(assert (=> b!463791 (= lt!209479 (getCurrentListMapNoExtraKeys!1811 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463792 () Bool)

(declare-fun res!277304 () Bool)

(assert (=> b!463792 (=> (not res!277304) (not e!270834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29015 (_ BitVec 32)) Bool)

(assert (=> b!463792 (= res!277304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463793 () Bool)

(declare-fun res!277303 () Bool)

(assert (=> b!463793 (=> (not res!277303) (not e!270834))))

(declare-datatypes ((List!8413 0))(
  ( (Nil!8410) (Cons!8409 (h!9265 (_ BitVec 64)) (t!14359 List!8413)) )
))
(declare-fun arrayNoDuplicates!0 (array!29015 (_ BitVec 32) List!8413) Bool)

(assert (=> b!463793 (= res!277303 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8410))))

(declare-fun b!463794 () Bool)

(assert (=> b!463794 (= e!270837 tp_is_empty!12613)))

(declare-fun b!463795 () Bool)

(assert (=> b!463795 (= e!270835 (and e!270833 mapRes!20596))))

(declare-fun condMapEmpty!20596 () Bool)

(declare-fun mapDefault!20596 () ValueCell!5963)

