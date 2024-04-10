; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112518 () Bool)

(assert start!112518)

(declare-fun b_free!30913 () Bool)

(declare-fun b_next!30913 () Bool)

(assert (=> start!112518 (= b_free!30913 (not b_next!30913))))

(declare-fun tp!108375 () Bool)

(declare-fun b_and!49821 () Bool)

(assert (=> start!112518 (= tp!108375 b_and!49821)))

(declare-fun b!1334670 () Bool)

(declare-fun e!760128 () Bool)

(declare-fun e!760129 () Bool)

(declare-fun mapRes!56908 () Bool)

(assert (=> b!1334670 (= e!760128 (and e!760129 mapRes!56908))))

(declare-fun condMapEmpty!56908 () Bool)

(declare-datatypes ((V!54201 0))(
  ( (V!54202 (val!18486 Int)) )
))
(declare-datatypes ((ValueCell!17513 0))(
  ( (ValueCellFull!17513 (v!21123 V!54201)) (EmptyCell!17513) )
))
(declare-datatypes ((array!90512 0))(
  ( (array!90513 (arr!43722 (Array (_ BitVec 32) ValueCell!17513)) (size!44272 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90512)

(declare-fun mapDefault!56908 () ValueCell!17513)

