; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111708 () Bool)

(assert start!111708)

(declare-fun b_free!30365 () Bool)

(declare-fun b_next!30365 () Bool)

(assert (=> start!111708 (= b_free!30365 (not b_next!30365))))

(declare-fun tp!106570 () Bool)

(declare-fun b_and!48889 () Bool)

(assert (=> start!111708 (= tp!106570 b_and!48889)))

(declare-fun b!1323605 () Bool)

(declare-fun res!878558 () Bool)

(declare-fun e!754579 () Bool)

(assert (=> b!1323605 (=> (not res!878558) (not e!754579))))

(declare-datatypes ((array!89286 0))(
  ( (array!89287 (arr!43117 (Array (_ BitVec 32) (_ BitVec 64))) (size!43667 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89286)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323605 (= res!878558 (validKeyInArray!0 (select (arr!43117 _keys!1609) from!2000)))))

(declare-fun b!1323606 () Bool)

(declare-fun res!878564 () Bool)

(assert (=> b!1323606 (=> (not res!878564) (not e!754579))))

(declare-datatypes ((List!30562 0))(
  ( (Nil!30559) (Cons!30558 (h!31767 (_ BitVec 64)) (t!44476 List!30562)) )
))
(declare-fun arrayNoDuplicates!0 (array!89286 (_ BitVec 32) List!30562) Bool)

(assert (=> b!1323606 (= res!878564 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30559))))

(declare-fun b!1323607 () Bool)

(declare-fun e!754577 () Bool)

(declare-fun e!754578 () Bool)

(declare-fun mapRes!55925 () Bool)

(assert (=> b!1323607 (= e!754577 (and e!754578 mapRes!55925))))

(declare-fun condMapEmpty!55925 () Bool)

(declare-datatypes ((V!53349 0))(
  ( (V!53350 (val!18167 Int)) )
))
(declare-datatypes ((ValueCell!17194 0))(
  ( (ValueCellFull!17194 (v!20797 V!53349)) (EmptyCell!17194) )
))
(declare-datatypes ((array!89288 0))(
  ( (array!89289 (arr!43118 (Array (_ BitVec 32) ValueCell!17194)) (size!43668 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89288)

(declare-fun mapDefault!55925 () ValueCell!17194)

