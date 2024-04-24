; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111742 () Bool)

(assert start!111742)

(declare-fun b_free!30175 () Bool)

(declare-fun b_next!30175 () Bool)

(assert (=> start!111742 (= b_free!30175 (not b_next!30175))))

(declare-fun tp!106001 () Bool)

(declare-fun b_and!48511 () Bool)

(assert (=> start!111742 (= tp!106001 b_and!48511)))

(declare-fun b!1321579 () Bool)

(declare-fun e!753997 () Bool)

(declare-fun tp_is_empty!35995 () Bool)

(assert (=> b!1321579 (= e!753997 tp_is_empty!35995)))

(declare-fun b!1321580 () Bool)

(declare-fun e!753995 () Bool)

(assert (=> b!1321580 (= e!753995 (not true))))

(declare-datatypes ((V!53097 0))(
  ( (V!53098 (val!18072 Int)) )
))
(declare-datatypes ((tuple2!23304 0))(
  ( (tuple2!23305 (_1!11663 (_ BitVec 64)) (_2!11663 V!53097)) )
))
(declare-datatypes ((List!30459 0))(
  ( (Nil!30456) (Cons!30455 (h!31673 tuple2!23304) (t!44175 List!30459)) )
))
(declare-datatypes ((ListLongMap!20969 0))(
  ( (ListLongMap!20970 (toList!10500 List!30459)) )
))
(declare-fun lt!587372 () ListLongMap!20969)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8667 (ListLongMap!20969 (_ BitVec 64)) Bool)

(assert (=> b!1321580 (contains!8667 lt!587372 k0!1164)))

(declare-datatypes ((Unit!43455 0))(
  ( (Unit!43456) )
))
(declare-fun lt!587375 () Unit!43455)

(declare-fun zeroValue!1279 () V!53097)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!139 ((_ BitVec 64) (_ BitVec 64) V!53097 ListLongMap!20969) Unit!43455)

(assert (=> b!1321580 (= lt!587375 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587372))))

(declare-fun lt!587374 () ListLongMap!20969)

(assert (=> b!1321580 (contains!8667 lt!587374 k0!1164)))

(declare-fun lt!587373 () Unit!43455)

(declare-fun minValue!1279 () V!53097)

(assert (=> b!1321580 (= lt!587373 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587374))))

(declare-fun +!4584 (ListLongMap!20969 tuple2!23304) ListLongMap!20969)

