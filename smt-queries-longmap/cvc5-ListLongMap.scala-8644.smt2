; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105182 () Bool)

(assert start!105182)

(declare-fun b_free!26899 () Bool)

(declare-fun b_next!26899 () Bool)

(assert (=> start!105182 (= b_free!26899 (not b_next!26899))))

(declare-fun tp!94202 () Bool)

(declare-fun b_and!44713 () Bool)

(assert (=> start!105182 (= tp!94202 b_and!44713)))

(declare-fun b!1253414 () Bool)

(declare-fun e!712056 () Bool)

(declare-fun e!712055 () Bool)

(declare-fun mapRes!49477 () Bool)

(assert (=> b!1253414 (= e!712056 (and e!712055 mapRes!49477))))

(declare-fun condMapEmpty!49477 () Bool)

(declare-datatypes ((V!47767 0))(
  ( (V!47768 (val!15963 Int)) )
))
(declare-datatypes ((ValueCell!15137 0))(
  ( (ValueCellFull!15137 (v!18661 V!47767)) (EmptyCell!15137) )
))
(declare-datatypes ((array!81262 0))(
  ( (array!81263 (arr!39193 (Array (_ BitVec 32) ValueCell!15137)) (size!39729 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81262)

(declare-fun mapDefault!49477 () ValueCell!15137)

