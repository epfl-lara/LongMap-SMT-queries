; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105094 () Bool)

(assert start!105094)

(declare-fun b_free!26827 () Bool)

(declare-fun b_next!26827 () Bool)

(assert (=> start!105094 (= b_free!26827 (not b_next!26827))))

(declare-fun tp!93982 () Bool)

(declare-fun b_and!44631 () Bool)

(assert (=> start!105094 (= tp!93982 b_and!44631)))

(declare-fun b!1252392 () Bool)

(declare-fun res!835205 () Bool)

(declare-fun e!711307 () Bool)

(assert (=> b!1252392 (=> (not res!835205) (not e!711307))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81120 0))(
  ( (array!81121 (arr!39123 (Array (_ BitVec 32) (_ BitVec 64))) (size!39659 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81120)

(declare-datatypes ((V!47671 0))(
  ( (V!47672 (val!15927 Int)) )
))
(declare-datatypes ((ValueCell!15101 0))(
  ( (ValueCellFull!15101 (v!18625 V!47671)) (EmptyCell!15101) )
))
(declare-datatypes ((array!81122 0))(
  ( (array!81123 (arr!39124 (Array (_ BitVec 32) ValueCell!15101)) (size!39660 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81122)

(assert (=> b!1252392 (= res!835205 (and (= (size!39660 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39659 _keys!1118) (size!39660 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835203 () Bool)

(assert (=> start!105094 (=> (not res!835203) (not e!711307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105094 (= res!835203 (validMask!0 mask!1466))))

(assert (=> start!105094 e!711307))

(assert (=> start!105094 true))

(assert (=> start!105094 tp!93982))

(declare-fun tp_is_empty!31729 () Bool)

(assert (=> start!105094 tp_is_empty!31729))

(declare-fun array_inv!29839 (array!81120) Bool)

(assert (=> start!105094 (array_inv!29839 _keys!1118)))

(declare-fun e!711308 () Bool)

(declare-fun array_inv!29840 (array!81122) Bool)

(assert (=> start!105094 (and (array_inv!29840 _values!914) e!711308)))

(declare-fun mapNonEmpty!49366 () Bool)

(declare-fun mapRes!49366 () Bool)

(declare-fun tp!93983 () Bool)

(declare-fun e!711303 () Bool)

(assert (=> mapNonEmpty!49366 (= mapRes!49366 (and tp!93983 e!711303))))

(declare-fun mapValue!49366 () ValueCell!15101)

(declare-fun mapKey!49366 () (_ BitVec 32))

(declare-fun mapRest!49366 () (Array (_ BitVec 32) ValueCell!15101))

(assert (=> mapNonEmpty!49366 (= (arr!39124 _values!914) (store mapRest!49366 mapKey!49366 mapValue!49366))))

(declare-fun b!1252393 () Bool)

(declare-fun res!835207 () Bool)

(assert (=> b!1252393 (=> (not res!835207) (not e!711307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81120 (_ BitVec 32)) Bool)

(assert (=> b!1252393 (= res!835207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252394 () Bool)

(declare-fun e!711304 () Bool)

(assert (=> b!1252394 (= e!711308 (and e!711304 mapRes!49366))))

(declare-fun condMapEmpty!49366 () Bool)

(declare-fun mapDefault!49366 () ValueCell!15101)

