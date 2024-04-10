; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113236 () Bool)

(assert start!113236)

(declare-fun b_free!31287 () Bool)

(declare-fun b_next!31287 () Bool)

(assert (=> start!113236 (= b_free!31287 (not b_next!31287))))

(declare-fun tp!109666 () Bool)

(declare-fun b_and!50481 () Bool)

(assert (=> start!113236 (= tp!109666 b_and!50481)))

(declare-fun b!1343347 () Bool)

(declare-fun res!891279 () Bool)

(declare-fun e!764630 () Bool)

(assert (=> b!1343347 (=> (not res!891279) (not e!764630))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343347 (= res!891279 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343348 () Bool)

(declare-fun res!891276 () Bool)

(assert (=> b!1343348 (=> (not res!891276) (not e!764630))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91420 0))(
  ( (array!91421 (arr!44166 (Array (_ BitVec 32) (_ BitVec 64))) (size!44716 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91420)

(declare-datatypes ((V!54819 0))(
  ( (V!54820 (val!18718 Int)) )
))
(declare-fun zeroValue!1245 () V!54819)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17745 0))(
  ( (ValueCellFull!17745 (v!21366 V!54819)) (EmptyCell!17745) )
))
(declare-datatypes ((array!91422 0))(
  ( (array!91423 (arr!44167 (Array (_ BitVec 32) ValueCell!17745)) (size!44717 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91422)

(declare-fun minValue!1245 () V!54819)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24112 0))(
  ( (tuple2!24113 (_1!12067 (_ BitVec 64)) (_2!12067 V!54819)) )
))
(declare-datatypes ((List!31270 0))(
  ( (Nil!31267) (Cons!31266 (h!32475 tuple2!24112) (t!45768 List!31270)) )
))
(declare-datatypes ((ListLongMap!21769 0))(
  ( (ListLongMap!21770 (toList!10900 List!31270)) )
))
(declare-fun contains!9076 (ListLongMap!21769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5860 (array!91420 array!91422 (_ BitVec 32) (_ BitVec 32) V!54819 V!54819 (_ BitVec 32) Int) ListLongMap!21769)

(assert (=> b!1343348 (= res!891276 (contains!9076 (getCurrentListMap!5860 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!891275 () Bool)

(assert (=> start!113236 (=> (not res!891275) (not e!764630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113236 (= res!891275 (validMask!0 mask!1977))))

(assert (=> start!113236 e!764630))

(declare-fun tp_is_empty!37287 () Bool)

(assert (=> start!113236 tp_is_empty!37287))

(assert (=> start!113236 true))

(declare-fun array_inv!33291 (array!91420) Bool)

(assert (=> start!113236 (array_inv!33291 _keys!1571)))

(declare-fun e!764632 () Bool)

(declare-fun array_inv!33292 (array!91422) Bool)

(assert (=> start!113236 (and (array_inv!33292 _values!1303) e!764632)))

(assert (=> start!113236 tp!109666))

(declare-fun b!1343349 () Bool)

(declare-fun res!891278 () Bool)

(assert (=> b!1343349 (=> (not res!891278) (not e!764630))))

(assert (=> b!1343349 (= res!891278 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44716 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343350 () Bool)

(declare-fun res!891272 () Bool)

(assert (=> b!1343350 (=> (not res!891272) (not e!764630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91420 (_ BitVec 32)) Bool)

(assert (=> b!1343350 (= res!891272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343351 () Bool)

(declare-fun e!764633 () Bool)

(assert (=> b!1343351 (= e!764633 tp_is_empty!37287)))

(declare-fun b!1343352 () Bool)

(declare-fun res!891274 () Bool)

(assert (=> b!1343352 (=> (not res!891274) (not e!764630))))

(assert (=> b!1343352 (= res!891274 (not (= (select (arr!44166 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343353 () Bool)

(declare-fun e!764629 () Bool)

(assert (=> b!1343353 (= e!764629 tp_is_empty!37287)))

(declare-fun b!1343354 () Bool)

(assert (=> b!1343354 (= e!764630 (not true))))

(declare-fun lt!594882 () ListLongMap!21769)

(declare-fun +!4808 (ListLongMap!21769 tuple2!24112) ListLongMap!21769)

(assert (=> b!1343354 (contains!9076 (+!4808 lt!594882 (tuple2!24113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44093 0))(
  ( (Unit!44094) )
))
(declare-fun lt!594880 () Unit!44093)

(declare-fun addStillContains!1201 (ListLongMap!21769 (_ BitVec 64) V!54819 (_ BitVec 64)) Unit!44093)

(assert (=> b!1343354 (= lt!594880 (addStillContains!1201 lt!594882 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343354 (contains!9076 lt!594882 k0!1142)))

(declare-fun lt!594885 () V!54819)

(declare-fun lt!594883 () Unit!44093)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!377 ((_ BitVec 64) (_ BitVec 64) V!54819 ListLongMap!21769) Unit!44093)

(assert (=> b!1343354 (= lt!594883 (lemmaInListMapAfterAddingDiffThenInBefore!377 k0!1142 (select (arr!44166 _keys!1571) from!1960) lt!594885 lt!594882))))

(declare-fun lt!594881 () ListLongMap!21769)

(assert (=> b!1343354 (contains!9076 lt!594881 k0!1142)))

(declare-fun lt!594884 () Unit!44093)

(assert (=> b!1343354 (= lt!594884 (lemmaInListMapAfterAddingDiffThenInBefore!377 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594881))))

(assert (=> b!1343354 (= lt!594881 (+!4808 lt!594882 (tuple2!24113 (select (arr!44166 _keys!1571) from!1960) lt!594885)))))

(declare-fun get!22309 (ValueCell!17745 V!54819) V!54819)

(declare-fun dynLambda!3747 (Int (_ BitVec 64)) V!54819)

(assert (=> b!1343354 (= lt!594885 (get!22309 (select (arr!44167 _values!1303) from!1960) (dynLambda!3747 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6450 (array!91420 array!91422 (_ BitVec 32) (_ BitVec 32) V!54819 V!54819 (_ BitVec 32) Int) ListLongMap!21769)

(assert (=> b!1343354 (= lt!594882 (getCurrentListMapNoExtraKeys!6450 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57637 () Bool)

(declare-fun mapRes!57637 () Bool)

(declare-fun tp!109665 () Bool)

(assert (=> mapNonEmpty!57637 (= mapRes!57637 (and tp!109665 e!764633))))

(declare-fun mapValue!57637 () ValueCell!17745)

(declare-fun mapRest!57637 () (Array (_ BitVec 32) ValueCell!17745))

(declare-fun mapKey!57637 () (_ BitVec 32))

(assert (=> mapNonEmpty!57637 (= (arr!44167 _values!1303) (store mapRest!57637 mapKey!57637 mapValue!57637))))

(declare-fun b!1343355 () Bool)

(assert (=> b!1343355 (= e!764632 (and e!764629 mapRes!57637))))

(declare-fun condMapEmpty!57637 () Bool)

(declare-fun mapDefault!57637 () ValueCell!17745)

(assert (=> b!1343355 (= condMapEmpty!57637 (= (arr!44167 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17745)) mapDefault!57637)))))

(declare-fun b!1343356 () Bool)

(declare-fun res!891273 () Bool)

(assert (=> b!1343356 (=> (not res!891273) (not e!764630))))

(assert (=> b!1343356 (= res!891273 (and (= (size!44717 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44716 _keys!1571) (size!44717 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343357 () Bool)

(declare-fun res!891271 () Bool)

(assert (=> b!1343357 (=> (not res!891271) (not e!764630))))

(declare-datatypes ((List!31271 0))(
  ( (Nil!31268) (Cons!31267 (h!32476 (_ BitVec 64)) (t!45769 List!31271)) )
))
(declare-fun arrayNoDuplicates!0 (array!91420 (_ BitVec 32) List!31271) Bool)

(assert (=> b!1343357 (= res!891271 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31268))))

(declare-fun b!1343358 () Bool)

(declare-fun res!891277 () Bool)

(assert (=> b!1343358 (=> (not res!891277) (not e!764630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343358 (= res!891277 (validKeyInArray!0 (select (arr!44166 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57637 () Bool)

(assert (=> mapIsEmpty!57637 mapRes!57637))

(assert (= (and start!113236 res!891275) b!1343356))

(assert (= (and b!1343356 res!891273) b!1343350))

(assert (= (and b!1343350 res!891272) b!1343357))

(assert (= (and b!1343357 res!891271) b!1343349))

(assert (= (and b!1343349 res!891278) b!1343348))

(assert (= (and b!1343348 res!891276) b!1343352))

(assert (= (and b!1343352 res!891274) b!1343358))

(assert (= (and b!1343358 res!891277) b!1343347))

(assert (= (and b!1343347 res!891279) b!1343354))

(assert (= (and b!1343355 condMapEmpty!57637) mapIsEmpty!57637))

(assert (= (and b!1343355 (not condMapEmpty!57637)) mapNonEmpty!57637))

(get-info :version)

(assert (= (and mapNonEmpty!57637 ((_ is ValueCellFull!17745) mapValue!57637)) b!1343351))

(assert (= (and b!1343355 ((_ is ValueCellFull!17745) mapDefault!57637)) b!1343353))

(assert (= start!113236 b!1343355))

(declare-fun b_lambda!24463 () Bool)

(assert (=> (not b_lambda!24463) (not b!1343354)))

(declare-fun t!45767 () Bool)

(declare-fun tb!12301 () Bool)

(assert (=> (and start!113236 (= defaultEntry!1306 defaultEntry!1306) t!45767) tb!12301))

(declare-fun result!25693 () Bool)

(assert (=> tb!12301 (= result!25693 tp_is_empty!37287)))

(assert (=> b!1343354 t!45767))

(declare-fun b_and!50483 () Bool)

(assert (= b_and!50481 (and (=> t!45767 result!25693) b_and!50483)))

(declare-fun m!1231047 () Bool)

(assert (=> b!1343348 m!1231047))

(assert (=> b!1343348 m!1231047))

(declare-fun m!1231049 () Bool)

(assert (=> b!1343348 m!1231049))

(declare-fun m!1231051 () Bool)

(assert (=> b!1343352 m!1231051))

(declare-fun m!1231053 () Bool)

(assert (=> b!1343354 m!1231053))

(declare-fun m!1231055 () Bool)

(assert (=> b!1343354 m!1231055))

(declare-fun m!1231057 () Bool)

(assert (=> b!1343354 m!1231057))

(declare-fun m!1231059 () Bool)

(assert (=> b!1343354 m!1231059))

(declare-fun m!1231061 () Bool)

(assert (=> b!1343354 m!1231061))

(assert (=> b!1343354 m!1231059))

(declare-fun m!1231063 () Bool)

(assert (=> b!1343354 m!1231063))

(declare-fun m!1231065 () Bool)

(assert (=> b!1343354 m!1231065))

(declare-fun m!1231067 () Bool)

(assert (=> b!1343354 m!1231067))

(assert (=> b!1343354 m!1231051))

(declare-fun m!1231069 () Bool)

(assert (=> b!1343354 m!1231069))

(declare-fun m!1231071 () Bool)

(assert (=> b!1343354 m!1231071))

(assert (=> b!1343354 m!1231057))

(assert (=> b!1343354 m!1231051))

(declare-fun m!1231073 () Bool)

(assert (=> b!1343354 m!1231073))

(declare-fun m!1231075 () Bool)

(assert (=> b!1343354 m!1231075))

(assert (=> b!1343354 m!1231065))

(declare-fun m!1231077 () Bool)

(assert (=> b!1343350 m!1231077))

(assert (=> b!1343358 m!1231051))

(assert (=> b!1343358 m!1231051))

(declare-fun m!1231079 () Bool)

(assert (=> b!1343358 m!1231079))

(declare-fun m!1231081 () Bool)

(assert (=> start!113236 m!1231081))

(declare-fun m!1231083 () Bool)

(assert (=> start!113236 m!1231083))

(declare-fun m!1231085 () Bool)

(assert (=> start!113236 m!1231085))

(declare-fun m!1231087 () Bool)

(assert (=> mapNonEmpty!57637 m!1231087))

(declare-fun m!1231089 () Bool)

(assert (=> b!1343357 m!1231089))

(check-sat (not b_next!31287) (not start!113236) (not b!1343358) (not mapNonEmpty!57637) (not b!1343354) b_and!50483 (not b!1343350) (not b!1343357) (not b!1343348) tp_is_empty!37287 (not b_lambda!24463))
(check-sat b_and!50483 (not b_next!31287))
