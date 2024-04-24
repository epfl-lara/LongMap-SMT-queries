; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112802 () Bool)

(assert start!112802)

(declare-fun b_free!30973 () Bool)

(declare-fun b_next!30973 () Bool)

(assert (=> start!112802 (= b_free!30973 (not b_next!30973))))

(declare-fun tp!108555 () Bool)

(declare-fun b_and!49883 () Bool)

(assert (=> start!112802 (= tp!108555 b_and!49883)))

(declare-fun b!1336724 () Bool)

(declare-fun res!886809 () Bool)

(declare-fun e!761424 () Bool)

(assert (=> b!1336724 (=> (not res!886809) (not e!761424))))

(declare-datatypes ((V!54281 0))(
  ( (V!54282 (val!18516 Int)) )
))
(declare-datatypes ((ValueCell!17543 0))(
  ( (ValueCellFull!17543 (v!21148 V!54281)) (EmptyCell!17543) )
))
(declare-datatypes ((array!90737 0))(
  ( (array!90738 (arr!43830 (Array (_ BitVec 32) ValueCell!17543)) (size!44381 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90737)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90739 0))(
  ( (array!90740 (arr!43831 (Array (_ BitVec 32) (_ BitVec 64))) (size!44382 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90739)

(assert (=> b!1336724 (= res!886809 (and (= (size!44381 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44382 _keys!1590) (size!44381 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336725 () Bool)

(assert (=> b!1336725 (= e!761424 false)))

(declare-datatypes ((tuple2!23910 0))(
  ( (tuple2!23911 (_1!11966 (_ BitVec 64)) (_2!11966 V!54281)) )
))
(declare-datatypes ((List!31056 0))(
  ( (Nil!31053) (Cons!31052 (h!32270 tuple2!23910) (t!45312 List!31056)) )
))
(declare-datatypes ((ListLongMap!21575 0))(
  ( (ListLongMap!21576 (toList!10803 List!31056)) )
))
(declare-fun lt!592932 () ListLongMap!21575)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54281)

(declare-fun zeroValue!1262 () V!54281)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6406 (array!90739 array!90737 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21575)

(assert (=> b!1336725 (= lt!592932 (getCurrentListMapNoExtraKeys!6406 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336726 () Bool)

(declare-fun res!886810 () Bool)

(assert (=> b!1336726 (=> (not res!886810) (not e!761424))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336726 (= res!886810 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44382 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336727 () Bool)

(declare-fun res!886811 () Bool)

(assert (=> b!1336727 (=> (not res!886811) (not e!761424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90739 (_ BitVec 32)) Bool)

(assert (=> b!1336727 (= res!886811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886812 () Bool)

(assert (=> start!112802 (=> (not res!886812) (not e!761424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112802 (= res!886812 (validMask!0 mask!1998))))

(assert (=> start!112802 e!761424))

(declare-fun e!761422 () Bool)

(declare-fun array_inv!33321 (array!90737) Bool)

(assert (=> start!112802 (and (array_inv!33321 _values!1320) e!761422)))

(assert (=> start!112802 true))

(declare-fun array_inv!33322 (array!90739) Bool)

(assert (=> start!112802 (array_inv!33322 _keys!1590)))

(assert (=> start!112802 tp!108555))

(declare-fun tp_is_empty!36883 () Bool)

(assert (=> start!112802 tp_is_empty!36883))

(declare-fun b!1336728 () Bool)

(declare-fun res!886813 () Bool)

(assert (=> b!1336728 (=> (not res!886813) (not e!761424))))

(assert (=> b!1336728 (= res!886813 (not (= (select (arr!43831 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56998 () Bool)

(declare-fun mapRes!56998 () Bool)

(assert (=> mapIsEmpty!56998 mapRes!56998))

(declare-fun b!1336729 () Bool)

(declare-fun res!886814 () Bool)

(assert (=> b!1336729 (=> (not res!886814) (not e!761424))))

(declare-datatypes ((List!31057 0))(
  ( (Nil!31054) (Cons!31053 (h!32271 (_ BitVec 64)) (t!45313 List!31057)) )
))
(declare-fun arrayNoDuplicates!0 (array!90739 (_ BitVec 32) List!31057) Bool)

(assert (=> b!1336729 (= res!886814 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31054))))

(declare-fun mapNonEmpty!56998 () Bool)

(declare-fun tp!108556 () Bool)

(declare-fun e!761421 () Bool)

(assert (=> mapNonEmpty!56998 (= mapRes!56998 (and tp!108556 e!761421))))

(declare-fun mapRest!56998 () (Array (_ BitVec 32) ValueCell!17543))

(declare-fun mapValue!56998 () ValueCell!17543)

(declare-fun mapKey!56998 () (_ BitVec 32))

(assert (=> mapNonEmpty!56998 (= (arr!43830 _values!1320) (store mapRest!56998 mapKey!56998 mapValue!56998))))

(declare-fun b!1336730 () Bool)

(declare-fun e!761425 () Bool)

(assert (=> b!1336730 (= e!761422 (and e!761425 mapRes!56998))))

(declare-fun condMapEmpty!56998 () Bool)

(declare-fun mapDefault!56998 () ValueCell!17543)

(assert (=> b!1336730 (= condMapEmpty!56998 (= (arr!43830 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17543)) mapDefault!56998)))))

(declare-fun b!1336731 () Bool)

(declare-fun res!886807 () Bool)

(assert (=> b!1336731 (=> (not res!886807) (not e!761424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336731 (= res!886807 (validKeyInArray!0 (select (arr!43831 _keys!1590) from!1980)))))

(declare-fun b!1336732 () Bool)

(assert (=> b!1336732 (= e!761421 tp_is_empty!36883)))

(declare-fun b!1336733 () Bool)

(assert (=> b!1336733 (= e!761425 tp_is_empty!36883)))

(declare-fun b!1336734 () Bool)

(declare-fun res!886808 () Bool)

(assert (=> b!1336734 (=> (not res!886808) (not e!761424))))

(declare-fun contains!8979 (ListLongMap!21575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5762 (array!90739 array!90737 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21575)

(assert (=> b!1336734 (= res!886808 (contains!8979 (getCurrentListMap!5762 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336735 () Bool)

(declare-fun res!886806 () Bool)

(assert (=> b!1336735 (=> (not res!886806) (not e!761424))))

(assert (=> b!1336735 (= res!886806 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112802 res!886812) b!1336724))

(assert (= (and b!1336724 res!886809) b!1336727))

(assert (= (and b!1336727 res!886811) b!1336729))

(assert (= (and b!1336729 res!886814) b!1336726))

(assert (= (and b!1336726 res!886810) b!1336734))

(assert (= (and b!1336734 res!886808) b!1336728))

(assert (= (and b!1336728 res!886813) b!1336731))

(assert (= (and b!1336731 res!886807) b!1336735))

(assert (= (and b!1336735 res!886806) b!1336725))

(assert (= (and b!1336730 condMapEmpty!56998) mapIsEmpty!56998))

(assert (= (and b!1336730 (not condMapEmpty!56998)) mapNonEmpty!56998))

(get-info :version)

(assert (= (and mapNonEmpty!56998 ((_ is ValueCellFull!17543) mapValue!56998)) b!1336732))

(assert (= (and b!1336730 ((_ is ValueCellFull!17543) mapDefault!56998)) b!1336733))

(assert (= start!112802 b!1336730))

(declare-fun m!1225085 () Bool)

(assert (=> b!1336731 m!1225085))

(assert (=> b!1336731 m!1225085))

(declare-fun m!1225087 () Bool)

(assert (=> b!1336731 m!1225087))

(declare-fun m!1225089 () Bool)

(assert (=> b!1336734 m!1225089))

(assert (=> b!1336734 m!1225089))

(declare-fun m!1225091 () Bool)

(assert (=> b!1336734 m!1225091))

(declare-fun m!1225093 () Bool)

(assert (=> b!1336727 m!1225093))

(declare-fun m!1225095 () Bool)

(assert (=> mapNonEmpty!56998 m!1225095))

(declare-fun m!1225097 () Bool)

(assert (=> b!1336725 m!1225097))

(declare-fun m!1225099 () Bool)

(assert (=> start!112802 m!1225099))

(declare-fun m!1225101 () Bool)

(assert (=> start!112802 m!1225101))

(declare-fun m!1225103 () Bool)

(assert (=> start!112802 m!1225103))

(declare-fun m!1225105 () Bool)

(assert (=> b!1336729 m!1225105))

(assert (=> b!1336728 m!1225085))

(check-sat (not start!112802) (not b!1336731) (not b!1336734) (not b!1336727) (not b!1336729) (not b!1336725) b_and!49883 (not mapNonEmpty!56998) tp_is_empty!36883 (not b_next!30973))
(check-sat b_and!49883 (not b_next!30973))
