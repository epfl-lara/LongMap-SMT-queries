; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113148 () Bool)

(assert start!113148)

(declare-fun b_free!31199 () Bool)

(declare-fun b_next!31199 () Bool)

(assert (=> start!113148 (= b_free!31199 (not b_next!31199))))

(declare-fun tp!109401 () Bool)

(declare-fun b_and!50305 () Bool)

(assert (=> start!113148 (= tp!109401 b_and!50305)))

(declare-fun res!890089 () Bool)

(declare-fun e!763970 () Bool)

(assert (=> start!113148 (=> (not res!890089) (not e!763970))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113148 (= res!890089 (validMask!0 mask!1977))))

(assert (=> start!113148 e!763970))

(declare-fun tp_is_empty!37199 () Bool)

(assert (=> start!113148 tp_is_empty!37199))

(assert (=> start!113148 true))

(declare-datatypes ((array!91250 0))(
  ( (array!91251 (arr!44081 (Array (_ BitVec 32) (_ BitVec 64))) (size!44631 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91250)

(declare-fun array_inv!33229 (array!91250) Bool)

(assert (=> start!113148 (array_inv!33229 _keys!1571)))

(declare-datatypes ((V!54701 0))(
  ( (V!54702 (val!18674 Int)) )
))
(declare-datatypes ((ValueCell!17701 0))(
  ( (ValueCellFull!17701 (v!21322 V!54701)) (EmptyCell!17701) )
))
(declare-datatypes ((array!91252 0))(
  ( (array!91253 (arr!44082 (Array (_ BitVec 32) ValueCell!17701)) (size!44632 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91252)

(declare-fun e!763972 () Bool)

(declare-fun array_inv!33230 (array!91252) Bool)

(assert (=> start!113148 (and (array_inv!33230 _values!1303) e!763972)))

(assert (=> start!113148 tp!109401))

(declare-fun b!1341675 () Bool)

(declare-fun res!890086 () Bool)

(assert (=> b!1341675 (=> (not res!890086) (not e!763970))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341675 (= res!890086 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44631 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341676 () Bool)

(declare-fun e!763971 () Bool)

(declare-fun mapRes!57505 () Bool)

(assert (=> b!1341676 (= e!763972 (and e!763971 mapRes!57505))))

(declare-fun condMapEmpty!57505 () Bool)

(declare-fun mapDefault!57505 () ValueCell!17701)

