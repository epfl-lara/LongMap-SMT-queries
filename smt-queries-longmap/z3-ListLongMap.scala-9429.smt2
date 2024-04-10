; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112184 () Bool)

(assert start!112184)

(declare-fun b_free!30579 () Bool)

(declare-fun b_next!30579 () Bool)

(assert (=> start!112184 (= b_free!30579 (not b_next!30579))))

(declare-fun tp!107373 () Bool)

(declare-fun b_and!49229 () Bool)

(assert (=> start!112184 (= tp!107373 b_and!49229)))

(declare-fun b!1328640 () Bool)

(declare-fun res!881536 () Bool)

(declare-fun e!757543 () Bool)

(assert (=> b!1328640 (=> (not res!881536) (not e!757543))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89872 0))(
  ( (array!89873 (arr!43402 (Array (_ BitVec 32) (_ BitVec 64))) (size!43952 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89872)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328640 (= res!881536 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43952 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328641 () Bool)

(declare-fun e!757542 () Bool)

(declare-fun tp_is_empty!36489 () Bool)

(assert (=> b!1328641 (= e!757542 tp_is_empty!36489)))

(declare-fun mapNonEmpty!56407 () Bool)

(declare-fun mapRes!56407 () Bool)

(declare-fun tp!107374 () Bool)

(declare-fun e!757545 () Bool)

(assert (=> mapNonEmpty!56407 (= mapRes!56407 (and tp!107374 e!757545))))

(declare-datatypes ((V!53755 0))(
  ( (V!53756 (val!18319 Int)) )
))
(declare-datatypes ((ValueCell!17346 0))(
  ( (ValueCellFull!17346 (v!20956 V!53755)) (EmptyCell!17346) )
))
(declare-datatypes ((array!89874 0))(
  ( (array!89875 (arr!43403 (Array (_ BitVec 32) ValueCell!17346)) (size!43953 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89874)

(declare-fun mapValue!56407 () ValueCell!17346)

(declare-fun mapRest!56407 () (Array (_ BitVec 32) ValueCell!17346))

(declare-fun mapKey!56407 () (_ BitVec 32))

(assert (=> mapNonEmpty!56407 (= (arr!43403 _values!1320) (store mapRest!56407 mapKey!56407 mapValue!56407))))

(declare-fun b!1328642 () Bool)

(declare-fun res!881538 () Bool)

(assert (=> b!1328642 (=> (not res!881538) (not e!757543))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89872 (_ BitVec 32)) Bool)

(assert (=> b!1328642 (= res!881538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881535 () Bool)

(assert (=> start!112184 (=> (not res!881535) (not e!757543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112184 (= res!881535 (validMask!0 mask!1998))))

(assert (=> start!112184 e!757543))

(declare-fun e!757546 () Bool)

(declare-fun array_inv!32747 (array!89874) Bool)

(assert (=> start!112184 (and (array_inv!32747 _values!1320) e!757546)))

(assert (=> start!112184 true))

(declare-fun array_inv!32748 (array!89872) Bool)

(assert (=> start!112184 (array_inv!32748 _keys!1590)))

(assert (=> start!112184 tp!107373))

(assert (=> start!112184 tp_is_empty!36489))

(declare-fun b!1328643 () Bool)

(assert (=> b!1328643 (= e!757545 tp_is_empty!36489)))

(declare-fun mapIsEmpty!56407 () Bool)

(assert (=> mapIsEmpty!56407 mapRes!56407))

(declare-fun b!1328644 () Bool)

(declare-fun res!881537 () Bool)

(assert (=> b!1328644 (=> (not res!881537) (not e!757543))))

(assert (=> b!1328644 (= res!881537 (and (= (size!43953 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43952 _keys!1590) (size!43953 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328645 () Bool)

(assert (=> b!1328645 (= e!757546 (and e!757542 mapRes!56407))))

(declare-fun condMapEmpty!56407 () Bool)

(declare-fun mapDefault!56407 () ValueCell!17346)

(assert (=> b!1328645 (= condMapEmpty!56407 (= (arr!43403 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17346)) mapDefault!56407)))))

(declare-fun b!1328646 () Bool)

(declare-fun res!881534 () Bool)

(assert (=> b!1328646 (=> (not res!881534) (not e!757543))))

(declare-datatypes ((List!30736 0))(
  ( (Nil!30733) (Cons!30732 (h!31941 (_ BitVec 64)) (t!44742 List!30736)) )
))
(declare-fun arrayNoDuplicates!0 (array!89872 (_ BitVec 32) List!30736) Bool)

(assert (=> b!1328646 (= res!881534 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30733))))

(declare-fun b!1328647 () Bool)

(assert (=> b!1328647 (= e!757543 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53755)

(declare-fun zeroValue!1262 () V!53755)

(declare-fun lt!590866 () Bool)

(declare-datatypes ((tuple2!23578 0))(
  ( (tuple2!23579 (_1!11800 (_ BitVec 64)) (_2!11800 V!53755)) )
))
(declare-datatypes ((List!30737 0))(
  ( (Nil!30734) (Cons!30733 (h!31942 tuple2!23578) (t!44743 List!30737)) )
))
(declare-datatypes ((ListLongMap!21235 0))(
  ( (ListLongMap!21236 (toList!10633 List!30737)) )
))
(declare-fun contains!8797 (ListLongMap!21235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5624 (array!89872 array!89874 (_ BitVec 32) (_ BitVec 32) V!53755 V!53755 (_ BitVec 32) Int) ListLongMap!21235)

(assert (=> b!1328647 (= lt!590866 (contains!8797 (getCurrentListMap!5624 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112184 res!881535) b!1328644))

(assert (= (and b!1328644 res!881537) b!1328642))

(assert (= (and b!1328642 res!881538) b!1328646))

(assert (= (and b!1328646 res!881534) b!1328640))

(assert (= (and b!1328640 res!881536) b!1328647))

(assert (= (and b!1328645 condMapEmpty!56407) mapIsEmpty!56407))

(assert (= (and b!1328645 (not condMapEmpty!56407)) mapNonEmpty!56407))

(get-info :version)

(assert (= (and mapNonEmpty!56407 ((_ is ValueCellFull!17346) mapValue!56407)) b!1328643))

(assert (= (and b!1328645 ((_ is ValueCellFull!17346) mapDefault!56407)) b!1328641))

(assert (= start!112184 b!1328645))

(declare-fun m!1217545 () Bool)

(assert (=> b!1328646 m!1217545))

(declare-fun m!1217547 () Bool)

(assert (=> start!112184 m!1217547))

(declare-fun m!1217549 () Bool)

(assert (=> start!112184 m!1217549))

(declare-fun m!1217551 () Bool)

(assert (=> start!112184 m!1217551))

(declare-fun m!1217553 () Bool)

(assert (=> mapNonEmpty!56407 m!1217553))

(declare-fun m!1217555 () Bool)

(assert (=> b!1328647 m!1217555))

(assert (=> b!1328647 m!1217555))

(declare-fun m!1217557 () Bool)

(assert (=> b!1328647 m!1217557))

(declare-fun m!1217559 () Bool)

(assert (=> b!1328642 m!1217559))

(check-sat (not mapNonEmpty!56407) (not b_next!30579) (not start!112184) (not b!1328642) (not b!1328647) (not b!1328646) tp_is_empty!36489 b_and!49229)
(check-sat b_and!49229 (not b_next!30579))
