; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111838 () Bool)

(assert start!111838)

(declare-fun b_free!30271 () Bool)

(declare-fun b_next!30271 () Bool)

(assert (=> start!111838 (= b_free!30271 (not b_next!30271))))

(declare-fun tp!106289 () Bool)

(declare-fun b_and!48703 () Bool)

(assert (=> start!111838 (= tp!106289 b_and!48703)))

(declare-fun b!1323259 () Bool)

(declare-fun res!877954 () Bool)

(declare-fun e!754716 () Bool)

(assert (=> b!1323259 (=> (not res!877954) (not e!754716))))

(declare-datatypes ((array!89187 0))(
  ( (array!89188 (arr!43063 (Array (_ BitVec 32) (_ BitVec 64))) (size!43614 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89187)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53225 0))(
  ( (V!53226 (val!18120 Int)) )
))
(declare-fun zeroValue!1279 () V!53225)

(declare-datatypes ((ValueCell!17147 0))(
  ( (ValueCellFull!17147 (v!20745 V!53225)) (EmptyCell!17147) )
))
(declare-datatypes ((array!89189 0))(
  ( (array!89190 (arr!43064 (Array (_ BitVec 32) ValueCell!17147)) (size!43615 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89189)

(declare-fun minValue!1279 () V!53225)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23384 0))(
  ( (tuple2!23385 (_1!11703 (_ BitVec 64)) (_2!11703 V!53225)) )
))
(declare-datatypes ((List!30534 0))(
  ( (Nil!30531) (Cons!30530 (h!31748 tuple2!23384) (t!44346 List!30534)) )
))
(declare-datatypes ((ListLongMap!21049 0))(
  ( (ListLongMap!21050 (toList!10540 List!30534)) )
))
(declare-fun contains!8707 (ListLongMap!21049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5530 (array!89187 array!89189 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!21049)

(assert (=> b!1323259 (= res!877954 (contains!8707 (getCurrentListMap!5530 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55784 () Bool)

(declare-fun mapRes!55784 () Bool)

(assert (=> mapIsEmpty!55784 mapRes!55784))

(declare-fun b!1323260 () Bool)

(declare-fun res!877948 () Bool)

(assert (=> b!1323260 (=> (not res!877948) (not e!754716))))

(assert (=> b!1323260 (= res!877948 (and (= (size!43615 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43614 _keys!1609) (size!43615 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323261 () Bool)

(declare-fun res!877947 () Bool)

(assert (=> b!1323261 (=> (not res!877947) (not e!754716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89187 (_ BitVec 32)) Bool)

(assert (=> b!1323261 (= res!877947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323262 () Bool)

(assert (=> b!1323262 (= e!754716 (not true))))

(declare-fun lt!588273 () ListLongMap!21049)

(declare-fun lt!588274 () tuple2!23384)

(declare-fun +!4616 (ListLongMap!21049 tuple2!23384) ListLongMap!21049)

(assert (=> b!1323262 (contains!8707 (+!4616 lt!588273 lt!588274) k0!1164)))

(declare-datatypes ((Unit!43519 0))(
  ( (Unit!43520) )
))
(declare-fun lt!588281 () Unit!43519)

(declare-fun addStillContains!1128 (ListLongMap!21049 (_ BitVec 64) V!53225 (_ BitVec 64)) Unit!43519)

(assert (=> b!1323262 (= lt!588281 (addStillContains!1128 lt!588273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323262 (contains!8707 lt!588273 k0!1164)))

(declare-fun lt!588277 () V!53225)

(declare-fun lt!588275 () Unit!43519)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!171 ((_ BitVec 64) (_ BitVec 64) V!53225 ListLongMap!21049) Unit!43519)

(assert (=> b!1323262 (= lt!588275 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 (select (arr!43063 _keys!1609) from!2000) lt!588277 lt!588273))))

(declare-fun lt!588278 () ListLongMap!21049)

(assert (=> b!1323262 (contains!8707 lt!588278 k0!1164)))

(declare-fun lt!588276 () Unit!43519)

(assert (=> b!1323262 (= lt!588276 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588278))))

(declare-fun lt!588280 () ListLongMap!21049)

(assert (=> b!1323262 (contains!8707 lt!588280 k0!1164)))

(declare-fun lt!588279 () Unit!43519)

(assert (=> b!1323262 (= lt!588279 (lemmaInListMapAfterAddingDiffThenInBefore!171 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588280))))

(assert (=> b!1323262 (= lt!588280 (+!4616 lt!588278 lt!588274))))

(assert (=> b!1323262 (= lt!588274 (tuple2!23385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323262 (= lt!588278 (+!4616 lt!588273 (tuple2!23385 (select (arr!43063 _keys!1609) from!2000) lt!588277)))))

(declare-fun get!21701 (ValueCell!17147 V!53225) V!53225)

(declare-fun dynLambda!3570 (Int (_ BitVec 64)) V!53225)

(assert (=> b!1323262 (= lt!588277 (get!21701 (select (arr!43064 _values!1337) from!2000) (dynLambda!3570 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6255 (array!89187 array!89189 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!21049)

(assert (=> b!1323262 (= lt!588273 (getCurrentListMapNoExtraKeys!6255 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323263 () Bool)

(declare-fun res!877951 () Bool)

(assert (=> b!1323263 (=> (not res!877951) (not e!754716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323263 (= res!877951 (validKeyInArray!0 (select (arr!43063 _keys!1609) from!2000)))))

(declare-fun res!877949 () Bool)

(assert (=> start!111838 (=> (not res!877949) (not e!754716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111838 (= res!877949 (validMask!0 mask!2019))))

(assert (=> start!111838 e!754716))

(declare-fun array_inv!32785 (array!89187) Bool)

(assert (=> start!111838 (array_inv!32785 _keys!1609)))

(assert (=> start!111838 true))

(declare-fun tp_is_empty!36091 () Bool)

(assert (=> start!111838 tp_is_empty!36091))

(declare-fun e!754717 () Bool)

(declare-fun array_inv!32786 (array!89189) Bool)

(assert (=> start!111838 (and (array_inv!32786 _values!1337) e!754717)))

(assert (=> start!111838 tp!106289))

(declare-fun b!1323264 () Bool)

(declare-fun e!754715 () Bool)

(assert (=> b!1323264 (= e!754715 tp_is_empty!36091)))

(declare-fun b!1323265 () Bool)

(declare-fun res!877952 () Bool)

(assert (=> b!1323265 (=> (not res!877952) (not e!754716))))

(declare-datatypes ((List!30535 0))(
  ( (Nil!30532) (Cons!30531 (h!31749 (_ BitVec 64)) (t!44347 List!30535)) )
))
(declare-fun arrayNoDuplicates!0 (array!89187 (_ BitVec 32) List!30535) Bool)

(assert (=> b!1323265 (= res!877952 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30532))))

(declare-fun b!1323266 () Bool)

(declare-fun res!877950 () Bool)

(assert (=> b!1323266 (=> (not res!877950) (not e!754716))))

(assert (=> b!1323266 (= res!877950 (not (= (select (arr!43063 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323267 () Bool)

(declare-fun res!877953 () Bool)

(assert (=> b!1323267 (=> (not res!877953) (not e!754716))))

(assert (=> b!1323267 (= res!877953 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43614 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323268 () Bool)

(declare-fun e!754714 () Bool)

(assert (=> b!1323268 (= e!754714 tp_is_empty!36091)))

(declare-fun mapNonEmpty!55784 () Bool)

(declare-fun tp!106288 () Bool)

(assert (=> mapNonEmpty!55784 (= mapRes!55784 (and tp!106288 e!754715))))

(declare-fun mapValue!55784 () ValueCell!17147)

(declare-fun mapKey!55784 () (_ BitVec 32))

(declare-fun mapRest!55784 () (Array (_ BitVec 32) ValueCell!17147))

(assert (=> mapNonEmpty!55784 (= (arr!43064 _values!1337) (store mapRest!55784 mapKey!55784 mapValue!55784))))

(declare-fun b!1323269 () Bool)

(assert (=> b!1323269 (= e!754717 (and e!754714 mapRes!55784))))

(declare-fun condMapEmpty!55784 () Bool)

(declare-fun mapDefault!55784 () ValueCell!17147)

(assert (=> b!1323269 (= condMapEmpty!55784 (= (arr!43064 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17147)) mapDefault!55784)))))

(assert (= (and start!111838 res!877949) b!1323260))

(assert (= (and b!1323260 res!877948) b!1323261))

(assert (= (and b!1323261 res!877947) b!1323265))

(assert (= (and b!1323265 res!877952) b!1323267))

(assert (= (and b!1323267 res!877953) b!1323259))

(assert (= (and b!1323259 res!877954) b!1323266))

(assert (= (and b!1323266 res!877950) b!1323263))

(assert (= (and b!1323263 res!877951) b!1323262))

(assert (= (and b!1323269 condMapEmpty!55784) mapIsEmpty!55784))

(assert (= (and b!1323269 (not condMapEmpty!55784)) mapNonEmpty!55784))

(get-info :version)

(assert (= (and mapNonEmpty!55784 ((_ is ValueCellFull!17147) mapValue!55784)) b!1323264))

(assert (= (and b!1323269 ((_ is ValueCellFull!17147) mapDefault!55784)) b!1323268))

(assert (= start!111838 b!1323269))

(declare-fun b_lambda!23591 () Bool)

(assert (=> (not b_lambda!23591) (not b!1323262)))

(declare-fun t!44345 () Bool)

(declare-fun tb!11615 () Bool)

(assert (=> (and start!111838 (= defaultEntry!1340 defaultEntry!1340) t!44345) tb!11615))

(declare-fun result!24293 () Bool)

(assert (=> tb!11615 (= result!24293 tp_is_empty!36091)))

(assert (=> b!1323262 t!44345))

(declare-fun b_and!48705 () Bool)

(assert (= b_and!48703 (and (=> t!44345 result!24293) b_and!48705)))

(declare-fun m!1211639 () Bool)

(assert (=> b!1323266 m!1211639))

(declare-fun m!1211641 () Bool)

(assert (=> b!1323261 m!1211641))

(declare-fun m!1211643 () Bool)

(assert (=> b!1323262 m!1211643))

(declare-fun m!1211645 () Bool)

(assert (=> b!1323262 m!1211645))

(declare-fun m!1211647 () Bool)

(assert (=> b!1323262 m!1211647))

(declare-fun m!1211649 () Bool)

(assert (=> b!1323262 m!1211649))

(declare-fun m!1211651 () Bool)

(assert (=> b!1323262 m!1211651))

(declare-fun m!1211653 () Bool)

(assert (=> b!1323262 m!1211653))

(declare-fun m!1211655 () Bool)

(assert (=> b!1323262 m!1211655))

(assert (=> b!1323262 m!1211639))

(declare-fun m!1211657 () Bool)

(assert (=> b!1323262 m!1211657))

(declare-fun m!1211659 () Bool)

(assert (=> b!1323262 m!1211659))

(assert (=> b!1323262 m!1211651))

(declare-fun m!1211661 () Bool)

(assert (=> b!1323262 m!1211661))

(declare-fun m!1211663 () Bool)

(assert (=> b!1323262 m!1211663))

(assert (=> b!1323262 m!1211639))

(declare-fun m!1211665 () Bool)

(assert (=> b!1323262 m!1211665))

(declare-fun m!1211667 () Bool)

(assert (=> b!1323262 m!1211667))

(assert (=> b!1323262 m!1211659))

(assert (=> b!1323262 m!1211647))

(declare-fun m!1211669 () Bool)

(assert (=> b!1323262 m!1211669))

(declare-fun m!1211671 () Bool)

(assert (=> b!1323262 m!1211671))

(declare-fun m!1211673 () Bool)

(assert (=> start!111838 m!1211673))

(declare-fun m!1211675 () Bool)

(assert (=> start!111838 m!1211675))

(declare-fun m!1211677 () Bool)

(assert (=> start!111838 m!1211677))

(assert (=> b!1323263 m!1211639))

(assert (=> b!1323263 m!1211639))

(declare-fun m!1211679 () Bool)

(assert (=> b!1323263 m!1211679))

(declare-fun m!1211681 () Bool)

(assert (=> b!1323259 m!1211681))

(assert (=> b!1323259 m!1211681))

(declare-fun m!1211683 () Bool)

(assert (=> b!1323259 m!1211683))

(declare-fun m!1211685 () Bool)

(assert (=> b!1323265 m!1211685))

(declare-fun m!1211687 () Bool)

(assert (=> mapNonEmpty!55784 m!1211687))

(check-sat (not start!111838) b_and!48705 (not b!1323265) (not b_lambda!23591) (not b!1323262) (not mapNonEmpty!55784) (not b!1323259) (not b_next!30271) (not b!1323261) (not b!1323263) tp_is_empty!36091)
(check-sat b_and!48705 (not b_next!30271))
