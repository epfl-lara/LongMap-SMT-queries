; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111704 () Bool)

(assert start!111704)

(declare-fun b_free!30361 () Bool)

(declare-fun b_next!30361 () Bool)

(assert (=> start!111704 (= b_free!30361 (not b_next!30361))))

(declare-fun tp!106559 () Bool)

(declare-fun b_and!48863 () Bool)

(assert (=> start!111704 (= tp!106559 b_and!48863)))

(declare-fun b!1323465 () Bool)

(declare-fun res!878480 () Bool)

(declare-fun e!754515 () Bool)

(assert (=> b!1323465 (=> (not res!878480) (not e!754515))))

(declare-datatypes ((array!89211 0))(
  ( (array!89212 (arr!43080 (Array (_ BitVec 32) (_ BitVec 64))) (size!43632 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89211)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323465 (= res!878480 (validKeyInArray!0 (select (arr!43080 _keys!1609) from!2000)))))

(declare-fun b!1323466 () Bool)

(declare-fun res!878484 () Bool)

(assert (=> b!1323466 (=> (not res!878484) (not e!754515))))

(declare-datatypes ((V!53345 0))(
  ( (V!53346 (val!18165 Int)) )
))
(declare-fun zeroValue!1279 () V!53345)

(declare-datatypes ((ValueCell!17192 0))(
  ( (ValueCellFull!17192 (v!20794 V!53345)) (EmptyCell!17192) )
))
(declare-datatypes ((array!89213 0))(
  ( (array!89214 (arr!43081 (Array (_ BitVec 32) ValueCell!17192)) (size!43633 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89213)

(declare-fun minValue!1279 () V!53345)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((tuple2!23484 0))(
  ( (tuple2!23485 (_1!11753 (_ BitVec 64)) (_2!11753 V!53345)) )
))
(declare-datatypes ((List!30617 0))(
  ( (Nil!30614) (Cons!30613 (h!31822 tuple2!23484) (t!44519 List!30617)) )
))
(declare-datatypes ((ListLongMap!21141 0))(
  ( (ListLongMap!21142 (toList!10586 List!30617)) )
))
(declare-fun contains!8669 (ListLongMap!21141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5466 (array!89211 array!89213 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21141)

(assert (=> b!1323466 (= res!878484 (contains!8669 (getCurrentListMap!5466 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323467 () Bool)

(declare-fun res!878485 () Bool)

(assert (=> b!1323467 (=> (not res!878485) (not e!754515))))

(declare-datatypes ((List!30618 0))(
  ( (Nil!30615) (Cons!30614 (h!31823 (_ BitVec 64)) (t!44520 List!30618)) )
))
(declare-fun arrayNoDuplicates!0 (array!89211 (_ BitVec 32) List!30618) Bool)

(assert (=> b!1323467 (= res!878485 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30615))))

(declare-fun res!878486 () Bool)

(assert (=> start!111704 (=> (not res!878486) (not e!754515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111704 (= res!878486 (validMask!0 mask!2019))))

(assert (=> start!111704 e!754515))

(declare-fun array_inv!32705 (array!89211) Bool)

(assert (=> start!111704 (array_inv!32705 _keys!1609)))

(assert (=> start!111704 true))

(declare-fun tp_is_empty!36181 () Bool)

(assert (=> start!111704 tp_is_empty!36181))

(declare-fun e!754516 () Bool)

(declare-fun array_inv!32706 (array!89213) Bool)

(assert (=> start!111704 (and (array_inv!32706 _values!1337) e!754516)))

(assert (=> start!111704 tp!106559))

(declare-fun mapNonEmpty!55919 () Bool)

(declare-fun mapRes!55919 () Bool)

(declare-fun tp!106560 () Bool)

(declare-fun e!754512 () Bool)

(assert (=> mapNonEmpty!55919 (= mapRes!55919 (and tp!106560 e!754512))))

(declare-fun mapValue!55919 () ValueCell!17192)

(declare-fun mapKey!55919 () (_ BitVec 32))

(declare-fun mapRest!55919 () (Array (_ BitVec 32) ValueCell!17192))

(assert (=> mapNonEmpty!55919 (= (arr!43081 _values!1337) (store mapRest!55919 mapKey!55919 mapValue!55919))))

(declare-fun b!1323468 () Bool)

(assert (=> b!1323468 (= e!754515 (not true))))

(declare-fun lt!588946 () ListLongMap!21141)

(declare-fun +!4624 (ListLongMap!21141 tuple2!23484) ListLongMap!21141)

(assert (=> b!1323468 (contains!8669 (+!4624 lt!588946 (tuple2!23485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43431 0))(
  ( (Unit!43432) )
))
(declare-fun lt!588941 () Unit!43431)

(declare-fun addStillContains!1148 (ListLongMap!21141 (_ BitVec 64) V!53345 (_ BitVec 64)) Unit!43431)

(assert (=> b!1323468 (= lt!588941 (addStillContains!1148 lt!588946 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323468 (contains!8669 lt!588946 k0!1164)))

(declare-fun lt!588947 () ListLongMap!21141)

(declare-fun lt!588944 () tuple2!23484)

(assert (=> b!1323468 (= lt!588946 (+!4624 lt!588947 lt!588944))))

(declare-fun lt!588939 () Unit!43431)

(assert (=> b!1323468 (= lt!588939 (addStillContains!1148 lt!588947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323468 (contains!8669 lt!588947 k0!1164)))

(declare-fun lt!588940 () Unit!43431)

(declare-fun lt!588938 () V!53345)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!189 ((_ BitVec 64) (_ BitVec 64) V!53345 ListLongMap!21141) Unit!43431)

(assert (=> b!1323468 (= lt!588940 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 (select (arr!43080 _keys!1609) from!2000) lt!588938 lt!588947))))

(declare-fun lt!588945 () ListLongMap!21141)

(assert (=> b!1323468 (contains!8669 lt!588945 k0!1164)))

(declare-fun lt!588948 () Unit!43431)

(assert (=> b!1323468 (= lt!588948 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588945))))

(declare-fun lt!588943 () ListLongMap!21141)

(assert (=> b!1323468 (contains!8669 lt!588943 k0!1164)))

(declare-fun lt!588942 () Unit!43431)

(assert (=> b!1323468 (= lt!588942 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588943))))

(assert (=> b!1323468 (= lt!588943 (+!4624 lt!588945 lt!588944))))

(assert (=> b!1323468 (= lt!588944 (tuple2!23485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323468 (= lt!588945 (+!4624 lt!588947 (tuple2!23485 (select (arr!43080 _keys!1609) from!2000) lt!588938)))))

(declare-fun get!21703 (ValueCell!17192 V!53345) V!53345)

(declare-fun dynLambda!3554 (Int (_ BitVec 64)) V!53345)

(assert (=> b!1323468 (= lt!588938 (get!21703 (select (arr!43081 _values!1337) from!2000) (dynLambda!3554 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6257 (array!89211 array!89213 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21141)

(assert (=> b!1323468 (= lt!588947 (getCurrentListMapNoExtraKeys!6257 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323469 () Bool)

(declare-fun res!878481 () Bool)

(assert (=> b!1323469 (=> (not res!878481) (not e!754515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89211 (_ BitVec 32)) Bool)

(assert (=> b!1323469 (= res!878481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323470 () Bool)

(declare-fun res!878483 () Bool)

(assert (=> b!1323470 (=> (not res!878483) (not e!754515))))

(assert (=> b!1323470 (= res!878483 (and (= (size!43633 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43632 _keys!1609) (size!43633 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323471 () Bool)

(declare-fun res!878487 () Bool)

(assert (=> b!1323471 (=> (not res!878487) (not e!754515))))

(assert (=> b!1323471 (= res!878487 (not (= (select (arr!43080 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323472 () Bool)

(declare-fun e!754514 () Bool)

(assert (=> b!1323472 (= e!754514 tp_is_empty!36181)))

(declare-fun mapIsEmpty!55919 () Bool)

(assert (=> mapIsEmpty!55919 mapRes!55919))

(declare-fun b!1323473 () Bool)

(declare-fun res!878482 () Bool)

(assert (=> b!1323473 (=> (not res!878482) (not e!754515))))

(assert (=> b!1323473 (= res!878482 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43632 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323474 () Bool)

(assert (=> b!1323474 (= e!754516 (and e!754514 mapRes!55919))))

(declare-fun condMapEmpty!55919 () Bool)

(declare-fun mapDefault!55919 () ValueCell!17192)

(assert (=> b!1323474 (= condMapEmpty!55919 (= (arr!43081 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17192)) mapDefault!55919)))))

(declare-fun b!1323475 () Bool)

(assert (=> b!1323475 (= e!754512 tp_is_empty!36181)))

(assert (= (and start!111704 res!878486) b!1323470))

(assert (= (and b!1323470 res!878483) b!1323469))

(assert (= (and b!1323469 res!878481) b!1323467))

(assert (= (and b!1323467 res!878485) b!1323473))

(assert (= (and b!1323473 res!878482) b!1323466))

(assert (= (and b!1323466 res!878484) b!1323471))

(assert (= (and b!1323471 res!878487) b!1323465))

(assert (= (and b!1323465 res!878480) b!1323468))

(assert (= (and b!1323474 condMapEmpty!55919) mapIsEmpty!55919))

(assert (= (and b!1323474 (not condMapEmpty!55919)) mapNonEmpty!55919))

(get-info :version)

(assert (= (and mapNonEmpty!55919 ((_ is ValueCellFull!17192) mapValue!55919)) b!1323475))

(assert (= (and b!1323474 ((_ is ValueCellFull!17192) mapDefault!55919)) b!1323472))

(assert (= start!111704 b!1323474))

(declare-fun b_lambda!23677 () Bool)

(assert (=> (not b_lambda!23677) (not b!1323468)))

(declare-fun t!44518 () Bool)

(declare-fun tb!11705 () Bool)

(assert (=> (and start!111704 (= defaultEntry!1340 defaultEntry!1340) t!44518) tb!11705))

(declare-fun result!24473 () Bool)

(assert (=> tb!11705 (= result!24473 tp_is_empty!36181)))

(assert (=> b!1323468 t!44518))

(declare-fun b_and!48865 () Bool)

(assert (= b_and!48863 (and (=> t!44518 result!24473) b_and!48865)))

(declare-fun m!1211883 () Bool)

(assert (=> b!1323467 m!1211883))

(declare-fun m!1211885 () Bool)

(assert (=> b!1323471 m!1211885))

(declare-fun m!1211887 () Bool)

(assert (=> mapNonEmpty!55919 m!1211887))

(declare-fun m!1211889 () Bool)

(assert (=> b!1323469 m!1211889))

(declare-fun m!1211891 () Bool)

(assert (=> start!111704 m!1211891))

(declare-fun m!1211893 () Bool)

(assert (=> start!111704 m!1211893))

(declare-fun m!1211895 () Bool)

(assert (=> start!111704 m!1211895))

(assert (=> b!1323465 m!1211885))

(assert (=> b!1323465 m!1211885))

(declare-fun m!1211897 () Bool)

(assert (=> b!1323465 m!1211897))

(declare-fun m!1211899 () Bool)

(assert (=> b!1323468 m!1211899))

(declare-fun m!1211901 () Bool)

(assert (=> b!1323468 m!1211901))

(declare-fun m!1211903 () Bool)

(assert (=> b!1323468 m!1211903))

(declare-fun m!1211905 () Bool)

(assert (=> b!1323468 m!1211905))

(declare-fun m!1211907 () Bool)

(assert (=> b!1323468 m!1211907))

(declare-fun m!1211909 () Bool)

(assert (=> b!1323468 m!1211909))

(declare-fun m!1211911 () Bool)

(assert (=> b!1323468 m!1211911))

(declare-fun m!1211913 () Bool)

(assert (=> b!1323468 m!1211913))

(declare-fun m!1211915 () Bool)

(assert (=> b!1323468 m!1211915))

(declare-fun m!1211917 () Bool)

(assert (=> b!1323468 m!1211917))

(declare-fun m!1211919 () Bool)

(assert (=> b!1323468 m!1211919))

(assert (=> b!1323468 m!1211885))

(declare-fun m!1211921 () Bool)

(assert (=> b!1323468 m!1211921))

(assert (=> b!1323468 m!1211919))

(declare-fun m!1211923 () Bool)

(assert (=> b!1323468 m!1211923))

(declare-fun m!1211925 () Bool)

(assert (=> b!1323468 m!1211925))

(declare-fun m!1211927 () Bool)

(assert (=> b!1323468 m!1211927))

(assert (=> b!1323468 m!1211885))

(assert (=> b!1323468 m!1211923))

(declare-fun m!1211929 () Bool)

(assert (=> b!1323468 m!1211929))

(assert (=> b!1323468 m!1211907))

(declare-fun m!1211931 () Bool)

(assert (=> b!1323468 m!1211931))

(declare-fun m!1211933 () Bool)

(assert (=> b!1323468 m!1211933))

(declare-fun m!1211935 () Bool)

(assert (=> b!1323466 m!1211935))

(assert (=> b!1323466 m!1211935))

(declare-fun m!1211937 () Bool)

(assert (=> b!1323466 m!1211937))

(check-sat (not b!1323466) (not b!1323467) (not b!1323469) (not b_next!30361) b_and!48865 (not b!1323465) (not b!1323468) (not start!111704) (not mapNonEmpty!55919) tp_is_empty!36181 (not b_lambda!23677))
(check-sat b_and!48865 (not b_next!30361))
