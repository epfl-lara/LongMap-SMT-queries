; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111876 () Bool)

(assert start!111876)

(declare-fun b_free!30475 () Bool)

(declare-fun b_next!30475 () Bool)

(assert (=> start!111876 (= b_free!30475 (not b_next!30475))))

(declare-fun tp!106905 () Bool)

(declare-fun b_and!49027 () Bool)

(assert (=> start!111876 (= tp!106905 b_and!49027)))

(declare-fun b!1325523 () Bool)

(declare-fun res!879753 () Bool)

(declare-fun e!755625 () Bool)

(assert (=> b!1325523 (=> (not res!879753) (not e!755625))))

(declare-datatypes ((array!89431 0))(
  ( (array!89432 (arr!43189 (Array (_ BitVec 32) (_ BitVec 64))) (size!43741 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89431)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53497 0))(
  ( (V!53498 (val!18222 Int)) )
))
(declare-fun zeroValue!1279 () V!53497)

(declare-datatypes ((ValueCell!17249 0))(
  ( (ValueCellFull!17249 (v!20854 V!53497)) (EmptyCell!17249) )
))
(declare-datatypes ((array!89433 0))(
  ( (array!89434 (arr!43190 (Array (_ BitVec 32) ValueCell!17249)) (size!43742 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89433)

(declare-fun minValue!1279 () V!53497)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23568 0))(
  ( (tuple2!23569 (_1!11795 (_ BitVec 64)) (_2!11795 V!53497)) )
))
(declare-datatypes ((List!30696 0))(
  ( (Nil!30693) (Cons!30692 (h!31901 tuple2!23568) (t!44634 List!30696)) )
))
(declare-datatypes ((ListLongMap!21225 0))(
  ( (ListLongMap!21226 (toList!10628 List!30696)) )
))
(declare-fun contains!8712 (ListLongMap!21225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5506 (array!89431 array!89433 (_ BitVec 32) (_ BitVec 32) V!53497 V!53497 (_ BitVec 32) Int) ListLongMap!21225)

(assert (=> b!1325523 (= res!879753 (contains!8712 (getCurrentListMap!5506 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325524 () Bool)

(declare-fun res!879752 () Bool)

(assert (=> b!1325524 (=> (not res!879752) (not e!755625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325524 (= res!879752 (validKeyInArray!0 (select (arr!43189 _keys!1609) from!2000)))))

(declare-fun b!1325526 () Bool)

(declare-fun res!879749 () Bool)

(assert (=> b!1325526 (=> (not res!879749) (not e!755625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89431 (_ BitVec 32)) Bool)

(assert (=> b!1325526 (= res!879749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325527 () Bool)

(declare-fun res!879751 () Bool)

(assert (=> b!1325527 (=> (not res!879751) (not e!755625))))

(assert (=> b!1325527 (= res!879751 (not (= (select (arr!43189 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325528 () Bool)

(declare-fun res!879750 () Bool)

(assert (=> b!1325528 (=> (not res!879750) (not e!755625))))

(assert (=> b!1325528 (= res!879750 (and (= (size!43742 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43741 _keys!1609) (size!43742 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325529 () Bool)

(declare-fun e!755627 () Bool)

(declare-fun tp_is_empty!36295 () Bool)

(assert (=> b!1325529 (= e!755627 tp_is_empty!36295)))

(declare-fun b!1325530 () Bool)

(declare-fun res!879755 () Bool)

(assert (=> b!1325530 (=> (not res!879755) (not e!755625))))

(declare-datatypes ((List!30697 0))(
  ( (Nil!30694) (Cons!30693 (h!31902 (_ BitVec 64)) (t!44635 List!30697)) )
))
(declare-fun arrayNoDuplicates!0 (array!89431 (_ BitVec 32) List!30697) Bool)

(assert (=> b!1325530 (= res!879755 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30694))))

(declare-fun b!1325531 () Bool)

(assert (=> b!1325531 (= e!755625 (not (bvslt from!2000 (size!43742 _values!1337))))))

(declare-fun lt!589623 () ListLongMap!21225)

(assert (=> b!1325531 (contains!8712 lt!589623 k0!1164)))

(declare-datatypes ((Unit!43463 0))(
  ( (Unit!43464) )
))
(declare-fun lt!589622 () Unit!43463)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!197 ((_ BitVec 64) (_ BitVec 64) V!53497 ListLongMap!21225) Unit!43463)

(assert (=> b!1325531 (= lt!589622 (lemmaInListMapAfterAddingDiffThenInBefore!197 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589623))))

(declare-fun +!4635 (ListLongMap!21225 tuple2!23568) ListLongMap!21225)

(declare-fun getCurrentListMapNoExtraKeys!6273 (array!89431 array!89433 (_ BitVec 32) (_ BitVec 32) V!53497 V!53497 (_ BitVec 32) Int) ListLongMap!21225)

(declare-fun get!21755 (ValueCell!17249 V!53497) V!53497)

(declare-fun dynLambda!3565 (Int (_ BitVec 64)) V!53497)

(assert (=> b!1325531 (= lt!589623 (+!4635 (+!4635 (getCurrentListMapNoExtraKeys!6273 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23569 (select (arr!43189 _keys!1609) from!2000) (get!21755 (select (arr!43190 _values!1337) from!2000) (dynLambda!3565 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapIsEmpty!56094 () Bool)

(declare-fun mapRes!56094 () Bool)

(assert (=> mapIsEmpty!56094 mapRes!56094))

(declare-fun b!1325532 () Bool)

(declare-fun res!879748 () Bool)

(assert (=> b!1325532 (=> (not res!879748) (not e!755625))))

(assert (=> b!1325532 (= res!879748 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43741 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56094 () Bool)

(declare-fun tp!106906 () Bool)

(declare-fun e!755629 () Bool)

(assert (=> mapNonEmpty!56094 (= mapRes!56094 (and tp!106906 e!755629))))

(declare-fun mapRest!56094 () (Array (_ BitVec 32) ValueCell!17249))

(declare-fun mapKey!56094 () (_ BitVec 32))

(declare-fun mapValue!56094 () ValueCell!17249)

(assert (=> mapNonEmpty!56094 (= (arr!43190 _values!1337) (store mapRest!56094 mapKey!56094 mapValue!56094))))

(declare-fun b!1325533 () Bool)

(declare-fun e!755628 () Bool)

(assert (=> b!1325533 (= e!755628 (and e!755627 mapRes!56094))))

(declare-fun condMapEmpty!56094 () Bool)

(declare-fun mapDefault!56094 () ValueCell!17249)

(assert (=> b!1325533 (= condMapEmpty!56094 (= (arr!43190 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17249)) mapDefault!56094)))))

(declare-fun b!1325525 () Bool)

(assert (=> b!1325525 (= e!755629 tp_is_empty!36295)))

(declare-fun res!879754 () Bool)

(assert (=> start!111876 (=> (not res!879754) (not e!755625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111876 (= res!879754 (validMask!0 mask!2019))))

(assert (=> start!111876 e!755625))

(declare-fun array_inv!32785 (array!89431) Bool)

(assert (=> start!111876 (array_inv!32785 _keys!1609)))

(assert (=> start!111876 true))

(assert (=> start!111876 tp_is_empty!36295))

(declare-fun array_inv!32786 (array!89433) Bool)

(assert (=> start!111876 (and (array_inv!32786 _values!1337) e!755628)))

(assert (=> start!111876 tp!106905))

(assert (= (and start!111876 res!879754) b!1325528))

(assert (= (and b!1325528 res!879750) b!1325526))

(assert (= (and b!1325526 res!879749) b!1325530))

(assert (= (and b!1325530 res!879755) b!1325532))

(assert (= (and b!1325532 res!879748) b!1325523))

(assert (= (and b!1325523 res!879753) b!1325527))

(assert (= (and b!1325527 res!879751) b!1325524))

(assert (= (and b!1325524 res!879752) b!1325531))

(assert (= (and b!1325533 condMapEmpty!56094) mapIsEmpty!56094))

(assert (= (and b!1325533 (not condMapEmpty!56094)) mapNonEmpty!56094))

(get-info :version)

(assert (= (and mapNonEmpty!56094 ((_ is ValueCellFull!17249) mapValue!56094)) b!1325525))

(assert (= (and b!1325533 ((_ is ValueCellFull!17249) mapDefault!56094)) b!1325529))

(assert (= start!111876 b!1325533))

(declare-fun b_lambda!23743 () Bool)

(assert (=> (not b_lambda!23743) (not b!1325531)))

(declare-fun t!44633 () Bool)

(declare-fun tb!11741 () Bool)

(assert (=> (and start!111876 (= defaultEntry!1340 defaultEntry!1340) t!44633) tb!11741))

(declare-fun result!24547 () Bool)

(assert (=> tb!11741 (= result!24547 tp_is_empty!36295)))

(assert (=> b!1325531 t!44633))

(declare-fun b_and!49029 () Bool)

(assert (= b_and!49027 (and (=> t!44633 result!24547) b_and!49029)))

(declare-fun m!1213969 () Bool)

(assert (=> b!1325527 m!1213969))

(declare-fun m!1213971 () Bool)

(assert (=> b!1325526 m!1213971))

(declare-fun m!1213973 () Bool)

(assert (=> mapNonEmpty!56094 m!1213973))

(declare-fun m!1213975 () Bool)

(assert (=> b!1325530 m!1213975))

(declare-fun m!1213977 () Bool)

(assert (=> b!1325531 m!1213977))

(declare-fun m!1213979 () Bool)

(assert (=> b!1325531 m!1213979))

(declare-fun m!1213981 () Bool)

(assert (=> b!1325531 m!1213981))

(declare-fun m!1213983 () Bool)

(assert (=> b!1325531 m!1213983))

(declare-fun m!1213985 () Bool)

(assert (=> b!1325531 m!1213985))

(assert (=> b!1325531 m!1213983))

(declare-fun m!1213987 () Bool)

(assert (=> b!1325531 m!1213987))

(assert (=> b!1325531 m!1213985))

(assert (=> b!1325531 m!1213979))

(declare-fun m!1213989 () Bool)

(assert (=> b!1325531 m!1213989))

(assert (=> b!1325531 m!1213969))

(assert (=> b!1325531 m!1213981))

(declare-fun m!1213991 () Bool)

(assert (=> b!1325531 m!1213991))

(declare-fun m!1213993 () Bool)

(assert (=> b!1325523 m!1213993))

(assert (=> b!1325523 m!1213993))

(declare-fun m!1213995 () Bool)

(assert (=> b!1325523 m!1213995))

(assert (=> b!1325524 m!1213969))

(assert (=> b!1325524 m!1213969))

(declare-fun m!1213997 () Bool)

(assert (=> b!1325524 m!1213997))

(declare-fun m!1213999 () Bool)

(assert (=> start!111876 m!1213999))

(declare-fun m!1214001 () Bool)

(assert (=> start!111876 m!1214001))

(declare-fun m!1214003 () Bool)

(assert (=> start!111876 m!1214003))

(check-sat (not b!1325524) (not b!1325523) (not b!1325531) b_and!49029 tp_is_empty!36295 (not b_lambda!23743) (not start!111876) (not b!1325530) (not b!1325526) (not b_next!30475) (not mapNonEmpty!56094))
(check-sat b_and!49029 (not b_next!30475))
