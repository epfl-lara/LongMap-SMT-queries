; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104672 () Bool)

(assert start!104672)

(declare-fun b_free!26489 () Bool)

(declare-fun b_next!26489 () Bool)

(assert (=> start!104672 (= b_free!26489 (not b_next!26489))))

(declare-fun tp!92954 () Bool)

(declare-fun b_and!44253 () Bool)

(assert (=> start!104672 (= tp!92954 b_and!44253)))

(declare-fun mapIsEmpty!48844 () Bool)

(declare-fun mapRes!48844 () Bool)

(assert (=> mapIsEmpty!48844 mapRes!48844))

(declare-fun mapNonEmpty!48844 () Bool)

(declare-fun tp!92953 () Bool)

(declare-fun e!708078 () Bool)

(assert (=> mapNonEmpty!48844 (= mapRes!48844 (and tp!92953 e!708078))))

(declare-datatypes ((V!47219 0))(
  ( (V!47220 (val!15758 Int)) )
))
(declare-datatypes ((ValueCell!14932 0))(
  ( (ValueCellFull!14932 (v!18454 V!47219)) (EmptyCell!14932) )
))
(declare-fun mapValue!48844 () ValueCell!14932)

(declare-fun mapKey!48844 () (_ BitVec 32))

(declare-fun mapRest!48844 () (Array (_ BitVec 32) ValueCell!14932))

(declare-datatypes ((array!80476 0))(
  ( (array!80477 (arr!38806 (Array (_ BitVec 32) ValueCell!14932)) (size!39342 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80476)

(assert (=> mapNonEmpty!48844 (= (arr!38806 _values!914) (store mapRest!48844 mapKey!48844 mapValue!48844))))

(declare-fun b!1247951 () Bool)

(declare-fun res!832631 () Bool)

(declare-fun e!708077 () Bool)

(assert (=> b!1247951 (=> (not res!832631) (not e!708077))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80478 0))(
  ( (array!80479 (arr!38807 (Array (_ BitVec 32) (_ BitVec 64))) (size!39343 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80478)

(assert (=> b!1247951 (= res!832631 (and (= (size!39342 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39343 _keys!1118) (size!39342 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247952 () Bool)

(declare-fun res!832630 () Bool)

(assert (=> b!1247952 (=> (not res!832630) (not e!708077))))

(declare-datatypes ((List!27545 0))(
  ( (Nil!27542) (Cons!27541 (h!28750 (_ BitVec 64)) (t!41014 List!27545)) )
))
(declare-fun arrayNoDuplicates!0 (array!80478 (_ BitVec 32) List!27545) Bool)

(assert (=> b!1247952 (= res!832630 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27542))))

(declare-fun b!1247954 () Bool)

(declare-fun e!708076 () Bool)

(declare-fun e!708079 () Bool)

(assert (=> b!1247954 (= e!708076 (and e!708079 mapRes!48844))))

(declare-fun condMapEmpty!48844 () Bool)

(declare-fun mapDefault!48844 () ValueCell!14932)

