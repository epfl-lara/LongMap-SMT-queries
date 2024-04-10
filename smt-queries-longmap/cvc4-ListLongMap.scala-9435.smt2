; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112222 () Bool)

(assert start!112222)

(declare-fun b_free!30617 () Bool)

(declare-fun b_next!30617 () Bool)

(assert (=> start!112222 (= b_free!30617 (not b_next!30617))))

(declare-fun tp!107488 () Bool)

(declare-fun b_and!49289 () Bool)

(assert (=> start!112222 (= tp!107488 b_and!49289)))

(declare-fun b!1329285 () Bool)

(declare-fun res!881988 () Bool)

(declare-fun e!757828 () Bool)

(assert (=> b!1329285 (=> (not res!881988) (not e!757828))))

(declare-datatypes ((V!53805 0))(
  ( (V!53806 (val!18338 Int)) )
))
(declare-datatypes ((ValueCell!17365 0))(
  ( (ValueCellFull!17365 (v!20975 V!53805)) (EmptyCell!17365) )
))
(declare-datatypes ((array!89946 0))(
  ( (array!89947 (arr!43439 (Array (_ BitVec 32) ValueCell!17365)) (size!43989 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89946)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89948 0))(
  ( (array!89949 (arr!43440 (Array (_ BitVec 32) (_ BitVec 64))) (size!43990 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89948)

(assert (=> b!1329285 (= res!881988 (and (= (size!43989 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43990 _keys!1590) (size!43989 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329286 () Bool)

(declare-fun e!757831 () Bool)

(declare-fun e!757829 () Bool)

(declare-fun mapRes!56464 () Bool)

(assert (=> b!1329286 (= e!757831 (and e!757829 mapRes!56464))))

(declare-fun condMapEmpty!56464 () Bool)

(declare-fun mapDefault!56464 () ValueCell!17365)

