; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94510 () Bool)

(assert start!94510)

(declare-fun b_free!21815 () Bool)

(declare-fun b_next!21815 () Bool)

(assert (=> start!94510 (= b_free!21815 (not b_next!21815))))

(declare-fun tp!76895 () Bool)

(declare-fun b_and!34617 () Bool)

(assert (=> start!94510 (= tp!76895 b_and!34617)))

(declare-fun b!1068660 () Bool)

(declare-fun e!609744 () Bool)

(declare-fun e!609745 () Bool)

(declare-fun mapRes!40135 () Bool)

(assert (=> b!1068660 (= e!609744 (and e!609745 mapRes!40135))))

(declare-fun condMapEmpty!40135 () Bool)

(declare-datatypes ((V!39301 0))(
  ( (V!39302 (val!12863 Int)) )
))
(declare-datatypes ((ValueCell!12109 0))(
  ( (ValueCellFull!12109 (v!15478 V!39301)) (EmptyCell!12109) )
))
(declare-datatypes ((array!68231 0))(
  ( (array!68232 (arr!32814 (Array (_ BitVec 32) ValueCell!12109)) (size!33350 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68231)

(declare-fun mapDefault!40135 () ValueCell!12109)

