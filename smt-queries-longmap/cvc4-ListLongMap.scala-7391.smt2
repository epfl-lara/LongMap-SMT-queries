; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94126 () Bool)

(assert start!94126)

(declare-fun b_free!21527 () Bool)

(declare-fun b_next!21527 () Bool)

(assert (=> start!94126 (= b_free!21527 (not b_next!21527))))

(declare-fun tp!76016 () Bool)

(declare-fun b_and!34277 () Bool)

(assert (=> start!94126 (= tp!76016 b_and!34277)))

(declare-fun b!1064420 () Bool)

(declare-fun e!606637 () Bool)

(declare-fun e!606640 () Bool)

(declare-fun mapRes!39688 () Bool)

(assert (=> b!1064420 (= e!606637 (and e!606640 mapRes!39688))))

(declare-fun condMapEmpty!39688 () Bool)

(declare-datatypes ((V!38917 0))(
  ( (V!38918 (val!12719 Int)) )
))
(declare-datatypes ((ValueCell!11965 0))(
  ( (ValueCellFull!11965 (v!15331 V!38917)) (EmptyCell!11965) )
))
(declare-datatypes ((array!67665 0))(
  ( (array!67666 (arr!32536 (Array (_ BitVec 32) ValueCell!11965)) (size!33072 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67665)

(declare-fun mapDefault!39688 () ValueCell!11965)

