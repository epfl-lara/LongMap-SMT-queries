; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41584 () Bool)

(assert start!41584)

(declare-fun b_free!11251 () Bool)

(declare-fun b_next!11251 () Bool)

(assert (=> start!41584 (= b_free!11251 (not b_next!11251))))

(declare-fun tp!39750 () Bool)

(declare-fun b_and!19591 () Bool)

(assert (=> start!41584 (= tp!39750 b_and!19591)))

(declare-fun b!464482 () Bool)

(declare-fun res!277699 () Bool)

(declare-fun e!271332 () Bool)

(assert (=> b!464482 (=> (not res!277699) (not e!271332))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29145 0))(
  ( (array!29146 (arr!14004 (Array (_ BitVec 32) (_ BitVec 64))) (size!14356 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29145)

(declare-datatypes ((V!18011 0))(
  ( (V!18012 (val!6384 Int)) )
))
(declare-datatypes ((ValueCell!5996 0))(
  ( (ValueCellFull!5996 (v!8671 V!18011)) (EmptyCell!5996) )
))
(declare-datatypes ((array!29147 0))(
  ( (array!29148 (arr!14005 (Array (_ BitVec 32) ValueCell!5996)) (size!14357 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29147)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464482 (= res!277699 (and (= (size!14357 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14356 _keys!1025) (size!14357 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464483 () Bool)

(declare-fun res!277700 () Bool)

(assert (=> b!464483 (=> (not res!277700) (not e!271332))))

(declare-datatypes ((List!8456 0))(
  ( (Nil!8453) (Cons!8452 (h!9308 (_ BitVec 64)) (t!14402 List!8456)) )
))
(declare-fun arrayNoDuplicates!0 (array!29145 (_ BitVec 32) List!8456) Bool)

(assert (=> b!464483 (= res!277700 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8453))))

(declare-fun b!464484 () Bool)

(declare-fun e!271330 () Bool)

(declare-fun e!271329 () Bool)

(declare-fun mapRes!20695 () Bool)

(assert (=> b!464484 (= e!271330 (and e!271329 mapRes!20695))))

(declare-fun condMapEmpty!20695 () Bool)

(declare-fun mapDefault!20695 () ValueCell!5996)

