; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112176 () Bool)

(assert start!112176)

(declare-fun b_free!30571 () Bool)

(declare-fun b_next!30571 () Bool)

(assert (=> start!112176 (= b_free!30571 (not b_next!30571))))

(declare-fun tp!107351 () Bool)

(declare-fun b_and!49203 () Bool)

(assert (=> start!112176 (= tp!107351 b_and!49203)))

(declare-fun mapIsEmpty!56395 () Bool)

(declare-fun mapRes!56395 () Bool)

(assert (=> mapIsEmpty!56395 mapRes!56395))

(declare-fun b!1328474 () Bool)

(declare-fun e!757453 () Bool)

(declare-fun e!757449 () Bool)

(assert (=> b!1328474 (= e!757453 (and e!757449 mapRes!56395))))

(declare-fun condMapEmpty!56395 () Bool)

(declare-datatypes ((V!53745 0))(
  ( (V!53746 (val!18315 Int)) )
))
(declare-datatypes ((ValueCell!17342 0))(
  ( (ValueCellFull!17342 (v!20951 V!53745)) (EmptyCell!17342) )
))
(declare-datatypes ((array!89791 0))(
  ( (array!89792 (arr!43362 (Array (_ BitVec 32) ValueCell!17342)) (size!43914 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89791)

(declare-fun mapDefault!56395 () ValueCell!17342)

(assert (=> b!1328474 (= condMapEmpty!56395 (= (arr!43362 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17342)) mapDefault!56395)))))

(declare-fun b!1328476 () Bool)

(declare-fun res!881449 () Bool)

(declare-fun e!757452 () Bool)

(assert (=> b!1328476 (=> (not res!881449) (not e!757452))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89793 0))(
  ( (array!89794 (arr!43363 (Array (_ BitVec 32) (_ BitVec 64))) (size!43915 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89793)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328476 (= res!881449 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43915 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56395 () Bool)

(declare-fun tp!107350 () Bool)

(declare-fun e!757451 () Bool)

(assert (=> mapNonEmpty!56395 (= mapRes!56395 (and tp!107350 e!757451))))

(declare-fun mapValue!56395 () ValueCell!17342)

(declare-fun mapKey!56395 () (_ BitVec 32))

(declare-fun mapRest!56395 () (Array (_ BitVec 32) ValueCell!17342))

(assert (=> mapNonEmpty!56395 (= (arr!43362 _values!1320) (store mapRest!56395 mapKey!56395 mapValue!56395))))

(declare-fun b!1328477 () Bool)

(declare-fun tp_is_empty!36481 () Bool)

(assert (=> b!1328477 (= e!757449 tp_is_empty!36481)))

(declare-fun b!1328478 () Bool)

(assert (=> b!1328478 (= e!757452 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53745)

(declare-fun lt!590668 () Bool)

(declare-fun minValue!1262 () V!53745)

(declare-datatypes ((tuple2!23634 0))(
  ( (tuple2!23635 (_1!11828 (_ BitVec 64)) (_2!11828 V!53745)) )
))
(declare-datatypes ((List!30784 0))(
  ( (Nil!30781) (Cons!30780 (h!31989 tuple2!23634) (t!44782 List!30784)) )
))
(declare-datatypes ((ListLongMap!21291 0))(
  ( (ListLongMap!21292 (toList!10661 List!30784)) )
))
(declare-fun contains!8753 (ListLongMap!21291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5533 (array!89793 array!89791 (_ BitVec 32) (_ BitVec 32) V!53745 V!53745 (_ BitVec 32) Int) ListLongMap!21291)

(assert (=> b!1328478 (= lt!590668 (contains!8753 (getCurrentListMap!5533 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328479 () Bool)

(declare-fun res!881448 () Bool)

(assert (=> b!1328479 (=> (not res!881448) (not e!757452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89793 (_ BitVec 32)) Bool)

(assert (=> b!1328479 (= res!881448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881447 () Bool)

(assert (=> start!112176 (=> (not res!881447) (not e!757452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112176 (= res!881447 (validMask!0 mask!1998))))

(assert (=> start!112176 e!757452))

(declare-fun array_inv!32891 (array!89791) Bool)

(assert (=> start!112176 (and (array_inv!32891 _values!1320) e!757453)))

(assert (=> start!112176 true))

(declare-fun array_inv!32892 (array!89793) Bool)

(assert (=> start!112176 (array_inv!32892 _keys!1590)))

(assert (=> start!112176 tp!107351))

(assert (=> start!112176 tp_is_empty!36481))

(declare-fun b!1328475 () Bool)

(assert (=> b!1328475 (= e!757451 tp_is_empty!36481)))

(declare-fun b!1328480 () Bool)

(declare-fun res!881445 () Bool)

(assert (=> b!1328480 (=> (not res!881445) (not e!757452))))

(assert (=> b!1328480 (= res!881445 (and (= (size!43914 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43915 _keys!1590) (size!43914 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328481 () Bool)

(declare-fun res!881446 () Bool)

(assert (=> b!1328481 (=> (not res!881446) (not e!757452))))

(declare-datatypes ((List!30785 0))(
  ( (Nil!30782) (Cons!30781 (h!31990 (_ BitVec 64)) (t!44783 List!30785)) )
))
(declare-fun arrayNoDuplicates!0 (array!89793 (_ BitVec 32) List!30785) Bool)

(assert (=> b!1328481 (= res!881446 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30782))))

(assert (= (and start!112176 res!881447) b!1328480))

(assert (= (and b!1328480 res!881445) b!1328479))

(assert (= (and b!1328479 res!881448) b!1328481))

(assert (= (and b!1328481 res!881446) b!1328476))

(assert (= (and b!1328476 res!881449) b!1328478))

(assert (= (and b!1328474 condMapEmpty!56395) mapIsEmpty!56395))

(assert (= (and b!1328474 (not condMapEmpty!56395)) mapNonEmpty!56395))

(get-info :version)

(assert (= (and mapNonEmpty!56395 ((_ is ValueCellFull!17342) mapValue!56395)) b!1328475))

(assert (= (and b!1328474 ((_ is ValueCellFull!17342) mapDefault!56395)) b!1328477))

(assert (= start!112176 b!1328474))

(declare-fun m!1216965 () Bool)

(assert (=> start!112176 m!1216965))

(declare-fun m!1216967 () Bool)

(assert (=> start!112176 m!1216967))

(declare-fun m!1216969 () Bool)

(assert (=> start!112176 m!1216969))

(declare-fun m!1216971 () Bool)

(assert (=> b!1328481 m!1216971))

(declare-fun m!1216973 () Bool)

(assert (=> b!1328479 m!1216973))

(declare-fun m!1216975 () Bool)

(assert (=> b!1328478 m!1216975))

(assert (=> b!1328478 m!1216975))

(declare-fun m!1216977 () Bool)

(assert (=> b!1328478 m!1216977))

(declare-fun m!1216979 () Bool)

(assert (=> mapNonEmpty!56395 m!1216979))

(check-sat (not b!1328481) tp_is_empty!36481 (not mapNonEmpty!56395) b_and!49203 (not b!1328478) (not start!112176) (not b!1328479) (not b_next!30571))
(check-sat b_and!49203 (not b_next!30571))
