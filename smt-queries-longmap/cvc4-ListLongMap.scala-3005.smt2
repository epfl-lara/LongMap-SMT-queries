; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42352 () Bool)

(assert start!42352)

(declare-fun b_free!11843 () Bool)

(declare-fun b_next!11843 () Bool)

(assert (=> start!42352 (= b_free!11843 (not b_next!11843))))

(declare-fun tp!41560 () Bool)

(declare-fun b_and!20289 () Bool)

(assert (=> start!42352 (= tp!41560 b_and!20289)))

(declare-fun b!472540 () Bool)

(declare-fun res!282272 () Bool)

(declare-fun e!277098 () Bool)

(assert (=> b!472540 (=> (not res!282272) (not e!277098))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30299 0))(
  ( (array!30300 (arr!14570 (Array (_ BitVec 32) (_ BitVec 64))) (size!14922 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30299)

(declare-datatypes ((V!18799 0))(
  ( (V!18800 (val!6680 Int)) )
))
(declare-datatypes ((ValueCell!6292 0))(
  ( (ValueCellFull!6292 (v!8971 V!18799)) (EmptyCell!6292) )
))
(declare-datatypes ((array!30301 0))(
  ( (array!30302 (arr!14571 (Array (_ BitVec 32) ValueCell!6292)) (size!14923 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30301)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472540 (= res!282272 (and (= (size!14923 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14922 _keys!1025) (size!14923 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472541 () Bool)

(declare-fun e!277094 () Bool)

(declare-fun e!277097 () Bool)

(declare-fun mapRes!21616 () Bool)

(assert (=> b!472541 (= e!277094 (and e!277097 mapRes!21616))))

(declare-fun condMapEmpty!21616 () Bool)

(declare-fun mapDefault!21616 () ValueCell!6292)

