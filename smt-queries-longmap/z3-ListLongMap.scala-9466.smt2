; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112628 () Bool)

(assert start!112628)

(declare-fun b_free!30799 () Bool)

(declare-fun b_next!30799 () Bool)

(assert (=> start!112628 (= b_free!30799 (not b_next!30799))))

(declare-fun tp!108034 () Bool)

(declare-fun b_and!49643 () Bool)

(assert (=> start!112628 (= tp!108034 b_and!49643)))

(declare-fun b!1333950 () Bool)

(declare-fun e!760037 () Bool)

(declare-fun e!760038 () Bool)

(declare-fun mapRes!56737 () Bool)

(assert (=> b!1333950 (= e!760037 (and e!760038 mapRes!56737))))

(declare-fun condMapEmpty!56737 () Bool)

(declare-datatypes ((V!54049 0))(
  ( (V!54050 (val!18429 Int)) )
))
(declare-datatypes ((ValueCell!17456 0))(
  ( (ValueCellFull!17456 (v!21061 V!54049)) (EmptyCell!17456) )
))
(declare-datatypes ((array!90397 0))(
  ( (array!90398 (arr!43660 (Array (_ BitVec 32) ValueCell!17456)) (size!44211 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90397)

(declare-fun mapDefault!56737 () ValueCell!17456)

(assert (=> b!1333950 (= condMapEmpty!56737 (= (arr!43660 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17456)) mapDefault!56737)))))

(declare-fun b!1333951 () Bool)

(declare-fun res!884881 () Bool)

(declare-fun e!760035 () Bool)

(assert (=> b!1333951 (=> (not res!884881) (not e!760035))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90399 0))(
  ( (array!90400 (arr!43661 (Array (_ BitVec 32) (_ BitVec 64))) (size!44212 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90399)

(assert (=> b!1333951 (= res!884881 (and (= (size!44211 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44212 _keys!1590) (size!44211 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!884885 () Bool)

(assert (=> start!112628 (=> (not res!884885) (not e!760035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112628 (= res!884885 (validMask!0 mask!1998))))

(assert (=> start!112628 e!760035))

(declare-fun array_inv!33205 (array!90397) Bool)

(assert (=> start!112628 (and (array_inv!33205 _values!1320) e!760037)))

(assert (=> start!112628 true))

(declare-fun array_inv!33206 (array!90399) Bool)

(assert (=> start!112628 (array_inv!33206 _keys!1590)))

(assert (=> start!112628 tp!108034))

(declare-fun tp_is_empty!36709 () Bool)

(assert (=> start!112628 tp_is_empty!36709))

(declare-fun mapNonEmpty!56737 () Bool)

(declare-fun tp!108033 () Bool)

(declare-fun e!760039 () Bool)

(assert (=> mapNonEmpty!56737 (= mapRes!56737 (and tp!108033 e!760039))))

(declare-fun mapValue!56737 () ValueCell!17456)

(declare-fun mapKey!56737 () (_ BitVec 32))

(declare-fun mapRest!56737 () (Array (_ BitVec 32) ValueCell!17456))

(assert (=> mapNonEmpty!56737 (= (arr!43660 _values!1320) (store mapRest!56737 mapKey!56737 mapValue!56737))))

(declare-fun b!1333952 () Bool)

(declare-fun res!884882 () Bool)

(assert (=> b!1333952 (=> (not res!884882) (not e!760035))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333952 (= res!884882 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44212 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333953 () Bool)

(assert (=> b!1333953 (= e!760039 tp_is_empty!36709)))

(declare-fun b!1333954 () Bool)

(assert (=> b!1333954 (= e!760035 false)))

(declare-fun lt!592527 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54049)

(declare-fun zeroValue!1262 () V!54049)

(declare-datatypes ((tuple2!23782 0))(
  ( (tuple2!23783 (_1!11902 (_ BitVec 64)) (_2!11902 V!54049)) )
))
(declare-datatypes ((List!30939 0))(
  ( (Nil!30936) (Cons!30935 (h!32153 tuple2!23782) (t!45129 List!30939)) )
))
(declare-datatypes ((ListLongMap!21447 0))(
  ( (ListLongMap!21448 (toList!10739 List!30939)) )
))
(declare-fun contains!8915 (ListLongMap!21447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5703 (array!90399 array!90397 (_ BitVec 32) (_ BitVec 32) V!54049 V!54049 (_ BitVec 32) Int) ListLongMap!21447)

(assert (=> b!1333954 (= lt!592527 (contains!8915 (getCurrentListMap!5703 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56737 () Bool)

(assert (=> mapIsEmpty!56737 mapRes!56737))

(declare-fun b!1333955 () Bool)

(declare-fun res!884884 () Bool)

(assert (=> b!1333955 (=> (not res!884884) (not e!760035))))

(declare-datatypes ((List!30940 0))(
  ( (Nil!30937) (Cons!30936 (h!32154 (_ BitVec 64)) (t!45130 List!30940)) )
))
(declare-fun arrayNoDuplicates!0 (array!90399 (_ BitVec 32) List!30940) Bool)

(assert (=> b!1333955 (= res!884884 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30937))))

(declare-fun b!1333956 () Bool)

(assert (=> b!1333956 (= e!760038 tp_is_empty!36709)))

(declare-fun b!1333957 () Bool)

(declare-fun res!884883 () Bool)

(assert (=> b!1333957 (=> (not res!884883) (not e!760035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90399 (_ BitVec 32)) Bool)

(assert (=> b!1333957 (= res!884883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112628 res!884885) b!1333951))

(assert (= (and b!1333951 res!884881) b!1333957))

(assert (= (and b!1333957 res!884883) b!1333955))

(assert (= (and b!1333955 res!884884) b!1333952))

(assert (= (and b!1333952 res!884882) b!1333954))

(assert (= (and b!1333950 condMapEmpty!56737) mapIsEmpty!56737))

(assert (= (and b!1333950 (not condMapEmpty!56737)) mapNonEmpty!56737))

(get-info :version)

(assert (= (and mapNonEmpty!56737 ((_ is ValueCellFull!17456) mapValue!56737)) b!1333953))

(assert (= (and b!1333950 ((_ is ValueCellFull!17456) mapDefault!56737)) b!1333956))

(assert (= start!112628 b!1333950))

(declare-fun m!1223033 () Bool)

(assert (=> start!112628 m!1223033))

(declare-fun m!1223035 () Bool)

(assert (=> start!112628 m!1223035))

(declare-fun m!1223037 () Bool)

(assert (=> start!112628 m!1223037))

(declare-fun m!1223039 () Bool)

(assert (=> mapNonEmpty!56737 m!1223039))

(declare-fun m!1223041 () Bool)

(assert (=> b!1333954 m!1223041))

(assert (=> b!1333954 m!1223041))

(declare-fun m!1223043 () Bool)

(assert (=> b!1333954 m!1223043))

(declare-fun m!1223045 () Bool)

(assert (=> b!1333957 m!1223045))

(declare-fun m!1223047 () Bool)

(assert (=> b!1333955 m!1223047))

(check-sat b_and!49643 tp_is_empty!36709 (not b!1333955) (not b!1333957) (not b!1333954) (not start!112628) (not mapNonEmpty!56737) (not b_next!30799))
(check-sat b_and!49643 (not b_next!30799))
