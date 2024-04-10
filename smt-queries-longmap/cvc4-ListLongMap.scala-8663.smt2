; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105344 () Bool)

(assert start!105344)

(declare-fun b_free!27017 () Bool)

(declare-fun b_next!27017 () Bool)

(assert (=> start!105344 (= b_free!27017 (not b_next!27017))))

(declare-fun tp!94561 () Bool)

(declare-fun b_and!44855 () Bool)

(assert (=> start!105344 (= tp!94561 b_and!44855)))

(declare-fun b!1255162 () Bool)

(declare-fun e!713321 () Bool)

(declare-fun e!713323 () Bool)

(declare-fun mapRes!49660 () Bool)

(assert (=> b!1255162 (= e!713321 (and e!713323 mapRes!49660))))

(declare-fun condMapEmpty!49660 () Bool)

(declare-datatypes ((V!47923 0))(
  ( (V!47924 (val!16022 Int)) )
))
(declare-datatypes ((ValueCell!15196 0))(
  ( (ValueCellFull!15196 (v!18722 V!47923)) (EmptyCell!15196) )
))
(declare-datatypes ((array!81488 0))(
  ( (array!81489 (arr!39304 (Array (_ BitVec 32) ValueCell!15196)) (size!39840 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81488)

(declare-fun mapDefault!49660 () ValueCell!15196)

