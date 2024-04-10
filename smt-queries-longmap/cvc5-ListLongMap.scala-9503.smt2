; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112684 () Bool)

(assert start!112684)

(declare-fun b_free!31021 () Bool)

(declare-fun b_next!31021 () Bool)

(assert (=> start!112684 (= b_free!31021 (not b_next!31021))))

(declare-fun tp!108704 () Bool)

(declare-fun b_and!49979 () Bool)

(assert (=> start!112684 (= tp!108704 b_and!49979)))

(declare-fun b!1336709 () Bool)

(declare-fun res!887105 () Bool)

(declare-fun e!761184 () Bool)

(assert (=> b!1336709 (=> (not res!887105) (not e!761184))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336709 (= res!887105 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!887097 () Bool)

(assert (=> start!112684 (=> (not res!887097) (not e!761184))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112684 (= res!887097 (validMask!0 mask!1998))))

(assert (=> start!112684 e!761184))

(declare-datatypes ((V!54345 0))(
  ( (V!54346 (val!18540 Int)) )
))
(declare-datatypes ((ValueCell!17567 0))(
  ( (ValueCellFull!17567 (v!21180 V!54345)) (EmptyCell!17567) )
))
(declare-datatypes ((array!90720 0))(
  ( (array!90721 (arr!43825 (Array (_ BitVec 32) ValueCell!17567)) (size!44375 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90720)

(declare-fun e!761185 () Bool)

(declare-fun array_inv!33051 (array!90720) Bool)

(assert (=> start!112684 (and (array_inv!33051 _values!1320) e!761185)))

(assert (=> start!112684 true))

(declare-datatypes ((array!90722 0))(
  ( (array!90723 (arr!43826 (Array (_ BitVec 32) (_ BitVec 64))) (size!44376 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90722)

(declare-fun array_inv!33052 (array!90722) Bool)

(assert (=> start!112684 (array_inv!33052 _keys!1590)))

(assert (=> start!112684 tp!108704))

(declare-fun tp_is_empty!36931 () Bool)

(assert (=> start!112684 tp_is_empty!36931))

(declare-fun mapIsEmpty!57074 () Bool)

(declare-fun mapRes!57074 () Bool)

(assert (=> mapIsEmpty!57074 mapRes!57074))

(declare-fun b!1336710 () Bool)

(declare-fun res!887103 () Bool)

(assert (=> b!1336710 (=> (not res!887103) (not e!761184))))

(assert (=> b!1336710 (= res!887103 (and (= (size!44375 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44376 _keys!1590) (size!44375 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336711 () Bool)

(declare-fun res!887101 () Bool)

(assert (=> b!1336711 (=> (not res!887101) (not e!761184))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336711 (= res!887101 (not (= (select (arr!43826 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1336712 () Bool)

(declare-fun res!887100 () Bool)

(assert (=> b!1336712 (=> (not res!887100) (not e!761184))))

(declare-datatypes ((List!31056 0))(
  ( (Nil!31053) (Cons!31052 (h!32261 (_ BitVec 64)) (t!45358 List!31056)) )
))
(declare-fun arrayNoDuplicates!0 (array!90722 (_ BitVec 32) List!31056) Bool)

(assert (=> b!1336712 (= res!887100 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31053))))

(declare-fun b!1336713 () Bool)

(declare-fun e!761181 () Bool)

(assert (=> b!1336713 (= e!761185 (and e!761181 mapRes!57074))))

(declare-fun condMapEmpty!57074 () Bool)

(declare-fun mapDefault!57074 () ValueCell!17567)

