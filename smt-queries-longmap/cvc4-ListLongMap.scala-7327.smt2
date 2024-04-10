; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93648 () Bool)

(assert start!93648)

(declare-fun b!1059502 () Bool)

(declare-fun e!603030 () Bool)

(declare-fun e!603029 () Bool)

(declare-fun mapRes!39094 () Bool)

(assert (=> b!1059502 (= e!603030 (and e!603029 mapRes!39094))))

(declare-fun condMapEmpty!39094 () Bool)

(declare-datatypes ((V!38405 0))(
  ( (V!38406 (val!12527 Int)) )
))
(declare-datatypes ((ValueCell!11773 0))(
  ( (ValueCellFull!11773 (v!15137 V!38405)) (EmptyCell!11773) )
))
(declare-datatypes ((array!66937 0))(
  ( (array!66938 (arr!32178 (Array (_ BitVec 32) ValueCell!11773)) (size!32714 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66937)

(declare-fun mapDefault!39094 () ValueCell!11773)

