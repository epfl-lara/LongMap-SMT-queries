; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112674 () Bool)

(assert start!112674)

(declare-fun b_free!31011 () Bool)

(declare-fun b_next!31011 () Bool)

(assert (=> start!112674 (= b_free!31011 (not b_next!31011))))

(declare-fun tp!108674 () Bool)

(declare-fun b_and!49959 () Bool)

(assert (=> start!112674 (= tp!108674 b_and!49959)))

(declare-fun mapNonEmpty!57059 () Bool)

(declare-fun mapRes!57059 () Bool)

(declare-fun tp!108673 () Bool)

(declare-fun e!761109 () Bool)

(assert (=> mapNonEmpty!57059 (= mapRes!57059 (and tp!108673 e!761109))))

(declare-datatypes ((V!54331 0))(
  ( (V!54332 (val!18535 Int)) )
))
(declare-datatypes ((ValueCell!17562 0))(
  ( (ValueCellFull!17562 (v!21175 V!54331)) (EmptyCell!17562) )
))
(declare-fun mapValue!57059 () ValueCell!17562)

(declare-datatypes ((array!90702 0))(
  ( (array!90703 (arr!43816 (Array (_ BitVec 32) ValueCell!17562)) (size!44366 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90702)

(declare-fun mapKey!57059 () (_ BitVec 32))

(declare-fun mapRest!57059 () (Array (_ BitVec 32) ValueCell!17562))

(assert (=> mapNonEmpty!57059 (= (arr!43816 _values!1320) (store mapRest!57059 mapKey!57059 mapValue!57059))))

(declare-fun b!1336519 () Bool)

(declare-fun res!886965 () Bool)

(declare-fun e!761108 () Bool)

(assert (=> b!1336519 (=> (not res!886965) (not e!761108))))

(declare-datatypes ((array!90704 0))(
  ( (array!90705 (arr!43817 (Array (_ BitVec 32) (_ BitVec 64))) (size!44367 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90704)

(declare-datatypes ((List!31048 0))(
  ( (Nil!31045) (Cons!31044 (h!32253 (_ BitVec 64)) (t!45340 List!31048)) )
))
(declare-fun arrayNoDuplicates!0 (array!90704 (_ BitVec 32) List!31048) Bool)

(assert (=> b!1336519 (= res!886965 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31045))))

(declare-fun b!1336520 () Bool)

(declare-fun e!761110 () Bool)

(declare-fun tp_is_empty!36921 () Bool)

(assert (=> b!1336520 (= e!761110 tp_is_empty!36921)))

(declare-fun b!1336521 () Bool)

(declare-fun res!886962 () Bool)

(assert (=> b!1336521 (=> (not res!886962) (not e!761108))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336521 (= res!886962 (validKeyInArray!0 (select (arr!43817 _keys!1590) from!1980)))))

(declare-fun b!1336522 () Bool)

(declare-fun res!886964 () Bool)

(assert (=> b!1336522 (=> (not res!886964) (not e!761108))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336522 (= res!886964 (and (= (size!44366 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44367 _keys!1590) (size!44366 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336523 () Bool)

(assert (=> b!1336523 (= e!761109 tp_is_empty!36921)))

(declare-fun b!1336524 () Bool)

(declare-fun res!886967 () Bool)

(assert (=> b!1336524 (=> (not res!886967) (not e!761108))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336524 (= res!886967 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44367 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336525 () Bool)

(declare-fun res!886968 () Bool)

(assert (=> b!1336525 (=> (not res!886968) (not e!761108))))

(assert (=> b!1336525 (= res!886968 (not (= (select (arr!43817 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336526 () Bool)

(declare-fun e!761106 () Bool)

(assert (=> b!1336526 (= e!761106 (and e!761110 mapRes!57059))))

(declare-fun condMapEmpty!57059 () Bool)

(declare-fun mapDefault!57059 () ValueCell!17562)

(assert (=> b!1336526 (= condMapEmpty!57059 (= (arr!43816 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17562)) mapDefault!57059)))))

(declare-fun b!1336528 () Bool)

(declare-fun res!886963 () Bool)

(assert (=> b!1336528 (=> (not res!886963) (not e!761108))))

(assert (=> b!1336528 (= res!886963 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57059 () Bool)

(assert (=> mapIsEmpty!57059 mapRes!57059))

(declare-fun b!1336529 () Bool)

(declare-fun res!886970 () Bool)

(assert (=> b!1336529 (=> (not res!886970) (not e!761108))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54331)

(declare-fun zeroValue!1262 () V!54331)

(declare-datatypes ((tuple2!23906 0))(
  ( (tuple2!23907 (_1!11964 (_ BitVec 64)) (_2!11964 V!54331)) )
))
(declare-datatypes ((List!31049 0))(
  ( (Nil!31046) (Cons!31045 (h!32254 tuple2!23906) (t!45341 List!31049)) )
))
(declare-datatypes ((ListLongMap!21563 0))(
  ( (ListLongMap!21564 (toList!10797 List!31049)) )
))
(declare-fun contains!8962 (ListLongMap!21563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5769 (array!90704 array!90702 (_ BitVec 32) (_ BitVec 32) V!54331 V!54331 (_ BitVec 32) Int) ListLongMap!21563)

(assert (=> b!1336529 (= res!886970 (contains!8962 (getCurrentListMap!5769 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336530 () Bool)

(assert (=> b!1336530 (= e!761108 (not true))))

(declare-fun lt!592786 () ListLongMap!21563)

(assert (=> b!1336530 (contains!8962 lt!592786 k0!1153)))

(declare-datatypes ((Unit!43926 0))(
  ( (Unit!43927) )
))
(declare-fun lt!592787 () Unit!43926)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!318 ((_ BitVec 64) (_ BitVec 64) V!54331 ListLongMap!21563) Unit!43926)

(assert (=> b!1336530 (= lt!592787 (lemmaInListMapAfterAddingDiffThenInBefore!318 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592786))))

(declare-fun +!4739 (ListLongMap!21563 tuple2!23906) ListLongMap!21563)

(declare-fun getCurrentListMapNoExtraKeys!6381 (array!90704 array!90702 (_ BitVec 32) (_ BitVec 32) V!54331 V!54331 (_ BitVec 32) Int) ListLongMap!21563)

(declare-fun get!22108 (ValueCell!17562 V!54331) V!54331)

(declare-fun dynLambda!3678 (Int (_ BitVec 64)) V!54331)

(assert (=> b!1336530 (= lt!592786 (+!4739 (getCurrentListMapNoExtraKeys!6381 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23907 (select (arr!43817 _keys!1590) from!1980) (get!22108 (select (arr!43816 _values!1320) from!1980) (dynLambda!3678 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!886966 () Bool)

(assert (=> start!112674 (=> (not res!886966) (not e!761108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112674 (= res!886966 (validMask!0 mask!1998))))

(assert (=> start!112674 e!761108))

(declare-fun array_inv!33043 (array!90702) Bool)

(assert (=> start!112674 (and (array_inv!33043 _values!1320) e!761106)))

(assert (=> start!112674 true))

(declare-fun array_inv!33044 (array!90704) Bool)

(assert (=> start!112674 (array_inv!33044 _keys!1590)))

(assert (=> start!112674 tp!108674))

(assert (=> start!112674 tp_is_empty!36921))

(declare-fun b!1336527 () Bool)

(declare-fun res!886969 () Bool)

(assert (=> b!1336527 (=> (not res!886969) (not e!761108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90704 (_ BitVec 32)) Bool)

(assert (=> b!1336527 (= res!886969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112674 res!886966) b!1336522))

(assert (= (and b!1336522 res!886964) b!1336527))

(assert (= (and b!1336527 res!886969) b!1336519))

(assert (= (and b!1336519 res!886965) b!1336524))

(assert (= (and b!1336524 res!886967) b!1336529))

(assert (= (and b!1336529 res!886970) b!1336525))

(assert (= (and b!1336525 res!886968) b!1336521))

(assert (= (and b!1336521 res!886962) b!1336528))

(assert (= (and b!1336528 res!886963) b!1336530))

(assert (= (and b!1336526 condMapEmpty!57059) mapIsEmpty!57059))

(assert (= (and b!1336526 (not condMapEmpty!57059)) mapNonEmpty!57059))

(get-info :version)

(assert (= (and mapNonEmpty!57059 ((_ is ValueCellFull!17562) mapValue!57059)) b!1336523))

(assert (= (and b!1336526 ((_ is ValueCellFull!17562) mapDefault!57059)) b!1336520))

(assert (= start!112674 b!1336526))

(declare-fun b_lambda!24169 () Bool)

(assert (=> (not b_lambda!24169) (not b!1336530)))

(declare-fun t!45339 () Bool)

(declare-fun tb!12095 () Bool)

(assert (=> (and start!112674 (= defaultEntry!1323 defaultEntry!1323) t!45339) tb!12095))

(declare-fun result!25263 () Bool)

(assert (=> tb!12095 (= result!25263 tp_is_empty!36921)))

(assert (=> b!1336530 t!45339))

(declare-fun b_and!49961 () Bool)

(assert (= b_and!49959 (and (=> t!45339 result!25263) b_and!49961)))

(declare-fun m!1224599 () Bool)

(assert (=> b!1336530 m!1224599))

(declare-fun m!1224601 () Bool)

(assert (=> b!1336530 m!1224601))

(declare-fun m!1224603 () Bool)

(assert (=> b!1336530 m!1224603))

(declare-fun m!1224605 () Bool)

(assert (=> b!1336530 m!1224605))

(assert (=> b!1336530 m!1224599))

(declare-fun m!1224607 () Bool)

(assert (=> b!1336530 m!1224607))

(declare-fun m!1224609 () Bool)

(assert (=> b!1336530 m!1224609))

(assert (=> b!1336530 m!1224601))

(assert (=> b!1336530 m!1224605))

(declare-fun m!1224611 () Bool)

(assert (=> b!1336530 m!1224611))

(declare-fun m!1224613 () Bool)

(assert (=> b!1336530 m!1224613))

(declare-fun m!1224615 () Bool)

(assert (=> mapNonEmpty!57059 m!1224615))

(declare-fun m!1224617 () Bool)

(assert (=> b!1336529 m!1224617))

(assert (=> b!1336529 m!1224617))

(declare-fun m!1224619 () Bool)

(assert (=> b!1336529 m!1224619))

(assert (=> b!1336521 m!1224613))

(assert (=> b!1336521 m!1224613))

(declare-fun m!1224621 () Bool)

(assert (=> b!1336521 m!1224621))

(declare-fun m!1224623 () Bool)

(assert (=> start!112674 m!1224623))

(declare-fun m!1224625 () Bool)

(assert (=> start!112674 m!1224625))

(declare-fun m!1224627 () Bool)

(assert (=> start!112674 m!1224627))

(declare-fun m!1224629 () Bool)

(assert (=> b!1336519 m!1224629))

(declare-fun m!1224631 () Bool)

(assert (=> b!1336527 m!1224631))

(assert (=> b!1336525 m!1224613))

(check-sat (not b!1336530) b_and!49961 (not b!1336529) (not b_lambda!24169) (not start!112674) (not b!1336519) (not b!1336521) (not b!1336527) tp_is_empty!36921 (not mapNonEmpty!57059) (not b_next!31011))
(check-sat b_and!49961 (not b_next!31011))
