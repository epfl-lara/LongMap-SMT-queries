; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41510 () Bool)

(assert start!41510)

(declare-fun b_free!11177 () Bool)

(declare-fun b_next!11177 () Bool)

(assert (=> start!41510 (= b_free!11177 (not b_next!11177))))

(declare-fun tp!39529 () Bool)

(declare-fun b_and!19517 () Bool)

(assert (=> start!41510 (= tp!39529 b_and!19517)))

(declare-fun b!463705 () Bool)

(declare-fun res!277256 () Bool)

(declare-fun e!270777 () Bool)

(assert (=> b!463705 (=> (not res!277256) (not e!270777))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29003 0))(
  ( (array!29004 (arr!13933 (Array (_ BitVec 32) (_ BitVec 64))) (size!14285 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29003)

(declare-datatypes ((V!17911 0))(
  ( (V!17912 (val!6347 Int)) )
))
(declare-datatypes ((ValueCell!5959 0))(
  ( (ValueCellFull!5959 (v!8634 V!17911)) (EmptyCell!5959) )
))
(declare-datatypes ((array!29005 0))(
  ( (array!29006 (arr!13934 (Array (_ BitVec 32) ValueCell!5959)) (size!14286 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29005)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!463705 (= res!277256 (and (= (size!14286 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14285 _keys!1025) (size!14286 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463706 () Bool)

(declare-fun res!277253 () Bool)

(assert (=> b!463706 (=> (not res!277253) (not e!270777))))

(declare-datatypes ((List!8408 0))(
  ( (Nil!8405) (Cons!8404 (h!9260 (_ BitVec 64)) (t!14354 List!8408)) )
))
(declare-fun arrayNoDuplicates!0 (array!29003 (_ BitVec 32) List!8408) Bool)

(assert (=> b!463706 (= res!277253 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8405))))

(declare-fun mapNonEmpty!20584 () Bool)

(declare-fun mapRes!20584 () Bool)

(declare-fun tp!39528 () Bool)

(declare-fun e!270776 () Bool)

(assert (=> mapNonEmpty!20584 (= mapRes!20584 (and tp!39528 e!270776))))

(declare-fun mapValue!20584 () ValueCell!5959)

(declare-fun mapKey!20584 () (_ BitVec 32))

(declare-fun mapRest!20584 () (Array (_ BitVec 32) ValueCell!5959))

(assert (=> mapNonEmpty!20584 (= (arr!13934 _values!833) (store mapRest!20584 mapKey!20584 mapValue!20584))))

(declare-fun b!463707 () Bool)

(declare-fun e!270773 () Bool)

(declare-fun tp_is_empty!12605 () Bool)

(assert (=> b!463707 (= e!270773 tp_is_empty!12605)))

(declare-fun b!463708 () Bool)

(assert (=> b!463708 (= e!270777 false)))

(declare-fun zeroValue!794 () V!17911)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8314 0))(
  ( (tuple2!8315 (_1!4168 (_ BitVec 64)) (_2!4168 V!17911)) )
))
(declare-datatypes ((List!8409 0))(
  ( (Nil!8406) (Cons!8405 (h!9261 tuple2!8314) (t!14355 List!8409)) )
))
(declare-datatypes ((ListLongMap!7227 0))(
  ( (ListLongMap!7228 (toList!3629 List!8409)) )
))
(declare-fun lt!209455 () ListLongMap!7227)

(declare-fun minValueAfter!38 () V!17911)

(declare-fun getCurrentListMapNoExtraKeys!1809 (array!29003 array!29005 (_ BitVec 32) (_ BitVec 32) V!17911 V!17911 (_ BitVec 32) Int) ListLongMap!7227)

(assert (=> b!463708 (= lt!209455 (getCurrentListMapNoExtraKeys!1809 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17911)

(declare-fun lt!209456 () ListLongMap!7227)

(assert (=> b!463708 (= lt!209456 (getCurrentListMapNoExtraKeys!1809 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463709 () Bool)

(declare-fun res!277254 () Bool)

(assert (=> b!463709 (=> (not res!277254) (not e!270777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29003 (_ BitVec 32)) Bool)

(assert (=> b!463709 (= res!277254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20584 () Bool)

(assert (=> mapIsEmpty!20584 mapRes!20584))

(declare-fun res!277255 () Bool)

(assert (=> start!41510 (=> (not res!277255) (not e!270777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41510 (= res!277255 (validMask!0 mask!1365))))

(assert (=> start!41510 e!270777))

(assert (=> start!41510 tp_is_empty!12605))

(assert (=> start!41510 tp!39529))

(assert (=> start!41510 true))

(declare-fun array_inv!10070 (array!29003) Bool)

(assert (=> start!41510 (array_inv!10070 _keys!1025)))

(declare-fun e!270774 () Bool)

(declare-fun array_inv!10071 (array!29005) Bool)

(assert (=> start!41510 (and (array_inv!10071 _values!833) e!270774)))

(declare-fun b!463710 () Bool)

(assert (=> b!463710 (= e!270776 tp_is_empty!12605)))

(declare-fun b!463711 () Bool)

(assert (=> b!463711 (= e!270774 (and e!270773 mapRes!20584))))

(declare-fun condMapEmpty!20584 () Bool)

(declare-fun mapDefault!20584 () ValueCell!5959)

