; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94656 () Bool)

(assert start!94656)

(declare-fun b_free!21925 () Bool)

(declare-fun b_next!21925 () Bool)

(assert (=> start!94656 (= b_free!21925 (not b_next!21925))))

(declare-fun tp!77230 () Bool)

(declare-fun b_and!34745 () Bool)

(assert (=> start!94656 (= tp!77230 b_and!34745)))

(declare-fun b!1070205 () Bool)

(declare-fun e!610871 () Bool)

(declare-fun e!610872 () Bool)

(declare-fun mapRes!40306 () Bool)

(assert (=> b!1070205 (= e!610871 (and e!610872 mapRes!40306))))

(declare-fun condMapEmpty!40306 () Bool)

(declare-datatypes ((V!39449 0))(
  ( (V!39450 (val!12918 Int)) )
))
(declare-datatypes ((ValueCell!12164 0))(
  ( (ValueCellFull!12164 (v!15534 V!39449)) (EmptyCell!12164) )
))
(declare-datatypes ((array!68447 0))(
  ( (array!68448 (arr!32920 (Array (_ BitVec 32) ValueCell!12164)) (size!33456 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68447)

(declare-fun mapDefault!40306 () ValueCell!12164)

