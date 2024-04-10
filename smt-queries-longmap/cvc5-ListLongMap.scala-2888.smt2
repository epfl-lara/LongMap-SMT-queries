; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41458 () Bool)

(assert start!41458)

(declare-fun b_free!11137 () Bool)

(declare-fun b_next!11137 () Bool)

(assert (=> start!41458 (= b_free!11137 (not b_next!11137))))

(declare-fun tp!39405 () Bool)

(declare-fun b_and!19473 () Bool)

(assert (=> start!41458 (= tp!39405 b_and!19473)))

(declare-fun mapIsEmpty!20521 () Bool)

(declare-fun mapRes!20521 () Bool)

(assert (=> mapIsEmpty!20521 mapRes!20521))

(declare-fun b!463212 () Bool)

(declare-fun res!276986 () Bool)

(declare-fun e!270428 () Bool)

(assert (=> b!463212 (=> (not res!276986) (not e!270428))))

(declare-datatypes ((array!28925 0))(
  ( (array!28926 (arr!13895 (Array (_ BitVec 32) (_ BitVec 64))) (size!14247 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28925)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28925 (_ BitVec 32)) Bool)

(assert (=> b!463212 (= res!276986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463213 () Bool)

(declare-fun e!270426 () Bool)

(declare-fun tp_is_empty!12565 () Bool)

(assert (=> b!463213 (= e!270426 tp_is_empty!12565)))

(declare-fun b!463214 () Bool)

(declare-fun e!270425 () Bool)

(assert (=> b!463214 (= e!270425 tp_is_empty!12565)))

(declare-fun b!463215 () Bool)

(declare-fun res!276988 () Bool)

(assert (=> b!463215 (=> (not res!276988) (not e!270428))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17859 0))(
  ( (V!17860 (val!6327 Int)) )
))
(declare-datatypes ((ValueCell!5939 0))(
  ( (ValueCellFull!5939 (v!8614 V!17859)) (EmptyCell!5939) )
))
(declare-datatypes ((array!28927 0))(
  ( (array!28928 (arr!13896 (Array (_ BitVec 32) ValueCell!5939)) (size!14248 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28927)

(assert (=> b!463215 (= res!276988 (and (= (size!14248 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14247 _keys!1025) (size!14248 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463216 () Bool)

(declare-fun res!276989 () Bool)

(assert (=> b!463216 (=> (not res!276989) (not e!270428))))

(declare-datatypes ((List!8379 0))(
  ( (Nil!8376) (Cons!8375 (h!9231 (_ BitVec 64)) (t!14323 List!8379)) )
))
(declare-fun arrayNoDuplicates!0 (array!28925 (_ BitVec 32) List!8379) Bool)

(assert (=> b!463216 (= res!276989 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8376))))

(declare-fun b!463217 () Bool)

(declare-fun e!270429 () Bool)

(assert (=> b!463217 (= e!270429 (and e!270426 mapRes!20521))))

(declare-fun condMapEmpty!20521 () Bool)

(declare-fun mapDefault!20521 () ValueCell!5939)

