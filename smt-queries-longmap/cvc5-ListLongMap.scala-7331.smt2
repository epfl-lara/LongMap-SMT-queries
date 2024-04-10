; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93668 () Bool)

(assert start!93668)

(declare-fun b!1059681 () Bool)

(declare-fun e!603180 () Bool)

(declare-fun e!603182 () Bool)

(declare-fun mapRes!39124 () Bool)

(assert (=> b!1059681 (= e!603180 (and e!603182 mapRes!39124))))

(declare-fun condMapEmpty!39124 () Bool)

(declare-datatypes ((V!38433 0))(
  ( (V!38434 (val!12537 Int)) )
))
(declare-datatypes ((ValueCell!11783 0))(
  ( (ValueCellFull!11783 (v!15147 V!38433)) (EmptyCell!11783) )
))
(declare-datatypes ((array!66973 0))(
  ( (array!66974 (arr!32196 (Array (_ BitVec 32) ValueCell!11783)) (size!32732 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66973)

(declare-fun mapDefault!39124 () ValueCell!11783)

