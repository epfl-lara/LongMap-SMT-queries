; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94350 () Bool)

(assert start!94350)

(declare-fun b_free!21691 () Bool)

(declare-fun b_next!21691 () Bool)

(assert (=> start!94350 (= b_free!21691 (not b_next!21691))))

(declare-fun tp!76517 () Bool)

(declare-fun b_and!34475 () Bool)

(assert (=> start!94350 (= tp!76517 b_and!34475)))

(declare-fun b!1066911 () Bool)

(declare-fun e!608453 () Bool)

(declare-fun e!608454 () Bool)

(declare-fun mapRes!39943 () Bool)

(assert (=> b!1066911 (= e!608453 (and e!608454 mapRes!39943))))

(declare-fun condMapEmpty!39943 () Bool)

(declare-datatypes ((V!39137 0))(
  ( (V!39138 (val!12801 Int)) )
))
(declare-datatypes ((ValueCell!12047 0))(
  ( (ValueCellFull!12047 (v!15415 V!39137)) (EmptyCell!12047) )
))
(declare-datatypes ((array!67989 0))(
  ( (array!67990 (arr!32695 (Array (_ BitVec 32) ValueCell!12047)) (size!33231 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67989)

(declare-fun mapDefault!39943 () ValueCell!12047)

