; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113076 () Bool)

(assert start!113076)

(declare-fun b_free!31127 () Bool)

(declare-fun b_next!31127 () Bool)

(assert (=> start!113076 (= b_free!31127 (not b_next!31127))))

(declare-fun tp!109185 () Bool)

(declare-fun b_and!50161 () Bool)

(assert (=> start!113076 (= tp!109185 b_and!50161)))

(declare-fun mapNonEmpty!57397 () Bool)

(declare-fun mapRes!57397 () Bool)

(declare-fun tp!109186 () Bool)

(declare-fun e!763433 () Bool)

(assert (=> mapNonEmpty!57397 (= mapRes!57397 (and tp!109186 e!763433))))

(declare-datatypes ((V!54605 0))(
  ( (V!54606 (val!18638 Int)) )
))
(declare-datatypes ((ValueCell!17665 0))(
  ( (ValueCellFull!17665 (v!21286 V!54605)) (EmptyCell!17665) )
))
(declare-fun mapValue!57397 () ValueCell!17665)

(declare-fun mapKey!57397 () (_ BitVec 32))

(declare-fun mapRest!57397 () (Array (_ BitVec 32) ValueCell!17665))

(declare-datatypes ((array!91106 0))(
  ( (array!91107 (arr!44009 (Array (_ BitVec 32) ValueCell!17665)) (size!44559 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91106)

(assert (=> mapNonEmpty!57397 (= (arr!44009 _values!1303) (store mapRest!57397 mapKey!57397 mapValue!57397))))

(declare-fun b!1340307 () Bool)

(declare-fun tp_is_empty!37127 () Bool)

(assert (=> b!1340307 (= e!763433 tp_is_empty!37127)))

(declare-fun b!1340308 () Bool)

(declare-fun res!889116 () Bool)

(declare-fun e!763430 () Bool)

(assert (=> b!1340308 (=> (not res!889116) (not e!763430))))

(declare-datatypes ((array!91108 0))(
  ( (array!91109 (arr!44010 (Array (_ BitVec 32) (_ BitVec 64))) (size!44560 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91108)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340308 (= res!889116 (validKeyInArray!0 (select (arr!44010 _keys!1571) from!1960)))))

(declare-fun b!1340309 () Bool)

(declare-fun res!889119 () Bool)

(assert (=> b!1340309 (=> (not res!889119) (not e!763430))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340309 (= res!889119 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!889113 () Bool)

(assert (=> start!113076 (=> (not res!889113) (not e!763430))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113076 (= res!889113 (validMask!0 mask!1977))))

(assert (=> start!113076 e!763430))

(assert (=> start!113076 tp_is_empty!37127))

(assert (=> start!113076 true))

(declare-fun array_inv!33181 (array!91108) Bool)

(assert (=> start!113076 (array_inv!33181 _keys!1571)))

(declare-fun e!763431 () Bool)

(declare-fun array_inv!33182 (array!91106) Bool)

(assert (=> start!113076 (and (array_inv!33182 _values!1303) e!763431)))

(assert (=> start!113076 tp!109185))

(declare-fun b!1340310 () Bool)

(declare-fun e!763432 () Bool)

(assert (=> b!1340310 (= e!763431 (and e!763432 mapRes!57397))))

(declare-fun condMapEmpty!57397 () Bool)

(declare-fun mapDefault!57397 () ValueCell!17665)

