; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93570 () Bool)

(assert start!93570)

(declare-fun b!1059005 () Bool)

(declare-fun e!602640 () Bool)

(declare-fun e!602643 () Bool)

(declare-fun mapRes!39022 () Bool)

(assert (=> b!1059005 (= e!602640 (and e!602643 mapRes!39022))))

(declare-fun condMapEmpty!39022 () Bool)

(declare-datatypes ((V!38353 0))(
  ( (V!38354 (val!12507 Int)) )
))
(declare-datatypes ((ValueCell!11753 0))(
  ( (ValueCellFull!11753 (v!15116 V!38353)) (EmptyCell!11753) )
))
(declare-datatypes ((array!66853 0))(
  ( (array!66854 (arr!32140 (Array (_ BitVec 32) ValueCell!11753)) (size!32676 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66853)

(declare-fun mapDefault!39022 () ValueCell!11753)

