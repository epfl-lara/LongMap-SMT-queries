; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105588 () Bool)

(assert start!105588)

(declare-fun b_free!27203 () Bool)

(declare-fun b_next!27203 () Bool)

(assert (=> start!105588 (= b_free!27203 (not b_next!27203))))

(declare-fun tp!95128 () Bool)

(declare-fun b_and!45069 () Bool)

(assert (=> start!105588 (= tp!95128 b_and!45069)))

(declare-fun mapIsEmpty!49948 () Bool)

(declare-fun mapRes!49948 () Bool)

(assert (=> mapIsEmpty!49948 mapRes!49948))

(declare-fun b!1257847 () Bool)

(declare-fun res!838429 () Bool)

(declare-fun e!715304 () Bool)

(assert (=> b!1257847 (=> (not res!838429) (not e!715304))))

(declare-datatypes ((array!81840 0))(
  ( (array!81841 (arr!39477 (Array (_ BitVec 32) (_ BitVec 64))) (size!40013 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81840)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81840 (_ BitVec 32)) Bool)

(assert (=> b!1257847 (= res!838429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257848 () Bool)

(declare-fun e!715303 () Bool)

(declare-fun tp_is_empty!32105 () Bool)

(assert (=> b!1257848 (= e!715303 tp_is_empty!32105)))

(declare-fun b!1257849 () Bool)

(declare-fun res!838427 () Bool)

(assert (=> b!1257849 (=> (not res!838427) (not e!715304))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48171 0))(
  ( (V!48172 (val!16115 Int)) )
))
(declare-datatypes ((ValueCell!15289 0))(
  ( (ValueCellFull!15289 (v!18817 V!48171)) (EmptyCell!15289) )
))
(declare-datatypes ((array!81842 0))(
  ( (array!81843 (arr!39478 (Array (_ BitVec 32) ValueCell!15289)) (size!40014 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81842)

(assert (=> b!1257849 (= res!838427 (and (= (size!40014 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40013 _keys!1118) (size!40014 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257850 () Bool)

(declare-fun e!715302 () Bool)

(assert (=> b!1257850 (= e!715302 (and e!715303 mapRes!49948))))

(declare-fun condMapEmpty!49948 () Bool)

(declare-fun mapDefault!49948 () ValueCell!15289)

