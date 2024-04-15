; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111918 () Bool)

(assert start!111918)

(declare-fun b_free!30517 () Bool)

(declare-fun b_next!30517 () Bool)

(assert (=> start!111918 (= b_free!30517 (not b_next!30517))))

(declare-fun tp!107032 () Bool)

(declare-fun b_and!49111 () Bool)

(assert (=> start!111918 (= tp!107032 b_and!49111)))

(declare-fun b!1326258 () Bool)

(declare-fun res!880255 () Bool)

(declare-fun e!755941 () Bool)

(assert (=> b!1326258 (=> (not res!880255) (not e!755941))))

(declare-datatypes ((array!89513 0))(
  ( (array!89514 (arr!43230 (Array (_ BitVec 32) (_ BitVec 64))) (size!43782 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89513)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89513 (_ BitVec 32)) Bool)

(assert (=> b!1326258 (= res!880255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326259 () Bool)

(declare-fun res!880257 () Bool)

(assert (=> b!1326259 (=> (not res!880257) (not e!755941))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53553 0))(
  ( (V!53554 (val!18243 Int)) )
))
(declare-fun zeroValue!1279 () V!53553)

(declare-datatypes ((ValueCell!17270 0))(
  ( (ValueCellFull!17270 (v!20875 V!53553)) (EmptyCell!17270) )
))
(declare-datatypes ((array!89515 0))(
  ( (array!89516 (arr!43231 (Array (_ BitVec 32) ValueCell!17270)) (size!43783 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89515)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun minValue!1279 () V!53553)

(declare-datatypes ((tuple2!23598 0))(
  ( (tuple2!23599 (_1!11810 (_ BitVec 64)) (_2!11810 V!53553)) )
))
(declare-datatypes ((List!30724 0))(
  ( (Nil!30721) (Cons!30720 (h!31929 tuple2!23598) (t!44704 List!30724)) )
))
(declare-datatypes ((ListLongMap!21255 0))(
  ( (ListLongMap!21256 (toList!10643 List!30724)) )
))
(declare-fun contains!8727 (ListLongMap!21255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5516 (array!89513 array!89515 (_ BitVec 32) (_ BitVec 32) V!53553 V!53553 (_ BitVec 32) Int) ListLongMap!21255)

(assert (=> b!1326259 (= res!880257 (contains!8727 (getCurrentListMap!5516 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326260 () Bool)

(declare-fun res!880254 () Bool)

(assert (=> b!1326260 (=> (not res!880254) (not e!755941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326260 (= res!880254 (validKeyInArray!0 (select (arr!43230 _keys!1609) from!2000)))))

(declare-fun b!1326261 () Bool)

(declare-fun res!880256 () Bool)

(assert (=> b!1326261 (=> (not res!880256) (not e!755941))))

(assert (=> b!1326261 (= res!880256 (and (= (size!43783 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43782 _keys!1609) (size!43783 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326262 () Bool)

(declare-fun e!755940 () Bool)

(declare-fun tp_is_empty!36337 () Bool)

(assert (=> b!1326262 (= e!755940 tp_is_empty!36337)))

(declare-fun mapNonEmpty!56157 () Bool)

(declare-fun mapRes!56157 () Bool)

(declare-fun tp!107031 () Bool)

(declare-fun e!755942 () Bool)

(assert (=> mapNonEmpty!56157 (= mapRes!56157 (and tp!107031 e!755942))))

(declare-fun mapKey!56157 () (_ BitVec 32))

(declare-fun mapRest!56157 () (Array (_ BitVec 32) ValueCell!17270))

(declare-fun mapValue!56157 () ValueCell!17270)

(assert (=> mapNonEmpty!56157 (= (arr!43231 _values!1337) (store mapRest!56157 mapKey!56157 mapValue!56157))))

(declare-fun b!1326263 () Bool)

(declare-fun res!880258 () Bool)

(assert (=> b!1326263 (=> (not res!880258) (not e!755941))))

(declare-datatypes ((List!30725 0))(
  ( (Nil!30722) (Cons!30721 (h!31930 (_ BitVec 64)) (t!44705 List!30725)) )
))
(declare-fun arrayNoDuplicates!0 (array!89513 (_ BitVec 32) List!30725) Bool)

(assert (=> b!1326263 (= res!880258 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30722))))

(declare-fun b!1326264 () Bool)

(assert (=> b!1326264 (= e!755941 (not true))))

(declare-fun lt!589832 () ListLongMap!21255)

(assert (=> b!1326264 (contains!8727 lt!589832 k0!1164)))

(declare-fun lt!589831 () V!53553)

(declare-datatypes ((Unit!43493 0))(
  ( (Unit!43494) )
))
(declare-fun lt!589833 () Unit!43493)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!212 ((_ BitVec 64) (_ BitVec 64) V!53553 ListLongMap!21255) Unit!43493)

(assert (=> b!1326264 (= lt!589833 (lemmaInListMapAfterAddingDiffThenInBefore!212 k0!1164 (select (arr!43230 _keys!1609) from!2000) lt!589831 lt!589832))))

(declare-fun lt!589830 () ListLongMap!21255)

(assert (=> b!1326264 (contains!8727 lt!589830 k0!1164)))

(declare-fun lt!589836 () Unit!43493)

(assert (=> b!1326264 (= lt!589836 (lemmaInListMapAfterAddingDiffThenInBefore!212 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589830))))

(declare-fun lt!589834 () ListLongMap!21255)

(assert (=> b!1326264 (contains!8727 lt!589834 k0!1164)))

(declare-fun lt!589835 () Unit!43493)

(assert (=> b!1326264 (= lt!589835 (lemmaInListMapAfterAddingDiffThenInBefore!212 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589834))))

(declare-fun +!4650 (ListLongMap!21255 tuple2!23598) ListLongMap!21255)

(assert (=> b!1326264 (= lt!589834 (+!4650 lt!589830 (tuple2!23599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1326264 (= lt!589830 (+!4650 lt!589832 (tuple2!23599 (select (arr!43230 _keys!1609) from!2000) lt!589831)))))

(declare-fun get!21784 (ValueCell!17270 V!53553) V!53553)

(declare-fun dynLambda!3580 (Int (_ BitVec 64)) V!53553)

(assert (=> b!1326264 (= lt!589831 (get!21784 (select (arr!43231 _values!1337) from!2000) (dynLambda!3580 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6288 (array!89513 array!89515 (_ BitVec 32) (_ BitVec 32) V!53553 V!53553 (_ BitVec 32) Int) ListLongMap!21255)

(assert (=> b!1326264 (= lt!589832 (getCurrentListMapNoExtraKeys!6288 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!880253 () Bool)

(assert (=> start!111918 (=> (not res!880253) (not e!755941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111918 (= res!880253 (validMask!0 mask!2019))))

(assert (=> start!111918 e!755941))

(declare-fun array_inv!32807 (array!89513) Bool)

(assert (=> start!111918 (array_inv!32807 _keys!1609)))

(assert (=> start!111918 true))

(assert (=> start!111918 tp_is_empty!36337))

(declare-fun e!755944 () Bool)

(declare-fun array_inv!32808 (array!89515) Bool)

(assert (=> start!111918 (and (array_inv!32808 _values!1337) e!755944)))

(assert (=> start!111918 tp!107032))

(declare-fun b!1326265 () Bool)

(declare-fun res!880252 () Bool)

(assert (=> b!1326265 (=> (not res!880252) (not e!755941))))

(assert (=> b!1326265 (= res!880252 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43782 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326266 () Bool)

(assert (=> b!1326266 (= e!755944 (and e!755940 mapRes!56157))))

(declare-fun condMapEmpty!56157 () Bool)

(declare-fun mapDefault!56157 () ValueCell!17270)

(assert (=> b!1326266 (= condMapEmpty!56157 (= (arr!43231 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17270)) mapDefault!56157)))))

(declare-fun b!1326267 () Bool)

(declare-fun res!880259 () Bool)

(assert (=> b!1326267 (=> (not res!880259) (not e!755941))))

(assert (=> b!1326267 (= res!880259 (not (= (select (arr!43230 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!56157 () Bool)

(assert (=> mapIsEmpty!56157 mapRes!56157))

(declare-fun b!1326268 () Bool)

(assert (=> b!1326268 (= e!755942 tp_is_empty!36337)))

(assert (= (and start!111918 res!880253) b!1326261))

(assert (= (and b!1326261 res!880256) b!1326258))

(assert (= (and b!1326258 res!880255) b!1326263))

(assert (= (and b!1326263 res!880258) b!1326265))

(assert (= (and b!1326265 res!880252) b!1326259))

(assert (= (and b!1326259 res!880257) b!1326267))

(assert (= (and b!1326267 res!880259) b!1326260))

(assert (= (and b!1326260 res!880254) b!1326264))

(assert (= (and b!1326266 condMapEmpty!56157) mapIsEmpty!56157))

(assert (= (and b!1326266 (not condMapEmpty!56157)) mapNonEmpty!56157))

(get-info :version)

(assert (= (and mapNonEmpty!56157 ((_ is ValueCellFull!17270) mapValue!56157)) b!1326268))

(assert (= (and b!1326266 ((_ is ValueCellFull!17270) mapDefault!56157)) b!1326262))

(assert (= start!111918 b!1326266))

(declare-fun b_lambda!23785 () Bool)

(assert (=> (not b_lambda!23785) (not b!1326264)))

(declare-fun t!44703 () Bool)

(declare-fun tb!11783 () Bool)

(assert (=> (and start!111918 (= defaultEntry!1340 defaultEntry!1340) t!44703) tb!11783))

(declare-fun result!24631 () Bool)

(assert (=> tb!11783 (= result!24631 tp_is_empty!36337)))

(assert (=> b!1326264 t!44703))

(declare-fun b_and!49113 () Bool)

(assert (= b_and!49111 (and (=> t!44703 result!24631) b_and!49113)))

(declare-fun m!1214773 () Bool)

(assert (=> b!1326258 m!1214773))

(declare-fun m!1214775 () Bool)

(assert (=> b!1326260 m!1214775))

(assert (=> b!1326260 m!1214775))

(declare-fun m!1214777 () Bool)

(assert (=> b!1326260 m!1214777))

(declare-fun m!1214779 () Bool)

(assert (=> b!1326263 m!1214779))

(declare-fun m!1214781 () Bool)

(assert (=> mapNonEmpty!56157 m!1214781))

(declare-fun m!1214783 () Bool)

(assert (=> b!1326264 m!1214783))

(declare-fun m!1214785 () Bool)

(assert (=> b!1326264 m!1214785))

(declare-fun m!1214787 () Bool)

(assert (=> b!1326264 m!1214787))

(declare-fun m!1214789 () Bool)

(assert (=> b!1326264 m!1214789))

(declare-fun m!1214791 () Bool)

(assert (=> b!1326264 m!1214791))

(declare-fun m!1214793 () Bool)

(assert (=> b!1326264 m!1214793))

(declare-fun m!1214795 () Bool)

(assert (=> b!1326264 m!1214795))

(assert (=> b!1326264 m!1214787))

(declare-fun m!1214797 () Bool)

(assert (=> b!1326264 m!1214797))

(assert (=> b!1326264 m!1214775))

(declare-fun m!1214799 () Bool)

(assert (=> b!1326264 m!1214799))

(declare-fun m!1214801 () Bool)

(assert (=> b!1326264 m!1214801))

(assert (=> b!1326264 m!1214775))

(declare-fun m!1214803 () Bool)

(assert (=> b!1326264 m!1214803))

(assert (=> b!1326264 m!1214795))

(declare-fun m!1214805 () Bool)

(assert (=> b!1326264 m!1214805))

(declare-fun m!1214807 () Bool)

(assert (=> b!1326259 m!1214807))

(assert (=> b!1326259 m!1214807))

(declare-fun m!1214809 () Bool)

(assert (=> b!1326259 m!1214809))

(declare-fun m!1214811 () Bool)

(assert (=> start!111918 m!1214811))

(declare-fun m!1214813 () Bool)

(assert (=> start!111918 m!1214813))

(declare-fun m!1214815 () Bool)

(assert (=> start!111918 m!1214815))

(assert (=> b!1326267 m!1214775))

(check-sat b_and!49113 (not b!1326260) (not b!1326258) (not b_next!30517) (not start!111918) (not b!1326259) (not b!1326264) (not mapNonEmpty!56157) tp_is_empty!36337 (not b_lambda!23785) (not b!1326263))
(check-sat b_and!49113 (not b_next!30517))
