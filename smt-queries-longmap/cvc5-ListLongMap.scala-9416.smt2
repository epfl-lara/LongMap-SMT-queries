; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112104 () Bool)

(assert start!112104)

(declare-fun mapIsEmpty!56287 () Bool)

(declare-fun mapRes!56287 () Bool)

(assert (=> mapIsEmpty!56287 mapRes!56287))

(declare-fun res!881047 () Bool)

(declare-fun e!756945 () Bool)

(assert (=> start!112104 (=> (not res!881047) (not e!756945))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112104 (= res!881047 (validMask!0 mask!1998))))

(assert (=> start!112104 e!756945))

(assert (=> start!112104 true))

(declare-datatypes ((V!53649 0))(
  ( (V!53650 (val!18279 Int)) )
))
(declare-datatypes ((ValueCell!17306 0))(
  ( (ValueCellFull!17306 (v!20916 V!53649)) (EmptyCell!17306) )
))
(declare-datatypes ((array!89724 0))(
  ( (array!89725 (arr!43328 (Array (_ BitVec 32) ValueCell!17306)) (size!43878 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89724)

(declare-fun e!756942 () Bool)

(declare-fun array_inv!32703 (array!89724) Bool)

(assert (=> start!112104 (and (array_inv!32703 _values!1320) e!756942)))

(declare-datatypes ((array!89726 0))(
  ( (array!89727 (arr!43329 (Array (_ BitVec 32) (_ BitVec 64))) (size!43879 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89726)

(declare-fun array_inv!32704 (array!89726) Bool)

(assert (=> start!112104 (array_inv!32704 _keys!1590)))

(declare-fun mapNonEmpty!56287 () Bool)

(declare-fun tp!107194 () Bool)

(declare-fun e!756944 () Bool)

(assert (=> mapNonEmpty!56287 (= mapRes!56287 (and tp!107194 e!756944))))

(declare-fun mapKey!56287 () (_ BitVec 32))

(declare-fun mapValue!56287 () ValueCell!17306)

(declare-fun mapRest!56287 () (Array (_ BitVec 32) ValueCell!17306))

(assert (=> mapNonEmpty!56287 (= (arr!43328 _values!1320) (store mapRest!56287 mapKey!56287 mapValue!56287))))

(declare-fun b!1327793 () Bool)

(declare-fun e!756943 () Bool)

(assert (=> b!1327793 (= e!756942 (and e!756943 mapRes!56287))))

(declare-fun condMapEmpty!56287 () Bool)

(declare-fun mapDefault!56287 () ValueCell!17306)

