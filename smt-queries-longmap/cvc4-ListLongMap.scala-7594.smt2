; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95888 () Bool)

(assert start!95888)

(declare-fun b_free!22541 () Bool)

(declare-fun b_next!22541 () Bool)

(assert (=> start!95888 (= b_free!22541 (not b_next!22541))))

(declare-fun tp!79472 () Bool)

(declare-fun b_and!35757 () Bool)

(assert (=> start!95888 (= tp!79472 b_and!35757)))

(declare-fun b!1085633 () Bool)

(declare-fun res!723843 () Bool)

(declare-fun e!620182 () Bool)

(assert (=> b!1085633 (=> (not res!723843) (not e!620182))))

(declare-datatypes ((array!70021 0))(
  ( (array!70022 (arr!33684 (Array (_ BitVec 32) (_ BitVec 64))) (size!34220 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70021)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70021 (_ BitVec 32)) Bool)

(assert (=> b!1085633 (= res!723843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085634 () Bool)

(declare-fun res!723846 () Bool)

(assert (=> b!1085634 (=> (not res!723846) (not e!620182))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40517 0))(
  ( (V!40518 (val!13328 Int)) )
))
(declare-datatypes ((ValueCell!12562 0))(
  ( (ValueCellFull!12562 (v!15949 V!40517)) (EmptyCell!12562) )
))
(declare-datatypes ((array!70023 0))(
  ( (array!70024 (arr!33685 (Array (_ BitVec 32) ValueCell!12562)) (size!34221 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70023)

(assert (=> b!1085634 (= res!723846 (and (= (size!34221 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34220 _keys!1070) (size!34221 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085635 () Bool)

(declare-fun e!620184 () Bool)

(declare-fun e!620181 () Bool)

(declare-fun mapRes!41569 () Bool)

(assert (=> b!1085635 (= e!620184 (and e!620181 mapRes!41569))))

(declare-fun condMapEmpty!41569 () Bool)

(declare-fun mapDefault!41569 () ValueCell!12562)

