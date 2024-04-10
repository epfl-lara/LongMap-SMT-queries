; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105850 () Bool)

(assert start!105850)

(declare-fun b_free!27391 () Bool)

(declare-fun b_next!27391 () Bool)

(assert (=> start!105850 (= b_free!27391 (not b_next!27391))))

(declare-fun tp!95705 () Bool)

(declare-fun b_and!45299 () Bool)

(assert (=> start!105850 (= tp!95705 b_and!45299)))

(declare-fun mapIsEmpty!50242 () Bool)

(declare-fun mapRes!50242 () Bool)

(assert (=> mapIsEmpty!50242 mapRes!50242))

(declare-fun b!1260853 () Bool)

(declare-fun e!717530 () Bool)

(declare-fun e!717529 () Bool)

(assert (=> b!1260853 (= e!717530 (and e!717529 mapRes!50242))))

(declare-fun condMapEmpty!50242 () Bool)

(declare-datatypes ((V!48423 0))(
  ( (V!48424 (val!16209 Int)) )
))
(declare-datatypes ((ValueCell!15383 0))(
  ( (ValueCellFull!15383 (v!18913 V!48423)) (EmptyCell!15383) )
))
(declare-datatypes ((array!82204 0))(
  ( (array!82205 (arr!39655 (Array (_ BitVec 32) ValueCell!15383)) (size!40191 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82204)

(declare-fun mapDefault!50242 () ValueCell!15383)

