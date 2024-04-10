; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105560 () Bool)

(assert start!105560)

(declare-fun b_free!27175 () Bool)

(declare-fun b_next!27175 () Bool)

(assert (=> start!105560 (= b_free!27175 (not b_next!27175))))

(declare-fun tp!95045 () Bool)

(declare-fun b_and!45041 () Bool)

(assert (=> start!105560 (= tp!95045 b_and!45041)))

(declare-fun b!1257553 () Bool)

(declare-fun res!838260 () Bool)

(declare-fun e!715092 () Bool)

(assert (=> b!1257553 (=> (not res!838260) (not e!715092))))

(declare-datatypes ((array!81788 0))(
  ( (array!81789 (arr!39451 (Array (_ BitVec 32) (_ BitVec 64))) (size!39987 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81788)

(declare-datatypes ((List!28018 0))(
  ( (Nil!28015) (Cons!28014 (h!29223 (_ BitVec 64)) (t!41509 List!28018)) )
))
(declare-fun arrayNoDuplicates!0 (array!81788 (_ BitVec 32) List!28018) Bool)

(assert (=> b!1257553 (= res!838260 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28015))))

(declare-fun b!1257554 () Bool)

(declare-fun res!838259 () Bool)

(assert (=> b!1257554 (=> (not res!838259) (not e!715092))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48135 0))(
  ( (V!48136 (val!16101 Int)) )
))
(declare-datatypes ((ValueCell!15275 0))(
  ( (ValueCellFull!15275 (v!18803 V!48135)) (EmptyCell!15275) )
))
(declare-datatypes ((array!81790 0))(
  ( (array!81791 (arr!39452 (Array (_ BitVec 32) ValueCell!15275)) (size!39988 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81790)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1257554 (= res!838259 (and (= (size!39988 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39987 _keys!1118) (size!39988 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49906 () Bool)

(declare-fun mapRes!49906 () Bool)

(declare-fun tp!95044 () Bool)

(declare-fun e!715095 () Bool)

(assert (=> mapNonEmpty!49906 (= mapRes!49906 (and tp!95044 e!715095))))

(declare-fun mapValue!49906 () ValueCell!15275)

(declare-fun mapKey!49906 () (_ BitVec 32))

(declare-fun mapRest!49906 () (Array (_ BitVec 32) ValueCell!15275))

(assert (=> mapNonEmpty!49906 (= (arr!39452 _values!914) (store mapRest!49906 mapKey!49906 mapValue!49906))))

(declare-fun b!1257555 () Bool)

(declare-fun e!715096 () Bool)

(declare-fun e!715094 () Bool)

(assert (=> b!1257555 (= e!715096 (and e!715094 mapRes!49906))))

(declare-fun condMapEmpty!49906 () Bool)

(declare-fun mapDefault!49906 () ValueCell!15275)

