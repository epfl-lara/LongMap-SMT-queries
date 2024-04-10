; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111600 () Bool)

(assert start!111600)

(declare-fun b_free!30257 () Bool)

(declare-fun b_next!30257 () Bool)

(assert (=> start!111600 (= b_free!30257 (not b_next!30257))))

(declare-fun tp!106246 () Bool)

(declare-fun b_and!48673 () Bool)

(assert (=> start!111600 (= tp!106246 b_and!48673)))

(declare-fun b!1321715 () Bool)

(declare-fun res!877262 () Bool)

(declare-fun e!753769 () Bool)

(assert (=> b!1321715 (=> (not res!877262) (not e!753769))))

(declare-datatypes ((array!89078 0))(
  ( (array!89079 (arr!43013 (Array (_ BitVec 32) (_ BitVec 64))) (size!43563 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89078)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89078 (_ BitVec 32)) Bool)

(assert (=> b!1321715 (= res!877262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877263 () Bool)

(assert (=> start!111600 (=> (not res!877263) (not e!753769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111600 (= res!877263 (validMask!0 mask!2019))))

(assert (=> start!111600 e!753769))

(declare-fun array_inv!32473 (array!89078) Bool)

(assert (=> start!111600 (array_inv!32473 _keys!1609)))

(assert (=> start!111600 true))

(declare-fun tp_is_empty!36077 () Bool)

(assert (=> start!111600 tp_is_empty!36077))

(declare-datatypes ((V!53205 0))(
  ( (V!53206 (val!18113 Int)) )
))
(declare-datatypes ((ValueCell!17140 0))(
  ( (ValueCellFull!17140 (v!20743 V!53205)) (EmptyCell!17140) )
))
(declare-datatypes ((array!89080 0))(
  ( (array!89081 (arr!43014 (Array (_ BitVec 32) ValueCell!17140)) (size!43564 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89080)

(declare-fun e!753767 () Bool)

(declare-fun array_inv!32474 (array!89080) Bool)

(assert (=> start!111600 (and (array_inv!32474 _values!1337) e!753767)))

(assert (=> start!111600 tp!106246))

(declare-fun b!1321716 () Bool)

(declare-fun res!877261 () Bool)

(assert (=> b!1321716 (=> (not res!877261) (not e!753769))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321716 (= res!877261 (not (= (select (arr!43013 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1321717 () Bool)

(declare-fun e!753766 () Bool)

(declare-fun mapRes!55763 () Bool)

(assert (=> b!1321717 (= e!753767 (and e!753766 mapRes!55763))))

(declare-fun condMapEmpty!55763 () Bool)

(declare-fun mapDefault!55763 () ValueCell!17140)

