; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112230 () Bool)

(assert start!112230)

(declare-fun b_free!30625 () Bool)

(declare-fun b_next!30625 () Bool)

(assert (=> start!112230 (= b_free!30625 (not b_next!30625))))

(declare-fun tp!107513 () Bool)

(declare-fun b_and!49287 () Bool)

(assert (=> start!112230 (= tp!107513 b_and!49287)))

(declare-fun res!882072 () Bool)

(declare-fun e!757855 () Bool)

(assert (=> start!112230 (=> (not res!882072) (not e!757855))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112230 (= res!882072 (validMask!0 mask!1998))))

(assert (=> start!112230 e!757855))

(declare-datatypes ((V!53817 0))(
  ( (V!53818 (val!18342 Int)) )
))
(declare-datatypes ((ValueCell!17369 0))(
  ( (ValueCellFull!17369 (v!20978 V!53817)) (EmptyCell!17369) )
))
(declare-datatypes ((array!89897 0))(
  ( (array!89898 (arr!43415 (Array (_ BitVec 32) ValueCell!17369)) (size!43967 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89897)

(declare-fun e!757856 () Bool)

(declare-fun array_inv!32927 (array!89897) Bool)

(assert (=> start!112230 (and (array_inv!32927 _values!1320) e!757856)))

(assert (=> start!112230 true))

(declare-datatypes ((array!89899 0))(
  ( (array!89900 (arr!43416 (Array (_ BitVec 32) (_ BitVec 64))) (size!43968 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89899)

(declare-fun array_inv!32928 (array!89899) Bool)

(assert (=> start!112230 (array_inv!32928 _keys!1590)))

(assert (=> start!112230 tp!107513))

(declare-fun tp_is_empty!36535 () Bool)

(assert (=> start!112230 tp_is_empty!36535))

(declare-fun mapNonEmpty!56476 () Bool)

(declare-fun mapRes!56476 () Bool)

(declare-fun tp!107512 () Bool)

(declare-fun e!757854 () Bool)

(assert (=> mapNonEmpty!56476 (= mapRes!56476 (and tp!107512 e!757854))))

(declare-fun mapKey!56476 () (_ BitVec 32))

(declare-fun mapRest!56476 () (Array (_ BitVec 32) ValueCell!17369))

(declare-fun mapValue!56476 () ValueCell!17369)

(assert (=> mapNonEmpty!56476 (= (arr!43415 _values!1320) (store mapRest!56476 mapKey!56476 mapValue!56476))))

(declare-fun mapIsEmpty!56476 () Bool)

(assert (=> mapIsEmpty!56476 mapRes!56476))

(declare-fun b!1329367 () Bool)

(declare-fun res!882071 () Bool)

(assert (=> b!1329367 (=> (not res!882071) (not e!757855))))

(declare-datatypes ((List!30825 0))(
  ( (Nil!30822) (Cons!30821 (h!32030 (_ BitVec 64)) (t!44855 List!30825)) )
))
(declare-fun arrayNoDuplicates!0 (array!89899 (_ BitVec 32) List!30825) Bool)

(assert (=> b!1329367 (= res!882071 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30822))))

(declare-fun b!1329368 () Bool)

(declare-fun res!882073 () Bool)

(assert (=> b!1329368 (=> (not res!882073) (not e!757855))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329368 (= res!882073 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329369 () Bool)

(declare-fun e!757858 () Bool)

(assert (=> b!1329369 (= e!757858 tp_is_empty!36535)))

(declare-fun b!1329370 () Bool)

(declare-fun res!882065 () Bool)

(assert (=> b!1329370 (=> (not res!882065) (not e!757855))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329370 (= res!882065 (not (= (select (arr!43416 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329371 () Bool)

(declare-fun res!882069 () Bool)

(assert (=> b!1329371 (=> (not res!882069) (not e!757855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329371 (= res!882069 (validKeyInArray!0 (select (arr!43416 _keys!1590) from!1980)))))

(declare-fun b!1329372 () Bool)

(declare-fun res!882067 () Bool)

(assert (=> b!1329372 (=> (not res!882067) (not e!757855))))

(assert (=> b!1329372 (= res!882067 (and (= (size!43967 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43968 _keys!1590) (size!43967 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329373 () Bool)

(declare-fun res!882066 () Bool)

(assert (=> b!1329373 (=> (not res!882066) (not e!757855))))

(assert (=> b!1329373 (= res!882066 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43968 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329374 () Bool)

(assert (=> b!1329374 (= e!757854 tp_is_empty!36535)))

(declare-fun b!1329375 () Bool)

(declare-fun res!882068 () Bool)

(assert (=> b!1329375 (=> (not res!882068) (not e!757855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89899 (_ BitVec 32)) Bool)

(assert (=> b!1329375 (= res!882068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329376 () Bool)

(assert (=> b!1329376 (= e!757855 (not true))))

(declare-datatypes ((tuple2!23676 0))(
  ( (tuple2!23677 (_1!11849 (_ BitVec 64)) (_2!11849 V!53817)) )
))
(declare-datatypes ((List!30826 0))(
  ( (Nil!30823) (Cons!30822 (h!32031 tuple2!23676) (t!44856 List!30826)) )
))
(declare-datatypes ((ListLongMap!21333 0))(
  ( (ListLongMap!21334 (toList!10682 List!30826)) )
))
(declare-fun lt!590770 () ListLongMap!21333)

(declare-fun contains!8774 (ListLongMap!21333 (_ BitVec 64)) Bool)

(assert (=> b!1329376 (contains!8774 lt!590770 k0!1153)))

(declare-fun minValue!1262 () V!53817)

(declare-datatypes ((Unit!43548 0))(
  ( (Unit!43549) )
))
(declare-fun lt!590769 () Unit!43548)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!224 ((_ BitVec 64) (_ BitVec 64) V!53817 ListLongMap!21333) Unit!43548)

(assert (=> b!1329376 (= lt!590769 (lemmaInListMapAfterAddingDiffThenInBefore!224 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590770))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53817)

(declare-fun +!4668 (ListLongMap!21333 tuple2!23676) ListLongMap!21333)

(declare-fun getCurrentListMapNoExtraKeys!6306 (array!89899 array!89897 (_ BitVec 32) (_ BitVec 32) V!53817 V!53817 (_ BitVec 32) Int) ListLongMap!21333)

(declare-fun get!21873 (ValueCell!17369 V!53817) V!53817)

(declare-fun dynLambda!3598 (Int (_ BitVec 64)) V!53817)

(assert (=> b!1329376 (= lt!590770 (+!4668 (getCurrentListMapNoExtraKeys!6306 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23677 (select (arr!43416 _keys!1590) from!1980) (get!21873 (select (arr!43415 _values!1320) from!1980) (dynLambda!3598 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329377 () Bool)

(assert (=> b!1329377 (= e!757856 (and e!757858 mapRes!56476))))

(declare-fun condMapEmpty!56476 () Bool)

(declare-fun mapDefault!56476 () ValueCell!17369)

(assert (=> b!1329377 (= condMapEmpty!56476 (= (arr!43415 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17369)) mapDefault!56476)))))

(declare-fun b!1329378 () Bool)

(declare-fun res!882070 () Bool)

(assert (=> b!1329378 (=> (not res!882070) (not e!757855))))

(declare-fun getCurrentListMap!5552 (array!89899 array!89897 (_ BitVec 32) (_ BitVec 32) V!53817 V!53817 (_ BitVec 32) Int) ListLongMap!21333)

(assert (=> b!1329378 (= res!882070 (contains!8774 (getCurrentListMap!5552 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112230 res!882072) b!1329372))

(assert (= (and b!1329372 res!882067) b!1329375))

(assert (= (and b!1329375 res!882068) b!1329367))

(assert (= (and b!1329367 res!882071) b!1329373))

(assert (= (and b!1329373 res!882066) b!1329378))

(assert (= (and b!1329378 res!882070) b!1329370))

(assert (= (and b!1329370 res!882065) b!1329371))

(assert (= (and b!1329371 res!882069) b!1329368))

(assert (= (and b!1329368 res!882073) b!1329376))

(assert (= (and b!1329377 condMapEmpty!56476) mapIsEmpty!56476))

(assert (= (and b!1329377 (not condMapEmpty!56476)) mapNonEmpty!56476))

(get-info :version)

(assert (= (and mapNonEmpty!56476 ((_ is ValueCellFull!17369) mapValue!56476)) b!1329374))

(assert (= (and b!1329377 ((_ is ValueCellFull!17369) mapDefault!56476)) b!1329369))

(assert (= start!112230 b!1329377))

(declare-fun b_lambda!23875 () Bool)

(assert (=> (not b_lambda!23875) (not b!1329376)))

(declare-fun t!44854 () Bool)

(declare-fun tb!11833 () Bool)

(assert (=> (and start!112230 (= defaultEntry!1323 defaultEntry!1323) t!44854) tb!11833))

(declare-fun result!24745 () Bool)

(assert (=> tb!11833 (= result!24745 tp_is_empty!36535)))

(assert (=> b!1329376 t!44854))

(declare-fun b_and!49289 () Bool)

(assert (= b_and!49287 (and (=> t!44854 result!24745) b_and!49289)))

(declare-fun m!1217679 () Bool)

(assert (=> b!1329376 m!1217679))

(declare-fun m!1217681 () Bool)

(assert (=> b!1329376 m!1217681))

(declare-fun m!1217683 () Bool)

(assert (=> b!1329376 m!1217683))

(declare-fun m!1217685 () Bool)

(assert (=> b!1329376 m!1217685))

(assert (=> b!1329376 m!1217679))

(declare-fun m!1217687 () Bool)

(assert (=> b!1329376 m!1217687))

(declare-fun m!1217689 () Bool)

(assert (=> b!1329376 m!1217689))

(declare-fun m!1217691 () Bool)

(assert (=> b!1329376 m!1217691))

(assert (=> b!1329376 m!1217681))

(assert (=> b!1329376 m!1217685))

(declare-fun m!1217693 () Bool)

(assert (=> b!1329376 m!1217693))

(assert (=> b!1329370 m!1217693))

(declare-fun m!1217695 () Bool)

(assert (=> b!1329375 m!1217695))

(declare-fun m!1217697 () Bool)

(assert (=> b!1329378 m!1217697))

(assert (=> b!1329378 m!1217697))

(declare-fun m!1217699 () Bool)

(assert (=> b!1329378 m!1217699))

(assert (=> b!1329371 m!1217693))

(assert (=> b!1329371 m!1217693))

(declare-fun m!1217701 () Bool)

(assert (=> b!1329371 m!1217701))

(declare-fun m!1217703 () Bool)

(assert (=> b!1329367 m!1217703))

(declare-fun m!1217705 () Bool)

(assert (=> start!112230 m!1217705))

(declare-fun m!1217707 () Bool)

(assert (=> start!112230 m!1217707))

(declare-fun m!1217709 () Bool)

(assert (=> start!112230 m!1217709))

(declare-fun m!1217711 () Bool)

(assert (=> mapNonEmpty!56476 m!1217711))

(check-sat (not b!1329367) (not start!112230) (not b!1329378) (not b!1329375) (not b_lambda!23875) (not b!1329371) tp_is_empty!36535 (not b!1329376) (not b_next!30625) b_and!49289 (not mapNonEmpty!56476))
(check-sat b_and!49289 (not b_next!30625))
