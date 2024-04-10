; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105500 () Bool)

(assert start!105500)

(declare-fun b_free!27137 () Bool)

(declare-fun b_next!27137 () Bool)

(assert (=> start!105500 (= b_free!27137 (not b_next!27137))))

(declare-fun tp!94928 () Bool)

(declare-fun b_and!44993 () Bool)

(assert (=> start!105500 (= tp!94928 b_and!44993)))

(declare-fun b!1256923 () Bool)

(declare-fun e!714633 () Bool)

(declare-fun tp_is_empty!32039 () Bool)

(assert (=> b!1256923 (= e!714633 tp_is_empty!32039)))

(declare-fun b!1256924 () Bool)

(declare-fun e!714637 () Bool)

(assert (=> b!1256924 (= e!714637 tp_is_empty!32039)))

(declare-fun mapIsEmpty!49846 () Bool)

(declare-fun mapRes!49846 () Bool)

(assert (=> mapIsEmpty!49846 mapRes!49846))

(declare-fun b!1256925 () Bool)

(declare-fun res!837898 () Bool)

(declare-fun e!714635 () Bool)

(assert (=> b!1256925 (=> (not res!837898) (not e!714635))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81716 0))(
  ( (array!81717 (arr!39416 (Array (_ BitVec 32) (_ BitVec 64))) (size!39952 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81716)

(declare-datatypes ((V!48083 0))(
  ( (V!48084 (val!16082 Int)) )
))
(declare-datatypes ((ValueCell!15256 0))(
  ( (ValueCellFull!15256 (v!18783 V!48083)) (EmptyCell!15256) )
))
(declare-datatypes ((array!81718 0))(
  ( (array!81719 (arr!39417 (Array (_ BitVec 32) ValueCell!15256)) (size!39953 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81718)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1256925 (= res!837898 (and (= (size!39953 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39952 _keys!1118) (size!39953 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256926 () Bool)

(declare-fun e!714636 () Bool)

(assert (=> b!1256926 (= e!714636 (and e!714637 mapRes!49846))))

(declare-fun condMapEmpty!49846 () Bool)

(declare-fun mapDefault!49846 () ValueCell!15256)

