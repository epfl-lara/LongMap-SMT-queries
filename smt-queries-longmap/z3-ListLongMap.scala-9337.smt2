; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111458 () Bool)

(assert start!111458)

(declare-fun b_free!30115 () Bool)

(declare-fun b_next!30115 () Bool)

(assert (=> start!111458 (= b_free!30115 (not b_next!30115))))

(declare-fun tp!105822 () Bool)

(declare-fun b_and!48371 () Bool)

(assert (=> start!111458 (= tp!105822 b_and!48371)))

(declare-fun b!1319160 () Bool)

(declare-fun e!752668 () Bool)

(declare-fun tp_is_empty!35935 () Bool)

(assert (=> b!1319160 (= e!752668 tp_is_empty!35935)))

(declare-fun b!1319161 () Bool)

(declare-fun e!752667 () Bool)

(declare-fun mapRes!55550 () Bool)

(assert (=> b!1319161 (= e!752667 (and e!752668 mapRes!55550))))

(declare-fun condMapEmpty!55550 () Bool)

(declare-datatypes ((V!53017 0))(
  ( (V!53018 (val!18042 Int)) )
))
(declare-datatypes ((ValueCell!17069 0))(
  ( (ValueCellFull!17069 (v!20671 V!53017)) (EmptyCell!17069) )
))
(declare-datatypes ((array!88735 0))(
  ( (array!88736 (arr!42842 (Array (_ BitVec 32) ValueCell!17069)) (size!43394 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88735)

(declare-fun mapDefault!55550 () ValueCell!17069)

(assert (=> b!1319161 (= condMapEmpty!55550 (= (arr!42842 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17069)) mapDefault!55550)))))

(declare-fun b!1319162 () Bool)

(declare-fun e!752670 () Bool)

(assert (=> b!1319162 (= e!752670 (not true))))

(declare-datatypes ((tuple2!23310 0))(
  ( (tuple2!23311 (_1!11666 (_ BitVec 64)) (_2!11666 V!53017)) )
))
(declare-datatypes ((List!30447 0))(
  ( (Nil!30444) (Cons!30443 (h!31652 tuple2!23310) (t!44103 List!30447)) )
))
(declare-datatypes ((ListLongMap!20967 0))(
  ( (ListLongMap!20968 (toList!10499 List!30447)) )
))
(declare-fun lt!586419 () ListLongMap!20967)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8582 (ListLongMap!20967 (_ BitVec 64)) Bool)

(assert (=> b!1319162 (contains!8582 lt!586419 k0!1164)))

(declare-fun minValue!1279 () V!53017)

(declare-datatypes ((Unit!43277 0))(
  ( (Unit!43278) )
))
(declare-fun lt!586418 () Unit!43277)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!112 ((_ BitVec 64) (_ BitVec 64) V!53017 ListLongMap!20967) Unit!43277)

(assert (=> b!1319162 (= lt!586418 (lemmaInListMapAfterAddingDiffThenInBefore!112 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586419))))

