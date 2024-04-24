; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134030 () Bool)

(assert start!134030)

(declare-fun b_free!32035 () Bool)

(declare-fun b_next!32035 () Bool)

(assert (=> start!134030 (= b_free!32035 (not b_next!32035))))

(declare-fun tp!113229 () Bool)

(declare-fun b_and!51583 () Bool)

(assert (=> start!134030 (= tp!113229 b_and!51583)))

(declare-fun b!1564728 () Bool)

(declare-fun e!872106 () Bool)

(declare-fun tp_is_empty!38701 () Bool)

(assert (=> b!1564728 (= e!872106 tp_is_empty!38701)))

(declare-fun mapIsEmpty!59427 () Bool)

(declare-fun mapRes!59427 () Bool)

(assert (=> mapIsEmpty!59427 mapRes!59427))

(declare-fun b!1564730 () Bool)

(declare-fun res!1069022 () Bool)

(declare-fun e!872103 () Bool)

(assert (=> b!1564730 (=> (not res!1069022) (not e!872103))))

(declare-datatypes ((array!104232 0))(
  ( (array!104233 (arr!50301 (Array (_ BitVec 32) (_ BitVec 64))) (size!50852 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104232)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564730 (= res!1069022 (validKeyInArray!0 (select (arr!50301 _keys!637) from!782)))))

(declare-fun b!1564731 () Bool)

(declare-fun res!1069018 () Bool)

(assert (=> b!1564731 (=> (not res!1069018) (not e!872103))))

(assert (=> b!1564731 (= res!1069018 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50852 _keys!637)) (bvslt from!782 (size!50852 _keys!637))))))

(declare-fun b!1564732 () Bool)

(declare-fun e!872107 () Bool)

(assert (=> b!1564732 (= e!872107 tp_is_empty!38701)))

(declare-fun b!1564733 () Bool)

(declare-fun res!1069019 () Bool)

(assert (=> b!1564733 (=> (not res!1069019) (not e!872103))))

(declare-datatypes ((List!36509 0))(
  ( (Nil!36506) (Cons!36505 (h!37969 (_ BitVec 64)) (t!51326 List!36509)) )
))
(declare-fun arrayNoDuplicates!0 (array!104232 (_ BitVec 32) List!36509) Bool)

(assert (=> b!1564733 (= res!1069019 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36506))))

(declare-fun mapNonEmpty!59427 () Bool)

(declare-fun tp!113228 () Bool)

(assert (=> mapNonEmpty!59427 (= mapRes!59427 (and tp!113228 e!872107))))

