; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105438 () Bool)

(assert start!105438)

(declare-fun b_free!27097 () Bool)

(declare-fun b_next!27097 () Bool)

(assert (=> start!105438 (= b_free!27097 (not b_next!27097))))

(declare-fun tp!94804 () Bool)

(declare-fun b_and!44943 () Bool)

(assert (=> start!105438 (= tp!94804 b_and!44943)))

(declare-fun b!1256226 () Bool)

(declare-fun e!714113 () Bool)

(declare-fun e!714119 () Bool)

(declare-fun mapRes!49783 () Bool)

(assert (=> b!1256226 (= e!714113 (and e!714119 mapRes!49783))))

(declare-fun condMapEmpty!49783 () Bool)

(declare-datatypes ((V!48031 0))(
  ( (V!48032 (val!16062 Int)) )
))
(declare-datatypes ((ValueCell!15236 0))(
  ( (ValueCellFull!15236 (v!18762 V!48031)) (EmptyCell!15236) )
))
(declare-datatypes ((array!81640 0))(
  ( (array!81641 (arr!39379 (Array (_ BitVec 32) ValueCell!15236)) (size!39915 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81640)

(declare-fun mapDefault!49783 () ValueCell!15236)

