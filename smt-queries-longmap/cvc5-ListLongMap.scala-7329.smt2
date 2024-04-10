; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93656 () Bool)

(assert start!93656)

(declare-fun b!1059573 () Bool)

(declare-fun e!603092 () Bool)

(declare-fun e!603091 () Bool)

(declare-fun mapRes!39106 () Bool)

(assert (=> b!1059573 (= e!603092 (and e!603091 mapRes!39106))))

(declare-fun condMapEmpty!39106 () Bool)

(declare-datatypes ((V!38417 0))(
  ( (V!38418 (val!12531 Int)) )
))
(declare-datatypes ((ValueCell!11777 0))(
  ( (ValueCellFull!11777 (v!15141 V!38417)) (EmptyCell!11777) )
))
(declare-datatypes ((array!66951 0))(
  ( (array!66952 (arr!32185 (Array (_ BitVec 32) ValueCell!11777)) (size!32721 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66951)

(declare-fun mapDefault!39106 () ValueCell!11777)

