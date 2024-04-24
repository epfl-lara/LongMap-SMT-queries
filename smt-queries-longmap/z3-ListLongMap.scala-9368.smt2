; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111868 () Bool)

(assert start!111868)

(declare-fun b_free!30301 () Bool)

(declare-fun b_next!30301 () Bool)

(assert (=> start!111868 (= b_free!30301 (not b_next!30301))))

(declare-fun tp!106378 () Bool)

(declare-fun b_and!48763 () Bool)

(assert (=> start!111868 (= tp!106378 b_and!48763)))

(declare-fun b!1323784 () Bool)

(declare-fun e!754941 () Bool)

(declare-fun e!754938 () Bool)

(declare-fun mapRes!55829 () Bool)

(assert (=> b!1323784 (= e!754941 (and e!754938 mapRes!55829))))

(declare-fun condMapEmpty!55829 () Bool)

(declare-datatypes ((V!53265 0))(
  ( (V!53266 (val!18135 Int)) )
))
(declare-datatypes ((ValueCell!17162 0))(
  ( (ValueCellFull!17162 (v!20760 V!53265)) (EmptyCell!17162) )
))
(declare-datatypes ((array!89247 0))(
  ( (array!89248 (arr!43093 (Array (_ BitVec 32) ValueCell!17162)) (size!43644 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89247)

(declare-fun mapDefault!55829 () ValueCell!17162)

(assert (=> b!1323784 (= condMapEmpty!55829 (= (arr!43093 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17162)) mapDefault!55829)))))

(declare-fun b!1323785 () Bool)

(declare-fun res!878310 () Bool)

(declare-fun e!754939 () Bool)

(assert (=> b!1323785 (=> (not res!878310) (not e!754939))))

(declare-datatypes ((array!89249 0))(
  ( (array!89250 (arr!43094 (Array (_ BitVec 32) (_ BitVec 64))) (size!43645 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89249)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323785 (= res!878310 (validKeyInArray!0 (select (arr!43094 _keys!1609) from!2000)))))

(declare-fun b!1323786 () Bool)

(declare-fun res!878311 () Bool)

(assert (=> b!1323786 (=> (not res!878311) (not e!754939))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89249 (_ BitVec 32)) Bool)

(assert (=> b!1323786 (= res!878311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323787 () Bool)

(declare-fun res!878312 () Bool)

(assert (=> b!1323787 (=> (not res!878312) (not e!754939))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323787 (= res!878312 (and (= (size!43644 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43645 _keys!1609) (size!43644 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55829 () Bool)

(assert (=> mapIsEmpty!55829 mapRes!55829))

(declare-fun b!1323789 () Bool)

(declare-fun res!878314 () Bool)

(assert (=> b!1323789 (=> (not res!878314) (not e!754939))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323789 (= res!878314 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43645 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55829 () Bool)

(declare-fun tp!106379 () Bool)

(declare-fun e!754942 () Bool)

(assert (=> mapNonEmpty!55829 (= mapRes!55829 (and tp!106379 e!754942))))

(declare-fun mapKey!55829 () (_ BitVec 32))

(declare-fun mapValue!55829 () ValueCell!17162)

(declare-fun mapRest!55829 () (Array (_ BitVec 32) ValueCell!17162))

(assert (=> mapNonEmpty!55829 (= (arr!43093 _values!1337) (store mapRest!55829 mapKey!55829 mapValue!55829))))

(declare-fun b!1323790 () Bool)

(declare-fun tp_is_empty!36121 () Bool)

(assert (=> b!1323790 (= e!754938 tp_is_empty!36121)))

(declare-fun b!1323791 () Bool)

(declare-fun res!878308 () Bool)

(assert (=> b!1323791 (=> (not res!878308) (not e!754939))))

(assert (=> b!1323791 (= res!878308 (not (= (select (arr!43094 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323792 () Bool)

(declare-fun res!878307 () Bool)

(assert (=> b!1323792 (=> (not res!878307) (not e!754939))))

(declare-datatypes ((List!30559 0))(
  ( (Nil!30556) (Cons!30555 (h!31773 (_ BitVec 64)) (t!44401 List!30559)) )
))
(declare-fun arrayNoDuplicates!0 (array!89249 (_ BitVec 32) List!30559) Bool)

(assert (=> b!1323792 (= res!878307 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30556))))

(declare-fun res!878313 () Bool)

(assert (=> start!111868 (=> (not res!878313) (not e!754939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111868 (= res!878313 (validMask!0 mask!2019))))

(assert (=> start!111868 e!754939))

(declare-fun array_inv!32809 (array!89249) Bool)

(assert (=> start!111868 (array_inv!32809 _keys!1609)))

(assert (=> start!111868 true))

(assert (=> start!111868 tp_is_empty!36121))

(declare-fun array_inv!32810 (array!89247) Bool)

(assert (=> start!111868 (and (array_inv!32810 _values!1337) e!754941)))

(assert (=> start!111868 tp!106378))

(declare-fun b!1323788 () Bool)

(assert (=> b!1323788 (= e!754939 (not true))))

(declare-datatypes ((tuple2!23410 0))(
  ( (tuple2!23411 (_1!11716 (_ BitVec 64)) (_2!11716 V!53265)) )
))
(declare-datatypes ((List!30560 0))(
  ( (Nil!30557) (Cons!30556 (h!31774 tuple2!23410) (t!44402 List!30560)) )
))
(declare-datatypes ((ListLongMap!21075 0))(
  ( (ListLongMap!21076 (toList!10553 List!30560)) )
))
(declare-fun lt!588679 () ListLongMap!21075)

(declare-fun lt!588680 () tuple2!23410)

(declare-fun contains!8720 (ListLongMap!21075 (_ BitVec 64)) Bool)

(declare-fun +!4628 (ListLongMap!21075 tuple2!23410) ListLongMap!21075)

(assert (=> b!1323788 (contains!8720 (+!4628 lt!588679 lt!588680) k0!1164)))

(declare-datatypes ((Unit!43543 0))(
  ( (Unit!43544) )
))
(declare-fun lt!588681 () Unit!43543)

(declare-fun zeroValue!1279 () V!53265)

(declare-fun addStillContains!1140 (ListLongMap!21075 (_ BitVec 64) V!53265 (_ BitVec 64)) Unit!43543)

(assert (=> b!1323788 (= lt!588681 (addStillContains!1140 lt!588679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323788 (contains!8720 lt!588679 k0!1164)))

(declare-fun lt!588686 () Unit!43543)

(declare-fun lt!588683 () V!53265)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!183 ((_ BitVec 64) (_ BitVec 64) V!53265 ListLongMap!21075) Unit!43543)

(assert (=> b!1323788 (= lt!588686 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 (select (arr!43094 _keys!1609) from!2000) lt!588683 lt!588679))))

(declare-fun lt!588685 () ListLongMap!21075)

(assert (=> b!1323788 (contains!8720 lt!588685 k0!1164)))

(declare-fun lt!588678 () Unit!43543)

(assert (=> b!1323788 (= lt!588678 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588685))))

(declare-fun lt!588684 () ListLongMap!21075)

(assert (=> b!1323788 (contains!8720 lt!588684 k0!1164)))

(declare-fun lt!588682 () Unit!43543)

(declare-fun minValue!1279 () V!53265)

(assert (=> b!1323788 (= lt!588682 (lemmaInListMapAfterAddingDiffThenInBefore!183 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588684))))

(assert (=> b!1323788 (= lt!588684 (+!4628 lt!588685 lt!588680))))

(assert (=> b!1323788 (= lt!588680 (tuple2!23411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323788 (= lt!588685 (+!4628 lt!588679 (tuple2!23411 (select (arr!43094 _keys!1609) from!2000) lt!588683)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21723 (ValueCell!17162 V!53265) V!53265)

(declare-fun dynLambda!3582 (Int (_ BitVec 64)) V!53265)

(assert (=> b!1323788 (= lt!588683 (get!21723 (select (arr!43093 _values!1337) from!2000) (dynLambda!3582 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6267 (array!89249 array!89247 (_ BitVec 32) (_ BitVec 32) V!53265 V!53265 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1323788 (= lt!588679 (getCurrentListMapNoExtraKeys!6267 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323793 () Bool)

(assert (=> b!1323793 (= e!754942 tp_is_empty!36121)))

(declare-fun b!1323794 () Bool)

(declare-fun res!878309 () Bool)

(assert (=> b!1323794 (=> (not res!878309) (not e!754939))))

(declare-fun getCurrentListMap!5541 (array!89249 array!89247 (_ BitVec 32) (_ BitVec 32) V!53265 V!53265 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1323794 (= res!878309 (contains!8720 (getCurrentListMap!5541 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111868 res!878313) b!1323787))

(assert (= (and b!1323787 res!878312) b!1323786))

(assert (= (and b!1323786 res!878311) b!1323792))

(assert (= (and b!1323792 res!878307) b!1323789))

(assert (= (and b!1323789 res!878314) b!1323794))

(assert (= (and b!1323794 res!878309) b!1323791))

(assert (= (and b!1323791 res!878308) b!1323785))

(assert (= (and b!1323785 res!878310) b!1323788))

(assert (= (and b!1323784 condMapEmpty!55829) mapIsEmpty!55829))

(assert (= (and b!1323784 (not condMapEmpty!55829)) mapNonEmpty!55829))

(get-info :version)

(assert (= (and mapNonEmpty!55829 ((_ is ValueCellFull!17162) mapValue!55829)) b!1323793))

(assert (= (and b!1323784 ((_ is ValueCellFull!17162) mapDefault!55829)) b!1323790))

(assert (= start!111868 b!1323784))

(declare-fun b_lambda!23621 () Bool)

(assert (=> (not b_lambda!23621) (not b!1323788)))

(declare-fun t!44400 () Bool)

(declare-fun tb!11645 () Bool)

(assert (=> (and start!111868 (= defaultEntry!1340 defaultEntry!1340) t!44400) tb!11645))

(declare-fun result!24353 () Bool)

(assert (=> tb!11645 (= result!24353 tp_is_empty!36121)))

(assert (=> b!1323788 t!44400))

(declare-fun b_and!48765 () Bool)

(assert (= b_and!48763 (and (=> t!44400 result!24353) b_and!48765)))

(declare-fun m!1212389 () Bool)

(assert (=> b!1323788 m!1212389))

(declare-fun m!1212391 () Bool)

(assert (=> b!1323788 m!1212391))

(declare-fun m!1212393 () Bool)

(assert (=> b!1323788 m!1212393))

(declare-fun m!1212395 () Bool)

(assert (=> b!1323788 m!1212395))

(declare-fun m!1212397 () Bool)

(assert (=> b!1323788 m!1212397))

(declare-fun m!1212399 () Bool)

(assert (=> b!1323788 m!1212399))

(declare-fun m!1212401 () Bool)

(assert (=> b!1323788 m!1212401))

(assert (=> b!1323788 m!1212399))

(declare-fun m!1212403 () Bool)

(assert (=> b!1323788 m!1212403))

(declare-fun m!1212405 () Bool)

(assert (=> b!1323788 m!1212405))

(declare-fun m!1212407 () Bool)

(assert (=> b!1323788 m!1212407))

(declare-fun m!1212409 () Bool)

(assert (=> b!1323788 m!1212409))

(declare-fun m!1212411 () Bool)

(assert (=> b!1323788 m!1212411))

(declare-fun m!1212413 () Bool)

(assert (=> b!1323788 m!1212413))

(assert (=> b!1323788 m!1212407))

(declare-fun m!1212415 () Bool)

(assert (=> b!1323788 m!1212415))

(declare-fun m!1212417 () Bool)

(assert (=> b!1323788 m!1212417))

(assert (=> b!1323788 m!1212395))

(assert (=> b!1323788 m!1212403))

(declare-fun m!1212419 () Bool)

(assert (=> b!1323788 m!1212419))

(declare-fun m!1212421 () Bool)

(assert (=> mapNonEmpty!55829 m!1212421))

(declare-fun m!1212423 () Bool)

(assert (=> b!1323786 m!1212423))

(assert (=> b!1323785 m!1212407))

(assert (=> b!1323785 m!1212407))

(declare-fun m!1212425 () Bool)

(assert (=> b!1323785 m!1212425))

(declare-fun m!1212427 () Bool)

(assert (=> start!111868 m!1212427))

(declare-fun m!1212429 () Bool)

(assert (=> start!111868 m!1212429))

(declare-fun m!1212431 () Bool)

(assert (=> start!111868 m!1212431))

(declare-fun m!1212433 () Bool)

(assert (=> b!1323792 m!1212433))

(assert (=> b!1323791 m!1212407))

(declare-fun m!1212435 () Bool)

(assert (=> b!1323794 m!1212435))

(assert (=> b!1323794 m!1212435))

(declare-fun m!1212437 () Bool)

(assert (=> b!1323794 m!1212437))

(check-sat (not start!111868) b_and!48765 (not b_lambda!23621) (not b!1323794) (not b!1323785) (not mapNonEmpty!55829) (not b!1323788) tp_is_empty!36121 (not b!1323792) (not b!1323786) (not b_next!30301))
(check-sat b_and!48765 (not b_next!30301))
