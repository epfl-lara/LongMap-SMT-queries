; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111376 () Bool)

(assert start!111376)

(declare-fun b_free!30033 () Bool)

(declare-fun b_next!30033 () Bool)

(assert (=> start!111376 (= b_free!30033 (not b_next!30033))))

(declare-fun tp!105575 () Bool)

(declare-fun b_and!48253 () Bool)

(assert (=> start!111376 (= tp!105575 b_and!48253)))

(declare-fun mapIsEmpty!55427 () Bool)

(declare-fun mapRes!55427 () Bool)

(assert (=> mapIsEmpty!55427 mapRes!55427))

(declare-fun mapNonEmpty!55427 () Bool)

(declare-fun tp!105574 () Bool)

(declare-fun e!752089 () Bool)

(assert (=> mapNonEmpty!55427 (= mapRes!55427 (and tp!105574 e!752089))))

(declare-datatypes ((V!52907 0))(
  ( (V!52908 (val!18001 Int)) )
))
(declare-datatypes ((ValueCell!17028 0))(
  ( (ValueCellFull!17028 (v!20631 V!52907)) (EmptyCell!17028) )
))
(declare-datatypes ((array!88658 0))(
  ( (array!88659 (arr!42803 (Array (_ BitVec 32) ValueCell!17028)) (size!43353 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88658)

(declare-fun mapRest!55427 () (Array (_ BitVec 32) ValueCell!17028))

(declare-fun mapValue!55427 () ValueCell!17028)

(declare-fun mapKey!55427 () (_ BitVec 32))

(assert (=> mapNonEmpty!55427 (= (arr!42803 _values!1337) (store mapRest!55427 mapKey!55427 mapValue!55427))))

(declare-fun b!1317916 () Bool)

(declare-fun res!874669 () Bool)

(declare-fun e!752087 () Bool)

(assert (=> b!1317916 (=> (not res!874669) (not e!752087))))

(declare-datatypes ((array!88660 0))(
  ( (array!88661 (arr!42804 (Array (_ BitVec 32) (_ BitVec 64))) (size!43354 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88660)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1317916 (= res!874669 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43354 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317917 () Bool)

(declare-fun e!752086 () Bool)

(declare-fun tp_is_empty!35853 () Bool)

(assert (=> b!1317917 (= e!752086 tp_is_empty!35853)))

(declare-fun b!1317918 () Bool)

(assert (=> b!1317918 (= e!752087 false)))

(declare-fun zeroValue!1279 () V!52907)

(declare-fun lt!586425 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!52907)

(declare-datatypes ((tuple2!23168 0))(
  ( (tuple2!23169 (_1!11595 (_ BitVec 64)) (_2!11595 V!52907)) )
))
(declare-datatypes ((List!30326 0))(
  ( (Nil!30323) (Cons!30322 (h!31531 tuple2!23168) (t!43934 List!30326)) )
))
(declare-datatypes ((ListLongMap!20825 0))(
  ( (ListLongMap!20826 (toList!10428 List!30326)) )
))
(declare-fun contains!8583 (ListLongMap!20825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5441 (array!88660 array!88658 (_ BitVec 32) (_ BitVec 32) V!52907 V!52907 (_ BitVec 32) Int) ListLongMap!20825)

(assert (=> b!1317918 (= lt!586425 (contains!8583 (getCurrentListMap!5441 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!874668 () Bool)

(assert (=> start!111376 (=> (not res!874668) (not e!752087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111376 (= res!874668 (validMask!0 mask!2019))))

(assert (=> start!111376 e!752087))

(declare-fun array_inv!32327 (array!88660) Bool)

(assert (=> start!111376 (array_inv!32327 _keys!1609)))

(assert (=> start!111376 true))

(assert (=> start!111376 tp_is_empty!35853))

(declare-fun e!752088 () Bool)

(declare-fun array_inv!32328 (array!88658) Bool)

(assert (=> start!111376 (and (array_inv!32328 _values!1337) e!752088)))

(assert (=> start!111376 tp!105575))

(declare-fun b!1317919 () Bool)

(assert (=> b!1317919 (= e!752089 tp_is_empty!35853)))

(declare-fun b!1317920 () Bool)

(declare-fun res!874667 () Bool)

(assert (=> b!1317920 (=> (not res!874667) (not e!752087))))

(assert (=> b!1317920 (= res!874667 (and (= (size!43353 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43354 _keys!1609) (size!43353 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317921 () Bool)

(declare-fun res!874666 () Bool)

(assert (=> b!1317921 (=> (not res!874666) (not e!752087))))

(declare-datatypes ((List!30327 0))(
  ( (Nil!30324) (Cons!30323 (h!31532 (_ BitVec 64)) (t!43935 List!30327)) )
))
(declare-fun arrayNoDuplicates!0 (array!88660 (_ BitVec 32) List!30327) Bool)

(assert (=> b!1317921 (= res!874666 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30324))))

(declare-fun b!1317922 () Bool)

(assert (=> b!1317922 (= e!752088 (and e!752086 mapRes!55427))))

(declare-fun condMapEmpty!55427 () Bool)

(declare-fun mapDefault!55427 () ValueCell!17028)

(assert (=> b!1317922 (= condMapEmpty!55427 (= (arr!42803 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17028)) mapDefault!55427)))))

(declare-fun b!1317923 () Bool)

(declare-fun res!874670 () Bool)

(assert (=> b!1317923 (=> (not res!874670) (not e!752087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88660 (_ BitVec 32)) Bool)

(assert (=> b!1317923 (= res!874670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111376 res!874668) b!1317920))

(assert (= (and b!1317920 res!874667) b!1317923))

(assert (= (and b!1317923 res!874670) b!1317921))

(assert (= (and b!1317921 res!874666) b!1317916))

(assert (= (and b!1317916 res!874669) b!1317918))

(assert (= (and b!1317922 condMapEmpty!55427) mapIsEmpty!55427))

(assert (= (and b!1317922 (not condMapEmpty!55427)) mapNonEmpty!55427))

(get-info :version)

(assert (= (and mapNonEmpty!55427 ((_ is ValueCellFull!17028) mapValue!55427)) b!1317919))

(assert (= (and b!1317922 ((_ is ValueCellFull!17028) mapDefault!55427)) b!1317917))

(assert (= start!111376 b!1317922))

(declare-fun m!1205611 () Bool)

(assert (=> b!1317923 m!1205611))

(declare-fun m!1205613 () Bool)

(assert (=> start!111376 m!1205613))

(declare-fun m!1205615 () Bool)

(assert (=> start!111376 m!1205615))

(declare-fun m!1205617 () Bool)

(assert (=> start!111376 m!1205617))

(declare-fun m!1205619 () Bool)

(assert (=> b!1317918 m!1205619))

(assert (=> b!1317918 m!1205619))

(declare-fun m!1205621 () Bool)

(assert (=> b!1317918 m!1205621))

(declare-fun m!1205623 () Bool)

(assert (=> mapNonEmpty!55427 m!1205623))

(declare-fun m!1205625 () Bool)

(assert (=> b!1317921 m!1205625))

(check-sat (not b_next!30033) (not b!1317918) (not start!111376) (not b!1317921) b_and!48253 (not mapNonEmpty!55427) (not b!1317923) tp_is_empty!35853)
(check-sat b_and!48253 (not b_next!30033))
