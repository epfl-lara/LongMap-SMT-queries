; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94744 () Bool)

(assert start!94744)

(declare-fun b_free!21997 () Bool)

(declare-fun b_next!21997 () Bool)

(assert (=> start!94744 (= b_free!21997 (not b_next!21997))))

(declare-fun tp!77450 () Bool)

(declare-fun b_and!34827 () Bool)

(assert (=> start!94744 (= tp!77450 b_and!34827)))

(declare-fun b!1071264 () Bool)

(declare-fun e!611661 () Bool)

(declare-fun tp_is_empty!25807 () Bool)

(assert (=> b!1071264 (= e!611661 tp_is_empty!25807)))

(declare-fun b!1071266 () Bool)

(declare-fun e!611659 () Bool)

(declare-fun mapRes!40417 () Bool)

(assert (=> b!1071266 (= e!611659 (and e!611661 mapRes!40417))))

(declare-fun condMapEmpty!40417 () Bool)

(declare-datatypes ((V!39545 0))(
  ( (V!39546 (val!12954 Int)) )
))
(declare-datatypes ((ValueCell!12200 0))(
  ( (ValueCellFull!12200 (v!15570 V!39545)) (EmptyCell!12200) )
))
(declare-datatypes ((array!68591 0))(
  ( (array!68592 (arr!32991 (Array (_ BitVec 32) ValueCell!12200)) (size!33527 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68591)

(declare-fun mapDefault!40417 () ValueCell!12200)

