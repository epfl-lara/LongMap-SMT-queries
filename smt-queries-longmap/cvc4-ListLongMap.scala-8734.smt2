; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105902 () Bool)

(assert start!105902)

(declare-fun b_free!27443 () Bool)

(declare-fun b_next!27443 () Bool)

(assert (=> start!105902 (= b_free!27443 (not b_next!27443))))

(declare-fun tp!95861 () Bool)

(declare-fun b_and!45351 () Bool)

(assert (=> start!105902 (= tp!95861 b_and!45351)))

(declare-fun b!1261399 () Bool)

(declare-fun e!717918 () Bool)

(declare-fun tp_is_empty!32345 () Bool)

(assert (=> b!1261399 (= e!717918 tp_is_empty!32345)))

(declare-fun b!1261400 () Bool)

(declare-fun res!840550 () Bool)

(declare-fun e!717916 () Bool)

(assert (=> b!1261400 (=> (not res!840550) (not e!717916))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82304 0))(
  ( (array!82305 (arr!39705 (Array (_ BitVec 32) (_ BitVec 64))) (size!40241 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82304)

(declare-datatypes ((V!48491 0))(
  ( (V!48492 (val!16235 Int)) )
))
(declare-datatypes ((ValueCell!15409 0))(
  ( (ValueCellFull!15409 (v!18939 V!48491)) (EmptyCell!15409) )
))
(declare-datatypes ((array!82306 0))(
  ( (array!82307 (arr!39706 (Array (_ BitVec 32) ValueCell!15409)) (size!40242 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82306)

(assert (=> b!1261400 (= res!840550 (and (= (size!40242 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40241 _keys!1118) (size!40242 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261401 () Bool)

(declare-fun res!840553 () Bool)

(assert (=> b!1261401 (=> (not res!840553) (not e!717916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82304 (_ BitVec 32)) Bool)

(assert (=> b!1261401 (= res!840553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261402 () Bool)

(declare-fun res!840552 () Bool)

(assert (=> b!1261402 (=> (not res!840552) (not e!717916))))

(declare-datatypes ((List!28208 0))(
  ( (Nil!28205) (Cons!28204 (h!29413 (_ BitVec 64)) (t!41707 List!28208)) )
))
(declare-fun arrayNoDuplicates!0 (array!82304 (_ BitVec 32) List!28208) Bool)

(assert (=> b!1261402 (= res!840552 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28205))))

(declare-fun b!1261403 () Bool)

(declare-fun e!717917 () Bool)

(declare-fun e!717920 () Bool)

(declare-fun mapRes!50320 () Bool)

(assert (=> b!1261403 (= e!717917 (and e!717920 mapRes!50320))))

(declare-fun condMapEmpty!50320 () Bool)

(declare-fun mapDefault!50320 () ValueCell!15409)

