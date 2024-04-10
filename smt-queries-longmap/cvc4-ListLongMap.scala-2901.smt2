; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41552 () Bool)

(assert start!41552)

(declare-fun b_free!11219 () Bool)

(declare-fun b_next!11219 () Bool)

(assert (=> start!41552 (= b_free!11219 (not b_next!11219))))

(declare-fun tp!39654 () Bool)

(declare-fun b_and!19559 () Bool)

(assert (=> start!41552 (= tp!39654 b_and!19559)))

(declare-fun b!464146 () Bool)

(declare-fun res!277507 () Bool)

(declare-fun e!271092 () Bool)

(assert (=> b!464146 (=> (not res!277507) (not e!271092))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29083 0))(
  ( (array!29084 (arr!13973 (Array (_ BitVec 32) (_ BitVec 64))) (size!14325 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29083)

(declare-datatypes ((V!17967 0))(
  ( (V!17968 (val!6368 Int)) )
))
(declare-datatypes ((ValueCell!5980 0))(
  ( (ValueCellFull!5980 (v!8655 V!17967)) (EmptyCell!5980) )
))
(declare-datatypes ((array!29085 0))(
  ( (array!29086 (arr!13974 (Array (_ BitVec 32) ValueCell!5980)) (size!14326 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29085)

(assert (=> b!464146 (= res!277507 (and (= (size!14326 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14325 _keys!1025) (size!14326 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464147 () Bool)

(declare-fun e!271091 () Bool)

(declare-fun e!271090 () Bool)

(declare-fun mapRes!20647 () Bool)

(assert (=> b!464147 (= e!271091 (and e!271090 mapRes!20647))))

(declare-fun condMapEmpty!20647 () Bool)

(declare-fun mapDefault!20647 () ValueCell!5980)

