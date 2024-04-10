; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111914 () Bool)

(assert start!111914)

(declare-fun b_free!30513 () Bool)

(declare-fun b_next!30513 () Bool)

(assert (=> start!111914 (= b_free!30513 (not b_next!30513))))

(declare-fun tp!107019 () Bool)

(declare-fun b_and!49121 () Bool)

(assert (=> start!111914 (= tp!107019 b_and!49121)))

(declare-fun b!1326258 () Bool)

(declare-fun res!880239 () Bool)

(declare-fun e!755947 () Bool)

(assert (=> b!1326258 (=> (not res!880239) (not e!755947))))

(declare-datatypes ((array!89572 0))(
  ( (array!89573 (arr!43259 (Array (_ BitVec 32) (_ BitVec 64))) (size!43809 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89572)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53547 0))(
  ( (V!53548 (val!18241 Int)) )
))
(declare-datatypes ((ValueCell!17268 0))(
  ( (ValueCellFull!17268 (v!20874 V!53547)) (EmptyCell!17268) )
))
(declare-datatypes ((array!89574 0))(
  ( (array!89575 (arr!43260 (Array (_ BitVec 32) ValueCell!17268)) (size!43810 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89574)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326258 (= res!880239 (and (= (size!43810 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43809 _keys!1609) (size!43810 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326259 () Bool)

(declare-fun res!880240 () Bool)

(assert (=> b!1326259 (=> (not res!880240) (not e!755947))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53547)

(declare-fun minValue!1279 () V!53547)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23534 0))(
  ( (tuple2!23535 (_1!11778 (_ BitVec 64)) (_2!11778 V!53547)) )
))
(declare-datatypes ((List!30670 0))(
  ( (Nil!30667) (Cons!30666 (h!31875 tuple2!23534) (t!44654 List!30670)) )
))
(declare-datatypes ((ListLongMap!21191 0))(
  ( (ListLongMap!21192 (toList!10611 List!30670)) )
))
(declare-fun contains!8768 (ListLongMap!21191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5602 (array!89572 array!89574 (_ BitVec 32) (_ BitVec 32) V!53547 V!53547 (_ BitVec 32) Int) ListLongMap!21191)

(assert (=> b!1326259 (= res!880240 (contains!8768 (getCurrentListMap!5602 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!880235 () Bool)

(assert (=> start!111914 (=> (not res!880235) (not e!755947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111914 (= res!880235 (validMask!0 mask!2019))))

(assert (=> start!111914 e!755947))

(declare-fun array_inv!32655 (array!89572) Bool)

(assert (=> start!111914 (array_inv!32655 _keys!1609)))

(assert (=> start!111914 true))

(declare-fun tp_is_empty!36333 () Bool)

(assert (=> start!111914 tp_is_empty!36333))

(declare-fun e!755945 () Bool)

(declare-fun array_inv!32656 (array!89574) Bool)

(assert (=> start!111914 (and (array_inv!32656 _values!1337) e!755945)))

(assert (=> start!111914 tp!107019))

(declare-fun b!1326260 () Bool)

(declare-fun res!880236 () Bool)

(assert (=> b!1326260 (=> (not res!880236) (not e!755947))))

(assert (=> b!1326260 (= res!880236 (not (= (select (arr!43259 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!56151 () Bool)

(declare-fun mapRes!56151 () Bool)

(declare-fun tp!107018 () Bool)

(declare-fun e!755946 () Bool)

(assert (=> mapNonEmpty!56151 (= mapRes!56151 (and tp!107018 e!755946))))

(declare-fun mapValue!56151 () ValueCell!17268)

(declare-fun mapKey!56151 () (_ BitVec 32))

(declare-fun mapRest!56151 () (Array (_ BitVec 32) ValueCell!17268))

(assert (=> mapNonEmpty!56151 (= (arr!43260 _values!1337) (store mapRest!56151 mapKey!56151 mapValue!56151))))

(declare-fun mapIsEmpty!56151 () Bool)

(assert (=> mapIsEmpty!56151 mapRes!56151))

(declare-fun b!1326261 () Bool)

(declare-fun e!755943 () Bool)

(assert (=> b!1326261 (= e!755943 tp_is_empty!36333)))

(declare-fun b!1326262 () Bool)

(assert (=> b!1326262 (= e!755945 (and e!755943 mapRes!56151))))

(declare-fun condMapEmpty!56151 () Bool)

(declare-fun mapDefault!56151 () ValueCell!17268)

(assert (=> b!1326262 (= condMapEmpty!56151 (= (arr!43260 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17268)) mapDefault!56151)))))

(declare-fun b!1326263 () Bool)

(assert (=> b!1326263 (= e!755946 tp_is_empty!36333)))

(declare-fun b!1326264 () Bool)

(assert (=> b!1326264 (= e!755947 (not (not (= k0!1164 (select (arr!43259 _keys!1609) from!2000)))))))

(declare-fun lt!589987 () ListLongMap!21191)

(assert (=> b!1326264 (contains!8768 lt!589987 k0!1164)))

(declare-datatypes ((Unit!43694 0))(
  ( (Unit!43695) )
))
(declare-fun lt!589989 () Unit!43694)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!225 ((_ BitVec 64) (_ BitVec 64) V!53547 ListLongMap!21191) Unit!43694)

(assert (=> b!1326264 (= lt!589989 (lemmaInListMapAfterAddingDiffThenInBefore!225 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589987))))

(declare-fun lt!589988 () ListLongMap!21191)

(assert (=> b!1326264 (contains!8768 lt!589988 k0!1164)))

(declare-fun lt!589986 () Unit!43694)

(assert (=> b!1326264 (= lt!589986 (lemmaInListMapAfterAddingDiffThenInBefore!225 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589988))))

(declare-fun +!4633 (ListLongMap!21191 tuple2!23534) ListLongMap!21191)

(assert (=> b!1326264 (= lt!589988 (+!4633 lt!589987 (tuple2!23535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6271 (array!89572 array!89574 (_ BitVec 32) (_ BitVec 32) V!53547 V!53547 (_ BitVec 32) Int) ListLongMap!21191)

(declare-fun get!21798 (ValueCell!17268 V!53547) V!53547)

(declare-fun dynLambda!3572 (Int (_ BitVec 64)) V!53547)

(assert (=> b!1326264 (= lt!589987 (+!4633 (getCurrentListMapNoExtraKeys!6271 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23535 (select (arr!43259 _keys!1609) from!2000) (get!21798 (select (arr!43260 _values!1337) from!2000) (dynLambda!3572 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326265 () Bool)

(declare-fun res!880238 () Bool)

(assert (=> b!1326265 (=> (not res!880238) (not e!755947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89572 (_ BitVec 32)) Bool)

(assert (=> b!1326265 (= res!880238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326266 () Bool)

(declare-fun res!880233 () Bool)

(assert (=> b!1326266 (=> (not res!880233) (not e!755947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326266 (= res!880233 (validKeyInArray!0 (select (arr!43259 _keys!1609) from!2000)))))

(declare-fun b!1326267 () Bool)

(declare-fun res!880234 () Bool)

(assert (=> b!1326267 (=> (not res!880234) (not e!755947))))

(assert (=> b!1326267 (= res!880234 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43809 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326268 () Bool)

(declare-fun res!880237 () Bool)

(assert (=> b!1326268 (=> (not res!880237) (not e!755947))))

(declare-datatypes ((List!30671 0))(
  ( (Nil!30668) (Cons!30667 (h!31876 (_ BitVec 64)) (t!44655 List!30671)) )
))
(declare-fun arrayNoDuplicates!0 (array!89572 (_ BitVec 32) List!30671) Bool)

(assert (=> b!1326268 (= res!880237 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30668))))

(assert (= (and start!111914 res!880235) b!1326258))

(assert (= (and b!1326258 res!880239) b!1326265))

(assert (= (and b!1326265 res!880238) b!1326268))

(assert (= (and b!1326268 res!880237) b!1326267))

(assert (= (and b!1326267 res!880234) b!1326259))

(assert (= (and b!1326259 res!880240) b!1326260))

(assert (= (and b!1326260 res!880236) b!1326266))

(assert (= (and b!1326266 res!880233) b!1326264))

(assert (= (and b!1326262 condMapEmpty!56151) mapIsEmpty!56151))

(assert (= (and b!1326262 (not condMapEmpty!56151)) mapNonEmpty!56151))

(get-info :version)

(assert (= (and mapNonEmpty!56151 ((_ is ValueCellFull!17268) mapValue!56151)) b!1326263))

(assert (= (and b!1326262 ((_ is ValueCellFull!17268) mapDefault!56151)) b!1326261))

(assert (= start!111914 b!1326262))

(declare-fun b_lambda!23791 () Bool)

(assert (=> (not b_lambda!23791) (not b!1326264)))

(declare-fun t!44653 () Bool)

(declare-fun tb!11787 () Bool)

(assert (=> (and start!111914 (= defaultEntry!1340 defaultEntry!1340) t!44653) tb!11787))

(declare-fun result!24631 () Bool)

(assert (=> tb!11787 (= result!24631 tp_is_empty!36333)))

(assert (=> b!1326264 t!44653))

(declare-fun b_and!49123 () Bool)

(assert (= b_and!49121 (and (=> t!44653 result!24631) b_and!49123)))

(declare-fun m!1215209 () Bool)

(assert (=> b!1326268 m!1215209))

(declare-fun m!1215211 () Bool)

(assert (=> b!1326260 m!1215211))

(declare-fun m!1215213 () Bool)

(assert (=> start!111914 m!1215213))

(declare-fun m!1215215 () Bool)

(assert (=> start!111914 m!1215215))

(declare-fun m!1215217 () Bool)

(assert (=> start!111914 m!1215217))

(assert (=> b!1326266 m!1215211))

(assert (=> b!1326266 m!1215211))

(declare-fun m!1215219 () Bool)

(assert (=> b!1326266 m!1215219))

(declare-fun m!1215221 () Bool)

(assert (=> b!1326259 m!1215221))

(assert (=> b!1326259 m!1215221))

(declare-fun m!1215223 () Bool)

(assert (=> b!1326259 m!1215223))

(declare-fun m!1215225 () Bool)

(assert (=> b!1326265 m!1215225))

(declare-fun m!1215227 () Bool)

(assert (=> mapNonEmpty!56151 m!1215227))

(declare-fun m!1215229 () Bool)

(assert (=> b!1326264 m!1215229))

(declare-fun m!1215231 () Bool)

(assert (=> b!1326264 m!1215231))

(declare-fun m!1215233 () Bool)

(assert (=> b!1326264 m!1215233))

(declare-fun m!1215235 () Bool)

(assert (=> b!1326264 m!1215235))

(assert (=> b!1326264 m!1215233))

(declare-fun m!1215237 () Bool)

(assert (=> b!1326264 m!1215237))

(declare-fun m!1215239 () Bool)

(assert (=> b!1326264 m!1215239))

(declare-fun m!1215241 () Bool)

(assert (=> b!1326264 m!1215241))

(declare-fun m!1215243 () Bool)

(assert (=> b!1326264 m!1215243))

(assert (=> b!1326264 m!1215211))

(assert (=> b!1326264 m!1215239))

(assert (=> b!1326264 m!1215235))

(declare-fun m!1215245 () Bool)

(assert (=> b!1326264 m!1215245))

(declare-fun m!1215247 () Bool)

(assert (=> b!1326264 m!1215247))

(check-sat (not b!1326264) (not b_lambda!23791) (not b_next!30513) (not b!1326268) b_and!49123 (not b!1326265) (not b!1326266) (not start!111914) tp_is_empty!36333 (not b!1326259) (not mapNonEmpty!56151))
(check-sat b_and!49123 (not b_next!30513))
