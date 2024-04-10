; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84658 () Bool)

(assert start!84658)

(declare-fun b_free!20069 () Bool)

(declare-fun b_next!20069 () Bool)

(assert (=> start!84658 (= b_free!20069 (not b_next!20069))))

(declare-fun tp!70002 () Bool)

(declare-fun b_and!32209 () Bool)

(assert (=> start!84658 (= tp!70002 b_and!32209)))

(declare-fun b!990060 () Bool)

(declare-fun res!662047 () Bool)

(declare-fun e!558272 () Bool)

(assert (=> b!990060 (=> (not res!662047) (not e!558272))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62531 0))(
  ( (array!62532 (arr!30117 (Array (_ BitVec 32) (_ BitVec 64))) (size!30596 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62531)

(assert (=> b!990060 (= res!662047 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30596 _keys!1544))))))

(declare-fun b!990061 () Bool)

(declare-fun e!558268 () Bool)

(declare-fun e!558271 () Bool)

(declare-fun mapRes!36976 () Bool)

(assert (=> b!990061 (= e!558268 (and e!558271 mapRes!36976))))

(declare-fun condMapEmpty!36976 () Bool)

(declare-datatypes ((V!36029 0))(
  ( (V!36030 (val!11693 Int)) )
))
(declare-datatypes ((ValueCell!11161 0))(
  ( (ValueCellFull!11161 (v!14263 V!36029)) (EmptyCell!11161) )
))
(declare-datatypes ((array!62533 0))(
  ( (array!62534 (arr!30118 (Array (_ BitVec 32) ValueCell!11161)) (size!30597 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62533)

(declare-fun mapDefault!36976 () ValueCell!11161)

