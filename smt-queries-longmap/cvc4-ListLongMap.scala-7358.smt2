; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93856 () Bool)

(assert start!93856)

(declare-fun b_free!21329 () Bool)

(declare-fun b_next!21329 () Bool)

(assert (=> start!93856 (= b_free!21329 (not b_next!21329))))

(declare-fun tp!75409 () Bool)

(declare-fun b_and!34043 () Bool)

(assert (=> start!93856 (= tp!75409 b_and!34043)))

(declare-fun res!708867 () Bool)

(declare-fun e!604503 () Bool)

(assert (=> start!93856 (=> (not res!708867) (not e!604503))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93856 (= res!708867 (validMask!0 mask!1515))))

(assert (=> start!93856 e!604503))

(assert (=> start!93856 true))

(declare-fun tp_is_empty!25139 () Bool)

(assert (=> start!93856 tp_is_empty!25139))

(declare-datatypes ((V!38653 0))(
  ( (V!38654 (val!12620 Int)) )
))
(declare-datatypes ((ValueCell!11866 0))(
  ( (ValueCellFull!11866 (v!15230 V!38653)) (EmptyCell!11866) )
))
(declare-datatypes ((array!67281 0))(
  ( (array!67282 (arr!32348 (Array (_ BitVec 32) ValueCell!11866)) (size!32884 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67281)

(declare-fun e!604499 () Bool)

(declare-fun array_inv!25066 (array!67281) Bool)

(assert (=> start!93856 (and (array_inv!25066 _values!955) e!604499)))

(assert (=> start!93856 tp!75409))

(declare-datatypes ((array!67283 0))(
  ( (array!67284 (arr!32349 (Array (_ BitVec 32) (_ BitVec 64))) (size!32885 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67283)

(declare-fun array_inv!25067 (array!67283) Bool)

(assert (=> start!93856 (array_inv!25067 _keys!1163)))

(declare-fun b!1061516 () Bool)

(declare-fun e!604500 () Bool)

(declare-fun mapRes!39379 () Bool)

(assert (=> b!1061516 (= e!604499 (and e!604500 mapRes!39379))))

(declare-fun condMapEmpty!39379 () Bool)

(declare-fun mapDefault!39379 () ValueCell!11866)

