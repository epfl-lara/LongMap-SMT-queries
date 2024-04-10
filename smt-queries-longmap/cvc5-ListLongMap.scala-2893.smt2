; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41500 () Bool)

(assert start!41500)

(declare-fun b_free!11167 () Bool)

(declare-fun b_next!11167 () Bool)

(assert (=> start!41500 (= b_free!11167 (not b_next!11167))))

(declare-fun tp!39498 () Bool)

(declare-fun b_and!19507 () Bool)

(assert (=> start!41500 (= tp!39498 b_and!19507)))

(declare-fun b!463600 () Bool)

(declare-fun res!277194 () Bool)

(declare-fun e!270700 () Bool)

(assert (=> b!463600 (=> (not res!277194) (not e!270700))))

(declare-datatypes ((array!28983 0))(
  ( (array!28984 (arr!13923 (Array (_ BitVec 32) (_ BitVec 64))) (size!14275 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28983)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28983 (_ BitVec 32)) Bool)

(assert (=> b!463600 (= res!277194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463601 () Bool)

(declare-fun res!277195 () Bool)

(assert (=> b!463601 (=> (not res!277195) (not e!270700))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17899 0))(
  ( (V!17900 (val!6342 Int)) )
))
(declare-datatypes ((ValueCell!5954 0))(
  ( (ValueCellFull!5954 (v!8629 V!17899)) (EmptyCell!5954) )
))
(declare-datatypes ((array!28985 0))(
  ( (array!28986 (arr!13924 (Array (_ BitVec 32) ValueCell!5954)) (size!14276 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28985)

(assert (=> b!463601 (= res!277195 (and (= (size!14276 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14275 _keys!1025) (size!14276 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20569 () Bool)

(declare-fun mapRes!20569 () Bool)

(assert (=> mapIsEmpty!20569 mapRes!20569))

(declare-fun b!463602 () Bool)

(declare-fun e!270701 () Bool)

(declare-fun tp_is_empty!12595 () Bool)

(assert (=> b!463602 (= e!270701 tp_is_empty!12595)))

(declare-fun b!463603 () Bool)

(declare-fun res!277193 () Bool)

(assert (=> b!463603 (=> (not res!277193) (not e!270700))))

(declare-datatypes ((List!8400 0))(
  ( (Nil!8397) (Cons!8396 (h!9252 (_ BitVec 64)) (t!14346 List!8400)) )
))
(declare-fun arrayNoDuplicates!0 (array!28983 (_ BitVec 32) List!8400) Bool)

(assert (=> b!463603 (= res!277193 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8397))))

(declare-fun b!463604 () Bool)

(declare-fun e!270698 () Bool)

(declare-fun e!270702 () Bool)

(assert (=> b!463604 (= e!270698 (and e!270702 mapRes!20569))))

(declare-fun condMapEmpty!20569 () Bool)

(declare-fun mapDefault!20569 () ValueCell!5954)

