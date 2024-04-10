; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94144 () Bool)

(assert start!94144)

(declare-fun b_free!21545 () Bool)

(declare-fun b_next!21545 () Bool)

(assert (=> start!94144 (= b_free!21545 (not b_next!21545))))

(declare-fun tp!76070 () Bool)

(declare-fun b_and!34295 () Bool)

(assert (=> start!94144 (= tp!76070 b_and!34295)))

(declare-fun b!1064636 () Bool)

(declare-fun e!606801 () Bool)

(declare-fun e!606802 () Bool)

(declare-fun mapRes!39715 () Bool)

(assert (=> b!1064636 (= e!606801 (and e!606802 mapRes!39715))))

(declare-fun condMapEmpty!39715 () Bool)

(declare-datatypes ((V!38941 0))(
  ( (V!38942 (val!12728 Int)) )
))
(declare-datatypes ((ValueCell!11974 0))(
  ( (ValueCellFull!11974 (v!15340 V!38941)) (EmptyCell!11974) )
))
(declare-datatypes ((array!67699 0))(
  ( (array!67700 (arr!32553 (Array (_ BitVec 32) ValueCell!11974)) (size!33089 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67699)

(declare-fun mapDefault!39715 () ValueCell!11974)

