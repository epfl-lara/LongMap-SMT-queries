; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41640 () Bool)

(assert start!41640)

(declare-fun b_free!11293 () Bool)

(declare-fun b_next!11293 () Bool)

(assert (=> start!41640 (= b_free!11293 (not b_next!11293))))

(declare-fun tp!39880 () Bool)

(declare-fun b_and!19641 () Bool)

(assert (=> start!41640 (= tp!39880 b_and!19641)))

(declare-fun mapNonEmpty!20761 () Bool)

(declare-fun mapRes!20761 () Bool)

(declare-fun tp!39879 () Bool)

(declare-fun e!271702 () Bool)

(assert (=> mapNonEmpty!20761 (= mapRes!20761 (and tp!39879 e!271702))))

(declare-fun mapKey!20761 () (_ BitVec 32))

(declare-datatypes ((V!18067 0))(
  ( (V!18068 (val!6405 Int)) )
))
(declare-datatypes ((ValueCell!6017 0))(
  ( (ValueCellFull!6017 (v!8692 V!18067)) (EmptyCell!6017) )
))
(declare-datatypes ((array!29227 0))(
  ( (array!29228 (arr!14044 (Array (_ BitVec 32) ValueCell!6017)) (size!14396 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29227)

(declare-fun mapValue!20761 () ValueCell!6017)

(declare-fun mapRest!20761 () (Array (_ BitVec 32) ValueCell!6017))

(assert (=> mapNonEmpty!20761 (= (arr!14044 _values!833) (store mapRest!20761 mapKey!20761 mapValue!20761))))

(declare-fun res!277982 () Bool)

(declare-fun e!271699 () Bool)

(assert (=> start!41640 (=> (not res!277982) (not e!271699))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41640 (= res!277982 (validMask!0 mask!1365))))

(assert (=> start!41640 e!271699))

(declare-fun tp_is_empty!12721 () Bool)

(assert (=> start!41640 tp_is_empty!12721))

(assert (=> start!41640 tp!39880))

(assert (=> start!41640 true))

(declare-datatypes ((array!29229 0))(
  ( (array!29230 (arr!14045 (Array (_ BitVec 32) (_ BitVec 64))) (size!14397 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29229)

(declare-fun array_inv!10146 (array!29229) Bool)

(assert (=> start!41640 (array_inv!10146 _keys!1025)))

(declare-fun e!271700 () Bool)

(declare-fun array_inv!10147 (array!29227) Bool)

(assert (=> start!41640 (and (array_inv!10147 _values!833) e!271700)))

(declare-fun b!465008 () Bool)

(declare-fun res!277980 () Bool)

(assert (=> b!465008 (=> (not res!277980) (not e!271699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29229 (_ BitVec 32)) Bool)

(assert (=> b!465008 (= res!277980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465009 () Bool)

(assert (=> b!465009 (= e!271699 (not true))))

(declare-datatypes ((tuple2!8394 0))(
  ( (tuple2!8395 (_1!4208 (_ BitVec 64)) (_2!4208 V!18067)) )
))
(declare-datatypes ((List!8485 0))(
  ( (Nil!8482) (Cons!8481 (h!9337 tuple2!8394) (t!14433 List!8485)) )
))
(declare-datatypes ((ListLongMap!7307 0))(
  ( (ListLongMap!7308 (toList!3669 List!8485)) )
))
(declare-fun lt!209962 () ListLongMap!7307)

(declare-fun lt!209964 () ListLongMap!7307)

(assert (=> b!465009 (= lt!209962 lt!209964)))

(declare-fun minValueBefore!38 () V!18067)

(declare-fun zeroValue!794 () V!18067)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13506 0))(
  ( (Unit!13507) )
))
(declare-fun lt!209963 () Unit!13506)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18067)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!29 (array!29229 array!29227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 V!18067 V!18067 (_ BitVec 32) Int) Unit!13506)

(assert (=> b!465009 (= lt!209963 (lemmaNoChangeToArrayThenSameMapNoExtras!29 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1849 (array!29229 array!29227 (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 (_ BitVec 32) Int) ListLongMap!7307)

(assert (=> b!465009 (= lt!209964 (getCurrentListMapNoExtraKeys!1849 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465009 (= lt!209962 (getCurrentListMapNoExtraKeys!1849 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465010 () Bool)

(declare-fun res!277981 () Bool)

(assert (=> b!465010 (=> (not res!277981) (not e!271699))))

(declare-datatypes ((List!8486 0))(
  ( (Nil!8483) (Cons!8482 (h!9338 (_ BitVec 64)) (t!14434 List!8486)) )
))
(declare-fun arrayNoDuplicates!0 (array!29229 (_ BitVec 32) List!8486) Bool)

(assert (=> b!465010 (= res!277981 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8483))))

(declare-fun mapIsEmpty!20761 () Bool)

(assert (=> mapIsEmpty!20761 mapRes!20761))

(declare-fun b!465011 () Bool)

(assert (=> b!465011 (= e!271702 tp_is_empty!12721)))

(declare-fun b!465012 () Bool)

(declare-fun e!271698 () Bool)

(assert (=> b!465012 (= e!271698 tp_is_empty!12721)))

(declare-fun b!465013 () Bool)

(assert (=> b!465013 (= e!271700 (and e!271698 mapRes!20761))))

(declare-fun condMapEmpty!20761 () Bool)

(declare-fun mapDefault!20761 () ValueCell!6017)

