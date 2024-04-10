; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105594 () Bool)

(assert start!105594)

(declare-fun b_free!27209 () Bool)

(declare-fun b_next!27209 () Bool)

(assert (=> start!105594 (= b_free!27209 (not b_next!27209))))

(declare-fun tp!95146 () Bool)

(declare-fun b_and!45075 () Bool)

(assert (=> start!105594 (= tp!95146 b_and!45075)))

(declare-fun b!1257910 () Bool)

(declare-fun res!838463 () Bool)

(declare-fun e!715350 () Bool)

(assert (=> b!1257910 (=> (not res!838463) (not e!715350))))

(declare-datatypes ((array!81850 0))(
  ( (array!81851 (arr!39482 (Array (_ BitVec 32) (_ BitVec 64))) (size!40018 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81850)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81850 (_ BitVec 32)) Bool)

(assert (=> b!1257910 (= res!838463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49957 () Bool)

(declare-fun mapRes!49957 () Bool)

(assert (=> mapIsEmpty!49957 mapRes!49957))

(declare-fun b!1257911 () Bool)

(declare-fun e!715351 () Bool)

(declare-fun tp_is_empty!32111 () Bool)

(assert (=> b!1257911 (= e!715351 tp_is_empty!32111)))

(declare-fun b!1257912 () Bool)

(declare-fun res!838464 () Bool)

(assert (=> b!1257912 (=> (not res!838464) (not e!715350))))

(declare-datatypes ((List!28038 0))(
  ( (Nil!28035) (Cons!28034 (h!29243 (_ BitVec 64)) (t!41529 List!28038)) )
))
(declare-fun arrayNoDuplicates!0 (array!81850 (_ BitVec 32) List!28038) Bool)

(assert (=> b!1257912 (= res!838464 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28035))))

(declare-fun b!1257913 () Bool)

(declare-fun e!715349 () Bool)

(assert (=> b!1257913 (= e!715349 tp_is_empty!32111)))

(declare-fun b!1257914 () Bool)

(declare-fun res!838462 () Bool)

(assert (=> b!1257914 (=> (not res!838462) (not e!715350))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48179 0))(
  ( (V!48180 (val!16118 Int)) )
))
(declare-datatypes ((ValueCell!15292 0))(
  ( (ValueCellFull!15292 (v!18820 V!48179)) (EmptyCell!15292) )
))
(declare-datatypes ((array!81852 0))(
  ( (array!81853 (arr!39483 (Array (_ BitVec 32) ValueCell!15292)) (size!40019 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81852)

(assert (=> b!1257914 (= res!838462 (and (= (size!40019 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40018 _keys!1118) (size!40019 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49957 () Bool)

(declare-fun tp!95147 () Bool)

(assert (=> mapNonEmpty!49957 (= mapRes!49957 (and tp!95147 e!715351))))

(declare-fun mapRest!49957 () (Array (_ BitVec 32) ValueCell!15292))

(declare-fun mapValue!49957 () ValueCell!15292)

(declare-fun mapKey!49957 () (_ BitVec 32))

(assert (=> mapNonEmpty!49957 (= (arr!39483 _values!914) (store mapRest!49957 mapKey!49957 mapValue!49957))))

(declare-fun res!838465 () Bool)

(assert (=> start!105594 (=> (not res!838465) (not e!715350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105594 (= res!838465 (validMask!0 mask!1466))))

(assert (=> start!105594 e!715350))

(assert (=> start!105594 true))

(assert (=> start!105594 tp!95146))

(assert (=> start!105594 tp_is_empty!32111))

(declare-fun array_inv!30073 (array!81850) Bool)

(assert (=> start!105594 (array_inv!30073 _keys!1118)))

(declare-fun e!715348 () Bool)

(declare-fun array_inv!30074 (array!81852) Bool)

(assert (=> start!105594 (and (array_inv!30074 _values!914) e!715348)))

(declare-fun b!1257915 () Bool)

(assert (=> b!1257915 (= e!715348 (and e!715349 mapRes!49957))))

(declare-fun condMapEmpty!49957 () Bool)

(declare-fun mapDefault!49957 () ValueCell!15292)