(declare-datatypes ((V!59809 0))(
  ( (V!59810 (val!19434 Int)) )
))
(declare-datatypes ((ValueCell!18320 0))(
  ( (ValueCellFull!18320 (v!22178 V!59809)) (EmptyCell!18320) )
))
(declare-datatypes ((array!104234 0))(
  ( (array!104235 (arr!50302 (Array (_ BitVec 32) ValueCell!18320)) (size!50853 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104234)

(declare-fun mapValue!59427 () ValueCell!18320)

(declare-fun mapKey!59427 () (_ BitVec 32))

(declare-fun mapRest!59427 () (Array (_ BitVec 32) ValueCell!18320))

(assert (=> mapNonEmpty!59427 (= (arr!50302 _values!487) (store mapRest!59427 mapKey!59427 mapValue!59427))))

(declare-fun b!1564734 () Bool)

(declare-fun res!1069021 () Bool)

(assert (=> b!1564734 (=> (not res!1069021) (not e!872103))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104232 (_ BitVec 32)) Bool)

(assert (=> b!1564734 (= res!1069021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564735 () Bool)

(declare-fun res!1069020 () Bool)

(assert (=> b!1564735 (=> (not res!1069020) (not e!872103))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564735 (= res!1069020 (and (= (size!50853 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50852 _keys!637) (size!50853 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564736 () Bool)

(declare-fun e!872105 () Bool)

(assert (=> b!1564736 (= e!872105 (and e!872106 mapRes!59427))))

(declare-fun condMapEmpty!59427 () Bool)

(declare-fun mapDefault!59427 () ValueCell!18320)

(assert (=> b!1564736 (= condMapEmpty!59427 (= (arr!50302 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18320)) mapDefault!59427)))))

(declare-fun res!1069017 () Bool)

(assert (=> start!134030 (=> (not res!1069017) (not e!872103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134030 (= res!1069017 (validMask!0 mask!947))))

(assert (=> start!134030 e!872103))

(assert (=> start!134030 tp!113229))

(assert (=> start!134030 tp_is_empty!38701))

(assert (=> start!134030 true))

(declare-fun array_inv!39347 (array!104232) Bool)

(assert (=> start!134030 (array_inv!39347 _keys!637)))

(declare-fun array_inv!39348 (array!104234) Bool)

(assert (=> start!134030 (and (array_inv!39348 _values!487) e!872105)))

(declare-fun b!1564729 () Bool)

(assert (=> b!1564729 (= e!872103 (not true))))

(declare-fun lt!672493 () Bool)

(declare-datatypes ((tuple2!25168 0))(
  ( (tuple2!25169 (_1!12595 (_ BitVec 64)) (_2!12595 V!59809)) )
))
(declare-datatypes ((List!36510 0))(
  ( (Nil!36507) (Cons!36506 (h!37970 tuple2!25168) (t!51327 List!36510)) )
))
(declare-datatypes ((ListLongMap!22611 0))(
  ( (ListLongMap!22612 (toList!11321 List!36510)) )
))
(declare-fun lt!672495 () ListLongMap!22611)

(declare-fun contains!10322 (ListLongMap!22611 (_ BitVec 64)) Bool)

(assert (=> b!1564729 (= lt!672493 (contains!10322 lt!672495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564729 (not (contains!10322 lt!672495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672494 () V!59809)

(declare-fun lt!672496 () ListLongMap!22611)

(declare-fun +!5097 (ListLongMap!22611 tuple2!25168) ListLongMap!22611)

(assert (=> b!1564729 (= lt!672495 (+!5097 lt!672496 (tuple2!25169 (select (arr!50301 _keys!637) from!782) lt!672494)))))

(declare-datatypes ((Unit!51879 0))(
  ( (Unit!51880) )
))
(declare-fun lt!672497 () Unit!51879)

(declare-fun addStillNotContains!548 (ListLongMap!22611 (_ BitVec 64) V!59809 (_ BitVec 64)) Unit!51879)

(assert (=> b!1564729 (= lt!672497 (addStillNotContains!548 lt!672496 (select (arr!50301 _keys!637) from!782) lt!672494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26287 (ValueCell!18320 V!59809) V!59809)

(declare-fun dynLambda!3895 (Int (_ BitVec 64)) V!59809)

(assert (=> b!1564729 (= lt!672494 (get!26287 (select (arr!50302 _values!487) from!782) (dynLambda!3895 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59809)

(declare-fun minValue!453 () V!59809)

(declare-fun getCurrentListMapNoExtraKeys!6720 (array!104232 array!104234 (_ BitVec 32) (_ BitVec 32) V!59809 V!59809 (_ BitVec 32) Int) ListLongMap!22611)

(assert (=> b!1564729 (= lt!672496 (getCurrentListMapNoExtraKeys!6720 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!134030 res!1069017) b!1564735))

(assert (= (and b!1564735 res!1069020) b!1564734))

(assert (= (and b!1564734 res!1069021) b!1564733))

(assert (= (and b!1564733 res!1069019) b!1564731))

(assert (= (and b!1564731 res!1069018) b!1564730))

(assert (= (and b!1564730 res!1069022) b!1564729))

(assert (= (and b!1564736 condMapEmpty!59427) mapIsEmpty!59427))

(assert (= (and b!1564736 (not condMapEmpty!59427)) mapNonEmpty!59427))

(get-info :version)

(assert (= (and mapNonEmpty!59427 ((_ is ValueCellFull!18320) mapValue!59427)) b!1564732))

(assert (= (and b!1564736 ((_ is ValueCellFull!18320) mapDefault!59427)) b!1564728))

(assert (= start!134030 b!1564736))

(declare-fun b_lambda!24903 () Bool)

(assert (=> (not b_lambda!24903) (not b!1564729)))

(declare-fun t!51325 () Bool)

(declare-fun tb!12571 () Bool)

(assert (=> (and start!134030 (= defaultEntry!495 defaultEntry!495) t!51325) tb!12571))

(declare-fun result!26431 () Bool)

(assert (=> tb!12571 (= result!26431 tp_is_empty!38701)))

(assert (=> b!1564729 t!51325))

(declare-fun b_and!51585 () Bool)

(assert (= b_and!51583 (and (=> t!51325 result!26431) b_and!51585)))

(declare-fun m!1440291 () Bool)

(assert (=> b!1564734 m!1440291))

(declare-fun m!1440293 () Bool)

(assert (=> mapNonEmpty!59427 m!1440293))

(declare-fun m!1440295 () Bool)

(assert (=> b!1564730 m!1440295))

(assert (=> b!1564730 m!1440295))

(declare-fun m!1440297 () Bool)

(assert (=> b!1564730 m!1440297))

(declare-fun m!1440299 () Bool)

(assert (=> start!134030 m!1440299))

(declare-fun m!1440301 () Bool)

(assert (=> start!134030 m!1440301))

(declare-fun m!1440303 () Bool)

(assert (=> start!134030 m!1440303))

(declare-fun m!1440305 () Bool)

(assert (=> b!1564733 m!1440305))

(declare-fun m!1440307 () Bool)

(assert (=> b!1564729 m!1440307))

(declare-fun m!1440309 () Bool)

(assert (=> b!1564729 m!1440309))

(declare-fun m!1440311 () Bool)

(assert (=> b!1564729 m!1440311))

(assert (=> b!1564729 m!1440295))

(declare-fun m!1440313 () Bool)

(assert (=> b!1564729 m!1440313))

(declare-fun m!1440315 () Bool)

(assert (=> b!1564729 m!1440315))

(assert (=> b!1564729 m!1440307))

(declare-fun m!1440317 () Bool)

(assert (=> b!1564729 m!1440317))

(assert (=> b!1564729 m!1440295))

(assert (=> b!1564729 m!1440309))

(declare-fun m!1440319 () Bool)

(assert (=> b!1564729 m!1440319))

(declare-fun m!1440321 () Bool)

(assert (=> b!1564729 m!1440321))

(check-sat (not b_lambda!24903) b_and!51585 (not start!134030) (not b_next!32035) (not b!1564733) (not b!1564734) (not b!1564730) (not b!1564729) (not mapNonEmpty!59427) tp_is_empty!38701)
(check-sat b_and!51585 (not b_next!32035))