(assert (=> b!1321580 (= lt!587374 (+!4584 lt!587372 (tuple2!23305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88999 0))(
  ( (array!89000 (arr!42969 (Array (_ BitVec 32) (_ BitVec 64))) (size!43520 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88999)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17099 0))(
  ( (ValueCellFull!17099 (v!20697 V!53097)) (EmptyCell!17099) )
))
(declare-datatypes ((array!89001 0))(
  ( (array!89002 (arr!42970 (Array (_ BitVec 32) ValueCell!17099)) (size!43521 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89001)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6223 (array!88999 array!89001 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!20969)

(declare-fun get!21637 (ValueCell!17099 V!53097) V!53097)

(declare-fun dynLambda!3538 (Int (_ BitVec 64)) V!53097)

(assert (=> b!1321580 (= lt!587372 (+!4584 (getCurrentListMapNoExtraKeys!6223 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23305 (select (arr!42969 _keys!1609) from!2000) (get!21637 (select (arr!42970 _values!1337) from!2000) (dynLambda!3538 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!55640 () Bool)

(declare-fun mapRes!55640 () Bool)

(declare-fun tp!106000 () Bool)

(declare-fun e!753994 () Bool)

(assert (=> mapNonEmpty!55640 (= mapRes!55640 (and tp!106000 e!753994))))

(declare-fun mapValue!55640 () ValueCell!17099)

(declare-fun mapRest!55640 () (Array (_ BitVec 32) ValueCell!17099))

(declare-fun mapKey!55640 () (_ BitVec 32))

(assert (=> mapNonEmpty!55640 (= (arr!42970 _values!1337) (store mapRest!55640 mapKey!55640 mapValue!55640))))

(declare-fun b!1321582 () Bool)

(assert (=> b!1321582 (= e!753994 tp_is_empty!35995)))

(declare-fun b!1321583 () Bool)

(declare-fun res!876795 () Bool)

(assert (=> b!1321583 (=> (not res!876795) (not e!753995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88999 (_ BitVec 32)) Bool)

(assert (=> b!1321583 (= res!876795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321584 () Bool)

(declare-fun res!876797 () Bool)

(assert (=> b!1321584 (=> (not res!876797) (not e!753995))))

(declare-fun getCurrentListMap!5496 (array!88999 array!89001 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!20969)

(assert (=> b!1321584 (= res!876797 (contains!8667 (getCurrentListMap!5496 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55640 () Bool)

(assert (=> mapIsEmpty!55640 mapRes!55640))

(declare-fun b!1321585 () Bool)

(declare-fun res!876796 () Bool)

(assert (=> b!1321585 (=> (not res!876796) (not e!753995))))

(assert (=> b!1321585 (= res!876796 (and (= (size!43521 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43520 _keys!1609) (size!43521 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321586 () Bool)

(declare-fun e!753993 () Bool)

(assert (=> b!1321586 (= e!753993 (and e!753997 mapRes!55640))))

(declare-fun condMapEmpty!55640 () Bool)

(declare-fun mapDefault!55640 () ValueCell!17099)

(assert (=> b!1321586 (= condMapEmpty!55640 (= (arr!42970 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17099)) mapDefault!55640)))))

(declare-fun b!1321587 () Bool)

(declare-fun res!876801 () Bool)

(assert (=> b!1321587 (=> (not res!876801) (not e!753995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321587 (= res!876801 (validKeyInArray!0 (select (arr!42969 _keys!1609) from!2000)))))

(declare-fun b!1321588 () Bool)

(declare-fun res!876799 () Bool)

(assert (=> b!1321588 (=> (not res!876799) (not e!753995))))

(assert (=> b!1321588 (= res!876799 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43520 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321589 () Bool)

(declare-fun res!876800 () Bool)

(assert (=> b!1321589 (=> (not res!876800) (not e!753995))))

(declare-datatypes ((List!30460 0))(
  ( (Nil!30457) (Cons!30456 (h!31674 (_ BitVec 64)) (t!44176 List!30460)) )
))
(declare-fun arrayNoDuplicates!0 (array!88999 (_ BitVec 32) List!30460) Bool)

(assert (=> b!1321589 (= res!876800 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30457))))

(declare-fun res!876802 () Bool)

(assert (=> start!111742 (=> (not res!876802) (not e!753995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111742 (= res!876802 (validMask!0 mask!2019))))

(assert (=> start!111742 e!753995))

(declare-fun array_inv!32719 (array!88999) Bool)

(assert (=> start!111742 (array_inv!32719 _keys!1609)))

(assert (=> start!111742 true))

(assert (=> start!111742 tp_is_empty!35995))

(declare-fun array_inv!32720 (array!89001) Bool)

(assert (=> start!111742 (and (array_inv!32720 _values!1337) e!753993)))

(assert (=> start!111742 tp!106001))

(declare-fun b!1321581 () Bool)

(declare-fun res!876798 () Bool)

(assert (=> b!1321581 (=> (not res!876798) (not e!753995))))

(assert (=> b!1321581 (= res!876798 (not (= (select (arr!42969 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111742 res!876802) b!1321585))

(assert (= (and b!1321585 res!876796) b!1321583))

(assert (= (and b!1321583 res!876795) b!1321589))

(assert (= (and b!1321589 res!876800) b!1321588))

(assert (= (and b!1321588 res!876799) b!1321584))

(assert (= (and b!1321584 res!876797) b!1321581))

(assert (= (and b!1321581 res!876798) b!1321587))

(assert (= (and b!1321587 res!876801) b!1321580))

(assert (= (and b!1321586 condMapEmpty!55640) mapIsEmpty!55640))

(assert (= (and b!1321586 (not condMapEmpty!55640)) mapNonEmpty!55640))

(get-info :version)

(assert (= (and mapNonEmpty!55640 ((_ is ValueCellFull!17099) mapValue!55640)) b!1321582))

(assert (= (and b!1321586 ((_ is ValueCellFull!17099) mapDefault!55640)) b!1321579))

(assert (= start!111742 b!1321586))

(declare-fun b_lambda!23495 () Bool)

(assert (=> (not b_lambda!23495) (not b!1321580)))

(declare-fun t!44174 () Bool)

(declare-fun tb!11519 () Bool)

(assert (=> (and start!111742 (= defaultEntry!1340 defaultEntry!1340) t!44174) tb!11519))

(declare-fun result!24101 () Bool)

(assert (=> tb!11519 (= result!24101 tp_is_empty!35995)))

(assert (=> b!1321580 t!44174))

(declare-fun b_and!48513 () Bool)

(assert (= b_and!48511 (and (=> t!44174 result!24101) b_and!48513)))

(declare-fun m!1209569 () Bool)

(assert (=> b!1321587 m!1209569))

(assert (=> b!1321587 m!1209569))

(declare-fun m!1209571 () Bool)

(assert (=> b!1321587 m!1209571))

(declare-fun m!1209573 () Bool)

(assert (=> b!1321583 m!1209573))

(declare-fun m!1209575 () Bool)

(assert (=> b!1321584 m!1209575))

(assert (=> b!1321584 m!1209575))

(declare-fun m!1209577 () Bool)

(assert (=> b!1321584 m!1209577))

(assert (=> b!1321581 m!1209569))

(declare-fun m!1209579 () Bool)

(assert (=> b!1321589 m!1209579))

(declare-fun m!1209581 () Bool)

(assert (=> start!111742 m!1209581))

(declare-fun m!1209583 () Bool)

(assert (=> start!111742 m!1209583))

(declare-fun m!1209585 () Bool)

(assert (=> start!111742 m!1209585))

(declare-fun m!1209587 () Bool)

(assert (=> b!1321580 m!1209587))

(declare-fun m!1209589 () Bool)

(assert (=> b!1321580 m!1209589))

(assert (=> b!1321580 m!1209587))

(declare-fun m!1209591 () Bool)

(assert (=> b!1321580 m!1209591))

(declare-fun m!1209593 () Bool)

(assert (=> b!1321580 m!1209593))

(declare-fun m!1209595 () Bool)

(assert (=> b!1321580 m!1209595))

(declare-fun m!1209597 () Bool)

(assert (=> b!1321580 m!1209597))

(assert (=> b!1321580 m!1209589))

(declare-fun m!1209599 () Bool)

(assert (=> b!1321580 m!1209599))

(assert (=> b!1321580 m!1209569))

(assert (=> b!1321580 m!1209597))

(declare-fun m!1209601 () Bool)

(assert (=> b!1321580 m!1209601))

(declare-fun m!1209603 () Bool)

(assert (=> b!1321580 m!1209603))

(declare-fun m!1209605 () Bool)

(assert (=> b!1321580 m!1209605))

(declare-fun m!1209607 () Bool)

(assert (=> mapNonEmpty!55640 m!1209607))

(check-sat (not b_lambda!23495) (not start!111742) tp_is_empty!35995 (not b_next!30175) (not mapNonEmpty!55640) (not b!1321587) (not b!1321589) (not b!1321583) (not b!1321584) (not b!1321580) b_and!48513)
(check-sat b_and!48513 (not b_next!30175))
