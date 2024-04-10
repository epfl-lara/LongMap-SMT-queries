; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93574 () Bool)

(assert start!93574)

(declare-fun b!1059041 () Bool)

(declare-fun e!602673 () Bool)

(declare-fun e!602674 () Bool)

(declare-fun mapRes!39028 () Bool)

(assert (=> b!1059041 (= e!602673 (and e!602674 mapRes!39028))))

(declare-fun condMapEmpty!39028 () Bool)

(declare-datatypes ((V!38357 0))(
  ( (V!38358 (val!12509 Int)) )
))
(declare-datatypes ((ValueCell!11755 0))(
  ( (ValueCellFull!11755 (v!15118 V!38357)) (EmptyCell!11755) )
))
(declare-datatypes ((array!66859 0))(
  ( (array!66860 (arr!32143 (Array (_ BitVec 32) ValueCell!11755)) (size!32679 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66859)

(declare-fun mapDefault!39028 () ValueCell!11755)

