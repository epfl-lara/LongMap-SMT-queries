; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112438 () Bool)

(assert start!112438)

(declare-fun b_free!30833 () Bool)

(declare-fun b_next!30833 () Bool)

(assert (=> start!112438 (= b_free!30833 (not b_next!30833))))

(declare-fun tp!108136 () Bool)

(declare-fun b_and!49675 () Bool)

(assert (=> start!112438 (= tp!108136 b_and!49675)))

(declare-fun b!1333060 () Bool)

(declare-fun e!759451 () Bool)

(assert (=> b!1333060 (= e!759451 false)))

(declare-datatypes ((V!54093 0))(
  ( (V!54094 (val!18446 Int)) )
))
(declare-datatypes ((ValueCell!17473 0))(
  ( (ValueCellFull!17473 (v!21083 V!54093)) (EmptyCell!17473) )
))
(declare-datatypes ((array!90360 0))(
  ( (array!90361 (arr!43646 (Array (_ BitVec 32) ValueCell!17473)) (size!44196 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90360)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90362 0))(
  ( (array!90363 (arr!43647 (Array (_ BitVec 32) (_ BitVec 64))) (size!44197 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90362)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592102 () Bool)

(declare-fun zeroValue!1262 () V!54093)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54093)

(declare-datatypes ((tuple2!23774 0))(
  ( (tuple2!23775 (_1!11898 (_ BitVec 64)) (_2!11898 V!54093)) )
))
(declare-datatypes ((List!30919 0))(
  ( (Nil!30916) (Cons!30915 (h!32124 tuple2!23774) (t!45117 List!30919)) )
))
(declare-datatypes ((ListLongMap!21431 0))(
  ( (ListLongMap!21432 (toList!10731 List!30919)) )
))
(declare-fun contains!8895 (ListLongMap!21431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5712 (array!90362 array!90360 (_ BitVec 32) (_ BitVec 32) V!54093 V!54093 (_ BitVec 32) Int) ListLongMap!21431)

(assert (=> b!1333060 (= lt!592102 (contains!8895 (getCurrentListMap!5712 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1333061 () Bool)

(declare-fun res!884618 () Bool)

(assert (=> b!1333061 (=> (not res!884618) (not e!759451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90362 (_ BitVec 32)) Bool)

(assert (=> b!1333061 (= res!884618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333062 () Bool)

(declare-fun e!759450 () Bool)

(declare-fun e!759449 () Bool)

(declare-fun mapRes!56788 () Bool)

(assert (=> b!1333062 (= e!759450 (and e!759449 mapRes!56788))))

(declare-fun condMapEmpty!56788 () Bool)

(declare-fun mapDefault!56788 () ValueCell!17473)

