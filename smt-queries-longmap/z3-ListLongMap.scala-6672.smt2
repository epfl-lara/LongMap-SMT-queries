; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83986 () Bool)

(assert start!83986)

(declare-fun b_free!19759 () Bool)

(declare-fun b_next!19759 () Bool)

(assert (=> start!83986 (= b_free!19759 (not b_next!19759))))

(declare-fun tp!68801 () Bool)

(declare-fun b_and!31575 () Bool)

(assert (=> start!83986 (= tp!68801 b_and!31575)))

(declare-fun b!981585 () Bool)

(declare-fun e!553334 () Bool)

(declare-fun tp_is_empty!22807 () Bool)

(assert (=> b!981585 (= e!553334 tp_is_empty!22807)))

(declare-fun b!981586 () Bool)

(declare-fun res!656916 () Bool)

(declare-fun e!553329 () Bool)

(assert (=> b!981586 (=> (not res!656916) (not e!553329))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61542 0))(
  ( (array!61543 (arr!29629 (Array (_ BitVec 32) (_ BitVec 64))) (size!30110 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61542)

(assert (=> b!981586 (= res!656916 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30110 _keys!1544))))))

(declare-fun b!981587 () Bool)

(declare-fun res!656912 () Bool)

(assert (=> b!981587 (=> (not res!656912) (not e!553329))))

(declare-datatypes ((List!20579 0))(
  ( (Nil!20576) (Cons!20575 (h!21737 (_ BitVec 64)) (t!29279 List!20579)) )
))
(declare-fun arrayNoDuplicates!0 (array!61542 (_ BitVec 32) List!20579) Bool)

(assert (=> b!981587 (= res!656912 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20576))))

(declare-fun b!981588 () Bool)

(declare-fun e!553332 () Bool)

(assert (=> b!981588 (= e!553329 e!553332)))

(declare-fun res!656910 () Bool)

(assert (=> b!981588 (=> (not res!656910) (not e!553332))))

(assert (=> b!981588 (= res!656910 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29629 _keys!1544) from!1932))))))

