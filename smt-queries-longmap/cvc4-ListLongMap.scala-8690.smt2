; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105564 () Bool)

(assert start!105564)

(declare-fun b_free!27179 () Bool)

(declare-fun b_next!27179 () Bool)

(assert (=> start!105564 (= b_free!27179 (not b_next!27179))))

(declare-fun tp!95056 () Bool)

(declare-fun b_and!45045 () Bool)

(assert (=> start!105564 (= tp!95056 b_and!45045)))

(declare-fun b!1257595 () Bool)

(declare-fun e!715124 () Bool)

(declare-fun e!715126 () Bool)

(declare-fun mapRes!49912 () Bool)

(assert (=> b!1257595 (= e!715124 (and e!715126 mapRes!49912))))

(declare-fun condMapEmpty!49912 () Bool)

(declare-datatypes ((V!48139 0))(
  ( (V!48140 (val!16103 Int)) )
))
(declare-datatypes ((ValueCell!15277 0))(
  ( (ValueCellFull!15277 (v!18805 V!48139)) (EmptyCell!15277) )
))
(declare-datatypes ((array!81796 0))(
  ( (array!81797 (arr!39455 (Array (_ BitVec 32) ValueCell!15277)) (size!39991 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81796)

(declare-fun mapDefault!49912 () ValueCell!15277)

