; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112188 () Bool)

(assert start!112188)

(declare-fun b_free!30583 () Bool)

(declare-fun b_next!30583 () Bool)

(assert (=> start!112188 (= b_free!30583 (not b_next!30583))))

(declare-fun tp!107387 () Bool)

(declare-fun b_and!49215 () Bool)

(assert (=> start!112188 (= tp!107387 b_and!49215)))

(declare-fun b!1328618 () Bool)

(declare-fun e!757541 () Bool)

(declare-fun tp_is_empty!36493 () Bool)

(assert (=> b!1328618 (= e!757541 tp_is_empty!36493)))

(declare-fun mapNonEmpty!56413 () Bool)

(declare-fun mapRes!56413 () Bool)

(declare-fun tp!107386 () Bool)

(declare-fun e!757539 () Bool)

(assert (=> mapNonEmpty!56413 (= mapRes!56413 (and tp!107386 e!757539))))

(declare-datatypes ((V!53761 0))(
  ( (V!53762 (val!18321 Int)) )
))
(declare-datatypes ((ValueCell!17348 0))(
  ( (ValueCellFull!17348 (v!20957 V!53761)) (EmptyCell!17348) )
))
(declare-datatypes ((array!89815 0))(
  ( (array!89816 (arr!43374 (Array (_ BitVec 32) ValueCell!17348)) (size!43926 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89815)

(declare-fun mapValue!56413 () ValueCell!17348)

(declare-fun mapRest!56413 () (Array (_ BitVec 32) ValueCell!17348))

(declare-fun mapKey!56413 () (_ BitVec 32))

(assert (=> mapNonEmpty!56413 (= (arr!43374 _values!1320) (store mapRest!56413 mapKey!56413 mapValue!56413))))

(declare-fun b!1328619 () Bool)

(declare-fun res!881535 () Bool)

(declare-fun e!757540 () Bool)

(assert (=> b!1328619 (=> (not res!881535) (not e!757540))))

(declare-datatypes ((array!89817 0))(
  ( (array!89818 (arr!43375 (Array (_ BitVec 32) (_ BitVec 64))) (size!43927 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89817)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89817 (_ BitVec 32)) Bool)

(assert (=> b!1328619 (= res!881535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328620 () Bool)

(assert (=> b!1328620 (= e!757540 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53761)

(declare-fun zeroValue!1262 () V!53761)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590686 () Bool)

(declare-datatypes ((tuple2!23642 0))(
  ( (tuple2!23643 (_1!11832 (_ BitVec 64)) (_2!11832 V!53761)) )
))
(declare-datatypes ((List!30793 0))(
  ( (Nil!30790) (Cons!30789 (h!31998 tuple2!23642) (t!44791 List!30793)) )
))
(declare-datatypes ((ListLongMap!21299 0))(
  ( (ListLongMap!21300 (toList!10665 List!30793)) )
))
(declare-fun contains!8757 (ListLongMap!21299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5537 (array!89817 array!89815 (_ BitVec 32) (_ BitVec 32) V!53761 V!53761 (_ BitVec 32) Int) ListLongMap!21299)

(assert (=> b!1328620 (= lt!590686 (contains!8757 (getCurrentListMap!5537 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328621 () Bool)

(declare-fun res!881537 () Bool)

(assert (=> b!1328621 (=> (not res!881537) (not e!757540))))

(assert (=> b!1328621 (= res!881537 (and (= (size!43926 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43927 _keys!1590) (size!43926 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328622 () Bool)

(assert (=> b!1328622 (= e!757539 tp_is_empty!36493)))

(declare-fun b!1328623 () Bool)

(declare-fun res!881536 () Bool)

(assert (=> b!1328623 (=> (not res!881536) (not e!757540))))

(assert (=> b!1328623 (= res!881536 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43927 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!881539 () Bool)

(assert (=> start!112188 (=> (not res!881539) (not e!757540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112188 (= res!881539 (validMask!0 mask!1998))))

(assert (=> start!112188 e!757540))

(declare-fun e!757542 () Bool)

(declare-fun array_inv!32901 (array!89815) Bool)

(assert (=> start!112188 (and (array_inv!32901 _values!1320) e!757542)))

(assert (=> start!112188 true))

(declare-fun array_inv!32902 (array!89817) Bool)

(assert (=> start!112188 (array_inv!32902 _keys!1590)))

(assert (=> start!112188 tp!107387))

(assert (=> start!112188 tp_is_empty!36493))

(declare-fun b!1328624 () Bool)

(declare-fun res!881538 () Bool)

(assert (=> b!1328624 (=> (not res!881538) (not e!757540))))

(declare-datatypes ((List!30794 0))(
  ( (Nil!30791) (Cons!30790 (h!31999 (_ BitVec 64)) (t!44792 List!30794)) )
))
(declare-fun arrayNoDuplicates!0 (array!89817 (_ BitVec 32) List!30794) Bool)

(assert (=> b!1328624 (= res!881538 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30791))))

(declare-fun b!1328625 () Bool)

(assert (=> b!1328625 (= e!757542 (and e!757541 mapRes!56413))))

(declare-fun condMapEmpty!56413 () Bool)

(declare-fun mapDefault!56413 () ValueCell!17348)

(assert (=> b!1328625 (= condMapEmpty!56413 (= (arr!43374 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17348)) mapDefault!56413)))))

(declare-fun mapIsEmpty!56413 () Bool)

(assert (=> mapIsEmpty!56413 mapRes!56413))

(assert (= (and start!112188 res!881539) b!1328621))

(assert (= (and b!1328621 res!881537) b!1328619))

(assert (= (and b!1328619 res!881535) b!1328624))

(assert (= (and b!1328624 res!881538) b!1328623))

(assert (= (and b!1328623 res!881536) b!1328620))

(assert (= (and b!1328625 condMapEmpty!56413) mapIsEmpty!56413))

(assert (= (and b!1328625 (not condMapEmpty!56413)) mapNonEmpty!56413))

(get-info :version)

(assert (= (and mapNonEmpty!56413 ((_ is ValueCellFull!17348) mapValue!56413)) b!1328622))

(assert (= (and b!1328625 ((_ is ValueCellFull!17348) mapDefault!56413)) b!1328618))

(assert (= start!112188 b!1328625))

(declare-fun m!1217061 () Bool)

(assert (=> b!1328620 m!1217061))

(assert (=> b!1328620 m!1217061))

(declare-fun m!1217063 () Bool)

(assert (=> b!1328620 m!1217063))

(declare-fun m!1217065 () Bool)

(assert (=> start!112188 m!1217065))

(declare-fun m!1217067 () Bool)

(assert (=> start!112188 m!1217067))

(declare-fun m!1217069 () Bool)

(assert (=> start!112188 m!1217069))

(declare-fun m!1217071 () Bool)

(assert (=> mapNonEmpty!56413 m!1217071))

(declare-fun m!1217073 () Bool)

(assert (=> b!1328624 m!1217073))

(declare-fun m!1217075 () Bool)

(assert (=> b!1328619 m!1217075))

(check-sat (not b!1328620) (not b!1328624) (not mapNonEmpty!56413) (not b!1328619) (not start!112188) tp_is_empty!36493 (not b_next!30583) b_and!49215)
(check-sat b_and!49215 (not b_next!30583))