(declare-datatypes ((V!35393 0))(
  ( (V!35394 (val!11454 Int)) )
))
(declare-datatypes ((ValueCell!10922 0))(
  ( (ValueCellFull!10922 (v!14015 V!35393)) (EmptyCell!10922) )
))
(declare-datatypes ((array!61544 0))(
  ( (array!61545 (arr!29630 (Array (_ BitVec 32) ValueCell!10922)) (size!30111 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61544)

(declare-fun lt!435638 () V!35393)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15372 (ValueCell!10922 V!35393) V!35393)

(declare-fun dynLambda!1770 (Int (_ BitVec 64)) V!35393)

(assert (=> b!981588 (= lt!435638 (get!15372 (select (arr!29630 _values!1278) from!1932) (dynLambda!1770 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35393)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35393)

(declare-datatypes ((tuple2!14738 0))(
  ( (tuple2!14739 (_1!7380 (_ BitVec 64)) (_2!7380 V!35393)) )
))
(declare-datatypes ((List!20580 0))(
  ( (Nil!20577) (Cons!20576 (h!21738 tuple2!14738) (t!29280 List!20580)) )
))
(declare-datatypes ((ListLongMap!13425 0))(
  ( (ListLongMap!13426 (toList!6728 List!20580)) )
))
(declare-fun lt!435639 () ListLongMap!13425)

(declare-fun getCurrentListMapNoExtraKeys!3440 (array!61542 array!61544 (_ BitVec 32) (_ BitVec 32) V!35393 V!35393 (_ BitVec 32) Int) ListLongMap!13425)

(assert (=> b!981588 (= lt!435639 (getCurrentListMapNoExtraKeys!3440 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981589 () Bool)

(declare-fun e!553333 () Bool)

(assert (=> b!981589 (= e!553333 tp_is_empty!22807)))

(declare-fun mapIsEmpty!36239 () Bool)

(declare-fun mapRes!36239 () Bool)

(assert (=> mapIsEmpty!36239 mapRes!36239))

(declare-fun b!981590 () Bool)

(declare-fun res!656909 () Bool)

(assert (=> b!981590 (=> (not res!656909) (not e!553329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981590 (= res!656909 (validKeyInArray!0 (select (arr!29629 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36239 () Bool)

(declare-fun tp!68800 () Bool)

(assert (=> mapNonEmpty!36239 (= mapRes!36239 (and tp!68800 e!553334))))

(declare-fun mapRest!36239 () (Array (_ BitVec 32) ValueCell!10922))

(declare-fun mapKey!36239 () (_ BitVec 32))

(declare-fun mapValue!36239 () ValueCell!10922)

(assert (=> mapNonEmpty!36239 (= (arr!29630 _values!1278) (store mapRest!36239 mapKey!36239 mapValue!36239))))

(declare-fun b!981591 () Bool)

(declare-fun res!656911 () Bool)

(assert (=> b!981591 (=> (not res!656911) (not e!553329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61542 (_ BitVec 32)) Bool)

(assert (=> b!981591 (= res!656911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981592 () Bool)

(declare-fun res!656913 () Bool)

(assert (=> b!981592 (=> (not res!656913) (not e!553329))))

(assert (=> b!981592 (= res!656913 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981593 () Bool)

(declare-fun e!553331 () Bool)

(assert (=> b!981593 (= e!553331 (and e!553333 mapRes!36239))))

(declare-fun condMapEmpty!36239 () Bool)

(declare-fun mapDefault!36239 () ValueCell!10922)

(assert (=> b!981593 (= condMapEmpty!36239 (= (arr!29630 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10922)) mapDefault!36239)))))

(declare-fun b!981594 () Bool)

(declare-fun res!656914 () Bool)

(assert (=> b!981594 (=> (not res!656914) (not e!553329))))

(assert (=> b!981594 (= res!656914 (and (= (size!30111 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30110 _keys!1544) (size!30111 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656915 () Bool)

(assert (=> start!83986 (=> (not res!656915) (not e!553329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83986 (= res!656915 (validMask!0 mask!1948))))

(assert (=> start!83986 e!553329))

(assert (=> start!83986 true))

(assert (=> start!83986 tp_is_empty!22807))

(declare-fun array_inv!22931 (array!61544) Bool)

(assert (=> start!83986 (and (array_inv!22931 _values!1278) e!553331)))

(assert (=> start!83986 tp!68801))

(declare-fun array_inv!22932 (array!61542) Bool)

(assert (=> start!83986 (array_inv!22932 _keys!1544)))

(declare-fun b!981595 () Bool)

(assert (=> b!981595 (= e!553332 (not true))))

(declare-fun lt!435635 () tuple2!14738)

(declare-fun lt!435637 () tuple2!14738)

(declare-fun +!3024 (ListLongMap!13425 tuple2!14738) ListLongMap!13425)

(assert (=> b!981595 (= (+!3024 (+!3024 lt!435639 lt!435635) lt!435637) (+!3024 (+!3024 lt!435639 lt!435637) lt!435635))))

(assert (=> b!981595 (= lt!435637 (tuple2!14739 (select (arr!29629 _keys!1544) from!1932) lt!435638))))

(assert (=> b!981595 (= lt!435635 (tuple2!14739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32514 0))(
  ( (Unit!32515) )
))
(declare-fun lt!435636 () Unit!32514)

(declare-fun addCommutativeForDiffKeys!628 (ListLongMap!13425 (_ BitVec 64) V!35393 (_ BitVec 64) V!35393) Unit!32514)

(assert (=> b!981595 (= lt!435636 (addCommutativeForDiffKeys!628 lt!435639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29629 _keys!1544) from!1932) lt!435638))))

(assert (= (and start!83986 res!656915) b!981594))

(assert (= (and b!981594 res!656914) b!981591))

(assert (= (and b!981591 res!656911) b!981587))

(assert (= (and b!981587 res!656912) b!981586))

(assert (= (and b!981586 res!656916) b!981590))

(assert (= (and b!981590 res!656909) b!981592))

(assert (= (and b!981592 res!656913) b!981588))

(assert (= (and b!981588 res!656910) b!981595))

(assert (= (and b!981593 condMapEmpty!36239) mapIsEmpty!36239))

(assert (= (and b!981593 (not condMapEmpty!36239)) mapNonEmpty!36239))

(get-info :version)

(assert (= (and mapNonEmpty!36239 ((_ is ValueCellFull!10922) mapValue!36239)) b!981585))

(assert (= (and b!981593 ((_ is ValueCellFull!10922) mapDefault!36239)) b!981589))

(assert (= start!83986 b!981593))

(declare-fun b_lambda!14779 () Bool)

(assert (=> (not b_lambda!14779) (not b!981588)))

(declare-fun t!29278 () Bool)

(declare-fun tb!6551 () Bool)

(assert (=> (and start!83986 (= defaultEntry!1281 defaultEntry!1281) t!29278) tb!6551))

(declare-fun result!13099 () Bool)

(assert (=> tb!6551 (= result!13099 tp_is_empty!22807)))

(assert (=> b!981588 t!29278))

(declare-fun b_and!31577 () Bool)

(assert (= b_and!31575 (and (=> t!29278 result!13099) b_and!31577)))

(declare-fun m!908423 () Bool)

(assert (=> mapNonEmpty!36239 m!908423))

(declare-fun m!908425 () Bool)

(assert (=> b!981587 m!908425))

(declare-fun m!908427 () Bool)

(assert (=> b!981588 m!908427))

(declare-fun m!908429 () Bool)

(assert (=> b!981588 m!908429))

(declare-fun m!908431 () Bool)

(assert (=> b!981588 m!908431))

(declare-fun m!908433 () Bool)

(assert (=> b!981588 m!908433))

(assert (=> b!981588 m!908429))

(assert (=> b!981588 m!908433))

(declare-fun m!908435 () Bool)

(assert (=> b!981588 m!908435))

(assert (=> b!981595 m!908427))

(declare-fun m!908437 () Bool)

(assert (=> b!981595 m!908437))

(assert (=> b!981595 m!908427))

(declare-fun m!908439 () Bool)

(assert (=> b!981595 m!908439))

(declare-fun m!908441 () Bool)

(assert (=> b!981595 m!908441))

(declare-fun m!908443 () Bool)

(assert (=> b!981595 m!908443))

(assert (=> b!981595 m!908441))

(assert (=> b!981595 m!908439))

(declare-fun m!908445 () Bool)

(assert (=> b!981595 m!908445))

(declare-fun m!908447 () Bool)

(assert (=> b!981591 m!908447))

(assert (=> b!981590 m!908427))

(assert (=> b!981590 m!908427))

(declare-fun m!908449 () Bool)

(assert (=> b!981590 m!908449))

(declare-fun m!908451 () Bool)

(assert (=> start!83986 m!908451))

(declare-fun m!908453 () Bool)

(assert (=> start!83986 m!908453))

(declare-fun m!908455 () Bool)

(assert (=> start!83986 m!908455))

(check-sat (not mapNonEmpty!36239) (not b!981590) (not b_next!19759) (not b!981591) tp_is_empty!22807 (not b!981587) (not start!83986) (not b_lambda!14779) (not b!981588) (not b!981595) b_and!31577)
(check-sat b_and!31577 (not b_next!19759))
