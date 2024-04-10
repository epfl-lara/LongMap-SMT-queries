; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105192 () Bool)

(assert start!105192)

(declare-fun b_free!26909 () Bool)

(declare-fun b_next!26909 () Bool)

(assert (=> start!105192 (= b_free!26909 (not b_next!26909))))

(declare-fun tp!94231 () Bool)

(declare-fun b_and!44723 () Bool)

(assert (=> start!105192 (= tp!94231 b_and!44723)))

(declare-fun res!835888 () Bool)

(declare-fun e!712147 () Bool)

(assert (=> start!105192 (=> (not res!835888) (not e!712147))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105192 (= res!835888 (validMask!0 mask!1466))))

(assert (=> start!105192 e!712147))

(assert (=> start!105192 true))

(assert (=> start!105192 tp!94231))

(declare-fun tp_is_empty!31811 () Bool)

(assert (=> start!105192 tp_is_empty!31811))

(declare-datatypes ((array!81280 0))(
  ( (array!81281 (arr!39202 (Array (_ BitVec 32) (_ BitVec 64))) (size!39738 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81280)

(declare-fun array_inv!29885 (array!81280) Bool)

(assert (=> start!105192 (array_inv!29885 _keys!1118)))

(declare-datatypes ((V!47779 0))(
  ( (V!47780 (val!15968 Int)) )
))
(declare-datatypes ((ValueCell!15142 0))(
  ( (ValueCellFull!15142 (v!18666 V!47779)) (EmptyCell!15142) )
))
(declare-datatypes ((array!81282 0))(
  ( (array!81283 (arr!39203 (Array (_ BitVec 32) ValueCell!15142)) (size!39739 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81282)

(declare-fun e!712146 () Bool)

(declare-fun array_inv!29886 (array!81282) Bool)

(assert (=> start!105192 (and (array_inv!29886 _values!914) e!712146)))

(declare-fun mapNonEmpty!49492 () Bool)

(declare-fun mapRes!49492 () Bool)

(declare-fun tp!94232 () Bool)

(declare-fun e!712144 () Bool)

(assert (=> mapNonEmpty!49492 (= mapRes!49492 (and tp!94232 e!712144))))

(declare-fun mapValue!49492 () ValueCell!15142)

(declare-fun mapKey!49492 () (_ BitVec 32))

(declare-fun mapRest!49492 () (Array (_ BitVec 32) ValueCell!15142))

(assert (=> mapNonEmpty!49492 (= (arr!39203 _values!914) (store mapRest!49492 mapKey!49492 mapValue!49492))))

(declare-fun b!1253533 () Bool)

(declare-fun e!712149 () Bool)

(assert (=> b!1253533 (= e!712149 tp_is_empty!31811)))

(declare-fun mapIsEmpty!49492 () Bool)

(assert (=> mapIsEmpty!49492 mapRes!49492))

(declare-fun b!1253534 () Bool)

(assert (=> b!1253534 (= e!712146 (and e!712149 mapRes!49492))))

(declare-fun condMapEmpty!49492 () Bool)

(declare-fun mapDefault!49492 () ValueCell!15142)

