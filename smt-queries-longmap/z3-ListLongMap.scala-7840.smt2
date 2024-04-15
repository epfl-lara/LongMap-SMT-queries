; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97778 () Bool)

(assert start!97778)

(declare-fun b_free!23485 () Bool)

(declare-fun b_next!23485 () Bool)

(assert (=> start!97778 (= b_free!23485 (not b_next!23485))))

(declare-fun tp!83158 () Bool)

(declare-fun b_and!37737 () Bool)

(assert (=> start!97778 (= tp!83158 b_and!37737)))

(declare-fun b!1118471 () Bool)

(declare-fun res!747049 () Bool)

(declare-fun e!637051 () Bool)

(assert (=> b!1118471 (=> (not res!747049) (not e!637051))))

(declare-datatypes ((array!72824 0))(
  ( (array!72825 (arr!35065 (Array (_ BitVec 32) (_ BitVec 64))) (size!35603 (_ BitVec 32))) )
))
(declare-fun lt!497329 () array!72824)

(declare-datatypes ((List!24467 0))(
  ( (Nil!24464) (Cons!24463 (h!25672 (_ BitVec 64)) (t!34939 List!24467)) )
))
(declare-fun arrayNoDuplicates!0 (array!72824 (_ BitVec 32) List!24467) Bool)

(assert (=> b!1118471 (= res!747049 (arrayNoDuplicates!0 lt!497329 #b00000000000000000000000000000000 Nil!24464))))

(declare-fun b!1118472 () Bool)

(declare-fun e!637052 () Bool)

(assert (=> b!1118472 (= e!637052 e!637051)))

(declare-fun res!747052 () Bool)

(assert (=> b!1118472 (=> (not res!747052) (not e!637051))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72824 (_ BitVec 32)) Bool)

(assert (=> b!1118472 (= res!747052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497329 mask!1564))))

(declare-fun _keys!1208 () array!72824)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118472 (= lt!497329 (array!72825 (store (arr!35065 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35603 _keys!1208)))))

(declare-fun res!747054 () Bool)

(assert (=> start!97778 (=> (not res!747054) (not e!637052))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97778 (= res!747054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35603 _keys!1208))))))

(assert (=> start!97778 e!637052))

(declare-fun tp_is_empty!28015 () Bool)

(assert (=> start!97778 tp_is_empty!28015))

(declare-fun array_inv!27008 (array!72824) Bool)

(assert (=> start!97778 (array_inv!27008 _keys!1208)))

(assert (=> start!97778 true))

(assert (=> start!97778 tp!83158))

