; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104686 () Bool)

(assert start!104686)

(declare-fun b_free!26503 () Bool)

(declare-fun b_next!26503 () Bool)

(assert (=> start!104686 (= b_free!26503 (not b_next!26503))))

(declare-fun tp!92995 () Bool)

(declare-fun b_and!44267 () Bool)

(assert (=> start!104686 (= tp!92995 b_and!44267)))

(declare-fun b!1248099 () Bool)

(declare-fun e!708184 () Bool)

(declare-fun tp_is_empty!31405 () Bool)

(assert (=> b!1248099 (= e!708184 tp_is_empty!31405)))

(declare-fun b!1248100 () Bool)

(declare-fun res!832716 () Bool)

(declare-fun e!708182 () Bool)

(assert (=> b!1248100 (=> (not res!832716) (not e!708182))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80502 0))(
  ( (array!80503 (arr!38819 (Array (_ BitVec 32) (_ BitVec 64))) (size!39355 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80502)

(declare-datatypes ((V!47239 0))(
  ( (V!47240 (val!15765 Int)) )
))
(declare-datatypes ((ValueCell!14939 0))(
  ( (ValueCellFull!14939 (v!18461 V!47239)) (EmptyCell!14939) )
))
(declare-datatypes ((array!80504 0))(
  ( (array!80505 (arr!38820 (Array (_ BitVec 32) ValueCell!14939)) (size!39356 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80504)

(assert (=> b!1248100 (= res!832716 (and (= (size!39356 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39355 _keys!1118) (size!39356 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248101 () Bool)

(declare-fun e!708183 () Bool)

(assert (=> b!1248101 (= e!708183 tp_is_empty!31405)))

(declare-fun b!1248102 () Bool)

(declare-fun e!708181 () Bool)

(declare-fun mapRes!48865 () Bool)

(assert (=> b!1248102 (= e!708181 (and e!708183 mapRes!48865))))

(declare-fun condMapEmpty!48865 () Bool)

(declare-fun mapDefault!48865 () ValueCell!14939)

