; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105478 () Bool)

(assert start!105478)

(declare-fun b_free!27115 () Bool)

(declare-fun b_next!27115 () Bool)

(assert (=> start!105478 (= b_free!27115 (not b_next!27115))))

(declare-fun tp!94861 () Bool)

(declare-fun b_and!44971 () Bool)

(assert (=> start!105478 (= tp!94861 b_and!44971)))

(declare-fun b!1256626 () Bool)

(declare-fun e!714405 () Bool)

(declare-fun e!714406 () Bool)

(declare-fun mapRes!49813 () Bool)

(assert (=> b!1256626 (= e!714405 (and e!714406 mapRes!49813))))

(declare-fun condMapEmpty!49813 () Bool)

(declare-datatypes ((V!48055 0))(
  ( (V!48056 (val!16071 Int)) )
))
(declare-datatypes ((ValueCell!15245 0))(
  ( (ValueCellFull!15245 (v!18772 V!48055)) (EmptyCell!15245) )
))
(declare-datatypes ((array!81674 0))(
  ( (array!81675 (arr!39395 (Array (_ BitVec 32) ValueCell!15245)) (size!39931 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81674)

(declare-fun mapDefault!49813 () ValueCell!15245)

