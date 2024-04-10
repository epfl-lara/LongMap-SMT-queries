; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94250 () Bool)

(assert start!94250)

(declare-fun b_free!21635 () Bool)

(declare-fun b_next!21635 () Bool)

(assert (=> start!94250 (= b_free!21635 (not b_next!21635))))

(declare-fun tp!76342 () Bool)

(declare-fun b_and!34395 () Bool)

(assert (=> start!94250 (= tp!76342 b_and!34395)))

(declare-fun b!1065881 () Bool)

(declare-fun e!607724 () Bool)

(declare-fun tp_is_empty!25445 () Bool)

(assert (=> b!1065881 (= e!607724 tp_is_empty!25445)))

(declare-fun res!711463 () Bool)

(declare-fun e!607721 () Bool)

(assert (=> start!94250 (=> (not res!711463) (not e!607721))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94250 (= res!711463 (validMask!0 mask!1515))))

(assert (=> start!94250 e!607721))

(assert (=> start!94250 true))

(assert (=> start!94250 tp_is_empty!25445))

(declare-datatypes ((V!39061 0))(
  ( (V!39062 (val!12773 Int)) )
))
(declare-datatypes ((ValueCell!12019 0))(
  ( (ValueCellFull!12019 (v!15385 V!39061)) (EmptyCell!12019) )
))
(declare-datatypes ((array!67873 0))(
  ( (array!67874 (arr!32639 (Array (_ BitVec 32) ValueCell!12019)) (size!33175 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67873)

(declare-fun e!607720 () Bool)

(declare-fun array_inv!25272 (array!67873) Bool)

(assert (=> start!94250 (and (array_inv!25272 _values!955) e!607720)))

(assert (=> start!94250 tp!76342))

(declare-datatypes ((array!67875 0))(
  ( (array!67876 (arr!32640 (Array (_ BitVec 32) (_ BitVec 64))) (size!33176 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67875)

(declare-fun array_inv!25273 (array!67875) Bool)

(assert (=> start!94250 (array_inv!25273 _keys!1163)))

(declare-fun b!1065882 () Bool)

(declare-fun mapRes!39853 () Bool)

(assert (=> b!1065882 (= e!607720 (and e!607724 mapRes!39853))))

(declare-fun condMapEmpty!39853 () Bool)

(declare-fun mapDefault!39853 () ValueCell!12019)

