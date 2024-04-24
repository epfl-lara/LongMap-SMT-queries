; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113392 () Bool)

(assert start!113392)

(declare-fun b_free!31219 () Bool)

(declare-fun b_next!31219 () Bool)

(assert (=> start!113392 (= b_free!31219 (not b_next!31219))))

(declare-fun tp!109461 () Bool)

(declare-fun b_and!50347 () Bool)

(assert (=> start!113392 (= tp!109461 b_and!50347)))

(declare-fun b!1343354 () Bool)

(declare-fun e!764966 () Bool)

(declare-fun tp_is_empty!37219 () Bool)

(assert (=> b!1343354 (= e!764966 tp_is_empty!37219)))

(declare-fun mapIsEmpty!57535 () Bool)

(declare-fun mapRes!57535 () Bool)

(assert (=> mapIsEmpty!57535 mapRes!57535))

(declare-fun b!1343355 () Bool)

(declare-fun e!764963 () Bool)

(assert (=> b!1343355 (= e!764963 (and e!764966 mapRes!57535))))

(declare-fun condMapEmpty!57535 () Bool)

(declare-datatypes ((V!54729 0))(
  ( (V!54730 (val!18684 Int)) )
))
(declare-datatypes ((ValueCell!17711 0))(
  ( (ValueCellFull!17711 (v!21327 V!54729)) (EmptyCell!17711) )
))
(declare-datatypes ((array!91407 0))(
  ( (array!91408 (arr!44155 (Array (_ BitVec 32) ValueCell!17711)) (size!44706 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91407)

(declare-fun mapDefault!57535 () ValueCell!17711)

(assert (=> b!1343355 (= condMapEmpty!57535 (= (arr!44155 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17711)) mapDefault!57535)))))

(declare-fun b!1343356 () Bool)

(declare-fun res!890879 () Bool)

(declare-fun e!764965 () Bool)

(assert (=> b!1343356 (=> (not res!890879) (not e!764965))))

(declare-datatypes ((array!91409 0))(
  ( (array!91410 (arr!44156 (Array (_ BitVec 32) (_ BitVec 64))) (size!44707 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91409)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343356 (= res!890879 (validKeyInArray!0 (select (arr!44156 _keys!1571) from!1960)))))

(declare-fun res!890876 () Bool)

(assert (=> start!113392 (=> (not res!890876) (not e!764965))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113392 (= res!890876 (validMask!0 mask!1977))))

(assert (=> start!113392 e!764965))

(assert (=> start!113392 tp_is_empty!37219))

(assert (=> start!113392 true))

(declare-fun array_inv!33557 (array!91409) Bool)

(assert (=> start!113392 (array_inv!33557 _keys!1571)))

(declare-fun array_inv!33558 (array!91407) Bool)

(assert (=> start!113392 (and (array_inv!33558 _values!1303) e!764963)))

(assert (=> start!113392 tp!109461))

(declare-fun b!1343357 () Bool)

(assert (=> b!1343357 (= e!764965 (not true))))

(declare-datatypes ((tuple2!24114 0))(
  ( (tuple2!24115 (_1!12068 (_ BitVec 64)) (_2!12068 V!54729)) )
))
(declare-datatypes ((List!31265 0))(
  ( (Nil!31262) (Cons!31261 (h!32479 tuple2!24114) (t!45687 List!31265)) )
))
(declare-datatypes ((ListLongMap!21779 0))(
  ( (ListLongMap!21780 (toList!10905 List!31265)) )
))
(declare-fun lt!594809 () ListLongMap!21779)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9093 (ListLongMap!21779 (_ BitVec 64)) Bool)

(assert (=> b!1343357 (contains!9093 lt!594809 k0!1142)))

(declare-datatypes ((Unit!43984 0))(
  ( (Unit!43985) )
))
(declare-fun lt!594808 () Unit!43984)

(declare-fun lt!594806 () V!54729)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!348 ((_ BitVec 64) (_ BitVec 64) V!54729 ListLongMap!21779) Unit!43984)

(assert (=> b!1343357 (= lt!594808 (lemmaInListMapAfterAddingDiffThenInBefore!348 k0!1142 (select (arr!44156 _keys!1571) from!1960) lt!594806 lt!594809))))

(declare-fun lt!594805 () ListLongMap!21779)

(assert (=> b!1343357 (contains!9093 lt!594805 k0!1142)))

(declare-fun zeroValue!1245 () V!54729)

(declare-fun lt!594807 () Unit!43984)

(assert (=> b!1343357 (= lt!594807 (lemmaInListMapAfterAddingDiffThenInBefore!348 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594805))))

(declare-fun +!4822 (ListLongMap!21779 tuple2!24114) ListLongMap!21779)

(assert (=> b!1343357 (= lt!594805 (+!4822 lt!594809 (tuple2!24115 (select (arr!44156 _keys!1571) from!1960) lt!594806)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22304 (ValueCell!17711 V!54729) V!54729)

(declare-fun dynLambda!3776 (Int (_ BitVec 64)) V!54729)

(assert (=> b!1343357 (= lt!594806 (get!22304 (select (arr!44155 _values!1303) from!1960) (dynLambda!3776 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54729)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6471 (array!91409 array!91407 (_ BitVec 32) (_ BitVec 32) V!54729 V!54729 (_ BitVec 32) Int) ListLongMap!21779)

(assert (=> b!1343357 (= lt!594809 (getCurrentListMapNoExtraKeys!6471 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343358 () Bool)

(declare-fun res!890875 () Bool)

(assert (=> b!1343358 (=> (not res!890875) (not e!764965))))

(assert (=> b!1343358 (= res!890875 (not (= (select (arr!44156 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343359 () Bool)

(declare-fun res!890878 () Bool)

(assert (=> b!1343359 (=> (not res!890878) (not e!764965))))

(assert (=> b!1343359 (= res!890878 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44707 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343360 () Bool)

(declare-fun e!764964 () Bool)

(assert (=> b!1343360 (= e!764964 tp_is_empty!37219)))

(declare-fun b!1343361 () Bool)

(declare-fun res!890872 () Bool)

(assert (=> b!1343361 (=> (not res!890872) (not e!764965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91409 (_ BitVec 32)) Bool)

(assert (=> b!1343361 (= res!890872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343362 () Bool)

(declare-fun res!890873 () Bool)

(assert (=> b!1343362 (=> (not res!890873) (not e!764965))))

(assert (=> b!1343362 (= res!890873 (and (= (size!44706 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44707 _keys!1571) (size!44706 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343363 () Bool)

(declare-fun res!890874 () Bool)

(assert (=> b!1343363 (=> (not res!890874) (not e!764965))))

(declare-datatypes ((List!31266 0))(
  ( (Nil!31263) (Cons!31262 (h!32480 (_ BitVec 64)) (t!45688 List!31266)) )
))
(declare-fun arrayNoDuplicates!0 (array!91409 (_ BitVec 32) List!31266) Bool)

(assert (=> b!1343363 (= res!890874 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31263))))

(declare-fun b!1343364 () Bool)

(declare-fun res!890877 () Bool)

(assert (=> b!1343364 (=> (not res!890877) (not e!764965))))

(assert (=> b!1343364 (= res!890877 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57535 () Bool)

(declare-fun tp!109462 () Bool)

(assert (=> mapNonEmpty!57535 (= mapRes!57535 (and tp!109462 e!764964))))

(declare-fun mapValue!57535 () ValueCell!17711)

(declare-fun mapRest!57535 () (Array (_ BitVec 32) ValueCell!17711))

(declare-fun mapKey!57535 () (_ BitVec 32))

(assert (=> mapNonEmpty!57535 (= (arr!44155 _values!1303) (store mapRest!57535 mapKey!57535 mapValue!57535))))

(declare-fun b!1343365 () Bool)

(declare-fun res!890871 () Bool)

(assert (=> b!1343365 (=> (not res!890871) (not e!764965))))

(declare-fun getCurrentListMap!5853 (array!91409 array!91407 (_ BitVec 32) (_ BitVec 32) V!54729 V!54729 (_ BitVec 32) Int) ListLongMap!21779)

(assert (=> b!1343365 (= res!890871 (contains!9093 (getCurrentListMap!5853 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113392 res!890876) b!1343362))

(assert (= (and b!1343362 res!890873) b!1343361))

(assert (= (and b!1343361 res!890872) b!1343363))

(assert (= (and b!1343363 res!890874) b!1343359))

(assert (= (and b!1343359 res!890878) b!1343365))

(assert (= (and b!1343365 res!890871) b!1343358))

(assert (= (and b!1343358 res!890875) b!1343356))

(assert (= (and b!1343356 res!890879) b!1343364))

(assert (= (and b!1343364 res!890877) b!1343357))

(assert (= (and b!1343355 condMapEmpty!57535) mapIsEmpty!57535))

(assert (= (and b!1343355 (not condMapEmpty!57535)) mapNonEmpty!57535))

(get-info :version)

(assert (= (and mapNonEmpty!57535 ((_ is ValueCellFull!17711) mapValue!57535)) b!1343360))

(assert (= (and b!1343355 ((_ is ValueCellFull!17711) mapDefault!57535)) b!1343354))

(assert (= start!113392 b!1343355))

(declare-fun b_lambda!24389 () Bool)

(assert (=> (not b_lambda!24389) (not b!1343357)))

(declare-fun t!45686 () Bool)

(declare-fun tb!12225 () Bool)

(assert (=> (and start!113392 (= defaultEntry!1306 defaultEntry!1306) t!45686) tb!12225))

(declare-fun result!25549 () Bool)

(assert (=> tb!12225 (= result!25549 tp_is_empty!37219)))

(assert (=> b!1343357 t!45686))

(declare-fun b_and!50349 () Bool)

(assert (= b_and!50347 (and (=> t!45686 result!25549) b_and!50349)))

(declare-fun m!1231275 () Bool)

(assert (=> mapNonEmpty!57535 m!1231275))

(declare-fun m!1231277 () Bool)

(assert (=> b!1343365 m!1231277))

(assert (=> b!1343365 m!1231277))

(declare-fun m!1231279 () Bool)

(assert (=> b!1343365 m!1231279))

(declare-fun m!1231281 () Bool)

(assert (=> b!1343357 m!1231281))

(declare-fun m!1231283 () Bool)

(assert (=> b!1343357 m!1231283))

(declare-fun m!1231285 () Bool)

(assert (=> b!1343357 m!1231285))

(declare-fun m!1231287 () Bool)

(assert (=> b!1343357 m!1231287))

(assert (=> b!1343357 m!1231283))

(declare-fun m!1231289 () Bool)

(assert (=> b!1343357 m!1231289))

(assert (=> b!1343357 m!1231285))

(declare-fun m!1231291 () Bool)

(assert (=> b!1343357 m!1231291))

(declare-fun m!1231293 () Bool)

(assert (=> b!1343357 m!1231293))

(declare-fun m!1231295 () Bool)

(assert (=> b!1343357 m!1231295))

(declare-fun m!1231297 () Bool)

(assert (=> b!1343357 m!1231297))

(declare-fun m!1231299 () Bool)

(assert (=> b!1343357 m!1231299))

(assert (=> b!1343357 m!1231297))

(assert (=> b!1343358 m!1231297))

(declare-fun m!1231301 () Bool)

(assert (=> start!113392 m!1231301))

(declare-fun m!1231303 () Bool)

(assert (=> start!113392 m!1231303))

(declare-fun m!1231305 () Bool)

(assert (=> start!113392 m!1231305))

(assert (=> b!1343356 m!1231297))

(assert (=> b!1343356 m!1231297))

(declare-fun m!1231307 () Bool)

(assert (=> b!1343356 m!1231307))

(declare-fun m!1231309 () Bool)

(assert (=> b!1343361 m!1231309))

(declare-fun m!1231311 () Bool)

(assert (=> b!1343363 m!1231311))

(check-sat b_and!50349 (not b!1343361) (not mapNonEmpty!57535) (not start!113392) (not b!1343356) tp_is_empty!37219 (not b_next!31219) (not b!1343363) (not b!1343365) (not b!1343357) (not b_lambda!24389))
(check-sat b_and!50349 (not b_next!31219))