(declare-datatypes ((V!42481 0))(
  ( (V!42482 (val!14064 Int)) )
))
(declare-datatypes ((ValueCell!13298 0))(
  ( (ValueCellFull!13298 (v!16696 V!42481)) (EmptyCell!13298) )
))
(declare-datatypes ((array!72826 0))(
  ( (array!72827 (arr!35066 (Array (_ BitVec 32) ValueCell!13298)) (size!35604 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72826)

(declare-fun e!637047 () Bool)

(declare-fun array_inv!27009 (array!72826) Bool)

(assert (=> start!97778 (and (array_inv!27009 _values!996) e!637047)))

(declare-fun b!1118473 () Bool)

(declare-fun res!747051 () Bool)

(assert (=> b!1118473 (=> (not res!747051) (not e!637052))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118473 (= res!747051 (and (= (size!35604 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35603 _keys!1208) (size!35604 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43840 () Bool)

(declare-fun mapRes!43840 () Bool)

(declare-fun tp!83159 () Bool)

(declare-fun e!637053 () Bool)

(assert (=> mapNonEmpty!43840 (= mapRes!43840 (and tp!83159 e!637053))))

(declare-fun mapRest!43840 () (Array (_ BitVec 32) ValueCell!13298))

(declare-fun mapValue!43840 () ValueCell!13298)

(declare-fun mapKey!43840 () (_ BitVec 32))

(assert (=> mapNonEmpty!43840 (= (arr!35066 _values!996) (store mapRest!43840 mapKey!43840 mapValue!43840))))

(declare-fun b!1118474 () Bool)

(declare-fun res!747053 () Bool)

(assert (=> b!1118474 (=> (not res!747053) (not e!637052))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118474 (= res!747053 (= (select (arr!35065 _keys!1208) i!673) k0!934))))

(declare-fun b!1118475 () Bool)

(declare-fun res!747055 () Bool)

(assert (=> b!1118475 (=> (not res!747055) (not e!637052))))

(assert (=> b!1118475 (= res!747055 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35603 _keys!1208))))))

(declare-fun b!1118476 () Bool)

(declare-fun e!637048 () Bool)

(assert (=> b!1118476 (= e!637048 tp_is_empty!28015)))

(declare-fun b!1118477 () Bool)

(declare-fun e!637049 () Bool)

(assert (=> b!1118477 (= e!637051 (not e!637049))))

(declare-fun res!747056 () Bool)

(assert (=> b!1118477 (=> res!747056 e!637049)))

(assert (=> b!1118477 (= res!747056 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118477 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36533 0))(
  ( (Unit!36534) )
))
(declare-fun lt!497331 () Unit!36533)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72824 (_ BitVec 64) (_ BitVec 32)) Unit!36533)

(assert (=> b!1118477 (= lt!497331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118478 () Bool)

(declare-fun res!747058 () Bool)

(assert (=> b!1118478 (=> (not res!747058) (not e!637052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118478 (= res!747058 (validMask!0 mask!1564))))

(declare-fun b!1118479 () Bool)

(assert (=> b!1118479 (= e!637049 true)))

(declare-fun zeroValue!944 () V!42481)

(declare-datatypes ((tuple2!17702 0))(
  ( (tuple2!17703 (_1!8862 (_ BitVec 64)) (_2!8862 V!42481)) )
))
(declare-datatypes ((List!24468 0))(
  ( (Nil!24465) (Cons!24464 (h!25673 tuple2!17702) (t!34940 List!24468)) )
))
(declare-datatypes ((ListLongMap!15671 0))(
  ( (ListLongMap!15672 (toList!7851 List!24468)) )
))
(declare-fun lt!497330 () ListLongMap!15671)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42481)

(declare-fun getCurrentListMapNoExtraKeys!4360 (array!72824 array!72826 (_ BitVec 32) (_ BitVec 32) V!42481 V!42481 (_ BitVec 32) Int) ListLongMap!15671)

(assert (=> b!1118479 (= lt!497330 (getCurrentListMapNoExtraKeys!4360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118480 () Bool)

(declare-fun res!747050 () Bool)

(assert (=> b!1118480 (=> (not res!747050) (not e!637052))))

(assert (=> b!1118480 (= res!747050 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24464))))

(declare-fun b!1118481 () Bool)

(assert (=> b!1118481 (= e!637053 tp_is_empty!28015)))

(declare-fun b!1118482 () Bool)

(declare-fun res!747057 () Bool)

(assert (=> b!1118482 (=> (not res!747057) (not e!637052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118482 (= res!747057 (validKeyInArray!0 k0!934))))

(declare-fun b!1118483 () Bool)

(assert (=> b!1118483 (= e!637047 (and e!637048 mapRes!43840))))

(declare-fun condMapEmpty!43840 () Bool)

(declare-fun mapDefault!43840 () ValueCell!13298)

(assert (=> b!1118483 (= condMapEmpty!43840 (= (arr!35066 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13298)) mapDefault!43840)))))

(declare-fun b!1118484 () Bool)

(declare-fun res!747048 () Bool)

(assert (=> b!1118484 (=> (not res!747048) (not e!637052))))

(assert (=> b!1118484 (= res!747048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43840 () Bool)

(assert (=> mapIsEmpty!43840 mapRes!43840))

(assert (= (and start!97778 res!747054) b!1118478))

(assert (= (and b!1118478 res!747058) b!1118473))

(assert (= (and b!1118473 res!747051) b!1118484))

(assert (= (and b!1118484 res!747048) b!1118480))

(assert (= (and b!1118480 res!747050) b!1118475))

(assert (= (and b!1118475 res!747055) b!1118482))

(assert (= (and b!1118482 res!747057) b!1118474))

(assert (= (and b!1118474 res!747053) b!1118472))

(assert (= (and b!1118472 res!747052) b!1118471))

(assert (= (and b!1118471 res!747049) b!1118477))

(assert (= (and b!1118477 (not res!747056)) b!1118479))

(assert (= (and b!1118483 condMapEmpty!43840) mapIsEmpty!43840))

(assert (= (and b!1118483 (not condMapEmpty!43840)) mapNonEmpty!43840))

(get-info :version)

(assert (= (and mapNonEmpty!43840 ((_ is ValueCellFull!13298) mapValue!43840)) b!1118481))

(assert (= (and b!1118483 ((_ is ValueCellFull!13298) mapDefault!43840)) b!1118476))

(assert (= start!97778 b!1118483))

(declare-fun m!1033461 () Bool)

(assert (=> b!1118474 m!1033461))

(declare-fun m!1033463 () Bool)

(assert (=> start!97778 m!1033463))

(declare-fun m!1033465 () Bool)

(assert (=> start!97778 m!1033465))

(declare-fun m!1033467 () Bool)

(assert (=> b!1118484 m!1033467))

(declare-fun m!1033469 () Bool)

(assert (=> b!1118472 m!1033469))

(declare-fun m!1033471 () Bool)

(assert (=> b!1118472 m!1033471))

(declare-fun m!1033473 () Bool)

(assert (=> b!1118480 m!1033473))

(declare-fun m!1033475 () Bool)

(assert (=> mapNonEmpty!43840 m!1033475))

(declare-fun m!1033477 () Bool)

(assert (=> b!1118482 m!1033477))

(declare-fun m!1033479 () Bool)

(assert (=> b!1118471 m!1033479))

(declare-fun m!1033481 () Bool)

(assert (=> b!1118477 m!1033481))

(declare-fun m!1033483 () Bool)

(assert (=> b!1118477 m!1033483))

(declare-fun m!1033485 () Bool)

(assert (=> b!1118479 m!1033485))

(declare-fun m!1033487 () Bool)

(assert (=> b!1118478 m!1033487))

(check-sat (not start!97778) (not b!1118477) (not mapNonEmpty!43840) (not b!1118471) (not b!1118478) tp_is_empty!28015 (not b!1118472) (not b!1118482) b_and!37737 (not b!1118480) (not b_next!23485) (not b!1118484) (not b!1118479))
(check-sat b_and!37737 (not b_next!23485))
