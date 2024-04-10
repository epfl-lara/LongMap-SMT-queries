; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105980 () Bool)

(assert start!105980)

(declare-fun b_free!27469 () Bool)

(declare-fun b_next!27469 () Bool)

(assert (=> start!105980 (= b_free!27469 (not b_next!27469))))

(declare-fun tp!95947 () Bool)

(declare-fun b_and!45407 () Bool)

(assert (=> start!105980 (= tp!95947 b_and!45407)))

(declare-fun b!1262121 () Bool)

(declare-fun e!718413 () Bool)

(declare-fun tp_is_empty!32371 () Bool)

(assert (=> b!1262121 (= e!718413 tp_is_empty!32371)))

(declare-fun b!1262122 () Bool)

(declare-fun e!718411 () Bool)

(declare-fun e!718410 () Bool)

(declare-fun mapRes!50368 () Bool)

(assert (=> b!1262122 (= e!718411 (and e!718410 mapRes!50368))))

(declare-fun condMapEmpty!50368 () Bool)

(declare-datatypes ((V!48527 0))(
  ( (V!48528 (val!16248 Int)) )
))
(declare-datatypes ((ValueCell!15422 0))(
  ( (ValueCellFull!15422 (v!18954 V!48527)) (EmptyCell!15422) )
))
(declare-datatypes ((array!82360 0))(
  ( (array!82361 (arr!39730 (Array (_ BitVec 32) ValueCell!15422)) (size!40266 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82360)

(declare-fun mapDefault!50368 () ValueCell!15422)

