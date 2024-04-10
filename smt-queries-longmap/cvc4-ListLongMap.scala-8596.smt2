; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104810 () Bool)

(assert start!104810)

(declare-fun b_free!26615 () Bool)

(declare-fun b_next!26615 () Bool)

(assert (=> start!104810 (= b_free!26615 (not b_next!26615))))

(declare-fun tp!93335 () Bool)

(declare-fun b_and!44383 () Bool)

(assert (=> start!104810 (= tp!93335 b_and!44383)))

(declare-fun b!1249347 () Bool)

(declare-fun res!833413 () Bool)

(declare-fun e!709069 () Bool)

(assert (=> b!1249347 (=> (not res!833413) (not e!709069))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80716 0))(
  ( (array!80717 (arr!38925 (Array (_ BitVec 32) (_ BitVec 64))) (size!39461 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80716)

(declare-datatypes ((V!47387 0))(
  ( (V!47388 (val!15821 Int)) )
))
(declare-datatypes ((ValueCell!14995 0))(
  ( (ValueCellFull!14995 (v!18517 V!47387)) (EmptyCell!14995) )
))
(declare-datatypes ((array!80718 0))(
  ( (array!80719 (arr!38926 (Array (_ BitVec 32) ValueCell!14995)) (size!39462 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80718)

(assert (=> b!1249347 (= res!833413 (and (= (size!39462 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39461 _keys!1118) (size!39462 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49036 () Bool)

(declare-fun mapRes!49036 () Bool)

(assert (=> mapIsEmpty!49036 mapRes!49036))

(declare-fun b!1249348 () Bool)

(declare-fun e!709070 () Bool)

(declare-fun tp_is_empty!31517 () Bool)

(assert (=> b!1249348 (= e!709070 tp_is_empty!31517)))

(declare-fun b!1249349 () Bool)

(declare-fun e!709068 () Bool)

(declare-fun e!709072 () Bool)

(assert (=> b!1249349 (= e!709068 (and e!709072 mapRes!49036))))

(declare-fun condMapEmpty!49036 () Bool)

(declare-fun mapDefault!49036 () ValueCell!14995)

