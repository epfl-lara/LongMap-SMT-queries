; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113246 () Bool)

(assert start!113246)

(declare-fun b_free!31297 () Bool)

(declare-fun b_next!31297 () Bool)

(assert (=> start!113246 (= b_free!31297 (not b_next!31297))))

(declare-fun tp!109697 () Bool)

(declare-fun b_and!50483 () Bool)

(assert (=> start!113246 (= tp!109697 b_and!50483)))

(declare-fun b!1343467 () Bool)

(declare-fun e!764675 () Bool)

(declare-fun tp_is_empty!37297 () Bool)

(assert (=> b!1343467 (= e!764675 tp_is_empty!37297)))

(declare-fun b!1343468 () Bool)

(declare-fun res!891378 () Bool)

(declare-fun e!764671 () Bool)

(assert (=> b!1343468 (=> (not res!891378) (not e!764671))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91381 0))(
  ( (array!91382 (arr!44147 (Array (_ BitVec 32) (_ BitVec 64))) (size!44699 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91381)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343468 (= res!891378 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44699 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343469 () Bool)

(declare-fun res!891384 () Bool)

(assert (=> b!1343469 (=> (not res!891384) (not e!764671))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91381 (_ BitVec 32)) Bool)

(assert (=> b!1343469 (= res!891384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343470 () Bool)

(declare-fun e!764674 () Bool)

(assert (=> b!1343470 (= e!764674 tp_is_empty!37297)))

(declare-fun b!1343471 () Bool)

(declare-fun res!891383 () Bool)

(assert (=> b!1343471 (=> (not res!891383) (not e!764671))))

(declare-datatypes ((List!31327 0))(
  ( (Nil!31324) (Cons!31323 (h!32532 (_ BitVec 64)) (t!45827 List!31327)) )
))
(declare-fun arrayNoDuplicates!0 (array!91381 (_ BitVec 32) List!31327) Bool)

(assert (=> b!1343471 (= res!891383 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31324))))

(declare-fun b!1343472 () Bool)

(declare-fun e!764672 () Bool)

(declare-fun mapRes!57652 () Bool)

(assert (=> b!1343472 (= e!764672 (and e!764674 mapRes!57652))))

(declare-fun condMapEmpty!57652 () Bool)

(declare-datatypes ((V!54833 0))(
  ( (V!54834 (val!18723 Int)) )
))
(declare-datatypes ((ValueCell!17750 0))(
  ( (ValueCellFull!17750 (v!21370 V!54833)) (EmptyCell!17750) )
))
(declare-datatypes ((array!91383 0))(
  ( (array!91384 (arr!44148 (Array (_ BitVec 32) ValueCell!17750)) (size!44700 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91383)

(declare-fun mapDefault!57652 () ValueCell!17750)

(assert (=> b!1343472 (= condMapEmpty!57652 (= (arr!44148 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17750)) mapDefault!57652)))))

(declare-fun b!1343473 () Bool)

(declare-fun res!891382 () Bool)

(assert (=> b!1343473 (=> (not res!891382) (not e!764671))))

(assert (=> b!1343473 (= res!891382 (not (= (select (arr!44147 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57652 () Bool)

(assert (=> mapIsEmpty!57652 mapRes!57652))

(declare-fun b!1343474 () Bool)

(declare-fun res!891381 () Bool)

(assert (=> b!1343474 (=> (not res!891381) (not e!764671))))

(declare-fun minValue!1245 () V!54833)

(declare-fun zeroValue!1245 () V!54833)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24186 0))(
  ( (tuple2!24187 (_1!12104 (_ BitVec 64)) (_2!12104 V!54833)) )
))
(declare-datatypes ((List!31328 0))(
  ( (Nil!31325) (Cons!31324 (h!32533 tuple2!24186) (t!45828 List!31328)) )
))
(declare-datatypes ((ListLongMap!21843 0))(
  ( (ListLongMap!21844 (toList!10937 List!31328)) )
))
(declare-fun contains!9042 (ListLongMap!21843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5784 (array!91381 array!91383 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21843)

(assert (=> b!1343474 (= res!891381 (contains!9042 (getCurrentListMap!5784 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!891379 () Bool)

(assert (=> start!113246 (=> (not res!891379) (not e!764671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113246 (= res!891379 (validMask!0 mask!1977))))

(assert (=> start!113246 e!764671))

(assert (=> start!113246 tp_is_empty!37297))

(assert (=> start!113246 true))

(declare-fun array_inv!33465 (array!91381) Bool)

(assert (=> start!113246 (array_inv!33465 _keys!1571)))

(declare-fun array_inv!33466 (array!91383) Bool)

(assert (=> start!113246 (and (array_inv!33466 _values!1303) e!764672)))

(assert (=> start!113246 tp!109697))

(declare-fun mapNonEmpty!57652 () Bool)

(declare-fun tp!109696 () Bool)

(assert (=> mapNonEmpty!57652 (= mapRes!57652 (and tp!109696 e!764675))))

(declare-fun mapRest!57652 () (Array (_ BitVec 32) ValueCell!17750))

(declare-fun mapValue!57652 () ValueCell!17750)

(declare-fun mapKey!57652 () (_ BitVec 32))

(assert (=> mapNonEmpty!57652 (= (arr!44148 _values!1303) (store mapRest!57652 mapKey!57652 mapValue!57652))))

(declare-fun b!1343475 () Bool)

(assert (=> b!1343475 (= e!764671 (not true))))

(declare-fun lt!594785 () ListLongMap!21843)

(declare-fun +!4837 (ListLongMap!21843 tuple2!24186) ListLongMap!21843)

(assert (=> b!1343475 (contains!9042 (+!4837 lt!594785 (tuple2!24187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43916 0))(
  ( (Unit!43917) )
))
(declare-fun lt!594788 () Unit!43916)

(declare-fun addStillContains!1201 (ListLongMap!21843 (_ BitVec 64) V!54833 (_ BitVec 64)) Unit!43916)

(assert (=> b!1343475 (= lt!594788 (addStillContains!1201 lt!594785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343475 (contains!9042 lt!594785 k0!1142)))

(declare-fun lt!594787 () V!54833)

(declare-fun lt!594786 () Unit!43916)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!376 ((_ BitVec 64) (_ BitVec 64) V!54833 ListLongMap!21843) Unit!43916)

(assert (=> b!1343475 (= lt!594786 (lemmaInListMapAfterAddingDiffThenInBefore!376 k0!1142 (select (arr!44147 _keys!1571) from!1960) lt!594787 lt!594785))))

(declare-fun lt!594789 () ListLongMap!21843)

(assert (=> b!1343475 (contains!9042 lt!594789 k0!1142)))

(declare-fun lt!594784 () Unit!43916)

(assert (=> b!1343475 (= lt!594784 (lemmaInListMapAfterAddingDiffThenInBefore!376 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594789))))

(assert (=> b!1343475 (= lt!594789 (+!4837 lt!594785 (tuple2!24187 (select (arr!44147 _keys!1571) from!1960) lt!594787)))))

(declare-fun get!22309 (ValueCell!17750 V!54833) V!54833)

(declare-fun dynLambda!3767 (Int (_ BitVec 64)) V!54833)

(assert (=> b!1343475 (= lt!594787 (get!22309 (select (arr!44148 _values!1303) from!1960) (dynLambda!3767 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6480 (array!91381 array!91383 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21843)

(assert (=> b!1343475 (= lt!594785 (getCurrentListMapNoExtraKeys!6480 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343476 () Bool)

(declare-fun res!891385 () Bool)

(assert (=> b!1343476 (=> (not res!891385) (not e!764671))))

(assert (=> b!1343476 (= res!891385 (and (= (size!44700 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44699 _keys!1571) (size!44700 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343477 () Bool)

(declare-fun res!891377 () Bool)

(assert (=> b!1343477 (=> (not res!891377) (not e!764671))))

(assert (=> b!1343477 (= res!891377 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343478 () Bool)

(declare-fun res!891380 () Bool)

(assert (=> b!1343478 (=> (not res!891380) (not e!764671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343478 (= res!891380 (validKeyInArray!0 (select (arr!44147 _keys!1571) from!1960)))))

(assert (= (and start!113246 res!891379) b!1343476))

(assert (= (and b!1343476 res!891385) b!1343469))

(assert (= (and b!1343469 res!891384) b!1343471))

(assert (= (and b!1343471 res!891383) b!1343468))

(assert (= (and b!1343468 res!891378) b!1343474))

(assert (= (and b!1343474 res!891381) b!1343473))

(assert (= (and b!1343473 res!891382) b!1343478))

(assert (= (and b!1343478 res!891380) b!1343477))

(assert (= (and b!1343477 res!891377) b!1343475))

(assert (= (and b!1343472 condMapEmpty!57652) mapIsEmpty!57652))

(assert (= (and b!1343472 (not condMapEmpty!57652)) mapNonEmpty!57652))

(get-info :version)

(assert (= (and mapNonEmpty!57652 ((_ is ValueCellFull!17750) mapValue!57652)) b!1343467))

(assert (= (and b!1343472 ((_ is ValueCellFull!17750) mapDefault!57652)) b!1343470))

(assert (= start!113246 b!1343472))

(declare-fun b_lambda!24463 () Bool)

(assert (=> (not b_lambda!24463) (not b!1343475)))

(declare-fun t!45826 () Bool)

(declare-fun tb!12303 () Bool)

(assert (=> (and start!113246 (= defaultEntry!1306 defaultEntry!1306) t!45826) tb!12303))

(declare-fun result!25705 () Bool)

(assert (=> tb!12303 (= result!25705 tp_is_empty!37297)))

(assert (=> b!1343475 t!45826))

(declare-fun b_and!50485 () Bool)

(assert (= b_and!50483 (and (=> t!45826 result!25705) b_and!50485)))

(declare-fun m!1230751 () Bool)

(assert (=> start!113246 m!1230751))

(declare-fun m!1230753 () Bool)

(assert (=> start!113246 m!1230753))

(declare-fun m!1230755 () Bool)

(assert (=> start!113246 m!1230755))

(declare-fun m!1230757 () Bool)

(assert (=> mapNonEmpty!57652 m!1230757))

(declare-fun m!1230759 () Bool)

(assert (=> b!1343471 m!1230759))

(declare-fun m!1230761 () Bool)

(assert (=> b!1343475 m!1230761))

(declare-fun m!1230763 () Bool)

(assert (=> b!1343475 m!1230763))

(declare-fun m!1230765 () Bool)

(assert (=> b!1343475 m!1230765))

(declare-fun m!1230767 () Bool)

(assert (=> b!1343475 m!1230767))

(declare-fun m!1230769 () Bool)

(assert (=> b!1343475 m!1230769))

(declare-fun m!1230771 () Bool)

(assert (=> b!1343475 m!1230771))

(assert (=> b!1343475 m!1230767))

(declare-fun m!1230773 () Bool)

(assert (=> b!1343475 m!1230773))

(declare-fun m!1230775 () Bool)

(assert (=> b!1343475 m!1230775))

(assert (=> b!1343475 m!1230769))

(assert (=> b!1343475 m!1230773))

(declare-fun m!1230777 () Bool)

(assert (=> b!1343475 m!1230777))

(declare-fun m!1230779 () Bool)

(assert (=> b!1343475 m!1230779))

(assert (=> b!1343475 m!1230761))

(declare-fun m!1230781 () Bool)

(assert (=> b!1343475 m!1230781))

(declare-fun m!1230783 () Bool)

(assert (=> b!1343475 m!1230783))

(declare-fun m!1230785 () Bool)

(assert (=> b!1343475 m!1230785))

(assert (=> b!1343478 m!1230761))

(assert (=> b!1343478 m!1230761))

(declare-fun m!1230787 () Bool)

(assert (=> b!1343478 m!1230787))

(declare-fun m!1230789 () Bool)

(assert (=> b!1343469 m!1230789))

(declare-fun m!1230791 () Bool)

(assert (=> b!1343474 m!1230791))

(assert (=> b!1343474 m!1230791))

(declare-fun m!1230793 () Bool)

(assert (=> b!1343474 m!1230793))

(assert (=> b!1343473 m!1230761))

(check-sat (not b!1343474) (not b_next!31297) (not start!113246) (not b!1343469) (not b!1343471) (not b_lambda!24463) b_and!50485 tp_is_empty!37297 (not mapNonEmpty!57652) (not b!1343475) (not b!1343478))
(check-sat b_and!50485 (not b_next!31297))
