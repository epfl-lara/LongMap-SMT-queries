; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112048 () Bool)

(assert start!112048)

(declare-fun b!1327443 () Bool)

(declare-fun res!880856 () Bool)

(declare-fun e!756674 () Bool)

(assert (=> b!1327443 (=> (not res!880856) (not e!756674))))

(declare-datatypes ((array!89672 0))(
  ( (array!89673 (arr!43305 (Array (_ BitVec 32) (_ BitVec 64))) (size!43855 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89672)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89672 (_ BitVec 32)) Bool)

(assert (=> b!1327443 (= res!880856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56239 () Bool)

(declare-fun mapRes!56239 () Bool)

(declare-fun tp!107146 () Bool)

(declare-fun e!756677 () Bool)

(assert (=> mapNonEmpty!56239 (= mapRes!56239 (and tp!107146 e!756677))))

(declare-datatypes ((V!53613 0))(
  ( (V!53614 (val!18266 Int)) )
))
(declare-datatypes ((ValueCell!17293 0))(
  ( (ValueCellFull!17293 (v!20902 V!53613)) (EmptyCell!17293) )
))
(declare-datatypes ((array!89674 0))(
  ( (array!89675 (arr!43306 (Array (_ BitVec 32) ValueCell!17293)) (size!43856 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89674)

(declare-fun mapValue!56239 () ValueCell!17293)

(declare-fun mapKey!56239 () (_ BitVec 32))

(declare-fun mapRest!56239 () (Array (_ BitVec 32) ValueCell!17293))

(assert (=> mapNonEmpty!56239 (= (arr!43306 _values!1320) (store mapRest!56239 mapKey!56239 mapValue!56239))))

(declare-fun b!1327444 () Bool)

(declare-fun e!756675 () Bool)

(declare-fun e!756673 () Bool)

(assert (=> b!1327444 (= e!756675 (and e!756673 mapRes!56239))))

(declare-fun condMapEmpty!56239 () Bool)

(declare-fun mapDefault!56239 () ValueCell!17293)

