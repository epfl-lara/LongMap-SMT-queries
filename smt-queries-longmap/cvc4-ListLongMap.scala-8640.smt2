; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105146 () Bool)

(assert start!105146)

(declare-fun b_free!26879 () Bool)

(declare-fun b_next!26879 () Bool)

(assert (=> start!105146 (= b_free!26879 (not b_next!26879))))

(declare-fun tp!94139 () Bool)

(declare-fun b_and!44683 () Bool)

(assert (=> start!105146 (= tp!94139 b_and!44683)))

(declare-fun b!1253016 () Bool)

(declare-fun e!711773 () Bool)

(declare-fun e!711775 () Bool)

(declare-fun mapRes!49444 () Bool)

(assert (=> b!1253016 (= e!711773 (and e!711775 mapRes!49444))))

(declare-fun condMapEmpty!49444 () Bool)

(declare-datatypes ((V!47739 0))(
  ( (V!47740 (val!15953 Int)) )
))
(declare-datatypes ((ValueCell!15127 0))(
  ( (ValueCellFull!15127 (v!18651 V!47739)) (EmptyCell!15127) )
))
(declare-datatypes ((array!81222 0))(
  ( (array!81223 (arr!39174 (Array (_ BitVec 32) ValueCell!15127)) (size!39710 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81222)

(declare-fun mapDefault!49444 () ValueCell!15127)

