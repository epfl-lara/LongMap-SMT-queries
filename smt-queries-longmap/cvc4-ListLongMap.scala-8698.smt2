; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105626 () Bool)

(assert start!105626)

(declare-fun b_free!27227 () Bool)

(declare-fun b_next!27227 () Bool)

(assert (=> start!105626 (= b_free!27227 (not b_next!27227))))

(declare-fun tp!95204 () Bool)

(declare-fun b_and!45101 () Bool)

(assert (=> start!105626 (= tp!95204 b_and!45101)))

(declare-fun b!1258201 () Bool)

(declare-fun e!715556 () Bool)

(declare-fun e!715554 () Bool)

(declare-fun mapRes!49987 () Bool)

(assert (=> b!1258201 (= e!715556 (and e!715554 mapRes!49987))))

(declare-fun condMapEmpty!49987 () Bool)

(declare-datatypes ((V!48203 0))(
  ( (V!48204 (val!16127 Int)) )
))
(declare-datatypes ((ValueCell!15301 0))(
  ( (ValueCellFull!15301 (v!18829 V!48203)) (EmptyCell!15301) )
))
(declare-datatypes ((array!81884 0))(
  ( (array!81885 (arr!39498 (Array (_ BitVec 32) ValueCell!15301)) (size!40034 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81884)

(declare-fun mapDefault!49987 () ValueCell!15301)

