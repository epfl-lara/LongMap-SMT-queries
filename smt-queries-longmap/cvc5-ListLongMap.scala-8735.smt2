; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105904 () Bool)

(assert start!105904)

(declare-fun b_free!27445 () Bool)

(declare-fun b_next!27445 () Bool)

(assert (=> start!105904 (= b_free!27445 (not b_next!27445))))

(declare-fun tp!95867 () Bool)

(declare-fun b_and!45353 () Bool)

(assert (=> start!105904 (= tp!95867 b_and!45353)))

(declare-fun b!1261420 () Bool)

(declare-fun res!840565 () Bool)

(declare-fun e!717935 () Bool)

(assert (=> b!1261420 (=> (not res!840565) (not e!717935))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82308 0))(
  ( (array!82309 (arr!39707 (Array (_ BitVec 32) (_ BitVec 64))) (size!40243 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82308)

(declare-datatypes ((V!48495 0))(
  ( (V!48496 (val!16236 Int)) )
))
(declare-datatypes ((ValueCell!15410 0))(
  ( (ValueCellFull!15410 (v!18940 V!48495)) (EmptyCell!15410) )
))
(declare-datatypes ((array!82310 0))(
  ( (array!82311 (arr!39708 (Array (_ BitVec 32) ValueCell!15410)) (size!40244 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82310)

(assert (=> b!1261420 (= res!840565 (and (= (size!40244 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40243 _keys!1118) (size!40244 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261421 () Bool)

(declare-fun e!717933 () Bool)

(declare-fun e!717931 () Bool)

(declare-fun mapRes!50323 () Bool)

(assert (=> b!1261421 (= e!717933 (and e!717931 mapRes!50323))))

(declare-fun condMapEmpty!50323 () Bool)

(declare-fun mapDefault!50323 () ValueCell!15410)

