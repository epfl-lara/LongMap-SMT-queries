; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113440 () Bool)

(assert start!113440)

(declare-fun b_free!31267 () Bool)

(declare-fun b_next!31267 () Bool)

(assert (=> start!113440 (= b_free!31267 (not b_next!31267))))

(declare-fun tp!109605 () Bool)

(declare-fun b_and!50443 () Bool)

(assert (=> start!113440 (= tp!109605 b_and!50443)))

(declare-fun b!1344266 () Bool)

(declare-fun res!891526 () Bool)

(declare-fun e!765325 () Bool)

(assert (=> b!1344266 (=> (not res!891526) (not e!765325))))

(declare-datatypes ((array!91497 0))(
  ( (array!91498 (arr!44200 (Array (_ BitVec 32) (_ BitVec 64))) (size!44751 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91497)

(declare-datatypes ((List!31297 0))(
  ( (Nil!31294) (Cons!31293 (h!32511 (_ BitVec 64)) (t!45767 List!31297)) )
))
(declare-fun arrayNoDuplicates!0 (array!91497 (_ BitVec 32) List!31297) Bool)

(assert (=> b!1344266 (= res!891526 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31294))))

(declare-fun b!1344267 () Bool)

(declare-fun res!891521 () Bool)

(assert (=> b!1344267 (=> (not res!891521) (not e!765325))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54793 0))(
  ( (V!54794 (val!18708 Int)) )
))
(declare-datatypes ((ValueCell!17735 0))(
  ( (ValueCellFull!17735 (v!21351 V!54793)) (EmptyCell!17735) )
))
(declare-datatypes ((array!91499 0))(
  ( (array!91500 (arr!44201 (Array (_ BitVec 32) ValueCell!17735)) (size!44752 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91499)

(assert (=> b!1344267 (= res!891521 (and (= (size!44752 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44751 _keys!1571) (size!44752 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57607 () Bool)

(declare-fun mapRes!57607 () Bool)

(assert (=> mapIsEmpty!57607 mapRes!57607))

(declare-fun mapNonEmpty!57607 () Bool)

(declare-fun tp!109606 () Bool)

(declare-fun e!765324 () Bool)

(assert (=> mapNonEmpty!57607 (= mapRes!57607 (and tp!109606 e!765324))))

(declare-fun mapValue!57607 () ValueCell!17735)

(declare-fun mapKey!57607 () (_ BitVec 32))

(declare-fun mapRest!57607 () (Array (_ BitVec 32) ValueCell!17735))

(assert (=> mapNonEmpty!57607 (= (arr!44201 _values!1303) (store mapRest!57607 mapKey!57607 mapValue!57607))))

(declare-fun b!1344268 () Bool)

(declare-fun tp_is_empty!37267 () Bool)

(assert (=> b!1344268 (= e!765324 tp_is_empty!37267)))

(declare-fun b!1344269 () Bool)

(declare-fun e!765322 () Bool)

(declare-fun e!765323 () Bool)

(assert (=> b!1344269 (= e!765322 (and e!765323 mapRes!57607))))

(declare-fun condMapEmpty!57607 () Bool)

(declare-fun mapDefault!57607 () ValueCell!17735)

(assert (=> b!1344269 (= condMapEmpty!57607 (= (arr!44201 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17735)) mapDefault!57607)))))

(declare-fun b!1344270 () Bool)

(declare-fun res!891519 () Bool)

(assert (=> b!1344270 (=> (not res!891519) (not e!765325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91497 (_ BitVec 32)) Bool)

(assert (=> b!1344270 (= res!891519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344271 () Bool)

(declare-fun res!891523 () Bool)

(assert (=> b!1344271 (=> (not res!891523) (not e!765325))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344271 (= res!891523 (not (= (select (arr!44200 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!891524 () Bool)

(assert (=> start!113440 (=> (not res!891524) (not e!765325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113440 (= res!891524 (validMask!0 mask!1977))))

(assert (=> start!113440 e!765325))

(assert (=> start!113440 tp_is_empty!37267))

(assert (=> start!113440 true))

(declare-fun array_inv!33589 (array!91497) Bool)

(assert (=> start!113440 (array_inv!33589 _keys!1571)))

(declare-fun array_inv!33590 (array!91499) Bool)

(assert (=> start!113440 (and (array_inv!33590 _values!1303) e!765322)))

(assert (=> start!113440 tp!109605))

(declare-fun b!1344272 () Bool)

(declare-fun res!891527 () Bool)

(assert (=> b!1344272 (=> (not res!891527) (not e!765325))))

(assert (=> b!1344272 (= res!891527 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44751 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344273 () Bool)

(declare-fun res!891525 () Bool)

(assert (=> b!1344273 (=> (not res!891525) (not e!765325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344273 (= res!891525 (validKeyInArray!0 (select (arr!44200 _keys!1571) from!1960)))))

(declare-fun b!1344274 () Bool)

(declare-fun res!891522 () Bool)

(assert (=> b!1344274 (=> (not res!891522) (not e!765325))))

(declare-fun minValue!1245 () V!54793)

(declare-fun zeroValue!1245 () V!54793)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24150 0))(
  ( (tuple2!24151 (_1!12086 (_ BitVec 64)) (_2!12086 V!54793)) )
))
(declare-datatypes ((List!31298 0))(
  ( (Nil!31295) (Cons!31294 (h!32512 tuple2!24150) (t!45768 List!31298)) )
))
(declare-datatypes ((ListLongMap!21815 0))(
  ( (ListLongMap!21816 (toList!10923 List!31298)) )
))
(declare-fun contains!9111 (ListLongMap!21815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5869 (array!91497 array!91499 (_ BitVec 32) (_ BitVec 32) V!54793 V!54793 (_ BitVec 32) Int) ListLongMap!21815)

(assert (=> b!1344274 (= res!891522 (contains!9111 (getCurrentListMap!5869 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344275 () Bool)

(declare-fun res!891520 () Bool)

(assert (=> b!1344275 (=> (not res!891520) (not e!765325))))

(assert (=> b!1344275 (= res!891520 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344276 () Bool)

(assert (=> b!1344276 (= e!765323 tp_is_empty!37267)))

(declare-fun b!1344277 () Bool)

(assert (=> b!1344277 (= e!765325 (not true))))

(declare-fun lt!595176 () ListLongMap!21815)

(declare-fun +!4838 (ListLongMap!21815 tuple2!24150) ListLongMap!21815)

(assert (=> b!1344277 (contains!9111 (+!4838 lt!595176 (tuple2!24151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44016 0))(
  ( (Unit!44017) )
))
(declare-fun lt!595180 () Unit!44016)

(declare-fun addStillContains!1200 (ListLongMap!21815 (_ BitVec 64) V!54793 (_ BitVec 64)) Unit!44016)

(assert (=> b!1344277 (= lt!595180 (addStillContains!1200 lt!595176 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344277 (contains!9111 lt!595176 k0!1142)))

(declare-fun lt!595177 () V!54793)

(declare-fun lt!595181 () Unit!44016)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!364 ((_ BitVec 64) (_ BitVec 64) V!54793 ListLongMap!21815) Unit!44016)

(assert (=> b!1344277 (= lt!595181 (lemmaInListMapAfterAddingDiffThenInBefore!364 k0!1142 (select (arr!44200 _keys!1571) from!1960) lt!595177 lt!595176))))

(declare-fun lt!595179 () ListLongMap!21815)

(assert (=> b!1344277 (contains!9111 lt!595179 k0!1142)))

(declare-fun lt!595178 () Unit!44016)

(assert (=> b!1344277 (= lt!595178 (lemmaInListMapAfterAddingDiffThenInBefore!364 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595179))))

(assert (=> b!1344277 (= lt!595179 (+!4838 lt!595176 (tuple2!24151 (select (arr!44200 _keys!1571) from!1960) lt!595177)))))

(declare-fun get!22336 (ValueCell!17735 V!54793) V!54793)

(declare-fun dynLambda!3792 (Int (_ BitVec 64)) V!54793)

(assert (=> b!1344277 (= lt!595177 (get!22336 (select (arr!44201 _values!1303) from!1960) (dynLambda!3792 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6487 (array!91497 array!91499 (_ BitVec 32) (_ BitVec 32) V!54793 V!54793 (_ BitVec 32) Int) ListLongMap!21815)

(assert (=> b!1344277 (= lt!595176 (getCurrentListMapNoExtraKeys!6487 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and start!113440 res!891524) b!1344267))

(assert (= (and b!1344267 res!891521) b!1344270))

(assert (= (and b!1344270 res!891519) b!1344266))

(assert (= (and b!1344266 res!891526) b!1344272))

(assert (= (and b!1344272 res!891527) b!1344274))

(assert (= (and b!1344274 res!891522) b!1344271))

(assert (= (and b!1344271 res!891523) b!1344273))

(assert (= (and b!1344273 res!891525) b!1344275))

(assert (= (and b!1344275 res!891520) b!1344277))

(assert (= (and b!1344269 condMapEmpty!57607) mapIsEmpty!57607))

(assert (= (and b!1344269 (not condMapEmpty!57607)) mapNonEmpty!57607))

(get-info :version)

(assert (= (and mapNonEmpty!57607 ((_ is ValueCellFull!17735) mapValue!57607)) b!1344268))

(assert (= (and b!1344269 ((_ is ValueCellFull!17735) mapDefault!57607)) b!1344276))

(assert (= start!113440 b!1344269))

(declare-fun b_lambda!24437 () Bool)

(assert (=> (not b_lambda!24437) (not b!1344277)))

(declare-fun t!45766 () Bool)

(declare-fun tb!12273 () Bool)

(assert (=> (and start!113440 (= defaultEntry!1306 defaultEntry!1306) t!45766) tb!12273))

(declare-fun result!25645 () Bool)

(assert (=> tb!12273 (= result!25645 tp_is_empty!37267)))

(assert (=> b!1344277 t!45766))

(declare-fun b_and!50445 () Bool)

(assert (= b_and!50443 (and (=> t!45766 result!25645) b_and!50445)))

(declare-fun m!1232205 () Bool)

(assert (=> mapNonEmpty!57607 m!1232205))

(declare-fun m!1232207 () Bool)

(assert (=> start!113440 m!1232207))

(declare-fun m!1232209 () Bool)

(assert (=> start!113440 m!1232209))

(declare-fun m!1232211 () Bool)

(assert (=> start!113440 m!1232211))

(declare-fun m!1232213 () Bool)

(assert (=> b!1344266 m!1232213))

(declare-fun m!1232215 () Bool)

(assert (=> b!1344277 m!1232215))

(declare-fun m!1232217 () Bool)

(assert (=> b!1344277 m!1232217))

(declare-fun m!1232219 () Bool)

(assert (=> b!1344277 m!1232219))

(declare-fun m!1232221 () Bool)

(assert (=> b!1344277 m!1232221))

(declare-fun m!1232223 () Bool)

(assert (=> b!1344277 m!1232223))

(assert (=> b!1344277 m!1232219))

(declare-fun m!1232225 () Bool)

(assert (=> b!1344277 m!1232225))

(declare-fun m!1232227 () Bool)

(assert (=> b!1344277 m!1232227))

(declare-fun m!1232229 () Bool)

(assert (=> b!1344277 m!1232229))

(assert (=> b!1344277 m!1232221))

(declare-fun m!1232231 () Bool)

(assert (=> b!1344277 m!1232231))

(declare-fun m!1232233 () Bool)

(assert (=> b!1344277 m!1232233))

(declare-fun m!1232235 () Bool)

(assert (=> b!1344277 m!1232235))

(assert (=> b!1344277 m!1232215))

(declare-fun m!1232237 () Bool)

(assert (=> b!1344277 m!1232237))

(declare-fun m!1232239 () Bool)

(assert (=> b!1344277 m!1232239))

(assert (=> b!1344277 m!1232233))

(assert (=> b!1344271 m!1232233))

(declare-fun m!1232241 () Bool)

(assert (=> b!1344274 m!1232241))

(assert (=> b!1344274 m!1232241))

(declare-fun m!1232243 () Bool)

(assert (=> b!1344274 m!1232243))

(assert (=> b!1344273 m!1232233))

(assert (=> b!1344273 m!1232233))

(declare-fun m!1232245 () Bool)

(assert (=> b!1344273 m!1232245))

(declare-fun m!1232247 () Bool)

(assert (=> b!1344270 m!1232247))

(check-sat (not b!1344270) (not b!1344273) (not b!1344266) (not b_next!31267) (not b!1344274) (not start!113440) b_and!50445 tp_is_empty!37267 (not b!1344277) (not b_lambda!24437) (not mapNonEmpty!57607))
(check-sat b_and!50445 (not b_next!31267))
