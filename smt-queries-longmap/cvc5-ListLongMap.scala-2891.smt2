; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41488 () Bool)

(assert start!41488)

(declare-fun b_free!11155 () Bool)

(declare-fun b_next!11155 () Bool)

(assert (=> start!41488 (= b_free!11155 (not b_next!11155))))

(declare-fun tp!39462 () Bool)

(declare-fun b_and!19495 () Bool)

(assert (=> start!41488 (= tp!39462 b_and!19495)))

(declare-fun b!463474 () Bool)

(declare-fun e!270609 () Bool)

(declare-fun tp_is_empty!12583 () Bool)

(assert (=> b!463474 (= e!270609 tp_is_empty!12583)))

(declare-fun b!463475 () Bool)

(declare-fun e!270611 () Bool)

(assert (=> b!463475 (= e!270611 tp_is_empty!12583)))

(declare-fun b!463476 () Bool)

(declare-fun e!270612 () Bool)

(assert (=> b!463476 (= e!270612 false)))

(declare-datatypes ((V!17883 0))(
  ( (V!17884 (val!6336 Int)) )
))
(declare-fun zeroValue!794 () V!17883)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8298 0))(
  ( (tuple2!8299 (_1!4160 (_ BitVec 64)) (_2!4160 V!17883)) )
))
(declare-datatypes ((List!8392 0))(
  ( (Nil!8389) (Cons!8388 (h!9244 tuple2!8298) (t!14338 List!8392)) )
))
(declare-datatypes ((ListLongMap!7211 0))(
  ( (ListLongMap!7212 (toList!3621 List!8392)) )
))
(declare-fun lt!209389 () ListLongMap!7211)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28961 0))(
  ( (array!28962 (arr!13912 (Array (_ BitVec 32) (_ BitVec 64))) (size!14264 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28961)

(declare-datatypes ((ValueCell!5948 0))(
  ( (ValueCellFull!5948 (v!8623 V!17883)) (EmptyCell!5948) )
))
(declare-datatypes ((array!28963 0))(
  ( (array!28964 (arr!13913 (Array (_ BitVec 32) ValueCell!5948)) (size!14265 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28963)

(declare-fun minValueAfter!38 () V!17883)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1801 (array!28961 array!28963 (_ BitVec 32) (_ BitVec 32) V!17883 V!17883 (_ BitVec 32) Int) ListLongMap!7211)

(assert (=> b!463476 (= lt!209389 (getCurrentListMapNoExtraKeys!1801 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209390 () ListLongMap!7211)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17883)

(assert (=> b!463476 (= lt!209390 (getCurrentListMapNoExtraKeys!1801 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277122 () Bool)

(assert (=> start!41488 (=> (not res!277122) (not e!270612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41488 (= res!277122 (validMask!0 mask!1365))))

(assert (=> start!41488 e!270612))

(assert (=> start!41488 tp_is_empty!12583))

(assert (=> start!41488 tp!39462))

(assert (=> start!41488 true))

(declare-fun array_inv!10056 (array!28961) Bool)

(assert (=> start!41488 (array_inv!10056 _keys!1025)))

(declare-fun e!270608 () Bool)

(declare-fun array_inv!10057 (array!28963) Bool)

(assert (=> start!41488 (and (array_inv!10057 _values!833) e!270608)))

(declare-fun mapNonEmpty!20551 () Bool)

(declare-fun mapRes!20551 () Bool)

(declare-fun tp!39463 () Bool)

(assert (=> mapNonEmpty!20551 (= mapRes!20551 (and tp!39463 e!270611))))

(declare-fun mapRest!20551 () (Array (_ BitVec 32) ValueCell!5948))

(declare-fun mapValue!20551 () ValueCell!5948)

(declare-fun mapKey!20551 () (_ BitVec 32))

(assert (=> mapNonEmpty!20551 (= (arr!13913 _values!833) (store mapRest!20551 mapKey!20551 mapValue!20551))))

(declare-fun b!463477 () Bool)

(declare-fun res!277121 () Bool)

(assert (=> b!463477 (=> (not res!277121) (not e!270612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28961 (_ BitVec 32)) Bool)

(assert (=> b!463477 (= res!277121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463478 () Bool)

(declare-fun res!277124 () Bool)

(assert (=> b!463478 (=> (not res!277124) (not e!270612))))

(assert (=> b!463478 (= res!277124 (and (= (size!14265 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14264 _keys!1025) (size!14265 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20551 () Bool)

(assert (=> mapIsEmpty!20551 mapRes!20551))

(declare-fun b!463479 () Bool)

(declare-fun res!277123 () Bool)

(assert (=> b!463479 (=> (not res!277123) (not e!270612))))

(declare-datatypes ((List!8393 0))(
  ( (Nil!8390) (Cons!8389 (h!9245 (_ BitVec 64)) (t!14339 List!8393)) )
))
(declare-fun arrayNoDuplicates!0 (array!28961 (_ BitVec 32) List!8393) Bool)

(assert (=> b!463479 (= res!277123 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8390))))

(declare-fun b!463480 () Bool)

(assert (=> b!463480 (= e!270608 (and e!270609 mapRes!20551))))

(declare-fun condMapEmpty!20551 () Bool)

(declare-fun mapDefault!20551 () ValueCell!5948)

