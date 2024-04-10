; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41530 () Bool)

(assert start!41530)

(declare-fun b_free!11197 () Bool)

(declare-fun b_next!11197 () Bool)

(assert (=> start!41530 (= b_free!11197 (not b_next!11197))))

(declare-fun tp!39589 () Bool)

(declare-fun b_and!19537 () Bool)

(assert (=> start!41530 (= tp!39589 b_and!19537)))

(declare-fun b!463915 () Bool)

(declare-fun res!277376 () Bool)

(declare-fun e!270924 () Bool)

(assert (=> b!463915 (=> (not res!277376) (not e!270924))))

(declare-datatypes ((array!29039 0))(
  ( (array!29040 (arr!13951 (Array (_ BitVec 32) (_ BitVec 64))) (size!14303 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29039)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29039 (_ BitVec 32)) Bool)

(assert (=> b!463915 (= res!277376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20614 () Bool)

(declare-fun mapRes!20614 () Bool)

(assert (=> mapIsEmpty!20614 mapRes!20614))

(declare-fun b!463916 () Bool)

(assert (=> b!463916 (= e!270924 false)))

(declare-datatypes ((V!17939 0))(
  ( (V!17940 (val!6357 Int)) )
))
(declare-fun zeroValue!794 () V!17939)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8326 0))(
  ( (tuple2!8327 (_1!4174 (_ BitVec 64)) (_2!4174 V!17939)) )
))
(declare-datatypes ((List!8421 0))(
  ( (Nil!8418) (Cons!8417 (h!9273 tuple2!8326) (t!14367 List!8421)) )
))
(declare-datatypes ((ListLongMap!7239 0))(
  ( (ListLongMap!7240 (toList!3635 List!8421)) )
))
(declare-fun lt!209516 () ListLongMap!7239)

(declare-datatypes ((ValueCell!5969 0))(
  ( (ValueCellFull!5969 (v!8644 V!17939)) (EmptyCell!5969) )
))
(declare-datatypes ((array!29041 0))(
  ( (array!29042 (arr!13952 (Array (_ BitVec 32) ValueCell!5969)) (size!14304 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29041)

(declare-fun minValueAfter!38 () V!17939)

(declare-fun getCurrentListMapNoExtraKeys!1815 (array!29039 array!29041 (_ BitVec 32) (_ BitVec 32) V!17939 V!17939 (_ BitVec 32) Int) ListLongMap!7239)

(assert (=> b!463916 (= lt!209516 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17939)

(declare-fun lt!209515 () ListLongMap!7239)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463916 (= lt!209515 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463917 () Bool)

(declare-fun res!277374 () Bool)

(assert (=> b!463917 (=> (not res!277374) (not e!270924))))

(assert (=> b!463917 (= res!277374 (and (= (size!14304 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14303 _keys!1025) (size!14304 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463918 () Bool)

(declare-fun res!277375 () Bool)

(assert (=> b!463918 (=> (not res!277375) (not e!270924))))

(declare-datatypes ((List!8422 0))(
  ( (Nil!8419) (Cons!8418 (h!9274 (_ BitVec 64)) (t!14368 List!8422)) )
))
(declare-fun arrayNoDuplicates!0 (array!29039 (_ BitVec 32) List!8422) Bool)

(assert (=> b!463918 (= res!277375 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8419))))

(declare-fun b!463919 () Bool)

(declare-fun e!270926 () Bool)

(declare-fun tp_is_empty!12625 () Bool)

(assert (=> b!463919 (= e!270926 tp_is_empty!12625)))

(declare-fun mapNonEmpty!20614 () Bool)

(declare-fun tp!39588 () Bool)

(declare-fun e!270925 () Bool)

(assert (=> mapNonEmpty!20614 (= mapRes!20614 (and tp!39588 e!270925))))

(declare-fun mapKey!20614 () (_ BitVec 32))

(declare-fun mapRest!20614 () (Array (_ BitVec 32) ValueCell!5969))

(declare-fun mapValue!20614 () ValueCell!5969)

(assert (=> mapNonEmpty!20614 (= (arr!13952 _values!833) (store mapRest!20614 mapKey!20614 mapValue!20614))))

(declare-fun b!463921 () Bool)

(declare-fun e!270927 () Bool)

(assert (=> b!463921 (= e!270927 (and e!270926 mapRes!20614))))

(declare-fun condMapEmpty!20614 () Bool)

(declare-fun mapDefault!20614 () ValueCell!5969)

