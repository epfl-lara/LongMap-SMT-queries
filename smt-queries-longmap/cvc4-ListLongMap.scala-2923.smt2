; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41712 () Bool)

(assert start!41712)

(declare-fun b_free!11351 () Bool)

(declare-fun b_next!11351 () Bool)

(assert (=> start!41712 (= b_free!11351 (not b_next!11351))))

(declare-fun tp!40057 () Bool)

(declare-fun b_and!19707 () Bool)

(assert (=> start!41712 (= tp!40057 b_and!19707)))

(declare-fun b!465746 () Bool)

(declare-fun res!278406 () Bool)

(declare-fun e!272233 () Bool)

(assert (=> b!465746 (=> (not res!278406) (not e!272233))))

(declare-datatypes ((array!29339 0))(
  ( (array!29340 (arr!14099 (Array (_ BitVec 32) (_ BitVec 64))) (size!14451 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29339)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29339 (_ BitVec 32)) Bool)

(assert (=> b!465746 (= res!278406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465747 () Bool)

(declare-fun res!278404 () Bool)

(assert (=> b!465747 (=> (not res!278404) (not e!272233))))

(declare-datatypes ((List!8523 0))(
  ( (Nil!8520) (Cons!8519 (h!9375 (_ BitVec 64)) (t!14473 List!8523)) )
))
(declare-fun arrayNoDuplicates!0 (array!29339 (_ BitVec 32) List!8523) Bool)

(assert (=> b!465747 (= res!278404 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8520))))

(declare-fun b!465748 () Bool)

(declare-fun res!278403 () Bool)

(assert (=> b!465748 (=> (not res!278403) (not e!272233))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18143 0))(
  ( (V!18144 (val!6434 Int)) )
))
(declare-datatypes ((ValueCell!6046 0))(
  ( (ValueCellFull!6046 (v!8721 V!18143)) (EmptyCell!6046) )
))
(declare-datatypes ((array!29341 0))(
  ( (array!29342 (arr!14100 (Array (_ BitVec 32) ValueCell!6046)) (size!14452 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29341)

(assert (=> b!465748 (= res!278403 (and (= (size!14452 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14451 _keys!1025) (size!14452 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465749 () Bool)

(declare-fun e!272234 () Bool)

(declare-fun e!272235 () Bool)

(declare-fun mapRes!20851 () Bool)

(assert (=> b!465749 (= e!272234 (and e!272235 mapRes!20851))))

(declare-fun condMapEmpty!20851 () Bool)

(declare-fun mapDefault!20851 () ValueCell!6046)

