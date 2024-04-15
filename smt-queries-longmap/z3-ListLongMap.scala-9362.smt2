; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111608 () Bool)

(assert start!111608)

(declare-fun b_free!30265 () Bool)

(declare-fun b_next!30265 () Bool)

(assert (=> start!111608 (= b_free!30265 (not b_next!30265))))

(declare-fun tp!106272 () Bool)

(declare-fun b_and!48671 () Bool)

(assert (=> start!111608 (= tp!106272 b_and!48671)))

(declare-fun b!1321785 () Bool)

(declare-fun res!877329 () Bool)

(declare-fun e!753793 () Bool)

(assert (=> b!1321785 (=> (not res!877329) (not e!753793))))

(declare-datatypes ((array!89023 0))(
  ( (array!89024 (arr!42986 (Array (_ BitVec 32) (_ BitVec 64))) (size!43538 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89023)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321785 (= res!877329 (validKeyInArray!0 (select (arr!42986 _keys!1609) from!2000)))))

(declare-fun b!1321786 () Bool)

(declare-fun e!753792 () Bool)

(declare-fun e!753796 () Bool)

(declare-fun mapRes!55775 () Bool)

(assert (=> b!1321786 (= e!753792 (and e!753796 mapRes!55775))))

(declare-fun condMapEmpty!55775 () Bool)

(declare-datatypes ((V!53217 0))(
  ( (V!53218 (val!18117 Int)) )
))
(declare-datatypes ((ValueCell!17144 0))(
  ( (ValueCellFull!17144 (v!20746 V!53217)) (EmptyCell!17144) )
))
(declare-datatypes ((array!89025 0))(
  ( (array!89026 (arr!42987 (Array (_ BitVec 32) ValueCell!17144)) (size!43539 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89025)

(declare-fun mapDefault!55775 () ValueCell!17144)

(assert (=> b!1321786 (= condMapEmpty!55775 (= (arr!42987 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17144)) mapDefault!55775)))))

(declare-fun b!1321787 () Bool)

(declare-fun res!877335 () Bool)

(assert (=> b!1321787 (=> (not res!877335) (not e!753793))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89023 (_ BitVec 32)) Bool)

(assert (=> b!1321787 (= res!877335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877333 () Bool)

(assert (=> start!111608 (=> (not res!877333) (not e!753793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111608 (= res!877333 (validMask!0 mask!2019))))

(assert (=> start!111608 e!753793))

(declare-fun array_inv!32635 (array!89023) Bool)

(assert (=> start!111608 (array_inv!32635 _keys!1609)))

(assert (=> start!111608 true))

(declare-fun tp_is_empty!36085 () Bool)

(assert (=> start!111608 tp_is_empty!36085))

(declare-fun array_inv!32636 (array!89025) Bool)

(assert (=> start!111608 (and (array_inv!32636 _values!1337) e!753792)))

(assert (=> start!111608 tp!106272))

(declare-fun mapIsEmpty!55775 () Bool)

(assert (=> mapIsEmpty!55775 mapRes!55775))

(declare-fun b!1321788 () Bool)

(declare-fun res!877334 () Bool)

(assert (=> b!1321788 (=> (not res!877334) (not e!753793))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321788 (= res!877334 (not (= (select (arr!42986 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321789 () Bool)

(assert (=> b!1321789 (= e!753793 (not true))))

(declare-datatypes ((tuple2!23414 0))(
  ( (tuple2!23415 (_1!11718 (_ BitVec 64)) (_2!11718 V!53217)) )
))
(declare-datatypes ((List!30548 0))(
  ( (Nil!30545) (Cons!30544 (h!31753 tuple2!23414) (t!44354 List!30548)) )
))
(declare-datatypes ((ListLongMap!21071 0))(
  ( (ListLongMap!21072 (toList!10551 List!30548)) )
))
(declare-fun lt!587535 () ListLongMap!21071)

(declare-fun lt!587531 () tuple2!23414)

(declare-fun contains!8634 (ListLongMap!21071 (_ BitVec 64)) Bool)

(declare-fun +!4593 (ListLongMap!21071 tuple2!23414) ListLongMap!21071)

(assert (=> b!1321789 (contains!8634 (+!4593 lt!587535 lt!587531) k0!1164)))

(declare-fun zeroValue!1279 () V!53217)

(declare-datatypes ((Unit!43369 0))(
  ( (Unit!43370) )
))
(declare-fun lt!587538 () Unit!43369)

(declare-fun addStillContains!1117 (ListLongMap!21071 (_ BitVec 64) V!53217 (_ BitVec 64)) Unit!43369)

(assert (=> b!1321789 (= lt!587538 (addStillContains!1117 lt!587535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1321789 (contains!8634 lt!587535 k0!1164)))

(declare-fun lt!587534 () Unit!43369)

(declare-fun lt!587537 () V!53217)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!158 ((_ BitVec 64) (_ BitVec 64) V!53217 ListLongMap!21071) Unit!43369)

(assert (=> b!1321789 (= lt!587534 (lemmaInListMapAfterAddingDiffThenInBefore!158 k0!1164 (select (arr!42986 _keys!1609) from!2000) lt!587537 lt!587535))))

(declare-fun lt!587532 () ListLongMap!21071)

(assert (=> b!1321789 (contains!8634 lt!587532 k0!1164)))

(declare-fun lt!587533 () Unit!43369)

(assert (=> b!1321789 (= lt!587533 (lemmaInListMapAfterAddingDiffThenInBefore!158 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587532))))

(declare-fun lt!587530 () ListLongMap!21071)

(assert (=> b!1321789 (contains!8634 lt!587530 k0!1164)))

(declare-fun minValue!1279 () V!53217)

(declare-fun lt!587536 () Unit!43369)

(assert (=> b!1321789 (= lt!587536 (lemmaInListMapAfterAddingDiffThenInBefore!158 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587530))))

(assert (=> b!1321789 (= lt!587530 (+!4593 lt!587532 lt!587531))))

(assert (=> b!1321789 (= lt!587531 (tuple2!23415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1321789 (= lt!587532 (+!4593 lt!587535 (tuple2!23415 (select (arr!42986 _keys!1609) from!2000) lt!587537)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21640 (ValueCell!17144 V!53217) V!53217)

(declare-fun dynLambda!3523 (Int (_ BitVec 64)) V!53217)

(assert (=> b!1321789 (= lt!587537 (get!21640 (select (arr!42987 _values!1337) from!2000) (dynLambda!3523 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6226 (array!89023 array!89025 (_ BitVec 32) (_ BitVec 32) V!53217 V!53217 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1321789 (= lt!587535 (getCurrentListMapNoExtraKeys!6226 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321790 () Bool)

(declare-fun res!877332 () Bool)

(assert (=> b!1321790 (=> (not res!877332) (not e!753793))))

(declare-fun getCurrentListMap!5436 (array!89023 array!89025 (_ BitVec 32) (_ BitVec 32) V!53217 V!53217 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1321790 (= res!877332 (contains!8634 (getCurrentListMap!5436 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321791 () Bool)

(declare-fun res!877330 () Bool)

(assert (=> b!1321791 (=> (not res!877330) (not e!753793))))

(declare-datatypes ((List!30549 0))(
  ( (Nil!30546) (Cons!30545 (h!31754 (_ BitVec 64)) (t!44355 List!30549)) )
))
(declare-fun arrayNoDuplicates!0 (array!89023 (_ BitVec 32) List!30549) Bool)

(assert (=> b!1321791 (= res!877330 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30546))))

(declare-fun b!1321792 () Bool)

(declare-fun e!753794 () Bool)

(assert (=> b!1321792 (= e!753794 tp_is_empty!36085)))

(declare-fun b!1321793 () Bool)

(declare-fun res!877328 () Bool)

(assert (=> b!1321793 (=> (not res!877328) (not e!753793))))

(assert (=> b!1321793 (= res!877328 (and (= (size!43539 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43538 _keys!1609) (size!43539 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321794 () Bool)

(declare-fun res!877331 () Bool)

(assert (=> b!1321794 (=> (not res!877331) (not e!753793))))

(assert (=> b!1321794 (= res!877331 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43538 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321795 () Bool)

(assert (=> b!1321795 (= e!753796 tp_is_empty!36085)))

(declare-fun mapNonEmpty!55775 () Bool)

(declare-fun tp!106271 () Bool)

(assert (=> mapNonEmpty!55775 (= mapRes!55775 (and tp!106271 e!753794))))

(declare-fun mapValue!55775 () ValueCell!17144)

(declare-fun mapRest!55775 () (Array (_ BitVec 32) ValueCell!17144))

(declare-fun mapKey!55775 () (_ BitVec 32))

(assert (=> mapNonEmpty!55775 (= (arr!42987 _values!1337) (store mapRest!55775 mapKey!55775 mapValue!55775))))

(assert (= (and start!111608 res!877333) b!1321793))

(assert (= (and b!1321793 res!877328) b!1321787))

(assert (= (and b!1321787 res!877335) b!1321791))

(assert (= (and b!1321791 res!877330) b!1321794))

(assert (= (and b!1321794 res!877331) b!1321790))

(assert (= (and b!1321790 res!877332) b!1321788))

(assert (= (and b!1321788 res!877334) b!1321785))

(assert (= (and b!1321785 res!877329) b!1321789))

(assert (= (and b!1321786 condMapEmpty!55775) mapIsEmpty!55775))

(assert (= (and b!1321786 (not condMapEmpty!55775)) mapNonEmpty!55775))

(get-info :version)

(assert (= (and mapNonEmpty!55775 ((_ is ValueCellFull!17144) mapValue!55775)) b!1321792))

(assert (= (and b!1321786 ((_ is ValueCellFull!17144) mapDefault!55775)) b!1321795))

(assert (= start!111608 b!1321786))

(declare-fun b_lambda!23581 () Bool)

(assert (=> (not b_lambda!23581) (not b!1321789)))

(declare-fun t!44353 () Bool)

(declare-fun tb!11609 () Bool)

(assert (=> (and start!111608 (= defaultEntry!1340 defaultEntry!1340) t!44353) tb!11609))

(declare-fun result!24281 () Bool)

(assert (=> tb!11609 (= result!24281 tp_is_empty!36085)))

(assert (=> b!1321789 t!44353))

(declare-fun b_and!48673 () Bool)

(assert (= b_and!48671 (and (=> t!44353 result!24281) b_and!48673)))

(declare-fun m!1209375 () Bool)

(assert (=> b!1321785 m!1209375))

(assert (=> b!1321785 m!1209375))

(declare-fun m!1209377 () Bool)

(assert (=> b!1321785 m!1209377))

(declare-fun m!1209379 () Bool)

(assert (=> b!1321787 m!1209379))

(declare-fun m!1209381 () Bool)

(assert (=> b!1321791 m!1209381))

(declare-fun m!1209383 () Bool)

(assert (=> b!1321789 m!1209383))

(declare-fun m!1209385 () Bool)

(assert (=> b!1321789 m!1209385))

(declare-fun m!1209387 () Bool)

(assert (=> b!1321789 m!1209387))

(declare-fun m!1209389 () Bool)

(assert (=> b!1321789 m!1209389))

(declare-fun m!1209391 () Bool)

(assert (=> b!1321789 m!1209391))

(declare-fun m!1209393 () Bool)

(assert (=> b!1321789 m!1209393))

(declare-fun m!1209395 () Bool)

(assert (=> b!1321789 m!1209395))

(declare-fun m!1209397 () Bool)

(assert (=> b!1321789 m!1209397))

(assert (=> b!1321789 m!1209375))

(assert (=> b!1321789 m!1209389))

(declare-fun m!1209399 () Bool)

(assert (=> b!1321789 m!1209399))

(declare-fun m!1209401 () Bool)

(assert (=> b!1321789 m!1209401))

(declare-fun m!1209403 () Bool)

(assert (=> b!1321789 m!1209403))

(assert (=> b!1321789 m!1209395))

(assert (=> b!1321789 m!1209375))

(declare-fun m!1209405 () Bool)

(assert (=> b!1321789 m!1209405))

(declare-fun m!1209407 () Bool)

(assert (=> b!1321789 m!1209407))

(declare-fun m!1209409 () Bool)

(assert (=> b!1321789 m!1209409))

(assert (=> b!1321789 m!1209393))

(declare-fun m!1209411 () Bool)

(assert (=> b!1321789 m!1209411))

(declare-fun m!1209413 () Bool)

(assert (=> mapNonEmpty!55775 m!1209413))

(assert (=> b!1321788 m!1209375))

(declare-fun m!1209415 () Bool)

(assert (=> b!1321790 m!1209415))

(assert (=> b!1321790 m!1209415))

(declare-fun m!1209417 () Bool)

(assert (=> b!1321790 m!1209417))

(declare-fun m!1209419 () Bool)

(assert (=> start!111608 m!1209419))

(declare-fun m!1209421 () Bool)

(assert (=> start!111608 m!1209421))

(declare-fun m!1209423 () Bool)

(assert (=> start!111608 m!1209423))

(check-sat (not b_lambda!23581) tp_is_empty!36085 (not b!1321789) (not b_next!30265) (not b!1321787) (not b!1321785) (not mapNonEmpty!55775) (not b!1321791) b_and!48673 (not start!111608) (not b!1321790))
(check-sat b_and!48673 (not b_next!30265))
