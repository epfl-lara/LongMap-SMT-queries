; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96046 () Bool)

(assert start!96046)

(declare-fun b_free!22699 () Bool)

(declare-fun b_next!22699 () Bool)

(assert (=> start!96046 (= b_free!22699 (not b_next!22699))))

(declare-fun tp!79945 () Bool)

(declare-fun b_and!36073 () Bool)

(assert (=> start!96046 (= tp!79945 b_and!36073)))

(declare-fun b!1089118 () Bool)

(declare-fun e!622081 () Bool)

(declare-fun e!622076 () Bool)

(declare-fun mapRes!41806 () Bool)

(assert (=> b!1089118 (= e!622081 (and e!622076 mapRes!41806))))

(declare-fun condMapEmpty!41806 () Bool)

(declare-datatypes ((V!40729 0))(
  ( (V!40730 (val!13407 Int)) )
))
(declare-datatypes ((ValueCell!12641 0))(
  ( (ValueCellFull!12641 (v!16028 V!40729)) (EmptyCell!12641) )
))
(declare-datatypes ((array!70327 0))(
  ( (array!70328 (arr!33837 (Array (_ BitVec 32) ValueCell!12641)) (size!34373 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70327)

(declare-fun mapDefault!41806 () ValueCell!12641)

