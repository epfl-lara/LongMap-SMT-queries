; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112062 () Bool)

(assert start!112062)

(declare-fun mapIsEmpty!56251 () Bool)

(declare-fun mapRes!56251 () Bool)

(assert (=> mapIsEmpty!56251 mapRes!56251))

(declare-fun b!1327525 () Bool)

(declare-fun e!756737 () Bool)

(declare-fun tp_is_empty!36389 () Bool)

(assert (=> b!1327525 (= e!756737 tp_is_empty!36389)))

(declare-fun mapNonEmpty!56251 () Bool)

(declare-fun tp!107158 () Bool)

(assert (=> mapNonEmpty!56251 (= mapRes!56251 (and tp!107158 e!756737))))

(declare-datatypes ((V!53621 0))(
  ( (V!53622 (val!18269 Int)) )
))
(declare-datatypes ((ValueCell!17296 0))(
  ( (ValueCellFull!17296 (v!20905 V!53621)) (EmptyCell!17296) )
))
(declare-datatypes ((array!89686 0))(
  ( (array!89687 (arr!43311 (Array (_ BitVec 32) ValueCell!17296)) (size!43861 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89686)

(declare-fun mapRest!56251 () (Array (_ BitVec 32) ValueCell!17296))

(declare-fun mapKey!56251 () (_ BitVec 32))

(declare-fun mapValue!56251 () ValueCell!17296)

(assert (=> mapNonEmpty!56251 (= (arr!43311 _values!1320) (store mapRest!56251 mapKey!56251 mapValue!56251))))

(declare-fun b!1327526 () Bool)

(declare-fun e!756736 () Bool)

(declare-fun e!756733 () Bool)

(assert (=> b!1327526 (= e!756736 (and e!756733 mapRes!56251))))

(declare-fun condMapEmpty!56251 () Bool)

(declare-fun mapDefault!56251 () ValueCell!17296)

