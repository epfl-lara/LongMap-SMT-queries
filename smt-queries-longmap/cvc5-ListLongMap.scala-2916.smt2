; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41652 () Bool)

(assert start!41652)

(declare-fun b_free!11305 () Bool)

(declare-fun b_next!11305 () Bool)

(assert (=> start!41652 (= b_free!11305 (not b_next!11305))))

(declare-fun tp!39916 () Bool)

(declare-fun b_and!19653 () Bool)

(assert (=> start!41652 (= tp!39916 b_and!19653)))

(declare-fun b!465135 () Bool)

(declare-fun res!278054 () Bool)

(declare-fun e!271790 () Bool)

(assert (=> b!465135 (=> (not res!278054) (not e!271790))))

(declare-datatypes ((array!29251 0))(
  ( (array!29252 (arr!14056 (Array (_ BitVec 32) (_ BitVec 64))) (size!14408 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29251)

(declare-datatypes ((List!8494 0))(
  ( (Nil!8491) (Cons!8490 (h!9346 (_ BitVec 64)) (t!14442 List!8494)) )
))
(declare-fun arrayNoDuplicates!0 (array!29251 (_ BitVec 32) List!8494) Bool)

(assert (=> b!465135 (= res!278054 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8491))))

(declare-fun mapNonEmpty!20779 () Bool)

(declare-fun mapRes!20779 () Bool)

(declare-fun tp!39915 () Bool)

(declare-fun e!271792 () Bool)

(assert (=> mapNonEmpty!20779 (= mapRes!20779 (and tp!39915 e!271792))))

(declare-datatypes ((V!18083 0))(
  ( (V!18084 (val!6411 Int)) )
))
(declare-datatypes ((ValueCell!6023 0))(
  ( (ValueCellFull!6023 (v!8698 V!18083)) (EmptyCell!6023) )
))
(declare-datatypes ((array!29253 0))(
  ( (array!29254 (arr!14057 (Array (_ BitVec 32) ValueCell!6023)) (size!14409 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29253)

(declare-fun mapKey!20779 () (_ BitVec 32))

(declare-fun mapRest!20779 () (Array (_ BitVec 32) ValueCell!6023))

(declare-fun mapValue!20779 () ValueCell!6023)

(assert (=> mapNonEmpty!20779 (= (arr!14057 _values!833) (store mapRest!20779 mapKey!20779 mapValue!20779))))

(declare-fun b!465136 () Bool)

(declare-fun tp_is_empty!12733 () Bool)

(assert (=> b!465136 (= e!271792 tp_is_empty!12733)))

(declare-fun mapIsEmpty!20779 () Bool)

(assert (=> mapIsEmpty!20779 mapRes!20779))

(declare-fun b!465137 () Bool)

(declare-fun res!278055 () Bool)

(assert (=> b!465137 (=> (not res!278055) (not e!271790))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29251 (_ BitVec 32)) Bool)

(assert (=> b!465137 (= res!278055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465138 () Bool)

(declare-fun res!278053 () Bool)

(assert (=> b!465138 (=> (not res!278053) (not e!271790))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!465138 (= res!278053 (and (= (size!14409 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14408 _keys!1025) (size!14409 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465139 () Bool)

(declare-fun e!271789 () Bool)

(declare-fun e!271791 () Bool)

(assert (=> b!465139 (= e!271789 (and e!271791 mapRes!20779))))

(declare-fun condMapEmpty!20779 () Bool)

(declare-fun mapDefault!20779 () ValueCell!6023)

