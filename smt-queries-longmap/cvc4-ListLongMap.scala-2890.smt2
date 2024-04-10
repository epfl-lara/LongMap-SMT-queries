; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41486 () Bool)

(assert start!41486)

(declare-fun b_free!11153 () Bool)

(declare-fun b_next!11153 () Bool)

(assert (=> start!41486 (= b_free!11153 (not b_next!11153))))

(declare-fun tp!39456 () Bool)

(declare-fun b_and!19493 () Bool)

(assert (=> start!41486 (= tp!39456 b_and!19493)))

(declare-fun mapIsEmpty!20548 () Bool)

(declare-fun mapRes!20548 () Bool)

(assert (=> mapIsEmpty!20548 mapRes!20548))

(declare-fun b!463453 () Bool)

(declare-fun res!277111 () Bool)

(declare-fun e!270597 () Bool)

(assert (=> b!463453 (=> (not res!277111) (not e!270597))))

(declare-datatypes ((array!28957 0))(
  ( (array!28958 (arr!13910 (Array (_ BitVec 32) (_ BitVec 64))) (size!14262 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28957)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28957 (_ BitVec 32)) Bool)

(assert (=> b!463453 (= res!277111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463454 () Bool)

(declare-fun res!277109 () Bool)

(assert (=> b!463454 (=> (not res!277109) (not e!270597))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17879 0))(
  ( (V!17880 (val!6335 Int)) )
))
(declare-datatypes ((ValueCell!5947 0))(
  ( (ValueCellFull!5947 (v!8622 V!17879)) (EmptyCell!5947) )
))
(declare-datatypes ((array!28959 0))(
  ( (array!28960 (arr!13911 (Array (_ BitVec 32) ValueCell!5947)) (size!14263 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28959)

(assert (=> b!463454 (= res!277109 (and (= (size!14263 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14262 _keys!1025) (size!14263 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463455 () Bool)

(declare-fun res!277110 () Bool)

(assert (=> b!463455 (=> (not res!277110) (not e!270597))))

(declare-datatypes ((List!8391 0))(
  ( (Nil!8388) (Cons!8387 (h!9243 (_ BitVec 64)) (t!14337 List!8391)) )
))
(declare-fun arrayNoDuplicates!0 (array!28957 (_ BitVec 32) List!8391) Bool)

(assert (=> b!463455 (= res!277110 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8388))))

(declare-fun b!463456 () Bool)

(declare-fun e!270596 () Bool)

(declare-fun e!270595 () Bool)

(assert (=> b!463456 (= e!270596 (and e!270595 mapRes!20548))))

(declare-fun condMapEmpty!20548 () Bool)

(declare-fun mapDefault!20548 () ValueCell!5947)

