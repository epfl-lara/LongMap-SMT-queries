; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112574 () Bool)

(assert start!112574)

(declare-fun b_free!30969 () Bool)

(declare-fun b_next!30969 () Bool)

(assert (=> start!112574 (= b_free!30969 (not b_next!30969))))

(declare-fun tp!108543 () Bool)

(declare-fun b_and!49877 () Bool)

(assert (=> start!112574 (= tp!108543 b_and!49877)))

(declare-fun b!1335369 () Bool)

(declare-fun e!760551 () Bool)

(declare-fun e!760552 () Bool)

(declare-fun mapRes!56992 () Bool)

(assert (=> b!1335369 (= e!760551 (and e!760552 mapRes!56992))))

(declare-fun condMapEmpty!56992 () Bool)

(declare-datatypes ((V!54275 0))(
  ( (V!54276 (val!18514 Int)) )
))
(declare-datatypes ((ValueCell!17541 0))(
  ( (ValueCellFull!17541 (v!21151 V!54275)) (EmptyCell!17541) )
))
(declare-datatypes ((array!90618 0))(
  ( (array!90619 (arr!43775 (Array (_ BitVec 32) ValueCell!17541)) (size!44325 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90618)

(declare-fun mapDefault!56992 () ValueCell!17541)

(assert (=> b!1335369 (= condMapEmpty!56992 (= (arr!43775 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17541)) mapDefault!56992)))))

(declare-fun b!1335370 () Bool)

(declare-fun e!760548 () Bool)

(assert (=> b!1335370 (= e!760548 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90620 0))(
  ( (array!90621 (arr!43776 (Array (_ BitVec 32) (_ BitVec 64))) (size!44326 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90620)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54275)

(declare-fun zeroValue!1262 () V!54275)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592450 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23874 0))(
  ( (tuple2!23875 (_1!11948 (_ BitVec 64)) (_2!11948 V!54275)) )
))
(declare-datatypes ((List!31015 0))(
  ( (Nil!31012) (Cons!31011 (h!32220 tuple2!23874) (t!45279 List!31015)) )
))
(declare-datatypes ((ListLongMap!21531 0))(
  ( (ListLongMap!21532 (toList!10781 List!31015)) )
))
(declare-fun contains!8945 (ListLongMap!21531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5755 (array!90620 array!90618 (_ BitVec 32) (_ BitVec 32) V!54275 V!54275 (_ BitVec 32) Int) ListLongMap!21531)

(assert (=> b!1335370 (= lt!592450 (contains!8945 (getCurrentListMap!5755 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56992 () Bool)

(assert (=> mapIsEmpty!56992 mapRes!56992))

(declare-fun b!1335371 () Bool)

(declare-fun res!886250 () Bool)

(assert (=> b!1335371 (=> (not res!886250) (not e!760548))))

(assert (=> b!1335371 (= res!886250 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44326 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!886253 () Bool)

(assert (=> start!112574 (=> (not res!886253) (not e!760548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112574 (= res!886253 (validMask!0 mask!1998))))

(assert (=> start!112574 e!760548))

(declare-fun array_inv!33013 (array!90618) Bool)

(assert (=> start!112574 (and (array_inv!33013 _values!1320) e!760551)))

(assert (=> start!112574 true))

(declare-fun array_inv!33014 (array!90620) Bool)

(assert (=> start!112574 (array_inv!33014 _keys!1590)))

(assert (=> start!112574 tp!108543))

(declare-fun tp_is_empty!36879 () Bool)

(assert (=> start!112574 tp_is_empty!36879))

(declare-fun b!1335372 () Bool)

(declare-fun res!886251 () Bool)

(assert (=> b!1335372 (=> (not res!886251) (not e!760548))))

(assert (=> b!1335372 (= res!886251 (and (= (size!44325 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44326 _keys!1590) (size!44325 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335373 () Bool)

(assert (=> b!1335373 (= e!760552 tp_is_empty!36879)))

(declare-fun b!1335374 () Bool)

(declare-fun res!886252 () Bool)

(assert (=> b!1335374 (=> (not res!886252) (not e!760548))))

(declare-datatypes ((List!31016 0))(
  ( (Nil!31013) (Cons!31012 (h!32221 (_ BitVec 64)) (t!45280 List!31016)) )
))
(declare-fun arrayNoDuplicates!0 (array!90620 (_ BitVec 32) List!31016) Bool)

(assert (=> b!1335374 (= res!886252 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31013))))

(declare-fun mapNonEmpty!56992 () Bool)

(declare-fun tp!108544 () Bool)

(declare-fun e!760549 () Bool)

(assert (=> mapNonEmpty!56992 (= mapRes!56992 (and tp!108544 e!760549))))

(declare-fun mapKey!56992 () (_ BitVec 32))

(declare-fun mapValue!56992 () ValueCell!17541)

(declare-fun mapRest!56992 () (Array (_ BitVec 32) ValueCell!17541))

(assert (=> mapNonEmpty!56992 (= (arr!43775 _values!1320) (store mapRest!56992 mapKey!56992 mapValue!56992))))

(declare-fun b!1335375 () Bool)

(assert (=> b!1335375 (= e!760549 tp_is_empty!36879)))

(declare-fun b!1335376 () Bool)

(declare-fun res!886254 () Bool)

(assert (=> b!1335376 (=> (not res!886254) (not e!760548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90620 (_ BitVec 32)) Bool)

(assert (=> b!1335376 (= res!886254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112574 res!886253) b!1335372))

(assert (= (and b!1335372 res!886251) b!1335376))

(assert (= (and b!1335376 res!886254) b!1335374))

(assert (= (and b!1335374 res!886252) b!1335371))

(assert (= (and b!1335371 res!886250) b!1335370))

(assert (= (and b!1335369 condMapEmpty!56992) mapIsEmpty!56992))

(assert (= (and b!1335369 (not condMapEmpty!56992)) mapNonEmpty!56992))

(get-info :version)

(assert (= (and mapNonEmpty!56992 ((_ is ValueCellFull!17541) mapValue!56992)) b!1335375))

(assert (= (and b!1335369 ((_ is ValueCellFull!17541) mapDefault!56992)) b!1335373))

(assert (= start!112574 b!1335369))

(declare-fun m!1223455 () Bool)

(assert (=> start!112574 m!1223455))

(declare-fun m!1223457 () Bool)

(assert (=> start!112574 m!1223457))

(declare-fun m!1223459 () Bool)

(assert (=> start!112574 m!1223459))

(declare-fun m!1223461 () Bool)

(assert (=> mapNonEmpty!56992 m!1223461))

(declare-fun m!1223463 () Bool)

(assert (=> b!1335376 m!1223463))

(declare-fun m!1223465 () Bool)

(assert (=> b!1335374 m!1223465))

(declare-fun m!1223467 () Bool)

(assert (=> b!1335370 m!1223467))

(assert (=> b!1335370 m!1223467))

(declare-fun m!1223469 () Bool)

(assert (=> b!1335370 m!1223469))

(check-sat tp_is_empty!36879 (not mapNonEmpty!56992) (not start!112574) (not b_next!30969) (not b!1335370) (not b!1335374) b_and!49877 (not b!1335376))
(check-sat b_and!49877 (not b_next!30969))
