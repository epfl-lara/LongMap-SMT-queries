; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113084 () Bool)

(assert start!113084)

(declare-fun b_free!31135 () Bool)

(declare-fun b_next!31135 () Bool)

(assert (=> start!113084 (= b_free!31135 (not b_next!31135))))

(declare-fun tp!109210 () Bool)

(declare-fun b_and!50159 () Bool)

(assert (=> start!113084 (= tp!109210 b_and!50159)))

(declare-fun b!1340389 () Bool)

(declare-fun res!889191 () Bool)

(declare-fun e!763458 () Bool)

(assert (=> b!1340389 (=> (not res!889191) (not e!763458))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91065 0))(
  ( (array!91066 (arr!43989 (Array (_ BitVec 32) (_ BitVec 64))) (size!44541 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91065)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340389 (= res!889191 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44541 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340390 () Bool)

(declare-fun res!889198 () Bool)

(assert (=> b!1340390 (=> (not res!889198) (not e!763458))))

(declare-datatypes ((List!31201 0))(
  ( (Nil!31198) (Cons!31197 (h!32406 (_ BitVec 64)) (t!45539 List!31201)) )
))
(declare-fun arrayNoDuplicates!0 (array!91065 (_ BitVec 32) List!31201) Bool)

(assert (=> b!1340390 (= res!889198 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31198))))

(declare-fun b!1340391 () Bool)

(declare-fun res!889197 () Bool)

(assert (=> b!1340391 (=> (not res!889197) (not e!763458))))

(assert (=> b!1340391 (= res!889197 (not (= (select (arr!43989 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340392 () Bool)

(declare-fun e!763460 () Bool)

(declare-fun tp_is_empty!37135 () Bool)

(assert (=> b!1340392 (= e!763460 tp_is_empty!37135)))

(declare-fun b!1340393 () Bool)

(declare-fun e!763459 () Bool)

(assert (=> b!1340393 (= e!763459 tp_is_empty!37135)))

(declare-fun b!1340394 () Bool)

(declare-fun res!889195 () Bool)

(assert (=> b!1340394 (=> (not res!889195) (not e!763458))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54617 0))(
  ( (V!54618 (val!18642 Int)) )
))
(declare-datatypes ((ValueCell!17669 0))(
  ( (ValueCellFull!17669 (v!21289 V!54617)) (EmptyCell!17669) )
))
(declare-datatypes ((array!91067 0))(
  ( (array!91068 (arr!43990 (Array (_ BitVec 32) ValueCell!17669)) (size!44542 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91067)

(assert (=> b!1340394 (= res!889195 (and (= (size!44542 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44541 _keys!1571) (size!44542 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889193 () Bool)

(assert (=> start!113084 (=> (not res!889193) (not e!763458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113084 (= res!889193 (validMask!0 mask!1977))))

(assert (=> start!113084 e!763458))

(assert (=> start!113084 tp_is_empty!37135))

(assert (=> start!113084 true))

(declare-fun array_inv!33357 (array!91065) Bool)

(assert (=> start!113084 (array_inv!33357 _keys!1571)))

(declare-fun e!763456 () Bool)

(declare-fun array_inv!33358 (array!91067) Bool)

(assert (=> start!113084 (and (array_inv!33358 _values!1303) e!763456)))

(assert (=> start!113084 tp!109210))

(declare-fun b!1340395 () Bool)

(declare-fun res!889192 () Bool)

(assert (=> b!1340395 (=> (not res!889192) (not e!763458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340395 (= res!889192 (validKeyInArray!0 (select (arr!43989 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57409 () Bool)

(declare-fun mapRes!57409 () Bool)

(declare-fun tp!109211 () Bool)

(assert (=> mapNonEmpty!57409 (= mapRes!57409 (and tp!109211 e!763460))))

(declare-fun mapValue!57409 () ValueCell!17669)

(declare-fun mapKey!57409 () (_ BitVec 32))

(declare-fun mapRest!57409 () (Array (_ BitVec 32) ValueCell!17669))

(assert (=> mapNonEmpty!57409 (= (arr!43990 _values!1303) (store mapRest!57409 mapKey!57409 mapValue!57409))))

(declare-fun b!1340396 () Bool)

(declare-fun res!889196 () Bool)

(assert (=> b!1340396 (=> (not res!889196) (not e!763458))))

(declare-fun minValue!1245 () V!54617)

(declare-fun zeroValue!1245 () V!54617)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24050 0))(
  ( (tuple2!24051 (_1!12036 (_ BitVec 64)) (_2!12036 V!54617)) )
))
(declare-datatypes ((List!31202 0))(
  ( (Nil!31199) (Cons!31198 (h!32407 tuple2!24050) (t!45540 List!31202)) )
))
(declare-datatypes ((ListLongMap!21707 0))(
  ( (ListLongMap!21708 (toList!10869 List!31202)) )
))
(declare-fun contains!8974 (ListLongMap!21707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5722 (array!91065 array!91067 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21707)

(assert (=> b!1340396 (= res!889196 (contains!8974 (getCurrentListMap!5722 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340397 () Bool)

(assert (=> b!1340397 (= e!763456 (and e!763459 mapRes!57409))))

(declare-fun condMapEmpty!57409 () Bool)

(declare-fun mapDefault!57409 () ValueCell!17669)

(assert (=> b!1340397 (= condMapEmpty!57409 (= (arr!43990 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17669)) mapDefault!57409)))))

(declare-fun b!1340398 () Bool)

(assert (=> b!1340398 (= e!763458 (not true))))

(declare-fun lt!593805 () ListLongMap!21707)

(assert (=> b!1340398 (contains!8974 lt!593805 k0!1142)))

(declare-datatypes ((Unit!43796 0))(
  ( (Unit!43797) )
))
(declare-fun lt!593804 () Unit!43796)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!316 ((_ BitVec 64) (_ BitVec 64) V!54617 ListLongMap!21707) Unit!43796)

(assert (=> b!1340398 (= lt!593804 (lemmaInListMapAfterAddingDiffThenInBefore!316 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593805))))

(declare-fun +!4777 (ListLongMap!21707 tuple2!24050) ListLongMap!21707)

(declare-fun getCurrentListMapNoExtraKeys!6420 (array!91065 array!91067 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21707)

(declare-fun get!22195 (ValueCell!17669 V!54617) V!54617)

(declare-fun dynLambda!3707 (Int (_ BitVec 64)) V!54617)

(assert (=> b!1340398 (= lt!593805 (+!4777 (getCurrentListMapNoExtraKeys!6420 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24051 (select (arr!43989 _keys!1571) from!1960) (get!22195 (select (arr!43990 _values!1303) from!1960) (dynLambda!3707 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340399 () Bool)

(declare-fun res!889194 () Bool)

(assert (=> b!1340399 (=> (not res!889194) (not e!763458))))

(assert (=> b!1340399 (= res!889194 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340400 () Bool)

(declare-fun res!889190 () Bool)

(assert (=> b!1340400 (=> (not res!889190) (not e!763458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91065 (_ BitVec 32)) Bool)

(assert (=> b!1340400 (= res!889190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57409 () Bool)

(assert (=> mapIsEmpty!57409 mapRes!57409))

(assert (= (and start!113084 res!889193) b!1340394))

(assert (= (and b!1340394 res!889195) b!1340400))

(assert (= (and b!1340400 res!889190) b!1340390))

(assert (= (and b!1340390 res!889198) b!1340389))

(assert (= (and b!1340389 res!889191) b!1340396))

(assert (= (and b!1340396 res!889196) b!1340391))

(assert (= (and b!1340391 res!889197) b!1340395))

(assert (= (and b!1340395 res!889192) b!1340399))

(assert (= (and b!1340399 res!889194) b!1340398))

(assert (= (and b!1340397 condMapEmpty!57409) mapIsEmpty!57409))

(assert (= (and b!1340397 (not condMapEmpty!57409)) mapNonEmpty!57409))

(get-info :version)

(assert (= (and mapNonEmpty!57409 ((_ is ValueCellFull!17669) mapValue!57409)) b!1340392))

(assert (= (and b!1340397 ((_ is ValueCellFull!17669) mapDefault!57409)) b!1340393))

(assert (= start!113084 b!1340397))

(declare-fun b_lambda!24301 () Bool)

(assert (=> (not b_lambda!24301) (not b!1340398)))

(declare-fun t!45538 () Bool)

(declare-fun tb!12141 () Bool)

(assert (=> (and start!113084 (= defaultEntry!1306 defaultEntry!1306) t!45538) tb!12141))

(declare-fun result!25381 () Bool)

(assert (=> tb!12141 (= result!25381 tp_is_empty!37135)))

(assert (=> b!1340398 t!45538))

(declare-fun b_and!50161 () Bool)

(assert (= b_and!50159 (and (=> t!45538 result!25381) b_and!50161)))

(declare-fun m!1227697 () Bool)

(assert (=> b!1340398 m!1227697))

(declare-fun m!1227699 () Bool)

(assert (=> b!1340398 m!1227699))

(declare-fun m!1227701 () Bool)

(assert (=> b!1340398 m!1227701))

(declare-fun m!1227703 () Bool)

(assert (=> b!1340398 m!1227703))

(assert (=> b!1340398 m!1227697))

(declare-fun m!1227705 () Bool)

(assert (=> b!1340398 m!1227705))

(assert (=> b!1340398 m!1227699))

(declare-fun m!1227707 () Bool)

(assert (=> b!1340398 m!1227707))

(declare-fun m!1227709 () Bool)

(assert (=> b!1340398 m!1227709))

(assert (=> b!1340398 m!1227701))

(declare-fun m!1227711 () Bool)

(assert (=> b!1340398 m!1227711))

(declare-fun m!1227713 () Bool)

(assert (=> b!1340400 m!1227713))

(assert (=> b!1340395 m!1227711))

(assert (=> b!1340395 m!1227711))

(declare-fun m!1227715 () Bool)

(assert (=> b!1340395 m!1227715))

(declare-fun m!1227717 () Bool)

(assert (=> b!1340396 m!1227717))

(assert (=> b!1340396 m!1227717))

(declare-fun m!1227719 () Bool)

(assert (=> b!1340396 m!1227719))

(declare-fun m!1227721 () Bool)

(assert (=> mapNonEmpty!57409 m!1227721))

(declare-fun m!1227723 () Bool)

(assert (=> start!113084 m!1227723))

(declare-fun m!1227725 () Bool)

(assert (=> start!113084 m!1227725))

(declare-fun m!1227727 () Bool)

(assert (=> start!113084 m!1227727))

(declare-fun m!1227729 () Bool)

(assert (=> b!1340390 m!1227729))

(assert (=> b!1340391 m!1227711))

(check-sat (not start!113084) (not b!1340400) (not b!1340395) (not b!1340396) (not b!1340390) (not b!1340398) (not b_lambda!24301) (not b_next!31135) tp_is_empty!37135 (not mapNonEmpty!57409) b_and!50161)
(check-sat b_and!50161 (not b_next!31135))
