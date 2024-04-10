; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111920 () Bool)

(assert start!111920)

(declare-fun b_free!30519 () Bool)

(declare-fun b_next!30519 () Bool)

(assert (=> start!111920 (= b_free!30519 (not b_next!30519))))

(declare-fun tp!107037 () Bool)

(declare-fun b_and!49133 () Bool)

(assert (=> start!111920 (= tp!107037 b_and!49133)))

(declare-fun mapNonEmpty!56160 () Bool)

(declare-fun mapRes!56160 () Bool)

(declare-fun tp!107036 () Bool)

(declare-fun e!755989 () Bool)

(assert (=> mapNonEmpty!56160 (= mapRes!56160 (and tp!107036 e!755989))))

(declare-datatypes ((V!53555 0))(
  ( (V!53556 (val!18244 Int)) )
))
(declare-datatypes ((ValueCell!17271 0))(
  ( (ValueCellFull!17271 (v!20877 V!53555)) (EmptyCell!17271) )
))
(declare-fun mapRest!56160 () (Array (_ BitVec 32) ValueCell!17271))

(declare-datatypes ((array!89584 0))(
  ( (array!89585 (arr!43265 (Array (_ BitVec 32) ValueCell!17271)) (size!43815 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89584)

(declare-fun mapKey!56160 () (_ BitVec 32))

(declare-fun mapValue!56160 () ValueCell!17271)

(assert (=> mapNonEmpty!56160 (= (arr!43265 _values!1337) (store mapRest!56160 mapKey!56160 mapValue!56160))))

(declare-fun b!1326363 () Bool)

(declare-fun tp_is_empty!36339 () Bool)

(assert (=> b!1326363 (= e!755989 tp_is_empty!36339)))

(declare-fun b!1326364 () Bool)

(declare-fun res!880305 () Bool)

(declare-fun e!755990 () Bool)

(assert (=> b!1326364 (=> (not res!880305) (not e!755990))))

(declare-datatypes ((array!89586 0))(
  ( (array!89587 (arr!43266 (Array (_ BitVec 32) (_ BitVec 64))) (size!43816 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89586)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326364 (= res!880305 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43816 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326365 () Bool)

(declare-fun res!880310 () Bool)

(assert (=> b!1326365 (=> (not res!880310) (not e!755990))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326365 (= res!880310 (and (= (size!43815 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43816 _keys!1609) (size!43815 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326366 () Bool)

(declare-fun res!880311 () Bool)

(assert (=> b!1326366 (=> (not res!880311) (not e!755990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326366 (= res!880311 (validKeyInArray!0 (select (arr!43266 _keys!1609) from!2000)))))

(declare-fun b!1326367 () Bool)

(declare-fun res!880308 () Bool)

(assert (=> b!1326367 (=> (not res!880308) (not e!755990))))

(declare-fun zeroValue!1279 () V!53555)

(declare-fun minValue!1279 () V!53555)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23540 0))(
  ( (tuple2!23541 (_1!11781 (_ BitVec 64)) (_2!11781 V!53555)) )
))
(declare-datatypes ((List!30675 0))(
  ( (Nil!30672) (Cons!30671 (h!31880 tuple2!23540) (t!44665 List!30675)) )
))
(declare-datatypes ((ListLongMap!21197 0))(
  ( (ListLongMap!21198 (toList!10614 List!30675)) )
))
(declare-fun contains!8771 (ListLongMap!21197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5605 (array!89586 array!89584 (_ BitVec 32) (_ BitVec 32) V!53555 V!53555 (_ BitVec 32) Int) ListLongMap!21197)

(assert (=> b!1326367 (= res!880308 (contains!8771 (getCurrentListMap!5605 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!880309 () Bool)

(assert (=> start!111920 (=> (not res!880309) (not e!755990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111920 (= res!880309 (validMask!0 mask!2019))))

(assert (=> start!111920 e!755990))

(declare-fun array_inv!32659 (array!89586) Bool)

(assert (=> start!111920 (array_inv!32659 _keys!1609)))

(assert (=> start!111920 true))

(assert (=> start!111920 tp_is_empty!36339))

(declare-fun e!755992 () Bool)

(declare-fun array_inv!32660 (array!89584) Bool)

(assert (=> start!111920 (and (array_inv!32660 _values!1337) e!755992)))

(assert (=> start!111920 tp!107037))

(declare-fun b!1326368 () Bool)

(declare-fun res!880306 () Bool)

(assert (=> b!1326368 (=> (not res!880306) (not e!755990))))

(declare-datatypes ((List!30676 0))(
  ( (Nil!30673) (Cons!30672 (h!31881 (_ BitVec 64)) (t!44666 List!30676)) )
))
(declare-fun arrayNoDuplicates!0 (array!89586 (_ BitVec 32) List!30676) Bool)

(assert (=> b!1326368 (= res!880306 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30673))))

(declare-fun b!1326369 () Bool)

(assert (=> b!1326369 (= e!755990 (not true))))

(declare-fun lt!590037 () ListLongMap!21197)

(assert (=> b!1326369 (contains!8771 lt!590037 k0!1164)))

(declare-fun lt!590039 () V!53555)

(declare-datatypes ((Unit!43698 0))(
  ( (Unit!43699) )
))
(declare-fun lt!590042 () Unit!43698)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!227 ((_ BitVec 64) (_ BitVec 64) V!53555 ListLongMap!21197) Unit!43698)

(assert (=> b!1326369 (= lt!590042 (lemmaInListMapAfterAddingDiffThenInBefore!227 k0!1164 (select (arr!43266 _keys!1609) from!2000) lt!590039 lt!590037))))

(declare-fun lt!590043 () ListLongMap!21197)

(assert (=> b!1326369 (contains!8771 lt!590043 k0!1164)))

(declare-fun lt!590041 () Unit!43698)

(assert (=> b!1326369 (= lt!590041 (lemmaInListMapAfterAddingDiffThenInBefore!227 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590043))))

(declare-fun lt!590040 () ListLongMap!21197)

(assert (=> b!1326369 (contains!8771 lt!590040 k0!1164)))

(declare-fun lt!590038 () Unit!43698)

(assert (=> b!1326369 (= lt!590038 (lemmaInListMapAfterAddingDiffThenInBefore!227 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590040))))

(declare-fun +!4635 (ListLongMap!21197 tuple2!23540) ListLongMap!21197)

(assert (=> b!1326369 (= lt!590040 (+!4635 lt!590043 (tuple2!23541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1326369 (= lt!590043 (+!4635 lt!590037 (tuple2!23541 (select (arr!43266 _keys!1609) from!2000) lt!590039)))))

(declare-fun get!21802 (ValueCell!17271 V!53555) V!53555)

(declare-fun dynLambda!3574 (Int (_ BitVec 64)) V!53555)

(assert (=> b!1326369 (= lt!590039 (get!21802 (select (arr!43265 _values!1337) from!2000) (dynLambda!3574 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6273 (array!89586 array!89584 (_ BitVec 32) (_ BitVec 32) V!53555 V!53555 (_ BitVec 32) Int) ListLongMap!21197)

(assert (=> b!1326369 (= lt!590037 (getCurrentListMapNoExtraKeys!6273 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326370 () Bool)

(declare-fun res!880312 () Bool)

(assert (=> b!1326370 (=> (not res!880312) (not e!755990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89586 (_ BitVec 32)) Bool)

(assert (=> b!1326370 (= res!880312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326371 () Bool)

(declare-fun e!755991 () Bool)

(assert (=> b!1326371 (= e!755991 tp_is_empty!36339)))

(declare-fun b!1326372 () Bool)

(declare-fun res!880307 () Bool)

(assert (=> b!1326372 (=> (not res!880307) (not e!755990))))

(assert (=> b!1326372 (= res!880307 (not (= (select (arr!43266 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!56160 () Bool)

(assert (=> mapIsEmpty!56160 mapRes!56160))

(declare-fun b!1326373 () Bool)

(assert (=> b!1326373 (= e!755992 (and e!755991 mapRes!56160))))

(declare-fun condMapEmpty!56160 () Bool)

(declare-fun mapDefault!56160 () ValueCell!17271)

(assert (=> b!1326373 (= condMapEmpty!56160 (= (arr!43265 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17271)) mapDefault!56160)))))

(assert (= (and start!111920 res!880309) b!1326365))

(assert (= (and b!1326365 res!880310) b!1326370))

(assert (= (and b!1326370 res!880312) b!1326368))

(assert (= (and b!1326368 res!880306) b!1326364))

(assert (= (and b!1326364 res!880305) b!1326367))

(assert (= (and b!1326367 res!880308) b!1326372))

(assert (= (and b!1326372 res!880307) b!1326366))

(assert (= (and b!1326366 res!880311) b!1326369))

(assert (= (and b!1326373 condMapEmpty!56160) mapIsEmpty!56160))

(assert (= (and b!1326373 (not condMapEmpty!56160)) mapNonEmpty!56160))

(get-info :version)

(assert (= (and mapNonEmpty!56160 ((_ is ValueCellFull!17271) mapValue!56160)) b!1326363))

(assert (= (and b!1326373 ((_ is ValueCellFull!17271) mapDefault!56160)) b!1326371))

(assert (= start!111920 b!1326373))

(declare-fun b_lambda!23797 () Bool)

(assert (=> (not b_lambda!23797) (not b!1326369)))

(declare-fun t!44664 () Bool)

(declare-fun tb!11793 () Bool)

(assert (=> (and start!111920 (= defaultEntry!1340 defaultEntry!1340) t!44664) tb!11793))

(declare-fun result!24643 () Bool)

(assert (=> tb!11793 (= result!24643 tp_is_empty!36339)))

(assert (=> b!1326369 t!44664))

(declare-fun b_and!49135 () Bool)

(assert (= b_and!49133 (and (=> t!44664 result!24643) b_and!49135)))

(declare-fun m!1215333 () Bool)

(assert (=> b!1326366 m!1215333))

(assert (=> b!1326366 m!1215333))

(declare-fun m!1215335 () Bool)

(assert (=> b!1326366 m!1215335))

(declare-fun m!1215337 () Bool)

(assert (=> mapNonEmpty!56160 m!1215337))

(assert (=> b!1326372 m!1215333))

(declare-fun m!1215339 () Bool)

(assert (=> b!1326367 m!1215339))

(assert (=> b!1326367 m!1215339))

(declare-fun m!1215341 () Bool)

(assert (=> b!1326367 m!1215341))

(declare-fun m!1215343 () Bool)

(assert (=> start!111920 m!1215343))

(declare-fun m!1215345 () Bool)

(assert (=> start!111920 m!1215345))

(declare-fun m!1215347 () Bool)

(assert (=> start!111920 m!1215347))

(declare-fun m!1215349 () Bool)

(assert (=> b!1326370 m!1215349))

(declare-fun m!1215351 () Bool)

(assert (=> b!1326369 m!1215351))

(declare-fun m!1215353 () Bool)

(assert (=> b!1326369 m!1215353))

(assert (=> b!1326369 m!1215333))

(declare-fun m!1215355 () Bool)

(assert (=> b!1326369 m!1215355))

(declare-fun m!1215357 () Bool)

(assert (=> b!1326369 m!1215357))

(declare-fun m!1215359 () Bool)

(assert (=> b!1326369 m!1215359))

(declare-fun m!1215361 () Bool)

(assert (=> b!1326369 m!1215361))

(declare-fun m!1215363 () Bool)

(assert (=> b!1326369 m!1215363))

(declare-fun m!1215365 () Bool)

(assert (=> b!1326369 m!1215365))

(declare-fun m!1215367 () Bool)

(assert (=> b!1326369 m!1215367))

(declare-fun m!1215369 () Bool)

(assert (=> b!1326369 m!1215369))

(assert (=> b!1326369 m!1215333))

(assert (=> b!1326369 m!1215365))

(declare-fun m!1215371 () Bool)

(assert (=> b!1326369 m!1215371))

(assert (=> b!1326369 m!1215363))

(declare-fun m!1215373 () Bool)

(assert (=> b!1326369 m!1215373))

(declare-fun m!1215375 () Bool)

(assert (=> b!1326368 m!1215375))

(check-sat (not b!1326366) (not mapNonEmpty!56160) (not b_next!30519) (not b!1326368) (not b!1326369) tp_is_empty!36339 (not b!1326367) (not b_lambda!23797) (not start!111920) b_and!49135 (not b!1326370))
(check-sat b_and!49135 (not b_next!30519))
