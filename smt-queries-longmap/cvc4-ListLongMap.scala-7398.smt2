; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94168 () Bool)

(assert start!94168)

(declare-fun b_free!21569 () Bool)

(declare-fun b_next!21569 () Bool)

(assert (=> start!94168 (= b_free!21569 (not b_next!21569))))

(declare-fun tp!76141 () Bool)

(declare-fun b_and!34319 () Bool)

(assert (=> start!94168 (= tp!76141 b_and!34319)))

(declare-fun res!710896 () Bool)

(declare-fun e!607013 () Bool)

(assert (=> start!94168 (=> (not res!710896) (not e!607013))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94168 (= res!710896 (validMask!0 mask!1515))))

(assert (=> start!94168 e!607013))

(assert (=> start!94168 true))

(declare-fun tp_is_empty!25379 () Bool)

(assert (=> start!94168 tp_is_empty!25379))

(declare-datatypes ((V!38973 0))(
  ( (V!38974 (val!12740 Int)) )
))
(declare-datatypes ((ValueCell!11986 0))(
  ( (ValueCellFull!11986 (v!15352 V!38973)) (EmptyCell!11986) )
))
(declare-datatypes ((array!67743 0))(
  ( (array!67744 (arr!32575 (Array (_ BitVec 32) ValueCell!11986)) (size!33111 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67743)

(declare-fun e!607015 () Bool)

(declare-fun array_inv!25224 (array!67743) Bool)

(assert (=> start!94168 (and (array_inv!25224 _values!955) e!607015)))

(assert (=> start!94168 tp!76141))

(declare-datatypes ((array!67745 0))(
  ( (array!67746 (arr!32576 (Array (_ BitVec 32) (_ BitVec 64))) (size!33112 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67745)

(declare-fun array_inv!25225 (array!67745) Bool)

(assert (=> start!94168 (array_inv!25225 _keys!1163)))

(declare-fun b!1064924 () Bool)

(declare-fun res!710893 () Bool)

(assert (=> b!1064924 (=> (not res!710893) (not e!607013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67745 (_ BitVec 32)) Bool)

(assert (=> b!1064924 (= res!710893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064925 () Bool)

(declare-fun e!607014 () Bool)

(declare-fun mapRes!39751 () Bool)

(assert (=> b!1064925 (= e!607015 (and e!607014 mapRes!39751))))

(declare-fun condMapEmpty!39751 () Bool)

(declare-fun mapDefault!39751 () ValueCell!11986)

