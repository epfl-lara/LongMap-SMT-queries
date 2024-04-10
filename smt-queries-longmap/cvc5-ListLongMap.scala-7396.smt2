; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94152 () Bool)

(assert start!94152)

(declare-fun b_free!21553 () Bool)

(declare-fun b_next!21553 () Bool)

(assert (=> start!94152 (= b_free!21553 (not b_next!21553))))

(declare-fun tp!76093 () Bool)

(declare-fun b_and!34303 () Bool)

(assert (=> start!94152 (= tp!76093 b_and!34303)))

(declare-fun b!1064732 () Bool)

(declare-fun e!606869 () Bool)

(declare-fun e!606873 () Bool)

(declare-fun mapRes!39727 () Bool)

(assert (=> b!1064732 (= e!606869 (and e!606873 mapRes!39727))))

(declare-fun condMapEmpty!39727 () Bool)

(declare-datatypes ((V!38953 0))(
  ( (V!38954 (val!12732 Int)) )
))
(declare-datatypes ((ValueCell!11978 0))(
  ( (ValueCellFull!11978 (v!15344 V!38953)) (EmptyCell!11978) )
))
(declare-datatypes ((array!67713 0))(
  ( (array!67714 (arr!32560 (Array (_ BitVec 32) ValueCell!11978)) (size!33096 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67713)

(declare-fun mapDefault!39727 () ValueCell!11978)

