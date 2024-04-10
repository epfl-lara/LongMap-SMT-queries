; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111424 () Bool)

(assert start!111424)

(declare-fun b_free!30081 () Bool)

(declare-fun b_next!30081 () Bool)

(assert (=> start!111424 (= b_free!30081 (not b_next!30081))))

(declare-fun tp!105719 () Bool)

(declare-fun b_and!48321 () Bool)

(assert (=> start!111424 (= tp!105719 b_and!48321)))

(declare-fun b!1318635 () Bool)

(declare-fun res!875156 () Bool)

(declare-fun e!752446 () Bool)

(assert (=> b!1318635 (=> (not res!875156) (not e!752446))))

(declare-datatypes ((array!88746 0))(
  ( (array!88747 (arr!42847 (Array (_ BitVec 32) (_ BitVec 64))) (size!43397 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88746)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318635 (= res!875156 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43397 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318636 () Bool)

(declare-fun e!752445 () Bool)

(declare-fun tp_is_empty!35901 () Bool)

(assert (=> b!1318636 (= e!752445 tp_is_empty!35901)))

(declare-fun b!1318637 () Bool)

(declare-fun res!875154 () Bool)

(assert (=> b!1318637 (=> (not res!875154) (not e!752446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318637 (= res!875154 (validKeyInArray!0 (select (arr!42847 _keys!1609) from!2000)))))

(declare-fun res!875150 () Bool)

(assert (=> start!111424 (=> (not res!875150) (not e!752446))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111424 (= res!875150 (validMask!0 mask!2019))))

(assert (=> start!111424 e!752446))

(declare-fun array_inv!32353 (array!88746) Bool)

(assert (=> start!111424 (array_inv!32353 _keys!1609)))

(assert (=> start!111424 true))

(assert (=> start!111424 tp_is_empty!35901))

(declare-datatypes ((V!52971 0))(
  ( (V!52972 (val!18025 Int)) )
))
(declare-datatypes ((ValueCell!17052 0))(
  ( (ValueCellFull!17052 (v!20655 V!52971)) (EmptyCell!17052) )
))
(declare-datatypes ((array!88748 0))(
  ( (array!88749 (arr!42848 (Array (_ BitVec 32) ValueCell!17052)) (size!43398 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88748)

(declare-fun e!752448 () Bool)

(declare-fun array_inv!32354 (array!88748) Bool)

(assert (=> start!111424 (and (array_inv!32354 _values!1337) e!752448)))

(assert (=> start!111424 tp!105719))

(declare-fun b!1318638 () Bool)

(declare-fun res!875153 () Bool)

(assert (=> b!1318638 (=> (not res!875153) (not e!752446))))

(assert (=> b!1318638 (= res!875153 (and (= (size!43398 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43397 _keys!1609) (size!43398 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318639 () Bool)

(declare-fun e!752449 () Bool)

(assert (=> b!1318639 (= e!752449 tp_is_empty!35901)))

(declare-fun b!1318640 () Bool)

(declare-fun res!875152 () Bool)

(assert (=> b!1318640 (=> (not res!875152) (not e!752446))))

(assert (=> b!1318640 (= res!875152 (not (= (select (arr!42847 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318641 () Bool)

(declare-fun res!875155 () Bool)

(assert (=> b!1318641 (=> (not res!875155) (not e!752446))))

(declare-datatypes ((List!30350 0))(
  ( (Nil!30347) (Cons!30346 (h!31555 (_ BitVec 64)) (t!43980 List!30350)) )
))
(declare-fun arrayNoDuplicates!0 (array!88746 (_ BitVec 32) List!30350) Bool)

(assert (=> b!1318641 (= res!875155 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30347))))

(declare-fun mapIsEmpty!55499 () Bool)

(declare-fun mapRes!55499 () Bool)

(assert (=> mapIsEmpty!55499 mapRes!55499))

(declare-fun b!1318642 () Bool)

(declare-fun res!875151 () Bool)

(assert (=> b!1318642 (=> (not res!875151) (not e!752446))))

(declare-fun zeroValue!1279 () V!52971)

(declare-fun defaultEntry!1340 () Int)

(declare-fun minValue!1279 () V!52971)

(declare-datatypes ((tuple2!23194 0))(
  ( (tuple2!23195 (_1!11608 (_ BitVec 64)) (_2!11608 V!52971)) )
))
(declare-datatypes ((List!30351 0))(
  ( (Nil!30348) (Cons!30347 (h!31556 tuple2!23194) (t!43981 List!30351)) )
))
(declare-datatypes ((ListLongMap!20851 0))(
  ( (ListLongMap!20852 (toList!10441 List!30351)) )
))
(declare-fun contains!8596 (ListLongMap!20851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5454 (array!88746 array!88748 (_ BitVec 32) (_ BitVec 32) V!52971 V!52971 (_ BitVec 32) Int) ListLongMap!20851)

(assert (=> b!1318642 (= res!875151 (contains!8596 (getCurrentListMap!5454 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55499 () Bool)

(declare-fun tp!105718 () Bool)

(assert (=> mapNonEmpty!55499 (= mapRes!55499 (and tp!105718 e!752445))))

(declare-fun mapRest!55499 () (Array (_ BitVec 32) ValueCell!17052))

(declare-fun mapValue!55499 () ValueCell!17052)

(declare-fun mapKey!55499 () (_ BitVec 32))

(assert (=> mapNonEmpty!55499 (= (arr!42848 _values!1337) (store mapRest!55499 mapKey!55499 mapValue!55499))))

(declare-fun b!1318643 () Bool)

(assert (=> b!1318643 (= e!752448 (and e!752449 mapRes!55499))))

(declare-fun condMapEmpty!55499 () Bool)

(declare-fun mapDefault!55499 () ValueCell!17052)

(assert (=> b!1318643 (= condMapEmpty!55499 (= (arr!42848 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17052)) mapDefault!55499)))))

(declare-fun b!1318644 () Bool)

(assert (=> b!1318644 (= e!752446 (not true))))

(declare-fun lt!586502 () ListLongMap!20851)

(assert (=> b!1318644 (contains!8596 lt!586502 k0!1164)))

(declare-datatypes ((Unit!43424 0))(
  ( (Unit!43425) )
))
(declare-fun lt!586503 () Unit!43424)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!98 ((_ BitVec 64) (_ BitVec 64) V!52971 ListLongMap!20851) Unit!43424)

(assert (=> b!1318644 (= lt!586503 (lemmaInListMapAfterAddingDiffThenInBefore!98 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586502))))

(declare-fun +!4502 (ListLongMap!20851 tuple2!23194) ListLongMap!20851)

(declare-fun getCurrentListMapNoExtraKeys!6137 (array!88746 array!88748 (_ BitVec 32) (_ BitVec 32) V!52971 V!52971 (_ BitVec 32) Int) ListLongMap!20851)

(declare-fun get!21520 (ValueCell!17052 V!52971) V!52971)

(declare-fun dynLambda!3441 (Int (_ BitVec 64)) V!52971)

(assert (=> b!1318644 (= lt!586502 (+!4502 (+!4502 (getCurrentListMapNoExtraKeys!6137 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23195 (select (arr!42847 _keys!1609) from!2000) (get!21520 (select (arr!42848 _values!1337) from!2000) (dynLambda!3441 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318645 () Bool)

(declare-fun res!875149 () Bool)

(assert (=> b!1318645 (=> (not res!875149) (not e!752446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88746 (_ BitVec 32)) Bool)

(assert (=> b!1318645 (= res!875149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111424 res!875150) b!1318638))

(assert (= (and b!1318638 res!875153) b!1318645))

(assert (= (and b!1318645 res!875149) b!1318641))

(assert (= (and b!1318641 res!875155) b!1318635))

(assert (= (and b!1318635 res!875156) b!1318642))

(assert (= (and b!1318642 res!875151) b!1318640))

(assert (= (and b!1318640 res!875152) b!1318637))

(assert (= (and b!1318637 res!875154) b!1318644))

(assert (= (and b!1318643 condMapEmpty!55499) mapIsEmpty!55499))

(assert (= (and b!1318643 (not condMapEmpty!55499)) mapNonEmpty!55499))

(get-info :version)

(assert (= (and mapNonEmpty!55499 ((_ is ValueCellFull!17052) mapValue!55499)) b!1318636))

(assert (= (and b!1318643 ((_ is ValueCellFull!17052) mapDefault!55499)) b!1318639))

(assert (= start!111424 b!1318643))

(declare-fun b_lambda!23407 () Bool)

(assert (=> (not b_lambda!23407) (not b!1318644)))

(declare-fun t!43979 () Bool)

(declare-fun tb!11433 () Bool)

(assert (=> (and start!111424 (= defaultEntry!1340 defaultEntry!1340) t!43979) tb!11433))

(declare-fun result!23921 () Bool)

(assert (=> tb!11433 (= result!23921 tp_is_empty!35901)))

(assert (=> b!1318644 t!43979))

(declare-fun b_and!48323 () Bool)

(assert (= b_and!48321 (and (=> t!43979 result!23921) b_and!48323)))

(declare-fun m!1206207 () Bool)

(assert (=> b!1318642 m!1206207))

(assert (=> b!1318642 m!1206207))

(declare-fun m!1206209 () Bool)

(assert (=> b!1318642 m!1206209))

(declare-fun m!1206211 () Bool)

(assert (=> start!111424 m!1206211))

(declare-fun m!1206213 () Bool)

(assert (=> start!111424 m!1206213))

(declare-fun m!1206215 () Bool)

(assert (=> start!111424 m!1206215))

(declare-fun m!1206217 () Bool)

(assert (=> b!1318637 m!1206217))

(assert (=> b!1318637 m!1206217))

(declare-fun m!1206219 () Bool)

(assert (=> b!1318637 m!1206219))

(declare-fun m!1206221 () Bool)

(assert (=> mapNonEmpty!55499 m!1206221))

(declare-fun m!1206223 () Bool)

(assert (=> b!1318644 m!1206223))

(declare-fun m!1206225 () Bool)

(assert (=> b!1318644 m!1206225))

(declare-fun m!1206227 () Bool)

(assert (=> b!1318644 m!1206227))

(assert (=> b!1318644 m!1206225))

(declare-fun m!1206229 () Bool)

(assert (=> b!1318644 m!1206229))

(declare-fun m!1206231 () Bool)

(assert (=> b!1318644 m!1206231))

(assert (=> b!1318644 m!1206229))

(declare-fun m!1206233 () Bool)

(assert (=> b!1318644 m!1206233))

(assert (=> b!1318644 m!1206231))

(assert (=> b!1318644 m!1206227))

(declare-fun m!1206235 () Bool)

(assert (=> b!1318644 m!1206235))

(assert (=> b!1318644 m!1206217))

(declare-fun m!1206237 () Bool)

(assert (=> b!1318644 m!1206237))

(assert (=> b!1318640 m!1206217))

(declare-fun m!1206239 () Bool)

(assert (=> b!1318645 m!1206239))

(declare-fun m!1206241 () Bool)

(assert (=> b!1318641 m!1206241))

(check-sat (not b!1318642) (not b_next!30081) (not b!1318637) (not b!1318641) b_and!48323 (not start!111424) (not b!1318644) (not b_lambda!23407) tp_is_empty!35901 (not b!1318645) (not mapNonEmpty!55499))
(check-sat b_and!48323 (not b_next!30081))
