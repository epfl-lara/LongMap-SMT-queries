; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104806 () Bool)

(assert start!104806)

(declare-fun b_free!26611 () Bool)

(declare-fun b_next!26611 () Bool)

(assert (=> start!104806 (= b_free!26611 (not b_next!26611))))

(declare-fun tp!93323 () Bool)

(declare-fun b_and!44379 () Bool)

(assert (=> start!104806 (= tp!93323 b_and!44379)))

(declare-fun b!1249305 () Bool)

(declare-fun res!833390 () Bool)

(declare-fun e!709041 () Bool)

(assert (=> b!1249305 (=> (not res!833390) (not e!709041))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80708 0))(
  ( (array!80709 (arr!38921 (Array (_ BitVec 32) (_ BitVec 64))) (size!39457 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80708)

(declare-datatypes ((V!47383 0))(
  ( (V!47384 (val!15819 Int)) )
))
(declare-datatypes ((ValueCell!14993 0))(
  ( (ValueCellFull!14993 (v!18515 V!47383)) (EmptyCell!14993) )
))
(declare-datatypes ((array!80710 0))(
  ( (array!80711 (arr!38922 (Array (_ BitVec 32) ValueCell!14993)) (size!39458 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80710)

(assert (=> b!1249305 (= res!833390 (and (= (size!39458 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39457 _keys!1118) (size!39458 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249306 () Bool)

(declare-fun e!709039 () Bool)

(declare-fun tp_is_empty!31513 () Bool)

(assert (=> b!1249306 (= e!709039 tp_is_empty!31513)))

(declare-fun b!1249307 () Bool)

(declare-fun e!709042 () Bool)

(declare-fun e!709038 () Bool)

(declare-fun mapRes!49030 () Bool)

(assert (=> b!1249307 (= e!709042 (and e!709038 mapRes!49030))))

(declare-fun condMapEmpty!49030 () Bool)

(declare-fun mapDefault!49030 () ValueCell!14993)

