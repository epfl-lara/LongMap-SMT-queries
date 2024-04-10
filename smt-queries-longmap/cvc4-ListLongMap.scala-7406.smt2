; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94232 () Bool)

(assert start!94232)

(declare-fun b_free!21617 () Bool)

(declare-fun b_next!21617 () Bool)

(assert (=> start!94232 (= b_free!21617 (not b_next!21617))))

(declare-fun tp!76289 () Bool)

(declare-fun b_and!34377 () Bool)

(assert (=> start!94232 (= tp!76289 b_and!34377)))

(declare-fun b!1065657 () Bool)

(declare-fun e!607553 () Bool)

(declare-fun e!607552 () Bool)

(declare-fun mapRes!39826 () Bool)

(assert (=> b!1065657 (= e!607553 (and e!607552 mapRes!39826))))

(declare-fun condMapEmpty!39826 () Bool)

(declare-datatypes ((V!39037 0))(
  ( (V!39038 (val!12764 Int)) )
))
(declare-datatypes ((ValueCell!12010 0))(
  ( (ValueCellFull!12010 (v!15376 V!39037)) (EmptyCell!12010) )
))
(declare-datatypes ((array!67841 0))(
  ( (array!67842 (arr!32623 (Array (_ BitVec 32) ValueCell!12010)) (size!33159 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67841)

(declare-fun mapDefault!39826 () ValueCell!12010)

