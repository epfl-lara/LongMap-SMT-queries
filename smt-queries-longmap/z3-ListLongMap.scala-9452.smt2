; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112544 () Bool)

(assert start!112544)

(declare-fun b_free!30715 () Bool)

(declare-fun b_next!30715 () Bool)

(assert (=> start!112544 (= b_free!30715 (not b_next!30715))))

(declare-fun tp!107782 () Bool)

(declare-fun b_and!49487 () Bool)

(assert (=> start!112544 (= tp!107782 b_and!49487)))

(declare-fun b!1332446 () Bool)

(declare-fun res!883831 () Bool)

(declare-fun e!759406 () Bool)

(assert (=> b!1332446 (=> (not res!883831) (not e!759406))))

(declare-datatypes ((array!90239 0))(
  ( (array!90240 (arr!43581 (Array (_ BitVec 32) (_ BitVec 64))) (size!44132 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90239)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90239 (_ BitVec 32)) Bool)

(assert (=> b!1332446 (= res!883831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56611 () Bool)

(declare-fun mapRes!56611 () Bool)

(declare-fun tp!107781 () Bool)

(declare-fun e!759407 () Bool)

(assert (=> mapNonEmpty!56611 (= mapRes!56611 (and tp!107781 e!759407))))

(declare-datatypes ((V!53937 0))(
  ( (V!53938 (val!18387 Int)) )
))
(declare-datatypes ((ValueCell!17414 0))(
  ( (ValueCellFull!17414 (v!21019 V!53937)) (EmptyCell!17414) )
))
(declare-datatypes ((array!90241 0))(
  ( (array!90242 (arr!43582 (Array (_ BitVec 32) ValueCell!17414)) (size!44133 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90241)

(declare-fun mapKey!56611 () (_ BitVec 32))

(declare-fun mapValue!56611 () ValueCell!17414)

(declare-fun mapRest!56611 () (Array (_ BitVec 32) ValueCell!17414))

(assert (=> mapNonEmpty!56611 (= (arr!43582 _values!1320) (store mapRest!56611 mapKey!56611 mapValue!56611))))

(declare-fun b!1332447 () Bool)

(declare-fun tp_is_empty!36625 () Bool)

(assert (=> b!1332447 (= e!759407 tp_is_empty!36625)))

(declare-fun b!1332448 () Bool)

(assert (=> b!1332448 (= e!759406 (not true))))

(declare-datatypes ((tuple2!23714 0))(
  ( (tuple2!23715 (_1!11868 (_ BitVec 64)) (_2!11868 V!53937)) )
))
(declare-datatypes ((List!30880 0))(
  ( (Nil!30877) (Cons!30876 (h!32094 tuple2!23714) (t!45000 List!30880)) )
))
(declare-datatypes ((ListLongMap!21379 0))(
  ( (ListLongMap!21380 (toList!10705 List!30880)) )
))
(declare-fun lt!591900 () ListLongMap!21379)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8881 (ListLongMap!21379 (_ BitVec 64)) Bool)

(assert (=> b!1332448 (contains!8881 lt!591900 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591897 () V!53937)

(declare-datatypes ((Unit!43748 0))(
  ( (Unit!43749) )
))
(declare-fun lt!591899 () Unit!43748)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!262 ((_ BitVec 64) (_ BitVec 64) V!53937 ListLongMap!21379) Unit!43748)

(assert (=> b!1332448 (= lt!591899 (lemmaInListMapAfterAddingDiffThenInBefore!262 k0!1153 (select (arr!43581 _keys!1590) from!1980) lt!591897 lt!591900))))

(declare-fun lt!591898 () ListLongMap!21379)

(assert (=> b!1332448 (contains!8881 lt!591898 k0!1153)))

(declare-fun lt!591896 () Unit!43748)

(declare-fun minValue!1262 () V!53937)

(assert (=> b!1332448 (= lt!591896 (lemmaInListMapAfterAddingDiffThenInBefore!262 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591898))))

(declare-fun +!4719 (ListLongMap!21379 tuple2!23714) ListLongMap!21379)

(assert (=> b!1332448 (= lt!591898 (+!4719 lt!591900 (tuple2!23715 (select (arr!43581 _keys!1590) from!1980) lt!591897)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21990 (ValueCell!17414 V!53937) V!53937)

(declare-fun dynLambda!3673 (Int (_ BitVec 64)) V!53937)

(assert (=> b!1332448 (= lt!591897 (get!21990 (select (arr!43582 _values!1320) from!1980) (dynLambda!3673 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53937)

(declare-fun getCurrentListMapNoExtraKeys!6363 (array!90239 array!90241 (_ BitVec 32) (_ BitVec 32) V!53937 V!53937 (_ BitVec 32) Int) ListLongMap!21379)

(assert (=> b!1332448 (= lt!591900 (getCurrentListMapNoExtraKeys!6363 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!883834 () Bool)

(assert (=> start!112544 (=> (not res!883834) (not e!759406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112544 (= res!883834 (validMask!0 mask!1998))))

(assert (=> start!112544 e!759406))

(declare-fun e!759405 () Bool)

(declare-fun array_inv!33153 (array!90241) Bool)

(assert (=> start!112544 (and (array_inv!33153 _values!1320) e!759405)))

(assert (=> start!112544 true))

(declare-fun array_inv!33154 (array!90239) Bool)

(assert (=> start!112544 (array_inv!33154 _keys!1590)))

(assert (=> start!112544 tp!107782))

(assert (=> start!112544 tp_is_empty!36625))

(declare-fun b!1332449 () Bool)

(declare-fun res!883828 () Bool)

(assert (=> b!1332449 (=> (not res!883828) (not e!759406))))

(declare-datatypes ((List!30881 0))(
  ( (Nil!30878) (Cons!30877 (h!32095 (_ BitVec 64)) (t!45001 List!30881)) )
))
(declare-fun arrayNoDuplicates!0 (array!90239 (_ BitVec 32) List!30881) Bool)

(assert (=> b!1332449 (= res!883828 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30878))))

(declare-fun b!1332450 () Bool)

(declare-fun res!883827 () Bool)

(assert (=> b!1332450 (=> (not res!883827) (not e!759406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332450 (= res!883827 (validKeyInArray!0 (select (arr!43581 _keys!1590) from!1980)))))

(declare-fun b!1332451 () Bool)

(declare-fun res!883830 () Bool)

(assert (=> b!1332451 (=> (not res!883830) (not e!759406))))

(declare-fun getCurrentListMap!5675 (array!90239 array!90241 (_ BitVec 32) (_ BitVec 32) V!53937 V!53937 (_ BitVec 32) Int) ListLongMap!21379)

(assert (=> b!1332451 (= res!883830 (contains!8881 (getCurrentListMap!5675 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332452 () Bool)

(declare-fun res!883832 () Bool)

(assert (=> b!1332452 (=> (not res!883832) (not e!759406))))

(assert (=> b!1332452 (= res!883832 (and (= (size!44133 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44132 _keys!1590) (size!44133 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332453 () Bool)

(declare-fun e!759408 () Bool)

(assert (=> b!1332453 (= e!759408 tp_is_empty!36625)))

(declare-fun b!1332454 () Bool)

(declare-fun res!883829 () Bool)

(assert (=> b!1332454 (=> (not res!883829) (not e!759406))))

(assert (=> b!1332454 (= res!883829 (not (= (select (arr!43581 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56611 () Bool)

(assert (=> mapIsEmpty!56611 mapRes!56611))

(declare-fun b!1332455 () Bool)

(declare-fun res!883833 () Bool)

(assert (=> b!1332455 (=> (not res!883833) (not e!759406))))

(assert (=> b!1332455 (= res!883833 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44132 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332456 () Bool)

(assert (=> b!1332456 (= e!759405 (and e!759408 mapRes!56611))))

(declare-fun condMapEmpty!56611 () Bool)

(declare-fun mapDefault!56611 () ValueCell!17414)

(assert (=> b!1332456 (= condMapEmpty!56611 (= (arr!43582 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17414)) mapDefault!56611)))))

(declare-fun b!1332457 () Bool)

(declare-fun res!883835 () Bool)

(assert (=> b!1332457 (=> (not res!883835) (not e!759406))))

(assert (=> b!1332457 (= res!883835 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112544 res!883834) b!1332452))

(assert (= (and b!1332452 res!883832) b!1332446))

(assert (= (and b!1332446 res!883831) b!1332449))

(assert (= (and b!1332449 res!883828) b!1332455))

(assert (= (and b!1332455 res!883833) b!1332451))

(assert (= (and b!1332451 res!883830) b!1332454))

(assert (= (and b!1332454 res!883829) b!1332450))

(assert (= (and b!1332450 res!883827) b!1332457))

(assert (= (and b!1332457 res!883835) b!1332448))

(assert (= (and b!1332456 condMapEmpty!56611) mapIsEmpty!56611))

(assert (= (and b!1332456 (not condMapEmpty!56611)) mapNonEmpty!56611))

(get-info :version)

(assert (= (and mapNonEmpty!56611 ((_ is ValueCellFull!17414) mapValue!56611)) b!1332447))

(assert (= (and b!1332456 ((_ is ValueCellFull!17414) mapDefault!56611)) b!1332453))

(assert (= start!112544 b!1332456))

(declare-fun b_lambda!23969 () Bool)

(assert (=> (not b_lambda!23969) (not b!1332448)))

(declare-fun t!44999 () Bool)

(declare-fun tb!11923 () Bool)

(assert (=> (and start!112544 (= defaultEntry!1323 defaultEntry!1323) t!44999) tb!11923))

(declare-fun result!24925 () Bool)

(assert (=> tb!11923 (= result!24925 tp_is_empty!36625)))

(assert (=> b!1332448 t!44999))

(declare-fun b_and!49489 () Bool)

(assert (= b_and!49487 (and (=> t!44999 result!24925) b_and!49489)))

(declare-fun m!1221407 () Bool)

(assert (=> b!1332448 m!1221407))

(declare-fun m!1221409 () Bool)

(assert (=> b!1332448 m!1221409))

(declare-fun m!1221411 () Bool)

(assert (=> b!1332448 m!1221411))

(declare-fun m!1221413 () Bool)

(assert (=> b!1332448 m!1221413))

(declare-fun m!1221415 () Bool)

(assert (=> b!1332448 m!1221415))

(assert (=> b!1332448 m!1221413))

(declare-fun m!1221417 () Bool)

(assert (=> b!1332448 m!1221417))

(declare-fun m!1221419 () Bool)

(assert (=> b!1332448 m!1221419))

(declare-fun m!1221421 () Bool)

(assert (=> b!1332448 m!1221421))

(declare-fun m!1221423 () Bool)

(assert (=> b!1332448 m!1221423))

(assert (=> b!1332448 m!1221415))

(declare-fun m!1221425 () Bool)

(assert (=> b!1332448 m!1221425))

(assert (=> b!1332448 m!1221409))

(assert (=> b!1332450 m!1221409))

(assert (=> b!1332450 m!1221409))

(declare-fun m!1221427 () Bool)

(assert (=> b!1332450 m!1221427))

(declare-fun m!1221429 () Bool)

(assert (=> b!1332451 m!1221429))

(assert (=> b!1332451 m!1221429))

(declare-fun m!1221431 () Bool)

(assert (=> b!1332451 m!1221431))

(declare-fun m!1221433 () Bool)

(assert (=> b!1332446 m!1221433))

(assert (=> b!1332454 m!1221409))

(declare-fun m!1221435 () Bool)

(assert (=> start!112544 m!1221435))

(declare-fun m!1221437 () Bool)

(assert (=> start!112544 m!1221437))

(declare-fun m!1221439 () Bool)

(assert (=> start!112544 m!1221439))

(declare-fun m!1221441 () Bool)

(assert (=> b!1332449 m!1221441))

(declare-fun m!1221443 () Bool)

(assert (=> mapNonEmpty!56611 m!1221443))

(check-sat (not b_lambda!23969) (not b!1332448) (not b!1332451) tp_is_empty!36625 (not b!1332450) b_and!49489 (not start!112544) (not mapNonEmpty!56611) (not b!1332449) (not b!1332446) (not b_next!30715))
(check-sat b_and!49489 (not b_next!30715))
