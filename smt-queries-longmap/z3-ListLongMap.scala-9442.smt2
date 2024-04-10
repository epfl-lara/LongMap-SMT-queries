; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112262 () Bool)

(assert start!112262)

(declare-fun b_free!30657 () Bool)

(declare-fun b_next!30657 () Bool)

(assert (=> start!112262 (= b_free!30657 (not b_next!30657))))

(declare-fun tp!107608 () Bool)

(declare-fun b_and!49369 () Bool)

(assert (=> start!112262 (= tp!107608 b_and!49369)))

(declare-fun b!1330045 () Bool)

(declare-fun e!758128 () Bool)

(declare-fun e!758129 () Bool)

(declare-fun mapRes!56524 () Bool)

(assert (=> b!1330045 (= e!758128 (and e!758129 mapRes!56524))))

(declare-fun condMapEmpty!56524 () Bool)

(declare-datatypes ((V!53859 0))(
  ( (V!53860 (val!18358 Int)) )
))
(declare-datatypes ((ValueCell!17385 0))(
  ( (ValueCellFull!17385 (v!20995 V!53859)) (EmptyCell!17385) )
))
(declare-datatypes ((array!90024 0))(
  ( (array!90025 (arr!43478 (Array (_ BitVec 32) ValueCell!17385)) (size!44028 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90024)

(declare-fun mapDefault!56524 () ValueCell!17385)

(assert (=> b!1330045 (= condMapEmpty!56524 (= (arr!43478 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17385)) mapDefault!56524)))))

(declare-fun b!1330046 () Bool)

(declare-fun res!882532 () Bool)

(declare-fun e!758130 () Bool)

(assert (=> b!1330046 (=> (not res!882532) (not e!758130))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90026 0))(
  ( (array!90027 (arr!43479 (Array (_ BitVec 32) (_ BitVec 64))) (size!44029 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90026)

(assert (=> b!1330046 (= res!882532 (and (= (size!44028 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44029 _keys!1590) (size!44028 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330047 () Bool)

(declare-fun res!882530 () Bool)

(assert (=> b!1330047 (=> (not res!882530) (not e!758130))))

(assert (=> b!1330047 (= res!882530 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330049 () Bool)

(declare-fun res!882531 () Bool)

(assert (=> b!1330049 (=> (not res!882531) (not e!758130))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53859)

(declare-fun zeroValue!1262 () V!53859)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23638 0))(
  ( (tuple2!23639 (_1!11830 (_ BitVec 64)) (_2!11830 V!53859)) )
))
(declare-datatypes ((List!30790 0))(
  ( (Nil!30787) (Cons!30786 (h!31995 tuple2!23638) (t!44860 List!30790)) )
))
(declare-datatypes ((ListLongMap!21295 0))(
  ( (ListLongMap!21296 (toList!10663 List!30790)) )
))
(declare-fun contains!8827 (ListLongMap!21295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5651 (array!90026 array!90024 (_ BitVec 32) (_ BitVec 32) V!53859 V!53859 (_ BitVec 32) Int) ListLongMap!21295)

(assert (=> b!1330049 (= res!882531 (contains!8827 (getCurrentListMap!5651 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330050 () Bool)

(declare-fun res!882529 () Bool)

(assert (=> b!1330050 (=> (not res!882529) (not e!758130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330050 (= res!882529 (validKeyInArray!0 (select (arr!43479 _keys!1590) from!1980)))))

(declare-fun b!1330051 () Bool)

(declare-fun res!882528 () Bool)

(assert (=> b!1330051 (=> (not res!882528) (not e!758130))))

(assert (=> b!1330051 (= res!882528 (not (= (select (arr!43479 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330052 () Bool)

(declare-fun e!758127 () Bool)

(declare-fun tp_is_empty!36567 () Bool)

(assert (=> b!1330052 (= e!758127 tp_is_empty!36567)))

(declare-fun mapIsEmpty!56524 () Bool)

(assert (=> mapIsEmpty!56524 mapRes!56524))

(declare-fun b!1330053 () Bool)

(declare-fun res!882527 () Bool)

(assert (=> b!1330053 (=> (not res!882527) (not e!758130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90026 (_ BitVec 32)) Bool)

(assert (=> b!1330053 (= res!882527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330048 () Bool)

(assert (=> b!1330048 (= e!758130 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun lt!591052 () ListLongMap!21295)

(assert (=> b!1330048 (contains!8827 lt!591052 k0!1153)))

(declare-datatypes ((Unit!43771 0))(
  ( (Unit!43772) )
))
(declare-fun lt!591051 () Unit!43771)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!248 ((_ BitVec 64) (_ BitVec 64) V!53859 ListLongMap!21295) Unit!43771)

(assert (=> b!1330048 (= lt!591051 (lemmaInListMapAfterAddingDiffThenInBefore!248 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591052))))

(declare-fun +!4661 (ListLongMap!21295 tuple2!23638) ListLongMap!21295)

(declare-fun getCurrentListMapNoExtraKeys!6299 (array!90026 array!90024 (_ BitVec 32) (_ BitVec 32) V!53859 V!53859 (_ BitVec 32) Int) ListLongMap!21295)

(declare-fun get!21909 (ValueCell!17385 V!53859) V!53859)

(declare-fun dynLambda!3600 (Int (_ BitVec 64)) V!53859)

(assert (=> b!1330048 (= lt!591052 (+!4661 (getCurrentListMapNoExtraKeys!6299 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23639 (select (arr!43479 _keys!1590) from!1980) (get!21909 (select (arr!43478 _values!1320) from!1980) (dynLambda!3600 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!882534 () Bool)

(assert (=> start!112262 (=> (not res!882534) (not e!758130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112262 (= res!882534 (validMask!0 mask!1998))))

(assert (=> start!112262 e!758130))

(declare-fun array_inv!32801 (array!90024) Bool)

(assert (=> start!112262 (and (array_inv!32801 _values!1320) e!758128)))

(assert (=> start!112262 true))

(declare-fun array_inv!32802 (array!90026) Bool)

(assert (=> start!112262 (array_inv!32802 _keys!1590)))

(assert (=> start!112262 tp!107608))

(assert (=> start!112262 tp_is_empty!36567))

(declare-fun b!1330054 () Bool)

(declare-fun res!882533 () Bool)

(assert (=> b!1330054 (=> (not res!882533) (not e!758130))))

(declare-datatypes ((List!30791 0))(
  ( (Nil!30788) (Cons!30787 (h!31996 (_ BitVec 64)) (t!44861 List!30791)) )
))
(declare-fun arrayNoDuplicates!0 (array!90026 (_ BitVec 32) List!30791) Bool)

(assert (=> b!1330054 (= res!882533 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30788))))

(declare-fun b!1330055 () Bool)

(assert (=> b!1330055 (= e!758129 tp_is_empty!36567)))

(declare-fun mapNonEmpty!56524 () Bool)

(declare-fun tp!107607 () Bool)

(assert (=> mapNonEmpty!56524 (= mapRes!56524 (and tp!107607 e!758127))))

(declare-fun mapValue!56524 () ValueCell!17385)

(declare-fun mapRest!56524 () (Array (_ BitVec 32) ValueCell!17385))

(declare-fun mapKey!56524 () (_ BitVec 32))

(assert (=> mapNonEmpty!56524 (= (arr!43478 _values!1320) (store mapRest!56524 mapKey!56524 mapValue!56524))))

(declare-fun b!1330056 () Bool)

(declare-fun res!882526 () Bool)

(assert (=> b!1330056 (=> (not res!882526) (not e!758130))))

(assert (=> b!1330056 (= res!882526 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44029 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112262 res!882534) b!1330046))

(assert (= (and b!1330046 res!882532) b!1330053))

(assert (= (and b!1330053 res!882527) b!1330054))

(assert (= (and b!1330054 res!882533) b!1330056))

(assert (= (and b!1330056 res!882526) b!1330049))

(assert (= (and b!1330049 res!882531) b!1330051))

(assert (= (and b!1330051 res!882528) b!1330050))

(assert (= (and b!1330050 res!882529) b!1330047))

(assert (= (and b!1330047 res!882530) b!1330048))

(assert (= (and b!1330045 condMapEmpty!56524) mapIsEmpty!56524))

(assert (= (and b!1330045 (not condMapEmpty!56524)) mapNonEmpty!56524))

(get-info :version)

(assert (= (and mapNonEmpty!56524 ((_ is ValueCellFull!17385) mapValue!56524)) b!1330052))

(assert (= (and b!1330045 ((_ is ValueCellFull!17385) mapDefault!56524)) b!1330055))

(assert (= start!112262 b!1330045))

(declare-fun b_lambda!23917 () Bool)

(assert (=> (not b_lambda!23917) (not b!1330048)))

(declare-fun t!44859 () Bool)

(declare-fun tb!11873 () Bool)

(assert (=> (and start!112262 (= defaultEntry!1323 defaultEntry!1323) t!44859) tb!11873))

(declare-fun result!24817 () Bool)

(assert (=> tb!11873 (= result!24817 tp_is_empty!36567)))

(assert (=> b!1330048 t!44859))

(declare-fun b_and!49371 () Bool)

(assert (= b_and!49369 (and (=> t!44859 result!24817) b_and!49371)))

(declare-fun m!1218739 () Bool)

(assert (=> b!1330053 m!1218739))

(declare-fun m!1218741 () Bool)

(assert (=> b!1330050 m!1218741))

(assert (=> b!1330050 m!1218741))

(declare-fun m!1218743 () Bool)

(assert (=> b!1330050 m!1218743))

(assert (=> b!1330051 m!1218741))

(declare-fun m!1218745 () Bool)

(assert (=> b!1330049 m!1218745))

(assert (=> b!1330049 m!1218745))

(declare-fun m!1218747 () Bool)

(assert (=> b!1330049 m!1218747))

(declare-fun m!1218749 () Bool)

(assert (=> b!1330054 m!1218749))

(declare-fun m!1218751 () Bool)

(assert (=> b!1330048 m!1218751))

(declare-fun m!1218753 () Bool)

(assert (=> b!1330048 m!1218753))

(declare-fun m!1218755 () Bool)

(assert (=> b!1330048 m!1218755))

(declare-fun m!1218757 () Bool)

(assert (=> b!1330048 m!1218757))

(assert (=> b!1330048 m!1218751))

(declare-fun m!1218759 () Bool)

(assert (=> b!1330048 m!1218759))

(declare-fun m!1218761 () Bool)

(assert (=> b!1330048 m!1218761))

(declare-fun m!1218763 () Bool)

(assert (=> b!1330048 m!1218763))

(assert (=> b!1330048 m!1218753))

(assert (=> b!1330048 m!1218757))

(assert (=> b!1330048 m!1218741))

(declare-fun m!1218765 () Bool)

(assert (=> start!112262 m!1218765))

(declare-fun m!1218767 () Bool)

(assert (=> start!112262 m!1218767))

(declare-fun m!1218769 () Bool)

(assert (=> start!112262 m!1218769))

(declare-fun m!1218771 () Bool)

(assert (=> mapNonEmpty!56524 m!1218771))

(check-sat b_and!49371 (not start!112262) (not b!1330054) (not mapNonEmpty!56524) (not b!1330050) (not b_next!30657) (not b!1330048) (not b!1330053) tp_is_empty!36567 (not b!1330049) (not b_lambda!23917))
(check-sat b_and!49371 (not b_next!30657))
