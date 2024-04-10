; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94898 () Bool)

(assert start!94898)

(declare-fun b_free!22103 () Bool)

(declare-fun b_next!22103 () Bool)

(assert (=> start!94898 (= b_free!22103 (not b_next!22103))))

(declare-fun tp!77774 () Bool)

(declare-fun b_and!34957 () Bool)

(assert (=> start!94898 (= tp!77774 b_and!34957)))

(declare-fun res!715706 () Bool)

(declare-fun e!612965 () Bool)

(assert (=> start!94898 (=> (not res!715706) (not e!612965))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94898 (= res!715706 (validMask!0 mask!1515))))

(assert (=> start!94898 e!612965))

(assert (=> start!94898 true))

(declare-fun tp_is_empty!25913 () Bool)

(assert (=> start!94898 tp_is_empty!25913))

(declare-datatypes ((V!39685 0))(
  ( (V!39686 (val!13007 Int)) )
))
(declare-datatypes ((ValueCell!12253 0))(
  ( (ValueCellFull!12253 (v!15625 V!39685)) (EmptyCell!12253) )
))
(declare-datatypes ((array!68789 0))(
  ( (array!68790 (arr!33088 (Array (_ BitVec 32) ValueCell!12253)) (size!33624 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68789)

(declare-fun e!612967 () Bool)

(declare-fun array_inv!25576 (array!68789) Bool)

(assert (=> start!94898 (and (array_inv!25576 _values!955) e!612967)))

(assert (=> start!94898 tp!77774))

(declare-datatypes ((array!68791 0))(
  ( (array!68792 (arr!33089 (Array (_ BitVec 32) (_ BitVec 64))) (size!33625 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68791)

(declare-fun array_inv!25577 (array!68791) Bool)

(assert (=> start!94898 (array_inv!25577 _keys!1163)))

(declare-fun b!1073027 () Bool)

(declare-fun e!612966 () Bool)

(declare-fun mapRes!40582 () Bool)

(assert (=> b!1073027 (= e!612967 (and e!612966 mapRes!40582))))

(declare-fun condMapEmpty!40582 () Bool)

(declare-fun mapDefault!40582 () ValueCell!12253)

