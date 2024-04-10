; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84728 () Bool)

(assert start!84728)

(declare-fun b_free!20083 () Bool)

(declare-fun b_next!20083 () Bool)

(assert (=> start!84728 (= b_free!20083 (not b_next!20083))))

(declare-fun tp!70048 () Bool)

(declare-fun b_and!32253 () Bool)

(assert (=> start!84728 (= tp!70048 b_and!32253)))

(declare-fun b!990798 () Bool)

(declare-fun res!662422 () Bool)

(declare-fun e!558696 () Bool)

(assert (=> b!990798 (=> (not res!662422) (not e!558696))))

(declare-datatypes ((array!62561 0))(
  ( (array!62562 (arr!30131 (Array (_ BitVec 32) (_ BitVec 64))) (size!30610 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62561)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62561 (_ BitVec 32)) Bool)

(assert (=> b!990798 (= res!662422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990799 () Bool)

(declare-fun e!558701 () Bool)

(declare-fun e!558698 () Bool)

(declare-fun mapRes!37001 () Bool)

(assert (=> b!990799 (= e!558701 (and e!558698 mapRes!37001))))

(declare-fun condMapEmpty!37001 () Bool)

(declare-datatypes ((V!36049 0))(
  ( (V!36050 (val!11700 Int)) )
))
(declare-datatypes ((ValueCell!11168 0))(
  ( (ValueCellFull!11168 (v!14273 V!36049)) (EmptyCell!11168) )
))
(declare-datatypes ((array!62563 0))(
  ( (array!62564 (arr!30132 (Array (_ BitVec 32) ValueCell!11168)) (size!30611 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62563)

(declare-fun mapDefault!37001 () ValueCell!11168)

