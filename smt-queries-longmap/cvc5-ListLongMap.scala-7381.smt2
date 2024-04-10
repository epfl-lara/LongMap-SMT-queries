; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94026 () Bool)

(assert start!94026)

(declare-fun b_free!21463 () Bool)

(declare-fun b_next!21463 () Bool)

(assert (=> start!94026 (= b_free!21463 (not b_next!21463))))

(declare-fun tp!75817 () Bool)

(declare-fun b_and!34195 () Bool)

(assert (=> start!94026 (= tp!75817 b_and!34195)))

(declare-fun res!710081 () Bool)

(declare-fun e!605978 () Bool)

(assert (=> start!94026 (=> (not res!710081) (not e!605978))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94026 (= res!710081 (validMask!0 mask!1515))))

(assert (=> start!94026 e!605978))

(assert (=> start!94026 true))

(declare-fun tp_is_empty!25273 () Bool)

(assert (=> start!94026 tp_is_empty!25273))

(declare-datatypes ((V!38833 0))(
  ( (V!38834 (val!12687 Int)) )
))
(declare-datatypes ((ValueCell!11933 0))(
  ( (ValueCellFull!11933 (v!15298 V!38833)) (EmptyCell!11933) )
))
(declare-datatypes ((array!67543 0))(
  ( (array!67544 (arr!32477 (Array (_ BitVec 32) ValueCell!11933)) (size!33013 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67543)

(declare-fun e!605983 () Bool)

(declare-fun array_inv!25154 (array!67543) Bool)

(assert (=> start!94026 (and (array_inv!25154 _values!955) e!605983)))

(assert (=> start!94026 tp!75817))

(declare-datatypes ((array!67545 0))(
  ( (array!67546 (arr!32478 (Array (_ BitVec 32) (_ BitVec 64))) (size!33014 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67545)

(declare-fun array_inv!25155 (array!67545) Bool)

(assert (=> start!94026 (array_inv!25155 _keys!1163)))

(declare-fun mapIsEmpty!39586 () Bool)

(declare-fun mapRes!39586 () Bool)

(assert (=> mapIsEmpty!39586 mapRes!39586))

(declare-fun b!1063484 () Bool)

(declare-fun e!605984 () Bool)

(assert (=> b!1063484 (= e!605984 tp_is_empty!25273)))

(declare-fun b!1063485 () Bool)

(assert (=> b!1063485 (= e!605983 (and e!605984 mapRes!39586))))

(declare-fun condMapEmpty!39586 () Bool)

(declare-fun mapDefault!39586 () ValueCell!11933)

