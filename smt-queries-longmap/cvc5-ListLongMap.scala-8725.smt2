; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105844 () Bool)

(assert start!105844)

(declare-fun b_free!27385 () Bool)

(declare-fun b_next!27385 () Bool)

(assert (=> start!105844 (= b_free!27385 (not b_next!27385))))

(declare-fun tp!95687 () Bool)

(declare-fun b_and!45293 () Bool)

(assert (=> start!105844 (= tp!95687 b_and!45293)))

(declare-fun b!1260790 () Bool)

(declare-fun e!717482 () Bool)

(declare-fun tp_is_empty!32287 () Bool)

(assert (=> b!1260790 (= e!717482 tp_is_empty!32287)))

(declare-fun b!1260791 () Bool)

(declare-fun e!717483 () Bool)

(declare-fun e!717484 () Bool)

(declare-fun mapRes!50233 () Bool)

(assert (=> b!1260791 (= e!717483 (and e!717484 mapRes!50233))))

(declare-fun condMapEmpty!50233 () Bool)

(declare-datatypes ((V!48415 0))(
  ( (V!48416 (val!16206 Int)) )
))
(declare-datatypes ((ValueCell!15380 0))(
  ( (ValueCellFull!15380 (v!18910 V!48415)) (EmptyCell!15380) )
))
(declare-datatypes ((array!82194 0))(
  ( (array!82195 (arr!39650 (Array (_ BitVec 32) ValueCell!15380)) (size!40186 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82194)

(declare-fun mapDefault!50233 () ValueCell!15380)

