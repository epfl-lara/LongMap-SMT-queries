; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112182 () Bool)

(assert start!112182)

(declare-fun b_free!30577 () Bool)

(declare-fun b_next!30577 () Bool)

(assert (=> start!112182 (= b_free!30577 (not b_next!30577))))

(declare-fun tp!107369 () Bool)

(declare-fun b_and!49209 () Bool)

(assert (=> start!112182 (= tp!107369 b_and!49209)))

(declare-fun mapIsEmpty!56404 () Bool)

(declare-fun mapRes!56404 () Bool)

(assert (=> mapIsEmpty!56404 mapRes!56404))

(declare-fun b!1328546 () Bool)

(declare-fun res!881492 () Bool)

(declare-fun e!757495 () Bool)

(assert (=> b!1328546 (=> (not res!881492) (not e!757495))))

(declare-datatypes ((V!53753 0))(
  ( (V!53754 (val!18318 Int)) )
))
(declare-datatypes ((ValueCell!17345 0))(
  ( (ValueCellFull!17345 (v!20954 V!53753)) (EmptyCell!17345) )
))
(declare-datatypes ((array!89803 0))(
  ( (array!89804 (arr!43368 (Array (_ BitVec 32) ValueCell!17345)) (size!43920 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89803)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89805 0))(
  ( (array!89806 (arr!43369 (Array (_ BitVec 32) (_ BitVec 64))) (size!43921 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89805)

(assert (=> b!1328546 (= res!881492 (and (= (size!43920 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43921 _keys!1590) (size!43920 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328547 () Bool)

(declare-fun e!757494 () Bool)

(declare-fun tp_is_empty!36487 () Bool)

(assert (=> b!1328547 (= e!757494 tp_is_empty!36487)))

(declare-fun b!1328548 () Bool)

(declare-fun e!757496 () Bool)

(assert (=> b!1328548 (= e!757496 (and e!757494 mapRes!56404))))

(declare-fun condMapEmpty!56404 () Bool)

(declare-fun mapDefault!56404 () ValueCell!17345)

(assert (=> b!1328548 (= condMapEmpty!56404 (= (arr!43368 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17345)) mapDefault!56404)))))

(declare-fun b!1328549 () Bool)

(assert (=> b!1328549 (= e!757495 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53753)

(declare-fun zeroValue!1262 () V!53753)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590677 () Bool)

(declare-datatypes ((tuple2!23638 0))(
  ( (tuple2!23639 (_1!11830 (_ BitVec 64)) (_2!11830 V!53753)) )
))
(declare-datatypes ((List!30789 0))(
  ( (Nil!30786) (Cons!30785 (h!31994 tuple2!23638) (t!44787 List!30789)) )
))
(declare-datatypes ((ListLongMap!21295 0))(
  ( (ListLongMap!21296 (toList!10663 List!30789)) )
))
(declare-fun contains!8755 (ListLongMap!21295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5535 (array!89805 array!89803 (_ BitVec 32) (_ BitVec 32) V!53753 V!53753 (_ BitVec 32) Int) ListLongMap!21295)

(assert (=> b!1328549 (= lt!590677 (contains!8755 (getCurrentListMap!5535 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56404 () Bool)

(declare-fun tp!107368 () Bool)

(declare-fun e!757498 () Bool)

(assert (=> mapNonEmpty!56404 (= mapRes!56404 (and tp!107368 e!757498))))

(declare-fun mapRest!56404 () (Array (_ BitVec 32) ValueCell!17345))

(declare-fun mapKey!56404 () (_ BitVec 32))

(declare-fun mapValue!56404 () ValueCell!17345)

(assert (=> mapNonEmpty!56404 (= (arr!43368 _values!1320) (store mapRest!56404 mapKey!56404 mapValue!56404))))

(declare-fun res!881493 () Bool)

(assert (=> start!112182 (=> (not res!881493) (not e!757495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112182 (= res!881493 (validMask!0 mask!1998))))

(assert (=> start!112182 e!757495))

(declare-fun array_inv!32897 (array!89803) Bool)

(assert (=> start!112182 (and (array_inv!32897 _values!1320) e!757496)))

(assert (=> start!112182 true))

(declare-fun array_inv!32898 (array!89805) Bool)

(assert (=> start!112182 (array_inv!32898 _keys!1590)))

(assert (=> start!112182 tp!107369))

(assert (=> start!112182 tp_is_empty!36487))

(declare-fun b!1328550 () Bool)

(declare-fun res!881491 () Bool)

(assert (=> b!1328550 (=> (not res!881491) (not e!757495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89805 (_ BitVec 32)) Bool)

(assert (=> b!1328550 (= res!881491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328551 () Bool)

(declare-fun res!881494 () Bool)

(assert (=> b!1328551 (=> (not res!881494) (not e!757495))))

(declare-datatypes ((List!30790 0))(
  ( (Nil!30787) (Cons!30786 (h!31995 (_ BitVec 64)) (t!44788 List!30790)) )
))
(declare-fun arrayNoDuplicates!0 (array!89805 (_ BitVec 32) List!30790) Bool)

(assert (=> b!1328551 (= res!881494 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30787))))

(declare-fun b!1328552 () Bool)

(assert (=> b!1328552 (= e!757498 tp_is_empty!36487)))

(declare-fun b!1328553 () Bool)

(declare-fun res!881490 () Bool)

(assert (=> b!1328553 (=> (not res!881490) (not e!757495))))

(assert (=> b!1328553 (= res!881490 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43921 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112182 res!881493) b!1328546))

(assert (= (and b!1328546 res!881492) b!1328550))

(assert (= (and b!1328550 res!881491) b!1328551))

(assert (= (and b!1328551 res!881494) b!1328553))

(assert (= (and b!1328553 res!881490) b!1328549))

(assert (= (and b!1328548 condMapEmpty!56404) mapIsEmpty!56404))

(assert (= (and b!1328548 (not condMapEmpty!56404)) mapNonEmpty!56404))

(get-info :version)

(assert (= (and mapNonEmpty!56404 ((_ is ValueCellFull!17345) mapValue!56404)) b!1328552))

(assert (= (and b!1328548 ((_ is ValueCellFull!17345) mapDefault!56404)) b!1328547))

(assert (= start!112182 b!1328548))

(declare-fun m!1217013 () Bool)

(assert (=> b!1328550 m!1217013))

(declare-fun m!1217015 () Bool)

(assert (=> start!112182 m!1217015))

(declare-fun m!1217017 () Bool)

(assert (=> start!112182 m!1217017))

(declare-fun m!1217019 () Bool)

(assert (=> start!112182 m!1217019))

(declare-fun m!1217021 () Bool)

(assert (=> b!1328551 m!1217021))

(declare-fun m!1217023 () Bool)

(assert (=> mapNonEmpty!56404 m!1217023))

(declare-fun m!1217025 () Bool)

(assert (=> b!1328549 m!1217025))

(assert (=> b!1328549 m!1217025))

(declare-fun m!1217027 () Bool)

(assert (=> b!1328549 m!1217027))

(check-sat (not mapNonEmpty!56404) b_and!49209 (not b!1328551) (not start!112182) (not b!1328550) (not b_next!30577) (not b!1328549) tp_is_empty!36487)
(check-sat b_and!49209 (not b_next!30577))
