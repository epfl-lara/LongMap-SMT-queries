; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94090 () Bool)

(assert start!94090)

(declare-fun b_free!21505 () Bool)

(declare-fun b_next!21505 () Bool)

(assert (=> start!94090 (= b_free!21505 (not b_next!21505))))

(declare-fun tp!75947 () Bool)

(declare-fun b_and!34247 () Bool)

(assert (=> start!94090 (= tp!75947 b_and!34247)))

(declare-fun mapNonEmpty!39652 () Bool)

(declare-fun mapRes!39652 () Bool)

(declare-fun tp!75946 () Bool)

(declare-fun e!606408 () Bool)

(assert (=> mapNonEmpty!39652 (= mapRes!39652 (and tp!75946 e!606408))))

(declare-fun mapKey!39652 () (_ BitVec 32))

(declare-datatypes ((V!38889 0))(
  ( (V!38890 (val!12708 Int)) )
))
(declare-datatypes ((ValueCell!11954 0))(
  ( (ValueCellFull!11954 (v!15320 V!38889)) (EmptyCell!11954) )
))
(declare-fun mapRest!39652 () (Array (_ BitVec 32) ValueCell!11954))

(declare-datatypes ((array!67627 0))(
  ( (array!67628 (arr!32518 (Array (_ BitVec 32) ValueCell!11954)) (size!33054 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67627)

(declare-fun mapValue!39652 () ValueCell!11954)

(assert (=> mapNonEmpty!39652 (= (arr!32518 _values!955) (store mapRest!39652 mapKey!39652 mapValue!39652))))

(declare-fun b!1064096 () Bool)

(declare-fun e!606410 () Bool)

(declare-fun e!606407 () Bool)

(assert (=> b!1064096 (= e!606410 (and e!606407 mapRes!39652))))

(declare-fun condMapEmpty!39652 () Bool)

(declare-fun mapDefault!39652 () ValueCell!11954)

