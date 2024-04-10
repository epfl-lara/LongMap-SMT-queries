; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95848 () Bool)

(assert start!95848)

(declare-fun b_free!22501 () Bool)

(declare-fun b_next!22501 () Bool)

(assert (=> start!95848 (= b_free!22501 (not b_next!22501))))

(declare-fun tp!79352 () Bool)

(declare-fun b_and!35677 () Bool)

(assert (=> start!95848 (= tp!79352 b_and!35677)))

(declare-fun mapNonEmpty!41509 () Bool)

(declare-fun mapRes!41509 () Bool)

(declare-fun tp!79351 () Bool)

(declare-fun e!619710 () Bool)

(assert (=> mapNonEmpty!41509 (= mapRes!41509 (and tp!79351 e!619710))))

(declare-datatypes ((V!40465 0))(
  ( (V!40466 (val!13308 Int)) )
))
(declare-datatypes ((ValueCell!12542 0))(
  ( (ValueCellFull!12542 (v!15929 V!40465)) (EmptyCell!12542) )
))
(declare-datatypes ((array!69943 0))(
  ( (array!69944 (arr!33645 (Array (_ BitVec 32) ValueCell!12542)) (size!34181 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69943)

(declare-fun mapValue!41509 () ValueCell!12542)

(declare-fun mapKey!41509 () (_ BitVec 32))

(declare-fun mapRest!41509 () (Array (_ BitVec 32) ValueCell!12542))

(assert (=> mapNonEmpty!41509 (= (arr!33645 _values!874) (store mapRest!41509 mapKey!41509 mapValue!41509))))

(declare-fun b!1084761 () Bool)

(declare-fun res!723198 () Bool)

(declare-fun e!619706 () Bool)

(assert (=> b!1084761 (=> (not res!723198) (not e!619706))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69945 0))(
  ( (array!69946 (arr!33646 (Array (_ BitVec 32) (_ BitVec 64))) (size!34182 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69945)

(assert (=> b!1084761 (= res!723198 (and (= (size!34181 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34182 _keys!1070) (size!34181 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084762 () Bool)

(declare-fun res!723193 () Bool)

(assert (=> b!1084762 (=> (not res!723193) (not e!619706))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084762 (= res!723193 (validKeyInArray!0 k!904))))

(declare-fun b!1084763 () Bool)

(declare-fun e!619708 () Bool)

(declare-fun e!619712 () Bool)

(assert (=> b!1084763 (= e!619708 (and e!619712 mapRes!41509))))

(declare-fun condMapEmpty!41509 () Bool)

(declare-fun mapDefault!41509 () ValueCell!12542)

