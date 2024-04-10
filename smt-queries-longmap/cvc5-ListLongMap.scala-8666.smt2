; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105358 () Bool)

(assert start!105358)

(declare-fun b_free!27031 () Bool)

(declare-fun b_next!27031 () Bool)

(assert (=> start!105358 (= b_free!27031 (not b_next!27031))))

(declare-fun tp!94604 () Bool)

(declare-fun b_and!44869 () Bool)

(assert (=> start!105358 (= tp!94604 b_and!44869)))

(declare-fun b!1255309 () Bool)

(declare-fun e!713427 () Bool)

(declare-fun tp_is_empty!31933 () Bool)

(assert (=> b!1255309 (= e!713427 tp_is_empty!31933)))

(declare-fun b!1255310 () Bool)

(declare-fun res!836910 () Bool)

(declare-fun e!713428 () Bool)

(assert (=> b!1255310 (=> (not res!836910) (not e!713428))))

(declare-datatypes ((array!81512 0))(
  ( (array!81513 (arr!39316 (Array (_ BitVec 32) (_ BitVec 64))) (size!39852 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81512)

(declare-datatypes ((List!27921 0))(
  ( (Nil!27918) (Cons!27917 (h!29126 (_ BitVec 64)) (t!41406 List!27921)) )
))
(declare-fun arrayNoDuplicates!0 (array!81512 (_ BitVec 32) List!27921) Bool)

(assert (=> b!1255310 (= res!836910 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27918))))

(declare-fun b!1255311 () Bool)

(declare-fun res!836908 () Bool)

(assert (=> b!1255311 (=> (not res!836908) (not e!713428))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47943 0))(
  ( (V!47944 (val!16029 Int)) )
))
(declare-datatypes ((ValueCell!15203 0))(
  ( (ValueCellFull!15203 (v!18729 V!47943)) (EmptyCell!15203) )
))
(declare-datatypes ((array!81514 0))(
  ( (array!81515 (arr!39317 (Array (_ BitVec 32) ValueCell!15203)) (size!39853 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81514)

(assert (=> b!1255311 (= res!836908 (and (= (size!39853 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39852 _keys!1118) (size!39853 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49681 () Bool)

(declare-fun mapRes!49681 () Bool)

(declare-fun tp!94603 () Bool)

(assert (=> mapNonEmpty!49681 (= mapRes!49681 (and tp!94603 e!713427))))

(declare-fun mapRest!49681 () (Array (_ BitVec 32) ValueCell!15203))

(declare-fun mapKey!49681 () (_ BitVec 32))

(declare-fun mapValue!49681 () ValueCell!15203)

(assert (=> mapNonEmpty!49681 (= (arr!39317 _values!914) (store mapRest!49681 mapKey!49681 mapValue!49681))))

(declare-fun b!1255312 () Bool)

(declare-fun e!713425 () Bool)

(declare-fun e!713426 () Bool)

(assert (=> b!1255312 (= e!713425 (and e!713426 mapRes!49681))))

(declare-fun condMapEmpty!49681 () Bool)

(declare-fun mapDefault!49681 () ValueCell!15203)

