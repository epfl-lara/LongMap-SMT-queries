; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41560 () Bool)

(assert start!41560)

(declare-fun b_free!11227 () Bool)

(declare-fun b_next!11227 () Bool)

(assert (=> start!41560 (= b_free!11227 (not b_next!11227))))

(declare-fun tp!39678 () Bool)

(declare-fun b_and!19567 () Bool)

(assert (=> start!41560 (= tp!39678 b_and!19567)))

(declare-fun b!464230 () Bool)

(declare-fun res!277556 () Bool)

(declare-fun e!271148 () Bool)

(assert (=> b!464230 (=> (not res!277556) (not e!271148))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29099 0))(
  ( (array!29100 (arr!13981 (Array (_ BitVec 32) (_ BitVec 64))) (size!14333 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29099)

(declare-datatypes ((V!17979 0))(
  ( (V!17980 (val!6372 Int)) )
))
(declare-datatypes ((ValueCell!5984 0))(
  ( (ValueCellFull!5984 (v!8659 V!17979)) (EmptyCell!5984) )
))
(declare-datatypes ((array!29101 0))(
  ( (array!29102 (arr!13982 (Array (_ BitVec 32) ValueCell!5984)) (size!14334 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29101)

(assert (=> b!464230 (= res!277556 (and (= (size!14334 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14333 _keys!1025) (size!14334 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464231 () Bool)

(declare-fun e!271150 () Bool)

(declare-fun e!271149 () Bool)

(declare-fun mapRes!20659 () Bool)

(assert (=> b!464231 (= e!271150 (and e!271149 mapRes!20659))))

(declare-fun condMapEmpty!20659 () Bool)

(declare-fun mapDefault!20659 () ValueCell!5984)