(declare-datatypes ((array!88737 0))(
  ( (array!88738 (arr!42843 (Array (_ BitVec 32) (_ BitVec 64))) (size!43395 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88737)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53017)

(declare-fun +!4547 (ListLongMap!20967 tuple2!23310) ListLongMap!20967)

(declare-fun getCurrentListMapNoExtraKeys!6180 (array!88737 array!88735 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20967)

(declare-fun get!21544 (ValueCell!17069 V!53017) V!53017)

(declare-fun dynLambda!3477 (Int (_ BitVec 64)) V!53017)

(assert (=> b!1319162 (= lt!586419 (+!4547 (+!4547 (getCurrentListMapNoExtraKeys!6180 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23311 (select (arr!42843 _keys!1609) from!2000) (get!21544 (select (arr!42842 _values!1337) from!2000) (dynLambda!3477 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319163 () Bool)

(declare-fun res!875534 () Bool)

(assert (=> b!1319163 (=> (not res!875534) (not e!752670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319163 (= res!875534 (validKeyInArray!0 (select (arr!42843 _keys!1609) from!2000)))))

(declare-fun b!1319164 () Bool)

(declare-fun res!875535 () Bool)

(assert (=> b!1319164 (=> (not res!875535) (not e!752670))))

(declare-fun getCurrentListMap!5392 (array!88737 array!88735 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20967)

(assert (=> b!1319164 (= res!875535 (contains!8582 (getCurrentListMap!5392 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!875530 () Bool)

(assert (=> start!111458 (=> (not res!875530) (not e!752670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111458 (= res!875530 (validMask!0 mask!2019))))

(assert (=> start!111458 e!752670))

(declare-fun array_inv!32535 (array!88737) Bool)

(assert (=> start!111458 (array_inv!32535 _keys!1609)))

(assert (=> start!111458 true))

(assert (=> start!111458 tp_is_empty!35935))

(declare-fun array_inv!32536 (array!88735) Bool)

(assert (=> start!111458 (and (array_inv!32536 _values!1337) e!752667)))

(assert (=> start!111458 tp!105822))

(declare-fun b!1319165 () Bool)

(declare-fun res!875531 () Bool)

(assert (=> b!1319165 (=> (not res!875531) (not e!752670))))

(assert (=> b!1319165 (= res!875531 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43395 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319166 () Bool)

(declare-fun res!875533 () Bool)

(assert (=> b!1319166 (=> (not res!875533) (not e!752670))))

(assert (=> b!1319166 (= res!875533 (not (= (select (arr!42843 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319167 () Bool)

(declare-fun e!752671 () Bool)

(assert (=> b!1319167 (= e!752671 tp_is_empty!35935)))

(declare-fun mapIsEmpty!55550 () Bool)

(assert (=> mapIsEmpty!55550 mapRes!55550))

(declare-fun b!1319168 () Bool)

(declare-fun res!875532 () Bool)

(assert (=> b!1319168 (=> (not res!875532) (not e!752670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88737 (_ BitVec 32)) Bool)

(assert (=> b!1319168 (= res!875532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319169 () Bool)

(declare-fun res!875528 () Bool)

(assert (=> b!1319169 (=> (not res!875528) (not e!752670))))

(assert (=> b!1319169 (= res!875528 (and (= (size!43394 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43395 _keys!1609) (size!43394 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319170 () Bool)

(declare-fun res!875529 () Bool)

(assert (=> b!1319170 (=> (not res!875529) (not e!752670))))

(declare-datatypes ((List!30448 0))(
  ( (Nil!30445) (Cons!30444 (h!31653 (_ BitVec 64)) (t!44104 List!30448)) )
))
(declare-fun arrayNoDuplicates!0 (array!88737 (_ BitVec 32) List!30448) Bool)

(assert (=> b!1319170 (= res!875529 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30445))))

(declare-fun mapNonEmpty!55550 () Bool)

(declare-fun tp!105821 () Bool)

(assert (=> mapNonEmpty!55550 (= mapRes!55550 (and tp!105821 e!752671))))

(declare-fun mapKey!55550 () (_ BitVec 32))

(declare-fun mapValue!55550 () ValueCell!17069)

(declare-fun mapRest!55550 () (Array (_ BitVec 32) ValueCell!17069))

(assert (=> mapNonEmpty!55550 (= (arr!42842 _values!1337) (store mapRest!55550 mapKey!55550 mapValue!55550))))

(assert (= (and start!111458 res!875530) b!1319169))

(assert (= (and b!1319169 res!875528) b!1319168))

(assert (= (and b!1319168 res!875532) b!1319170))

(assert (= (and b!1319170 res!875529) b!1319165))

(assert (= (and b!1319165 res!875531) b!1319164))

(assert (= (and b!1319164 res!875535) b!1319166))

(assert (= (and b!1319166 res!875533) b!1319163))

(assert (= (and b!1319163 res!875534) b!1319162))

(assert (= (and b!1319161 condMapEmpty!55550) mapIsEmpty!55550))

(assert (= (and b!1319161 (not condMapEmpty!55550)) mapNonEmpty!55550))

(get-info :version)

(assert (= (and mapNonEmpty!55550 ((_ is ValueCellFull!17069) mapValue!55550)) b!1319167))

(assert (= (and b!1319161 ((_ is ValueCellFull!17069) mapDefault!55550)) b!1319160))

(assert (= start!111458 b!1319161))

(declare-fun b_lambda!23431 () Bool)

(assert (=> (not b_lambda!23431) (not b!1319162)))

(declare-fun t!44102 () Bool)

(declare-fun tb!11459 () Bool)

(assert (=> (and start!111458 (= defaultEntry!1340 defaultEntry!1340) t!44102) tb!11459))

(declare-fun result!23981 () Bool)

(assert (=> tb!11459 (= result!23981 tp_is_empty!35935)))

(assert (=> b!1319162 t!44102))

(declare-fun b_and!48373 () Bool)

(assert (= b_and!48371 (and (=> t!44102 result!23981) b_and!48373)))

(declare-fun m!1206303 () Bool)

(assert (=> b!1319162 m!1206303))

(declare-fun m!1206305 () Bool)

(assert (=> b!1319162 m!1206305))

(assert (=> b!1319162 m!1206303))

(declare-fun m!1206307 () Bool)

(assert (=> b!1319162 m!1206307))

(declare-fun m!1206309 () Bool)

(assert (=> b!1319162 m!1206309))

(declare-fun m!1206311 () Bool)

(assert (=> b!1319162 m!1206311))

(assert (=> b!1319162 m!1206307))

(declare-fun m!1206313 () Bool)

(assert (=> b!1319162 m!1206313))

(assert (=> b!1319162 m!1206311))

(assert (=> b!1319162 m!1206305))

(declare-fun m!1206315 () Bool)

(assert (=> b!1319162 m!1206315))

(declare-fun m!1206317 () Bool)

(assert (=> b!1319162 m!1206317))

(declare-fun m!1206319 () Bool)

(assert (=> b!1319162 m!1206319))

(declare-fun m!1206321 () Bool)

(assert (=> b!1319170 m!1206321))

(declare-fun m!1206323 () Bool)

(assert (=> b!1319164 m!1206323))

(assert (=> b!1319164 m!1206323))

(declare-fun m!1206325 () Bool)

(assert (=> b!1319164 m!1206325))

(declare-fun m!1206327 () Bool)

(assert (=> mapNonEmpty!55550 m!1206327))

(declare-fun m!1206329 () Bool)

(assert (=> start!111458 m!1206329))

(declare-fun m!1206331 () Bool)

(assert (=> start!111458 m!1206331))

(declare-fun m!1206333 () Bool)

(assert (=> start!111458 m!1206333))

(assert (=> b!1319166 m!1206317))

(assert (=> b!1319163 m!1206317))

(assert (=> b!1319163 m!1206317))

(declare-fun m!1206335 () Bool)

(assert (=> b!1319163 m!1206335))

(declare-fun m!1206337 () Bool)

(assert (=> b!1319168 m!1206337))

(check-sat b_and!48373 (not b!1319163) (not b_lambda!23431) (not b!1319170) (not b!1319168) (not b_next!30115) (not b!1319164) (not start!111458) (not b!1319162) tp_is_empty!35935 (not mapNonEmpty!55550))
(check-sat b_and!48373 (not b_next!30115))
